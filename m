Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494830;
	b=uyifYxua2DdPb+eS9l8NrFdHEbdQ2ALEj/cW6lgPbG51qq4++8i4rUEtTQbp0uDAL80S
	 DyelXnYcThL0T9zKv2fcXz5NW36zoeqwqE6tNhqUO2DRZKqG6X4W6HsfIZwPnHpODkluw
	 Az2v5Jc/9bnwnDWXmR+umnPAS+o5OIlc6lyosDWWpF3craqe5COi82Yr4i7oeONN6ZXuU
	 Y1gnFq/C6Nlo0UQqSr1JXAt2iPnZDdcOFY0W/7saoeHE5MQtX6HlL9ZTeMp//aISaaejv
	 Ugv1Usn9fGjUFvlA5Bf8H62mkh+3nVUJEA6GvSzHEQpDGWM4JWltEpiSuDez0oH7KlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ssC6O5op5kxsykPYGF90zu0HggsOhAnuDsh96PbOQGs=;
	b=ic6XECXcpXbmaNpcqfKrbj+VHyPw28jdGMw506aTe6FYOKPCRoBVV1CCMzNuHSxOl7iw
	 +WcwiUkAPe6WKAfiVnDBd6A+kw1uG7Hm5g+ho/1znC2g4eutc2O6ZiUj4eLHrgHxwqoZw
	 ZFx1Ysb/QsuIK+VEkEQ4oayJbV1G56SuUiiWKliGs/1X3xW/7gGKlcXR9t27kGCChN02S
	 DxIad/+TzPNeAYe4BrX4poI/F4IYTMjqyM6JJgAdJZlJ9vFfpJq8/QIUhUUaW3sxgCHu9
	 b8zD2D4OTEqVrO/b3mwUMgt+i7tIb2oTMEtLc10XNZloXy6P4UjiksTrmTZvXP2KsJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="dVw/obaJ";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B35606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B35606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=dVw/obaJ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a021c28046so31575e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792494828; x=1793099628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssC6O5op5kxsykPYGF90zu0HggsOhAnuDsh96PbOQGs=;
        b=dVw/obaJLbmRSMe8phL42oKvbHj/Vj37F0RyO/lbanCD8NFFG3feJnLqrQtDt/XPXI
         wIN/SdHF0FVrPtNmpl6SJCeAg21CJQL7jr4bA9DT0V6bqXo0l3r6giG5UK82aFN3ThJh
         WX8f/xwi76O+3mOd4Ce9bTuZyDZz2wayoov4rWzS0HrYnYuRyq0+mpoiDEgYKNrwrZAt
         qjPuDMpUVjkyw0JCQGDq65eGs5uo3LomyH1zIS09zmN+LNgScKqlfb9dFwyVBQAAER2G
         HBv5F81brK53oyG0vQKNAjRwS8XO+uPREDip1rNmidXCFnNsrjLQPHx9CRvf0BHrJb7T
         RWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494828; x=1793099628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssC6O5op5kxsykPYGF90zu0HggsOhAnuDsh96PbOQGs=;
        b=cjGqm4wFZzBhDC/hoUVLQfQ4eHzWHW7538+C2JoOIx19icNw7SfSVlJW+E3ViJUUcV
         2AbE2qyGbIlO+Cg/WxQjTdT4BiCo/Rc0iDzQ1GRoDEAoO/8izj4l2uJpJ/SOdPeJBJKa
         X+wGcvHYhArT8kEoYC9aG0GOC1WMYdefrntAUzcXDAZ9db0OS6FXALs6/arAiJ4VreME
         /sN+Hwv8IG67FO8k8+wpZDtNhHlAla8/CB7VVNEkmrkTE33wv51Z3Nw/TlZcH/HS5KWy
         7HbjRo+phmgNoxPExwp4hdokn0N/QW8L+qPJwDrmjqo+jW2rXlUuPvX79M+/nZlpoKo/
         NWdw==
X-Forwarded-Encrypted: i=1; AKwUvBxKbQwWVN/d53LgYTR2n5p9HVxfzXep6kmRix2KOwgj5DPhj/GNDYCNi9yRXCNSnPM2IQQBY6jNQOcOhLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTM1kTXGinI/sk1cVO/6vFlZTZaqvP4jWaoU3vP7dMAPh5eALS
	Wdl0m9H7iC3bpo7xDBYzKVuwfne/Gum/ukycZYHgzOcuDMviONRm1euwG6e8WrbCIYph1lGA1Pe
	Y2P83Tg==
X-Gm-Gg: AYBFou2Ga8xPFWVYLjIfxM4PmAFCQrTYAoldaX5ma66Jh67NVtaLnfviSeUpMcrJ/qp
	KVBbI75RjfhHzI/vNFuPcz4zA21S+Sb3ad6L+OTTX2OHzOa5ytoqS/Wtn4JK5+D3BrKLAE0LKDZ
	yfLcYvc0WQdadztDpzgNDZBziH23oMIdLShNd5mXHPda0sLTRWdSF46DW4J2Wb3lpdrEVF2eRCX
	+4Kn2ab+v08N14CRY6I3PvLAZRhNl1HVtGtsrmcRq7ufiNtobfm5hPRMchDMWX4/O9uvdjPeS6B
	KToffBElP48XNN9CA63r1dlrDvBTO0Yo5U2vtkPUMeNy6YEp8u3m5Nh45dCyJ99hdCS34JaYA69
	Dgl+MBXgGNW2H7Eg8FnuZE+dEDXO9YmFBUa41+Zrmx07PGc7NVvEnB1hvdgOdv8cm5GNFB8JWbq
	9Yx5tmXs7tbs1lCUAYAcgn4/NS/Jlz8SoEWkh8tSrYM3qZbtpsT+BXskSQ2PLeTHPoIiM6GJUU0
	ZgK8bjA1Dpeff4stoTaQX6G18BgLWPglxywCxkl
X-Received: by 2002:a05:600d:4447:10b0:4a1:7af1:5386 with SMTP id 5b1f17b1804b1-4a1f37a469emr748285e9.1.1792494827956;
        Tue, 20 Oct 2026 04:13:47 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d41c8asm64987465e9.8.2026.10.20.04.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:13:46 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:13:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	praan@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 01/11] iommu/arm-smmu-v3: Init the vmid_map ida
 before the stream table setup
Message-ID: <atdM52CxWJTZxOIz@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <058aeb235a458c5b48d918d947608c76dde0d845.1791226953.git.nicolinc@nvidia.com>
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
In-Reply-To: <058aeb235a458c5b48d918d947608c76dde0d845.1791226953.git.nicolinc@nvidia.com>

On Mon, Oct 05, 2026 at 12:30:44PM -0700, Nicolin Chen wrote:
> The vmid_map ida is initialized after the stream table setup, along with
> the devres action that destroys it.
> 
> An upcoming change will reserve the crashed kernel's in-use VMIDs in this
> ida, from a kdump kernel's stream table adoption that runs in place of the
> regular setup and returns early.
> 
> Move the ida_init() and its devres registration to the entry of the whole
> function, so that the ida is ready by the time the adoption path runs.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 34e916ea339ff..792627e1c790e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4842,17 +4842,17 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  
> +	ida_init(&smmu->vmid_map);
> +	ret = devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_vmid_map,
> +				       &smmu->vmid_map);
> +	if (ret)
> +		return ret;
> +
>  	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
>  		ret = arm_smmu_init_strtab_2lvl(smmu);
>  	else
>  		ret = arm_smmu_init_strtab_linear(smmu);
> -	if (ret)
> -		return ret;
> -
> -	ida_init(&smmu->vmid_map);
> -
> -	return devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_vmid_map,
> -					&smmu->vmid_map);
> +	return ret;
>  }
>  
>  static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
> -- 
> 2.43.0
> 
