Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.203.187.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800826;
	b=wWBCFy1Qf1v5DnxedadQuJENXm0NIHGNVW5+izQHvxWT0okz1IGeKKO0vJB0yimiyA3E
	 OqNJTbqU4HyDqqqulIeyEPiFdDt93tVYS2tTa2CeqHGQa/6hvGlxAe8XNqlBQYnLHhKAQ
	 wmI52r0w3n4sYXsPfuqySgomuDSpPVCuyYVfnU7/+nSqpp/LP70oBJqBi24EsJiEFp+ah
	 chvLo3FVaYrLvQh3pcuq1UXo7lj8CARWmJPoNllewLiXqBc55SO3ipTS1+93riPcEcGFK
	 hkH4+siCdbYVUSBMtVPcie1czSAtm9+yqYDW2ZQHKMqY9MaHyfNbx24KCrv7IdJxdIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800826;
	h=DMARC-Filter:DKIM-Signature:X-Auth-ID:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Classification-ID;
	bh=gtu+hzGn3aGLKaDYo1Mr+9WLcIXWlkDfggVIc91fF5g=;
	b=fgL54EmfYObrp65VAXXpLcPG65a09IOt8cJtDpt5A7iR203oA3JP848VyjHnlq++90o5
	 JgMnAakGdFv+qbCh0exBSu4V/Y/FBdGTRBFwJmOUVTSgBhnW4gQK5BI4PObZOGsI1ml13
	 MOwkSmnAuoQX1JKdArvWUfAOP5VQ5jZQV3ZnIhJX4868Nxw4np15sUitx9LRjbQo4tjTK
	 apTz1bKa6SuoHs3Ts3pSMfPZeerYlly+6I12jZ1pIj6wMUFAcaNYuM5rnCIDtNYMtY5HO
	 /v/EvgjV4yIuz4HrJdVzFdyrCbkb588iUU8fF/aDC5FYOxehnB0zlp1pHS137i7lbkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mev.co.uk;
	spf=pass smtp.mailfrom=mev.co.uk;
	dkim=pass header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b="gHxZc/VI";
	arc=none smtp.remote-ip=173.203.187.68
Received: from smtp68.iad3a.emailsrvr.com (smtp68.iad3a.emailsrvr.com [173.203.187.68])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C4606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8C4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=gHxZc/VI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1793800819;
	bh=Jxl2G5Gs0PaOC0ojVzQBQl+zMGYrB8Adv+8bHCZSD0M=;
	h=Date:Subject:To:From:From;
	b=gHxZc/VIjqmxtl4U4vU78GOpYOfheRHHug3qd6/loRf3c2T3KQ8eDKOkKxx8tfb1P
	 trsDGjPhSATc3Y01H+zFqOyDS8MoZbGh2JAHvUy+FyKMg7H3zpH8CL3zLpN2A1VyYe
	 eSUdl+X6QTyVIB03WmQHVl8dnh/5LUVZFFmcnn0Q=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp1.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id A722B176D;
	Wed,  4 Nov 2026 09:00:18 -0500 (EST)
Message-ID: <f6c42bba-e4c7-494e-b22a-a56ce153d71d@mev.co.uk>
Date: Wed, 4 Nov 2026 14:00:17 +0000
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
Subject: Re: [PATCH] comedi: comedi_bond: Fix leak of opened device references
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Wentao Liang <vulab@iscas.ac.cn>
References: <20261103173610.89687-1-abbotti@mev.co.uk>
 <2026110414-conjuror-squid-2777@gregkh>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <2026110414-conjuror-squid-2777@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: d0206ee4-f9a2-4eeb-acee-f3bfed4ffcfc-1-1

On 04/11/2026 12:59, Greg Kroah-Hartman wrote:
> On Tue, Nov 03, 2026 at 05:36:10PM +0000, Ian Abbott wrote:
>> bonding_attach() calls do_dev_config() to open other comedi devices
>> specified by the user and tries to make use of them as part of the
>> 'bonding' device.  If it successfully opens the other device but cannot
>> use it (either because it does not any subdevices of a type the
>> 'bonding' device can use, or because of some error that occurs while
>> dealing with its subdevices) then it is left in the open state and the
>> fact that it is open does not get recorded by the 'bonding' device, so
>> the reference to the opened device gets lost.  Fix it by closing the
>> opened device if it could not be bound to the 'bonding' device.
>>
>> To match previous behavior, if the opened device is unsuitable then
>> ignore it (after closing it).  The opened devices recorded by the
>> 'bonding' device will eventually get closed by bonding_detach() even if
>> bonding_attach() returns an error.
>>
>> Fixes: 3cf840f65ad5 ("Staging: comedi: add comedi_bond driver")
>> Reported-by: Wentao Liang <vulab@iscas.ac.cn>
> 
> This is a known bot.  I'll be glad to take this patch if you redo it
> from you and that you take the authorship.  As-is, I can't take it from
> this fake "author", sorry.
> 
> greg k-h

Actually, I did redo it in a completely different way to the original 
patch.  I just used the original patch as a bug report.  Should I remove 
just the "Reported-by:" line, or should I also remove the "Link:" to the 
original patch from the bot?

Cheers,
Ian

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
