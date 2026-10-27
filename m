Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103088;
	b=pMdOuPIG2Vy9jDwohmB0AUekZjQN2ZlSu1D2VQ7eVHooIK3LDTP8Uj8Nd9csXlMrh+nq
	 4CRNb6FuTRVx0SVtfGdg4EM3dbUdHOwfZ6a60f0HJIHCZAoYEycz6ZvqMnjaQu2BQy7yy
	 ycNpuHukCu5Z6fMtzP/4GqwPCtUehktf2TZjJWiv68ownmTCHqjJ6s6n/Ad7pE6xMmIk4
	 9fpP7S8pnk2JkwLt6wc1Ey+4oIVYQwszM6rrcCeadClsvY5BcTt0EBrT8eSgw2BXRxU8s
	 2lCXMkYRQkxnM66qvzudai4fFKwlqTrAtkVF8k8wPVWpFAT9r5lEn/cty6JeYTr/IwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103088;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=iU54Zme+OcuYL0dzc+Pahc9pzVneTjh+9Gx1IthbgEg=;
	b=ch7nkiq1w8A7ZuVu5+/w8gXEZlWNflTsgrtNWGBSejNNofLegjiH2FayqZMqj/5ofds9
	 nVKvrHb1F7JIcR6NWpyZqWqzvW5UjcANJxxj1jmn8ekCpOjPlw/pza+K8NshADLmPJokd
	 0eeDsWLtuULvjTl6rhFtWC1QR5N0zc5Qp+EKlBydztr4nrB/7PCM0vX2WuNjrCsNt3USW
	 s9A4vSvf4T77ELNs7UdyTPVYnqP3KhIvGHBc7U9/y8yNsuqorBLKhR4QuvvmZd6gGXD3K
	 DGco9n9rLB7z6uq9ANQ732x3nLON66+eeYYldUqa5ZREusED0IkYh1V6L7mZGtKJg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11AA606A325;
	Tue, 27 Oct 2026 12:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B11AA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMC2_qTqlOBquhU7AQ--.34292S2;
	Tue, 27 Oct 2026 20:11:22 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAH4ibhlOBqIOMTAA--.26244S2;
	Tue, 27 Oct 2026 20:11:16 +0800 (CST)
Message-ID: <59010171-3f94-4574-89e4-b655c1c6dc30@hust.edu.cn>
Date: Tue, 27 Oct 2026 20:11:13 +0800
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
Subject: Re: [PATCH 2/9] docs/zh_CN: update admin-guide/README.rst translation
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiandong Qiu <qiujiandong1998@gmail.com>
References: <20261027102552.3801595-1-dzm91@hust.edu.cn>
 <20261027102552.3801595-3-dzm91@hust.edu.cn> <auCM9YrxbpXvdRv9@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <auCM9YrxbpXvdRv9@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMC2_qTqlOBquhU7AQ--.34292S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxJr18tw1UtFWUuw4rWw4fuFg_yoW8urykpa
	s5KFySkan7Ar13Gr47K3srtF1rJF4xGayDJr1jv34rZ3ZYyr1vqrnFqrZIgasxXrWIga17
	XF4rtF9Yk3yjyFJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQEb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jDkucUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/27/26 7:37 PM, Weijie Yuan wrote:
> Dongliang Mu <dzm91@hust.edu.cn> writes:
>
>> update Documentation/admin-guide/README.rst Chinese translation
>>
>> Refresh the kernel installation guidance and correct the defconfig and
>> LSMOD descriptions. Add a label to the translated applying-patches guide
>> so the README can link to it.
>>
>> Update the translation through commit 8913632998fc
>> ("Documentation: Fix typos and grammatical errors")
>>
>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>> ---
>>   .../translations/zh_CN/admin-guide/README.rst | 89 +++++++++++--------
>>   .../zh_CN/process/applying-patches.rst        |  2 +
>>   2 files changed, 53 insertions(+), 38 deletions(-)
>>
>> diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
>> index ee6dd3782f4a..050f671f8acb 100644
>> --- a/Documentation/translations/zh_CN/admin-guide/README.rst
>> +++ b/Documentation/translations/zh_CN/admin-guide/README.rst
>> @@ -1,11 +1,12 @@
>>   .. include:: ../disclaimer-zh_CN.rst
>>   
>> -:Original: Documentation/admin-guide/README.rst
>>   
>>   :译者:
>>   
>>    吴想成 Wu XiangCheng <bobwxc@email.cn>
>>   
>> +.. _readme_zh:
>> +
> Hi Dongliang, good evening ;-)
>
> I remember that Jon emphasized that top-level labels should not be
> added in this thread:
>
>    https://lore.kernel.org/linux-doc/87tsqytxrn.fsf@trenco.lwn.net/
>
> And I remembered that my patch (apply-patches.rst) was rendered
> correctly just using a plain path. (so I didn't add that label)
> But I'll check it again now.


It seems useless. I will test this removal, if it works I would remove 
this top level in v2 patch.


> Also, v3 of this series is pending, if I remember correctly. In general
> I think it's not bad. So feel free to take a look when having spare
> time.
>
> v3: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiujiandong1998@gmail.com/
I will review this patchset today or tomorrmow.
> Therefore +cc Jiandong.
>
> Thanks!

