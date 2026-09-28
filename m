Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D26B4718CA;
	Mon, 28 Sep 2026 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585393; cv=none; b=p+FJG0L+RS7UbiOeUZTuRE8++zEJk0Mt9cTQirUra1EMPFlJJTG3hoBJzIQDpb7YSw7LJRtRvtlFE7tlwUKl+twbhYi2IoMNPzaUerSGpC/bZbJjKkPI+nvbTlpoCWvz8uMmjZ1ueDm28a7Mj9YcP9tidta3GfxgzrZKxg2RgGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585393; c=relaxed/simple;
	bh=sfU9xfBqBBCfykhWV9qEEK+snN8E0IDitn9WMcyitak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSdlAQxCWrn9hQuQn8vwJoe/Tv58CP6Lyb/1nhwc87o8CZ9xAYPKpIKvZv48LoUG0q7P2w3mwPOt3WqlWq1IvpJFUGC6vY/HVzgMHXtOhAu2x07Wq+YCdHk6+mlnL6YDBoSc1lkuFsBPZ2nq5wm+uBKn4Hm/dnvIAG09z+cN+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDWHaQiKrpq0BNIAA--.36226S2;
	Mon, 28 Sep 2026 16:49:38 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wD3_+ceKrpqVs9IAA--.14044S2;
	Mon, 28 Sep 2026 16:49:37 +0800 (CST)
Message-ID: <d773f5ff-316d-4d49-b8ae-acac278fa5ca@hust.edu.cn>
Date: Mon, 28 Sep 2026 16:49:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: Jiaming Ouyang <jiamingouyang13@gmail.com>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, alexs@kernel.org,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, Weijie Yuan <wy@wyuan.org>, corbet@lwn.net,
 skhan@linuxfoundation.org, si.yanteng@linux.dev, baikefan@leap-io-kernel.com
References: <CAMnqnYzG3EKaUr82NDuY4FG8ocFKj4Ccsqw0o3dmULbf+qM7sA@mail.gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <CAMnqnYzG3EKaUr82NDuY4FG8ocFKj4Ccsqw0o3dmULbf+qM7sA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMDWHaQiKrpq0BNIAA--.36226S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1kWFy3Gw47GFW7KF45KFg_yoW5CF48pF
	Z7KFyfGrs5Ar10yFn7Cr1UtF1kAF1xK3W7J34DJ3Z5JrZ7Ja4IvrnFyFWagrWxWry8Cay2
	v3Z8KFyfCa42y3DanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQCb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUsqjgDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 9/28/26 4:44 PM, Jiaming Ouyang wrote:
> [PATCH v2] docs/zh_CN: add Chinese translation for usb/ohci.rst
>
> Translate Documentation/usb/ohci.rst into Chinese Simplified.
>
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.


You mistakenly move the subject into the commit message, please resend 
your v2 patch.

Dongliang Mu


>
> ---
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
>
> ---
> Changes in v2:
> - Correct the date
> - Correct the layout
> - Add specific details for it's contributors
> ---
>   Documentation/translations/zh_CN/usb/ohci.rst | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst
>
> diff --git a/Documentation/translations/zh_CN/usb/ohci.rst
> b/Documentation/translations/zh_CN/usb/ohci.rst
> new file mode 100644
> index 000000000000..5e36831bf370
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
> +硬件寄存器协议。“与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多只能功能
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

