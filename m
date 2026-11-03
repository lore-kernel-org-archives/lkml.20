Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699802;
	b=HPxnHS3m8E51o9VYa7IFPLMd4xWZoAVRgzyRozLX8VHDFIcHgeCEcHiUz+ER+nFSM/sK
	 gHv+3dIKzqPMtgn/ADJvLPG2VV+GNwguqsntiZ7boC9saXI/xpb4N8qZxk5qMTWhKmal6
	 QbF/2pZq1Aqol15VuMNo8QUeZJyoqC6ZZjpsEIlnUFgXCZn1700vJ7/t+7toDcHrnVUD9
	 YMwb0/kdthvY4KRn2cW7aRwmDXlRKHD0Bh/wy2tTFP92BzrGY0ki1isD0txZCRwduSkyi
	 uYhTGdFaGfrO24f14Cw1JdZyVWJ4fxRNCpnWkArJo5Y0C3aljufk3Xz0ElFyJ5IflxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699802;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VpodFQ5OE4hPbIcm2RyEEqcGUtsEd6IZkDvgn+8VUvA=;
	b=ynFkg5AbUhk19Dc50vc+1as53cq/Vkp2ylMhWw67LrmYoClxqOsl6bjniumbcpPBZFr8
	 aueTZ/l+RQ9G2mjPcpejI1DpxHJmVDPhyDxGAj10IROWOnv+xO1DIAr3e83vVJ96rUCpx
	 iTax7c5FUel6DMStW2BVYmt9P/2kr5hgQEB65zpLevYkXb7NaKGFD148bYajJgyyqE1yH
	 jGJs218j8RYUn4OeCNM+4ESUQTH2NvIwg52wlqFuPyMEzVgS75knsBkvmf1n4gXpFxMot
	 nANa5QDDuJdPiLNyvuGaEjH6Q8nSnDQFa4bpVaZeXme2LrGlysu5NK/6QPK6FMUY3+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b="R/ZRdazY";
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686C6606B374
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 686C6606B374
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=R/ZRdazY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VpodFQ5OE4hPbIcm2RyEEqcGUtsEd6IZkDvgn+8VUvA=; b=R/ZRdazYpYrNN5un01sZcAo4fL
	K4gYcPi2Cwbrl7HqwzWoO4kYM/u9Wq3dddg8Lu/L/3krZ8hiqU+yco5EpF79rJdXVZFv9s5VcPspa
	wzdETyv8EEAPY+hfFrYyY06yX1u20465LXK+4bFRHL65YURKCI/alPnEZJoHycCUbdpfPMy0Bp4Vv
	AMDwNC24XV0Ed0yPzPf6DDXL5p+wPCQXsS3NcbMuabd1JGqMKSBmLGP59PFhUiQx04c3tT4PvKNtc
	Sfq49cC24ji6T+8gks3Pnci9OvGP/QWGcI8RAGxFR2X5U0CJfon5oDUcAtM9pThm+Q3/zu2bpVitk
	YxmTzf6A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBFr-0000000A54M-44Xd;
	Tue, 03 Nov 2026 09:56:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 872FB3002D9; Tue, 03 Nov 2026 10:56:34 +0100 (CET)
Date: Tue, 3 Nov 2026 10:56:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christian Loehle <christian.loehle@arm.com>
Cc: kiln <806144828@qq.com>, Ingo Molnar <mingo@redhat.com>,
	Balbir Singh <bsingharora@gmail.com>,
	Yang Yang <yang.yang29@zte.com.cn>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] sched/delayacct: blkio_start recorded on the wrong task
 when a delayed task is blocked from pick
Message-ID: <20261103095634.GZ2668564@noisy.programming.kicks-ass.net>
References: <tencent_6CFB6E9B26A308DC2800D4059DF93FEC9706@qq.com>
 <6faca00c-dfd5-46a3-9766-9f573ad71d75@arm.com>
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
In-Reply-To: <6faca00c-dfd5-46a3-9766-9f573ad71d75@arm.com>

On Tue, Nov 03, 2026 at 08:21:47AM +0000, Christian Loehle wrote:
> This should be fixed by
> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=sched/urgent&id=5d010dd27be92a68eaac3af4f5ef0555bcde6031
> (please give it a try!). It being in queue/sched/urgent should mean it
> comes in with -rc2?
> Peter any reason this isn't in tip yet?

I only pushed out this branch yesterday (right after -rc1), I'm waiting
for the robots to tell me all is well, then I'll push to tip.

