Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661E53914E4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788748631; cv=none; b=Id7uHinPqoVt+2lnTvMovWyMXHrJ/B1oZqOVC58nsOpbT2iNlys2za1PfYxd11VNqhZ8SjLh0AYIK5KSqPtFRsQlVg7ghQquviQT+iisNCE3VKfMVzdcQaCRXw/5Y/mNBx4iCFA83bqvkg2XsfQ2gKIeQ3am7PYPJc4+EmlqWE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788748631; c=relaxed/simple;
	bh=/41rDCM1nw9GSStjEwkdrmWbDlKXTp0E5wnfx9xyS3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gfgUza6UWVhYC+AQ311FrJsc4KFiXEPWZbQ6is1RfGZ1E784IMuoJPsdrZUUNCBlxhheqQxlI7imAlMGUpOiSk7eArIjwnbNlNagbaYRabc+JDTJQS7MHpinu++KCzb690n/rfUJv09SEXDTpTSN0P0+dyqqDG5twzwH4ITfvJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/qsS87T; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/qsS87T"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-862815e2683so1545110b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 19:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788748630; x=1789353430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Rp285JhXRQ42RLTfJjSh5Ov+iOw5sCz6dSQNp8eRXc=;
        b=N/qsS87TiVfqQ7tw08QQNA+somGYPiqOpYTy+oCvIJy0Pnw/+CNWxN3Lb/167kYzw/
         iYTK9DByyqgs3H9Roa5QxIUUBv2cssctHT92A5MG92J7BOMGdGbnfp0fpez3grD4nRQE
         mNEcIqKZ0JX6HbXAX026UOGY1u+Ykgv0crxF1NuAr/QCB7uOhg5WZAnHBzgmL0b6Ln3d
         pqOkd3HKS3W8RCChBSdZdEZSKb4hvaYpDs6lRrI2809S89bqDh98GyToYJ6yeM9oJSja
         Mpp7Dv1ylHJjngftEI2XCnY2zFLR53Jiex1jVyS6tDwsHczHohvPn6pxRINhKmzX2YKv
         6how==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788748630; x=1789353430;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Rp285JhXRQ42RLTfJjSh5Ov+iOw5sCz6dSQNp8eRXc=;
        b=i/QSkzy+d4L22zSbLBQ1RIGVVXXoHXKe2V54PI1YB25tprnc0/WAtp1TTT2xUefGPn
         1/qmbxDH+t2W5fMEO3ayvPjNEeTwqMqCX397jE8Pfxfd42y5ETnju7IPTyifWKuKScRv
         LZihrTmB/45Zq+vXUstMbZpcuMy9OfcTu+OuFZVanOQuUd5m/C+gdymzcPqpZhkDcktP
         H18CtsMH8QBMt94AfxoHzmjo+xWc7dxuQ65Pbf90ozao6nYd/B6ht/8IyOTiPMkv73r2
         GMbiKnakFo3jZjmC3kZV026JbFOQI/XPPkIIZoYkBiRmF9QzcpICalAdIvspKbhEYOUa
         vg6g==
X-Forwarded-Encrypted: i=1; AKwUvBy0YSoBvAxyYdOLPX9CUal1ohIswn5OABmB9PHyZwYHVH+HbWs14D9srMcu/pwdKzrtdDqs4Kj0xusAC4o=@vger.kernel.org
X-Gm-Message-State: AFuF++lBN/zf3iwc7DxM3yT73WeF/wMYuqGRkNZib9+aixv0voNdEyqI
	mXmH+/SzcU3/ZwmcNw1yW8oKyST7KPVUUtMszlT6PhFIlguJ1ktiDL3D
X-Gm-Gg: AYBFou3WJRet1UQkpg15FwBwwzr+/Eb5QTvVAQIHJhR3tFDXyUN95JbJuzcp+BMloDB
	ntWPjRe5OyfGtVJH5L+UDhK3mIwGkVCiGhUmFNzJfvPL5S3d3dWY5cS0yWbq83/X57wxPEftGfm
	A+xpleVcq/Y00YII2O5dXWD36R5yMkhmOgWXdpcucJnkxvmuEtUKCYPEXBqPfkyrnD84bbgZo7t
	5lOhr8OMEAvXeenVkyapWcA9tYFUGj2EBzY1M/s7hiu3RhIP7obdTMB+/EzoCvIYlY23iLn5I7Q
	/bu/PCezg3E8E4d2UUgXam/rd3xVOOWtdD0rgV0gYtHv/8RnNki+l6CijxiJUXQoMic6u5LxCMj
	hNmLVvV3x+3QYUOfdrZ10a1n/L+h2XxJYzZdwToCYihVCxpWskhHt5Q6ydsS3av2S0cUvW/KbQZ
	lAUrzoRt73xUA+T1bzDaWzajyoqnT+XU3hLrjeNDQOv7PI3YahZ0ASERbMkM0FKntDabypKyGFZ
	UdQYeMtGshnHac=
X-Received: by 2002:a05:6a00:f8c:b0:858:b809:6ec0 with SMTP id d2e1a72fcca58-86169c6c1bdmr27789266b3a.23.1788748629604;
        Sun, 06 Sep 2026 19:37:09 -0700 (PDT)
Received: from [192.168.2.166] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8628622d20dsm2614729b3a.51.2026.09.06.19.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 19:37:09 -0700 (PDT)
Message-ID: <df3d1c27-2de5-4e63-8a4d-6119d19a358f@gmail.com>
Date: Mon, 7 Sep 2026 10:37:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add usb/ohci translation
To: Jiaming Ouyang <jiamingouyang13@gmail.com>, linux-doc@vger.kernel.org
Cc: "corbet@lwn.net" <corbet@lwn.net>, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, linux-kernel@vger.kernel.org
References: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/8/30 02:48, Jiaming Ouyang wrote:
>  From 395948212144549e20cfcdbd053817c4e068da35 Mon Sep 17 00:00:00 2001
> From: Jiaming Ouyang<jiamingouyang13@gmail.com>
> Date: Sat, 29 Aug 2026 20:35:37 +0200
> Subject: [PATCH] docs/zh_CN: add usb/ohci translation
> 
> Signed-off-by: Jiaming Ouyang<jiamingouyang13@gmail.com>
> ---
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
> index 000000000000..4387bb274071
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
> +- 欧阳家铭 Jiaming Ouyang
> +<jiamingouyang13@gmail.com>

This signature might mislead people into thinking you are the author.

Please keep the original autor:
- David Brownell
   <dbrownell@users.sourceforge.net>
  > -- 2.53.0
> 

