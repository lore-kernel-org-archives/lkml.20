Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705272;
	b=OuWripUCpB2StOmyu5qJ4L2Po0lX0+BdgwSrWwI5n6FwDv9w3iguADEDKfFR/GcySL8Q
	 Hs+gEnSVRpjy9/nqmgSn1O2+QBGvz3bPgoEy8CnNPxdqPf/2CJLfpQfe7JMDTTXLPLw14
	 A+edsLh/XWdCZNx5izd8UDOQk4p5jOqa0ZLVqqt7jy6x1Zhq2q1hOn91u3SxLZJpQehds
	 O3732UHGqq3Tb0f5vi4yWjft4ShDag10xCSknioQSQDNCd6uOwLWf+/qYopMwLNTJ8quT
	 dsYPaUCM8wGpWtci4zgUumSIeN0EZFQ1SQQQJt/qqUtSkb69dGOxJy1NvNHHJqr6klQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705272;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=NgXAqM0qPmcHVV/JqeuaT46DRhUMp7aVnLhDDt3Z2zE=;
	b=L0qLdunYSHhyMLp5XbOW9dUOCar91J9nWHq9pW5mPcFtw3lrKa8JsDdx4stkBVeSWU6l
	 UhToJWGbWpM6EYPIIV4VJqU6Kbqko8l6Wlb+BdCqY6sTK/2FVPjJYLDX6/WBWAJuvvUbv
	 huA1ruOV4nNQPJIopnV6E10LcPfotpq5nPCXkRlzUpjSecXQnXiVre6KWjI6yj5ELZMlU
	 g9quw4Cu2PNvvcPNt/xI5GJey/IzafwarJtMPwzJtZ4oX6TbFzMQJR1mnQh6/AfJjaSnS
	 EFfVHrLOYhmEHQAFbt2TRtcVyKkGn8c2GPVIjZN/KdBjLdwBMHYJ62suoZEn1BR+E9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eNmuNwrK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B141606D816
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B141606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eNmuNwrK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793705271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgXAqM0qPmcHVV/JqeuaT46DRhUMp7aVnLhDDt3Z2zE=;
	b=eNmuNwrKRdSk3g+VnvGAwhsfi9nEKlg7eEw1VBZu16yVCSWhiTLmJWPnE+G0LjBEp7jS4g
	gMZNjo9x+UIy0CdCJnoWFvMAD2AAfxH7rbHgp2VKz55e2y9Z/78VRErTVBh3C2oHAD0Oj4
	WYLTKJHhX73Txt/kUZ0fQipLLkSVxR4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-UZ9exbdeN12BlGXcOcJCmw-1; Tue,
 03 Nov 2026 06:27:48 -0500
X-MC-Unique: UZ9exbdeN12BlGXcOcJCmw-1
X-Mimecast-MFC-AGG-ID: UZ9exbdeN12BlGXcOcJCmw_1793705266
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 16741180134A;
	Tue,  3 Nov 2026 11:27:46 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A43597EA;
	Tue,  3 Nov 2026 11:27:42 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Tue, 03 Nov 2026 12:26:31 +0100
Subject: [PATCH 3/4] sched: Reject SCHED_FLAG_KEEP_PARAMS when it would
 change scheduling class
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-sched-dl-bw-fixes-v1-3-dd761fe005b4@redhat.com>
References: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
In-Reply-To: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Luca Abeni <luca.abeni@santannapisa.it>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
 Weiheng Qiu <weihengqiuu@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
 Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793705249; l=2224;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=RMJ3VyLgEmBQr1EIoGiES/CVU2JmtRSa3p3Aga0IjaM=;
 b=LRkRIkDB9d6UbP3jGyLrR81vitumGflJmOjU96fM9Ak4g7Ndw32eHsluo+qfjf4JvlvsPP53H
 bxxb5y9Fvl3AGYufrYLCyuFGgqJLulW52cFsHq1QJqknZaw/Qcq9K/R
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

SCHED_FLAG_KEEP_PARAMS was introduced for uclamp (a509a7cd7974) to let
userspace adjust utilization clamping without disturbing existing
scheduling parameters. The flag skips __setscheduler_params() and the
sched_class assignment entirely.

However, when a sched_setattr() call requests a policy change that
would switch the scheduling class (e.g., SCHED_OTHER on a
SCHED_DEADLINE task) while also setting KEEP_PARAMS, the result is
contradictory: DEQUEUE_CLASS is set (because prev_class != next_class),
causing sched_change_begin() to call switched_from_dl(), but the actual
class change never happens. This leaves the task in the original class
with its bandwidth accounting corrupted.

For SCHED_DEADLINE tasks, each such call spuriously releases running_bw
and rq_bw via switched_from_dl(), leading to accounting underflow.

Reject the contradictory combination early with -EINVAL. This does not
affect the intended uclamp use case, which always pairs KEEP_PARAMS
with KEEP_POLICY (keeping the same class).

Fixes: a509a7cd7974 ("sched/uclamp: Extend sched_setattr() to support utilization clamping")
Link: https://lore.kernel.org/all/2b5fb3f22bca6aa383be8f4781923392@kernel.org/
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 kernel/sched/syscalls.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index b215b0ead9a60..014697d454525 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -675,8 +675,19 @@ int __sched_setscheduler(struct task_struct *p,
 	prev_class = p->sched_class;
 	next_class = __setscheduler_class(policy, newprio);
 
-	if (prev_class != next_class)
+	if (prev_class != next_class) {
+		/*
+		 * SCHED_FLAG_KEEP_PARAMS prevents the class change from
+		 * actually happening (it skips __setscheduler_params and
+		 * the sched_class assignment). Reject contradictory
+		 * requests that ask for a class change with KEEP_PARAMS.
+		 */
+		if (attr->sched_flags & SCHED_FLAG_KEEP_PARAMS) {
+			retval = -EINVAL;
+			goto unlock;
+		}
 		queue_flags |= DEQUEUE_CLASS;
+	}
 
 	scoped_guard (sched_change, p, queue_flags) {
 

-- 
2.56.0

