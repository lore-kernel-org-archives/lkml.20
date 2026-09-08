Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC08A55C336
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897551; cv=none; b=tbJVWUC0ROafb1gqlMGjvyIbUY7Jv8zj+sakagTyWb2b4kN/ULyIeFZxoMTd4NDBJ4+6DHva/HOSoBAyLGuLMlXCPeXhrDq15sy1IRB6caAyEmTeY9H7Yueq+0J0Dm6Djg4Cm7g9msH4u0xthjB280C03f9rkdl4Vj9BwhWANP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897551; c=relaxed/simple;
	bh=TwiOw2MUxO/1asrszwPZCwfC+KlktHPLMfTZSCooL0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlJf1UnZFYpeVsCsPCWUL4jTr4XygJtgIt5wl3ndnms/sScZQkGhUcWZx3znzt/BLS21HlBuTT2EI0TWTWkJgQLsP1H4kP+xSWGgR8Mh8Scoo6FiU8EkNfAJ7tf/1u/6PM9xlhpuiBvoKLIHlYR3qmr3htwCfl2B9Um5ZQYs9Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RplUWoqH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RplUWoqH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6088C1F00A3A;
	Tue,  8 Sep 2026 19:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788897549;
	bh=wwsTLPSXpbgPa5EM9nw2ZxHsxM8nj96DOKEohHwv5s0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RplUWoqHCzYy0DGGAm6wyAXKUeiWmD8JfC/p5iNk8tJN1l/NzXXV76TohSsP/GDnM
	 KZv9Xn5wU7WuggB9z1mu10FSu8Gf0Hv4tnQm2Tdpgk4kM1f6xO1hWVs8Dq+uXJgFCH
	 Frnefumnc5X/2/0YT4cYUMk6rtvRxnFU3ctKqB4W7kwCH0Mbjv3b0q37KnL2JBbaSh
	 RRyvCf8UIH2lt2/prmFkXHgjaVuALIGUXAlHlHes2ENDZ4m/jhTNQnv1UDZAtokOO+
	 3LYehBAG+ah9RLzfYzhwKoP2nX2BDGhnHCaWL3nHhse91w8pjeS3DVegMD67iS7qdv
	 EoY+x42gsLlXg==
Date: Tue, 8 Sep 2026 13:59:08 -0600
From: Keith Busch <kbusch@kernel.org>
To: Yifei Chu <Chuyf26@linux.alibaba.com>
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, roys@lightbitslabs.com,
	yhlee@isslab.korea.ac.kr, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvme-tcp: reject C2HData for a non-read command
Message-ID: <aqBpDGHdRAAyAI4u@kbusch-mbp>
References: <178730451245.442148.11684394617763960186@linux.alibaba.com>
 <20260822014037.1978918-1-yhlee@isslab.korea.ac.kr>
 <0a6b07e8-3ea6-4458-95eb-4a63b6108823@grimberg.me>
 <178842720109.1034236.7954869548413684234@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178842720109.1034236.7954869548413684234@linux.alibaba.com>

On Thu, Sep 03, 2026 at 05:20:01PM +0800, Yifei Chu wrote:
> A malicious or buggy controller can send C2HData PDUs in response to a
> WRITE command.  nvme_tcp_handle_c2h_data() accepts them as long as the
> request has payload bytes and a current bio, which is true for writes,
> so the receive path ends up copying the incoming data into the
> request's iterator.  That iterator was initialized from rq_data_dir(rq)
> in nvme_tcp_init_iter(), i.e. ITER_SOURCE for a write, and
> _copy_to_iter() refuses to copy into a source iterator: it triggers its
> WARN_ON_ONCE() and returns 0, the short copy fails with -EFAULT, and
> the connection is torn down into error recovery.  The write never
> completes: every reconnect reissues it and a malicious target answers
> with C2HData again, keeping the controller in a permanent
> reset/reconnect loop.  With panic_on_warn this is an outright crash.
> 
> C2HData carries data transferred from the controller to the host and
> is only valid for commands that read data from the device; write data
> travels host to controller in H2CData PDUs solicited by R2T.  This was
> reproduced against a target modified to reply to a WRITE with C2HData:
> the host logs
> 
>     WARNING: CPU: 0 PID: ... at lib/iov_iter.c _copy_to_iter
>     Workqueue: nvme_tcp_wq nvme_tcp_io_work [nvme_tcp]
> 
> and the controller cycles through reset/reconnect without the write
> ever completing.

This is already closed:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=f83af377c148f6ad94b41c0e8313f12adf45e1c1
