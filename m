Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC3546A5F2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247972; cv=none; b=J5LjZA6e14GBqbbSc6YUvb/g3tuVQ6txkSu0JZCISqG5s/Z47ooGCQAOvzB8JwCBqBhe4zKoZyvwY+jErJVuRmCdax6Q4fYviOwtABVvO4BZQhItfLV38rrl3Rtx3rJf7h7g6R+Ks3URtZTE9nWaaYrw1itn2jtjUFcx4ZC1ED8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247972; c=relaxed/simple;
	bh=ehfy5au6BhmWQh51bKaz8NW/2H5zsMMTEQps1H5KOHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqJX/6QwPklk5iR3tRr5V3NP505VBW5w6gDy2NUDH49BJONCR87PEdHTF5dIjiFmudBk4Suptc2MbMRpO5NtN5p9R4K2oFLpL6fZtnZCLqS14tB1lIQJEPzQPDPWlrKOzBtz4KHwgp47VfZM7oW01bTK2P8756axcQYq2j+81K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMC23giYf5Zqmb5LAA--.5862S2;
	Tue, 01 Sep 2026 15:32:40 +0800 (CST)
Received: from [10.12.169.158] (unknown [10.12.169.158])
	by gateway (Coremail) with SMTP id _____wDHpNGQf5ZqKeU6AA--.60400S2;
	Tue, 01 Sep 2026 15:32:35 +0800 (CST)
Message-ID: <d1025540-8eee-441c-9e7e-c0aada663a0f@hust.edu.cn>
Date: Tue, 1 Sep 2026 15:32:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] irqdomain: Delete irq_domain_add_linear()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
References: <20260901070450.255507-1-jirislaby@kernel.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260901070450.255507-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMC23giYf5Zqmb5LAA--.5862S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy7Jw1UGr45Xr48tw1rCrg_yoW5Gw4xpF
	W3J3WfWFsrJF1j939rWr4DuFySqa47Ga1DKa15K3Z3tFnIq34kKF4UurnYkFyUAFZ7CFW5
	Cr12gFyv9FyqyFJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0EksPUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 9/1/26 3:04 PM, Jiri Slaby (SUSE) wrote:
> 7.3-rc1 is free of calls to irq_domain_add_linear(), so it can be
> deleted at last.
>
> According to Dongliang Mu, the paragraph in the Chinese docs is now
> obsolete. So drop it completely.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Radu Rendec <radu@rendec.net>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <si.yanteng@linux.dev>
> Cc: Dongliang Mu <dzm91@hust.edu.cn>

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

>
> ---
> [v2] drop the whole paragraph (Dongliang Mu)
> ---
>   .../zh_CN/core-api/irq/irq-domain.rst          |  4 ----
>   include/linux/irqdomain.h                      | 18 ------------------
>   2 files changed, 22 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> index aaefeda0e164..7317cf5355c9 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> @@ -90,10 +90,6 @@ irq_domain映射的类型
>   映射的优点是固定时间查找IRQ号，而且irq_descs只分配给在用的IRQ。 缺点是该表
>   必须尽可能大的hwirq号。
>   
> -irq_domain_add_linear()和irq_domain_create_linear()在功能上是等价的，
> -除了第一个参数不同--前者接受一个Open Firmware特定的 'struct device_node' 而
> -后者接受一个更通用的抽象 'struct fwnode_handle' 。
> -
>   大多数驱动应该使用线性映射
>   
>   树状映射
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 73c25d40846c..3ba75a4ed3da 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -752,24 +752,6 @@ static inline void msi_device_domain_free_wired(struct irq_domain *domain, unsig
>   }
>   #endif
>   
> -static inline struct irq_domain *irq_domain_add_linear(struct device_node *of_node,
> -						       unsigned int size,
> -						       const struct irq_domain_ops *ops,
> -						       void *host_data)
> -{
> -	struct irq_domain_info info = {
> -		.fwnode		= of_fwnode_handle(of_node),
> -		.size		= size,
> -		.hwirq_max	= size,
> -		.ops		= ops,
> -		.host_data	= host_data,
> -	};
> -	struct irq_domain *d;
> -
> -	d = irq_domain_instantiate(&info);
> -	return IS_ERR(d) ? NULL : d;
> -}
> -
>   #else /* CONFIG_IRQ_DOMAIN */
>   static inline void irq_dispose_mapping(unsigned int virq) { }
>   static inline struct irq_domain *irq_find_matching_fwnode(struct fwnode_handle *fwnode,

