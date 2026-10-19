Received: from out-2uec-a116.jellyfish.systems (out-2uec-a116.jellyfish.systems [63.250.43.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE5B4A6CE6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402834; cv=none; b=FSStCqe+3fYfjRBBKrkNIt1adDdUtayVre65exrZnMM+0Qgn2XMQygmWl9sPzkBKzjV2ljAcGOo8YqyKaf2FRBAgnX4d8zB3WmY6uhTFlqMqac45Tf586HsuzTWu81nbCYB8mOgkkrlFZkLKXsQyh83MtweCPdBlYB88c8pZ4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402834; c=relaxed/simple;
	bh=UClMkYBS145x75YYlnwvo5OtDimcpH8JH6ZsP6dQZtY=;
	h=From:Date:Subject:To:Cc:Message-ID:MIME-Version:Content-Type; b=JXZnh683cShnTfAWcGyG1yDkWwX44EUdisezmkHOG2WL708CIbuIFZq+5oUSaXFBq0woWvOVddL3ZbvuDsWNaGZz1HoTUk3Q+YyWECzef3H/YuO1QQiwJP5rHolORCPxm/RJYgQ5WuUI2MbENsKPdkhDQbBSG/175C2YoLsBlKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=YzBDFhBc; arc=none smtp.client-ip=63.250.43.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="YzBDFhBc"
Received: from [10.18.116.108] (unknown [151.145.76.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7Vs50Zd2z6tkN;
	Mon, 19 Oct 2026 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1792402827;
	bh=AMgrGG42i9dcBRekdy3ZB4NasAQz7tvPBfGn1moPkiA=;
	h=From:Date:Subject:To:Cc:From;
	b=YzBDFhBckXvxr+vtblb9bjPozDLfAyKZKYWpC75FvlUYFV8oGNqPj1y/l1VtAlD4Z
	 /r/CMl82W52/HBn39+3cxnswe1aL86bg5msa1Za5Zs+Sxk7agiO1ELlh4rAKSbIoQ4
	 Fck+2k3pn6xlM4YC9RZFdf3RsEjxyWhi2C5fBsGCVCiBVtvNCy6gAN1dvo88PJwfTD
	 XU67lsJUYnCvgonM9f++AmuTRvU1pL+L8CHajomhkJP9in0xpGUoDoGZeRFkoVzmMn
	 Yv1fWqKUHiuAvSlASewtfoE6f2RS9qcs7bUPk2Dx9XxuwBA1WrTuIKsz4ht27LFGgQ
	 rQ81bb2juvL/Q==
From: Tianyi Chen <hi@tychen.cc>
Date: Mon, 19 Oct 2026 18:39:27 +0900
Subject: [PATCH] eventpoll: propagate wakeup source creation failure in
 ep_modify()
To: Alexander Viro <viro@zeniv.linux.org.uk>,
    Christian Brauner <brauner@kernel.org>,
    Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org,    linux-kernel@vger.kernel.org,
    Rafael J. Wysocki <rjw@rjwysocki.net>,
    Arve =?utf-8?q?Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
    NeilBrown <neil@brown.name>
Message-ID: <179240281988.1700986.8309527041821666235@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Envelope-From: hi@tychen.cc

When EPOLL_CTL_MOD adds EPOLLWAKEUP, ep_modify() ignores the return
value of ep_create_wakeup_source(). If allocation fails, it returns
success with EPOLLWAKEUP set but no per-item wakeup source, so the
requested suspend protection is missing.

This can happen without fault injection on SELinux systems: creating
the wakeup source's sysfs nodes can require GFP_KERNEL_ACCOUNT
allocations for security.selinux xattrs, which can fail when the
caller's memory cgroup is over its limit.

Create the wakeup source before updating the event mask and data, and
return the error if creation fails. Leave any newly created per-epoll
source in place until ep_free(), as ep_insert() does on failure.

Fixes: 4d7e30d98939 ("epoll: Add a flag, EPOLLWAKEUP, to prevent suspend while epoll events are ready")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
Tested on v7.3-rc2 in QEMU/KVM:
- fail-nth: MOD 256 trials, ADD 270 trials, and MOD with an existing
  per-epoll source 120 trials; no contract violations.
- SELinux + memcg: 20/20 MOD calls returned ENOMEM with the old mask.
- tools/testing/selftests/filesystems/epoll/: 66/66 passed.

 fs/eventpoll.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index e0c4bf88a838..872396a0ad64 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -1982,11 +1982,22 @@ static int ep_modify(struct eventpoll *ep, struct epitem *epi,
 {
 	int pwake = 0;
 	poll_table pt;
+	int error;
 
 	lockdep_assert_irqs_enabled();
 
 	init_poll_funcptr(&pt, NULL);
 
+	/*
+	 * Create the wakeup source before committing the new event mask.
+	 * Leave the old mask and data unchanged if allocation fails.
+	 */
+	if ((event->events & EPOLLWAKEUP) && !ep_has_wakeup_source(epi)) {
+		error = ep_create_wakeup_source(epi);
+		if (error)
+			return error;
+	}
+
 	/*
 	 * Set the new event interest mask before calling f_op->poll();
 	 * otherwise we might miss an event that happens between the
@@ -1994,12 +2005,9 @@ static int ep_modify(struct eventpoll *ep, struct epitem *epi,
 	 */
 	epi->event.events = event->events; /* need barrier below */
 	epi->event.data = event->data; /* protected by mtx */
-	if (epi->event.events & EPOLLWAKEUP) {
-		if (!ep_has_wakeup_source(epi))
-			ep_create_wakeup_source(epi);
-	} else if (ep_has_wakeup_source(epi)) {
+	if (!(epi->event.events & EPOLLWAKEUP) &&
+	    ep_has_wakeup_source(epi))
 		ep_destroy_wakeup_source(epi);
-	}
 
 	/*
 	 * The following barrier has two effects:

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.56.0

