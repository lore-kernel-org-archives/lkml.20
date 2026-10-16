Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E325625E1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176138; cv=pass; b=CpJvM3FklOTUvxfBkRvQOkT0FAw+00+AYqccjFJCEJj7kaBmdqtHG26u+ndOWbnZzXYG1U+v7L1xcM8hZ41g33TMsqtauJcRF5El1/EKuM3aIuvQz326i8x3CDtixNUBUn24caP58XC+cep06InUaIglPYMqXzlviwZsbUXsMJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176138; c=relaxed/simple;
	bh=8WAq20nES+irUK6h+NF9accpMV+Mzb8hTpIGlLHHYII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMdZ2RQoVWX1PO8qci+AEFhFE1C1Yv0RZtrtGv/UPCClUlUSHgwSQxfe00cRy52U0BBVgfpoX6n0fHgfIqRlX2AQLL2Kzl729cJvsAdpLfzlRAo2jc8WTa6Q1xDbndzY2v+ezus3rUBHVpGhSmGoVV6tJCnQbImLY7gW2tbDCYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gxpb4r7s; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gxpb4r7s"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a021c28046so5615e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792176128; cv=none;
        d=google.com; s=arc-20260327;
        b=IHCydNrkJ5B+QEaFiz9tUd8GV0biyMdUbhMpYzmvzdx6AKITPssxqkhgvL9c4UJaQ0
         TKPnhP1CCE6aSzAf7YhuuEmi1Apc+0sGWo1mgiKTEq8pCVC+CTp/9RS+0NKCufga2XKi
         gBsWVIQAdoWitimygG5RaRyAKFm22Baqx6LK7my74EPW2z/beca1/i2Ckuw65PfUAnda
         dSMgDlnf4tm7L65XgSN136UvjFaVeusjB8cF36DvzU656a+xL8M8921m6TUuxPcRV/PD
         nE0fzga11NoU1knjEYqgvCd/NEkUoGyymhL+EMjouToOI7ZxC26R1OG8fCClhkYAYJSo
         WWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l1xjoNmScVM7o+Z3W17w/ZXE10zFAZ2XykabI7Wb19Q=;
        fh=VNVfqKRNuyrLEdcpsL9OpBeYiQSuskkzpLHrnMA7L4k=;
        b=SxPc7hDQjgM/Izw/QO0ScOTnKFtxMGHJoRPFDSJ9rpRbme1+fPlpetOGxAbV8uFis6
         NX0y9AQh7SbYM755BorLAiZEeao5BQ8z4+8JSfzqboNicEdkLBDEDWzMJKIYuxVqhxmm
         uonvLw5uUwKbxLK4LH0riOxoUH14esHQe6y15abN+n+RNrmbvCMFYK/f+0a10ZSuZCkr
         EYbak0ge8QUeRw3D5w0EkBDq+lefQlyrty3EiNSA6ti5+q95xcaMMXJ43oQtKl+PlH9S
         ynzOvvibzVT2VGUqhqSkFY+ILibugx83wLHGodI03WbJXjNADXj/rDWqPDgGUokwMJTj
         Qh/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792176128; x=1792780928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1xjoNmScVM7o+Z3W17w/ZXE10zFAZ2XykabI7Wb19Q=;
        b=gxpb4r7sRqcArhtpZPQtJssR0AbzKDjQQfPDbOQSP7Rlb6c1asjH54VuLsDMD6Nz0I
         512j5hJfcioKrDIQm0L9zhGJ33ytImSeajcMkwoUSSIbuuWy2ETqdtCBssTuEnGrhFNK
         1LEWV3kZDMBduXpaJsQjbO/bWOHo0bphg+UD4XdCEbt98EgGpIf/De0+Wt3B7dxJ7DUZ
         riPICmv7T16NRjtdePd7maumr5iXpKpeCwJk70ggINPKqa3+wgEupvfKV0euURT4q8A/
         Z59LJ1FiwKTTqDXCh49Yg35Jyq+zfe8TdwXofESdWmv1qoIDi+R42IO9dX2qPsEzNytK
         5Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176128; x=1792780928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1xjoNmScVM7o+Z3W17w/ZXE10zFAZ2XykabI7Wb19Q=;
        b=WuoAgZQhQxR5bDA3XSy+UWd5yHOT3/8FoxWvqR9ruZGEPx8+zw6lHM8ehz75Ph7uRn
         n6kEPtzBW1g/eOffkTILuWwKWmY0V/z1tvmtWYc2otRAIo+KX/AMELU3oPq0PbDICl5Q
         VtqG1RqWY4y1DV++YeT1L65K+iE4UwDiEQyGH/KS9g7b295ProMOMfJNaFmSbq7NCCZU
         8QHLrWKdnQnI0SfKVxnxyIZEcJsatEd/dFawnKMntgTNahxB0iCx5kwvX8B2ct/63vef
         pvxRrqbujFnrg69niPFfbSno4amBWiXgfVl8W3BSVg6KdhjE9/w8Gh96Q69payBmbi7G
         hk2Q==
X-Forwarded-Encrypted: i=1; AKwUvByKxR/ylPWMrCMbBrtLjNLjOm0QwT84o8RrsXT+M7ZE9CIqmmVo7JpB0N63okm2zolr/XyuUY+JQGQw0lk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9Rc8N7uRkncS8DiQ2v72LINvXboxjsjBif0+9UlbEu0dgIJiV
	xZkvXQY6/8/m+TopSBqHuleGWLkOJPbhQrWQ+xTJ53hFNsW+cSfkV1/fPIPqwuIJhaxp0W/jWwc
	7p3YXuqkFKEyzzaj9olq7oLlqQXedXl/I09EoQvvW
X-Gm-Gg: AYBFou2omOI7yPNUtocP1awLy0MOZ2kmZLMC5fGjp7gyPtwNqxz7OdvuYjTnNlkpFp+
	R20L0Hxoq2xZwFbz2hzYY6gEuMy8dROHfomWrLx+3eEqdrXOnwlnEu/OywA2ueeb204rIZ16MJ+
	ww2iWcP4b4N4/Y//g/pNxsVv9CUrS+4rXCduorEZZshbZSXBYpaufA+oafEHpyuJbWMV6RprkeU
	YHIED1gCVHlLEMa6eMdfJFTyevJKHjC+jCWBW6TB1WkZBMgceB+oyhCgBQePf1y+A/xvkKGuKG0
	Mk9gNJHaVEB+VPpbxJ22ZkTPlPC3WwAWLP63D+iFdf5GHhFixEFEzJf+6VSO7b3WIbd8u1dj1V6
	ejJQGb3gUaMgPh0JlJXJ8F9ctM+MJobZuCT2QMummb52vaAw1taI3VhmiezgSjS8zqGj4775js+
	1jAU7ptcMaTJsmlijdVbO7JRLDP2pL7xQ4CImjAPT1VgoY
X-Received: by 2002:a05:600c:5249:b0:49e:b733:7277 with SMTP id
 5b1f17b1804b1-4a1d8942d80mr134455e9.2.1792176127813; Fri, 16 Oct 2026
 11:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-binder-memcg-v1-0-d659b8ae088b@google.com> <20261016-binder-memcg-v1-2-d659b8ae088b@google.com>
In-Reply-To: <20261016-binder-memcg-v1-2-d659b8ae088b@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 Oct 2026 11:41:55 -0700
X-Gm-Features: AclHuK88AWrWkzvJx0KAHsGzJXLD0z9tLNjEcqb2uVEbpJmeuWX5FgW7WUISGzs
Message-ID: <CABdmKX1fLKvC_TnO3g_DkPjcfoXiU2rM-Fa+ZjriYctVQPkFTQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust_binder: charge allocated pages to memcg
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Pages allocated for a binder VMA are currently not charged to any memory
> cgroup. Thus, use `Page::alloc_page_memcg()` to charge them to the
> owning process's `mm_struct`.
>
> Suggested-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/page_range.rs | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binde=
r/page_range.rs
> index 52ffbf3504e7..57da47243967 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -27,7 +27,7 @@
>      ffi::{c_ulong, c_void},
>      mm::{virt, Mm, MmWithUser},
>      new_mutex, new_spinlock,
> -    page::{Page, PAGE_SHIFT, PAGE_SIZE},
> +    page::{MemcgAllocError, Page, PAGE_SHIFT, PAGE_SIZE},
>      prelude::*,
>      str::CStr,
>      sync::{aref::ARef, Mutex, SpinLock},
> @@ -399,7 +399,16 @@ pub(crate) fn use_range(&self, start: usize, end: us=
ize) -> Result<()> {
>      /// Assumes that `i` is in bounds.
>      #[cold]
>      unsafe fn use_page_slow(&self, i: usize) -> Result<()> {
> -        let new_page =3D Page::alloc_page(GFP_KERNEL | __GFP_HIGHMEM | _=
_GFP_ZERO)?;
> +        let new_page =3D Page::alloc_page_memcg(GFP_KERNEL | __GFP_HIGHM=
EM | __GFP_ZERO, &self.mm)

Not related to this change, but I think it might be better to ditch
GFP_KERNEL | __GFP_HIGHMEM and use GFP_HIGHUSER. We're already mapping
this into userspace (and now charging the memcg for it).

Is current the sender here? If memory.high is exceeded, current gets
blamed for it in try_charge_memcg()'s done_restock section. So if it's
the sender, that's not exactly what we want since the sender would be
throttled for it. So I think this depends on
https://lore.kernel.org/all/20261010210957.1350874-4-shakeel.butt@linux.dev=
/.



> +            .inspect_err(|err| {
> +                if *err =3D=3D MemcgAllocError::Memcg {
> +                    binder_debug!(
> +                        FailedTransaction,
> +                        "page allocation for message to {} was blocked b=
y memory cgroup limits",
> +                        self.pid,
> +                    );
> +                }
> +            })?;
>
>          let mm_mutex =3D self.mm_lock.lock();
>          let inner =3D self.lock.lock();
>
> --
> 2.56.0.212.g129ede20d9-goog
>
