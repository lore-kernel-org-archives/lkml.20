Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172E23E7167
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810159; cv=none; b=JY8sL6mRwBkEgATPaDgL311l+f7H7RjJ3yvPD4c8nQb6X2eq/uQalbau1YF7/4Vy/CmCya4TtsulGUYxcIp39VXvZ9x/gU+MEUhgGAm92qE9gyi20ZQCzrMgcD/EfiYi3XN8eHJ6ciEptrbp31j7nF0T2pWLBAo9oM48YYts9jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810159; c=relaxed/simple;
	bh=uBji+RnrUH+XkvxbwDxPRknf38Wap+u/67leP/iEL5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWaGzH8fNF7ABTocsldpQ8Tm3s42KUgHpBP5b7kYHN6kE3hyFcBXvKaeNUdXmpwSl/Wpi4Kt29YIE3Ye0lNa6R2NUESHbE+YiARkt2/5A2hx1EIpnuyOuvE2UhleYwdcOWUhZvDgYGvXZlGBC94sUudduFg+yc1X0pHyRjVZIOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGS/IuSD; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGS/IuSD"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so842992a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791810152; x=1792414952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=grHk5YVT5OWVqlenu8Z0ByAqSuSoAErWYw3gBTzDaq0=;
        b=MGS/IuSDNKzILetaaZ9PLhqwEUk/DZfrHq9jXMhx54eS5vKxg0l+a89jim/5H8mixd
         NUPXPKK+s5MqX6qozDB/dNXs2aJznIsahj4N1eiY3+3KSMm5HDvASbYog1HZXUmLrg0x
         zREGwK7HFZl/Umur8SMHYuupSGbPPBd+h2gEaq14GAKejfSepmh1fvd000Ok3yCsAcIo
         OHRWKyo4tHv8Cyvi5o8HeLEafAHZInkVtI4o7BUIW6zqbMErrk/M9xbc2Zbc+fnVRsBc
         Arr7fC3XwcSCXiVFoHDGMcdLzfGSXJAO8whD642MPnKqTaGxVHOY3yqSptTPM93VBmuE
         OA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810152; x=1792414952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grHk5YVT5OWVqlenu8Z0ByAqSuSoAErWYw3gBTzDaq0=;
        b=eNtzNuCoM91nZO13zSrFpaKVAR+BCGo6PGFki0EH56psSzwVomX15+7ufCnCDSp/Mo
         pDR/lVts/BjzHrQNMcVd2TlnlKgE3hH5mIZPOVOI+z2n2WtqPxUovW2/5V4VbntaKFth
         yJLf5bbPx36Z6idt+/CWAg+em1vOMp/L1lUTjfvlssHRSJ6uL0+RDfHc9x/pG/Ile70n
         xbM3/HoSQeBYhoKpEo2Hk7WU/vRtE6GwkfpPeudGnqCruB0i6OUC51nLp+vRiuoXFHva
         NrIowkQrkVlqkPj93DkSpA3OL13ICsalC5Fv3cSA4MRE6lUMglNbIEVp6DpV31L5MsDd
         j2uA==
X-Forwarded-Encrypted: i=1; AKwUvBxmus+mnZgUxOrpT3Qzg8x3Psuw7q9Z8dhrVRYKoZaEMv7ZZamaaH+xwgODmLPJy0HWxnnSuwfx/bIHz4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4NpsegyrGtjTG9icDBFaT0fF0g3TrsAKhwh7Nk6G5sDhPC0ba
	uiAdSDO2xobK8Atml0nYkdbsH+6Kepb/maUgj7g3MHqmOAXSMxUhGsJi
X-Gm-Gg: AYBFou24q3xwsm+LgGz0Y8h8QiIX12v4p/TPxTXVF2fzGQtUhERrTrZl49/Vb/VDcyc
	BILHBSNqxyfFReBWcjkN3MWVRZ4iEsGBT5ZUIYJDHVtpXpsr5yGj70jazEInZjrFe9yO4eBqMd2
	KH2NqkGGeG63yexYhbyC8SVe9IaGnO8qFe6rZc06vp8e05jxHrozDCQFdUnFzwcRbpzaYM/Otai
	9qSvO+eBXRKLoh6maPufVVAaXsMwxesFb1UxmnHzn4e2pL+y0V08Tzm/wMWfVGIGWAiwBMzuumL
	SHZANGc5U9QiYURT9c8ED9Sr0813e5jtVSaJlREInY/XRis9yMUy/3JYcLoqEK3zzetYznPc91a
	GsoXP4YEBvr8RAGM03u1rgoBzwPgh3UrQi/cCHNmKIT9FFrjmxt4+oOFQFkBGAxMerLtNjqZwuL
	Z2xyZGXBO5f9ClwsXpMMutSF/UIwsl9J8dmF7DSGxkMUodI6i6QI43Z+wO27cmvwqwgeiPVf0M3
	ApcRkH8U8cj9iOUxCuQfUz5JfcKnspRiMGA9EbKTZnvq6jV
X-Received: by 2002:a17:90b:58ec:b0:3ac:17c:6e85 with SMTP id 98e67ed59e1d1-3ac017c7034mr1773017a91.47.1791810152014;
        Mon, 12 Oct 2026 06:02:32 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:9cd6:11aa:387c:a1aa? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ca0033sm16302097a91.2.2026.10.12.06.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:02:30 -0700 (PDT)
Message-ID: <0a4cd921-d233-4e5e-b98a-7130690c37f3@gmail.com>
Date: Mon, 12 Oct 2026 21:02:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] platform/x86: bitland-mifs-wmi: Add quirks table
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>,
 platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>,
 Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
 Chris Taraszka <chris@miget.com>,
 Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/ig==?=
 =?UTF-8?B?5paH?= <btx342@gmail.com>, powerfullz <wleizc7319@gmail.com>,
 =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
 =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe
 <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>
References: <20261012100532.19612-1-qby140326@gmail.com>
 <20261012100532.19612-6-qby140326@gmail.com>
 <686c6dc8-965b-331f-a3de-6452ee5e2a53@linux.intel.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <686c6dc8-965b-331f-a3de-6452ee5e2a53@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/26 20:31, Ilpo Järvinen wrote:
> On Mon, 12 Oct 2026, Mingyou Chen wrote:
>
>> The MIFS WMI interface is shared by several Bitland ODM laptops which
>> differ in the layout of the performance mode values of
>> WMI_FN_SYSTEM_PER_MODE and in the capability checks.
>>
>> Introduce a quirks table to support multiple machine families without
>> sprinkling model checks over the driver.
>>
>> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
>> ---
>>   drivers/platform/x86/bitland-mifs-wmi.c | 178 ++++++++++++++++--------
>>   1 file changed, 121 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
>> index 93a519b96189..d61382ad4a0b 100644
>> --- a/drivers/platform/x86/bitland-mifs-wmi.c
>> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/bits.h>
>>   #include <linux/container_of.h>
>>   #include <linux/dev_printk.h>
>> +#include <linux/dmi.h>
>>   #include <linux/device.h>
>>   #include <linux/device/devres.h>
>>   #include <linux/err.h>
>> @@ -84,6 +85,41 @@ enum bitland_mifs_power_profile {
>>   	WMI_PP_FULL_SPEED	= 3,
>>   };
>>   
>> +struct bitland_mifs_wmi_data;
>> +
>> +struct bitland_profile_entry {
>> +	enum platform_profile_option profile;
>> +	u8 wmi_val;
>> +	bool no_set;
> What is this for? I don't see you using it.
>
> If it's to disable a mode, I don't like the approach.
>
> --
>   i.

It's intent to mark a mode is only available for GET (no SET methods 
allowed).

Like the WMI_PP_XIAOMI_QUIET_ALT mentioned in Chris' patch. The profile 
is only available for read.

enum bitland_mifs_xiaomi_power_profile {
	WMI_PP_XIAOMI_QUIET		= 0x02,	/* 18 W */
	WMI_PP_XIAOMI_BALANCED		= 0x03,	/* 37 W */
	WMI_PP_XIAOMI_PERFORMANCE	= 0x04,	/* 58 W */
	WMI_PP_XIAOMI_SMART		= 0x09,	/* 45 W */
	WMI_PP_XIAOMI_QUIET_ALT		= 0x0a,	/* 18 W */
};

https://lore.kernel.org/platform-driver-x86/20260928153902.139956-1-chris@miget.com/

