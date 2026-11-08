Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794103555;
	b=4m+EDReroEwpJqV+lkoFMYOS1O/CI38dBvXmCQk/m4XL7OpoeQuk2gTMxYmKXG1/GVLw
	 gyWuLpuDaH+GpVKh5W06tof5zXsgsgHdEahXaC5l9O+LSY6nyCk7xYol8oX5ERhAn7uhK
	 FnJd7UhJhHptCvcr4C6/5pzbZxIUuZ4eR78/1FcdMgbT9/mo4mW4/CRvCWj+IY3pr4SRv
	 EHve8PpIY3/3U3PYQ5WKYbIZZSFD+UmG6OGoMaU0UGylTjxQMm226nrWokkbag6tHe6VS
	 mHzBSCGpElJ6/vLu56QlR8WtLC6YIGkRhDTy4XHU/zqLAO+TegMI6c6fswAr62Nekfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tZ3cb3vI/JlKWC9M4GlF0iTBKf/jfDE7Mio5RIYSa5U=;
	b=Pb7Zlp/aSuUbAOmoMXFEJHow3epQG+pSmAaRAEL9jx9M3xcgIjM3KdkoksSCrjfjHBsp
	 oxDz16zdNespj4tVpv55rlqk3iPRicE2LI2bGA3Da41PIWplymhdDQY0DbcNIMD4v2Rtf
	 sAMSTCe0EoeYILBrjFKlEHtrER4DWwCmgUlrm/tVqdn08YCTYsHhCaxThLqn7a+RFPUFx
	 wXSWN4EjUnZIkBcN6Lx+6MBbkyYoL1Qrvr2duwzqL2afL3FoZg6MSEGlyRlzHUbQ+38Km
	 2eaZv9TH4+fXCLhloPvKQ5oJJ/9jydzR28ltIE6KDYtI+YGXyh521agdLLz84HUVdvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="MJ/1Ibx4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CAB606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4CAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MJ/1Ibx4
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-54492d8a988so4011cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794103554; cv=none;
        d=google.com; s=arc-20260327;
        b=bxhyk16MpV6lEZ3xOHerG0PjCXu0rvwx2RaZWt2VbIFK8DN5wxl1uyl7njyoow2n5o
         DrvTfjzRE2mwZNsOMS5yddigW+2OrWOGvDSuZmqAG1mb8Th1TdlA0yyzG4+5+t6l5QV6
         tz3ogUWy3omqt8z3hHtoSNyL0AcjrfXFIkwkbAosN7mDM6AI60g9c8XEtAuciyFToZEi
         Y+7uMjP7OpRMAdbAi5cbRIdzANR1mKVCuf0+rphAEFeoW4UmkowlbFnyd6rLhvkNjuIw
         mLCwb4RKYP2C2huUT8KvvdR/D3SAD1I9xtsQhkI210y3qYZPsrohpFAXY8OfEHKRGzZM
         MC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tZ3cb3vI/JlKWC9M4GlF0iTBKf/jfDE7Mio5RIYSa5U=;
        fh=wMt+eI/Qfrervk20kit0Yh1Sz4X7sRLNR3p8mvzPjUI=;
        b=choM/hvyNOrJouti+Ai6GIiL5CF/rg7nvcjmMl9prITzP+Sd2n/jb836L/oN0X9xm0
         29nXpSygkWCSVjG7hFrZCQI0nyUaI4jeT0K0yuoYyjtUr05x59ofvvOVHceQpDj9EW8P
         waSBcPTcm+Z81j5Oc4i6cqzAga9Hp+eGBWGkdOiYi+bsCXb0KQGH78LpkErQLK9gt2zn
         ofc9qFfNq4Q+BSDMOQzh8r3H3Ir9PWs5K/aGmpnBa5/BYbA7EuSxq5Q1XwLt6ktQuEys
         SS6RSP1yCRA77CU1Pe3zFieKEcbZT6rm/jB4+gu5SQmGtXMDGicqJoJLr3GFfVIOI8D4
         A0SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794103554; x=1794708354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tZ3cb3vI/JlKWC9M4GlF0iTBKf/jfDE7Mio5RIYSa5U=;
        b=MJ/1Ibx4MRXOoHfCnbQZWAsooIeSes1u0+UMoGyLb6wTjaVQx8MdMmYkbACiGRXNhF
         uA5drA4ibOPWALRnQPVfrAEVxcqXAQP41xNsHuTQpFjWi4bZcgviqRv0bQBgtn7abINv
         Ek4dP/76sp+PMdvTYdR4PFrxlszk+2mSTe1Vk690+iwx5t7agu1bSwJDo0gFk6bOC5Ix
         kiJL3DeagoyYuNOBLAZ5skF+KnfuXoRpeAWdbD6DBnWx+ct4zlFp4kPxAtcO19ceOhkB
         hp+F4z/y4HQGje5i6xoYoitKqvc1DgUUU/0PU+EwvGYZKiLug5MWJ01usijtLyUjCnxR
         jKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794103554; x=1794708354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZ3cb3vI/JlKWC9M4GlF0iTBKf/jfDE7Mio5RIYSa5U=;
        b=JiSVgbDBULwI4rETXJib7gpNdVH5k/hrNoYKXPtpd3JSHNQxFhr3GzFqOAeE2WzGY2
         qUkdfJyFLnX+cVNmsR+Phm5Mqi0HP2aZU4BpzanFwR8K4oNkkjV6a+Ld/UZ1OKfJ/3G8
         lt/XeznNna1xaUfzYYaEU3D3oPhi+fDAF+m3cIw01DGwgPR6kUvnekqUnFA65XBtFQwG
         52rSknIDMj4wFKJRJz8HEVONrw7Uuoa5erOiLR9H6+ZVQBzsDDv2I3YhmPQqxkNk/oaj
         0e4e7cGcCijZRKyPH2Oyog/zoi95wMmYQwG7Ow11wp0BRdr+3EfaCCtIMpBffMSvxZI1
         nAtA==
X-Forwarded-Encrypted: i=1; AKwUvByzJ+dPDK1Nc4VwaI1XBN9fRdx4nK+EiYeeY3McqeNxQNQBR7+w7M8RAdtlSN6OK19865DKXZYC3XUc9MU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IEJb9jQLwIkYeSCo2Jq3yzrL4LSfhzAYvbaKes1xbUZaKGeuu
	4EOhSjWPG+DOQq4/jZXt/9/yT27M16CeMRduFFG9SDUhoc9/fWySyS+XkzQY2WRgayC7f5p4lE+
	yT3o1sj138qyuu7uM0ugLffph2XLDLRE3WCODdh2U
X-Gm-Gg: AYBFou1pReDDQQmPuka9w0k+w00hfM846zmQQ7fpVIMFeUDmkYUaBwtL8BZ0sLS/1by
	tUoelemjmnCETxrYZQFz+29ltLRw6OVwTBG8TcbIP82JXafHzfV697PDLjiiKmoQdScGKV2LChN
	pAIWgns73KI387Ni1e7kQditfCHknsaJHifV7CL+xt2R+/ZmG1IRHXmkEcKpO8dxGL0vwE2Qner
	dGt06Lyusv1VuVqSk3ky3WGyVjcLxdYRM2DKwz7rfq0bFXiRx4FQl8TzTQfD3O7I2cqcdkK/Zz6
	ZV82xQ6JrYHs30vpvGOvZLf8Wut+aocYjGiXwQrw/k5HDA4nBFsQVX+s9LtfuJnDUUMX0qvjTZa
	WWo2Nz+wY7DLH/SiMUqXJh5w9U717m4Niqw==
X-Received: by 2002:a05:622a:8842:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-54f9de1134amr17137481cf.1.1794103553216; Sat, 07 Nov 2026
 18:05:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004195027.227748-1-danielmentz@google.com>
 <92758f79-d5b7-4c15-a55d-6bea5f84a028@arm.com> <CAE2F3rAJdC9pAqMKcXhxpw1keGzH_kQUNBoPHXjTP8+7TOhfwQ@mail.gmail.com>
 <ae8db5bf-9f9e-4f0d-afa1-91718323568e@arm.com>
In-Reply-To: <ae8db5bf-9f9e-4f0d-afa1-91718323568e@arm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sat, 7 Nov 2026 18:05:42 -0800
X-Gm-Features: AclHuK9EOG_P4byoqFnHT9I6oYEPYHsXYF7yVIBFj_Z2u0jA_efLpQYmTCcKiXc
Message-ID: <CAE2F3rCocgqvmfhALrdo2VfLuyt0=oQD0zFUKLb5E+0deWgEqA@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, will@kernel.org, joro@8bytes.org, 
	nicolinc@nvidia.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dawei.li@linux.dev, jgg@ziepe.ca, praan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 9:40=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 05/10/2026 10:26 pm, Daniel Mentz wrote:
> > On Mon, Oct 5, 2026 at 9:42=E2=80=AFAM Robin Murphy <robin.murphy@arm.c=
om> wrote:
> >> This still isn't answering the question of "why?" though. Yes the
> >> architecture says some things, but if we were strict about avoiding
> >> mismatched attributes then Linux couldn't ever support non-coherent DM=
A
> >> at all! Similarly while the architecture does permit SMMU
> >> implementations to be picky about their output attributes, does any su=
ch
> >> implementation actually exist at all, let alone in a system capable of
> >> running mainline Linux?
> >
> > Fair point that existing implementations have been forgiving in
> > practice. My thinking here is simply that a small, self-contained
> > cleanup that brings the driver into line with the architecture spec is
> > worthwhile on its own merits, even without a known implementation where
> > this currently causes problems.
> >
> > This is really in the same spirit as your commit 7618e4790982
> > ("iommu/io-pgtable-arm: Improve attribute handling"), which aligned the
> > attribute handling with the architecture specification on the basis
> > that:
> >
> >    "Although the SMMU architectures seem to give some slightly stronger
> >     guarantees of Non-Cacheable output types becoming implicitly Outer
> >     Shareable in most cases, we may as well be explicit and not take an=
y
> >     chances."
>
> That was more about being self-consistent and technically compliant with
> VMSAv7, which again is not relevant to SMMUv3. In fact if we _only_ had
> to support SMMUv3 and not arbitrary other io-pgtable users then we could
> point to 13.1.7 "Ensuring consistent output attributes" to prove that
> that change would not have been necessary.

If self-consistency is valuable, that is really one of the main
benefits this patch offers. Right now, when ARM_SMMU_FEAT_COHERENCY is
not set, the driver tells io-pgtable-arm to configure translation
table walks as
iNC-oNC-OSH (via coherent_walk =3D false), while configuring STE
fetches, CD fetches, and queue accesses on the very same SMMU as
iWB-oWB-ISH. Aligning SMMU_CR1 and STE.{S1CIR, S1COR, S1CSH} with the
page table walk attributes makes all SMMU-originated accesses
self-consistent.

>
> > As I noted in my reply on the v1 thread [1], under ARM IHI 0070
> > (sections 3.15, 6.3.11, and 13.1.2), a non-coherent SMMUv3
> > implementation (SMMU_IDR0.COHACC =3D=3D 0) in which every SMMU-originat=
ed
> > access configured with Normal Write-Back, Inner Shareable attributes
> > fails and records an External Abort (F_STE_FETCH, F_CD_FETCH,
> > CERROR_ABT, etc.) is completely architecturally compliant, yet wouldn't
> > work with the current arm-smmu-v3 driver.
>
> Sure, and another system could only support iNC-oWB, wherein this change
> still wouldn't work. If you want to argue against making assumptions
> about the implementation/interconnect, you can't simply make a slightly
> different assumption about the implementation/interconnect ;)

I don't think this is trading one assumption for another assumption of
the same quality=E2=80=94it is removing an assumption and strictly increasi=
ng
the set of supported implementations.

Because io-pgtable-arm already uses iNC-oNC-OSH for non-coherent Stage
1 and Stage 2 translation table walks, the driver already requires a
non-coherent SMMU to support iNC-oNC-OSH. Before this patch, however,
the driver additionally assumed that a non-coherent SMMU also accepts
iWB-oWB-ISH for table and queue accesses and silently degrades it to
iNC-oNC-OSH. By using iNC-oNC-OSH consistently across all
SMMU-originated accesses when non-coherent, we drop that extra
assumption rather than introducing a new one.

>
> In fact for maximum fun, you could even have an interconnect that only
> supports the iWB-oWB-ISH type, but the SMMU is still non-coherent since
> it's in a _different_ inner shareability domain from the CPUs...

I'm certainly not claiming that this patch adds support for every
conceivable interconnect design (and such a system wouldn't work with
io-pgtable-arm's non-coherent page table walks today anyway).

>
> Yes, 13.1.2 "Attribute support" says that the system may not support all
> memory types, and unsupported ones may abort, but then equally it says
> "[...] the SMMU is not required to generate attributes that it does not
> use. With the exception of R/W, INST, and PRIV all configuration fields
> that affect unused attributes are IGNORED." And this is why the
> mismatched attributes argument doesn't stand up on its own - without
> knowing the system-specific details of exactly what is being ignored
> from what we think we've programmed, how can we say what the actual
> attributes used to access memory really are, and thus what is or isn't
> mismatched?

It seems to me that our goal for a generic driver shouldn't just be to
support a set of known implementations that happen to ignore these
fields. Instead, the driver should follow the architecture
specification as closely as possible.

Thanks,
Daniel
