Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6481A34CFD0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640047; cv=none; b=hTKd4/7Vf7Vub8umsOEnXmq4qHWxrDUVoLQuBEwgc9wWu2gXTTE44fZQ5F+MD28IKnubVIOhJyUCMKoFOICS5agZOG0M3ynlWFazhp5Ef6+YWxy1XMpN6h1fIIBeFLAblVv5/3FyDmYMd1RiPdA5oURApcNtbkSk6RwfcjYUvJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640047; c=relaxed/simple;
	bh=icFQDtMBWHvhzEuFV6Sw9+Gnf9f+xqXBwwTEeaepzbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icJnlYnfckdBga+APn78+CxrL2zc0Av3VGEowNKc8xLdfUG0ZJQjCGRMa8MRo545/bgp7yIdIviDk26Q12e+wY1Ufop1nN0EcNGRzssljMIBBAOYOKTFL5/BsOAfl/NWbOF9b99GUIWFAxN+2tzZuxid3fAahHv5pqXLevhD3iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=grrg/6/R; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="grrg/6/R"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d8facae850so18445ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790640046; x=1791244846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=65cGZDz7HoPxstY7x2L7my2DOQ4uQMu696sLtL8irMg=;
        b=grrg/6/RCz2Yd0fXhSJR9QKiDHQVFCER9arKn4igs5EwpLQkIisE903c0t0NpAXxC9
         tnD7AKDGYUceFNTgnCndugZXk/FIISEscipDhQV8o3keEmDpFWS2cTJj5Fr03KtAIpuV
         e69L48EFMeHxIkhoVMgNOIupR9UheemW9RgbDl0jZ5ztZWUSup41se+s6UUAZY1mI6uB
         SH08yBh2ytAoiuE8YaSzeylIonAScp90txKUKcm6xkixaLk1Zp4n0hhhzJjZ0clvgmfP
         8f6Z+ziV8PZLPyrMELMGCXEzkYb8xhMiwqRzXLIG+PpWDktVcfaFQ4kgMXZ8Fzx1Q3eY
         LCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640046; x=1791244846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65cGZDz7HoPxstY7x2L7my2DOQ4uQMu696sLtL8irMg=;
        b=q2LfyXzJR09oM+isV/2Cyh0Z1EFCyc8m7x12daLb2UtBAg87LYFjB3UYOUj1L308dD
         GGA0s/VxASlnuQDhBGMmipKaRjkSC/rKE99EmzTL5zuvMRkCOgsIqZmaTmNZ7o28CWp/
         ru1d1Y1aJHodmp6yf9v8lY612QuIzvrdWarxdYDeCFlcOewCw+Db4+P3DUHexpts6obA
         e83suB0tpQXNwIYnrf86H3gClW0+mCJx02vxSHDteyrCURz7b6674DY0N4s5VJMExNZs
         Nm+hQLU81B0nWF0nmaERTPT5Y8qhxGxl6O38svfNhafzv4H0OuCR7aOgcTb+I/qVBCv0
         22cQ==
X-Gm-Message-State: AFq9FYJ61CYy7tTcr9z/xmfJq750g7GaRAqZ8zyAIW5VRMYo6dXryODm
	HIi1rTlUMRS8IXXbiCXSISVfIo4/hFGWvf6t2Wg42YSUzxuSVVzJOluJNn+60W5hWQ==
X-Gm-Gg: AYBFou2kH1/a4ldb+oBohHFYKpt7SAUje21cnZMkLLcx8p9NmZj+tp82YsXoz9Ra946
	ydfsYuyFO/lKETY/PbpfD9uQDQNcpFYwWfmfoqxAJ/joi6silgocaug5zv+7TnAdObgoGFAqStD
	0IGqscq4NPWS9cfL1wT2QDrRCFTCWaQBEo4zm8Mk+lTOER6BWaJdhnjbxW9D2i31OkZMRvmpg0f
	+UpiXKTHPi9ckx4UCiKJUrrtnU+L0Q8CO2aJmjGN8gAUm9G/J2EF+Q6xRtEZ4Z7r8xeO+/1ZHMB
	rFxlpZLrrkby7Wf/80i2HtiVelcMjBYAJTVyrDByp5zbvqAbGaFrjsLANafk9+ga4OnxOvd0ZJZ
	SxaynFj3xXb7+j8EQeFlj6usQf4jB6LHCb/bxa63rT3cMBJQzPqjzej4ZyTvrrMyB6Oxswi1OGK
	CX1/kme9KyJ2bAlGpVrMt8aaBE/6LgwAOZmOIGXRDDzvpelbdzLZ5MtxSIp6fBcWJZHW3oSypWm
	fUKZeH1ZtR7OxH8kpDUaiGajURe7hWA/axEKi1Xu17LieXkSaEqgt0D8qY=
X-Received: by 2002:a17:903:26c6:b0:2d7:1cc3:a69c with SMTP id d9443c01a7336-2e2c7a664e1mr1000575ad.7.1790640044876;
        Mon, 28 Sep 2026 17:00:44 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9143a3aasm47233445ad.53.2026.09.28.17.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:00:44 -0700 (PDT)
Date: Tue, 29 Sep 2026 00:00:39 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 2/5] iommu/arm-smmu-v3-test: Fix
 arm_smmu_v3_test_debug_print_used_bits()
Message-ID: <arr_pyGyKNH7Fbqb@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
 <20260924085616.300650-3-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085616.300650-3-smostafa@google.com>

On Thu, Sep 24, 2026 at 08:56:13AM +0000, Mostafa Saleh wrote:
> arm_smmu_v3_test_debug_print_used_bits() hardcodes arm_smmu_get_ste_used()
> instead of using the provided writer->ops->get_used() callback.
> This caused Context Descriptors to be incorrectly parsed as STEs.
> 
> Fixes: 56e1a4cc2588 ("iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry")
> Reported-by: Sashiko <>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
