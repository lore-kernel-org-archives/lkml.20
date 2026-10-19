Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434710;
	b=BOudDe/TnJZCb+EslJuhlT+hBUvBL+mrvc/oQ9Y6u3zpHnvvGYOfh+plCW8sL2p9zHKg
	 5Od+F9xDcizv5Pu8VoOV0NLPwpRIW25EommqizmkIFAE7K433RP43x/+6XkdLllfhU4LY
	 cNlKtiXpkU/kj+3u7QP7nYIplpVxY2ruyu1lt/hVGMO8ezzgyA1ovAEQr6QmAyK9B56+p
	 oixEkVMi32UIIZmaXID5ey9bCbiAHciAHBuyhHn+kY3MPuKF/vKmoHBzrShuDZlITYdnM
	 oIt/GT1sndeTDUcrHkRjDzjKCOxBcMhZSOKVvhYtEdIGCuXD6eBMiCF8UIPjCEO5HKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434710;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4rAOC3LWU4D+fpQNfeaCciHvlznoy08mvb2nzwLCzJo=;
	b=MKdfx0wvs5f4WjCEf6x97Y2ONgABVff4kr9EwmlXZ8pJCvcWpY0g7lXUltvvEgFMUGo+
	 RR3PQWRbi0uxjpRVOKPU/UWXoeUUt3RCxjRkGn5us0CSNBQaCGNvvPnTr850zct6ldc+9
	 EOgja+pWYNr2C248PhAeRRsbhSy3jOFm+s7kfR+B/JERtxAmFPn7cpz7XYucANSQ70X1G
	 DPe/aO8OT6ht9PNSbHrcy7sJXgMIfnQvyAKAHib6rlKsCDwtdxNH6mPNBl46Ad0s4Pu54
	 zInNGKpKhtH15Xb+KyL5+jfsOuass4n6YQ2O/PX3Vpf3DslaX26cxPgEh081f7i35Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwmrRe58;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47595606A31B;
	Mon, 19 Oct 2026 18:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwmrRe58
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4155E1F000C4;
	Mon, 19 Oct 2026 18:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792434709;
	bh=4rAOC3LWU4D+fpQNfeaCciHvlznoy08mvb2nzwLCzJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MwmrRe58qW5gCgNkDhEpNQo/Yx+4ojBXVll0Hyk2CndarxFJqPFTFeGH4qZb1TsXS
	 KhKMozcdUezt4bP7B+WmMFDFOLZZ55yLKEQ3PjuuPtc9s8PbxHzUsfIPa8JFkpkRHq
	 /DXTtrLoXtJiudJ4JtiJ1iP7LJNmLfMvnWCfUoJ+GofFK3fPnWO7sP8Na6qA0G1AQ1
	 10S+4R1PMie5upWKasbG1GMCiYlveGNywqtt+ARhDDvDvJWX/gdNeih5Wh5zMY1VLl
	 TFfzJlWteWb8hGT130uyLs6yvR7LcFEVY8GNc84iaio3CQmwMiGDjrbCB/1ZpLndiQ
	 CmtpcX0zrz88Q==
Date: Mon, 19 Oct 2026 21:31:46 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ankit Agrawal <ankita@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Restore the scatterlist entry count before
 freeing
Message-ID: <20261019183146.GH64621@unreal>
References: <20261013-dma-buf-fixes-v1-1-0e2d9ca41f3a@nvidia.com>
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
In-Reply-To: <20261013-dma-buf-fixes-v1-1-0e2d9ca41f3a@nvidia.com>

On Tue, Oct 13, 2026 at 02:46:24PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> dma_buf_phys_vec_to_sgt() clears orig_nents to mark the returned table
> as DMA-only. Since sg_free_table() uses orig_nents to walk and free the
> scatterlist, dma_buf_free_sgt() leaks the allocation on every successful
> map/unmap cycle.
> 
> Restore orig_nents from nents before freeing the table. The helper
> allocates the DMA list directly, so nents retains the allocation count,
> including for chained scatterlists.
> 
> 
> The reported kmemleak output was:
> 
> KMEMLEAK LEAK: 2 driver-related leak(s)
> KMEMLEAK LEAK: unreferenced object 0xff11000125ceff00 (size 32):
> KMEMLEAK LEAK:   comm dtr, pid 4432, jiffies 4295031027
> KMEMLEAK LEAK:   hex dump (first 32 bytes):
> KMEMLEAK LEAK:     02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> KMEMLEAK LEAK:     00 00 01 00 28 38 00 00 00 10 00 00 00 00 00 00  ....(8..........
> KMEMLEAK LEAK:   backtrace (crc 4e8077f2):
> KMEMLEAK LEAK:     __kmalloc_noprof+0x451/0x8b0
> KMEMLEAK LEAK:     __sg_alloc_table+0x2a0/0x4d0
> KMEMLEAK LEAK:     sg_alloc_table+0x24/0x170
> KMEMLEAK LEAK:     dma_buf_phys_vec_to_sgt+0x84f/0xed0
> KMEMLEAK LEAK:     0xffffffffa1ad21a8
> KMEMLEAK LEAK:     dma_buf_map_attachment+0x138/0x690
> KMEMLEAK LEAK:     ib_umem_dmabuf_map_pages+0x249/0xc90 [ib_core]
> KMEMLEAK LEAK:     0xffffffffa138f8d2
> KMEMLEAK LEAK:     0xffffffffa1396abe
> KMEMLEAK LEAK:     0xffffffffa1331a5f
> KMEMLEAK LEAK:     0xffffffffa13320dd
> KMEMLEAK LEAK:     0xffffffffa1ad696d
> KMEMLEAK LEAK:     0xffffffffa1acecc7
> KMEMLEAK LEAK:     0xffffffffa1acfd17
> KMEMLEAK LEAK:     __x64_sys_ioctl+0x72c/0x11f0
> KMEMLEAK LEAK:     do_syscall_64+0xa1/0x4f0
> KMEMLEAK LEAK: unreferenced object 0xff1100016dbf3a80 (size 32):
> KMEMLEAK LEAK:   comm dtr, pid 4432, jiffies 4295034705
> KMEMLEAK LEAK:   hex dump (first 32 bytes):
> KMEMLEAK LEAK:     02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> KMEMLEAK LEAK:     00 20 10 00 28 38 00 00 00 10 00 00 00 00 00 00  . ..(8..........
> 
> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/dma-buf/dma-buf-mapping.c | 2 ++
>  1 file changed, 2 insertions(+)

Reminder, thanks
