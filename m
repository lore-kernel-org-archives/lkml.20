Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813922;
	b=gf3vn/H3wBAvvSO9xb133z9/1PXKGLsygi3tevza5Zk7RNdT1SlMWvrfwah1CnRiT9RG
	 sNSUUZYF1adGaRYdbQkAfpgqEXt83ekpbK28hwNQ58rTA+iyf9Yv7SVlNU8E4iuveXKUh
	 O9iCdfiAOb3LITzEwtgX/PCYNB+x4Rapc+vbJdYML6Jep5s4Bwn9viUFTm0mAC1zNQwxe
	 14i86wbWsd98GnTjfKGtDGGS9AHlfyMxQ7s+f/5kNz7zTvisxrfzJjnnq3PIKMZjen1BY
	 0PcVBo6rj6NNW/VX8NJL+UZ0SjjCNtLhLQ8WS28MOMOk0/uqqtkXqwS0fBxgGHNBPjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yl3p6kivD+pbgaW7MJkK3w3sK9j5Q+Oatf9YNzkPHuQ=;
	b=P0cREjEdXlIV7kF2dG1YHg3KKJJ9I2nzSweD733++W7R/M6FLofXSN7R5kZ5njEP5IG+
	 OQ0rBT10xLzyG2QtpGw7UGQUAx48wLCDWqxha4LKHjhUqYyvRrQCARltgBdrc9d5BlH7D
	 FmVzfRTOmtF2LaVml2YCbKG6G0Hu8+vtagRvJ0l0/esy7yAyBsn31VtTtBmSnYSxjbUmn
	 Oe+peWSrPQpoaK/Dt73aGT8s9rO2JYR+bMUKfTjwCdFHdyj1vV8BJ5t1MjkbAMOaDFub2
	 Oz8w3B73i+8PnLvpfo6nxtGxk9dREAzY9vBLxU0yc7kCckIzfwOyoIcNruuUIUEWT9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=mrY8ROdm;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BFE606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32BFE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=mrY8ROdm
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-945ae2daa68so99505985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793813921; x=1794418721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yl3p6kivD+pbgaW7MJkK3w3sK9j5Q+Oatf9YNzkPHuQ=;
        b=mrY8ROdmQ1U8qG1WVkHwFlUc3uGFi+mfdwhSWPL3i9Jp9h8f89iHmTdDBHaGoSb9fV
         Qf9rVp7RKUT19nXLbySXsX1HX9ejTq1RkMbi9uctb50nDdYeaJxGrg0TKGC3n5LuHDCN
         s/MNCqdyz7OsSy5/Xj4hUz7Xx9K8J+nT+Rgtz/TEx7hQSBym/uHrT0083IL7OdGOVSoW
         QWTluEuJP2tc6R56IYPlBHffsnVWwQA6M5o6QgL6HcwG3w2leCaMPqVjEYBQupV7hAqq
         SD6IF6/nTL+K1g1CWe1MCWd4YJ9zVV8/dLg6SmJyJNXdrhSgMr1A+M+/81J0lXd5xQmn
         obNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813921; x=1794418721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yl3p6kivD+pbgaW7MJkK3w3sK9j5Q+Oatf9YNzkPHuQ=;
        b=meMSJMtzF6uluctPGZK29IjKIP0jySrBpAFxS+uK/abw9N/VlwkXeriI94iInluK8Q
         6+JxCZ/KKzFw+qeTDuEVg3cv90SVeYxWsWPl4MHBFCbfCgp/2UFskEyjQpsCXJ924XAU
         TPUEyF9wrnRsz0yrQ6z5C0Jpnpenxtx9SlsqgWcX82aAL3IM/TcyIT+1OIhSWx2UCat1
         Mp2NTStvzBCAYI2c1ub7CGiQo3USa12C3t1qM7F8O/cFEtjvFVyV6b+EkDNE8SfIJy7e
         aObkojZsM3L+ObmnmzzP0qPhRLYJqi5IxjMtYTIHmcY4lpwAAyM2Fxn37bd7olUzd3iN
         uQYA==
X-Forwarded-Encrypted: i=1; AKwUvBxUZlYmrO7xuNHD5cvEHiXJq8jDrH9etSoVfGns72PYa/pZRkHt94RZAh/0ugHrnLtbwf3fNw5o/3j3O4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zL2pYcUWb9dAaRN8qmtpA6XpSuZh9U0/p+qtl1N7Lz66Oo/N1
	vkkuJlzQ09AUzqXbOm/t8JKBhDkkbYf7d2+USStd22JuEfFX29EMc/YiIkO9uihfGc4=
X-Gm-Gg: AYBFou0jxZ6YC3Yd9NzHnGmiHmY8jm4HezgAkVPK5dqUnLsdtSiOJNEEr3S2V2ilN+w
	XkbNC1dbtTYEMgpHYsc0ffU1DXV2juiWz/elt0dwQqFP1UNltmnZjmfTWrSR4CniLzhtUkoGSFm
	Y8XjyuiGHjC8e550flC5SEbsPQKXXfEHj/QKJBZRaUgKvGypSV9EpNzUBajUH5WiFiblSrVJUdU
	9jMaMK2HlD7VyJamxR8l0h0/0ru8xNqlQ4aOxYDbp4dqvU5/1qDoRdDawF8MFKwibOYJZJg5Z+O
	KqD0EqWmaCy0GS1erI0YZP+bIJOT6OL2VualqtfSf7ty8smRe98fB2Mo/M4CLK+/gcZVQ/pDPJ3
	alPFN0+1BNfr6RHBJ+sF8DpG7pPbxt7ZNkeOgEE6aYu8AMuSnkBnZlOpVBgFvShMqwEzQgWONl5
	p6tqhNeaqiAbQ+neuLpsQddWM5ckU1Cg7aKJ91evweEsuNGYJZrquDrWxJvBc9FUEqMnXZcoKJU
	TLYaULmNsYhhWjFs1V6yZ56yPrz7056LKRCbFE+FFDIQurpP0qA0SFVP9enUbyPlTGYqGiiXXEr
	3tnutQ2Q41PcsgqOKMjYPafq44TEDg0Xlr26zHOEEKeVQxGAu/eGLPbdsrEVQazwlhPD8OAnauu
	BNtZeneSpiQ==
X-Received: by 2002:a05:620a:258b:b0:93c:3863:ff7f with SMTP id af79cd13be357-945e1231638mr47030585a.0.1793813921165;
        Wed, 04 Nov 2026 09:38:41 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d479ddb7sm249464685a.9.2026.11.04.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:38:40 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOewa-0000000Gz0A-0aRN;
	Wed, 04 Nov 2026 13:38:40 -0400
Date: Wed, 4 Nov 2026 13:38:40 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: 0z5a <dezhen.lu@student.uni-tuebingen.de>
Cc: leon@kernel.org, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH rdma-rc] RDMA/mlx5: Fix DevX umem page size truncation
 for pages >= 4G
Message-ID: <20261104173840.GX3889730@ziepe.ca>
References: <20261103142804.67210-1-dezhen.lu@student.uni-tuebingen.de>
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
In-Reply-To: <20261103142804.67210-1-dezhen.lu@student.uni-tuebingen.de>

On Tue, Nov 03, 2026 at 03:28:04PM +0100, 0z5a wrote:
> From: Dezhen Lu <dezhen.lu@student.uni-tuebingen.de>
> 
> devx_umem_find_best_pgsize() computes the page size in an unsigned long
> but returns it as unsigned int, and devx_umem_reg_cmd_alloc() stores it
> in an unsigned int. When the DMA mapping of the umem is contiguous and
> aligned to 4 GiB or more, and the umem length is a multiple of that
> size, ib_umem_find_best_pgoff() selects a page size >= 2^32. Since the
> value is a power of two, the truncation turns it into 0 and the
> registration fails with -EINVAL.
> 
> The umem log_page_size field is 5 bits wide on top of
> MLX5_ADAPTER_PAGE_SHIFT, so the command can encode these page sizes.
> 
> Seen on two GH200 nodes (ConnectX-7, firmware 32.38.3056 and
> 32.43.1014) with a dma-buf exported from cudaMalloc memory: registering
> 4 GiB or 8 GiB umems at 4 GiB-aligned offsets of the dma-buf fails with
> EINVAL every time, while 2 GiB umems at the same offsets and
> ibv_reg_dmabuf_mr() of the same ranges succeed. Restricting the user
> pgsz_bitmap to <= 2 GiB makes all of them succeed.
> 
> Other large physically contiguous buffers, such as a 16 GiB hugetlb
> page on an arm64 kernel with 64K base pages, should hit the same path.
> 
> Use unsigned long for the page size, as commit f0c2427412b4
> ("RDMA/mlx5: Fix page_size variable overflow") already did for the MR
> paths.
> 
> The bug was found by an AI coding assistant (Claude Opus 5.5, Anthropic)
> during an audit of 32-bit truncations of page sizes and offsets in
> drivers/infiniband/core and drivers/infiniband/hw/mlx5. The assistant
> also wrote the reproducer and this patch. The reproducer was run on the
> GH200 nodes described above.
> 
> Fixes: 7610ab57de56 ("RDMA/mlx5: Allow larger pages in DevX umem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dezhen Lu <dezhen.lu@student.uni-tuebingen.de>
> ---

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

>     - So I have not verified that CREATE_UMEM accepts log_page_size values
>       for pages >= 4 GiB. If it does not, capping pgsz_bitmap at 2^31 in
>       devx_umem_find_best_pgsize() is the alternative fix.

It is userspace's problem to provide a correct bitmap in
MLX5_IB_ATTR_DEVX_UMEM_REG_PGSZ_BITMAP
for whatever it is doing. FW can reject large sizes outside what it
supports if userspace sends the incorrect bitmap.

Jason
