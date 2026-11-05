Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873691;
	b=LbDuclnzdSY4jWPbb+z9XHKBiPDOUGCiDjuWv+qvom83rUDuAzgDHr4nuFDYiBYLllyK
	 riBWV1bTPW8lGT/IVuJDHU53qFV/0Qsexu8zpTp4jjvCmIVUzptG+2209mTZbiFlyQ/HZ
	 oYQwJ67kM0pUxpvbNyOEB80pOtOzYNrOPC9MRlVl8xQSk3b836JL3X3GBf9ESPV95yYNJ
	 xNPwL8VnAeQuXwceh+Fg/GsPzeNKY4OCOzU6KdgQY9KPMCdKIlXlUcmCEKmaO3Zi8jZaa
	 p1Z4cb/Fx2ktmhezMQO9BbhoMv85RJwoyaJN9l4B0CyeRMVDdF4rSk0pUCkKiwh/7sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873691;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=uvp6buPqQ+9eJjpFgvz/pyRHfAKlcp4kxy7ey2RpwfE=;
	b=qeWgO1I5pAuRvVKvnvjKQHNgmFQOMlyXNFLkwz1FgZkesxwlOoZFH+njihqishj+oipf
	 G+e+7MZ9M0ZUJal4uqfSmG/l8NuVlSykJjcMeA1CMag6GVCa5/K4zizhWaBzPDI1vrZmS
	 1p7EFoYsNHDzUld6dnRs3R27x42i/D0ay/TFcgnBus6wa2UGhbU1dIhxQ0ORVm+Y3cMMx
	 ZeAfDauMumL+44Omw0pspqxx2aQOQ/oCu2pqa5irrptmJyyHgHFR21QmlPQsGddxUCaZ2
	 K0qURQLthSCGxlJi50gaEvCwCWHVv3vjuj7jgdXkPwE312ceqBVOWKmcxhgyRZZ3AIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Xr6t4hLT;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126B606A331;
	Thu,  5 Nov 2026 10:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B126B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Xr6t4hLT
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261105101447euoutp026d2837d28c67271ae26c59370de1ce6d~lHp1gay492140621406euoutp027;
	Thu,  5 Nov 2026 10:14:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261105101447euoutp026d2837d28c67271ae26c59370de1ce6d~lHp1gay492140621406euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793873687;
	bh=uvp6buPqQ+9eJjpFgvz/pyRHfAKlcp4kxy7ey2RpwfE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Xr6t4hLTbqTMbZ8PN1OE6SDstUWmsOEmpPSjX60geGvAGrv/LRouLb1HbkwZn83V5
	 az6v0tEb4gaMAks1j4H41rjIdh03Nzty5faC5k62RJ80KH4iCvZbm88R7/1oxrUbKa
	 FKtfbACftVQnRTRtDHQlCXTf2X6v/rKbHLx4ahDg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261105101447eucas1p2079230483e67ab1c1aa521c508ccc3e2~lHp1LlepI0033600336eucas1p2k;
	Thu,  5 Nov 2026 10:14:47 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261105101445eusmtip1619d691fa0ae0794db0ed24c9422d032~lHpzWgfYP0678006780eusmtip1M;
	Thu,  5 Nov 2026 10:14:45 +0000 (GMT)
Message-ID: <8638d230-1a12-491c-9608-3e94805addeb@samsung.com>
Date: Thu, 5 Nov 2026 11:14:45 +0100
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
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Yakir Yang
	<kuankuan.y@gmail.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, William Qiu
	<william.qiu@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261029-flinch-header-bad94288c71b@spud>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261105101447eucas1p2079230483e67ab1c1aa521c508ccc3e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029075358eucas1p111293c602fc3aac9c6a044fc41488919
X-EPHeader: CA
X-CMS-RootMailID: 20261029075358eucas1p111293c602fc3aac9c6a044fc41488919
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
	<CGME20261029075358eucas1p111293c602fc3aac9c6a044fc41488919@eucas1p1.samsung.com>
	<20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>
	<20261029-flinch-header-bad94288c71b@spud>



On 10/30/26 00:06, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 08:53:38AM +0100, Michal Wilczynski wrote:
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
>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2ff8b0b920aec41a83f0aeaa0ed9c4249fe87f46
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml
> 
> Why is this in bindings/soc? I feel like it should be in
> bindings/display or something along those lines, since it's the display
> subsystem of the device?
> 
> Cheers,
> Conor.

Fair point - soc/ is mirroring where the drivers sit. I can relocate it
to bindings/display/starfive/ in v7, together with
starfive,jh7110-vout-subsystem.yaml, which also belongs to the display
subsystem.


Best regards,    
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

