Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562276;
	b=iYSX/DYRXRqwCeCmv/iXbQftY4wF2Zdv+HqSzeP4/YJM4zFjWk1EL13uBxHZFcL8jPho
	 z4S44wOjO+QyzqdwdrcSxoU0x0grMrS+39Jf08P4gWXxfWfqFgEuWOjguN2pZzexLPz7v
	 RzcPZDqFp0DbLnHrtaVKGeGx7JuR5kvRExhfx2v3++obtK7e89Udm75akkiaXXITjkMJ8
	 k7oHrPKUo5GYPbrcVAV/YettHVsnfewDj46UOgZKPugIhA/jFdwHanKXn0fd6UCp5xFVh
	 f9gDJQIKMQlGF/vuL7vvVQlAyn2pV32PasOvoxxFLg25ZVBpSXXXSu03p9TiUTwqqqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YC1Cb/ADksb4m1/LCRmx5fpgwf+X8b+5adRS/+NdlJg=;
	b=Mm0hfyxDjH93aZvi+emBPynYANDiygDzuC9owdZkwp8/oKB9MzQWe6Coe9bXG0TuWMGN
	 IzOtPSvYRjZtNzfexix0QonoSAdbcyJeB29y0zhPCuzgfl8v5R9QSXjpKt6wHE7uzVXwI
	 8ji3q+Jo0R60q95QmZsxmyWX5HGIOhUK8IsfxPT0OLY+O69Maq8WHqDx3bu3CRHqDYhXZ
	 msyjQt6Ec9AUa6Ocle+yZBzVwUEFLSvL2AhopQtpwEl260hF33/rbpBqsuqM+qgnxnYCw
	 ArzfouRoUVGctuk2SgNnVvWGv/gEGxVZfpvWhJoD2WhsUpvOWXgnx5yMWj7bfsnD5ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B/Xcus3q";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB083606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB083606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B/Xcus3q
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1123964f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562274; x=1794167074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YC1Cb/ADksb4m1/LCRmx5fpgwf+X8b+5adRS/+NdlJg=;
        b=B/Xcus3qwIyoBtqayDGFBQkiWCD09VUs8kZtwh8GdH2+HYDeh/3LtdmfVPbPZjasFr
         ddU38IR/JqSWh893rjuLeL4ZXlHrQZ9PO9VYXdU43iyW4tG3qauYc0NhgyDoILKa0ZVD
         fjuvQVx0h1RFnF2MdiZFFzgLlBu4f62XGoCJFxF4Br0t+fWadzC9D4q55LgwzAjs01+/
         TSwIBK8EwwS6N5zvOGItwvzSnVKKosgw+Of6t5/4TdO0VbCQSr4EjCAwQovuPbinVXJv
         vnYtrBRq23ZHzKOonRxoFA1TYtLtrX3ImvsUuS1H0892N8giSKAJkxghBvqp6MQ+7Djr
         /9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562274; x=1794167074;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YC1Cb/ADksb4m1/LCRmx5fpgwf+X8b+5adRS/+NdlJg=;
        b=ZDTfbPKk8B+7jeeTNmL+nRHO6o/5iBTYyxYZpDngAYDjmFFK7hjw8HZBWe1pD9/1WJ
         lTortc2c45gR39GSJeLqI/tujjFqjl1EwB8P9+3167NJcBjYLdj66HdZ9b4gpfGEwDgU
         lGIm3JDKN5Pn5oMilp+xLeQce1el8aQg4mK5o9eqq71aKvEksA6IgFuTLAQlGbbV7+Jt
         M4IWW07DT0NhOzNci+Y+BItwLNFo6BQNz4BYfoPCZfEjmiBOawwZf6otQi4nhfB5vENx
         umFWt4nO7J5cIDiIpYsDe5ZxfBJwDgusu4iCBljnx/8sattpDe+2CizG16LYLR03/iHV
         hSdg==
X-Forwarded-Encrypted: i=1; AKwUvBy8t2RoprzbjWU4nwn3R+u+q25kvkxKS9qlbQt69ELzi3/ZdGOV2MG2fm2TQVysbU6cdTp5q4PXT8pfupA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GC9CuNF+sBR5OBpL1WJE6xBrblT02Bz4y1I1qZStjwHULyBm/
	zE+OB1Bba5maNNN72ooG+QjBeOUUD+LxKX4jQ2GqaMVCKaywIt4161z4f+dKGY8T
X-Gm-Gg: AYBFou19k1LFS7XRiUYvuQSoPTd/8TJuu5lp4pPZje3QyoRpGrTqgS8mM+p/sRepkCW
	yQzB4rRtKXDveOzp4eoeqs2AmCJd7ZjU2Ucew0PY9PMIAr4I8QHo03ya8Fz5q8/6VMwoSoIvig3
	JJKkykqLSGSBvHUmhlxPXvWSDskE8n7p8+9rgGSGKjcS+ySlgvqFrQw0OBlTfUpvn7r0/nNGkRM
	74qxXLQlDVwKOguga2QuydGHN+r3p72Pezr+vNlRue5RkYZSGTQ7mhRO+WZD559ZMzyWE202H/5
	l4DCgbV4zsUk/ysdWZR/glf2+TU/axwygHDEaoXD3pYC0wBIgpb5/tHfR7h+gDSKsrdiLpJE44w
	fzz5t5ZVAB5vg6S9YNYqKL5Z+eXEqd/V66UsPWu2//3NSpFRvcTi5v1IikuE1H7e9WTdvn0/FGF
	uOZTMt4Eu6IO8xmkRvEiHp9Mp+0qV+6wi1o90PoYWuNXUBuYIpxxAXyNXPROxl4FN+2FaPLND5I
	08Cxblo7DhSwQ17iJTeuLoolHAt3KsVxerjAGoq8X6t5Kz7zoGBDYchb5G/JkHpHOKoRZp0iEcx
	sqrm49SVDwFFNuCyaUqpMxPqOR53NeJBnloOnNesPMRn+qsl
X-Received: by 2002:a05:6000:178f:b0:48d:f14a:9177 with SMTP id ffacd0b85a97d-48e6e4faeacmr18192484f8f.56.1793562273986;
        Sun, 01 Nov 2026 11:44:33 -0800 (PST)
Received: from cachyos ([5.224.123.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm14204388f8f.59.2026.11.01.11.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:44:33 -0800 (PST)
From: Ygor Otavio <ygorotavio.sjc@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ygor Otavio <ygorotavio.sjc@gmail.com>
Subject: [PATCH v3] docs: pt_BR: translate process/generated-content.rst
Date: Sun,  1 Nov 2026 20:44:23 +0100
Message-ID: <20261101194423.44459-1-ygorotavio.sjc@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/generated-content.rst
into Brazilian Portuguese, maintaining consistency with
original formatting rules.
Add it to the pt_BR process documentation index.

Update the translation through commit d699a5da1039 ("docs: link AI coding assistants and tool-generated content pages")

Assisted-by: LLM
Signed-off-by: Ygor Otavio <ygorotavio.sjc@gmail.com>
---
Changes in v3:
- Add pt_BR subdirectory to the subject
- Add reference to the original commit
- Move changelog out of the commit message
- Wrap lines at 80 columns
- Fix title underline lengths
- Replace "submetedor" with "autor"
- Reword awkward passages as suggested
- Reorder generated-content before coding-assistants in index.rst

Changes in v2:
- Fixed errors in the commit

 .../pt_BR/process/generated-content.rst       | 117 ++++++++++++++++++
 .../translations/pt_BR/process/index.rst      |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/generated-content.rst

diff --git a/Documentation/translations/pt_BR/process/generated-content.rst b/Documentation/translations/pt_BR/process/generated-content.rst
new file mode 100644
index 000000000000..9a448f1dfff7
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/generated-content.rst
@@ -0,0 +1,117 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================================
+Diretrizes do Kernel para Conteúdo Gerado por Ferramentas
+=========================================================
+
+Propósito
+=========
+
+Os contribuidores do kernel vêm usando ferramentas para gerar contribuições há
+muito tempo. Essas ferramentas podem aumentar o volume de contribuições. Ao
+mesmo tempo, o tempo disponível de revisores e mantenedores é um recurso
+escasso. Entender quais partes de uma contribuição vêm de humanos e quais vêm de
+ferramentas ajuda a preservar esses recursos e manter o desenvolvimento do
+kernel saudável.
+
+O objetivo aqui é esclarecer as expectativas da comunidade em relação a
+ferramentas. Isso permite que todos se tornem mais produtivos, mantendo ao mesmo
+tempo um alto grau de confiança entre contribuidores e revisores.
+
+Fora do Escopo
+==============
+
+Estas diretrizes não se aplicam a ferramentas que fazem ajustes triviais em
+conteúdo preexistente. Também não dizem respeito a ferramentas que ajudam em
+tarefas menores. Alguns exemplos:
+
+ - Correções de ortografia e gramática, como reformular para o modo imperativo
+ - Auxílios de digitação como completar identificadores, boilerplate
+   ou completar padrões triviais
+ - Transformações puramente mecânicas, como renomear variáveis
+ - Reformatação, como executar o Lindent, ``clang-format`` ou ``rust-fmt``
+
+Mesmo quando o uso de ferramentas estiver fora do escopo, considere sempre se
+informar ao revisor a ferramenta utilizada ajudaria na revisão da sua
+contribuição.
+
+No Escopo
+=========
+
+Estas diretrizes se aplicam quando uma quantidade significativa de conteúdo em
+uma contribuição do kernel não foi escrita por uma pessoa presente na cadeia de
+Signed-off-by, mas sim criada por uma ferramenta.
+
+A detecção de um problema e o teste da correção para ele também fazem parte do
+processo de desenvolvimento; se uma ferramenta foi usada para encontrar um
+problema tratado por uma alteração, isso deve ser mencionado no changelog. Isso
+não apenas dá o devido crédito, como também ajuda outros desenvolvedores a
+descobrir essas ferramentas.
+
+Alguns exemplos:
+ - Qualquer correção sugerida por ferramenta, como ``checkpatch.pl --fix``
+ - Scripts do Coccinelle
+ - Um chatbot gerou uma nova função no seu patch para ordenar entradas de lista.
+ - Um arquivo .c do patch foi originalmente gerado por um assistente de
+    codificação, mas foi limpo manualmente.
+ - O changelog foi gerado entregando o patch a uma ferramenta de IA generativa e
+   pedindo que ela escrevesse o changelog.
+ - O changelog foi traduzido de outro idioma.
+
+Em caso de dúvida, escolha a transparência e presuma que estas diretrizes se
+aplicam à sua contribuição.
+
+Diretrizes
+==========
+
+Primeiro, leia o Developer's Certificate of Origin:
+Documentation/process/submitting-patches.rst. Suas regras são simples e estão em
+vigor há muito tempo. Elas já cobriram diversas contribuições geradas por
+ferramentas. Certifique-se de que você entende toda a sua submissão e está
+preparado para responder aos comentários de revisão.
+
+Segundo, ao fazer uma contribuição, seja transparente sobre a origem
+do conteúdo em cover letters e changelogs. Você pode ser mais
+transparente adicionando informações como:
+
+ - Quais ferramentas foram usadas?
+ - A entrada fornecida às ferramentas que você usou, como o script de origem do
+   Coccinelle.
+ - Se o código foi majoritariamente gerado a partir de um único prompt ou um
+   pequeno conjunto de prompts, inclua esses prompts. Para sessões mais longas,
+   inclua um resumo dos prompts e da natureza da assistência resultante.
+ - Quais partes do conteúdo foram afetadas por essa ferramenta?
+ - Como a submissão foi testada e quais ferramentas foram usadas para testar a
+   correção?
+
+Como em todas as contribuições, cada mantenedor tem a tem a discricionariedade
+de decidir como lidar ou tem autonomia. Por exemplo, eles podem:
+
+ - Tratá-la como qualquer outra contribuição.
+ - Rejeitá-la de imediato.
+ - Tratar a contribuição de forma especial, por exemplo, pedindo testes extras,
+   revisando com escrutínio adicional, ou revisando com prioridade menor do que
+   conteúdo gerado por humanos.
+ - Pedir algum outro passo especial, como solicitar que o contribuidor detalhe
+   como a ferramenta ou o modelo foi treinado.
+ - Pedir ao autor que explique a contribuição em mais detalhes, para que o
+    mantenedor possa se assegurar de que o autor entende completamente...
+    como o código funciona.
+ - Sugerir um prompt melhor em vez de sugerir alterações específicas de código.
+
+Se as ferramentas permitirem que você gere uma contribuição automaticamente,
+espere escrutínio adicional proporcional ao quanto dela foi gerado.
+
+Assim como ocorre com a saída de qualquer ferramenta, o resultado pode estar
+incorreto ou inadequado. Espera-se que você entenda e seja capaz de defender
+tudo o quesubmeter. Se você não for capaz de fazer isso, então não submeta as
+alterações resultantes.
+
+Se você o fizer mesmo assim, os mantenedores têm o direito de rejeitar sua série
+sem revisão detalhada.
+
+Referências
+===========
+
+Para diretrizes específicas sobre assistentes de codificação de IA, veja:
+* Documentation/process/coding-assistants.rst
\ No newline at end of file
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5166..34eb92f5d458 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -58,6 +58,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Interpretação do Código de Conduta do Kernel Linux <code-of-conduct-interpretation>
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
+   Diretrizes do Kernel para Conteúdo Gerado por Ferramentas <generated-content>   
    Estilo de gerenciamento do kernel Linux <management-style>
    Conclave (Continuidade do projeto) <conclave>
 
-- 
2.56.0

