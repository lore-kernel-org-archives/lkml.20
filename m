Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A212548EC71
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055166; cv=pass; b=hKAlWuuE60LWybF+9NoTPydlpXkwx0tl1MK8hcsaqslA91phXUCskm14sOao/2ug+A4n/MnwvHL5968k6Q+FlIcJPS9XHgGuviy0XBKGjommUU8BlqxRtvEjgQfz5NWxMO41UdxotU3/kfMo+bL2TzHIB0xFf55E4Z7Li2rCpHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055166; c=relaxed/simple;
	bh=xy9Lm9WxkQ3Mmgg/H7vfmk5N45FAYtw9hYAWl41XmQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYhvUkEAN4h5AFP2EqX2nOJ/MrOY+hn+GItCWxtoNfWR8AmpxCMw9ydsK2GK8+WkC318PFWei7AhXd1jPdKFl7t++/XfKzg4L/b2PGaOkf0U9i/zoGEgL6a5nB8L+wQmXnRAjiTZSZT/4S6rqd+BkA75dGrh18yfCg4dtjIxj8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ktFHgeVI; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ktFHgeVI"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso269551cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789055164; cv=none;
        d=google.com; s=arc-20260327;
        b=OFwGFEb61uxKGF7O5xqbF9DOqnCB7705p1nPDMQDMgTeK5QI52sRKL9TAozPF+0UPj
         dsmZxBHD54kRmf2tc+G97l/5CwbBZW8skOQtqf3dNXuAsmC1wS3WWYDn/pmB8qFJQ34t
         uGzZ5tk2lbt+0kTa/AGKwEN56Ek6FrhqhKsgaXIyiaAfsisky287MRj/X9CQ3PwACWZH
         ymhQjkIFQHB1CjsuhwEnxHXTRhmP7tI0hSn705wywyByyvrIOxAOGJV5qBevxH/53H+W
         iNWJCWT60qJAgCTSdNYzFeTZYgpLyXrfM6rW8baXd4RcZ9uZhGYrHV75nDKlj4sRshfD
         K2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1gukMKgmXXLSe/xkuRtjWvRwSakZxXxaaknc5QrDEs=;
        fh=KT2DzfSAotxeo7es9edFFoiCc35g1eZPMeJMRxx387M=;
        b=J8J6SYnY+FhZKhqlL+dX/GMctuGW2HYxFtao5woCSdJ5HpoSAEPe4kr93ionhMmAkQ
         JIOv0DnsfaZoeQIhSl0r0ysYCV0teZ3IceoU3mcZwULy/5wuDd7PzgEDoRI9l8+ly/2z
         aURI5CGEzFlvkO1bNYNnlzyk6lQaNilKJDo3qqzwG4gD7QSueL5vFoM0KCspAJLQ8gQ5
         kDicplzZOYFn9HkYht95kKgXXlqPhDBe2vAOnY78cd0NQcCAS7dLln8z2Gtd+TLuixoR
         araIhMl6UJiE55iMvy/BoU15JDtlrVue645hZFirFPdw8QWi/7bSLxPLTyb991oT4E+b
         SG6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789055164; x=1789659964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1gukMKgmXXLSe/xkuRtjWvRwSakZxXxaaknc5QrDEs=;
        b=ktFHgeVIn3uyfy+BilTNctikZIbhSy8oaXCz/fsusNLCn1t9VEIhP2hCIB1dkFsTZ5
         B/Do9r4/M5VINFADw9QzVvcbRh4zimV7ZcDkTFIIXi29rvDAukvoyRa+eoBYnXYKHj0r
         fN1ba4baAENhdghHWLWFhJmzCUtOa+QzNSecfiI7MWliBcm4UKf/TmyimK0NJ/9o2M8N
         gyZoVdWEsLnN8J6UGw9MiAESU6Tg0ewbzqwMA82SlvKa2qx+rBlxbByH18Mb2N7vRZ5f
         9yAfhh5BfNv3uFn2miaYWF420CyprIYWT4g9lp7njOFQ8+zJeR8eBpUUrjU1MsfmFL4I
         WO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789055164; x=1789659964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1gukMKgmXXLSe/xkuRtjWvRwSakZxXxaaknc5QrDEs=;
        b=NS3v3xwFugk8kdMgs44ZpK69JwAwxGVWCn5uYs/mEjQjmxC7zRCGlc4I6llVODWCQT
         gchsuNcqeDdGS7jSUpBNYWnUUV1Y74IqIjA4kDYT6iWpKPpa2hFUgDxDNEOom6S75sBV
         481LTrg1z7XRrPqEI3RSQZ5KEsB23bYkn7/auQAXYClYOdmqMXgixkSuReToHDaPhxs6
         nB/k2GMdL1xtAloFP5JJ9rb8Cr9e0xvTEeMmxjJ9xd21kbL5w8S+TcMnecULoHfuqP9t
         JN/EeTJ6GDVSvxn8RW/WBy6b5bh3MBbtFt2BN93+lVVs4jyOV4Q1twqklW5ro5+Fr0Mm
         EjBg==
X-Forwarded-Encrypted: i=1; AKwUvBxiID5hn5JRQL8wh4mjtYR9cEETRc+zqtRDMFpu2sT/bH1MYDdhIftINrrwyK0kfedJK+fkdfKzB2Q45hE=@vger.kernel.org
X-Gm-Message-State: AFuF++krgMscHy/I8/lUsA1nd+KmXQFUx1QRSq9xtRSTaXyOu/n1OSJA
	ESIE83pyCflmJB4+6y8cUcK7hNEPGxHb3nPtSSURVNmNjMcfUby3asngRKnNRZO/7hJe2YnfD5a
	GBVZlpNQMov3F2Rs5JzrclHtpS4U+TocCtBF2CoEc
X-Gm-Gg: AYBFou0W+epdntabmePmUEVx1zns5UT7187XEc+gJ39y07jYUy9UsdXiMa/fp03+B72
	zcAq0kpJ9lI+VfTU96gC2PbMjJsIPOM0mvCUq0Z0LKOko7ig8bwBrWImMvxCayAj3Xwem7W3kZU
	Rv7Tuu+cwZ7VYwbxOBH6WtmaYPWfJdDa+8PyHLqil1ePKrW7HRlzowgtueTrxjKqxWoyjSJb1KI
	JVgIv26gWQfyzgS7K2O/9ZD94FohXl/+N+j7RqawDyUucLH11Qgr/3SyJBCxpKCe8n0SGKGBSH0
	zFy+89C2gudOJdN+QBbmx/HO+qfID/Aa+JCU54CLW62b9IeVhqk9tTU3RoJw1BF4iV/1vvotuSr
	Czq0ztk4O3g==
X-Received: by 2002:a05:622a:1c17:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-530b49672bdmr21908571cf.14.1789055162926; Thu, 10 Sep 2026
 08:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-4-surenb@google.com>
 <4825a2fe-f064-45d7-a7c9-e98de7efe86c@kernel.org> <CAJuCfpFL_g7tELjT8p8ExM3tX_v2gNDM9rRKwwefPV_KW=fHfA@mail.gmail.com>
 <8e643f51-a47f-428e-9443-678326288fa6@kernel.org> <CAJuCfpEYdj=u0wczKRrsB8uDkbSzPy+hrsCo9TW9-3J3r3p0xQ@mail.gmail.com>
 <2336140f-c993-467a-b2eb-e99dc9427a59@kernel.org>
In-Reply-To: <2336140f-c993-467a-b2eb-e99dc9427a59@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Sep 2026 08:45:51 -0700
X-Gm-Features: AcwNN1U3AJ7bd1wu5DAq47WAQ3768Dp9C-h3ciQoeJdMEez_KO5Qa_LhKJ8PHrw
Message-ID: <CAJuCfpEL40p+vk6-km6_BBuE3+YY0WqkpbvQnQGFEo_73MAomQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] proc/task_mmu: remove special-casing of
 smap_gather_stats() start parameter
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 12:41=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/9/26 23:51, Suren Baghdasaryan wrote:
> > On Wed, Sep 9, 2026 at 12:16=E2=80=AFPM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 9/9/26 20:28, Suren Baghdasaryan wrote:
> >>> On Wed, Sep 9, 2026 at 10:16=E2=80=AFAM David Hildenbrand (Arm)
> >>> <david@kernel.org> wrote:
> >>>
> >>> Hmm. So, are you saying that !is_cow always implies shared_or_ro? Or
> >>> maybe you are stating that vma_is_cow_mapping() was the actual intent
> >>> here?
> >>
> >> So the comment says:
> >>
> >> "For private writable mappings, we might have COW pages that  .."
> >>
> >> Which translates to:
> >>
> >>         private writable =3D=3D vma_is_cow_mapping()
> >
> > Ok, just want to make sure I'm not missing something subtle.
> >
> >>
> >>>
> >>> shared_or_ro =3D VMA_SHARED_BIT || !VMA_WRITE_BIT
> >>>
> >>> is_cow =3D !VMA_SHARED_BIT && VMA_MAYWRITE_BIT
> >>> !is_cow =3D VMA_SHARED_BIT || !VMA_MAYWRITE_BIT
> >>>
> >>> so, !is_cow would impy shared_or_ro only if !VMA_MAYWRITE_BIT always
> >>> implies !VMA_WRITE_BIT. But I think it's possible to have a VMA that
> >>> has VMA_WRITE_BIT but not VMA_MAYWRITE_BIT, right?
> >>
> >> VMA_WRITE should imply VMA_MAYWRITE
> >
> > Ah, good to know.
> >
> >>
> >> (in sanitize_fault_flags() we even disallow write faults entirely if V=
M_MAYWRITE
> >> is missing)
> >
> > I see.
> >
> >>
> >> For example, a
> >>> driver can create such a VMA to allow writing to the VMA but to lock
> >>> its content once mprotect(PROT_READ) gets called.
> >>
> >> I don't think that would be valid for a driver to do. But it wouldn't =
matter
> >> here because
> >>
> >>         shmem_mapping(vma->vm_file->f_mapping)
> >
> > I was obviously overthinking this :)
> >
> >>
> >>
> >> I think we could simplify the comment as well to:
> >>
> >> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> >> index e671b4fd8dedd..4b7e7089cafa7 100644
> >> --- a/fs/proc/task_mmu.c
> >> +++ b/fs/proc/task_mmu.c
> >> @@ -1303,12 +1303,10 @@ static void smap_gather_stats(struct proc_maps=
_private
> >> *priv,if (is_partial || (shmem_swapped && is_cow))
> >>
> >>         if (vma->vm_file && shmem_mapping(vma->vm_file->f_mapping)) {
> >>                 /*
> >> -                * For shared or readonly shmem mappings we know that =
all
> >> -                * swapped out pages belong to the shmem object, and w=
e can
> >> -                * obtain the swap value much more efficiently. For pr=
ivate
> >> -                * writable mappings, we might have COW pages that are
> >> -                * not affected by the parent swapped out pages of the=
 shmem
> >> -                * object, so we have to distinguish them during the p=
age walk.
> >> +                * In CoW mappings, we might have anon folios that are
> >> +                * independent of the shmem object. So fallback to the=
 less
> >> +                * efficient mechanism in such mappings.
> >> +                *
> >
> > Sounds good. Will update.
>
> Likely worth putting that into a prior cleanup patch, so there is less no=
ise in
> this patch.

Well, this is a cleanup specific for smap_gather_stats() funciton, so
I would prefer to keep all the pieces in one place.

>
> --
> Cheers,
>
> David
