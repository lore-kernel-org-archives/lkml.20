Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839671;
	b=wj3d1k1E6WoG5+WrRSmEH4r7MB2Qv5hEL0dRdv99ORG8UqIvsCodu+XN0Nb5kCPLBRD0
	 6Je/1umFPvcocSHom0aR5J12Kkm90MrwaxmcrDf6DMszQOhHcyWxTrUqnMKXJxtkZA3Tq
	 /XtdGpYtAlLFfvX1xzhQMmQYuU60/bg4ks14BjohOOopILvkmR4S0M87W+33fiKwfd0dw
	 JEfi1if0W/GJVuSXSdB1h22D2IPuhLF8Fsq5L/QTt8fkm2XJcSpQNKlXYGIr2JeCd5gXQ
	 8CSu04QF8MgIZh0QQyDD32V3N0E+BgfpFgrELf0mJQMRd/YR83aouc9Rlcu2qSmUO1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839671;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Mk/nez9nenBsnQjciCAGiDdqXpw8qDo2kH67Oa3IArQ=;
	b=OI1Qjjs8OPVBBIJkurr6qHCqb7uE6/7SEmKxASOlg2aPAjOARBLSDQ8UelDTBaUGkZxz
	 AMvB2EptMRgIvYpfOcjnplg1/ndAD3syhDk1cdJf2Ne5sJCHHDnDKCPfgotwQ0L/NOfCj
	 aQRW/mXIjg5jzXlp6XxW3cTtezMSp8Mkl/AYhMK4c3sd6XDXr3DAKQUjBbxJbpDPqRihJ
	 goAEojoSnmY/G9m3thjGqrBGJYh8XwvDJCSthZDQjAw7ydNUiDbIYFDIIIm6v8FUj5ZyN
	 wqW13dRLa64CusEWTO0gb8Fc7jyk9C//auLz5kZLEy9y3HsXn1IsmG086OuWj/ry9hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZaU9S3g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F220D606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZaU9S3g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758DF1F01825
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792839670;
	bh=Mk/nez9nenBsnQjciCAGiDdqXpw8qDo2kH67Oa3IArQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GZaU9S3gSwPmSPqYPyU7A/QGTA46xOv0Jf6Z1AlwqU6cIs62wd+vrITEKX6siJTKM
	 kA8BDJozMYIOnfwk4NC62QHqpfodaTDvonpP+w/EyEhM6mit1r6P508M0/yYaZRKpR
	 ihXe87mHtg1uV1w1gCmTLBeoZfgWTrxWD4H1D/untTyY+x4z+chu4hIebbijAGtSKB
	 KVKPlKnWRP3HhMTFYeeBSvr9ugZxVQYclVPfUK4c9il4qxmbfb1yyoeI7HmPz+SIX2
	 nk2fUpeIfgPtOVDk0MS1SxX0sUd96nsaPJeGjF2+3Oo3n+zHW3A9n33OfCAoQW3Gkd
	 96Ch3x4lLhRSQ==
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f079a63b8so152265785a.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:01:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwCs1sALdWP105CkbkyKtZcrzjc6Aab3siyqvqxhmmvywuQjIfEt/Suvu/y/sqdUFA4TsFPkR2al2Rwlto=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOMsZmCcNS9gyFJs34/kLp5A49qa9+XJiWgs1DaotiBtsHEfRg
	aF6WpYHhAr7eBG710hE9vc0LF/EtexC0cGFwKwtytMqcKVWOr6ynKpictxwzfW+m3ph2tkwJ7aE
	ubptVlNrhRy2Gsg4tPlGuO8FCTmEbIV8=
X-Received: by 2002:a05:620a:262a:b0:93f:3863:268a with SMTP id
 af79cd13be357-940ef92bffbmr223374585a.37.1792839669908; Sat, 24 Oct 2026
 04:01:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260802074018.73887-1-baohua@kernel.org> <20260802074018.73887-2-baohua@kernel.org>
 <anCu3DOrXDeMrwi5@lucifer> <CAGsJ_4xM7mmv_Xa3g2mB_0gW0_VtYhMtwz0idgYLyoAYiHFmfg@mail.gmail.com>
 <anH3jVrBlUMLd-28@lucifer>
In-Reply-To: <anH3jVrBlUMLd-28@lucifer>
From: Barry Song <baohua@kernel.org>
Date: Sat, 24 Oct 2026 19:00:59 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w9eTngW4TbqhmgDgCW6ugd=3Thq+u8ufqJ1WX-c_4p=A@mail.gmail.com>
X-Gm-Features: AclHuK91tBy5WqlUSNbGFKdzZTc1OWL-WRH6V00N6zby1epMlwqFq2F3wTNVRPE
Message-ID: <CAGsJ_4w9eTngW4TbqhmgDgCW6ugd=3Thq+u8ufqJ1WX-c_4p=A@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] x86/mm: use VMA lock for kernel faults on user addresses
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, surenb@google.com, liam@infradead.org, 
	vbabka@kernel.org, shakeel.butt@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, zhanghongru@xiaomi.com, willy@infradead.org, 
	zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:46=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
[...]
> > >
> > > And finally - Willy is working on a grand clean up of this stuff _I t=
hink_ so
> > > you probably should coordinate with him also?
> >
> > I have no problem waiting for Matthew's work. It is the right
> > thing to refactor the duplicated code across architectures for
> > the VMA lock page fault path.
>
> Seems sensible thanks!
>

I'm not quite sure when Matthew's cleanup series will be sent.
Matthew, what's your plan for this?

Maybe we should send RFC v2 of this series on using per-VMA
locks for kernel faults on user-space addresses to collect
feedback across different architectures? RFC v1 only included
demos for two architectures.

We may need feedback from architecture maintainers to confirm
that we're correctly checking for page faults triggered by
kernel-space accesses to user-space addresses.

I also think the cleanup series might need to take this
requirement into account. So, even if the cleanup series hasn't
been sent yet, it might make sense to discuss these changes in
parallel=EF=BC=9F

Another suggestion I made earlier [1] was to wait for the writer
to finish and then retry acquiring the VMA lock, rather than
falling back to mmap_lock when lock_vma_under_rcu() fails on
the first attempt. I guess this is also something to take into
account when working on the cleanup series?

[1] https://lore.kernel.org/linux-mm/CAGsJ_4wXGf90BMoJp3_z8G4fMTAgED88RXvbp=
6C4Gf+iy_2nvg@mail.gmail.com/

Best Regards
Barry
