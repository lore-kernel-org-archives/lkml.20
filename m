Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A4D248867;
	Mon,  7 Sep 2026 03:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751979; cv=none; b=Ae2i34Orlv8hFJXqWembazTXj4a8JiYpifP6FfWy56Fa1W+gWgz/sc/FzDa/RL8aR+jEs5U3mddLEwUAPRD+YzGASx3iBDWKxxB0PnnklGLs1CdvAWzXfTTMDoN7I/wY7L7HmeLaDDV/pW18o1nlZloWFUeVYbztHHYT/JN8CMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751979; c=relaxed/simple;
	bh=P43ByJuJlusV9YxF9+Wphzjl76KwsVBt08ArMvPsHKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDeZno8lO3sdfyEQ0PoDkpvOA1hftOz0ktWWmA5FN5r3P2WmFJQCAAduBFmowG2/ElQoAjKa5y1MzVdnq9jfgVqrfmzHVbqFjqDjUyR8E/p1OpQKlkCF0HJi1soRVu8Ur0o8Zrv8iJGGVchLMlFlUEFHCDjxxIAgn9CoYKJPUEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMAW37FbMJ5q3jcWAA--.48581S2;
	Mon, 07 Sep 2026 11:32:43 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBHBtFYMJ5q96NTAA--.20488S2;
	Mon, 07 Sep 2026 11:32:42 +0800 (CST)
Message-ID: <f4a2cc06-47e5-4720-bde5-5c2abe55bbdc@hust.edu.cn>
Date: Mon, 7 Sep 2026 11:32:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] docs/zh_CN: Add networking team documentation
 Chinese translation
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
 <20260824043806.46731-2-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260824043806.46731-2-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMAW37FbMJ5q3jcWAA--.48581S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF45Kw47XFy3Gr13JF4DXFb_yoW8CFWkpa
	95KryxGF4xWFy7G3yxGr1UGr15GF4xCw4UGryIq3Zaqrn8ta1ktr17tr98Kr17KrWFyFW5
	ZF4rKrW5WrWjy3DanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQCb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/24/26 12:38 PM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> Translate .../networking/team.rst into Chinese.
>
> Update the translation through commit aa8a6ee3e3fc
> ("docs: networking: convert team.txt to ReST")
>
> Signed-off-by: Siwei Chen <businiaoanka@anka1.top>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   .../translations/zh_CN/networking/index.rst      |  2 +-
>   .../translations/zh_CN/networking/team.rst       | 16 ++++++++++++++++
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/team.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index 333e9f6cafff..fcb8dc8f2c72 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -29,6 +29,7 @@
>      alias
>      mptcp-sysctl
>      generic-hdlc
> +   team
>      timestamping
>   
>   Todolist:
> @@ -136,7 +137,6 @@ Todolist:
>   *   tc-queue-filters
>   *   tcp_ao
>   *   tcp-thin
> -*   team
>   *   tipc
>   *   tproxy
>   *   tuntap
> diff --git a/Documentation/translations/zh_CN/networking/team.rst b/Documentation/translations/zh_CN/networking/team.rst
> new file mode 100644
> index 000000000000..e6cf19a245a1
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/team.rst
> @@ -0,0 +1,16 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/team.rst
> +
> +:翻译:
> +
> +	陈思为 Siwei Chen <businiaoanka@anka1.top>
> +
> +====================
> +Team（网络接口聚合）
> +====================
> +
> +Team 设备由用户空间通过 libteam 库驱动，该库位于：
> +	https://github.com/jpirko/libteam

