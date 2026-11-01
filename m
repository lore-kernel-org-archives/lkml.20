Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793548851;
	b=kL2YP1AghPb40SHKkR9qjgQhluYes3m8OQjsRWWCiJks8rKJGYKsanzNt6RsXuMNDX3C
	 14PWag3BBaCanSGT6x1FlQ9bpg/JkJ9qWjey9LTFVLLiGgpoJYzn1yW+i3hR0VQa3XOL3
	 UmbZ+8ugTj0T3tiLzezYOl/KmhsAd1YeAYvoyNvNWcIcFHSdO5od+1JlQnjAlPV3DIH/6
	 aGcxeZM+45Jf9aCBnfvXcMd0aW3lMPV1ExyIdQ1BCKoLpI07tJV7NCX7Xj8/nUPMFdCHv
	 DbmE9Ax0OC0kCpCmqGnUEy9pY/z3sFhgHRs0k6FZaFwgojJsumsay9aPwbbZWWQoKSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qKQDgkRL9E3S6U2cAM4sdtFLp25slrgCe2pH+1FhaxY=;
	b=tc+bMsCzKUwh2MbBifd+ChWfCnu9FsS0P8BsSIC5XmISwe1epQ95JoogjhIyAmcWhMvG
	 bWyr4CAL3KssNn4Eya3XthHuD7wHhCDQzpTVaw0iSwOHxJNz0Z5rS8RtrES0RD045jWmf
	 iX+ie2/i0O/QwisfBjpj5QUsCDkaQ1hsrDqtDOCnLJBbBeN6NvLDib/S9Go9DZMpO8ZB0
	 xtGVOIBbDKtF0NetyUeQAjOIl+S4yYW90Z9DP6F2LloQ5rqPJ4U3UOiHjNWcXwr4DbFem
	 QsY/9HJ6Hq0ThEPT/V4lm7ziulKvxJqb1JhsZpKTzLjLP3wIcybdPJt0nw3dTwWKvZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KIO9Qegb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C9D606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C9D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KIO9Qegb
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-535f598d126so190781cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793548850; cv=none;
        d=google.com; s=arc-20260327;
        b=AX3/sJrSZ3lOVTwnWYRWl/ggyTlD1uMuSEF5Xl3I2liRUCKnmrWOlgkL6VR0BUH3NV
         YHhPxPcLwU4MeStUA85c+Bgd8EJ41rcIw3WOx9Svus5gTIslAiibZ6zXp7qfqGk8p74O
         l10Fd0FF5Vu+rv6jG3JcxcPRIpx1rFON9QbVtz7uNHhRkOHRYKOIlE6QSSIK6q3Cf7HZ
         +kgXq5Pt5m8nRzI/y+3DXNDiuSAww1dXHuAwRzIyrGV3nahmo+fDfRE1YwrTVHA4zSjh
         DH0zuJoG/uI+JdAOLFFQLqK++o+rkJ5vh7V6sHa0XNDlxR5QHYzaICF2gqvqI0uZ5llk
         L/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKQDgkRL9E3S6U2cAM4sdtFLp25slrgCe2pH+1FhaxY=;
        fh=a7D47emCqObLwUE0saNAoknpDMRCLGuI9+oPLDpzofI=;
        b=CyYamgVU1xQ9Kpbhou+Zm7d92Rv3KIlaKMdSrhc3WHvNAyAVUAURc4UXE4D8CDrPDG
         jtRRjmgiKuQhPlCRU3Pr7s0rsvb8oJfRIn1vU8SlSgdv63ojGVsKK3gcX/TjBe25hjOQ
         Ftyg8Mh2LwjJrUbq7mAMxBaVtdwJjLaK7ekpLR/0Z2ejDvY2Fw0fymISmol1JZf4kbdN
         051aPwlnwmn3ZhAihdZOOnFI5tU9jCv17wQQGUSbIUOKd6/Jm8rj72FOhfPZs7h0+iFf
         PMEOFufltpYN5TgpxSnudTMhPidN9DeTnwdoqBGcxi8zKPjBw4jS2eG+Uy6j+MVRCN4+
         IoyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793548850; x=1794153650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKQDgkRL9E3S6U2cAM4sdtFLp25slrgCe2pH+1FhaxY=;
        b=KIO9QegbgRlHF8J+EI96VcBueTVdKCMiOtewLwCvrxPKhLGdIeh4owqmswijvGqdBU
         90CRAHRayN3Ivh4fn5elhQhTRAnhqWYgsDWVLh8Q7Ko6gUOeSygNXewb8kHcYUl27aic
         5uauykDy+fv8Ffn7G37BJmjwAVpvzd4nSu86Ws4V33fzV6455ceeAuFq/cDXrbUdKevP
         mUT49ec39gXSflFoXRaAaQyde7p92WS9YSBN33N0INEn8gQe+jTHi1uSj6D1SPItip8+
         iGI+97IJjxyxhzOBUv+Hz01QjyMv2fyNZBHfgNcpNqr+r2hadId1tnkaKCatfvTv6fP/
         vVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548850; x=1794153650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKQDgkRL9E3S6U2cAM4sdtFLp25slrgCe2pH+1FhaxY=;
        b=VRDccykCsAlQy9QWuQbYZVFR0ZZl9sj23JHTAjwwfBtBlqZu2xsTV6tKMBFw84Qm/d
         S5v1BjDca6ty8XY70mZPNJqA5LDUnwhRGqcmW7/KCDR/zbYfQckhwGxnr96P4vGPcv1N
         7Bqscsyxty+mGvYMZc0anIY2iFo6NX6TR47KJYJTALNdyTeqa9UTXNPdsOru7tXLVEnQ
         66pXNGMuaDh6CfxWicoX4eWrQgHZcu/4woZNY9RCcN5reDxZor4Lh5OBH96DbXCFP+0B
         633yNnKSFwrZSqKjF1q+DlN1V++vfGxrQGSdHD37Xuolegf8cBd1CjL0XHIFCqlXvFuC
         aJ9g==
X-Forwarded-Encrypted: i=1; AKwUvBw3G8celQbY7VHFJ/0ftT3ldyjypooktNdO/XdbjU3aSfY4uoafNlUE9oBrpSQ9a/nEk/BKAOl3rAOBQTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf7OHKCr8K719Qe+XS2BjLlwYyo8fS64OfZOxA4FI6/J2/rzFl
	ekGfV3DQY96oG9csTlUA7GHWoH15Y7YOO90cGzlERBc7TqQciqIpu0xXVW7qiaCL5caWZy7Qzgj
	7v8huznPx9r92c8h+6cWVnYgx0Vp9QIE3I6wWEpqi
X-Gm-Gg: AYBFou2qm1AsjcMqpC9uPaS4nkH1Qj0rdneMamKYpfHJwhUD2xwUMFa2x+aYux+J+JQ
	h9FKQwNVaU6N+zXnvl+PP788+tGQzJrsEZSxDTFKHl/BQeh1vnyq0Xh+we9+FhWbb6vq7/eU4MX
	kOKBeSFn9c3IJ2m0bNuzFPHMOvSsaBLwsSL5bnY6+R8UEmNoxuiFCbFcSZq69OUWsXig9KRWGP8
	lQdm7aNg109bE52iZQHX+lv0zVCpkpkDe4h5d1ZxY7EYgsYXWm5Viq6D2S1hncF+lIuPaf7rb+q
	8+alUMcUP+nLaUrRHM3dPmP62BcUQnRFMVcjOYzNEWkkZTj0Nm+HWbdgFKUnR4zQ+Vq90atO99L
	BjdFQGCJreg1P5qKmn2mV9DRAqEJPj62Qtxo=
X-Received: by 2002:a05:622b:1c2:10b0:546:92f2:7830 with SMTP id
 d75a77b69052e-54692f2886fmr8712951cf.6.1793548848845; Sun, 01 Nov 2026
 08:00:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026080329.140244-1-hao.ge@linux.dev> <20261026080329.140244-5-hao.ge@linux.dev>
 <e1cfd568-8fdf-4aa1-a8c5-961bb8d7efba@arm.com> <5b0f90a4-c7d2-4f12-9d95-95c7149c49c7@linux.dev>
In-Reply-To: <5b0f90a4-c7d2-4f12-9d95-95c7149c49c7@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 1 Nov 2026 08:00:37 -0800
X-Gm-Features: AclHuK9081SXnilxbhxPhUG0EsiIt3QEWxeLpuWJxyGCO1FD5elbMhuUvO38YFc
Message-ID: <CAJuCfpHOZPKKd-bGWavBmBf5cmR-PEZO7a_jxXMZVS8tsgG5PA@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] mm/vmalloc: propagate errors in vmap_pages_p*d_range()
To: Hao Ge <hao.ge@linux.dev>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 2:16=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Dev
>
> Thanks for your review.
>
> On 2026/10/30 15:29, Dev Jain wrote:
> >
> >
> > On 26/10/26 1:33 pm, Hao Ge wrote:
> >> vmap_pages_pmd_range(), vmap_pages_pud_range() and
> >> vmap_pages_p4d_range() return -ENOMEM whenever the level below them
> >> fails.  But vmap_pages_pte_range() can also return -EINVAL for a
> >> page without a valid pfn and -EBUSY for a pte that is already
> >> mapped.  Pass the error up as-is instead, like the vmap_p*d_range()
> >> helpers for vmap_page_range() do.
> >>
> >> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> >> ---
> >
> > Fixes?
> >
>
> Sorry, I missed that.
>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
>
> Thanks! If you have some time, I'd also appreciate a review of the
> remaining patches in the series -- or Suren and Uladzislau, if they
> get a chance. No rush, I know everyone is busy.

Yep, it's in my review queue.

>
> Thanks
> Best Regards
> Hao
>
> >
> >
> >>  mm/vmalloc.c | 24 +++++++++++++++---------
> >>  1 file changed, 15 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >> index 7131f60d1a8e..d60b99b81ec9 100644
> >> --- a/mm/vmalloc.c
> >> +++ b/mm/vmalloc.c
> >> @@ -600,16 +600,18 @@ static int vmap_pages_pmd_range(pud_t *pud, unsi=
gned long addr,
> >>  {
> >>      pmd_t *pmd;
> >>      unsigned long next;
> >> +    int err =3D 0;
> >>
> >>      pmd =3D pmd_alloc_track(&init_mm, pud, addr, mask);
> >>      if (!pmd)
> >>              return -ENOMEM;
> >>      do {
> >>              next =3D pmd_addr_end(addr, end);
> >> -            if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr=
, mask))
> >> -                    return -ENOMEM;
> >> +            err =3D vmap_pages_pte_range(pmd, addr, next, prot, pages=
, nr, mask);
> >> +            if (err)
> >> +                    break;
> >>      } while (pmd++, addr =3D next, addr !=3D end);
> >> -    return 0;
> >> +    return err;
> >>  }
> >>
> >>  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
> >> @@ -618,16 +620,18 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsi=
gned long addr,
> >>  {
> >>      pud_t *pud;
> >>      unsigned long next;
> >> +    int err =3D 0;
> >>
> >>      pud =3D pud_alloc_track(&init_mm, p4d, addr, mask);
> >>      if (!pud)
> >>              return -ENOMEM;
> >>      do {
> >>              next =3D pud_addr_end(addr, end);
> >> -            if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr=
, mask))
> >> -                    return -ENOMEM;
> >> +            err =3D vmap_pages_pmd_range(pud, addr, next, prot, pages=
, nr, mask);
> >> +            if (err)
> >> +                    break;
> >>      } while (pud++, addr =3D next, addr !=3D end);
> >> -    return 0;
> >> +    return err;
> >>  }
> >>
> >>  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
> >> @@ -636,16 +640,18 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsi=
gned long addr,
> >>  {
> >>      p4d_t *p4d;
> >>      unsigned long next;
> >> +    int err =3D 0;
> >>
> >>      p4d =3D p4d_alloc_track(&init_mm, pgd, addr, mask);
> >>      if (!p4d)
> >>              return -ENOMEM;
> >>      do {
> >>              next =3D p4d_addr_end(addr, end);
> >> -            if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr=
, mask))
> >> -                    return -ENOMEM;
> >> +            err =3D vmap_pages_pud_range(p4d, addr, next, prot, pages=
, nr, mask);
> >> +            if (err)
> >> +                    break;
> >>      } while (p4d++, addr =3D next, addr !=3D end);
> >> -    return 0;
> >> +    return err;
> >>  }
> >>
> >>  static int vmap_small_pages_range_noflush(unsigned long addr, unsigne=
d long end,
> >
