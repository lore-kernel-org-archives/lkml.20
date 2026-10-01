Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC125B0B8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894432; cv=pass; b=bUQmLkovLW6m/o+hACzOjifTntkCmxSLlUer0OJovYpi98zhQTtt5tewueh9TlHoG5hpcXZyE148kfurwqnxieAnm1Cqx3VnBRxTxHOFLpUG5EvBecD30x7iXoF5r5bRvSoLP6ChZwOpkQpBavAqrbqe2vWL+e+pAxuSXY4pk3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894432; c=relaxed/simple;
	bh=kwu63XcwE+rKZh8dGn9/jKuWbX4079TA9Hh8QjpQ2Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=setPOaPK6RGpyZdnT1RSvfPZGrkONmk3pELUKsSzsQT/dhkYJWNza3XynhOR6JIGKM1r8GRdgYTxoFwZCvPYN2ydZ1o9lZtEyLgMilNgKqsi3vYDhNFZwCjDIJOLGhLVJLwKqrvYrCAJ/q4mEFxcQzAHSrZf6up3MUQfdnwH6N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A81i6q9+; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A81i6q9+"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e320322edso247411666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790894429; cv=none;
        d=google.com; s=arc-20260327;
        b=DAT71wMxFeKFH9ObPbTisl3NaTqSGAurU9oaDSIt+h1PUPiMqsLjezwpjhtLE60fpu
         hyjeytEn2IyqCbrAPGK1G2uMAkE7p2RzeZ3sxzvWam9zbPWbK8EiCk1z67KvF8knznez
         PD0M/KdwB7OGFhAQ8YSxaqPqoYUlr0SqbvTrt+1u2CS5ZXmFUlCNdQeUsYAYLlfULIQC
         anyHSjFNgAMNjDjlBHhslfbPjS9YPxq2yuiK+ZwJ4HlgPwJgdvmnnyt/TxH+kmwfu2cp
         2g+HFgCABQZjqJfiSzYNr+XKPxVUfVhBIY3ab8gI47iCwlt1jqC09gzR6fUulq0nmNIB
         5mEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L/vEkgZQw4mtA8c08FHsi2FPZ7REcWS28KGmS8X2+78=;
        fh=+Z30K7ALOd14zYzpGPQiZoicYmu0AA0E5KXmPMoKB10=;
        b=lgZf41egahg4GjkWg24fikBet9W84E0iRGN8qbkE8rP7fQc7pHr/2m8svSbqFBX2DX
         IJxu6x+hlw9jaScBPoLy9xMq/kd8lalljfrp5JjDwWiJbXFrqjt8y+gETgwPdgXs+0ux
         rLluQGYI0ZAUA9mpjZDwvPkMn/TSnhI5aQSpwpZzpnpejYNPogundU5u9vPT+CIQNPBU
         tRfL+8Q2nTnZQ6UXGn6feuLCA2RDbEmOWtt8v4TdJVfruXppjgbVzGDL8mjf7cZkhrdB
         xM76D5uA+SS0fLuDDMVAfnhm2iKxkmEtJUsp7HrKgaXrBCfYNJmvxTs5OZgjNWi8DVt6
         lqow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790894429; x=1791499229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/vEkgZQw4mtA8c08FHsi2FPZ7REcWS28KGmS8X2+78=;
        b=A81i6q9+cgtloIYIDQowW0s07qoDYulLGK90RS0kivQQmO3u+dGqTQihwcaSv8WQGp
         TxUhbHvR9Id6qqoLolvCaGV30HIuGYqKEwP8TPcP/Sr1xxVREruoupUdenvSxrbgHCrU
         NudGsyr71ebGGVbqBeEQe30y/BHRnM58N2mSYYIFXLTAXRgGBNnNj1yUP8iGYoQALpY6
         R4mVGzeYhdcQSq2GgNWcEy0HXHVYyKxoa31GQm7o+z8yOQz+MHSX5LOSSSzM2nZPQpBb
         PQYGjeJr0N06mIck1G3PRG4xj2Jg2odtR59eoyv6LLZKjFt8WFeV6gonvvGXUfEt0lLM
         I0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790894429; x=1791499229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/vEkgZQw4mtA8c08FHsi2FPZ7REcWS28KGmS8X2+78=;
        b=jU4AtHuM1iTZI6ZmTOVGnXWi4/yL7fYCAWzN0TvvAwnsn0oDFFq47I04V+Ve3NF74V
         9PBRnvacuNQzpAclCA0dbdVOO0YU9fteFSyI7xQuTX5hVHNEoYCKramW/bEtouFpCIFt
         gQonRy90gDpYoRwjhPWLsYUR6ILie1DlHINNYivMiarK4MLcRAPUewFu9JvATX1CjP6I
         BBBJB7ZKQIF7kCNy64mjM7b369sAq1lW+hQKH/v33DCJ84piYQwkTB1rTt9lliQaovhk
         Tkcy+lj1mH8YzkF0E4W8nmBKnyo2h8WLptKAubHwak+qFudAKJInpdfhfSA94R2cztR2
         Uq3A==
X-Forwarded-Encrypted: i=1; AKwUvBxq1yK351PW1pPZteaYGBvvgWSTtdBEq/zEX+FlumENn+X6hhtkQKf93y+xX6WTPy6xcWcoNfK6nhDZUW8=@vger.kernel.org
X-Gm-Message-State: AFuF++nXGDWtxx6AKzznWZ6A3BcloaX4i74t3vPYw/esaMEUpDL+l6mY
	WIuFLWYhOdLry8lsOXOWReSmkqxwoYtBPHbxUKENDMKF39nxLLo+u8t2O2MwtqTF88J/BEbS3uU
	AIFE9K8Zt4K0TYLCaBBdKFX1bfJAxtghextSG4flP
X-Gm-Gg: AYBFou3w2aIxO9poWdmFkNmOSzRVaL7ZcZFqWrjDO+oyMDkuQEF22cJ3UPpzqircwJS
	vZNJuxl2yIFO4zi0xQQT+tbvDxEbEf9D2O1V7l+LoydkSeKuL3pH2jPyMf533YKn39pTY1ZPRe7
	/D1WLzE7Ktn1w786wZcUtkgCHCQLVatf+P8NQ08s4gnKNpTmwJ+qEZDHhpq61kOrmYFMdUsIXrt
	pDOxgTaL5aaL0q/9Jx/Jtb5iOktTgqLg3Jtkx1EvdkAF1fR+L5B4B1fsSdDQGnt+CtTeTSJCXrl
	aTCMYgCHplLackjsm9Y6XKTWSIWSIIn5R9MJPuewhE7NhWwOMhVHv6xCGy4cBJO9rl0B5sDBzzn
	4ame10BGgcEODF2YtPEZGjkYnczmR3uCqLj6b3xt2CukQKFiIVHex2wIh7qFVQcRng4vGbTAM8/
	MBc2dzElM/TNuUNubzjkcwcFnX9q8V
X-Received: by 2002:a17:907:7208:b0:c29:555e:bf2 with SMTP id
 a640c23a62f3a-c2e4afe1430mr80322466b.41.1790894428293; Thu, 01 Oct 2026
 15:40:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910023411.514987-1-jthoughton@google.com> <bc3703c3-5798-40a8-88ae-98e1a9ea4bf0@kernel.org>
In-Reply-To: <bc3703c3-5798-40a8-88ae-98e1a9ea4bf0@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Thu, 1 Oct 2026 15:39:51 -0700
X-Gm-Features: AclHuK-V5lbUcshWQ3i9rEU5L8kCCMcMjYghSSaynmXUK63HsUMvHSW_bJKLTDw
Message-ID: <CADrL8HWtO2FLLOFngUgAnkb0qc08VgtNtb_CMhfwqjDUDvumxQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mm/khugepaged: Never install PMDs in
 uffd-minor-registered VMAs
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, liam@infradead.org, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Yang Shi <shy828301@gmail.com>, zokeefe@google.com, 
	hughd@google.com, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:52=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/10/26 04:34, James Houghton wrote:
> > Userfaultfd minor faults provides userspace with the ability to manuall=
y
> > install PTEs with UFFDIO_CONTINUE. Right now, MADV_COLLAPSE can map
> > holes in the VMA when a naturally-aligned THP is present. This is not
> > true for khugepaged collapse: the PTEs will be retracted, but a PMD wil=
l
> > not be installed.
>
> You might want to add a breadcrumb here that collapse_file() never return=
s
> SCAN_PTE_MAPPED_HUGEPAGE for khugepaged.

collapse_file() does return SCAN_PTE_MAPPED_HUGEPAGE even when called
by khugepaged though. (right?)

>
> The whole thing makes me wonder why that khugepaged check is buried so de=
ep down
> in that function. Makes me wonder whether that check can actually get pul=
led
> further out (maybe Kiryl's patches do that).
>
> try_collapse_pte_mapped_thp(mm, addr, !cc->is_khugepaged);
>
> is rather confusing when we never end up there with khugepaged ...

Hmm... it's not confusing to me; khugepaged does in fact call it. It's
just that, for khugepaged, a PMD is never installed.

Kiryl's series made the "do not install a PMD" choice part of the
collapse_policy, so I think it's a bit clearer now.

>
> >
> > When MADV_COLLAPSE installs a PMD that mapped holes in the VMA,
> > userspace is likely to expect UFFDIO_CONTINUE to succeed on the
> > should-be holes. UFFDIO_CONTINUE will fail and return EEXIST.
> >
> > This is not inherently a problem, as MADV_COLLAPSE is an explicit
> > userspace action. But, especially because MADV_COLLAPSE can be invoked
> > by an external process via process_madvise(), a rogue caller could brea=
k
> > a userfaultfd-minor resolver thread. If khugepaged is later updated to
> > install PMDs for khugepaged collapsing, that would be a genuine problem=
.
> >
> > Userspace cannot generally use MADV_COLLAPSE to resolve userfault minor
> > faults, as MADV_COLLAPSE will only resolve such faults if a
> > naturally-aligned THP is present.
> >
> > The naturally-aligned THP case is the only case where this quirk exists=
.
> > Collapsing otherwise requires all PTEs to be present for
> > userfaultfd-registered VMAs (i.e., max none PTEs is 0), which is
> > correct. This check is essentially bypassed for naturally-aligned THPs.
> >
> > Suggested-by: Lance Yang <lance.yang@linux.dev>
> > Tested-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > v2: https://lore.kernel.org/linux-mm/20260828222640.1638457-1-jthoughto=
n@google.com/
> > Changes since v2:
> >  - Drop cc:stable and update the changelog for the main patch.
> >    khugepaged doesn't actually install PMDs, so it is impossible for th=
e
> >    kernel to silently install mappings that userspace didn't ask for.
> >    Therefore this patch does not need to be backported.
> >  - Update the uffd-unit-tests selftest to account for the new behavior
> >    (new patch). This patched selftest is equivalent to the reproducer I
> >    provided in v1.
> >
> > v1: https://lore.kernel.org/linux-mm/20260828005004.2870750-1-jthoughto=
n@google.com/
> > ---
> >  mm/khugepaged.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 75639298efc2..e6947fe142ee 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1894,6 +1894,13 @@ static enum scan_result try_collapse_pte_mapped_=
thp(struct mm_struct *mm, unsign
> >       if (userfaultfd_protected(vma))
> >               return SCAN_PTE_UFFD;
> >
> > +     /*
> > +      * Userfaultfd-minor-registered VMAs should not be collapsed, as
> > +      * userspace is expecting to explicitly install PTEs.
> > +      */
> > +     if (userfaultfd_minor(vma))
> > +             return SCAN_PTE_UFFD;
>
> Can we just combine the two uffd checks to have less uffd noise? :)
>
> "Don't collapse if we might have UFFD markers or if userspace fills the p=
age
> tables through uffd minor faults".

I've gone with this wording:

        /*
         * Don't collapse if there might be PTE markers for userfaultfd-bas=
ed
         * access protection or if collapsing might bypass userfaultfd mino=
r
         * faults.
         */
        if (userfaultfd_protected(vma) || userfaultfd_minor(vma))
                return SCAN_PTE_UFFD;

>
> Overall LGTM

Thanks David. :) Sorry for the delay. I'll send a new version tomorrow
(on top of Kiryl's patches / mm-unstable).
