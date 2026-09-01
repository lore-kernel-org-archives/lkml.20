Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3052C0F8C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788235780; cv=none; b=pBcEsbQ8Uzgm/u9vAet+Yey/dW1iCiPOp3Dz96lL7j2s80UvO3l/qAFbAmkGg6YrnzJrzXUexBpNgMgoqXdYfyev1AefWgouBsgsfWuFXgp966ikQL2gHiShuQzr2aADH2XI7X9+NGlcgAlNAMnxb4ruCRuOECDf6mDxNxYlap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788235780; c=relaxed/simple;
	bh=xL7JllbbGRazVzV9MwTrM9dYlxbLfcvzmACS4MPgagM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YZ6TyOiL/n6Js5RoI0pxrETMLLbUs6I3+j4MvcplX0PP8WrswuVc6eYoUBzkEAh75jSlOG8KJa5cBMOvU08ERizHVaw7J3LCbsJDxnx36wOvr6uS9WpFCBw1Klp0Z36YyiICRJ/fXd43Nte8V0aZYnoAdTZXxuffqsQi0gzIxYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: eddbdc74a5ba11f19a56ed5b684f684d-20260901
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:06fba296-8f4f-4ef1-af5a-2abadd636c18,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:3f4e74af2da3f9e0bff04b45bb6d29b0,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eddbdc74a5ba11f19a56ed5b684f684d-20260901
X-User: liwanwu@kylinos.cn
Received: from kylinos.cn [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liwanwu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 647617919; Tue, 01 Sep 2026 12:09:29 +0800
From: Wanwu Li <liwanwu@kylinos.cn>
To: "Aaron Lu" <ziqianlu@bytedance.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	"K Prateek Nayak" <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] sched/fair: Use cfs_rq->h_curr in the bandwidth paths
Date: Tue,  1 Sep 2026 12:09:27 +0800
Message-Id: <20260901040927.773631-1-liwanwu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901023851.GA4059187@bytedance.com>
References: <20260901023851.GA4059187@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 01, 2026 at 10:38:51AM +0800, Aaron Lu wrote:
> For this series:
> Reviewed-by: Aaron Lu <ziqianlu@bytedance.com>
> 
> I also run a test where a nop is affined to a single cpu and I can see
> that nop task can use more than its quota from time to time; with this
> series applied, this no longer happens, so:
> Tested-by: Aaron Lu <ziqianlu@bytedance.com>

Thanks a lot for the quick review and for taking the time to test,
Aaron. The periodic quota overshoot you observed matches the escaped
deferred-throttle path exactly.

Wanwu
