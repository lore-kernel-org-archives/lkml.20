Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2EF3E3142;
	Mon,  7 Sep 2026 03:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=132.226.202.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752023; cv=none; b=A8QzfwSBoouq3OKM3A5aJRINgNTByyrxWmGJM5Y0/0msZMNf5FGNPqCQ8TttCesBPEV7A+iCzm8IFiP3Sx48Z9oNpds/1mtLTayIVd5csq7LHO78MKtOe/naGg+L1DAaH+W9fyIsCW8cI2EjQwZoKY9hYMjWdAC04hhZq0BsaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752023; c=relaxed/simple;
	bh=Hit6xXf5EBB4x8EvPOYHPARH2B8FVo4yRzJhJhtkGSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQxYEHYRc3OjpR6r0t/ghnv7ZOawl7tk3qjnFngiw6fw2us2YobjXe6pB2VThGSoYLIJ5vPxQvPwg3tq1tiY6RTHPXZQJXvQOwvvMZ6WJISOqMZza5ZRyHQpGjORRq5j3O+N7+Izxuc7zDVzXjn7+FzvIRLOwYH2Rh/W0o0QtSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=132.226.202.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMA2_7GKMJ5qnDgWAA--.48759S2;
	Mon, 07 Sep 2026 11:33:30 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDHpNGJMJ5qd6RTAA--.19743S2;
	Mon, 07 Sep 2026 11:33:29 +0800 (CST)
Message-ID: <65f5ca22-9766-421f-b3b8-61591b023631@hust.edu.cn>
Date: Mon, 7 Sep 2026 11:33:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] docs/zh_CN: Add LSM/SELinux secid Chinese
 translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
 <20260824043806.46731-6-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260824043806.46731-6-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMA2_7GKMJ5qnDgWAA--.48759S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF47Wr47Ar1UKrWxZr4rAFb_yoW5JryDpF
	n8KrWfAa1xWr17K39rGr17Gr15GF4xuw45Gr1xX3ZYqr95JF4kKrnrKrWqkrWxKrWFyFW5
	ZF4rKrW5WrW0y3DanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
> Translate .../networking/secid.rst into Chinese.
>
> Update the translation through commit de1fd4a7b0f2
> ("docs: networking: convert secid.txt to ReST")
>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   .../translations/zh_CN/networking/index.rst   |  2 +-
>   .../translations/zh_CN/networking/secid.rst   | 24 +++++++++++++++++++
>   2 files changed, 25 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index cd768d0a2837..bf22d22b64db 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -24,6 +24,7 @@
>      driver
>      ipv6
>      napi
> +   secid
>      vxlan
>      netif-msg
>      xfrm_proc
> @@ -126,7 +127,6 @@ Todolist:
>   *   representors
>   *   rxrpc
>   *   sctp
> -*   secid
>   *   seg6-sysctl
>   *   smc-sysctl
>   *   statistics
> diff --git a/Documentation/translations/zh_CN/networking/secid.rst b/Documentation/translations/zh_CN/networking/secid.rst
> new file mode 100644
> index 000000000000..94d9e7fb5d13
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/secid.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/secid.rst
> +
> +:翻译:
> +
> +	陈思为 Siwei Chen <businiaoanka@anka1.top>
> +
> +=================
> +LSM/SeLinux secid
> +=================
> +
> +flowi 结构体：
> +
> +flowi 结构体中的 secid 成员在 LSM（如 SELinux）中用于表示该流的标签。
> +该流的标签目前用于选择相匹配的带标签 xfrm。
> +
> +若为出向流，标签派生自套接字（若有）；如果该流是为响应某个入站报文而生成的，
> +则标签派生自相应的入站报文（例如 TCP 复位、timewait ACK 等）。
> +在特殊情况下，也可酌情让标签派生自其他来源，如进程上下文、设备等。
> +
> +若为入向流，标签派生自报文所使用的 IPSec 安全关联（若存在）。

