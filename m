Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E19F51CF66
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790114412; cv=pass; b=ZWCx7FaUko7tl8Q/LIrUSUBnD24iKP41p9Nae01lpCgNc6Eo4WGuIHGKz3geCfi1Fpgu/ekdhTz/jKVfqAveT/SU2KRwYY8pTGYy22G01wYBiI5xps++wgegqV9opLruB/8x0oPqOHDl7dqK1yAybYobOclMkqbBwW8Q4bsGhF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790114412; c=relaxed/simple;
	bh=ufYQXGJZuHGQ7ri6XxMkbQ+1PTrWE8hzvkxJeWLIcK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHVs44gOGpae8H/ovXRxx6hlJpP/cfw1oFAuceYTgOt8yMMtljkhPEGMKUZULzcobHKx3oTsvujf38qy0Cq4RfFHd0hA9CL7p4rFg9SblA91oCDIe1DylNpL+sg3oRpLFs9tJggwIP+5Roy7B/Bmnir7SNw8EgaY8F/6KLveFPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YKF9oE+N; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UK4/bK2/; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YKF9oE+N";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UK4/bK2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790114400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mM0cgRvC/5kn7Lvpmed1628Qv8jGLnHSmTJkgn9H91Q=;
	b=YKF9oE+NNo6ecaaBAmYbAjEQp3GSOj8dnSarYpuwavx+gSBlsJFatWAfOe/kmPTpeT4kSL
	8Nf0adB8rWACDxqurknAFKpvBUV/av1b/JE0madoigBIbgKTuRdi+317Uersiluy/pj0jz
	4DIar7rCG1gJmfbzVwARL+HZKDrdIhs=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-75dpBrylP6WHnB3j_I9TTQ-1; Tue, 22 Sep 2026 17:59:59 -0400
X-MC-Unique: 75dpBrylP6WHnB3j_I9TTQ-1
X-Mimecast-MFC-AGG-ID: 75dpBrylP6WHnB3j_I9TTQ_1790114397
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-39d93d95a21so1715861fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790114397; cv=none;
        d=google.com; s=arc-20260327;
        b=hWevrVHRRAbae6FtNR7gBblkwI6j7AOdjwBYRdPShYm0mEGsoAAL16Wh11mgItDfq0
         Two0/FZxGdx60RdO26O/66sWT2apUnfkexSGZY+iBYSJMkKgwUw3n433ITe5uInH5hid
         43OOTS9cilyqCpkC4l2Smh+x6K4q3dX3CrwSf56yQCORj3pXEAFhgC5BG3IksxeXMUvs
         Q4I9yDOwbr9a8E+5V9g+RYseX5Qnodhmexk4gf36lB79Nasu+/KejcUXs4e2GIGrToPo
         X4tHrRg3kWDA/dTCDXL5Mxkdt/kSf1DyvIicJO74P3HLu+Ix/YP5lJ5xKa3aILld0CTM
         pDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mM0cgRvC/5kn7Lvpmed1628Qv8jGLnHSmTJkgn9H91Q=;
        fh=13xBLwl9x8llFU9lRVZi8DRJ664ajFtLLQamDBWAIOM=;
        b=dgYUxSaH/5pP9VoOwkLScXyrVT8bkQaWhd2GI2+En2Oz8PUTgCC/OlXpUuPt/g+KNO
         /FlvMElUc25JEpE5NuG0xuqTrIEAtM3PxfQ+i0ztJpO8zuCc4brKGXphnnt8JmQC5Ffr
         fpW1OZXiHZnPESahzwbrmS0gPyoMtRGYsghlRwf2bEZr1cm5CnBfaNNvq0lRM6CG+VAn
         e1C5TXEmDQerz7b1WJcALPU+9GSCqFJSnaNn2wbUB50PqzQKuSoEscuDU/NUc4zP1whg
         fpflATebfkhvIYhWBqgY37V0JANT4YjxeBdS5LaKt0FSZlvkAop/XHLZWWhcdirH0DGm
         v1uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790114397; x=1790719197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mM0cgRvC/5kn7Lvpmed1628Qv8jGLnHSmTJkgn9H91Q=;
        b=UK4/bK2/lyDxOV23xO+o90APpi/mCcrFdk2L8tslUYY/VdMeSMkNAHElShZ6+FAJmI
         g20ZBu6Q3T9MbvYzNe7LgxgrSuU5fwYHvrGzltE5K+qFG7CJ8CoxPpDU75wfzVoT62Y4
         dZ55sdzquf58Y4Lyk9fqXFyCzUxiHtyXBhNscJ7ZNl8rFDRdVbzrzHc50D3uyze4krVI
         W4WVOtDIDUEVzVbGricz0VALqjaWpS9DyvblCSw424iWEIJmuFPs5MmCBMW9Za5/tdUD
         q7dnZPiCWrCsadKszWFYTe/lv3wxg9qVnYDB6QW7oF13Yut3Qfxwc+1I2MacV+Fsf+X9
         AIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790114397; x=1790719197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mM0cgRvC/5kn7Lvpmed1628Qv8jGLnHSmTJkgn9H91Q=;
        b=yQld3WD2U0OJvOTvqHiTQ2qh1k9X08m00ZeQEwLYenk/n8Gd/LkUPPW7HOnT2Twi0j
         um9XgSZTiAIDfY9hTqfzAi2ARUkS2kT1X+gUVao1kahvyVk/joTXdJdFKNa/Zu3ekDMf
         D4OgnjEv6JFh3gFL8ujjdS25XrNdNQL83i3bB6xQt18p2buk8Tvcoq5oo9DQEd3GFfb6
         2K7DInZZmR7RQ1z/F7cqDlyWgz4MzIp+2Jlza6LDLyEnsLrFuexdI46PLWFj/AF6ARGt
         Djs8nxVDapEoy/nFZEcbLnGUzh6cmdYuEZyFYPoYGoL5rNWyHI7+rFQqFmspPjwtLcrg
         Bb3g==
X-Forwarded-Encrypted: i=1; AKwUvByw4VIFJBrwSZir1mFY86hWLA/Xk9XgMOdESdELhG3i3OGHc1sNFNZHi/SwF35SlD9NcQGqkvrqhPEMW/s=@vger.kernel.org
X-Gm-Message-State: AFuF++mfEw/I0DNnL8WhFL/h/QoXEQU5D829SZgWmW8eU/nuaGwQ+YWU
	EX1m+Qa/EI9B5Twt+pxeB7kZn4qtPgUrGsqZxkxUJ85cy6LxS8ljGVZsYkewQNfYpuP5bWKG4IK
	tsG1VJB8LU6vyJqUj/2Vxt+IetCvo3KW8XRkBbWU/bsVv1D9GfAw2/5YxXnmwfb46pisoFISCQ5
	tR9Ft25y/y1rHGlawYa5UQWF9uqHNtLhvw50OrdtoW
X-Gm-Gg: AYBFou2lB9AqGuS3SBumqHtFRJLVWDKTmedp+k9IYYhuib+bszkkOeAjCg18vx+x2MZ
	Z8epGB4hgWPRGhXPxlDWVAoVmu+kPA2gXQRP/xy0MSAPJQ4StFiCckiQp3eCS7UHpmetigUXuZv
	36CI8jsWyjgvWnqB7okKmy6r+xCljTR/c97mvks6pAXpyoUWIenylObEntWUoAIIIRCx9A5eI=
X-Received: by 2002:a05:651c:a345:b0:3a5:afec:9cf9 with SMTP id 38308e7fff4ca-3a630636639mr1373681fa.7.1790114397193;
        Tue, 22 Sep 2026 14:59:57 -0700 (PDT)
X-Received: by 2002:a05:651c:a345:b0:3a5:afec:9cf9 with SMTP id
 38308e7fff4ca-3a630636639mr1373541fa.7.1790114396764; Tue, 22 Sep 2026
 14:59:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <18102ABA-0D8E-4DA0-AC30-544E34E445D5@nvidia.com>
 <20260609172719.803537-1-usama.arif@linux.dev> <CAA1CXcA84BtQZxOpE0sWgb2ed6y3m0NLKkWD+5MfWS9eF5dqTQ@mail.gmail.com>
 <a464c20c-8b41-4264-b560-497ed91cbaaa@kernel.org> <CAA1CXcCsqkV2PrLicY5BnOMp+iJWJxsPn60g_3WXugWQqOFYpg@mail.gmail.com>
 <0b268070-95d2-45bd-aea3-56cefe01dc8c@kernel.org> <CAA1CXcCp0z0kw9pQtj55qNGOBJOpfDsrf1GJ+EhGZCfA+dhbKQ@mail.gmail.com>
 <004bdc87-8c8e-44f8-93c3-1ae0a47051a9@kernel.org> <CAA1CXcA50Lfeo+JkhhRc5b8TNzBETj8+z6iMVuqwUSJhyo2G8w@mail.gmail.com>
 <1da189ad-a7f6-42fa-a1ff-a26cc5e5c563@kernel.org> <16f9ea47-99c0-4483-a12f-190047c1411f@kernel.org>
In-Reply-To: <16f9ea47-99c0-4483-a12f-190047c1411f@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Tue, 22 Sep 2026 15:59:30 -0600
X-Gm-Features: AclHuK9WwgmixPJvrEj0pD6SO3OEeVNSFswDyCTO-YEmp1_v-PaHn2OEu8s3wfg
Message-ID: <CAA1CXcA1iREtxkZzwc8ib5h96DQzX627W3-gnRiafdjRG7BKrw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 2/3] mm/migrate.c: Prevent folio splitting
 from interacting with KSM
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, Zi Yan <ziy@nvidia.com>, ljs@kernel.org, 
	xu.xin16@zte.com.cn, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	usamaarif642@gmail.com, yuzhao@google.com, aarcange@redhat.com, 
	akpm@linux-foundation.org, chengming.zhou@linux.dev, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:52=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/25/26 19:34, David Hildenbrand (Arm) wrote:
> > On 8/5/26 18:27, Nico Pache wrote:
> >> On Thu, Jul 30, 2026 at 2:34=E2=80=AFAM David Hildenbrand (Arm)
> >> <david@kernel.org> wrote:
> >>>
> >>>
> >>> Because KSM takes care of it?
> >>
> >> KSM only takes care of it in the case of 'use_zero_pages' being set.
> >> If we stop KSM splits from reclaiming, we regain the intended sysctl
> >> behavior; otherwise, KSM splits and reclaims indiscriminately. The
> >> secondary effect is that if we don't have this toggle set, the split
> >> would still reclaim these pages. KSM then has to process those pages
> >> (despite them already being freed), wasting cycles.
> >>
> >> Your proposed solution works too, I just think its a more aggressive
> >> approach (stop all VM_MERGEABLEs from split-reclaiming, not just those
> >> that are currently being operated on by KSM).
> >
> > I think we should really just stop two mechanisms to compete entirely: =
if A is
> > active for a region, B is disabled.
> >
> > Not trying to follow "who split what" and operate based on that.
> >
>
> I took another look and there is just no perfect solution.
>
>
> Option A: don't let mechanisms interfere - if KSM is enabled, don't remap=
 to the
>           shared zeropage
>
> Positive: same KSM behavior even if some other mechanism decides to split=
.
> Negative: reclaim cannot free up these pages immediately (waits for KSM),=
 and
>           having the deferred shrinker split to then not reclaim any actu=
al
>           memory is stupid.
>
> Given that the second KSM run would already deduplicate these pages, I am=
 not
> sure how much reclaim actually matters.
>
> But taming the deferred shrinker is a bit complicated (no VMA available).=
 In
> configurations where the deferred shrinker will never trigger a split tha=
t's not
> a problem, but with lower max_ptes_none it would be possible to trigger.
>
>
> Option B: don't let KSM splits remap to the shared zeropage
>
> Positive: Fix isolated to the actual problematic part we observed.
> Negative: Different KSM behavior depending on who split a THP first.
>
>
> Assume KSM scanned the range first, and then the deferred shrinker split =
many
> THP in that area and creates shared zeropage. On the next KSM run, we'd h=
ave a
> very similar behavior. If KSM runs first, you either get zeropages or
> deduplication to a zero-filled page.
>
>
> I would not go down a path where we would let KSM skip THPs entirely.
>
> Maybe one could teach KSM about "the deferred shrinker is active, don't s=
plit a
> THP if we are to deduplciate the shared zeropage"? But then, whether the
> deferred shrinker will actually split depends on the max_ptes_non toggle.
>
>
> Gahhh so complicated.

haha very much so!

This might be the correct solution below, similar to your logic above....

static void cmp_and_merge_page(struct page *page, struct ksm_rmap_item
*rmap_item)
{
...
checksum =3D calc_checksum(
              if (rmap_item->oldchecksum !=3D checksum)
                  rmap_item->oldchecksum =3D checksum;
                  return;
              }
+               if (folio_test_large(folio) && split_underused_thp &&
+                   checksum =3D=3D zero_checksum &&
+                   pages_identical(page, ZERO_PAGE(0)))
+                       return;
+

Don't let KSM split a THP if it's a zero page (unless the underused
shrinker is inactive)

We also do patch 3 of this series, which disables zero-page remapping
if the underused shrinker is disabled.

With this I believe all edge cases and feature interactions are now exclusi=
ve.

I will retest. Let me know what you think, and if you agree, I can post it.

Thanks for taking the time to look back at this :) Sorry I've been a
bit MIA too, I've been focused on some downstream issues. I've been
meaning to review/reply to the high volume of khugepaged patches
recently.

-- Nico



>
> --
> Cheers,
>
> David
>

