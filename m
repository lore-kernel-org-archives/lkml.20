Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683967;
	b=eytf5ysd7Qhkz182XOlntrWA0Pu+i2v+5b4vNPBZgr/M/C5k/RoH+iupRHFGpAZWJdxN
	 dn55nTS93mpRV7TeWvcIkR9YGBnpHRgkZWph2cJy40y37Ry6ahBI/EEOPE8D3ETmCxbBv
	 GieofT7YOoLh9gQmQNsWy8eSIzClAVFHtbNU2Gd3nIPVSNN7AsjUPCAg1/2FqJ3VAcA5o
	 Tc6Gk7dY7cm3HRgujwxr/JJU8g8LN5RxzH+eQPCeSuSABj+AXmtKQqnB2eHBw/h7uAO37
	 9mAyCbk29FssJjlCuxK4TjERs5tjqXNMfl1Flt2aIaHeII3pCgu1lfy24GRnxqxyhiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683967;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5dEcbX5s5qmv2wurBmT8xVbkW814DN6IZmvbQ6LWlL0=;
	b=E5XVT/AavNs6QgkrR3K+KBV1ky9g/yqebE9ui9IDeKEohE1TzJtvulPFai9DRqcSDykZ
	 CNIySbipEIR4fdx8ibHav6f/hEn6GxbpT7vq6Z19oH9KBRrZ9Rb0J9osWK2KmEFnrtbL2
	 8YOPW75n6b4nUSdQijmefU7NQW+0tH/xCozTrtF3bUVluV4qsSGrNByOFXDLUCK6rkWP9
	 P8oIuqG24MOxgpgrDbXFI8Ib6/4DpZBo3NPgYfYFnMFou7cETcpT9IFj4RaxZ9tXl+4NS
	 IuBjLwnRAzSiC3JoYPv1bM5W1i87gtMRwB8zkWWK7Tc6tgZwIJqvjuPyCtobASCVg6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nY1XDZR6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACAC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nY1XDZR6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F66A1F01825;
	Thu, 22 Oct 2026 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792683966;
	bh=5dEcbX5s5qmv2wurBmT8xVbkW814DN6IZmvbQ6LWlL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nY1XDZR64LxKf1GSKvNKfUwY0gPHbOhxNN/mfJoR55AVkeE9TeaaOPh32uVx1ENR6
	 7sYzDZURPkfHTfv6W9dEHciPmIRFCvzcnt3325FXI2jGfIP6sJ/6ti2W3l+JBZsrMB
	 ZU8ERgDPWz7TRTpkiECuJ2U8hSXE/VJMO5bG8cyGlT4dDzqiX1M2Kju7CaG5kIsgV2
	 H8SsJKpQTcmiO/uZQ8vLdH15PhhL+zs071cEx930jbRHijm4W0BTw/VU81s1b3j++x
	 b0Ka7gPSSF+3hVM1FZ9pzIy9DgcPOzcfwNQ3joIb2xH60LoQKgv4Pzx9S/PioKZOQO
	 E3A0Pnzlv5Kgg==
Date: Thu, 22 Oct 2026 09:46:04 -0600
From: Keith Busch <kbusch@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: prevent double-free after metadata SGL allocation
 failure
Message-ID: <atovvKM7kjv296F6@kbusch-mbp>
References: <20261022062923.3761399-1-thnkslprpt@gmail.com>
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
In-Reply-To: <20261022062923.3761399-1-thnkslprpt@gmail.com>

On Thu, Oct 22, 2026 at 09:29:23AM +0300, Avi Weiss wrote:
> If metadata SGL allocation fails, nvmet_req_alloc_sgls() frees
> req->sg without clearing it. The RDMA error completion path later
> frees the same scatterlist again.
> 
> Use nvmet_req_free_sgls() instead so that the scatterlist pointers
> and counts are cleared before response cleanup.

Looks good, applied to nvme-7.4.
