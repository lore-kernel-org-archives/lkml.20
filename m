Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412275;
	b=KiMlU2Lf3Feup2/pr5KfI0O7jsD7BvmJikZn6Sr/dwErqQuZB+LuBNqiE/QbvsAcs/3Z
	 CNl8k/jmEoqJhEoYOZpoHPXn+a1w+DFa91m0snyCNnWzDwH9NdQS2ZA13iY0CT9sgYzgO
	 2mGoingKy8u+HEusNw1goRA2kr5O+Prewj/FyaabaXFk2cPI6FqakmZSfmLfOlCgn0iWk
	 t1wKQU2sncvJ9zTNOmt1BuCmhEAv8YaArhp61AO03ocLmwZAATn81xezcCecrz70E4AeG
	 MbT3UiUo/6RgpymHI3mPrFVWZnBhT3tzzfQ+B+1yM38WB3V/tnJNpWxqis57QwKs8fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DRqXfmPntNeFV+vfVsKHl6lm7LjVxrhMPi2D6aVtzSE=;
	b=lqN75/dd6jKB0M13zgbXJZ0tPb7CQG9uVspuReqWRJEWvukABlJf/eXIBrZitSSbdi4z
	 9rvuBK3qwHhFdBh0dTaUTOobSO+c5djY8O+g5RJQRPQGiq07cRKwnvqFtpFBNXH5L/b5X
	 4lOAfvpgObqIFm9ni3Gj6KSS+GLrXudzautrS7qRJQtbMDW6HtSQrA+PjsJGJbiNO7zwR
	 dq8rlNP8mptrNAx91AslKa6QjoYQehU5xVjoinEjU8caTrd2trnp+dVXP09VwPb3ODoio
	 EiBSA96IoBuKhUIKQb8+sRgM27DpDNxkbLZz61CWsM/HAZ/GHyNO/kP/c4QvbpLmZgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d8RcQxor;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E77B606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E77B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d8RcQxor
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso25670605e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412274; x=1795017074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRqXfmPntNeFV+vfVsKHl6lm7LjVxrhMPi2D6aVtzSE=;
        b=d8RcQxor2jLn40ZO/Q34pvfHe39AT+dDt6syvn2A9RW3mFOo8SfPfWsM0H9Wxm6LG7
         wVpnlqTPquLfIQxUrA4FYMr/3cM8Y5P1Rwqlw6AhQYwvj2sip4F1WffTb2MA6DNJofzf
         fFsPP8qIBwgRDxbKwUVd50DERi2i/+wkmL5uiaVzohWM+VWPyPKMyU2lUqJSV/pZUnvW
         5T2HbHGBbcO9OV4y4lVc08uno6vFaPuaFWQTazlp63Wb2vOWYid0MwBnLpWWXoSbg9zH
         oBJuHRmkTIAcHv0aqHnYtWn/5E0C+9sMlubPy24LSHpqAxcZ26Y9YKVNm8vfy2wqqtaj
         wltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412274; x=1795017074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRqXfmPntNeFV+vfVsKHl6lm7LjVxrhMPi2D6aVtzSE=;
        b=Ke0LvEsQ7AE4JA8lCv826HHeT8Ogm0cEjn7WBTlG/ja+V+3wG2maMAhIDW/lI+0EXv
         EaKCgPPi7l0YTWEeOrXFqgZXsAQBFOI52V4RY3lMmUtT7Gka27FqqoP2D6B+t3vQkf6B
         YfClm32llgrA/CK8d6YynLf99f+z3qT9nYMsRngdcCTkwbQSt9zEw39M0Tc2w8A5kxOB
         9/ahndxksK4b2PFvLxnEwhwgZb0cPss3MFnB+5fCpDYDMdo6EJ47J3Pk6HYqNfrTkGXv
         mT5LplwBby5blgH8yNEmTfH66AExjIgovtcjTZtqhcNdbA0/QtlWWheLhyeZNU+Qeap9
         H1zg==
X-Forwarded-Encrypted: i=1; AL+hErHYdiCF4DpC9Eyq8lPb0slvQgsednf5qTjOdPVjC20EuTv2otGSWBBlRCuzGplplHB0pjaFc33OauS6Hj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jPeZAxvque37phuXqedDuVTSnPCBj0nzVP6hn1b2OANYOQ6QO
	0YRe1CKdAhvYLjsMwaDP8ECmVtrj0t4MVHQco351gFlVtbbigWYo949apd9ZGBS9m0Q=
X-Gm-Gg: AYBFou29N8lr47xmsTpLG62FVlvRY08ETmCGsl3TGSpTZ+I6j2dWfaFy+mXGIdonX/V
	BqVsIHnipYzhpzjEatNxUX8sor3tSthVUJWRna23SY7DKmxkhlc3wkYmWfo++N+QefY4E+2fF40
	X1SeEOIMUra+Xvn4cnfie63lRliNe33p422WCwnkyNz1OYsGbpH5xG6Fs097ac+GOAHJUbouRU3
	UPuJaZXbEDP2IKUuK/wavfT/h34kF15BHA6S9Sn7uYxtEJn33UuAYzCj2Ceu6dHgVFdAsm4DhKx
	1p2+Qy3okd40j+S+H9bPSRk+rBB3PaghFGGVFVymkmYQBIQZHud63l8Rca5imu3gkC9dLzgZdHP
	Xvw0BAIt1aH37hpUsDmN6iuKJ+Ung/wlBv5wskgTaLZYDCkqjBM9xRskWhMdnDCGloXJ1E1gt1O
	TD17n4+ZXOtkCWxRoRZEeRZTPPYxliXvH7QcOicgko1biTU3W7JhE7ov4lb94gCdNo0GHjqfXxJ
	MH2NMYoPm1hRP+ZjqDleWgHqG++CLi3E0+DG+17uAHmwEF3GPhaSX+moFcFTKuHFpheYplhAboJ
	Mb0bcxGBAhKm8hUzp+CIZoJJiax0LEk=
X-Received: by 2002:a05:600c:190a:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4ba0931ed17mr51546915e9.2.1794412273819;
        Wed, 11 Nov 2026 07:51:13 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f54basm4010705e9.14.2026.11.11.07.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:13 -0800 (PST)
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
Subject: [PATCH v7 14/17] printk: Update Braille options when preferred more times
Date: Wed, 11 Nov 2026 16:48:13 +0100
Message-ID: <20261111154816.71103-15-pmladek@suse.com>
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

The current behavior is not consistent when the same console driver
is preferred several times as Braille or non-Braille console.

In particular, preferred_dev_console is not updated when @brl_options
are passed. But @brl_options are stored only it is a new entry in
preferred_consoles[].

It is even more hairy because preferred_console[] entry is considered
a Braille entry only when .brl->options are defined.

Make the behavior consistent and always update pc->brl_options when
@brl_options are passed and they were not defined yet.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/braille.h |  7 ++++---
 kernel/printk/printk.c  | 12 +++++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/braille.h b/kernel/printk/braille.h
index e9790c28027d..7a845caf4082 100644
--- a/kernel/printk/braille.h
+++ b/kernel/printk/braille.h
@@ -5,9 +5,10 @@
 #ifdef CONFIG_A11Y_BRAILLE_CONSOLE
 
 static inline void
-braille_set_options(struct preferred_console *pc, char *brl_options)
+braille_update_options(struct preferred_console *pc, char *brl_options)
 {
-	pc->brl_options = brl_options;
+	if (!pc->brl_options || !pc->brl_options[0])
+		pc->brl_options = brl_options;
 }
 
 static inline bool
@@ -35,7 +36,7 @@ _braille_unregister_console(struct console *console);
 #else
 
 static inline void
-braille_set_options(struct preferred_console *pc, char *brl_options)
+braille_update_options(struct preferred_console *pc, char *brl_options)
 {
 }
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 617414d419b1..d1481ae6c729 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2647,10 +2647,16 @@ static int add_or_update_preferred_console(unsigned int i,
 	 * Historically, the preferred options are stored only by the first
 	 * caller who prefers the particular console.
 	 */
-	if (is_new_entry) {
+	if (is_new_entry)
 		pc->options = options;
-		braille_set_options(pc, brl_options);
-	}
+
+	/*
+	 * Allow to override normal console with the Braille variant,
+	 * for example when ttyS0 is preferred via SPCR brl,ttyS0
+	 * via the command line.
+	 */
+	if (brl_options)
+		braille_update_options(pc, brl_options);
 
 	if (brl_options)
 		want_braille_console = true;
-- 
2.56.0

