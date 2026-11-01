Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793557323;
	b=dvhy0HcISld/sokZC65zSKdilLiwLefV38jymqShT5EcC8mw5lmzgjfirzkaMr4Djpt5
	 gJKNnIUblAnSEEc7MxzhQjy/QFNPpS0LgGQik0qGElZ8sFNbtozMgB3M83TrPCOkkkTu4
	 w9jyxcRki6hJ1JergGtTc9d9wsh+UwsJ5KZlM/OF0Re6xNQoDGQsl7dDHx1IMBObqW3V3
	 oInpk1xWe24wZX6V82Y9Y/VRyDh05B540xa9f6pLdTv3S+AIEAGHDKpey1ppoaF6LtN4+
	 VvQ8kcrcp+hoT2s/XCGf0MlMlg/7YXaQ0FxhT6WZyoWTyZfySwp0Urq3hevl0+FHgyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793557323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mlISQOHGH/cpnL0817uRuQcIGOT3seVGDHgC8ES2oDk=;
	b=LTMwPphIKWOtlgbJpJPbjFW598bC//L4g2aUNyzqLszwaRHghbAqszTzTHW7qbKoqhwv
	 poE6wdd79KdUNffcmkO7efhrrUI0ceBdwTeDsDW/guKGyIFin/mQRIrktOQX8Q7qXvwb0
	 GrGVsF1VDEZxwt7RCPvwAqp+qQHbrqbt73mR2n3QTkxavV1GD5HEGvbfzIrlcipbz8Kgx
	 k/xmJ373A2oC36dx9hmnwS97SVRSUHCTbXtyQ5pulg1ytBP2MWZgTaR/w8EukDoNLI5fx
	 wzYcaWyevlsOySYSWDaf8jbawN65ZJdIRPC8IcMgHLxdJCEAyjeL42RGdIhsSDRYcwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvAUL1uS;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A6A606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A6A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvAUL1uS
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1297826f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793557321; x=1794162121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mlISQOHGH/cpnL0817uRuQcIGOT3seVGDHgC8ES2oDk=;
        b=FvAUL1uSmCc43Z/f6EFXxE8JNxxFA9pNWbLLLMDPEKa+qEUMPJAhnF4dmaRRHs9bRD
         5/1cmt2u7a7tZnzb2XHKaebLxgSXTuazVQ6LabIJjyAHGIrF1AdiOOwZnWFvs7OLtlsa
         2c41Nrbp2zxYZN29eVMuqzfl1zZQi+GI324zq1iqRfYgG/UjasAmTALBLFTWfb0VuY0R
         iQT/NVeP7qAiCywr8tXVq8tqrfR7bWZPJWmBJv4z9rNR39gtvMA9vqKAfM3ATR2LGi6U
         WPrOJTXeSk7jxV5WhAT6LmwxvHb+BFFcPMTf3lUFnBcxskvE8GQ/EEzTp25/qePU8QkW
         eWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793557321; x=1794162121;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlISQOHGH/cpnL0817uRuQcIGOT3seVGDHgC8ES2oDk=;
        b=ADqHX0/DuieiL0QWaa1JA5X1s24uZ9bJWWj6ivp7sfiR7mOOCQ1bficYcgR1p+oNpp
         9EwGxk8tzYrrNlarJPGw3zMFeLf9CT4IzJT1Rc+xnFWYA0+zj05qrcWQDyf9NDztzSui
         RJ/JDIBG430KmUrHEE16fU6MPg4Q/GFxNMdv9V0JZLxUs00l1Y5xH0dsYzlBm2c28Pxf
         ZKfRy3QaxCqJfmAct0R8de0SJmQ5wI7QnYBlXEee6tSFD7qpcpQAJoIqpM7Zl8QHExXX
         bWPEZIk2tlN8ZaLmZC3eIyHQRzzeecyOPYeNtPbtj7TntD7VOZ+M6pe3/iRnISUEjha4
         t3xA==
X-Forwarded-Encrypted: i=1; AKwUvBx6Ye/rIsVq4NKsU1vP12GHz9WbmEGQG4mdkLpkEq/g3A7o6Iv0+qP0zTw0B5KP8g68MpOQ+P8jrA+2Z2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBiSMlk0iUawx84aEC+i6YHZ5Vdqbcu+p0V4ZCqqUVDk5nrA6Y
	LhOYjc2gEiijtYepSXPK04pr89zFUnPWcJ1c0vJqRM9AUAcOmx/gl5Ps
X-Gm-Gg: AYBFou1yTexNskD6k2lIjXAugIX9kDPoK2lhfzVf1YN4ttHjhf952Cp3ZkQZz8DdhZQ
	WdJNBXG2+FJh+GUaHYTqTC1OVpW/FtJxOCo8PNTkIN1C/AN9Oq6QIrM6Krrk8uWU06Nd2RXB9Hw
	c5YHWLvFIIZJRrcW6K1Q4+7wpO1JAsuFX6VPVx1oz++Hk8adlyCktVgJkct5e2SzJCWMvvj8iM/
	8rA4K2nCjxQolHrcmAbSwnYHcyMwRn22XgQcXG+Z09O1lNoSaDgvdXuo24ZVrT/Pu94Rupj4o38
	hQOFH69KP7zwEYNMJIXpuLshrlbdcinIuoHD2reYLNpoPbDAE7RGOYl0XcbmbeayZUA54byNY4g
	LOKHcVYytH+ihfTml+GZx/V7+suOxS/XCi4yFxH6sfAj/XGiKq9JNGxMD/LMRt4i3THjomrgvdf
	Knj+/pI0cuMVec371oTWXhxCfm6XIngEA9Ls8dP4R5WdSB9sR9ZxNpgo1skaCX0zb2oFTk9/IZ2
	O0kwuW7odxbtOsrYBYt6+12WVgR0hK6FRVi0Nex8wrzMOOTeT9HqUjdIpJlKmQVos7NVUjdDxjk
	N4tM9lo3VPXKGMV56fc2BFrUXM7gcNDwcJAO7VGfY7qc6crT8noVDG874EgReKwr
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4ac182dca8emr181298545e9.23.1793557320864;
        Sun, 01 Nov 2026 10:22:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm216805675e9.2.2026.11.01.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:21:58 -0800 (PST)
Date: Sun, 1 Nov 2026 18:21:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Biggers
 <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Marco
 Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, David Gow <davidgow@google.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261101182156.380dbaf6@pumpkin>
In-Reply-To: <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 1 Nov 2026 14:33:49 +0100
Demian Shulhan <demyansh@gmail.com> wrote:

> Hi David,
>=20
> Sorry for the delay, I was in the middle of a company change.
>=20
> You are right about SG and TX csum, but only when the traffic goes
> straight to a NIC that offloads them. There is another side: software
> GSO (skb_segment() with !sg && !csum) hits this path on 100% of TCP
> payload over WireGuard (wg_xmit() -> skb_gso_segment(skb, 0)), and on
> drivers without SG/TX csum (u_ether/f_ncm, cdc_ncm, mt76, rtw88/89,
> ath9k).
>=20
> So in general the software copy+csum path is still alive.

I was partially worried that someone had just looked at the code and
noticed that arm didn't have the code to do checksum+copy and decided
to write it.

David

>=20
> On the other hand, NEON is useless here. skb_segment() splits GSO
> packets into 1-MSS segments before copying, so on these paths calls
> never exceed 1448 bytes (1368 on WireGuard). At that size
> kernel_neon_begin()/end() costs more than NEON saves, on real hardware
> v1 was ~3% slower in cycles/byte than the scalar loop on the slower
> cores. So that part can go.
>=20
> I would prefer to keep only the scalar version of the fused copy+csum.
> It reads the data once instead of twice, and on real Armv9 hardware it
> cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> depending on the core (+6-8% throughput). It uses only general-purpose
> registers, so there is no FPSIMD state to save and it is safe in any
> context.
>=20
> If you are OK with the scalar path, I can send v2 with NEON dropped,
> the scalar path only, and the KUnit fix for the x86 zero-length case
> Jakub reported.
>=20
> Thanks,
> Demian
>=20
> =D0=BD=D0=B4, 27 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:44 Da=
vid Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sun, 27 Sep 2026 15:17:56 +0200
> > Demian Shulhan <demyansh@gmail.com> wrote:
> > =20
> > > arm64 currently uses the generic csum_partial_copy_nocheck(), which
> > > performs memcpy() followed by a second pass for csum_partial(). This
> > > double pass exerts unnecessary pressure on the L1 cache. =20
> >
> > Which workload actually needs this?
> > Most modern ethernet MAC support checksum setting on transmit and
> > checking on receive.
> > So the software checksum shouldn't be needed very often.
> >
> > IIRC there is also code to defer UDP checksum validation until the
> > copy_to_user().
> > I'd bet (a few pints of beer) that the complication this adds isn't
> > actually worth while.
> > Even Linus can't remember why it was done, my guess is it improved the
> > performance of the userspace NFS (over UDP) daemon that would be
> > doing 8k UDP send/receive (fragmented by IP).
> >
> > There is certainly still code to checksum data during copy_from_user()
> > in send().
> > Last time I looked I couldn't see why send on TCP sockets didn't go thr=
ough it.
> > On x86 (in particular) copies can be done far faster than ones that
> > include a checksum.
> >
> > David
> > =20
> > >
> > > Replace it with a single-pass implementation. The new implementation
> > > provides a general-purpose register path for short buffers and atomic
> > > contexts, and a kernel-mode NEON path for lengths >=3D 1024 bytes.
> > >
> > > Measured in-kernel on an Ampere Altra (Neoverse-N1):
> > > - Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
> > > - NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
> > >   4096 bytes.
> > > On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
> > > 1.6-2.4x above. No length or alignment regresses on either
> > > microarchitecture.
> > >
> > > Patch 1 implements the fused routines and the dispatcher.
> > > Patch 2 adds KUnit test coverage for the new API and internal paths.
> > >
> > > Tested: in-kernel benchmark module on Neoverse-N1 with both
> > > implementations cross-checked (0 mismatches); KUnit suite under QEMU
> > > (with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
> > > testing of both routines against a naive reference with PROT_NONE gua=
rd
> > > pages, gcc 13 and clang 18 W=3D1 builds, checkpatch --strict.
> > >
> > > Demian Shulhan (2):
> > >   arm64: csum: Add fused copy and Internet checksum
> > >   lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()
> > >
> > >  arch/arm64/include/asm/checksum.h |   3 +
> > >  arch/arm64/lib/Makefile           |   7 +-
> > >  arch/arm64/lib/csum-copy-neon.c   | 168 +++++++++++
> > >  arch/arm64/lib/csum-copy.c        | 108 +++++++
> > >  arch/arm64/lib/csum-copy.h        |  84 ++++++
> > >  arch/arm64/lib/csum.c             |  54 ++++
> > >  lib/Kconfig.debug                 |  10 +
> > >  lib/tests/checksum_kunit.c        | 463 ++++++++++++++++++++++++++++=
++
> > >  8 files changed, 896 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/arm64/lib/csum-copy-neon.c
> > >  create mode 100644 arch/arm64/lib/csum-copy.c
> > >  create mode 100644 arch/arm64/lib/csum-copy.h
> > >
> > >
> > > base-commit: 93f51579e7df248780214094418f205253383cc5 =20
> > =20

