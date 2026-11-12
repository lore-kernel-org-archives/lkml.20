Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502535;
	b=D2G9OskW80pX6eNuXjWgsERr680Lio5AQck21/Yuum4Tg/LdlipR6amn0AMbK91tZYKL
	 0Z/kWO3jwkDppMm9gPyBQQVnIsQ3+MYitPTWwm8+w5AKBfbZFF5zhn2/xeJnW+51lPfe/
	 VZxNXBn4H7Uerny4KV3k1CyFfg39vQfgCOvyb6T0sFOd79I6Ytf9YpqPShx+cCgYZ1yMI
	 z7SJm4cgl/TyZ9B+izY7H/xFxnYg8LaO0BgXFFiGJGKyAzSvn3NERIARBVbmffynOpoXI
	 gz3qkYCsxB1qyw8LjV/rlF9rkb9oMbNwkfFflFCIsSAGNgN4veeaWGo0+oid1GsB+Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502535;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Scanned-By;
	bh=4E/EKyTm1+15XeS7xZLLaIXSQHKp+i0/LAPIvoR6Uks=;
	b=VEGz8eO83T9GEryRQZZS0fm+pJYu4B3C8J9vn6M6Ih6vL6+5w7usEhEcJotCHn4ww8VH
	 F6JR2IG4pCPmD2B9LhqwahvGrsWKJ4TlSO3RE0rUH7diyOyrFnecX01420/FBOeibjt8y
	 QFPGuJBCbyaUVrL0yC22OePrBNHopy7qOldao8crpSAzP02FWuf6pU7NM6J0LeEibDqm/
	 HjFMVR5qeAtpOt30VIhbv4hQSu8f1jnW3lr4t2o9fceM2OykU/ffHNfQ8lw2chMridlwp
	 sBc1zlLI6jKGutNY2Ejt+SomZ0UnPxDp12Bunje2e2qQKmbVjZebJeV/Rr4vj8S21HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GjqrxHKd;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E937606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E937606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GjqrxHKd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794502533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=4E/EKyTm1+15XeS7xZLLaIXSQHKp+i0/LAPIvoR6Uks=;
	b=GjqrxHKdhBozhRRBxTack/2eUTA9CGs28tVlr9dYVwRQkiKarXJWrnAt4c+0MJTcPsFp9+
	vxk8S6K1fPP5XdlwAwvDzxlYMQxgxX8bi+CjfU162/cxckBMiXoVURiB84iMQpZ1dzrGHk
	SAOXFkTF/16++AoeD+4PQlwrg0gSXRQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-G5li5wFPOQWsixFROzrRbA-1; Thu,
 12 Nov 2026 11:55:26 -0500
X-MC-Unique: G5li5wFPOQWsixFROzrRbA-1
X-Mimecast-MFC-AGG-ID: G5li5wFPOQWsixFROzrRbA_1794502525
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C45A4180034C;
	Thu, 12 Nov 2026 16:55:24 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 8BD9D18004FF;
	Thu, 12 Nov 2026 16:55:22 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Thu, 12 Nov 2026 17:55:24 +0100 (CET)
Date: Thu, 12 Nov 2026 17:55:21 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] sched/wait: kill leftover bookmark logic in
 __wake_up_common()
Message-ID: <avXveWTaLQ4Qlvgr@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The manual list head check and list_for_each_entry_safe_from() in
__wake_up_common() are leftovers from commit 2554db916586 ("sched/wait:
Break up long wake list walk").

This logic was later removed by commit 37acade0ce89 ("sched: remove
wait bookmarks") but the now-unnecessary list hacks were left behind.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/sched/wait.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index f8d6d8b9d03e..d0521b54eeb3 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -96,12 +96,7 @@ static int __wake_up_common(struct wait_queue_head *wq_head, unsigned int mode,
 
 	lockdep_assert_held(&wq_head->lock);
 
-	curr = list_first_entry(&wq_head->head, wait_queue_entry_t, entry);
-
-	if (&curr->entry == &wq_head->head)
-		return nr_exclusive;
-
-	list_for_each_entry_safe_from(curr, next, &wq_head->head, entry) {
+	list_for_each_entry_safe(curr, next, &wq_head->head, entry) {
 		unsigned flags = curr->flags;
 		int ret;
 
-- 
2.55.0


