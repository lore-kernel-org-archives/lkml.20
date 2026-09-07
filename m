Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009293E3142;
	Mon,  7 Sep 2026 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751998; cv=none; b=ZclRhYn12UuSM5RW3XjDzKeEc6OHcKe8xnMNn+SmZLRWw35bhgAcW52RWFin9mKynv52fMONnr/G3rOd7HqW1BWkLU6dx5o8BXfDH1Ov8Y5VGM+kKc76WO5AHNfO5W5gjWGm1UblEiS2UPTIIVZZmTrfpaEk14DpYOoaqocQN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751998; c=relaxed/simple;
	bh=ki5xpUASN5EnukLjRCoc3+ITxFNMQXsedt1KCF+ehPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Am6sMx/7C67czJTTZSBTai39HJR8PpvvUxW4uXQILa+XrtcHRXT7x1Lvgv/jn9ShdueWJTaVMXfTnY6TaQDoAY5Zi4unC1aOPUfm+Y7y5rWKRUJFhfqzOLU34R7kPCe1wwly6mQOpUjFLC42wJLiaTNRmmAghXrygQRwzJ0kLqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMC2frFoMJ5qEDgWAA--.49389S2;
	Mon, 07 Sep 2026 11:32:56 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDHpNFmMJ5qF6RTAA--.19739S2;
	Mon, 07 Sep 2026 11:32:54 +0800 (CST)
Message-ID: <9e520eb1-35f2-4f69-919b-2a0bfac787f2@hust.edu.cn>
Date: Mon, 7 Sep 2026 11:32:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese
 translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
 <20260824043806.46731-3-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260824043806.46731-3-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMC2frFoMJ5qEDgWAA--.49389S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW8uw4ktw13Gw1DWF4kZwb_yoW5Xw15pF
	WkKFyIkF4xXryUtws3GF1UG34UGF1xCa1UWr1aq3ZYqrs5AaykKr47tr9xtw4xCrWFyFy5
	ZFsa9FyY93yjk3DanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	rwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/24/26 12:38 PM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/sriov.rst into Chinese.
>
> Update the translation through commit 4558645d139c
> ("docs: net: document guidance of implementing the SR-IOV NDOs")
>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   .../translations/zh_CN/networking/index.rst   |  2 +-
>   .../translations/zh_CN/networking/sriov.rst   | 34 +++++++++++++++++++
>   2 files changed, 35 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index fcb8dc8f2c72..ae374c4cb144 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -29,6 +29,7 @@
>      alias
>      mptcp-sysctl
>      generic-hdlc
> +   sriov
>      team
>      timestamping
>   
> @@ -128,7 +129,6 @@ Todolist:
>   *   secid
>   *   seg6-sysctl
>   *   smc-sysctl
> -*   sriov
>   *   statistics
>   *   strparser
>   *   switchdev
> diff --git a/Documentation/translations/zh_CN/networking/sriov.rst b/Documentation/translations/zh_CN/networking/sriov.rst
> new file mode 100644
> index 000000000000..d5e16a099b07
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/sriov.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/sriov.rst
> +
> +:翻译:
> +
> +	陈思为 Siwei Chen <businiaoanka@anka1.top>
> +
> +===============
> +网卡 SR-IOV API
> +===============
> +
> +强烈建议现代网卡专注于实现 ``switchdev`` 模型
> +（参见 `以太网交换机设备驱动模型（switchdev）`_）
> +来配置 SR-IOV 功能的转发与安全。
> +
> +传统 API
> +========
> +
> +旧的 SR-IOV API 在 ``rtnetlink`` Netlink 协议族中实现，是 ``RTM_GETLINK`` 和
> +``RTM_SETLINK`` 命令的一部分。在驱动侧，它由若干 ``ndo_set_vf_*`` 和
> +``ndo_get_vf_*`` 回调组成。
> +
> +由于传统 API 与协议栈其余部分集成不佳，该 API 被视为已冻结；不再接受任何新功能或扩展。
> +新驱动不应实现那些不常用的回调；
> +即以下回调禁止使用：
> +
> + - ``ndo_get_vf_port``
> + - ``ndo_set_vf_port``
> + - ``ndo_set_vf_rss_query_en``
> +
> +.. _`以太网交换机设备驱动模型（switchdev）`: https://docs.kernel.org/networking/switchdev.html#switchdev

