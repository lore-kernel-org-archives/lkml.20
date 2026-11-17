Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922918;
	b=KQsPD/I7MXNdkp2brfyKm+9qC9LysNqEqYaLGNZ7KrO3+9E/GPtrsPIx6l7NvNPD1zSV
	 u9jsd5+MJTglmg2z2Z4MSmB45bYdulIP/zaCRvLvRDPHYscfPwqPjyUF1PQgrWzeDE+Ht
	 Etr6AYtipLHcAJ+snIea8w4GnWZF/WXAD3LQl8agHBt9AVmocVM5taE5gLKKJuViyjIES
	 mmuYHi9zREJcXRkm4iK6ZMO2hjwSZ3gBEwa/rJhOVNoDuI+QZ0O8RBxtcVOf3PRC1PSoE
	 djYFl9XwVFvZfZigZfgLiwpEyVNoVGT/zWYWX7wpo8jNNc3Wmj/etHT8uSCW7S4QORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922918;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=b06WvxswBrT9inOTA73+vuSETFIJ937S5Ls5TCRecAs=;
	b=0DgehOBmIGYff5mY9ZUXnaEniQdUvEC3IfLcPtdkttSc2VZJLHtv3DMPTWKPAkMpjM1C
	 cz8kGoDPDuPryqQszLqNN3vJwgtQHq/sQD72qsR516/3CZBgctPgM/uwF0Xd07kLxDbQ7
	 HQ/nbdYYK51ensfj54L/AotK7D562LIa146uyMYWFKhnGwPMHy4nynsAOjPj8W2nqBgdn
	 t7A1BTrrk4CxIvfDrkgkOBV8nGDDlVOGzfYu+5EtQhNhs4gYzMoOqdWfcp5hYQrLB+Wtp
	 cRxGhf6i0wLw4wXxUkIZ7Y2cNqYA1SJv/qht2YR9dGxFbIj6ez/mUThwzs+tXtPZgUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=C5Qz2oVa;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E703606A329;
	Tue, 17 Nov 2026 13:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E703606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=C5Qz2oVa
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8D6810F579;
	Tue, 17 Nov 2026 14:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794922911; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=b06WvxswBrT9inOTA73+vuSETFIJ937S5Ls5TCRecAs=;
	b=C5Qz2oVad0GZ4Yu12p6RqGcVZxeD9I5PIK0QPek4aQwyKLi88SS5FAsLc4x7nBZBJZpsrB
	1pWMR/cPTrnMHVc9VnsSuFi5Y0a0X3EPzx0NEOjuw8NGpU1tp+y04Ewn7SLkszXOb4fh9u
	sv/aDXDs1aYiBLteizJDCXt28Kz+XAG/PV6+MgKcABp6ehOGD62dwCPWJiFBbSgwvtflYa
	9ciGHKw9hvS2gqZr6EjXEWKxzjup6YbNuIv/VDhdppmTkyqY5TU8JXKUYr+tR7m1P+a6BI
	hC6xK5az0xsUbrhT4ZbdeIoPVHFYkwd3YsjuQZKh3yNFY3UHzAd3TEhzek9G9A==
Message-ID: <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
Date: Tue, 17 Nov 2026 14:41:48 +0100
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
Subject: Re: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented,
 unapproved eeprom0wl alias
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
> The eeprom0wl alias was never approved by Devicetree maintainers,
> because it was never documented as actual ABI.  There is no in-kernel
> user of it, although there might be U-Boot.  External DTS users cannot
> rely on undocumented ABI, thus these are pretty safe to drop.
> 
> No new custom aliases are allowed for years now.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> index bcf63e2ea989..5795b352fccf 100644
> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
> @@ -10,7 +10,6 @@ aliases {
>   		serial0 = &usart6;
>   		serial1 = &uart8;
>   		eeprom0 = &eeprom0;
> -		eeprom0wl = &eeprom0wl;
>   		rtc0 = &rv3032;
>   		rtc1 = &rtc;
>   	};

U-Boot depends on the alias, so please don't drop this one.
