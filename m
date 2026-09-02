Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2883233DEF7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330592; cv=none; b=QBmKyo/V7nAPRQqwiTzcA/ArxIloNPlugahaL+chtk9quolAVMnp2ODr5K9SRML6x3J0EonmnkGQk9lnZfDzdqk0Xn0FxvKAl5kpMdeD5QqKMgdW3Q/XFx+ZOzAbJdv5cMOrX4zgQbzkGlHsAqKY/8J8Fc7VSOKaVsJThZYHgjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330592; c=relaxed/simple;
	bh=bRAw/kC0iwtoV3FdnJXkic4hdm4mGBrURlUSImGfXWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drlz0FTEFbGjjHm2VxGFmpMLBR6yN1gRm8iSAJArAt6rGHyQMwjloVIDyViZobM3bZCDFErh7KrBzELeDFgjUxpGMfLnEorapBx0CCiHGdvfeI++bahcUrFHiignHYRiuGgK3AniBf322QeiGnF3XGxbFAU+pdpiBA5pZEzoWO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pg3yO32k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pg3yO32k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBAA1F000E9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788330590;
	bh=bRAw/kC0iwtoV3FdnJXkic4hdm4mGBrURlUSImGfXWQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Pg3yO32kmE3gL0dmfa+7Ib1lBGavJpHCX0zBilwUvrmlLw+2bv4z5i1v7SZLiQ574
	 0OeqDuW35gdt0vkbJoZbFasn4K7cJC/Ifgk6yYacJjyy59s0pP7OBZY1w4zKYd/iGC
	 RqyT2MJzFRYxs3kk3X74z1ZdX+zVpIYSNm1FOW1Q86tARvOToQTJE0M+oUd0spjel+
	 TguO05wrNkXBDgNzNq07W8AbhiccFG93PsNUOn5LlzDnWC2FrGPh957G7HYQNURiF3
	 w5+INnH0tPnb9j/h/9Nml7bX6UYEObb4Q9SIyGoFcQqBoX6OUF2oDt2+B7V4Tyk568
	 b2bEvccl9eoMQ==
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9390f8a1c9eso65915585a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:29:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrLSpSJwY078SKnXrc1RyKUh9ZJ3hgz4G0DjHb8oXGUWpkS1jCpNVvpcMhJNpSL7qGRorsuczNmcMKGr0o=@vger.kernel.org
X-Gm-Message-State: AFuF++kFcRuPu1Rp/h47W82IQMfzQT5oupFw6l8NMmOCUDe6XbK2fzxF
	aXvDY/J/5j1MsBkDdGadtSulMQoHqVx+IV3jFp1QNrmGIHbzRpw7hYZfC5YkAvlSnx6PBD1eotS
	EEHWVk7mhLH4RimW43wta+8QaeQ0wBek=
X-Received: by 2002:a05:620a:a0cd:20b0:934:aa56:45df with SMTP id
 af79cd13be357-93960df450fmr271672085a.11.1788330588481; Tue, 01 Sep 2026
 23:29:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901054358.4049095-1-dev.jain@arm.com> <20260901054358.4049095-4-dev.jain@arm.com>
 <CAGsJ_4yGFBRv-C3UV-G1tB0HUmhVvJL6ac5x_Dtu9NSGk9BGzw@mail.gmail.com> <55e7bc2a-dfdd-4cbb-9bf6-ea3bf4b03cce@arm.com>
In-Reply-To: <55e7bc2a-dfdd-4cbb-9bf6-ea3bf4b03cce@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 2 Sep 2026 14:29:37 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zi=1hq_v3J2+eoGGnv=3VzsJbTejX1HbDDSAmF2Pamdw@mail.gmail.com>
X-Gm-Features: AcwNN1Xu0lESa3FupCaqM-ki0KipDurhFoLH087Q1dWylSkqMuwZBSC7YkpVUj8
Message-ID: <CAGsJ_4zi=1hq_v3J2+eoGGnv=3VzsJbTejX1HbDDSAmF2Pamdw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mm: move anon-exclusive batch helper to mm.h
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com, 
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com, 
	lance.yang@linux.dev, baolin.wang@linux.alibaba.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, 
	youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 2:24=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
[...]

> >
> > Hi Dev,
> >
> > I really don't want everything to become a top-level header
> > file. If these are only mm-internal things, could we move them
> > to mm/internal.h or another more appropriate header?
>
> What do you suggest? I had it in mm/internal.h initially, but
> because I had to use the helper this time in patch 4, I couldn't
> do that. The helper will now be used by mprotect.c, rmap.c and
> rmap.h.
>
> I can keep it in rmap.h and make mprotect.c include rmap.h too.

I=E2=80=99d vote for this approach until we find a better one :-)

`include/linux/mm.h` is already way, way too long.

Best Regards
Barry
