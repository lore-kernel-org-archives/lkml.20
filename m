Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350029;
	b=a1qGG9XmNRvLIpnGRu6a2Doo5XdLuK0+N4ubyydd8HgbRe7PF7dTZ129fcUpc6J5YAog
	 9TToQ5cKxirMHgWR6v5WtWDl1mvRENGGypH8GxGFmFwsnzW1qr2lxsFsT8PquYUp5RKT8
	 t/h5gCwmw3WTreyGsm63yc+du+/aOF3sAFJKaES+UvEa3UcKSjhsoMQI36e2n3NAB+Ili
	 6mR7So0CycB8JB6uKOkeHJe5teNBP9xtIAxyBjgUmjH8VvNThVbhrOPasvqGB+Y0pF6kr
	 6soRbTTX60xKNYGsvoFKwNcuH/9mcF/YuyqNJ+ohqmGh4zvEz9HbTOrdduwGLQaZ+0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350029;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:Content-Language:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=Mbldlb3LRAVqxh2lpIHUL758U5buI0uOgdoxlR0kTew=;
	b=Ub6nwDNY6yY5k5ozxIcI8fDvlmIiRhAI/fbLFxPeDH3Aw6xle0M3FtEvCVeK6vCF+NJp
	 nvNPNnFhcirsa8+1DxYx+m8K6BqRy/FkDosz4z2dUfH9Cnqhi85bcx4xA3vLDrGl0EQ2i
	 +rektWyf9P8q+1BJXfG0DkEdUgv7YoGT6c4CZK435drthIpO4hlM7n4/6xo8J/JYIkdnY
	 /TBgFA39si28omyIi7eTDcolF/G2KSjgCvaQdKO0XVzUriJT7V2nvnTYkWWcUMfYW6Ve+
	 DHXeycQjf17hILWnIaqSb16brXdkuh/S+auB0YRIjJ3XCp+BaCJqic4gSt+w9cNDzww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11219606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11219606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.183])
	by gateway (Coremail) with SMTP id _____8BxbdKIWeRqnccaAA--.13805S3;
	Fri, 30 Oct 2026 16:47:04 +0800 (CST)
Received: from [127.0.0.1] (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJBx6c2EWeRqxGgxAA--.13118S3;
	Fri, 30 Oct 2026 16:47:02 +0800 (CST)
Subject: Re: [PATCH] vga-switcheroo: Allow VGA_SWITCHEROO to be enabled on
 LoongArch
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 chenhuacai@loongson.cn
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wuqianhai@loongson.cn
References: <20261029013618.3558115-1-zhaotianrui@loongson.cn>
 <5e547172-ac10-4a28-a584-9a385dbe2b80@suse.de>
 <5141c98f-4595-c29e-14b0-8bd324bf8949@loongson.cn>
 <2790b59c-9b8f-43f9-a4a8-53106906bf98@suse.de>
From: zhaotianrui <zhaotianrui@loongson.cn>
Message-ID: <186e26e9-da23-72e4-9464-18e9608ca8ea@loongson.cn>
Date: Fri, 30 Oct 2026 16:39:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <2790b59c-9b8f-43f9-a4a8-53106906bf98@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJBx6c2EWeRqxGgxAA--.13118S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWr47XF1xXw1rZF1fKr1ruFX_yoW5WF1xpr
	yvgFyjkFZ7Jrn5Xw1293W7Wryjy3ZxGFWUWF15J3WDu390yFyfKr4jgryj9FyDCFs3Ar4U
	JrW0qryxuFyDAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU466zUUUUU


在 2026/10/30 下午4:17, Thomas Zimmermann 写道:
> Hi
>
> Am 30.10.26 um 08:04 schrieb zhaotianrui:
>>
>> 在 2026/10/29 下午4:16, Thomas Zimmermann 写道:
>>> Hi
>>>
>>> Am 29.10.26 um 02:36 schrieb Tianrui Zhao:
>>>> LoongArch systems with hybrid graphics (integrated +
>>>> discrete GPU) can benefit from the same GPU switching
>>>> mechanism that x86 laptops use. Relax the dependency
>>>> to allow VGA_SWITCHEROO to be built on LoongArch,
>>>> consistent with the existing dependencies on ACPI,
>>>> PCI, and FB=y.
>>>>
>>>> Change-Id: I84d38fdfe5e1591495fb3681474a7f1f64281fa8
>>>
>>> Internal change ids should be remove before submitting patches.
>>>
>> Thanks for your review, I will fix this.
>>
>>
>> Best regards
>>
>> Tianrui Zhao
>>
>>>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>>>> ---
>>>>   drivers/gpu/vga/Kconfig | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/vga/Kconfig b/drivers/gpu/vga/Kconfig
>>>> index bad4bcee313..89edd1211aa 100644
>>>> --- a/drivers/gpu/vga/Kconfig
>>>> +++ b/drivers/gpu/vga/Kconfig
>>>> @@ -1,7 +1,7 @@
>>>>   # SPDX-License-Identifier: GPL-2.0-only
>>>>   config VGA_SWITCHEROO
>>>>       bool "Laptop Hybrid Graphics - GPU switching support"
>>>> -    depends on X86
>>>> +    depends on X86 || LOONGARCH
>>>
>>> I'm a bit skeptical if that's all there is to do.  Does loongarch 
>>> really work with the existing handlers in the graphics drivers 
>>> as-is?  See [1] for the interface that implements the actual switching.
>>>
>>> [1] 
>>> https://elixir.bootlin.com/linux/v7.3/source/include/linux/vga_switcheroo.h#L93
>>>
>>> Best regards
>>> Thomas
>>>
>> Thanks,  I will carefully check whether all these 
>> vga_switcheroo_handler callbacks are supported on the LoongArch 
>> platform.
>
> Switcheroo used to be required for x86 notebooks from ~2010. Those 
> systems had two graphics cards, but only one set of output connectors. 
> That design is become rare, I think.
>
> So I'm a bit surprised to see it come back. Which loongarch systems 
> are there?
>
> Best regards
> Thomas
>
>
Hi Thomas,

Thanks for your reply.

On the Loongson platform, we don't have the "two GPUs but only one set 
of display outputs" scenario you described. However, we do have systems 
where an integrated GPU and a discrete GPU coexist.
We would like to use the vga_switcheroo interface to switch between the 
discrete GPU (DIS) and the integrated GPU (IGD), and to configure the 
default VGA device.
Would this approach be feasible? Do you have any suggestions or 
recommendations?

Best regards
Tianrui Zhao
>>
>>
>> Best regards
>>
>> Tianrui Zhao
>>
>>>>       depends on ACPI
>>>>       depends on PCI
>>>>       depends on FB=y
>>>
>>
>

