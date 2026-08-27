Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655C9442380;
	Thu, 27 Aug 2026 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850054; cv=none; b=YNcUsZoHloTq2OkwGpWsAXdpa7FMneoVUBoPPmot9V+O5Pf4AepOi8cZnbod74SVaUmo38h0n3SipecrRTclvSYxMpYQ6J0lrjtG3hD2O2c1VtVGzTIYAgAIb3IluezxvlOH9SPalSGzrsFBjDhrqbOvAwD6Jhr+0iierdgtPY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850054; c=relaxed/simple;
	bh=8CPFdDy6NOfigbNONpR1ggpFFYNQfVkCaVZha2P6VmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wv3dQR9VVQqKSQf2QQVDxWCMZxPx8XbDZYO45mf4CYzmznLXFM79JI3i3vJACUCciwxCs73SZKuMFx5eu0bokiZ4dnzlKQXFYw3j9I8BmF3jAPTUUC8aQYROtf1ijbf3CNestc2L3PEiKOtNLryVSN/0LsMN6kuH3vy/MtusUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=GPQLHb1i; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="GPQLHb1i"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FE9511D051;
	Thu, 27 Aug 2026 19:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787850039;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OD3WDKVPKy4gFKDQyvFk0U8Q8vSh1Hf0rGi/7d2Ce6I=;
	b=GPQLHb1iRWr07a51QmhBSJYtn/FKuxaKOgOQIUO2Un5lYyCRvSZJ9MKrvoSUN9nETTGrQh
	QoE4gpk2xigPEGZFO3Id4JPgU1IOHNIKsbj1dj4njz+hIK5jZsx6IToaA7jmRocIsq/oWK
	RgVh4dLbArZL7B6KD7zRjrRTj3TW4TGdQzGmvU3ylGVzXxAm5IHU3x2eyDa8r0VUt+wCda
	A39LgKSS566fU7hIydInXNYlArHQnJaZyj+QKaYrUlFUhhA7YimXEuRRdkYKC1XQNLkShh
	fQO4l3ipFHSygK9CxVQV/xOzbbXQNVfieZ+IXrvQ4zdA1v0KfbNpuV8XuSn0mw==
Message-ID: <34c48ff1-524f-4d24-b53f-99e7171d08db@nabladev.com>
Date: Thu, 27 Aug 2026 16:53:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-2-marex@nabladev.com>
 <7a16614a-bd1b-462a-be13-4a9c22aa588e@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <7a16614a-bd1b-462a-be13-4a9c22aa588e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/27/26 2:54 PM, Krzysztof Kozlowski wrote:
> On 22/08/2026 09:46, Marek Vasut wrote:
>> +description:
>> +  USB2 PHY block in STM32 is attached to USB 2.0 Host controller and
>> +  USB 2.0 side of DWC3 DRD controller, and provides the USB LS/FS/HS
>> +  connectivity. Both PHYs are the FEMTO-PHY, but their configuration
>> +  bits in the system control register are different for each variant.
>> +
>> +maintainers:
>> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> +  - Marek Vasut <marex@nabladev.com>
>> +  - Pankaj Dev <pankaj.dev@st.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - st,stm32mp25-usb2phy1
>> +      - st,stm32mp25-usb2phy2
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
> 
> As pointed out by different patchset built on top of it, this is wrong.

What is wrong in this (V3) of the patchset ? I think the ST patches were 
fixing up V2 and what they were fixing up is already fixed here in V3.

> I do not understand why Fabrice Gasnier cannot reply HERE that this is
> wrong and instead another patch is sent for in-flight code. That's not
> your Marek problem, but lack of responsible review from ST...
ACK
