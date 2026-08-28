Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE773AB283
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787959857; cv=pass; b=ttvZqKbqu3mQ7/LhKOTLL/DMPMwOtFmSGVkmpPvgmRfgdF4iDCwcn7SMGUWeVkCZvG/w+kwnLGfe1wKDze4elJBIrXPCk6Ch4sYDFeoBLVnUGj7kn2ccIxT1Ghr9ppgvFBXDPt+MRHMeBrbHzTzvdASMdELg9pl/nXcADOiqlGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787959857; c=relaxed/simple;
	bh=99PrwuayluEad84HqZL8EdOtGNBw5ztrxCmvokUnreQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LBdZA3o8wMPJqPcBVus71NKXsA0d8jDN+357VsvzlMkONMFsk2YKRo/icMh7WagL4DEo/2oxreEg2wHp/ZMhi66wtWz8sRalOqmGRrHYj3wlcHtFl9SXHtcz+ej8ykhQkpjigf8wv7iFgTxbQbhl3HTkM5+GBZMvS+aX+y3KVGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWaBGq12; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWaBGq12"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c169ae1cb26so541713466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787959853; cv=none;
        d=google.com; s=arc-20260327;
        b=K/O87QgkuQNleexcd453Uht5zXIckdHVjnPffxiGoczInN/KE17w0ilY0p+qD/ntQY
         mQroOR/dzqBnnizWECOIIcGWds9mM9oXiV+0N+C7K9B0aH3RhRE/qvYqXqAluRjub+AV
         z+MC8+N6aIHLFFLe9y06/ygnOS9pISeapmvlVyILvP7Lw6r8jg57/jreGT8tGSijkRt1
         UdeilvdrFkg1d7232l+4uXdtJ/vHY4ei5gdCJoxOZfmGGg2Nokcxg763b3FZISGL/5FY
         5qt25nrkpfLgcWNddK+Lghwlu/ZOw0UpnPPPo9bpEAzYDyCBvE9Lst02k7nFFkHA8ySU
         psXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=I9Ebo6TmzmtOyDgGEqisNUg2TVnW4FRbNiX7886iDNk=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=TKLsAWHFgVPcVMy8CzYE5dD9RdSgRRNNJtdS2fvdwirC+1NxmdDaFIoSj+1clHJqT2
         tFXLolKI0qjYSNZT9U73AFdDFXn+8q65XSVzTmS8CGyQKS75k3sg10pr4kDp4K31c7Nc
         N/ZRyeq3fh0wVUIHSZL6/RCqRijmR5UleF2uos0q1jpsIB8dW+cIPAQxC1AvsVeJN/oE
         4ck4CR+sGFOkhRp2nB+EjD6AY8KKCcDbwOaz1Du2i+OYl+aWNbX+ShbazDY0/h877Deb
         Mw7p4seVt9QAoi0yOPeTjjFVzSc4bwoq2Exnw9Z2HQcOmd1Q3kemkN3masZIC8Ve1nGj
         9vHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787959853; x=1788564653; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9Ebo6TmzmtOyDgGEqisNUg2TVnW4FRbNiX7886iDNk=;
        b=JWaBGq12RBo7GhAlyO+SAeTJHLM5PsTbdGte74pe2OU7Pz/rsCgzwMHPr3JbgnFVjY
         eCMXwRiFxDl/WS2vyIock6w6huBv8AU8Lh2t3jKynqGo1e/F1dUdylN4uxY1XX0gvfIj
         I/XKB91js45wCBCPJnjLJYdt78DSQhWgBN1n5HPIq/bTSQUzEHDikUONHUwwlogKKsp2
         /UgTGbolpwuZ1HRzbhQ0bwgGT1PWCUDv3SbCom74RBkk5yJJoPZjLSJTsXtK8Ey2qXTK
         Rx6vYW4DKNHM6ZQq5wEI2LBOvLuumc6KIYaC4N873uNYFWREUaMf8vecYOBf9omCPs21
         AZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787959853; x=1788564653;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I9Ebo6TmzmtOyDgGEqisNUg2TVnW4FRbNiX7886iDNk=;
        b=BZWMXXplWnaQyT36gmiqk/ZsKojTMl9dtuL5b/XWaT+MJEZZ6zfQCkl629RZ6QIjll
         s8uIqSAxKadBl51qroWKiOcypKQHoeRbsS7F1pkqm2YGn+SIti7oWOhuL8nDnwhCcWbM
         Ap14+B84Q3fTtQ4sf7nen2eRu1VgMB1wtsU5yXsE/EaCO3BbtZMQcWejrqVt0aFndP5K
         oqPzBtheRIsuOF0fZ2+w7HYhufaJ23BgW1MW6EReah26X+chHRIq9antNXX55tc29UJs
         BSUC2TxOKe6wz5sGLxZIFTmqLEecpvYD62XuewJRYcHpd3HBJ6PUE4laLnN9GvAK43zk
         5oCw==
X-Gm-Message-State: AFuF++mg9jBHrPBRVWvCS6fuVRVzNISU1Kh0+y/OCRYa2+imQTxe0+Zm
	00LzXPd453d8bLS5YVqm7M4lPefSOvpGFwC/WR7Cvh+btDU9KOqtprWSvcG6cNDpcRzr40iqrGc
	Zoh/im6D/Y5C5br0HGcBEKelPk/WR8ZyNgry0
X-Gm-Gg: AR+sD12WSOjomuhOtnT2yHHAA8NI56cY8HkfFCbfMQJuGTKedy0zxS/VQkjZsI7BABs
	Ix5ZOFjOEFpNkn44VQXcPUXYcRqCKuwjyC9Tcg1YemL1CkimkGBVAwZlNNxKXAGviVKovM4ujs9
	AibS4snTR4pl5IyfcSGkcSLUJwviIf63KpfSiJlI5cM4PXZI0tw25GpNqxQUohWHMZyjH7OwX+V
	4pga7Iu6RhahPhW+dzLKkEBb8lVPkvt9CbrWoxLDcdEgFrhH+qfNxoM4ZadgWmlQG8hlt3HI9VM
	LAZX4hBFctpb9CYtw3tu7V9rJAln6RZJ4NMerM8VrStv6oYoaN2KRn+kIEO6vyWajiPB5beZeM+
	94A==
X-Received: by 2002:a17:907:1908:b0:c25:4ca3:dfda with SMTP id
 a640c23a62f3a-c254ca3f708mr1083958066b.9.1787959853473; Fri, 28 Aug 2026
 16:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Fri, 28 Aug 2026 16:30:41 -0700
X-Gm-Features: AcwNN1ULCKP4LeBVhaYcMV-xt_Ur65r3D44C4-yqNF_kY1qqUoyHiThWB7ROG7Q
Message-ID: <CAKSQd8VBR87Y_VWDZtB+KmHJJg8SYTWu8qY=ZQUFYmNt6TTJMQ@mail.gmail.com>
Subject: x86 WBINVD prefix allocations
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If the use of x86 prefixes on WBINVD is not
of your concern, you can stop reading.

-------------------- 8< -------------------

I was asked to relay this to binutils/LKML.

Existing Behavior
-----------------

WBINVD has been using opcode 0x0F,0x09 ever
since the 486 days, to perform a write back
and invalidation of the on-chip cache.

WBNOINVD -- that is, using WBINVD with 0xF3
as a prefix to hint that the INVD operation
should be skipped -- was added a while ago,
with a CPUID flag, by AMD, then Intel. When
not supported, a normal WBINVD ensues.

New Skip Hints
--------------

As of 2025, the following are in active use
by a corporate entity other than Intel/AMD;
therefore they shouldn't be redefined.

  0x67 = no CODE hint => skip L0i/L1i cache
  0x66 = no DATA hint => skip L0d/L1d cache
  0xF3 = no INVD hint => skip invalidations
  0xF2 = no LLC  hint => skip LLC cache

While CODE and DATA hint that the operation
should skip code and data caches, LLC hints
that the operation should skip a last-level
cache, and INVD does remain unchanged.

More New Hints
--------------

In addition the six implementation-specific
hints select up to six or 2^6=64 behaviors,
depending on the particular processor.

  0x26 = ES implementation-specific hint
  0x2E = CS implementation-specific hint
  0x36 = SS implementation-specific hint
  0x3E = DS implementation-specific hint
  0x64 = FS implementation-specific hint
  0x65 = GS implementation-specific hint

One particular implemention might use these
to target CODE vs DATA vs STREAMING STORES,
as well as cache level L1 vs L2 vs L3.

Another particular implementation might use
these to target programmable behavior.

Miscellaneous
-------------

All ten prefixes can be combined, resulting
in an instruction up to 12 bytes long.

The LOCK prefix remains unchanged; that is,
with WBINVD it causes a #UD exception.

No new CPUID flag is introduced. If the new
hints are not supported, classic WBINVD and
WBNOINVD behavior ensues, as expected.

I have updated

  https://sandpile.org/x86/opc_2.htm

to reflect all these new WBINVD hints.

-------------------- 8< -------------------

--
C.
