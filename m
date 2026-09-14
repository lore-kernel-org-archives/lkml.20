Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AA93839BD;
	Mon, 14 Sep 2026 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411604; cv=none; b=HCzYgHHtHtUmVDGzoOq/pqkANCAlEDPwGI41F5fgacxz0PogG19S29M/Z8sodUAx0Mq9WybTWsUgy8Ca06siGR/JDYc+mCLKrGtzPd7ZEHM266m1Iwu4/8mgaQDDvnT9tSUlIHGH4xd9cb1yFnlD4LK4ngo1QsSc8Z09PaiboTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411604; c=relaxed/simple;
	bh=5DwOM+JlHMrk7osczJmYDl5uYrjV0i9Og8D/yzEFyQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rq2C5GFz4Q1Q2POWvF8Bczvn7qHoz5FsPJQnk3smLilYSas64Vv/2p3zHsydhcLpx5ZQtPi2m6ZngTZsrU6E+cnEstThqOeG+KJO+AMnvsJ3epq+siSK4ioYAaFihauyU6jAqoAD61fSJfcoWtP4eMWjQKLlHE8QyknAS3PkfQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AvQQXEbw; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AvQQXEbw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=jJGFCWeQVaCDhKRVdoRywcwM+hAI7Z/VaKx7DsHBri4=; b=AvQQXEbw9X9LaB7w27jIbWJNGf
	xLWq4mz4j0bIibCOdptYlLKqmTzgj1eUbonj+4XeU2WzqVNonRXrdaEZwc/Y8JFatSWJy1aoHrleI
	bpL4CfHPVvs3V5pEUjRtVFciS6uokXOg2TARnr61feloY3pwbxvbSiUlFpbWjEfhw2Z7EzZ7M7RWQ
	eG0pqeDyrMuUgo6bc8accKcHCnRp8qczM+ZsJlZOT6696H+DHzNa9OREdTu31AkHrxCARf0XkR3o9
	kDcAUZl050GcyXshNCy2c+wkg7Z5ui3soUAAtAWrmPbxYiigH8O1K+IDQiBEodB+us7P41hFdDAYP
	riAc6BBA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BhN-00000004Tqb-2IMO;
	Mon, 14 Sep 2026 18:46:37 +0000
Message-ID: <e12e3969-2c25-47e7-840a-99e7d0ec2f93@infradead.org>
Date: Mon, 14 Sep 2026 11:46:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: sound: hdspm: clean up driver doc.
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <20260914050900.1312415-1-rdunlap@infradead.org>
 <87cxufombl.wl-tiwai@suse.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87cxufombl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/14/26 8:59 AM, Takashi Iwai wrote:
> On Mon, 14 Sep 2026 07:09:00 +0200,
> Randy Dunlap wrote:
>>
>> Do some overall document cleanups:
>>
>> - add driver name for clarification
>> - fix some punctuation issues
>> - correct some capitalization
>> - correct some grammar
>> - convert a few words from German to English
>> - eliminate double use of "note:"
>> - unindent Precise Pointer bullets so that they are not part of the Hint
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Question: Is the precise_ptr documentation applicable to this driver?
>> 	Is preceise_ptr used in this driver? Not that I can see.
> 
> AFAIK, the precise_ptr has been dropped together with the support of
> RME RayDAT and AIO models (commit 0dca1793063c).  Essentially
> precise_ptr is always on.  Would you work on cleanup, too?

Yes, I'll update that and send a v2.

thanks.
-- 
~Randy

