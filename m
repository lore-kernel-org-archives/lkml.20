Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD483246ED
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790213211; cv=none; b=fO0je11HbcCS0ye77YAG3eaSxJP63tJ+X9pSQfuY1Esw2iTpJAH2wqArc+4soxsuIl55y9MuY546olqAx3XwBk2i9JIzMK93CkbGI5Aa1TarkrFUAb3BtyJ+h91gywyvDn+C6ZaIsA3a8RfTNcyhzJ25OnbCnCmyCrV2JR1kUXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790213211; c=relaxed/simple;
	bh=QQkaqMHt2bDKYjzTWhhvmF2NKEcpIXUnzBmhkTRoYUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELSY2gqsjrJYM05dVrVuAc8JrbDSWHIGugVSb+edfZfXVJc5Up1aq3Ae8tRwuqrMhbIUmeXVl8JDyKyXzjpZQF+ipafHjo8MfEp8yBu3bHKJEujr9+1mmZuigx7l5QAq4ME8+TyQBTNArIpF94ahM4sje5xH0Q8FjWmwTf8ARP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gs7TV7jC; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gs7TV7jC"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1103479a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790213209; x=1790818009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ce1YuMyYgEbSKo/+e5CLoiv54uIucnRXju66KzgmBcQ=;
        b=gs7TV7jCdXQgYnSsibU1F1/vHINpBCLR3+sKMajId0KNd/qbmRKa8Rk3MiuqhbEqb9
         FD4f/4NZ3qkAREqrJKGn4+Z6OUiWGDLMMHAoAsGyAIdk2ACov7V3eWVBKf0mNYgAq/+X
         fN5G0eQdADLTlhQw1yBa6EBsGYm16LFGsi6vo16Of4YguslEigxHN9Z2lqVOIY8b/MpJ
         fDkgG+5XTRfSq69QFsYRzzVNssr6ScxpISMx0jGQaR5YRhp087TvR5uwJ8KlQ6FmA3xF
         +ipMr+XI4Zy2q4kygx7Jhof1DuGRxyzkgGfpqUCFpfxY3hR7Kdcj+iU9vYzSv0tsRipo
         znHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790213209; x=1790818009;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ce1YuMyYgEbSKo/+e5CLoiv54uIucnRXju66KzgmBcQ=;
        b=e/oG2fE7CFv9iZs7a8vkacAXRuBEHzS6ztByLIHDPBn3W9fXpBgOSqp2DOOWW5Hyxm
         +v1Wp+dSZvDD3dG3Cb7L65qTvMzzqvcBNGhzwDD4p3ogRP71Ob1cJG2wGjZxK8mVvIkJ
         k3D/93RPPrNYVzCaUiitlIEXXWCN7mJlXcna+ZsQ4iVPhYW77FterPhMj0C/x67GVSdH
         cNWqDkCkGadi3qJVFoq13TpTIw5Ey0MRcqoQAuw1b3Z2wDcbTSH4RZLw2X9DOUIsZYqK
         eYlkPwKqSCx1/82ZoX4D/Y/HDvW8dC/+Arr2jSAyRca3aP/drnUebGtjsakmQ68olv/1
         7lDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/ThWs97QOEARy2cByKZU3jEXW+IeK25pfZdeJs5wWk2cJkvyVcw4vkfylhr0rqRGe4k+FqYht9/tv9aE=@vger.kernel.org
X-Gm-Message-State: AFuF++kdyKfWLs4ki5zSEaErhLQeLnHGX5ByJkkqcR4TKVlvjPCcwq1E
	l5ixkXDzdT7VCvh/+zryTwEoWwC7S/v1joX54DsoLGI81oaGBRfOn19i
X-Gm-Gg: AYBFou0qeyKrEHOQuxmhT91agoNpWl7lVVTq5FhCldx2c6BJDDLotksAX8Iu06qSIW9
	sagQ1xskM8kjOQd9aZY52ygHg5bhi4v3Lu1FKL2BmQzwejIma6DBqQ2dCUJWVvp7zyk4T4JL3/z
	0JwUZ5SxfmS1r+RQyOovdFRFMnGyowUfkqI5QFFvjQaLNmwktlrLCMPdbvBZDosBpzl5tvX8Njq
	FjAov1+hOujyLRLtFnbUhzKYiwYZm2XlUZaPLYY3tBmeyPN5ep2owgvkoS3STeETwp2Wma6qW/h
	MmheWxsmKv+yqG3B4Hc6HO2DWmXIDr12pdFFg791hIoepmUG6R/RBs9CIVstnQPwlKoZkliaQHp
	p/SA1VMzl9ilD59urojsI/OIoUuJuHENX6kE8gZCT0L0KwzQxuOxiEuJC0rb67n3uLYE0LWgmRU
	6EHi8Q1rq3X8tQBIQhV46i6BJzDRUHUtNMNLhehNo4+SYD7WQwPaZCpXIjxQt3IkbrmMVPqWD/A
	e4uGW1IYD6E+DB3Yz0QldtwNDROWQZ3pONy6j9/Ej2nj8hJJY/W630TmSuL
X-Received: by 2002:a17:90b:28c5:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-3a098729524mr645400a91.22.1790213209231;
        Wed, 23 Sep 2026 18:26:49 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f2cc3sm1698246a91.6.2026.09.23.18.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 18:26:48 -0700 (PDT)
Message-ID: <cee8c7b8-88d8-42d9-b425-31adb499ad40@gmail.com>
Date: Thu, 24 Sep 2026 09:26:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton
 MA35D1 SPI controller
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
 <20260923041926.425551-2-cwweng.linux@gmail.com>
 <arO_P5imHln19iV-@sirena.co.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <arO_P5imHln19iV-@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Mark Brown 於 2026/9/23 下午 07:59 寫道:
> On Wed, Sep 23, 2026 at 12:19:25PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a Devicetree binding for the SPI controller found in the
>> Nuvoton MA35D1 SoC.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Hi Mark,

Thanks for the review.

I will update the binding patch subject in the next revision to follow
the SPI subsystem convention, for example:

   spi: dt-bindings: nuvoton,ma35d1-spi: Add Nuvoton MA35D1 SPI controller

I won't resend the series for this change alone.

Thanks,
Chi-Wen


