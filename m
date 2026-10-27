Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107841;
	b=U6e7F+FcGOY2//hciDexgqmMKswTRQIYMPi0a4/nBzzHQCqMWRMR4+AgeKqaQzBH7HOX
	 AQB7er8UyxopmgTCYc3meUoiY0XI/2HVDDYoVCNgpiotzgicDDY3GTdeSjgSd5crRvvIr
	 vDvYT41wp3uBy8wyulapvaJ9oPIKjAt+x3OjDF2mZOVsIVJa0w+DpbiBNpV+AxAKMgWy5
	 b881tgblpYEaxP9GZMtnURflHMimky92qX3mXLIhoejo3Q6xo5ufeNE7V0E+eBCqBWBEr
	 srjcXwNSL1CxOY+Ed/8qA9cKjLjVPL02O2qqYLBiee/UNRiQueRY9b/AceKhdtwUAEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107841;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=XKTc+ofWmOdE64HBz/HH2I+0gEqfs1LWZudIfmFSHQM=;
	b=UuDfu74dxLjpcvbvbwiydcNp0BWzLIHiNXsESKbKPHuoXNvfuECeQAykPydCbnVpnZP0
	 S4CDUtVtLLobwUmF6YS6w/5kBrqXE4iUwWdzKHdKGyXbyZBBW29FxHXyfyhzlxLqV4puA
	 2q7M5g+tN+421mHXlxl12YTJjjuQC9XZFnkPa47IKGNgKOrohvT4GP3EADb4DeHkuqyHf
	 TJ9ecg5XqRO+YszwsFHbgg9NZixWQwN+4gchCXpeMc4/PH8IuQExqTEHLYdRcC0RLU/7B
	 dcvEXS+NISKi4ckEeuTTCBmKz3EkY33Cg0lvAk906r8s7xm9XLiHwzNdwzdoGIGw53Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D009C606A31F;
	Tue, 27 Oct 2026 13:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D009C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMD2PaR2p+BqyGo7AQ--.16111S2;
	Tue, 27 Oct 2026 21:30:30 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnqyxyp+BqXhgUAA--.39086S2;
	Tue, 27 Oct 2026 21:30:29 +0800 (CST)
Message-ID: <c2c3e283-7d38-4924-ba57-d95de2061b86@hust.edu.cn>
Date: Tue, 27 Oct 2026 21:30:26 +0800
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
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: jiamingouyang13@gmail.com, alexs@kernel.org, si.yanteng@linux.dev,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027132140.16295-1-jiamingouyang13@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261027132140.16295-1-jiamingouyang13@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMD2PaR2p+BqyGo7AQ--.16111S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWfGF4Utw1DGw4xAF1xuFg_yoWrJw1UpF
	s7KrWfGa1fAr1jyr1kGr1UtF18AF1xKa17G3yDJwn5JrZ7Ja40vrnrtFW3KrWxWryI9ayj
	qFnY9FyrCa42y3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/27/26 9:21 PM, jiamingouyang13@gmail.com wrote:
> From: Jiaming Ouyang <jiamingouyang13@gmail.com>
>
> Translate Documentation/usb/ohci.rst into Chinese Simplified.
>
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
Your subject is incorrect, please use [PATCH v4].
>
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
> ---
>
> Changes in v4:
> - Replaced spelling problem.
> - In your cited discussion [1](https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/), I still would like to keep ':翻译:' line.
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
> +
> +它支持“开放主机控制器接口”（OHCI），该接口标准化了用于与USB 1.1主机控制器通信的
> +硬件寄存器协议。“与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多智能功能
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

