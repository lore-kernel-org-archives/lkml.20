Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713869;
	b=WllP1RTepvzbBh2W6inUxBsQrKjihhwB9dSYwCvfxG3MEHlQrgvD16hvB9aQiym4an0o
	 DqdjRpHkMAP0PErPPWfEYj2BQEhGP5yuV1tTRehWw6/K/i59eQHLuU8+4BKqSz8BxITZp
	 KG8Pxio/VrBumJafexqYja6RaGOE18e5zSsKdIBuXOnxSrRryiTD7u0jnNqwdNzCand2r
	 O6/k/aFgxEr++xmiUxN+Z9LkFSCwKd1Y0as2qOXsoNOWGM1LONzWFuAy8ReUDu0uBOyxB
	 gI7xIvVp+PaT6/QWtp65CdUh9r000udOAA1pW0F3HnHTQxr9DxhL/G0IE0KPjjn3z8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713869;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=kAZHHRNJQTBE7m/Mdeu3wvd8YYTG4G1JA7sRIt/FlQI=;
	b=j8x7jQqM+51bGq/KYXfW/8cVKQ+ZTDjBPwIMP89yYCqsuq+B6QmkBm/8sPCPStQa6/Cl
	 TCvuP7E35wDcWqygkR7l89/v0YzzNcQ9DWeSecJMWqpbO8Rmss/tZcKGRLSqBqdCRSj1Y
	 HlXUKoM6CzYPVqccoh3pCls96aohu9y/yDhhjLqSVLcEEf2qP7TllSlyrNV588u8iXjsH
	 DF85TSuwjO2JsiEoOe6qEXEdibm48a7BHyHzJEHXVsTcAqhCIRSTh/YQnoN+OU8i7iEpA
	 Zh1yBVfGwU2m93cx9vhXTjGGb4vEh0zNfVLP6CA6mN+MIpF55hvhN4/loz2QLQHQeDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IY8HlU3W;
	arc=none smtp.remote-ip=209.85.167.226
Received: from mail-oi1-f226.google.com (mail-oi1-f226.google.com [209.85.167.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08108606D823
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08108606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IY8HlU3W
Received: by mail-oi1-f226.google.com with SMTP id 5614622812f47-55651e7de9bso2538538b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713868; x=1794318668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kAZHHRNJQTBE7m/Mdeu3wvd8YYTG4G1JA7sRIt/FlQI=;
        b=uzIrYgL1L5rfsvWH2Vf2Ygsd0t81gUo5zm1kp4jvnBWtP/ojy0yRU1L9x7TsVh4wwY
         WdLe2XhM8+3tJ8QSSHWTMwT9jjodcLmIBj7gvOZqf3D+9ioNEJ2NeQvnfI9kidyoRHFf
         HEJyi/DJMaV4noaON7FtUUAA68fU7UNDm68IcT/fj1TjSD0GlStjWz1mp4rNabcjgpWp
         9VzM2w2+IFGffwFiVEtNRqlAOxHhDRH21/qMXNvap96/DAM4IIKyA/Au4oyEPd/4sce1
         9YNp/4hmjI5yRvcrOr5eFQoiIALPJRLvukeH+ecd3GPxe3EDXbTJPhssNwSm2zlUWMMi
         fGUw==
X-Forwarded-Encrypted: i=1; AKwUvByJUnFnqe1A+CeUAtnnz4gWK2UJGCggrn+XJoe3azlWIB2Mvo6Bs39mZjw56Nm9nHr9iWU3pC3jAwE8Huo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9igb/EmUgw3i/J9WTY3Ek51fSzOU01V2W7ufg/TMIiGmqK8HVa
	qhM8Ju3C1krB/IVMoWb+oqAsc60T8dpA1gAS/onUb3UnyUpDqJhZpqjErlN+KrlTiFyqNgBVY6S
	lc86FHSDquYLYt3U3ePp/fuAagwCkHOOckz7chG/aSqDclEPtrCJLc50zpf0atJWVos/lVHx0ER
	nY8+yyTS4SmbzMsQ2zxqeekirqpMlsAYXtx1Wo+0ngCOcBDl4JPvXluuaVd7hfiXmQb6wrqFnvJ
	4B1onKEDIIn1U73iC9gRsE4UA==
X-Gm-Gg: AYBFou1Cs69c6G9uEIBv4WZwftsD2Rt7dtUxcK0FVfN0ylILSU5KBqQAJYK+9CE2LJq
	Iu5mmtUjC54ePIH4FCGt+Ne3Zc08FON0m38anu+PUf/rWVZfl9NNtt5w/3tXWHpCe73oXJAFJoL
	1uc3V/pFmrwmaT9wGyEaAysJcxQ/0yDJFrgxrz81+vo2ygjtDM7rqPFbhBmRAEqK8AnT/ZJKefL
	+Yc1JuvDETgazf0m/2i3DSdckrN5M7VpywGzWw+ejyuiwT5hGLKaIyQ/A8kfN83j45kbDi6rHHH
	4kPt0IKBrp/wYAtxZnIzkrDzuhB4UztVDYAtcGTJctgU4R4BdGEUXlRncHCYWBPrCo8FnCnbUg+
	7BiLN1Hdn3RSXtgOwXa2J0+GYxK2gLKbmLeH4405XH1ukR9C8eKmh7/9cyjnC2m00ydKGF7CFQI
	1s2/yH6V1jiuBf+f7qg8Dxi0PhiqSmE/m3xUSoZNs=
X-Received: by 2002:a05:6809:8d:20b0:564:4f93:7098 with SMTP id 5614622812f47-5644f9374cemr2601689b6e.67.1793713867878;
        Tue, 03 Nov 2026 05:51:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4a921a9144bsm79401fac.26.2026.11.03.05.51.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:51:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338ff2cf14so81572521cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793713865; x=1794318665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAZHHRNJQTBE7m/Mdeu3wvd8YYTG4G1JA7sRIt/FlQI=;
        b=IY8HlU3WxUDePY2105RkzMhKUipiohAFAr6U/x1iS19f5qa9jwLwhARxMrjMckEz6I
         +JEG6N89TD2IMttxY9WgdpqqBSKBgbNYGROHJCMO8JmiaePzOqkkzkac7Ib05qSGJrBZ
         DEdTMnnXr91GSBvrCeL6s5crRSOQMEycex6N8=
X-Forwarded-Encrypted: i=1; AKwUvBxQMCI9CiV5x7e3ZDoJ6iau1lPBRiGIuXJqEsm6I/LG/30c0j89wuv11EnYfQ7+s5l5qEonG/7ryzCSin8=@vger.kernel.org
X-Received: by 2002:ac8:5a4a:0:b0:535:84e3:ceef with SMTP id d75a77b69052e-542b781c626mr217069781cf.45.1793713865347;
        Tue, 03 Nov 2026 05:51:05 -0800 (PST)
X-Received: by 2002:ac8:5a4a:0:b0:535:84e3:ceef with SMTP id d75a77b69052e-542b781c626mr217069361cf.45.1793713864762;
        Tue, 03 Nov 2026 05:51:04 -0800 (PST)
Received: from [10.176.3.155] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e77e5efc3sm870636d6.39.2026.11.03.05.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:51:03 -0800 (PST)
Message-ID: <533b31e4-c837-494d-a4ce-a728bfbe07b2@broadcom.com>
Date: Tue, 3 Nov 2026 14:51:00 +0100
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
Subject: Re: [PATCH 00/13] wifi: brcmfmac: Add BCM4388 support
To: Janne Grunau <j@jannau.net>
Cc: michael.reeves077@gmail.com, Pieter-Paul Giesberts
 <pieterpg@broadcom.com>, "Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
 Mathy Vanhoef <vanhoefm@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>, Daniel Berlin <dberlin@dberlin.org>,
 linux-kernel@vger.kernel.org, Hante Meuleman <meuleman@broadcom.com>,
 linux-hardening@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 Izabela Bakollari <ibakolla@redhat.com>
References: <20260925-brcm4388-submit-v1-0-b5cbc2cde2fb@gmail.com>
 <d78cbbd2-601a-4cf1-800f-3be57a2b7de2@broadcom.com>
 <20261102204627.GB770347@robin.jannau.net>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261102204627.GB770347@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 02/11/2026 21:46, Janne Grunau wrote:
> On Sun, Nov 01, 2026 at 08:27:22PM +0100, Arend van Spriel wrote:
>> + Peter, Izabela
>>
>> On 25/09/2026 15:43, Michael Reeves via B4 Relay wrote:
>>> The Broadcom BCM4388 chipset requires new PCIe initialization and
>>> firmware interfaces. Add support for these interfaces to brcmfmac to
>>> enable basic station operation.
>>>
>>> This series adds:
>>> - Signed firmware loading and mailbox transport
>>> - Fixes for chip identification and firmware capability matching
>>> - Versioned scan and join requests, and extended PMK payloads
>>> - Updated event mask handling
>>>
>>> These changes include work by Hector Martin and Daniel Berlin from Asahi
>>> Linux, refactored where needed for upstream inclusion.
>>>
>>> The series provides basic station support only. 6 GHz support is planned
>>> for a follow-up patchset after this lands. The driver retains legacy
>>> interfaces for older firmware.
>>>
>>> Tested on an Apple M3 MacBook Air (J613):
>>> - Device boot and network scanning
>>> - 5 GHz WPA2-PSK association and DHCP
>>> - Bidirectional TCP traffic
>>
>> Finally got some time to get this series tested on my setup. The patches
>> generally look good. So far no regressions observed. It would be good if
>> some more people could test this series on their equipment. I will do
>> some more testing and wait some days.
> 
> Tested series on top of v7.3 + commit 7ed5dce55fa8 ("wifi: brcmfmac: map
> msgbuf RX packet IDs bidirectional") in wireless/main with resolving the
> conflict by dropping the conflicting hunk of this series.
> 
> Tested on Mac mini (M1, BCM4378) and Macbook Pro 14-inch (M1 Max,
> BCM4387) without regressions (except for the resolved RX msgbuf
> mapping).
> 
> Tested-by: Janne Grunau <j@jannau.net>
No regressions seen on my 43664 and 43455 devices. So will process the 
patches now.

Regards,
Arend
