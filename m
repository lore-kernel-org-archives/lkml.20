Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794348604;
	b=hIQygS3BSf17sORYZhtsLJOIGMk8BhpqqgxNi4TfLHuvzza1ZzqjoJR7SzYEIBGtItJ4
	 1v5F+9Hf343R90s72QGYVN/hBtCVgehXt91ATCr5q6UKwj+a5isZPycKqFeB8yw0nTIgp
	 f9beLkQVJY5qQ7EkpP+xr7hjncsyk554wU1hpEThJ2ha92WaruUb9Wqa83tfDeFjKKruV
	 wMV4o1lD+21s2bgMc2tJWpzRRlWZ1nKqac+Xs8GXZf5lOnGwlvMBS8q9xreSQ6ct5JmmJ
	 agX6m04cr37BSIXHp1CUDojHy4YeKyOEa3+TQxwuWqLtdb0ED7vy1AgN6oFXxuCGLUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZEddz8haj4iGepLSSw+CHqlgTqudRs35VC14E4G7pVs=;
	b=Svi76UvVB8m8pFp3kdMi9qO/EELFMSt6tcErwy0t5PRF/QHHdbLVvB411q2jy427IiJQ
	 H7fhcM8R5c5bihdRM9N/m1LfwoupZ8aPkMf6zlK5M0CX6OFx2cgoHTxyS6nBv5OvScKsF
	 U+pxq7YX30PTiJIuT11KK/BX/pJHegjT3AhkgDxMhqFCMKkF1MgcLO5JL4jIVHM/hzvyy
	 dk8Bl0lagmhimjsX2m5HQj4fALe4DgQYR/LOaOV0wKrukB7c4LdBSTwy81py+ZQnOt0UX
	 VSS0FvCPsE2Ny6ESQ7ZbBnuJNBc6P3xsTZ+99zKCvUj1Ons1y3T21adDRM70WKR4Xqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UuD6LkpV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DCA606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DCA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UuD6LkpV
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c504bfd7393so198175366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:10:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794348602; cv=none;
        d=google.com; s=arc-20260327;
        b=kQYg3f64F9dlEtn4c0jKYTmk1z9NWpG/HTDfL/FznI23kGhOO1+KEvzYVgNXMDINBU
         ZppYln4HbJaQaQ2GXvH2/CBbdl5KDrZqP0h69QhRvRtoCmEAjrnIHc2mQKySEIP8+/MO
         bQias8rW8pXXmcyc24So/JrSIZIdfcJI1MWB3IOwDLCd9yrFy7nur28PusJ3482fivdD
         YB2OmbFoKn1u9BWeA61yvZVTzAH7me5Sjdv7G6h5eOewT/adEqF3nPvm+MqBTiWB1/E6
         KJi7n0ytqSssIS6V5nOYYyZbF4v5lZBUgd4mUNUPaRn3hFeHuXi7gnDJgKoFgx/bsrN3
         QvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEddz8haj4iGepLSSw+CHqlgTqudRs35VC14E4G7pVs=;
        fh=BbWUOH8M0+ENOSJA47RfBh5S6JAXpbR1s0V0hqycStI=;
        b=YM9VbJqfxvj2FLbx8tBhxtlfInbsXjIO3Ynj22xIafYaC7RJKAEWzokbiSzlbGxPAW
         wFyNc9QcAszH527eB0S7U8OpMUbNAQMGdv3tWPzUDejupNCB4tuIcDLOxqc06nU8lVYY
         iEsZLX80Z7yLEK+kKxPbBuhNg+uVkI9Izx4s9w0aUyTgNTL7lvDjylweuDMNmoHXG7/+
         21ZCHxgk0uluM3erT3PZRW9aKTH7w2Ccv6SIxMYqHaDsFFubAGE+fj0XI+h2IV8vE8t4
         2xWLyUhWJZyii4YZWt0xd2PhfzUJVkQLmVvrAtDcy2VTBXJ5GmjKjLToVnGP9SBGZk9P
         /ZsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348602; x=1794953402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEddz8haj4iGepLSSw+CHqlgTqudRs35VC14E4G7pVs=;
        b=UuD6LkpVWEefLGudB9EH+IRAXWznaTxcaH96IgAMoAQnKv0DuSApnnGLg0psptugy2
         a8WWG/RWwvZ/M+lNfK7OgcYOukgb36qMhoNHLBPsVnhQilDW2fyymkGZ8qT13QYljXIE
         68N8gK6cydjTme6y4FCBjiH8+C9sk4ncXBwW65UPYSxi9wYN16BbjsReAOftEpyOMT8K
         v99Ivmpzt14c/qR9BYmqr7y78DLSo/AkxavzNF4MXbvZyYwUBRX2F/IBFdzfPqtlDjr8
         4Y6y/fo5hLtYj5KIgx/aTh1VKlROs/bBPxcgeQ4dneEiBnPrnCs2Aq8xXD4k9mq+qvdS
         CYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348602; x=1794953402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEddz8haj4iGepLSSw+CHqlgTqudRs35VC14E4G7pVs=;
        b=oCMFMQr9YgXHreRQgegXI+ItLSMswDS21h0owe1lGKeB9xtIuV26inNvgyahr9jHYZ
         pYN+qeb0mBnAvHi5NdeiFvFVckrmGVUzDdcwoitr+lHod7JxO3JnLg77ivspL+QXKtbW
         LURg+UH16zSXaKSHNSIIeveSwrnue3t5/MnoUKu1+Apewd+GehpWOoJ6n5Ha2NrkNSzq
         mUGmQ1bEacMo6C6mi1FrfF/v0oERZdBPdlCY9+tGVyI6ntNQoh0DyH6lqnwBV7gF/eUu
         paN3HDqSXEWlN6KjLXSKwEr9gdaRJrB9x2M0t5x8C0LHbT0HAvBPW7Sqbm4akyabzAll
         Pt3Q==
X-Forwarded-Encrypted: i=1; AL+hErHZ5pTRALOxCHOU4hUHdzCy96qYgrUggDu6ghdarL35bXikEj/Obqy/hFxekHCNby4wuTxA674wle6guIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OEtHhoC5rvoz8m0Yv1xourtz7OVO1DrzVNdFHlFHd6ePXF7o0
	w+u+gHdJp5oPoK5UJ6pzjvb+r/xf4aAf8Bj7pNC/F+zBANfxvB5APJ/Z0NHeF0vO0OLzZTxkS3F
	u2fMX+l4hFmzAqyOHxcxRtwOH08gT8OzKbQU+b5xe
X-Gm-Gg: AYBFou3yAEokR7TMVBMtXAccxF20VmiJMMb2/D+/rA1vbynhbKWdTxRzcNltkQBSbl3
	F3kTbiQCF/D26bddRjBlJr17zVXxOovrlxz3Nk1PzZ5PT+MSC6Gr5u3wAlY23Aa1nTyuMEbKB1R
	0ygKtSwf9jNxQ/XeRR4naDPvSayrx/5pAaHwwMjOV7gPJrG8/lZAKLvZMV8v0d8ofZjUgJQrsf4
	YrKTLevWbzBrjsaWFCM/R8BavrsTGm8+Vxo6V/k6ITNqhKCIPdkEUFLE4RsdzFjGOzp9TsdbHxr
	TQeE6Z+bN9MoBuWYcEwB5oe99g9hCSg4vet9kNFYuaqshEdVr7+8+OdafFNgkhiUf4GGu+NhQ0B
	C7D/YwQLVTwFTaDMiJ+1JGWdMmV8OTGkcqz/dQX4sTs304qaCH8scoe4rKtzeNJ1Def4palWTyH
	roGaCqlhSOadR3sFpnX3TYSPNipwpQ2YcTHxGgGV5EB69MSWOw0LZ0juoYg3R3Brq5JFgHU8Cre
	giqIFwo
X-Received: by 2002:a17:907:980b:b0:c26:2a2:b91d with SMTP id
 a640c23a62f3a-c506694f0b9mr36476966b.6.1794348601603; Tue, 10 Nov 2026
 14:10:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-9-jthoughton@google.com> <30822F0C-88B8-4ACD-A0CD-F889F438EDB4@linux.dev>
In-Reply-To: <30822F0C-88B8-4ACD-A0CD-F889F438EDB4@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 10 Nov 2026 14:09:25 -0800
X-Gm-Features: AclHuK_-DHdY3lumgPO6Qy00BxbcnPvhIHC2Bs1SRzgw1uz1jqZUi8ATzat9T6U
Message-ID: <CADrL8HXU1jfoCcZNbRwjy6wg8jpLQPgsHu7=U28qN2Yc01nMzg@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] hugetlb: Fully initialize tail struct pages of
 non-pre-HVOed bootmem folios
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:06=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
> >
> > alloc_bootmem() marks all but the head struct page of a bootmem giganti=
c
> > folio as noinit, and gather_bootmem_prealloc_node() then only
> > initializes the first HUGETLB_VMEMMAP_RESERVE_PAGES struct pages. The
> > remaining tail struct pages are initialized only if the folio ends up
> > not being HVOed.
> >
> > This assumes that a bootmem folio is either pre-HVOed, or will not be
> > HVOed at all. However, hugetlb_vmemmap_optimize_bootmem_page() may skip
> > pre-HVO because arch_hugetlb_vmemmap_optimization_supported() does not
> > yet return true that early in boot (e.g. on arm64, where support depend=
s
> > on a system-wide CPU capability), while it does return true by the time
> > hugetlb_vmemmap_optimize_bootmem_folios() runs. Such folios are then
> > HVOed through the regular remap path with uninitialized tail struct
> > pages, which trips the PageTail() WARN in vmemmap_remap_pte().
> >
> > Avoid this by initializing all tail struct pages up front in
> > gather_bootmem_prealloc_node() for folios that were not pre-HVOed. This
> > makes the HVO-failure fallback in prep_and_add_bootmem_folios()
> > unnecessary, as pre-HVOed folios are never passed through the regular
> > remap path, and all other folios now already have initialized tail
> > struct pages. A failed optimization either leaves the original vmemmap
> > in place or restores the tail struct pages from the shared tail page.
> > Remove the fallback.
> >
> > For folios that are not HVOed at all, this does not change the amount
> > of initialization work, only where it is done.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > mm/hugetlb.c | 28 +++++++++++++++-------------
> > 1 file changed, 15 insertions(+), 13 deletions(-)
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 4dac7ed1df57..e971e2362412 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -3303,17 +3303,6 @@ static void __init prep_and_add_bootmem_folios(s=
truct hstate *h,
> >       hugetlb_vmemmap_optimize_bootmem_folios(h, folio_list);
> >
> >       list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
> > -             if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
> > -                     /*
> > -                      * If HVO fails, initialize all tail struct pages
> > -                      * We do not worry about potential long lock hold
> > -                      * time as this is early in boot and there should
> > -                      * be no contention.
> > -                      */
> > -                     hugetlb_folio_init_tail_vmemmap(folio, h,
> > -                                     HUGETLB_VMEMMAP_RESERVE_PAGES,
> > -                                     pages_per_huge_page(h));
> > -             }
>
> Just for your information, I also plan to remove those code, see here [1]=
.
> I need to push this patch along quickly. I'm confident it won't take long=
.

I see that [1] is included in the series you uploaded recently at [2].
So I'll go ahead and rebase on top of [2], thanks!

> [1] https://lore.kernel.org/all/20260513132044.41690-15-songmuchun@byteda=
nce.com/

[2] https://lore.kernel.org/all/20261109095807.41547-1-songmuchun@bytedance=
.com/
