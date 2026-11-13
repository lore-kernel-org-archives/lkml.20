Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.251.158.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536125;
	b=aaRvIfcnxExn4FH9AeHfbZz8nRSjp9Ij8yO2QY1h04GXofBCA9vr4TeGK6dKpftmS/XT
	 pqV69M4Ms92BkcpJixOxyIGZGb3EfMufmTK+zN5QMc5oVF5rfXuss/nlu6KnulcjKTdNo
	 Nez9cCsZnPKporv4/RpygH9fqLrZhDF9ocNkYR6y/APAV5GWbmS7IxN5EXJyX2BzbVep9
	 dGyOoOXnUaNstceBkW/RgvJFKJ2HTSY7+oq748QJp6O8w80xYAeOsbHWMaRiZowgvH8lG
	 hOSeiuFK72sBq6tMuRFUyIA0L3cDAAHWgoXQ4lYxLVZvlmI47q/Ncwvlr2COUWZZ/FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536125;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=1GtwLE2dW7ZsjXW/2HfhRMJDb/gDxI8w5UnCKK1RLMU=;
	b=E8juTPlpJeKTpnaB4okofNCEd4vChX247q9q96YTKv3DpUfG305mwhF+xGOOOTkkiRn/
	 avnUhWsX0DYMfG+PjuCBqvm5of1F8tnHV7xFvWx6Qp4ek98fBeQ7g5vkNLG6z41fYek1H
	 jsGfY358MdbmN+33ySISv/+WjoszB20f7PA5YUH7zMrKLdmmAlzTVak8W6t3JmPB9mrAM
	 kkmA1heI62FYd3uB50TEb6YQ8x5Fh3t6AspCeHQoMfNR3+SH7SdyntP0K1JItxChVFlYi
	 VVJMdojdCtkq+SQ1rENp+t31Lzkaq9g1UDbEu2vJrZkoKZG8TDG5A5I79/mjKlLEEKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="i0tdbp/K";
	arc=none smtp.remote-ip=47.251.158.250
Received: from mail-m158250.netease.com (mail-m158250.netease.com [47.251.158.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF9C606A32D;
	Fri, 13 Nov 2026 02:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF9C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=i0tdbp/K
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54857d4c9;
	Fri, 13 Nov 2026 10:15:12 +0800 (GMT+08:00)
Message-ID: <b961a36f-e7ef-498c-ac4d-efe90f76e289@rock-chips.com>
Date: Fri, 13 Nov 2026 10:15:09 +0800
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
 <dd25880e-be2d-4adc-8384-fa4a7160a4df@rock-chips.com>
 <CAKTNdwGHS5M4yNKEqfKV8hEJRAYf3wnY1Z6jOWQx7e4cipTF9A@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CAKTNdwGHS5M4yNKEqfKV8hEJRAYf3wnY1Z6jOWQx7e4cipTF9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d2b0016003a7kunmdd9bb254ad509
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGhlMVhgYSBhLSktOGhhDT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=i0tdbp/Kds+rR0Vm/TwItaI+X9++Dl3d3CwCBEFhKDTwiVN2vyiHG5m6TEngBlzppXetupZmxmqDOdz8y12q3NvIHKrGYg8GNBBJxV2g3TNRRBC6SrxEE21pZ9V3lkPpfgwQQjmRPHxETdKlSsbiocadM+SWMj27RiYnYsfFObw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=1GtwLE2dW7ZsjXW/2HfhRMJDb/gDxI8w5UnCKK1RLMU=;
	h=date:mime-version:subject:message-id:from;

On 11/12/2026 9:25 PM, Alexey Charkov wrote:
> On Thu, Nov 12, 2026 at 5:01 AM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>
>> Hi Alexey,
>>
>> On 11/11/2026 6:45 PM, Alexey Charkov wrote:
>>> Hi Chaoyi,
>>>
>>> On Wed, Nov 11, 2026 at 1:31 PM Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
>>>>
>>>> Hi Alexey,
>>>>
>>>> On 11/7/2026 1:52 AM, Alexey Charkov wrote:
>>>>> RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
>>>>> controller and a fixed-voltage VBUS supply.
>>>>>
>>>>> Describe it in the device tree, including the wiring for both the USB and
>>>>> the DP side.
>>>>>
>>>>> This makes the data roles follow the Type-C port's negotiation, so the
>>>>> port stops being host only. It also leaves the VBUS regulator to be
>>>>> managed by TCPM instead of being hardwired via the tangentially related
>>>>> phy-supply on a USB controller. DP lanes are also muxed dynamically by
>>>>> the USBDP PHY based on the Type-C port's negotiation, so the hacky fixed
>>>>> lane muxing also goes away.
>>>>>
>>>>
>>>> Have you tested this? As far as I know, dw-dp driver does not support
>>>> Type-C HPD yet.
>>>
>>> I did - it works fine for me under Linux with Sebastian's patches. My
>>> primary motivation, however, was U-Boot, where the current phy-supply
>>> hack breaks USB data role switching, due to VBUS being forced
>>> always-on. With this patch it works, and now the DT actually describes
>>> the hardware, as it is supposed to.
>>>
>>
>> Oh, I almost forgot about that. I think it should be this patch series[0], right?
>>
>> But I think we probably need more than just this series, because
>> richtek,rt1711h does not register the HPD bridge, so we will get this:
>>
>> [   14.828983] auxiliary aux_bridge.aux_bridge.0: deferred probe pending: aux_bridge.aux_bridge: failed to acquire drm_bridge
>>
>> Maybe you have already added the corresponding patch yourself?
>> Another option is to use the generic AUX HPD patch[1]. :)
>>
>> [0]: https://lore.kernel.org/linux-rockchip/20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com/
>> [1]: https://lore.kernel.org/all/20261020072816.180-1-kernel@airkyi.com/
> 
> Yes, on my daily-use branch [0] I've got a local commit enabling the
> HPD bridge specifically for TCPCI (69b7c806b334). But that's all
> driver territory, so out of scope for DT discussion ;-)
> 
> [0] https://github.com/flipperdevices/flipper-linux-kernel

Great! Also worked for me.

Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi

