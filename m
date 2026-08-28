Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618EA3BBA1A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 19:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944093; cv=pass; b=pK4u4GaZ6XdzAGnxiNkAmSv1K5BbGIbuU8PlnorgJK38MBpS5Xy4QEnuhixrw95Z1UD5xqdI5jqJEdKSl0hj2Uk0XC5+jaqPvxEv3RXX1JAl0yQ9Hxdmbbin2j3uFY+qkZe3eutLC/v6XYymgzcu9au9YM1Y3bOFzD6/7cTysC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944093; c=relaxed/simple;
	bh=UTY7n5mWKlgU6mG7lT+g+x29Ur3pE7Cfj4pLQ1uLVVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KwKrhHBUwsjFRyQmcd70jvkx+FS4upBNs17juAG0s+/EV2A5j9tTiRjjwsoEZJdnmUniRATNGvqOzXxF6GrufyPK+fXpuDczGYad5itIXQzm4SS6xCwlfnRFyeMBwMyQRqh/7KpbbH4AM5zD3pomfTDXJdOF/+3p40v1IGVUQRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X854PUOV; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X854PUOV"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so4010284a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787944089; cv=none;
        d=google.com; s=arc-20260327;
        b=CuNp5M3t2Qy34NFoEjiCfZZFWLPqJnt7oduaxM4CcQIdH9du/o/oN+G0bpWYxoZadR
         To5JCerPyzTkdF+aL0BZGU6V/Nut5T23stE+pMoLq5taH4R3hHKWBDijYSByUhuN/UYp
         +xjOiVWI43Ty4OFSk2t42C5poDkOWxK6OHXHKiXyOKDi4jHEkuRs4G4Dq9VS+H6CE/fR
         u8RVxmDUAiscwXK+b0IdGHUCHnK8foC+Epdxq14m7PmZUKxtGTDvIYzJMzdlOdoAv0qK
         DVJB0Yjx2/+2NFCvt0+95D0wY5HElWPFSXDNZ5R8WYha8BMaUVu46oM0xmkz35lZxYOX
         HfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TaAS1sNmEmRB6xGut3oqqD3PYBl5B8b35AmgUg5X4uw=;
        fh=O/SO0H34mFdlrfv4J5TU4IX6xVEmt418hSju5rREbZE=;
        b=hCVO2K0Wmdn+spONrvGlK1/kiPlVKZKJ0RlSzguw8Z5zDUFVCL2gL0S+o1GUgyUviW
         wuGgFQaAzVishik3l0Re3L2zNTK8DPLakbFeQjy3tGJrO2ikowYk7gD+6M9IMK3gbSeW
         eyzSx43vPuYvO/vPuGwSCdDtihKiVczyEXkLetR6y/cvPilFogVs9pXdD9rdK4nOKUFl
         xener/5R7aq1EmiHb9fLN8XTfYDsZRZ5e3e4Ex9+/WetoUc0yxkbywttydGSibfMd+9M
         tVKsqWbnYCwsX/h87FnQoPj7QKGq25cIcsKK5PRJKIFds/g8/grOHHI0rMUNHrznnKXr
         7wEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787944089; x=1788548889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TaAS1sNmEmRB6xGut3oqqD3PYBl5B8b35AmgUg5X4uw=;
        b=X854PUOV/zQ8nqoMO9N4Ia1q8+8tSYRmoU6kU8C7AYazOmQLD+/lkrn78fF8ltJm5C
         gLjenKDKfby5HF+9JUT7j/pJvJ774/ck1vKxhYaBkW9P0w9D/KL029FwLjL266tY6DHL
         YNfzvR+QMlEnTO5wHsmMtcgeRZsCHZCuUmxBniGWINOn4JWyZEUL6EhwkD1fVAvVvLuz
         sOZwfjjO36QMwPzVg6GbaqEgZXguTNm9etT6M9zt6QsbxJpCSn0nYszyK12VNSGVY8Xh
         af3jziV3JeE1fC/XLGKcdOgt2TtIilAG201xWNdN1kIviWkzYR20TTLxVG+hFI1Dn+D0
         h/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787944089; x=1788548889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TaAS1sNmEmRB6xGut3oqqD3PYBl5B8b35AmgUg5X4uw=;
        b=U2JwitDbO/nFsZDm+gOVTFEB2KZ+wocyz+0FGjOwURgdRZDeeGUAifDvYLhO0mP3Nq
         Cd1WhF7VV6Q2jjnuBVIbrdbqw5gSpPoE37FTqfKoBPDfPnCWcxBdsxxCUJNgxUeoiP/z
         TkF0i+QdjcqukDFJ43CkRaZq1MyM7MRvspiOFh2hbNJnBzWPmHpKhRxBOsFdAj7a1hVg
         a2TzMGnHPsp+Pq/1wd89WNx86iKDDdnzS5lB62g57MUupKufKZLAGXuvmCUYJjlx4umQ
         Iw5ggLyWw4rxzlnrr6QakMjuUXVyVt4ju9QXVAG8HRIpp3ldaHA5fPJCQiFCnP7DBlep
         1YoQ==
X-Forwarded-Encrypted: i=1; AHgh+RppYoQLCiFX/IyyOIzRahomqGGqreuz23IZmefKfg8FdCNwD+SUboRDGupo8ijisEr+/CAcySWJvD7cdlY=@vger.kernel.org
X-Gm-Message-State: AFuF++nkR9wolj4OqWYOHkOU+FFYZsxadekCI9UcohNhybcM1iF6porE
	XK7X4XbudED3s4JQm300AfLyUBkUjyK+8kbtMbUx4LkfoCSnerQxH/i4nETg/Ldvxt1eIu+5tNM
	SSy+gRQ7WmIR3r8FsN5kUydBl3gIwqxpCclY2jBQs
X-Gm-Gg: AR+sD109tX3NAXWxsdAxg6lPDTT7aKb/Bw84ri/rdrFSUeBBvEMYYK+9+Mu4/3YMfot
	kv1gJq7XzHgA3yUWcO4BSL2SVG3+zYXGpcWvI5wVUxepi05eI7vwo535T8y+DQGCx+f7+OT6lBT
	ErYXbddXGvN9laQ2/2hAIlnqtIeM7W23e1OkXIleZwLvVxRwLWeDpE1u6LuESEWb4re+yiF0gEm
	J2YknlXQ0+zRa/zqvDvxGbulVDe8h0g5Z71ky1FLj6obysvBoJIAZh0RCQAqdr9qC7uMbvni8T4
	yY4aRwaXKVVFODgL9gXE0LVsNeDnoUSON9igoLW7nb7WVzgLRH4gTF3p3jyOzo6f+CQrzvb5EbB
	pVzhDzWYHDdxMmyye0Bl0fMbsQ+TCsNVuXb2h58lRno0AtM4k96P7zF9OKWJb35vu2SHuPdI/SG
	dsmjXswyEViyIT
X-Received: by 2002:a17:907:c8c5:b0:c25:3c3f:22dc with SMTP id
 a640c23a62f3a-c253c3f238fmr1089282266b.13.1787944088979; Fri, 28 Aug 2026
 12:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828005004.2870750-1-jthoughton@google.com> <20260828094703.11081-1-lance.yang@linux.dev>
In-Reply-To: <20260828094703.11081-1-lance.yang@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Fri, 28 Aug 2026 12:07:32 -0700
X-Gm-Features: AcwNN1UeBlJNZQTScnpGSIA84ceVmmw-Znp9Pros_d_DNJEw7LyIhxNwfMF_Hy8
Message-ID: <CADrL8HX+FT4ymeNOKLPQ+vE7HLMRwjdDJX=KjdqgY0f_YhmSiw@mail.gmail.com>
Subject: Re: [PATCH] mm/khugepaged: Don't collapse uffd-minor-registered VMAs
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, usama.arif@linux.dev, shy828301@gmail.com, 
	zokeefe@google.com, hughd@google.com, kas@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:47=E2=80=AFAM Lance Yang <lance.yang@linux.dev> w=
rote:
>
> On Fri, Aug 28, 2026 at 12:50:04AM +0000, James Houghton wrote:
> >Userfaultfd minor faults provides userspace with the ability to manually
> >install PTEs with UFFDIO_CONTINUE. Right now, khugepaged collapse can
> >map holes in the VMA when a naturally-aligned THP is present without
> >explicit action from userspace.
> >
> >This is a problem, as it bypasses userfaultfd minor faults that
> >userspace is expecting to handle.
>
> One basic question first. Should MADV_COLLAPSE refuse to collapse a
> UFFD-minor-registered VMA, regardless of whether all PTEs are present?
>
> I'd leave that to the maintainers :D
>
> Anyway, assuming the answer is yes, I wonder whether the new check is
> sufficient. See below.

I also think the answer is yes.

Theoretically you could optimize this and allow userspace to avoid
calling a bunch of UFFDIO_CONTINUEs and instead call MADV_COLLAPSE,
but let's wait for someone (probably won't be me, at least not for a
couple years) to ask for it. But khugepaged's own collapse routines
(and potentially other processes via process_madvise()) should remain
unchanged; that would reintroduce the bug being fixed here.

> static inline bool userfaultfd_minor(struct vm_area_struct *vma)
> {
>         return vma_test_any_mask(vma, VMA_UFFD_MINOR);
> }
>
> static inline bool userfaultfd_protected(struct vm_area_struct *vma)
> {
>         return userfaultfd_wp(vma) || userfaultfd_rwp(vma);
> }
>
> Emm ... userfaultfd_protected() only covers WP and RWP. MADV_COLLAPSE
> passes install_pmd=3Dtrue, so the SCAN_NO_PTE_TABLE case can still reach
> set_huge_pmd() after UFFDIO_REGISTER_MODE_MINOR has completed ...
>
> Maybe:
>
> ---8<---
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 33c41bc32af8..0eada7265d59 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1893,6 +1893,8 @@ static enum scan_result try_collapse_pte_mapped_thp=
(struct mm_struct *mm, unsign
>          */
>         if (userfaultfd_protected(vma))
>                 return SCAN_PTE_UFFD;
> +       if (userfaultfd_minor(vma))
> +               return SCAN_PTE_UFFD;
>
>         folio =3D filemap_lock_folio(vma->vm_file->f_mapping,
>                                linear_page_index(vma, haddr));
> --
>
> With that, LGTM.
>
> Tested-by: Lance Yang <lance.yang@linux.dev>

Thanks, Lance. This is how I should have written the patch to begin
with. :) It addresses both comments that Sashiko left as well.

I'll send a v2 soon. Thank you!
