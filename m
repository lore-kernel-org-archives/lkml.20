Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABE6389E04
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602866; cv=none; b=VOCJGigniNtw/Apuuq42ImPWvMy20YAy/FFATlL6IDWJRH7D37ahM2kYRnsPtJSouvbiwLhUrgFI37cQPr0TldFsi9SnnDHu7YZTu45hImydQB+PK85v1AdOxQjL0genFZ62A1W0CDWwlwgk99Ju8/V2Q7BtERRPGHc+tIsabKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602866; c=relaxed/simple;
	bh=bY/lFkbzuL0wWuJJ/NycYQnLQsKUteIgt6DpWGrrrTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQv0J+uTmvAZbpA2tRG/dtE06zJVEWFv9F+ldfuO5n+zsgERE/yKiTYT9jFuZySv9sLHJzXMiWXuuHs6i/sGa1BVTZKhUSr9QwPev2tShAgabBpJD9imrDSdd8/GTsDy/J4Rmexn8/0V7iCRqfpvCC7VyRHoFZCIzbwTLkZuQVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bfLm9VTh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bfLm9VTh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8623790f8so11405ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791602865; x=1792207665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LXRGckOxSl9+/CEvwJi4Okj+sE0MNttNQkzUsECyRvQ=;
        b=bfLm9VThgTkyWTLMqQY1MOmcuIYZJgQYLntqQ740a2jncjfw25Ij/Go3Y9J7s+zyD6
         H2xzK2uJS4184v/clAMoA/OLYIUArzpR0Mv3LHdlLEjLaVoF1FsgNK1IzZGC/aU/e9gv
         Z23oDa5o+/bMfy6Z7Ws8X/3KA+YyeJxQp76j55CG0CoAxq3LlBI1UU3h1tjjUmRncT0H
         +DUb9+wsfXEnBxrEcTacPmJR1tP32kab0Ou/MYWsxM/DYqJZf8Mc3sSuRpgeQ9zXgIQL
         qrZfUR8lJBNUd3hwTYi0CL9BJgX6+vv+YoOhPSJQiPgKBW1YCDRuy1k+qBLtZBvnpGb8
         e82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602865; x=1792207665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LXRGckOxSl9+/CEvwJi4Okj+sE0MNttNQkzUsECyRvQ=;
        b=iLeMk58eyNsiOkLuBAqidAUYRD14lFBi3W3eOvTiMw2BvYqRVP/Uz2KGMgg4E6yPWq
         ES2fdZAHKRsSRNBoVvTcyGVJ++5C5vlvfn2hwOf8Pk5HD+oCdQUq491rG0Ay+dOg/pAp
         +o0ftSeusMm5sOlSg7Z086K5nc/rb+8SISlnfubDAWqSP8mEOAd2X4IxSctxpp/4gZnV
         b59AnVVHi4LYqjxMx28qOu291AYMR2dxR/R08QKUGoM6HyBcj6s+91m1JFpD8qNTRDgy
         0b9sSEz0MZKPdh3rk3r6hJQXO3gME4bUE23+tQQwQmFeeeGgLFNl44nCfcUZ3K2Jq0mQ
         UtCA==
X-Forwarded-Encrypted: i=1; AKwUvBw/CvPjs95MncIdRI/CbhSExWsl3x5PlErGs96cUwQ8MUZfXS4nu/JpBQkz6eEwg9R3dXhhMZq94atCbgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSKzYOtx3sM7pIVD6S7QW+BKQ93+MbokAQrat7TmNBptAZNjyP
	maDYDTrvN1SrPfZCMcyPeZtCKskTPf28oCIlR1wakR8sOizEohJE+c4kOgwrI6lngeJgM+0oAOL
	I3rBwjg==
X-Gm-Gg: AYBFou1PpJzySwQuJAkAXz8r5kwLhsZOjQbOqm+wQEIjR5VveYuN6SpI/ioCh8UhJHk
	UIxoYkcNezaThsXDLnPVBFxYFJ1LLkYdav+rAPafb6f6c7QhnuCi74zvhsRoUPV+44jUTLSqjqH
	KW3xeDlXy/20CvBLBMSvjDGEigEjCneRbYai2zVeCr65IsrL4VJ7C3bUmmzNI6BiD9ppDzpw8WF
	DNHBGmFAiMJTXNH/9Jk+fKuBH0lUlPV1Re7hpcGyG631YvfePritn74HWR4/1dz4iiQVCwn7qG3
	CQmqtLLOGR8S6Um4+VVWZv9b9sTMVf/OuEoPICA7QxyZYl7rNmAAL5CuyRLn7WXpJxjduO59ySh
	eXjpRjuSA/Sb3mmj2Q1A6c6ikfcIK0cxceK8O/nCZ44lhSSrTzx3WVKXkIjhfLmIxkgdWR8EngB
	W4YcqxWb1nZtfUzYljzZ0Br5umap3GhW/G0LoAwbAfRCrVZ+SAOwdhpQGHmOk71XqYzkjVbPODe
	tAsKnIMITB6AyOEQRT4QYbP7i1sf4AOJZyH5zbHH6DcjQL49nZ+/w+gIyAaiH3agO8=
X-Received: by 2002:a17:902:e88e:b0:2e6:3f5:8f2e with SMTP id d9443c01a7336-2e87bc1caecmr1258995ad.3.1791602864275;
        Fri, 09 Oct 2026 20:27:44 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm6549877a91.17.2026.10.09.20.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 20:27:43 -0700 (PDT)
Date: Sat, 10 Oct 2026 03:27:39 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v5 06/18] iommu: Implement device and IOMMU HW
 preservation
Message-ID: <asmupccDpWIFdQsG@google.com>
References: <20260921004834.2601285-1-skhawaja@google.com>
 <20260921004834.2601285-7-skhawaja@google.com>
 <asW6q0UPBX+Y/YL0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <asW6q0UPBX+Y/YL0@nvidia.com>

On Tue, Oct 06, 2026 at 08:21:15PM -0700, Nicolin Chen wrote:
>On Mon, Sep 21, 2026 at 12:48:22AM +0000, Samiullah Khawaja wrote:
>> @@ -827,6 +838,8 @@ struct iommu_domain_ops {
>>   * @singleton_group: Used internally for drivers that have only one group
>>   * @max_pasids: number of supported PASIDs
>>   * @ready: set once iommu_device_register() has completed successfully
>> + * @outgoing_preserved_state: preserved iommu state of outgoing kernel for
>> + * liveupdate.
>>   */
>>  struct iommu_device {
>>  	struct list_head list;
>> @@ -836,6 +849,10 @@ struct iommu_device {
>>  	struct iommu_group *singleton_group;
>>  	u32 max_pasids;
>>  	bool ready;
>> +
>> +#ifdef CONFIG_IOMMU_LIVEUPDATE
>> +	struct iommu_hw_ser *outgoing_preserved_state;
>> +#endif
>
>It'd be nicer to align the naming.
>
>There are:
>	struct iommu_hw_ser *outgoing_preserved_state;
>	..
>	struct iommu_device_ser *device_ser;
>	..
>	struct iommu_domain_ser *preserved_state
>
>Maybe use "_ser" for all?

That is a fair point. I will update this.
>
>>
>>  /**
>> @@ -890,6 +907,9 @@ struct dev_iommu {
>>  	u32				pci_32bit_workaround:1;
>>  	u32				require_direct:1;
>>  	u32				shadow_on_flush:1;
>> +#ifdef CONFIG_IOMMU_LIVEUPDATE
>> +	struct iommu_device_ser		*device_ser;
>> +#endif
>
>Missing its kdoc update.

Will update.
>
>
>> @@ -1206,6 +1226,28 @@ static inline void *dev_iommu_priv_get(struct device *dev)
>>
>>  void dev_iommu_priv_set(struct device *dev, void *priv);
>>
>> +/**
>> + * typedef iommu_dev_iter_fn - Callback for iterating IOMMU attached devices
>> + * @dev: Attached device
>> + * @iommu: IOMMU instance
>> + * @arg: Private argument passed to iterator
>> + *
>> + * Return: 0 on success, or negative error code.
>> + */
>> +typedef int (*iommu_dev_iter_fn)(struct device *dev,
>> +				 struct iommu_device *iommu, void *arg);
>> +
>> +/**
>> + * struct iommu_dev_iter - Iterator for devices attached to an IOMMU
>> + */
>> +struct iommu_dev_iter {
>> +	struct iommu_device *iommu;
>> +	iommu_dev_iter_fn fn;
>> +	void *arg;
>> +};
>> +
>> +int iommu_for_each_dev(struct iommu_dev_iter *iter);
>
>It isn't very necessarily to expose iommu_dev_iter.
>
>iommu_for_each_dev could be simpler:
>
>int iommu_for_each_dev(struct iommu_device *iommu, iommu_dev_iter_fn fn,
>		       void *arg);
>
>Also, arg seems unused?

Agreed. I will update it to this:

int iommu_for_each_dev(struct iommu_device *iommu, iommu_dev_iter_fn fn);
>
>Nicolin

Thanks,
Sami
