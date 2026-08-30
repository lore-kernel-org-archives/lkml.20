Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794C222580
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788133761; cv=none; b=GV6eRubIvp90/MHirX2UgGUWOxGe+AirxC7botEtRIBwdQuTMaXsPlWvZDNFTZXCo1Hb2aKmlbV4Y96Ox3veeUBRpyWIYbdcoCtnLsqPVVujYhRMG/YG40MahX7XIlthRzSj3tpnNYBpm2Zojb13DDafdHJ2KLoRDRk3QRcDZBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788133761; c=relaxed/simple;
	bh=KsaH5A6iFx83X/q5AlegGGoA6eyhF2dPglZuD/fD+gE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HBhXBePMt4hq/Bl4Rd3rauAy/9rEbJa7+oZxJZ3owzRz/bTBlF5ZMG0rnu+3blGJHavIu05R3uaryEc9wsemNAbqZgZRnuju3t7IzoZE/vjFKcSaKKzOaXe9zHLDtVCSrG4tzfEYvpX0ffatI/2FxTVnmPwmOfEdWntkmTvKHxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwsySV44; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwsySV44"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso1099271e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788133759; x=1788738559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDrnzNFgJwSAtWrkQNEzs8cKW+XO1e6VplYcP0/oLkg=;
        b=RwsySV44QpwVq5IiTh6UNCFw8WPZo9d4sLzfRhPW7bq5R48NohzLAIhT1dvQeQysgo
         AzRdIZybMCCnGQJD00sjQnNpZ3j/PklROppnn6Bjm9g4sGb0GRVCxv0EWXHPy939oPgS
         2lAehDnLKoLj7guPph5SBRdhUF9l84hRbYythZYiLbBytOonWdrJoEIEstN0jLygRb0J
         d2z/Q4YcQpPKpTldI3QKb/kifz9QcPStj8OA1Cm5BJQlFMGE45emYsBpY3yG6NgcoD5Z
         MH+CYbAy/XLhRApjBut48iyRRXPnTiCdeaKyXH2On9qtWmcVLtVatmbB67UDFm4uKgt5
         9eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788133759; x=1788738559;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nDrnzNFgJwSAtWrkQNEzs8cKW+XO1e6VplYcP0/oLkg=;
        b=ccMpBj+QgQ84i9X1zbtHHsaGtnF5c9QMC+DCKoqrlhzB3UnI++OtxfuEyGCP4b8IgF
         8/NNQDk+Rhfaay6zG/lp/kkKv+9ZNqIsbORaRpZgRzypsVMXQgzyd2DDTZ8e0sIwBtRb
         UVkv3YBKrOpD3cK0nip2vw0yder0smnZ3cy+EPhC/48URkHr16fjnMYjrGs2XUaoEUou
         NsclmUEU9pq4my26lCV4RysBgErl993VeLFw2w5k3QtuI8JFwATe6WrOOwttG1jT2i+w
         ObNGlV2CV9CGROSh6kj1+mDbLkwlMYMLxCFJn2RnUVSevsJ9VzwGavwHhatR4HUVB3WX
         DO1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr1c3MaRJHRHxoknjODYvKMT6JyLaudjfCTLT7fH75hF83VSHkPONYtyFJWGW0SoTh6Iinq4nqK8g0s6fY=@vger.kernel.org
X-Gm-Message-State: AFuF++mvkneVD5eZY/pwvNdN7TPpdCQkBuPwdXfGTszG0R+gTtgRF6OA
	oh8NpND92kpUpStHsBFhSUsWjt2OFgOJoEn+Ry4iN3PmupdzOoYRwpmA
X-Gm-Gg: AR+sD13zBjd5mvn/I2d5srL8QaIgJbF2XgKW8g4H/4V5/XlvMx/SXk8Lb4q/DOfXzPJ
	7BJBf7exqjjBSkPpY4EWrrB70OZ5cRmSDQcwDTVBhDQOwpzc7ZaqGcgn+GmH3XJzqS6Zenm8+By
	G7pf6Q/wbdlNd3TK4sML7MXXuhnQZncSKhCowIDdpgZbCh/9QhOxgGmyDgZDtQpkqUwQ0DVlmm8
	ONWlUbvcZ/rlrSb+Zd4aDEZK5hMQsYZ9rUmapAq6tgXgGju+IzNtAR35zl8w07gPUJCStPdhnqJ
	m2UNGxtReSFb7DVk92PNq4yjXPSR4SjsL44QXPEFNshEIDHacVwN/c7YxIQpA2xT6Qdqgo5qRXJ
	1M3ptz+YawMWfhVlebWPRYKCBuqe/FQylxkGlIjc92e++O/zP/PAyf7UgtD3U0zVDcEf/kE385j
	h9qmVB/RuSasRK445Ay37yMBo1ydgak/E8OWuMx8m1S3MoLTy/qXNKrsE+PCQf
X-Received: by 2002:a05:6122:1c85:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c680ebbf4fmr7108211e0c.0.1788133759221;
        Sun, 30 Aug 2026 16:49:19 -0700 (PDT)
Received: from pop-os ([2804:14c:daa2:8daa:5c26:a166:6a81:daf2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7159c4c8asm6920968e0c.0.2026.08.30.16.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 16:49:18 -0700 (PDT)
From: Giovanna Macedo Cox <giovannamccds@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Giovanna Macedo Cox <giovannamccds@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: translate coding-assistants.rst
Date: Sun, 30 Aug 2026 20:45:13 -0300
Message-ID: <20260830234515.63131-1-giovannamccds@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate coding-assistants.rst into Brazilian Portuguese
and add it to the pt_BR process documentation index.

Assisted-by: ChatGPT:GPT-5.5
Signed-off-by: Giovanna Macedo Cox <giovannamccds@gmail.com>
---
 .../pt_BR/process/coding-assistants.rst       | 59 +++++++++++++++++++
 .../translations/pt_BR/process/index.rst      |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/coding-assistants.rst

diff --git a/Documentation/translations/pt_BR/process/coding-assistants.rst b/Documentation/translations/pt_BR/process/coding-assistants.rst
new file mode 100644
index 000000000..18e9b69ad
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/coding-assistants.rst
@@ -0,0 +1,59 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+IA Assistente de código
++++++++++++++++++++++++
+
+Esta documentação fornece um guia para ferramentas de IA e desenvolvedores que
+usam IA como assistente para contribuir para o kernel do Linux.
+
+Ferramentas de IA que ajudam desenvolvedores do Linux kernel devem seguir os
+padrões de desenvolvimento do kernel:
+
+* Documentation/process/development-process.rst
+* Documentation/process/coding-style.rst
+* Documentation/process/submitting-patches.rst
+
+Para guias e conteúdo sobre códigos gerados por assistentes de IA veja:
+
+* Documentation/process/generated-content.rst
+
+Licenças e Requisitos Legais
+============================
+
+Todas as contribuições devem estar de acordo com os requisitos de licença do
+kernel:
+
+* Todo código deve ser compatível apenas com GPL-2.0
+* Use identificadores SPDX de licença apropriado
+* Veja Documentation/process/license-rules.rst para mais detalhes
+
+Assinatura e certificado de origem do desenvolvedor
+===================================================
+
+Agentes de IA NÃO DEVEM ser incluídos nas tags de assinaturas. Apenas pessoas
+podem legalmente certificar o Certificado de Origem do Desenvolvedor (DCO).
+A pessoa que envia é responsável por:
+
+* Revisar todo código gerado por IA
+* Garantir conformidade com os requisitos de licença
+* Acrescentar sua própria tag de certificado de assinatura o DCO
+* Assumir toda responsabilidade pela contribuição
+
+Atribuições
+===========
+
+Quando ferramentas de IA contribuir com o desenvolvedor kernel, a atribuição
+adequada ajuda a rastrear a função da IA no processo de desenvolvimento.
+Contribuições devem incluir a tag de assistência seguindo este formato::
+
+    Assisted-by: LLM [FERRAMENTA1] [FERRAMENTA2]
+
+* ``[FERRAMENTA1] [FERRAMENTA2]`` são usadas ferramentas opcionais de análise
+  especializadas (Exemplo: coccinelle, sparse, smatch, clang-tidy)
+
+Ferramentas básicas de desenvolvimento (git, gcc, make, editors) não são
+listadas.
+
+Exemplo::
+
+  Assisted-by: LLM coccinelle sparse
\ No newline at end of file
diff --git a/Documentation/translations/pt_BR/process/index.rst b/Documentation/translations/pt_BR/process/index.rst
index eda2a3fc5..6c68ac496 100644
--- a/Documentation/translations/pt_BR/process/index.rst
+++ b/Documentation/translations/pt_BR/process/index.rst
@@ -59,6 +59,7 @@ Estas são as regras pelas quais tentamos viver na comunidade do kernel
    Modelos de Maturidade para Contribuição no Kernel Linux <contribution-maturity-model.rst>
    Declaração sobre Drivers do Kernel <kernel-driver-statement>
    Estilo de gerenciamento do kernel Linux <management-style>
+   Assistentes de código <coding-assistants>
    Conclave (Continuidade do projeto) <conclave>
 
 Lidando com bugs
-- 
2.55.0

