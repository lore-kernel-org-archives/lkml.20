Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634215;
	b=i5VdxOMZ1GsdR7CsjVSBe8ITuHUicv+zm4rgRf+f2lZ5VxCOG7DAociQOpNkPtcHaqzF
	 2Wl+9qeppuG1DnX5tSPoswrjM1LjcinOyxz7oZdJ22g42/ovivAuLTkiXQWqlAYgBRzTH
	 luBkwz23ifGaQlQPrXYXk1XcAXvbQI8oXPtt4vVu3fadv7A7RIHoz3+s/NPstAVtwfuoG
	 lnV+aU9BYMRaLzNdQBBEDamXHOaNJiuC46dIjJJz4jG8q5tWhxisbU8eFFEkfRZ98mhqw
	 ZoPSMGcBDUXSYXHAM5JFtA1hJqx8rEbcqVDedqtNlOcwR4Hd2CFQNvD1ZfTk4WOYYDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HK8ZrL+fL3c5ivUA8S9idB+tb4oTBF9gPah3Mf4G/bY=;
	b=V2VmLRDnTbN2eomySLURXzthnD5PnjT+KONM5rLWCu4u0qrZvAHN04Und8yjVFA8p/im
	 cixf3E17Hp34pSMaB2kKEG6fVft0zbxQwzpo7RLtAl8BOoLsOLivJfKGVe8Y8x4l5QpnL
	 wLbXDwG4OLiQcVdWuD1Lx6RFL7Pycyjhnbs9OB05KzkP82BLYVdYSDwdT33JHSb2uFUXC
	 LRMnbmzFyEsSRbaxxP+2pcPJfQFamJuMSaeyVKIIxZSj6pdYxkzUXSNY8k4UaRWhE15ae
	 2QYMx4EhQZ1EDg2aFGCV0Sw3u5k2dhvy5fFDeM/98Dly5sJc3OYbRNT8D0d6QngQRAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R9j+jwxG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAC8606D82A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FAC8606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R9j+jwxG
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-54492d8a988so446661cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:43:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793634214; cv=none;
        d=google.com; s=arc-20260327;
        b=S7Xm6FXk+Oxe7hSvcmFdE2Sf1NflTgHMJaTnY5HyWe4Nst30OVp53rfIAnAYpg8AYv
         y6VcDUuo/Ir/+fuTwzP3fRnfbCCRdkkgAFFGzzSy+IOxoj38vY5kHVIHjxrr60Z35NYE
         N526djAxFeeIwQX3Q+StkVzSRcH7FrMLVbU/GJ1mGIJaPUs1eqyUC9ZtTEba5f4jFFlP
         +NF2R3nawX3ZKMhqbaAqbrRXeV90gCZP26xRE5F0IOEIen3nujIGv9ZzF3whDIL616LR
         GNs0HIYvMkGepTTMt7+9B9Mghdjml10zn8AbM4TioJULrbmrG5wh7abc1aHbtQNJqKeR
         NtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HK8ZrL+fL3c5ivUA8S9idB+tb4oTBF9gPah3Mf4G/bY=;
        fh=4gFQykmBmQHqNquFDT0tSPwXwPp0U+3wD7NhEIb0EcQ=;
        b=Ig9RA8CYcqFRVfkf8EKsBHM0OoLKQzjv8XUSj+fONRQBplnhOIPu3Q8GjTdzEdEa3m
         UgeLGksQg4aM5+dpL7pf0sW9NNQEFEG9sQAWqS8DZDIf3/iFEduU3AdHQzC2uTE7MAzM
         yxYFovEWviqdOvVIZpkrauPsC3f5V8vXO9BB2JsZ92lScMLgsVJFd+TYm6LdxnV0Mzl2
         VBfBIaDsHaMKf7WPH2mN6Ocpakxld7pyoWZvC4ksM1UeHHYddk7UfL8q/Rhkm9UPK7w4
         MRYwT78ZmkX/eUDtIDa/b3SzUTMAgVG/XbbNPCwtzIzxvsD+cXNU4Dcf5wvB5CcIwlD5
         4L2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793634214; x=1794239014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HK8ZrL+fL3c5ivUA8S9idB+tb4oTBF9gPah3Mf4G/bY=;
        b=R9j+jwxGcRL6XdsG2JWiq2a64G7IoWEkfdsReSzCWmy68LqttG+ZpDz356XNZ0BE5G
         TiHv/vLz6oXwQhiKyDA10leH9Asnjacp2C88iOazs9HMe6omqyd/LuvDsfvaF/LhkmXu
         jJIh768DemfC3BPoFeTnacA5QUfKQCX0ifEEBWXCTbZfNF2R7zu/bCRQhLwYip77HQAV
         mDvcOTT7kSHBakijnXYkRDqCPCvEsBMSLeuJNm64FWC2Z+ffwG1thHZ/9/hMWUofZP+f
         8OLJsnD2d1bJBx8Mjf+vc0a5VwK5BDnXxWVDX9muRqCVRMiNMTcvbzjSKFEgLBhi2YIe
         8dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634214; x=1794239014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HK8ZrL+fL3c5ivUA8S9idB+tb4oTBF9gPah3Mf4G/bY=;
        b=AtGYPy4xB9EqEwQgJ7PXuENwAy1AY/FZDsoureGrZtsJk4sYbWYGoyPSjmHut/y9Ag
         7iWMZDvcus9EDx5D9NiKdbTSrtvYk1P9mJgouysPveR1my/G3IjAliPqRf5PVVC3giAx
         fRnd93klahWBdHSfHGejXx5Vh8pC1aIu2tuN21X2M+Ja8/fUUr4/9N2jpI4rY8qKCHct
         GS5fWUWbki3yJa6/sBmPhUuqYdDMAN03EYjLG+2QZtimpaC9F7BqRtsbrgclvyIrLetA
         qpLXmAQY9Ek0T0lJDOCWZ5r47+X8o5xUksc5L5jZZpUWV2Xp0QTZAyCSotg7KEQu7QMh
         JGlw==
X-Forwarded-Encrypted: i=1; AKwUvBzjIgimGIT/X9VkIKAmB+Z+hKQgVwv41h4jurYyi8rJd0M2m6L3TDCXjvW5lucHolatZ3iyFYVIafhHHkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mF0D+1K3ECPLAB9OYcgfv3/E82xihyapU0b2+kpahzW35qnit
	eDJy6PXYe7DNdBOkHOveS3R4vW/U4MVXdCVjp9WrOeqqLlA902f25z4doErdZKovAa0r29waH4W
	QJWBadejVgIIxitoBqCG2HPmIfSAp9+VYN/+6HxLh
X-Gm-Gg: AYBFou1JP6uly3w6VCJaUXtHLpSjEGry5j1I29Jvj1tLn0RMvQDgNIBLi+tsNfuCBpj
	/VckJaojXai5chjfgPXbYQxuj15zxKWC6YzP70q3sQz3OG2UY7kLSgwZlAXpkFUBeIBo2c9O9Dm
	rDKVE2MQdjEWiM0xz+981wLl2tREM1pJ3A/+84sljFDMEKiiwWpPXn9e3bIxGtiR7vY80rwbBTi
	t0jQclZmWSVPAxgI0reBUU/UpdkTAWcvxJCeqq6PU7+eR63U9DVJXlNCvQzaTdnTCMUDe2zXKf3
	Y4w3CNFRt0RRJlc21dLvmMryE5+fwMo2BqiUDRr6XyqYrN1xfLaG7Iv0aidyqAHuwovnhizl0Oe
	ZoS9jEjuzYKfH+/VVAX57eGVd3479+DSfApPB
X-Received: by 2002:a05:622a:5148:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-5414de19e54mr81585421cf.8.1793634213512; Mon, 02 Nov 2026
 07:43:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
In-Reply-To: <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 07:43:17 -0800
X-Gm-Features: AclHuK9i5oa7VVhckAQGYTCIvZrhSt3SBl_wIVecLZ9aaFaoBEyuGC4XsLqeGFo
Message-ID: <CAJuCfpGmPLBRhHa_dmyP10QzyRyvcWMYDLU0+J9t-RCLBsTaWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 11:01=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sun,  1 Nov 2026 07:45:03 -0800 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > Pss metrics can be affected by map count even if VMA tree stays unchang=
ed,
> > therefore tests checking VMA tree integrity can't use them. Use Rss ins=
tead
> > and pre-populate the VMAs so that Rss changes if a VMA gets skipped or
> > double-counted.
> >
> > To ensure all test VMAs are populated with anonymous pages, remain
> > mergeable across VMA operations, and do not have their Rss changed by
> > memory reclaim:
> > - Toggle PROT_EXEC instead of PROT_WRITE between adjacent test VMAs so
> >   all test VMAs remain writable and MAP_POPULATE faults in anonymous pa=
ges
> >   (rather than the shared zero page, which is not accounted in Rss).
> > - Use mprotect() instead of mmap(..., MAP_FIXED) in split_vma() and
> >   merge_vma() so the first page of the split VMA stays resident.
> >   mprotect(..., PROT_NONE) splits the VMA without unmapping the first p=
age
> >   (pte_present() remains true for PAGE_NONE PTEs), and
> >   mprotect(..., self->mod_info->prot) merges it back. Both parts of the
> >   split VMA retain their non-zero Rss.
> > - Lock all present pages in the child with mlockall(MCL_CURRENT |
> >   MCL_FUTURE | MCL_ONFAULT) so memory pressure cannot reclaim pages and
> >   alter Rss during the test.
> > - In remap_vma(), unlock next_addr before mremap(..., MREMAP_DONTUNMAP)
> >   so next_addr is not split, use mmap(..., MAP_FIXED) in patch_vma() to
> >   merge the middle VMA back into addr, and exclude smaps_rollup tests
> >   from test_maps_tearing_from_remap since remapping moves and unmaps th=
e
> >   page from next_addr.
>
> Thanks.  This is proving tricky.
>
> My evolving reviewbot still isn't happy:
>
> : This fixes the v1 RSS issues, but two things remain.
> :
> : Alternating PROT_EXEC breaks with READ_IMPLIES_EXEC: both mappings
> : become RWX and can merge. A syscall test produced two VMAs instead
> : of 16. Could we populate everything writable, then mprotect the odd
> : mappings read-only? That preserved all 16 VMAs and avoids zero pages.
> :
> : Also, MCL_ONFAULT doesn't bypass RLIMIT_MEMLOCK. If mlockall() fails,
> : the child asserts before CHILD_READY and the parent waits until
> : timeout. Please arrange a coordinated skip for insufficient allowance.

Good point. That part of your fix looks good to me.

> :
> : The patched userspace test passed all six cases on an existing
> : x86-64 6.18.57 kernel, with a PID-namespace adjustment. That kernel
> : predates ca5480fb53fa, so this checks selftest behavior, not the
> : intended kernel's procfs changes. Separate syscall tests on that
> : kernel confirmed the EXEC-merging and memlock failure cases.

I'm guessing your bot was using personality() to make the tests fail.
Again, I'm not sure we should handle such use case. Should we?

>
> I said "no, do it yourself" and it came up with the below.
>
>
>
>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: selftests/proc: handle personality and memlock constraints
> Date: Sun, 01 Nov 2026 10:55:37 -0800
>
> Alternating PROT_EXEC does not keep the test mappings distinct when
> READ_IMPLIES_EXEC is set: both protection combinations become RWX and
> adjacent mappings can merge, breaking the fixture's layout assumptions.
>
> Populate each mapping writable, then make odd mappings read-only.  This
> retains anonymous pages accounted in RSS while keeping adjacent VMAs
> distinct regardless of READ_IMPLIES_EXEC.  Restore the corresponding
> WRITE-based protection selection in the parent.
>
> Restore the whole three-page destination after remapping, rather than
> replacing only its middle page and relying on the remaining anonymous VMA=
s
> to merge.  The remap test no longer compares RSS.
>
> mlockall(MCL_CURRENT) checks the whole virtual size against the locked
> memory allowance even with MCL_ONFAULT.  An insufficient allowance makes
> the child exit before CHILD_READY, leaving the parent waiting until the
> test times out.
>
> Pass the locking error through the existing shared state and signal
> CHILD_READY on failure.  The parent reaps the child and releases the
> shared state before skipping resource or permission failures.  Check this
> status before opening the child's proc files, as it may already have
> exited.  Unexpected locking errors remain test failures.
>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Jann Horn <jannh@google.com>
> Cc: kernel test robot <yi1.lai@intel.com>
> Cc: Liam R. Howlett <liam@infradead.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Cc: Pedro Falcato <pfalcato@suse.de>
> Cc: Usama Arif <usama.arif@linux.dev>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> ---
> On top of Suren's v2 "selftests/proc: use RSS in
> /proc/pid/smaps_rollup tearing tests".
>
> Tested the userspace test on an existing x86-64 Linux 6.18.57 kernel,
> using a separate PID-namespace adaptation which is not in this patch:
> - All six cases passed normally and with READ_IMPLIES_EXEC enabled,
>   using DURATION=3D1.
> - All six cases skipped promptly with RLIMIT_MEMLOCK set to 64KiB or
>   zero, exercising ENOMEM and EPERM respectively.
> This does not validate the intended kernel's procfs changes.
>
>  tools/testing/selftests/proc/proc-maps-race.c |   49 +++++++++++-----
>  1 file changed, 36 insertions(+), 13 deletions(-)
>
> --- a/tools/testing/selftests/proc/proc-maps-race.c~proc-maps-race-follow=
up
> +++ a/tools/testing/selftests/proc/proc-maps-race.c
> @@ -174,6 +174,7 @@ typedef bool (*vma_mod_result_check_op)(
>                                         struct line_content *restored_fir=
st_line);
>
>  struct vma_modifier_info {
> +       int mlock_error;
>         int vma_count;
>         void *addr;
>         int prot;
> @@ -696,7 +697,8 @@ static inline bool remap_vma(FIXTURE_DAT
>
>  static inline bool patch_vma(FIXTURE_DATA(proc_maps_race) *self)
>  {
> -       return mmap(self->mod_info->addr + self->page_size, self->page_si=
ze,
> +       /* Replace all three pieces without relying on anon_vma merging. =
*/
> +       return mmap(self->mod_info->addr, self->page_size * 3,
>                     self->mod_info->prot,
>                     MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0) !=3D =
MAP_FAILED;
>  }
> @@ -757,22 +759,31 @@ FIXTURE_SETUP(proc_maps_race)
>         self->pid =3D fork();
>         if (!self->pid) {
>                 /* Child process modifying the address space */
> -               int prot =3D PROT_READ | PROT_WRITE;
>                 int i;
>
>                 for (i =3D 0; i < mod_info->vma_count; i++) {
> -                       mod_info->child_mapped_addr[i] =3D mmap(NULL, sel=
f->page_size * 3, prot,
> +                       mod_info->child_mapped_addr[i] =3D mmap(NULL, sel=
f->page_size * 3,
> +                                       PROT_READ | PROT_WRITE,
>                                         MAP_PRIVATE | MAP_ANONYMOUS | MAP=
_POPULATE, -1, 0);
>                         ASSERT_NE(mod_info->child_mapped_addr[i], MAP_FAI=
LED);
> -                       /* change protection in adjacent maps to prevent =
merging */
> -                       prot ^=3D PROT_EXEC;
> +                       /*
> +                        * Populate writable to get anonymous pages, then=
 alternate
> +                        * write permission even with READ_IMPLIES_EXEC e=
nabled.
> +                        */
> +                       if (i % 2)
> +                               ASSERT_EQ(mprotect(mod_info->child_mapped=
_addr[i],
> +                                                  self->page_size * 3, P=
ROT_READ), 0);
>                 }
>                 /*
>                  * Lock all present pages in memory so memory reclaim can=
not
>                  * change RSS during the test, and use MCL_ONFAULT so
>                  * mremap() expansion does not populate new pages.
>                  */
> -               ASSERT_EQ(mlockall(MCL_CURRENT | MCL_FUTURE | MCL_ONFAULT=
), 0);
> +               if (mlockall(MCL_CURRENT | MCL_FUTURE | MCL_ONFAULT)) {
> +                       mod_info->mlock_error =3D errno;
> +                       signal_state(mod_info, CHILD_READY);
> +                       _exit(0);
> +               }
>                 signal_state(mod_info, CHILD_READY);
>                 wait_for_state(mod_info, PARENT_READY);
>                 while (true) {
> @@ -799,6 +810,21 @@ FIXTURE_SETUP(proc_maps_race)
>                 exit(0);
>         }
>
> +       /* Check setup before opening proc files: the child may have exit=
ed. */
> +       wait_for_state(mod_info, CHILD_READY);
> +       if (mod_info->mlock_error) {
> +               int error =3D mod_info->mlock_error;
> +               int status;
> +
> +               ASSERT_EQ(waitpid(self->pid, &status, 0), self->pid);
> +               pthread_cond_destroy(&mod_info->sync_cond);
> +               pthread_mutex_destroy(&mod_info->sync_lock);
> +               munmap(mod_info, self->shared_mem_size);
> +               if (error =3D=3D ENOMEM || error =3D=3D EPERM || error =
=3D=3D EAGAIN)
> +                       SKIP(return, "Cannot lock test mappings: %s", str=
error(error));
> +               ASSERT_EQ(error, 0);
> +       }
> +
>         switch (self->maps_file) {
>         case MAPS:
>                 sprintf(fname, "/proc/%d/maps", self->pid);
> @@ -815,9 +841,6 @@ FIXTURE_SETUP(proc_maps_race)
>         self->maps_fd =3D open(fname, O_RDONLY);
>         ASSERT_NE(self->maps_fd, -1);
>
> -       /* Wait for the child to map the VMAs */
> -       wait_for_state(mod_info, CHILD_READY);
> -
>         /* Read first two pages */
>         self->page1.data =3D malloc(self->page_size);
>         ASSERT_NE(self->page1.data, NULL);
> @@ -842,10 +865,10 @@ FIXTURE_SETUP(proc_maps_race)
>         for (int i =3D 0; i < mod_info->vma_count; i++) {
>                 if (mod_info->child_mapped_addr[i] =3D=3D (void *)self->l=
ast_line.start_addr) {
>                         mod_info->addr =3D mod_info->child_mapped_addr[i]=
;
> -                       mod_info->prot =3D PROT_READ | PROT_WRITE;
> -                       /* Odd VMAs have exec permission */
> -                       if ((i % 2) !=3D 0)
> -                               mod_info->prot |=3D PROT_EXEC;
> +                       mod_info->prot =3D PROT_READ;
> +                       /* Even VMAs have write permission. */
> +                       if ((i % 2) =3D=3D 0)
> +                               mod_info->prot |=3D PROT_WRITE;
>                 } else if (mod_info->child_mapped_addr[i] =3D=3D (void *)=
self->first_line.start_addr) {
>                         mod_info->next_addr =3D mod_info->child_mapped_ad=
dr[i];
>                 }
> _
>
