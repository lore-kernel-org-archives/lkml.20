Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B3379ED7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848263; cv=none; b=PgGb30ny9RDvqXa1hNqTToL4dmgBAs1/YA2ounaKeZ8AVb2+czDof5tb62TFyb797x5Dyw9vd8191zZcOVMWrCn2mUDG66RgMeBsPhHsUWz9P8Fpy72PnZa1CkxZ+fnM6H3h4cA1ZeLOhf8XcMrqT9jjmROzUw0xRkZQX4fUzXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848263; c=relaxed/simple;
	bh=0mF3ZSgls4zxtkywuY/G/YHlHZNhj+aK/fZo0n1LSKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YaE5Cp0nPEOqyWzFsWlqzC/L5y1jImXkzzAAeg4a2r2o+tVvVy1naR1I7Xg5xq4YXfkZJfF8Gm4njLegcPS1HRg438kbM45uaEW4Nvv2tfkUNz9+sVT5B6oIGJ8ImpE0RJuNH/ovraZfS/tWnBjkgs75IZtPueddFK/F58WXMi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hITQUyCd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vMlTvLCd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hITQUyCd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vMlTvLCd"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788848260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZISxLtvrHQGEx+ZHSlk4XusC6V+9UtAas6lks1KQ5Y=;
	b=hITQUyCdgzX96vlGyqIK4h/Xeq+Rz/1GabbcPaNxtcfvsz0iTm1wLWfiQwbhXDd+6w5vbt
	zv9ZOD2q7VCmItc1HI51gaikF2x5OdUJAfxlnQMnEH9kenVX11IstFA97hei663FZ0bG9S
	Dv+gDSrSgc8kLbWx6g3ZYwHakM4GRAMTsxoWwoKc4iTcf77ZYsGzld3O1ndRLQRYNBB6FW
	8BWq16YeqAmo75/ukjsDQ4sW+DY8RXmMM1Xnw035kNEirvhAkLnJqTPcMbGANPeUP2X4C/
	HuvsLM+6iDYL2AnfINMiHIGWFNLVEjiNezVvBoeh1HuGlnpKowMg1xiw+evcJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788848260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZISxLtvrHQGEx+ZHSlk4XusC6V+9UtAas6lks1KQ5Y=;
	b=vMlTvLCd8+v1ebuYiyfScGUObuwjZ8srHjTDe3qIoueOkUEoJpZXmXSZYcK7v+OgUU6vuR
	YlLC72LRzj9LnuBw==
Date: Tue, 08 Sep 2026 08:17:33 +0200
Subject: [PATCH v2 3/4] timekeeping: Remove tk_is_aux() and its usage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-timekeeping-conditionals-v2-3-5ebc3e7e1da0@linutronix.de>
References: <20260908-timekeeping-conditionals-v2-0-5ebc3e7e1da0@linutronix.de>
In-Reply-To: <20260908-timekeeping-conditionals-v2-0-5ebc3e7e1da0@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848252; l=1552;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0mF3ZSgls4zxtkywuY/G/YHlHZNhj+aK/fZo0n1LSKY=;
 b=m+9uUC6fqEbmiuN0wf4H6hXTNgmgkG1Ly1n7wAMJmgGRhg9z5xiRmKUzVO2dD5CDS2MClJ/Lk
 SM+cqCF5lcSDmCKE2/HMNb5M0SA9HX+rX9omHBlp8yzwWYTQ3sbMtsl
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Any timekeeper which is not the core timekeeper is already known to be
an auxiliary one. There is no need for an additional conditional.

Remove the 'else if' and the now unused tk_is_aux().

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 kernel/time/timekeeping.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 12bd61e9b5de..5cdf6795c5a6 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -62,22 +62,12 @@ static inline bool tk_get_aux_ts64(unsigned int tkid, struct timespec64 *ts)
 {
 	return ktime_get_aux_ts64(CLOCK_AUX + tkid - TIMEKEEPER_AUX_FIRST, ts);
 }
-
-static inline bool tk_is_aux(const struct timekeeper *tk)
-{
-	return tk->id >= TIMEKEEPER_AUX_FIRST && tk->id <= TIMEKEEPER_AUX_LAST;
-}
 static inline struct tk_data *aux_get_tk_data(clockid_t id);
 #else
 static inline bool tk_get_aux_ts64(unsigned int tkid, struct timespec64 *ts)
 {
 	return false;
 }
-
-static inline bool tk_is_aux(const struct timekeeper *tk)
-{
-	return false;
-}
 static inline struct tk_data *aux_get_tk_data(clockid_t id)
 {
 	return NULL;
@@ -849,7 +839,7 @@ static void timekeeping_update_from_shadow(struct tk_data *tkd, unsigned int act
 
 		update_fast_timekeeper(&tk->tkr_mono, &tk_fast_mono);
 		update_fast_timekeeper(&tk->tkr_raw,  &tk_fast_raw);
-	} else if (tk_is_aux(tk)) {
+	} else {
 		vdso_time_update_aux(tk);
 	}
 

-- 
2.55.0

