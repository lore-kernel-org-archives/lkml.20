Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1614B95CF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596742; cv=none; b=CuGEWJsBqfTLkttz22gUl2ZciZcpTWniPkULKOtzUdaby4qj127DRnFWmvgrTnxO/VdlixMyra5PUyxsGr/A3S1y7qA0cb3p/yzl4DLLfT5ASZB42wcq2uGsOGqrFc3RIUyXkriOJ7r20f83etPeHqmqO8bdbCqsUsm3D17rXUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596742; c=relaxed/simple;
	bh=CqbVlokaOL+bm8eId/Ib/ejGZ1bk7rb3ux6JMzy2uuc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XR8fvbUravAC82/DQlPm8URYISEzNNsEh+7VJSrUZPykB/iqEs59DMPoKiYhzQjSSzQlm8FpxwVYjCgAOL94LDu/G6xk4Ahd1wG3XGWwvSBJvdFOehYRrkklOniPJvbtA2LZLDG4dDN3vjfZ+9A0KOVDwlvuDUxQWuGqLcKBRk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=aAYZBbp7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="aAYZBbp7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso1390255e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1790596738; x=1791201538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v3UXri323pcC3w5ZlfRHuF0Grc9/qviDz0NEMAdVQdo=;
        b=aAYZBbp7AVGb9w93+Zf0gU7J1kmTpBGdJZTXrzk2NBpoNXxSPL4Zj+4u73UYeTX/Lv
         m3Hu47K7uDOBn8zhHohRAonfT2bNrjHd6SgxuaKOq5TdCMKCX3q8AZOmqJ8GDKBj7JXh
         KoG6b+L5enc1TO+QyySh1kWdpRQTfxeZ3tdW9hGWrFaUB1m6Ki8aUWn0ZPxQeQgq00sm
         RbkxJCEY3j7FUhJvnDCOFIw34fXchS5FHy6OtQYH5BzG8X8VMHr3OdVrddUOHhuKgmGm
         VrWFOmIpIjIincH3Vw4U5FFkcE5lvh4XcecVHWkzxjJxN/4n+4gjdcywceh5KqiyFtOd
         7E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790596738; x=1791201538;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v3UXri323pcC3w5ZlfRHuF0Grc9/qviDz0NEMAdVQdo=;
        b=l1DmuNSQE3TstCeBOQRTU/vZDdlAjsF+Rf7IuZwoRlH6OD+rtGb+WreqLkWWb2qfFO
         SMLgCWi2ZRS7YCmvU8hjselATUUz74vprfMamiN0U8wErBW3SA53ceDKw7N2K9Gmhtvn
         NWsxooUcJ8bt5lMx71pmMMikPHwpwqhVeZjBf2rTnEsIksrD1386Ljx9pXFvocuscqjF
         Q1hAo8EpoyTmKRk73GxOjGrPVJIvAhvMapuazZNrCkQkKg/LiN6LscsvfcA48IB9HJc9
         hNxDaQLeM9pw3Lp5JiqSNdB4lIsyL0xHQctqQejpSTsK3titaUeAv9/5SX+hQPMt32iw
         sbPw==
X-Forwarded-Encrypted: i=1; AKwUvBxh5lkdeBLuYCRfTcgwEbfbw6xVQbb8Va8Aeshul1rXtW4MA1bDZJKhas1Oia+wpQO/lZeowtJ1oC56TU4=@vger.kernel.org
X-Gm-Message-State: AFuF++l0xZEAewtW7gCEtjMtRa7PeZf1AIuJo+dZZd+zllVow5cidFHy
	MGR4pED0HrQJsKD7HDxvUEk6xj8fjRDAoL4TX2I4PURnWVUOka1C0wSfK7H88rksSfs=
X-Gm-Gg: AYBFou2d0XzMZQoXgM5FiL40Az+IeZx84yufnJMECRpVF+6JfJsHkzTMfgORZ/82Spr
	GrkrgJ1ayWEItpRpnlqSqMz1HJKWWP4Ub/JJv8qvwnXh2QO+XQTv/xZ7G4aqF+rg8rBGIcHu4bU
	XoHTT6LLgMjB32HVgPy8Fv2mdnld8cZCV4H/fp2LsOzvYGJ/b5BuAIy7emCC8bytBpfc38bwti7
	XseUyLR7kvNixFSqY5BQj5NTPP//xmO4CRj/b772aXCv5EvEwKD0nkPFRNaPCLDxfNSIvTxfEZ9
	yKcDHSbIeuVePbuxIe6jQNXfqOgjXepQbO8FOXgXtQP3C1ydqN7Gof+fa8LxHyE/UTh4nylGrFK
	COTs1bZ8LG0d7GoN66DtrzZOem+4qOUgjYO/c4Ygms+g6Qh1e+XOf9IbMFKNzy0XaLNps03AUMD
	kny/QkVRwzcT5lLFZOxe4zHsofwGaikQidTUPw0Om0NaazqCqeScL7dHzMPxpMzktlYO3bwceC+
	MSZPOowXya4eZpaCa7Iehevo/BMmJQrRk/5XC3XXPVZ7LlfwXI=
X-Received: by 2002:a05:600c:a414:b0:49f:ff2c:e0cf with SMTP id 5b1f17b1804b1-49fff2ce1a7mr76035515e9.0.1790596738417;
        Mon, 28 Sep 2026 04:58:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017652d1sm200581185e9.5.2026.09.28.04.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 04:58:57 -0700 (PDT)
Message-ID: <f72a5150-4c75-4d71-93a8-8b261ca9762a@6wind.com>
Date: Mon, 28 Sep 2026 13:58:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v8 2/5] net: add a generation counter for dev->mc
 changes
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
References: <20260927002427.4519-1-sigefriedhyy@gmail.com>
 <20260927002427.4519-3-sigefriedhyy@gmail.com>
 <cd00e6e7-aa2d-4f98-8a79-083b64b3376a@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <cd00e6e7-aa2d-4f98-8a79-083b64b3376a@6wind.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 28/09/2026 à 09:53, Nicolas Dichtel a écrit :
> 
> 
> Le 27/09/2026 à 02:24, Yuyang Huang a écrit :
>> A multi-part RTM_GETMULTICAST dump of dev->mc resumes by position, so
>> entries added or removed between two dump rounds can be skipped or
>> repeated. The IPv4 and IPv6 dumps report that with NLM_F_DUMP_INTR by
>> stamping cb->seq from a per netns generation counter combined with
>> dev_base_seq, see inet_base_seq().
>>
>> Add the equivalent for the device multicast lists: a per netns counter
>> bumped whenever an entry is added to or removed from any dev->mc. The
>> list helpers do not know which device a list belongs to, so give
>> netdev_hw_addr_list an owner, set for the lists of a device and NULL
>> for snapshots and other standalone lists, and change list->count
>> through helpers that bump the counter of dev_net(owner) when the list
>> is dev->mc. That covers the dev_mc_* helpers, both lists of a sync,
>> the hardware sync helpers drivers call from their rx mode callbacks or
>> their own workers and the reconciliation after an asynchronous rx mode
>> update. It is atomic since the writers only hold the address lock of
>> their own device.
>>
>> Used by the following patch for the AF_PACKET multicast dump.
>>
>> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> 
> 
> If another version is needed, you can rename counter to _counter to highlight
> that the helpers should be used.
Sorry, this sentence is a leftover from the first version of my reply.

[snip]

> 
> For correctness, __hw_addr_splice() should use helper:
> 
> @@ -509,8 +509,8 @@ static void __hw_addr_splice(struct netdev_hw_addr_list *dst,
>  {
>          src->tree = RB_ROOT;
>          list_splice_init(&src->list, &dst->list);
> -        dst->count += src->count;
> -        src->count = 0;
> +        __hw_addr_count_add(dst, src->count);
> +        __hw_addr_count_reset(src);
>  }
> 
> Renaming  struct netdev_hw_addr_list->count to _count would help to check all
> users and highlight that modifying _count should be done with helpers.

This comment stands.

Regards,
Nicolas
