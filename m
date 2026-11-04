Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782812;
	b=OaxJNgKxUrLAoTfPxno6FEvzRan1vkIArU3EsZO4KFFcZmA97Grv/YohlF75zKJn3mcJ
	 CaUMtO4slGQ0VXAvE/dPYb+Iuaq90lhD7ikl+nrqb3Fo+i/Bek9G+Rx57E6YmovuGAdHH
	 EsF0IVloHzUA9QaRQm47EnuWPIYO7tA7IApDkBHyedyM1wcVVCSBlZB1UUqkkK+EjMvGz
	 S5DCoQB3uqeWWl/rBrhAZWaArAMrhZNuSv6i+5uyG6KkM6i2fW9xJlJts7da6M9BaUf0v
	 jMyDYhHoJ6ZrMCZ83xC0ri4LGe73BduAqWPg+wGvOP25ID1Y/X04YDRwC0Kt+IBAALA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782812;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=eAdT+8rLd44bxIIAm/zwqM4YbafLLwH/m+nhuD3g5QU=;
	b=ykUcZi2H4zBmfa/Z11v4jbvQ97WjC7zT+GrCd13TQ/P6GUAcK1AEAwPyRptOmq47T9AU
	 ak9RmJMp6B1E+Keip49WE5kxdonSmxLFnWXO4YFVJSpEYycqV1wCPCoFhaMlA13BksULE
	 /RyHG4kPgYSDqBQY2sFNgTkmROUIwWoOU3J3YStmyjN50tVN/qkhNQGp5bHTmdtHXDF8j
	 fT6kZL7eNwmBiYWlC2Ghv01GZrH8wVAIKp/33r5CNw3dpRELUkSjuon6mP0OlsZxnRVfL
	 jQ9poWuvw5XapYpSuP4TcswMxCPWXVap4hC/dE9NU7ZFjD35a8UrxPxqRq+2Uz0+L7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	arc=none smtp.remote-ip=103.209.128.50
Received: from mail-m12850.netease.com (mail-m12850.netease.com [103.209.128.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF82606A328;
	Wed,  4 Nov 2026 09:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF82606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5376b923e;
	Wed, 4 Nov 2026 16:59:59 +0800 (GMT+08:00)
Message-ID: <fd180b9c-de60-4718-b17f-319bf4339e13@rock-chips.com>
Date: Wed, 4 Nov 2026 16:59:58 +0800
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261103-lemon-guillemot-of-economy-eefbbd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1a5c95c3e03a8kunm4bbaef2a348d4c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTklPVksZGRpLSxlPSBgYH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5KVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=MHZnCuK3X0/bHPD1qBFBpPTg5quAPx84ehdDHx+2O7e+ZW0NvxFEq3Qa7uJmJjE/dpQuLUHBLvCCA7Erx3R7UwcpFYvbZelF7bJukJ0Kp7fqAV1l7q9ezBQqrl4ZAThxvSRXaHEinP0DVtJ8ttPK0TCapb15cyIRtY1FZvkdsBk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=eAdT+8rLd44bxIIAm/zwqM4YbafLLwH/m+nhuD3g5QU=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

On 11/3/2026 7:20 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 30, 2026 at 02:49:01PM +0800, Damon Ding wrote:
>> Document the eDP transmitter PHY with NaNeng IP block found on the
>> RK3568 SoC.  The PHY has its own register window inside the eDP PHY
>> GRF, so its node is modeled as a child of the eDP PHY GRF syscon with
>> a reg property describing that window.  Also add the
>> "rockchip,rk3568-edp-phy-grf" compatible and the phy node reference to
>> the Rockchip GRF schema.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v4:
>> - Add the reg entry for the PHY node and the ranges/#address-cells/
>>    #size-cells for the parent syscon node.
>> ---
>>   .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 68 +++++++++++++++++++
>>   .../devicetree/bindings/soc/rockchip/grf.yaml | 20 ++++++
>>   2 files changed, 88 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>> new file mode 100644
>> index 000000000000..b78da00ffefd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/rockchip,rk3568-edp-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip eDP Transmitter PHY with NaNeng IP block
>> +
>> +maintainers:
>> +  - Damon Ding <damon.ding@rock-chips.com>
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +
>> +description:
>> +  On the RK3568 SoC the eDP PHY is controlled through the eDP PHY GRF
>> +  registers, therefore the PHY node is expected to be a child of the
>> +  eDP PHY GRF syscon node.
>> +
>> +properties:
>> +  compatible:
>> +    const: rockchip,rk3568-edp-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: PHY registers within the eDP PHY GRF.
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: refclk
> 
> Just "ref"

Will fix in v5.

> 
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - "#phy-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rk3568-cru.h>
>> +
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      edp_phy_grf: syscon@fdcb0000 {
>> +        compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
> 
> This is beyond the scope of this binding. Drop entire node.

Will Drop in v5. The example should only show the PHY node itself.

> 
>> +        reg = <0x0 0xfdcb0000 0x0 0x8000>;
>> +        clocks = <&cru PCLK_EDPPHY_GRF>;
>> +        ranges = <0x0 0x0 0xfdcb0000 0x100>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        edp_phy: phy@0 {
>> +          compatible = "rockchip,rk3568-edp-phy";
>> +          reg = <0x0 0x100>;
>> +          clocks = <&pmucru XIN_OSC0_EDPPHY_G>;
>> +          clock-names = "refclk";
>> +          #phy-cells = <0>;
>> +        };
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
>> index 7bcb4e2f47ec..c089bd014003 100644
>> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
>> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
>> @@ -93,6 +93,7 @@ properties:
>>                 - rockchip,rk3399-grf
>>                 - rockchip,rk3399-pmugrf
>>                 - rockchip,rk3562-pmu-grf
>> +              - rockchip,rk3568-edp-phy-grf
>>                 - rockchip,rk3568-grf
>>                 - rockchip,rk3568-pmugrf
>>                 - rockchip,rk3576-ioc-grf
>> @@ -119,6 +120,8 @@ properties:
>>     "#size-cells":
>>       const: 1
>>   
>> +  ranges: true
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -156,6 +159,22 @@ allOf:
>>             $ref: /schemas/phy/rockchip,rk3288-dp-phy.yaml#
>>             unevaluatedProperties: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: rockchip,rk3568-edp-phy-grf
>> +
>> +    then:
>> +      required:
>> +        - "#address-cells"
>> +        - "#size-cells"
>> +      patternProperties:
>> +        "^phy@[0-9a-f]+$":
>> +          type: object
>> +          $ref: /schemas/phy/rockchip,rk3568-edp-phy.yaml#
>> +          unevaluatedProperties: false
> 
> Properties should be defined in top level. Here you only narrow them.
> 
> This binding is getting close to unreadable/unmaintainable. Split new
> devices with children to their own binding.

Agreed. The "rockchip,rk3568-edp-phy-grf" syscon will be documented by
its own binding schema in v5.

Best regards,
Damon

