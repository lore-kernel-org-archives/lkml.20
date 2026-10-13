Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B208D384242
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853988; cv=none; b=q7tbzQWsXGHiOu2K6/slYJczel8TtnD8Vi9Tudlu9L9/fx00DQwJCDRNp9wsPKNyJdBhPX5R1soWEunw6XR4+94taBQR/qJiBIuSxAnT1yB/o9RWS9Xuf7zFC8oNOfcn/S/pGwHEEF1xqR2KaQrQywLqAI+o4KEv6U52XtdOAXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853988; c=relaxed/simple;
	bh=Wb9IloYHyj3Y7vOA0dxPQDsPBQ6p0fy0/wWyJxmd2LU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PZRQWULKkecT0bidK7iJ9wUOQfK7U6r70vF4vqmPvh2k6yWFHu0zR4MEuFSe6QWfFOSf+6/1gsUVM1e5AW9w3j9njLvsO9oRSfK/fBUNKAEwPUxrbOg/OEJpGv6A33ViuK/B1aBm9TEb0eRHO8qGnPxZLEoNKWsyh0wVgqSl9Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRLHO7KW; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRLHO7KW"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33c2520ad38so5596940eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791853985; x=1792458785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZsCL9NCNCGhtLCeYnjn/IHwp0PKXAfcikldb75bYeI=;
        b=oRLHO7KW6ndIAa/qveL0jNtJws48pBFpg6jnCdWheIDt8ozaqZyksvRlNYf8W+RUKY
         e9Oiy5qj01mH5zvTcIFTMq8yD08y7uxMOWGHkqi2g48gHcHezWWoqo2RPrQc1KuNQsdA
         RGvpjANwqvHgZ8BP4WQd6Fep2qjS3ppm/jJe4IH3JQvbWPlL8QsxNdAuUIPbpOE63Wpi
         Ib6TRFZ+M+KGRQsZwQw4xO0hq2O+gqIHSxRSS207hHbXucF7sbU1g7/BeNNAlcOVYdbB
         V8d2Oq2oO1dxVsE4dG4DBzI6WWEjOiQzweYRZzP1P3yAqZh50T1T23eKIPaLBHmlnhTJ
         SXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853985; x=1792458785;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ZsCL9NCNCGhtLCeYnjn/IHwp0PKXAfcikldb75bYeI=;
        b=N8vEkhJGtFrx6qCQU38Vd2JJdGsZr56DWOy+oLjntKiqspGwyiwG472wDxEvSN+ix2
         wH3lDHNyVu06P875OqmxG/1wvkLGMvvQmSs9/fFqKLg1H8KBm+93oAEABb88p99bVV19
         lWsJm4otNFn4JgtmnRp1kFUyHorVefwteekYbBUh//xRMfsGkVv9hefKruZ2tGjPnivC
         eL4tDbazREzerTN1MdvAeR+77Z6AR6G+riVFjqy7/3ATYmBxt9j5V7O62EL5U8MMQvwF
         kKAojhLjPFtELfwhj9FBwjFYh11H6VDNH3369KePD20aUgVrt8MkncJoqqybZWegHZad
         SG/A==
X-Forwarded-Encrypted: i=1; AKwUvBy+RVgtUHikdKFhKc4yvEjwmhiv/haS2QvrOTxA/+REfl3ngLCt8a4tsItyEy8a2WyQBxza5yGvfwCIznY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkTkBAFkCLLhQ3NrkQuU7tougu8MfQ5itWJBx5vGTM+AsEtEm7
	Azhd4IvKfWGZ939Gbk2wQ4uKMKBoWs+U+UM+dg6p7nrX8iVrt7vTroYs
X-Gm-Gg: AYBFou1BkJhSOOWkobaGIZ6Ph5zMzaN457FqDgfpTBhTMisrAYz9H+6kO24+jyLLqOz
	1eM09is8QEbBHTZYb9F7T91JGk66A2mW4GPYQdv7hwdWPuI0sQMSGkT2zWcl9Ze8PjTZv42vo9Q
	wYE9YY6YYOVCNveAikTPfeXivWRBAZp7Hhf7PHkV93HDD1cyRfRYoJl1u66WI1YtzpWc3o5QNG9
	YA0k8xT2ZSMnBWE2AbFMDV7Dt+F8umOBEBOfopyA6//SJhz7FuXlkCyHcJixqiUP/1k7iJpWNo1
	ulACX6Zgousv9R+iY5srVQTXyyPaad+6ngfUYK2DNNzYf0y9ctNwcjgkNqKYF2kKKrnEiQd+/FM
	wqQny+dMV5RSTFrlRyROkM9m1Jl2l+FJNQtcmbo4Aaoh/1N5evMPs9OMzT+rVV24DQQ9U+Vw+4D
	vW88b09TmsnuQUnN5d2RSD2xPpCPMbx2ZDLJXgfdwzG4mBpqjPejJgM5EsN7JFVwYHWO8IAbY=
X-Received: by 2002:a05:7301:faf:b0:35a:6baa:9c9b with SMTP id 5a478bee46e88-35a6baaa286mr6581925eec.35.1791853984527;
        Mon, 12 Oct 2026 18:13:04 -0700 (PDT)
Received: from cachyos ([2804:7f0:9f81:4c10:ebb9:5cd0:df8:562c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35a352d4b05sm18202768eec.19.2026.10.12.18.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:13:04 -0700 (PDT)
From: Ygor Otavio <ygorotavio.sjc@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ygor Otavio <ygorotavio.sjc@gmail.com>
Subject: [PATCH v2] docs: translations: pt_BR: translate generated-content.rst
Date: Mon, 12 Oct 2026 22:12:45 -0300
Message-ID: <20261013011245.4779-1-ygorotavio.sjc@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate generated-content.rst into Brazilian Portuguese,
maintaining consistency with original formatting rules.
Add it to the pt_BR process documentation index.
And fixed the errors in the commit.

Assisted-by:LLM

Signed-off-by: Ygor Otavio <ygorotavio.sjc@gmail.com>

---
---
 .../pt_BR/process/generated-content.rst       | 117 ++++++++++++++++++
 .../translations/pt_BR/process/index.rst      |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/generated-content.rst

diff --git a/Documentation/translations/pt_BR/process/generated-content.rst b/Documentation/translations/pt_BR/process/generated-content.rst
new file mode 100644
index 000000000000..1c66dd9c13a5
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
+muito tempo. Essas ferramentas podem aumentar o volume de contribuições. Ao mesmo
+tempo, o tempo disponível de revisores e mantenedores é um recurso escasso.
+Entender quais partes de uma contribuição vêm de humanos e quais vêm de ferramentas
+ajuda a preservar esses recursos e manter o desenvolvimento do kernel saudável.
+
+O objetivo aqui é esclarecer as expectativas da comunidade em relação a ferramentas.
+Isso permite que todos se tornem mais produtivos, mantendo ao mesmo tempo um alto
+grau de confiança entre submetedores e revisores.
+
+Fora do Escopo
+===============
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
+Mesmo quando o uso da sua ferramenta estiver fora do escopo, você
+ainda deve sempre considerar se informar ao revisor qual ferramenta
+você usou ajudaria na revisão da sua contribuição.
+
+No Escopo
+==========
+
+Estas diretrizes se aplicam quando uma quantidade significativa de conteúdo em
+uma contribuição do kernel não foi escrita por uma pessoa presente na cadeia de
+Signed-off-by, mas sim criada por uma ferramenta.
+
+A detecção de um problema e o teste da correção para ele também fazem parte do
+processo de desenvolvimento; se uma ferramenta foi usada para encontrar um problema
+tratado por uma alteração, isso deve ser mencionado no changelog. Isso não apenas
+dá o devido crédito, como também ajuda outros desenvolvedores a descobrir essas
+ferramentas.
+
+Alguns exemplos:
+ - Qualquer correção sugerida por ferramenta, como ``checkpatch.pl --fix``
+ - Scripts do Coccinelle
+ - Um chatbot gerou uma nova função no seu patch para ordenar entradas de lista.
+ - Um arquivo .c do patch foi originalmente gerado por um assistente de codificação,
+   mas foi limpo manualmente.
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
+vigor há muito tempo. Elas já cobriram diversas contribuições geradas por ferramentas.
+Certifique-se de que você entende toda a sua submissão e está preparado para
+responder aos comentários de revisão.
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
+Como em todas as contribuições, cada mantenedor tem a discricionariedade de escolher
+como lidar com a contribuição. Por exemplo, eles podem:
+
+ - Tratá-la como qualquer outra contribuição.
+ - Rejeitá-la de imediato.
+ - Tratar a contribuição de forma especial, por exemplo, pedindo testes extras,
+   revisando com escrutínio adicional, ou revisando com prioridade menor do que
+   conteúdo gerado por humanos.
+ - Pedir algum outro passo especial, como solicitar que o contribuidor detalhe
+   como a ferramenta ou o modelo foi treinado.
+ - Pedir ao submetedor que explique em mais detalhes sobre a contribuição, para
+   que o mantenedor possa se assegurar de que o submetedor entende completamente
+   como o código funciona.
+ - Sugerir um prompt melhor em vez de sugerir alterações específicas de código.
+
+Se as ferramentas permitirem que você gere uma contribuição automaticamente,
+espere escrutínio adicional proporcional a quanto dela foi gerado.
+
+Como com a saída de qualquer ferramenta, o resultado pode estar incorreto ou
+inadequado. Espera-se que você entenda e seja capaz de defender tudo o que submeter.
+Se você não for capaz de fazer isso, então não submeta as alterações resultantes.
+
+Se você o fizer mesmo assim, os mantenedores têm o direito de rejeitar sua série
+sem revisão detalhada.
+
+Referências
+============
+
+Para diretrizes específicas sobre assistentes de codificação de IA, veja:
+
+
+* Documentation/process/coding-assistants.rst
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5166..cced028e12c9 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -59,6 +59,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
    Estilo de gerenciamento do kernel Linux <management-style>
+   Diretrizes do Kernel para Conteúdo Gerado por Ferramentas <generated-content>
    Conclave (Continuidade do projeto) <conclave>
 
 Lidando com bugs
-- 
2.55.0

