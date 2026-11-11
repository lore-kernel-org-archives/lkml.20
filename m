Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412169;
	b=Un2p7Hzw3eM2/EokndgdG/dZMXlFOjRe8cbs3nMyE9jnQo3PKxTnF1NXLor8pZxSJq88
	 uD/npWzOiOD2dI/+GqSUnc5VdLrr0SK48xzJTh69Ez5Ajate9P7NgLHrnvJBhqq62ctRq
	 cjwFWfyZ+aH4K/ITPwH3NYvWDgsleFzVBJfBASzYB8OW/wKGLHOAn3H3wIfaXmFOB8ZUm
	 TSiJevYKidg/Dj0XJbhQFeoD3+BDdYY7mQ9xIDRf8oTe2hIkm3bOy+5imoP1Jl3mUsw07
	 kpNlU2XGxN5opPtYS3PedLpIoO0NM0gb372tGooCER9BVhD1SjK9jGzoQmB/whC/nug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n/olX1ECWtvPiVGgVf9lD7wfSWXuiytEwuoy8qrBu+8=;
	b=fJW7amxGldYuKAvRgILO5OQ4kSu6c/rBGjAsCWHzyt5L9gWoTSTgcAhbyk+aV0gfUAJm
	 HgMxuLkzeVUjMyg927+zwvVrveMMDrO4jj51QaWHi+rhTSgLQcBxnmJFwbydqhcSVuQeJ
	 Fttt7RVwtBTsdiW7lAO2C3SBKSzkj0kKQvM1dE1bFPLXHN5FrLzd4teremLfgCjuSoVb9
	 TeD83qN5e9FQheTBASgCEd5ODbVnQRF5ca7+ANRwCVj3SN6kW0TUisl9ZbQEpnwDBgwq7
	 JsIvZGoShOI7qoclvIgHKPVA77ZjpQU/cr9H6XVDSg13h0bCy77Apde4StdCp73pZNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GAGT8040;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C97606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C97606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GAGT8040
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49a92144733so190328f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412167; x=1795016967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/olX1ECWtvPiVGgVf9lD7wfSWXuiytEwuoy8qrBu+8=;
        b=GAGT80409r73P6h81C0u5Eyt6X0rO1CbijeUu+GcfRIrY37ldvO3eFqrhb6OpFG0kG
         IsotOIJUxzSgzCnLl/AytmV1hBwpDMphZ9/GuA/iZOzn3zgnNM/A0v3VuxiM8HLaTfQq
         K5ok/Vq0ZyiYFbTh2a3GPtMpSh/xY7esEZY/56cDaJbb+kUVIq+8qkD6kc81uYlL0+sL
         ZFbwxorzKP4xouD6vcIqE54AnhxbX4DtklF5oDo36zxwn3VoDQEpA5DMXsENVcrE8twl
         YnQ53qADIV7heL5B3IR+I1+Do36QXonUr0osjTB2Oam8fiYd4uxFxk42Zf7qQMIsw7fi
         oTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412167; x=1795016967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/olX1ECWtvPiVGgVf9lD7wfSWXuiytEwuoy8qrBu+8=;
        b=jyCPBPI8QTuwW7kg0Xac9q1+UT86H0QUuRoLE0hDbYVK9z5w+Jfb1MWbDL5sfMA4m1
         li7C1m3XvnheNksQs4WvaxrIfvk/YakPeCQfVXgpSluK6jZiULoCBa6eVSfQpPARTC7N
         aNc9calKBAAtrgeYPGMryUII8oHGLS9FFeEQzq39Nf4TDfsxzUQ93PZvZsU7iGgc+3JF
         MwUH5O0QhgprhPSAnVD6VPA00lgmDtSf7bRClkY9ignIjl3AjVAVYC65eVtg82ejtR+u
         4a80+iTjb9GDtWSXCAYq/2tnia3lXZWRj8xpTa9RfKU8tVj279mLFqOx66vsZ7JxIHf4
         kIDA==
X-Forwarded-Encrypted: i=1; AL+hErGlTEDR+GZ7BOXS7TB2tdgUT3C2UALUpbg1aU9hu/4Er2Kb7vc+v7k/qwE+UXqQZDf/9HibKaVooOBChxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NFFhS2py8P+NiSo6fDlf2b2vAMhMVPYwd9mOGh6o3h4GQ99W0
	WhfwV1D9HL/zeA8L5EfatNNMH3TmBrcilDAipF8OXkDY8iCQCbylvSqQUJGVD7VZIxc=
X-Gm-Gg: AYBFou2Zo3kVOSTIWh7sW3UN5iWIcgftv8DNnS9bPYhOTUkZuAQM4vXyvEkJZBe6DzO
	qM1s5KzQjDxWb7QyQ70BqNn9OI5kMcym51rX9BPoeU3YMmBB+W8VlzzAFmjjiyUXlWCXIgDV2OX
	n/JV+UVF3pdBEZaWgPwt/f5Wy+1gDuTxt/wBLbD8yBjtfA/p8M5kvyEKGUY4H/GYaSwYlW9nHmh
	Mj9NPoERG6U5qz3nKqZS6e64CcPCaqkhbXTRDcXy9q7m3BEu2I3NRcNu1Tj/z11dKn0khYnAcyO
	gwBx3SkV3uNyEkdnHgrM47edEv1XuNsdBn9x5Env26bjSDibnaEO0hmv8kbOVjapTFPCONcdwVA
	angfVR1F/WQc5g2azpWOjM82/uAudwZ2jCZzOM+65WtxlDUfgzg/0A/9Q+qwjzhWwwy56jBUY1n
	WbCEE8GgTg0pImIXTA5O9Yw0t+vKFCeuP1UwDRFJskSoKZk0QYGBwph+CbtzziOYltOuoezYTtg
	Ob0S4p0tIYARguf7MwkaShCS8lmt1kXJP+l9tmT5cY2eFVMS/G30jAllX/Vj9UfffKDwhackOIa
	0kwmf1GpZ/Smsu989SKiPtAGoXnQ0j8=
X-Received: by 2002:a05:6000:25e2:b0:48e:68da:1c5c with SMTP id ffacd0b85a97d-499c764851dmr5225541f8f.16.1794412167157;
        Wed, 11 Nov 2026 07:49:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm6728921f8f.2.2026.11.11.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:26 -0800 (PST)
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
Subject: [PATCH v7 05/17] printk: Do not accept an empty name or devname as a preferred console
Date: Wed, 11 Nov 2026 16:48:04 +0100
Message-ID: <20261111154816.71103-6-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111154816.71103-1-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com>
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
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 898e060a26a7..3ddbde5326d9 100644
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

