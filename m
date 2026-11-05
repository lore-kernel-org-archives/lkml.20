Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880676;
	b=ImFWG9gBVGVI+dI/oVaM1DjkKYAN23VkD3L+GCrVH1mmuypFL3KdaS4LCYnJ7hOLQBP8
	 RNFOphXGKpIBHv1vTKKnV4831qN6mPnaQFhXxbFoZZz7AnRLhJyFLlAtfWAPiK8VTTqwM
	 GE0e5olkXdThPl7opUrlP1zuxLZp5+M9JAwWv0gocmRL1wfFxVlZv9I9doly6ionTT683
	 pfR00A4twMEM7vp3kB1HBiAXA17nfiB4zGDPcCQRP5xX8Cq218FWXz52l/U9M8xc/2qjh
	 EAScZ16Ox1jZJNwcb+WgR3Qd0MgrUC5dJEpxF9ErupXUYg9lQlXkYNU/kvLt19/tkJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hcJOLUQQfftD1WGUXaDjd9QGjP8wRNkM3DnlrO9gmPI=;
	b=p+i587oA88QNLIzm2G45FL3vZyeTdVKSZS3/pkv5wK9i3QTfE2PDp232pG0S5BApZJe9
	 zo5k93d/XBihx/FXepQE+i43dnZpUETvHqiCiW+Q4p7MBaIXk3LrbRLYz/iB5OV9eb/nM
	 f9/n2WXgnxTMi8Mt+rUFfi8B16/SgbE0QJyVVHY2gJIJfIrr3LhhSdTNkmLwuwiuHXUV2
	 vB5yneleGZKr6XRlcIVQQioK9KzhWkqGG3iZnfrCLUZeNJGYIhAqZWXOuTdgA6GIMh8sL
	 D5mGPTiUYzcv3amrtM94197kG/iwqtiyUg4EpGViu5jHCqH0ie/ATl3UZcp9DcTJHGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8dMLKbO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55466606D82E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55466606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8dMLKbO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so16725085e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880675; x=1794485475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcJOLUQQfftD1WGUXaDjd9QGjP8wRNkM3DnlrO9gmPI=;
        b=g8dMLKbO1I4fbYCafkE4dV6OxVeKfCxvx2mpMNJXOmcCnLltHhuQqPrhDXYGk/tj00
         nhYyIe0it2B+QBkMGUzJ35x/1FfKxUPRFlBZXjpyEVPsmeUUEhu+Xxm7KfWPENIKrY8V
         p7XEaE1l+zAuCiD272xF1ksHz6FSVL0HtP9gwYl9+o6T+qejtqcXenUq5PlaKtQLQBi/
         qT6zHxVmmpG/RQcePr1Bye/dTDjtJljRCq1cX/suzmTf+/JbTvRfGoYg3hxCpv0p9zvz
         JGnA3s89+SnPy4dhrIqHwTvL4OOjrnDcZ97fvmMnW86NzcF7feCnCrsfUtpfDVSoY8k2
         bHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880675; x=1794485475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcJOLUQQfftD1WGUXaDjd9QGjP8wRNkM3DnlrO9gmPI=;
        b=L1SZExcdSjPdL/y+d4zjnfh7AY6XcRY29tyvJLr3JBZzbD6Pr4TDw/xT2Gepg+stYv
         FMtyPn5/bSQCx/xjNaC7U59SrFpqy/hCQ39Yhf7FEYOleaoqOegXAgA6fw8zTgw93bx1
         opt6H1MtyEwAPZTPJOc5U+vYcV2HU/e1flscR60wQV+1bT5Pn99vpZ3xRX7oz3KqreUB
         mP/ZYJpv/C4hLqvKaFsihStIxEgOqXuMk+FFeX67c0XWFAZ+iPKdGJ9e3ce4HXWGgddL
         PizoKM0w8CC5NwovPHeco0I9DDIqNaoZM5d/NHR6SMxCcO0wlubdVCNDNP6L/MTbKYx7
         xhlQ==
X-Forwarded-Encrypted: i=1; AKwUvBy++/rA7XP6Qbo39hVo9+am7avTR45G8zqQ1sqmfcGEfPUXHI+fxnTwGK1njyVEL2wWI/pS9kJXywVKZp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9KNf+Dfo3kLORi1ea5NeMAuSNcexLd3DcBbi7zms00D9BGIp7
	l3PSXfnW5sbsVzifHArabEiejj3UUsOyYA/VbdSEu3vmKRp+hSu7bBZx
X-Gm-Gg: AYBFou1lJs2oJaAeP7K8EBCH4uKsIN31txIakydTuK2yUrD2A8PZj6W33ochd96h41P
	6rD7h2SCTVTaxkKy9GKnGVINLAZZANBfCrRZ4KVCY99u6Npx/YVz3UVQ4TI7zI5utAsyH4k1KD6
	krvL58NUSB0UUK0TCn+7Zgq6AGuk9H1rzS8ehliHMPFwMDRD9F6Tnhb06M2MLaMdrBZJMmHk28V
	vtGjFDxlBoOSEwUNDbac9paf+a3Ozmf8fHR3rbssFsADJ3QqqLy/Vl4u9U00vbHUtmtuic1XPsV
	E/Fj5zncoHxg3EmwKZUStfckJb6tPmI4JB8ez+aPx2ix3KD0NP03mVzDk7U4T25AZajlxtHfHzN
	SVG6ySCN+359DuEXbvowerQOpzwE2HAI508Ths3RH5+Qs1/7gfJR5Auf8viEP6xmLxDYmTTGbVO
	9BrJq+bsOK8WwaESNh9OBH0ztXg+ywoAI0k6qNOTrJ6cs7YChOtqcajH71ekZyYEtl9K+fOk8A3
	whIgaec++GwqUUVyb5Gl9cSzjnI91tAnWa6EXgGHwnvtDysNPQ0unKU5CmKXeLWgbthubbERJL4
	CPiM6SuI0d4ZyevIPD77A+w=
X-Received: by 2002:a05:600c:c0c6:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4b65dacb8c2mr5581095e9.32.1793880674123;
        Thu, 05 Nov 2026 04:11:14 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b573366ea6sm64216055e9.14.2026.11.05.04.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:11:13 -0800 (PST)
Message-ID: <8e353a2e-fa06-4211-882b-08fb81d07802@gmail.com>
Date: Thu, 5 Nov 2026 13:11:12 +0100
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
Subject: Re: [PATCH] mm, vmscan: make kswapd unreserve highatomic pageblocks
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, JP Kobryn
 <jp.kobryn@linux.dev>, Frank van der Linden <fvdl@google.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261104-kswapd-highatomic-unreserve-v1-1-38be5106adf5@kernel.org>
 <75540cfc-0577-4d91-9369-d1c4fe9c3096@gmail.com>
 <76431b4e-27b4-4922-bc59-bf97516b40fc@kernel.org>
 <e5865932-ccd9-4f7b-bb64-e05a6f7a60ce@gmail.com>
 <b45f79bc-5a3a-430d-8a64-5a1ac6097d25@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <b45f79bc-5a3a-430d-8a64-5a1ac6097d25@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 12:52 PM, Vlastimil Babka (SUSE) wrote:
> On 11/5/26 12:43, Jose A. Perez de Azpillaga wrote:
>> On 11/5/26 9:02 AM, Vlastimil Babka (SUSE) wrote:
>>> On 11/4/26 22:56, Jose A. Perez de Azpillaga wrote:
>>>> On 11/4/26 7:38 PM, Vlastimil Babka (SUSE) wrote:
>>>>> Hook this highatomic unreserve to the moment we are increasing kswapd
>>>>> reclaim priority, as that is when kswapd is struggling to make progress
>>>>> and it should roughly match the case of direct reclaim failure.
>>>>>
>>>>
>>>> isn't raise_priority true after almost every pass at DEF_PRIORITY, stuck
>>>> or not?
>>>
>>> Can you elaborate why? At least at first glance, kswapd_shrink_node() should
>>> return true if it scans the requested amount of pages. So I would assume
>>> that although balance_pgdat() will do multiple iterations to reach high
>>> watermarks (because every round of kswapd_shrink_node() will limit itself to
>>> SWAP_CLUSTER_MAX per zone for sc->nr_to_reclaim) this should not be raising
>>> priority if the rounds are successful?
>>>
>>
>>
>> it's max(high_wmark_pages(zone), SWAP_CLUSTER_MAX) per zone, so the sum
>> of the high watermarks. by default that's at least managed/500, while
> 
> Ah thanks, as usual I got the min/max logic wrong, hehe.
> 

don't worry :)

>> DEF_PRIORITY scans lru >> 12, so it can't return true above priority 8
>> even when every round is successful. and sc.priority-- runs before
>> pgdat_balanced() is rechecked, so a wakeup that balances the node in one
>> pass still unreserves a pageblock per zone.
> 
> Yeah in that case it would probably be safer to perform the unreserve only
> after reaching the highest (lowest numerically) priority and still failing?
> I think it should still be enough to recover from the pathological scenario,
> which should be rare (but not impossible) in the first place.

makes sense to me, as long as kswapd reclaims something. if it doesn't
it goes hopeless after MAX_RECLAIM_RETRIES runs and stays that way until
the node is balanced, so that's only ~16 unreserves per zone.

-- 
cheers,
jose a. p-a
