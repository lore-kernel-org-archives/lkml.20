Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325915;
	b=zXJv2pWcnXjAE9wCXiKbPqWxgO5sUhgE+BMPUn+JovctTPl9n/CvSV7UGnGfYURZYmPy
	 VDFS33pXp1udZhYq3oTAdAgP99PHbixpY6kLllIMYPmGSnec9uuOKW9tHg7rEsEAFjdOA
	 UiU60uN49mQn3d+sri2dhx+Mr7gVPXlmqqn2xn2MOwfoKBN8OeG6PLv7XkQRuoNtwYhJ+
	 CM01dAbL9OfBnNJh4UJBYxD5O8BjQHGD3FkACawiBzYrid3crwexPy8S+yEIZJ9+ZLzdo
	 KMMO28zkAK1nGodTE7RyaqxKQzWb1CU5iBn+a8FUyZRin0RXcNnqVBZxeN9RLnsVbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=CKjrHAAk7nXIeoSQFsXsh4G7m4UuVgqfRgVzxBn+0Rc=;
	b=UzbhnJ4IBwSZTPim0eCLPJdfTo/LOyxO9Z8fNaTSkDWzNjKuaQ/j2lz3SVXGxvBhY9Hv
	 aCVsCsCfBPDilzBO/pzGBzBxMrA0tqXdjWjI6WVLqOsjZwCIR5mof9I1vfVG/nCdQS/u6
	 O/ALdtH0D362gl3RDSv7WaYQONszwmFgiDfTtvQgrG+dKdsgN+xK02NuR4lOiD42Cwx/1
	 eFTo+d2zEkjTQo1IqP8VGf1CTQeW1i/xrQRCBF+TdXSecRoCD2A9fbeLCDs20VB5S2oex
	 rPttT+yVoNi0WROvk67P6E1wI6LNxO932ctMZUacMcAg1cirNpJRhZUTX0rf2Qm2Y9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUKkcC31;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C8A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C8A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUKkcC31
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35159e0092aso33143eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793325914; x=1793930714; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CKjrHAAk7nXIeoSQFsXsh4G7m4UuVgqfRgVzxBn+0Rc=;
        b=DUKkcC31jZaFLhyNtkS640K4wpwxwIXDZeoxNty8R27uh4zBq4jl2S/Nsb56XwBrCU
         9XSRGbmrL14xMeWfKqtnk0LZobKeHx44V8dHyeEDrCnDR5MWt/d4Mc8KB1/P4Z2cA5yC
         xD/pamNzcyRV5non+IKN1YsjLxN6z+Lz/DhbI6xJyjdoj9HBC/PJFopKG8y9Am4ZGL0a
         Ca0Ub6ShRGoqs7QVaP/l7LHpZ02DWPM4cSZgYgi2bHEY1prT/Niobtk+Cxk31/8Qvabd
         s6EXDas1fVHNYJWRwBBSuz2Pfwhe9RCzv/RyAJD16RulQF5Aa8EH9zKTyXNoyDz3VSEU
         7gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793325914; x=1793930714;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKjrHAAk7nXIeoSQFsXsh4G7m4UuVgqfRgVzxBn+0Rc=;
        b=A+8bhZGmBeSlD8fl8IB9IljGKF21in6yHe/OvAfHtUGsr4wu041uExbooXM3tktIh5
         t34fzOEIHIp6dnuoqDyGOgZyiUdu3JNzX1nVQ/n9loWq4m1DCH7wHhq1BMt3KTmkj+an
         tCtGsSCBIcOFqToYQiy77j3uYirhb4sJ1NE0X7Yo42pK9obQbrfIC/gCpkuFQ6pAgs7z
         5FDZ7BmShjRq4mm4UoKIeUE/CxY743T39cpA5OvLT/RvXH01NJPZJzmpZGen3+nXzh/6
         3NR68tDjxe49Wff1LBglcUQcatQYG8VK2s+L2h1uOH1eDxEWya/lukS2WDG3Y+NLhOR1
         K1TA==
X-Forwarded-Encrypted: i=1; AKwUvByiMROsE6MhkWKGQIt41tVbubEZKF07Sjnf/nrpRqD9N52Hlxh0EgXjEcO9FvdftA4KPOhANV/PfnelQ8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw+5hgBhlH6qLrAKw0k1+gHHf7do54dRV4zWWRHp5wM8NJ+7bR
	6RYs6sLeAaaBCMiMmJVxSroz8hYI4UcyNB6+KH+F6GNncGauEnRmtnIt
X-Gm-Gg: AYBFou0NuKnJL7XcMnI+J501iHDe1tO2JvAWTywK+CsVwycRjHTX9X5PHnCfb8jDxvZ
	Lq0fx6phUHbPaMA9Ayp03itViL1Gr5QMuqvl2IlT5lB8UYmSO5ODw+qU9CWZQky+IGROgw1TKP2
	1iYyqaOnYO9dKPUAt/aGpNVWNpeYkS8PTvAuTuiTf0bJl5o8W3VwkbxwtNab/3/p2HK/rYRZgIK
	ri5MydsUbfnabbCX+8gFJ62KZEGXz67Q3Xxnkzr4JTnOa9icurhFrVs6R7j+lmuEuJlw5vQ9odE
	UYpNHtrJngzCFRy/Icwe7dWHlpwzuyUIu1nZiYMjYJQjL/O6xJOGJMGA0YE1V/UNuNk2zU5f4sd
	ey1kE+QH7HN4i8ujJ3EyAjgD69D3gxkENcmBPxC562BR83H4vhCu6zHf4dLPg04z1XeBqjzY9+F
	vtyO3dTa4gPnPXt56XbvWP+5Rsu0eiAXk+mZaGQhhHh22rgt4uGk7iNEKRGP6toLShrj9/tUSba
	f5VMEEx83oBztVkqXUOj6ScoXJBdQZ+2JhSwK4bs/06AWR8Tg+QDJJza7K/DNWjNiYU4KaNxikS
	cEGs6ueZLq4e8S5BE8H6TSk3Ks1nBEHNcdT9U9Itw4sFYpHKSoZ9snnyR4mOTWbUrf8I
X-Received: by 2002:a05:701b:2515:b0:17f:641e:7f6b with SMTP id a92af1059eb24-1ac5904ae73mr1613426c88.1.1793325913562;
        Thu, 29 Oct 2026 19:05:13 -0700 (PDT)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm2417987c88.14.2026.10.29.19.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:05:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
 Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
 Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, xueyuan.chen21@gmail.com
In-Reply-To: <auKjuiRxQwtsZF_0@google.com>
References: <cover.1786003779.git.xueyuan.chen@vivo.com>
 <anVWZVOt-xeD0dMH@google.com>
 <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKjuiRxQwtsZF_0@google.com>
Date: Fri, 30 Oct 2026 10:05:07 +0800
Message-Id: <179332590773.3867294.3750177162706544686.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-29 10:43 +0900, Sergey Senozhatsky wrote:
> On (26/08/07 09:25), Nhat Pham wrote:
> > > On (26/08/07 18:57), Xueyuan Chen wrote:
> > > > Hi Sergey,
> > > >
> > > > Here is some additional data:
> > > >
> > > > I used the following definitions:
> > > >   compactable ratio = freeable_pages / total_pages
> > > >   memory reclaimed  = pages_freed * PAGE_SIZE
> > > >
> > > > freeable_pages is the estimate before compaction, based on the same
> > > > calculation as zs_shrinker_count(), while pages_freed is the actual
> > > > number of backing pages released.
> > > >
> > > > There were 264 callbacks in the trace:
> > > >   callback elapsed time:
> > > >     median:    5.77 ms
> > > >     p95:      55.82 ms
> > > >     maximum: 271.36 ms
> > > >
> > > >   compactable ratio before compaction:
> > > >     median:   0.32%
> > > >     p95:      2.86%
> > > >     maximum:  8.33%
> > > >
> > > >   memory reclaimed per callback:
> > > >     median:    3.80 MiB
> > > >     p95:      30.45 MiB
> > > >     maximum:  92.73 MiB
> > > >
> > > > The longest callback took 271.36 ms. Its compactable ratio was 3.25%,
> > > > and it released 7,650 pages, or about 29.88 MiB.
> > > >
> > > > There was also a 241.91 ms callback (with 30 schedule-outs) with a
> > > > compactable ratio of 0.44%. It released 1,019 pages, or about
> > > > 3.98 MiB.
> > > >
> > > > Based on this data, it seems better to remove the shrinker.
> > > >
> > > > Would you prefer that I change v2 to remove the zsmalloc shrinker
> > > > callbacks directly?
> > >
> > > Let's bring in heavy artillery to this discussion, in addition to Andrew
> > > and Minchan, adding Nhat, Yosry, Barry, Johannes, Brian (random order).
> > >
> > > Folks, I'm bullish on removal of zsmalloc shrinker callbacks.
> > > I don't think those buy us much apart from memcpy-s and lock
> > > contention.  Systems that want to compact zsmalloc have a sysfs
> > > knob (and API) to do so (based on zram mm_stat numbers).
> > 
> > Hmm we'd need to collect more data in our workloads to determine, but
> > if we can compute compactable ratio (freeable_pages / total_pages) on
> > a per size class basis, can we just skip the size class whose ratio is
> > too bad? Would that at least cut down on the vast majority of
> > fruitless memcpys and lock acquisitions etc?
> > 
> > I'm always a bit hesitant to over-rely on userspace, especially when
> > kernel has information to do something smart about it. It might not
> > react in time, and many proactive reclaiming schemes back off under
> > heavy memory pressure.
> 
> Apologies for the delay.
> 
> The thing about shrinker compaction is that it's sort of on the
> wrong end.  It doesn't trigger compaction when memory is plentiful,
> no matter the internal fragmentation rate, and start firing compaction

Makes sense to me. The fragmentation ratio alone doesn't determine the latency
impact, that also depends on how muchdata compaction needs to move and whether
it overlaps with foreground zram activity.

-- 
Thanks,
Xueyuan

