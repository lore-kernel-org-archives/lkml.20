Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1109C277C81
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891222; cv=pass; b=TKPiCIDSIYWAKxB8y84YmFCO9WtTwXmkrJi/IVQTmkqKdUXan0U5dRzxWSZBqBq4rHubMtAZ/GKPd3aVqzHZZGI6VoZ7pnFsqqORUdTb2/WaGb0OR8Ny3lQ/pus8/SW1ghtSqGrj3MTTGWTPHqiR39hL/Znft0VLTFDtWYYQIbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891222; c=relaxed/simple;
	bh=KzoK0/czRprf+G1FPQYlxKnK97qPTjIFyt54IJsVtzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwgB0wj2I2PnJtcKSfXrVZriSejyZvKeM8JrXC2ihV7odgZ5WujbpBPVI7aMCH1neTSICBrZOb+JXOhrBE7C9+1DJHNOpxy/2mLtyD+4/JCyxuu7W8q7j2Mp3bNEAJtOsaLzNi7nzoGHQm5ge3qIQAP9dnBYDE5TURVxGHuwwg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C5V5UrMu; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C5V5UrMu"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f2685f2so4142158b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790891219; cv=none;
        d=google.com; s=arc-20260327;
        b=IW7UjbF20Cj3JUPQhtjAw81KYOgTuvwHvgc04RR5fWhuLSoWfXfOVnJvvJGnXFqV9y
         yYWwPXJnHE3y1ec0qY4qXda0ULGA3S4MetErikdihVvvGBB5Ed0I6bd4Fm8xDSIwAP8D
         ehYkQ25dYK7zclNZH8pxonKud22mYWnlvOLvCO43vBTy194hCbLiJq7VXQGh075K6nqY
         Pa946Dp2/FPYb93Or9KOz60mgJeDCCW2+WfmgZZS0w+xSLuerV3hl14OmnibrOAZcPj3
         SBFek4/Rr6ybgUMYXbXE7j5dkYySUZjPqj7Oey3ek/1QDC3poZDtFWB7oCNduPpJg54t
         GDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ocYmniOwpUzQLzkBfUho2DWqpF1xLeQVvVLKNcyGJSs=;
        fh=PhQQraUb9KzimzHaNr3wBzNejhE7iQVW4ZvdENFeacM=;
        b=FrkASodXSSSWqy6Hna54MGbwaPavMqxzlPSXprkAUTg3iAo70Lc5x/6XPCG3l2KMVW
         FFzkcuOIYFwuda0AYL/640dR7391KzbNXwhVQtE910epXEMXDVH9nYnbMj/AGnXoz2F7
         yy+EwQOiD3EMQoOLeLl6sARCCsJLhpC2AWsyxTXxsfW4aqz5x8gnCaIT2HRa/KuVw3V6
         T4133wj9jB009ixnBdqgxLZfoDCS88EH+G419+KK4fS+FRTmKhp1/zfoaH51QQhtMHP4
         4BuKNDaXlFLuN1MZp3yaQ0764e3h9i+Gdk9zixpKiDfLHPygw8DEMidazEmULtyCyz/p
         db8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790891219; x=1791496019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ocYmniOwpUzQLzkBfUho2DWqpF1xLeQVvVLKNcyGJSs=;
        b=C5V5UrMuQBnp30lFaGeSGUMyWS5IcvLNApToQYX/jmM7761BApTg9BdQYpGvc8idub
         ySQxGoq0a/YBXFZlih9fw4W0ZuUxMgaWY364V92yDj9BY5WhpeVjrMuEuNF7d4FMiENW
         hbBczmdROpdbXY2MS2apPSdRLBBBEn8RCX/SgYVbuOlO55PZyiXBTQMSKOnCNqVQtYx6
         uM265eW1LDtfpPrLcYTfhMFlBMLJjGDAZGoyk37Sgcl1FvfmpOttlMP8ss7ycCg4ED+B
         LCWbIHfLGwYnVYpLofxSQcR/6thifGvGlhIG9+UbqUInEcLiNe40wdn14Lq0aUp2E61v
         6Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790891219; x=1791496019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ocYmniOwpUzQLzkBfUho2DWqpF1xLeQVvVLKNcyGJSs=;
        b=YcK16LEvr1Aak2wmkNjCGdT8YV/2MQW6Fj7fYo3SPrEGctXmjtHGpJbLd4jbDujoHE
         b5DAZNTrTAAYeFHucyBf9ZY5/oil9Z+bAxZZ4A/AcnqU2KSdP6Skoqs0Xhi5RcoD1vJQ
         jR+UG2TyGwJ3cgF+3b7s/eBqpmJsS87P/VFg6aa7yy13QVGmURO3LFyBPIjGU4BQBmmG
         boktTwYqKZPy6RkzeqC7pEkK+OPm7pEfO+GFRu+JvbF098ONnEny38EwKBxA0TdvDoIg
         zoCQN77hFXuUY9B7ZY+0i6QduNHvFH/dRiTjhKVjfPN28h5hziLz5OQKTlo+YCqRIkx8
         I6/g==
X-Forwarded-Encrypted: i=1; AKwUvByfvEbRCBWMQe3ki+PH1MiiFCvJLHnpHKaC2lxxpoCWIRQK5Sg2zWKkiP+p32idPBZOPwk3dINlbbgZlUc=@vger.kernel.org
X-Gm-Message-State: AFuF++knO1P3HktOd348ByC53iAVI9LHOA5YlUYOGwWTpmGB5AlyhNG0
	Piw7DCkGJyU2rHR1U9lOxuWvBvDb2AL2BtWU+UVyivGugom2mxcBNendDiaBwRfGuWAc30Xfpb1
	GVdf4bvJ2orgwTgm0Mxgvj2lU/Tu/GXQYkJtRupck
X-Gm-Gg: AYBFou2owjWPyYjRPWJ51x5IdfHwP3Djti2fRhcSe2DdjCxArpqTkIxUDN0iC8z5w/M
	3CoeFiyKCoXTZQUPtqrqZuggAb7X2zzO5uR66QeFUIyr4PiW11kkITembS2iMFaOC/B7NzWcWbT
	fkM1zTvLZmFnMtg+qrFnvxdgFz5oBtABS/PTsuIDG1KuJJK2dk5dvHkiL7j1gznq41/BRkXG/e4
	/1+siSTqVRSpv576jB3d+YwnJom32T6PJit3yApaKy3XHkPm8LKS9FxLW844d1dlZT6+CKzok7E
	wsu/W1DumVDLA6DY1ie1SiRes8Y1QVNqkMTsztVLOVMLL2cvYWpB6BjZdC6J1c0QX0rDGotQuq+
	QvI1hooxE++Mu6Yri+tADDS5DXJ8HdSkhNy5cXycz1WM0DZTDsDWPZ6eBp2V6rsqiOApL2W0arX
	58flI8B3qIWhch75FXL1uqKljvR2wdNtuR
X-Received: by 2002:a05:6808:6801:b0:4c2:13aa:fa13 with SMTP id
 5614622812f47-4f526a4c766mr560451b6e.1.1790891218159; Thu, 01 Oct 2026
 14:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910023411.514987-1-jthoughton@google.com>
 <20260910023411.514987-2-jthoughton@google.com> <4de1dfb3-b349-4916-9fe0-6b9697583ac7@kernel.org>
In-Reply-To: <4de1dfb3-b349-4916-9fe0-6b9697583ac7@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Thu, 1 Oct 2026 14:46:19 -0700
X-Gm-Features: AclHuK98r7ykwb9PPu4rvO8bCfnoLUsj40t9KEUmqr0UOwQY_g67sQ82-mtG4fE
Message-ID: <CADrL8HVyhedf3PFCbfdh6KPk_wJjT4+aa8180t75xSMwvo2B=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mm: selftests: Adjust the MADV_COLLAPSE uffd-minor selftests
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

On Mon, Sep 21, 2026 at 12:00=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/10/26 04:34, James Houghton wrote:
> > The behavior of MADV_COLLAPSE with uffd-minor VMAs has changed:
> > MADV_COLLAPSE will no longer install PTEs where none existed before.
>
> Misleading: MADV_COLLAPSE installed a PMD not PTEs?

Yeah, that's fair. I've updated it to this:

  The behavior of MADV_COLLAPSE with uffd-minor VMAs has changed.
  Previously, MADV_COLLAPSE would install PMDs in parts of a VMA where
  PTEs may be missing, essentially suppressing userfaultfd minor faults.
  Now, MADV_COLLAPSE returns -EINVAL for uffd-minor VMAs. Update the
  selftest to demonstrate this new behavior.

>
> > Update the selftest to demonstrate this new behavior.
> >
> > On an unpatched kernel, the test will hit "unexpected memory contents
> > after collapse".
> >
> > If the selftest is left unpatched but the kernel is patched, the
> > selftest will SKIP when it gets EINVAL back from MADV_COLLAPSE.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> >  tools/testing/selftests/mm/uffd-unit-tests.c | 75 ++++++++++++++++++--
> >  1 file changed, 68 insertions(+), 7 deletions(-)
> >
> > diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testi=
ng/selftests/mm/uffd-unit-tests.c
> > index ef9b3956bdcf..6f2360f9b75d 100644
> > --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> > +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> > @@ -518,19 +518,34 @@ static void uffd_wp_fork_pin_with_event_test(uffd=
_global_test_opts_t *gopts, uff
> >       uffd_wp_fork_pin_test_common(gopts, args, true);
> >  }
> >
> > -static void check_memory_contents(uffd_global_test_opts_t *gopts, char=
 *p)
> > +static int __check_memory_contents(unsigned long offset,
> > +                                unsigned long nr_pages,
> > +                                uffd_global_test_opts_t *gopts,
> > +                                char *p)
>
> Two tabs look better ;)

Fixed (I think).

>
> >  {
> >       unsigned long i, j;
> >       uint8_t expected_byte;
> >
> > -     for (i =3D 0; i < gopts->nr_pages; ++i) {
> > +     if (nr_pages + offset < nr_pages)
> > +             err("overflow in memory check");
> > +     if (nr_pages + offset > gopts->nr_pages)
> > +             err("out of bounds memory check");
> > +
> > +     for (i =3D offset; i < offset + nr_pages; ++i) {
> >               expected_byte =3D ~((uint8_t)(i % ((uint8_t)-1)));
> >               for (j =3D 0; j < gopts->page_size; j++) {
> >                       uint8_t v =3D *(uint8_t *)(p + (i * gopts->page_s=
ize) + j);
> >                       if (v !=3D expected_byte)
> > -                             err("unexpected page contents");
> > +                             return 1;
> >               }
> >       }
> > +
> > +     return 0;
> > +}
> > +
> > +static int check_memory_contents(uffd_global_test_opts_t *gopts, char =
*p)
> > +{
> > +     return __check_memory_contents(0, gopts->nr_pages, gopts, p);
> >  }
> >
> >  static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, boo=
l test_collapse, bool test_wp)
> > @@ -539,6 +554,8 @@ static void uffd_minor_test_common(uffd_global_test=
_opts_t *gopts, bool test_col
> >       pthread_t uffd_mon;
> >       char c =3D '\0';
> >       struct uffd_args args =3D { 0 };
> > +     unsigned long checked =3D 0;
> > +     bool bad_contents;
>
> Through in an empty line. Or better
>
> struct uffd_args args =3D { .gopts =3D gopts };

Done. Thanks.

> >
> >       /*
> > @@ -564,24 +581,65 @@ static void uffd_minor_test_common(uffd_global_te=
st_opts_t *gopts, bool test_col
> >       if (pthread_create(&uffd_mon, NULL, uffd_poll_thread, &args))
> >               err("uffd_poll_thread create");
> >
> > +     if (test_collapse) {
> > +             /*
> > +              * Read just a single page and try collapsing. The collap=
se
> > +              * should either be rejected or be a no-op.
> > +              */
> > +             if (__check_memory_contents(0, 1, gopts, gopts->area_dst_=
alias))
> > +                     err("unexpected memory contents before collapse")=
;
> > +
> > +             /* MADV_COLLAPSE might return EINVAL for uffd-minor VMAs.=
 */
> > +             madvise(gopts->area_dst_alias, gopts->nr_pages * gopts->p=
age_size,
> > +                     MADV_COLLAPSE);
>
> Add an explicit check for expected errnos?

Done (just EINVAL).

>
> > +             /*
> > +              * If the above collapse mapped pages that were not expli=
citly
> > +              * CONTINUE'd, the below __check_memory_contents() will n=
ot
> > +              * fault on some pages, resulting in incorrect contents. =
The
> > +              * PTE for the first page may get retracted, so avoid che=
cking
> > +              * that page, as we might take a second fault, flipping t=
he
> > +              * contents a second time.
> > +              */
> > +             checked =3D 1;
>
> I'm not an expert on this code. But a trivial check to see whether there =
is
> something in the page tables that shouldn't be there is through the help =
of
> pagemap_is_populated().
>
> Maybe that would help to simplify things, not sure.

I've reworded the explanation here. I think it's better just to have
this `checked` stuff rather than checking `pagemap_is_populated()`.
Either way, we need to conditionally skip checking the first page,
that's the real annoyance.

New explanation/comment:

  If the above collapse mapped pages that were not explicitly
  CONTINUE'd, the below __check_memory_contents() will not
  fault on some pages, resulting in incorrect contents.

  In the correct case, when MADV_COLLAPSE doesn't map pages
  that were not mapped before, it may still retract existing
  PTEs for the region. Reaccesses to previously userfault'ed
  pages will trigger a *second* userfault and flip the
  contents again, which appears as a missed userfault. Ignore
  the page we already accessed to avoid this.
