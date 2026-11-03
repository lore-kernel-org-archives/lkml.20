Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705260;
	b=1UIS+BYZ8kieybLoT92/VD26EwTeAxxsGnxUWnkCjRaFQpRI0lDHsUFI6zbFrtyA67cE
	 zOReBinUOrN1PA5yhccsgRDYljvC6sGhSgCzmMJOeACXmEMhx2ZFSy46ZiTTafcOB69pY
	 0BBEikc5zBDSKNxGc2K7S/fbzgtBERmrLhgQWGl9zbRzSBt9YP3i2ZAfXBjlEGtyHuMwY
	 fw4uTXgCr6YiYyYNXPNPwh+O93rAbnBjmobc9j2o3v293XYlFeJd9PIPf17tM+3RjiRPF
	 x0tdnhUF6uosy1WGIiYOcByttM+NVH31PQROpkB2Gjv4xXAsy9taHL2f1k5iXovAx7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705260;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key:X-Scanned-By;
	bh=Anc5A5J+bPZVqmlY6skqgBhOxmc+Lv9xgEcRo76+hEU=;
	b=WY12KvYOKy5t/wKP8PY246BbjlUvTo/xWhXs1lD/BYAhN/ciXO+VC58w4oddTerdbA3Y
	 OFfpOU5kPQ5lBqeGtZpmgQ2pp29EM7Phwh2wjXlfS3X7KEDUGVnVIZyRpKRWyi54Kd4zH
	 HsafqXwgnVYHXh2Yij7T9/X4zhsysd5/jYxvvVcgh9XVzN+6CKpqd+aRg8KBtBNT0/zPq
	 lC95AMIEY+RCJGic4+I/tU9Hrv7m5pyty4bZmxOzi589ijeO0pLBbHUM1+e6Tj4h6PlS/
	 c1e6cHQZpBZFRz+gIWNfb4rjDSGrwdlSbKE6Uup0pp0RoUmeZXfYBzgPs0bHvfFsRAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ICWkL+jH;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246B5606C57C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 246B5606C57C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ICWkL+jH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793705259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Anc5A5J+bPZVqmlY6skqgBhOxmc+Lv9xgEcRo76+hEU=;
	b=ICWkL+jHHVfN3+nlX0OPepFNbgqexUzcPksLYkyYyaFQH2hOBlM+2NJ5NG0l5oYA1pU/xR
	PXWz7pA2beyw6igpXTxk8YvU3vAQkVLnfUrAzcZsvcQOQsw0TI43UN+uXT/8ywG7kUNm3g
	VkyOuQYQ7sqn5gCiuN+LW7TC6vfcR9M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-RY2ZLMJoPUm7vw4QbVXa-Q-1; Tue,
 03 Nov 2026 06:27:36 -0500
X-MC-Unique: RY2ZLMJoPUm7vw4QbVXa-Q-1
X-Mimecast-MFC-AGG-ID: RY2ZLMJoPUm7vw4QbVXa-Q_1793705254
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25370180134A;
	Tue,  3 Nov 2026 11:27:34 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D21F27E8;
	Tue,  3 Nov 2026 11:27:29 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 0/4] sched/deadline: Fix assorted dl_bw accounting bugs
Date: Tue, 03 Nov 2026 12:26:28 +0100
Message-Id: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QrCMAyF4VcZuTawVFHqq4xdNG10EZmj2aYw+
 u7Weflx+M8GJlnF4NpskGVV09dYQYcG4hDGu6CmanCtOxO1R+QTWhwkYXoiv/GmHzH07B2F4Ik
 vBDWdsuxDLbv+b1v4IXH+fUEpX06bkVV4AAAA
X-Change-ID: 20261103-b4-sched-dl-bw-fixes-9b921aa91b71
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793705249; l=1766;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=k9znXY55R0GGLdfZXBCKOGcvyKBZwnBQy0TUfeyMsJs=;
 b=aa7w47qa8Y9TFxvaiEmBVXoBdmb/kBjtYRr+++TOzJU4hduWMLCSGDv7aCpanLp5n4xmc46m3
 fDb079K6BElBVF9abq9ez+Kssq6lMz5MpHr0crTQMr/ICcgpQ2ianNw
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

This series fixes several SCHED_DEADLINE bandwidth accounting bugs that
can cause total_bw to leak or underflow, eventually blocking new
SCHED_DEADLINE admissions and CPU offlining with -EBUSY.

Patch 1 fixes stale root domain lookups during cpuset bandwidth
transfers for sleeping tasks, by using the task's cpus_mask instead of
the potentially stale task_rq(p)->rd.

Patch 2 fixes a total_bw leak when switching a non-queued task away
from SCHED_DEADLINE, where neither switched_from_dl() nor the inactive
timer would release the reserved bandwidth.

Patch 3 rejects the contradictory combination of SCHED_FLAG_KEEP_PARAMS
with a policy change that would switch the scheduling class, which
corrupts bandwidth accounting via spurious switched_from_dl() calls.

Patch 4 rejects sched_setattr(SCHED_DEADLINE) on exited (zombie) tasks,
which charge total_bw but never release it since the task will not run
again.

Series also available at

https://github.com/jlelli/linux.git b4/sched-dl-bw-fixes

Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
Juri Lelli (4):
      sched/deadline: Fix stale root domain in cpuset bandwidth transfer
      sched/deadline: Fix total_bw leak when switching away from SCHED_DEADLINE while !queued
      sched: Reject SCHED_FLAG_KEEP_PARAMS when it would change scheduling class
      sched/deadline: Reject SCHED_DEADLINE on exited tasks

 kernel/sched/deadline.c | 63 ++++++++++++++++++++++++++++++++++++++-----------
 kernel/sched/syscalls.c | 23 +++++++++++++++++-
 2 files changed, 71 insertions(+), 15 deletions(-)
---
base-commit: b99b7f60c5b473d374c68b53753153b4aa9e0702
change-id: 20261103-b4-sched-dl-bw-fixes-9b921aa91b71

Best regards,
--  
Juri Lelli <juri.lelli@redhat.com>

