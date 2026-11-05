Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879530;
	b=d5srlpoG4jnHm6UH+VITEdsd23AE9L78KPXUe1veu73Het97KjGMcmR/FX85UhVhEbaE
	 mC60LVrkkdW0RsRNsxnMG0BHOz7+M3d7jflUE0p6M/ihE9Gkct78FTj8VGoSe2tCYn5XV
	 67UPYabA0ZJQmr4XETUGFLGiImmEU/OayLuBWBGi9gPDrnOF9KsrWkbe7XcWVj4X+Sa0v
	 EcEQcs/UkPraPOlPak/g4stvVTKnzSYfFApy8R/nHCLozDhUKAdCp4+HluBpA5/scLqoX
	 Gcb9/BhthhluqinFyL5/2Q/bABSQFKNVPMnDxzR0Sk2YFWdPAmq9dQQDPgztP8MuSjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879530;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iw61JVpfIKVjEhkIHEUqUjEP2S+EN2i3Q4HRmPwDDaA=;
	b=j3EWOakrc3S7nN96asx/RDDxpGzOa3eX3OhLEWWqv104ADd8ca6jKa3yc2Zam/kbiOm8
	 VxrLCwl8g4PNHzc0fwiXLCRtZ5UhMWLcn4iCdRmjc+QM5Qi+2qwx/9PMM+W2Ox5Xvl9gG
	 HE0m0W8d7aD7CeUxz7DAH8jJz2gvykcr6V/+Juaj6kWz6gvyWEZTYU9bACeHZKAfIC25e
	 9VA75OI0JMdTqDp9F9VKMLhtYYzNrkTg67cnnbL0y36p4GRj31Cp/Ypaj0O8h0OAldfpa
	 7iXgalwvqNqB8oZ9HjhoYa9vnpNLZwVYkMnmRO7UNZp11Du7TzmpVyt4lCMbBRwonTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZezyzzF7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844B7606A901
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZezyzzF7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4F71F000C1;
	Thu,  5 Nov 2026 11:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879530;
	bh=iw61JVpfIKVjEhkIHEUqUjEP2S+EN2i3Q4HRmPwDDaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZezyzzF79xxs58ivikY6ldetzXBC/dypds00DxgP/L7ZF1hVsuYELq9LX0gF+4+vE
	 MT7+PFkpNgafCMv82vJCf/3SIAiQucZUl2DBLvuXIkc9REvx8a0+/n/ooS2bq9+BwM
	 3Jythe0bz8SKxemB0D4I8HnaLLlvOFWv2+6N9kD6vO0ppXP3gfxkFOuEpTXLhlSmTh
	 DuZ/B0lVDQ1DPw5eFroVAjdQvYknBxF26J6fnD++4sxGneiqekTUVl4elkX1UbHFdU
	 iaZ6urAVlo0fiYNNQjXWtufSkNWTYfA/6/p0Xms/MkikCP17CquHeQNujhnc1X9Drh
	 rX+GbVI1X26kQ==
Message-ID: <b45f79bc-5a3a-430d-8a64-5a1ac6097d25@kernel.org>
Date: Thu, 5 Nov 2026 12:52:04 +0100
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
Content-Language: en-US
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
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
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSNWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBrZXJuZWwub3JnPsLBsAQTAQoAWhYhBKlA1DSZLC6OmRA9UCJPp+fM
 gqZkBQJqFFy6GxSAAAAAAAQADm1hbnUyLDIuNSsxLjEyLDIsMgIbAwUJGtCBUAULCQgHAwUV
 CgkICwUWAgMBAAIeBQIXgAAKCRAiT6fnzIKmZJIUEADFx/tREzUImHrEwVHeSvDFmA7tJysI
 UVrlvrM09E7GIuzphzv7jYmo8n3ANpCczLEVr4G0syYQdTigaZgv3+FQDIIzhKih1IHhu1Ei
 XHlywNWKnQxxQEUNi5Mwx43wQz5XVw9F1A7gtKBKNtfogO511hAbrzagrYajyQacEJ/+sfhZ
 9Da8ltHIXD8pcYaHUfQgEusCgmEd9+KrUwrTbckFKmYq5chuE6yJ4J0EmWknL096jIE6CnzF
 FRslQ3B1UKDjxVsm1ZHfir5NeWszLkTvGFsddFaWTgh8UycESG6VQzKXjjewXu2pG7YQYRpj
 QKm1W5X2TkwWkXRBZTmfmbhxIUMh3+zf5wQ463rSmDN/8v81tdqBtAW6rH/kzg1GvkaTHXn0
 507yEHFzBksk2viAuIxxr7km8+/KARYLIdGtx30EG8cKzAUZOK6WqxtNCsXUJNrVE8CWrCaD
 icoNu7Fs1c5hmPHdSTnU48ce67449DdnO4neLSNhRiGlMHJgfJUmgrxu/hcYeOZ3haWmEQ2w
 uW1Mh01OHi8QZHCEyAbABrPs9GUgccc/4eYXX9hIgxfSkYzn8f+8NuIFPWl/0uTvjgqU29FQ
 SbzOLxHq9439Ox40G5mS5eZXRGxITYR+6TXvRGI6P/264jvflnr/pDGUttaikU+0W+1uxgKH
 cmYbEc7ATQRbGTU1AQgAn0H6UrFiWcovkh6EXVcl+SeqyO6JHOPm+e9Wu0Vw+VIUvXZVUVVQ
 La1PQDUi6j00ChlcR66g9/V0sPIcSutacPKfdKYOBvzd4rlhL8rfrdEsQw5ApZxrA8kYZVMh
 FmBRKAa6wos25moTlMKpCWzTH84+WO5+ziCTsTUZASAToz3RdunTD+vQcHj0GqNTPAHK63sf
 bAB2I0BslZkXkY1RLb/YhuA6E7JyEd2pilZOrIuBGl/5q2qSakgnAVFWFBR/DO27JuAksYnq
 +aH8vI0xGvwn75KqSk4UzAkDzWSmO4ZHuahKtQgZNsMYV+PGayRBX9b9zbldzopoLBdqHc4n
 jQARAQABwsF8BBgBCgAmAhsMFiEEqUDUNJksLo6ZED1QIk+n58yCpmQFAmfIHFQFCRYU6J8A
 CgkQIk+n58yCpmS2PA//bqN1LfcotmArgElsa+0EGZSQlYgK48pm8WAeTXTngudP9IJ4SuKY
 HR5RNjHcBeqN+Me0zxRqYzRb8nGanHEkDyf4Im8DQM8d6vbyU+FcPmG4skud4kgS1zMHnlVd
 SXfSIwKC/hKgdHG8aBV7545Lz9X6Iohea+94wneD0aw/hqF+QWewGZhWJriWAZtvEkzNjQOi
 4U9F/trLten/x7bpphDSnDMKJtITbtzATT1Dq7o7VpIUK1nCTQALMuMjKCdi8OdU/+V+R3O4
 0PXWvX8qrvqYapVbZ+9KqT74FsuB0Ya9uXwgBF2Q6cRuETZk5vqaqKxzqoQZCO8AOz/58j6O
 2RHNy/mZEN+7tJ5Tsq42zVJ4jxsT8b9YplavCMsnBgDeRWhcbYhCyttoL7nYISyWg4kQYZ/P
 wIV3OuNv2f8iKYsxNsRuClOAF82+gvqOy1/1pprFjy8uo2pkoOrb63aOP3vO5VHnRKgra6dq
 NcaZ+c6J4H+nEJGi2SkHAUJz5oBzuThvPudLvPA/SK8sKoM01IRxSihev/S/5WLazXB1PGem
 OCbvzC1IjWJJraxiDJ5IygokapUa2RP7+WBR22skQ3SSl6G107QgWKSyTOGWEaRmV53vxQLV
 jXuCmzSSasTL60zq5yGrT4/DYQVSNEUiUbG4pYekxJujNeEDkUlky0Y=
In-Reply-To: <e5865932-ccd9-4f7b-bb64-e05a6f7a60ce@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 12:43, Jose A. Perez de Azpillaga wrote:
> On 11/5/26 9:02 AM, Vlastimil Babka (SUSE) wrote:
>> On 11/4/26 22:56, Jose A. Perez de Azpillaga wrote:
>>> On 11/4/26 7:38 PM, Vlastimil Babka (SUSE) wrote:
>>>> Hook this highatomic unreserve to the moment we are increasing kswapd
>>>> reclaim priority, as that is when kswapd is struggling to make progress
>>>> and it should roughly match the case of direct reclaim failure.
>>>>
>>>
>>> isn't raise_priority true after almost every pass at DEF_PRIORITY, stuck
>>> or not?
>> 
>> Can you elaborate why? At least at first glance, kswapd_shrink_node() should
>> return true if it scans the requested amount of pages. So I would assume
>> that although balance_pgdat() will do multiple iterations to reach high
>> watermarks (because every round of kswapd_shrink_node() will limit itself to
>> SWAP_CLUSTER_MAX per zone for sc->nr_to_reclaim) this should not be raising
>> priority if the rounds are successful?
>> 
> 
> 
> it's max(high_wmark_pages(zone), SWAP_CLUSTER_MAX) per zone, so the sum
> of the high watermarks. by default that's at least managed/500, while

Ah thanks, as usual I got the min/max logic wrong, hehe.

> DEF_PRIORITY scans lru >> 12, so it can't return true above priority 8
> even when every round is successful. and sc.priority-- runs before
> pgdat_balanced() is rechecked, so a wakeup that balances the node in one
> pass still unreserves a pageblock per zone.

Yeah in that case it would probably be safer to perform the unreserve only
after reaching the highest (lowest numerically) priority and still failing?
I think it should still be enough to recover from the pathological scenario,
which should be rare (but not impossible) in the first place.
