Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744980;
	b=xY9k+7P2wp1vfKjThPTkC8UIyqqyEBu3ula3BTSGlAPurhK9cuFOjaPuCatJXnfZigYM
	 FAkmrtMtWFB0FHLlz7SIn0Ga0NZXHGtnvWlJYIx8jdT/aqmmnpsrVG1x/AVhfz6m/bRFQ
	 qlxWzg10qSTYB9PqAaB/eei3MV/P1pxW4V+crrRKKviP4WLd8t5wCrum8ne6WqYdusSiz
	 9aAAbX8BgOIIZ9YsvkmixNlBeGmtkgWzRYN2CPakAPSbdYfQ0dX8Gxz9WM/d9PK2T/vrw
	 J0mGwzGvJgJcvHCNR8xwCF/bN5FJ7x2IlZt/oaOWehLBPMZblzx2ZTHHXzVs05lFneQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744980;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9yd0hIlbkwq7u2rCedrmBS8yoEkO/MpIEVYX710z3cw=;
	b=YG5AHlNjYW1r1HsYoSw7RJYUBH2Rtc71coIOhnkHJaMeM83cOY60aNbhxShSkJ1xWoc3
	 g5ipKH3Ib3ntv25atqz7PNPkwnX2vKPZhUV/dGJ2rrN0fEEXe5QkEz98RAGRbv1tdQFp9
	 YrVmdzdcxSLue02ruRRAbdAinFHXEQzHKYcEYUwHgwPcWwrk9yAEKtaF+OZ/AHGQZ+6Sr
	 UPeSrnneIIqUM/ygzcQuGJ0KkgVDltHOli47P2BwaYElxPXouA6tZcgY3X0rOEC1OwWok
	 fh2pFShQbwR/1zoWLf/H8TgGRuDKDNj3XFC9HFpewIq4fFeQGrpWuu3Q/4azEUSqoLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SFhunwRC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717FF606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SFhunwRC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0112C1F01825
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792744980;
	bh=9yd0hIlbkwq7u2rCedrmBS8yoEkO/MpIEVYX710z3cw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SFhunwRCPeNjHajAHrGwKTK+vWXqBVeI70uS8WvuKZUGHuEdgoq0VjungF5I056FN
	 PtFK09qVsFMmzWJ+owHeha67SCHtzw1vqZiU6AVFD8qNtR5oXFKPhOjK7PwDvu1lfF
	 GWpHYAyxd/Xr6Wk7iSKkYcU7ehKHf8qxKvHMN3jPEG5VtuPdxplDBU80YY/ELeEnhM
	 9xvnyIzqdiL8r+Dra/DXAK5nIsY6IKw44mNVC5PpisS0Fx2w8Ek/SSA0fdHY57KO78
	 9mkJQ/jF2Rct/Ug7Hvef82RTKCI6F+hZsdxMvmVDPu/ARZCP7lVVueDLFi4D6Guhdl
	 Wsjf2HjGn9dXA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso2983606a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:42:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRH39UoG95rXInFT5KHy2NlzQFsP3xP0dKj2pseS/H1G0HhKndmmshdt53ux0fnhGn2ObZX42INcfqkMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJinShXiMyHAOyWAlEbrF6MbkQyA/TpL9VYcHyFW+dlWIfJa/A6
	imTo6HBpZW207dB6jGxsixKbjV9SaVxI4hUcLu2oqPMtNY5c3wJ0a3ulAFUtDHCt/UluVKlE6Li
	5OQIY6D6G1eCm6mqD+yF/Txb1lmWqEUc=
X-Received: by 2002:a05:6402:44c4:b0:6ae:16f5:5be9 with SMTP id
 4fb4d7f45d1cf-6b432bdd1demr2020030a12.7.1792744978643; Fri, 23 Oct 2026
 01:42:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016081006.26069-1-yangtiezhu@loongson.cn> <0b06e77e-540d-19d4-4d9f-de3db1f2c317@loongson.cn>
In-Reply-To: <0b06e77e-540d-19d4-4d9f-de3db1f2c317@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 23 Oct 2026 16:42:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6oJw8UTcVcE8ac=CknwimtLb8+T=Q3AiW0W5U6CXVbuQ@mail.gmail.com>
X-Gm-Features: AclHuK_qO55WwAvZjcbyIjA8eowTafVDidcNAulvaY2V0oX8OypdPdrB_m6PfXk
Message-ID: <CAAhV-H6oJw8UTcVcE8ac=CknwimtLb8+T=Q3AiW0W5U6CXVbuQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] LoongArch: BPF: Refine move_imm() and optimize
 32-bit operations
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:44=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/10/16 =E4=B8=8B=E5=8D=884:10, Tiezhu Yang wrote:
> > v3:
> >    -- Add a prerequisite patch to detect CPUCFG2_DIV32 feature.
> >    -- Fix a hardware compatibility bug by checking cpu_has_div32
> >       before emitting native 32-bit div/mod instructions.
> >
> > This version is based on v7.3-rc7 and has been tested on Loongson-3A600=
0
> > and Loongson-3A5000 physical machines.
> >
> > All of the testcases of test_bpf passed on Loongson-3A6000 (with DIV32)
> > and Loongson-3A5000 (without DIV32), here are the test results:
> >
> > $ sudo modprobe test_bpf
> > $ dmesg -t | grep Summary
> > test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> > test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> > test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
> >
> > For the BPF selftests test_verifier and test_progs, there are no any
> > regressions.
> >
> > Tiezhu Yang (3):
> >    LoongArch: Add CPUCFG2 DIV32 feature detection
> >    LoongArch: BPF: Clean up and decouple is32 parameter from move_imm()
> >    LoongArch: BPF: Optimize 32-bit operations using native instructions
>
> Hi Huacai, Hengqi,
>
> A gentle ping on the last 2 patches of this series since patch 1
> has been applied.
>
> There are no any reports from bot+bpf-ci and sashiko-bot,
> and also "test_bpf" and "./test_progs -t jit_insns" tests passed.
>
> Just to clarify the testing status: the 3 failures mentioned in
> the previous test report are entirely pre-existing on the clean
> bpf-next tree and completely unrelated to this 32-bit optimization
> series.
>
> The core ALU32/JMP32 paths introduced here have been fully verified
> and passed without any regressions on both 3A6000 and 3A5000 physical
> machines.
>
> Do you have any further comments or objections to patches 2 and 3?
> If these look good to you, it would be great to have them merged to
> avoid rebasing and resending these patches after this merge window.
I hope Hengqi can take a look before applying.

Huacai

>
> Thanks,
> Tiezhu
>
