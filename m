Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803586;
	b=qMnQruPYpMLmDKir/Ls28vFsz6k8+JR9pLNSFCPm8Fc6KT59uVTix5vleaLueBYbF7G9
	 m4qD/3Uj8TJK+Ag/Jz26R24CpA71T+OZsoVols9LkfwH6w+pBd+deP5knQuUKzWgHzxva
	 Q4whOa5Qu3zzU4sJKea2g9tGhnhLy8xZSOGCZ1ZdyiSr3PBrIyGJ7ZOrMMPs4AwDUAsxR
	 4eW+3Z667tB9cCPnptBNzcQG2JIS04u1eNRDysyfeAF7zy/REn199kbKzNrngSqIan4K/
	 UODWr2yUgJa29HOMsamVrpdP7UG1XaCiCvkunRXRdpHAlAPt1jZqj542teQSLtIJM4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803586;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=MxqnRpc2nPQDk7on3km9gNxQwvB+EDNz+SCZCg7nzPg=;
	b=xCLlXtCI1KeG+dM4WLX/Co2ErKy4WutSKEPVd+MRY0BIKYla+7kj/J5TuWTzelwCeJ5N
	 V+FQGWkk1/nEMAxEkyHCoKamx4jweKHJPzcPtw1rJGsLUTYYIL5qFgEDEG2W2X6LlGZ3t
	 Jj9vCGOqlH3xEqTHi+jmgq0gY6aIbLMabkvfDZrIuzieOyu1jgycJ0WUbnXduaDLubY/I
	 fAydP5JRUeKnjf4muypSUH1WJiVSWfDUBpCogFRIJ3PEoRwetnr7lxvY16WeIYhathgeq
	 fZ1HrlZe2Lp3ZftAu/2G7/t8HJzynSz6Q4jq85bhvw9GH1rBgjqTqB68aeGlIAjAf0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CD6606A328;
	Wed,  4 Nov 2026 14:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98CD6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMAGzmk8Retq414AAA--.342S2;
	Wed, 04 Nov 2026 22:46:20 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXwDY7RetqohsbAA--.20592S2;
	Wed, 04 Nov 2026 22:46:20 +0800 (CST)
Message-ID: <a4e6c559-5e7a-4c7e-8475-6f1970d8f3bc@hust.edu.cn>
Date: Wed, 4 Nov 2026 22:46:19 +0800
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
Subject: Re: [PATCH] docs/zh_CN: fix stale :Original: reference in
 xfrm_proc.rst
To: Weijie Yuan <kernel@wyuan.org>
Cc: =?UTF-8?B?UsOpbmljaCBCb24gwrRDaXJpwrRj?= <renich@evalinux.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260920073144.546566-1-renich@evalinux.com>
 <78d0a4ea-d621-4408-8efd-d8c9bb1f6841@hust.edu.cn>
 <autEFEW15g5I0oVT@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <autEFEW15g5I0oVT@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMAGzmk8Retq414AAA--.342S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7ZryfCF4kXry5tFy5ZFWkJFb_yoW8Xw18pF
	45KF1xta1ava4jyrs2gw4xXF1jgw45WFW2gFsxt3WF9rnYyFn3KFWfKws09FykXr1rtFy3
	X3W2gryvyFyUA3JanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0P73PUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/4/26 10:41 PM, Weijie Yuan wrote:
> On Wed, Nov 04, 2026 at 10:32:43PM +0800, Dongliang Mu wrote:
>> On 9/20/26 3:31 PM, Rénich Bon ´Ciri´c wrote:
>>> Commit 03e23b18c720 ("net: Move XFRM documentation into its own
>>> subdirectory") relocated Documentation/networking/xfrm_proc.rst to
>>> Documentation/networking/xfrm/xfrm_proc.rst.
>>>
>>> The Simplified Chinese translation was not updated accordingly,
>>> leaving its :Original: tag pointing to a nonexistent file and causing
>>> tools/docs/documentation-file-ref-check to report an invalid reference.
>>>
>>> Update the :Original: path to point to the new location.
>>>
>>> Fixes: 03e23b18c720 ("net: Move XFRM documentation into its own subdirectory")
>>> Signed-off-by: Rénich Bon ´Ciri´c <renich@evalinux.com>
>> Hi Rénich Bon ´Ciri,
>>
>> I have proposed a patchset to revise all the inconsistency between the path
>> of Chinese translation and English documentation and these invalid original
>> fields.
>>
>> Please refer to this patch - [PATCH v3 8/9] docs/zh_CN: update
>> networking/xfrm/xfrm_proc.rst translation
>>
>> https://lore.kernel.org/all/c641a11c-39c8-40c4-b162-10f3a3db57ff@linux.dev/
> Ah, I haven't had a chance to look carefully at your series yet. Then
> this patch can be discarded in what's-cooking.

Haha, what's-cooking is really a good place for me to catch up all my 
missing patches.

It seems all patches are reviewed, but some are waiting for the authors 
to revise.

Dongliang Mu

>
> Thanks, both.

