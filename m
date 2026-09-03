Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B321412BFB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421677; cv=none; b=Mk3zmTx1rmpiRwR6LOwgR3R+qe4KXjPraEvEodxGJ3wirqUb4kPawcMRWuhlcXFRLoTI2xAEEn7ZR0zuFRXP7MOfJcHmGPtfBQgtOAQZhSwYRrVpV8zzETmkxvIzmRiMAOAgyZH4RNy1ctVXm4Wd3UJED76Mt+fanp/ek5+VHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421677; c=relaxed/simple;
	bh=imCkeXbS8TdnEfLcrGpGKahoCmkpvuvbQG4Dqv/gX6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISwRv7I6pSCaeyEp1RdwUGguWG5ddjykYogbJZCYH4hQQO2biFq+AYMF8naNzg4V1br4gJX1E4V71bHpyp86VB8QPPOz6IjGt49qkPy9IfjUyNHL4gcJgK4aIu35dFQ25LFAfMZtRfkd5pB79ff9iW9YU4gatObf8MyC+a+PhSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CgtdVYUO; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CgtdVYUO"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=imCkeXbS8TdnEfLcrGpGKahoCmkpvuvbQG4Dqv/gX6E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788421672; v=1; x=1789026472;
 b=CgtdVYUO2LFrjoRgf8Q6Y3bDJUCREwlhkMtDZT062+n7rAHVCM5O+8I/c5cclcZtMovhp18P
 kgGM2P0wien3EfOQ87/YoPxVdotNYXvaPaPhwQ2DxiDkIpN8h2pgNpEyIHq56wX+c8H89ARTJaC
 nww0MtVtJDIzTICJXj1zC8ls=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5c9fc66824390f15;
	Thu, 03 Sep 2026 07:47:52 +0000
X-Mizu-Trace-ID: 5c9fc66824390f15
X-Migadu-Flow: FLOW_OUT
Message-ID: <e046eddf-3c2b-42a9-b201-c919ebb217ac@linux.dev>
Date: Thu, 3 Sep 2026 13:17:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS, mailmap: use Aditya Garg's linux.dev account
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Aditya Garg <gargaditya08@proton.me>
Cc: Aditya Garg <aditya.garg@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260723100136.14467-1-aditya.garg@linux.dev>
 <27a31a37-688d-427b-a0ba-c3133db19c97@suse.de>
 <txsiv43u7qv-Pc_dRDdbgiUHVP54rhl5g-xLzQU457o0E29MYkL9FX-zdozYxVySvTed10VduLizWQw3zNDJTGxTIfFLX71G3U_Kj3qnJao=@proton.me>
 <47df26aa-a160-4306-84f0-510584c3e8e0@suse.de>
Content-Language: en-US
From: Aditya Garg <aditya.garg@linux.dev>
In-Reply-To: <47df26aa-a160-4306-84f0-510584c3e8e0@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/3/26 1:16 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.09.26 um 08:57 schrieb Aditya Garg:
>> Hi
>>
>>> Am 23.07.26 um 12:01 schrieb Aditya Garg:
>>>> From: Aditya Garg <gargaditya08@live.com>
>>>>
>>>> Due to non standard IMAP and SMTP protocols by Proton Mail, the account
>>>> was giving trouble. Since my linux.dev account has been approved, all
>>>> communication related to Linux development shall now be done there.
>>>>
>>>> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Can someone please merge this. I am still receiving mails on my old email which I do not use for dev work anymore.
> 
> Done now. The update will go out with the next drm-misc-fixes.

Thanks a lot
> 
> Best regards
> Thomas
> 
>>
>>>> ---
>>>>    .mailmap    | 3 ++-
>>>>    MAINTAINERS | 2 +-
>>>>    2 files changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/.mailmap b/.mailmap
>>>> index 501d858cb..baea6ba4d 100644
>>>> --- a/.mailmap
>>>> +++ b/.mailmap
>>>> @@ -19,7 +19,8 @@ Abhinav Kumar <quic_abhinavk@quicinc.com> <abhinavk@codeaurora.org>
>>>>    Ahmad Masri <quic_amasri@quicinc.com> <amasri@codeaurora.org>
>>>>    Adam Oldham <oldhamca@gmail.com>
>>>>    Adam Radford <aradford@gmail.com>
>>>> -Aditya Garg <gargaditya08@proton.me> <gargaditya08@live.com>
>>>> +Aditya Garg <aditya.garg@linux.dev> <gargaditya08@live.com>
>>>> +Aditya Garg <aditya.garg@linux.dev> <gargaditya08@proton.me>
>>>>    Adriana Reus <adi.reus@gmail.com> <adriana.reus@intel.com>
>>>>    Adrian Bunk <bunk@stusta.de>
>>>>    Ajay Kaher <ajay.kaher@broadcom.com> <akaher@vmware.com>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 1ab873685..f32e63428 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -7970,7 +7970,7 @@ F:    drivers/gpu/drm/sun4i/sun8i*
>>>>
>>>>    DRM DRIVER FOR APPLE TOUCH BARS
>>>>    M:    Aun-Ali Zaidi <admin@kodeit.net>
>>>> -M:    Aditya Garg <gargaditya08@proton.me>
>>>> +M:    Aditya Garg <aditya.garg@linux.dev>
>>>>    L:    dri-devel@lists.freedesktop.org
>>>>    S:    Maintained
>>>>    T:    git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>> -- 
>>> -- 
>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Software Solutions Germany GmbH
>>> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
>>> GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)
> 

