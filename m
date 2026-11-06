Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985809;
	b=BHEE9C5TaVJRUVTnKtQBxGKvQrR4hURtLv0GZHg6SzBC6yFbubabztSCZ8LBRtKDDxJo
	 7V0O1f/D9fV4aHYh2ofRPlSBwNSS8uBUBSfivz6m7HT/7frm+4xLfJAqphdIDS9IROnXQ
	 t1IdtBKHOXFaIBH3R85YwHEUiHJrqHOsPup00RarImMykKnlU/dghJayu0AxVUfMUdrNC
	 mcdjayIFl5H/fwnsVQVCfULDOhxTO83zSuS5OUwXsp5bk/keXJ2UVJJSke+CPaBw44LzS
	 KSBJtoDL4CinCb+uTgiErM/Y7XHBZeGuvKfdN9G4Hk2+Ak5UKWB2Bf9p/rlxSE0M3tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6JDFravyo9tiimlPgL8fBtnbINpZklV8LFTh0nIuThY=;
	b=5mtRrvr3migziLJPx7wyF+tEuUTx2mnRjicAsDRlDdBTDJppeY3WONehHysAJgeqALCB
	 DkV+UkNVnPC29uRNY1cOWPLqYEc9HBgpo4nOFKuTZ7JnUbRJ6OJxUjG9PwnGQVwc3Fj0e
	 8XhhOJaL9ADZQREmDO/3wIl4ISkxpGD45dEcb4l0s1tCV2y3G/Ok3JcK8iyQfrWaM91pt
	 IVTHr7Vanc4WFUAH9+ua+GKxb+WiYwL8+sOhz3ZnLEp/6G2yxr4F73N1jzTZta0IQ+1wE
	 TkJSQX36zAz5CApeprfdNTHq2zkiuDYSMjbA9JN8iw28mB6Wo7BzCFsfS4w5FBhQ44g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="E/14DxFo";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA2A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=E/14DxFo
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so8379465e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985807; x=1794590607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JDFravyo9tiimlPgL8fBtnbINpZklV8LFTh0nIuThY=;
        b=E/14DxFoV5fh/OeeBoAbPZ8SZzdGM0l0TN1ZEKfrEhOIS74vcEs1IQWJTA/hFS7JwM
         JcSdwwk+aQWD6fa4AvPo+0UOe4DzE5czLBGIw86JQILInaccwF+6i1ps7yu28xfssy6s
         TLkpHxf1r5wDQOx26kRoqPCJTlCV4TARYWgbTv2QfiXChJgJ0fM/gUll+t38uM5PrHQO
         Hq3osBdOvU7P0B2T01O3EK6wGXbno6rbEXCFXooBEzDeVx2E6uxePV/ZZce8vSS+IzUQ
         quD5tEFv0kbMu/H84B/h5hbN4AlWkLFlI5pbJR0Pbk7bJxK7OC02L11yC0ccaf29rXaY
         ycLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985807; x=1794590607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6JDFravyo9tiimlPgL8fBtnbINpZklV8LFTh0nIuThY=;
        b=CHIwCCHS/3ZDb5vHBx4/FvjU3bXXmqwcSRa9Zf2lgfp4LEVWpw/iBC4RXoq1WM47Rg
         YEj/0GavRoFJl1cIqg0aAWEbBqVn7nvSB4ZeMKHM/rrEAqSyXuzYQtRskqKeZNZtjptr
         3n1kGFcfUYV51X/hOjce88o8vCj1uyCeu+txsuOEr0OWvoRTfcdqIyijzfvaC0ZC3O3a
         S0LQUZaHFCVQHZztZJJ7OX6dTU7Ca+yhcU6Io5MmykArvZbs/ywC25qzQVAiRDRcXkqC
         cqrex9zZ/Bl/Ez8tVU+oX5eXBn2WtCBOAkJjuDTRxPeGx4i14RvWx/1TqAspKRSo+X6E
         AyCw==
X-Forwarded-Encrypted: i=1; AKwUvBwtNb8mnNNhNJkBf9sRg/4Jy6DlhpGBiveLkgu3+9iMliupRgAKB4i3VjBqiqg9Twd/0OXKch1jxQKk/yI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EmnTuERfIiJBsxKW4ajzIkPLqNwzc+90XNnNyyuIE5FHWHCeg
	VnzoZQwtx4kZKSecebm+mbg/1l9fPMEEWJggQjALDaRltuOkv8nwiceVWQX2vN8ucDc=
X-Gm-Gg: AYBFou1dGKXESDIGGiea45PJvNS1f04AJUdp03jyEJOhscz/zkvv0xhjh3pdWqeACpz
	YWo0+XlHiQamL0b2iEXICTn2oJfnrQlYTt8UO2SLaTT9XpKaupSod7x2OotBgxh5f5T8XLbMFAf
	hjC1/oZm4c03Lx4VKuzu7vN6Em0K07i7SUOLpT/R2GvyeWJ3zROCak71OY5wzkBT1mFQ1bFJ8C1
	+oY5XLxE8i944CuCL+/2Xb5N/7W/FptOUt0d1mVOcXSZkX3hDnvCkldndL+W9uwW2dDagofmJYh
	S1EKO1Yc5FLxMlNZ4eEpPV/i2Cm7xvsjCRxlh4zGeicB6aLZaWQHL24Mhaj8L4t0xPDJT4DGqFx
	qSXAiWDDkVh1ynZkt4kFxoyl0QHWZmNY9PVizICmaacbMiBE/C62KkSEE2DGoWF3U0PmVBaBFd3
	MFe86hq6LGj6pzlUGSo9091hTScVBWg+FZk4XUWU68tFo7BDb8oVhYzU4J8wALYufM7ZH8x23hh
	2Q9mExSjr19mvzYyZ1Mwoc0CzA35XzQ2/hVtQ4AWgHd8nDuqpqXClYgHfReiGvJtPxLiNlr13gP
	JdiS28uwYF52mL17QWkTJ+GT9w0fMXk=
X-Received: by 2002:a05:600c:a012:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4b6df5e9c8amr60438775e9.15.1793985807576;
        Fri, 06 Nov 2026 09:23:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572caf48bsm168315435e9.11.2026.11.06.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:23:27 -0800 (PST)
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
Subject: [PATCH v6 16/16] printk: Try enable preferred consoles only when there are any
Date: Fri,  6 Nov 2026 18:19:52 +0100
Message-ID: <20261106171952.207909-17-pmladek@suse.com>
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

try_enable_preferred_console() used to be always called because it
had several hidden effects, namely:

- returned success when a console was pre-enabled using CON_ENABLED
  flag.

- enabled Braille consoles which were ignored by "preferred_dev_console"
  because they were not associated with /dev/console.

- returned success when a console was enabled by default because
  try_enable_default_console() did not return success.

The first two hidden effects were removed in previous patches. The already
fixed handling of pre-enabled consoles actually helps even the 3rd case.
try_enable_default_console() sets CON_ENABLED flag on success and
is later handled as pre-enabled.

Prevent any future hidden effects and call try_enable_preferred_console()
only when some console is preferred.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index cbbb9aed3e61..ea8516f93837 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4096,7 +4096,7 @@ static int try_enable_default_console(struct console *newcon)
 
 static int try_enable_console(struct console *newcon)
 {
-	int err;
+	int err = -ENOENT;
 
 	/*
 	 * First, try to enable the console driver as a Braille console.
@@ -4135,16 +4135,24 @@ static int try_enable_console(struct console *newcon)
 			if (err != -ENOENT)
 				return err;
 		}
+	} else {
+		/* See if this console matches one we selected on the command line */
+		err = try_enable_preferred_console(newcon, true);
+		if (err != -ENOENT)
+			return err;
+
+		/* If not, try to match against the platform default(s) */
+		err = try_enable_preferred_console(newcon, false);
+		if (err != -ENOENT)
+			return err;
 	}
 
-	/* See if this console matches one we selected on the command line */
-	err = try_enable_preferred_console(newcon, true);
-	if (err != -ENOENT)
-		return err;
-
-	/* If not, try to match against the platform default(s) */
-	err = try_enable_preferred_console(newcon, false);
-	if (err != -ENOENT)
+	/*
+	 * Make sure that pre-enabled consoles won't get registered when
+	 * something went wrong. This is just a paranoid check that all
+	 * branches above returned on error.
+	 */
+	if (WARN_ON(err != -ENOENT))
 		return err;
 
 	/*
-- 
2.56.0

