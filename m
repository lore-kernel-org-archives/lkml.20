Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569DF370ACD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040225; cv=none; b=u3x76mxpQ3xpZOtBCrTmS1Hzi/uVQnuA7odo7eUt+udfd6mOOvp/zBMADcyFnJyhSsYHAttdDlz/oHdzG68AR0S/5j/K57XzljcBd+0TqNnPlygQNr+0mhW7eGtII+g7UqSq/tlQzb5Wr/6l12xg3svnbEEryxsuxvxUYWS0Dxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040225; c=relaxed/simple;
	bh=efuoZ/gqjzwcOGQEiMVLV55OBVVEW05zAmsZ0cXjX2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oBvoQPM3c3Yyxy9yGHeUDOtEVzLTexcQ2kYLzKhlFwCtyQqLyAp/fMQg8GBbblB9YYjxhJP0bhfZMd8geiZJa+bnlNrVUiA4ce2uOTCnKwMBX4ASWuLTARpjXN5kIPpF3jbQSkY6GMBVVhCUNtmbIjo54R2540coBYiv0Btnaxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3X+d6nY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3X+d6nY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB737C2BCF6;
	Tue, 22 Sep 2026 01:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790040225;
	bh=efuoZ/gqjzwcOGQEiMVLV55OBVVEW05zAmsZ0cXjX2A=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=c3X+d6nYN7O/lMTljrIcgY7g9NETXmC2UxdOTj7G8iJzam4b0ZjE4j7dBhC2BGkSU
	 Fdr3nGiWD1nvN5KtPw5BqBWuf6ZQro66uGXTQyE5QOn5SxcwGSJms9sn78PDkX/h4n
	 6YctAadvj6osWfIhsOUKxYaymhP2l36Rnu1drZzVreXuKeyj3ek95xn+Ep7/kBM+Mn
	 dP5I/+ChL+aAwAzeFzgccqe6OkTG9GSC+LHPq3K3a/1UacuevHC4TS4fMDyZQ4K2SW
	 HZmkv95Y9IJ+vtz8jnklPOPMlH3l3Fw6rmU61KiAJxivzdvv6F8l7NWgwDoRKvhM32
	 B825OgHRmtXPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D748EC982FB;
	Tue, 22 Sep 2026 01:23:44 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:23:43 -0400
Subject: [PATCH] timekeeping: publish suspend_timing_needed with release
 semantics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-timekeeping-v1-1-282f1f4121ed@vt.edu>
X-B4-Tracking: v=1; b=H4sIAJ7YsWoC/yXMzQ6CMBAE4Fche3ZNW//QVzEe2jrAaiikRWJCe
 HdbPH6TmVkoIQoS3aqFImZJMoQMvavIdza0YHlmk1HmrK5Gc+94kh5vYJTQsnV1g5OptYKnPBo
 jGvluh/fH3+njXvBTeSkNZxPYRRt8V6KN82V/4OiPtK4/eyVLVJIAAAA=
X-Change-ID: 20260921-mb-timekeeping-ab8fe52810ec
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790040224; l=1568;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=cFvsdCri+WSttL45t1gLuvPcu/++U/qXQAilyA7gKyA=;
 b=XsfM9ZYumY0npb7drz9mhmdcbVQsWkgjIVxLDsQgPI6ECxkHMcIuF7OPgNWn8CvdOC7Iet4E7
 eKkWzMB1GQVCmuioJ9SQfOt/hqqSQMYRUzAM5PuyPGMc0nDTKRh6YSj
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
Reply-To: jaidevshastri@vt.edu

From: Jaidev Shastri <jaidevshastri@vt.edu>

timekeeping_suspend() sets suspend_timing_needed with a plain store
after it has read the persistent clock. timekeeping_rtc_skipresume()
reads it with a plain load on behalf of the RTC class during resume.

Set it with smp_store_release() and read it with smp_load_acquire().

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 kernel/time/timekeeping.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ea2e6e55f..2b15268c3 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2141,7 +2141,8 @@ static void __timekeeping_inject_sleeptime(struct timekeeper *tk,
  */
 bool timekeeping_rtc_skipresume(void)
 {
-	return !suspend_timing_needed;
+	/* Pairs with the smp_store_release() in timekeeping_suspend(). */
+	return !smp_load_acquire(&suspend_timing_needed);
 }
 
 /*
@@ -2272,7 +2273,8 @@ int timekeeping_suspend(void)
 	if (timekeeping_suspend_time.tv_sec || timekeeping_suspend_time.tv_nsec)
 		persistent_clock_exists = true;
 
-	suspend_timing_needed = true;
+	/* Pairs with the smp_load_acquire() in timekeeping_rtc_skipresume(). */
+	smp_store_release(&suspend_timing_needed, true);
 
 	raw_spin_lock_irqsave(&tk_core.lock, flags);
 	timekeeping_forward_now(tks);

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-timekeeping-ab8fe52810ec

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>


