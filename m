Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9EC3783C8
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187780; cv=none; b=NyMbR9K8Y+NeRvRww+taSOjFkLNY5nrO03QE3i+4gBjPXOu0QnsHSmgaxFXUOSNzIU6SvUX3tXhwTsQK6g3RugA+be9AJsDZtFIu8Wb91pqgGkY5iZy4Vk6DeWthEQa318LFwa2LVKIltSQUqm/Ghj2D/Wef6dWabdByHy00tWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187780; c=relaxed/simple;
	bh=sp7moOFoU87sCpnpLRLXygO7kV5Zv5K8JRGo+3bzcNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fr7eMWrV62Dr49qsNWD95IpFH9couDmRYxyZDkWgTgvyXDdSwo/iZevEzbSTnMo/cyIkzs9KMEE3G7wgb1Q9YozcSDPf8mxnps0inzZj6PMvay4aw3rNvYZFnC7pYzvVkXgmBgCXSQlAsk0s+jyqZdWoLzcsZJ30OifJXmJOl9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNwRMr65; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNwRMr65"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso13717355e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791187777; x=1791792577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0RLBXv8GCFvA3UGkYd6Vj6CuQ4sgMyjZDG6+lIJvG0=;
        b=WNwRMr65sSzCDbOqcWkfdFXNmq+KAQaiurLJU8dCNJJW7ct55202RdvRyzhpPKJig0
         JP/F6nzmlZF3HH38xvyF5YiCShvaqET4UqDTT77b0Zwd8MeMtkc9xvTgE83WQCKX7VVy
         NRlDK/CJsRnBqNyAKtXDTM7ExU56FFUvOQ2lw8C8k7FyiX5etn2v/hWfHBaPnM5sOyAy
         PBp+435F2cZqkTpOh2wGz1PabasnOUbblXGrp911qgsx06QSgIWgeyQX8dFLFG/paBQN
         cNgHCZ3KdnZ3yfRvWCqTJiBisa55/LQwD/TdDdsBQXfVHM/xe8nNOa3jTBoYP3oudA1J
         h4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791187777; x=1791792577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0RLBXv8GCFvA3UGkYd6Vj6CuQ4sgMyjZDG6+lIJvG0=;
        b=Ln4Ud9EbT1p6DhxgiTpMBCRfDGFQPEpJgwDI+sVirhZOa9wMMMkJcz/0W3ow/0Wa7f
         aodNOh4FbVoeTUKGV9tFuX/wh2lJOcfxhd2ahe+u5JgeFegQaXajmxB7UrRl0GnkNNia
         6BfvlARz/aESpRdWj2mn6gjiDHVAMW2lDzRlCnjZhm52yngyT79UelgBFJ2ISgr+icrQ
         x+OdyHJ/XXq2vuSP/Ed/wHawutLB1pv7791rdKmXGW1kfE5ka6pQsFYJIpswT81+CJPn
         uxVQsvhFLqmNFOq00VcuVYAse2ZXtul+oK6QAQZbCHXE+EBjngnaB+is8sVl56qiRlvc
         33Ew==
X-Forwarded-Encrypted: i=1; AKwUvBxT/XtHF6+QmB9gjk+e02e5FLchpus0NVjcfs3NVW6g7xDwVZb5AG6m6rOv0sxEH9/fPVNoHbRqqKDAxMc=@vger.kernel.org
X-Gm-Message-State: AFuF++lqVpR3Xj3+Bezz/SZXdSxm0dQUI4gQLTjrJmNhSDYz304H1xYR
	xXc0j+SvUv5Ya0YuP+FD0cW3wuQPuDjOxJtpGC9qXn8F5hVUqd9lphvixPhdV0dbpp4=
X-Gm-Gg: AYBFou2VxBCnMBSygoZjt31Gq+J05urXG+/F7aYZGQ1o5GXOJ9lUHB0dyF36/VxshX1
	bza96pRFvPzSs+N3OUbPNEO0WJUtgf2nipMvNRmVdn898BPxu6cnbxMrMwL7Qs1PkOJw+NztJiE
	TAFJ5knsqlbbhhwSxw4vSqvWRRWUI0EuUEUzWg9ms3BvsVzEQsqP6hXkevWxiS9h5mkhNfkgcsT
	nQw7mVTpteJdrm+TGxhTAIv7vuoAzX19uAcR+7a3Dz0EGJpsxyWfqb06QepExjwuO/xutf3Xxfy
	jOMQhNjicDfRR0WLVEjbUQbXXV780TDzQITcCxFNs1MmLpz8Z9RCoSMw0K3D+vBna9DSzJQOLWd
	FuG4QPLO9cwDB8bna2gB1Ix/ETTBdz8GoN47Y8/gTgBJnyDCQRSS9ULaNoUXYqx54xaVc5tiktF
	xe7MzqP0assyLJQ+Hwh6x6SKeZYW9TvM7Gzwola6mHl5FbIjYJ4AqN/zDLFv/hUPwLRrKEmnA/w
	RNiNMZTdsR0
X-Received: by 2002:a05:600c:4594:b0:4a0:22d5:908c with SMTP id 5b1f17b1804b1-4a1680eee54mr83735285e9.12.1791187777343;
        Mon, 05 Oct 2026 01:09:37 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:ec49:36a8:7075:6d05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ab326sm1850803f8f.35.2026.10.05.01.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:09:36 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:09:34 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Alex Robinson <alex@ironrobin.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Steev Klimaszewski <threeway@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Lenovo ThinkPad X13s embedded controller support
Message-ID: <asNbPjMB_Jf9PL5C@linaro.org>
References: <20261002154231.31376-1-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002154231.31376-1-alex@ironrobin.net>

On Fri, Oct 02, 2026 at 03:42:48PM +0000, Alex Robinson wrote:
> Add Device Tree support for the ThinkPad X13s embedded controller,
> providing keyboard-backlight control and firmware-driven brightness
> notifications. Its event, backlight and power-management interfaces
> differ from the T14s EC and require a separate driver.
> 
> EC wakeup remains disabled by default because lid closure can trigger
> an unwanted wakeup and no selective event mask is known. Other EC event
> mappings remain outside the scope of this series.
> 
> This follows earlier X13s EC work by Konrad Dybcio and Steev Klimaszewski.
> Development was assisted by an LLM, including analysis of the X13s ACPI
> DSDT and review of the implementation.
> 
> [...]
> Testing:
> - Confirmed GPIO103's firmware-inherited pull-up on a ThinkPad X13s using
>   a vanilla kernel with temporary probe-time instrumentation.
> - Verified that all three v5 patches apply in order to Linux v7.3-rc4
>   without the separate PCI workaround and reproduce the current EC
>   source files byte-for-byte.
> - Earlier v2 hardware testing covered keyboard-backlight control,
>   firmware brightness changes, s2idle, lid-close/open brightness
>   restoration, and EC wake events. Those results are historical and do
>   not establish validation of the complete v5 series or its revised PM
>   handling. No v5 build or runtime validation was performed while
>   preparing this submission directory.
> 

Nitpick: I assume your LLM added this bullet point(?), but for
submitting a series upstream this is kind of like "shooting yourself in
the foot". You haven't tested this series for 3 revisions and your LLM
hasn't even build-tested it? Please make sure you test your submissions. :-)

Thanks,
Stephan
