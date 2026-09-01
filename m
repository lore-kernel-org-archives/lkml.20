Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590A83B4E8F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273290; cv=none; b=JpU/PTJKqKOSSJcBNOE8wdbF2c7/Ly2lsBaq9VJbWzZocEKe+sd4h0oD4eJJrRRsQzbG0sHSkwJE2mHFoj166Z80CkdiaiRmZOCWPAAgROadaNh4FlUSt3dJUFXwDDnvH+SHh1jqUcCEIqmhXnumNsuLtqTIrW9mSr67mpxZLxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273290; c=relaxed/simple;
	bh=8yIR2l5kWTbTZXEBPaalfxQDjpL45I/SVC9tN3kaCb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJNEXAxsKAcH5d2skMbALs7XUuTltBVV0noajZxvAhEhJYNF/v/Ek7z9XueaY7REzWPKH8cmBPO/BMEZaYuty6Qyk8N9z2UzC+MwA1NxnfmA1Ns0A3s+JPFjdXecfJOHwYNeLH7rzRjL5cG22jqm+bVQoGdnYXSx20EXSRy2c6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DlMa9Dh9; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DlMa9Dh9"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5301db51586so12022991cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788273287; x=1788878087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Msi/TOmLhS+cZQhvH9ha0bUxCIzijPq3v5j1Cfzxv4=;
        b=DlMa9Dh9ODREYDiarkdo5RRQo7Wl0pj4nagtqgPvIlXJjoOiSYZ3vr08YWndvNGrHD
         tHzPTfCAbfrjZ5c1w8cariElMwFdz7MNhDNmChrovX4mqjt2jgWKYnrQbxqPIr+cfmUb
         uawODkPTFIVOGsVkQ25AquJleAfELuhnxvKBa8UlRo+mOELUHasMPIY9Ycsv0u5Sp4Wf
         S09afldoYvuVdhGJaLgoiIMfi3Xrap5TwPfpko2l85KBYBkfrCGJ7hmQTVHrssuO8Qxz
         BlMFAHXIg6OZkcTxelAfcrk3nkyfZcY4czgKhpzynv81mRZOMCuN3lieAMdWjE5T2T7z
         hKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273287; x=1788878087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Msi/TOmLhS+cZQhvH9ha0bUxCIzijPq3v5j1Cfzxv4=;
        b=ClYsQ63cjAfPujt4Mo2VElDkcBnBtTpvv3nEpulB5CnqWgb7PldXZBu/GadshIJEn6
         GvJeOlefTVdNesAlHsFb40flfqBNa6qhiJSm8mBgkZZcasYvZX6064bX8Z1qJgSRTM8R
         IkBNTcF78inB3y6T2IcrR4I8dvE+yzNCyXq7uPjXcEYzotDo0tzaEmRTHfToKnA/9u6a
         ZUcuytX0Wq06NfKeDLPXiP10isdR9Qwqfhciop+G/5nrVYOtkwhp7T69fJjJmLPrXNLO
         qCeAZQfafNKZe+sU/CuEpKsgwpA9WEJdtdX+0IQuQ2jQJivMPN+mo09ruqvpw7Mqeaz3
         X0oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8QGsB0lovsOexEtlsAS8Biy9H4K96mkfJpJPhIfVUofb4+zHfQmDEtXiL3OrL6e7Fffd3rJfD4lTZrDM=@vger.kernel.org
X-Gm-Message-State: AFuF++lGW3KJ3S/JE6oqmvp6TVYg5hdmhdbT6h1WQSPDryBgW49+G+8v
	p8mBUW5x+7gtkLs/mtac93RHZmjvMIG/9lQvPkiw4E88EAYUuq8VwvF9L2zWcdx4rro=
X-Gm-Gg: AR+sD12S+rbBvZmy/2HIBIQPbUqF6RqPqK9SmYjJmaX4+jxuheXWToj9WEcqxe1spok
	tg+XpV7o155Gaw/bbC06lnS+81U/KPXaby9YOowEfInkvxPRqcW0Oxk9R+9fp31He9ln0vcA1Iu
	gvhGKoBFI6CDl+DFuk4wp5bWwsKQvRIsHO2QdjwzZhIf8lAfUgCLw1cc2wem8at3oVT6KjZ0olw
	69OzsfsQZnNxXRE0ZXE6TcVV4g9U2MCXB1tTqYOdjzT4g64rDJ4tuqTkKuLrZATqtoWRbe7a4U+
	9Sr0byCbW3Q2WlBLZTMc5yUOTFpuuueHtvRFxIcypnDq/H3HkYXTOeieUCyE8BFG6luPM2KVkmw
	GdteHrc01Rc8cFcJQZu+TEP4Pe1YRfmcqL1mBHGM6JodMnYRPsVjVsuLtCkzKnYk1to2DRurzmb
	2oKCAURAbEFz9cHIcBpnGcoEtGWRQOCB0toi00zRnIIR26kbCanra1X37FyL63aOHFrsOHoqNDY
	1w0DZBH4HMY8fwm8pvhnF30GUoTSUdX2wW+MAP0rvdVvns=
X-Received: by 2002:a05:622a:5913:b0:52f:f472:bad1 with SMTP id d75a77b69052e-52ff472c08bmr383344431cf.33.1788273287009;
        Tue, 01 Sep 2026 07:34:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe830222sm98165671cf.20.2026.09.01.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:34:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1PZV-0000000Bhy0-23ZI;
	Tue, 01 Sep 2026 11:34:45 -0300
Date: Tue, 1 Sep 2026 11:34:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260901143445.GC56830@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aecfdnv4i.fsf@kernel.org>

On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:

> @@ -463,14 +460,13 @@
>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
>  
>  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
> +		if (arm_smmu_is_realm_viommu(viommu))
> +			return arm_realm_smmu_v3_init(viommu, user_data);
> +

I think the realm vsmmu is going to require a different info struct
than the normal psmmu case, isn't it?

If so it needs its own enum value.

It would be nice to see a draft patch showing how the real vsmmu works
on top of the RMM spec for it. If we are using a viommu object then
non-vsmmu case should be identical just with an option in the info
struct to not create the vsmmu object.

Jason
