Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412265;
	b=K9Tey4j2Mx5ke54u1pV1SlSnGWEqK0Wayg8QyDcjmCPDaodf4EVlU1cZA9tgKqH8j6hl
	 Lea6MbUd5xW7Zbnsn3ybwZtdltnHElTdLYZWcZAgEyPQT9aT9/VwKIubFJJw/pt8VgN6J
	 Dxna7HSGoFYQNZtgVUR56b/0A8k4BSMJhkMnIOg6TZW9JpLkdhu1Tk49VnxtFL49yciDj
	 VkGo+zckRmzwxqJDS48tEn/TDDozkB7PdYp1AJybUxvrQtqNEHOhs3IBTFuYzb6zTT3Kb
	 4QmmG6v6JYQd85bObvYjKhTGYy9P41ygEAI0gQNn47icelEVE0wR/M8sqyxzYHXsLSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9Bfjjj9irve64tipxghBwxDJReF7LUZfPFLzgqMHWwA=;
	b=2Vpy2zVSsGDjA0R+bas2yOyD88VRn3tV154vdXMQ8ghF3hhJ4tZoK6wapBJZZdpGoDFG
	 pf51ZmzccDkMUKhnT6MelWxRyThWUagE+N5OdoUi6LGVRwX4VDVT7d+Tqm6R7CHNERcr0
	 mhOP6UVV2KRfZ+Dpeka/gEtr1pCYjRyfCnj2Npwr0YdUFzqSD3ii+T34TdJ5P+MtGeOv1
	 +xWO4dBjkfMUOZ98ro3aaTeNasiVILIgaKqbvbZDd81oo6yRlTtLkDz7qVCA9pohth+Fc
	 SE2ulWcKRBOCHoVAahvzvvqPmIysPoRmOutOimodSBOZNticmIFbB/j0TM7TBwEznZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cxLl+jBJ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20134606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20134606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cxLl+jBJ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so30559965e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412262; x=1795017062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Bfjjj9irve64tipxghBwxDJReF7LUZfPFLzgqMHWwA=;
        b=cxLl+jBJYoNbGPGQaQ8WoaQmu2cVWxcmicBLyXSBU6ASZV7cF82uUVSaETHmxW6C0u
         GNuL+xG5ezqW9eo/5ie0rJ3oaQJhp8wpL1g+YQfFNSFZUnmx0Yjasx32whrQDiCaIoQU
         JDl/Ks/QtUrNMZt0yn+xsUqvLQg57cIyzEvKgRFZIo4EdYXmYW0xxtGr9i4Li4lqEp2h
         VpiD7egcgV5G59fj5Ec+KDSJCviFtxAGPmZh30uWukQUoSKkrsMRQ+V07ZVWUi8BcR6G
         HrJvuSzqR2GazDdtNAQHD3yP3MbI+zjcvXcK1cHOC8eObaseQujL+ahZr5MwYDSF5UcV
         DPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412262; x=1795017062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Bfjjj9irve64tipxghBwxDJReF7LUZfPFLzgqMHWwA=;
        b=SXXcbcTyKk0x1U4pm8oIpSvDRlgJScgCffbg2HKrtstFwrFJ2hwhz+sgdrKA0YxcfZ
         H+hJehPmxCs1P4B7i6AwJTMH+B+Ay4lBl2yDbg8UDRZjdhUC3AfVkXwjxrHp5pZHOyAl
         GLidNG5Yx3go48QlDP6+oFtK7MsRiPx+EjDKD+5+/KHzVC/jYMzko9s3/4iCNf6e9dnm
         iwy0oesq8cFpj1YuRGSDsvABqq9V58YxmfplVQN9soMtC7JbDCQHcHQGr83eFob68cB4
         FU3UplGw1zz6mLKnB3sl6Ll2xaHVV5Lk9phUWj2SMgLRFs+1iejHfXSRwTHH2mS46M6j
         lriQ==
X-Forwarded-Encrypted: i=1; AL+hErHwCHYFabJD659Dvyns3zPEGh1sVKW8/bnsv5OHUFE9BefDyVAMOW4NDhsm7wy9Fb+ksxtZjcyo40mcvoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XcEH3ZJRQVXSUglkQ2jpvrjH4ZpOlkhpWCQ7HyuoPuWnY1Jdy
	tmUzoHxxR4UjRrEQmuGC/6CpapyFWRsnhMH7OcGZ36UppIQjz610eDe8cKnJvLsv+EA=
X-Gm-Gg: AYBFou3p2RlryoTKU9hD6fQedIbiTIRAHIwLUb6/OBeKYq/hskacumnWnSRKdOfK0lK
	Ovas8CVD+Bjs2oUdUOluAY6D5Ycih02PcdiFuIfc26kNJocH/UIkeASeJYrPbD+wL5vhyxqz1HN
	3QomvcOYYvd6IcsJ9nVF6TWRN/pOdfRxj88ON9NP5XS1eW1QKKUfo+BkKZLhzsmTSW5jzoeiOuf
	qV126p6yGP3x1X0xtqZ8MobVQuFtWTdfP1us/2uL4gijLxKNbGJfyt+oF08oZ72LAtm90a42D+Z
	fOuYBl2UJNjOWWzkyplFUNLomxTWZk71ZPJlquMk7rBBYIwoXRV30tKhW09GLDL39bVzED4laI5
	PRELn6+Z11hasDZn0VZBDsREHA2wDEjkJq2lELyWBjVCjgcq0q1Uk5yk4Y2fb1I35oRMhZAMFaX
	T0uBrjLHp9ACvBX50T4Qfy8e/OXippbywqSC635BVWT2PNAfQP9hljKTcNvw5wKcP8hl44kjVSD
	94fXpg+roi/szRTk3BkwC5jnJlzHrg0y1adZ+E8WRLKlmJ384y4o5Ic+A+kI3tAiVcNMnzXB86q
	JeDA17Xd09aCNZ8W9x/T1zDselpx0R0=
X-Received: by 2002:a05:600c:8b31:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4ba093c1843mr39316645e9.33.1794412262410;
        Wed, 11 Nov 2026 07:51:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f53efsm4423105e9.13.2026.11.11.07.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:02 -0800 (PST)
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
Subject: [PATCH v7 13/17] printk: Try to register each console as Braille first
Date: Wed, 11 Nov 2026 16:48:12 +0100
Message-ID: <20261111154816.71103-14-pmladek@suse.com>
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

Braille consoles are unique: they can only be enabled via the command
line and use the preferred console framework for initialization, yet
they are never added to the console_list or associated with
/dev/console. Because of this, the preferred_console variable remains
unset when only a Braille console is requested.

Currently, try_enable_preferred_console() must be called even when
"preferred_dev_console" variable is not set, just to catch these "hidden"
Braille requests.

Refactor the logic by adding a parameter to try_enable_preferred_console()
to explicitly handle Braille vs. non-Braille cases. It will eventually
allow to skip try_enable_preferred_console() when there are no preferred
consoles. This improves code robustness by ensuring the console
setup is explicit and only performed once.

Note that _braille_register_console() is skipped when the given console
driver has a match() callback and it succeeded. It means that it took
over an early console and can't be used as a Braille console.

As a result try_enable_braille_console() might return success even
when it did not enabled the console in the Braille mode. It is
the reason why register_console() has to explicitly check whether
CON_BRL flag was really set and could skip the further steps.

Behavior change:

1. The Braille console driver is newly always preferred even when different
   serial ports are preferred. For example, let's have the following
   command lines:

     a) console=ttyS1,115200     console=brl,ttyS0,115200
     b) console=00:00:0.0,115200 console=brl,ttyS0,115200
     c) console=brl,ttyS0,115200 console=ttyS1,115200

   They all create two entries in preferred_consoles[] because:

     a) and c) differ in @index (0 vs. 1).
     b) defines either @name or @devname.

   But the original code registers:

     a) ttyS1 as normal console because it is the 1st entry in
	preferred_consoles[].

     b) ttyS0 are Braille console because the generic "ttyS" driver
	is registered early in univ8250_console_init(). The @devname
	entry is resolved too late when serial8250_init()
	registers all found devices, it assigns "tty0" for
	the given "00:00:0.0" but it is already in use.

      c) ttyS0 as Braille console because it is the 1st entry in
	 preferred_consoles[].

    The new code would register ttyS0 as the Braille console in
    all three variants because try_enable_braille_console() is
    called 1st.

2. When only the Braille console is defined on the command line,
   the original code might attempt to enable the same console twice.
   One as a default and once as a Braille console. This results in calling
   the setup() callback twice and incorrectly setting the CON_CONSDEV flag.

The 1st change makes the behavior more consistent and understandable.
The 2nd change is an obvious bug fix.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 58 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5a2e6f1b9907..617414d419b1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -366,6 +366,7 @@ static int console_locked;
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_dev_console = -1;
+static bool want_braille_console;
 /* Set when there is at least one console preferred via the command line. */
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
@@ -2651,7 +2652,9 @@ static int add_or_update_preferred_console(unsigned int i,
 		braille_set_options(pc, brl_options);
 	}
 
-	if (!brl_options)
+	if (brl_options)
+		want_braille_console = true;
+	else
 		preferred_dev_console = i;
 
 	if (user_specified) {
@@ -3987,8 +3990,9 @@ int console_call_setup(struct console *newcon, char *options)
  * by either the command line or add_preferred_console() and
  * setup/enable it.
  */
-static int try_enable_preferred_console(struct console *newcon,
-					bool user_specified)
+static int __try_enable_preferred_console(struct console *newcon,
+					  bool user_specified,
+					  bool try_only_braille)
 {
 	struct preferred_console *pc;
 	int i, err;
@@ -3999,8 +4003,21 @@ static int try_enable_preferred_console(struct console *newcon,
 		/* Console not yet initialized? */
 		if (!pc->name[0])
 			continue;
-		if (pc->user_specified != user_specified)
-			continue;
+
+		/*
+		 * @try_only_braille and @user_specified define which
+		 * preferred console entries are handled in this round.
+		 */
+		if (try_only_braille) {
+			if (!is_braille_console_preferred(pc))
+				continue;
+		} else {
+			if (is_braille_console_preferred(pc))
+				continue;
+			if (pc->user_specified != user_specified)
+				continue;
+		}
+
 		if (!newcon->match ||
 		    newcon->match(newcon, pc->name, pc->index, pc->options) != 0) {
 			/* default matching */
@@ -4013,7 +4030,7 @@ static int try_enable_preferred_console(struct console *newcon,
 			if (newcon->index < 0)
 				newcon->index = pc->index;
 
-			if (is_braille_console_preferred(pc))
+			if (try_only_braille)
 				return _braille_register_console(newcon, pc);
 
 			err = console_call_setup(newcon, pc->options);
@@ -4029,6 +4046,17 @@ static int try_enable_preferred_console(struct console *newcon,
 	return -ENOENT;
 }
 
+static int try_enable_preferred_console(struct console *newcon,
+					bool user_specified)
+{
+	return __try_enable_preferred_console(newcon, user_specified, false);
+}
+
+static int try_enable_braille_console(struct console *newcon)
+{
+	return __try_enable_preferred_console(newcon, true, true);
+}
+
 /* Try to enable the console unconditionally */
 static void try_enable_default_console(struct console *newcon)
 {
@@ -4051,6 +4079,24 @@ static int try_enable_console(struct console *newcon)
 {
 	int err;
 
+	/*
+	 * First, try to enable the console driver as a Braille console.
+	 * It would have metadata in the preferred_consoles[] array.
+	 * But it won't be counted as preferred_dev_console because
+	 * it does not get printk() messages and is not associated
+	 * with /dev/console.
+	 *
+	 * Note that it might succeed also when the driver has a match()
+	 * callback and it took over a boot console. In this case,
+	 * the driver will continue working as a classic non-Braille
+	 * console.
+	 */
+	if (want_braille_console) {
+		err = try_enable_braille_console(newcon);
+		if (err != -ENOENT)
+			return err;
+	}
+
 	/*
 	 * See if we want to enable this console driver by default.
 	 *
-- 
2.56.0

