Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FC041378D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419448; cv=none; b=JKz8As9znaJAFRMsBLslglniHKD7LcPzhRYz0r+VyCFQ0xViSptY++JNXLhKdvIUfmTsIyBA1ZY6mWvbcJwIL8HknNENNZOILODVaZiYbVnHtShsLF4JYbtwH/wmLrSVwjZbgIHLE2UfAdsKSixxtsfdhqFF2VwWrZDhe9/wpUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419448; c=relaxed/simple;
	bh=MctTYdfGPj00J6w1N5O8ZOZ/SCKIeqWaRzqr1F43zWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0Yx1eghuJqzWIuStnqsszhhaPXrCeTWVT4aQrztkbPfT1DlRRyVI961DhjrqeWNE8pQ75UJHi7kKS1hJSwyJRciUjmNAsGWJ8MyHzGTbqYqp7VB4b8MnUftveO3ZKfFZze543TFppNDu1gqPVY/fib/RlMr9PndzhvPUYrbxs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qL/OhyO0; arc=none smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qL/OhyO0"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-91447a0d24bso1487906d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790419421; x=1791024221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z53uSMUq2W80HZiwGXPg4CfzzfvAXSACVLwfmhiGvRc=;
        b=qL/OhyO0UDeziz00j0G366Kb02C7eN5TfR/RBO72sZejsQSCdwPG69FsN1NCoOnS7D
         ADSYvJKPSCfIGVUag/LhAMPfvcxZBEqa3iJmcww0jy/dk+BQvHCIWfiBON2Q010cp1m4
         X7xALojr0YtRqI2wnRmEzT8c8qiRdDhtWbf8edoZQjDgyzgbsnBxsHlmwNKrP6OvOn4u
         3oaBFn7t7FyaQHwFR2zZzf7uDDSZ/drROyQLXZ7Z9KTgHWPfbJI9OJ5Dj3AlHLi8Nhi8
         +Rc9cexAdUWCRRi/OBgaWZ8nY03nRDI7WsAo+XykjaqIe3nVupulrqbwkW9SuDOMUZXU
         B2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790419421; x=1791024221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z53uSMUq2W80HZiwGXPg4CfzzfvAXSACVLwfmhiGvRc=;
        b=DawUZoSYG7tiD14IycAn5GlH2aoPMEcU9Q24KdUJW7JDnwhLrISgy1tvG67hgfwGoJ
         wrRiz16jRrkDqD0hpJp7O3W7ba24Io4F/N0NJa5VhIOrKlz5JWPoWNxVrQknVaU46VPF
         pIGyONbZfT6d4oHOV/609wUn2knmxlIMZpkwLBr8OT+exiriBz+ha083wHGM4oPG1IZj
         zND8hfF68unIcgyWkl/1p00gVRJ+wBqcAScssIQGLsBRvRqpEh0Egqf0A2f3r8GI1t8s
         wMNpl3apj82XpXSOknbmvPjQlq9PWsfZ/LupgCiMa42LX4+VaaGmnSw8ee/R3qok/jGu
         i2+Q==
X-Forwarded-Encrypted: i=1; AKwUvByfNWQIBXucsoUQzntulITg2jchhJzevpmM5PkI3gKmW853G6+1DjN9XW6xIRuw1pqUuVZE+9+tLIsn4/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4SGYCF1rwAcDaUg4okCjwBJQ0FD2GFLBwfN9A5vSwYsbVS7xS
	43Pw+AkrpHVoLvNbcuDPpc8U3sNYZKRNAuSadOZygBSDAxx7OnvtrgxLrp6xcYO9x3k=
X-Gm-Gg: AYBFou19vlHu0UNSLQE1L10YaRnKjXhuTtEXB7AYAcwNNBA+PGQaZiFWMPwZ707W0Em
	rTfPB0LxJq0cCN/hMvm8MO9uOebUaJSmEu3e4/H1MTs9oEHOCEBscWCIe4RB0oTjf1cvzbR0fMi
	DOjyQUop2rS4U5HdHUxoFUMBA6vJ6O0zh3FJm7XzHSHldbW6LREgamkySYiXrNo70VcMdiN2lyh
	b6F4ijvBMEmRRH8loOrEZxdT7OYE4zbC59BC+QaMopEMFjk2y5NKgLy143v2yvtKs/CXCEssJpE
	L2HSqnVN+nPJdYVDM6bOIaDYiRy5pQNw1FuVCkWgPreT0y83wqJytig1TlAjgavT6xKR95sf6h1
	2/QuQt9HertLKYyBypH6eNo/Uj7jZCyMnKXLvcxJyRKBODfssqATd3I9W3td4ZQPZjQwrRh4p9y
	3CESPdFsaw9+Y729BP0JfoNKGvt+GviPbIPgB079r4a5cluYlwUWPGEfzdd6yuiiJWBObwU6EiF
	0mv3LMZXDA0FB9CFi34MeEKEBeUBWVKx+xRIGdU4LmXzN9YIZJOFYI=
X-Received: by 2002:a05:6214:3b82:b0:914:48c8:6961 with SMTP id 6a1803df08f44-91448c86fb2mr22359076d6.17.1790419421191;
        Sat, 26 Sep 2026 03:43:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e6ccfcsm36688496d6.40.2026.09.26.03.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:43:40 -0700 (PDT)
Date: Sat, 26 Sep 2026 06:43:38 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, liam@infradead.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, peterx@redhat.com, jgg@ziepe.ca, 
	sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/mempolicy: use vm_normal_folio_pmd() in
 queue_folios_pmd()
Message-ID: <arehr1Z86Vp4gFPa@gourry-fedora-PF4VCD3F>
References: <20260912034833.2952750-1-gourry@gourry.net>
 <20260912034833.2952750-2-gourry@gourry.net>
 <aqpyp7ouLyxGhJDK@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqpyp7ouLyxGhJDK@gremlin>

On Wed, Sep 16, 2026 at 11:53:58AM +0100, Lorenzo Stoakes (ARM) wrote:
> It seems that setting ACTION_CONTINUE or not makes no difference.
> 
> This is really just a long way of saying maybe you could just do:
> 
> 	folio = vm_normal_folio_pmd(walk->vma, addr, pmdval);
> 	if (!folio)
> 		return;
> 
> ? :)
> 

You are correct, I will spin a quick v3

although this will hurt to rebase the rewrite series on.

~Gregory
