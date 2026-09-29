Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69751B191
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683735; cv=none; b=X3JsbUsi7sxwMG5wgc4Ig/6gPz3PbV9QMyEhPK+lWwTW8sN2nEFXEKJFxy7OlrAztTKP73q/2L/C6vEAYSC8HHbq/hIpV71W8zvkOCHeAJNihVszV4pY07957eH3FsQd5ljadDwBouT8gjCpHoqQgP/99fwJgGYc6rGAgZXPfFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683735; c=relaxed/simple;
	bh=uOMVVZsm+evZrh6X/1rsIbcDSS/8X6SBubTNscaoH/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BeVHabtNGAT2O05BrCOPA9G90klNt2Xd184bsEC+79fYv0uELmhH61IyLPMl1kC1qp/ChuCYu5CFnczFWWZDVKTkwLA9v7i7erlMPUlAO7fkllrJl0I4/bfNzTIS1iIqWRGOWRzBG2chjKUrHjji8u6cz3pIvtnwQRBi/48P33E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b5aspGUm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b5aspGUm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-488885c3844so482754f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683731; x=1791288531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OYQZ04NTvsfj2slYyK6bNKQoieoVAclYwP9wPLEilE=;
        b=b5aspGUmA3wT3erYuEO6yhtrjwC/5PIicVwQhidQaE9jMcS/ZLIRbLbZnaqPJ48oDV
         4o97uxvCETtQX5eZKBDJmvRkwM1KQphIzjfih5sWnAz3ykqeoEuNFORWg+ZWDJHoikqb
         BVb/gd4q8Fm/dH/DpgNeONwNc1YpBGyIUCiAIHtwAFtknyWDc/P2IRMf/0A8T9+XatA8
         AxTWgG8lbIEvMy0HMZz5dthKfx0tcuWaA7fNcL2kACaVaTX0HPfxNojeWyD4No3V+Y78
         meVbeutgtM7McCZyxXdEENKRs3FtTtz6WXVJS2kZC1yZk6RiHK/WB4QebwxJV2uUzABc
         208g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683731; x=1791288531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OYQZ04NTvsfj2slYyK6bNKQoieoVAclYwP9wPLEilE=;
        b=U/yX/82SdxWrXt+/qIR3TSXFKBUyo6hqlhw2V5sSt4D+4RUj9vIqc2FWlR7C2SRmir
         ah4aAKEuU0kjGzjO9IUJVO3vjgYzHeXSLH8zdbRswuCbj85sCooTyjRlqvF72hBJ1lBN
         6RrUzERHrBR1I9QnwQs/1W+1ixGEZj+Uoa808bS8we3BB3OTQKLZYAhkb0nY4tc5if0v
         V5mes9eo0hCE8xVQ06nPkg3chbi2FCpVbWOfjBigZu73p6K42QEbMnkdi7tCYxzznz/w
         JcDHMwmKBUvC8bkGyukTJvN3LXV6h9rfAPFrC2Smoqo1atk/F3hHlNqdqHouHZiyEwZg
         AsNA==
X-Forwarded-Encrypted: i=1; AKwUvByRQteA2JHAzkjCXuA8NXCLhpVNUrEkdn/9d1yaBBWv/OZbNImT9toxr/gpn3Pki2zzFI/1Ve5eheqkAuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq+Q2agdnwbJwp//A5iC10bizPEm2qcsdv7vjCVdOsCMQTBz5n
	Ceqtcgt9gujJNn4T2Wm3YVbhXQbuet71xaGVVV0TOK3JZ1VU+albCfjApygPPq71Te4=
X-Gm-Gg: AYBFou1LAl9vhJvNdOkmQftX5KU9Zs6fnljr2sAxoZyDX1rNN7CzAg9WsbikKXczA3J
	n8vKKyRvvUni3TEg4/7M0Xd7pHbGIdb2pSnTRAAKarSweJmqHYoUEIEyesIqFXMOCqgcbdcUFzB
	a5gmxHY+RXP+iWq1u5heCn9gIGSL9vibaR8ZRI+aue0573GRasuiLSCIbypAyCVH0oTe7QHpPOg
	vRDvpysSPi0vaM0UtXu++4/kUKwCDqacso2ed620RuPsrk0yqVU8CZHuyxFifxyERxFADq8MpNK
	379QpCDPh/+lwJ1A+8waNMIvO7CcS5lch2Ck8l/RQPVxVqDzCjO9IFvY6OWvjjRVl7BkdKOnH0R
	dOA/oPf6WPn06SajOzWPxLmNBGpalk6KY1fi86pKSaIPMpWqJsfM6uMZb5xcHmff2A+I3iPsi9Q
	yQ9+8s+MLsjyV7vegNMgwJHxi06wDO88lZy1cMNzCykP/WaEsGAdFGZ5WzZgG4Y+EmLUjsi3QJO
	WFPUgk=
X-Received: by 2002:a5d:5e93:0:b0:485:8226:c69e with SMTP id ffacd0b85a97d-48af1bd4b2cmr4257147f8f.29.1790683730997;
        Tue, 29 Sep 2026 05:08:50 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af507f33fsm3590429f8f.24.2026.09.29.05.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:08:50 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 15/16] printk: Modify try_enable_default_console() to return error/success
Date: Tue, 29 Sep 2026 14:05:45 +0200
Message-ID: <20260929120546.328616-16-pmladek@suse.com>
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

Assisted-by: Gemini:gemini-3 # commit message
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a2cc7bf3a62e..1eb749da9e24 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4061,18 +4061,23 @@ static int try_enable_braille_console(struct console *newcon)
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
@@ -4115,7 +4120,9 @@ static int try_enable_console(struct console *newcon)
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
2.55.0

