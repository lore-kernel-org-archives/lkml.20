Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113844;
	b=Rp+0I2+93hv+ADWhgLw7JB/TaprD+1QLRNzCRxvKXmqVyXKJaWMCilo6hJUxupwWfH8v
	 9E5QuRB9YYI4KmXXDeav+k/lRnB+ikg3kCruVtqy91tIAgaSUvT91ZZCxZfRNb9Uxf8Zc
	 adBiLhNku18FkS3x4PXcbsE9cA+Y7RcaRXzRvQrnq0CuJbTZMjXFhgk0DsLjIJTvBFFCr
	 u9ggmTG0Or+wnLc+cuq9rzM5q+sHG7G4/11y6Bpj0Dj9XsFHAJlY3ed+cKc+GGYyEOKOi
	 u5l6AgDQkzhG8GvsE/hEmsc/0r78hkv4f1SFW5JSSW3ZvXwAdoiXR7laEAfsF3TZ9xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113844;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bGUHLo03oq3Gg6IVQNN1cHzDG9J9sP8CXjYjZOjweHI=;
	b=T5gyQRNg4WvbYvCvQ/tV44f8AogbVp/bGWIG6dzpdGxlxgchzgmZTrp7M5goWJmtm+Aa
	 IAq7J/Krtsr8j8BQVT6MnU9NJqk/i+yGs2777egx5GhOaNeYMs9eMEfF8dBmCMtXevX/N
	 TYrvr2T/zVmsMMPlE7AFcy00wCO0uYM/rWFIRwKqSfKNmwkEAh2eV2uGR3YooktrZOYk/
	 4OQZG0YBG3xFQOtFqGGzxeDluLzQwHMW3enc2AqI9tuSQvuJIIbZAZK+Hqgh1BiXxbAxi
	 /se2K8TFZvVsR+Zc3pke3BP6MkGkb0jgxVWCDiSWKAzc84gw25ihjhRmxQOrAg4sNkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlgoRxf8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF309606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlgoRxf8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3C21F01825;
	Tue, 27 Oct 2026 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113843;
	bh=bGUHLo03oq3Gg6IVQNN1cHzDG9J9sP8CXjYjZOjweHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NlgoRxf87R/lLIP0gRhuPMXw/9sgsDkuP/OhS5aUb/IVv1l/p4i0htoNayF+FaqZR
	 d13p+lhI5IL/I3dQrD/BavcyILToAZuhVSW286rV2gKLuzsnk/8m2LmaDNlFCOyFWv
	 r+oNQ6EXCM4qyame8jUiH0dVfmkI9YL+c4McEBB5d+fcVZxWBFVFaljE1FpCE+1jNC
	 tz+999OOWLUya2pDjd7BDj0vFxrJLNhKcUonAzRppX7k2vxRbmu8DMyKM53zkwWYqO
	 7xMOje5tDI0i6pXnvp2YPaidAb0gi2rWE5PHl9UsIR9i3XwiLyBI5k3LDxykAufg35
	 Xjd0D8JzIarUA==
Date: Tue, 27 Oct 2026 09:10:41 -0600
From: Keith Busch <kbusch@kernel.org>
To: guzebing <guzebing1612@gmail.com>
Cc: axboe@kernel.dk, sagi@grimberg.me, leon@kernel.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guzebing <guzebing@bytedance.com>
Subject: Re: [PATCH] nvme-pci: unmap the full IOVA range on PRP setup failure
Message-ID: <auC-8UVAuj2KDb_S@kbusch-mbp>
References: <20261027115718.2241149-1-guzebing1612@gmail.com>
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
In-Reply-To: <20261027115718.2241149-1-guzebing1612@gmail.com>

On Tue, Oct 27, 2026 at 07:57:18PM +0800, guzebing wrote:
> When using IOVA, blk_rq_dma_map_iter_start() maps the entire request
> before PRP construction begins. However, iod->total_len is accumulated
> as PRPs are populated. If a PRP list allocation fails, nvme_unmap_data()
> passes this partial length to blk_rq_dma_unmap(), leaving part of the
> request's DMA mapping intact.
>
> Use dma_iova_size() as the unmap length for IOVA mappings so that
> cleanup covers the full range mapped by blk_rq_dma_map_iter_start(),
> even when PRP construction fails.

I don't think this is right. The dma state's iova size was set when it
was allocated, but there are failure scenarios where we've only linked
part of the request. I think the iod's total_len is just not in sync
with the pinned mappings. We should update the total_len as we iterate
the blk_mq_dma_iter, not when we've assigned a PRP element.
