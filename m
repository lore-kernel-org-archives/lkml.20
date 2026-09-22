Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF385352014
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040175; cv=none; b=QGl0BJo3GeSuMYxOF0KzRemmTISxofJOU01G++7IWvEA1Ac1nKtw45mVTuW0YztQDnxDv+2xtfbbvc4RyiSg43l0LE7fY7+8iTMVNI1LoAP0i6SIwQcaBH+Qmu5it0DRfXHAlxSK74UGFH1gpRB/AkSzDWlQa5VbkuICLqVLexw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040175; c=relaxed/simple;
	bh=K+FfnXxqpOwARf6sBlGuwolcSmz6gqc31RO65RLjJX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Cr1kWMgX0kox5Dvm/4Jb7N1heGearbK100oAS2H1tuVY3NU7V5XNgLyL4Pj5W30D0DI7XtOMS8za/xXMQ6Nos++AsVaNNehlCZxF3Q7qLLceWx4xa0Tswg9ZAkJcIczJdgyM6kmHeTwDupYqqvorW94lNiWb8fCvQ17vf+oLt7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xwf0Tz/x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xwf0Tz/x"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36A4FC2BCB3;
	Tue, 22 Sep 2026 01:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790040175;
	bh=K+FfnXxqpOwARf6sBlGuwolcSmz6gqc31RO65RLjJX0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Xwf0Tz/xlKPpp2CEUAgMk+UDu2RpOrYhT5PSFsyXO2O6Al+O64T1llvGr8qr+/Lfm
	 UFmI92ORneTpwyiYywPQGTJiuepPtYo3yQfF/c/OsD91w/XHjgaGMlK7qEBx+rCHiT
	 QPUdMOorZe6KD7PqUyDrb5iTPAxy6Gyk18plk2j5wmd4pkg7L/lu2D5bhgDcNjxh6T
	 jp32i+M+9AV7t3VoixTpe+gY3Rq2AdA8h+nJ0K70jSmu8BUU6QuP9Vt5yNMvcWbT2n
	 ZYKUv10B6bWXTSSvDGeRIJ23XsIYQ0d8MN7dQkevkFCfUHWDfbSP92HgdsW/K8tLtC
	 noI+nLrnVJB1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22817C982FC;
	Tue, 22 Sep 2026 01:22:55 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:22:53 -0400
Subject: [PATCH] clocksource: publish finished_booting with release
 semantics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-clocksource-v1-1-3e1d1b43e90d@vt.edu>
X-B4-Tracking: v=1; b=H4sIAGzYsWoC/yXMzQ7CIBAE4Fdp9uwaiqSKr2I8wHa1+APNYhuTp
 u8u1OM3mZkFMkvgDOdmAeE55JBiQbtrgAYX74yhLwatdKesbvHtkV6JnjlNQozGUq+8Np07WSi
 jUfgWvtvh5fp3nvyD6VNfasO7zOjFRRpqtHE+7g8oZGBdfwVdrTySAAAA
X-Change-ID: 20260921-mb-clocksource-49cd0b246a89
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790040174; l=1624;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=IAl0WbtKNjLjhpFUlA0q6EePMhVi1mc72PuB7KQ2WK4=;
 b=KNo/OoqiMXNeaiOdEXN5kppi9PH+zt3BA68jLeg85EjayHobskzow7978IsWzKW4M/OG66uA/
 dfpQkzE9RJPAhPNLn1W4tHEr9Kyw1O7JQ7vV8VVKg4NECG+kHf/i6+m
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
Reply-To: jaidevshastri@vt.edu

From: Jaidev Shastri <jaidevshastri@vt.edu>

clocksource_done_booting() sets curr_clocksource and then
finished_booting, both with plain stores under clocksource_mutex.
clocksource_find_best() tests finished_booting with a plain load before
it walks clocksource_list.

Set the flag with smp_store_release() and read it with
smp_load_acquire().

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 kernel/time/clocksource.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index f1253f579..f683a787c 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -1086,7 +1086,8 @@ static struct clocksource *clocksource_find_best(bool oneshot, bool skipcur)
 {
 	struct clocksource *cs;
 
-	if (!finished_booting || list_empty(&clocksource_list))
+	/* Pairs with the smp_store_release() in clocksource_done_booting(). */
+	if (!smp_load_acquire(&finished_booting) || list_empty(&clocksource_list))
 		return NULL;
 
 	/*
@@ -1188,7 +1189,8 @@ static int __init clocksource_done_booting(void)
 {
 	mutex_lock(&clocksource_mutex);
 	curr_clocksource = clocksource_default_clock();
-	finished_booting = 1;
+	/* Pairs with the smp_load_acquire() in clocksource_find_best(). */
+	smp_store_release(&finished_booting, 1);
 	/*
 	 * Run the watchdog first to eliminate unstable clock sources
 	 */

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-clocksource-49cd0b246a89

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>


