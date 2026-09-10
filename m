Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B26B4F6463
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075274; cv=pass; b=OnJOzlX8BkZvXAgJ8kyDijnf7KhlGh9k2j9ovTdlRWpcT5O+z5sDxy+9c9PAqmE9F4Y58I2C1uWZmH+13DG46pHnteMZtHcpwvJ8deRln+kVeJIFJHHx0gyUNVox/AYU0PphMWiGY7zDb+xXlSNKe9s2gaC5Nzlwzb2fbebO4MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075274; c=relaxed/simple;
	bh=jqpEM70tSpG5MtmfDeF0hUyCwBgmAiAYkWcb+f353io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DyaUl5EvmezOjMM7+1/8t6ibKSqGzY+oFAWTiafhG3OubVqyTbc1FXEsm5x0+hKD0YIkDB+m7pYEXOBNQyZ+hnalPFiVof7iDk+YVs2yBHvDzptmcBKp1lFtF/nmwgeTeVx8DwJ3lk8ue7HFFqur/Huh2vhuVhLMjl5KNXY2D0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mwFm3ZYY; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mwFm3ZYY"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so33491cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789075269; cv=none;
        d=google.com; s=arc-20260327;
        b=XaOwdMsR9Fjfs6pnVBl0hf8PNkn5IlS9t8kT7bUDn4cYL6vOB9qyP9eoNp00g2twq7
         v1BqibZJ/nmdyTsuq+RCRoQXmxlWeMttuX2xrVnC5SLzLO6Y/AZRmN2Bnw6KicgfW7aE
         ixutzElCrYFW+LqvcyKXuhryRWc5eXe6AVunOOStf1LkRSjzQcLaPupDsaqGJ3oUqA+u
         EgW4bYjuTb9TSIcISNt/80JZQr4CshLw9Ad+kuPYdlH8u3GPw1M2fvwmFBDBJIP0SaR2
         s4TUStHnUh374LJA4l55wNLDb13hJPD1xdwG5qXS7uZILV5tIWDnnI3UxePfBlI7lJ31
         vmaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPbVFgW9VwbajH9zUlcN4XglfWpRRu+3kWiEh6Msf9M=;
        fh=5NSqmoFoD4M9y0Mq27sERqOOuq5xX2gfbuBMSKFU/2E=;
        b=bPuqfnxey3Ml18vpzNF71Gr6xRCobj+Y2MYOOch+DwZlDqmzFUcmZf4dAiBkGNnhdh
         MtKJ2cpnKbMzPdN/MN1wpCBD9cF0RpSYoB8xD2UC93dQMtgh63Gp9QyxAwmkRPCb0Fwl
         y9mAYNxUggoCrPQa47bbl4QY4stKc822+l7+E1qdOpCgCHS/E4PnsS3pFIoNpEfznDeJ
         qQxavM8Fu8S//GqUEVVLhxoM3yhoPY9o13gX62XKJhcJjuZVhxZnf1n2tprgYkiywMPt
         Hb5FPb1Nf3hE3hixEZXV/gBdyGSb86+04RzEGxlaBLfgNStI9b/GDxMmPxIVHoDDet1T
         Uiag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789075269; x=1789680069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPbVFgW9VwbajH9zUlcN4XglfWpRRu+3kWiEh6Msf9M=;
        b=mwFm3ZYYq5TrI2SEc4KPg6xFHY+4JXsSUC58CjWGE1Ow6RmUqqYF8jleqAzaXOUc21
         QrGsP5Eo5M1vM7aVngALtdTwcW1HfyvVs0JyYrVcPJiN2NL4votq8nhMdo7ign6sJByR
         HzmceyzaRj8xZaR7qgrPTastny8qa5bP2Dcy5iUlCkssZ4SGeRFUcQmmjNTsya9y9K1+
         UJGWTsFJ2hyjFvt/zgSXHZ60MA4GLkkr4tHamxApl9OA9K/LpSsSxdawtM7yUqMRIizV
         gD+F0MQ2XMqq28r6ckt4HADgV5H+r7x9N8+xOdnbJHNGlObeFBkpSSg30sNkIv6r8IhR
         JSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075269; x=1789680069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPbVFgW9VwbajH9zUlcN4XglfWpRRu+3kWiEh6Msf9M=;
        b=eyYHckjM+ulyTi2Qzcawp8JgyTsKqDrPcmMgw87MSp50iCtDnw/s7qKQiCMewjXUk+
         Ii+wDQZp5Yhft67aN9i7uWVGyn1VfhkxtZUHZmjCWbn14a6C1djzewFc9UEg/kVujbFs
         fove1vkhLWFlG21Ztr8oZjwSnPpub2XpzxfZSmc3RDyOoXpxALuSII0+ONDQGluS5R8e
         Sj85AB04UGN1G54jlIML2m/Nu4jpg+VMuI1Lsh41NK0x6ezl6J09sMvSY4Zz3EAvybxz
         aeUSnKnHm2D9Vn6SHKFKlfcSbKRI3hnQ6RpC14jJuCjRNOH8PjB9s1E5pWaasieAi7av
         /q2g==
X-Forwarded-Encrypted: i=1; AKwUvBxG+KxOGHIqpDhlLcYVu4e46udftLZI/Nt4hpLHHc574cgMISWFqwEQGsXOtG5MIM8xfT/tqlBH1B/pLI4=@vger.kernel.org
X-Gm-Message-State: AFuF++k6ebB++QfbS8uTCfuJh9xyZ+QZJCSuLwVGn9GHGVA0xIoed6JE
	/D64Nj6n/h2ucEShu6jJIrZlElEz38AjGcfGQLulKcjQUy7wjQUXl2HFvoFVLRaHn0AI+XBMy2W
	bzJ+/VUufzUPuxtVj6ejLOxlydMz2IiKamK89ZdWC
X-Gm-Gg: AYBFou3cb/fRYEOpycMqxw0284ruqpUD0zg26gg3LfNQIaX8v3gDdD6zlh31on58xmq
	pcXeUTYGrG/yTPZuxoY4F8aHvWSxox7g7BX5l5rgCDymzLrtFQfrFLjWGChEiEj+fKNXcS9MSLS
	ulVifuiBgnWfQ5CStf9odIjKcRXuZ6XnYw5aafWm9hjtkvlUUL7X37DBD4ZCRs2bFdKe93p7NwK
	WFQzuki9ObzrhH7mYYFeO91jsVNQvUtnrq/TAnRgFUKCfOY43MGcoe79wMObnc70JDSo6u4guEn
	nbyd5TKLJB/AyPFUbhi30PDtDn9lHsrdiUGsG35yedKUevrwQ5V3XlErJPv+NzqztblRIWSlV+Q
	rXCsVKnpbvg==
X-Received: by 2002:a05:622a:2599:b0:52e:8422:a329 with SMTP id
 d75a77b69052e-530c94992bemr6190311cf.6.1789075268693; Thu, 10 Sep 2026
 14:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-5-surenb@google.com>
 <19e428e5-d8bc-4abb-b052-e23442464cba@kernel.org> <CAJuCfpF-xeED3zVL9YyCwrTUxcYXw4s6gVcCYY8p7rx_09mgLg@mail.gmail.com>
 <d24c425e-7913-4f80-987d-7105a8b13432@kernel.org>
In-Reply-To: <d24c425e-7913-4f80-987d-7105a8b13432@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Sep 2026 14:20:57 -0700
X-Gm-Features: AcwNN1VRoq8CDVvkfELfH6Yzm9F4xeICdi1mk_n024FLQWRzxRX3c-6w3l_BjeM
Message-ID: <CAJuCfpF_1XNP87GL+z13OJqMqk7LNpF9yYNSs4qV7N7tGOTCww@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] proc/task_mmu: read proc/pid/smaps_rollup under
 per-vma lock
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 12:44=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/9/26 19:58, Suren Baghdasaryan wrote:
> > On Wed, Sep 9, 2026 at 10:23=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >>
> >>> -     vma_start =3D vma->vm_start;
> >>> -     do {
> >>> -             smap_gather_stats(priv, vma, &mss, vma->vm_start);
> >>> -             last_vma_end =3D vma->vm_end;
> >>> +     if (!IS_ERR(vma) && vma !=3D get_gate_vma(lock_ctx->mm))
> >>> +             vma_start =3D vma->vm_start;
> >>> +
> >>> +     while (vma) {
> >>> +             if (IS_ERR(vma)) {
> >>> +                     ret =3D PTR_ERR(vma);
> >>> +                     goto out_unlock;
> >>> +             }
> >>> +
> >>
> >> Can we add a comment whey we break (and not e.g., continue) whenw e hi=
t the gate
> >> VMA?
> >>
> >> (I seriously don't kmow ... should I know? :) )
> >
> > The way m_next() is implemented, the gate VMA always placed at the end
> > of the address space, so the next VMA will be NULL and we can break
> > once we see the gate. But now that I'm looking closer into this code,
> > reading smaps_rollup file does not invoke m_next(), so we should never
> > encounter a gate VMA (it's not in the maple tree, so for_each_vma()
> > should never return it). I think I can remove the special handling for
> > that case.
> >
> > Thanks for the question, David! It made me realize we can simplify this=
 further.
>
> good! :)

Sorry, my conclusion was wrong. The modified loop uses proc_get_vma()
to walk the VMA tree, not for_each_vma(). proc_get_vma() returns gate
VMA at the end of the walk instead of NULL. That's the desired
behavior for when it is used from m_start() and m_next() but not so
much in show_smaps_rollup().
I think the cleanest way is to change proc_get_vma() to return NULL
and move the part that deals with gate_vma directly into
m_start()/mm_next(). I'll post it that way and see what others think.



>
> --
> Cheers,
>
> David
