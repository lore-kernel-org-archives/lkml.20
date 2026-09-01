Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A33ABD9F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788235809; cv=none; b=mu2WB8TcygjmCPtAX6Gp4ObXNTJieSM7IIOUZjBR5VfVJICknC4jZt5BRVELfvWKa6Y0H3JbcFhxBac/H3NnoDg47lNzhzUdUZUiEu8rkOYB8C4kHy7foPrLDggFERIuM/kGjb2YWDOb2sEOESX7/0DayZATs5nQj/D5Og3SFGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788235809; c=relaxed/simple;
	bh=xL7JllbbGRazVzV9MwTrM9dYlxbLfcvzmACS4MPgagM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bsb7dNqg6Eo9Uxp2vDy+FSEY6TOt+cPwpaBFVj5/U3w1xskdfVtICwiqofkGXO9H3XnGqcPgliJOhppvKuOfrxfDgYYAgKBevsKK0EHtz/rfnCDEY14I9/3i70du/Mtaf/2hKAV7OCM+DGHOsPK8n115qJXVu1ga+GqL3SnxODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ffa7aeeca5ba11f19a56ed5b684f684d-20260901
X-CID-CACHE: Type:Local,Time:202609011209+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:539ee9e7-1715-46f1-a11e-1980ff13f533,IP:0,U
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
X-UUID: ffa7aeeca5ba11f19a56ed5b684f684d-20260901
X-User: liwanwu@kylinos.cn
Received: from kylinos.cn [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liwanwu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1263123586; Tue, 01 Sep 2026 12:09:59 +0800
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
Date: Tue,  1 Sep 2026 12:09:57 +0800
Message-Id: <20260901040957.774006-1-liwanwu@kylinos.cn>
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
