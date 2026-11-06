Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985681;
	b=Z4XbMyanzGK8ZODPEPvTnE5oWEaxCEG3Yqng+G2pDkShRHvBhiCbJ+87lGTe2L/oGF15
	 0O4sVgLHtRt3MQovH/vrWoKQGy667hNC7HqVkm7088pL9wKQUcAGIwYiPGaMKe5uy7pqr
	 Ygs6d/WHa6Y4oJgd/49cDi0Uwae0ObHNtPkXGKIvn17Wmjcv/oZStbBw4E2QGQZlFcAEU
	 gGwFezGGZdweb+c8hRIBUuBjClK22UhczY4uyrnt6vT05Efke+DnTNaN2RkRRaLG72noC
	 Mrg0+qKYYtIo11zdbbhYxutwKDSihYeAjGGj370U5e+y6yKBAC17veefkUj87dqObbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Ds5XNs2vdMGzsPfxJIaAzznKPyif8n2Gl3srLqCN/Q=;
	b=2W/nHix2LvDZHwEkJhzLSvGsqbt9kvyGsUzTkczhLrSCwtfWwoOqPYd1/Ug1YhHU6sXN
	 ryth6CzGcysRh6wnLdR3nqZmNUvuQZsmTSooxGox2EUKNA5TBBRIOg+5O2kNAQq7Q0GbF
	 hhuHMloOZlbrWI/jb6ESUIjR7qgqEGXH00UuBOK3XLgNsMgjiBxbEki+Ai+BTmKB1Fi2k
	 l4e/3BvDcxps0bmuXAiE62A3HZ7W0c1UyTuD5jr4FEw0UCBiaq2ii/Afp3abYHklD6Ax0
	 RxygyfZ1xioVwmp/+ww3cQk4wLT5+2vXsin+FWoxV+HfGLhnrbt4zGUgvJb1iwm5zZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XzmENrD6;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D94B606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D94B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XzmENrD6
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so7476745e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985679; x=1794590479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ds5XNs2vdMGzsPfxJIaAzznKPyif8n2Gl3srLqCN/Q=;
        b=XzmENrD65kNhq7w3khLERYg6ZIabHS/RSJvtkydu/LTsRXA/oB97ad2x+F2eJNgzjq
         nGxpiFXf+3zZTvPniTw0F8LR6vvJ24zafDsffZQ0jCgt4eQNJuzYE6HHwzMHDOItYZZ3
         T1dfjilaqTv2q2wohvUFEaCbrEb4di3A8LGHPsWVmDMWY8TAid0ML3SyZQ5ATj3ls2Nc
         D1UqZuysp4geocEhPdpTv+0+pUZORbMA4R2z04addIuucBWmP1YZmh8EwULvHUReMU2k
         F3QMsE8+Htngl25hNznAWLu80sj2sc01nF+qzgaEwV2SCnNQ0ZStai/hL+OHzeRMeiEB
         lzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985679; x=1794590479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ds5XNs2vdMGzsPfxJIaAzznKPyif8n2Gl3srLqCN/Q=;
        b=Bam+E8jcYSUkAKRJoGeKiYpin4mDOmjDG6Xb9tX/w+XTw/AckAsdSPzrKa7sedyDAu
         n+L8bwvJPaTRmisab4jhvkV68ZH9UJaLRjJi5oZH6+lg8Qa9dQ9vuOUhcrvUDygIAd7v
         Sgp4cqv3D4UlpYe7QbPKvjrdlg1D34C8bl09ieu5N5HkncxCSJCIw/K9RE6DS+YRdgy4
         znpuPgy4NEEgRb8xQVvPqOs3O2KdyC8dhsG+TjHvNZ16p4fvNvvi+aHvivOG/+MsmJa4
         mz9bigjhKa7XhUMzZsDMxnYmMQQEF8kbmerKNOCt19aN+qLWzBc9Of0tmVoyeiRGpItf
         ia2g==
X-Forwarded-Encrypted: i=1; AKwUvBygroxUZcNryw21BEPJ19Hqh/li/4tmXtLuUZW/XmnfnWBwBC/cGNJZVTm+ULNQAlRuUBA49Bb3BdZ0ciA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/keCECHZgs0Q/LfNEbn2+vgZpub72Vlo2kecaorrnWuCHajbcf
	qlhx4BJrxw7/5USyBRYTRNEY+xi5z/CDiI+zG5D263cMhfs7+uAef/8//OdVoODNqU4=
X-Gm-Gg: AYBFou10xr3Jqm8vRaPwm3asUL5OfR1g2eGwrcU7j67NtJAXYQVgq1TOUgCS0IQYAU4
	vo/Msdtgjv34usyPvA8aqhiEJ9ImtXpv2i3VJTJjRUsEdQ5HouYA2gDbtMNkAwyTmGLhdGha/aU
	IgIGcTFc7t9RHzE7w6pDQaValC7XA8H13Ba2boh79br3B76b9AU2+2+MpLZxgVzxaDsgJJsE6BW
	8XI4TOvdcCQ8cijUqWIo/RP6StgZZljnKJnx2uR1lZ6RxqThuWogfZd9aViPkGgK5h/pHtm0WfA
	NvCB6s2WWPTX2RBcxunRH/Q09Y/28HzlMaIh6FDRd/DT45mHy0E6TAh9GMq4zjO/dXHgwdV6k6V
	oCN+vX3bjXvHgKJjzQ9V8Q/ljrnA9AELQKU2xpIUEuKZ+s5JuXMJZbteR2av2IkyWfzbmnfoMjy
	VbsyokR3btIpfaQO9MejMoozdbk4By23FxMTBzMUUaeA7qyvADjZiG2XCw2R/nRMBUUlTc4QUkr
	NxdEfBMSRAnsRf1JZ5QUKY6hSGWVmeKKfTJ3UILMYQ6zdtWy3D+ggVAy+EqML97iX1H/cjdT9TV
	ho/gHsQVDYXsnk9LTY2BX09/fnlybkia
X-Received: by 2002:a05:600c:609b:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4b6ddee327bmr56162785e9.9.1793985679494;
        Fri, 06 Nov 2026 09:21:19 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e24012c3sm68262245e9.13.2026.11.06.09.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:21:19 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v6 05/16] printk: Do not accept an empty name or devname as a preferred console
Date: Fri,  6 Nov 2026 18:19:41 +0100
Message-ID: <20261106171952.207909-6-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106171952.207909-1-pmladek@suse.com>
References: <20261106171952.207909-1-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code for storing preferred consoles does not expect
the case when an empty string is passed via @name or @devname.

Empty console driver name does not make any sense. Avoid handling
such entries completely.

Suggested-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b7543fea865b..6bba67e142e1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2558,7 +2558,9 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  * The function adds or updates an entry in preferred_consoles[] array. Also
  * it updates some global variables which are used to make the right decisions
- * in register_console().
+ * in register_console(). Finally, it enforces some rules:
+ *
+ *   1. Do not accept empty @name or @devname.
  */
 static int add_or_update_preferred_console(unsigned int i,
 					   const char *name, const short idx,
@@ -2576,6 +2578,11 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (!name && !devname)
 		return -EINVAL;
 
+	if ((name && !name[0]) || (devname && !devname[0])) {
+		pr_err("Adding a preferred console with an empty name\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * We use a signed short index for struct console for device drivers to
 	 * indicate a not yet assigned index or port. However, a negative index
-- 
2.56.0

