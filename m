Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.195.17.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279167;
	b=HahhN631/7VAP4dPR73bYW3Ffg4I/DmASAWo+ghJlzuSa2LUNdaRSVOx5rORS8ws5VKC
	 SuoYlzHNYcGblO8U0gxt9kOcuOZrOXsZtNBVk4v7l3VvMLhQEZqb5UMLg/t1uD0IQT2Qi
	 rb43hQ4FWbxxOj9lPC+hyz/yBidun5cNeArACURFwOU+N+Rem+Rgu3oGM+A1awxpBMYqV
	 j75U99xm7XVp4/tob9N4/caqdlRv+m0amPsc20QhohNBhw2pNlBv+4Z0XwnPtxW0B8cnr
	 wjvghe9hBU/njJUnKoHShK9OhcghmIunercm2ZK11I8vLDmiV0Xb/QE0m7OociKLigw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279167;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=1pznVwkEZpAe1hyxNb7ShpTi+47BEMmqvSU22FSDZfs=;
	b=gMt/0twC7TwSRsAyI37ZiAG/yOQzAkSdWijdpKUtzzCKxrL5aRvN2oPT9SnxvA8CHblV
	 fjhhVY4cDvsvIOpo0/NdCJw3adbnckWVSxhkW4XFat5JiQ3S7GVoenFoXdv59zjOPuD+h
	 OSoU+aaTiCkt9lf0csLMWx1zq7eI1I4MyeX3JDdJjuEfmFAeVlZ8XIC+JbYSFo0oXJvSR
	 gRp0vPh3oVClS7BXC4tgVQ8kMpUd7L2ic/KnL9Ss+4mGdMNk8NLTHPAFTHA3MIL0SJDrM
	 0x3Fk6bnkKvlqGlNvesNI82zYcaD2H4usoUiyC/JkQa706pz9WvkwGUnmT/TaR1OCkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="Ns/2mPV9";
	arc=none smtp.remote-ip=45.195.17.241
Received: from mail-m17241.xmail.ntesmail.com (mail-m17241.xmail.ntesmail.com [45.195.17.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15848606A325;
	Tue, 10 Nov 2026 02:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15848606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ns/2mPV9
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 541744873;
	Tue, 10 Nov 2026 10:52:32 +0800 (GMT+08:00)
Message-ID: <ab5694a1-2f10-4888-ad27-20715d3f98a6@rock-chips.com>
Date: Tue, 10 Nov 2026 10:52:31 +0800
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
Subject: Re: [PATCH v4 2/6] dt-bindings: phy: Add rockchip,rk3568-edp-phy
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
 <20261030064905.2248999-3-damon.ding@rock-chips.com>
 <20261103-lemon-guillemot-of-economy-eefbbd@quoll>
 <fd180b9c-de60-4718-b17f-319bf4339e13@rock-chips.com>
 <20261106152915.GA3406543-robh@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261106152915.GA3406543-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1c35f1cad03a8kunm4f8fb2772be325
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHh1CVh1NGh1CTUxNTh4ZQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5KVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ns/2mPV9pH9bVvzBBCDzik0xz9kGzB25NEhWCgaJIvkA3av+MymfxdL510FRETs5vrsiCdISksI3CW1wh0tet9VEr08fX0Gv7MFLrFvI8AT3q6u9sMAphY8Oao2Ra1viV41VNtT+Z+VO25d7jt6OQBQja6J3O3lp6ZQ84Bc7Lus=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=1pznVwkEZpAe1hyxNb7ShpTi+47BEMmqvSU22FSDZfs=;
	h=date:mime-version:subject:message-id:from;

Hi Rob,

On 11/6/2026 11:29 PM, Rob Herring wrote:
> On Wed, Nov 04, 2026 at 04:59:58PM +0800, Damon Ding wrote:
>> Hi Krzysztof,
>>
>> On 11/3/2026 7:20 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Oct 30, 2026 at 02:49:01PM +0800, Damon Ding wrote:
>>>> Document the eDP transmitter PHY with NaNeng IP block found on the
>>>> RK3568 SoC.  The PHY has its own register window inside the eDP PHY
>>>> GRF, so its node is modeled as a child of the eDP PHY GRF syscon with
>>>> a reg property describing that window.  Also add the
>>>> "rockchip,rk3568-edp-phy-grf" compatible and the phy node reference to
>>>> the Rockchip GRF schema.
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v4:
>>>> - Add the reg entry for the PHY node and the ranges/#address-cells/
>>>>     #size-cells for the parent syscon node.
>>>> ---
>>>>    .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 68 +++++++++++++++++++
>>>>    .../devicetree/bindings/soc/rockchip/grf.yaml | 20 ++++++
>>>>    2 files changed, 88 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>>>> new file mode 100644
>>>> index 000000000000..b78da00ffefd
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>>>> @@ -0,0 +1,68 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/phy/rockchip,rk3568-edp-phy.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Rockchip eDP Transmitter PHY with NaNeng IP block
>>>> +
>>>> +maintainers:
>>>> +  - Damon Ding <damon.ding@rock-chips.com>
>>>> +  - Heiko Stuebner <heiko@sntech.de>
>>>> +
>>>> +description:
>>>> +  On the RK3568 SoC the eDP PHY is controlled through the eDP PHY GRF
>>>> +  registers, therefore the PHY node is expected to be a child of the
>>>> +  eDP PHY GRF syscon node.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: rockchip,rk3568-edp-phy
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +    description: PHY registers within the eDP PHY GRF.
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +
>>>> +  clock-names:
>>>> +    const: refclk
>>>
>>> Just "ref"
>>
>> Will fix in v5.
>>
>>>
>>>> +
>>>> +  "#phy-cells":
>>>> +    const: 0
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - "#phy-cells"
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/rk3568-cru.h>
>>>> +
>>>> +    soc {
>>>> +      #address-cells = <2>;
>>>> +      #size-cells = <2>;
>>>> +
>>>> +      edp_phy_grf: syscon@fdcb0000 {
>>>> +        compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
>>>
>>> This is beyond the scope of this binding. Drop entire node.
>>
>> Will Drop in v5. The example should only show the PHY node itself.
> 
> Actually, drop the whole thing and put in GRF binding if you want an
> example. MFD examples should be complete, not piecemeal with each
> sub-device.
> 
> 

Understood. For incoming v5, the example will be dropped from the PHY 
binding schema entirely, and the complete MFD example will live only in 
the GRF binding schema.

Best regards,
Damon

