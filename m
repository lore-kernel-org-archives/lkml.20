Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796313;
	b=yAKaUjewR6vTOeHyp/qk6R1usyQWHLyScaD0HKKGSH/M3O8GFwC7BAMnf7KN784w0io9
	 6BIJFG96qnqpbZyOT1u9O/+1zfaI8hhWnW5mn23j67CgXeBhoD81nBByqHxnL8oKcYhwH
	 wSDbmZ0XYIMHClkEIhqFHohpUyT56tljkA9GO14xxs9iNJA8fnxv8Dri1Eoatcuryqrw5
	 5avYZhcPFUsXc9tYTvmRuoplsPZgpxpZ2k4Zsw6Dg84NOW2aT2vgsspdKLbUnkFO+Re6/
	 B6blotWaeEn7mfGDF2fOnr6P+96x6+6RTX8aOEKF6EGnyFDzQuPXgL9N5z7AKPUQM4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796313;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6gHWPvZNXm1/ip60eIFXciIe68jdkeSrwUtnZT7TE2Q=;
	b=B6/iPaIF+aTbITGGQuwxyh2/D72WZW9+Qpm2eLqhnUmEINb8mlzLEitqp0P67669fura
	 53x4FXpVjzGUive7iMyBk6KcKiRd61iqHEPJYMvoYBkTZr2yXKpnASxSLzj2t0aKlncgR
	 0D1ED/9HzvG1lnKWsSkeZBma3NU+LQ3RaqIaW2Z6j6JVpxHgi5WmVTn18miiNP/kI4bJJ
	 aoMRCm800YtfRhIfMx4LKCEPoDv6O/p8XpUsn7swS+WxQ00i92H6XRtOBt+mdRDl6cY2s
	 syv9E1TNTvpbSH+kLHbGpmu7WDdqkq/aUmEP6T6U9G2XHeHreOW/X1jgnPxX1TvkAIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=OrYqVjJ8;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED73606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=OrYqVjJ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6gHWPvZNXm1/ip60eIFXciIe68jdkeSrwUtnZT7TE2Q=; t=1794796312; x=1795660312; 
	b=OrYqVjJ8vXwCtJQhS2iY16HmsnZJNLksEnOnV00Fn8V3UWRVnBmQy8/wjv5Er+U7OglpQ3ZKyMr
	yehbBC3vEmZashV4weiO610rS3kVvTBx4Fp8eBzwXoa/WgOLk+/goswMBwREKzzEUD7HFUOuuWifW
	LerHwW8AvgTUFG+HruIW8k5X7/6gCankf06wCXdFlCNyxECbv3pQh3c5OOE/cgSB5ur1wvQnz0xKT
	WU2rNZyNr/0zpuW3WaLGUzPsqP7Fxvs6+pGMCyw37EIr6+M+FOE22c8uUsWAEMzawMvW1AYTwf65w
	15HseUnNG99ENynbL+LZINnZ0CWYUulGtUQg==;
Received: from mail-dl1-f44.google.com ([74.125.82.44])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmVb-004DGv-Uw
	for linux-kernel@vger.kernel.org;
	Sun, 15 Nov 2026 21:31:51 -0500
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b244fb7fffso3285568c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:31:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGVEvlBHiNrafFKoW2KW43xV/iSNgsVFun0tuqAF+8NtgcmKb8zX/GUOTDGTrevfCQpKDDNVIglzJnnRP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iXbbR3fKq9ELOIY+zwh5UZwZwghEU2WI9eIYWJjqqUeyhlINr
	fFwLZGcSJaDNVeDqIOhRWeitKSw8QeQmwxU6HIQl/OLY5BYW3FADJkIO+kQYdExyBA/z5/z4Egv
	2Uoahc4m4F+QVDFMFRIjURGK4WUlnFaI=
X-Received: by 2002:a05:7022:290:b0:185:4ad4:3d15 with SMTP id
 a92af1059eb24-1b503068235mr8029692c88.1.1794796311011; Sun, 15 Nov 2026
 18:31:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031161826.858908-1-nickolai@csail.mit.edu>
 <20261031161826.858908-3-nickolai@csail.mit.edu> <auzD6JgYSnW186Bb@Tao-Chiu's-Mac>
In-Reply-To: <auzD6JgYSnW186Bb@Tao-Chiu's-Mac>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sun, 15 Nov 2026 21:31:38 -0500
X-Gmail-Original-Message-ID: <CADGQE7HyKgMpUojhmFJBRD1xLiPaBrc4_60yj=9+4Q6AFC4G=Q@mail.gmail.com>
X-Gm-Features: AclHuK_fTJKor30RYSxlkDn1OTApsOaQoTALBaQe3huilFGKC2-TOlZHcinNap8
Message-ID: <CADGQE7HyKgMpUojhmFJBRD1xLiPaBrc4_60yj=9+4Q6AFC4G=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests: riscv: test FP state restore when
 rt_sigreturn() faults
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>, 
	Guobin Zhang <guobin.zhang@intel.com>, Deepak Gupta <debug@rivosinc.com>, 
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 12:59=E2=80=AFPM Andy Chiu <tchiu@tenstorrent.com> w=
rote:
>
> Hi Nickolai,
>
> On Sat, Oct 31, 2026 at 12:18:26PM -0400, Nickolai Zeldovich wrote:
> > Add a test for the previous patch: the signal frame sits on a
> > userfaultfd page that the handler drops after dirtying the FP
> > registers, so rt_sigreturn() sleeps in the middle of copying the FP
> > registers from the frame. The interrupted code must get its own
> > registers back.
> >
> > The test is skipped without the D extension or when userfaultfd is not
> > available to the caller.
> >
>
> The test is failing on qemu, with or without the patch applied.

Oops, thanks for catching that, it was a bug in the test (clang
preserved the local register variables until the inline asm ecall, but
gcc didn't).  Sending a v3 with a fixed test that doesn't needlessly
rely on local register variables.

Nickolai.
