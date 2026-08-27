Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4033CB548
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819024; cv=none; b=MYL/StcDhSzKalP0jtuh8VzvzpbrYaAGtI1pRYZ83cFwkxk8OO3Z/AcXCWq+aQ2aZIN+5MrxBxwvmeNwuZp+7UcUg2jbSpjTnKgoEAeaEPmOMJ7cQPnod81LeFp8CwFVxRFoeELtvC5eXa2CHmW4TT8OATOCbsnd4csnQqxq/3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819024; c=relaxed/simple;
	bh=Vlyg9IfBvn7Utnt0sTMnC1Af4VknhBHMQ94K3SX0DGI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zm9Khxy7GllxSku9y0cTTMPGv7vJ4xzu1djVsGBpBjAsjEdo3F2KzVSvTOG1LrdbR7z6YLMT6P6lnhHJDWCLZAQaUWahO2PCbXeGps5YV7fqNtHjkjIE2r+mYOhx1ZrbCBFDSy23eFxLz5KenFM3LoUnTPaqou4lAxHPVlZrGvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 995d142ea1f011f19a56ed5b684f684d-20260827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:785c3fd5-e453-461d-acab-c7fb7f17cac8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:e96c646a83093e7c8faebbb4a7d0bc7a,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:1|-100,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 995d142ea1f011f19a56ed5b684f684d-20260827
X-User: fangqiurong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fangqiurong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1091692279; Thu, 27 Aug 2026 16:23:36 +0800
From: Qiurong Fang <fangqiurong@kylinos.cn>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched_ext: Skip per-CPU data allocation for built-in DSQs
Date: Thu, 27 Aug 2026 16:23:29 +0800
Message-Id: <20260827082329.3368255-1-fangqiurong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: fangqiurong <fangqiurong@kylinos.cn>

Deferred reenqueue tracking is only supported for user DSQs:
schedule_dsq_reenq() serves the local DSQ through
sch->pcpu->deferred_reenq_local and rejects all other built-in DSQ
ids. Every built-in DSQ still carries nr_cpu_ids * sizeof(struct
scx_dsq_pcpu) bytes of dead per-CPU memory.

Skip the allocation for built-in DSQ ids.

Fixes: 30b0515342db ("sched_ext: Add per-CPU data to DSQs")
Signed-off-by: fangqiurong <fangqiurong@kylinos.cn>
---
 kernel/sched/ext/ext.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index c539d15cda63..eaa64b8193e1 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -5048,6 +5048,10 @@ s32 scx_init_dsq(struct scx_dispatch_q *dsq, u64 dsq_id, struct scx_sched *sch)
 	dsq->id = dsq_id;
 	dsq->sched = sch;
 
+	/* Deferred reenqueue tracking is only supported for user DSQs */
+	if (dsq_id & SCX_DSQ_FLAG_BUILTIN)
+		return 0;
+
 	dsq->pcpu = alloc_percpu(struct scx_dsq_pcpu);
 	if (!dsq->pcpu)
 		return -ENOMEM;
@@ -5066,6 +5070,9 @@ static void exit_dsq(struct scx_dispatch_q *dsq)
 {
 	s32 cpu;
 
+	if (!dsq->pcpu)
+		return;
+
 	for_each_possible_cpu(cpu) {
 		struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
 		struct scx_deferred_reenq_user *dru = &pcpu->deferred_reenq_user;
-- 
2.43.0

