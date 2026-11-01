Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793540041;
	b=pPmm7KTwiGMCKiUNBXn2GcPOw9eywAx1B48ALFjMSjEcUYi6j+2L+cTi4BNNEbM9zES8
	 elJkbMlM9BkWc2Bs7wUMgBwz0FlHjJAw3v14Mf6qa8w1BVyRmZtmEFppXOSHs2fefa2JY
	 kfYJ2Pd5THCZwaHrwd2oexo3rcSTZdaOqTZ2KsO+rQSwcmlQY2AEpHpcW04ekX8sb+uLB
	 qrcyspiNoz/qqEj8No9emPB6V74zPSnb+CsqFcKXjiiJ9SX8M8GIn88VrW5BC5QwfrdhA
	 gwU1AEaNcuuvHqXCqheoJLi0M/oCCXJQxy84LskkTvhQ5JmwsION1W9pRq+aOGX8SbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
	b=PjTjMx2tZvvYgYA6eYipgzn5gSPQns87ctsU+XUGJyS+fUjJq7U4R7sVNjEOOM91u/+w
	 JBb/EzIt9Ce7puWWZuOlenlR8E0ELiPJ7bVwetloNP+GpsQeKqweA1JrRoMV4SGxPRtjd
	 zv7fPAh95RFh20GsXkjscxgM7lk/ZGwvKljFyxygmw4ZOeHRVEXiDqJveyXCzipi9Nws4
	 O71gUSq2nmn5AKRe9FXqjj71pQo3Z3b838P5/MTYbztBXwvXczUxmQXRwnI1gwzDxmFj5
	 Eoz+8i/9p+O5UVI2JN67Zklclf0JXY6H2NDpjFzlFQwG50UPuPs4zOrz0ubVM03vdhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ap7tarRd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76734606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76734606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ap7tarRd
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15943c9c005so434789c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793540040; cv=none;
        d=google.com; s=arc-20260327;
        b=WOLYxBisUn9xw7MOX2OhBsK1vV7wtOl4KmUDzyVFJch4R/KNya7PJDWG22Y4oJfKuQ
         l2zkzLMP6L4Tcp8gVGdyvqVdoF05rJJcZPLNNtuisAP5oY0Jf+INhdajZFYr1+pFM5dI
         V0nXxTT7w1hbsJJM1wiFIDED0BEkTnmTs/YvUALYk6vxIFC7bplQiDZzCH0oak6VMDQV
         Wqg7OKCeRi3l6Vhww2jI/Ll9l5FEDMYCN2F57X0DuTWy3FGE5y+jllIJXiHSQYFDAa55
         TKHqQihpCUiTJuLVVY1DaFCOX9/QIWQLej5gRokzOAHrzOB4QhLAQtN6j0/VZ+PUfFt4
         Heig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
        fh=rP4zQxkTB+udzxMjJnIc1qRaWb1YJKsJfp3eUbwaUrE=;
        b=ownCWU06TvU7pEEwjIYjdJcKcIjGe6iBsBVjz350NbaXhjcKCEncKqQkc1nJ8IX1OZ
         l1BW/STYPAucdMmKnF/jk+d+QmeK9QEGWIgWIBLkPl94jfMNAjPUkSpE5OSm28Tfnybz
         YGjfIz6J9yXADMgwde3kHLPZu7WxCxv2IX1rwhbfPifpAICFQjnGCp2GTpSQ/O2aY6Ev
         DUsJFKanYWzp4KcmGxaN2pTlomVze5QYBtH4EI8H1xjxLYgLmb2v9kji3duaL6Zcwc4c
         lmOHA9ktD2/Hxi4crDdFCxDUSTQQPyt+kMJZExcVo6CSLfPcUUEOXxyRfYBO+zRynVXr
         hkqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793540040; x=1794144840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
        b=ap7tarRdmcn/+khd6TzQJW9GI+QtvqC5RDzR8lYDIZBlpvZiswV/ixdPDrRq0/6hrx
         NQkdG90oIDk64ppXy7XzeNmB2ZmG1Nh5VY045BTIiVb2n1sXE/s6g08pb7RMQpa461bY
         sA/WibAfd7/NsMe4U5S6WcNHuK5n+pqcJmS+T8mFEekPGgsPpUdJovv8g/DPHOYZ3GwO
         2aVoLAaEdAXAzBeGEO1YBMIKzTY5wAiwIpp4IDM5b021VHJ7zZboT2EkBBrzTK9W794d
         bmhxTSk/fcpMQ/H9VJ4L/XTiedsc9Cukx2j2nPFoAUBeOLiRi5x66y6p/2UBXe2FYQjt
         nYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793540040; x=1794144840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FoSNuo4120zGj2L29GeDCwMhfV0RCk5eABERU3r5fE=;
        b=iEc1ZF5al/pqJ/vHjuMub80Ut97LAf4qeZ/6/sg8Nwbw339rtqH7cgIGo0/L3ATtT8
         o7DIx80Yy1i8aqeUZf7NydT7XSK2zC/muXn0ZxSnB4xHZ86uelSUJimyMdjINexJ2zmz
         ZXrQ9TO8edV4Crpqok2oChZsjPOXmC6yhcSoNmRDGhyFYlXqVn8PXFvTAQ+3w9P3K/h1
         E4udo5DDniJEjgCS8XoZ6kagg778CdS0kzWNoHaukwy0+KqLRxUPx2eyAtvwLH70V9G8
         YNE/V8QNl2Pv57HyaaVIv7NWeL/dI79sZwjusDbvLIAmbRYge6Ocwdg6wydXF6H6ApOC
         TB0w==
X-Forwarded-Encrypted: i=1; AKwUvBzu5xHrHQrA8SjM5luArcNNxxygGU/7JQDrxckbhVo2O6VwTta8I4El6OhcLk5gr+Ijri9Cnd8Vl6nE1rQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAAA/qKgiulklrgopfD+LodhCRYYCwHK+DY4Pq4Z3k5m5Ui/nH
	I4l12KVtzGUaroldKCfvm/+Qkbd4kyrZDsQjrVIsyNaCilcePrtgurth+wMWvowb5LYnsw1bU2R
	pGhjIUYV+9yiSNpQ3cEeVPlk5lcsVhl8=
X-Gm-Gg: AYBFou0M+y4BRkvsVPcW2ZDZeeKIED7zLCkWD8vLlbQuYOHpkAS8wGlzb0eh3gW5r0j
	qpkdl3hQOBy3otShL6YBFBHp4DPThjrjLMD0VIoIA/J0J5Phtaz4dgc3IuGo+k8u5X62U3N02On
	PcISX51JtnNCuCKqlTbHJhH7XvRHmS0O7nmDKqxnwUthX7KeIvhfixVKePXDLlpRzoC+l+Jt3tC
	ZvE8274FbkPIZiSzCmb1EtXCV/7Sqs+X5OKlEsqYOCDlIZgwLiFmecxfO6AU1Hl+cm3oIIos41D
	iR387sQIlBFS14B94lnw9wLRTLL+71U5/dfYzoOH10+X3A03inuF1yy/V41ti0rTKhxWu5u4yLG
	CRdGP1LxNSbW5gaTkA5gEU//Zy2mJ3M2ITToy6U97xonlEXuxW3wzOxYV7NEpcOmSmp8ugAHg
X-Received: by 2002:a05:7022:b047:20b0:1a3:bfb6:44ad with SMTP id
 a92af1059eb24-1ac5da797d4mr12358096c88.32.1793540040375; Sun, 01 Nov 2026
 05:34:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260927131838.6774-1-demyansh@gmail.com> <20260927184414.6c0c8867@pumpkin>
In-Reply-To: <20260927184414.6c0c8867@pumpkin>
From: Demian Shulhan <demyansh@gmail.com>
Date: Sun, 1 Nov 2026 14:33:49 +0100
X-Gm-Features: AclHuK-VTVK2Zx9itCVd1q2fYcmda4QQ21q-m0eczAKCyG7Q3SKFRADCEFBZaD8
Message-ID: <CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
To: David Laight <david.laight.linux@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow <davidgow@google.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Sorry for the delay, I was in the middle of a company change.

You are right about SG and TX csum, but only when the traffic goes
straight to a NIC that offloads them. There is another side: software
GSO (skb_segment() with !sg && !csum) hits this path on 100% of TCP
payload over WireGuard (wg_xmit() -> skb_gso_segment(skb, 0)), and on
drivers without SG/TX csum (u_ether/f_ncm, cdc_ncm, mt76, rtw88/89,
ath9k).

So in general the software copy+csum path is still alive.

On the other hand, NEON is useless here. skb_segment() splits GSO
packets into 1-MSS segments before copying, so on these paths calls
never exceed 1448 bytes (1368 on WireGuard). At that size
kernel_neon_begin()/end() costs more than NEON saves, on real hardware
v1 was ~3% slower in cycles/byte than the scalar loop on the slower
cores. So that part can go.

I would prefer to keep only the scalar version of the fused copy+csum.
It reads the data once instead of twice, and on real Armv9 hardware it
cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
depending on the core (+6-8% throughput). It uses only general-purpose
registers, so there is no FPSIMD state to save and it is safe in any
context.

If you are OK with the scalar path, I can send v2 with NEON dropped,
the scalar path only, and the KUnit fix for the x86 zero-length case
Jakub reported.

Thanks,
Demian

=D0=BD=D0=B4, 27 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:44 Davi=
d Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 27 Sep 2026 15:17:56 +0200
> Demian Shulhan <demyansh@gmail.com> wrote:
>
> > arm64 currently uses the generic csum_partial_copy_nocheck(), which
> > performs memcpy() followed by a second pass for csum_partial(). This
> > double pass exerts unnecessary pressure on the L1 cache.
>
> Which workload actually needs this?
> Most modern ethernet MAC support checksum setting on transmit and
> checking on receive.
> So the software checksum shouldn't be needed very often.
>
> IIRC there is also code to defer UDP checksum validation until the
> copy_to_user().
> I'd bet (a few pints of beer) that the complication this adds isn't
> actually worth while.
> Even Linus can't remember why it was done, my guess is it improved the
> performance of the userspace NFS (over UDP) daemon that would be
> doing 8k UDP send/receive (fragmented by IP).
>
> There is certainly still code to checksum data during copy_from_user()
> in send().
> Last time I looked I couldn't see why send on TCP sockets didn't go throu=
gh it.
> On x86 (in particular) copies can be done far faster than ones that
> include a checksum.
>
> David
>
> >
> > Replace it with a single-pass implementation. The new implementation
> > provides a general-purpose register path for short buffers and atomic
> > contexts, and a kernel-mode NEON path for lengths >=3D 1024 bytes.
> >
> > Measured in-kernel on an Ampere Altra (Neoverse-N1):
> > - Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
> > - NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
> >   4096 bytes.
> > On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
> > 1.6-2.4x above. No length or alignment regresses on either
> > microarchitecture.
> >
> > Patch 1 implements the fused routines and the dispatcher.
> > Patch 2 adds KUnit test coverage for the new API and internal paths.
> >
> > Tested: in-kernel benchmark module on Neoverse-N1 with both
> > implementations cross-checked (0 mismatches); KUnit suite under QEMU
> > (with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
> > testing of both routines against a naive reference with PROT_NONE guard
> > pages, gcc 13 and clang 18 W=3D1 builds, checkpatch --strict.
> >
> > Demian Shulhan (2):
> >   arm64: csum: Add fused copy and Internet checksum
> >   lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()
> >
> >  arch/arm64/include/asm/checksum.h |   3 +
> >  arch/arm64/lib/Makefile           |   7 +-
> >  arch/arm64/lib/csum-copy-neon.c   | 168 +++++++++++
> >  arch/arm64/lib/csum-copy.c        | 108 +++++++
> >  arch/arm64/lib/csum-copy.h        |  84 ++++++
> >  arch/arm64/lib/csum.c             |  54 ++++
> >  lib/Kconfig.debug                 |  10 +
> >  lib/tests/checksum_kunit.c        | 463 ++++++++++++++++++++++++++++++
> >  8 files changed, 896 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/lib/csum-copy-neon.c
> >  create mode 100644 arch/arm64/lib/csum-copy.c
> >  create mode 100644 arch/arm64/lib/csum-copy.h
> >
> >
> > base-commit: 93f51579e7df248780214094418f205253383cc5
>
