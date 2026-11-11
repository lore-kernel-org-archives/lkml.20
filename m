Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412298;
	b=cJ9iIah1z1vc9hEgPuvuoIntlCWT6hfD8KKfe5Xb9i8Jj/igNu8dJ8ysDUbFxLw87opM
	 PFSWMsMZiWQYCK/5yszNS/CMVaBQay/S40A6ywUbQs+tuTOLfA70OJ5/K7aUjUUjfEFzJ
	 sA2TV34ZP3InjXpGYCAGAzPTkKzUCj5aIeaVynAnGEChU+wn8gQZvL2tqYJuBHgDdeKxF
	 dJYwiTbVAOhzWD5eyl1HSnbBWb/lpGTw+oZtu3mHlMqbK/MZZMT/cVaKM7cEnvABfRHv3
	 vwI48voBOtSHNzCBkAqRIlQ0LniffjbkwdoEXjXqVPMSjUkTdsVqTWoCFDsNydnfvug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WUUn2/0tnoLN6C+OL+LWLMgnH08f0bPQiH+/0TV3lF4=;
	b=BcZvPpzXaau3rJmDlMdYB5L+J1i89ygS4nOEP6MUlOI/n6j1jcARxRFnLIptsHqEae3X
	 YmUguXwCNZEuhBO7qCbpx/2jMcA+i4Bne36eHtVrMlIzs/bY+mdnoJ2QR5/LeGiy0oX7R
	 nYnnqR/uf7MC2A5A/DDeypGHzYb8Y9vDZAjpr9MCF0/vgm2jo6TjyAbxJf0AiJDycvxH7
	 BU5E7g4rxc/o8S9Q+4i/ynTOcX34vP/P0J84uAhBjpMcfWwq+iMtmR/s+eeNewuQLfO6D
	 FX8Ue89tDKl1sZgXCBaOk73kaEvRy1OK6gMzqGcUecJ6RJzLb0LH4szsABjonu226eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NWnNDbVD;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8E2606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E8E2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NWnNDbVD
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so37156015e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412297; x=1795017097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUUn2/0tnoLN6C+OL+LWLMgnH08f0bPQiH+/0TV3lF4=;
        b=NWnNDbVDRGaEPxVg/GXzOoNPEZjYdWdoVhOHsXFmZ1X2PaNvpZ61VujkRhvFRnNOr2
         S5ROxpUGv4E+EA6z8WQIFi2bd8KjO8qHXgFZtMrN7Tr9xpz3JdaJM43yJ4UycDNpLOXn
         /UoRXeYjdLrco0mebBOSYINrUOpj/7H0QK5M1zAA3Sbc3/cxz3IrEafe+ehnX49XcVm2
         6sv64ad1MMAjoQF7GlwjyfClqBot8t7GncerDi8vXPV+UTTtOsOvm/XSjPEoGEO8pQwX
         Yr5c0c67K8Wo3Xv/KMHFo1g/pltD8AesQny7El5a38BfYz9NLb0Kq3ZqLbuUGYCP56g6
         hj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412297; x=1795017097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUUn2/0tnoLN6C+OL+LWLMgnH08f0bPQiH+/0TV3lF4=;
        b=X790rpq8COGnwWIcEklMYeqA5ApcD9CGXEoCU07U+ARxZzBjS5EgbO+06H6melpHlo
         1z4peQH9TCxTO2CVYKZ0Ki3jyS9wPW0aa0TlO09uumJ7rpJiQGi78OFciW+Juwh/zpx5
         zfkw/8OBWHRIyeKJGnHw1HTv2I9tDdkKm1IgVUlUIG3WLuFzLoQbQE7/pPIe7ZOXh6Kk
         BBkFzR2cUr/g6ZU8gA0KLw7Q84iukwHW96q6U/pqFn/d6BIBAUrdCGK+/xmIWxgtNzXs
         /toq0dSTvTaKWDTKtSld+4BEBdTliNn7ZKQKZo1GPDuvC3tpghUElzOfLePhtugxLN7Q
         3JOw==
X-Forwarded-Encrypted: i=1; AL+hErEo109JNIK4tWy6GGEBjbTwKLjOFWQRpiLb/JHliMzauBw5yfeAY8/IVFgq6aUchowNwylVBCqiVJx+Pe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tXzYcggNVPUAmXlv6YqKOGwEHcFZeLcA2TEIkpUGe01PBrgrr
	9X1I/eD8axTCGH8B6rvXo0mTL/cvu2P06wd5RcSmMKH8AvgDY6pi2HExhKwGcTUkQJg=
X-Gm-Gg: AYBFou2n/gtbDQ1p0d8pREn+FQYFigH8lcAjk0QwWnHpt5BzPEH5VEOizpTFi9g5Pvo
	q8fTRWj2/TPEA7a+1JhbeQ5voENBe14Busi9KF/bbmJuYPjnXnPGeiGbDbvlMT5v3qScYxErYQp
	s4zcyltiNu/c4HAR+myLyfeUnCcjJjmKTOxWqIYwPjq0HPvMRJZXyXo3yIS+zVQdjDnSAlRIedS
	7ONyFNLJX5xWpXXKIhgxjBnhsH7CshQWBCj0bRNbgh9RkjSa1CucZXiz+HjATT3Ew02gudbVTNm
	uIop3yJSgAsnO86bLKVOMcQo7QoggRLBLa9hE1yzYVQErzJphakuadbis8GHxN4vi2Io2r0Hfxn
	yrAbCkwzCO8yvPt1WmaYTgBNPq+oizHd3NC4JzsaRbPMjtMDj0n2qUyRSP+FNhY2h4qLseoXJzu
	XlbQ4PMWQDOSue80enPC6iSUtcAvYYw/17CvICM6DkbHL972JvC7z0pfAorcE4kchDjFpk85+RO
	UJWegm2A1qCB24WHXrSIglyW17Sh8BWWuiXCZMDnLET6whl/J2UKJEVBQ5pDtqInhPi3wgTomM9
	1L4jlgNLo1cA5V5B16wQNmJLYQkWo4Y=
X-Received: by 2002:a05:600c:6095:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4ba09381439mr54276165e9.15.1794412296743;
        Wed, 11 Nov 2026 07:51:36 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm10312105f8f.20.2026.11.11.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:36 -0800 (PST)
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
Subject: [PATCH v7 16/17] printk: Modify try_enable_default_console() to return error/success
Date: Wed, 11 Nov 2026 16:48:15 +0100
Message-ID: <20261111154816.71103-17-pmladek@suse.com>
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

Currently, try_enable_default_console() has a void return type, and
its potential failures (specifically when console_call_setup() fails)
are ignored by its caller, try_enable_console().

Modify try_enable_default_console() to return error/success, and update
try_enable_console() to capture and propagate this error.

With this change, try_enable_console() will no longer return success
for a pre-enabled console if try_enable_default_console() failed (such
as when newcon->setup() fails). While this might change existing behavior,
it is the correct approach to ensure setup errors are not silently ignored
or treated as successful registrations simply because the console was
marked pre-enabled.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 60a6b407155e..a261749aac79 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4081,18 +4081,23 @@ static int try_enable_braille_console(struct console *newcon)
 }
 
 /* Try to enable the console unconditionally */
-static void try_enable_default_console(struct console *newcon)
+static int try_enable_default_console(struct console *newcon)
 {
+	int err;
+
 	if (newcon->index < 0)
 		newcon->index = 0;
 
-	if (console_call_setup(newcon, NULL) != 0)
-		return;
+	err = console_call_setup(newcon, NULL);
+	if (err)
+		return err;
 
 	newcon->flags |= CON_ENABLED;
 
 	if (newcon->device)
 		newcon->flags |= CON_CONSDEV;
+
+	return 0;
 }
 
 #define console_first()				\
@@ -4135,7 +4140,9 @@ static int try_enable_console(struct console *newcon)
 	if (list_empty(&preferred_dev_console)) {
 		if (hlist_empty(&console_list) || !console_first()->device ||
 		    console_first()->flags & CON_BOOT) {
-			try_enable_default_console(newcon);
+			err = try_enable_default_console(newcon);
+			if (err != -ENOENT)
+				return err;
 		}
 	}
 
-- 
2.56.0

