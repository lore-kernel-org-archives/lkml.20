Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B2351A139
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683665; cv=none; b=LHUWJQf8Xs2ZOySJIl4+aqqgv6keQT6Psr+MwRCpe+o6g6uQGeMLy9L376Zj97a5Ltzowpc0HYIfAUyuJ9powpjfA7jKjO+/w2KzRjWRbc/gBiV01vYj3OoBU8L88p6z5RjJA8Y8z+/PDoUVJmz0Z6i8n1SlYCYr/gnwBschDO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683665; c=relaxed/simple;
	bh=kBDmS9ScXYh3OceeJDBOuIN+LbxuDIjfEfFQxBN3uYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o//fRGKzUlStwvrt/YTfIugiUXbq88Z8/Bfzlx+ViK8MITWEBlCEru0cqAIaaqC5Z6avJ2rCpg57DsAuPXS9FSl8IV1C8jPyRpPT3yznspoo0a2NDsEQLpm88qzpF8+9XIYOiv96FfZ19xgVCPl7lUjjPsDuVNyeNldI8MR4ejY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YOKUeCWp; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YOKUeCWp"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso2491493f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683662; x=1791288462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSJ6Eh7p5qNfcpLHmBuzlyK3Qib81LELDrV9ggTB99M=;
        b=YOKUeCWpxP4rGgYs8s44CiJR0hy5DLqDWCvi5NnKRao6QKSj8wEoUCVdD5vB6XJOkl
         Pc7KnN2PJ2b/tpZvYwE21uP0aUf35OvsOpC6suMBAQpTrf/dqTfIRFu8EFuvNpv8LfND
         6T3r01m6Qxxbepr6+4HV47Gb1TPJXyVO5XzHEGtDMI1aZ9JpLHJogUQe60ElAP2JYrrK
         Qm7D1eXUDfcJPj/1wZHRxWEFDwEbc10XDD+nLEYqB0FJO1658PJJkiAXAUzVxUv0Btpw
         Ste1Encvif5ZI7SRWpsjfi6JyAUVKXkAjmFJx7Z861NXsmAdyc+EjjS5/3QjLoxpnbrM
         CdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683662; x=1791288462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSJ6Eh7p5qNfcpLHmBuzlyK3Qib81LELDrV9ggTB99M=;
        b=e/q1ySaSW1/0DHN4Fn47tcARJ/MBr0FQg2qEjAToWST71P03ZeDdx3lYpW0NBTjSex
         TpMMpbM8QEmV6O90DoH9TxoarAAcJCzcZBX2b8EeSmNW1ZjUXyEOzbeJmzxguEugPCM1
         8t8DzZuTUv6KO0JsJJT79CQi6zeLCkSJf3arQxMxFDKiOqroIDhWDUkyX1EhoS/nhG6O
         tZxgE1EWJR9ZqJfIFDXFJqPjKrZd2Jk/Y8YQtaJ/wimM/OrjIBrkZeWi5yFoI/GvjScp
         jo2yPL17sfsLY0Ou1z7E3SugJcy3dqIDI99guJKbDpfAZr+ARSkTQx1iEEvmr1XgTAp6
         dYnA==
X-Forwarded-Encrypted: i=1; AKwUvBzoyMo+8fZPND9JCv/zA+vLX/jgMfQM6ozdzs6bc5gTEcmvPjPua60jHEg2fa348clwHa/H6CDzj52AmJM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzuYbGQn+y6f2K+RoxPvOPDJP3vdm9E+fs1R3Hpx8rhlX3+cIB
	M4vAEAzR++Fk7JJquTsRXwmGWqNNV1L+6HhiB/+ZRx0nuPeZv+gnLWQOo5qRV8t7uyk=
X-Gm-Gg: AYBFou0akmAGFCVmeAI/8bXYfMzAtcMgu+C6wP5BbUUKBec/L0M0s6SveJTZRCwTb75
	cTZ252IQh02wpwhhW4fgzU4VSmaZ6EwP+n7GbUcLEOlDSQSTt/pq9TP78KrYOJO5zr5VyB4DuuP
	Tl4eNLAknZ08mC77XElLlMJvaPdX2Q3218WKlcL/A3UrXEbQJK+RV5Vo9V/PMTXer3dX/+jccVL
	3o5ECnqH3b+RGbL1NDVLc8TQnSq7xHy3r7XNCdHjoHuRKRfKAgQKiAgHuouZTjfkx52frCYX3t/
	xgDiLAIwUgJ/2ba/mhShqcJ18+PJufM/L5oWYx20EveSzbAQzv8WFZEL0V6uI3M1OANF06JJsoh
	91OKXKC/O4PeBWth2dol9Ns8KwY5eQ/jFj2Rt0ZyQ8dLyWtN9Eto1exbcs9nmLgKNhv68AQkM8h
	EQpZvNuv6/X5KjiL3AEoHZ7TQUpfB32xpzqsiva4ZlL+rV1X1pUE2LQgYueze4f+W0+bBHMj7ET
	noI2xpY
X-Received: by 2002:a5d:5e88:0:b0:487:9a9:6d24 with SMTP id ffacd0b85a97d-4887171a503mr26770138f8f.19.1790683661598;
        Tue, 29 Sep 2026 05:07:41 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4f886b6sm3963567f8f.1.2026.09.29.05.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:07:40 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 09/16] printk: Allow to override options via the command line
Date: Tue, 29 Sep 2026 14:05:39 +0200
Message-ID: <20260929120546.328616-10-pmladek@suse.com>
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

Consoles can be preferred either via the console= command line parameter
or by some platform specific code, e.g. SPCR, device tree.

Historically, the preferred console options are stored only by the first
caller who prefers the particular console. The ordering is:

  1. acpi_parse_spcr() is called via setup_arch(). Also some platforms,
     for example, s390, powerpc, x86 Xen, explicitly call
     add_preferred_console() before or in setup_arch().

  2. console= command line parameter adds the preferred consoles via
     console_setup().

  3. The device tree is read in setup_arch(), see unflatten_device_tree().
     But the preferred console entries are added later when probing
     particular devices in do_initcalls(), see of_console_check().

It means that users could override console options via the command line
only for entries defined via the device tree but not for entries added
via SPCR or another platform-specific code.

I looks like a bug. It should always be possible to override any
platform-specific defaults via the command line. Also it is usual
that the last variant wins.

Be conservative when Braille console is wanted and prefer the Braille
variant.

The change might theoretically break setups where users passed wrong
console options and they used to be ignored. But the fix seems to
be worth the risk.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 4670787195d1..b458a920ce5a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2563,6 +2563,9 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  *   2. Only matching entries can be updated.
  *
+ *   3. Allow to override @options via the command line. Last one wins
+ *	except that the Braille variant is preferred.
+ *
  *  [*] A valid @name and @idx will get assigned for a devname later when
  *	@devname matches during the device initialization, see
  *	match_devname_and_update_preferred_console().
@@ -2632,10 +2635,11 @@ static int add_or_update_preferred_console(unsigned int i,
 	}
 
 	/*
-	 * Historically, the preferred options are stored only by the first
-	 * caller who prefers the particular console.
+	 * Allow to override options via the command line but always
+	 * prefer the Braille variant.
 	 */
-	if (is_new_entry) {
+	if (is_new_entry || brl_options ||
+	    (user_specified && !is_braille_console_preferred(pc))) {
 		pc->options = options;
 		braille_set_options(pc, brl_options);
 	}
-- 
2.55.0

