Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7F83ED3CC;
	Mon,  7 Sep 2026 03:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752013; cv=none; b=s3eFaytN1rTv39vwkTPSQmqTle1J3BKP9dRDA5Qn4ZlGEK17jA1n+qcwcNNivPk+z0czhLHHyE+Xno8PNprXx/HKRnW78zuT8G+CQFrRQAyUxmoUPliGDdRcbtp3G5NkMlbxhDT1IMK/Us5RxU+n9w1lz9GXQhC9cGfnc5fJ61Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752013; c=relaxed/simple;
	bh=SmTH2jyJw4B8f4xxR5Ho1dlGUfp9A/4jU1oWLQZ7bvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qGP2V+t9VphV3qxR5CK1hg/D7B+wCHKmEdKtbQgH9TkZrOzZpq3z5evQvInnl2WKwpGc7/9Np+sPrt+xc9bv8txwPIaGfi7ROnNAtgC3PASoyEuCTcW0SJjEu2jl4stmnlj14KWnvCr/GV6FIF8ja+SyoeQSy9oJ08ggfPvby9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDW_n+BMJ5qaoIGAA--.35225S2;
	Mon, 07 Sep 2026 11:33:21 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCHZNGAMJ5qZqRTAA--.21865S2;
	Mon, 07 Sep 2026 11:33:20 +0800 (CST)
Message-ID: <6599b3d0-cb6c-4706-b245-1dcfddb06547@hust.edu.cn>
Date: Mon, 7 Sep 2026 11:33:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] docs/zh_CN: Add ipv6 Chinese translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
 <20260824043806.46731-5-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260824043806.46731-5-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMDW_n+BMJ5qaoIGAA--.35225S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW8Ww45Jw1kKF13Jr4ktFb_yoW5tF4DpF
	sxKFyxJF4Iy3WUKFnrGr1UGFn8K3WxCanrCF17Z3ZYqrs5Ja92kw12kFyq9F4ftrySyFZ5
	Zr4rArW5CrWIkaDanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Ar1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	rwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRRSfO5UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/24/26 12:38 PM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/ipv6.rst into Chinese.
>
> Update the translation through commit 19093313cb04
> ("docs: networking: convert ipv6.txt to ReST")
>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   .../translations/zh_CN/networking/index.rst   |  2 +-
>   .../translations/zh_CN/networking/ipv6.rst    | 76 +++++++++++++++++++
>   2 files changed, 77 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index 4675d23a7f28..cd768d0a2837 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -22,6 +22,7 @@
>   
>      msg_zerocopy
>      driver
> +   ipv6
>      napi
>      vxlan
>      netif-msg
> @@ -89,7 +90,6 @@ Todolist:
>   *   ip_dynaddr
>   *   ipsec
>   *   ip-sysctl
> -*   ipv6
>   *   ipvlan
>   *   ipvs-sysctl
>   *   kcm
> diff --git a/Documentation/translations/zh_CN/networking/ipv6.rst b/Documentation/translations/zh_CN/networking/ipv6.rst
> new file mode 100644
> index 000000000000..3726b6fdc460
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/ipv6.rst
> @@ -0,0 +1,76 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/ipv6.rst
> +
> +:翻译:
> +
> +	陈思为 Siwei Chen <businiaoanka@anka1.top>
> +
> +====
> +IPv6
> +====
> +
> +
> +ipv6 模块的选项在加载时以参数形式提供。
> +
> +模块选项可作为 insmod 或 modprobe 命令的命令行参数给出，但通常在
> +``/etc/modules.d/*.conf`` 配置文件中，或在发行版特定的配置文件中指定。
> +
> +可用的 ipv6 模块参数如下所列。若未指定某参数，则使用其默认值。
> +
> +参数如下：
> +
> +disable
> +
> +	指定是否在加载 IPv6 模块的同时禁用其全部功能。当另一模块依赖于 IPv6
> +	模块已加载，但又不需要任何 IPv6 地址或操作时，可使用此选项。
> +
> +	可选值及其效果如下：
> +
> +	0
> +		启用 IPv6。
> +
> +		这是默认值。
> +
> +	1
> +		禁用 IPv6。
> +
> +		接口不会添加 IPv6 地址，也无法打开 IPv6 套接字。
> +
> +		需要重启才能启用 IPv6。
> +
> +autoconf
> +
> +	指定是否在所有接口上启用 IPv6 地址自动配置。当不希望根据路由器通告
> +	（Router Advertisement）中收到的前缀自动生成地址时，可使用此选项。
> +
> +	可选值及其效果如下：
> +
> +	0
> +		所有接口均禁用 IPv6 地址自动配置。
> +
> +		仅添加 IPv6 回环地址（::1）与链路本地地址。
> +
> +	1
> +		所有接口均启用 IPv6 地址自动配置。
> +
> +		这是默认值。
> +
> +disable_ipv6
> +
> +	指定是否在所有接口上禁用 IPv6。
> +	当不需要任何 IPv6 地址时，可使用此选项。
> +
> +	可选值及其效果如下：
> +
> +	0
> +		在所有接口上启用 IPv6。
> +
> +		这是默认值。
> +
> +	1
> +		在所有接口上禁用 IPv6。
> +
> +		接口不会添加 IPv6 地址。

