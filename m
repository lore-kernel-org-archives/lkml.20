Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043041F35A;
	Wed, 23 Sep 2026 18:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790186510; cv=none; b=CIE+v80uDaEjkvSI/TuxFjCqCt81XZo+ej4YwgxFubN2MojIqpnIekvzQS0b8baVQRlbimsYNvisvydaKcgbtD8T8x+PheAe6xp8QApmwBNe2OQADFb1XFdFLrvCIHPUQ6xyqvCqBG2L/I2ivi0IRDJFBTpePCjFwY30GwgVL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790186510; c=relaxed/simple;
	bh=P3oi0PGDlf4xoKRMZIdGGpE4Q3g7CRonJXX2JvXuSGg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=N7Wg+82G9Kc2F+apkchhtGKS79EpdBNjC2uRoonUhBMIjBfBXhdtGyHwZxbQxFpYYkM9YoQtOocTHEG9qZw4ZhCesr93SoeOV1bPUpXHyov4t0Bwdv/zU//mVmXhP+XqXDEMYpUQ9LECGT2lMJ+3Xb9VH534Uh2hg3UwzS1uP7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=12gnr5p2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="12gnr5p2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=i2fkcWjPo33/i5V/T6lRUhSfxbVcuI5QepfXiQgw9nc=; b=12gnr5p2LkszC78CQmmuo4EkD7
	Aqi9BB8bzGNPkPc6Es6jdRy/uyZnpONUCjkRMu1yxZkbwreX8MZHqaCeQXMAGPGRXVTKfenqIHi8e
	sexvPV+H9VjQyH0I8067RS3bmA+h9vlp5j6ckXYOqZMh7ldtMPLGDI3cGSO1VvdnhezMuCkG6O+GJ
	sy3Rxwlr3Aj3ULsXnIyON28Mr18GBIT1srSBNKY2y2Zsc1WzZ1+na7PAwfP9OTNr8rHAU5aaNdEXv
	srYvin7b7rOKolOJmzL78dfhpM/MbkXiGHKXkcie9V0Xxj96wK1VnUvgxs5r8Dg4PwxGBu6YDUasL
	/X9Bplzg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RHr-000000097b2-3aFU;
	Wed, 23 Sep 2026 18:01:44 +0000
Message-ID: <1799e700-7898-4d63-9c0d-95535af415b0@infradead.org>
Date: Wed, 23 Sep 2026 11:01:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [built failure] aicdb.h / __udivdi3
To: David Laight <david.laight.linux@gmail.com>,
 Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1ccf42a99c89502a7a5e7038ed2ab2aa5a24dd7a.camel@mailbox.org>
 <0aa303bc-d3e9-4670-91e5-8299ddfcb6db@infradead.org>
 <5d00e8d9c5e8118477efcafeb19b1347268bcc38.camel@mailbox.org>
 <20260923171023.5a134671@pumpkin>
Content-Language: en-US
In-Reply-To: <20260923171023.5a134671@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/23/26 9:10 AM, David Laight wrote:
> On Wed, 23 Sep 2026 15:41:59 +0200
> Manuel Ebner <manuelebnerli@mailbox.org> wrote:
> 
>> On Tue, 2026-09-22 at 12:25 -0700, Randy Dunlap wrote:
>>> Hi--
>>>
>>> On 9/22/26 11:13 AM, Manuel Ebner wrote:  
>>>> Hi,
>>>>
>>>> I did some built testing with randconf and got some build errors.
>>>>
>>>> First error is:
>>>>   
>>>>> $ make KCFLAGS=-Werror -j8 > make_output.txt
>>>>> aicasm_symbol.c:47:10: fatal error: aicdb.h: No such file or directory
>>>>>    47 | #include "aicdb.h"
>>>>>       |          ^~~~~~~~~  
>>>>
>>>> This could be fixed by installing libdb-devel.
>>>> But than I got this error with the same configuration:
>>>>   
>>>>> $ make KCFLAGS=-Werror -j8 > make_output.txt
>>>>> date
>>>>> drivers/scsi/aic7xxx/aicasm/aicasm: 880 instructions used
>>>>> drivers/scsi/aic7xxx/aicasm/aicasm: 25 of 37 register definitions used
>>>>> /usr/bin/ld.bfd: fs/exfat/super.o: in function `exfat_set_vol_flags.isra.0':
>>>>> super.c:(.text+0x622): undefined reference to `__udivdi3'
>>>>> make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
>>>>> make[1]: *** [/home/manuel/skripts/next/Makefile:1390: vmlinux] Error 2
>>>>> make: *** [Makefile:248: __sub-make] Error 2  
>>>>
>>>> What can I do about it?
>>>> Is it me/ my system or the kernel?  
>>>
>>> For the fs/exfat/ build error:
>>>
>>> What is the target (x86_64, i386, arm64, arm, etc.)?  
>>
>> My system is x86_64.
>> But i guess this means the target is 32 bit:
>>> CONFIG_X86_32=y  
>> The rest of the .config is below.
>>
>>> What is the compiler and its version?  
>>
>> gcc (GCC) 16.2.1 20260819 (Red Hat 16.2.1-2)
>>
>>> That error usually means that the target is a 32-bit CPU
>>> and the code in question is doing an unsupported divide or
>>> modulus function.  
>>
>> Can the dependencies in the .config be improved to to make this issue impossible?
>>
>>> It possibly should be using a kernel macro from <linux/math.h>
>>> or other headers.  
>>
>> I figured I didn't successfully checkout next but this shouldn't change this error.
> 
> I just tried to build the .config from below against a 'quite recent' linux-next.
> If fails for a couple of unrelated reasons - I edited the config to fix them.
> But there isn't a divide in exfat_set_vol_flags().
> I can't see one in the source either.
> The usual 'next stage' is to disassemble the .o file and work out which
> source line is responsible.

I also can build exfat fs successfully with this .config file.
And as David did, I had a few other build issues aside from exfat fs.

-- 
~Randy

