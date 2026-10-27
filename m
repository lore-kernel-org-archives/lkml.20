Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121020;
	b=gfHHC9zVRW82Y+7J34C0E5yKRpF6t6saUruYxKBh1ken0jvralNreReknTlNUQgJycuR
	 EjKTm8NlAtbsks97oX2ttdpQww39EfDPlHU+HADItD1I61Ot3oU7Nfv4SsTEAj2JUcIJX
	 xSMqeavuxZsg4EBd5dQIFGzHkp9R1xE6Br5YgsPENyOo8mU9Z0ctOn+tsCOBz4Csvwyws
	 HQ0OodazyQfe7i8BBTFg0MFtZBmEV/lYfHF8oCC0znNeTcOgbtsd0dtMMtNwitsbLI2dG
	 /4pIEcJEin3H9EqDuuIMSi80VhWacUdx7kINLYYApzYFoo5ZqlOSzCiVGAyz43uoZfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121020;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=EmA9gMUaVRmvqQ9jvKbGlvlpatHa+cnO4+ELOrg+Jl0=;
	b=kOJe0SVD/Be6wzzCm+Xn/sloCc66x5A1ke8UPQDnbvP4xsVMQlibIS22FAuq5sF4tO90
	 iWmF1zBz42qE/Ah/WMoH4iEGO/n3iqylYbyZWtRwO5WMw8YgiNsF9o/rjBRq7hcyrBAJs
	 +seU0lPnHNfrZ7Rnl+DE2MFPPw461qFw6N97QrQjVOoEhklvGr8H30dduLauJyRtg6xxA
	 3oqNqPxsEStFemK7ruJ4RuiqeAzGh8VmCERrMc74SCjYPVChqjOgmsm2wpqmzAzds8SQB
	 Onid98bMBRw3luPbJ+WBk+03gXvzEqscMMZpmrCPbRpCfCosuCzwjppCqe9Xc6jLCIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C6A606A321;
	Tue, 27 Oct 2026 17:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C6A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBWnqTz2uBqeEQ8AQ--.18192S2;
	Wed, 28 Oct 2026 01:10:11 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCX8Azy2uBqB3LEAA--.20435S2;
	Wed, 28 Oct 2026 01:10:10 +0800 (CST)
Message-ID: <7a3f8c77-9854-441b-846b-5e58463a776d@hust.edu.cn>
Date: Wed, 28 Oct 2026 01:10:09 +0800
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
Subject: Re: [PATCH 1/2] docs: Recognize Deepin for dependency hints
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1793119566.git.dzm91@hust.edu.cn>
 <b3e985f11140daa28718087723957e2fbfa4a538.1793119566.git.dzm91@hust.edu.cn>
 <20261027180558.3c975c90@foz.lan>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261027180558.3c975c90@foz.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IAEQrMBWnqTz2uBqeEQ8AQ--.18192S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4xtry8GF1DJr43Jw4fXwb_yoW8Gr47pr
	4rWayIvF45X34FvFWxW39YvF4Uurs7Kryagw1xtasrZryfJrn2qryIgayaganrJa1DAr1F
	vF17uFyUtFW8ZaDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHjb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI
	0_JF0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCE
	c2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14
	v26r4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWx
	Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/28/26 1:06 AM, Mauro Carvalho Chehab wrote:
> On Wed, 28 Oct 2026 00:56:50 +0800
> Dongliang Mu <dzm91@hust.edu.cn> wrote:
>
>> Deepin uses apt, but the checker falls back to generic hints because its
>> distribution name is missing from the OS mapping. Route Deepin to the
>> Debian hint handler so it suggests apt-get installation commands.
>>
>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> LGTM, but where is patch 2 of this series if any?


Thanks. My network connection is not very stable. I resended the PATCH 2/2.

Dongliang Mu


> https://lore.kernel.org/linux-doc/cover.1793119566.git.dzm91@hust.edu.cn/
>
> Regards,
> Mauro
>
>
>> ---
>>   tools/docs/sphinx-pre-install | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
>> index 965c9b093a41..d1af82e1466d 100755
>> --- a/tools/docs/sphinx-pre-install
>> +++ b/tools/docs/sphinx-pre-install
>> @@ -1137,6 +1137,7 @@ class SphinxDependencyChecker(MissingCheckers):
>>               re.compile("Devuan"):                     self.give_debian_hints,
>>               re.compile("Kali"):                       self.give_debian_hints,
>>               re.compile("Mint"):                       self.give_debian_hints,
>> +            re.compile("Deepin"):                     self.give_debian_hints,
>>   
>>               re.compile("openSUSE"):                   self.give_opensuse_hints,
>>   
>
>
> Thanks,
> Mauro

