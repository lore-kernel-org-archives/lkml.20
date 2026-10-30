Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344391;
	b=JAkQWkfrIyMvrwDu344m4vrop6euSptMsxGUEY4dJbNk+H5gghtiVletOpJmEIIdOpjn
	 4+q5uj7kiqqUQdkHNXQz4JHAVXOAl75MPbKO91aLKwV84JrPr4W7m8g4ix+doqKBjVCRn
	 Vo/LeTg55FME95Bz+LGROS4M1xjy2dbnrMLShQK2GL9AIVEqbQzXFU9V4U3Y1GTozKHl/
	 TfP4o4mnFj0FKY9CZ0gAhAJuswJ73M+lEZQBJw1umQ9iRj4MyOsQoY46o2BG8hw/OVCIe
	 UcyzFKQwtITlh0Ejx2JgC839Vu3P7TXBFNd4sX5u23gEzErLBOq3WydFpy40R9bViyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344391;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:Content-Language:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=O5ARFXmxKNjgetchTuPtNTr3MgZHe6maojFUIKNY10A=;
	b=QJjCgiQKyjI4WX4ahps3n2gATCLgvpD7xGGCzxouC9WK8jbatfxmZGyqCSvLcOMBuFR/
	 2uoAtN8PljYqZNxh79cOfh6qlhr7+kU4LQP3SukTQA3qVX6geluy1zJ6J/nY3poqsh/Dc
	 DG/edG2gomc35iOLMX1xBtauol88iXYILi4ktpCxAIck97fDZZEAy2I7PgjoRMFaFADES
	 VAkJ3wx2OMihIRZ1e9khnzpGJx1Yu3nlX6CEEzZuRT3Cy97Zt5OtpLH4XItrtDEgzASVi
	 gtLjGXCXnB27vl9QKmSt8RHIqc9UHcbHNY4B/ZH051zDEGmP6ZZeJPdGHUHNpfR+ybQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F89606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F89606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.183])
	by gateway (Coremail) with SMTP id _____8Ax39J7Q+RqacEaAA--.11622S3;
	Fri, 30 Oct 2026 15:12:59 +0800 (CST)
Received: from [127.0.0.1] (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJBxKs55Q+Rq4mMxAA--.13206S3;
	Fri, 30 Oct 2026 15:12:57 +0800 (CST)
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
From: zhaotianrui <zhaotianrui@loongson.cn>
Message-ID: <5141c98f-4595-c29e-14b0-8bd324bf8949@loongson.cn>
Date: Fri, 30 Oct 2026 15:04:24 +0800
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
In-Reply-To: <5e547172-ac10-4a28-a584-9a385dbe2b80@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJBxKs55Q+Rq4mMxAA--.13206S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF4kKryfCryfCFWfGrWUJrc_yoW8AFWfpF
	Wv9ryjkrZ7Ar95X3ZFg3WxWa43Zw1DGFWUWF1rKas8ZrWDAFyxKryDWrWjgFyDCFs7Zry7
	JrZ2gr17uF98JFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8q2NtUUUUU==


在 2026/10/29 下午4:16, Thomas Zimmermann 写道:
> Hi
>
> Am 29.10.26 um 02:36 schrieb Tianrui Zhao:
>> LoongArch systems with hybrid graphics (integrated +
>> discrete GPU) can benefit from the same GPU switching
>> mechanism that x86 laptops use. Relax the dependency
>> to allow VGA_SWITCHEROO to be built on LoongArch,
>> consistent with the existing dependencies on ACPI,
>> PCI, and FB=y.
>>
>> Change-Id: I84d38fdfe5e1591495fb3681474a7f1f64281fa8
>
> Internal change ids should be remove before submitting patches.
>
Thanks for your review, I will fix this.


Best regards

Tianrui Zhao

>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>> ---
>>   drivers/gpu/vga/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/vga/Kconfig b/drivers/gpu/vga/Kconfig
>> index bad4bcee313..89edd1211aa 100644
>> --- a/drivers/gpu/vga/Kconfig
>> +++ b/drivers/gpu/vga/Kconfig
>> @@ -1,7 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   config VGA_SWITCHEROO
>>       bool "Laptop Hybrid Graphics - GPU switching support"
>> -    depends on X86
>> +    depends on X86 || LOONGARCH
>
> I'm a bit skeptical if that's all there is to do.  Does loongarch 
> really work with the existing handlers in the graphics drivers as-is?  
> See [1] for the interface that implements the actual switching.
>
> [1] 
> https://elixir.bootlin.com/linux/v7.3/source/include/linux/vga_switcheroo.h#L93
>
> Best regards
> Thomas
>
Thanks,  I will carefully check whether all these vga_switcheroo_handler 
callbacks are supported on the LoongArch platform.


Best regards

Tianrui Zhao

>>       depends on ACPI
>>       depends on PCI
>>       depends on FB=y
>

