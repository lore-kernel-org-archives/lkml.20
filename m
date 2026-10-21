Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618060;
	b=4OWJC48d0ZVHaH2qGDMQpymfmPPuSieR2flZAvkNLutr3eoQgdO2XXID1bwRfeOfoVCI
	 XpfPv0g7Pmke2uw4yZsiYXwj/Hn+7OYF0fEKiblfq0H0zsyFca1vHHXcAFbALcng/zjtF
	 DVuqwcu8/auBnAIIPdtNUIUEmqmtXQHo2nxtRbfx8yehzWBuJng21awN37RBsPCouz05G
	 a2UTF6wD6GEdQrclBonrsWYXFYS+JYRk8MkV5s/g2wczJIqo89ZEGl4DiEpGhyH8ZBZIS
	 9yT1+55QIhP0wd9ElZm0YI3+lZmZgP6itvgdA4xoVRgBMORfiYkqZJ+aRgJnaaDimsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=4wmdHTAA1AuKVW6+MMratQ3OvnpQ7OBK1Rv6piTCmyQ=;
	b=C6OOvQce4V00xv9Sf6TMei0PDdWcRVOzew1P+2pdiJ1V2g7SDuSsL1oH31npG0KCCEm2
	 3ipkGbHpg4oNfjMIStzxyOAGGkeDQAzfM5WQb4FF3B5YCElaHklUtgijwdYX6Yu0kbO6F
	 Tw1Q2k4XAMNzwyiDMgOGEHSPVZIjN5PZG5c7ckXTLpY5rhCl7hfT4ax2XMcOa2xOWWO3C
	 xeqlU2eftfUZQfatLLc/N/xil3uFpGeemEcqRs58RnEcTjgGvME9D1oa0KS/fGpljeNxF
	 ZTnZY+5DWQUo5tY/Bk68SrcxPgLoewkABQ4aWmQ9q7qXi3dIf8TjAF6Mpw6CC+agZ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gbrC2+gF;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A225606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A225606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=gbrC2+gF
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so1707199a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792618059; x=1793222859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4wmdHTAA1AuKVW6+MMratQ3OvnpQ7OBK1Rv6piTCmyQ=;
        b=gbrC2+gF/Q6qeyDHeexSOmByq6qY3kHgZkKQLbJyEsifsIrmkDHmuLNC7YWIGjvbR5
         /ZAPXSc7W94cyz9IdgOltyl4NHV2XLGrawa85F0S3NVCtxvUqIQchENsPp029eVt4I0S
         O4bI1FatybiNA+3Gs6M237aWaXTjBtdDcoat6z9VVDvEUZNVv0tCzdzWLu9yssOEVlbU
         HNeD0fZQcvW1+e7JBxVSCsKrCHju/G5AoaNEWLtK+QNgB5/OfmXce3TGNajJH9frlayv
         at7fNo6svoNdH8nETM29kj1bKRLPlEMZauDQ9hNMMNCsuPtz/1BH4JB7GS31jIh4Joqe
         OJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618059; x=1793222859;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wmdHTAA1AuKVW6+MMratQ3OvnpQ7OBK1Rv6piTCmyQ=;
        b=gl3CQ6TjkQso9513U1ZIWFxxwOEl1U8E6Fk1soripYYPiwVQxjd/PkadTE2mZ4dVQT
         L4L9SCTo8mLLrXe97nmcxxiQh3f7TpV21V4bQx4G6xNy3Sg/knL51mWWWVOH/lrJhY+A
         mjIi8Xf/8prtpcpWRIyxWvTZDMjh9RzZpMDTzZjA+uoJpMXWjis0u/rNvwXP4H798Tds
         pRyS4fQibL8WJyGEy9ZFVrH/6heAo3roa4R51h0Sjal8tQbxMvnB6o3AFHpXvPSVYBQo
         HskRa+wjYGQtOtlxdOlCwHvrMJCiaSykGx2XkHqKMNhnb2fMCySRNRyNwg5LQ0GkQenu
         JFSg==
X-Forwarded-Encrypted: i=1; AKwUvByQqYgD5kzoZBb7rosLfLL3A65C6+9+RAuWmZ0s1hCqFSx4sECf0KOSpMIHudslP0R5ylfKqTrr9M7PYBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2apBKI+KlgAqL15I+esKzAAiQwNwEviTXuj4hSYn2NRjG85Dc
	ZpsyRl/DDJWaR9NzRZAmu+SmlN8+wFKURaKTF8EL1NBLmcnU+zT57yJK4mNEfi2PwhDOcBegldy
	R/QtaKZJzBSjJhYf0Hn/5IQ==
X-Received: from pjboj12.prod.google.com ([2002:a17:90b:4d8c:b0:3a8:645b:da8e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:35c7:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3ad86dcac60mr3082798a91.5.1792618059129;
 Wed, 21 Oct 2026 14:27:39 -0700 (PDT)
Date: Wed, 21 Oct 2026 21:27:37 +0000
In-Reply-To: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <491B482A-8177-447A-8CDB-AF83C13A5DEE@linux.dev>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261021212738.321547-1-jthoughton@google.com>
Subject: Re: [PATCH v2 01/20] hugetlb: Don't restore vmemmap of non-HVOed
 folios on bulk restore error
From: James Houghton <jthoughton@google.com>
To: muchun.song@linux.dev
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, david@kernel.org, 
	fvdl@google.com, jthoughton@google.com, linu.cherian@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, mark.rutland@arm.com, nikos.nikoleris@arm.com, 
	osalvador@suse.de, rientjes@google.com, ryan.roberts@arm.com, 
	sunnanyong@huawei.com, will@kernel.org, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:33=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
> > On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index a1b51251103b..4dac7ed1df57 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -1613,9 +1613,14 @@ static void bulk_vmemmap_restore_error(struct hs=
tate *h,
> >               * page is made a surplus page and removed from the list.
> >               * If are able to restore vmemmap and free one hugetlb pag=
e, we
> >               * quit processing the list to retry the bulk operation.
> > +             *
> > +             * Folios whose vmemmap was never optimized (e.g. because =
HVO
> > +             * failed when they were allocated) can be freed right awa=
y;
> > +             * remove_hugetlb_folio() has already cleared their hugetl=
b flag.
>
> Since you mentioned the hugetlb flag is cleared. So it's unnecessary to c=
lear it again.
>
> >               */
> >               list_for_each_entry_safe(folio, t_folio, folio_list, lru)
> > -                     if (hugetlb_vmemmap_restore_folio(h, folio)) {
> > +                     if (folio_test_hugetlb_vmemmap_optimized(folio) &=
&
> > +                         hugetlb_vmemmap_restore_folio(h, folio)) {
> >                               list_del(&folio->lru);
> >                               spin_lock_irq(&hugetlb_lock);
> >                               add_hugetlb_folio(h, folio, true);
>
> Something like following:
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 6a011b627986..1ab3e61f4704 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1616,21 +1616,31 @@ static void bulk_vmemmap_restore_error(struct hst=
ate *h,
>                  * If are able to restore vmemmap and free one hugetlb pa=
ge, we
>                  * quit processing the list to retry the bulk operation.
>                  */
> -               list_for_each_entry_safe(folio, t_folio, folio_list, lru)
> -                       if (hugetlb_vmemmap_restore_folio(h, folio)) {
> -                               list_del(&folio->lru);
> +               list_for_each_entry_safe(folio, t_folio, folio_list, lru)=
 {
> +                       list_del(&folio->lru);
> +
> +                       /*
> +                        * remove_hugetlb_folio() already cleared the hug=
etlb flag
> +                        * for folios whose vmemmap was not optimized, so=
 they can
> +                        * be freed without restoring vmemmap.
> +                        */
> +                       if (folio_test_hugetlb(folio) &&
> +                           hugetlb_vmemmap_restore_folio(h, folio)) {
>                                 spin_lock_irq(&hugetlb_lock);
>                                 add_hugetlb_folio(h, folio, true);
>                                 spin_unlock_irq(&hugetlb_lock);
> -                       } else {
> -                               list_del(&folio->lru);
> +                               continue;
> +                       }
> +
> +                       if (folio_test_hugetlb(folio)) {
>                                 spin_lock_irq(&hugetlb_lock);
>                                 __folio_clear_hugetlb(folio);
>                                 spin_unlock_irq(&hugetlb_lock);
> -                               update_and_free_hugetlb_folio(h, folio, f=
alse);
> -                               cond_resched();
> -                               break;
>                         }
> +                       update_and_free_hugetlb_folio(h, folio, false);
> +                       cond_resched();
> +                       break;
> +               }
>         }
>  }

Thanks, Muchun. :) I think it's slightly easier to read without the second
folio_test_hugetlb(), like this:

	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
		list_del(&folio->lru);
		/*
		 * remove_hugetlb_folio() already cleared the hugetlb flag
		 * for folios whose vmemmap was not optimized, so they can
		 * be freed without restoring vmemmap.
		 */
		if (folio_test_hugetlb(folio)) {
			if (hugetlb_vmemmap_restore_folio(h, folio)) {
				spin_lock_irq(&hugetlb_lock);
				add_hugetlb_folio(h, folio, true);
				spin_unlock_irq(&hugetlb_lock);
				continue;
			}
			spin_lock_irq(&hugetlb_lock);
			__folio_clear_hugetlb(folio);
			spin_unlock_irq(&hugetlb_lock);
		}
		update_and_free_hugetlb_folio(h, folio, false);
		cond_resched();
		break;
	}

Applied this in the v3.
