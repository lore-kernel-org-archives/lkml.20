Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F057D20F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962848; cv=none; b=V+8ZHGHeTYxLWFbyfHWvLHIqcxr5tcZ8Qtu+1wWkuyilIp7tS0Bnb1W8x8XSEBDVZ841XuBT3hcDGABHq7nHK5SSuB9ymjx7BbcRQKke6vcDLeeGvIvdfBs9qil4kCfV6ziP2kr+LeW5mZp3e4yMYf9f6pa+MA4zgbY+azNCVZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962848; c=relaxed/simple;
	bh=VXImSdmG9ENsA3S8nRRYwumOP75z8sJaTWCpSwpRyXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KyqWWFOFdvUW+qor7n5ICaW6Iwfm0HISXn7R/e0e3EvmzO0p9VVG9LAo8xzGpDCa896V7B+1YYU2I9uluKFi6EL288yJQ11sO8E94brKkMPxBwOKUtSVMe+PxJ10nhPLv5o3pqzCqYEbngfSzS8HdqaURYutOK/iiM3znQNMLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dUUPyHRB; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PX/KhmC8; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dUUPyHRB";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PX/KhmC8"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hg2gc0fqmzMlG8;
	Wed, 09 Sep 2026 16:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788962844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EIVXfvpMQy3POz3k6sI7qM278Ra18FyQWq4sC/wEVmk=;
	b=dUUPyHRBNC8vwqSs9S3xOeOBHsHHIj1x4rF51tf1797Nt9LIFejhRxrTFmaC5sI1a2sq+0
	73V92iG6JEoUQoxYjUNv5F1gyVK38o5MqrN6+yON1cfIm59PsOrlvS8iKZJJ5wMARhnSPT
	EbyeJYMyOWABKz8jn/UgMvvCZylTeIsm8tNI2PgPpLWGdHN21CpU9xz3xdaG3oFkyWYesA
	cGPFcaPmA8RxIhzICjhkWJ6otZEJq/KndLqkP6CILG+5bDsluSij83/c/A4UmDG9LClF3F
	BQ37mw/Dbg1MmCGauLxCLs3fi5jRTY+yAmKmAfuYRcYrts5Y/doc9tKOE90Xfw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="PX/KhmC8";
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788962842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EIVXfvpMQy3POz3k6sI7qM278Ra18FyQWq4sC/wEVmk=;
	b=PX/KhmC8h70xCPSecewVyWidOOhpfgtwmtba6muD48wSJOFiqBCXjn252U5qL8XzajORXW
	5tjB7D9TETYlmibytdoVRyHqmu8hyfzW3XqVS5h6qYd/mUAqPWBLeSsBBLK17MgOS39aWU
	dsF4YUDheMN87uAydczrR/2AWED6BUjl5GM35JJ/YUd65B+wVSPrBWirQO/jtl//BX2lJ1
	riVb4CGn3QfoqsgY6CDyF1rxoxgKXZqZqCJMuMSirQz5kTTo0f4xcw0bCp6Ys9yCdXgdfl
	aasIf2gIV+nLZCoVhKrj0nsEYVTj0J9HY32htL0Asab55BhxFPzDn1x6L19e3A==
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] locking: mutex: Fix brackets in comments
Date: Wed,  9 Sep 2026 16:07:03 +0200
Message-ID: <20260909140706.1366872-1-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tkaqhwijxnb3bqdkwyxg6x3dpyfc8inh
X-MBO-RS-ID: d0b665a5c8aa3d42138
X-Rspamd-Queue-Id: 4hg2gc0fqmzMlG8

Remove needless '(' from sentence and add missing ')' to example code
Add whitespace to "CPU 1	CPU2"
               -> "CPU 1	CPU 2"

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 kernel/locking/mutex.c   | 2 +-
 kernel/locking/rtmutex.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 942a939ce..5636ad9f4 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -11,7 +11,7 @@
  * Many thanks to Arjan van de Ven, Thomas Gleixner, Steven Rostedt and
  * David Howells for suggestions and improvements.
  *
- *  - Adaptive spinning for mutexes by Peter Zijlstra. (Ported to mainline
+ *  - Adaptive spinning for mutexes by Peter Zijlstra. Ported to mainline
  *    from the -rt tree, where it was originally implemented for rtmutexes
  *    by Steven Rostedt, based on work by Gregory Haskins, Peter Morreale
  *    and Sven Dietrich.
diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 5a9534c71..3947bdc2b 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -143,7 +143,7 @@ fixup_rt_mutex_waiters(struct rt_mutex_base *lock, bool acquire_lock)
 	 * lock->owner still has the waiters bit set, otherwise the
 	 * following can happen:
 	 *
-	 * CPU 0	CPU 1		CPU2
+	 * CPU 0	CPU 1		CPU 2
 	 * l->owner=T1
 	 *		rt_mutex_lock(l)
 	 *		lock(l->lock)
@@ -172,14 +172,14 @@ fixup_rt_mutex_waiters(struct rt_mutex_base *lock, bool acquire_lock)
 	 *				 unlock(l->lock)
 	 *		lock(l->lock)
 	 *		fixup_rt_mutex_waiters()
-	 *		  if (wait_list_empty(l) {
+	 *		  if (wait_list_empty(l)) {
 	 *		    l->owner = owner
 	 *		    owner = l->owner & ~HAS_WAITERS;
 	 *		      ==> l->owner = T1
 	 *		  }
 	 *				lock(l->lock)
 	 * rt_mutex_unlock(l)		fixup_rt_mutex_waiters()
-	 *				  if (wait_list_empty(l) {
+	 *				  if (wait_list_empty(l)) {
 	 *				    owner = l->owner & ~HAS_WAITERS;
 	 * cmpxchg(l->owner, T1, NULL)
 	 *  ===> Success (l->owner = NULL)
-- 
2.54.0

