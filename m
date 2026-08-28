Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C320409280
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913696; cv=none; b=WeU05lIeGjnLGcjRes8S+6yqEKUlYjQqUxlJeCoQ+i5tYeRNSxdS7b8YtLXdqrdfF8WKJ6iRO1zeYEaW1fTyi8UcMEeCWQvjGjXC1Lh1iagXlXB8wwYtxLdbBfa17ITOjGRasIpE2GQs2LoVYnexC6pOEHhbS8xvh7jR6v5ReLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913696; c=relaxed/simple;
	bh=WQdfqK2cD5lAKg5b1wIyf0i4/agJIxoNE7Qyk4IDlgw=;
	h=Message-ID:Date:From:To:Cc:Subject; b=eTHsILOglVssSW7cvexKS6l9or1HV7IMS9KDU48I3nkj52qU612aBNwOKWksQZXH/bCuY2YAFun2iuU6BKEIHD3efDQmom+l0g97YhWytcXR18qBNmGP95mFndrZ3sSMzH46sF0HEDiFhi1CxQyog9HeePmI28XyX+FXbQuJuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MwE3lx/n; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MwE3lx/n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WQdfqK2cD5lAKg5b1wIyf0i4/agJIxoNE7Qyk4IDlgw=; b=MwE3lx/nm5tAFmpPvTonBqXepV
	Xo9DfWEIKlKLxaB1uqod0y/9BL8OrUh7Rcnk7xV0DrddF3NMXVIIi1vqISZvkovNZhYe8MtNSAtD3
	nNCNFPUogHmdPLu+kVKk+8iyR6jSF9O/JQaoGHrTmbOWM1lkCiu828FuBi5H61Zb9AEIiK3DLPyx+
	2EhBCNSUQGv1JhccmyI+h3o5lGopbdiMsIRDBFgG0HHt0dWk1wXUhggtqfV6WlCvoaro1cps7dhmY
	meZ+3uhaoU9+1Cz3GzNrMdBMGColir1BamePa0Fnkn4FBp6dLFMWf46TZyke1VkE/g5Lq7tpoe+2X
	/ra1OXig==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzu1T-00000008CEb-13x3;
	Fri, 28 Aug 2026 10:41:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id CE3143001D0; Fri, 28 Aug 2026 12:41:21 +0200 (CEST)
Message-ID: <20260828101659.812011872@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 12:16:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 tj@kernel.org
Subject: [PATCH 0/7] sched: core-sched fixes and balancing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi!

Previous 'version' is at [1], but this one is vastly expanded, so I didn't
really bother keeping count.

Anyway, all this started with me breaking core-scheduling [2] and then trying
to fix it all up. Because holidays, this all got delayed, and then TJ had a few
patches fixing core-sched for ext [3] (which, if/when this lands, can be
simplified again).

Anyhow, these patches survive both Aaron's test case [4] and Prateek's [5].


[1] https://lore.kernel.org/r/20260624121327.190063948@infradead.org
[2] https://lore.kernel.org/all/20260611113219.GG187714@noisy.programming.kicks-ass.net/
[3] https://lore.kernel.org/r/20260807210221.232543-1-tj@kernel.org
[4] https://patch.msgid.link/3898f82d-e48a-48d5-a13d-54fa5387a203%40amd.com
[5] https://patch.msgid.link/20260821024335.GA3046103%40bytedance.com


