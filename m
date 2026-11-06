Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985763;
	b=covw8K2WeUnJptxuGpoZxZcNAZCoJIB0sOZ3tqV8vRneifv5xz9jfLb3IGNQ/qIoHePT
	 g9sfeNzAdO0XWTzJaDKwvVgUHq/42w5EMunw+Ch4qLNNB4bRL9bw7AyjYxC0A010nG2kQ
	 ULLP14MHPCEKMob1Y3xcU7Tstc76pFE2oc81HdIRRMiJKj0EbO3pjKLU1vbzp4c0C8fbp
	 VF/lOkLaBCHkksEUWUrM47XQtOFmUsWdA9JKbYaZcZCLoqmGjJqU8mfGf4qjR6uWPQe4D
	 QY8AOojk/vkIevBGdZhuiUerLs7Na3BfXw/n2+zcHeP3J7TnsJY+HdQ3B7tPFBG67Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PeVOmQSCdECqFJA+TCZiMLY1m98+pc6UYgzyD1PjmOM=;
	b=kuXWAmoWlsEjFS4nOPjuJxr3jqJD8G7UJKbubqCApd5LFpreRKBuKw5A0FmpboP2j1rP
	 kwZZXr8x7YZVuEyxnDn7QMhjlA2iEMl8JKNdNNxSQEvdwk25CovlPQ+mtxkrfxM+3qYcB
	 0Gfw4WLqZ7zimDJV1RnjH8LqC000ZVGaqIbIC9Ft5WWRl93KW9Tic/v2VQ8nt/mAtA/Rd
	 ttGlPsU/bu1a9T49Y6V2AShuryEUrl70wAlqyi5GqpaTy5DpJPKb3CZ1g9yP1FDGULrE6
	 ur8dyJEwrbtdW7N1+suZUpO5pLm6aizdRaGbzx7DXeFnul1P4rpfE1xf0GOwF7SbjIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=F302msJD;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B25606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03B25606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=F302msJD
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so6442315e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985761; x=1794590561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PeVOmQSCdECqFJA+TCZiMLY1m98+pc6UYgzyD1PjmOM=;
        b=F302msJD1hvaEozgiKBmToNP/Y18nVL0I1Ykl46KlN65CxOgoLTq3jVs1IG3XytlqU
         GMkWE0M+tsRHe3T/Wots/tnbvtBPr4bMR8c7HSK6/lusCiSpUQ/v/60WFK7i92Jwb8Kl
         H6igV1JCjCH3i9jYSLZLZ6KbKZGK0g3r8hx8DQw7rT54stUrYaQMN8Xl5FCVoIKOATda
         3jO4rDPkYf6qwSdvN7HQG/edL2zYBk54YrAlUcdm7CL5zJoZmESXZKZB1tWov0gVOn8D
         C4Jwt91fxIpiFmt8Y+DXpN/YLmBhUpw4MtDyfyG784RjYplKF/Ue41Uz8BB+Js3mLANI
         P05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985761; x=1794590561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PeVOmQSCdECqFJA+TCZiMLY1m98+pc6UYgzyD1PjmOM=;
        b=PkVtnZEh5ZzqF0dkJDIreiotpFa0fk/8Z4bSBvxzSR/NvwPcBI7g5huxrOtNh/lgz6
         2bq2NpyvouYV8/DIvcVLfTa449YVgAOQyWeq+S0E09HqlzepeWtnfNIbndVnOKRdj5UC
         x5uOBcVmMXKCGQJQXpsX0l2Nk+x+UN5MxrQHLSjjEwGYWqRMEqeaOFcZIgX+6UQrkqv3
         Wimn67xJmGAFNDYtLWojQcesUMliDvXPGPumOFrtgE5qdE194Y2BSOL6k3ASI/JSVZhn
         SqrvSNfVQmncyWQLZZAwXgDMIyxdwSMKZA+zDYB+WTWRxbjUiheKxzScbxOvBqwCvP7a
         MktA==
X-Forwarded-Encrypted: i=1; AKwUvBxNgc4Ewplkz0L4pCh3izlxGMqwyK28eFt79JeSnOc0xmfR05DbhR7+f/0k3eV47uDtYbSgLfytXbC73Fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UBHyPXFhDuXRJszLZ7GcxJ6Mt1caS53tsjrndNa3xAgYR3U1m
	3qtrah0cAtjFy0tCFzbaWjVKS7/3k0ZVHCGDPwkpslvr3Dq3YINYK2yg1OMwigXazow=
X-Gm-Gg: AYBFou2FeTrQsMMlfwvS5INmPvDXbn8/Sho67m/pKxAwkvaJ+9vXt83W9QF15QR7pEa
	5CJlKQ7O+jj/iY3tL26TXrv0/8qPJRmPcgXu8tfkjzn+OAHLdDY2vpdMqsg1ce7gay+0ZDcq7nT
	mYcDCFLRTQeuME8zc4fVwyUZLDXNgIMi4O/Z1VqH6I+ODJKG8XxrVxrBCxHVlLSKbURk10FUtqF
	gaYvRNgZh7tqTZDbgqMIEIPH78gxF1Hs2nJZHyR6w8b9IUJvYb78rL0mzIDGd3gOu4jPPEaYxvc
	R7i9YzaxrieH+63RGvilKHIEh/u4+rBlYFktaj1fG0GZOWNoTKh5IuI0WiRQ2ZghVZc0fHTdTad
	s9JrP5iInIlg1Oo5QynNBN1nO1Shl6MT99vdHm9EFVN0O9N/es9A4xoFMXW4Q4c09bXomtvIRDM
	SrlcrEMEEqeQKqJ+Hey5UE6K3kGeX0R+if5JgXNt/tNM66yWSya07ozjT2iDvQcmpOr8SG3MZ7j
	LQ/wlu9iRinb72Sld/klwFVV9A7YI7Q+aHCdd98rj1vdfMJ862t3cswckq5zY+WCltNlNTO4zDH
	/u5qtd9t1BpYiliIn0xJaAoWAPZswUE=
X-Received: by 2002:a05:600c:3b87:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4b6dea69603mr55079625e9.20.1793985761324;
        Fri, 06 Nov 2026 09:22:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm142108985e9.9.2026.11.06.09.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:22:40 -0800 (PST)
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
Subject: [PATCH v6 12/16] printk: Separate code for enabling console
Date: Fri,  6 Nov 2026 18:19:48 +0100
Message-ID: <20261106171952.207909-13-pmladek@suse.com>
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

There are several code paths which try to enable a newly registered
console. Move the logic into a separate try_enable_console() function.

It simplifies a bit the long register_console() function definition.

Also followup patches are going to add even more code paths. And it will
be easier to use "return" when it does not make sense to try other
variants.

No behavior change.

Signed-off-by: Petr Mladek <pmladek@suse.com>
Acked-by: Chris Down <chris@chrisdown.name>
---
 kernel/printk/printk.c | 84 ++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 36 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0e68af9a3490..947574ee29a3 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4041,6 +4041,53 @@ static void try_enable_default_console(struct console *newcon)
 		newcon->flags |= CON_CONSDEV;
 }
 
+#define console_first()				\
+	hlist_entry(console_list.first, struct console, node)
+
+static int try_enable_console(struct console *newcon)
+{
+	int err;
+
+	/*
+	 * See if we want to enable this console driver by default.
+	 *
+	 * Nope when a console is preferred by the command line, device
+	 * tree, or SPCR.
+	 *
+	 * The first real console with tty binding (driver) wins. More
+	 * consoles might get enabled before the right one is found.
+	 *
+	 * Note that a console with tty binding will have CON_CONSDEV
+	 * flag set and will be first in the list.
+	 */
+	if (preferred_dev_console < 0) {
+		if (hlist_empty(&console_list) || !console_first()->device ||
+		    console_first()->flags & CON_BOOT) {
+			try_enable_default_console(newcon);
+		}
+	}
+
+	/* See if this console matches one we selected on the command line */
+	err = try_enable_preferred_console(newcon, true);
+	if (err != -ENOENT)
+		return err;
+
+	/* If not, try to match against the platform default(s) */
+	err = try_enable_preferred_console(newcon, false);
+	if (err != -ENOENT)
+		return err;
+
+	/*
+	 * Some consoles, such as pstore and netconsole, can be enabled even
+	 * without matching. Accept them at this stage when they had a chance
+	 * to match() and call setup().
+	 */
+	if (newcon->flags & CON_ENABLED)
+		err = 0;
+
+	return err;
+}
+
 /* Return the starting sequence number for a newly registered console. */
 static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 {
@@ -4115,9 +4162,6 @@ static u64 get_init_console_seq(struct console *newcon, bool bootcon_registered)
 	return init_seq;
 }
 
-#define console_first()				\
-	hlist_entry(console_list.first, struct console, node)
-
 static int unregister_console_locked(struct console *console);
 
 /*
@@ -4179,39 +4223,7 @@ void register_console(struct console *newcon)
 			goto unlock;
 	}
 
-	/*
-	 * See if we want to enable this console driver by default.
-	 *
-	 * Nope when a console is preferred by the command line, device
-	 * tree, or SPCR.
-	 *
-	 * The first real console with tty binding (driver) wins. More
-	 * consoles might get enabled before the right one is found.
-	 *
-	 * Note that a console with tty binding will have CON_CONSDEV
-	 * flag set and will be first in the list.
-	 */
-	if (preferred_dev_console < 0) {
-		if (hlist_empty(&console_list) || !console_first()->device ||
-		    console_first()->flags & CON_BOOT) {
-			try_enable_default_console(newcon);
-		}
-	}
-
-	/* See if this console matches one we selected on the command line */
-	err = try_enable_preferred_console(newcon, true);
-
-	/* If not, try to match against the platform default(s) */
-	if (err == -ENOENT)
-		err = try_enable_preferred_console(newcon, false);
-
-	/*
-	 * Some consoles, such as pstore and netconsole, can be enabled even
-	 * without matching. Accept them at this stage when they had a chance
-	 * to match() and call setup().
-	 */
-	if (err == -ENOENT && (newcon->flags & CON_ENABLED))
-		err = 0;
+	err = try_enable_console(newcon);
 
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL) {
-- 
2.56.0

