Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276531;
	b=T1pHYoZPh+1vIRP9zoFMEQFEfdR53avwCXXVlM2no71PX5d6D8A85DN6Iul91XhUIT8o
	 xKV8H6kZkggvtWxMJPqDAOq6mY+gfKwv+AIpDUEscYbdg8UGFum9VZUJ4/9WE+5gwu2El
	 xlOuGov/T24BzzQQtSDGvtRK+tX7Rv9Prx3Eyh2b8sbCXy2fkhOJUV14bturptJH3iHQB
	 GPcjQ9dSefe+oa78feMEhqM7zkgNUtg8s7umW9oqq0mqTnZKPmbq+zPuOYYEDg6XF5jU5
	 Kr4Tgi4N2vParE69r4z7Oj+fFA2t4OQuNtEvKz8h4BclrRSvmgrCBab9trLfsJWQ7UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276531;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=GKIy7W9V1DOhRGum57t2Y4YFkP9DEDYp7ywnEyxOco0=;
	b=4C26UTuL/s21OESQn3z6KoxdcmGR5G9txTh9agZj4pGF2wKqcW4khkUbVqydz2wNB+hs
	 tuthvFL/NR8vgaq1NUEtQWCs4bElvit2LMlpn/YhbnsAJu5LSKv8t2BNCO3wJM+yp1UuA
	 /Fp/XanpD3TjFFpZtKd8StqlQq6UBNcMYdW8+ETajeTgj1JOli6nlojifArNzH+vGKbhB
	 en/FL7b7tS+jqv6vJwGXS/omRmG44swmUBHMfRQZj2nD7/JIjb/rVoS5QhHzJAE4DRsI2
	 gAgmkAjwx5j6w5Zbbhwrf3sS7OUg7IcN4OBRt3KuREiIsd0ZjA7zonMUMhxpfszwa7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=G2mrV4dP;
	arc=none smtp.remote-ip=160.236.53.20
Received: from mail-m1602365320.xmail.ntesmail.com (mail-m1602365320.xmail.ntesmail.com [160.236.53.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD2A606A31C;
	Tue, 10 Nov 2026 02:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD2A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=G2mrV4dP
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54157f5aa;
	Tue, 10 Nov 2026 10:08:36 +0800 (GMT+08:00)
Message-ID: <38fdf732-ffa1-45d4-a436-08d542ed2528@rock-chips.com>
Date: Tue, 10 Nov 2026 10:08:32 +0800
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
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <avDN3pPY5Qwt9B1p@venus>
 <b60b7079-b7b6-4d83-8167-2e4fc6021aae@rock-chips.com>
 <5573124.44csPzL39Z@diego> <avIEPncVnojQBqpX@venus>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <avIEPncVnojQBqpX@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c336e29503a7kunm8423815768d9d5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUJNVh5LHx0fGElJS0pCSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=G2mrV4dPhT6SK9ihMPCZt3ZO8snXTozKw2nqL0KEWGC2zddBvJ6jGFGTlBWaeC4v4sNv+DGIOnQilbo5xBHitNVv458i2OLeD7v19yFAjUViMd8hdkAa8dKChvg5wbPQ8tam9+EBf3gI8zeK4zSjx5CzBalS4O7YWjVm8dvMnaY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GKIy7W9V1DOhRGum57t2Y4YFkP9DEDYp7ywnEyxOco0=;
	h=date:mime-version:subject:message-id:from;

On 11/10/2026 1:51 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Nov 09, 2026 at 02:26:44PM +0100, Heiko Stübner wrote:
>> Am Montag, 9. November 2026, 02:31:35 Mitteleuropäische Normalzeit schrieb Chaoyi Chen:
>>> Hi Sebastian,
>>> On 11/9/2026 3:42 AM, Sebastian Reichel wrote:
>>>> Hello Chaoyi,
>>>>
>>>> On Sun, Nov 08, 2026 at 11:15:09AM +0800, Chaoyi Chen wrote:
>>>>> Hi Sebastian,
>>>>>
>>>>> On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
>>>>>> The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
>>>>>> combination. It contains a Wanchanglong W552793BAA panel and a
>>>>>> Goodix GT1158 touchscreen. This adds the DT description of it.
>>>>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++++++++++++
>>>>>>  1 file changed, 90 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>>>>> index 6a95a8bb6fb8..327ca13b60f0 100644
>>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>>>>> @@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
>>>>>>  		regulator-max-microvolt = <12000000>;
>>>>>>  	};
>>>>>>  
>>>>>
>>>>> I seem unable to apply the patch to the latest linux-next tree.
>>>>>
>>>>> So I tried to resolve the conflict manually, but the actual
>>>>> test screen did not display. I will look into this further.
>>>>
>>>> Strange. The base of this series was Heiko's for-next tree from
>>>> Friday. No RK3588 EVB1 patches landed since then:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=for-next&id=cabb6811c38a46337d5f4252b4dc390f9296856c
>>>>
>>>> If your board uses the original Rockchip bootloader, which shows a
>>>> Rockchip logo on the panel, you also need Cristian's latest YUV420
>>>> patches that reset VOP2 at probe time avoiding some issues with the
>>>> pre-initialized panel as a side effect. Those were recently applied
>>>> by Heiko to the DRM tree, so testing on linux-next is indeed
>>>> sensible.
>>>>
>>>
>>> Hmm, the newest linux-next tag which I used is next-20261105, and Heiko's 
>>> tree last updated date is1106. I'll give it a try on Heiko's tree.
>>>
>>> And I'm using mainline U-Boot, which obtained from the latest nightly build:
>>> https://gitlab.collabora.com/hardware-enablement/rockchip-3588/debian-image-recipes.
>>>
>>> The backlight working correctly, and the DCS command has been sent, but nothing display.
>>> Perhaps I should look elsewhere.
>>
>> I would assume it could be the SPLL (again).
>>
>> I.e. a recent u-boot change broke the SPL-based forced clock init and Jonas
>> fixed that in [0]. Had the black display again recently too.
>>
>> And it seems it hasn't been merged yet.
> 
> Sounds reasonable. FWIW I only tested with the pre-flashed Rockchip
> U-Boot (as described above). I intentionally keep that on my RK3588
> EVB1, so that I can test RK3588 with vendor TF-A/U-Boot and upstream
> or downstream kernel. All my other boards run upstream TF-A/U-Boot.
> 

That's right. It looks like we've tripped up on SPLL again. :)

The upstream TF-A/U-Boot with that patch makes the panel work. But there
is slight jitter in the displayed content.. I'll look into this further.

Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi
