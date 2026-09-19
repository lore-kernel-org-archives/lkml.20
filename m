Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C900339394
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856256; cv=none; b=QjQDe+5BnwPFKQ4EAwED8X/PUKHIxwlF8xZ5jtgwoftMlUyYJtCO57T8CYTdwnKr/CkRWhRodbE6chg6SpdsjzCGEKFFpvLzOEYgDLZVVf3jobz4BOxgFe4SDA3+g1iuEaY2thT2AuAgcybklyOnM91W/sP4LJz8EAey0sbxVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856256; c=relaxed/simple;
	bh=JRKJ20kzcszhrBlHiQtAWGYBf+UCMFqGHF0fqU2J2yA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZl5nHFzDKqlTqVTaVfJvLtr77Uj8zAtHONdyyON4EQRdPh9Bl5sm0ysmmwe0ADaW9f0lRYWmcGyFmLiSjFMZRS9sGgryy0wUBKaJSIp3ny+xG2i5KpQ94c6FjjkmyS2OSuVWLn79A8ZW8mpdIewdP3iPJaxL1vnETfnTSvqvzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=og/TrBSU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="og/TrBSU"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso1491046a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856252; x=1790461052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zz8Bpq/OwOz972e+MtcHWs+s4Vd8cR2rVv36JWbs+AE=;
        b=og/TrBSUKyGEGu7E2Oaivw+Tdve+1YS6yjouUYzj7c4kjECTeCNGsPgtANM+/LLpU8
         pn+vunE/+HwECvmIVtgj3kjdHFyUZEh80oLlDFBteO/B+9YRLYBImJw74p7nFCEWxdWm
         J9mKMamEGzORkLssJxNKpCizlCf4g7rvQdctfkOUYxQaE8M1stah2Et/rDDNUOYmgRY3
         GDZ0QoJz5SJifwLSWjJP7UGAVoMQB3WLFdNepxb7HVfhA5nO6Z0gyqvfocKLkoyL3Wuf
         yTtNzJywKqezHD1oe8k8kotD/UXdL0JCJjCI55kLnFzdHc63Sk9I1NU6p+Qw/p1PodCr
         QtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856252; x=1790461052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zz8Bpq/OwOz972e+MtcHWs+s4Vd8cR2rVv36JWbs+AE=;
        b=TTah82QhWS6ZbaEUBYyXw2QdwOtCGWpgee+LPK4lmWdcKoZQxRHvuXZ1BriKa0PtJa
         EzT4dvKZE96HKSnDL3deFtNgEp+19bax5WlUwWY6JT4iNr4ZtDzdaO0FwxcktdID0Mwk
         U0XP+nPvs2qmwB2FkqqJajLw/zoF/3VxqhueHpYy7DaAvVmTTghGPd5PmnPKVmhQkzmx
         CwQ4t3QbWIVxGDsmu9QhBHrfOuCRrvN6VBWNSvwgMAzCkg7lqSR6pCahcQFEg4BzIGp/
         eG+Y79zT+wYVNjE4o0rmjLpk6W+Q+XEnPNcQlGjfx0Wkk+2NaXlheO1J2YQvjqh/G4PD
         XRYQ==
X-Gm-Message-State: AFuF++l+tsQ9cjZ7J9AOoEiHFlpJMdI21CMWGDdqmbJSqqwTiBij+MVE
	FkmcWsXJ5yIqouPu9q/BDuJpDPbZBoUOWwZdJZcuR8gY7Kl4G7iV9J7SLpeX4sE0
X-Gm-Gg: AYBFou1cLqSl36rXT6wrkvlsseMfbDH0zssMoXWFzbKaxsg+WK2JVDZC/hYH4hVR4Ol
	tACLAqlb6QU5f0NVruz8kA5yNSDnRnRE8O4O+OreWZ6ABEzvPYHaczHUpiR8s78dbOMNT57EubJ
	93/WLiT6vgDpaKQJVO0uVSPOweHbT6gd1gqcMCcUIbjCpE5u3Y1e+9nlJwD05r24Wlh+J1Dfd0s
	NmXWfAEwCAD5A0SHdPvGEx2lbE+GGJ7yYE419MAPH99zrrZibl7MCfKFyGgGEKrsHM8s3/7Qyit
	2cbc8DI/2XsoTQjvM+RNkx3x1KO6WoalCS1+8No4DtrDKZXVBbKDi6GfvjiAROw60nt1s9rxfxM
	+7jEK6qP3+7TBLAB75P9r0dtJ/irARt6MwWCLtW6JhXKmTTOuyHryBAVZBgeEtAhavW/5S5BU9X
	7SYEyI9bCceAAS6VCuC0hZ0t6zEidS9Wd52eSC70ddIzbBJaE6sK1sqcpVrVI8M8Vg1dt5Qd2/0
	R11xr87AbDcxQMRWADKUKJiFTwph9yngCAsonMhVzeGvVO81l135LnmgnDSodkETCeWGCzRaOpm
	Svn7XGc4wQ==
X-Received: by 2002:a17:90b:2d47:b0:39d:eac2:7bb1 with SMTP id 98e67ed59e1d1-39e54ce1695mr17823484a91.4.1789856251754;
        Sat, 19 Sep 2026 15:17:31 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c615f05sm6424574a91.15.2026.09.19.15.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:31 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: oleg@redhat.com,
	akpm@linux-foundation.org,
	brauner@kernel.org,
	tglx@kernel.org,
	elver@google.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] signal: re-arm ignored periodic POSIX timers when handler is installed in do_sigaction()
Date: Sat, 19 Sep 2026 22:17:31 +0000
Message-ID: <20260919221731.3707506-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a periodic POSIX timer fires while its target signal is ignored
(e.g. default SIGCONT/SIGCHLD/SIGURG/SIGWINCH or SIG_IGN), the signal is
dropped without advancing or queueing the timer's sigqueue, leaving the
periodic timer stalled even after userspace installs a signal handler
via sigaction(). Check and re-arm any pending ignored POSIX timers on
the thread group when do_sigaction() transitions a signal out of the
ignored state.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/kernel/signal.c b/kernel/signal.c
index ec30550951ec..49ba188296c4 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -4351,7 +4351,7 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
 	sigaction_compat_abi(act, oact);
 
 	if (act) {
-		bool was_ignored = k->sa.sa_handler == SIG_IGN;
+		bool was_ignored = sig_task_ignored(p, sig, false);
 
 		sigdelsetmask(&act->sa.sa_mask,
 			      sigmask(SIGKILL) | sigmask(SIGSTOP));
@@ -4367,7 +4367,7 @@ int do_sigaction(int sig, struct k_sigaction *act, struct k_sigaction *oact)
 		 *   (for example, SIGCHLD), shall cause the pending signal to
 		 *   be discarded, whether or not it is blocked"
 		 */
-		if (sig_handler_ignored(sig_handler(p, sig), sig)) {
+		if (sig_task_ignored(p, sig, false)) {
 			sigemptyset(&mask);
 			sigaddset(&mask, sig);
 			flush_sigqueue_mask(p, &mask, &p->signal->shared_pending);
