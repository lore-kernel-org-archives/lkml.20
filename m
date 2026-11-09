Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235712;
	b=Xiz/u2DSIdoeg4dFgvpmkLHnSfRVwfK7ZQLY4z7ELKvN+pUexWcvZ4HKciNRLbMI37yG
	 mFp/ZJmxVTvBxgiFmSwxGeMfE9Bw9XYY9M2muzPFKuGxIRw0U6M216GRFIU5hc91YFCR6
	 Ta3ZkJCsw8MvIdp65Ol9m/cOM+iXbduXhwKBRMQjDbgD1g/3Ll6hbM0n8DkLMFeVzBu5z
	 f/SzLXBgfBpNEYf9YngPl81SdxbMyzxdg9QGPA4snWg0DO5J7152h2kgoOeI9MLpXMy6D
	 6uSyaTWVpExcFzPBMNit2z9HFeQ7NnEsqKgkGncVXbfd0uu8RC/phzlg5wWEike/j0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=M7mjVSswzFiYPoD6QT1qC2YywjNa1eCvKgF70U0xhrg=;
	b=yPGNAwvKQ/zoyGHtVgd+h0xyGHMEcJtZm8t/CH1FAsv7FxaeTtkwIxxE+8OJgZoTgbDK
	 1crxyrs9i5910ZK5W76kq54RR5KuW4ykXEefpvDByEk7Rmkxg8xD+QJLbUUeh4bEgXSUV
	 N6g4VUy8eeqaZROeImNW40aYwkJNpjV2cM3sllW5GhT1AcB3Rpm1DIMfrhA9OnbBNnrMT
	 HU05aO20jG46/q0aY84Y2Z3OgEkavtJuF+YpPoRTDCVQEnzQ4/SwLFnEiXR80OX5RM/+K
	 2aZbpKQgSFqCPpMQcyklD8WkqFBGwdwGINkTOC4NEw9e8I7KzUWEQnpi3l5XzM1FwMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oNUecxHC;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84120606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84120606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oNUecxHC
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f3c895a0eso80621785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794235710; x=1794840510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7mjVSswzFiYPoD6QT1qC2YywjNa1eCvKgF70U0xhrg=;
        b=oNUecxHC4848KNAA26lHQ2G+BYpWGFvGSyUdQl59xdkTLL68nrj101K5yWsvlahxtJ
         NjIy7n4cPKvogrm33G94/yLTrcNabAnbH9oaO9/fqlPdqMhETQ2ody+fek6SSMiHM7lK
         1DB/dDCxqHNrel53IXnnPdTTAasHGJTssEOZ+Ca0HANmvndcE7KPej/d1lzOUgobuQGh
         U3BAlPeubxLio1DWsA623BiUEwqpep+ErKLxc2x4bBU8vHIhgqvUYPLdowJ7w6+mEe2z
         HPHXw8Gvah2ZH/r1bnklT6b2NoK+Vi3kDWqd3gtj/SvPFzgaYABt+HWB3Wqw26RfkEqh
         rcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235710; x=1794840510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7mjVSswzFiYPoD6QT1qC2YywjNa1eCvKgF70U0xhrg=;
        b=x/u9fXATLsuBMwy5dz5mu4gM6I0C8dwduHJtO4hbHUqAObXDReV+wdas/14Hf7dslt
         lBhZGKsvs0+PhMekpLCI+hwK5p+s2L+Qcs4AVofYINdn5H7IxgIS+XbWpBPEmRMNFBlm
         Eq/fNk+p4V6nhBDAw4PJ0JS6FrDIfTMb+0gj9vRXbLoNd+qtBLJJkRvLWj9GgrhwvZQT
         DlhkaHftN1uLELCsUSWsvUhTFS2UTKBODThB//fuzZ0vRSS5f8vFPqf7AXm6LzDTJEk8
         6yMlG45FItjpq4kGhfqJnlABDXqnRyEODm/NqEK3DOjfAzuDOTMoYVjY2s4CXXZTrzGh
         HosA==
X-Forwarded-Encrypted: i=1; AL+hErETMneDMKZi4/5TxfBW2BInJMPdmmZy7hEJFuQ5CQkZcdtHCST2qlEWroyLnmGLV1bGltgXWfC84EUtizU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m/vdzMrJ7x7vIxhy+q1EImT8L797pvUnHGtapf7I+Gjfuxzlb
	/e0Aye82RX3XLiVWSS/LjdrGPBkn/mFfUvouhpDR9g1qPk7q34GtkT4L2NXqoixD44g=
X-Gm-Gg: AYBFou3nzDAbgSaIPIH015G+YHJEEn8TWYfb0lW2OhkaA4l/+UYNjvaLBsvbLfQfYC/
	u1iRZ32r2yZ/I9B9xS2RyOPq7nuaE75bXRY8t8SxBriDYW+3oCNKtKJq+WTkxmuhBjTU5uKA+wr
	6+pB9eSviehLmpt6rTggIkfwal1hmBE2+Uhvle8mRm42R9/qo6+GFMN5ILJ9sPuDAydbrbOEjG2
	Df1EX+4bYpo6T5Zj8Nky9uC5P0S6ov4UjSq4yRc0q3m8rKRLOZX3VwjHInOVPb/xfks3twSi8AX
	C5aqFtZ/MdIO1xAFsYhq+cNuQuCYqdkoax1MR10auvt2XaH/NsQk1mW1lEIb+MfGmYZlnk54yzB
	gv29+BOO2MGm628mMWotlF4gbORknBhor28cThHQY8yCuZgj/L8Sg/ah97getiN9mTXaiUg5P9v
	Lm4ESvl7w3C6+XE5qvnjfX187lI0ml8XI7zvU9Y26DqqHxNus37L34l4twJTzvk2OGLix8yy4rv
	uc/EmOZ6pn2dEoTImSwAPoSIe8uiYptUvi2ryRw/22UMbrr4EZE7NFQceoNabOKJ5i4ycR+MjAz
	+O/4NEitopAjp75B8xiiCygk0QAuShXIIXVwOl+KidmFJd+fe+dP9qc6TxJc1RgzTZ4SyoYmR9d
	Zh1WstWENTA==
X-Received: by 2002:a05:620a:28d6:b0:947:1d0a:c89c with SMTP id af79cd13be357-947848d1cfamr570972285a.56.1794235710297;
        Mon, 09 Nov 2026 06:48:30 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eceea05a2sm43886796d6.39.2026.11.09.06.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:48:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQQfd-00000001QiU-0CrP;
	Mon, 09 Nov 2026 10:48:29 -0400
Date: Mon, 9 Nov 2026 10:48:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Edward Srouji <edwards@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Yishai Hadas <yishaih@nvidia.com>,
	Yishai Hadas <yishaih@mellanox.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, Uri Dar <udar@nvidia.com>,
	stable@vger.kernel.org, Michael Gur <michaelgur@nvidia.com>
Subject: Re: [PATCH rdma-next 1/2] RDMA/mlx5: Fix DEVX UMEM mailbox size
 truncation
Message-ID: <20261109144829.GM663069@ziepe.ca>
References: <20261109-devx-umem-mailbox-overflow-v1-0-4a63baab25dc@nvidia.com>
 <20261109-devx-umem-mailbox-overflow-v1-1-4a63baab25dc@nvidia.com>
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
In-Reply-To: <20261109-devx-umem-mailbox-overflow-v1-1-4a63baab25dc@nvidia.com>

On Mon, Nov 09, 2026 at 04:42:32PM +0200, Edward Srouji wrote:
> From: Uri Dar <udar@nvidia.com>
> 
> devx_umem_reg_cmd_alloc() stores the CREATE_UMEM mailbox size, a header
> plus 8 bytes per MTT, in the u32 cmd->inlen. The number of MTTs is
> derived from the user-supplied length and pgsz_bitmap, so a UMEM of about
> 2TB registered with 4KB pages wraps the size, the mailbox is
> under-allocated and mlx5_ib_populate_pas() writes past its end.
> 
> Store the size in an int, the in_size type of mlx5_cmd_exec(), where a
> larger value would turn negative, and compute it with overflow checks so
> a UMEM whose mailbox does not fit is rejected.
> 
> Mailbox sizes within 512 bytes of INT_MAX still overflow the block count
> in mlx5_calc_cmd_blocks(), but the command then fails with -ENOMEM
> before reaching firmware. This predates the change.
> 
> Fixes: aeae94579caf ("IB/mlx5: Add DEVX support for memory registration")
> Cc: stable@vger.kernel.org
> Signed-off-by: Uri Dar <udar@nvidia.com>
> Reviewed-by: Michael Gur <michaelgur@nvidia.com>
> Signed-off-by: Edward Srouji <edwards@nvidia.com>
> ---
>  drivers/infiniband/hw/mlx5/devx.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/mlx5/devx.c b/drivers/infiniband/hw/mlx5/devx.c
> index fc6f793dcc6584e6a22b40c57e2df8f24579eb14..1da6c0e440d6e19d8791b012a148f479cfdddad7 100644
> --- a/drivers/infiniband/hw/mlx5/devx.c
> +++ b/drivers/infiniband/hw/mlx5/devx.c
> @@ -113,7 +113,7 @@ struct devx_umem {
>  
>  struct devx_umem_reg_cmd {
>  	void				*in;
> -	u32				inlen;
> +	int				inlen;

Do not change things which must be unsigned into signed values.

Jason
