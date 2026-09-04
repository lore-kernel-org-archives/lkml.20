Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B9D3A5E6F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788506730; cv=none; b=MOz9YRLLBszIctRtD64Dk706PRw1uEtHaeM9T4xqyjgSE7PmusbtJSp2uD4y2K4x/S6qme14opY+tqyRvNRjtxAafbSqY1/yMKmRpVDCkSQnPe68s9iuUrZ7AlRt1fyEHAKDARsemV3QeMEyNoBqvbdAGJDB4Y0XqEA4nUwHL0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788506730; c=relaxed/simple;
	bh=a8RNW8w/Vucy4VhVEd8OLPOx5A8x6Z634T5Eww05iMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EV/lxX5FoccpXF9UcOFgeYniX/w1RtuoWZ/HuOWdBDjKfiKcAHcUcHHBF4JOOYS7Prgou0lODPlY1aMkxNsm5dFiMPOPGeWDCw0twMIdMNy8p0THY5Aihb/EiZOPq/v04y6Dr9JAnxYuWRzCopAZDEW8eRDNB4WkputDTGYS1LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c98a075aa83111f19a56ed5b684f684d-20260904
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:50e605c4-f68b-45a1-8e51-fd3bf5dcb3c8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f9aefe99cd78329a414e15b45e7ae4d0,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0|15|52|99,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c98a075aa83111f19a56ed5b684f684d-20260904
X-User: fuqingshuang@kylinos.cn
Received: from [10.42.20.11] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1140970297; Fri, 04 Sep 2026 15:25:21 +0800
Message-ID: <15346ce5-14e1-4511-bf3f-64ea9d536ee1@kylinos.cn>
Date: Fri, 4 Sep 2026 15:25:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] genirq/generic-chip: Set IRQ_DOMAIN_FLAG_DESTROY_GC in
 irq_domain_alloc_generic_chips()
To: Thomas Gleixner <tglx@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Cc: Radu Rendec <radu@rendec.net>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <20260902065939.441981-1-fuqingshuang@kylinos.cn>
 <20260904003731.2fed5a25@bootlin.com> <87v78l8rcd.ffs@fw13>
Content-Language: en-US
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
In-Reply-To: <87v78l8rcd.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2026/9/4 14:26, Thomas Gleixner 写道:
> On Fri, Sep 04 2026 at 00:37, Herve Codina wrote:
>> On Wed,  2 Sep 2026 14:59:39 +0800
>> Qingshuang Fu <fuqingshuang@kylinos.cn> wrote:
>>> diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
>>> index 2c8bc6ce082e..13b634053a3e 100644
>>> --- a/kernel/irq/generic-chip.c
>>> +++ b/kernel/irq/generic-chip.c
>>> @@ -308,6 +308,7 @@ int irq_domain_alloc_generic_chips(struct irq_domain *d,
>>>   	dgc->gc_flags = info->gc_flags;
>>>   	dgc->exit = info->exit;
>>>   	d->gc = dgc;
>>> +	d->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
>>>   
>>>   	/* Calc pointer to the first generic chip */
>>>   	tmp += dgc_sz;
>> The flag has been intended to be use with irq_domain_instantiate() which can call
>> irq_domain_alloc_generic_chips() internally. Callers of irq_domain_instantiate()
>> call only irq_remove_domain().
>>
>> Indeed calling only irq_domain_instantiate() and calling both
>> irq_domain_remove_generic_chips() followed by irq_remove_domain() is, in that case,
>> not consistent too.
>>
>> IHMO, if the flag IRQ_DOMAIN_FLAG_DESTROY_GC need to be automatically set
>> somewhere, it could be in irq_domain_instantiate().
> 
> Yes, in the 'if (info->dgc_info)' branch.

Hi,

Thank you very much for your valuable suggestion.

I have posted the v2 patch here:
https://lore.kernel.org/all/20260904070943.934476-1-fuqingshuang@kylinos.cn/

In v2, IRQ_DOMAIN_FLAG_DESTROY_GC is now set inside the info->dgc_info
branch within __irq_domain_instantiate(), right after 
irq_domain_alloc_generic_chips()
succeeds.

Now only domains created via irq_domain_instantiate() with dgc_info get
IRQ_DOMAIN_FLAG_DESTROY_GC automatically. Explicit callers of
irq_domain_alloc_generic_chips() remain untouched and are still responsible
for cleaning‑up generic chips manually.

Regards,
Qingshuang Fu

