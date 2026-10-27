Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094061;
	b=Srkl2i2vUD8459E/EgQNzWKkMY/b0iCUQsl/LIieYEK/+jijGYNXDXWku9/5EoL3RSJQ
	 OoLLbj8zzdK0Zdid721Xf32Q/WGRJXQpY6MOy3YiRoQVBnKIjap30rmDjxCCtWkTv567+
	 qA7Vm/UZqO+YrIIBZ7iKR9Q5YZxgrlwqdDbM4gvzzeUn5Xd9jAZVjO/vd2qsB97l+mPO+
	 zo5DLUjFQbUUYHeGIaJeE1BNCBvJfuu/lX7c0oBaABKSkffgbFMhPik6YlHudfILrqLlr
	 BjWbwe0gxxAV6n2w/ho7VxO4SJpIfGv8IZLusTzW/artkYQu1onP/CqyfSAAUMHc+jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=JVBSyNaPKEtFoMBnmXCIBXxl7RDB3mGMHMJZz01NkVk=;
	b=0LiKTUeIfDz9L1sp4mTLY1mqZx5slCnwWYUParxYQu4Y/1Zxr8Ea5tiElYzIoulQE/rz
	 0I2npEHMKIsQJR11whu+Ff+ufXFCgkmna7Dq4g10bS0VYnWWOyX8fN2IPq8lD6j2nTmgi
	 8HSElaFk1ZiClaADUvJ6Va9bSEe4YVMjZPhrqQniQ3qIAbIA1bv0H0qH4ssij/04rpaKO
	 ercp+G2Qm32A7ZJqIceZFikW2IJNqk3AbpFH0CWxD6SNYG6KyFWLuFaUhDvytuaNg7eq1
	 T+AfwXKM6pAn8LGT1bDV61D4ERLJg2A0KV+xYrwkRA7DzICT6LiG/0wjrLDZpGZHz7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Cb3HmVQU;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB4606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBB4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Cb3HmVQU
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3569975f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793094059; x=1793698859; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVBSyNaPKEtFoMBnmXCIBXxl7RDB3mGMHMJZz01NkVk=;
        b=Cb3HmVQUB4Lk3lJ79uCjsoT4M/qng2XCwVuFJd72c76fT2RpGya+bs94EVQS3lXDmZ
         Cg6Q/94Kp3EhZ+A4j0FZjWN7jGX4D6jypPFwwK0yPUImFmFPBTlpaSeUh2a7bEC1QbUd
         tr+NkkzXvQt6SV1iynM+/8ppGaWS+slHAvSfG53l13e7LLNjulAMqbtEqwtpFqVnOnGW
         JmTaemFR5SrKvLjFC7wFZ54Pxa5aI0vOlssM2QPIltl6RZXoedLpf7CdZLldhKIIu4MS
         bWbXpjrLCpBEtF3JY+6vwFTkIORr9u73Mx3nz3PLfGM63BCnn7/LqxxYIXWVl9C0nZgn
         Klpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094059; x=1793698859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JVBSyNaPKEtFoMBnmXCIBXxl7RDB3mGMHMJZz01NkVk=;
        b=dOvb0g9ESBXc/J1EXFcPNbN3D5bgAE5MUQA+7BvIWBJOeU1vUKjuTPr+mlQXvBISMy
         12sShgQkZO5QZIynXQt9jiQ9dQdQsYNNOqKcEnzmfSJf1ZFDo/WKp+2LBm1Wy1HhA7nA
         KeFSQZO5xgUFz2izJT/B/P/TgM7tjyi+lWqPXntb3Nl7tHLvCeOkXhBo15tOdcgZG3Bd
         TYebUrNigeQFroI4lrXzVhPce91H0V5t+DS6nHS0PozNVJRcSbNu/yDo7Iveqyb0+X3h
         d3r6kKyWkwtB0l7dnekMogGaB5uHL5vltF7cR+74ZUxZdAPb++eQS1Cs0mMBX00ENSYV
         xWfw==
X-Forwarded-Encrypted: i=1; AKwUvBwcE0MWbzPPVIfzsu2ndEyvx/o7yzvOf2MeksThlaGlfHvYy5ajC8QFh6JDXELyoSUC4M0mlb9uwzC4bJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0zgs7+NORtUtsAWeM6Rov4VYn70LLcCK5bodduKFQWEZSpJom
	O3KY0EhdXUd7n9UMQeKIRtIuPwxGhBliMH3ktHd1bMCnn9pcsFswMzmTnsIRFIbsUnI=
X-Gm-Gg: AYBFou3+855DBEkPX9sCc5UbWfKlJjqvqqfMVTVkJtIz3kUiBfEVZTlZU3l78jm7Jke
	LpecvyADnnvd2be/YzLeUSQeUfsPP3EPbtKChXIwSKUhVu/z90U93meIUmYfZ0htevn7yrqtA53
	syO/WAaCSVTZbAlpxHIcFhyg0Gy4ZadimaQRrd8wsES65RqAneIPRu30pFG1yEr9qvaQXkRqLCP
	859re5nceTWKVLGj+sEbhy4Hw5/oDDD00P+CTT8qcUSDcM7cSZBmwwoN9bjkKFVwPG7PZ4V9XkX
	qddj4tKy8sXe/hdoz9Hx2icZy1rH+/bNeoX7ueMh3SRvW3Vso2EfHx8MzLZKFjhf3ZG4lMFmVEy
	sskRYgRorev0bit5iXbYCDFy4/O0Wb2kD/+DRIqacyhiw3LDW351W3Ae08EQc0sAZcDp5afQ+wG
	ZnV+kgmoTSQ688mg0nQlGq45pgpWoRHilOwZpxa2nVXRePin80w+PKuEJejgs2fnRPFekc3kGsi
	cAvRFwvuqamWAoZHQT6jsFkCZfQ35IIZjKlhnaBxEvmc6ALDO4R5LivI6GV3y1rE1mXyQ==
X-Received: by 2002:a05:6000:2989:10b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e3eb78141mr13538157f8f.18.1793094058994;
        Tue, 27 Oct 2026 02:40:58 -0700 (PDT)
Received: from localhost (109-81-20-177.rct.o2.cz. [109.81.20.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm21909641f8f.34.2026.10.27.02.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:40:58 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:40:57 +0100
From: Michal Hocko <mhocko@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: hannes@cmpxchg.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, zhengqi.arch@bytedance.com,
	akpm@linux-foundation.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm: memcontrol: fix NULL pointer deref in
 high_work_func() on dying memcg
Message-ID: <auBxqU34FQYauoQr@tiehlicka>
References: <20261023222313.3979455-1-tjmercier@google.com>
 <at9U2HvyUP-iYOCt@tiehlicka>
 <CABdmKX1mLKEJNiecW+meJ=LB_Kb8-ieeWdZDd4T6rNR9gKuq_A@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX1mLKEJNiecW+meJ=LB_Kb8-ieeWdZDd4T6rNR9gKuq_A@mail.gmail.com>

On Mon 26-10-26 11:01:51, T.J. Mercier wrote:
> On Mon, Oct 26, 2026 at 6:25 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Fri 23-10-26 15:23:13, T.J. Mercier wrote:
> > [...]
> > > ---
> > >  mm/memcontrol.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > > index a05d9a8baa1b..84f4a8fd4d16 100644
> > > --- a/mm/memcontrol.c
> > > +++ b/mm/memcontrol.c
> > > @@ -2457,7 +2457,10 @@ static void high_work_func(struct work_struct *work)
> > >       struct mem_cgroup *memcg;
> > >
> > >       memcg = container_of(work, struct mem_cgroup, high_work);
> > > +     if (!css_tryget_online(&memcg->css))
> > > +             return;
> > >       reclaim_high(memcg, MEMCG_CHARGE_BATCH, GFP_KERNEL);
> > > +     css_put(&memcg->css);
> > >  }
> >
> > OK.
> >
> > >  static void high_irq_work_func(struct irq_work *work)
> > > @@ -4463,6 +4466,8 @@ static void mem_cgroup_css_offline(struct cgroup_subsys_state *css)
> > >
> > >       page_counter_set_min(&memcg->memory, 0);
> > >       page_counter_set_low(&memcg->memory, 0);
> > > +     page_counter_set_high(&memcg->memory, PAGE_COUNTER_MAX);
> > > +     page_counter_set_high(&memcg->swap, PAGE_COUNTER_MAX);
> > >
> > >       zswap_memcg_offline_cleanup(memcg);
> >
> > Should we simply disable_work_sync when the memcg is going to be
> > released instead (mem_cgroup_css_released)? That should both prevent
> > the run reclaim_high during the memcg shut down and and also avoid
> > plaing with limits to work around.
> 
> Hi Michal,
> 
> Unfortunately that won't work for shrink_many() ->
> !mem_cgroup_tryget() -> lru_gen_release_memcg() which can occur before
> mem_cgroup_css_released() runs. (mem_cgroup_css_released() happens
> through the cgroup_release_wq.)

I do not follow. Could you explain why please?

> The high limit reset is also needed for targeting live ancestors above
> the offlined child in try_charge_memcg(). Without the resets,
> high_work is never attempted on them since it gets dropped when
> attempted on the offlined child due to the first hunk, and
> try_charge_memcg() breaks out of the loop.

I must be missing something really obvious here because I really do not
follow you here too. So we are offlining a memcg. We need to coordinate
memory reclaim with the memcg tear down, right? For the high reclaim we
can achieve this synchronization through disable_work_sync in
mem_cgroup_css_offline. For a synchronous high memory reclaim we do not
have such means but we are keeping a memcg reference which makes the
lifetime well defined. If you reset counter you might help to bail out
early(ier) but that shouldn't be necessary from a correctness POV as it
doesn't provide any explicit synchronization.

> Shakeel's remote charging patch
> (https://lore.kernel.org/all/20261010210957.1350874-4-shakeel.butt@linux.dev/)
> sends remote charges through high_work too, so without the resets
> those would lose ancestor reclaim the same way. Before that patch not
> performing the resets means reclaim_high() runs unnecesarily against
> current's memcg (not the remote memcg above memory.high).

-- 
Michal Hocko
SUSE Labs
