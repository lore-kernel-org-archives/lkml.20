Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF1642E43D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278089; cv=none; b=bKeVnlThgJKuDB32JcciiIhAVtLvHLDgqu/mkfJElA9PAJVJ2O6/gGPGhrYp1LA2peb9/RXunkepm7Qc89X9zYdcHguwRX+kPg9Ax1NZ2cTtGm3EdyvouCoNVYW1XcPDFCgnB697SILGcFjX5K8owm8bphWGb8LndnazDqzLwwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278089; c=relaxed/simple;
	bh=fChNNIeTRqBn5nqD90K0ukY1OdPy6INqd7R3VWIz5Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FO2pPXa2DmaaGIe/6NoLBCCGR18Y4hkF5+RuOnzHhu5Qc5dRWdKORGEfR15i6m4atigTlZI6KVEJlVBmu6yMfynMPCYO4ebr2Go/2MLwzdGM10qvEE2N5h98V6tzXgp1qMO9/nijP7dlhZ6hOEqaKZEl6fgwvDr1XvPnoao1l9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LprvfNhS; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LprvfNhS"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90cd1012479so12219006d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788278085; x=1788882885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ucz+U5vH56qFJK/L4c9McNdRpbMBTFsKxX9xAzx9wCw=;
        b=LprvfNhS/aYyHT5i8pP7jZwsbo6MnY0T2SCk9DlESe0FzpHncRGruaAtrK+WHPRorZ
         jeLQkRo/PB5WcCS093WIQ8VHsvg6pc44Xbvv7/ylZ6bN8cGpPQP0dGUVUqkkONiRMqH9
         qg0vNkKwBUPOvpLqP0UAwdfVbL4o+dG6uGbu9A4Rzzk1zSSrFREMWPU37KYr+fbpedTp
         Oc+rhJwsQvrviyedAITwZFTehNgkGODNhcco/+i1coVNRwTHDMhbX6YNHcwq/0GRaJ5r
         d0INUgDoJaQxvBOL3T5uO851JxCeKnA42FT6ZmKii0Kw5ZTtvlZA1N1o3EQOE/BPne54
         GOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278085; x=1788882885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ucz+U5vH56qFJK/L4c9McNdRpbMBTFsKxX9xAzx9wCw=;
        b=gzBBVdYlEX8jghBLX0syxemQigg5eoPGyVEnF4i9yAAM+zakPugJy3SYX/qtKH9Fzd
         Xyx96VWiMX7YJGEY9kWJ5LodVGSmIysI1HgtBQ0TIhsXoeXJSstd5ZL4XJxUJJgBG77J
         5B4/bY/uU54bOcr9AQYqx4EQCe91cJjOCaEf26IdqBcBL1Qvnagj5rH19XYBGg0hE94T
         K0oHqhNZTQtFnNP1BisSyz36VSDj8R/WJ+QsHBBXhxu2TTVfMtE4Y1N4WNrVaU98heFC
         FruTxbwpA7deZNCzcEsNE6+M+RiSQLMx+VmkgG+3aDq/Pu1yU4WmCA2J5UigkNEMUW1e
         c7mQ==
X-Forwarded-Encrypted: i=1; AKwUvByj+qtxU/KeYMi+agkdaDR2LzTnCorCyF6q7OrjrQd7asnjlnw8Ql14oKvL0mNaz5sGCzJvCSc4qc/2NuE=@vger.kernel.org
X-Gm-Message-State: AFuF++nRKyAiW3I/P1525M3tAEgVZF8JGsWF6IRhAoFOWJ2sW9PwUl0b
	qFyNeBnwD1PQksxh+mRCWzvpb68dxj2jAthYhfgR17kGYK20SqjbSE2VJcKfwjuLp34=
X-Gm-Gg: AYBFou1FEkuIAV+Wqvjh0sYP/8oiZD7MPcTBGUnY7Ms3eTlkoVit5cIfh5MOTGtnNah
	VQ6MFHamiZp9FTK5sin+tdSslOKMlqgHPCb1MgINgJvTyTfVLvpPhhCW/uohrcRkJN1BXmrrkVy
	UCf6GcgmGUBcmbabBji9qyWxInNssWtnbk/SkzSLq/sWuZMs04GLOkfe2BmoCcEDtqrfI+bAYrp
	Tng4Kvnh6MCTHj2k6w9mt2diBtHKD3AGceXutfaD8pRbD9WyYEkIh/2ech8fHdFeKsMC/tKFxbX
	apWS5nlTZJjj3xuwKr0BBgvRZhTsicasV/ICJKxyf5hdqGwSCP1yQfBm5pjCum32EEJA/H8SMKO
	2t3idZtt6DGM0DZIVpRgEaW8YoBzX02bcgCnTs8EURUthkMYmNWK0BoDEBGiq83Yia81Dco/ZSH
	bvfJZoNzZwLYrWVA/r8zUDAmUZbE9A8djqLlG7gVdOtvJt60xa7F9XWm51SdIN+lV8rPmK9Oadb
	Vp/d6MvIiJLZwHtU+evuQXg4Zy5fynJtVT2VAM8Yw7V
X-Received: by 2002:ad4:5cc7:0:b0:90c:c1eb:ae42 with SMTP id 6a1803df08f44-90e9579ed9amr72405516d6.13.1788278085601;
        Tue, 01 Sep 2026 08:54:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4512dcasm111045856d6.34.2026.09.01.08.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:54:45 -0700 (PDT)
Date: Tue, 1 Sep 2026 11:54:43 -0400
From: Gregory Price <gourry@gourry.net>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, apopple@nvidia.com, 
	urezki@gmail.com, chenwandun@huawei.com, 
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/mempolicy: take a cpuset cookie for the interleave
 node count
Message-ID: <apb1Mq0rJfNwh7Xa@gourry-fedora-PF4VCD3F>
References: <20260828193111.1023497-1-gourry@gourry.net>
 <877bl5qknu.fsf@DESKTOP-5N7EMDA>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bl5qknu.fsf@DESKTOP-5N7EMDA>

On Tue, Sep 01, 2026 at 07:24:21PM +0800, Huang, Ying wrote:
> Gregory Price <gourry@gourry.net> writes:
> 
> LGTM, feel free to add my
> 
> Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>
> 
> in the future version.
> 

Thank you!
~Gregory
