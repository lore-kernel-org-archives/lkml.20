Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612954;
	b=QMNSIn2AO006lUoepbETOMb//bzVY4tx/1tM+47OjF/QfBagYR3XS/gkdX3d3Qjg7WIy
	 ltbAU/V4JcoekorOFPumBZeo8legbSjukYTdUHxhCRzykqYoHnKuN/8DtrifagjIiAQ1L
	 9CbPIm3IVm/pv7n7OBrW/QdCIPYya4ZDsPJd++8WNMAtWNE+48wxnSdyz26XlevFwM5W/
	 3QzliW6uXraHO7uq4k0TZtMjGBWKPCI8EIY0nQB3q7La5o9UCXlqFSSBj2btpcPjXDfYt
	 C4DUfYv+/tQLjTvjSLGYMIpgIBEH4HqFvaPVya4JguQZEk3xE88ppB9B7MoeJoNvIQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612954;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=SwJd2Py1hwLAkVWbC1tuBf/N4RS+TrQ8utxzBCwMfb0=;
	b=FQ3bZ/mwvM9lMZ15/ZKtqGHswB2eQ6P4ZJsS5OIIMhKli+g/ewi21qP4BIAAZSGXTen7
	 Aso9Ys3w8nemacMFYxRcvIKMZj48DEfa4sg+F4NsKYq2pg+pQX9pM8xm8FmpCiRAXg6j9
	 GKH2mGBpg8WPAMmDCMyJxO6LFposl0a78gCHnhfYcVg1zkGjyllFlb5NdfegeW+RSLvrO
	 egL+KnHRizoAHR/iHWYHWf9vLr2+FVKFAaKPa+wvzP4xFaQ8xFOaZxzscYu4vap6ifRw/
	 RGnZmRdxu920wSlWFx3G5b77WHcCGWuFRu60oisRvECkFUtkzxK0hZPFyTS49GTttRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=QCOUxpI+;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587F606A32E;
	Fri, 13 Nov 2026 23:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B587F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=QCOUxpI+
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 962D510E82A;
	Sat, 14 Nov 2026 00:35:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794612947;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SwJd2Py1hwLAkVWbC1tuBf/N4RS+TrQ8utxzBCwMfb0=;
	b=QCOUxpI+NarMDypkl+ZoWqpecl86onLiTCg0GHwYAECMLhG0eAe8/nTgT9b2pdygvS59CY
	uZnlIg0WjuYyIV56Y/jkO3xZTCWTJPjSFy4nSQ2sjIv9Swly9Neh5navjUViVCOs8OuixI
	YARv2L0R/UXVNd/NiArPzexTaBlX2oQQsPGkzbPjMlKxQmpGfP5WmFPsMC6wreSfSrJdtF
	R7irg1qXBw0NPcXULvieSnWNEIuilUURPd9isf4Rero6uP5EwV9JPnVJcTIjClqYpdgR6J
	6tCDBk8b7E2nC+d8vDyDpRKQZzedKQl/zeQudM30+/Y0uL0/L7BN2vhO+/HzYw==
Message-ID: <941bcf61-82f5-49fa-ab38-2bca3deb05f4@nabladev.com>
Date: Sat, 14 Nov 2026 00:34:47 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: Move Bluetooth to USART2 on STM32MP23xx
 DHCOS SoM
To: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20261026125201.76716-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261026125201.76716-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/26/26 1:51 PM, Marek Vasut wrote:
> The Bluetooth chip is connected to USART2 on STM32MP23xx DHCOS SoM,
> adjust the DT to match the schematic.
> 
> Fixes: 6642d6a47901 ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Is there anything to do regarding this fix ? It would be good to include 
this in 7.4 before it is out.
