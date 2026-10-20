Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455098;
	b=L8cJ+DHFdZ/ZPdA83y+gYVei2Wyl0K5b4ADeHfYc7HDGzp/UkkzDRYr/TZ4N6YY3Brro
	 32wkdvWOx3HwTMzkrrAaKpDr99tULMC/RWIbl9ytJfkqANsqsjLkQ0C3TzjY4yoUyTHFr
	 ITYfuU79zfqZZKrXP9c7XeKPb6FzG8fHZkCGpa38HtygrsnXs5424f4D3dbbKnvS66qs3
	 TceoSaugB6wCHMaMzbl69KVktgCSZ2NGuvR7ExjgmzWOSewTet9SzYj/gPxVOseph7etP
	 qz4LclTBqelrJxfh6rLYtWZ/qczt3qIY0BFFZRtMm+bg8RQYE00lfISP3q5oIOz3ufA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DMO7T2iNmERwfPSUE7du4cnrIrr/G3qYPO2nLCSkaCI=;
	b=X7AsHGdyriMOPoUETM7cc4n7Idt+bMgDWaWgDpYkFQC9o0ChcdKMQYbw+tlG23Dr6AJj
	 c1iYgCNfg91Tp68MFuWqiQdye/qOsyvVGALbRoAnNbz7KT9PJz0Uk1J91yhrqroKONK2u
	 qKuu4iZhO0xLNGGOY+nLVcFbIWwqE1cMtpgKF5dHqm9GGyHq9AWrUYN7dCS6Nh5dcCcx5
	 //EuclGMMXElIqBkc+3Y6jvBwFU+Z9q2TZ1avLXwXZze8K/vzsUVRbTkilHiiBeqwyup1
	 DwJt05S1rSb2J0xP8IFtY9fLLo1JJ5Wc5BSstXPhbSjGjUgvXjStYbZDAqnRj8bNx8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dj/FiI7u";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A285560A2610
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A285560A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dj/FiI7u
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-157fe9d771bso1444025c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792455097; x=1793059897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMO7T2iNmERwfPSUE7du4cnrIrr/G3qYPO2nLCSkaCI=;
        b=dj/FiI7um2YE3xBHeg6S9gu47GcEzwI/QYb3BXFzz0nHWOeDkvONytshXAEOolJJSW
         FBEP59GeX9AAOKBRCCNMJ+/91IhwjEL1xzTtDa9dVBOjvegLCoSowDXnL9EecFzp/pYt
         1Pi166RjRBvNjCdE+9TJJHLp/p4A03aKUPVo0iNzAssDelqey7GGBfAqkV6Jwmo7riVS
         zk1/uRFfz8kqChjEaZcvFiXG9DkmyxtoZsu09PnW0sor2tv9svDaLiR12nLEABJniP1t
         THSjyh1hGNVtPznzEQvXurtTi/dXuaoM4iTStGo/WYve6UqEwaCgnJ+rGIEmfFPdl6UZ
         Hg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455097; x=1793059897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMO7T2iNmERwfPSUE7du4cnrIrr/G3qYPO2nLCSkaCI=;
        b=EakqFHYBUyMRrrMyLUI6oXQmWeQU2Flxc8KvDqUdPueHOJgODxWJc9eEXDk/+6D4hU
         wd4kA4+jxT2TMcbp0n3H7y/BZu0fQiS8PCxcRyqKlc9K4HBSp52or9KXKRCxkQDAmeJn
         o/RVF58zEywBJlwuhcgo8Os9ka9eclEhuuXs9+Bxeer2kOB/y7wvVQF3NsoUUDYFhhhY
         LXl+cWWtCqvig4HxvjCjFaYzGR1E2LZZFW+5YTMYPVBT8XUqryLeRUctHbd1mv892GY7
         hnDb8lDFNyeccXV+MWxAHQ25G2ERv8aGxDN7o4V0sNy0ukVKLz+14nDTz40G1dFOdpmH
         GXIg==
X-Gm-Message-State: AFq9FYLUTyHu0aRWuiUX0YIZdkuZbJApC1jSFHCJ/n3Vpu+ISBgpT2lI
	oT0a8W0Nhw4/tVfpu/6NPulFHGAmo8zHIX9yjmsG9BvREbBtnoti+wOunQmWxA==
X-Gm-Gg: AYBFou3SD4K7q+bfrV4FVkLrZ42g57sJYo5Flo9oCHN1qsEgP3nBL4ntjLiA5/WEUhj
	Gga6PtdgP8e0u6iY0ahHTjk+72LbSuYuS/w2Y2SDTSe5SfBDVHhFm4APULPQNb6kMVjEUdGZ1bh
	Dv7vg/Cx+B6/wJ0mx9gzG3BmKbRqoV5YeEVBmB6SnyufO/7NtMzZd4fWxSpFsdptd3QELxEHJbU
	hJbtVTrYlBJev5xrLA4BpOxtuD5ggss0MHFF59XI74bSOnqS1uIKYfEmVNPMwRA6zXyGekusBEU
	UiHoeC0ZBMzcdz8dSPMQYPer1xF/nf406YxvAM2GedeonZ0Q3XGXuiTPaGaIpLl1HvnsehisXfZ
	RNTy9ZU1DhL/ud2p+B2CgaO1KA6suHoQqakoQT32GEDZCBblFr09w66+YujSOnvfJklZ0Sm8uot
	ckPHb/I0z0FVY0ZQfBuWiA93GdP3ruq+zOoJatN8sWYE38yCTwvtAMCB541rqVZOSy8u/Zf5122
	gMovdttE01i+pA6WWVt3gxH8E+VcfswP07m1kxvb5tz7rcVyT2FKRE=
X-Received: by 2002:a05:701a:c951:b0:156:3684:96db with SMTP id a92af1059eb24-18515e402d1mr15277748c88.45.1792455096534;
        Mon, 19 Oct 2026 17:11:36 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37258981c88.0.2026.10.19.17.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:11:35 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Kees Cook <kees@kernel.org>,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [RFC PATCH 5/9] seccomp: factor out the user notification queue and wait
Date: Mon, 19 Oct 2026 17:11:20 -0700
Message-ID: <20261020001124.974063-6-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020001124.974063-1-xiyou.wangcong@gmail.com>
References: <20261020001124.974063-1-xiyou.wangcong@gmail.com>
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

From: Cong Wang <cwang@multikernel.io>

Split seccomp_do_user_notification() into helpers that queue a
notification, wait for its reply and take it off the list again. The
next patch queues a second kind of notification where a system call's
result is reported, and reuses all three.

No functional change.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 kernel/seccomp.c | 153 ++++++++++++++++++++++++++++-------------------
 1 file changed, 92 insertions(+), 61 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 336a7c28e1d6..793efcf0e626 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1235,6 +1235,91 @@ static bool should_sleep_killable(struct seccomp_filter *match,
 	return match->wait_killable_recv && n->state >= SECCOMP_NOTIFY_SENT;
 }
 
+static void seccomp_notify_queue(struct seccomp_filter *match,
+				 struct seccomp_knotif *n)
+{
+	lockdep_assert_held(&match->notify_lock);
+
+	n->state = SECCOMP_NOTIFY_INIT;
+	init_completion(&n->ready);
+	list_add_tail(&n->list, &match->notif->notifications);
+	INIT_LIST_HEAD(&n->addfd);
+
+	atomic_inc(&match->notif->requests);
+	if (match->notif->flags & SECCOMP_USER_NOTIF_FD_SYNC_WAKE_UP)
+		wake_up_poll_on_current_cpu(&match->wqh, EPOLLIN | EPOLLRDNORM);
+	else
+		wake_up_poll(&match->wqh, EPOLLIN | EPOLLRDNORM);
+}
+
+/* Returns 0 once @n is replied to, or the error that interrupted the wait. */
+static int seccomp_notify_wait(struct seccomp_filter *match,
+			       struct seccomp_knotif *n)
+{
+	struct seccomp_kaddfd *addfd;
+	int err;
+
+	lockdep_assert_held(&match->notify_lock);
+
+	do {
+		bool wait_killable = should_sleep_killable(match, n);
+
+		mutex_unlock(&match->notify_lock);
+		if (wait_killable)
+			err = wait_for_completion_killable(&n->ready);
+		else
+			err = wait_for_completion_interruptible(&n->ready);
+		mutex_lock(&match->notify_lock);
+
+		if (err != 0) {
+			/*
+			 * Check to see whether we should switch to wait
+			 * killable. Only return the interrupted error if not.
+			 */
+			if (!(!wait_killable && should_sleep_killable(match, n)))
+				return err;
+		}
+
+		addfd = list_first_entry_or_null(&n->addfd,
+						 struct seccomp_kaddfd, list);
+		/* Check if we were woken up by a addfd message */
+		if (addfd)
+			seccomp_handle_addfd(addfd, n);
+
+	}  while (n->state != SECCOMP_NOTIFY_REPLIED);
+
+	return 0;
+}
+
+static void seccomp_notify_dequeue(struct seccomp_filter *match,
+				   struct seccomp_knotif *n)
+{
+	struct seccomp_kaddfd *addfd, *tmp;
+
+	lockdep_assert_held(&match->notify_lock);
+
+	/* If there were any pending addfd calls, clear them out */
+	list_for_each_entry_safe(addfd, tmp, &n->addfd, list) {
+		/* The process went away before we got a chance to handle it */
+		addfd->ret = -ESRCH;
+		list_del_init(&addfd->list);
+		complete(&addfd->completion);
+	}
+
+	/*
+	 * Note that it's possible the listener died in between the time when
+	 * we were notified of a response (or a signal) and when we were able to
+	 * re-acquire the lock, so only delete from the list if the
+	 * notification actually exists.
+	 *
+	 * Also note that this test is only valid because there's no way to
+	 * *reattach* to a notifier right now. If one is added, we'll need to
+	 * keep track of the notif itself and make sure they match here.
+	 */
+	if (match->notif)
+		list_del(&n->list);
+}
+
 /* Report the system call's outcome on the way back to user space. */
 static void seccomp_result_work(struct callback_head *work)
 {
@@ -1276,7 +1361,6 @@ static int seccomp_do_user_notification(int this_syscall,
 	u32 flags = 0;
 	long ret = 0;
 	struct seccomp_knotif n = {};
-	struct seccomp_kaddfd *addfd, *tmp;
 
 	mutex_lock(&match->notify_lock);
 	err = -ENOSYS;
@@ -1284,74 +1368,21 @@ static int seccomp_do_user_notification(int this_syscall,
 		goto out;
 
 	n.task = current;
-	n.state = SECCOMP_NOTIFY_INIT;
 	n.data = sd;
 	n.id = seccomp_next_notify_id(match);
-	init_completion(&n.ready);
-	list_add_tail(&n.list, &match->notif->notifications);
-	INIT_LIST_HEAD(&n.addfd);
-
-	atomic_inc(&match->notif->requests);
-	if (match->notif->flags & SECCOMP_USER_NOTIF_FD_SYNC_WAKE_UP)
-		wake_up_poll_on_current_cpu(&match->wqh, EPOLLIN | EPOLLRDNORM);
-	else
-		wake_up_poll(&match->wqh, EPOLLIN | EPOLLRDNORM);
+	seccomp_notify_queue(match, &n);
 
 	/*
 	 * This is where we wait for a reply from userspace.
 	 */
-	do {
-		bool wait_killable = should_sleep_killable(match, &n);
-
-		mutex_unlock(&match->notify_lock);
-		if (wait_killable)
-			err = wait_for_completion_killable(&n.ready);
-		else
-			err = wait_for_completion_interruptible(&n.ready);
-		mutex_lock(&match->notify_lock);
-
-		if (err != 0) {
-			/*
-			 * Check to see whether we should switch to wait
-			 * killable. Only return the interrupted error if not.
-			 */
-			if (!(!wait_killable && should_sleep_killable(match, &n)))
-				goto interrupted;
-		}
-
-		addfd = list_first_entry_or_null(&n.addfd,
-						 struct seccomp_kaddfd, list);
-		/* Check if we were woken up by a addfd message */
-		if (addfd)
-			seccomp_handle_addfd(addfd, &n);
-
-	}  while (n.state != SECCOMP_NOTIFY_REPLIED);
-
-	ret = n.val;
-	err = n.error;
-	flags = n.flags;
-
-interrupted:
-	/* If there were any pending addfd calls, clear them out */
-	list_for_each_entry_safe(addfd, tmp, &n.addfd, list) {
-		/* The process went away before we got a chance to handle it */
-		addfd->ret = -ESRCH;
-		list_del_init(&addfd->list);
-		complete(&addfd->completion);
+	err = seccomp_notify_wait(match, &n);
+	if (!err) {
+		ret = n.val;
+		err = n.error;
+		flags = n.flags;
 	}
 
-	/*
-	 * Note that it's possible the listener died in between the time when
-	 * we were notified of a response (or a signal) and when we were able to
-	 * re-acquire the lock, so only delete from the list if the
-	 * notification actually exists.
-	 *
-	 * Also note that this test is only valid because there's no way to
-	 * *reattach* to a notifier right now. If one is added, we'll need to
-	 * keep track of the notif itself and make sure they match here.
-	 */
-	if (match->notif)
-		list_del(&n.list);
+	seccomp_notify_dequeue(match, &n);
 out:
 	mutex_unlock(&match->notify_lock);
 
-- 
2.43.0

