Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D24A0EF5;
	Tue, 22 Sep 2026 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790105122; cv=none; b=Itq1sagTIyJA1hsUd9uP5uSP5Cv1Wdxk0/PUDJApcjCdHd0WzbO/x9rRX1KKldWKeYwUpiMpXJ1aMg6y1+IK+Xuy2fg1FMBivWL3bKTgJS7QGe9sqIG30bOty3ywiGUpm2xTQINcF3Sy00hYU0zG+2C8z2iXMruN+udrjUsLWZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790105122; c=relaxed/simple;
	bh=HxoZgHxWGOsIenZWbdPoDcq7sB725i3KqnVNKp41j1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umqKEEdNnNLySewSuPfjFVKDJRYdSuCa1uLrou7y/62BN5bWO7yLIk8ohGb5pU3id0iUG2TqnMI58dkT/oV1wY8Gc5hob0pbPpaEBlPunL8UmnaG1b4qQhFNvl8iWaElfOg6op8VshSi2ht6BXqPqFW8Mwgdp9FZbP08x3e15uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EoCmnjLa; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EoCmnjLa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0bFhmwPgptNhHudWUxg4TPOYcI+L/HMf7q8nd9YRfAc=; b=EoCmnjLaj1uqPqmYKlgjxef91W
	fSOeL6NDv/00bxdur6Pcrf2IuFz1qcI7+UBzdQEl3t5/RxlDSDEBf0I/HqnnhHyEGd+3+BnaNh7v3
	ntX0k/x4ST0thUyhXEC+aqPYMChB9sbzFxaubJsKcQUwS/74aQSOiBRIbtd5SQGtMhIKV2+BkyCwY
	eW0XqHPib/qwYQ0K8Nnl83YJ+8PbiUtpKlTbgtKnksyufhkEblu5N9S67c7I6B/03wAkG/WOuiJiG
	U2vEnPREruEK8pR/TzhiKYke0dkmmVe/n5kmvLkUK4L9uR4GRze8D/S2FAERe+uf4NslH9Fy1hVa8
	2Y40jr/g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9674-00000006P2W-2msB;
	Tue, 22 Sep 2026 19:25:10 +0000
Message-ID: <0aa303bc-d3e9-4670-91e5-8299ddfcb6db@infradead.org>
Date: Tue, 22 Sep 2026 12:25:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [built failure] aicdb.h / __udivdi3
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1ccf42a99c89502a7a5e7038ed2ab2aa5a24dd7a.camel@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <1ccf42a99c89502a7a5e7038ed2ab2aa5a24dd7a.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 9/22/26 11:13 AM, Manuel Ebner wrote:
> Hi,
> 
> I did some built testing with randconf and got some build errors.
> 
> First error is:
> 
>> $ make KCFLAGS=-Werror -j8 > make_output.txt
>> aicasm_symbol.c:47:10: fatal error: aicdb.h: No such file or directory
>>    47 | #include "aicdb.h"
>>       |          ^~~~~~~~~
> 
> This could be fixed by installing libdb-devel.
> But than I got this error with the same configuration:
> 
>> $ make KCFLAGS=-Werror -j8 > make_output.txt
>> date
>> drivers/scsi/aic7xxx/aicasm/aicasm: 880 instructions used
>> drivers/scsi/aic7xxx/aicasm/aicasm: 25 of 37 register definitions used
>> /usr/bin/ld.bfd: fs/exfat/super.o: in function `exfat_set_vol_flags.isra.0':
>> super.c:(.text+0x622): undefined reference to `__udivdi3'
>> make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
>> make[1]: *** [/home/manuel/skripts/next/Makefile:1390: vmlinux] Error 2
>> make: *** [Makefile:248: __sub-make] Error 2
> 
> What can I do about it?
> Is it me/ my system or the kernel?

For the fs/exfat/ build error:

What is the target (x86_64, i386, arm64, arm, etc.)?
What is the compiler and its version?

That error usually means that the target is a 32-bit CPU
and the code in question is doing an unsupported divide or
modulus function.

It possibly should be using a kernel macro from <linux/math.h>
or other headers.

-- 
~Randy

