Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562191;
	b=R6ft2EyPxjRisLxdg1FcCmHRtRSZ7n9ulTIunsT9wd2XAPX/RNmVo5k/tWr4p1+C1m6L
	 Lpuc1BozkfqqRxKPvKmkfBDGzoyB0cHfh7mZmYee+gdh3SF9qtLcx4dk+Cq6RT8cBUyYE
	 LXlUpAVH9qw/lS6iwwBd0n+3GTNPMrwAbZJXMQUa6nsbWIdjNbvkE7oZIJxwzTK0Lnmd4
	 8TCB6RP4G3IFo0EPsgNhDs1d4/Uq1j9BFkS/6iWi5yEt+y+V9p4k8HaFUmhhrIFRRhi0r
	 1oAwwpT5Lzx3gcZNVLGFv3R8vftCCkhaAae9d53WDKujsWXpkE4XGJw7M8KnvDu/Qrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=noqW2q3tliwA7l9SCHRgFT9oXvb7LtEfC22fYjKJb5s=;
	b=uTK7IyGF9aBshUTIEG1tN/KzBhWY/wOfwYmj2ubntguO2yloNRJjZUp2ARPN4e2qMKIc
	 6/moTz1T90kEJk/vXpC1ghZAzEi6HlTxlyyKDZWGZuMMT71Z4LqaIHwCegBUbIAk79qsl
	 sam++A5FA3Jy5b73PZWFrHF78zJufmFosreXKCMTM+4xLRj0pHUtiHHM3/MD+3PnFABnW
	 FKxLXVj6i7D797HKlmTYJfHfxqJza7mQWNE/6PuPEjAI291hJTXiIO8XRsOun/gs79+ma
	 KHWHCGu7uv8Ha53lQ+yuFwuS27i93M27jwsZIi5RhH5Rg1DtpZ3F9hnquEwV6lHoPUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AJJ5oC4l;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ED6606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26ED6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AJJ5oC4l
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so1783005e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562189; x=1793166989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=noqW2q3tliwA7l9SCHRgFT9oXvb7LtEfC22fYjKJb5s=;
        b=AJJ5oC4l+oQX1jPDp2TgcWVDKF8b45qXEexORcvbFsxTDzXMeFiuE23WDV9pZ8ABT0
         XbP3B+qgAzYod6/rCUDuhPqp7ZHVLRlXwoVTxlCPOPor80zdQSCCmlv0PZUSVGe9/bu9
         8RQoM6CEq+TARtwScmODykboKTVGBUp1bGNfqdae6Pp60vLB6gsfEYxSnAF71rmJDcMG
         mxVuyRczeKYX3k76ul/ukzH6jhERI0eE4nqYeqCiLF5wU8z/AuuAq1E9vTBWB/sBSN0N
         1v/amZdNEczfHnxTNJZpOYTKdGpaQQSwwr6tjXKzobpX7qxJuYjmh1Aji9ljaRWno14O
         R1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562189; x=1793166989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noqW2q3tliwA7l9SCHRgFT9oXvb7LtEfC22fYjKJb5s=;
        b=Krp/SUmyChrSz9plNlpuAcsXZWMymxxVuaNaiAF4wtFKG3PxXXyPOntRB0dYk3X4hm
         3n3bqkTGVJ7MpcXWuzzhTVURC8S9J9jrXHxGH2+XbzDpE8guK9vWKTbAZv2htID+r5+v
         9k+Q78rLS1Nv5f/GpQbsObMgBCiENOzSJcL0v/rqeJUFXCmbipHZ3NLwLJOewy+ypNDJ
         B6chiYR9VMT5u354mxuNu6GBZM4ORPwB1p02UhzIuaQfQmcIVccDKiDMadYGdqeyS4Yt
         Lb0hQ2BIKKwCOK/Hs5iZ9BP5L4jMSXP/rRAa61WWdXZ9F9mOsabuTRivXq9hrz9fTUAs
         OgHg==
X-Forwarded-Encrypted: i=1; AKwUvBzKcnUQ1v8kp73YS1uFXu901C6eklNlz4Qf41iwK+JDfzBqIrtb8kdwGZhC/OlLhY6IKK2G8F9vmuIs2Bo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP+secAh2D2NYHzZluutOOAuTZMryts21AbyMQMb2VszVCQCQf
	jiEoKdOf0DiPzftN0cTmqQD2lEvuYm0EWXe7klqFP4/Zu8Av9Wam3UBU
X-Gm-Gg: AYBFou1s8tf0SF4YLCzSWbRxmwUVze3xX6eQwsObEkSJF9RiVU1wXfhqDD5NGmrjvIe
	FAIIkfUgNyy59PiwdXyU7a4DELhp5XeOw8wFhpsVWv+rDDhzkRsS5q2XKwA0dQfR7YHZWAZFFlI
	9gDgEtkA7liwAwZxZ1AbwhsZem5O6Hp2JYva9/i8mgnkVIziRmtRDp0/FJJRvRDVKuhv9YGahcY
	wQfQ5KhIN5/VqXXWQrFrRUx4IDX6HA+8S1La2XkpqyqwWS5QSO+UsDJdDHcFX2LxsMjiWJ+tQ0i
	h9V3ZqKdj731Wek1Qe77DAdCCxzLtp5YXdkoXMaC2mVV44MqtwkNBfU0QitpDLgU54wtUvlLb1+
	JpyUaKGxfbG5k711GzzaWEteN5O3y8EhG2qvP62bg7Ms6b9BkL8wGbV66X276EctXdmYGmEnt6E
	vIQ5VXyGlgRr0/vF/mqlRihKHfbwqbz8nppr1haYFmARHmF5on29R3UBQWvYW9vRiaB5nS0/sx2
	Zw0r3rAPKQ4F1qfZtzIpKf2PyDedUFT5lUfJKM8o8JmmeLPZQBXlHTQKIjpYfAmK0xpNKeGPVQU
	+/Jq45BG5bqhIpz2d/hfuG7S41HQmpQ50jQhtHatT1o1h/X6udZZCJlsOUTeRTmMqhUHDiYr1PF
	N1pDuIuM2vFmbUQ==
X-Received: by 2002:a05:600d:864f:20b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4a1f4c4d55bmr73200075e9.2.1792562189221;
        Tue, 20 Oct 2026 22:56:29 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-117-105-001.95.117.pool.telefonica.de. [95.117.105.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835b1dsm3374756f8f.40.2026.10.20.22.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:56:28 -0700 (PDT)
Date: Wed, 21 Oct 2026 07:55:55 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexei Starovoitov <ast@kernel.org>, 
	Alexander Duyck <alexanderduyck@fb.com>, David Hildenbrand <david@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: skip shuffling and reporting for no-lock
 frees
Message-ID: <athTqt0vljgHb8q-@gmail.com>
References: <20261005063515.6312-1-kmehltretter@gmail.com>
 <f5e7b114-2bda-49e3-974f-170211501203@kernel.org>
 <20261020110948.wv_yGAhQ@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020110948.wv_yGAhQ@linutronix.de>

On Tue, Oct 20, 2026 at 01:09:48PM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-10-20 12:02:01 [+0200], Vlastimil Babka (SUSE) wrote:
> > > An instrumented PREEMPT_RT lockdep run forced a random-bit cache refill
> > > while calling free_pages_nolock() under a raw spinlock. The unpatched
> > > allocator reported:
> > > 
> > >     BUG: Invalid wait context
> > > 
> > > The attempted lock was batched_entropy_u64.lock in get_random_u64().
> > > Lockdep showed the raw test lock and zone->lock both held.
> > 
> > In slab we solved this by using prandom - commit a1e244a9f177 ("mm/slab: use
> > prandom if !allow_spin")
> > Could be better?
> 
> I hated it at first but now that I looked longer at it, it is not that
> bad.
> 

For v2 I can pass allow_spin to shuffle_pick_tail(), keep the cached
get_random_u64() path for ordinary frees and use per-CPU prandom for
FPI_NOLOCK.

For page reporting, the issue is NMI rather than raw spinlocks in
general. free_pages_nolock() may be called from NMI, while the reporting
path may queue delayed work. I would keep the FPI_NOLOCK check and add a
comment explaining it.

I will also put is_shuffle_order() first as suggested.

Karl
