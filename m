Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792441990;
	b=Ch0CzbT9DnxukPLatzgk0fS/f15rQXQONMcrSXWaF3wxQuDLPu9MZRWGuzg+2tmkvxjM
	 FAdSWDdnYjcn/LCpmK6OIxT2OoN1YklKtstKPGas7s/A+u106GC+2bdWnVEq9j3FQqe01
	 2d26AuN813MENCWm3q8Lcc2z0WxBLax5RZg2v/IK3bQiIcXDlGlh5FwP5y0L3qfGbLBC5
	 XXKqsCkmOchHZ7bgtRGp/wJvC/4LVJuCj9liWP2zOxiKpuPHVvCOYQkSBnnyH8UeV25Rr
	 10Ix81yxCe52WVt3hD2JQ1GIRayUwf0jHog72E/X0K1npnAiWlg3/u0zhk6JEW9sJ/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7z7DF78qVS1PycS/4LpGHXni32Jr0RlWLqIHEqIc3DI=;
	b=hnaiUaYDAMchXeK+HICFIFWfNBcjiheGSN+GO+b26/bn+Z1kGxXOENQA32MJply5HtZ6
	 b6+o2MQNA9X4T1SfYPnLvkEOnsa+gxBZQ/FZhQJn+K/dVuhSASSpVLkQoNJcrRjQiyOud
	 z9ZfdLwUo3UMvlRae+wlq6GWl8/Bu9H88HTM4fbphrmTHe7H2iFpA70os9FoTya34OcEL
	 SYLa9Wq+ReTuqJbgCPwCUSzZ/E2jyFFqPPLqJpoQdW4zzdgU1JEjO5QY1kscWPh/AtVfc
	 WxAahVWVRGfSzwkIgP6Vet1BzZOYofnnhll5nJaD11BnV0FHLt7sSkz4naCCRZ2/XQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=multikernel.io;
	spf=pass smtp.mailfrom=multikernel.io;
	dkim=pass header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=wUtNw5ij;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6278E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6278E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=wUtNw5ij
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso3320691a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792441988; cv=none;
        d=google.com; s=arc-20260327;
        b=Kvoo28o4aky6Tv+jz+moJEhlPtpqL8q4d2u5MOzXCtm1oZTQ5etIADNoto/9jfIFFm
         78Pw5fZwrTDJECZqiYEGUq0bIiNXx1PD136JyfKvSQCqvz5IAVwGovSS189bLIZlJKtk
         dK4/My74NvRSL1QUXY/spwicoxLpC+AX9PFBhRH2apX0zVNTAZclbywnFZ01tp8HCtQj
         utVX0nm0KEsryokZ8h5PeNOOWv7GIieHpHOdTaXa0v5CzMDKHKLQnMm3Mcdj9I5b/ASI
         qn8lIk5obd51qh7ne/7KsOi7chRn17QOfHs5FotLH+y7RY9VNdSc/TAxHRvCSMXoYioT
         vwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7z7DF78qVS1PycS/4LpGHXni32Jr0RlWLqIHEqIc3DI=;
        fh=jjsREDNBAXGRA35gQaT8nnx4ACibXUCY0eoMe+8OoB0=;
        b=BBAThQA/t0BP5Lc/vjObW5+3pgNtQTHiPhtIhlZTq/+lUibzTPz88Iw+i4bAvyZ6r0
         FkHyCyhfoijOgouAqMoG389LasArqTeQLju8zGIuCN7iyQ0EqOyz7kgOjJGTQQwpWtUZ
         9EFctksrJWisyRs0l6/7e8ZuTQFSPpYGVVKUBmk/2OJUyr8lg1P6C4axPxwLX1J/FE7J
         bqPrKy62cvPwTZ914cwofcOXAKYIt6ydNUHY6tEoxHIZxHCN6HS6fx9xZi4g+3gYZYtq
         QOjXMc2Kk3qdGkpGwrHIkp0kwtTu/urGxaMz3HxUO+RaK9q9qe1ELRwILqZ0pn1x6kJM
         sA9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20251104.gappssmtp.com; s=20251104; t=1792441988; x=1793046788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7z7DF78qVS1PycS/4LpGHXni32Jr0RlWLqIHEqIc3DI=;
        b=wUtNw5ijQDwSRwUTJ552MB0kr43kZObM3Pia9VldWDVxsNdrezfPLu4cXrU5hV0Xta
         AqkK6sgzEtFU7jnXi7R4AJumTvfGB/9Ggj8fU4FnxBxX0P+fe3XIekpPEqCTiveuQVMl
         T0R9DkNt5a3blIKJpsjSVIUSc1Z/h/Ifyo3ZxEYVN4icEtW4UKs03CruBmhBk8bjpXvJ
         rpKPXr/ZUNwGPBGqI9FowtggZCGH3XVu8gRUQ3FOkyjmqo2RD1cXnjwFxR1Kc4E76gPX
         t94XJN1/k0fADhsgQA7JjML+vM30gw2zmTaJlJeju0hT4nAoGCt5Krbac3pZtBjG8hOR
         j1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441988; x=1793046788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7z7DF78qVS1PycS/4LpGHXni32Jr0RlWLqIHEqIc3DI=;
        b=U5YEF3L2fGIaSTsvF/EltvTrdkdMNm02En7eWaQi/fEtpGfGlBuLlSKG/3LHqKF0D5
         TpZn9SiVLSZnmSSjP3xZffxoBqVQ3QeqsDFfLtLZLvOMwogCdOhQyKWJ2960ciqEkLf4
         aHdeClavrvK6RCp2XRQUgHI5UDeJkdsRb/UFKVrjgo4ilWCjyYVDVOI5jA5VdFMNLm8C
         pRjFF/jwwwmKB7DV58k/CKxY6jCSh3qFHPM00DHE4JsEjmMO/hG7BSVkbgWt/J7gl3Aj
         Phe1/mGvnpyQX5+Tc6QjnGjzI8A7D950yZg+ZWnUwAKxrPARHxeQkMf96bo4vkh8C4xr
         PVxg==
X-Forwarded-Encrypted: i=1; AKwUvBw65al7pYgE2cXygad7szTe4+2LDBxb0HaKYfVlxBfYR7xkScEE6cE0WgqNJUIowIh+EE99G2YiJ+aib20=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvUoWFUXnKXOmbG/CdXZ5nOIxSbF2rTjEP+GWFPVu+Htl4+TDm
	5nuxLeQp3PcGZjUKAKZbJsqPFVAzMBOFYunRcVQ1ZLk+QOw7T26cVjzGxYBqEBlOtsSBY9Zh1Qt
	LQvCRplCNURSj+MoKVhN4lkuMieryho3skFOc4zBlLXRD2E8pvRf3NpY43Q==
X-Gm-Gg: AYBFou1ex5XvE4u1wS4gmL5vhLxAnynzNlHQCcOba8VpWNzsP9OWUuw4jeU2lueX5X6
	PlOCbX73YCKfUphbJukyXmc8WNqAkG84G6wuPyaVF7+dKV/MWP+hSfBmBkhYND852mUIBNm0KQQ
	5LifQCOBrYKPRUM/cY5Gnk7g3VvGKIh/PfQWDmMDgpm2BvtAB4b6Alh+GZnIdVto2GZOyLKZB1X
	aUjApbLMKlZ8uJJ38YOm5oJmfSbQ9f3NRPKWqFXkjiL95I4CcrB+KWVcGiyP1kdhU5JRIpgkBnn
	wpxqU/b9S8+6uStXB5Eqv9a5AD94uWusrNEr2cqA3l9eUiZcmqjt1+SS8Sg8YbjqHz22SdG7dyY
	XcKcFXeDBftNn6A==
X-Received: by 2002:a05:6402:849:b0:6af:7d49:728e with SMTP id
 4fb4d7f45d1cf-6b3a81a4d86mr4894474a12.16.1792441987598; Mon, 19 Oct 2026
 13:33:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019041606.641716-1-xiyou.wangcong@gmail.com> <abbefd94-2a4c-4e12-99c5-89a5520563e7@kernel.org>
In-Reply-To: <abbefd94-2a4c-4e12-99c5-89a5520563e7@kernel.org>
From: Cong Wang <cwang@multikernel.io>
Date: Mon, 19 Oct 2026 13:32:56 -0700
X-Gm-Features: AclHuK9rsD7vJn-GkVoAoe_kpQfds19acmNc6kKzXFqr68XDilNW4L5MvSuq8l4
Message-ID: <CAGHCLaTe9h0JACdhgAiUw851veDWX=y6KxUPLU1NzHzut3QE4A@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: Split a 1G direct mapping that hot-remove only
 partly covers
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 3:26=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/19/26 06:16, Cong Wang wrote:
> > From: Cong Wang <cwang@multikernel.io>
> >
> > Hot-remove works on memory blocks, 128M and up, while the kernel maps
> > boot memory with 1G pages where it can. Removing a block that sits in
> > such a 1G page covers only part of it, and remove_pud_table() then
> > walks the memory that 1G page maps as if it were a PMD table. The
> > removal succeeds, but it corrupts the first page of the 1G region, may
> > free that page while still in use, and leaves the removed memory
> > mapped.
> >
> > Map the 1G leaf through 2M leaves first, under pgd_lock as
> > set_memory_*() may change it for the rest of the 1G meanwhile.
> >
> > Reproduced in a 3G QEMU guest booted with movablecore=3D1280M. We used =
a
> > test module fills the first page of a 1G-mapped region with a known
> > pattern, then calls offline_and_remove_memory() on one 128M block in
> > that region. Before this patch, part of the pattern is zeroed and the
> > 1G page stays. After this patch, the pattern is intact, the block is
> > unmapped, the rest stays mapped through 2M pages, and adding the block
> > back works.
>
> Which in-tree mechanism can trigger this?
>
> I would imagine only DIMM hotremove on bare metal. But let's be real, tha=
t is
> never going to be < 1 GiB.
>
> All other mechanisms (including DIMMs in virtual environments) get remove=
d in
> the same granularity they were added.

You're right.

The only in-tree path I can see is ACPI hot-remove of boot memory,
where the direct map was built over contiguous E820 RAM and a 1G page
can straddle DIMM boundaries that are not 1G aligned. I agree that is
unlikely on real firmware.

Where I actually hit it is removing 128M blocks of boot memory
(offline_and_remove_memory()) for the multikernel work, which is not
upstream. Happy to carry this patch downstream.

Thanks,
Cong
