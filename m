Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823112;
	b=NtRsm4Ly4he19H0Ocb4B31cm4DrpulyYss0nWOD2gCb7n/OKYN+n5+x/rlLHYtIUGNYQ
	 ++hkOz2VaJiPx/BSH+yLHtitlVnMof+iAyP7owpvZbLqpxntl9AT6T34/gkoYUyZ5S1lb
	 kKkekWvfRL/x4DK+dnB7cgdk0J/4iQnmBzncPsjgzAtoqR5/0n53xsr7x9/M6wco1xYlv
	 5/ptuI8RfjkC0jK/CUE4xTXKfKb4SQWRMnLormXMzlPgTW2ypIxtCiamZwKRkE4FCE0Iy
	 XQVtGeewa2WIiMd8z4NjNtwr7JYHI9+fjc8VdMOaaKjZiVfAvuvrheC7L1OZ6H14oRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823112;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eISV9PtfxBBjY3xTz6XqgWOFKv6BjWqpUx7HxFmpYr0=;
	b=VyHLsBHoEcFV+y7bmCnAI4esmQw9coshIhWDaV6zpALn4eivUTaIItdr9Z0Gve5FP2wN
	 teTZym7U08cYvDstF/5G75JG4UCZsboA88OfiUZCsWQDl9+qBcWEHakUMRVFSbjqtKcpF
	 BvI31rXoAavKB3hsCkKwza3EXs98mYMnnrt7vvBQk3cYH9/Yvv5zeLoWYMpq+I4HxPKQ6
	 d6Ul9iXABOtuzCWqTDb/SwQAgpLLpLTvO4SDCc2m4wUnYz9HQ0edLXQu3WXplMEUYLvA1
	 PhozZZegUuFS9Q7rnL5I6Ts0LrlyUHSnR5SRSyGiuuV3nkL7JqpZdoX1QLKxhOgT4CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="N8/DPqg3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA8B607F290
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N8/DPqg3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABC91F000C1;
	Wed,  4 Nov 2026 20:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793823111;
	bh=eISV9PtfxBBjY3xTz6XqgWOFKv6BjWqpUx7HxFmpYr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N8/DPqg3ix/YMADFCcBDWhNnT8+fVkl8KfuBBm4T0nVtcZJkCV65F48UFxYG8Stcr
	 XkuidTVHPKjojl/gG+OamR25qXdYYjyj82ips58sPm0gxkhxh6qlj670doy4K06y41
	 9Bia+O4xL3pWMZ2pKNkR8PryLY3l/k8S32QJDEMZq6Lc18atLU4GL+i2dn2zICw18W
	 QWhi7fC5H61SaVVz6aotdZO5KPzSEZyZwmWbifKj0QZdy4Ls2RPnMSDusC6i7MU04v
	 wt6eHyPC1qkmFXnvBC0xdFU9cVg1EGRdLKFbAW3b8P5NFhIBSMyvlVpwjpj5OKX5jH
	 gyAdrsewdR/wg==
Date: Wed, 4 Nov 2026 13:11:49 -0700
From: Keith Busch <kbusch@kernel.org>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Chao Shi <coshi036@gmail.com>,
	kernel-dev@igalia.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: reject completions for requests that are not in
 flight
Message-ID: <auuRhVO8nZHM-MwY@kbusch-mbp>
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
 <auo5a1kRTSWsAYtF@kbusch-mbp>
 <352cfcec6865cbf636a22442511f16b1@igalia.com>
 <auo-v5ZliGbM1Tiz@kbusch-mbp>
 <65414ea51d23fdbeb5d8b7bb4bd9d535@igalia.com>
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
In-Reply-To: <65414ea51d23fdbeb5d8b7bb4bd9d535@igalia.com>

On Wed, Nov 04, 2026 at 04:46:12PM -0300, Mauricio Faria de Oliveira wrote:
> On 2026-11-03 17:06, Keith Busch wrote:
> > On Tue, Nov 03, 2026 at 04:54:27PM -0300, Mauricio Faria de Oliveira wrote:
> >> For the former question, I'd imagine other block drivers might be
> >> subject to a similar issue, under incorrect completions, and can take a
> >> look at this later. I'd appreciate feedback on the points above before
> >> trying to address it generically in the block layer, if at all possible.
> > 
> > Here's my real concern: the proposal is a race. Another CPU can change
> > the request state to in-flight, and this code will declare it complete
> > before the hardware even saw it. It's a silent data corruption problem
> > that we can't fix because it is impossible to tell the difference
> > between a bogus and a legit completion at that point. This kind of
> > hardware shouldn't be allowed to exist as it can't be used successfully
> > when it behaves this way.
> 
> Could you please clarify? Not that I'm defending the patch; just so I
> understand your point.
> 
> The reason I ask is, IIUIC, if another CPU changes the request state to
> in-flight and wins the race over an incorrect completion that maps to
> that request, the request is declared complete anyway, even without this
> code, no?

Yes, the race I'm mentioning is pre-existing assuming we're dealing with
this kind of protocol breaking hardware. It just can't be fixed on the
kernel side, and the proposal trying to cater to it makes it painfully
obvious. I'd rather crash the kernel than risk passing on corrupted data
as a success.
