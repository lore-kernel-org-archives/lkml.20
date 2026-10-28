Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793147019;
	b=MlV2L77bc/g0KaPm9IGoInACM7o2OTLyWGF+CGft6gqOrhcnv+rtzJ5NrLd27ydDUls9
	 lVfKJVnrZDy7lRrn9EH2ngGVrjcAFIGURP6WHmRWIV2JeorXdWq+XVQkOWnxC8lx7Hw4m
	 ZGrtvBQ+7eXddXC+oKC7xX2Qy2VObmsAPq+JevQ5NRy+hcP3ZP1n8c5W3V+ob3k/vB/Kc
	 lZJwoagLjyWUsyH2QL9RrU9ii/zBa8tY/k+1Yv1G5vS6/HcHE1HwsegGOtkjJajnjvL+l
	 h+/dHERNrP3YxZt4eHK5REMZ3/fDYlkBsDsI+gs0bpK5L/0nBIqRcWpueHjlyUMN/VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q+kS/Y2rR6fuaKmpLXLUb9l2wfeJNFpsSAfgHh9ud6I=;
	b=DWcgTV1LY2zMeKBeLJRwn3YydeA/FstCl75n27RuTLjKacX2vW1iR2sLPUhxeXcg8btm
	 7Deo9QVpO3hjRJptvxof/KIlWWJ7hH4QFmGBB9kqdIp6uA0oyocsoLg4SCqZ3VMitOEEr
	 rarIMqvRmpFE/KlCRMfBtKKZT/UNaXbUX8NPNg8Y96dp1E/VtTydTWw2hbuOM097VhWw/
	 GUCdvAwJpmHE+OGoODlhu4feVegetIueeeDQA5nSEOplk9LwYqk6YSvDEZ39ImnqYXWPn
	 wVXZ8A7/HfO6Xl1NNGKNa/VV9aLOaGmjYc6qPVGW276n1OklBb5acbxLim1OnYBY2uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UZdHgaFB;
	arc=fail smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936BB606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 936BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UZdHgaFB
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6dde81a6820so412165eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793147017; cv=none;
        d=google.com; s=arc-20260327;
        b=dF2jCeAaI5QPWpXibzjDGdYe0JjqislEHUfRcGMPpLM0rW7saonUg1LDPSgI+ckzd8
         jBZ6BzK6dul013C65+SexHbDT6d/uBFeW56+CGp5aI/Gvi1C+tobuFZJV4jJW5hgPvlm
         5SusJXZioaq5I4nuSMNm7ub6C7tbszhaILvrnseB9az8IFCPiSIrpHGfkYSguNYIqGAh
         gW7JTRK7HdKk+BVKo9wWYgngQOksVG7TL6n4tbb/I98jWb3UMuQcfCpEQHdNpIa7DKA/
         zoxsOIFv2ZXhepJBVZpsE8R4PKIrCf8VssaCIF+4BdlAK3DCQR++axnkfZslMyXssfcL
         wteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q+kS/Y2rR6fuaKmpLXLUb9l2wfeJNFpsSAfgHh9ud6I=;
        fh=t7k0J9/6lg1FJHUGLLjO2tv3Q1dCDeBqUwQ4wed3i7g=;
        b=REKjCSxZZG5ob0wwDmeekEedEJaZFYTwC+C3RF9X5ko+14B0v5849+qqBEFBEOkTl5
         vLjsnTBxSPMn01U0ESm+1Jd9NrWvCiCPZBMKSy5xxdpVXV/PPk9IVWFcnmM/uB/azfb9
         xw3i3MyQnwWI9B9Oou8SRclfxYlxLFSuw1QeDe4v7oVjKUmMNNSst5p65jvab1/V7/aN
         g1PaJNdV6LDZ1STiQXxEL6s8LiejvIXMRwJeDea6SkyrX76KOp4ZM125WXEc4ZZiNRBi
         m9hMsB+i+CwH9+k2+RDXB+6DR4w4tps6XCtrMsiSiXS0U+RJ4ECTZKY9cfXL6FYFrDRd
         iK4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793147017; x=1793751817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q+kS/Y2rR6fuaKmpLXLUb9l2wfeJNFpsSAfgHh9ud6I=;
        b=UZdHgaFBEqku8HdYlRJ6qbXEIg7YyzvhQZMaCBWicTqzFZGCBQipinLkWMuZ6jbCff
         /FBFimeCjWZPIY4Po4eU80ab95WbA5Y5v5OR+4846cKmu4rhKmOVa0uMLcGC/t5yVQyv
         nkyr/bYL9WJea96dNa/RPEuA48caxicvXIveMVHgMbhh2mwQVB96GDhIRqels5LtLhdF
         QqEDp/0Qnvk2tqtN8THw5tp+gomI8qJ+rbA/5cTLz2QVdfwa5VY5POItjZqXCbFgoCRq
         AJYDr3WTjD38A7BKGcOZ4Wvy+oa4tOkGQBfmp4T2P+f6mTGFPlK0TyjcvsYBtJs4uQGE
         DSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793147017; x=1793751817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+kS/Y2rR6fuaKmpLXLUb9l2wfeJNFpsSAfgHh9ud6I=;
        b=fRCBL6MiMhm2x8QxQs/1xChMlDkL0IY3xC5GUY3U1WJKlxcWaAFWJl4mg+ysU1mWyM
         ccPUKKdcVpwM+GOvS6FBDXSCSDeor9498IL/n170CTKvpI1FOHf8/x+hF/AgFJm1f4Nu
         diFYtmIrSAznL8yzWJ6ZPorCOdMFMk/DVx0n8e6D4zxeqgeRFHhIxfk5qa1M/ETav18e
         gfylUGx2WFptJnWuS69qG13yguDDAlbhvQuqM5/T0UjjZ0RS+oAUzdH8DgH2PnJ4yjfe
         BMJ/iVUH7wuRSrDtrI8aw37VzFbmarAYsTJNjx6g8gPdjFHCKt4kpP0MhcueBtARG++V
         zS/w==
X-Forwarded-Encrypted: i=1; AKwUvBys61xBM7FDWwULsWCW21O5Fq8vTXtil0Aml80Yzohm3RaCM33ctmZ9w54TRHMhOHBA9DnNh38oLwB9fd0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2KFiWpnXdy6U5VhY2ob29NQOwhxBn+jGfQ5X5kl8tPi2aeJj/
	svL0mHmhF51tx1jk6bvuiFLHwaXOL+ylbVd6dgK1+4TditEIWRbSFnlUXqaH+SS1R/0/0Sh/0iE
	zht9ysZH/WBWhFKDMHlYMi4sPSjemOxWl2V4c9GhC
X-Gm-Gg: AYBFou2uDwVaQikPySIlgsWeIL8DkCPfM3jOTFsF9pIp2CQf8UF7Uq06pD59WtqM1NY
	VgyMrUo85ScmQ4QOralH3XrRTax8G4bEliiAUVA4SSh9WKjGMKvxo4KzKkWoPQt009D0mW5o0oo
	VifaXNmfKVJbhi0LUpe1DAZBBYK4j75RkYDxB9d+ymYAX1hiMvHNaSOFD1B/YrpMEHLignNykph
	s65Xp2BNqgGW2zUbwVhmwzauOLblqZUkgR2rMhycySjoRWBAJ0ya08RF3Y8AQRSjPaCmFFMFUK4
	D8OsNSCaXkS0D3pMSodYsRtw/RJGaSyKYvl3F9vW6/onLAQpNSn0CjUJUn6Fp7Sy5cOnoJqZae3
	lBEkfIdFpyGK6P/mqLhCiEj40p7VJ1BH511ycJpXEMuqbrAkfu1RFUWclEyNQs2XGa7IiqOHj37
	dEkbZxRZ20/Q9CDuDqxm0hqap/wLWQLEeLYXR3ubzmGHn1MmTHM6Z8R3HiQKjcxtxo9gP0jRs39
	K7JQWD2NQ==
X-Received: by 2002:a05:6820:f02a:b0:709:d804:88c4 with SMTP id
 006d021491bc7-713f05d151fmr475759eaf.89.1793147017029; Tue, 27 Oct 2026
 17:23:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027221209.1560865-1-seanjc@google.com> <20261027221209.1560865-10-seanjc@google.com>
In-Reply-To: <20261027221209.1560865-10-seanjc@google.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 27 Oct 2026 17:22:58 -0700
X-Gm-Features: AclHuK8RRqKY_lCjk0ArS-oHYaPKalWvy9KfBfqSoDe2ANJo4dTrcc5mcvnFu40
Message-ID: <CADrL8HXL0HCHbp_vLgcDGR8F462qT_DN5A3CvVBZW06xxE1gmw@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] KVM: Pre-check uaccesses in KVM's APIs to
 read/write guest memory
To: Sean Christopherson <seanjc@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 3:12=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Add a check on whether or not doing a user access is ok in KVM's APIs for
> accessing guest memory, *before* doing memslot lookup/validation, so that
> buggy KVM accesses to guest memory more likely to fail noisily.  Because

"to guest memory [are] more likely"

> KVM installs dummy/empty memslots early in VM destruction, bugs in the VM
> teardown path will fail on the memslot checks without getting to the WARN=
s
> buried in kvm_copy_{to,from}_user() and friends.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

One somewhat minor comment below. Feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>

> ---
>  virt/kvm/kvm_main.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 1058b864d427..d8b914b76f90 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3298,6 +3298,11 @@ static int next_segment(unsigned long len, int off=
set)
>                 return len;
>  }
>
> +static bool kvm_is_guest_access_ok(struct kvm *kvm, int offset, int len,=
 int size)

Hrm... I think you at least want `len` and `size` to be `unsigned
long`, and you probably want `offset` to be `unsigned int` or
`unsigned long`. The *_cached() functions are the interesting ones in
this case; I've left a note below at the first callsite.

> +{
> +       return kvm_can_do_uaccess(kvm) && !WARN_ON_ONCE(offset + len > si=
ze);
> +}
> +
>  /* Copy @len bytes from guest memory at '(@gfn * PAGE_SIZE) + @offset' t=
o @data */
>  static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot=
 *slot,
>                                  gfn_t gfn, void *data, int offset, int l=
en)
> @@ -3305,7 +3310,7 @@ static int __kvm_read_guest_page(struct kvm *kvm, s=
truct kvm_memory_slot *slot,
>         int r;
>         unsigned long addr;
>
> -       if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
> +       if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
>                 return -EFAULT;
>
>         addr =3D gfn_to_hva_memslot_prot(slot, gfn, NULL);
> @@ -3381,7 +3386,7 @@ static int __kvm_read_guest_atomic(struct kvm *kvm,=
 struct kvm_memory_slot *slot
>         int r;
>         unsigned long addr;
>
> -       if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
> +       if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
>                 return -EFAULT;
>
>         addr =3D gfn_to_hva_memslot_prot(slot, gfn, NULL);
> @@ -3414,7 +3419,7 @@ static int __kvm_write_guest_page(struct kvm *kvm,
>         int r;
>         unsigned long addr;
>
> -       if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
> +       if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
>                 return -EFAULT;
>
>         addr =3D gfn_to_hva_memslot(memslot, gfn);
> @@ -3544,7 +3549,7 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, =
struct gfn_to_hva_cache *ghc,
>         int r;
>         gpa_t gpa =3D ghc->gpa + offset;
>
> -       if (WARN_ON_ONCE(len + offset > ghc->len))
> +       if (!kvm_is_guest_access_ok(kvm, offset, len, ghc->len))

Currently, this truncates `len` and `ghc->len` from `unsigned long` to
`int`, and it will change `offset` from `unsigned int` to `int`.


>                 return -EINVAL;
>
>         if (slots->generation !=3D ghc->generation) {
> @@ -3582,7 +3587,7 @@ int kvm_read_guest_offset_cached(struct kvm *kvm, s=
truct gfn_to_hva_cache *ghc,
>         int r;
>         gpa_t gpa =3D ghc->gpa + offset;
>
> -       if (WARN_ON_ONCE(len + offset > ghc->len))
> +       if (!kvm_is_guest_access_ok(kvm, offset, len, ghc->len))
>                 return -EINVAL;
>
>         if (slots->generation !=3D ghc->generation) {
> --
> 2.56.0.307.g5fe7bd680c-goog
>
