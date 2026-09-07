Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910912EC0A2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764148; cv=none; b=sKb/0y/0RC8E+VwyXwPEjtnwmEe0wym4efWueDgGEovC73+hBYoe3q8rGEMvG1im2XU3G1RbYNWCmcmfGH+EEkHJa+faqXkhbdQKAtSFLaZ4EKG1eEdfJmZUFHOkheLbde6PsnjL4OsvdfhDe9jNVKJPFLEk95itppX7a+piYfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764148; c=relaxed/simple;
	bh=Pq2R3HSiTkS6MP22IxQ5zS6UvdCbWRwx0gYC3wlJw9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G5XFtRACnkvcLNHvNcCkyUZMgVJpxQPEK7FpbdauSx67YwFxqcHU2jLdUBXrt7AeoTPhL4jJKcMmhCaUM58gh6iu7fTrJsn2j8INf1ep7m3LoRkAyXaOVwIopJiEouxpX55FVyjc2/4IfYNGjJ/1j7dhfrnIc0icUPp1wRSkl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkQo/mkl; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkQo/mkl"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso3286968a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764147; x=1789368947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJUWpK/Ppg9/jjat+ueEG1zYg5DKi3VtZgO1V28E2Z8=;
        b=VkQo/mklVk1fIQKpPrK1umDIlhxKsGlfbQrKLnroJLkAM3vohPifeRifLPGo3YR1FE
         OHcRv7kNgBLXoJHU74NA0/B7MuLE3OdJabn3TGRfxsidaNJW7O1EVBNPUxCZCjTLan9y
         mQlFGr1Fa6qwrh/kc7ZtL9qgOTsKkA6B6e+YlZG7/uSA3wmZ92yxllcsHk6sfdSSF3d3
         i9tUPQpbJyTnR6ao+ODrvTEdRw5MimZfpVkURO2OLBJyGStZG63+2UcSdlERvqytuSla
         Lydsnx0llFWLCTDPPuQeDU1/qAjJhbhkKowoYfGyPNpLZ0dAdhiryjFFJP8aaJWci9xV
         2pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764147; x=1789368947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJUWpK/Ppg9/jjat+ueEG1zYg5DKi3VtZgO1V28E2Z8=;
        b=HciYQkin3y2jgVAIfstSpeUj1c3x1kP6RmlGq/cl9Y3aGwrIdGFOYhQ35wk5t2yGC/
         pi+CHk4egDTXllzWoGZ6i7H/v0i6SKiQDR6k16bwZa9sWFQk0QOzrGoTzwLqbaKloajx
         7C6Iu4A7+nTGmD74goL8j+Dy71Rj+gOXlfgzSYd+24rWfnucupADU0XTWkJyRXpIJuEE
         pIK66zVXfRqxJ8uJIkiq/mr3cT7e8RY5VJJyldPCzRTWPy+uNWjD1XdW0OXO8N/juOGU
         l5i/1m1e89W8RGB/2terRpiP7sm/CpTLWMrcnTrOrBoJLrzyS9itzOzAndpfoBfKsTvl
         J1gw==
X-Gm-Message-State: AFuF++nlvoGB1MsBMnoOibkHS6cfBaElSn/JVbPmSUowkzEusRQtKXxA
	S/cwiSaInNEMq+2sdSgDblmTiGmSUJKZF9ae0s1/f/Hht2uk9VJgt38I
X-Gm-Gg: AYBFou0edIH3WwDlqG5bxwg5S0ATqK66XPgVNrIX8iken03hoELTjKom8ogAbyadeO2
	Yew681qak9QO6O0nhERSqMlLsojbJniRkByNn0qZlNYIJJW+8k2kIcPxa4MnjkAaeH17wOcrSLB
	wx2KqLYPn30GxYPZ6POYioG8w6nYJ904r6rok09Buus7HEGFms9g6bXvWz5X/zXXS4xOI7p5ghu
	aeVrnd9hAQtfJAZRfn2hCIdCQls86rnKSKFB1LKBgBPrGjxLD3WfzTYlFWQ6NEoRyZGO+v016c7
	UIAE66qpXVyvcHS12oEF7ROk5+v7zVCBlYhDSeUEaATkQ1p0EvHQWzmRGApVxhslFGsvkh1nhmM
	rlxbUH5gCGSdpmUICW0i460nTTnjhwpcD1Yr8172wZ/rZyBEsQc2oYBgKHfpnZ8EeFdxNenv+Ib
	/jsMcrL3UrUq9CinRlWpKINUHMinJSUTWMTQLCi/kKj+mTm+UxO0H3yFBGkMtyy0UDAKDxoDWc6
	o64DDhqCizja1lfH8DuEIz6KQ==
X-Received: by 2002:a17:90b:52c4:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39b260d3375mr31833498a91.2.1788764146878;
        Sun, 06 Sep 2026 23:55:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm22519604c88.0.2026.09.06.23.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:55:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] timers: fix typos in comments
Date: Mon,  7 Sep 2026 12:25:41 +0530
Message-ID: <20260907065541.29953-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 kernel/time/clocksource.c     | 2 +-
 kernel/time/hrtimer.c         | 2 +-
 kernel/time/timekeeping.c     | 4 ++--
 kernel/time/timer_migration.c | 2 +-
 kernel/time/timer_migration.h | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index f1253f5795c6..c269342d2f64 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -532,7 +532,7 @@ static void clocksource_tick_stable(struct clocksource *cs)
 		cs->tick_stable(cs);
 }
 
-/* Conditionaly enable high resolution mode */
+/* Conditionally enable high resolution mode */
 static void clocksource_enable_highres(struct clocksource *cs)
 {
 	if ((cs->flags & CLOCK_SOURCE_VALID_FOR_HRES) ||
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 530d61257b9a..256a628f2d9f 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1576,7 +1576,7 @@ static inline bool hrtimer_check_user_timer(struct hrtimer *timer)
 }
 
 /**
- * hrtimer_start_range_ns_user - (re)start an user controlled hrtimer
+ * hrtimer_start_range_ns_user - (re)start a user controlled hrtimer
  * @timer:	the timer to be added
  * @tim:	expiry time
  * @delta_ns:	"slack" range for the timer
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ea2e6e55f37b..503da53e3104 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -431,7 +431,7 @@ static void tk_setup_internals(struct timekeeper *tk, struct clocksource *clock)
 	if (IS_ENABLED(CONFIG_GENERIC_CLOCKEVENTS_COUPLED) &&
 	    clock->flags & CLOCK_SOURCE_HAS_COUPLED_CLOCK_EVENT) {
 		/*
-		 * Aim for an one hour maximum delta and use KHz to handle
+		 * Aim for a one hour maximum delta and use KHz to handle
 		 * clocksources with a frequency above 4GHz correctly as
 		 * the frequency argument of clocks_calc_mult_shift() is u32.
 		 */
@@ -1902,7 +1902,7 @@ int timekeeping_notify(struct clocksource *clock)
 	if (tk->tkr_mono.clock == clock)
 		return 0;
 
-	/* Disable inlined reads accross the clocksource switch */
+	/* Disable inlined reads across the clocksource switch */
 	clocksource_disable_inline_read();
 
 	stop_machine(change_clocksource, clock, NULL);
diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 059d43355e65..9a8fb19029ba 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -1769,7 +1769,7 @@ static void tmigr_connect_child_parent(struct tmigr_hierarchy *hier, struct tmig
 		 * The previous top level had prepared its groupmask already,
 		 * simply account it in advance as the first child. If some groups
 		 * have been created between the old and new root due to node
-		 * mismatch, the new root's child will be intialized accordingly.
+		 * mismatch, the new root's child will be initialized accordingly.
 		 */
 		parent->num_children = 1;
 	}
diff --git a/kernel/time/timer_migration.h b/kernel/time/timer_migration.h
index c9c1c29f011d..d30731836006 100644
--- a/kernel/time/timer_migration.h
+++ b/kernel/time/timer_migration.h
@@ -8,7 +8,7 @@
 /**
  * struct tmigr_hierarchy - a hierarchy associated to a given CPU capacity.
  *                          Homogeneous systems have only one hierarchy.
- *                          Heterogenous have one hierarchy per CPU capacity.
+ *                          Heterogeneous have one hierarchy per CPU capacity.
  * @cpumask:	CPUs belonging to this hierarchy
  * @root:	The current root of the hierarchy
  * @capacity:	CPU capacity associated to this hierarchy
