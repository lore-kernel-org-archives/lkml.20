Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762217;
	b=c/xNwGDRA4MFOtpSpzxtVsd9fNyZhO0ByDbRPX2xSLzjYR9RMhd+O6ZPjlh3yAGZBO9M
	 6AyV/OjB/HbKuRPKvF0JGlm4JR1Up0/wmiJQRxFfJ/4pSzHvxvt7yzIAhRMV9Jy55vSuc
	 he+LYb4fwR5JOSf0zGEUBJCBPvmjNpG3WeNvt0hCyw5Wx/ssvkA9mhUcHxvFKAysBOYHA
	 YijjB5oSkkKuPxfH1yhT1uNOJqcusSf1jAsWzPR4uZXWWD5x83tU6oARxQGv7uEfwp5EL
	 W9LZs/TxO2FxbXGapkEMDUHrSaGblDAj08NFpIiB0sSGQiz9+mzQPeSbWRGpGxEDmRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=uRmgUY58lYpE+OAASwZeJvigPvl80FuNSTlXSW3pqM4=;
	b=O4pzOHlKTWiSDmGhyR/QgumzMA6zQ1YTwcQvcOXxTA8vZOgv96twVnqOLy40K4lfpTZ2
	 zMDsfZQp/uDYzjhylGdF/xxQTj5BwcHALlqKdLY51LFxdun1YcIRkJL/ynj5n3E+YHU8h
	 o/bRHJe9jxKChCvHFHflozykLcn0EmYg5TJfUY8ezvNsObMBpOBdcvssPnRS1nBtbUt38
	 GAy8WKBfM5ZOSUWOM6n7Kw6XvI/Y6WEoE4+tW5meCYG9QqXf7HF5bBmmHYIqjIyswIuXO
	 8MgB/by6lpgqPdsb1Uwr74BkkCl8U0y9FukCfK2QfAyDo7S3r05u/kC4QR6tVCsfx0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="aqg2qK/v";
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2FA606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B2FA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=aqg2qK/v
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91986c5cb75so9340666d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792762215; x=1793367015; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRmgUY58lYpE+OAASwZeJvigPvl80FuNSTlXSW3pqM4=;
        b=aqg2qK/vfJNmI9xa6jlwYB3ONAZPboJuPPhTSQ61HEGctCp+XjOEpDqOnOW9rasINi
         NuI6FVv+wBw+JrTuVBzxjvROXNJvp+OpL5GhpZANWUqQXtNVW6tbVOQCMjLCcpJhimBm
         n9Le1kwxVlz9YPAGzzDBj4bUezx9YJWP5IYxqX59JJ5DAaw88ODuqxcbxFwAGAaM3SZe
         7tsOgqHzbi7nXCjjFweU17UgXBTI3h1Tus0VcJrw1opIdXuVuoUii0gjCWRxrcGjtjky
         SSZ+r8lPw9WEmTsR/kOU5nj9EhI7XvNSDKQ5BaMrOdfoFJhvhallM5Sl0hrtTavDoEfH
         JXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762215; x=1793367015;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uRmgUY58lYpE+OAASwZeJvigPvl80FuNSTlXSW3pqM4=;
        b=j9WkC7j4cfhy+CYCPF9gfbTVY39gqEyKTQQymxTRFtzOmFQGVmdjmvvPM4ixJd2nAw
         b5kseOO8Q2okfxdffz1wBEJRsyqRfb2xqVsa2wRrnchx/P8H+H+I+8xypbZI1soo/dxR
         SRWNddoQUXu51NWcQaz0IuQbUurALMIOULY6NKjDzv8V45OwqIdX6C3LvWZtpTP6Rmqg
         mSITLkaI0HDunVVDewDm/d7w4+dSjYK76Zc4/MMRTM1IwYjqvE0A3O9C4eTnOr3w7uhA
         VHjcXgNFIyBY4gShwLz+UXhXt20ryNhUpkqDimG/ufz6pb/nQjFbNYbFA8STCOU+1002
         Tx1w==
X-Forwarded-Encrypted: i=1; AKwUvBz9mb8/2cBtP9msxwYwLaq4/BV0FJEi5kJjWMEmbWvtQS3iNqTXz5X7lMGkEVOpA9vS91LqtUs1cHdt9qo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkCxbxXSTr7a92XwD1nZ0hpH5I2EkcTdxnnj8gq+JIyO2hJ9J/
	S6UAor98UWNCktgZS7L7fQ1gj7vmSaURFXxF+aqIsJ6lepDYNdOfTJ1Tcz3EYefcWpY=
X-Gm-Gg: AYBFou0j+5n1f0IJ29J0W/O0UjfMBZVINaa3AKhFKpzJyiA+kgEI8X9VTWgSYsqdkxN
	6dDQgCTidLD+JJ6UG4FY5IAvw/RD3gRsBhMYQeFPCV0vAHIbwXM+r8y3ppb+eFEjPFvoxQ9oNEU
	NRyHoCQrK0W/ryf/GM+Od7loztAqVd5esDoQoUS1m8w0WiR8Y/Yd7r7c3GrDLzf2wzdpkYeXVux
	ec6FYX+OFwdlp3T66PhQy51e0qL0SD1kEfXydqLNl6e5yQCBOa7CQ1wt9AIs8FsJ8YJlKfvcEq2
	o7c/wft8YhVeK68m8Rm6w5MbNlmvsbmAveE0D7UQQBuenHwCdhOIJ7qOoWB3jfc9jIZPLZ6UkXd
	leOF5Cr9mP2xGaOUsUMq5N9Ab20xjZX67x7toJh8NgUw/jJ3J2TcGo/ab3doI/3B6O18ZJEhAyq
	b7WqtoMYAw88oOXj2Afy7xRDrsvhyZhajg09keGWDPtTU+ceyVBM3uRr43cuZchkRD3UR6ag/cf
	EV4FRJazLwrsid6d0AKopEbA8v6rsXVzRZaVUK//kn7tVkQDtLbZrooMQDNS6VZlRAhMENU6t7b
	lC8KMDTVJtBZL/lRFR/HuEvXUF1MvIopdcH5e0GeKERKirtJIxbP2XRCwe8=
X-Received: by 2002:a05:620a:28d6:b0:93f:1d5:9973 with SMTP id af79cd13be357-93f6f85a4admr388371885a.73.1792762215070;
        Fri, 23 Oct 2026 06:30:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b43ba1sm16517585a.39.2026.10.23.06.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:30:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKFLZ-0000000GgNS-3Otq;
	Fri, 23 Oct 2026 10:30:13 -0300
Date: Fri, 23 Oct 2026 10:30:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] MAINTAINER: Make Vasant Hegde AMD IOMMU maintainer
Message-ID: <20261023133013.GI3381610@ziepe.ca>
References: <20261015160119.1005966-1-joro@8bytes.org>
 <29b82596-b8a8-44b3-b1db-f438c5d18114@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29b82596-b8a8-44b3-b1db-f438c5d18114@amd.com>

On Fri, Oct 16, 2026 at 07:41:11PM +0530, Vasant Hegde wrote:
> 
> 
> On 10/15/2026 9:31 PM, Jörg Rödel wrote:
> > From: Joerg Roedel <joerg.roedel@amd.com>
> > 
> > Vasant reviews and tests most of the AMD IOMMU patches and is critical
> > for maintaining the driver. Make him an official maintainer.
> > 
> > Cc: Vasant Hegde <vasant.hegde@amd.com>
> > Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> > Cc: Will Deacon <will@kernel.org>
> > Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
> 
> Acked-by: Vasant Hegde <vasant.hegde@amd.com>

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
