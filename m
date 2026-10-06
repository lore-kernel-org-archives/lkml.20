Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4657A42466A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294513; cv=none; b=rlaSK6mOKQia01NhvKz7ghJn+jxQQI1B/4HLUVhPZRWLiFYtZhS2Bxn42KF6zkirvAiGBNgmCThK6fJkpnbCptnSXlH2JHpKFraz7iTsh9AALV27XLl+jiookEncNFzBS5YVHVeaBXgNXaefuBjjiMyMilLgnn6KUdi25bveiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294513; c=relaxed/simple;
	bh=kMtTkezz8RK0C6SIlG94IbvLyEEsxqh9OTzo4DlPCrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MB1ezcQozj3/hLwdpqo5cFW+LOTCZXilkCTrj8OqtQNbi7uUZi/+v6ztB/x5LxgLceofaXhgntuD1hTMcVAGEOOn4J0eaxKSfkaVdx6U8A7CdazXsn6v6BEwg7/d8m5L/ExSxaOHyuvd3BLfSjnpAeTxOppQQQv3weW8ElNrdPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=zDL/YGnq; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="zDL/YGnq"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc73a80ede5so1223724a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1791294508; x=1791899308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xd+YhTvmmDiJasiYfZDfV8qAggwrlgKHI8hk48pv8dg=;
        b=zDL/YGnqH8YvAHo0vE2booW3iNn8L9i59YIB/gJBLc2H4PWlGJZxGgX0P/sp5ndVsR
         UxPUwkcIoUbPUSkHdOoDB5MpQ15ma6dr3Ln6b6MSf5KpzEOk7+L2dfxb+YhLCiTlBr3l
         UCjWHsdQbc1biSstrrsCR/bO+gDkizBulxzxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294508; x=1791899308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xd+YhTvmmDiJasiYfZDfV8qAggwrlgKHI8hk48pv8dg=;
        b=obV1J4W4Y+nZpFDX89PgjSmK81X3vVZPhkzd+BQm7zo5xtQlHNrQ5tKDpdubPSnmVU
         wwcnXij5rIuTwoKTM4fN290RD1FnsylTI3a9o9tMhvt+VgHplWQX9pKwqJbNvPrbNDpY
         MVnZDUh8nQzC42nj1p0pNhMOw2tr4xIZGMOsSoq0CGRSlqYp1Qw0r9vAfRR9zxZ4tQTk
         svtpJslfjTTWBVWbTCEPo3yLsh8B8/yAQkI3Ra+R/qwn/YBEVImM+1wIQyXM55dY3MsW
         Xg2MWxHIMrPL4+/UhGMrgT/AfSw34p55RB1ebadfcvK6dnTQLx8pxhceuh0+8ajs5ezp
         h1ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxAJexJeD4YeEo3pk2Hn1BaW0gCnF/mdzsTr0OWjVcBSpljj+PFXCyUoGuCKwTFCS7Bb7Kz2B+nCIUrP8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNi7AwmmNJXRpFs64nnKWlf7dtxjrEoEN4dfpHfIt4ntool7/f
	73yiNBM/pn6Ck4ZuFPwLrDw393FfpwLTjSlMbgT8ayv1ggboMLNnJnhipDAEbkHrqls=
X-Gm-Gg: AYBFou03RWrcYNwFSrEH+RU9dSiN0SYFxBt/caIeyKRx/pPsjSH4t8zbCSu3uGl6VLr
	EOoBQrXTt62heKQgUKAPmxPk3dvmoQyk7bzZsROqCtqtrji5UY/n1sgOAEi/LYhdrYS7kjcIfg1
	peL+rnf8hqWGLh9yD0cDpaNcYyyLAP2WwJu4sda0B9FCaNfHmzEP/k1aGZE41b9uykugrRabfTU
	CmBZ2V4DD4/tk+K3EIeR4nDcUIOVNZwTu0izybElV3yexDoEQCPrevcpf9Sv7UU+ID8XAxucOM1
	dCLLQy4CMO7xqeywH1Dz5cqAWYdpoc7rBSlqFxGOj8Rqr9QK1Vzfpopf3SfT/XWDoeZQKTRpQUs
	1hBUzoeFsmYUEoDbYRQLyw2vcLdtSy5NfRxBjzg/VyNv5MfEsTMc18AD3Q16W656brWR5aGGUkO
	b8kXRY7lXm1KWcNnCiTzSMkgFY4lNAVNsyMu8AuqpgnTBbgpgy9k9pyB/uenKLRXqPrQ==
X-Received: by 2002:a17:902:f78c:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2e4e9c29bdbmr98737285ad.7.1791294508455;
        Tue, 06 Oct 2026 06:48:28 -0700 (PDT)
Received: from 1c1aead48890 ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5eeca3dsm24227885ad.67.2026.10.06.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:48:27 -0700 (PDT)
Date: Tue, 6 Oct 2026 13:48:21 +0000
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Mark Bloch <mbloch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net/mlx5: allocate dma pool structs on the pool's NUMA
 node
Message-ID: <z42vlmle2feb67bdkt6oswrhytfuruznrfnfo7z7caad46sp3j@ms7c7rxs6vfc>
References: <20261005-net-mlx5-numa-allocate-pool-page-v1-1-01f4283932b4@snu.ac.kr>
 <dd8747e3-5502-44dd-a64b-8d2ad5fae1ea@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd8747e3-5502-44dd-a64b-8d2ad5fae1ea@nvidia.com>

On Tue, Oct 06, 2026 at 10:10:06AM +0300, Tariq Toukan wrote:
> 
> 
> On 05/10/2026 16:46, Seongjun Hong wrote:
> > The mlx5 DMA pool structs (mlx5_dma_pool, mlx5_dma_pool_page and its
> > block bitmap, and mlx5_frag_buf_node_pools) are allocated without a
> > node hint, so they land on the node of whichever CPU happens to create
> > or fill the pool, whiile
> 
> nit: typo
> 
> > the DMA pages they describe are allocated on
> > the pool's node.
> > 
> > The pool, page and bitmap are dereferenced on every block allocation
> > and free. Allocate them on the pool's NUMA node as well, so that all
> > of a pool's state lives on one node.
> > 
> 
> Thanks for the patch.
> 
> That is true, but these structs are only used from the control path.
> That is once per WQ/CQ/EQ or doorbell record at open/close, not per packet.
> 
> I doubt we can measure any benefit, so it's just a matter of consistency
> with the other fields access in data-path.
> 
> The API kzalloc_node falls back if node is offline, so it's safe.
> 
> No strong motivation, but we can accept it.
> Please fix the typo and emphasize that these are control-path objects.
> 

Will do, thanks! :)

Best regards,
-- 
Seongjun Hong
