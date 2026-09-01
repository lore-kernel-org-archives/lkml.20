Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF74E48CD74
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282649; cv=none; b=rSdtCYvRt7Qnxm8zG5X29yJODNavxorhA70+08Mmb0HGhD/sfvip3464b4yg7pTdSB/qXJB4H4X7aEQO4IUr/dznL76Uyuy4EjSubV0/A26rwGumTrw+7o4lbBbZeCFU500TTXPow7daIdJsPlH4C8ltEMIXbTGT8UeBJRxGCHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282649; c=relaxed/simple;
	bh=5qo7v/gpJc1CbggK4hTNGmLYaFMIdoEMU2yz9w/us1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEUg7XwRsV36NWTKQ9u8ZChrkb8cEoe/EqcjmSh0UXh6CKMEKGWwAFhCinuVWfK3A6pACvRoUUnrD4018mxmeeQNCBOyfeICww+DA+7lEWGY4SqbA83/9+Laj7MVJYPnajzeaF2+zSxGCvb17E1YC3pq/DQklyFWm0guwKYPfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KpJuvMG1; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KpJuvMG1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=b3mDyJMYkp/i264w4fKZKHaK9xTjUg7OEFZjOBho8I4=; b=KpJuvMG1yH0WCkzDar1H8jpS33
	joiBVoZnaB5jATNoSEwK3wVMcdLitl+ej/YjtgENiSp7tlscwHk6PeDBwZolMzu5qH+gLP+RGXRMt
	e2ze0dq5CPj8kTuFJSMgZigGyupueqLCd5hvHo5ogO2D9/6eLdjeQ7/wUqinQwVsOo28fGUmrnFfs
	lCbngre6C1HHydPbYE/vMjk8GqGsMk6UOD3AzjeClJ3JOQpy98R9bxWNDYmnAmjqnDB7UtLGKamm+
	+MKFlKMyRTIjvLlE0EtZbk1sTuJl5dH7KNEYV2y8D4rKnjykN1JIvzAOla2UsWsuHqvgHBBvpkbQ/
	CNJBiFeQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1S0P-0000000CllS-3gnX;
	Tue, 01 Sep 2026 17:10:43 +0000
Message-ID: <3dfbe1b4-74f7-4da8-9c8b-f658e9ead9a6@infradead.org>
Date: Tue, 1 Sep 2026 10:10:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/win_minmax: use /* notation for regular comments
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, Neal Cardwell <ncardwell@google.com>,
 Eric Dumazet <edumazet@google.com>, "David S . Miller"
 <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>
References: <20230102211614.26343-1-rdunlap@infradead.org>
 <apZ_kWb81yEVLt0N@black.igk.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <apZ_kWb81yEVLt0N@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/1/26 12:32 AM, Andy Shevchenko wrote:
> On Mon, Jan 02, 2023 at 01:16:14PM -0800, Randy Dunlap wrote:
>> Don't use kernel-doc "/**" notation for non-kernel-doc comments.
>> Prevents a kernel-doc warning:
>>
>> lib/win_minmax.c:31: warning: expecting prototype for lib/minmax.c(). Prototype was for minmax_subwin_update() instead
> 
> ...
> 
>> -/**
>> +/*
>>   * lib/minmax.c: windowed min/max tracker
> 
> Side note (just stumbled over it today), if you fixing like this it also makes
> sense to drop rather problematic filename in the file. Here is exactly a good
> example why (it's not the same as on the filesystem and in general easy to go
> south with time).

Ack. I'll try to do that in the future.

>>   *
>>   * Kathleen Nichols' algorithm for tracking the minimum (or maximum)
> 

-- 
~Randy

