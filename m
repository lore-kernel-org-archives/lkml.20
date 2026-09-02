Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B05C31F98E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788310581; cv=none; b=sizgghCf8BzgnTnOiGGgG0ngtCa42coqJjzaCZB6Pn6nPhxT3ILKqrK0ZFjzxzqqKqSC36Nz92frxTyLjXblX/GqNL4zFBM8sUlDR4mnLGNCT+CFyTy4uhY2+ooJRKvWHEk95F8es/tlLLtIhRj2ToIhr6sX9362VFhd5LF4NXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788310581; c=relaxed/simple;
	bh=d7cWym8GiqZJAsG40QVKThsxlp6hXKwXuUFOc7+ukYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HDXh1GfkyNVA2l+xRUxypBY/MkqJwQ6WnWjE4P+BO4oMcQiaQLyHsUkhXA3s5z7h0gB7u5fohbdkeV6E72jqq9hux/Nz2v2kBY7uG22SVCd4Jnz7FBuYhGEJViRWevGvczM4Kj0OZB98dqCEUN4MBGGuG/+NhawzWEGZBsmaBLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2Zleaxk; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2Zleaxk"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97cbbdfc2e0so197103241.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788310577; x=1788915377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tiVFAkorF9lFs+sLXpfvZyw5OEmX56UI3CjqJwbxhXU=;
        b=E2ZleaxkXM0UeMGSDpKyPPR1Sk7k/GkXuRjqGqF+nK+axUiyCu4pKHl811sfTStAEK
         9WqcrBNXCPa6iJ/FIxcgN3lpzy6AoTZHDYhYV8s6Giv5WczFjK3AHLyaK8kPJ25QXhrM
         19SMxKKYgbtpBnN6fbKT9rOXocOBy6LKOEKiT6a1mqVFi1F+agq/K+K6BCFwyfU1UUgd
         lirRLJN3w3WlhKHiFFf6CgI4PUI/0XDaKeZue37NH5FmHRtqI260Ng83hbg4G5f7Stme
         W+spkAEx8wEZD3a6ZwLWwkcFOo070jSzKID4Fci4iJv3lFPBQazE51NF0AubL4l6K/Q6
         onZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788310577; x=1788915377;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tiVFAkorF9lFs+sLXpfvZyw5OEmX56UI3CjqJwbxhXU=;
        b=PFAyoCT4M7wIqPT0N+kzTXhcHkiGTPyxUEv4p0HUeZed+6Ak10cKYG3773UyFmuwpK
         jXoHnd7KWUakGBj90hmnG4XRS1uHLHTODiunpX3ryrkSSErKAPlTT/0F57t1K5pwHUbK
         Mh/ljsEMh0LuevvdpwqBGHI+IlnSS1PinvUw1TUBQBZ7cCt/k5ISL1FLuT14cVU1Ic56
         8fYj4Qj/So/11ZLB1DDhSJulHviA67ch1O9AJoWWoQoT53FPASMOz36gyuxu+pb2O881
         bSJ2Gq5dj4ToiT3cdU5PdZYeaH56mnzpmHEt7ewr+SDCJXJqBsb63kOi3hJJdemjBv6Q
         x+Mw==
X-Forwarded-Encrypted: i=1; AKwUvByunI6mL5rHIx8lTm6sZbd3h28xxU+16V55FQIu7044y1zwY0CyGCwDtajw1p/3WHeKMAz/ndEQ7ruXpSE=@vger.kernel.org
X-Gm-Message-State: AFuF++lpm0fChZAkz7BHRZ5zYC2PBoEzYE7tD4HQ50jjCA2P/f9jWjvx
	0YfrVXWgz6f9fS2XbzT1rGzkYINAvSYiKxKjiNQYcdD1hgmK57BFRiQn
X-Gm-Gg: AYBFou0N2AmQEQMCI+zzIGwN/BWJ30EQdcNuf2n5XZWNc2Nmlhv9/b9tWiG3lgZW+kZ
	3P50TxtUnxuCVzIQcclCCgaMovbYyosJKI6eFvLguZhySM0C4qG+1qCFTTdIFqVq0o5u4hCgXjQ
	l9Ng0uPyUPYa1BD8e59FvhW0msu7OBGAegFtYJPLNlWcogNadTyuxWuEmkfqHmij/9jYTnInt9J
	qP18xdX2pS8F2V85jf4X6An8jjgdi5lSOej/LmRpyVn+ZmUTZZoD+xc/54N6qnsbBrCYl3U2UvG
	xkuIY85OqCdjLY3RsCEq4kqZ0fl9Ki6dEb5Lpp6JkYYTylaDQX1q8F7W6XRN7bhHxDIQ5afho9M
	PXvtkzZqiVVIHdzpxtlUhHzexBaP7Zb/tv5K4NaM2AXyyrsKCP+iafDUyBuYmqBv16IGfowoDbB
	aje+gFO5iS41fNH8IRtkRhJ0NRHhQf5Y+sxaE/E438D+hW8ao6gFpOEWsz8VQBQ1N4r72Lmw==
X-Received: by 2002:a05:6102:5490:b0:783:79ac:9dc3 with SMTP id ada2fe7eead31-78a1f2df152mr381604137.10.1788310577405;
        Tue, 01 Sep 2026 17:56:17 -0700 (PDT)
Received: from pop-os ([2804:14c:daa2:8daa:574f:5cf:6f39:859e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a251ca6sm1095624137.4.2026.09.01.17.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:56:17 -0700 (PDT)
From: Giovanna Macedo Cox <giovannamccds@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Giovanna Macedo Cox <giovannamccds@gmail.com>
Subject: [PATCH v2] docs: translations: pt_BR: translate coding-assistants.rst
Date: Tue,  1 Sep 2026 21:56:01 -0300
Message-ID: <20260902005603.18836-1-giovannamccds@gmail.com>
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

Assisted-by: LLM 
Signed-off-by: Giovanna Macedo Cox <giovannamccds@gmail.com>
---
Changes in v2:
- Change trailer Assisted-by for the new pattern
- Fix translation errors
- Link to V1: https://lore.kernel.org/r/20260830234515.63131-1-giovannamccds@gmail.com/

 .../pt_BR/process/coding-assistants.rst       | 60 +++++++++++++++++++
 .../translations/pt_BR/process/index.rst      |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/coding-assistants.rst

diff --git a/Documentation/translations/pt_BR/process/coding-assistants.rst b/Documentation/translations/pt_BR/process/coding-assistants.rst
new file mode 100644
index 000000000..2055af34a
--- /dev/null
+++ b/Documentation/translations/pt_BR/process/coding-assistants.rst
@@ -0,0 +1,60 @@
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
+* Use identificadores SPDX de licença apropriados
+* Veja Documentation/process/license-rules.rst para mais detalhes
+
+Assinatura e certificado de origem do desenvolvedor
+===================================================
+
+Agentes de IA NÃO DEVEM adicionar tags Signed-off-by. Apenas pessoas
+podem legalmente certificar o Certificado de Origem do Desenvolvedor (DCO).
+A pessoa que envia é responsável por:
+
+* Revisar todo código gerado por IA
+* Garantir conformidade com os requisitos de licença
+* Acrescentar sua própria tag Signed-off-by para certificar o DCO
+* Assumir toda responsabilidade pela contribuição
+
+Atribuições
+===========
+
+Quando ferramentas de IA contribuírem para o desenvolvimento do kernel,
+a atribuição adequada ajuda a rastrear a função da IA no processo de
+desenvolvimento. Contribuições devem incluir a tag de assistência seguindo este
+formato::
+
+    Assisted-by: LLM [FERRAMENTA1] [FERRAMENTA2]
+
+* ``[FERRAMENTA1] [FERRAMENTA2]`` são ferramentas de análise especializada
+    opcionais (Exemplo: coccinelle, sparse, smatch, clang-tidy)
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

