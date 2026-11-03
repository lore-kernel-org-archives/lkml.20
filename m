Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705277;
	b=IHeTYncPJ2uaEPkCeprAwjlWmzK58+aJLPA4GFqghVVSSEBTgnycKjifBrs3OEoLPZUS
	 K9RsixdBJWx1el+7ZORt8Sr0qKClLgWIf7SDON/SiFZEv18hPan/YN3Puc2XERkKjoIFx
	 YdlTVvQ8eQtd8H0015AVCOLeRHRNspZ0IVpw9OQxudrEpQXduvwT+OuJjoKmrnpobBiQU
	 XcDxmPG158FFwdOP4/otoIzQhZFZSuaABGP5Hc5DOGKgGquw4WThUjUnp9rWT6HnZwL6Y
	 vOUWYMekj/TV6V+wscqwG2AV1AYo/SDQHojeiSzVyEzStHe7hLvAKbpZi+PWA9A/b5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705277;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=mymDHiUqd9CJFp7Lcxo92YLSCTJAaW1NhJpVzGvTQSU=;
	b=0kA/87AVksUQUt27DBJmOj5oo+Qs7PPR96qwIY265jxonY2/o3sT8cjLS7Y8+h/R6Kq6
	 5fZs9H5TKI5VPvgvK6nupt0tJvWLnYAzWmWU9cOi4c7OvGlhg1CocWJW5Hci641jgFf1m
	 gTGDBG3a4B6x6rojQxEGoj0p4+jXy37SfAn2yqlji1AhirkNQc8XBEg6amMdColEi6ufA
	 u+hv2XGZVVig7VkDO4ibwKXBVQqqXZHQTX/Ut7nuFxD7baZIpX65mc5Pkq2CxJKUfFN+h
	 LjW+giw/fGxJfnj+zDZW9A1gYIMaUXddI7gMoz3oYKg7J+nU7FG41+l8fHdGHu+WmsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gzlJ5d8l;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C8606D816
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 927C8606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gzlJ5d8l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793705275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mymDHiUqd9CJFp7Lcxo92YLSCTJAaW1NhJpVzGvTQSU=;
	b=gzlJ5d8l9aRDRDKdaTp84/nJQYNtnfcKdbdlinjC7a+aGguR43rNDw1+L0toof+Ybi33n5
	j1vxpOqogMFuTgxjRDkrk9Wk4psXYYzkGpMJUXWFb+EnTuOSRc8JrqDIyJO0Tzq9kqWSBm
	RBDPSASPGRKpKWPtQmwg/rs1OaSifE8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-hCJ2WhZ7OuGhfj8ScYFRpQ-1; Tue,
 03 Nov 2026 06:27:52 -0500
X-MC-Unique: hCJ2WhZ7OuGhfj8ScYFRpQ-1
X-Mimecast-MFC-AGG-ID: hCJ2WhZ7OuGhfj8ScYFRpQ_1793705270
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 997B11955F2A;
	Tue,  3 Nov 2026 11:27:50 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7799D7E8;
	Tue,  3 Nov 2026 11:27:46 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Tue, 03 Nov 2026 12:26:32 +0100
Subject: [PATCH 4/4] sched/deadline: Reject SCHED_DEADLINE on exited tasks
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
Message-Id: <20261103-b4-sched-dl-bw-fixes-v1-4-dd761fe005b4@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793705249; l=1392;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=IaAAtBUgTvL546vfXPLsJ0SRo0moceeAZGjpb3JV18M=;
 b=xM/T2Ok4eiSvr2wao0lz/kXwwNxaLAVnd+906/gWm83eiq7/EoF9R/QeICVKksPvkwDoeEzrP
 aRZNHUe5JPdBEjDpUDRcrG3YMTiziQvb8O3trDUNCnPJkFBn3z5EwX5
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

sched_setattr(SCHED_DEADLINE) on a zombie task succeeds and charges
total_bw via sched_dl_overflow(), but the task has already done its
final schedule() and will never run again. Nothing releases the reserved
bandwidth. Repeating this fills total_bw to the admission cap, after
which sched_setattr(SCHED_DEADLINE) and CPU offline fail with -EBUSY.

Reject sched_setattr(SCHED_DEADLINE) on exited tasks with -ESRCH.

Reported-by: Weiheng Qiu <weihengqiuu@gmail.com>
Closes: https://lore.kernel.org/all/3f6e6c87-645b-45fd-8fc6-8da5bc5b82d8@gmail.com/
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 kernel/sched/syscalls.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 014697d454525..af9ba357a2956 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -583,6 +583,16 @@ int __sched_setscheduler(struct task_struct *p,
 	if (retval)
 		goto unlock;
 
+	/*
+	 * Reject SCHED_DEADLINE on exited tasks. A zombie will never be
+	 * scheduled again, so sched_dl_overflow() would charge total_bw
+	 * that nothing will ever release.
+	 */
+	if (dl_policy(policy) && p->exit_state) {
+		retval = -ESRCH;
+		goto unlock;
+	}
+
 	/*
 	 * If not changing anything there's no need to proceed further,
 	 * but store a possible modification of reset_on_fork.

-- 
2.56.0

