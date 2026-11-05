Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898726;
	b=FD0lyU06XLtIwQgx/DNTIAQpKH3DUxF+FsMR4ceRwl6OyUeqSwnH6ceTiWnE/GWIH1gw
	 aO1EJJLcF2IRpV3Ez0vLfBUEO/DjFiauxyuVeh7ovLecJW7dUPJCjUmBpY20wmYPQEhUI
	 ENR+F5MEHtgC1vtNoH0FhpSGCXQ2pICA8fUl2gsupbm9UkqzLfqLCDygt+DRg8H2vv4A1
	 62jdOZTSUdBcqoYHfwignRMA5LCUvKgOHPJefavwgXsi3b13ITIdHC8uQD8KySA4gIB3j
	 mUC6OCuU8ZZtxuL5jy25jelnwL1oKvSwr4qhk2GN/vcI/f5UXXQ5mqosXn7cQeEmN2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898726;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject;
	bh=otYT/SsWPwsr7S7pEQzyQCYmb6TgtQ9g4U14CcO6S0w=;
	b=XgJfm4dtKrRAgdbKcKepsFE6m1IC7eAm41jOLQ/DuU7ci8/yPcPd4okYIgHMXHYg7yRW
	 Jt1OQZC5UTl+7W5vK9pfYtyWecEZRA8S5KaSvadmLDLB3eN4ubD/ficFd0i9POP7Zh6rF
	 IFd3T/pUjF/vxRW4LqprPWuUI/HDw2t7Px3SXTbXtWafZiho+eg1oAJEhrGB4n4uu0s/H
	 /cC0oFcR7MRTGVtFPWyog5egvz1qcFgITSxuggs86Gcjd2pYzG4FRU13TEmd2jKkeyiHU
	 0OrPniNX8S+vJXLaygON1cNG3EHjw7db2fZO3TqrhkyVfE6cjhqtfd7VBdu4TNMcgCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SqAsGNPe;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F03606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F03606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SqAsGNPe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=otYT/SsWPwsr7S7pEQzyQCYmb6TgtQ9g4U14CcO6S0w=; b=SqAsGNPeIv10uQhciTLK5uHvBZ
	xyHaC1aP35fDS0zvhkGcIZ+Q16pRPGnLlRLfAahNjH3qo3ZVhzwu/GpHtF/+9RfJY0TS+qc8YEx86
	9EVQraFG/ZkH9C6Ra2xbmFzL+8gfZSwTy0ursSuKvqOjb0sovtrMjygJ/loLscDO5c0Nmd613ECmM
	L1V/BzVEflXq7JJoJ7++EKe3suOwoOTaI6EQWq+TffSqmg3Z/pzv298gVbPtafnEgxEkGKQASELW3
	L6T/FHXaTHKRl3nKWIlnCUPjRfduvlJtnQrDAwzuLQwCzLC2W79C0lXm8P7pNpwHQlw/R1ScsQlum
	j0kvJbVA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP10H-00000003JiY-2YoA;
	Thu, 05 Nov 2026 17:11:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 665A3300399; Thu, 05 Nov 2026 18:11:56 +0100 (CET)
Message-ID: <20261105165525.011876858@infradead.org>
User-Agent: quilt/0.68
Date: Thu, 05 Nov 2026 17:55:25 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 joshdon@google.com,
 tj@kernel.org,
 jakub@okonski.org
Subject: [PATCH 0/3] sched/fair: Fix cgroup::idle preemption
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi!

so I finally got around to looking at this again with a fresh mind and an LLM
generated testcase. It appears to actually work now.

I'm still not convinced on the whole find_matching_se() thing; at the end of
the day we mark a subtree 'idle', which is akin to saying 'dont care', so then
actually caring about how it ends up preempting on a different level is weird
to me.

As such, I have Vincent's patch last; modified to use the new idle state as
optimization.

