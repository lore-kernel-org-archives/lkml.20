Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF042566F7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895444; cv=none; b=sFSUov2gy/ml16Wd1rfvUJoROYaHuOeog+lg923+O4eqtpFcdni5r50ZSRApkonUT0NpIOD9xtvgCDjSYcQ/8MUFZKYr7sN0VxAxQarC4UGPsBtm58ay+pY1ukF99dalha/j4cLa+FoSoA03fl3haDp3KALaxcBuN0/CRItHcFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895444; c=relaxed/simple;
	bh=Ffj0rg1ejA7e68ABDtZ/JEnCcPZ/obpgDVy5o1iSi8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiPav3uPEeHqb5nu+fPY0eZeJ/6WHdTnydg83gQvGpW+EBq7yMQTCjARYp/fqnIzQ8eNfTeXCx29wKga4Ol/oeAdsnScnfvxZL0T3L6zAlltKBZpJYmUMSBkMwg1Z5066Ua8zd8V1CO8a7trz8SI2UEkkTQXtcgC6yw0aITSjE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WuF3M2ac; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WuF3M2ac"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e63522076so218176985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791895442; x=1792500242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ffj0rg1ejA7e68ABDtZ/JEnCcPZ/obpgDVy5o1iSi8k=;
        b=WuF3M2actgR41s6uqx9M+gd7bUkn6deQjRRk1n10hEyH/VOQAmJP1azBNCVsv4SdwM
         DQvcic/XvtLGJMOQvJVgc1Ndao8JG5/yFNu+RfIgF3RHK0eyv/vJuPtF9YaI7d0VL4lS
         tnjvppT6e4X1eRhzsu1WmTEgNKj3XLi6Vr1hsFKV7pgEbh4BTbtOIjMy4eFpy1jfzZI1
         0yGDpXedesnJLdl53zz22GxaF5MBwB8kcjOdGuOpngLq/PdW2hpTdtyvSEmiijC+XToQ
         cpULqVNKzrRWw1pjkMPeJpXFM6jfi/ZJ8iyaoVSo1IIxdp3LhSH+dlBI4dzqrYjyJG4l
         LNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895442; x=1792500242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ffj0rg1ejA7e68ABDtZ/JEnCcPZ/obpgDVy5o1iSi8k=;
        b=wjpHpqbVHsTo7H29VndMY8gzIELr4ZmTg3Tqg+rpW7PHmv3aZCAVShCOKx/EvjjUqu
         MD9qJDiQXNmjYcAEqiCgcjkRJxS4anxIFiU6zkxwPATkv2bkTGYHnyzexvbhux0tXF54
         LCySkNjWAQdqY34UrlYmFpNoteTqXwQH0A50J8inODTtca9fShlDxwa/1MUO8xWG4zWw
         KRn8Hn3zz9Tbo8PD9WYOICNd7HMes+klRqGZUrXYe60/h6iCzT6oa8A1EJjSNrovJois
         WgHRbWM9L64O0ses+EaV6xNEwfTGrSYzK82dztto4U9CbmzQIhrxv7IY+D9aLMlicKc3
         OKtg==
X-Forwarded-Encrypted: i=1; AKwUvBzXFkPp5K31E0kYGUJRPiKJ1MbpLgWidrWCi16M2tzCiI/bJTGuRXQeSpr8Kj7oISueEflqjy94gNdKCGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxz1iPzod9EsLgIS7JEd0HrPHijn+P7dRxeSpDxqUnyId+D8Bs
	k1UdsdYZTrS7dQ9qGRb830Jc2ZIxE73fAEiXv+0+N3TYZclVbN9ongKc72Ez4LZDBJk=
X-Gm-Gg: AYBFou2g/Ts/iGcyNEwf5KS3BxYqSO/0KzaY6PV0qavlbablD47ulI4h3MmHXZ2d2sM
	GfGZiD3c9439IEey8wfCyY8zeGcvKBNR2gQNjBC3LbwH2RiEVnuBt+2SYanSxQGqFJ/mFkR96mO
	zDOo5Cq4X6/Nbr0m5+2LJbDxPnT+KsdFLjL9v8AxL2SFM/WlHv4y00978L0DMyGaGboBXWyOpRW
	1Sput96/jDPzgbUCPHM5Us0+itIVf8Gp4IDeEckJQ359X9Uevnf6/TubFdq0cvJr2umeMep/DXQ
	fGlC1DyeuKrYOqN3BLULslH0RUoEqxzZJIJUMoaHMkeTDhMKKi8VJT5a7yhM8EHgLlmUi1vVXKe
	LA3RgZl9wg1+m+h7oomBv10Z8UGOFK6kjNICtRyUBFD3UD3eUrInrv9nD8Ju4CFc5WRDpO8ikkg
	kCMPPcrx/9DyGL3vnar69sZNLdAKm3Hh236IbExaP7DxCK/uHTbOKD7kvA+dxJEV8busPdIhYvo
	GhyZa4TT4FTAjhof4Tv7OEH6odZJY7tgGhbD6WQYKMooMmHHrWaE0Ub
X-Received: by 2002:a05:620a:6601:b0:93e:6ff1:b67c with SMTP id af79cd13be357-93ebd1e0149mr2182476585a.20.1791895442098;
        Tue, 13 Oct 2026 05:44:02 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5009ca3sm227528285a.7.2026.10.13.05.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:44:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGbrM-00000009Wdr-3fVQ;
	Tue, 13 Oct 2026 09:44:00 -0300
Date: Tue, 13 Oct 2026 09:44:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Peng Fan <peng.fan@oss.nxp.com>,
	Will Deacon <will@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v6 5/5] iommu/arm-smmu-v3: Wire up shared-SID STE
 ordering and feature gating
Message-ID: <20261013124400.GI14213@ziepe.ca>
References: <20261011-smmu-shared-sid-v6-0-cb76b89dc612@nxp.com>
 <20261011-smmu-shared-sid-v6-5-cb76b89dc612@nxp.com>
 <aszfVNP6DGzWYdK0@shlinux89>
 <as1zR1wc7ERxvR1F@nvidia.com>
 <e8c22eb2-ed1f-47c7-b2ac-c56ead1cba8b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8c22eb2-ed1f-47c7-b2ac-c56ead1cba8b@arm.com>

On Tue, Oct 13, 2026 at 12:22:06PM +0100, Robin Murphy wrote:
> If we're not going to support PASID for shared streams (which I suggest we
> don't...) than we shouldn't strictly need to worry about CD tables anyway.
> So rather than having to special-case CD table sharing for shared streams,
> perhaps it might make sense to generalise back to a "default" per-domain CD
> for non-PASID use, which can then get switched for the private per-stream
> cd_table if and when a device does enable PASID?

If we have stared STEs then the group becomes the per-STE data
structure not the master.. We don't have any way right now to do that,
but it would make some sense for the group to store the shared CD

Jason
