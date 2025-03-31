import requests
from bs4 import BeautifulSoup
import zipfile
import os

# 1. Acesso ao site
link = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
# *Adicionando o cabeçalho para o navegador não barrar algumas requisições devido ao Python ser responsável por fazê-las, aplicando assim o conceito de Open/Close do SOLID
headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0"}
requisicao = requests.get(link, headers=headers) 
#print(requisicao.text)
soup = BeautifulSoup(requisicao.content, "html.parser")
#print(soup.prettify())

# 2. Download dos Anexos I e II
pdf_links = []
for link in soup.find_all('a', href=True):
    if 'anexo' in link.text.lower() and link['href'].endswith('.pdf'):
        pdf_links.append(link['href'])

# Baixar os PDFs
for pdf_link in pdf_links:
    pdf_response = requests.get(pdf_link)
    filename = pdf_link.split('/')[-1]
    with open(filename, 'wb') as f:
        f.write(pdf_response.content)

# 3. Compactação dos arquivos
with zipfile.ZipFile('anexos.zip', 'w') as zipf:
    for pdf_link in pdf_links:
        filename = pdf_link.split('/')[-1]
        zipf.write(filename)

print("Download e compactação concluídos!")