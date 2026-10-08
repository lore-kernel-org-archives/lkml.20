Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276EF47D477;
	Thu,  8 Oct 2026 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463040; cv=none; b=Lt2ZgWc/Uk7OkwqY5OMVDZ8WbHsL7hDsSGTtXModwT2M1BFwbWLK8wLBX51zefIUQYRFzUgQk85qwwfkeNNXcgX+I0TQeHJ8ulu7mhS/fMLf3nZmHehTEWoVDELz5Hg9IIBKn1aoTYtN1k7UGpUe9QAOEUaQwDNbfoCp2higiDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463040; c=relaxed/simple;
	bh=bEdd1Ku0vh+291cwy0D9AUNsiYbnfA3xPUUpYei8Wyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ed9hM+m9e/cVQZ3gC0HEy1jSB8UBVvPcQAAhOpfmlXCH/5OAWOyo7ZX2P7cAvLzFe5wKPjcfjU0dOfvLiE13KoL6aDYIPP8CJxVkdDjaoeXlWDIHiYveBe50x15SsOg3LgyeP+CJ7lqF4ehVLB6wRsFdlxLAjgjHlyCLM83//N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9901F00893;
	Thu,  8 Oct 2026 12:37:17 +0000 (UTC)
Message-ID: <e3031344-a7af-4d8f-804b-6009588acd2a@linux-m68k.org>
Date: Thu, 8 Oct 2026 22:37:15 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Oct 7 (arch/m68k/coldfire/nettel.c)
To: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org
References: <asZL8ElkW3Dx1ZgF@sirena.co.uk>
 <3a927133-3e27-4557-9887-7ed0c7315a7d@infradead.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <3a927133-3e27-4557-9887-7ed0c7315a7d@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/10/26 08:43, Randy Dunlap wrote:
> 
> 
> On 10/7/26 6:41 AM, Mark Brown wrote:
>> Hi all,
>>
>> Note that I will be travelling to LPC from 2nd-9th October, as a
>> result -next releases will be at best spotty during that time.
>>
>> Changes since 20261006:
> 
> CONFIG_COLDFIRE=y
> CONFIG_M5206e=y
> CONFIG_NETtel=y
> 
> ../arch/m68k/coldfire/nettel.c: In function 'nettel_smc91x_init':
> ../arch/m68k/coldfire/nettel.c:126:9: error: implicit declaration of function 'mcf_setppdata' [-Wimplicit-function-declaration]
>    126 |         mcf_setppdata(0, 0x0080);
> 
> 
> Full randconfig file is attached.

Thanks for letting me know Randy.
FWIW this is not a regression in linux-next, this looks to have been 
broken for a while.

I will issue a fix in the coming days.

Regards
Greg


