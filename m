Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783027;
	b=2m2bhUdQjhdZD7oya9ntpDRuHBEvyItCq/ZjBhRyA+Emw4jX0nncwEWc3zpZlLsburnU
	 0Nte6VLfspw6qY5pWyNz7DqhP8ggV/PzFkzySvEQ2ZjspeREXkCM57c9GDy80jRPHVV0j
	 lO9UYwTygGGFKv3gpU/+1IPE3meinXBKbvN0V2MH7jSxK6E1xaavbTvDfsU4s4j5mR31o
	 GeOrASkOEVhXlZa5FOxAJn0+ATrcBzB3EusmteiW941izC+WUh87Vc1WSRan4Hdy4qmgm
	 l8haZCAE+chxMWHh3lIVTHfaZc+xOUJi4P+2rjj5cCGcacFxsJ5wZ4U6TknYbIoSOGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783027;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ksRWuMcj99lLkvQj7i4Jn/e3Z3EiUDivwf0jx2LZQiM=;
	b=1xxAHbmaS6hbzO176HYICx21S8RnhechHlXcXF6cnGGfT58bGYcXEwXC7hqRWEoEIlBo
	 5dtIu6GU4LeaoQdgfqq5kUKuWEfxFHSEsOPETg48yLYYBAuH60rHL3ef6Uru6500ImuLf
	 N/6zWOSEK5asc1dqD2o5QBGkJPZ8bTb5v/97xjvXAexpqrD6GoDq0x872wScpcVYeQIos
	 +vIQtbxlg8s9jRN8Z+GF57SkO5+sFTaiomWJD96DRc6JkFXMMiDgFbggFBgf/Iba+iA9k
	 vJQCi0DmVfLhPwTsR/D6SpYqBuKmQZRykx8YWsB1dHBGhl/IwsZWOKdc7+MxJZqEApg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892C0606A329;
	Wed,  4 Nov 2026 09:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892C0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMB2vqTt9OpqHpxvAQ--.33788S2;
	Wed, 04 Nov 2026 17:03:41 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wD34Dbm9OpqqzUaAA--.19485S2;
	Wed, 04 Nov 2026 17:03:37 +0800 (CST)
Message-ID: <fcabf691-cca4-477d-b387-e50467a41408@hust.edu.cn>
Date: Wed, 4 Nov 2026 17:03:34 +0800
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
Subject: Re: [PATCH v4] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: jiamingouyang13@gmail.com, alexs@kernel.org, si.yanteng@linux.dev,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028072643.32250-1-jiamingouyang13@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261028072643.32250-1-jiamingouyang13@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMB2vqTt9OpqHpxvAQ--.33788S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGr1rCFyfuFyDCr17Xw18Zrb_yoWrCF15pF
	s7KrWfGF45Jr1jyr1xGr1UtF18AF1xKa17G39rGwn5JrZ2ya40vrnrtFW3KrWxWryI9ayj
	qFnY9FyrCa42y3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/28/26 3:26 PM, jiamingouyang13@gmail.com wrote:
> From: Jiaming Ouyang <jiamingouyang13@gmail.com>
>
> Translate Documentation/usb/ohci.rst into Chinese Simplified.
>
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.

Please refer to our how-to.rst about how to write a commit message for 
translation update.

>
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
> ---
>
> Changes in v4:
> - Replaced spelling problem.
> - In your cited discussion [1](https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/), I still would like to keep ':翻译:' line.
That patchset is still in discussion. You can follow our current 
translation convention. However, please keep all your changelog in the 
patch.
> ---
>   .../translations/zh_CN/usb/index.rst          |  2 +-
>   Documentation/translations/zh_CN/usb/ohci.rst | 38 +++++++++++++++++++
>   2 files changed, 39 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst
>
> diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
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
> diff --git a/Documentation/translations/zh_CN/usb/ohci.rst b/Documentation/translations/zh_CN/usb/ohci.rst
> new file mode 100644
> index 000000000000..5f2bc7b41f29
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/ohci.rst
> @@ -0,0 +1,38 @@
> +.. SPDX-License-Identifier: GPL-2.0
Please add the zh_CN disclaimer.
> +
> +:Original: Documentation/usb/ohci.rst
> +
> +:翻译: 欧阳家铭 Jiaming Ouyang <jiamingouyang13@gmail.com>
> +
> +========
> +OHCI驱动
> +========
> +
> +2002年8月23日
> +
> +“OHCI-HCD”驱动程序是一个USB主机控制器程序（HCD），它源自2.4内核系列中的“usb-ohci”
> +驱动程序。“usb-ohci”代码主要由 Roman Weissgaerber <weissg@vienna.at>编写但也获
> +得了来自David Brownell <dbrownell@users.sourceforge.net>，Linus Torvalds
> +和Gregory P. Smith的支持。

The above seems not the correct translation for the original English.


|The "usb-ohci" code was written primarily by Roman Weissgaerber 
<weissg@vienna.at> but with contributions from many others (read its 
copyright/licencing header). |

> +
> +它支持“开放主机控制器接口”（OHCI），该接口标准化了用于与USB 1.1主机控制器通信的
> +硬件寄存器协议。“与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多智能功能

One more “ before 与英特尔

> +注入到硬件中。除英特尔和威盛之外的其他供应商的USB1.1控制器通常使用OHCI。
> +
> +自2.4内核以来的更改包括
> +
> +         - 提高了健壮性; 修复了错误; 减少了开销
> +         - 支持更新和简化的usbcore API
> +         - 中断传输可以更大，并且可以排队
> +         - 通过使用上层“hcd”框架，减少代码量
> +         - 支持一些非PCI的OHCI实现
> +         - ... 以及更多
> +
> +“OHCI-hcd”驱动程序处理所有USB 1.1传输类型。所有类型的传输都可以排队。在“usb-ohci”
> +中也是如此，但中断传输除外。以前，使用一帧的周期会因为IRQ处理的开销而导致数据丢
> +失的风险。当中断传输排队时，可以通过确保硬件在操作系统处理相关IRQ时始终有传输需要
> +处理，来最大限度的降低这些风险。
> +
> +- David Brownell
> +  <dbrownell@users.sourceforge.net>
> +

Finally, you have an extra blank line at EOF.

Dongliang Mu

