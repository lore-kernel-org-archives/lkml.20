Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099591;
	b=jrf/yE+sj9gSn2DeZQuDTSOZ/aKj6cYiPUPCUhEfOdJhQkRiqrhvKRw1ZoXoVdjNCctP
	 KSTRhoJv5CFpjLIr7VsiG+aFs0thvThs5lX2K/VEwrYcawtB7nCvGurW5rbuVOWr1GhMn
	 zKI4uTqa9ovQRZgPVNTxgR7VHfYyM3heJEU1mPpYi3bp2MJmdYJD3tVHhUZEN84yiEs+D
	 XkyUNAONm7a6egN7jYJGJUy10+nsjIxbkPgEsGAfLByiXbWOXFvFI4wpacAxXYgEPMa+N
	 wIL+esBsnrzEGLyib5Csx/FW+50a36JRCLkJtVXzhevJTKwt1FzTIu3Pc/HlEcyKuhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099591;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Eto463AI7CPVW1h1ILi+4HlwmPZTj+WdyAZ+V95FEmg=;
	b=hfFpf+nMp6sJAjp2KzU6coma75arin8sA6+ini5wgloUk9NzBDtXP5wz4JnDR3V93Jyy
	 +HPRvPbYINAlvtcSijZjgFy7nCqXeU7T41Cs1qPkZl1GzzSzCiOwmTZF7ITXlVeUpKjd3
	 86tmSaaIhELFu5Bjri+WvP126x3lQI05PLhEooWuo8l5zOoHjd3dgQfew52kIwW3s7D+p
	 CHM9Xjmge3ZsXYEAwjJOQYqOMrp/A1Gze5+CGZ47NzYZpn/2cgbo5WWMw0Djy2yFLinsS
	 VLU5DDMpMXSUvPDrM+PMq/EfzBrAz4KKITq7yKkJui29Rx5ErrYFrvY2fCo7su9FmCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.145
Received: from out28-145.mail.aliyun.com (out28-145.mail.aliyun.com [115.124.28.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD1606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7BD1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2311619|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0246483-0.0011987-0.974153;FP=4522591901444260955|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045166233;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jqlRnFq_1793099579;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jqlRnFq_1793099579 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 19:13:00 +0800
Subject: Re: [RFC PATCH 2/6] sched/fair: Add is_smt_buddy_run() to skip SMT
 domain
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-3-likunyu@open-hieco.net>
 <20261021123510.GH2823843@noisy.programming.kicks-ass.net>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <23a15314-42d5-d939-399c-ff206214f547@open-hieco.net>
Date: Tue, 27 Oct 2026 19:13:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261021123510.GH2823843@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2026/10/21 20:35, Peter Zijlstra wrote:
> Same horrific indenting fail. Surely you've read surrounding code?

In the new patch, these issues have been resolved. In addition, when the SMT
scheduling domain skips a scenario, update_group_capacity(sd, cpu) is called
automatically to update the equivalent CPU compute capacity value.

-- 
thanks,
kunyu
