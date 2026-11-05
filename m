Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878985;
	b=E5N44JyIhSMX10e8owXPltKxDxsV0sG+Tf5hRI88C0bHLdVkCwdmaDZa18sNhvmxtPPA
	 G6jDE2KZM43dl6/8+zdTnb8uYutoBn0b7Nof0oYNL2Gu8IhCnvwgwUnALL4VikvvJbOEk
	 dpaivGw37YYHMuzcuuClTA0s276yHvTGZIDTGRXdbKQ5DHhZR+hsDKUgmgWPhXwAnNnfr
	 lhIQQNTvN8EhueqiY9hgxv/q4nTQBFHKbay2fvuGJwtkCF1FoA/M3t1h02lfhhm9qoy3f
	 FVtClzdN9vHGsYPXYyzHD3s8cbMZzN9rCq1NBhZZ2iKJ27IEKAm25gsrGIrcyzFAzPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=E1YKZbg8+xkzFjxNfBYmTVfbfxOb/7eggQBZwag+I5A=;
	b=hHJZUChRg+/4dRX/OP5WnknWV/HJT1TI7EB5f0NS5+yD/XDy04R0e7XnAuP0Lfd6GlZY
	 BrOT3FbXJaF4HpnKBJZrsLU18jds6ZHL9OK90pvGFwGbB+PtQG1oOUox/w63uT/EC20jd
	 HsK6QPGDxMAyGL6W12921rRoeYXxrt6mPzHlr8ubkWDid32Ud3BWa56gRL7jIH1vtyG31
	 hWfhTwhKG+eCuTJVQo4ARZW7L/i0P4wv7U/fnBQNQWPTvwNH/PgpniOB/Pd4s6rbkM0Fq
	 Voq1s+giQdK84uPJDjM0cq9dOQw98jWySR/C6cS4uRfH+0Qb1924yV4yYViXc1ykhdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aBc3BdM0;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE096083601
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEE096083601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aBc3BdM0
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so19279805e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793878983; x=1794483783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1YKZbg8+xkzFjxNfBYmTVfbfxOb/7eggQBZwag+I5A=;
        b=aBc3BdM0/oSHwOm9vnct7+TPAzLUMTAlDJTrXlvcgWi5aVYyFJzoYzPA66PExBckH9
         CZjLxfQARN29d3039/6cA4W/+yLHz+QoHvuGS5IYxouGFjewdtuetwHX8MXYHfuuUvq3
         ZYTadV9aLomyj1gQgifddKqfOun1dePhx3270paAYG6cc/dzggj0fthq7eMqJRwj3apg
         QKisVrBuiyXY143pdts7ExqCB1AwFLjoA70j7DnOGA/6+IV/q65BSB/Mg00SgI8UQzw2
         h5zEr2Fm6Tjul49i+QUsxLmvrdu9d1ccP2OTU5LPwkK+DWiysGddLj2G6R8HTu+2TVio
         h8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878983; x=1794483783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1YKZbg8+xkzFjxNfBYmTVfbfxOb/7eggQBZwag+I5A=;
        b=rWrAph1zVz75ZO6MF8/WsHBifIAcPwF5hkRtmz5uv5++fbzGV9GlC+6LX/Mnwugklv
         4w7bJxUFSYC0dX19r4gljMkt0v7PhikelHgfrsy7YW8dFmVnh5p196oZ1GMB7R8TNfiU
         EteRMO7vx1ASnKZhXn7iWODBgSlCEbMIUvg/tXgJnt8pVVXKkCczfXLQ7CT5jaEbSvB6
         Kb3rMVn9t7plJt5rDGB8Xb5YG5bvRS4aCs9Ml7sTCkeUDSboTpjYDq8nCjPnAtfEfWxk
         jlmWPD/+9sir9nw3pipKGBpxxhHN2ZCXMHwIhhLvYV667Ycou4pzmBHWTj3Gqbo0snFJ
         v0MA==
X-Forwarded-Encrypted: i=1; AKwUvBxS3U6y3gVVaM823r8FnKFSEVHgORXKhdq00znprQ830mUI67N78isfVq3FGb3d6wS4kN4pUDtrGmYrX58=@vger.kernel.org
X-Gm-Message-State: APuU4Z87n9tZh2yIQ9eDlNLP2BBLGyvcx01r7RSVCMgt/0Op4/5Lycft
	PVrGN7p4jlbNVNCX9aUkVEYHSMt7kn5IDdDIK8eUr/uVWAM+0ARHXF3o
X-Gm-Gg: AYBFou0wCgtomo18zzlnlUtNucwZGDcRJAbBiNVgg6AHt3bvRhNZKxv/+pn/dtEiCZS
	wJLTNW/w+Lwkelggy+Dq4hiD/pnEr11EQYOKwKzyMUddMuoBE8tevb8Q82ydGRTZN5nLH9E+DU7
	+T76AjQuMqKOZq8aRDwJGH9SGKSicKFB0rOxVXpZgCGHQGYHAM2mlMVfoyJR20VVlL8tNOLirdF
	aoCIMo1pk9Iw560+gLmvdZ9FpsVT/mmA/d/w/cPNMe1WzTHQbV+0eE81hWofgVbaJG9YwPZnjr2
	iFuxaQKpmiSFeIyvjMX9sMOU8wYVk13UribOXj4wm5qvM069z+juTtQbn5NzxOVDB9PYScZp/Jq
	xa4MDoB4QZ0dBDJ5DtD8EK7b4nbcXCUg4Soofy665TabW95dp78fjXgoJu+8goPFjOiP5AaacCG
	R2E76ut4BymcpKqnr9v+QltAWE+ItU+Ry/VwE5F8tiRivvR1LkrqXmaXB1kQRfk8/ojDVDMu4WM
	/h5wa6LlDKD4fmSfjsyOqYdqa5Uohtpa52R392imp6ixo6V4eoxGyRFbH/bLu6HVUX4IM5PHSHl
	6DFUYe421zBDt6QFBGvixQw=
X-Received: by 2002:a05:600c:46ce:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ac18a88820mr418201725e9.33.1793878983138;
        Thu, 05 Nov 2026 03:43:03 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b413312a4fsm60741345e9.1.2026.11.05.03.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:43:02 -0800 (PST)
Message-ID: <e5865932-ccd9-4f7b-bb64-e05a6f7a60ce@gmail.com>
Date: Thu, 5 Nov 2026 12:43:00 +0100
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
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <76431b4e-27b4-4922-bc59-bf97516b40fc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 9:02 AM, Vlastimil Babka (SUSE) wrote:
> On 11/4/26 22:56, Jose A. Perez de Azpillaga wrote:
>> On 11/4/26 7:38 PM, Vlastimil Babka (SUSE) wrote:
>>> Hook this highatomic unreserve to the moment we are increasing kswapd
>>> reclaim priority, as that is when kswapd is struggling to make progress
>>> and it should roughly match the case of direct reclaim failure.
>>>
>>
>> isn't raise_priority true after almost every pass at DEF_PRIORITY, stuck
>> or not?
> 
> Can you elaborate why? At least at first glance, kswapd_shrink_node() should
> return true if it scans the requested amount of pages. So I would assume
> that although balance_pgdat() will do multiple iterations to reach high
> watermarks (because every round of kswapd_shrink_node() will limit itself to
> SWAP_CLUSTER_MAX per zone for sc->nr_to_reclaim) this should not be raising
> priority if the rounds are successful?
> 


it's max(high_wmark_pages(zone), SWAP_CLUSTER_MAX) per zone, so the sum
of the high watermarks. by default that's at least managed/500, while
DEF_PRIORITY scans lru >> 12, so it can't return true above priority 8
even when every round is successful. and sc.priority-- runs before
pgdat_balanced() is rechecked, so a wakeup that balances the node in one
pass still unreserves a pageblock per zone.

-- 
cheers,
jose a. p-a
