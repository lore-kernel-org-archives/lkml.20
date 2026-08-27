Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE6B3859D4;
	Thu, 27 Aug 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850059; cv=none; b=dn7zKPglcg4aWtS7VcwEVAe1ekDRRaKsVaxwPpBO68dRRTqMbfvx1MDfT0ueYK0t7OTLZIKOeocA8igPi/y80w4/stpg7sv8m9o9KxgI8BRwSQQ1Pr/5/pPq7T3/a/F9UmIxKxbr/48gtE/o/T7YFzYLuXJPrYknfoFylEhV7Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850059; c=relaxed/simple;
	bh=bu49LPW/pYnnn4RTIvbpH5EGLjrap9XJtUuE9kLXUjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+SkI0bdNN6dapEtU/D/4vpO6xXf99Ys4KRksd6ipSSXXLLlF0uWT8/QUjrD4RsFsXRiO+/9mx3PMr6riKNSejeNgbecAQ3DkdRKTNch3tTiqeWzcpwPgCiMEokyNKMRCmLF6xT0QL/pn+Pmi9LngyUkQ0g8s9UGMHbKSysjTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ZNZ0NoRD; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ZNZ0NoRD"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2403511D047;
	Thu, 27 Aug 2026 19:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787850045;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YdpMoBjRF6weCelhUSwlEX7zawYj+14G2BcZrtn36gQ=;
	b=ZNZ0NoRDZPqbddDE4Fs1g1QVk8MReIB1oF3ZAdqRlUyEuhztpYGBtzllCOK6jBeMOQcmo5
	Ssq96Z5WHI0ps0JKcmesn1Hgr+nh9xHB7gjQG8vCL7R3DJbmMu4Pz2mGG9vO1jbMeDoRe0
	0WYBLLobUVYT0UQFgKF/QhuWlD538/1AMzXCs3joOW3BzTtNC/vslc0Q5x1pBQxHB9+fVJ
	f8oFrMl3blKW05q7jUwHF7LjlJXG0dQxurEjjJiJrYGfcAfCr4Fb1V/7UXEqmY9wftIy80
	YyMRSMVNfXJ7fYvTWqhBHzBqQar3hVMPZNaPjlVQvmabZKbNYrQXsX4gFf1Amg==
Message-ID: <6caa0c4a-3e94-4bac-8661-5f2501b5d9dd@nabladev.com>
Date: Thu, 27 Aug 2026 16:56:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3
 xHCI USB controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Pankaj Dev <pankaj.dev@st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-6-marex@nabladev.com>
 <20260827-strategic-hallowed-lynx-ca3bcc@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260827-strategic-hallowed-lynx-ca3bcc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/27/26 2:59 PM, Krzysztof Kozlowski wrote:

[...]

>> +++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
>> @@ -0,0 +1,97 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/st,stm32mp25-dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics STM32 MPU DWC3 USB SoC controller
>> +
>> +description:
>> +  The STM32 MPU DWC3 USB SoC controller block supports both
>> +  Host(SS/HS/FS/LS) and Device(SS/HS/FS) mode operation
>> +
>> +maintainers:
>> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> +  - Marek Vasut <marex@nabladev.com>
>> +
>> +allOf:
>> +  - $ref: snps,dwc3-common.yaml#
> 
> Honestly, I am lost. It seems this resolves my comment at v2, but now I
> went through patchset from Fabrice Gasnier which was ON TOP of this
> patch adding this line.

I think the stuff Fabrice sent was on top of V2.

> It is not your fault, although if there are pending comments expressed
> not via review but via patchses on top of things being reviewed, then
> can you check for them?
I did, while briefly reviewing that series.
