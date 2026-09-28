Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2121503BFF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640003; cv=none; b=VGbtWNy1pG5lAJwc08ZXKIaHAtX2d0dccZaa8V1sYmDGTMOin72vAsl1FBo0T2vZPH1O/sj5nBltiMBv6CMMgfLMBW2n8PmKF1a+8J82Ijlht22d3POngKcPsWXF9f9AvNTs/PfP1Smv7j4RSeIttehxKz8pYyEPH5gMiGc/kNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640003; c=relaxed/simple;
	bh=ot+I73SaU9sqn64543aeRD7kwAJJI21fZVn6OsikOA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rl5OCBZHypiEJRseAxfj0ofZhtDnwhmYpnqjxCVNFonVW+8rQ23kPTaPLbr5UlZHivehjXkPvyKJejsYNhG/ej1lh0NutO7+BiSeK/paqJIAaK0b7HI2xQ1aIIUL73RmFt5C3Ij83u3xph0R053Qm8/DwwzAqbPJcYOWkLbu4Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PROGHTC6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PROGHTC6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d8facae850so18315ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790640001; x=1791244801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kp5ei0/iKnj9mU7W/OT7FmtL2iwT8AA400ktoI4ALho=;
        b=PROGHTC6+UpGMYBmv9WG4bXjieemg4XXG9DoZ/GRkW2JS2mQ/gWhu4oZZVS0hJY6kg
         k9bHORTlDeYGSPqrutYop+FNqcQ1QHXxl63miGJUiYEzIxcb1LUdIOQYvWbcCbEl3G/8
         rRLFkIRIvgjqMOxHY6oxNtxJOx51gMZLvJQh0/nCeliv2iS2NCFyL5aLq6YTIZxidK4L
         i6HfJu5ca4PE1hYVPC/gkVlyBTXdlP5dNVuieb4dV+q47vlwxS7Pb4fE7jqNVPaPvt1h
         8TH3ynDLgZPKMZWRvb0cOu6DXWd/IrTdZjvZqURQyvlbdHayK4/DXpjAtl1yJ+O4FSZv
         0ZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640001; x=1791244801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kp5ei0/iKnj9mU7W/OT7FmtL2iwT8AA400ktoI4ALho=;
        b=osIrunlRrZVcANon6ZoT2mB/nuxblnKm6q50EAufzUMmO9d8RobfclDLWpOpGIWrz7
         HDzgPAZrK40hZ1mI7vtZmr+8tuI6UkjLkC8kftszErZSK5OmFdvFd8zDeZLjwuGnL9Ce
         1cb8bOBFCY26uHeILXcKd88qtadh7EN+0m9eoG6Aa/W5/0nzmPNDVfFmRUyGyQkqvs+e
         +nTfC9GdY8yKK8K3WSoykgVzuc4sVpZZBmx3Eu8eGdq7VvN22tY6YFJdc/w4GEnhYiT3
         NYQ0sBy9BCd4qApV/dUHF/JXGV1i8+kePXiLY7xCqfsSp9iUyiEU5jRBu6HJLZaFy+Wx
         3Jww==
X-Gm-Message-State: AFq9FYJpmmh/I1MLXbEmeVxGN03fnyFYRj4fkcSdIl9Nhal1wXtWvcMg
	QUvWLzrxmna895EFBKVTPddTXX0m3oVxNdHTN9/Y/kVnGxct8sbxUdNBrDmVR5d4pQ==
X-Gm-Gg: AYBFou2n2R+rFdGTedbs84vRAhDi6X4u/1YV2pFMnfgX1DOoLpVqpQ2ntgbKT+M6VxE
	PHDj9pck7DK4a8f6ObObHuVUX1CERPLHCucN8Y5+4TCBKkKav3ilHUSkvXd80RT8c4pUPHLJDl0
	YQEOk78XuO0yvwxQZcvljXwDkrS/E8E95Be5gHRVs1i52r+UTorvF9NmkjYVoaEHdzVWLfDau/J
	Jo09noMUD7NQo/xOfYQjZ3+UUfDfTYEhQvPU2Y74usVo/eO/WHqZVwFeWLWxs0xbdjZ5FOycMB+
	XhRsum06tmLVSLBm3HOiMq0o3iKZPyRbmvby6dI595osup0Xm2sNeQz/bm/fiQFLHNIrSHcpC+K
	Y7kkxDLMqSTJuU4DWS4jlKweT5Sm9YV8+Y5m2k+/6dR1vKTR48gzBPnKv1HEdOCk63jTFbn8Nfv
	MeLOECgVbdlv5xNzomS5uGgyNRweBlTtFXP4nhqi2wbab9hrG4NsGWKYljsayzn7d81H0miT5rU
	rjCNEV9tN67fPWly1oVcOfI3PbWoLIcdjo9
X-Received: by 2002:a17:903:2b0d:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2e2c608146fmr1652085ad.1.1790640000240;
        Mon, 28 Sep 2026 17:00:00 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91444797sm47124675ad.58.2026.09.28.16.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:59:59 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:59:54 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 1/5] iommu/arm-smmu-v3: Ensure L2 tables are visible
 before L1 ptrs
Message-ID: <arr_eqQJtOAIT4Pd@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
 <20260924085616.300650-2-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085616.300650-2-smostafa@google.com>

On Thu, Sep 24, 2026 at 08:56:12AM +0000, Mostafa Saleh wrote:
> Commit 6fabce53f6b9 ("iommu/arm-smmu-v3: Add a missing dma_wmb() for hitless STE update")
> adds a dma_wmb() to arm_smmu_write_entry() to make sure stream tables
> and context descriptors are observed first.
> 
> However, STE L1 table descriptors are configured directly
> via WRITE_ONCE(), where before that they were zeroed with memset()
> inside dma_direct_alloc() then written to abort in via memset() also
> in arm_smmu_init_initial_stes() without a barrier in both cases which
> means that the SMMUv3 can observe the allocated table before the
> written descriptors causing it to fetch random data.
> 
> Similarly in arm_smmu_write_cd_l1_desc() where the L1 CD is written
> after dma_alloc_coherent() with no barriers.
> 
> Add dma_wmb() in both cases.
> 
> Fixes: 48ec83bcbcf5 ("iommu/arm-smmu: Add initial driver support for ARM SMMUv3 devices")
> Reported-by: Sashiko <>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
