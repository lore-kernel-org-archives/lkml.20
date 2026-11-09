Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237068;
	b=XAQPoEWxCbM6jEb00HE8q+ZRjhFWLJkQ9V+sK+A345L5Ng5Pk7r0e0d3NBT3UNevFiwa
	 ZTJMNTNTaiPFZHIWUUgxS4tUXPXfRo+oIw1AN2XRh07ELJnqPw7SLyy3nOHi2h6Cxe3eW
	 cIREVmgBCt6HYi9AkYKf8CHqE63XV3vNlYj5Mh6g06EDOJQ6EoGwlheytchCh/14sl54I
	 WqebT3cloY92GjIh6Um3yVURA42v78qjNyIWkrDicSPkGuq0YsLdWQzbXWxh5ES1lnWO2
	 14ffa0f7KTIzAbpV2BVxtkKvUiQD/IaSTA7IwSB9/w2h1pssRADFgsNl7MvhFl8DNRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237068;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=uGfg7qyz+Mob49HILdEQHSBVwOgoxsBxFYRGd/5ckX0=;
	b=cyAhmUFg6JPvQzc7gkcRpQ+l4jecmQDi+n0ARsEzRUb3rFcd6PDKxjMhchjNdaNSS0hc
	 6bFxCXo8uVfHbKjohsBjLmPefeqlvR2ikz7Px8EaSjHpkwVLzuGHaqGGp+Q6ZsRlHh92j
	 5J1nK9DhLAvDRcHBhdOvAiHveOArznaOqr87o/30NS2WUk1+vhGJ4c+hJjTILFxQ8/WQ/
	 W9Eltz5TnVR9gshXVqpZ3f8rEXFTtZmC3YlNzCGcjcjDDvg3OKBr/1DL4AKmhdYq/A5j7
	 iI91kkwCMAMiQ1jxn2fsBMD6aDPq4SApLooYpdlCiSEhCN8Z6zmaTeirVWBJO7ladaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=mRF8zOzK;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540FA606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540FA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=mRF8zOzK
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id QQSgxBViWyb4YQR1XxlKZl; Mon, 09 Nov 2026 15:11:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QR1Vx0AEHFhzrQR1WxNCRg; Mon, 09 Nov 2026 15:11:06 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6af1e28b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=R5C9hjxsAAAA:8
 a=aTefX-UtI5BFv7nUFlIA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=uGfg7qyz+Mob49HILdEQHSBVwOgoxsBxFYRGd/5ckX0=; b=mRF8zOzKD56g
	5RcLnwxX/H9v70BlJar9VxSykh2a5qSVcvb+SX0s2WH+sha4FhQlqFSEzW9o2EQd4PxEvemqi44gd
	Fhka4fp2GfkZyNXhu73BCfnzzoIBs+Wh2ivIeuUuv7Lih6A+FITRLSSgn3Byc58WOQG9TVkSlYuwP
	SgVyFdtVhQboVBARUi9YXY/DCE4ioKVnZD4ASt6hDgagglGDRR6pDeP+fvMI5Zbg2VbBvBle69pvS
	UB5CVa22SNWudbXX+j8esNaCO8CUJ//MsLAaennR1S4rXy5AI8SI0VJKorPeuzl3cwa8G5oAxvSn2
	P1mRyhmcOkVN+W35eBP1Yw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50750)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQR1V-000000014hK-2a0E;
	Mon, 09 Nov 2026 20:41:05 +0530
Message-ID: <59a7e61f-ce9c-4bba-b2c8-6e19b3d84081@roeck-us.net>
Date: Mon, 9 Nov 2026 07:11:04 -0800
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
Subject: Re: [PATCH] hwmon: (lochnagar) Avoid oversized shifts for zero
 readings
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: rf@opensource.cirrus.com, patches@opensource.cirrus.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109093453.5384-1-zhujun2@cmss.chinamobile.com>
 <avGsCiZK7ChHaHx2@opensource.cirrus.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <avGsCiZK7ChHaHx2@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQR1V-000000014hK-2a0E
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:50750
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH/6IHCbW5DzoWRnkausuWMbPzPEZfzoXm89USsMFW8WClqSOEd98jZ3ZwDrzp9Srk9vlbpefO0VfagaRfeq8pYj12yUhb3mVJfW3HgszaWrllomUCjG
 fg90czc8J8jGpH+I4e+iq0+UgO5rd9FaRH8LqoYhJ50yM+7T38YFFCUSvL6G+BjTVJFKr4/nF0i7YtaiOLvCbJQBLyJBv0uA6sG62zDX4sVGTc3awfdK7bjX

On 11/9/26 03:18, Charles Keepax wrote:
> On Mon, Nov 09, 2026 at 05:33:32PM +0800, Zhu Jun wrote:
>> From: zhujun <zhujun2@cmss.chinamobile.com>
>>
>> A zero IEEE754 reading gives exp = -150 in float_to_long(). Both shifts
>> in the rounding expression then exceed the width of u64. UBSAN reports a
>> shift exponent of 149, and the conversion can return a nonzero reading.
>>
>> Return zero when the required right shift is at least 64 bits. With the
>> supported precisions, the scaled mantissa is too small to round up in
>> this case.
>>
>> Fixes: 4cdb56214746 ("hwmon: lochnagar: Add Lochnagar 2 hardware monitoring driver")
>> ---
>> Validation: x86-64 and i386 driver objects built with W=1.
>> Source-extracted boundary tests passed on 32-bit and 64-bit;
>> the corresponding test fails on the base revision. I/O is mocked.
>> No physical sensor hardware or booted-kernel test was available.
>> OpenAI Codex assisted analysis, code, tests and changelog drafting.
>> The human submitter must review and add their Signed-off-by.
> 
> Yeah afraid the human submitter will need to add their
> Signed-off-by :-)
> 

... and remove the AI comment that it needs to be added. Unfortunately
that didn't happen, suggesting that the human submitter didn't even read
those comments, making it questionable if they were actually reviewed.
I can not apply any of the patches due to the missing signature,
making them just noise. Too bad :-(.

In the case of this patch, unless I am missing something, it isn't really
needed because the large shift causes the result to be 0 anyway.

Guenter

