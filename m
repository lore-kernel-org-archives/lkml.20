Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187910;
	b=qEa9yLjmqZBDGjmoFiEunDZpxd/1jNAv/5wQcAtKqc4UNfzacrvZHknbzuVrw2sDk3KT
	 eEZP8414DsnTrDlUeK1aip3eJ9F5K2zYHmbppZequfJNZGVZcccpmnHc96mXw7+eiLWUN
	 F5uDsIuBUOc7KXWBZT2j6g+otLALGqaOkN32QqnpfH2GjQxuJ/QfIjybXC4Bjzi6k7xV3
	 hyKSrMQ0v9dc3KRfo8l9/YKqkRbixhRq01Wze0VhXzphgL3mxiUUWOax3Y9yGiUSFm8F4
	 QqPZEs84JdWqr4hX7Grmis0yDYKXVFm1C3uZHT3iOgyp4Wa9tLw8mXISVkm+RfjE/Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187910;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=Kz1mIgE72+hP3r+p69xSMSWxQatJCU8VHnFXsjFvnWQ=;
	b=4q2yjUZeRVEkEUdbBq9yVhpPxv19w2Aq1lGl22vRTIlw7LfoWNB6uBRFf1AlU2L/zu7B
	 Rnlhcy5ecrjc7ZPYnxyD9NG/hagWzGeN1XkgXBMLPEcc8p12wIND87bQTxYh6fLOYYcz9
	 T7wALAJ8CqKd0XyFiDDt0+Opoj/ulQNAO3jbjfBT6ca6jNVnKQfkSmfXPyYtRMb5La81U
	 4e8yjsRfEc7REHr4o3ztWo2mkZyROrX5ljpiPwhXGqvEkNr3Ce/JSvLFYWzIFiExdgmHt
	 k2K2FIf1bDWP+cwMP8gTzEzysxaDI/Pq8riht8RQ8ct4JrOxqDxzSOLd8KTXssTPRcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=IUfk9EUC;
	arc=none smtp.remote-ip=210.79.60.68
Received: from mail-m6068.netease.com (mail-m6068.netease.com [210.79.60.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8002D606A322;
	Mon,  9 Nov 2026 01:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8002D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=IUfk9EUC
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53ed4167e;
	Mon, 9 Nov 2026 09:31:37 +0800 (GMT+08:00)
Message-ID: <b60b7079-b7b6-4d83-8167-2e4fc6021aae@rock-chips.com>
Date: Mon, 9 Nov 2026 09:31:35 +0800
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
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
 <f066ac3f-1720-479b-a2e9-198a96d03dd6@rock-chips.com>
 <avDN3pPY5Qwt9B1p@venus>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <avDN3pPY5Qwt9B1p@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1bdeeaabf03a7kunmf2d328634ebabd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCS01LVkIdQxkYTx9OGUhLGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=IUfk9EUC04Ij1avNZ2iP9izXA0sNWFMrwytbuHpkYydV2jEY0bB4dnCsK6Ae76E+cfDOLuAhvaP031e0C1PFsLLcbpYIZAvS9TNh63dXnqVYunA8iQdVUK8SUyrJiWIdApiYxOpIyR9N7ETyffilKiKJruYaXFyO7fPwPdoW2II=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Kz1mIgE72+hP3r+p69xSMSWxQatJCU8VHnFXsjFvnWQ=;
	h=date:mime-version:subject:message-id:from;

Hi Sebastian,
On 11/9/2026 3:42 AM, Sebastian Reichel wrote:
> Hello Chaoyi,
> 
> On Sun, Nov 08, 2026 at 11:15:09AM +0800, Chaoyi Chen wrote:
>> Hi Sebastian,
>>
>> On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
>>> The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
>>> combination. It contains a Wanchanglong W552793BAA panel and a
>>> Goodix GT1158 touchscreen. This adds the DT description of it.
>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++++++++++++
>>>  1 file changed, 90 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>> index 6a95a8bb6fb8..327ca13b60f0 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
>>> @@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
>>>  		regulator-max-microvolt = <12000000>;
>>>  	};
>>>  
>>
>> I seem unable to apply the patch to the latest linux-next tree.
>>
>> So I tried to resolve the conflict manually, but the actual
>> test screen did not display. I will look into this further.
> 
> Strange. The base of this series was Heiko's for-next tree from
> Friday. No RK3588 EVB1 patches landed since then:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=for-next&id=cabb6811c38a46337d5f4252b4dc390f9296856c
> 
> If your board uses the original Rockchip bootloader, which shows a
> Rockchip logo on the panel, you also need Cristian's latest YUV420
> patches that reset VOP2 at probe time avoiding some issues with the
> pre-initialized panel as a side effect. Those were recently applied
> by Heiko to the DRM tree, so testing on linux-next is indeed
> sensible.
> 

Hmm, the newest linux-next tag which I used is next-20261105, and Heiko's 
tree last updated date is1106. I'll give it a try on Heiko's tree.

And I'm using mainline U-Boot, which obtained from the latest nightly build:
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/debian-image-recipes.

The backlight working correctly, and the DCS command has been sent, but nothing display.
Perhaps I should look elsewhere.

> Greetings,
> 
> -- Sebastian

-- 
Best, 
Chaoyi

