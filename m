Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676894;
	b=tKrvJyv+zxRZiv4Ft/pFEDo2cTYmONZEQmjZRL2+x468iHsu/62kg9rB86HGt8fgVNLa
	 LVTNz7UhZMnPGzrIpJ5xbyxMoroU71c/5MPspUbP0D+JDuf2LZ1B44kGymnr5OjEO9ggn
	 jkDm/uuC+o8z+m10jRDfRD8Y49DSBhdayXfMGJ879DIz6T7v87mUYY12i6YvWuNK8v/WQ
	 eMXYTCIFewPhnW/AsICsqTFw9cjb1ISwXwlYxQcJDPApjzzVz0Hw4eN7lvc8A5JkW17ph
	 agSCB6hyCv+tcEVeoq8N8Z2VI0WcXv4vNyYRn1xf4ysgy15kpOhIpp41nOY/MIlODXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BhOPZw6RsJhz6XrObnIEiqRUu1EHWPuCcuVjWz0UweE=;
	b=Mi3qFZKxWc3TkOP85mkrBPbKFal7QIMJRLIcRt6DFGG8YdAiTH4jlUZpxK6jEJh0/da4
	 r80qYh0nXTj0kICW/3FOMPyf5iLWB0L/G72phCWEURLaxUcr/AoyLmukl+LFLd3BRpNEz
	 8MNY4gqwPEeZtDeDzQyB+e5Ci7qDylhokxXlyfUMgropliHVZWtEx9isvK28oPtWyQsEJ
	 qbS/a1rnv36vRiiKBKTya+1e0IvKyWov6OKt19W6LhhfHtPHKTrUach3FhnJW7EeeLimf
	 zkUVQP9Vx8VznL43STyGt9Lakc+L47JsDNgmBkcJQuITnhF28PGMLTNazcmfk1SJfTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=liDJZSqv;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611BF606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 611BF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=liDJZSqv
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ec690faf85so1039062e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793676893; x=1794281693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhOPZw6RsJhz6XrObnIEiqRUu1EHWPuCcuVjWz0UweE=;
        b=liDJZSqvXHo1AFqXrDnjlBlQGa0D1SK+aUXzusxrq8ByonhrtNVi4JdZrYTpY1rS92
         zsFElmS+9Oxb8sPd6Ovpp0rIiKwJzP5/uGJaUFReEDnYxF9W3E9CRXNZcPpEZMWh0Mlq
         NF2bMyt7nczSAPyyN1Fvq8yz9h5bDxcL+VGYo9HX7DK+pBvisbu0kcYuTCeJAKMLCuBt
         TCxteu0wFmBqUgpqefU5gE5ZqXJoEmHR1T6cN8B3V43YJodFiaV3sPnVYJPs8fzdOLcY
         iJOcRjQ1uuSJqIJoBQtvc5N5JO9+ItJ461GNGtLOlf7TbiOq9ISHQufIjSDcC2ZJNFQM
         KHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676893; x=1794281693;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BhOPZw6RsJhz6XrObnIEiqRUu1EHWPuCcuVjWz0UweE=;
        b=cxasyFtf7/qHQKSvg3XI9qv1zP0PK5X0wihKv2YcX/NZmqUr0AHMxin9VjyYokd755
         ZN7rXeeT9yYrFRKujGY/JUqbHjxQDF6OV8TP1ORoh1kXwp35drbR/eZHh9t6d3zfhfOB
         stB1oe/tfEh+BUB49YwFb75MtMtPhFP5UL6142NO9Yvb9Ru028iYPOannCpV6oFAUcVT
         K99LeTmUSDhOkRWGrXcPMe8fNO2mjydF8W8LZBMkMQ/QbHUKbHPa0gkL7B9+AR7+VdTD
         C2eZU693bGepGQbpLz+xDuN4EqAbZG5Jq38vpGdGIw8ru3XtmITqMVlQcQ5EPzeotFsm
         NhTQ==
X-Forwarded-Encrypted: i=1; AKwUvByJH8RnpLElXbBonPSqV3GvpCbwnawVaT+stlxNy1UndNrf2n7yRtwkpEWSjVC+7tpkXMdSElmuUn73cos=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+uR1uTJK84uKLvM73xxVLYi3sSVpPiHpHPMYteL8oR9Z8aA1E
	7hq9qNNf6Vf7OEuq+GpwZm1weillREJwM9l+QeV9m18dLArQqngp3oNiVsmcvRZY
X-Gm-Gg: AYBFou1ViPoZJcWMHQhqEhrnsDYEwc/tauHQYEKpcLENM9xJVUThAxDHKkz/b5eHDDp
	tfl4MIB/Zju0GG8XjRWyJex8GekFHtRH8YWsfm8zWK6wOweh+LcnIys8WC+Ej07baGSE7rvXldt
	6T4cesyvbkkOZzqwXzwt8c51GcSJQdfFFSL/OiiV7HgFx6kisgqQFbF7SVDZZ56AT+EO+/Xkrxh
	8FLzrnaGP7ZOuKvCdQso9z5QiUNDHoT+WF3/gdjoEdxQ+tm1bn0m2neMEF+UzA7zX3SCQlY2lSD
	iTKPIk2hwtbEsG+5yi/B+jgxgMoU5MYUvMVpHd+8W3gNpPfJN3ri+BmbiR5KGWjRGmBcItqWyu4
	EyrwS7Mf+PzjT0ThsocOchHVPlaM1CoEk+6nnBYAXpzIFlcomekMRTPLlxpK16DMKXjmtLSwdsy
	KG86PLzJ7edLeeXfg89VDBl8V76VbO9RnHfuh7HdWWHUi5cgoK3vPPz1Oc5epAvtUiNdkQae6Tt
	lJESCEjVccdh7eWOeXH9mFOX4CyyJHYovaUcFvLr1IaQEe0JEeHz1fH7ToRZETDMjOVOUq8txui
	D1a95Ct27SO2BakkOlPCwSiGZdJPHeG+xQTOCO5ODqrbm1WK2zGAXWJdtFUsnK4gaAA7venIMnR
	/QJ0=
X-Received: by 2002:a05:6122:e248:b0:5e9:7458:9bb2 with SMTP id 71dfb90a1353d-5ec6881779bmr4897050e0c.5.1793676893209;
        Mon, 02 Nov 2026 19:34:53 -0800 (PST)
Received: from dell-pro-plus ([2804:29b8:5080:dd51:d55c:b555:e096:bdc4])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec8c2385a6sm3925412e0c.14.2026.11.02.19.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:52 -0800 (PST)
From: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
To: linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	sashal@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	ic.gabrielribeiro@gmail.com
Subject: [PATCH v2] docs: translations: pt_BR: add init troubleshooting guide
Date: Tue,  3 Nov 2026 00:33:49 -0300
Message-ID: <20261103033349.908133-1-ic.gabrielribeiro@gmail.com>
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

Translate the init troubleshooting guide into Brazilian Portuguese
and link it from the pt_BR admin-guide index.
Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
---
Changes in v2:
- Add a commit-message body.
- Match the punctuation in item 2 to the source.
- Translate "painless" as "o mais simples possível".

 .../translations/pt_BR/admin-guide/index.rst  |  6 +-
 .../translations/pt_BR/admin-guide/init.rst   | 58 +++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/init.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index f0f096a74e..cb5a64f829 100644
--- a/Documentation/translations/pt_BR/admin-guide/index.rst
+++ b/Documentation/translations/pt_BR/admin-guide/index.rst
@@ -72,6 +72,11 @@ Rastreando e identificando problemas
 Aqui está um conjunto de documentos voltados a usuários que estão tentando
 rastrear problemas e bugs em particular.
 
+.. toctree::
+   :maxdepth: 1
+
+   init
+
 Todolist:
 
 *   reporting-issues
@@ -83,7 +88,6 @@ Todolist:
 *   tainted-kernels
 *   ramoops
 *   dynamic-debug-howto
-*   init
 *   kdump/index
 *   perf/index
 *   pstore-blk
diff --git a/Documentation/translations/pt_BR/admin-guide/init.rst b/Documentation/translations/pt_BR/admin-guide/init.rst
new file mode 100644
index 0000000000..f372668ae5
--- /dev/null
+++ b/Documentation/translations/pt_BR/admin-guide/init.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Explicando a mensagem de travamento na inicialização: "No working init found."
+==============================================================================
+:Autores: Andreas Mohr <andi at lisas period de>
+          Cristian Souza <cristianmsbr at gmail period com>
+
+Este documento apresenta algumas causas gerais da falha ao carregar o binário
+init (listadas aproximadamente na ordem em que ocorrem).
+
+1) **Não foi possível montar o sistema de arquivos raiz**: Defina o parâmetro
+   do kernel "debug" (no arquivo de configuração do carregador de inicialização
+   ou em CONFIG_CMDLINE) para obter mensagens mais detalhadas do kernel.
+
+2) **O binário init não existe no sistema de arquivos raiz**: Certifique-se de
+   que o tipo do sistema de arquivos raiz está correto (e de que o parâmetro
+   do kernel ``root=`` aponta para a partição correta) e de que os drivers
+   necessários, como os de hardware de armazenamento (por exemplo, SCSI ou
+   USB!) e os de sistema de arquivos (ext3, jffs2 etc.), são compilados no
+   kernel (ou, alternativamente, estão disponíveis como módulos a serem
+   pré-carregados por um initrd).
+
+3) **Dispositivo de console com problemas**: Possivelmente há um conflito na
+   configuração de ``console=`` que deixa o console inicial indisponível. Por
+   exemplo, alguns consoles seriais não são confiáveis devido a problemas com
+   IRQs seriais (por exemplo, ausência de configuração baseada em interrupções).
+   Tente especificar outro dispositivo no parâmetro ``console=`` ou, por
+   exemplo, usar ``netconsole=``.
+
+4) **O binário existe, mas as dependências não estão disponíveis**: Por
+   exemplo, bibliotecas necessárias ao binário init, como
+   ``/lib/ld-linux.so.2``, podem estar ausentes ou danificadas. Use
+   ``readelf -d <INIT>|grep NEEDED`` para descobrir quais bibliotecas são
+   necessárias.
+
+5) **Não é possível carregar o binário**: Certifique-se de que a arquitetura
+   do binário corresponda à do hardware. Por exemplo, pode haver uma
+   incompatibilidade entre i386 e x86_64 ou uma tentativa de carregar um binário
+   x86 em hardware ARM. Se você tentou carregar aqui um arquivo que não é
+   binário (um script de shell?), certifique-se de que o script
+   especifique um interpretador na linha de shebang do script (``#!/...``)
+   que funcione corretamente, incluindo suas dependências de
+   biblioteca. Antes de investigar scripts, é melhor testar primeiro um
+   binário simples que não seja um script, como ``/bin/sh``, e confirmar que
+   ele é executado com sucesso. Para saber mais, adicione código a
+   ``init/main.c`` para exibir os valores de retorno de kernel_execve().
+
+Amplie esta explicação sempre que encontrar novas causas de falha (afinal,
+carregar o binário init é uma etapa de transição CRÍTICA e difícil, que deve ser
+tornada o mais simples possível); em seguida, envie um patch à LKML.
+Outras tarefas pendentes:
+
+- Implementar as várias chamadas de ``run_init_process()`` usando um array de
+  estruturas, para armazenar o valor de retorno de cada chamada a
+  ``kernel_execve()`` e, em caso de falha, percorrer **todos** os resultados e
+  registrá-los (uma correção de usabilidade muito importante).
+- Tentar tornar a própria implementação mais útil em geral, por exemplo,
+  fornecendo mensagens de erro adicionais nos pontos afetados.
-- 
2.56.0
