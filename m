Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985775;
	b=4YAWyN8+CzuI6DxBfrEWhzAvBiVMBWoxTeLHJJmS+w2TxN8KSKJe0FmmvkZll03z+Lht
	 PGcC59lijcFNEI4XYEmzskmJ68tMl4HL3cQeCkD80QkwBpUxUZE2Ryv3PjllUT41EYgGk
	 IwnC1VOINS1p5RWT/FZHq30zat0SbP9rsZwo2773qxU8oqXY7ffKQRSD4PYQPfpjkx2CV
	 GM9w/edVEfa33H0P3nRALxtnv5ysPNkCYiQzu+CSoTDmIxAnGEfsguqmdQkYC/RM8G1l3
	 PjkBEjZVkwaBhBp2YQphsMvgb0QnxE/7LYS6i5AIDCb0BU/a5tR8EiZ/CziePGbjh5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xBeCxmaO7SBYAAN1RQYHrjs9vewuyjrvlSTeWyFY71M=;
	b=l1opXfi4dAlrARXthF4LZ2eLupnJIUnjpAS1m7+obm3aVmoabVrD1cHpaLGKuKIR9ZZo
	 xWzG249tRXL+IpEw6+w4QblCFgqNwD48Brris8zG+xvtK1xADHY+NBPiVqwwj1YaMRFnB
	 tXiYkdjw2J8WebkKsesGPvThWNSIdMduIiS9h+X6P/ZCJzNwOS61CLat5+BCr5kONCkK8
	 DSrFVPlI9SRUL7u8jfyo0ANxmYqHeIK7C6sCczNKEI57DJpt3qRhH64IIneu3O5QbRUgr
	 HYS7dXtI+aGCg08EOHV4ThVi3ivfiiQKeL9sPVwC//Z1Ay2/q8h/xW8n4c6uF75By7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Pgro9+XL;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F01606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F01606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Pgro9+XL
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so564948f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985773; x=1794590573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBeCxmaO7SBYAAN1RQYHrjs9vewuyjrvlSTeWyFY71M=;
        b=Pgro9+XLXBDf2+HxoEWVGg+ls57KE9z9MlsRjfVryD6KcGD9GimI8U+jHF8dVM4pW+
         WdRPPoA743TwjvOgmT//PdYnIEcsaYPUpH/TvgmynpCnohStodl/OHkxMNESWQcqXDIh
         wnQx014l3j0S2W3sHFloAh3M6/E0La1gByNzryNUPwsENCgg3NuMEc/MpM2ta4P+8s2T
         vjF8LrKIKY0YgGBIC2re/avr0P/SVYGZRBKrvZOBbg8B/7QYGaD4z+CBywdt6EMu5C1b
         stqyYZnLUPXlEJj0nsjtVHSkE9XAJtQMsSU4f1dAnROuCeqb832N6fwAghPkSMRP1Cic
         p8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985773; x=1794590573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBeCxmaO7SBYAAN1RQYHrjs9vewuyjrvlSTeWyFY71M=;
        b=Elh5BaagNBrh3CMITTkM5jxuQmQrARFJJhDFQOjfnuA1Wu6Fp90ssknwHT9UP8sFmo
         rVIneFsB2C2GVgXv2AHBg3L+5sNNJhwcTQ0Y/l9NBVCpyBo3UhV4qycVCiSjxZSuC7cI
         +wFhDUoxjgevjIsrMJxxExhR4+iNpPo60OH8gWXuYOgeiYBeYvvlV+Qj5T/PylbK0e5J
         y6TMf4dHNelkpFrANE3FzuYuxV/qEzG6QPOJ12MpaPmvM7v5ZSTDsWgIKoI5Yjk2meu4
         GOdkk5Fb6HI7ItZaygot55IeLu6qKxUyzARAaF1PPXyKtx94khcGu+iOhvwLhzAXotir
         /VTw==
X-Forwarded-Encrypted: i=1; AL+hErHXZx/XJYfWA6ZVprRIk5v+YLeHmgCN+rJ0sZErF0vVydipm7JXUAQwwUs6MxVdhOjAsrtlaL8BBN6Khxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xEQCPO7szA+2OiZI23QX77EqYxoSPsEDMyhymLY+px7Ig/zjV
	9Ktqlp7I8Yv3/ujlZ43tM3z56jbhHEH85RAXhzJRNhM+iUQHZO8a9bV3SYTGHayImQSPyarmNJh
	pfUa+NMQ=
X-Gm-Gg: AYBFou3KO4PZpTGoR9Kf8+/cgHVsXTpd5YWZUfFFNXbZS2aBK/4ilXHvor2iwKz8Wgl
	82hIBqWaJD0/8M4XkFbbPId4yTt7R0pQwJF0BsVLKi0pFATMeC2LBVhC+u84dOJ0YAgvRWr+ecF
	QIROruj46WsPnUhojZ9CBl0W5efjGCy5HdCzqT4VSVd6waNbCLfcXqVF7wpyb+iJ7nshi2b8DaR
	RIkKYABMXEDFiNTu0qD/nirJ4lSVITcYJyMxSvJ8vWdLVxo9ZhKQ5Z1ejiuUjepg1PRq+nnuk4O
	Liua3M1f6eEpdZ/kw60iWhQhEmSf8FFrjVCGUNVURPtMq8wnbXFQu80w6XD1w75S0MFeaRcnIkM
	6x7ZcVO4WWrLpkMnBHFTw2xLdvf5e6pFesmV4sjbUA4EDxQkwEux59+niNvZ8/VfSsNGUyhldYi
	eK2MDH31e0YHCVyicyGl41C5ZPtcieMSOESkkaNzRk83+0IK8YfFD5bRwXHmwnbmXBZiUT2jWp9
	WG99j4QSCOauRT5bQvPaN6EHGR+J14kFvav7qFHP8b8fMiPp1zx9fddsM59hLWNbXuJKkQb4S+7
	MHbKnoE6456EEoTv/uaG3lAY9MXiDPk=
X-Received: by 2002:a05:6000:2405:b0:48e:20ed:d5e7 with SMTP id ffacd0b85a97d-49275a2671bmr6769865f8f.34.1793985772980;
        Fri, 06 Nov 2026 09:22:52 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6187sm4741106f8f.46.2026.11.06.09.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:22:52 -0800 (PST)
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
Subject: [PATCH v6 13/16] printk: Try to register each console as Braille first
Date: Fri,  6 Nov 2026 18:19:49 +0100
Message-ID: <20261106171952.207909-14-pmladek@suse.com>
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
index 947574ee29a3..2bcf82b2c4e3 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -366,6 +366,7 @@ static int console_locked;
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_dev_console = -1;
+static bool want_braille_console;
 /* Set when there is at least one console preferred via the command line. */
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
@@ -2648,7 +2649,9 @@ static int add_or_update_preferred_console(unsigned int i,
 		braille_set_options(pc, brl_options);
 	}
 
-	if (!brl_options)
+	if (brl_options)
+		want_braille_console = true;
+	else
 		preferred_dev_console = i;
 
 	if (user_specified) {
@@ -3984,8 +3987,9 @@ int console_call_setup(struct console *newcon, char *options)
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
@@ -3996,8 +4000,21 @@ static int try_enable_preferred_console(struct console *newcon,
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
@@ -4010,7 +4027,7 @@ static int try_enable_preferred_console(struct console *newcon,
 			if (newcon->index < 0)
 				newcon->index = pc->index;
 
-			if (is_braille_console_preferred(pc))
+			if (try_only_braille)
 				return _braille_register_console(newcon, pc);
 
 			err = console_call_setup(newcon, pc->options);
@@ -4026,6 +4043,17 @@ static int try_enable_preferred_console(struct console *newcon,
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
@@ -4048,6 +4076,24 @@ static int try_enable_console(struct console *newcon)
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

