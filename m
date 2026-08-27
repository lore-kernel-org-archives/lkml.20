Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4620740F756;
	Thu, 27 Aug 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850059; cv=none; b=OfTJ+EpwK5KDI3xjZTB3xa49XZ3mxzTsOEBaoOCKHc26nZb59pFzj9q4g16zioqUAalYeee2HuZv0A8a1vAYBmvgBL2gAbk/4P4X6paxqy8rdzpR6UjSEfRXTcibaSv940feFS/gi0cF3iw1bAhvjui2vr99fejeYL3EsGs54/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850059; c=relaxed/simple;
	bh=aPn2iADZBp1ZnFzWq2/FeU2y85nOQ+T4Row0SiHHb94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1mcUeJtsm6oriyrR9m80bkaUWu0vTrJUb7z53QgfRezHqxD6fVp9myiVQRQ0zSF0qV9WDd3MEiDgTNUDRBf0NomMbTmAfVyS4BhJ4swG1c+3hSx7NS+6jL+FloxJDtbenQhLuxO87p0CraFDzuxXN+up6DcpJKHt/SCnLMOSBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=HfsCtKtM; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="HfsCtKtM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD7BC11D05A;
	Thu, 27 Aug 2026 19:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787850050;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rPYi6o+LeNrSB5Cku6LECS3A/JbV3lwzwlsRbFujYSo=;
	b=HfsCtKtM0Odc8d0h8jjGdiLRvEKuf8sfG7yZb9lnTrzyupAFYcU1dc1Pzb/+vIDE15WqbO
	pxiXWZ6FCZpO+JMf4T5PjsZDHKu4aqcE8e9/CBg5Jtf11RnwCZzDvYK58aKyMYqOYApRpC
	sSiAqz6PtVgCgJi+wB9iavc+FIpytkWJWw7TvjwpTuE3FHMnjp6JErsDm+WHske3gNQOw8
	SQZZza2kErv4KfUUwPc2/0JO/syBicC0KHZZQcvrj0Dx4xSmhsNZz8B4BbvS2xUX+W5ZWt
	ByOsH+H1HqKDUT3jnjAMeZKVnHXN7c8L8Quacx/XM1YFys8jCgEODKYzN2QBgw==
Message-ID: <9b197208-dbb4-44dd-b0c0-b4dcaa57c403@nabladev.com>
Date: Thu, 27 Aug 2026 17:04:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] dt-bindings: arm: stm32: Switch
 st,stm32mp23/25-syscfg into simple-mfd
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-8-marex@nabladev.com>
 <20260827-skilled-optimal-shellfish-c548e5@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260827-skilled-optimal-shellfish-c548e5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/27/26 3:07 PM, Krzysztof Kozlowski wrote:
> On Sat, Aug 22, 2026 at 09:46:40AM +0200, Marek Vasut wrote:
>> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
>> represent the USB 2.0 FEMTO-PHY. Turn the syscfg into "simple-mfd" so the
>> PHYs would get populated by the OS.
> 
> Sashiko comment is partially valid - you change the ABI in incompatible
> way, by requiring a new compatible. Commit msg should briefly explain
> the impact, e.g. that there is no impact because phy was not
> implemented by Linux and was not described in the binding.
> 
> OTOH, adding simple-mfd means children have no dependency on the parent,
> so this should be considered or even explicitly mentioned in commit msg
> (parent clock is irrelevant to child, right?)
> 
> OTOH2, you have now patchset dependency which is nowwhere explained.
> Merging constraints are the most important part of cover letter so must
> be clearly stated. IMO, should be stated also here, because many
> maintainers do not read cover letters. Or just decouple dependencies
> with using 'compatibles' pattern (see Qualcomm msm/mdss display
> bindings).
I wonder, wouldn't it be better to write a driver which binds to 
st,stm32mp25-syscfg , handles the SYSCFG clock, and does some 
of_platform_populate() to bring up the PHYs (DT subnodes) ?

I think that would resolve the ABI break problem, since we wouldn't need 
the simple-mfd compatible anymore. And it would also correctly handle 
the SYSCFG clock.

What do you think ?
