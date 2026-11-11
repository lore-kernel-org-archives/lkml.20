Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412157;
	b=A26zNdM5vWq1EpLLxTAie+3I3Nm8qJ05cFiOYr6VqXakhujancCpUKKOrJlSFq/3AXm3
	 E3Tzsm4D0ef30C35DS8Y9/631d5UUEO1s0TZWEMJiHzTGrNLnwVLPudEtICOY3CsHQaS4
	 c4IpJ5NbQgQ3w+kPsz9A7Tm9he8XQoL/k/qEq0oPWXL9f6464GjP+MP+mDuIyOkB8NKO4
	 jecJJgnKutPLXHnigLWgRQL75vuBagNBcEjm+HPlzgPP38axx5QjCdgDGyevwyi3TVikb
	 MhQ+AsN23UeQvEurf0IluC0ZPIpgxLUbFBkEV5IvQwJgvPeIYB4x+WQPCOKV+YjH/Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y4S3w90quI9shg+G5r+d7cVg5MriRy6W+RybDeZ+ZJo=;
	b=0TFgld5e/Y7AM/JkOjDND0Xcl5Gdv1XpzQao1wmX/T83vxhilZFZXwNtP3fHaAU3Gakq
	 aiMKKfOiDXeODf9lFxMrTghfgE2fPNrGNA/0Ek/J27c4lgiMSNs2y3CUJYpIGDOyxq+xB
	 /ujBmqlqK4VDGWIeo/FYad4U0pwbJFuymv6ULVQTcSIkgJAzgpVOOVAw6ZSR23WkE2SqU
	 guWWiv+sBXNiP/CmXqUG4qzFcUXBYQrycuI7XMQnFTWgzsvZBKyGfzMmz6FULxgaACRNK
	 79T5gIzxJW2dwW3nXNgaHoQ55jUr9ufPNQYIe22vELT9zdcif6ygY5eaSZG6EIPAt6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bnmlNngD;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373A5606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373A5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bnmlNngD
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4922523d1afso1988571f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794412156; x=1795016956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4S3w90quI9shg+G5r+d7cVg5MriRy6W+RybDeZ+ZJo=;
        b=bnmlNngD9dDpyRlYzwPsid1whf7wP9o4Bcj9yqyHUqOxUAADkFQBquS4nDB+2uqNeu
         eRbyG63viI3fD5s22MvgEyjiB6yhjROsVx/ORBOmDs2ra2NbCuxdy5/dr9xeFhzHvu3p
         fDMpGh2Q8raWGYeaIrgqCMx6+ykzXRWIjfcrV6IEEGy1G9tmhVbJ5E5XkgqI7vUviy8i
         u1Qkur1MU3Wcb/MffRvrWzUx7Gyrhg/eReyIT2VJpVW79PDVcC8Hufqa06TUO+W75lwb
         Wdu09oZmdzKTTWG7nN7J/W0pwG4gILi7jpElrQMwR/6bdf93WBZ95N+0wNaSp7CXYIl9
         xicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412156; x=1795016956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4S3w90quI9shg+G5r+d7cVg5MriRy6W+RybDeZ+ZJo=;
        b=y5qWob2X3uV0JM8My1HhzpKXwoH8K8PqBTCuMnvEFa7toIMDulEQ6uXh66euqxm7rD
         OaWQpRA4MJxdM4O7Qao7IAjWZlE9OW4AbZ1Hh5GVVZH44BWIWvCzcGMUC7nkVBFcn8pK
         iVMs4pocUxGOMAU51JnIEdw1xGVeOyMFfIRRjzyHs0YpMMx8ybF3MpYb0mO+DD4DmeoZ
         XfymNtHQk5Q+O2S6k2tT3rgz8KWI4T2ffmmnydPLT7IKQcV0N/i7fWfEtFfrKWBkM6pc
         0m1tpk3S4QmEIXmzRr2jXlveEN86x/e0hO8DPBLKXcLVW2b4Ol6NcoLSdz1Nj1teSm72
         5mRQ==
X-Forwarded-Encrypted: i=1; AL+hErFYMmshJXU4janHgAn3/JOzHGkKZB8lAkWUYUb2lfIoUmjfwUgMuzdZYsP1pRBMKtHQq4Y1TbBS/wxlnVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CpJdP0dPgr9ubzK/Fmods+AvvVq+PIB424GkUikXS3bsUxKOI
	KCfqa6rJcSASOzKPfzkeYCyqDTBQZM1xpnAG2kIBMds9oc6eBz5TIbahoF9Kh0yVs58uFZlMSem
	FlZYyn/E=
X-Gm-Gg: AYBFou0+VPsR6Jgg3aM3RFsUa0E0UFNysS9xBoeID0PCoOCN01RPNax8oLZUTJRzQHC
	zIlRf5D16FUspE6Zg719/rWhJN71li9t2XF93k8MqcHHNTBN52wi9pIt5jE5tcZWLTTv1W8cS38
	cTYVuW/Ar66zejUvrjz4klWuyqGkqzCMeQAKI5dlbaEXUNscNKqfoPtjLRfeGnOpa8GJN/iimfc
	UaAK3nZYiEZrrZRg5wXwciF+EkH+ZuhCLrjVkyLRKHZeE91UvlErfZw8+e4HO13Z1RbV1PVvAn5
	DP+h8iW3uQL68C2SceoLcii1ZQae92H2PeCD9JMIDGtloC5DmpIh8hpI27eyzvlJ5vKTrbQISqW
	jeiRzFDjdjzQGC6VLPbj+UcFXet5tCFeYolXXP36/uOOYH31L8XzIGXZlo5BhmOSmLfjV81zJ75
	ySkG094JRK2oc6eqOjXs6AscflJDNYoEoI3343/5S9vIn0L4jLQDrvVNJR4IL2nu6MoGc0rlRrb
	OqshsXPCddcGnjFol6aFRzjEUjQV4IieQpMaGPls0bFmjB2BlVEOzD2CwYFqcSP86ot1gjI+p/K
	aRIeZ5EK/KAddAhadfLibgm6njbKhzoSJtJKoImClatuLs9dPu16
X-Received: by 2002:a5d:64e4:0:b0:491:96fc:9f0 with SMTP id ffacd0b85a97d-499c7552529mr5381970f8f.15.1794412155585;
        Wed, 11 Nov 2026 07:49:15 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498361f6bacsm11898729f8f.35.2026.11.11.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:14 -0800 (PST)
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
Subject: [PATCH v7 04/17] printk: Separate code for adding/updating preferred console metadata
Date: Wed, 11 Nov 2026 16:48:03 +0100
Message-ID: <20261111154816.71103-5-pmladek@suse.com>
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

The logic for adding or updating a preferred console is currently
duplicated within __add_preferred_console(), making the code difficult
to follow and prone to consistency issues.

Split the code for adding or updating entries to avoid code duplication.
Make it clear what operations are done only for new entries.

Use this opportunity and replace an int with an unsigned int for
iterating over the preferred_consoles array.

It is a preparation step before adding more consistency checks.
No intended functional changes.

Reviewed-by: John Ogness <john.ogness@linutronix.de>
Acked-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 114 ++++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 40 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a46c9bd184de..898e060a26a7 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -366,6 +366,7 @@ static int console_locked;
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_dev_console = -1;
+/* Set when there is at least one console preferred via the command line. */
 int console_set_on_cmdline;
 EXPORT_SYMBOL(console_set_on_cmdline);
 
@@ -2543,26 +2544,34 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
 }
 #endif
 
-static void set_user_specified(struct preferred_console *pc, bool user_specified)
-{
-	if (!user_specified)
-		return;
-
-	/*
-	 * @pc console was defined by the user on the command line.
-	 * Do not clear when added twice also by SPCR or the device tree.
-	 */
-	pc->user_specified = true;
-	/* At least one console defined by the user on the command line. */
-	console_set_on_cmdline = 1;
-}
-
-static int __add_preferred_console(const char *name, const short idx,
-				   const char *devname, char *options,
-				   char *brl_options, bool user_specified)
+/**
+ * add_or_update_preferred_console - Add or update a given entry in
+ *	the preferred_consoles[] array.
+ * @i: index of the entry in @preferred_consoles table which should get updated.
+ * @name: The name of the preferred console driver.
+ * @idx: Preferred console index, e.g. port number.
+ * @devname: The name of the preferred physical device.
+ * @options: Options used when setting up the console driver.
+ * @brl_options: Options used when setting up the console driver
+ *	as a braille console.
+ * @user_specified: True if preferred via the kernel command line.
+ *
+ * The function adds or updates an entry in preferred_consoles[] array. Also
+ * it updates some global variables which are used to make the right decisions
+ * in register_console().
+ */
+static int add_or_update_preferred_console(unsigned int i,
+					   const char *name, const short idx,
+					   const char *devname, char *options,
+					   char *brl_options, bool user_specified)
 {
 	struct preferred_console *pc;
-	int i;
+	bool is_new_entry = false;
+
+	if (i >= MAX_PREFERRED_CONSOLES)
+		return -E2BIG;
+
+	pc = &preferred_consoles[i];
 
 	if (!name && !devname)
 		return -EINVAL;
@@ -2576,35 +2585,60 @@ static int __add_preferred_console(const char *name, const short idx,
 	if (name && idx < 0)
 		return -EINVAL;
 
+	if (!pc->name[0] && !pc->devname[0])
+		is_new_entry = true;
+
+	if (is_new_entry) {
+		if (name)
+			strscpy(pc->name, name);
+		if (devname)
+			strscpy(pc->devname, devname);
+		pc->index = idx;
+	}
+
 	/*
-	 *	See if this tty is not yet registered, and
-	 *	if we have a slot free.
+	 * Historically, the preferred options are stored only by the first
+	 * caller who prefers the particular console.
 	 */
+	if (is_new_entry) {
+		pc->options = options;
+		braille_set_options(pc, brl_options);
+	}
+
+	if (!brl_options)
+		preferred_dev_console = i;
+
+	if (user_specified) {
+		/*
+		 * @pc console was defined by the user on the command line.
+		 * Do not clear when added twice also by SPCR or DT.
+		 */
+		pc->user_specified = true;
+		console_set_on_cmdline = 1;
+	}
+
+	return 0;
+}
+
+static int __add_preferred_console(const char *name, const short idx,
+				   const char *devname, char *options,
+				   char *brl_options, bool user_specified)
+{
+	struct preferred_console *pc;
+	unsigned int i;
+
+	/* See if this console is already preferred. */
 	for (i = 0, pc = preferred_consoles;
 	     i < MAX_PREFERRED_CONSOLES && (pc->name[0] || pc->devname[0]);
 	     i++, pc++) {
-		if ((name && strcmp(pc->name, name) == 0 && pc->index == idx) ||
-		    (devname && strcmp(pc->devname, devname) == 0)) {
-			if (!brl_options)
-				preferred_dev_console = i;
-			set_user_specified(pc, user_specified);
-			return 0;
-		}
+		if (name && strcmp(pc->name, name) == 0 && pc->index == idx)
+			break;
+		if (devname && strcmp(pc->devname, devname) == 0)
+			break;
 	}
-	if (i == MAX_PREFERRED_CONSOLES)
-		return -E2BIG;
-	if (!brl_options)
-		preferred_dev_console = i;
-	if (name)
-		strscpy(pc->name, name);
-	if (devname)
-		strscpy(pc->devname, devname);
-	pc->options = options;
-	set_user_specified(pc, user_specified);
-	braille_set_options(pc, brl_options);
 
-	pc->index = idx;
-	return 0;
+	return add_or_update_preferred_console(i, name, idx, devname, options,
+					       brl_options, user_specified);
 }
 
 static int __init console_msg_format_setup(char *str)
-- 
2.56.0

