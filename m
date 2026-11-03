Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736385;
	b=awfg5h3aVNYqcPvswnGEVO165k2zyyiIrx2jkj+sAY1dSFC8ZW7/jW8P8SW6rRYiEJRn
	 ENQg/CePmmDdFTHDAz0VODFNrTxcl6nSAXYr2Vz+wNTEWSnPY9BV3VNr2OIlXphCAiDqe
	 Zw/Ghm5cwmu2VvjeTnO1Z2ZDkCl7X2u5UT0IiATSWQnuq/owHtsmpkItsrUlktRFWRy5b
	 sHjp1RySJzK77++wNQcwPId/42ruqT6PX2vW8x2Ct6zd7b//++eLHYex2Yi/LhuSdza5b
	 xzDsSK+0t8Xn/wJJgOm5s/ho/htU1Vqk1PGhI6PcJDR6sPFSpRTX9UfeRb/FonHS4xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736385;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kOQHm/cSQ8hXHfqjsR3vSGDbjczIWcs+teVv58ONHrc=;
	b=vkgCrbQrw6K2VFqHglJdobt/FFZx3i0i6SdS5aTPrcnWIeQliRfDnnycfLBaFDfZ9JBw
	 qLFSe+FGcwvC7pT4NOXh7fSgZ1WHuLkNKIzEFZRbFlb6G2xC0K0soQNJVlx+8fkMiByui
	 0PxRO+DsUHXvgD95HGl8jqo8ZNQJVGetxH25gzf2qDe7slmt+L/0fJfY32zsIghiLwen4
	 eT3MTMiloQ2wxFzIMrmxbTzxSACJhYB93EqYhf4Gf0Cip+APvuQy32igrY6QrqJGTzQxH
	 eZ4yG8tuB+wLpfc59EN7VWvF41Bk3pDXZQjo+DVhGDfyc1RTaT592vBE7Otb9LHfJrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gkyrt7V9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427FB606D806
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gkyrt7V9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEAD1F000C1;
	Tue,  3 Nov 2026 20:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793736384;
	bh=kOQHm/cSQ8hXHfqjsR3vSGDbjczIWcs+teVv58ONHrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gkyrt7V9aW+Iwcl/019dLW4XX+Vv/dU8MWlEFW7a6AllIp0pGLaEjKJ4AiHcRqwXF
	 sTdLtQ2FAl3gwBgXDhGDXqzhRkWnEauiCPnnkVkGEUcfIiew7fc6C0FtHZL6j1aI9/
	 P2ygI+VknULFBHDuU8dZ20OZWEdC3831X0S2VLRaPpAfWXqM7KAsHJceCmwXyXOeP4
	 C7xVaG07Dv5FAyAgnA5PAsrCZy7cPSwJK5BGwb0GK6q3KOHiSw8hFZukzzJEZypeKJ
	 O37bK6C21C/Hs+57NlCNOsYw7ybFNvWB7nQe5X6aSnuj0Ty75EUJxL8e+EAnW+cxSI
	 adpmeslSSC29Q==
Date: Tue, 3 Nov 2026 13:06:23 -0700
From: Keith Busch <kbusch@kernel.org>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Chao Shi <coshi036@gmail.com>,
	kernel-dev@igalia.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: reject completions for requests that are not in
 flight
Message-ID: <auo-v5ZliGbM1Tiz@kbusch-mbp>
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
 <auo5a1kRTSWsAYtF@kbusch-mbp>
 <352cfcec6865cbf636a22442511f16b1@igalia.com>
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
In-Reply-To: <352cfcec6865cbf636a22442511f16b1@igalia.com>

On Tue, Nov 03, 2026 at 04:54:27PM -0300, Mauricio Faria de Oliveira wrote:
> For the former question, I'd imagine other block drivers might be
> subject to a similar issue, under incorrect completions, and can take a
> look at this later. I'd appreciate feedback on the points above before
> trying to address it generically in the block layer, if at all possible.

Here's my real concern: the proposal is a race. Another CPU can change
the request state to in-flight, and this code will declare it complete
before the hardware even saw it. It's a silent data corruption problem
that we can't fix because it is impossible to tell the difference
between a bogus and a legit completion at that point. This kind of
hardware shouldn't be allowed to exist as it can't be used successfully
when it behaves this way.
