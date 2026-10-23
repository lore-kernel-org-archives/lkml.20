Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.210.164.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722910;
	b=V7r03Fo8vhSPeRfynC/RtRaqa42lr1fCuGsm970UIIVHxsQtIdGI6Oh4bPhKum3R/s9O
	 g2i5UPEcsrIHy3dpepNfih943kypdGSpPqzAmoz+p0m58jNJOGG/cgKAcw+8n3BOGI84/
	 gsd1TYKoAA1LyilVGdk8xbbVvb2vVyHNXMeeiZrBNYe/Z0GnJYmT9NmKG3T4P179F1Sft
	 FlU8hM8hjBtwY1PxGAzKM7EpSuGmKBsl+JJy+/wRBRKl7g2HAefuuQy+61L2gdaUlemcR
	 kuXJsiW42gXeR/vN/zVArMY0THo/gplJlj1fHUFcRchoqitqGFSal7huGdAIc7ag2yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722910;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=g7p57vMomCUBZccjEesEUi9+rounalBz2hqbDLPfdqw=;
	b=jwh/+U+dKS7S4P2GVDqXpWtCCKXAeQQ76LbBJ57GfnoljrgbhX6Wg19klOErq5Iwpund
	 2evC7pyfRnOtH/qZRgOabUErOnX4RwCFiIYES17cUZKjgvHJmr0L6saW066Q1tFk2Y+zZ
	 0Nm/hJ0A+tfvW7U2+scabsG7SCQ+pDKM2QHVmZiZejWMdkZVbSiKmrygTof8WG+3ATCD0
	 5keMLiMEdt7KGXC4x8b66tEY42oghStb35i1SwxSXD3BMZ6vP+CvhrU7BCq1dWu2xji0T
	 +Hm0h5Qg4w6MjSQluaYPPKYi1D684TUGDOY4pAg3PBfuRo3/pa712kwguf3mj9DgTNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=hLPmJ282;
	arc=none smtp.remote-ip=205.210.164.39
Received: from mail-m20521016439.xmail.ntesmail.com (mail-m20521016439.xmail.ntesmail.com [205.210.164.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22F606A319;
	Fri, 23 Oct 2026 02:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A22F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=hLPmJ282
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52123f987;
	Fri, 23 Oct 2026 10:34:55 +0800 (GMT+08:00)
Message-ID: <45615806-fa9a-4823-8f96-9a906e4433aa@rock-chips.com>
Date: Fri, 23 Oct 2026 10:34:54 +0800
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
Subject: Re: [PATCH v3 1/6] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3568
To: Rob Herring <robh@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dave Jones <s.dave.jones@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261020030916.3223833-1-damon.ding@rock-chips.com>
 <20261020030916.3223833-2-damon.ding@rock-chips.com>
 <20261021133002.GA3886567-robh@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261021133002.GA3886567-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1669c826703a8kunm895555f01716b0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSR5JVk4YS0IeTk5MH0NOS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5KVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=hLPmJ282eTgyBRhFIComvj78l4vIa84ErkQymRNMxoY0RgAFUIbIegUnHzdyzCaPeZHu7N1zuHwFlctmx/1NHXSnzItVBvPAC4TxtK4oXwyaJSvDTKLEXeXCs4dnSLQk3TYEixGBh/Q9B2dONuKZXAzcdCq5DXv/MAMPyt8eao0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=g7p57vMomCUBZccjEesEUi9+rounalBz2hqbDLPfdqw=;
	h=date:mime-version:subject:message-id:from;

Hi Rob,

On 10/21/2026 9:30 PM, Rob Herring wrote:
> On Tue, Oct 20, 2026 at 11:09:11AM +0800, Damon Ding wrote:
>> Document the "rockchip,rk3568-edp" compatible.  Like RK3576/RK3588,
>> the RK3568 eDP controller has the dp/pclk/hclk clocks and dp/apb
>> resets, but unlike them it does not use GRF registers, so make the
>> "rockchip,grf" property conditional on the SoC.
>>
>> Also document the optional avdd-0v9 and avdd-1v8 supplies, which are
>> needed by the RK3568 eDP controller.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../rockchip/rockchip,analogix-dp.yaml        | 25 ++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index 39dafe75a680..f8670a4e0430 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -15,6 +15,7 @@ properties:
>>       enum:
>>         - rockchip,rk3288-dp
>>         - rockchip,rk3399-edp
>> +      - rockchip,rk3568-edp
>>         - rockchip,rk3576-edp
>>         - rockchip,rk3588-edp
>>   
>> @@ -47,6 +48,16 @@ properties:
>>         - const: dp
>>         - const: apb
>>   
>> +  avdd-0v9-supply:
>> +    description:
>> +      A 0.9V supply that powers up the SoC internal circuitry. The actual
>> +      supply source varies between different boards.
>> +
>> +  avdd-1v8-supply:
>> +    description:
>> +      A 1.8V supply that powers up the SoC internal circuitry. The actual
>> +      supply source varies between different boards.
>> +
> 
> Are these valid for other compatibles?
> 

Got it. These properties are not required for other compatibles.
I will restrict them to the RK3568 compatible in v4.

Best regards,
Damon

