Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DBE3F1047
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787960895; cv=pass; b=aOoPAz7lYlLpvnYuCXszD3VcCaTuf9qNpKLJpMowfhC9ZaLthwuCsvvbqQTENPA2/Tllbox01UZjYMZ2Mkv7KeM8y9REkuiHHlZFrYzpwRE42XDifmB8hI1Qjb4togG2Ew1FiLSzIKLQ+hv2jFr7JYBpfg43lZYq/niR5hTnLbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787960895; c=relaxed/simple;
	bh=spX/covX2Eaw7V1D1WXRyeguV90YicWj8SfcKAVL6xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cO2vPO51YAI9sCyOJeZAcTvXOcSYt6ZZ973N6zZ806897ScVmBjA/kCE8xXyzIQ61EJBX1pe9jk7TiOAHjct8VYktvbyRvxhKWwLInDhLoPE20CLnNy5zZ4MebDWNRMdKevjG7eEBB+hfCvJk3biqhNRDC2SW1go3Y6SrbMUykQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JBkwAxx0; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JBkwAxx0"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c01c79467so100851cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787960893; cv=none;
        d=google.com; s=arc-20260327;
        b=ENbiUue0G70qSiLhGwWjMJNGsWM/DJcKjdOTY+3Ot1jyonACmsmfgD476syygHyGpf
         8DGJiPQrISo7JCpGB8oJWiv59sZJzgDNNao8K8RXPwHQUklxoKMRcjMZjI/ruOaj9P2+
         pRyWBmrPWOruVEmEpPE/JCWEJ0fBCFAyADmxRBQlR2EDedU0unzbXbB4OhdKS9hDDG5A
         QrXS9sz8nfvpPLFogHjg1s3pUZfs3J7tN4dmdJNDW64/CiJ6hbDU+DDTXlvmoNg5TGLn
         pJUlEK/TNoC+VFDLDBZ04DfSU9VBGMUzJ+oouo+xq3wokyTcwqBOTBih1Ol1G71Auwvd
         d9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yc+vOqjH7EkbGiYMYTHlmr955fm/fNcVpennfZlqFLU=;
        fh=jcW4DGMaA7gbyun2HLcWXEnCvPG3CrXlsvEsvCLNXlc=;
        b=VxXx3N79F6QCOcXlvGwClOMbqfKu1LP/zyksGbMJQhut+kq3Iz7hqUfrZubw+OYtmG
         Ll1kpfS8IVYuOPG6MG7rh6CRH6HshEXxeMJUeQGgtDHwqaDKHdDL2HfZhAb7FBy+SKzi
         k212Wtr4mhr6wfypzB+IxhgV1jLejWeIZgmA2tWnSiYvR2AUNYmQh6By+wk1Y34acnvW
         xA6QSqS66DClsaIt3IBk2XjeicSu24z3fPI9PG4gQlSWtdKM2DJ2mFPZMimck8w97Fo+
         XhgKTvE3EjwLbF1vrkr6BVrGL23rpPLnoVNBVtAKwLDm5Ndjac1fU26tGiKt7wuNC3vQ
         PZyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787960893; x=1788565693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yc+vOqjH7EkbGiYMYTHlmr955fm/fNcVpennfZlqFLU=;
        b=JBkwAxx0fKinEjMn+7OFRh1VzaX2WLJYcsVHCJE1ICAQyN3swK8NA8Ajt+i/CzNL1r
         RTgG5sVrZ0bJTCz6Jrs9mduXaK8Bm5EmK98Ie6WTiUbYF1lSU6mSfOQAMTS91BhySfTK
         Jczc6VD3kD60hQ1GiOIBcQJtfUGELC17UCvUqd9FBTCSnHc/24RaRUR6S84Bzg2B6blt
         4IOAvc8jgmPR6gSXkhgykR3+O6uYSUqC6ZQmDV7CEga/8L7ZeAEb3sQM2WsKHZaiCJ4P
         h5qU4hNJEhPHRa5KGEC9WgGaXrYku6hbBXBNlS8QpTmxkIyTWb61yMBliwM+QtL9AFoG
         xY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787960893; x=1788565693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yc+vOqjH7EkbGiYMYTHlmr955fm/fNcVpennfZlqFLU=;
        b=mAM+kjQArHd+xmUgDTXbE2pvlfrbHv9BXwh9UMnZ361hgarmr5hIYg1IS71LbsGRVg
         Y1dQSEKZeu6aphlepymW8+5cym26754/ajSpGDb2X8wb43smPVHy0VH0ixt5sWV/pCq6
         H6/UhcqLvT/ZvadIrdUBoSP9LVuHtKc3ZdEjwjO4Ob6rbd1nombtGXQ6GlIlWx7Ywv/9
         gtAXsy3aOnQMjkDupNLTwFaaVwCSopUZ5tRFTtJfZEuaVaIRr/v6nw9zogzwM0UD7LIX
         jRETyP1r4TR6XAlGVP0/AT0HvusHDImv4OYL+/JJXMJaxhklT1vy+cOgBJZ6OSc6ty+V
         uoLw==
X-Gm-Message-State: AFuF++lh5gO+m/him0i+QGnoHdZXMVl2XKiMzop9zWY+FJNRuNwUoZCJ
	AeG0lt5s9Wcm3h1KI7sMV/ExFibl9NFg8eT7nJiL5f0OtFAbo99A8FAGtl35zhmM/8PkdEmMLqd
	+yGBLBRjFWZU0kUv2IzmuVc1k/C1lrSEPvTf/AKKH
X-Gm-Gg: AR+sD12XoyWUuLSmZnsAM4wkPdjuU6uN8RC2ydiDTrVNzL5NvwpoU2VO4xhKeoObjxI
	NFFxMfiTSTfCdXpVRFoU/o/VkVbim0H9bWWui1Ei4WcGw43zQtNm236aaoiC/DfItbne6M19zbR
	4kfKAXHY8G3hJTtr0u4Vk8ix1aFpIU5TA6c5rFR1vL2+hcLdio8pJMRrK8Wiab9oOBAnFAwlgSp
	/+tXZTwI9MWbJYg4Tf+OwjL8jjjDhK32XMv5aaOwQEsAmF+V7WdTDLS7yvHU9j7IuojwoCgiyWf
	iu6VA6C+tlsxQmmVg0NRSi/Jscn1DtMNlGPH60k0EzA=
X-Received: by 2002:a05:622a:90b:b0:52b:806e:2633 with SMTP id
 d75a77b69052e-52ff716a474mr6023051cf.1.1787960887478; Fri, 28 Aug 2026
 16:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811025157.1632867-1-riel@surriel.com> <20260811025157.1632867-5-riel@surriel.com>
In-Reply-To: <20260811025157.1632867-5-riel@surriel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 28 Aug 2026 16:47:56 -0700
X-Gm-Features: AcwNN1XddQRvVoPMDPAL9MgcNlHgxAaz5oDRgEf6NIvOFt4vTdIHMC1as1eA0bg
Message-ID: <CAJuCfpF47Mpi40=8yujBNruCDvY-Ezk0WFEacCqxcdRjmUqt4g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/8] mm/gup: break out follow_one_pte() helper
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:07=E2=80=AFPM Rik van Riel <riel@surriel.com> wro=
te:
>
> follow_page_pte() is 92 lines and does two separate things: work out
> which page a PTE maps, if any, and commit to the page it found. The
> first half reaches the second through five exit paths, two of which
> unwind the PTE lock in different ways.
>
> Split the resolve half into follow_one_pte(), which returns the page it
> resolved, NULL when the PTE cannot be followed, or the errno the caller
> must report. follow_page_pte() is left with one unlock and one exit.
>
> no_page_table() can look up the page cache, so the case that needs it is
> recorded and the call made after dropping the PTE lock, as before.
>
> No functional changes intended.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  mm/gup.c | 100 +++++++++++++++++++++++++++++++------------------------
>  1 file changed, 56 insertions(+), 44 deletions(-)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index b755ceaac0f5..5af6a23285de 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -868,74 +868,86 @@ static long follow_page_pte_commit(struct vm_area_s=
truct *vma,
>         return 0;
>  }
>
> -static long follow_page_pte(struct vm_area_struct *vma,
> -               unsigned long address, pmd_t *pmd, unsigned int flags,
> -               struct page **pages)
> +/*
> + * Resolve one present PTE to the page it maps. Returns no page and no e=
rror
> + * when the PTE cannot be followed but the caller may fault it in, and a
> + * negative errno when the caller must report the failure.
> + */
> +static long follow_one_pte(struct vm_area_struct *vma, unsigned long add=
ress,
> +               pte_t *ptep, pte_t pte, unsigned int flags, struct page *=
*pagep)
>  {
> -       struct mm_struct *mm =3D vma->vm_mm;
> -       struct folio *folio;
>         struct page *page;
> -       spinlock_t *ptl;
> -       pte_t *ptep, pte;
> -       long ret;
>
> -       ptep =3D pte_offset_map_lock(mm, pmd, address, &ptl);
> -       if (!ptep)
> -               return no_page_table(vma, flags, address);
> -       pte =3D ptep_get(ptep);
> +       *pagep =3D NULL;
> +
>         if (!pte_present(pte))
> -               goto no_page;
> +               return 0;
>         if (pte_protnone(pte) && !gup_can_follow_protnone(vma, flags))
> -               goto no_page;
> +               return 0;
>
>         page =3D vm_normal_page(vma, address, pte);
>
>         /*
>          * We only care about anon pages in can_follow_write_pte().
>          */
> -       if ((flags & FOLL_WRITE) &&
> -           !can_follow_write_pte(pte, page, vma, flags)) {
> -               ret =3D 0;
> -               goto out;
> -       }
> +       if ((flags & FOLL_WRITE) && !can_follow_write_pte(pte, page, vma,=
 flags))
> +               return 0;

Before refactoring in the above case we would "goto out" and
no_page_table() would not be called even if pte_none(pte). Now I think
you will call it if pte_none(pte). I'm not sure if this does not
matter but this seems like a functional change.


>
>         if (unlikely(!page)) {
>                 if (flags & FOLL_DUMP) {
>                         /* Avoid special (like zero) pages in core dumps =
*/
> -                       ret =3D -EFAULT;
> -                       goto out;
> -               }
> -
> -               if (is_zero_pfn(pte_pfn(pte))) {
> -                       page =3D pte_page(pte);
> -               } else {
> -                       ret =3D follow_pfn_pte(vma, address, ptep, flags)=
;
> -                       goto out;
> +                       return -EFAULT;
>                 }
> +               if (!is_zero_pfn(pte_pfn(pte)))
> +                       return follow_pfn_pte(vma, address, ptep, flags);
> +               page =3D pte_page(pte);
>         }
> -       folio =3D page_folio(page);
>
> -       if (!pte_write(pte) && gup_must_unshare(vma, flags, page)) {
> -               ret =3D -EMLINK;
> -               goto out;
> -       }
> +       if (!pte_write(pte) && gup_must_unshare(vma, flags, page))
> +               return -EMLINK;
>
>         VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
>                              !PageAnonExclusive(page), page);
>
> -       ret =3D follow_page_pte_commit(vma, address, folio, page, pte, fl=
ags,
> -                                    pages);
> -       if (ret)
> -               goto out;
> -       ret =3D 1;
> -out:
> +       *pagep =3D page;
> +       return 0;
> +}
> +
> +static long follow_page_pte(struct vm_area_struct *vma,
> +               unsigned long address, pmd_t *pmd, unsigned int flags,
> +               struct page **pages)
> +{
> +       struct mm_struct *mm =3D vma->vm_mm;
> +       bool need_no_page_table =3D false;
> +       struct page *page;
> +       spinlock_t *ptl;
> +       pte_t *ptep, pte;
> +       long ret;
> +
> +       ptep =3D pte_offset_map_lock(mm, pmd, address, &ptl);
> +       if (!ptep)
> +               return no_page_table(vma, flags, address);
> +       pte =3D ptep_get(ptep);
> +
> +       ret =3D follow_one_pte(vma, address, ptep, pte, flags, &page);
> +       if (!ret && page) {
> +               ret =3D follow_page_pte_commit(vma, address, page_folio(p=
age),
> +                                            page, pte, flags, pages);
> +               if (!ret)
> +                       ret =3D 1;
> +       } else if (!ret && pte_none(pte)) {
> +               /*
> +                * no_page_table() may look up the page cache, so it cann=
ot run
> +                * under the PTE lock.
> +                */
> +               need_no_page_table =3D true;
> +       }
> +
>         pte_unmap_unlock(ptep, ptl);
> +
> +       if (need_no_page_table)
> +               return no_page_table(vma, flags, address);
>         return ret;
> -no_page:
> -       pte_unmap_unlock(ptep, ptl);
> -       if (!pte_none(pte))
> -               return 0;
> -       return no_page_table(vma, flags, address);
>  }
>
>  static long follow_pmd_mask(struct vm_area_struct *vma,
> --
> 2.55.0
>
>
