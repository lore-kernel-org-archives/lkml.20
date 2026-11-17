Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927752;
	b=3qjMSsIJCx03Exdkv/ts0/+lNAEdO00x5KGUapwW5/iFfkOTaVk5os192B3ED3hrz5E8
	 9lItZha8tOHvXvhm0JwhD2TSeUclxEN9Eaq3Nv2xq8u2eZABKoSvasbW/6mP4uy3zgQEc
	 uECvsRYaLjiiQGRz+P99wAF2oDptKyveg1oAv64nnbTI9VNtajQzx8gayHRzVxkDGzi1J
	 mg2F67hnSrDR4YHWhrdYLmy1r1JtlKkGIYd011isZ0BNfxII+NXCpq0wSNIMlzS7tO0GF
	 60e3ez+RpWTioMZz9jkoJ9ehvAVL7jfSVCrxssU8vB7IpX6m7Ge+D/Y5ZHGAQRBtYYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927752;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Ks2sxqGaZDukp1eOpnA/dRkvMgwvUANSRNB1ArjSmSM=;
	b=40vJ9sq43uoigIvy1CxvcV9x3Ddi/8h3FgQcv/TThmMad6jHDXTzBB+b6LaYNPpozzNW
	 XpawLBo2n9ErBJSxUrVkM2I6qmpMYIb/M4p9EO1kfHE/8e6ZF4uDI3lBDjoa7ybyb8894
	 ke8676OZCIGgV9RAHDE1aECthVTeQtDT1jL1E3IwLhMPhyfFk6VlzdKjOd9aiMcfYxL7A
	 2ql/OMV90Wh2SoGmeJQhi2YKG9aE2NICqwAHp1QgtqjnhdrcE9t/rclzvS6/JKNa3TqVO
	 l75YuiwtrE0ishMFhLNBgr1kawwuJPLVUEdczJxF6MRi+SacbsuXpbkDKj7tw0qkoTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Oa38MeMJ;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B569606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B569606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Oa38MeMJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ks2sxqGaZDukp1eOpnA/dRkvMgwvUANSRNB1ArjSmSM=; b=Oa38MeMJIq4z7Op5G9iCaDCFgG
	ZhQ74fzUbDuEYhvzpAU8Dh1roymPfLskSTetd+e0bS/VL92rhkoa0c50xfYnsmD1+CQXNyHcowq4f
	OD3R3sO2QmU5OQ3AiVJP56agkl4IXcEthKEaQvfuZRpP7pXKWKdo/f2nbeQz2L0NU/olf5rL7/Xqw
	xwsdep08j9ikT598lxq9L+tocLRSxEW3aU6ivvf5UsFMdVGFR+2Dw0b138wx3Iwx024hBhBQyXnNh
	iHSiw5pBjJ9BKAo+O1nHd4dGy5WR2vck1b1LiWRrEoP1PL7D7FU/XSa85sVL9FGUDZbIShzaAqQRp
	ZrzMrUvA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKhS-0000000F6ci-3VPx;
	Tue, 17 Nov 2026 15:02:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0D577300400; Tue, 17 Nov 2026 16:02:21 +0100 (CET)
Date: Tue, 17 Nov 2026 16:02:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Waiman Long <longman@redhat.com>, Michal Hocko <mhocko@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] sched: BUG() in select_fallback_rq() at boot with
 isolcpus=domain on the boot CPU and CONFIG_CPUSETS=n
Message-ID: <20261117150220.GG1813469@noisy.programming.kicks-ass.net>
References: <20261117144817.265109-1-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261117144817.265109-1-mathieu.desnoyers@efficios.com>

On Tue, Nov 17, 2026 at 09:48:17AM -0500, Mathieu Desnoyers wrote:
> Build x86-64 with CONFIG_CPUSETS=n. Boot a VM of 4 CPUs with
> isolcpus=domain,0 or isolcpus=domain,0,1. The kernel panics before
> init runs, in every boot.

Arguably, marking the boot cpu as isolated is asking for it. Is this
really worth fixing? Or should we look for a better failure message?
