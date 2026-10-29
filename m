Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296413;
	b=BTpPEyjJcyFaCkF+oi0Ce/H3P8Y6YJT8PfYBmVM1svXnvcu0S4hS8JaWim2FcAFb7CqK
	 QQWkWXhkZUmZaXt2o612X/vrFfD7ZXEKeRwsFcZDPAqhL+id6vytfJ1L6r1agv0SW0Z42
	 Imxe2/Fp06lnIYKaFfTOGTha+N9jRbvofaET6+D0+ImSqdQhWb59jE/+HVG974GIpDV68
	 /BJS2bZHqkn7IXmJGhv/j1bp7vaNO6ZMbzGjWnkRaeJxi4Myos1fGY64W3ak/1Sk6yeg/
	 JSr/7cCXhVsN9UyQyO5M8Zf703woWpZiOy8g7VNERQZtKenmNwPgEbLSPMUwL+ZwEXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296413;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=EVH99uGrBjV1LXCPbiOuybiSxiADyCk5jOCu0FgStEE=;
	b=U80fJiOWkBEjpBKMTHb4VTP4gABeQjKIoJ48WuTmodAdh0t4BN70G9rjAkuwU/i5zqsv
	 Dvo7ektQnmkrGrIal6Wd5RPlIQ9k9jE/14h1sAefL6+M5CelCE7o1hQNU4YamUGwOYcUJ
	 GP71y1Smynq6/jxG1MbvMp/3z5dqavnkfGPs9InlY2eaausBeXrM39msxGo6nioj22a8Q
	 0T9UNZQqx1OZ6HbcOr8Lr9x7GMLqgKPsmBgMY+bXaVjanbEfuGAvV8M1hQ+s5FBtQjYru
	 GKKKsBmVp9+PqnHqnffa/w8Ecie5XUC5uA0APwake0lRSIwkZa2zPm1etdiz4IzEMtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=YdoWYHPw;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02471606A31C;
	Thu, 29 Oct 2026 17:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02471606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=YdoWYHPw
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261029175328euoutp0160d85dd29c36cd0c8e7d870a148e9be2~jEZUo7_mo2181221812euoutp01L;
	Thu, 29 Oct 2026 17:53:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261029175328euoutp0160d85dd29c36cd0c8e7d870a148e9be2~jEZUo7_mo2181221812euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793296409;
	bh=EVH99uGrBjV1LXCPbiOuybiSxiADyCk5jOCu0FgStEE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YdoWYHPwmJN/KFk1TlDkNYhFdqmZj/+KS3IoG8aUG8OuAgV1ZKqmChA8RwrBrtk63
	 2EJ8N/oXBcYm8Rwj8dyL2ZcdLI4kx5PA50P7t8b4ByliK/9E9X0wVJGo4OfCo34HTT
	 H6cNO/1oBoDGGt1dGhGX7IqLdqiGAWce09a+/23o=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261029175328eucas1p2ceead9bf1d2040fb65ca9ac941f6b6fa~jEZUAr23j0643406434eucas1p2V;
	Thu, 29 Oct 2026 17:53:28 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029175326eusmtip1da81d3d531e57fbb55db47bb699094a6~jEZR9_Q1X3030430304eusmtip1N;
	Thu, 29 Oct 2026 17:53:26 +0000 (GMT)
Message-ID: <777c7a8c-de7c-4f0c-9c9c-d5b78a5595d8@samsung.com>
Date: Thu, 29 Oct 2026 18:53:25 +0100
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
Subject: Re: [PATCH v6 04/18] dt-bindings: soc: starfive: Add
 starfive,jh7110-hdmi-subsystem
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, Simona Vetter <simona@ffwll.ch>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, William Qiu
	<william.qiu@starfivetech.com>, Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	devicetree@vger.kernel.org, Andy Yan <andyshrk@163.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Dominique Belhachemi <db@domibel.de>, Maud
	Spierings <maud_spierings@murena.io>, Joshua Peisach <jpeisach@ubuntu.com>,
	David Airlie <airlied@gmail.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>, Sandy Huang
	<hjc@rock-chips.com>, Paul Walmsley <pjw@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Heiko
	Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Yakir Yang <kuankuan.y@gmail.com>, Emil
	Renner Berthing <kernel@esmil.dk>, Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Hal Feng <hal.feng@starfivetech.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	dri-devel@lists.freedesktop.org, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonas Karlman <jonas@kwiboo.se>, Graham
	Markall <hello@big-grey.co.uk>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <179329528881.3539981.14637229355908751610.robh@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261029175328eucas1p2ceead9bf1d2040fb65ca9ac941f6b6fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029075358eucas1p111293c602fc3aac9c6a044fc41488919
X-EPHeader: CA
X-CMS-RootMailID: 20261029075358eucas1p111293c602fc3aac9c6a044fc41488919
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
	<CGME20261029075358eucas1p111293c602fc3aac9c6a044fc41488919@eucas1p1.samsung.com>
	<20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>
	<179329528881.3539981.14637229355908751610.robh@kernel.org>



On 10/29/26 18:38, Rob Herring (Arm) wrote:
> 
> On Thu, 29 Oct 2026 08:53:38 +0100, Michal Wilczynski wrote:
>> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
>>
>> The JH7110 HDMI IP is a monolithic block containing both the digital
>> controller and analog PHY in a single register space. This binding
>> defines the parent device, which holds the shared register map, and its
>> two children: the PHY and the controller.
>>
>> The two have separate resources. The PHY takes the 24 MHz reference
>> clock and provides both the pixel clock, which the VOUT clock generator
>> routes on to the display controller, and the phy the controller uses.
>> The controller takes its clocks from the VOUT clock generator. What
>> they share is the register space, which the parent maps.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  .../starfive/starfive,jh7110-hdmi-subsystem.yaml   | 95 ++++++++++++++++++++++
>>  1 file changed, 95 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml: Unresolvable reference: /schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
> Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.example.dtb: hdmi@29590000 (starfive,jh7110-hdmi-subsystem): phy: False schema does not allow {'compatible': ['starfive,jh7110-inno-hdmi-phy'], '#clock-cells': 0, 'clocks': [[4294967295]], '#phy-cells': 0, 'phandle': 2}
> 	from schema $id: https://protect2.fireeye.com/v1/url?k=e93a78e1-88b16dd1-e93bf3ae-000babffaa23-e7f80dd3ed8ff65f&q=1&e=27d4095f-5012-49f1-94e3-a63fd9693348&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fsoc%2Fstarfive%2Fstarfive%2Cjh7110-hdmi-subsystem.yaml
> Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.example.dtb: /example-0/soc/hdmi@29590000/phy: failed to match any schema with compatible: ['starfive,jh7110-inno-hdmi-phy']
> 

This patch depends on the JH7110 HDMI PHY series which adds
starfive,jh7110-inno-hdmi-phy.yaml [1].

With that series applied dt_binding_check is clean.

[1] - https://lore.kernel.org/all/20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com/

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
