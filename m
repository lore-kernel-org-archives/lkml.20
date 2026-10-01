Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC80E3D47BF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839110; cv=none; b=Nv5+cxWlgsfqfLGfV4Un+YoPLNkw5+6dukFt8Lit1FR6iuOiD5hoc8qKE6cVVze6AOtc0biUFbZp6jVeeWdmhGCvZW2oqerlao8F7t5UvEz1NerY22LoyVZVan9m2xqUpaXe9u6p4WCBh2gBXYbUI+MSX2h+QDiNB4KiEoBmg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839110; c=relaxed/simple;
	bh=AVqk6eIbFK8uDoowGzu8wB740SP5bVkVCUg8XnZAsHg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AIYSSOLUHQTu+DJk7g+5yHyN3phQz4bwQlLuN3gUMYRKgOKs8nRvBDdYRDzoXju8BLVXQqIpNWDvNHYSawsQwgVqhSH9l44I2pBZPxwbvxVHwwO6MYyrcVIYRYCac59QMJiWzp34qWch2zzPQglVnEd8tMEFOxAdBni2VB72j2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmJR3dDg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmJR3dDg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso22294115e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790839107; x=1791443907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+YWX6gQgZo8y4R4a+T3medFXiXOGcAYD9z8MlqiloU=;
        b=mmJR3dDgiVXM+hdlk7vychW5uyiGr8cv70PVc7kNi8Lfx0ZHmU5g4NIPNW0SliuWAc
         y0Rf/6JNs2gprTZE3or6R0IBnXwDhYs2hsxOA6RZJu5U6R1/U4Bj15/uYWGsn0ILCSrE
         IrZA1t1H0i9yNyRNrExFTCFk5BVMqWS9mXmqdEomfQ+2tkVITkd4zlADEGIbiSl0/bg8
         BZlzSLX7UG6IDwlNjQP+AD05ErVg3Fgb9tBN3XBcRPZuMZ+JB1sUy57IhoClwTEdCzBF
         kd5AuxUpBJmOEsCjcs7mxy9hcNVEBwldm+QdzKDtEwzrMIP9YkI7O4V0HgBu5VJPOMLB
         /FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839107; x=1791443907;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+YWX6gQgZo8y4R4a+T3medFXiXOGcAYD9z8MlqiloU=;
        b=ncPJApVN5kmZSERecHs2a/KaQjMyCBAiDY/Gaov21o82nMuINPzgO1qE9m7x/Tkt/y
         2CyHPgffLZftrQSRg8j3iygHLmE9tqWvd7qz/5N4fnlia9SRUSYkbPxOK4Rg9RdroqqQ
         iNTWUqEzUE0l+AnvVsDzhA+SJbC+nrx+7kAladTm4bpr/GyYWohduWmfhATmE48zaY6s
         Z2Ja0QkP96VX5PKMbSCBgDo5oFHYI3HJ/hHZ8vpDYQNYFGFZSAYpgJoXc5P6V/GRSL69
         HBnx/ZZkv/UW83iNbUcpkZab7yh3H96POoZlqoZ9wz8Zw8TtzxjNbg7NTq99iqroxKZF
         jVhA==
X-Forwarded-Encrypted: i=1; AKwUvBxMM6VRVs4z0hZ8ltBcT1f7H7CCQZULYUDgkzDvSE2T0T9sjc5u8/rcvLh6VuXOIgPP4f7SQ5MEb2xwphg=@vger.kernel.org
X-Gm-Message-State: AFuF++l8k1TccMEyAPYaZc6gHGcaqjy2q2+sbAfgelnPg7cABwyJCm0O
	G9NIolItNRbB/KkSX97v5ziJlPBZgWaO7fTOR1cgP11xkoIR+ASNTltd
X-Gm-Gg: AYBFou1H7sD0X3zM6Pnwkq4tqzhT424fZrUXxnT+js4rFosQ8S0Fkb+TTijnl1U/Ske
	tMBkbchWQfiT4tgfS6opxSFwKvCm8Lj/nEUaVEKMf74gzltqmpC4TH6mLx3vak1jOtwiAwCix8h
	joSXvn8hOvo53K2OAK+J7qzpetAzjwgo1i4h7q43qBJNV60/LUmNYup0uJfSmabMScZljfbAPNi
	8mX4iyydUolAXJz+rdsPIdzs0kkgP82yAs8UoesHPReq32jTlHqKim+98hR5lDhtT7K4SueXJtQ
	hRf6yuGQOKyNfAk8wtoDDvHwZPAntRGeuOnCR7XerCIGWcgANnEMHLkLDtm7Va85Fq08KH6CJoj
	Tz/tywm4S9FEu6R0iXJCRgqZAQd2GKLIoY5xRa0/ICCBao0kgEkUMn7Jp8/Ou6UWQHDYoI1Z9Q9
	6Qd16xo1dnhtLFRqKFUZ7HRzvlLx2gMYX9xUyesupvziESnhXluRGrcddAVrombe/7mwxWdcwDD
	jpCPOUoZtdKqUCu1XQrqjuJHV20m0huk3pv/q6a8sEvV/zSERni3Sx6uW7npPalLV1KrmtTQusA
	swgmOVRRc+X0ZfBHceF1bRB+N2cRFRTedKPA4JK//Ya2rFpmKdBZPamZMnDeuBqMLAf/ssMuglX
	8ZIHyX7r3z33xp9s9bWZXg42lPPPGDDHyP3DcUVEmGhsmt+YDLJsKDlzRpDpFVrBv8HjoE7vHO6
	z8d49j
X-Received: by 2002:a05:600c:c162:b0:49e:7a00:b9a5 with SMTP id 5b1f17b1804b1-4a01ad907efmr63944185e9.4.1790839106608;
        Thu, 01 Oct 2026 00:18:26 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a023ecef86sm8562995e9.3.2026.10.01.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:18:26 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:18:27 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, "Ryan Chen" <ryan_chen@aspeedtech.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] iio: adc: aspeed: Fix SCU lookup for multi-SCU
 AST2700
Message-ID: <20261001091827.00001410@gmail.com>
In-Reply-To: <20261001-ast27xx-adc-upstream-v1-0-5ace57533418@aspeedtech.com>
References: <20261001-ast27xx-adc-upstream-v1-0-5ace57533418@aspeedtech.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Oct 2026 11:28:43 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> The ADC's reference-voltage trimming data lives in a SCU register. The
> driver has always located that SCU with a global, name-based
> device-tree search, which works as long as a platform only has a
> single node named "syscon". AST2700 splits its SCU into two
> instances, syscon0 and syscon1, that share that same node name and
> differ only by label and unit address, so the lookup always resolves
> to syscon0 even when the ADC's trimming data lives in syscon1.
> 
> This series adds an explicit "syscon" phandle property so multi-SCU
> platforms can point the ADC at the right SCU, keeps the existing
> global lookup as a fallback for single-SCU platforms and already
> deployed device trees, and wires the new property up on AST2700.
> 
> Patch summary:
> 1. dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
> 2. iio: adc: aspeed: Use syscon phandle for trimming data when available
> 3. arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes
> 
> Assisted-by: Claude:claude-sonnet-5

All Assisted-by tags in your series should be changed to "Assisted-by: LLM"

> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> Billy Tsai (3):
>       dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
>       iio: adc: aspeed: Use syscon phandle for trimming data when available
>       arm64: dts: aspeed: Add syscon phandle to AST2700 ADC nodes
> 
>  .../bindings/iio/adc/aspeed,ast2600-adc.yaml       | 28 ++++++++++++++++++++++
>  arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi     |  2 ++
>  drivers/iio/adc/aspeed_adc.c                       | 20 +++++++++++-----
>  3 files changed, 44 insertions(+), 6 deletions(-)
> ---
> base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
> change-id: 20261001-ast27xx-adc-upstream-34b3d9e8e27b
> 
> Best regards,



-- 
Kind regards,
Joshua Crofts
