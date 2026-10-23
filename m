Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792727784;
	b=k+mwVJPZluTluMV8xlrKL836YZ2DC8SbuKU7SjUvvm1WTNOVCuMNqi/zKVtKJ0TZnhfv
	 TFmwIrQk9M+4axKPVdKWw8BFnftiZqTPYnBny4Vy1Yte80h3IyXLaMtDyS7XB8m4JeZx2
	 ASMrcd6Oo7ULA0jrrk2FmtmYxuwj13qII/8IQzOXKq92z3Lxcf3zQgPf4CbihrUXenXHX
	 Ua4jaHsFBUf2PZ7E/2TlDuv3co44fe5HD0IQMkQCHR6d8CN8xZ4CT1Jt42p3O/hnS+cOq
	 LsZhW0rF92K9DFxzoUrbvzsD3NWQNXYwO12oak5WJc54Qc39d2qMyNMpyRdEV6mNVqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792727784;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=wl1N2fN1N3OOtuQaycXv9jDontNpFyjkTgCOUkz6GuI=;
	b=DoPiXPR6ia855gGhICIZ+cD8Gfg1v53RtXIDXDPUkH0XxK2J/sbjpWFFbdXBFnwVfcsS
	 lq/2vN6uGnAaoY8dmY9ZUZfEh3DYlW0qmH3vEt6bvjRUmnH5fMoMMXNCNDSH1XUSqZLgX
	 E1TLXPQOZkzL0YYbrlciB7DWNUsl+hzb33mQ8EenYLqcziyEmIoqCT+OBFu54thS3FuW1
	 lwPqTCBDMCe5B/lgdajy3gkHLFZINwELexyYaWUvYPxD4s//TNFz+yOHPyiq7MENhaTIx
	 gW4U27dxrFqyTKeWMDU9Ql/bmMY+478GBthGKVjLUpKlAUnUTc7DJ/0aqOS94qbbq6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Xme2Hqt+;
	arc=none smtp.remote-ip=154.81.10.234
Received: from mail-m10234.netease.com (mail-m10234.netease.com [154.81.10.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D22606A319;
	Fri, 23 Oct 2026 03:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D22606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Xme2Hqt+
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52153242b;
	Fri, 23 Oct 2026 11:56:10 +0800 (GMT+08:00)
Message-ID: <5892f99c-68cd-4ff9-91f1-af5ee024e025@rock-chips.com>
Date: Fri, 23 Oct 2026 11:56:10 +0800
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
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: phy: Add rockchip,rk3568-edp-phy
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
 <20261020030916.3223833-3-damon.ding@rock-chips.com>
 <20261021133418.GA3889663-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20261021133418.GA3889663-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa166e6e69b03a8kunmccf974a417d0dd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTxhPVkNCTx0eQhlKT00YQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5KVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Xme2Hqt+FhhVlD1vZmU4mevIcFRkIWQMSFZ7Nm5XlFzIku226zn+7vTxfGDosuZ9ynLpSkWwnLZuWuLTyteI4WBLKb04mGHOcaz6aNvEYwEdL+nqOyWi5+/0qC/zwvBo8K+R0JkuIHfnbEvJk+6jbKm2O5x+GSul8g5Kgk/zbeQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wl1N2fN1N3OOtuQaycXv9jDontNpFyjkTgCOUkz6GuI=;
	h=date:mime-version:subject:message-id:from;

Hi Rob,

On 10/21/2026 9:34 PM, Rob Herring wrote:
> On Tue, Oct 20, 2026 at 11:09:12AM +0800, Damon Ding wrote:
>> Document the eDP transmitter PHY with NaNeng IP block found on the
>> RK3568 SoC.  The PHY is controlled through the eDP PHY GRF registers,
>> so its node is modeled as a child of the eDP PHY GRF syscon.  Also
>> add the "rockchip,rk3568-edp-phy-grf" compatible and the "edp-phy"
>> child node reference to the Rockchip GRF schema.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 59 +++++++++++++++++++
>>   .../devicetree/bindings/soc/rockchip/grf.yaml | 15 +++++
>>   2 files changed, 74 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>> new file mode 100644
>> index 000000000000..afe7bc3d839e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>> @@ -0,0 +1,59 @@
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
> 
>  From the driver, looks like there is a specific register range for the
> phy regs in the GRF, so please add a 'reg' entry (and 'ranges' in the
> parent).
> 

I see. For v4, I will add the reg entry for the PHY node and ranges in 
the parent syscon node, as done in rk3399-emmc-phy.

The proposed eDP PHY DT layout looks like:

edp_phy_grf: syscon@fdcb0000 {
   compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
   reg = <0x0 0xfdcb0000 0x0 0x100>;
   clocks = <&cru PCLK_EDPPHY_GRF>;
   #address-cells = <1>;
   #size-cells = <1>;
   ranges;

   edp_phy: phy@0 {
	compatible = "rockchip,rk3568-edp-phy";
	reg = <0x0 0x100>;
	clocks = <&pmucru XIN_OSC0_EDPPHY_G>;
	clock-names = "refclk";
	#phy-cells = <0>;
   };
};

The driver will be updated accordingly to map its own registers
via devm_platform_ioremap_resource() + devm_regmap_init_mmio() instead 
of accessing them through the parent syscon regmap.

Best regards,
Damon

