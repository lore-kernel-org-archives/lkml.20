Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794275808;
	b=eHrAQgZUmGbkV8S/dwBMGxnA3TQVQKcoW111vexKGqUyGIVR15OPO0Tls+7mL3NgpT65
	 CWyfmcK9ago/+XRK4GMf7grpItJAtiqry9r9PDducQKBqGjmezRnzgeu9IV7Cvkbggu90
	 kfNHyBvfEW5OWquEqbhtwQ46naqwU6I2Sylz5FX/a2PFFd7OZSPaq2w3SOXyeRdW1uWJl
	 G1pLakOipKxfz6LTRgyW2UmdTiBSpYoiUHg9soAe44CSBzvKA8SHYoRBdSWFFB6rn4De0
	 vL0z4ggk2PsyvdKQePPkgSH1ZL34OquBoOS8cnofHcPW5nUcffv2eBAWqtl0truKhaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=JbakGCdwV5qpAwLGOE90VqoCbCgS7wKjO2o9q31qnJc=;
	b=sTe/JrOxGBzBuvjLzT5S6R91X6lwGEUv8WSgozWkxolAuvHX2bPBqj/z+SqUTRXfpQAk
	 dNgqgxRcL346PDw34KDbKAlpRK0mwQpuzgIe+l3b2V1GfxQbkyXfVr87HK7iunPhz1SSA
	 azN5EpFotxmE1M+ddqYzIA+hG37CI7BsPTwzNw/vE/bt48RGBJD+SU7gbR6d6E0keEOj7
	 967fDIWz2GrZsTP13a2OXAUP3lD1tDiym+vdGHNB2oKKLvnzOoSeGn4FxIQkrikLF92Vn
	 0m3sW17Acvr7ceVWeutvZcurmwr2UMeHKlVnR+j1fjq8I5umSIPd1az8x74cjyKmpKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="fsKDE7/j";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F7606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D8F7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fsKDE7/j
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8241a56cd70so975250a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:56:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794275807; cv=none;
        d=google.com; s=arc-20260327;
        b=UdmWyXlZmW3A86/KYibWUXkYzpNEmgsjuYIFZMjhfiCecDRSto3upwr/whXi3AKnZl
         xUcs/UGaUWhZ+jhggI/HajCS/5VWivU0QEBBWdXk0Mn4b5U0nb3KAq4SipSYMM3+86vj
         E2eyKCJErVF4/gDyq8penw2Dx/btBs8TaMvTzowmZsElWjEBtTBUuuPVb5kICXSEHQoB
         qN3G/5sb1fUBARmSEGbBewEvmEIT4U+AZyGkfinuFbTE4mPdE/OKxg8ZZpdkTmfFTg1v
         tkwhHIga+lN2UMQN8dYVqMliwNwMwFSdYzrXURBry1Ow1z7Nzh7z/xBOuccAlGP/9emg
         e5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JbakGCdwV5qpAwLGOE90VqoCbCgS7wKjO2o9q31qnJc=;
        fh=4+16NCFUDyu9qiGjd0yIqLdlfpAxRxFocpA5kQwYjuA=;
        b=omS2GJ/i0PVcUlzRL6SjoWRSRJ1/KFG/CaekU5eE6PzDcSpcrQgz0IgzNVSzvpNtey
         ievOLDs7cA5ApvdIAsc4Yz+thpnI/rVHVw4/7BDG72zkv2dRM2ckD1U3iTtD44+hRwoO
         1Dau7XjvuwxJVwailzK2VQNQ5lxplmc4sIo4BPi0G5bvr+Bgq3d4/B3sQ5zPKOhATQnS
         MvGWLWqHj8G/nbQGujZSb1KgQTU5qe6RSzpeZZNdx0b1cuFlxUZZaRW9nNpueppOTh5l
         +dqaBXZX1opVpxphrG1J/0tig6BeL8JFKufjfLvRE/AQSw6yoUqnffDKSO6+DjmBu1+0
         ESrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794275807; x=1794880607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbakGCdwV5qpAwLGOE90VqoCbCgS7wKjO2o9q31qnJc=;
        b=fsKDE7/jTghV0E+ROc5iq94ENiBRke59YeDwLR5DjFxpIgJN+gBlurySwmkGuzSkIW
         8lvbE8RegIghcm9ZctCkUsyyEULKf5aHhVnifFptTJT9mAkuNrf4KQkCtsHJGMy3xRw+
         nBtlMImjRmG9AuWSHy5TiqUHsERctZ6if9BOXsDLvqOuwpODX2JKeYm5CDPXNCJ1a8jZ
         zDYW1Y9PknBvhCH/cB7P/ySpabNuEniy+AElJ+SmpmpCHodtGw9odu7WiPcCr7gEYsEj
         +/lUSNIZ4+lQA1qHc98q6xt+YX/RjihR2RiO/KstZQEPmBve6PViIOZ2OHro4iOzE0WT
         S8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275807; x=1794880607;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbakGCdwV5qpAwLGOE90VqoCbCgS7wKjO2o9q31qnJc=;
        b=DkGlag1yCnCILeH3YNYflKCXunHCoUzlbdjmWDoYEa1FoIgYBZkuWlkhor4Bingqh0
         2v4WVvrcKIZeND4jqLZAQR4fE9F20ykXLoFv2piEgOpkUVwUfZsdjvmqzWfA+ZmrQLvP
         G4xBfHDA9gO2twijS80I3tn+In4VqWtO5HKiArC0gbzoGjiEGijfh15cMKjKuga1NwVC
         JlxqbHlbI2Zny4iXCmX2stkhfhWXNc+JtJ3xO/jjUtj8mFesyjyMNNmbYAMQbwMOoKkO
         8VOx6VZMlQCp3XdSdtDmSqBHECzkQ1u7JZQkwTVN3+YO6STPm0eDgnfO0DZnCuOpGXPJ
         afgg==
X-Forwarded-Encrypted: i=1; AL+hErEc4fPz1ChQwj5dgw2sZ22dsD+oqrQ6c95aQyIzhFjfbc/OXRfVtKfi+A7F6Z22uD3v3/a2sT37hD9iP6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S/SHnjM9b31/XKQgB0VSwO5gz19ZEzrGMDLyn3L2DX3s7nePm
	AQPsqU3FHShDpkEMHTaTfV+p9dPzvLb/tn9Xmklka4KdZISaieAQmTNbDvP/ba3EI4ip6YwOooL
	y8sk/NwSH4LLXx+8ZnM59qhn6bhT00cEWZjdJp3j+g70l6r32lGJSxczMmA==
X-Gm-Gg: AYBFou2k4fIrjSCYJbZGS/TS8OQDP5qPwNgml6pGzhneYwx2oBcF2UR1UyuXNEzwgDB
	i/9GngEyaOQpiEAUMzKVJvPCPf5Q6FkIvUGzQvXSS/ZRocLmMGUzPLdKgWOUhWRqbbarLgRRpg7
	Kqu+GYhnWsvv3+APzipgjLDvuAEIKKBMcDyPSPM+R2oYU7Z2H+mMwpd3LJfFTgifbxLKXIAT48v
	PbqN/gyVy0i60qb2RPYqoZnf5i6ed3oSGpfitAnipGwbh16x/XRezwPDhILo1/94fqKx9AT7VLV
	BZxquA3s93gcRvaB/CssjLUQ69MmHpQ3BVth9E72DmM3d7F9H6UuAdilw8jipmS1xA5/pL560TS
	yKUzVw93bkH630Hj5V53Gmz/SDSpaRHGlhiCK3R3hxn8=
X-Received: by 2002:a05:6830:914:b0:815:40bf:e777 with SMTP id
 46e09a7af769-860dc76a4f2mr1108016a34.13.1794275806867; Mon, 09 Nov 2026
 17:56:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260623083551.86021-1-cuiyunhui@bytedance.com> <CAEEQ3wkOOLbFrRRyvLtJdwLFfmTOHdacX3zX0b-=vzipwsJcbg@mail.gmail.com>
In-Reply-To: <CAEEQ3wkOOLbFrRRyvLtJdwLFfmTOHdacX3zX0b-=vzipwsJcbg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 10 Nov 2026 09:56:35 +0800
X-Gm-Features: AclHuK_LjJHZQyLvZCezKPUxO2MW3wuz6t45CexphTMhH1tJQIdH8kW5C6PUMKo
Message-ID: <CAEEQ3wmx8+sffLDbWSOCndyTdRL8GB_CXQskkEF5M_3bKYzkZg@mail.gmail.com>
Subject: Re: [PATCH] riscv: uaccess: Add a fast path for small aligned copies
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	cuiyunhui@bytedance.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 5, 2026 at 11:48=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.com=
> wrote:
>
> Hi Paul,
>
> On Tue, Jun 23, 2026 at 4:36=E2=80=AFPM Yunhui Cui <cuiyunhui@bytedance.c=
om> wrote:
> >
> > The scalar user copy routine currently enters the word-copy path only
> > for copies of at least 9 * SZREG - 1 bytes. On RV64 this is 71 bytes,
> > so common 32-byte and 64-byte aligned user/kernel copies fall back to
> > byte-by-byte copying.
> >
> > Add a small-copy word path for copies below that threshold when both
> > source and destination are SZREG-aligned. Unaligned and sub-word copies
> > keep using the existing byte-copy path, and larger copies keep using th=
e
> > existing large-copy paths.
> >
> > This is a generic usercopy improvement. One common case is Linux AIO:
> > io_getevents() copies 32-byte struct io_event objects to userspace, and
> > io_submit() copies 64-byte struct iocb objects from userspace.
> >
> > fio libaio randrw three-run averages improved:
> >
> >   baseline:   read 560k IOPS, write 240k IOPS, sys 68.60%
> >   this patch: read 593k IOPS, write 254k IOPS, sys 69.03%
> >
> > This is about +5.8% read IOPS and +5.5% write IOPS.
> >
> > lmbench bw_pipe with small messages was also improved:
> >
> >   bw_pipe -m <size> -M 16m -W 1 -N 5
> >
> >   size   baseline MB/s   this patch MB/s   change
> >    32       62.52            74.54         +19.2%
> >    64      122.57           155.31         +26.7%
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Just a gentle ping on this patch. Any comments?

Thanks,
Yunhui

> > ---
> >  arch/riscv/lib/uaccess.S | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> > index 4efea1b3326c8..2d78007f10d01 100644
> > --- a/arch/riscv/lib/uaccess.S
> > +++ b/arch/riscv/lib/uaccess.S
> > @@ -70,12 +70,27 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled=
)
> >         add     t0, a0, a2
> >
> >         /*
> > -        * Use byte copy only if too small.
> > -        * SZREG holds 4 for RV32 and 8 for RV64
> > +        * For small copies below the large-copy threshold, use word-co=
py if
> > +        * both src and dst are naturally aligned. Unaligned or sub-wor=
d copies
> > +        * are left to the byte-copy tail.
> >          */
> >         li      a3, 9*SZREG-1 /* size must >=3D (word_copy stride + SZR=
EG-1) */
> > +       bgeu    a2, a3, .Llarge_copy_user
> > +       li      a3, SZREG
> >         bltu    a2, a3, .Lbyte_copy_tail
> > +       or      a3, a0, a1
> > +       andi    a3, a3, SZREG-1
> > +       bnez    a3, .Lbyte_copy_tail
> > +       andi    t1, t0, ~(SZREG-1)
> > +5:
> > +       fixup REG_L   a5, 0(a1), 10f
> > +       addi    a1, a1, SZREG
> > +       fixup REG_S   a5, 0(a0), 10f
> > +       addi    a0, a0, SZREG
> > +       bltu    a0, t1, 5b
> > +       j       .Lbyte_copy_tail
> >
> > +.Llarge_copy_user:
> >         /*
> >          * Copy first bytes until dst is aligned to word boundary.
> >          * a0 - start of dst
> > --
> > 2.39.5
> >
>
> Could you please help confirm whether this patch can be merged?
>
> Thanks=EF=BC=8C
> Yunhui
