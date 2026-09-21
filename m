Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E2E431485
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976551; cv=none; b=p1bdlwDdqRuV5GdGwZeuXbBaDZnIqtzUEB4rBv7KGvOvFPCE/UGFNsqwl5nj/JNW9L6tThux0+6/ec5XQRXbNQhRW+xjGebln9FqDykU/3ymLEC4M80dzcgVKUesdSpDMapykAi6PsEcnHCWcW6laRRk6ePSfw6pqbYQBuaxgjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976551; c=relaxed/simple;
	bh=tRSnrzsUsbZi6P6tMBjv66Vlr8Acs3z+A7buofqWpko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl5T9CpFINWvZ4e6IQv6XcK137vjXdf4zGke5RWoK741jxncaQNXtg1L0juTp5bnO3PHnBfS57/pOGf+UnuxAqcVfejBwn61q7kSDs0WiOHqvYe2YVfPvLHJHWEdY1vTbuocSCoTRNf7rfx2RVCzOZDGAdI5pwvEYQM4eCLHFDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=e7aDdO3I; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="e7aDdO3I"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso414548366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789976548; x=1790581348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M1blKKFdbFXRLED7mKRUYNvCMXmJhH+Xqmag72DJw+Y=;
        b=e7aDdO3ImN/GpGQOSP/hYyHPbcn6crVgv29f8meerStEYFjEAXrX2OyhCx4/rXcfmu
         /64tDEf3ibb40kqsqWfSKqFW6E1tyfamaxQ82GZU5vG5sxSPW1pX5eofEtqNEwbSM3WB
         r9vkkVZnEnnAsliKvE3DoOZ0V43KZkwMfQmF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976548; x=1790581348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1blKKFdbFXRLED7mKRUYNvCMXmJhH+Xqmag72DJw+Y=;
        b=CheBnpHHLYioTHLHC+HEJbLjgxmMmwRiHegkMpBUnwq2AoRsugDgQ7uOQOPkJfWWc7
         3f2ca5kpuRaq6j1xd5p9j5ORROpLdHwIgNuCXIqdKCP/7MHdahWcGDlVfNdN1GEPZPCh
         SJUpc15M+LGDvYNbF3oUIF1MS0MD9TMVXDSmBtb2QG+GIeUpupGHr4f+4ZsuOc7ZTlGB
         T95yzUc1vJ9B2xSXUw4itgGSP7+0U0JgMts6mOPnWhlbht5FOF1x0Y9COd+ldNQ3fdIF
         bT88xCAzaGjrfxeKBcfT81gvENA1aWyAhdZBVTa4FW2ZnZWYv7xEovhRwd2Ej6vbCJGh
         5SRw==
X-Gm-Message-State: AFuF++n2GyNhrOv91WLPptJCr7t0Y16GX9CiH1CtJxiPvigvGRO6vpg7
	Dp4pM7MThJ8Nf+JAEvnJiScWxwwbjbKpqWvN91UKpJe6iGYVwwLKgbapomA3RHpfbJ/QEVFiWW9
	9tJARcW8=
X-Gm-Gg: AYBFou02PUJunhW5QxlS+R2zLqQZL5vNkSEeWrQDb1bToxTESINKtBAtvk4mWLTz0u9
	WlwzQd1lVo9oF4Fs+6+fu6cC+BOjdDBnmtvlnAA/j/LBGdQey72cv01bt2zMyh3NkrDKxzBGTEi
	nA5SYtMRc9DpZlqRn+kmWTwgCGBnF6pxXnGKQclsEkVEY4VR6R3Xm7AeYr53OeBUyqeofLp0Cd1
	+01a/m4S5iXl909PFsO2HRczgSJV194l4zd8TiKihP5q+vlY3VgGKHc+UE1CHWT80Vq25yjjpiU
	XyB9cezsFtCg2yoEkhNNFa3xmB7XaRHnydysz2SqXDpM0ApFBEYAZIHOplr8kfT86qs3qFI+dd/
	rOJ2iXbZOYz92uqygW0Dv7YPDJGimgous697i+6yWHuORKYPHEvhnCWcmTw/iEN8GOOiiTDNWii
	0zgCd/g0JrmJHkVre924CeeF0cBvFDi1gIu5dLfAM7rOcyBQu5RHnsb3VeQXcAbKvd79b1HLmAd
	VCYFCkXGkkTT0YATfeS
X-Received: by 2002:a17:906:6a06:b0:c26:2c3d:67aa with SMTP id a640c23a62f3a-c2a15e7d68cmr841688166b.47.1789976548059;
        Mon, 21 Sep 2026 00:42:28 -0700 (PDT)
Received: from cabron.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a355eab75sm262405566b.14.2026.09.21.00.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:42:27 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:42:24 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260921074224.GB14552@cabron.k.g>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-3-petko.manolov@konsulko.com>
 <20260918-robust-spotted-orangutan-4b669c@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-robust-spotted-orangutan-4b669c@quoll>

On 26-09-18 13:55:58, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 07:31:55PM +0300, Petko Manolov wrote:
> > Add DT compatible string for Draeger's M48 CPU Module that is also based on
> > Altera SoCFPGA.
> 
> CPU modules almost never can be alone, thus this is incomplete. You need the
> final board compatible. SoM could be a fallback. See NXP bindings how it is
> doing for example.

Can you please point me to such example?


		Petko
