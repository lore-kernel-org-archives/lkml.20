Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793457161;
	b=yAc8i5cb4VNKeIGR1texuh9CekvMBs2UJ/UZoEnZBL2xQjpFME4leLTC2PcR7WC2nyVl
	 14/LjRHyYTYS5Hgb/yy90Rl/3xNc2Nv4rUnVPxpgR37k5q4uL2SnZ7fCo0UiiShPAVJFf
	 fARMzR/UKAeeRr7jXIc7MhwquJijyKyO4TQK7JNvHmTOAOoDVCoHof8EVqrBBcppX3dDV
	 RxhJWkMqmQOyHWFlbatcup0NO+hsbxRrYPDqhltPOl3jAZxTQie5Wnrrod3Wv7ZN47WN8
	 7AmgKd/xjC3RKOhELD4PUJ3QS0axC9EP5nkMKO0F3bSyg7uCfIDGAZm2GcFYQHRyxKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793457161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=t+mEHp2k2iMpiIV7c9dpwWqNWogWRyGSpy9pUvk2R4M=;
	b=eGuXawl9Y5cyq/VPpJQIeSG/k6LRSgdMx5X5KdPQAz+6R/cmQYLWE0V79yTuvQ2tYsy8
	 d+JIwCNu7Fa8qtJptzQv8XxlQLn7nyjaOJyTk0UjjGnM23AALbjvzlXF4R/5PjDfjKv1N
	 Rix7HsCuOnCWJ/+eOVtvPu+PGQIUgY0zVluuOmacBjE0KTyhuCjSo26HUU7eWIxLblnuE
	 4bSplINi1T9NlOFSnbLow++cO+ztWXBywdINJ60nElOuhfSex5oUB/y50AqgdNp9btA6b
	 0f/HV8TR+3u6CuXjOuTE2n8CZx4aQVDgnzj9c3/f7NC4y2PODydl+hhzwKz5i1ruLNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HNIov5Hx;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECEF606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECEF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HNIov5Hx
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-980c4258105so935623241.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793457160; x=1794061960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+mEHp2k2iMpiIV7c9dpwWqNWogWRyGSpy9pUvk2R4M=;
        b=HNIov5HxemII9fg7ZOJfww6zl/v1YonN5bBI7jzpqtwCrLZEZYPM86wXmwuL8bwvRQ
         a3lZshxnsd1cq85QPHqlEhTgut7OdXwreYjAcjiFhK2x4APlkAPjf+RZrROv2S8XN6EI
         jw5sHa1acUuZ0UhnX/9fOT6NQa4jSN3CDLcuZfPtUapABvelkN2E4JL+xgb22ctKsp8F
         UaF1ZfO/2OJDUCDgJUC7t6Amfou6MM8V9T12caukXu5v+EMD2dEobSzNfMdrfrIbqYtQ
         4Qq8qmWfwe2GgdPYieQcsPQy63pVuu9NIV+bC6MBga7Q5T212bmWR2meh5S7c7HWRdbs
         VBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793457160; x=1794061960;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+mEHp2k2iMpiIV7c9dpwWqNWogWRyGSpy9pUvk2R4M=;
        b=uBpUm8ePKNbdGOjZLnVmdBgK22POYUInIWfEAMbbAJ2lbklk9v1GApBa/gt520C2zN
         tcuYBICHwa3R8gE40mJZcisjEcG/3n8hPZI1uS4ubxCsek/4eUCgUgGLDhbW3cjE9Mp1
         sJ+3HBeihC/ppGPooGAnJtK4ms7ecsZ2xENwKHtEjmZu+sM5dYIwwWm6/uZwyO7VZVJC
         oeCm0l5GF+VmYU0BpDqdunNQUKnsk4w4LRsYm5ZVgcRQT+eLEmolC9RmWfqO5OWVb3I4
         xw+mCVkYs9wIWyxMJSVPCIMzvf3vad2j6eA9KkH3DVhR/ik5GX0V8moyk1wyAR6tMP/b
         6Jeg==
X-Forwarded-Encrypted: i=1; AKwUvBz6AA4xVRavc10iTqBFwV7XsiD7mzmd2WpjVal5y4gSblyspU0/c50fD9iTlZ0dzYWvuZwzs8hg4LexV5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVOgLTdtzfTy2fmmWzrC1oPu/LmS86QGwzyFQ9CAeLBmEOaGu5
	1mYn1psJjjn0HidEBwRfGrF4yGeSOP+gHKPR7wDpKWwKqYP5Yo1HPqBv
X-Gm-Gg: AYBFou3/Yt9n5lR19ptqH47U2VRVB8zxDIHVzDCkqQfoA0uqaPUvlMwitlRyzciJOU7
	yJyUWuDuttEYBis99Vn75rualUgAscTX1tXeQkIB6iyPwG+e9VB/9TCwW1tJJ8OO6VsUQp1YV9+
	/v8F92OoP+PJnQ86GKRDt7Jcoo/k8V4NW3hDshAEsDxsSXjeeit8p5qnxFhbUsTv64PpGjozAQd
	zToNDIKOmSQXFAED2Dt2vQ4F31Iqc/08kEtcOrTFNUAJ7vuQy+r5aBi/6CZ2inUQf89y1tttxbf
	XHJstzcgQa3fWkpeVdyE367z/uieyzwZl1n/MVxOebXchDKmK8re0EFXExhNLUEvGDhmXsOUisP
	gpf1yk8d6YC5IuiTqlJ7h9Rl9koP+NsFwX7yQU/Xv2BZQBr3emjeSfa5Nt3G4viczz9HWDagHog
	63MYbU/R72fHTaiSPBQudEBTI8+E5HVNd82vLvDQ/DBNYii5drxHgbQD+tHWxR6Ui34Zo515Nmb
	bRIv9oNbfnEGR8OT0HHYSOgBWF5LZjZrU8BvxgC9H2ZYy1pGtxJENnHFmIRuVgS8k0TVAk2e53w
	x4T/3IWBDVXmFrMOBwl+khgnEFuvUUeyKXDSoSRqQYg5KFB4B6/fjRwN706l0sW0xGNbEQlNia2
	D76U=
X-Received: by 2002:a05:6102:5689:b0:7a5:391c:37ac with SMTP id ada2fe7eead31-7d072bc752fmr2816224137.10.1793457159749;
        Sat, 31 Oct 2026 07:32:39 -0700 (PDT)
Received: from dell-pro-plus ([2804:29b8:5080:dd51:39c5:770e:6bea:512e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69a459e2sm5946577e0c.1.2026.10.31.07.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:32:39 -0700 (PDT)
From: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
To: linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	sashal@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Subject: [PATCH] docs: translations: pt_BR: add init troubleshooting guide
Date: Sat, 31 Oct 2026 11:32:16 -0300
Message-ID: <20261031143216.70219-1-ic.gabrielribeiro@gmail.com>
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

Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
---
 .../translations/pt_BR/admin-guide/index.rst  |  6 +-
 .../translations/pt_BR/admin-guide/init.rst   | 58 +++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/init.rst

diff --git a/Documentation/translations/pt_BR/admin-guide/index.rst b/Documentation/translations/pt_BR/admin-guide/index.rst
index f0f096a74..cb5a64f82 100644
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
index 000000000..2532c07c0
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
+   necessários — como os de hardware de armazenamento (por exemplo, SCSI ou
+   USB!) e os de sistema de arquivos (ext3, jffs2 etc.) — são compilados no
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
+tão tranquila quanto possível); em seguida, envie um patch à LKML.
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

