Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D654BF947
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719642; cv=pass; b=sjHxJLTFzVqBPTlXIba31ovfQ3w9EgqTJNoKNFyWtKPVecUqnvgFbmNExFPPLKMjoaHdkEV8DHXswMEQUuikQXn04POCanOK331pr2XNnYTAlGf0Qz23UXtDMtfY/5J2qjslDzJeGQJeCKoYGG2miC39bn+Zxckjx/RXHvDuNe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719642; c=relaxed/simple;
	bh=S/0xeeqml62b4hzIs2sGIOyHX0Y352/7mh8gz6dinRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKAutgLeTAQGTNFcTKcMlxHO29nKbyrl7uXn4KU08f7D5uqY0j+KixSUK4QV/m4C1Grz5IW19oGxBWDVCpbfBbu0OJ5sGjdwJW61UFmB1iSNc+QB5Wf6CImMvzEJbHvFZLS50EdIn5UnaF1KMUkSMK7IKDz8h28x4nDg6U4KhrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlSDInLj; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlSDInLj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so2767505e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789719639; cv=none;
        d=google.com; s=arc-20260327;
        b=b99Su4ci2Ijs3SFzQ5dQFuGmpKF6SR7bcihz0xcTw097UyzEHpSRgOv5LPdmo0EL1q
         ywYiWOsklb4Ox1hzFx94qnNV+jqMtfF4VNevo5cB7mk7q6VPEJKWXIT0MPpLSK9VbSB5
         v+bTATRpoxk40eNF1Mn0Ub7KKodpT0DI2Rn2q2Kr5+eRXPTGhGorM4C3gDZSP6a5jlFy
         Y+cO6VmXMZ9zkZ+0dC7SV1nVXvMBxFSYyNOCbluF/aAJmGVyLlb8kHLROKNBEN5TsCLM
         X+M7EQXsiDzQNBTdg/S0Zq293/E97Q3PvjbeqbkI5kN5EPPjKmmqQ/YY4hSs6Jx0W2J+
         13VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/0xeeqml62b4hzIs2sGIOyHX0Y352/7mh8gz6dinRs=;
        fh=Dx00p+1loq/TouSaQyxzjxqPriqA5yWjdkvi5Q3ozmw=;
        b=NSlrbb69YTCtrcQA65FE1ynZTXhUW/qtf5HpA1IFYojqPuCkvZozAUHzdi5q56PdPX
         2zajg4zGOGCM+mGunL96Zvq8Oy4d+sMOZ96U12jwB0BnulxdXaokzL45bxjvg7fbtKvf
         Xys2enz2a8AB/zjNYDxysx/GCOLc2vX60BW2wpviSxi4DNBWZ7IhO74mInDcnOmE8Phk
         WkZozcewx/tASo6E8HFu/BpWW8Njdl3px8U1gSj0SroI3szj6WSkufmMDYBRDkBXTRSI
         Pw0yi+tI1jBqRM7qqWCORxJwd6K67beZnlEKfjkJIl+X/HtarUFInZmN/7Cinbn4wgUe
         1IwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789719639; x=1790324439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/0xeeqml62b4hzIs2sGIOyHX0Y352/7mh8gz6dinRs=;
        b=LlSDInLjkBJd9bK2wWGTd74aYpPwJ46JL3S1y3T/7iQRzdtOe5ysxq/m35mSE5BtwK
         1Ifve9Zsfc31/LOndH6X22DNAHvCpLHM5ZRC9LD3eY4KeP08Ov2jT47i0J0g3k06vjze
         TD2ExQWQ0MS4tjqg8AzhoV4n7/HltmPsesqh1UP2kAm3DftLAXBvJRhxhP624FIGFmWb
         O503G12OtD9YfxgFAQXJZfrzFtMAFc3vdADnvbU2ieU4TFZRPtXM50nZy5xA6qT9Cn6p
         5bFLMI4zlD0g9753XqUJ8lpUp1eSxsth6L8uAXmLmRFL2Bl1CJFSRNccgifLM4Y6URyp
         gZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719639; x=1790324439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/0xeeqml62b4hzIs2sGIOyHX0Y352/7mh8gz6dinRs=;
        b=OJtOGOKrdUetABjxmBzuS03Ji5oZQes+1FAFWVRQ2Ktqd/WX7qBZMTPKd10QDqolB+
         pbXHCSTSJGJc0wYv97k99MxNp6q3Ck2QlEhAJcCJQ8fG5iROHVcqIcMiEXh6J2roTPfd
         pQtZ2Zcmo/fqiG7dTUO/5olOO6AetUPVdmhcbyKm58sIqZWKEI59BKn5P9sDAz9sWOPB
         wqaj43Rf2TUuLkinESZ8fVoqBpE5eGiSPGlsJKrVNfzNhnPYLZpQVImPT8fMfSA0h9Pz
         TM6xSR8G08wXga5ql13sPSxq82cqJrQK26n2CTti5oHCDLFZC4J4OnMLjhhwOiRFVVa9
         v47g==
X-Forwarded-Encrypted: i=1; AKwUvBxhREokF8Yz08B96fywrgapB3azooFhyPWbypervVEFsCoN23CEUZMGiR6XfKsexqde+2a4S3id9uA3XgA=@vger.kernel.org
X-Gm-Message-State: AFuF++kA5hxP+13cR9LLpGf4JQ2Z2MZpvoOVw7DKcvZ6R8pMdemtGYcx
	eiqLZJ2bB6ipMn+s+bub7Kn/VuNZYSNAOkcO9zT1UqBCfc8BrxHgb3bd3an87hOY0xYXhLRIuha
	hokhbey35oCnN819bAAVWTCZCW24r8rU=
X-Gm-Gg: AYBFou2hMdRxsnMRqzFG2aiSsdwz7KUZfmwu+/naQSJ3CKmfjmNwRkA+HLBzBb8fXaD
	3/0xOvQQlT3WOCxxUQZJLEzK7m+4bNyN8lcnvSgnEZdci9M6kIBQIadJeBgzdRC4SKqdlYCQ1OC
	iEXog/uor6dA+oyWQpmCh9wXcbaOE07i31IELhh+mC0o+0gCvIsgVge/7SWvp6F8cZPDdyd7fkE
	zjgliPYR7C0xrHJDRYUrJqEIibfc2fBOL92gN4bt8XEJmPWbn/pEhDrefNOXbaSgiQNynLYrL9G
	UNbSkfiK/GX2/DbN/bHhfq8j8GTYUGJZfT7XV6+dUi1AH4ufP0l6OeJc
X-Received: by 2002:a05:600c:3493:b0:49f:bd3c:bc21 with SMTP id
 5b1f17b1804b1-49fc573b55emr19996295e9.28.1789719638568; Fri, 18 Sep 2026
 01:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-3-jiangwenxiaomi@gmail.com> <CAGsJ_4wDbDLv5mxfNiyraOS6tKCSV+g8xL5+SsRCyqLnN2ON7A@mail.gmail.com>
In-Reply-To: <CAGsJ_4wDbDLv5mxfNiyraOS6tKCSV+g8xL5+SsRCyqLnN2ON7A@mail.gmail.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Fri, 18 Sep 2026 16:20:26 +0800
X-Gm-Features: AcwNN1UdGEZgXXaGyHc-WLWsn9JkWUJTL9ur_osaBhDBGn4esHyfsGM8b6arOrw
Message-ID: <CAHKocdFCuFR-gYCrY-c0iRKZ2GRZJCnTJjHGe_TvMoYkjnb7aw@mail.gmail.com>
Subject: Re: [PATCH v8 02/10] powerpc/8xx: add pte_set_huge()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Sept 2026 at 07:28, Barry Song <baohua@kernel.org> wrote:
>
> On Thu, Sep 17, 2026 at 1:30=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.c=
om> wrote:
> >
> > From: Wen Jiang <jiangwen6@xiaomi.com>
> >
> > vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
> > by reusing set_huge_pte_at(), a HugeTLB helper gated by
> > CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
> > CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c to HugeTLB
> > internals it does not otherwise need.
> >
> > Add pte_set_huge() to powerpc/8xx, next to the existing
> > pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the hug=
e
> > PTE and writes it into the backing cells directly, without going throug=
h
> > set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.
> >
> > No pte_clear_huge() is needed: 8xx does not implement
> > arch_vmap_pte_range_unmap_size(), so the vmap unmap path never takes th=
e
> > block-mapping branch.
>
> I assume you mean the block-unmapping (or PTE-clearing) branch.
> Please make this clear in the changelog.
>

Sure. Will fix it.

Thanks,
Wen

> >
> > In practice PPC_8xx selects HUGETLBFS unconditionally, so
> > CONFIG_HUGETLB_PAGE=3Dn does not occur there today; this is a decouplin=
g
> > cleanup rather than a new configuration.
> >
> > There is no caller yet: mm/vmalloc.c is converted later in this series,
> > once the generic fallbacks are in place.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > ---
>
> BTW, this patch applies cleanly to the mm-new branch.
>
> Best Regards
> Barry
