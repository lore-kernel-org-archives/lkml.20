Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985716;
	b=K17/p7xWh9BykMxZda+OfP5zebGvN9AK4h0pxhmxQwIjYepIcZ5PDyexRdEVKQyuzOlz
	 Vnyn7uPK7Xm3J/O9m5kZhI0+iD0QJOFNzK+0qrGISW7ul9rKH5CxbHzY5BmMdeKWPjKTF
	 gXuqTqd0HWeSj49o6Ko8rtrrPH9o5+q9ZqjYtsPI5+Q9D9NoOobZrxgVK79y9rOLMw+z+
	 cjtlIe0fLQbctV7zEs9rAJnkUqz/BYKBwpKXRPsCVib2Zk4/umqg/wtfBF6lIXj/XfCrj
	 Y8/fILyGtUFz+XYD8kKQkyMmu8PJasa4wSprm0Vkpkgqcu8zFqB8HBlkigWIc2LtJPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3B/XdCDqxYihkjutrAtk9GxRkkYw7MTTo/yR+JY2t+U=;
	b=WXoBQdPjaSX2fb31aE0kj5FUnHd/eDMZBbkWGPnEDFhQjlsfd0eKenJde7Xd6KEhNa2R
	 FSRHf06Y6ws/zqCD2bOjdTY/mesxppPGrnaAmcrhU+2Z+IaDrb/hc6CvWdJsjXKh+UAVc
	 jKs8YcinItOOFXS4PhCFrIWI0ZlVIZz3VLU7c6zJLauMTXtg2sf5Uf0PjOSMFKfQY1ZUX
	 FGz26r5uvfh4W6Cz/W6WF12VCWTxuo+1sW9Q5n1QszLzJ6XXeWbIdaYG7chRYjdM58Aod
	 4h/s9EVF8An3pJIjO7x7o/fxnRC5Fwgepzcx9A8bZXR7ip/oJLSGPM580rk12Ee/c9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="MDfCgBM/";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188EB606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 188EB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MDfCgBM/
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9260735e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793985714; x=1794590514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3B/XdCDqxYihkjutrAtk9GxRkkYw7MTTo/yR+JY2t+U=;
        b=MDfCgBM/CQgrXyzGdmg2hzoAwWak3W99lvCTIT4EqWwTVBVETD05dGUcXYd4EsB1Lr
         jB+ELsHIhYnkUgvSnIsLgjJRQGlTlUefkPnq0V/ArzM2AUD+PurN7iV7YJ/HJ1NVSNwu
         3HQxBd9XpdUmNPyx6stUW28NpFtZMe0iVVj+FrouE2lXK+SX201S3Q5oEcwd71WVdtJF
         Y6BB5yflYCFeZpP0xbjJ+Chfzd5UQ19Z0Rirrmf6aN1I9/Nqwhnc44eybbf8b6Jcw/gM
         GSJ77Fpt3nfsPhapGS1zuMFEOKiYApJPVqft83YUCsVD04g3r6GCsY/k/TV13Ctk/XSF
         fCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985714; x=1794590514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3B/XdCDqxYihkjutrAtk9GxRkkYw7MTTo/yR+JY2t+U=;
        b=fI6SulFh1gBWModx8fa12gbMt+VkmZR2mLfMNGzxwpyrKoagwax0K1LsjBEe3KJFg9
         8C8EZ13D+IBKj2wLDGJouPYOilPmHWwxfB5Gf/kEBFIHOrQLVXBgBsfENbIt8Er0u0Yh
         BvuaMPbSJi6lFQ0A4r10El7fCnaCV4m6epnuCvbpEsONMeMl14/x453qhkqKhENbXAMg
         4GsaqXHJ+ShvjHumvkAaDjt9KYwY4F9u5AgWitbExyqTVNNDG6WFMaCS8uIumISb7A9H
         OrMzio9DGUZnBAfVleec9adXYOm2bEwhQ8SaAagBhNiL2gfmzcMGmR9VM39PoqfVhC8u
         CY+A==
X-Forwarded-Encrypted: i=1; AKwUvBzQeo/iY2IVBcMsJI4YtIrMXDjrpCXQ19vlsfLrCoG+Y5DYGCJsrUUHmKsmqNvRSG9ig7E2ze+sjWVj6lA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hhRPujeEoYRpyB0BwSVd1twbLJRe4tjUtmt4YSO2OAzdRJehF
	NEzRaN6hGDsF3LD7HzOFHC1u9f5tvtY32fEI0J1r+Gg4/4L7J+rdR8Eg98cYtJaOgLzcj9Z7RS8
	7LLUUI4c=
X-Gm-Gg: AYBFou1Xm4ms0kPwfX56xVnV+rSf9DMz9fd873Kt3nmKXJnkxsjltLlpuIfhLMqw+3F
	dNTxuDbbsU4igg8Lg/IJVtH9Xm0HWg7dCMdLve/2YARJQnsPh5WomlxFMhHBnTN7fqa4PLCbnt2
	adPQBkshaoWxqs2Sdf33f4OPL+reuJAdpCnrFqqYwMzHlOznoLPQyTfaJPgtgf9oBflzCBbJb/Y
	2YgE4hfrNpgGu4XrWwV6K9GaTrYzzpUSiWlQqR9ERENYNbPRHCezSYva3kxS2LeQ/HUgQWteJIj
	j5et+IosKWiEaF0LdbeOGkoarMGfcYQ+Ve5WC2Ny/o1RPgeHBWkA0/ARg2kA2AmnA/wOeoF2QR9
	A2zAaW8+r/6QUSmAve0GFJMkx3JQCK9oES/2LYkK9nZo2WFFJhyYVHXI1L/h8ohofU4KhaYaJRx
	/t5oRMTC5TqjKDfM9NDXcArsp3jZq2UWamQiECM6r9BoJx9Q4kIcj1Lv9A0p8coIt9qCHVBnxyD
	QtMMcFzQkt8iI+phN54t2o6mvKaLv8Ow1pRwawEr0QW53nUtuLBMUsI5IktMZRRXfnnJLmmyw+F
	tp8++Yrh985uYGNa6NFXjJ0CKbauaHE=
X-Received: by 2002:a05:600c:1d1d:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4b6df4f28bdmr54940675e9.16.1793985714465;
        Fri, 06 Nov 2026 09:21:54 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm146293965e9.5.2026.11.06.09.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:21:54 -0800 (PST)
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
Subject: [PATCH v6 08/16] printk: Ensure consistent name and devname when updating preferred console
Date: Fri,  6 Nov 2026 18:19:44 +0100
Message-ID: <20261106171952.207909-9-pmladek@suse.com>
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

Make sure that add_or_update_preferred_console() updates the right entry.
It is a paranoid check which prevents a potential misuse of the API in
the future.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 2c205c454321..60923b997e4f 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2564,6 +2564,8 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  *   2. Either @name and valid @idx OR @devname and @idx=-1 are allowed. [*]
  *
+ *   3. Only matching entries can be updated.
+ *
  *  [*] A valid @name and @idx will get assigned for a devname later when
  *	@devname matches during the device initialization, see
  *	match_devname_and_update_preferred_console().
@@ -2589,10 +2591,7 @@ static int add_or_update_preferred_console(unsigned int i,
 		return -EINVAL;
 	}
 
-	if (!pc->name[0] && !pc->devname[0])
-		is_new_entry = true;
-
-	if (is_new_entry && devname) {
+	if (devname) {
 		/*
 		 * A valid console name and index will get assigned when
 		 * a matching device gets registered.
@@ -2608,11 +2607,18 @@ static int add_or_update_preferred_console(unsigned int i,
 			return -EINVAL;
 		}
 
-		strscpy(pc->devname, devname);
-		pc->index = idx;
+		if (!pc->devname[0]) {
+			is_new_entry = true;
+			strscpy(pc->devname, devname);
+			pc->index = idx;
+		} else if (strcmp(pc->devname, devname) != 0) {
+			pr_err("Updating a preferred console with an invalid devname: %s vs. %s\n",
+			       pc->devname, devname);
+			return -EINVAL;
+		}
 	}
 
-	if (is_new_entry && name) {
+	if (name) {
 		/* A console name must be defined with a valid index. */
 		if (idx < 0) {
 			pr_err("Adding a preferred console with an invalid index: %s, %d\n",
@@ -2620,8 +2626,15 @@ static int add_or_update_preferred_console(unsigned int i,
 			return -EINVAL;
 		}
 
-		strscpy(pc->name, name);
-		pc->index = idx;
+		if (!pc->name[0]) {
+			is_new_entry = true;
+			strscpy(pc->name, name);
+			pc->index = idx;
+		} else if (strcmp(pc->name, name) != 0 || pc->index != idx) {
+			pr_err("Updating a preferred console with an invalid name or index: %s%d vs. %s%d\n",
+			       pc->name, pc->index, name, idx);
+			return -EINVAL;
+		}
 	}
 
 	/*
-- 
2.56.0

