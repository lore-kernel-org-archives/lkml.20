Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570444;
	b=mqYOfQLTkNMSxLsoW3tTIvTflgt3t3TZigUcY5MvZ8AcGMLVYdQam6Zpa/kGAu2+Y+zh
	 yPaXjOLy2y7JoprXeFydPo0HwqJ/9NuFUCG9OYo1RioD0WLURZ+QwY/jlHjjUfJNuQgSP
	 PIUbt1Y6vP4yi6RIVPwc32N1GqVpW9G2QEQyAtC/mT+4qtyqUlvhf9Ga1L9rK6Pw+d39S
	 PvTrv1WA/Z0GWT3bTJayRwdxyNidEm4HPGnEchnEatmOwx5djzd9KsMz2biP3SFDW3Gpk
	 ACF8MuAX2wNPLwqmBb5Y2oOWsXGYx5Ep2AyAn+y1H6Zlgextc9b0tcIFbKnXX89D7JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570444;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=IwXnsnx5PhXx9rXHm+3BBYDk0Kl5xObHJbEA0WcwuDs=;
	b=ZaCmUSQe4ohwdRozinglDXo2zVGudHO8nr3GvseVu9iZJmiqVJNQAsSQJnkjIgbt5K8V
	 OLL0QkRXNrYJXbFid53I65ZMVAEjYfQhdTGahikvewfAbK/cuwI4IFmcqFClY0DjtHtcC
	 MRpOMmYvgHjVOIyXJC8Rd9hDwct3eai0pcXTlrazWg8eqO8kHzQNl/xpvsD7Ty5YgNzMQ
	 3ekNRXchLi7MPDvHP7erdyAmtrAZ+pX83e2X/Tz4vUy+2k3sqKcLGpkhBP/BBNAodCosa
	 HLDsf0yrziYWspoOoYtTcuChvTlU8R3XqQRziilFpDYgFGgcQX6YdpB5EuZ7bkkJTLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NxOnVc28;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB04606A323;
	Fri, 13 Nov 2026 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NxOnVc28
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F390A1F000C8;
	Fri, 13 Nov 2026 11:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794570443;
	bh=IwXnsnx5PhXx9rXHm+3BBYDk0Kl5xObHJbEA0WcwuDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NxOnVc28KeRCvaYw+Mro+QTjZYP8pn4rx+89FANYLE871474JUe+NOSlhmoSumNa3
	 2dYYfYIdJ8JJ5Ueul45IpY7fU0vpNL6jzydxVaaZd7flUZ6uvSTQLq0O9fYOD6rJhC
	 3lEkVEURsHXVkoPMZqdsk/Kb8Qc5vc+HfopCfqGOb3JPpfT4fIDqDAHuH5008iu/Jr
	 hEoBQt5+4mq5VBxRUSBN4e3nzFLdxw5dJcCF+e2dCEqqdAYxlr6AvDIeNTBoKLufFV
	 qGSF0WirixXHNSciQxqeaasgFPjGn0DZjq6W3bY+tB7y/IlXTboWEUiJhgAhG7Kk1f
	 TM0CF9GaQA47w==
Message-ID: <4dc982c8-af04-4af8-8a56-66459f91cf3a@kernel.org>
Date: Fri, 13 Nov 2026 12:47:16 +0100
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
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add the cfg_ahb clock for Nord
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
 <20261112-qcom-nord-ahb2phy-clk-v2-1-30ad3d947217@oss.qualcomm.com>
 <20261113-influential-lumpy-goose-68ec0f@quoll>
 <zo5qopdc6gxeoonqxohmnrzwmmrwa3wnim72op5zq2cjtn4pjs@kdjl3hwgxph3>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <zo5qopdc6gxeoonqxohmnrzwmmrwa3wnim72op5zq2cjtn4pjs@kdjl3hwgxph3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2026 11:45, Bartosz Golaszewski wrote:
> On Fri, Nov 13, 2026 at 11:07:38AM +0100, Krzysztof Kozlowski wrote:
>>> @@ -229,6 +231,7 @@ allOf:
>>>            compatible:
>>>              contains:
>>>                enum:
>>> +                - qcom,nord-qmp-usb3-dp-phy
>>
>> I don't understand why it is added to two blocks constraining clocks.
>> Does it even pass checks?
>>
> 
> Yes, it passes dtbs_check in my WiP branch for USB nodes that will be
> sent as v4 and takes the binding changes into account.
> 
> First we add the "qcom,nord-qmp-usb3-dp-phy" to the if block that sets
> minItems to 5. Then we exclude that compatible in the block that does an
> if not and sets minItems: 4 for all non-matching compatibles. This is in
> line with what's being done for existing "qcom,sc7180-qmp-usb3-dp-phy"
> and "qcom,sdm845-qmp-usb3-dp-phy" compatibles.

Oh my... what's with this binding :/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
