Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AED28F5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640220; cv=none; b=txn6xpmZ0tf7k1LHJlokfnm2TPZMzFrRO8lAm1GXCn/HPwxED2BRw1p4/CR/DkkGzGJUdJ5ioJmT80ON+AjxwhDBxJF82vEewpSDgkujAIUBuXca9YTGBwnpsjhYKRLJnSf8e9M8vTzhcifjx1qfxcl+Avf7vcl47icueICyACc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640220; c=relaxed/simple;
	bh=jXrA8xvjjQHkO8GKfUivU2SnIbTiQoVIvfS9egLJ8gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSaUwusI6UglHsS9eEba2ss5cfkCpaab736zdj3fHZsmGvcfOQEeNNNDMEzoHmvdVUDt2LWOhrdaSrjVprKOX2+R977sfT4WG8ux1IZtyIdmAL2Lu5frYah1M/z1O7TMJgIxeu0VLuJc2MCHcrUD3v0yd0DQMejRaW2S185lETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sU34ilTD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sU34ilTD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d8facae850so18615ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790640218; x=1791245018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2F/AKOPPTrThK6tDV9k5jGK57yQHRX8v9mM1yN644e0=;
        b=sU34ilTDOsPhiFcSwMP7vil0irDbMi2+jqHZDtnqOY9ZOv3lkzBerF7Vc/xcye4fO6
         1bAhSOaOBnMt9dJfqCroYNXNjAn0jPvhvSgs87RaJOQd+WDP17vJ5Gl51e7n+5dhA0UW
         7oGkXAFHoPIJwXya0Hyfq6hLm2gO7BBKgiDazb+K8rdtT32GtUX5323N8YtWK4/eS4iG
         orl99amBKNb2TDBkVygoEslXZ/zADPgHUNiK71lIVfCADdcPtc6PTrrQPF2n6ZHiO5Mp
         JTZld59YQxjVsmV0r3dBuEoc71qiA90ymUzw9Y/4w5Fb1/st+i4oqiNRUMOgWIMZkJTg
         dFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640218; x=1791245018;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2F/AKOPPTrThK6tDV9k5jGK57yQHRX8v9mM1yN644e0=;
        b=JKXrHFNY9eg9+azsk2bAanxw2lTj1DIjJfHdYh6pQGXHCNhEJDT2YnZYi57BtX3Ox2
         UFrZYKq2WYr96oVQJQQQJBquUJ3WNXLrI31JWfw52mZODd4mpQEKiqDgRhDdiBVWVqd/
         IyGkrARk4mLWjBjkflO3rRVsEqcowA7pyl5EpkqGyNauYrY6b2MjjH78yGbNaGCIHdKV
         v89wRvlqQE883gaSbswIDa5J8ys7PQgkHxiZn4vGtwYg+k1UXc/EbBwzFcUWwBN28tYJ
         1/pw5ixqQMSkyKom/1P/TxhLh9OHcvPL0SrX+XjDNkX7COD2J1z6W/ewG0Yn8gbjzDrF
         dUpA==
X-Gm-Message-State: AFq9FYL3iHS6ZA3G/LRlgaULwnGsm6vtXqDhuKxXyJyR4URkYbchEy99
	F15yvJS1c688Q9bnOk+po8/wKfwQ0Qi1wdZ4O+F124Nnv70sIE6Yj1wfkM9pRYL9rA==
X-Gm-Gg: AYBFou1dXfpN1n/NGCBT4NxjbkUR/ubGmc2SCVZTYaKdQVoMHlxa26F9gzOh0dGID7D
	QKZWGtAnypXzDMxleBBM7DuImC0BJsgHrcPbykTxuqxcfr7KPYYMOJRbh4X+TPz5OCh2UFufVQ5
	NaEgRa7+nKEl/9qfF8t7w6639YiInQLt4Vskb5zR0pcn7crGYzSbJf626o7EeUMC1lKfHYMLSvM
	++AMTjGTEiqeoJJDqRqjPvbuhGQ888zChiP1bLtGyqwPEnD3ebLkkL/rXGIoCLZzWfdzhqpsFpc
	GSlCPCh/UjBs1LUmWAbguyNcKBRcl+UUCEszO97w0BGwm2OmKQIDSHoACmP7LmNSQraEw6zM91g
	mpFMFbADEPCzF2HL0iTC5kRXpY9v0+Z46bxb2CrR8kwjfiiHuMnQSWxNz6iKjeNzjtALPZniPhs
	PzJeQ9vGnNTImkgKWRCf/KpfQeCWlU8yMlRFhdUjr+I+oZ7jXPGN48/7EN2OgNcBbn1ljcUR+PM
	pZEZEKJHcYlt7TFNsiJEn/CwAinQKJg5/P+SA==
X-Received: by 2002:a17:902:cf43:b0:2d5:db38:800f with SMTP id d9443c01a7336-2e2c7aa9597mr866985ad.14.1790640217487;
        Mon, 28 Sep 2026 17:03:37 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90c03890sm48006485ad.0.2026.09.28.17.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:03:36 -0700 (PDT)
Date: Tue, 29 Sep 2026 00:03:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 5/5] iommu/arm-smmu-v3-test: Fix UBSAN error
Message-ID: <arsAU9l5vOlaINNE@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
 <20260924085616.300650-6-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085616.300650-6-smostafa@google.com>

On Thu, Sep 24, 2026 at 08:56:16AM +0000, Mostafa Saleh wrote:
> struct arm_smmu_invs marks its flexible array member inv[] with the
> __counted_by(max_invs).
> 
> arm_smmu_v3_invs_test() uses invs1 to invs5 which has num_invs = 3
> but omit max_invs.
> 
> This causes the following UBSAN error:
> [    2.333240] UBSAN: array-index-out-of-bounds in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1116:21
> [    2.333604]     # arm_smmu_v3_invs_test: lib/ubsan.c:228: array-index-out-of-bounds in drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> [    2.334129] index 1 is out of range for type 'struct arm_smmu_inv[] __counted_by(max_invs)' (aka 'struct arm_smmu_inv[]')
> [    2.335375] CPU: 6 UID: 0 PID: 155 Comm: kunit_try_catch Tainted: G                 N  7.2.0-g8dcb331fbb72 #2 PREEMPT
> [    2.335759] Tainted: [N]=TEST
> [    2.335791] Hardware name: linux,dummy-virt (DT)
> [    2.336254] Call trace:
> [    2.336932]  show_stack+0x18/0x24 (C)
> [    2.338443]  __dump_stack+0x28/0x38
> [    2.338494]  dump_stack_lvl+0x54/0x6c
> [    2.338518]  dump_stack+0x18/0x24
> [    2.338541]  ubsan_epilogue+0x10/0x44
> [    2.338565]  __ubsan_handle_out_of_bounds+0xb8/0xbc
> [    2.338834]  arm_smmu_invs_merge+0x688/0x8ac
> [    2.338862]  arm_smmu_v3_invs_test+0xd4/0x598
> [    2.338890]  kunit_try_run_case+0x64/0x160
> [    2.338914]  kunit_generic_run_threadfn_adapter+0x28/0x4c
> [    2.338955]  kthread+0x10c/0x12c
> [    2.338984]  ret_from_fork+0x10/0x20
> [    2.339433] ---[ end trace ]---
> 
> Explicitly set max_invs = 3 on the test arrays to match the number of
> elements.
> 
> Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
