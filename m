Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7487C50E5A0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683745; cv=none; b=A3+SNB1JUqkXZTaQIKSvQySsaHdv80iagXqi6R/8m9YZqbgBoilH5au5fvw7a/4qcf6x9t/RJXCfyUxVwkK/Nz3B/6mvIBJnuTMYC1BjeoC65GpI0pxHAp7JL5ZWygTxNtj0aQmvbTgOTe1v1mu0Y7TpKJMK2/+fQs601paDsMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683745; c=relaxed/simple;
	bh=I3/amnDE8DoRLeuHm1MOHG2njV1/lhsxYl6Oo/VPG+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZzMT2KCpal4Q853EN80ys562aiWCahOTiRpls0ylpohP71LQu+qBitQGzGqbi1rTXKtsbXNQiJamny4MJADl5TFuul4KvpMm3Garil1uMNfqwAG2zxljIaUEUSwfb2sUkxa23iLg6FknnVSU8xpV4Ij9sTXN2aUjak2VUMNzvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EVaF3C3z; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EVaF3C3z"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso30427655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683743; x=1791288543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUAtVhRUMkO8jJF0y7IPH5eFVAMi6R59O56ArlPTDhY=;
        b=EVaF3C3zq4ugz8P540XKA3PqfGkI17WPhV8Znygc+vh0p2xfYA7+2bjtVfrr2r/yQJ
         Ogpi8+l6rq9pEPPpjy7rpJ1cUzFjRGygqLmK81hOXcbFzxWmkTmRQhQgu89/XTQWCrO/
         KQBtG5Zi67dBQpKMU2k6mQGXxdZgYIIbuMtxEdOQGseBZO0No8+3UxstxnsKPDqVWiXD
         q91BeEhaW+6urnxGNHkHnsYk77fB4WqlGYbvM2kYnHbdIXcz91C65IPOLg1bwpWRZ1nh
         XZW9Fq2FVnANWVvmaOTJv8nsY3FMck9yhOEbauDK53wZdSj086KpTPv59oHalGlH5fZe
         LeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683743; x=1791288543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FUAtVhRUMkO8jJF0y7IPH5eFVAMi6R59O56ArlPTDhY=;
        b=ZmPycs5tzrW5XShsYG+mgp9D9Avvu72t+S8+FyPIJWQZ12muiWz7vfaTCMRoOPXEn0
         Nbun+Ze1CNS0xpASS4IpM2n1fOSlydFMYwjXSv0n49AdqxJeAh3fl6aVLBol/vPTBYNv
         32aDIAm5AO4iZMMkia53tOxYaLF1Wyf4nwh0wMkqNCS1xgmb0aOVI7jKLuI0C87AQkTF
         HAD9B44F42X7lbEEEg4SlNCKlC2sSfGKSENTOmqawqcQDALYsi7HrqX5RCdqM/YCVMQf
         edkfC/L4eSQTWbPMsT1QSrkUAGZ4Y0QBHSaQp5jNt3koOKDdqexTZXT7cq/SMudBsaU5
         c4lg==
X-Forwarded-Encrypted: i=1; AKwUvBxFmHqkAU28AkmLzKy/qHU3Ww3tauIcEDErNB8WR9mD9xHeb8aBlh8USlvWKWgFQZO/Y3MZjttm00z39Pc=@vger.kernel.org
X-Gm-Message-State: AFuF++lusjYKRnsp6VqJwlQM7cqUJgrjvmDyXSEP32f2GLcVUMXqjpxA
	FdUVYhmGVgMyBiomCW+3oIO/qWPAk/jDKOP9ZKhM5Jgnyz9RnzsERoafaftyktdrINY=
X-Gm-Gg: AYBFou2idysxtwuWSO9/EJcar9gHu02bN5MEuKzERfazmTlG0msiiEzaTkPcRBYYuWV
	ke/XEpT6LIblIW7iGxqctagMTfOqibKuZUn5MazdrXJ2eQvJ9WBAaxD1GnpIVPX7hGp0P9P01W6
	GGIzQ0br1830+bov/eb+7fAV08p+8NihQ+RKkZYnb4jKJx3x8bhbysypmNGIY/pWECY+ZeKdNfy
	HWDgoMZPFXC4U/q0R5yhs9fvFVePof+cO0bsD0vH+g7KjwiNCg6J3zA7YCSSlF5nkTgLhGpp/3L
	/zh4MnKO+mH3O6MaMtuwcSgDQzsLC/gzMZtUQr0O11w7yPcj/8jE/jIZJmpfa/zb5wPBVFmR6KI
	kUkFItCUUOX6IcP60eV8XTIJW4yQfSkcTmM47niHUW9uIWsehvIJ6TgBKMkqqT7uAyWdBGDPPF8
	SAmCmiNbOXozHwcbesakw/DG4fWUX+BPCGacYD+GCIV5RxTvP3zKqQlbwwZxIHo0CxV2gC088iP
	rBUGnY=
X-Received: by 2002:a05:600c:3b8b:b0:49d:39:90ba with SMTP id 5b1f17b1804b1-49fe66c301dmr320985865e9.3.1790683742607;
        Tue, 29 Sep 2026 05:09:02 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d453badsm47404935e9.2.2026.09.29.05.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:09:02 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 16/16] printk: Try enable preferred consoles only when there are any
Date: Tue, 29 Sep 2026 14:05:46 +0200
Message-ID: <20260929120546.328616-17-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929120546.328616-1-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
---
 kernel/printk/printk.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 1eb749da9e24..06c49042dd8f 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4085,7 +4085,7 @@ static int try_enable_default_console(struct console *newcon)
 
 static int try_enable_console(struct console *newcon)
 {
-	int err;
+	int err = -ENOENT;
 
 	/*
 	 * First, try to enable the console driver as a Braille console.
@@ -4124,16 +4124,24 @@ static int try_enable_console(struct console *newcon)
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
2.55.0

