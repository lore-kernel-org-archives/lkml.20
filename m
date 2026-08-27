Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDC12641FC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787800864; cv=pass; b=P1y6AsvjrBtMaM8USd2iinOAQlSfvguSubHfoPqpvCBIQ9tWqdgNB6cRVqfZ/c7muXuEWt+/8HIbfXJGPYalmI43DEUZhVoeiY9JZ+67xlt5ZElK8+ftucCoI/GdLjTqgA+StAK15OXLjmV+7/S56L9mJZCMaJzX3oxIOErWGls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787800864; c=relaxed/simple;
	bh=skIyHhmbtSJB6oPX2vs6CeqWP1LrS8z84CrIXCKOfzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKE+CHVtTDLIBmEQVkDheCbvYV4SKZeHzBL69ofQw2DVoc86mFDDh4opLhFuqKl8DCzbIpVzVdsEzKMUjZEYaveWLn7Z2ZHVAbVtScgJn/1B46g6hqrlYRilJYoEecw4Nd6JJUFyzpp+AjPCAdCvxv4LLsOhAYuETetIDrG23As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSZNiJbG; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSZNiJbG"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so273836a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787800861; cv=none;
        d=google.com; s=arc-20260327;
        b=JnrXsu/6Uyo14W4vco8YPy6IUUfCuJHlJEOUPXYUv0RUzZu4ku9Cs4wATi3h+sjhf1
         AnVk2O+BhYNuRFJfOiFI/vq6uchcYoMgKY3RatyMSLU8VsyQatwN+W7WOIonjZ1tMMu/
         0Ip4dCvhRdbvL3X+L9jviFmeYGaBNsHCVWY+SAn9ONJnGTtPNTwu6UG84HawKxSzucbe
         7bBJtUvAZYM+mreK9CehBtm/1za8bm1MiQ+oWvdLIfufdwIew0xOBZZTNi1CeTiEsH76
         5ToUbj9AXxq4xKv8+rrzs7pcyHhxUwh/pnf7DmFn6BbpcsBJu3611DMuqPnxamW2DygD
         lgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FPmrkgLMFyln5L0U9MxoTdvQW7FzvHOtKlle0J83sYM=;
        fh=k8AjGqnTDeFlh5HDyM8eIjB/BLR/WQlaiPFe3DaCMRg=;
        b=sRhdphXSH9q3Vuj5p8jeX850uwbEahgHet/caXWYV3tY0nTV6we59s4h6Kyg5WaHxM
         HBEFWqluJRbtVxWBJQ9NHMWTd+u6JFn18cJHz4xQpP4XiG+t3Y0fiHp7wVm+0otkktdP
         XoKAbiSoecVtlOLF9hKXjcdRTQA8sbBJ6omZyFfn8OdXFkON08eL9gMNWy8X905cu/Gm
         lKzcXaEcRaeEIfm2A7fByayqdgBtEvw5eLOf+1e7DhiMrtTOuxyX13fRZCSneEHrgygt
         wLFH7PZJgFFu5LxrvQYJ93dwSMUXuQzZKAeMk29TpAY8l8fpcGho+mt9OS+BALrix/r6
         jNUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787800861; x=1788405661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FPmrkgLMFyln5L0U9MxoTdvQW7FzvHOtKlle0J83sYM=;
        b=gSZNiJbG1kewziW0F8d0wQvR2IVqdfiSb99sGAY+yjl+MgpXLfFw6LA51A5bp1uSpd
         L/HF1lcWJsrB86ltbyaugFzyBWzQWz48k31xprmYETY8MET8lh/IU+rObS5JDmRQOnOi
         hesh0RN4ccNnPKUn2ICFNvx1aqFUIdRbz9ZND+Qfqn/2g3HAGTJ/sykI7pN0dFMl5fqH
         pz5nOUeCGBgn4kthVBrbi3k43OlCaLcqJDvLAguDNgMxr7Z+n17SgF5RY++9kgTZy+G5
         EMI6n78eIjiZmPMqhYYIjIEPt5o/aThVvz5F0fIGKGdfOA6NaJjC1H0Q57cfGobcOyf3
         6FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787800861; x=1788405661;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPmrkgLMFyln5L0U9MxoTdvQW7FzvHOtKlle0J83sYM=;
        b=LgmeiAeOETXnqLF/6+9qOUV8pQnm0E17jwf1QRaiAl7Vxe8lgGs9MihDtrnCpr6EWQ
         3ObTnrf2IiGHBWDWDqlsT+TpjUgau6q78+m7GDu/pMED5eEFLMiGh1U7inUPiEJuNcKq
         UTZnCntxiiTho50jMXpvG7AN47gE8B5/b/fGhlDVM3ZjDj2nHDYzp1R/myRSrLaWGjah
         beeGz3wk2mm3LpO8MbZ93Eh9MXazdAvXrfftXvDUU4zoJGKXgXbFPxVf0htgnw7PStQy
         z15ppYEDYAw76rhVEjwHwmc4PUOsqH3y9A/cXMMB+UMDvH8MqhP26Cv+KLD+mOBKbBGZ
         WPWw==
X-Forwarded-Encrypted: i=1; AHgh+RorVFoZK4C37ZrxBBtWZWSfGC3pS0ov9u5xFNwJYhw7UriD8L3PH+gJ3/di+HwhvfE3pjXBQtv0UVwCdOo=@vger.kernel.org
X-Gm-Message-State: AFuF++krHRRLT1iV+9Xlb5vx6XGGDGBuM8XNYpaDEiuCTOOtDerEV2q0
	QJd7SmdCqi6HOGglPgKqXSAZPOe0yYDq3nKQ+AKAQP1beiWe29/Mlz8OYAW6AlOrSICiXYbD7G2
	u3mjVN1HObSUI0g/MZdFXeOHKYKqZMBI=
X-Gm-Gg: AR+sD12JRt+IbqxN1kwBmG6ZhUxnvkyngrR1p8tJNylvprsNqjaLHxKEb9ibPhr2eUZ
	fkduTWukMAsW1fuBL3PH98yCz5o+9MGjhQE8ND/FykPIrhNP2AXWWf9bZcNF7l7FiqFhWso9aCX
	GtMTIVHjVTwc9fGNDMNGT+jTGIiaBRIgQitn0yElWXCYdp0WmzKzoyJzGA6wu8/h7aHDGupO8hW
	OkkEAP80zMDsC6/5wefPJIc+bo4a8EUFCOvi5M03q9DhCjnWTZnQP2Vp3zLGYrAVgvfg1Lq2kEl
	f/W9ZSNbBSJ7Zg+4wNT5VTRLjG5RjFe+DwvsqdiloA/dfeEk52ED/HJDc2Y9bqGqD00rqrODa7n
	f
X-Received: by 2002:a17:907:1b1d:b0:c1f:8021:deef with SMTP id
 a640c23a62f3a-c250bbc69a4mr1290633466b.10.1787800860849; Wed, 26 Aug 2026
 20:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821102538.22642-1-baohua@kernel.org> <20260821102538.22642-2-baohua@kernel.org>
In-Reply-To: <20260821102538.22642-2-baohua@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 27 Aug 2026 11:20:24 +0800
X-Gm-Features: AcwNN1WtoZ8Q8cI3Ievd4oOCnzXv86_Xn-VvBZtvQXKmSYIiN3EGlABnTS8ddKw
Message-ID: <CAMgjq7AZtqdu-yJ3TSa9Zq=Cwuqv-NY+ptz3Qpive-iFXR6e0w@mail.gmail.com>
Subject: Re: [PATCH 1/6] mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, chenridong@xiaomi.com, 
	david@kernel.org, hannes@cmpxchg.org, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 7:09=E2=80=AFPM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> Currently, folio_inc_gen() updates lrugen->nr_pages for every folio
> as it advances generations. Instead, accumulate the size changes
> and update lrugen->nr_pages in a batch after scanning the entire
> oldest generation, or when the scan stops because remaining reaches
> zero.
>
> Since we only move folios from the oldest generation to the second
> oldest generation, the active/inactive state cannot change. We can
> therefore skip __lru_update_size().
>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  mm/vmscan.c | 46 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 35 insertions(+), 11 deletions(-)

Hello Barry

Thanks for the patch!

>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index c1404a59523d..0d74fc00abd3 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3296,20 +3296,21 @@ static int folio_update_gen(struct folio *folio, =
int gen, const vma_flags_t *vma
>  }
>
>  /* protect pages accessed multiple times through file descriptors */
> -static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio)
> +static int __folio_inc_gen(struct folio *folio, int old_gen, bool *incre=
ased)

I feel the naming is a bit confusing, the __ prefix doesn't tell how
it differs from folio_inc_gen very well, maybe just name one
folio_inc_gen (the old gen could be any gen), another one is
folio_inc_min_gen (the old gen can only be min_seq), and with sanity
check in folio_inc_min_gen that expects get_nr_gens =3D=3D 4, and
lru_gen_is_active(min_seq) =3D=3D lru_gen_is_active(min_seq + 1)? This
could be a build-time sanity check instead of a runtime debug check.

I saw baoquan also mentioned the debug check on
lru_gen_is_active(min_seq) =3D=3D lru_gen_is_active(min_seq + 1), which I
agree.

And BTW I'm suggesting changing the definition of active/inactive for
MGLRU from gen-based to refs-based. The gen-based active/inactive
reading has been giving us headaches for years and is a main blocker
for server production, and I think no one cares about the
active/inactive reading for MGLRU for desktop / mobile right now
(especially anon active / inactive, which is basiclaly random number
at this point :P, and files are almost always stuck at inactive).

However that contradicts this change by a lot, folio_inc_gen will
always have to update the statistic, see (was planning to send RFC
after more test on Android):

https://github.com/ryncsn/linux/commit/d13a3abdd22a97eca32a7207fce56cc6030a=
3bd7

This is another reason why I'm trying to avoid aging rather than
optimizing it. I once tried some aging optimization two year ago, the
result was good by then but I gave up due to the added complexity:
https://lore.kernel.org/linux-mm/20240123184552.59758-1-ryncsn@gmail.com/

I realized the main blocker was cmpxchg and maybe async aging with a
refined reclaim cycle was the better solution rather than making
things complex.

But anyway, let's process with this; perhaps we'll need to find a
different way to batch aging later to fit the implementation of the
FG, OOM prevention or refs-based idea.
