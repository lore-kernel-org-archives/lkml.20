Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3CE44065E;
	Fri, 25 Sep 2026 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.101.248.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339610; cv=none; b=uro1wFTVb3F3Le0Y1yCUZvavAkufmElnx4pgAJ+b4jppM7P3tyO0QExe7RIqs419fSHh6JTdY4CqagsTQJHfEa2q/8xofboa7e7hUEy3gY0jqu7ObrbUEW6fp5uPFqopZaKRELXWeOiWDWzQH70JRwfTS9vZtpDIHHCPiIYtI60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339610; c=relaxed/simple;
	bh=X4/O+AJm17rChMycOscXIFnqLU3slbWX0N5lM+BZH64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lljtv2Qns8o0yKpbjyXZknzZtDgdxMp9QAPf/c5RqpxEO5G6TBoOA2bTSPMn2xDzr517f5jztZeMtBlTISyoXmMAQj1TGlsxGX45wiNVt9OydNh1b7W9WbyJmhRsFCg5bXsPhvKP3hQetElfZIVRfN4yZgKml+radKJwy5RoFxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=46.101.248.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBWnqQLarZq2L03AA--.52358S2;
	Fri, 25 Sep 2026 20:33:15 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBHmg0HarZqCUA_AA--.8334S2;
	Fri, 25 Sep 2026 20:33:13 +0800 (CST)
Message-ID: <cfc9cb8d-d13a-4dd6-809c-1ecf3bc9c758@hust.edu.cn>
Date: Fri, 25 Sep 2026 20:33:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
To: Jiaming Ouyang <jiamingouyang13@gmail.com>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, alexs@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, si.yanteng@linux.dev, rdunlap@infradead.org,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <CAMnqnYyO98AEDOHfm32Cb4uGBDucLiZ8gKZ5S+jVf3DDCoFA5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMBWnqQLarZq2L03AA--.52358S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1kWFy3XryrKFW5uFy7GFg_yoWrJw4rpF
	Z7KryxKF4fJr1jyryxGr1UKr18A3WIga17K3srJ3Z5JrZ7Ja40vrnrtrW2grWIgrWxuay2
	qFsYgFyrC3W2kw7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQCb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 9/25/26 6:57 PM, Jiaming Ouyang wrote:
> Subject: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
>
> Translate Documentation/usb/ohci.rst into Chinese Simplified.
>
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.

The git apply --check failed in my local workspace. And there are some 
translation issues below.

Dongliang Mu

> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
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
> index 000000000000..8469f5659f8d
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/usb/ohci.rst
> @@ -0,0 +1,37 @@
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
> +2026年9月7日
Do not modify the date - "23-Aug-2002"
> +
> +“OHCI-HCD”驱动程序是一个USB主机控制器程序（HCD），它源自2.4内核系列中的“usb-oh
> +ci”驱动程序。“usb-ohci”代码主要由 Romen Weissgaerber <weissg@vienna.at>编写

Do not separate usb-ohci into two lines.

Romen -> Roman

> +但也获得了许多其他人的贡献（请阅读其版权）。

read its copyright/licencing header

Re-translate this part.

> +
> +它支持“开放主机控制器接口”（OHCI），该接口标准化了用于与USB 1.1主机控制器通信的
> +硬件寄存器协议。“与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多只能功能
只能功能？
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
> +“OHCI-hcd”驱动程序处理所有USB 1.1传输类型。所有类型的传输都可以排队。在“usb-ohc
> +i”中也是如此，但中断传输除外。以前，使用一帧的周期会因为IRQ处理的开销而导致数据丢
Do not separate usb-ohci into two lines.
> +失的风险。当中断传输排队时，可以通过确保硬件在操作系统处理相关IRQ时始终有传输需要
> +处理，来最大限度的降低这些风险。
> +
> +- David Brownell
> +  <dbrownell@users.sourceforge.net>
> +

