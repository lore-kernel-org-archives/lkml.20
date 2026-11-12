Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445302;
	b=GG4XRipg/AVMoOIZtXp5DY/XUAtn+sg/bgwmuRX/w1LtIoSPqo2i4uCIfFJW0ASO0oNR
	 Ta7yotUdUOWfcZ+bJmm5/hM/04fhgkX+9gCbNiZ6i5NZIycWFCWKZ/YdjeKFRBqDO+eVx
	 2QwX1M6Z7gBIwCFKimAcd5G3nKgZ4d//2R/ao1ObKUsqgoUjPbpHQJWtyQJujgRo9+kuO
	 /ZsJSpIrHeytuaWxvnh/ZQpxRyAPwWsDZBcLEvBcpi/qC/GgnxnfsuepZZGnwPr2Y2YlO
	 iCkKSefXadqoFsd3rVet7JImx68d36olFq9/Qn+J2Ypz0CfE4X05XmXUGxp/kP41qlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445302;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=fY4d6y47CamDA7G44TSptxryAErHvm+2SddM192y+64=;
	b=NcaZEIQZULoPhqQ5dr7ORbQL4YCFuo76LM+kTJHsgq6hbrhPy2VbU39ML0Do/XtLGgAK
	 qVmGJn3iEWXbBaDr2jl/8NzOyKXGVJgdHkmqe29SmB0z6/8UmxBQAi5wfmpEe2FuV0zfj
	 7Oe8HXKlW+QRvyqyU6cbsOQAPWz2z0Jg1VrLZxsO7b+YjCvWnF/6cTaqFMQoKuyt3CQxd
	 9DMH/KR44JJ4iAEQe0OP2twN6JWpS3A7cCkgUODVa9f1kDRkpsg/ZbrKC2yoctD19c9v5
	 t3WVz+qwR31N/I0cEoCmKHWpsYb/16ts/xChxmtJfrz0Fd37wBKqImXOIws5jQsYNOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=RwvIkZTV;
	arc=none smtp.remote-ip=210.79.60.249
Received: from mail-m60249.netease.com (mail-m60249.netease.com [210.79.60.249])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C09606A326;
	Thu, 12 Nov 2026 01:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C09606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=RwvIkZTV
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 545e00560;
	Thu, 12 Nov 2026 09:01:30 +0800 (GMT+08:00)
Message-ID: <dd25880e-be2d-4adc-8384-fa4a7160a4df@rock-chips.com>
Date: Thu, 12 Nov 2026 09:01:29 +0800
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
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576
 EVB1
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
 <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com>
 <CAKTNdwHbxnknob9NdjqWUcGU2fURO5B7V4kTTK+fvEYjNDOLCA@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAKTNdwHbxnknob9NdjqWUcGU2fURO5B7V4kTTK+fvEYjNDOLCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1cd462be103a7kunmad3109128fdea8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEIaVktMTUpKTEkeSEkZGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=RwvIkZTV3jQpd5yHEhMQAJE6+49uXKgn5dUqP2jzosXCm8+6dUU5dw4KqqX/DoivJuUINoenbcsTAmcpB6BTQ+CWfDl9iRrua0VavXKaDAXLL/UcF9IXvO/F/f/XVsAi6kHyZHe2zbWlOQwtfMsVnRU16rPU1itMv9XWPFY5810=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=fY4d6y47CamDA7G44TSptxryAErHvm+2SddM192y+64=;
	h=date:mime-version:subject:message-id:from;

Hi Alexey,

On 11/11/2026 6:45 PM, Alexey Charkov wrote:
> Hi Chaoyi,
> 
> On Wed, Nov 11, 2026 at 1:31 PM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>
>> Hi Alexey,
>>
>> On 11/7/2026 1:52 AM, Alexey Charkov wrote:
>>> RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
>>> controller and a fixed-voltage VBUS supply.
>>>
>>> Describe it in the device tree, including the wiring for both the USB and
>>> the DP side.
>>>
>>> This makes the data roles follow the Type-C port's negotiation, so the
>>> port stops being host only. It also leaves the VBUS regulator to be
>>> managed by TCPM instead of being hardwired via the tangentially related
>>> phy-supply on a USB controller. DP lanes are also muxed dynamically by
>>> the USBDP PHY based on the Type-C port's negotiation, so the hacky fixed
>>> lane muxing also goes away.
>>>
>>
>> Have you tested this? As far as I know, dw-dp driver does not support
>> Type-C HPD yet.
> 
> I did - it works fine for me under Linux with Sebastian's patches. My
> primary motivation, however, was U-Boot, where the current phy-supply
> hack breaks USB data role switching, due to VBUS being forced
> always-on. With this patch it works, and now the DT actually describes
> the hardware, as it is supposed to.
> 

Oh, I almost forgot about that. I think it should be this patch series[0], right?

But I think we probably need more than just this series, because
richtek,rt1711h does not register the HPD bridge, so we will get this:

[   14.828983] auxiliary aux_bridge.aux_bridge.0: deferred probe pending: aux_bridge.aux_bridge: failed to acquire drm_bridge

Maybe you have already added the corresponding patch yourself?
Another option is to use the generic AUX HPD patch[1]. :)

[0]: https://lore.kernel.org/linux-rockchip/20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com/
[1]: https://lore.kernel.org/all/20261020072816.180-1-kernel@airkyi.com/

-- 
Best, 
Chaoyi
