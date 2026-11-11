Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412310;
	b=j6UH8SBC3mpJsu0jF5l3vZ1xqnHFvIV792xOHY0Q+1RJq6PzIzhZFlUOhtOuuHD2KnwE
	 n7+MJymDte2uoGO8k/JWDP8nokdwYDbf8ynhumwd1zZhTZYAawgxsVZXXLKtX4vvmtTrF
	 DqregZ5Dyc67Sw4igw2WccAWN1CSQC8cPn2tssnd0R5BKq6mrEa4kJrxy3R3pqhoBsSxD
	 uLH+8Bqenu10CEWx/AzTGTsUKc0uksNGS09TvWOF6FpvT1A3nreSLT8yu4W3YjKEkDRtu
	 3Hn/eiZfk8RafFUNABKk8hHKoCD5XbbQZ6acWNDje9Rs2zpjhZA+zsuSMjEAs+ImoaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WK6lzA6BtQAoPjsYzKB0b1XZHfDTPG+t25fWV+Iu+pQ=;
	b=3QXYf3CkUxlAsRf2xTOvgACRBeholbabwYQ3ifxiMldW0OaFBESsGTNmLoi3lxcL0WQE
	 AkH/kXqWYUywnJ73y6xKLNlGPkfYhRYn/SSmUTky16rUb2ZYmB1NTlF1v+Ttp7lIioRy8
	 23xiQVM7O+nVGBhyiQ2n919uXlJcY6am6aPP6fQgq//cu+d8v6KA7j+ETzWCpDG5tVyEx
	 +TAnIgCOzEWSfMBWQj6F0WKl0H0mWoqZEXURwhXSKSEl+m78DOuIWU+ruRQ+VgVsOjmaO
	 T4vR0l/qctcngcGEwjMDdD7xfuXB4x00hLRCeP4Xk1vtzt+3CZVJNs989B3LYUok2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LTOkkZ8C;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B59606A334
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B59606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LTOkkZ8C
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so19391625e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412309; x=1795017109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WK6lzA6BtQAoPjsYzKB0b1XZHfDTPG+t25fWV+Iu+pQ=;
        b=LTOkkZ8CXnZX2nFMkzrZ5Jlt+V4b4e4lkab1Y17FO+aXNDvRTzkOnA5KXK/jgDgYUY
         G9OjaIIlNwaOLgT7yXrNy1D8nW7m5LNb83PryLNae312SpOQ/kiZ3bOZARENZuv6WMWw
         kep76E7Q5LJwYJmOsbjcLDK+sOFaZIAAl1UVeJKNviLdPefzjf5739euNPrih5rzYyST
         J1/AO0fOZLqvzYoPCT6HZC9Ll4SeWDepsNGxOGjUFOpx70SQhqBYjaq77qtJy7BxsG47
         J8TO0TrFCl/PuFrGWsSF2ccVFwM83jX9BtfivbC7AcinvlxEqx2doWLt8SVTBml22tQ6
         BUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412309; x=1795017109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WK6lzA6BtQAoPjsYzKB0b1XZHfDTPG+t25fWV+Iu+pQ=;
        b=mAmHnqcFAihcReTF6ae4nHNZ+R8JJbeIDDs/p93+jBWc7sNY+MyYgxKDhzCzwiSp4g
         hpQH1Obq9ryIllgYsPl030ayxJLGcNwL6wc2u/FonOTMo4NC1czPkZSPVYpSAssIIt1k
         MGaxw3EJI+dQbEYxpv6ahJFILhQxV0pMpASZ/9LDBTO6lVQE6emL9LYo/Q4xKJBEFvx7
         8RCbhMZXU9a+HorllTWjz1jLDRWDs1v02LoZLwhJBa1mjW8WR5L9/Mj4i6hDwqTO0iAP
         6saGTHHwbmz1eMUO+anUTfn6KFdL0zMUItUJVktrW0D29U/xWVNS/6Qu7nsSzQzD/gAv
         pSjw==
X-Forwarded-Encrypted: i=1; AL+hErHloJsNL7gVsoyEh3n75bljfDLtfKem2Ky3iqnl6VW5nxDUGHpe+XRWH6fM3yFssJvghjKED6285m5yFSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A5LKoCsJCof7hu68Ufho/9mLOCgScIxuPsYvV6estJ4gM2xFz
	Odan1tsP2zdbjg9lt9DDKNilyR/MmpNQOc5Az0AUUFE4iVgn5E6MjOxsDvo963fQU8w=
X-Gm-Gg: AYBFou0ux/62g45R+kdWzrgrBunWZS4DIDXhAxSxzpXJBzVx841BgJo9XSx4SFe5BcY
	SoRjzt0kXAkQBry1IlGgiyfqR8xrDK4oIV4E2MMCNTpzbFLXc4cM9A6hfv8jdSjUc5eGYNLlQz8
	DJ3SkYNNlwR0Lhdxp4VS7JcKjvR0e/ng630oAW46FykAqA20JbJK11JGR+p0hnAa1XKMH9cX890
	5tKr4o42D1Z8d0/NOiU2EUeXES7Xo2jnNQuLnjjCtbX2dOGnHMVLf5UMD9CfFA9xxPVAr/mvUX4
	9lDWMTiDQvHwNv3fHRYm54GOdlR/Gcp0Hd/3iOEM3/eyg5vNor85bpS4E5IfyuI/xtYAShPhFv4
	fTHRKz5C8rf70gtVf2jwllw9c5hq47DnH3KQ0S7Xwpd+vZxnzT4aSGwEBrsia0SwNbeDeIQV5Uu
	1MlsgDYzDWOQd0y49ZYmyyYYB0GzNv2Damvi8e7NrfnyOVxQ7ThU7rilJh1w6Zlyjy1KoVImPSY
	pmKKflYKRZJlVHxK7hTvKNGMf+yz6f/cvTr7IMuPx/H5in0Qg6CJ9L/p6Eice7ks1RQi6FqIhd4
	lj5+1aGBfR0zeHSakBZJODWBBEunuceM
X-Received: by 2002:a05:600c:4f4a:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4ba0938a45bmr62021835e9.14.1794412308798;
        Wed, 11 Nov 2026 07:51:48 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5553casm5187795e9.14.2026.11.11.07.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:48 -0800 (PST)
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
Subject: [PATCH v7 17/17] printk: Try enable preferred consoles only when there are any
Date: Wed, 11 Nov 2026 16:48:16 +0100
Message-ID: <20261111154816.71103-18-pmladek@suse.com>
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
index a261749aac79..f64381e44977 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4105,7 +4105,7 @@ static int try_enable_default_console(struct console *newcon)
 
 static int try_enable_console(struct console *newcon)
 {
-	int err;
+	int err = -ENOENT;
 
 	/*
 	 * First, try to enable the console driver as a Braille console.
@@ -4144,16 +4144,24 @@ static int try_enable_console(struct console *newcon)
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

