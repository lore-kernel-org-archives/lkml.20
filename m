Received: from mta1.migadu.com (out-107.mta1.migadu.com [95.215.58.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4688D2F12DA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788317016; cv=none; b=PBTxKxoqIS5H/FnuX6djaj8k1zxUy8kkx4Pp+4LS3A2t8S3XFKCbWaq5TVT3Tiu5Y0GTcaFBHesXR2c+ldsjddVa6v9ses0OiSicn/ji3/C+E68cgY/aqdzAucZcK5AEAKb6wii/QOoNqMq7Hf5VjKEJZ8ZUeBvCBH5GNxasNl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788317016; c=relaxed/simple;
	bh=Xe69XlRqZvTK+JNk8vfsg5yxOFqf3N37qunP2dh1jsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfCLeAYv3qUH0a3NlIy/GliEQoLLD1crt84tb3eQnF2KAOFTXdtUlxUAxdTH5D8BYcmW38Ne0D/rlchOw1EbAHYqrdCRL+HrB775V36yJpr6mvOepKscuxW9QK+v5Cz3LrZKTnxF27Gtq3jfLMPF9k0DeSg1JKjSvB4W6YbNl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YalEne44; arc=none smtp.client-ip=95.215.58.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YalEne44"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xe69XlRqZvTK+JNk8vfsg5yxOFqf3N37qunP2dh1jsg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788317011; v=1; x=1788921811;
 b=YalEne445hcaTJ4q+Isg+riH1aAY/F9aK3YrsvI1pMxodr7kjhJWqx3DuPosYWvbV5dRhxbw
 4WklRgBh2cXrU+rkyyq7z2SN/TzNkxOXHhgz5Pyo4b7/30lDHRYc7SBHXKYkquRHq/fZbNSaw24
 cYuthBa30KWG2lbdwFeFJgeE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6cc57476be4b74c8;
	Wed, 02 Sep 2026 02:43:21 +0000
X-Mizu-Trace-ID: 6cc57476be4b74c8
X-Migadu-Flow: FLOW_OUT
Message-ID: <e3d21597-83bf-4637-a460-85ad757f524a@linux.dev>
Date: Wed, 2 Sep 2026 10:43:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] irqdomain: Delete irq_domain_add_linear()
To: Dongliang Mu <dzm91@hust.edu.cn>, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
 Alex Shi <alexs@kernel.org>
References: <20260901070450.255507-1-jirislaby@kernel.org>
 <d1025540-8eee-441c-9e7e-c0aada663a0f@hust.edu.cn>
Content-Language: en-US
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <d1025540-8eee-441c-9e7e-c0aada663a0f@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/9/1 15:32, Dongliang Mu 写道:
>
> On 9/1/26 3:04 PM, Jiri Slaby (SUSE) wrote:
>> 7.3-rc1 is free of calls to irq_domain_add_linear(), so it can be
>> deleted at last.
>>
>> According to Dongliang Mu, the paragraph in the Chinese docs is now
>> obsolete. So drop it completely.
>>
>> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
>> Cc: Thomas Gleixner <tglx@kernel.org>
>> Cc: Radu Rendec <radu@rendec.net>
>> Cc: Alex Shi <alexs@kernel.org>
>> Cc: Yanteng Si <si.yanteng@linux.dev>
>> Cc: Dongliang Mu <dzm91@hust.edu.cn>
>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

>
>>
>> ---
>> [v2] drop the whole paragraph (Dongliang Mu)
>> ---
>>   .../zh_CN/core-api/irq/irq-domain.rst          |  4 ----
>>   include/linux/irqdomain.h                      | 18 ------------------
>>   2 files changed, 22 deletions(-)
>>
>> diff --git 
>> a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst 
>> b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
>> index aaefeda0e164..7317cf5355c9 100644
>> --- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
>> +++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
>> @@ -90,10 +90,6 @@ irq_domain映射的类型
>>   映射的优点是固定时间查找IRQ号，而且irq_descs只分配给在用的IRQ。 
>> 缺点是该表
>>   必须尽可能大的hwirq号。
>>   -irq_domain_add_linear()和irq_domain_create_linear()在功能上是等价的，
>> -除了第一个参数不同--前者接受一个Open Firmware特定的 'struct device_node' 
>> 而
>> -后者接受一个更通用的抽象 'struct fwnode_handle' 。
>> -
>>   大多数驱动应该使用线性映射
>>     树状映射
>> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
>> index 73c25d40846c..3ba75a4ed3da 100644
>> --- a/include/linux/irqdomain.h
>> +++ b/include/linux/irqdomain.h
>> @@ -752,24 +752,6 @@ static inline void 
>> msi_device_domain_free_wired(struct irq_domain *domain, unsig
>>   }
>>   #endif
>>   -static inline struct irq_domain *irq_domain_add_linear(struct 
>> device_node *of_node,
>> -                               unsigned int size,
>> -                               const struct irq_domain_ops *ops,
>> -                               void *host_data)
>> -{
>> -    struct irq_domain_info info = {
>> -        .fwnode        = of_fwnode_handle(of_node),
>> -        .size        = size,
>> -        .hwirq_max    = size,
>> -        .ops        = ops,
>> -        .host_data    = host_data,
>> -    };
>> -    struct irq_domain *d;
>> -
>> -    d = irq_domain_instantiate(&info);
>> -    return IS_ERR(d) ? NULL : d;
>> -}
>> -
>>   #else /* CONFIG_IRQ_DOMAIN */
>>   static inline void irq_dispose_mapping(unsigned int virq) { }
>>   static inline struct irq_domain *irq_find_matching_fwnode(struct 
>> fwnode_handle *fwnode,
>
