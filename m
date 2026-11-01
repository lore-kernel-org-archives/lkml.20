Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546364;
	b=SmGWhDLUUtxN7VekJ8zRN5HToThin0uJGxovi0ifzLPUh9OKyK8m0hz4NqFjV1RZ8y/Y
	 /5XETSTtNupTFG0WpZu7xroLKwedvziQfLDPwpP9gWtVSxhOHB6k9MhBtel9Q52ooL5je
	 8mXLim+D0LqH5LerYOvHjxQK9iu4ybI4ady5k7e2sWHe9bbPnuH/OJrXxUxUf/uSwq/ss
	 hk8KaEjlQ4IalvY4Iq4StuKZ+VMDXOnF6oUhf1axRO4Drw6aTkkv+VfmeNBZswTYvOiZz
	 LODEYu5LtQ/tAuyEAfZdcrgWU519IgZQrVZ+mAZBJkhiWYgIJhRqNhfJsLaVxJ5QJRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FA//8JyNH+Gbu/G083qVtu1hU5OZh71x4BnN/06kjY0=;
	b=1LKvvidPwjpJNkCyjmIpa+71b9F1hTDGD02zaeSumUSoYPg5omFxAcn/WEK0U/pdSX+p
	 27Rd+vGInw4S3A/UCkkA6pf0qNfvgIaWpJeawRYlP2EBOQkxXoTFoeSsHJXh4clMN97qF
	 cGE+m9OZxDkc19rBkThAGOd8053Uh8XTJIHzQ9+Q0RoeNQDMyWCBA+PwaooT4+QOun/8r
	 9MJmFCZUB30eXZBHPUmIdfOtjt4l7Cq8czUjKa+gxcpVkDNv45JmmbovA1O4Rid+aMba/
	 rBqEJU2dGqT9vjYMMl00O9FCo9qdKo4jdiCmYME4Mg85Qy46AOZOeJs7d7u5pq/p2Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S5XCrppR;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36A606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D36A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S5XCrppR
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e22b83de6so171437f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793546363; x=1794151163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FA//8JyNH+Gbu/G083qVtu1hU5OZh71x4BnN/06kjY0=;
        b=S5XCrppRFs97FpEJEBlLF0Ar5jr5cpUPTH8f8gkHxG9uDk4Y7kzMRxU9DcNx1U0c+V
         IRz/2paE2U5c96+DZhhN5mYF2sB7j3BLz7pItVuNmhjmI6a+MSiAuKhZ4tD6IsWN2J84
         QH7KpfPCJD6x62rw2FyFXDBiRBJ0b/f2DvwWCU8JQRLkmrf3skc+ox/fvI2RM4D6yQSw
         NIoPxZqf/a4ICESQm9oBWZgl1e3/lzkEp/59wryw3LrZmE9uzvInm+vz9vo7BRCu+r9p
         oDD6T5Jq8x9k+5kX5WFwO36b+hdcr/jC0XbrhpuzYVTO+b/RyphDyxuUnA+GZDyJi9Jw
         2Y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793546363; x=1794151163;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FA//8JyNH+Gbu/G083qVtu1hU5OZh71x4BnN/06kjY0=;
        b=RVpt9E5yKvLJ/GF6TBAubQezf8KjBraL9AzFdSMzZdL82FMNts34M8oaJoVgGIl8Th
         kznOkm/Y/7MvmiXLMUsqdmxsQ5NLSlbYRFtOcDMrXdWgUi7JCCjAq/FkaTvMIWEkrLHv
         pz/P0uHNSPdtfzuxFqIOoQn6PAjtgB2lCTXYpFjpVUW4Q3uBhnT+T0uGXZmItKubZ7qY
         dipIyrz0UqziGUsGOedk8KZcFFBgIqejMD7SP/yKAvH2OYlwjP7N3ZDKd/aaD2DvtHkF
         UrOZ1oLBB2IndeyndYL96AHvXmUYYKgnp895XYTaDsvh/zOy3G247EVaQ0bExY9/H8L7
         Bpaw==
X-Forwarded-Encrypted: i=1; AKwUvByM9BDMZjdI9ZLMacQfm+UxYkfX+trfyxiej8ywrNWs4SO6p1jWd8oe8eVR1jXAOPQXLjQSxSqqyuWhPr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BQID4JgBazaxikXsFZ68XFU8lLfQ/PUBS8R9EIikeJKTu7Ddh
	9A5+T5WaVT8QIBzIwOx9x0R+x3+wxP9MumVKCAc8Nus+FKJq8z6BhiE6
X-Gm-Gg: AYBFou3sYn/wsaluAXDO8in0LtK6K38utaU8SOkBUPtUfmiIJY4iPuZFfI0RF1Yk4jl
	u7mlH3JJ6X7S1aNW+MLlu85WTT1ZLJWwKqgGTYg6Fc/2J4OoZgb4k+E4RMR8sWpxws5LeQ3zck6
	yaIAOowN/BwpcqZZcs64fPKqjdjdQp2gdnWlCcjV7iww050zsSm9uuYPhLlSmSXvmLTTH4AJb+T
	+Sh7ZzRYHTqtqNQRgz7zgYNpaGRZFDocQzL3+jFwwyRSGO7fy1ZWaf2u8PHOuJLHAWcTl3aqSBV
	7ejaTcEpKiPggqWoa2/xnKpZhGCUtx3S7X2NgfgauEUIZDPrqG9x70r87AKpftURRaVEE1/vDxs
	ijtNx+P5iJvKfu/tv1TjEr1sg5JbBpLTeQ4cYU8vfDTtZSDQJoz0j95r5FmmKHpellx59pRBrhI
	eoA0skuhPZrPFKWsE6FLsQ6NVsPJ4mi5bot/N3XDAbGC7dBJwVd1u5OqK0AllqyAdYe6d16APNs
	XYoryat0Mem/2ZnNjd1NBhcUln82tEqFL98Vrj/aLGzih3QmD5ibJK7uxkdoy6WFW875R/g5NsM
	BRW2T+XRnAjDyjrdgsFKtWGobmVFG1OldD3tJLWQTRVjmhxti7BelGU=
X-Received: by 2002:a5d:6a4d:0:b0:48e:3c62:4a78 with SMTP id ffacd0b85a97d-48e6e2f6354mr15028769f8f.4.1793546361603;
        Sun, 01 Nov 2026 07:19:21 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm16401023f8f.7.2026.11.01.07.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:19:21 -0800 (PST)
Date: Sun, 1 Nov 2026 18:19:17 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: albin_yang@163.com
Cc: peterz@infradead.org, kprateek.nayak@amd.com, albinwyang@tencent.com, 
	bsegall@google.com, chen.yu@linux.dev, dietmar.eggemann@arm.com, jstultz@google.com, 
	juri.lelli@redhat.com, linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, 
	rostedt@goodmis.org, vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
Message-ID: <audUyrA8QYYHKYPz@scheduler.schedules>
References: <0d9bce4b-0d50-46df-b865-76511b2670f6@amd.com>
 <20261101143101.353033-1-albin_yang@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101143101.353033-1-albin_yang@163.com>

On Sun, Nov 01, 2026 at 10:31:01PM +0800, albin_yang@163.com wrote:
> On Wed, Oct 28, 2026 at 09:10:20AM +0530, K Prateek Nayak wrote:
> > Yup! on_cpu / task_current() gets dealt at sched_info_switch()
> > which will enqueue the signal if the task is preempted.
> 
> Prateek, Kayra, Peter -- thanks for the reviews and suggestions.
> 
> I tested the full diff below (comments stripped for brevity).

IDK if you added the comment Peter asked for, if you didn't please
add it in the final patch :-).

> One ask, about the split rather than the code: keep the DELAY_DEQUEUE
> fix as its own patch on se.sched_delayed. p->is_blocked arrived in
> 4c2a20413d7f and first appears in v7.2-rc1, while that over-count goes
> back to v6.12 (152e11f6df29) -- folded in, it cannot be built or
> backported for v6.12.y..v7.1.y. It already exists as v4, already
> reviewed and tested:
> 
>   https://lore.kernel.org/all/20261024042753.2276779-1-albin_yang@163.com/
> 
> Happy to be overruled.

It's up to Peter. Tho, makes sense to me if the other issue exists on older
versions.


Thanks,

Kayra
