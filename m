Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E561E4D1789
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168776; cv=none; b=VKMq3Eo3nUFg2XYR71z1c4PcdimNXE7TQzCALOZcoOdt2nb0WOpyLWfgBUg9hSGDNoxyOJZfm1OasxFHxNMjQxyR+nOUVZWYmYIiXhaHApR9spCgSv5JYafmSFVasys87qUxuG72qgDTUUsX54qDR8HPqKuOtJa/3hlqAMLqwWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168776; c=relaxed/simple;
	bh=ih23spaVgrDHOFSey9aqnpQ7LFap1dWio/xJjG+h0zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8ZowKXtLOuMFFERxvY7dG6IeItPutozM0WvQcf7RCdnvkSq96kF3mh7Gk8e1d4sfqfK6p9f6QEwPgiXcu+kwZ36dIAUsR6zVb2PyaSxxIeBjIO2IQ3SVYthhbxe+V9eKVhPuk4y9rXESpGYSSyoB93YpDpCSuv+nzeFYHsFWco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=QM9H8Zrv; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="QM9H8Zrv"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dce6e235so660266c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790168774; x=1790773574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ih23spaVgrDHOFSey9aqnpQ7LFap1dWio/xJjG+h0zE=;
        b=QM9H8Zrv8Qmtd8Cu2xViSORcsFrwLAZf52EqWpWEtiHi8IegetYozpX7YhBWxshiK+
         0eePIPj8nFGp6fC0i75hE012I0FgQNa0KlOJQg1v1B0Lws2vu3AN5GEWRB+K195I33qz
         rZYIMavFkLl5Yir/QCKXtDmlsV54UurB/VWu5BBfQOB8Mo159L60rNy8Ual6/V65aKzV
         8fkm97uBbww1JBl6qLUOmGSyiWsMPsLk+vLPG0zBoLldzAELihvhnI690O3s9sa/9KkU
         pXeeIE5pC4zejHf1ozeCT0tivhA8Eb+AbtjbanonYyXV5kdavqPndSGgbtn71gLrg/iD
         vfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168774; x=1790773574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ih23spaVgrDHOFSey9aqnpQ7LFap1dWio/xJjG+h0zE=;
        b=b5vg7HMhC9agGHN/8GJRm1J3NtgYTm1d7cF1ptIPwvPces7f9KhfpeQaOu0DVSCxwG
         TIaeS6xOR+dET5tv+DW4axgllw1WY9WvguQZW57gl3XXUQKkScicuskC7CJXVGDRBlqO
         0cZQnMu6yRSjPEMRQWaG0WrU/n22aI3ULi/8reDcnKijuztUHM/pn9UgpWjbntWucOL/
         yBlJYKLbnFPGJNIVWCzsQX15+Bt66WuwtjeiH64OoQ3Vgeui+YWOOaFOEUXZyHlFnrZI
         tmM/hLVWGnkb5CImMUWzd66Lo8+kXBdBQDFecciCfeCQXDoiP83/5oK/CEs+amkUiKTC
         k2xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu6PNA1fZ/Q/PvbrOW5TdFXk/K1heGlCyubH6ImUR2jfYSgyxiXun9oyHXPNbsrs6MqXafehuYQOnquWg=@vger.kernel.org
X-Gm-Message-State: AFuF++n8Q0FYi/gtVStlIGmJyBj2QhAQA5Baf02jD6fFPJ/IUwStizu9
	M+pWRhaf6BCVWt2Q0f0It1YTLVU2ML6ksCCHAxFZ4tODUFKzaEL64HaGuaXzT/ZbRfI=
X-Gm-Gg: AYBFou0wTkPpGYoJcKCbthPigMjMabkf1Q51c6+zfI7utP1xMrgjUEXjp0OiuqHPs1M
	urFCeXA61rEng5aJ2yNTKbAoRZI33bXrrTSglqzoDyI6n/DweXZqCLelC8Vu7MTQZ/Tiy7qySD0
	ZCQxnQekNES6Fi9bMoMK5l1CgyXNw9bf07zN/zRqMfKHod2gsZvFMqJjVkupK9jzNEkm1GiqErf
	pQbRkyILM8ZJa8ctn8YUPp6XZs9bGjGXb0lXd8/mo5DYjBWls6wAtHS8JWCrB9FSfSFb5yw8FAO
	C1NdeAeEakd1OXRB19Go+ApGXNMnw5aFjzk5sitD+qjSM3/naotefNZy9Po+mJHS4qs15AhEF+s
	kmb4Kh/vE7q+UvVYX5ZSfzj7GjHeezSM3DAiQtJy8owPFvNn1zB744al2TxGR4dJdFHkKtef96i
	2HcWkKZoBoumwQldtdLMD+Oa2RTs+SitAAXfnTIiSPEWwa
X-Received: by 2002:a05:7022:1402:b0:143:2719:566c with SMTP id a92af1059eb24-144f9198b49mr2872815c88.40.1790168773123;
        Wed, 23 Sep 2026 06:06:13 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm10833873c88.13.2026.09.23.06.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:06:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9Mfr-0000000DZ6d-2NEP;
	Wed, 23 Sep 2026 10:06:11 -0300
Date: Wed, 23 Sep 2026 10:06:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923130611.GF1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org>
 <arOspFxWZ1DjgcAr@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOspFxWZ1DjgcAr@arm.com>

On Wed, Sep 23, 2026 at 11:40:36AM +0100, Catalin Marinas wrote:

> The simplest is probably to always zero in the backend and ignore
> __GFP_ZERO to the allocator. But it's probably only marginally smaller
> than passing a CC_SHARED_ZERO flag down. Get codex to try this as well
> and compare the diffstat.

For patch ordering I would convert to use the allocator first

The semantics of the new API should be clear

If you pass GFP_ZERO then the resulting allocated memory is zero

Otherwise the allocator does Whatever The Arch Needs to not leak
private data out.

Once places are converted to the allocator lets go see what is left
and ask why it is left and what API it actually needs.

I think HCH was right that nobody should be calling this in driver
code, lets aim to unexport set_memory_decrypted as an ideal goal

Jason
