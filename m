Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF091990C7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791845210; cv=pass; b=VHNqNOnXrS2BXzhNG2gTyQ48s7wyhFduoaDMCpgcLxshKRmOuJ7YhySp6oAVlOa1ZTnzlJ2WUY8vnX2WZTdRT/NmZJPTnjqAxLgbzJpjuZqUlzf2vD9P4WjTAJ9SSAvFQHPJBE+XoxdX2tY42bS5T2WI4uMUcCIPHQsH4YWNId0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791845210; c=relaxed/simple;
	bh=37iRYeaHm+k74dvcW+EMCZyF+CLLdlT8qU+WaDlY9u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8donXoukDY9PRfsimfPG16tL6U4wHpT2CRYEHcYFAuvMiH28byqNoxiF7/WicWgGTRiKVqXvegpCcctkBOvNsBCvnzyG+DY9wh67AhVLgrgqRkwcdUGZ+9RGAuui55S3yv7xx40JMuYf1OpEF5PC7jZQY6iW2HCsYm4znyDegQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HepCPakO; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HepCPakO"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso240535466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791845207; cv=none;
        d=google.com; s=arc-20260327;
        b=j0/6C+vOC4xqr2azVB5gzXutMYNZwIKkrKMTa+IIcZltF62zb6OP6OPIJeXp938rUv
         k0HVewiXbbFMiohMU7aOkzU3GzvhS+FQe3vronHLp9SNm6zdbDPRcFQWkzu3B951cVy4
         QDf6gq/n8cMVY4lkQQ7KfYYyH6x0QPPX/kJbHf/q5tQV29OcQOvs+b7eCXB0uLDtsOqq
         19/wm3K1dIsSP4RU09Qe+2cn0KAjnfp9sIbRRA0snKR16lTcCDwEh3Neq48Mdrv15fHL
         grZSUYDl5R64/GtbD3PjvnQzIRuAB7wjUnS6K8iGAIpiaEWOTgZLu25La9sHI7Xq39t9
         zCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkNXmVIuYHniGi8sq0nMVJSfhNn8EId0UMsFBCBlV/c=;
        fh=k1+rgEDWj4EJCDSavoILMopORShg/TdK46o+ywzX+D4=;
        b=h9HUjyk3WGGMZXONJNX6nRFhsiUWsLpGZxOinFsl4CbXU1HlHfNLy7PcWQYV7TDF8i
         2EBo/QTEOOWypL3tZ+Ic2DsndgsLfpn1OxMXMr6txK8492rgDZwZAUmYuEHZ8Xk7dR6H
         FZ41R2qdvV1F4SteIKBxcSbRvll5+ethof/iwvjxG7GM6TuQht3+zB7ko8SmkTNCIxvW
         2Y8I4XniRG3u65NLwrIuqB3gbA5alyttyRu2TIQAiSJTP6Kko0AblFtdaCcxkTJnkEHt
         gq9nA9Iu1WiDwfu2CSkVxrB+vI59od9buE299tQnyAwDLmwbu4kZ05mTd+kgTN6Z0jx/
         GCMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791845207; x=1792450007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkNXmVIuYHniGi8sq0nMVJSfhNn8EId0UMsFBCBlV/c=;
        b=HepCPakOt0kYmH9UG4N6S0hAzF572NidflHaNPzAtE/fG2lfouqHCXLEnsSIe/9x14
         9x0y0iHM3br2h9o9UEUjzHw0QesBxwmyqIvKelPDX05fH66Bob1rOv0ZW53Hq5AvXHFN
         vBX2vQpPg1a9Bt+1gmN4jwL091WeHp0HaQvnOSUkuQAeSfTNUsBvZnXkikE057VB2pxE
         /D/HA4xs/4vXg/ooTDLU4DZ2eClx23Y5KmzbiQChaKW2BZYYBDcumUVQxF81sBWpzv8/
         1jbYtVvCYk6SRA5GKQPmCnM+4E6kRgUA6usGJwCNPGSvgCb31anslvRzl1DK+2cV2Z7K
         hhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791845207; x=1792450007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkNXmVIuYHniGi8sq0nMVJSfhNn8EId0UMsFBCBlV/c=;
        b=z3OzGtIDZToNoRUxPBG3kEU+vyeSgRQPWG4QsGHDUNisuor9/nEmG+5Zl9Eqt7NYNL
         vbu3Esdl9b3PR07ts0NeYOOWj8r7d3xElSK2wmVaYPqbEbmEFZMsxLrm6ensR87kbXC3
         EtM6icX4yipi+D0ELly6QMjZvKkexe+WMjJPGKRuOCcq+zhFqMSAssavH7nKjE7YYAXf
         Rr1YffZUwOTevt+Aepd6v6S7NSFaN1N5n84EjtsxQAz1booU4erWRXjt4m7usKB7w7Jt
         Vfbt2+4S0LwzucA6QAdHM2xKXPgxSbYGNU3j+qjYd75jJ32qE7SvngWQCF6sZbi9nlQ7
         ekMg==
X-Forwarded-Encrypted: i=1; AKwUvBxh7pHDnwyP8k3rFd71UolQAeqQN/+W5ulN1Fg9COPjDjhtg0pw9/8H32QXOPIGx7X/Fm7rQ89xaSC7tKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3jxE8DhLWRtZ6K0ii5QADd3XWRNu4D5zTXG3Ka2Ew6X1fJe+2
	FMEjLob+T4H5xgU6waUZVOrkmNR/9GWBiJ/+vVaH1qg+qBztUVngCI56RM+uLYrVcjYXbhxrkKb
	+MJSdcFr8lzf6CKDam43w6PkVO/FYmxniyr8QPP/B
X-Gm-Gg: AYBFou2gAkDk6cyhkJbhby2vzVMyai5Aiplocw+fM3+QpuhwuJQJa8yhDVgmopHADmy
	/iorSy+7x9SC+sXIXdYO+p9sepFTvEFPz0YkCmgJU607/QnmczpaN5QWtzZA/0K09hSQU+ogI2l
	DL253S3SbOkmzKYop4ILfk42ZNT5+5OC8MNxEJKG1MrIZttNbhP3tYynLLFypCvvnGMmNsD+Dvr
	BqMyjvkrfmVwaoARrN08LLLyTy/ztPpSp0RXmv8EhjTj3wgzNQq/3NbgcPsLZR7NTmOPZv+Owre
	ZZEnXRkqoJkljqm5dpocRYgeaEBhlr/JIjrzXKOgglwtqvfPRw2RPMOI/1a7OU+qac6KLNEhEAJ
	VikIAFnz+a6r0cnmZ9YXO8pOUOcxKFphKEpAEu6QF6+HdVGCsC+ll07FfVZVh+SpEk52qdGJKWM
	nTpF2tSyBthKvHDew9hY0DVLqkgA==
X-Received: by 2002:a17:907:c10:b0:c26:19e3:e97f with SMTP id
 a640c23a62f3a-c31aa079ebdmr1002297466b.31.1791845206750; Mon, 12 Oct 2026
 15:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003001859.502725-1-jthoughton@google.com> <asy9PMMWm6waSXEz@thinkstation>
In-Reply-To: <asy9PMMWm6waSXEz@thinkstation>
From: James Houghton <jthoughton@google.com>
Date: Mon, 12 Oct 2026 23:46:09 +0100
X-Gm-Features: AclHuK9ZhJOKDqq-fhgubNpXnJrAc9LsNZuqrRbSIvL1R7j6cSw08Wb635cc-DY
Message-ID: <CADrL8HUmqqH0+Ept3LDFpczbJv11qyWcQ8_3cSCaecjAr-oCMQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] mm/khugepaged: Never install PMDs in
 uffd-minor-registered VMAs
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, liam@infradead.org, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Yang Shi <shy828301@gmail.com>, zokeefe@google.com, 
	hughd@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:00=E2=80=AFPM Kiryl Shutsemau <kas@kernel.org> w=
rote:
>
> On Sat, Oct 03, 2026 at 12:18:58AM +0000, James Houghton wrote:
> > Userfaultfd minor faults provides userspace with the ability to manuall=
y
> > install PTEs with UFFDIO_CONTINUE. Right now, MADV_COLLAPSE can map
> > holes in the VMA when a naturally-aligned THP is present. This is not
> > true for khugepaged collapse: the PTEs will be retracted, but a PMD wil=
l
> > not be installed.
> >
> > When MADV_COLLAPSE installs a PMD that mapped holes in the VMA,
> > userspace is likely to expect UFFDIO_CONTINUE to succeed on the
> > should-be holes. UFFDIO_CONTINUE will fail and return EEXIST.
> >
> > This is not inherently a problem, as MADV_COLLAPSE is an explicit
> > userspace action. But, especially because MADV_COLLAPSE can be invoked
> > by an external process via process_madvise(), a rogue caller could brea=
k
> > a userfaultfd-minor resolver thread.
> >
> > Userspace cannot generally use MADV_COLLAPSE to resolve userfault minor
> > faults, as MADV_COLLAPSE will only resolve such faults if a
> > naturally-aligned THP is present, so this is not a functional
> > regression for userspace.
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
> > Changes since v3:
> >   - Prevent page table retraction in patch 1. Please see the comment
> >     next to it. So this patch now has two hunks instead of one.
> >   - Reworded the comment and combined the userfaultfd checks in patch 1=
.
> >     (Thanks David)
> >   - Simplified the selftest a bit given the behavior change in patch 1.
> >   - Undid a change in v3's selftest that incorrectly handled the case
> >     where MADV_COLLAPSE was not supported entirely.
> >   - Rebased on top of mm-unstable, which includes Kiryl's changes.
> > v3: https://lore.kernel.org/linux-mm/20260910023411.514987-1-jthoughton=
@google.com/
> > v2: https://lore.kernel.org/linux-mm/20260828222640.1638457-1-jthoughto=
n@google.com/
> > v1: https://lore.kernel.org/linux-mm/20260828005004.2870750-1-jthoughto=
n@google.com/
> > ---
> >  mm/khugepaged.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 913086eaf17b..438c4af1c058 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1868,10 +1868,11 @@ static enum scan_result try_collapse_pte_mapped=
_thp(struct mm_struct *mm, unsign
> >               return SCAN_VMA_CHECK;
> >
> >       /*
> > -      * Keep pmd pgtable while the uffd bit is in use; see comment in
> > -      * retract_page_tables().
> > +      * Don't collapse if there might be PTE markers for userfaultfd-b=
ased
> > +      * access protection or if collapsing might bypass userfaultfd mi=
nor
> > +      * faults.
> >        */
> > -     if (userfaultfd_protected(vma))
> > +     if (userfaultfd_protected(vma) || userfaultfd_minor(vma))
> >               return SCAN_PTE_UFFD;
> >
> >       folio =3D filemap_lock_folio(vma->vm_file->f_mapping,
> > @@ -2093,8 +2094,13 @@ static bool file_backed_vma_is_retractable(struc=
t vm_area_struct *vma)
> >        * and cannot be recycled to a shared PMD. Other vmas can still
> >        * have the same file mapped hugely, but skip this one: it will
> >        * always be mapped in small page size for these registrations.
> > +      *
> > +      * Userfaultfd-minor-registered VMAs should also not be retracted=
.
> > +      * PMDs will not be installed, as doing so can suppress minor fau=
lts.
> > +      * If retraction were allowed, khugepaged might continually cause
> > +      * unnecessary userfaultfd minor faults for already-CONTINUE'd pa=
ges.
> >        */
> > -     if (userfaultfd_protected(vma))
> > +     if (userfaultfd_protected(vma) || userfaultfd_minor(vma))
> >               return false;
> >
> >       /*
>
>
> Did you run 2/2 on current mm-unstable?
>
> Here, on e8d0f6a1b2a4 plus this series, minor-collapse fails every run:
>
>   # failed reason: [unexpected memory contents after collapse]
>   not ok 1 minor-collapse on shmem

Oh, I must have missed this when testing the unit test
"simplification" for this v4. :( Thanks for testing it.

It looks like uffd-wp can tolerate the try_to_unmap() because
cond_install_uffd_wp_ptes() will get called in the process.

> This patch refuses the collapse too late.
>
> collapse_scan_file() has no VMA, so the uffd check in
> collapse_max_ptes_none() never applies, and collapse_file() goes ahead:
> it try_to_unmap()s the PTEs userspace already CONTINUE'd and replaces
> the page cache.
>
> Only then does try_collapse_pte_mapped_thp() return SCAN_PTE_UFFD.
>
> MADV_COLLAPSE fails with -EINVAL, but the page the test read beforehand
> is already unmapped, takes a second minor fault, and gets flipped twice.

Thanks for explaining that, I didn't notice the try_to_unmap(). The v3
version of the selftest didn't have this problem because it only
attempted to access each page once.

The purpose of this patch is just to avoid installing PMDs; unmapping
PTEs is acceptable. I think the logic to truly prevent unmapping in
this case probably isn't worth it. Let me know if you disagree.

So I'll just go ahead with fixing the self-test, applying a diff like
this (sorry for the formatting), undoing the "simplification" from
v3->v4:

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c
b/tools/testing/selftests/mm/uffd-unit-tests.c
index 74ce43769e58..48435faa8bc8 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -553,6 +553,7 @@ static void
uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
  char c =3D '\0';
  struct uffd_args args =3D { .gopts =3D gopts };
  bool bad_contents;
+ int checked =3D 0;

  /*
  * NOTE: MADV_COLLAPSE is not yet compatible with WP, so testing
@@ -596,6 +597,7 @@ static void
uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
  * The page we already touched should not be unmapped, so a
  * second userfault on it should not be generated.
  */
+     checked =3D 1;
  }

  /*
@@ -604,7 +606,8 @@ static void
uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
  * fault. uffd_poll_thread will resolve the fault by bit-flipping the
  * page's contents, and then issuing a CONTINUE ioctl.
  */
- bad_contents =3D !!check_memory_contents(gopts, gopts->area_dst_alias);
+ bad_contents =3D !!__check_memory_contents(checked,
+         opts->nr_pages - checked, gopts, gopts->area_dst_alias);

> Also, your 2/2 missing Signed-off-by.

Thanks, I'll fix that.

I'm actually away right now, so I'll be slow responding to feedback
and can't send a new version until next week.

Thanks for your patience, Kiryl.
