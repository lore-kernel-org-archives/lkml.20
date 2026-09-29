Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B2951B194
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683711; cv=none; b=KC6ZGw0j+6v5Kk7y9qTl7Thao8uCAtgkjmwymTCk31yP/Avljv1ox7qurrUAv0E9NNYxUNvgjzpOhFLYL2VPvW7otZ0rw+DooOm0bSFWRDpnBSgEMPlA5MeLOB5OLKxwdfDCIA4So2JwqqQeClLb42rThmKu0WPK+Wlq1wuo0MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683711; c=relaxed/simple;
	bh=TPID+hb+Rctyg+hA2iTunRiNsKNYSDYels4aNtTOl+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K67sAsJ4kbw0LKmp5PlBQVL/3du6xiwZbIGp9hX/+qW0j9fdp+ohLRUZX1w7BwY6NcmmJBgp+7xlqStgKyHfGnRzYr5x99NYLVEPA7oDKSTkvsseltEEJ8zxV6ClFUZadibjhlIh4WCUdwXCyvVTlDPRAniOkMyK2zjD0k/pamM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dfnC8FOi; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dfnC8FOi"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so3099042f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683708; x=1791288508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iu5g6n5umXm9G78v2BbkYqLmOOj4HoABcHZf3aQLLfE=;
        b=dfnC8FOiaVoV3hggGHWMt51rcDAbQC3Eij0JwIkaVgGUX77I3TbrlXMKPVNBKcI9m9
         s0C5g6A8nKUtNQg0bp58xJf560xORuHX3yzVdOBElmbTXQYoJFG1Wsmql/TwPfES91Ii
         sl/XSnORq+WeMLTogcTVW36K43S7SOJSnXh7BsGMmFUoz8pB0ORxjuTxkzkkNkqQa8C6
         iybx1cC0nZAl+/wh6mUmG8cq0ElkmK3aT+K6f+TjmKmIWU/Vb1Jm6Je+NkUyVrNDtG9A
         hYa8hiHhG6mozFY56XBA6sztOJroAD0ZTEPII6Z2AWe4/PNkqykzi7Ay7LlPNGcyGi4F
         5SgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683708; x=1791288508;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iu5g6n5umXm9G78v2BbkYqLmOOj4HoABcHZf3aQLLfE=;
        b=t/A4awCC6MQHEk2Os2Psf3ApYv6h4vywex0E2QqDB9akCKAYsTEoZrnN8l55oguU9m
         AlrNJTNIi/R6/OOTw0oVvWIyPNuoH3yLfzEXJ6iQhNovKxx+nGwjrGZz/8URlaCkwlmT
         jhoO1J8K1r8dsP7ieBbFXm0jdBOObeiPUrEYMHPgT6zvh1BAfCGdN6B2qE3t8JH/LOpn
         lqLXrh5zBoHltzawfGR3/biWvVHtzzGcqMWBd5owCCUTWQfgScgMY871WnD6BumKdm8Z
         1KzCfDlnlbWs+fBsY7cDVr/3n2l0pENvpB1AitXyY5u3KFys2cyMEcODyesr2Wzfu7yD
         6GtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdMPuXqSHSwYg8iVAyE1KMlBR2cGoumfWyiNTVAHhSsQ1BS6MpeyIuaPxWlzdKzkm3tT/hrLvdZdaMFXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRz5Owt/WeOvhz2kPNVpbB7+e7eZpqYmBFivF6E+/wK7z1HkHk
	nf//RGFX6C3Q2zvd3KWWzKOpk7KXGfPHS0T/XKQEyIaAUDkq3dgorSUodpt/0y27IHQ=
X-Gm-Gg: AYBFou0iIHqYW8SJyO7orF7Z2mhd1ilnok3ous01Sw+T9E+aN78g1Rm7IYRBQQIKgHy
	392wlVVxdE8KngPcLiOKAjGOOaHtQMc4Vfo7cso0VgJv02g9X9BInlgV8wPpwPzCzn5f9TVUs61
	iuLz0HaezZyhLj4/zxukWvP+Jj6w2EpQMMKJXbhGruHAUM0CheAmYsSAYBpifbm1RtjCd/y2MV/
	friNrTpaCHitwoyfT5p+oZx7PacMdN96P/e7u7xLgeMZjodD0H3DV8z4RcR/WJee6kK0QqEsJpB
	IAw2cbRI3Gz3aM+D8l7VxQ1k2kQGh+4hqZsowZWjMRDJ9WSZ77gOAz1B1h0TVHRNVDX3yDcWwaM
	k4L4DYtEnSQCEH+th3OqgpdemxxSDKILyz3OahklSraIq64NdRE281tyBt9497mjuJTSPIzVqfQ
	rY3Yb8eumE8EF10OWJjHQj/SS0XAMoKP10UXImDhISpAK0JRnFEusPyKeR5HVFI2RAK3a8Rdn+p
	4/J3g8=
X-Received: by 2002:a05:6000:1864:b0:487:360:58d8 with SMTP id ffacd0b85a97d-4887177c2a6mr26934678f8f.46.1790683708288;
        Tue, 29 Sep 2026 05:08:28 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502cf08sm4032367f8f.9.2026.09.29.05.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:08:27 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 13/16] printk: Try to register each console as Braille first
Date: Tue, 29 Sep 2026 14:05:43 +0200
Message-ID: <20260929120546.328616-14-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929120546.328616-1-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The refactoring even fixes two subtle bugs:

1. When only the Braille console is defined on the command line,
   the original code might attempt to enable the same console twice—once
   as a default and once as a Braille console. This results in calling
   the setup() callback twice and incorrectly setting the CON_CONSDEV flag.

2. When the same console is defined on the command line using devname
   and then as Braille console, for example:

      console=00:00:0.0,115200 console=brl,ttyS0,115200

   It would have two separate entries in preferred_consoles[] array.

   The 2nd (Braille) entry would be used when univ8250_console_init()
   tries to register the generic "ttyS" console driver. Note that
   the 1st entry still does not have defined the "name" entry at
   this stage.

   The 1st non-Braille entry would be used later when serial8250_init()
   registers all found devices, assigns "tty0" for the given "00:00:0.0"
   devname and tries to register the same struct console once again.

   The original code would call newcon->setup() twice in this scenario.
   It won't add the console into console_list only because the later
   check in register_console() would detect CON_BRL flag set from
   the 1st registration and return early.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 58 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 8a51c4b690b7..75d2a1085926 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -367,6 +367,7 @@ static int console_locked;
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_dev_console = -1;
+static bool want_braille_console;
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
@@ -2644,7 +2645,9 @@ static int add_or_update_preferred_console(unsigned int i,
 		braille_set_options(pc, brl_options);
 	}
 
-	if (!brl_options)
+	if (brl_options)
+		want_braille_console = true;
+	else
 		preferred_dev_console = i;
 
 	if (user_specified) {
@@ -3969,8 +3972,9 @@ int console_call_setup(struct console *newcon, char *options)
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
@@ -3981,8 +3985,21 @@ static int try_enable_preferred_console(struct console *newcon,
 		/* Console not yet initialized? */
 		if (!pc->name[0])
 			continue;
-		if (pc->user_specified != user_specified)
-			continue;
+
+		/*
+		 * @try_only_braille and @user_specifified define which
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
@@ -3995,7 +4012,7 @@ static int try_enable_preferred_console(struct console *newcon,
 			if (newcon->index < 0)
 				newcon->index = pc->index;
 
-			if (is_braille_console_preferred(pc))
+			if (try_only_braille)
 				return _braille_register_console(newcon, pc);
 
 			err = console_call_setup(newcon, pc->options);
@@ -4011,6 +4028,17 @@ static int try_enable_preferred_console(struct console *newcon,
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
@@ -4033,6 +4061,24 @@ static int try_enable_console(struct console *newcon)
 {
 	int err;
 
+	/*
+	 * First, try to enable the console driver as a Braille console.
+	 * It would have metadata in the preferred_consoles[] array.
+	 * But it won't be counted as @preferred_console because
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
2.55.0

