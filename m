Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6942D4457B4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771896; cv=none; b=WdQfY6TorgD82LXSKdC8pNr8+Cl75ehqufKkcSrb7L/YfZqblalpP5Tn2hYCdR1c+27goaOpzQcdBs2LK0XkjqXnM41xRFtxbGKZ0oGw+1yvFsl/yp2IKHzqa7AsVwQU926JGpRc8kKnylDkaTQNSYp7Pb4Ss6jF9X9Sqe9ehC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771896; c=relaxed/simple;
	bh=qMWt9ZcK3Ze48qWu3Ny+Z8vpdRItcwPxSUfRyziT+dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQTD6cVF/Xdu8qeGyi6nGJLOLtwHTaf2Q/ff3+tF3iE1+JlXMwTggagM61Gwo79/CnAyoNitbEjZvlRgtP7U6LHCkbvnqQELXoI8U5qC3Jr9WaAsADgWz9EnPus/jZVNx7w2Od+OLrGECrT1xiIfyhP0edJ+TnuFJguwDWUh3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6nvkhJ/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6nvkhJ/"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-853c07a76adso3154250b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788771895; x=1789376695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSpcTkwgbJe/vqTqOVrLFxrEgNNsqgW+udaGlXkLD00=;
        b=h6nvkhJ/GNvXgyKulbf+ozWaCgV2UbSu7hXKsVJw0s1gdLft9N7auTP2OOoaJDCY2d
         fNN2vx5bjNfJrSY/zb/4sh9bi9E/0BBEEfIrCwWCypuOL+3peexGUMrwkPlO3N88A/w5
         15MhgnG7etiqOteUlVkCHma2Dj7J9EDyhiLxQ2mSGk5cvzBfnv9Rtdf5pBXVGoNhk6Qv
         j5QznwF/qAbTQRTKz0iEjkuC3Qc9VDoqzC86alJFy7RYUK/5JPoAW5Pq/BnpR0A67y98
         BUrUg6pcl4JiqqqkkHrAkVS+m+6Xq3wWtqeWcjosyu/UsFMIhEeHip1IASvct20gVTBP
         KV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771895; x=1789376695;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSpcTkwgbJe/vqTqOVrLFxrEgNNsqgW+udaGlXkLD00=;
        b=VYGcfd3mVNv1Y/g2r1Pj+eb3F26E34QXhkjWz6edXHIT9oOB28ES8hD5g+AdYxG7AS
         hMczSKhFG+am8EV7q+oQEqZzTxqth+On2kY+aoVGy+G/NTgZsyOd8Pwy7ehMBVDrZt7S
         5vDqKuQ6j11ZqNMPfFMIwEQnC17b+kMlwi3E11Dm3zl78MKq/AcI9gm0LslKTjdhzFMn
         F6sfH9LqTfynfzGB/u1GiEv7x+yHLalXXyYUn1MfdkMNgHIoSNjv1z/YBUMx6/OoNS7p
         vQtjS3UqTmFc33yRXGnL1z+D1y9vfmBAwL+Xg45jm+CTBp9y8SYmwhReLs88jrI1GthA
         HN2w==
X-Forwarded-Encrypted: i=1; AKwUvBxTMja+I0f1ItqLdIGMLa5+EqRc+tJ8t2FX98zkLS9mZ/eovxe/EQ0KfrMrssqRIkJBEyJuUs/NhfhkpZM=@vger.kernel.org
X-Gm-Message-State: AFuF++msbZHutB1ILxXQhqVkgq4y3sKkgeq7bP5rRpuP62nZsuOSVrMv
	Va51yjYBnQDc6ZhkibNCfle227E8dHXx+nsK25cPDk9qhtf97iRnKi1l
X-Gm-Gg: AYBFou2Fqw1M2VCuMcKYTzpgJLyNALQMQ0n6smimnEzQBhkovEbC2XivrZ20S8LYeZ0
	j5E09rVNCAEV6uFTR9z7j/9+rfarTAFWIHTeLYnu9TC+wUDSKc+USgxWMwbL+AqDoVmxdVaaxs2
	aBMjh/cjw26ww9Oqh+e1Cw2DQgVOtaYKynQXVIogqeia/7Hd2RaNrJsy+mvLbKtX4qyaFi8lfV9
	lnDxTNU/ph9AmoSKMhF6w3Xd/zL2zbEbCfSRqP8l9mZKCwa9/IE47DboiKJEx50+/v6yuJ6pKKK
	Yybba0PhWjPMSgNKqWVnUqyKZOzs4jMkE1537UxQbvPCZ6z1+TedMp9G3ir97OnUUidOorHM6YE
	68RPEDNn42svb+vOZ111Wn2CaetBI47dTPd9TbvgsVnbsbJ+otG7fUUoBnzG9Ni0DcR82XxLbV9
	qQRf7yaRqGaHx1kyF52mm0PoQv/1vs6qLLCteeBebnC99TM0iZD+gmFMN1FVK270Emd+PsmgFo2
	1LqJN6x2i2Vhws=
X-Received: by 2002:a05:6a00:a8f:b0:85b:cf16:597 with SMTP id d2e1a72fcca58-86168d827bfmr29284004b3a.19.1788771887379;
        Mon, 07 Sep 2026 02:04:47 -0700 (PDT)
Received: from [192.168.2.166] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152d2ff5bsm3947594b3a.35.2026.09.07.02.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:04:46 -0700 (PDT)
Message-ID: <eb05f56b-5443-4554-9296-cc3fb07b096a@gmail.com>
Date: Mon, 7 Sep 2026 17:04:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add usb/ohci translation
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: linux-doc@vger.kernel.org, "corbet@lwn.net" <corbet@lwn.net>,
 alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
 linux-kernel@vger.kernel.org
References: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
 <df3d1c27-2de5-4e63-8a4d-6119d19a358f@gmail.com>
 <CAMnqnYxarwJ1MaW-HX-bJmPvok+xugn7V0-u2cGp+FeXPz69rA@mail.gmail.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <CAMnqnYxarwJ1MaW-HX-bJmPvok+xugn7V0-u2cGp+FeXPz69rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

It's better to resend as a new version. And please check again
1, your alignment for each of lines.
2, rebase on the latest Chinese-doc tree.

Thanks!

On 2026/9/7 16:50, Jiaming Ouyang wrote:
> Subject: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
> 
> Translate Documentation/usb/ohci.rst into Chinese Simplified.
> 
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
> 
> Signed-off-by: Jiaming Ouyang<jiamingouyang13@gmail.com>
> ---
> I have modified according to your feedback.
> 
>   .../translations/zh_CN/usb/index.rst          |  2 +-
>   Documentation/translations/zh_CN/usb/ohci.rst | 37 +++++++++++++++++++
>   2 files changed, 38 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst
> 
> diff --git a/Documentation/translations/zh_CN/usb/index.rst
> b/Documentation/translations/zh_CN/usb/index.rst
> index df99814c6497..c96eacf13e11 100644
> --- a/Documentation/translations/zh_CN/usb/index.rst
> +++ b/Documentation/translations/zh_CN/usb/index.rst
> @@ -32,6 +32,7 @@ USB 支持
>       chipidea
>       dwc3
>       ehci
> +    ohci
>       usbmon
> 
>   待翻译文档：
> @@ -49,7 +50,6 @@ USB 支持
>   * mass-storage
>   * misc_usbsevseg
>   * mtouchusb
> -* ohci
>   * raw-gadget
>   * usbip_protocol
>   * usb-serial
> diff --git a/Documentation/translations/zh_CN/usb/ohci.rst
> b/Documentation/translations/zh_CN/usb/ohci.rst
> new file mode 100644
> index 000000000000..1fc06f01d7e8
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/ohci.rst
> @@ -0,0 +1,37 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +:Original: Documentation/usb/ohci.rst
> +
> +:翻译: 欧阳家铭 Jiaming Ouyang<jiamingouyang13@gmail.com>
> +
> +========
> +OHCI驱动
> +========
> +
> +2026年8月29日
> +
> +“OHCI-hcd”驱动程序是一个USB主机控制器驱动程序（HCD），它源自2.4内核系列中的“usb-ohci”
> +驱动程序。“usb-ohci”代码主要由 Roman Weissgaerber<weissg@vienna.at> 编写，但也获得了
> +许多其他人的贡献（请阅读其版权）
> +。
> +
> +它支持“开放主机控制器接口”（OHCI），该接口标准化了用于与USB 1.1主机控制器通信的硬件寄
> +存器协议。与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多只能功能注入到硬件
> +中。除英特尔和威盛之外的其他供应商的USB1.1控制器通常使用OHCI。
> +
> +自2.4内核以来的更改包括
> +
> + - 提高了健壮性; 修复了错误; 减少了开销
> + - 支持更新和简化的usbcore API
> + - 中断传输可以更大，并且可以排队
> + - 通过使用上层“hcd”框架，减少代码量
> + - 支持一些非PCI的OHCI实现
> + - ... 以及更多
> +
> +“OHCI-hcd”驱动程序处理所有USB 1.1传输类型。所有类型的传输都可以排队。在“usb-ohci”中也
> +是如此，但中断传输除外。以前，使用一帧的周期会因为IRQ处理的开销而导致数据丢失的风险。
> +当中断传输排队时，可以通过确保硬件在操作系统处理相关IRQ时始终有传输需要处理，来最大限
> +度的降低这些风险
> +
> +- David Brownell
> +<dbrownell@users.sourceforge.net>
> -- 2.53.0 On Mon, Sep 7, 2026 at 4:37 AM Alex Shi <seakeel@gmail.com> 
> wrote:
>>
>>
>> On 2026/8/30 02:48, Jiaming Ouyang wrote:
>>>   From 395948212144549e20cfcdbd053817c4e068da35 Mon Sep 17 00:00:00 2001
>>> From: Jiaming Ouyang<jiamingouyang13@gmail.com>
>>> Date: Sat, 29 Aug 2026 20:35:37 +0200
>>> Subject: [PATCH] docs/zh_CN: add usb/ohci translation
>>>
>>> Signed-off-by: Jiaming Ouyang<jiamingouyang13@gmail.com>
>>> ---
>>>    .../translations/zh_CN/usb/index.rst          |  2 +-
>>>    Documentation/translations/zh_CN/usb/ohci.rst | 37 +++++++++++++++++++
>>>    2 files changed, 38 insertions(+), 1 deletion(-)
>>>    create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst
>>>
>>> diff --git a/Documentation/translations/zh_CN/usb/index.rst
>>> b/Documentation/translations/zh_CN/usb/index.rst
>>> index df99814c6497..c96eacf13e11 100644
>>> --- a/Documentation/translations/zh_CN/usb/index.rst
>>> +++ b/Documentation/translations/zh_CN/usb/index.rst
>>> @@ -32,6 +32,7 @@ USB 支持
>>>        chipidea
>>>        dwc3
>>>        ehci
>>> +    ohci
>>>        usbmon
>>>
>>>    待翻译文档：
>>> @@ -49,7 +50,6 @@ USB 支持
>>>    * mass-storage
>>>    * misc_usbsevseg
>>>    * mtouchusb
>>> -* ohci
>>>    * raw-gadget
>>>    * usbip_protocol
>>>    * usb-serial
>>> diff --git a/Documentation/translations/zh_CN/usb/ohci.rst
>>> b/Documentation/translations/zh_CN/usb/ohci.rst
>>> new file mode 100644
>>> index 000000000000..4387bb274071
>>> --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/usb/ohci.rst
>>> @@ -0,0 +1,37 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +:Original: Documentation/usb/ohci.rst
>>> +
>>> +:翻译: 欧阳家铭 Jiaming Ouyang<jiamingouyang13@gmail.com>
>>> +
>>> +========
>>> +OHCI驱动
>>> +========
>>> +
>>> +2026年8月29日
>>> +
>>> +“OHCI-hcd”驱动程序是一个USB主机控制器驱动程序（HCD），它源自2.4内核系列中的“usb-ohci”
>>> +驱动程序。“usb-ohci”代码主要由 Roman Weissgaerber<weissg@vienna.at> 编写，但也获得了
>>> +许多其他人的贡献（请阅读其版权）
>>> +。
>>> +
>>> +它支持“开放主机控制器接口”（OHCI），该接口标准化了用于与USB 1.1主机控制器通信的硬件寄
>>> +存器协议。与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多只能功能注入到硬件
>>> +中。除英特尔和威盛之外的其他供应商的USB1.1控制器通常使用OHCI。
>>> +
>>> +自2.4内核以来的更改包括
>>> +
>>> + - 提高了健壮性; 修复了错误; 减少了开销
>>> + - 支持更新和简化的usbcore API
>>> + - 中断传输可以更大，并且可以排队
>>> + - 通过使用上层“hcd”框架，减少代码量
>>> + - 支持一些非PCI的OHCI实现
>>> + - ... 以及更多
>>> +
>>> +“OHCI-hcd”驱动程序处理所有USB 1.1传输类型。所有类型的传输都可以排队。在“usb-ohci”中也
>>> +是如此，但中断传输除外。以前，使用一帧的周期会因为IRQ处理的开销而导致数据丢失的风险。
>>> +当中断传输排队时，可以通过确保硬件在操作系统处理相关IRQ时始终有传输需要处理，来最大限
>>> +度的降低这些风险
>>> +
>>> +- 欧阳家铭 Jiaming Ouyang
>>> +<jiamingouyang13@gmail.com>
>> This signature might mislead people into thinking you are the author.
>>
>> Please keep the original autor:
>> - David Brownell
>>     <dbrownell@users.sourceforge.net>
>>    > -- 2.53.0

