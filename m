Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572603;
	b=QH3BOrXh9ps4981KFR7ylY9lKwb2aMHk1AqQ7iMkJkA/s3exHxZvBhIphlEKRJ0yqR61
	 QwG9IqrPbTe7kIYT8NbQbgeQBdgekZnP0untLU2kX03+UsBOTwTQORHva5zO9W+zEfCMB
	 NZtLqlVRUJu7H4caR+tJq5AuywARaYplFJRXNKti21ljM1XXOO1dR2f8iS+nuydTd3cC0
	 K9q7cW5r/vokyEj4lTEz/Zab9jgI+hkPwcSSg/HgpT/n7/nl5aUZ7x4G1Ozb4wjiP8d4j
	 DnyzMcLcseuhcsDYXtjobddBR+SXtxSJ9iryjMc4WVfw1nOG/iTZV1PO38QZEV6rjkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YQFv5zXzbhGw71SHjli52R6hPoUhVCQQU1F1+WoMpWs=;
	b=ch2QtRWBjfn6+f4oCinN2KlisusaFckYpdyNHR9fUzFVNKC7eLFJPlFPW2XDDhDOlF1B
	 y/TFDWcgtnqfEoJlwi2wYjodWNC581kI6LQbftANuNDq4Tgh/fo64g/pdkf0pPE8P2waJ
	 +B8PZE2Tko1lWWlA22Pa2+4AwQG3J+mjzFyB4oNoB1ZxnLZpJV4YllqpsmtFvY8sTRNYt
	 0mmcyJTGbmG5OVfE2/zoaIBe9CW5K6hCXACgyXpsXFtDkmNd1lUnypkmkJ+uvmWh+vG4E
	 qVvAAwhTtup9+56H+4xkyunYNrAjTQLBCHMHJEbn6n7JT3NQxYy31IUYLuf1vIMG4bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pXdyC55s;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E04606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92E04606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pXdyC55s
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso367624f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792572601; x=1793177401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQFv5zXzbhGw71SHjli52R6hPoUhVCQQU1F1+WoMpWs=;
        b=pXdyC55s54e1Hv6vU9hVz3eoRTKMYXUDEFys21tpyB9ifVl75wWvOYT4F2dyQMqX/Y
         PUQm08WVAcVIFGuZfSdievc2L8yh0n+XJmB3vuW/WJguh/RrkhVU0J8kvl+sL61YTJ3f
         FKQL/DLChMmlFTkicXB5UvpsrygqzizEpq2tqROG8CZX4iWiFwFp8NvN67AuuO3Gmlau
         lHt/VubbcIKIRwlVMWnOlXU7jJ+FtmV8/7PIh2yp5kan5ZRv21djx6EAZiqcjKmGxrDP
         LuD7nCkjX6xcZTe2iwpqixLQwqfR3RJIfOSggsuX8EfprDIn+Fr1e4Ze/6ijfIH8+Ogv
         E23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572601; x=1793177401;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQFv5zXzbhGw71SHjli52R6hPoUhVCQQU1F1+WoMpWs=;
        b=zLhG33ZOJp4mBDG5S6tFLzz3GOrKWxv7sG4jw3UXbPVS7GpIztJbuMldHS3iVYVpI3
         n9+kaoFAy3n/M88UPtC/Gen3QPmC8EBG6T9jEnRw7Bvnu+aeTzKCJZA56KghiKhyDD8I
         TahejmI4XctzRe6WJdCdsJFMZEMuTdGK7ojhjotf6a8v5WSlS3J2ejaiqY4nlZus2eBd
         pkyt9VqLTLHbcqp8SEAmzVIpm2C4cPWQqZqeaaaIS4riMdT+dpiFIt3O9jP4dS2Qzzko
         FUJJJtHJng31smQZ46lIBAPfA6FPdZYP2Rc//osZDreMNoyRiz59elHw2DMlz4qBH4In
         0KOw==
X-Forwarded-Encrypted: i=1; AKwUvByK4BNC2RRQUcioYsULr/K04VBxCDxAa0+51qo8/8w6ldpDu1rO2gzZIymRrJO1SgGxEH789T+EqIS+FGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+FdlXH6ge67959YcQZxieAvqqWz1tEhr6RFSSK/7sYkcBRtGD
	weDwZKCcGoHolm2rw3aulgCrc+ubVpaxlsELrETNBP9NNIG8SRrW2kX29x1ysoPibd+RRBzbvlX
	xVqAUjU0=
X-Gm-Gg: AYBFou2mxK0FHrgAF6pTf7haF3Py1K7rQx9/rSV6m42PXEFxGzICLoLhYLyMwM8mjK4
	40kmOv2CY5N1abwFBRxLaQypXTV4++GX5w8PcuUjkmDHaaoawbzI1WHE2AooolkcnT/B5bSeE33
	gUbTDoBt/B7GHSeRJKoQuDX/TEnVU5BxFDEPqfidl93wNgDlT5Hhi9WE54X6QodVIoq2JJrnxcI
	LmwfV0juixMtMA+uCcjD4EbQrriIlOf0bqAq2fnHZd72fzO5wx2J0u7NW2rWyxvy3X4luttJFk+
	vX2JhyRPXXo0hq57L7iBRvUnB7r7wc+ZeF+TvEZJy1XwnQwDP17kuoWq2IOcP+rE+nzi1QRMGs2
	ZEzigIFiHBNDVhP5pJC1a72AIZ7gvPOhRo2PXT0bpQOWHVNQZTz/hrEZZyVkG4ruTCPaiR+bGXa
	5EULLT/iqrDrfF/wJpYwyYhnUSGwHWh6x6ssU0Aqi9qPR7QqDyOKDmSCwc7Asfco7UUxbuhz2aS
	DbWdubZ09DTWb+e6RSEqdbdtcdO8IQyQ+wpmJVMLCYHJ37YnDFm3zmM4LX3jgS+bnQ=
X-Received: by 2002:adf:e28e:0:b0:48d:ec3c:3247 with SMTP id ffacd0b85a97d-48e264dacd3mr1959740f8f.44.1792572600908;
        Wed, 21 Oct 2026 01:50:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f10:39f4:5e2e:3b34:d185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581efd9sm4013258f8f.18.2026.10.21.01.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:50:00 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:49:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Message-ID: <ath8tHxHOdA7G-Bx@linaro.org>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
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
In-Reply-To: <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>

On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
> 
> Thanks Stephan for the additional information, that's very helpful.
> 
> We currently have an urgent thermal issue on this platform, and getting this
> thermal mitigation upstream is important to prevent overheating under
> sustained workloads.
> 
> Would it be acceptable to address the sensor naming and description
> improvements in a follow-up patch, so that we can get the thermal protection
> in place first?
> 
> Of course, if any of these changes are critical for the correctness of the
> thermal mitigation, we should address them now.
> 

I have no intention to delay this patch. In fact, since I'm using the
latest unmodified stable kernel on my T14s, I'm also suffering from
these thermal issues. :-)

On the other hand, we are at the beginning of the merge window and Bjorn
is unlikely to queue patches until that ends. The changes that
I suggested are purely cosmetic (the names of the thermal zones), there
is no need to repeat the thermal validation. The throttling behavior
will be identical no matter which name is used for the thermal zones.

IMO we should use the remaining time until the merge window ends to
correct the naming to avoid any confusion for people reading the patch
once it lands.

Thanks,
Stephan
