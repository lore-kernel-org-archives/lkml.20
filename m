Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412241;
	b=No3wjsnMUtasMjIGcxUc2QTkdR/LuXOIPniGG+mYjHzLHkhbsVUZRxD/fV+1kXcwv7AN
	 5++GWjyC4zjSKvCTxEg83Z5l/TIuHX00pENn0GS1vIvibUm0C1Z3NfhiuHF9qMCKAKzWu
	 yt90N5+Bl18IwmC+OirrVpQVtihua0tz27mekHKNSOEJks2JD4ymlil82aFyc6iq3wLg9
	 8FwxLrrf2ukS0Sez0zbWNEs8nR3YF2y/HMyDiZtwiJhHWfIwjPhpBwiiM8r75Fx4Cp1CZ
	 dt8Z5175tMdStfZ8OW4rrpIvyUDLnwO+wmpRH94CYHsmQu0miUSlLQC4b4t8rR/764w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q0ul2iCfXva9OKXvM0B4+popXah+05qzWOawysX61+c=;
	b=dPSRq2Mx6Hc1zIMa4drILDKpUuWwSyIbvhRo5UDMhuHBJ9OXd/SBWgU1e96w78qOmjn3
	 AbSsEcdlB/NHlFKwNjv90NrP/etuzwseRF6sScRQ9BiIsY5LcZVwZ9ZQWwvKgDck8nqMz
	 bx41TcOL6jhUBTpdDLaQQi3htjNbaZeKRlFopl7kkajW/K7fEKDNXf0izn8gDS4P3pp5q
	 xOg8V27JxskilFTWkVazLzBZr09LzqSAyL0GN32Sd3Fbeii42/Ew1lSAKqIe97+P6FsIs
	 CHUNrQRWx8udOx7/ty2jHfv9wOtBOL5M2Zc/bZRqw8R6utC71RrYXlYmvymK7vbKepw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Q/fHqL/j";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07712606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07712606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q/fHqL/j
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e10a70540so2024157f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412239; x=1795017039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0ul2iCfXva9OKXvM0B4+popXah+05qzWOawysX61+c=;
        b=Q/fHqL/jYbzwwqeIscqj61HCx5GCmN4UgdWCf4UgpfOfC4uQSlror3O+Rll7DKJibN
         UcMIdLSVvYlM4K5dqC8b3h1qc8rLSILAKgEmunsET9H61vkKFPDX90MMw5g67jrI8lCU
         i1eBbBCSSVJJOY0KUD4jTUYBNkGj6ZeIjgffvZW7z/J0NlhvEsxtNIKWBd7pIxF9lXyb
         +k4QcPjPRRt70Y1l5Ts34k/2+YOXC2dUEA9FQ2lxl6BPXqwI164L1TaeZYdwXKxzQb9b
         cDLkhepTJTxC+zGGAmvAYI7eBzJVZZ7B+CeAu/4e4bnoUbGxSHksnrKNJSCUkB/YXm0Z
         aIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412239; x=1795017039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0ul2iCfXva9OKXvM0B4+popXah+05qzWOawysX61+c=;
        b=rjXd5hWB8BysTYgeFQ0pW/K2hNyU55OcVXXlS8KNzDJxWBEG2flrM0QprHiCAye+BL
         vZ/q0HU1Avvn0B65OTvSGuQIZj1VLjy7pNeWta+cziz7U23XBa21pvolHDeW+wipWD9t
         XP7VS0PCxQUw1eSV4ELNQ3ERr+o5axA+4TMcxKe6fSiDc7BWmq1lQiCVwqfvykZ8rH4Z
         6D2h45JEVtd+a6sn9GSO61Gkl7YeENaGSnOo9W+UvYOQ6W5fEj47X0a80a6Gw8TG4WpX
         yed+LgJBzuEYpb19l4ZnRvUFrCSmD/awDE3y96wp0m2EtxhH2szJhawZw5mMxo294yXT
         29mw==
X-Forwarded-Encrypted: i=1; AL+hErHZmqL4xCIY3YeusyJGvM67nXhy7tstiRJrVX0aXID7yXNpJbdsoDAF69KRHXTo9W7SHr3rCd+QuHziFOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2WcpCACDCQn+qpft3o9rth9AQsZLUIpp5k/4UQnygOMnbVkT1
	ZcnIypL4DYOeEl/2Udvoiin+vccK/wlP/J/tIb4X8AjBTmVmnOaw4KCSsMNn7uyYig4roDWeGtB
	Adv/vQpI=
X-Gm-Gg: AYBFou1Vr2CgRv8j0PTaFj3iJ957XFUF2uodWBkNfqsgtPZcjZp9jHkoWE41WubC2Ve
	3FaqeNN8m5hX0HL2npb4R5xZWI5+XP081AuscCqipyjdsMPFNWx7T70klo1yO3NEeKXQ2B8RcCz
	p3sT/WDB0msHQlYUVdR+B7187orY8QKBU8A2ADBs/AY3Cq7XTKdvL9ccNaX/n7L1UfOqKha5Ftt
	8AENG0QAlJrX/H5XW0/ZLEmWJx0jYPdQQeUSvA2tgMEDqqEHCawWOsVhxrRLFaciYdjgK955dl9
	KClEAY6lTiN4w5BIdlMnPqbNsKop77fSTiFSYoUoDqB75jubxh8kPRYMoeckcJLitHuPDukjHgB
	ShUDgctepcxDHpbENCSkNfgAt2Sl5PSIY0q4vlgBmDjbCeSxWQYptfU7qJOLephhcdGSXB0oAvy
	aL/osHbctFXo09ILpadh5+SruNXff+Z/PaKBv9gjSN1WL/o6wRCehioxnZw22xf8bG4OgRjA4HK
	mNdSjnNkqvlVhd5oMxjvao6E3PfbZNRi753dIpqv9mvHCVxkktfWvlb/e8tpUG8r8lngOSHQz3E
	v7SjQXoc6yUgLtKA6GRjxYsdm81T0qw=
X-Received: by 2002:a05:6000:18a9:b0:491:4e13:fde5 with SMTP id ffacd0b85a97d-499c3b9ff33mr5184746f8f.8.1794412239118;
        Wed, 11 Nov 2026 07:50:39 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm12637013f8f.53.2026.11.11.07.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:50:38 -0800 (PST)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 11/17] console/braille: Lock console->setup() call during the registration
Date: Wed, 11 Nov 2026 16:48:10 +0100
Message-ID: <20261111154816.71103-12-pmladek@suse.com>
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

In braille_register_console(), the console->setup() callback must be
called while holding the console_lock. This prevents a race condition
with a possible active boot console that might be using the same hardware
registers.

See also the commit 801410b26a0e ("serial: Lock console when calling into
driver before registration").

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260423130015.85175-1-pmladek%40suse.com
Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 drivers/accessibility/braille/braille_console.c | 10 +++++-----
 include/linux/console.h                         |  1 +
 kernel/printk/printk.c                          |  8 +++++++-
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 1b79b4d88bac..bc338e57d8ef 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -408,11 +408,11 @@ int braille_register_console(struct console *console, int index,
 		console_options = "57600o8";
 	if (braille_co)
 		return -ENODEV;
-	if (console->setup) {
-		ret = console->setup(console, console_options);
-		if (ret != 0)
-			return ret;
-	}
+
+	ret = console_call_setup(console, console_options);
+	if (ret != 0)
+		return ret;
+
 	console->flags |= CON_ENABLED | CON_BRL;
 	console->index = index;
 	braille_co = console;
diff --git a/include/linux/console.h b/include/linux/console.h
index cb8be9ea4a76..b68279a22514 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -710,6 +710,7 @@ enum con_flush_mode {
 };
 
 extern int add_preferred_console(const char *name, const short idx, char *options);
+extern int console_call_setup(struct console *newcon, char *options);
 extern void console_force_preferred_locked(struct console *con);
 extern void register_console(struct console *);
 extern int unregister_console(struct console *);
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 60ae813769b4..cc6c2e829b1d 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3960,7 +3960,13 @@ static int __init keep_bootcon_setup(char *str)
 
 early_param("keep_bootcon", keep_bootcon_setup);
 
-static int console_call_setup(struct console *newcon, char *options)
+/*
+ * The function is intended only for the generic console registration code.
+ * It has been made global only for the Braille console driver which
+ * is partly using the generic console registration code but it is
+ * integrated with VT code instead of printk().
+ */
+int console_call_setup(struct console *newcon, char *options)
 {
 	int err;
 
-- 
2.56.0

