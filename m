Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177359;
	b=khYahcxp3jGLxYStr38mVq/OoHV/Y0iEhLUpP71PrSxugPTP7cqb14hB+ZdEM8pX851G
	 u1nHM5MEr3irZgPfj9ck3BFz/+Dr3OgRghhgKd9RhLCV0ywb0LKJUMjsrSEp8fKCiVHqW
	 l77lvfqM/zxqrk9NzPvJ30u3VwcBeimWyZopXkDXVD9Ed8kF/wfgVaaENOmgQJ9rzAlaK
	 FyJupg6mNN0QK2zQZA/pLVj8NNoTVc/pc8Ds8C+fnfw63tXnkDaUCIUtY3hf224W6CX0t
	 59xxRg0hQ2nhEMThtK0mHc0witoXKCpNTQO7gxfcJ4mtOZvxWh7h6C0soC+aWVEpDEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gdffhIhcUKdlCUb+ddUagwMtCEoAwvnKtouK4rLwIVA=;
	b=SaqePAAcduMozEwf+FIILXievIavOeVnNdeE6b8hsoetFZy3Fg1xo2mZ2DWcNqglVuiN
	 mtVad//CRCP8F5dMjCuUlkIrovFFSnQ5lLrRAS7/9YhGC7273caWfaUxZT3EpFtMhoCch
	 43bb+kcfdEZKEkJvugRiuGR8jA90fYhMVLexG0HeMReyWx8FOCkNYbPvR+8DCJ/CXNq5N
	 1FrAVXXhQJ7lJ8t6IYBEutI3dOjEURcG5uFlJVV/xnZ1hU72Gz4b8qyp/wK9IIkBTLfoH
	 oShqiah13x4yuhMz0CYPup3PLTxZF7gtGRoExDoG2oF191lT5TLtcSenhyAFp6QQp2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynx3XGJG;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B535D606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B535D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynx3XGJG
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso286147a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177357; x=1794782157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdffhIhcUKdlCUb+ddUagwMtCEoAwvnKtouK4rLwIVA=;
        b=ynx3XGJGKNtNHaeP533ZA+ojfGmjYuUYJUXFI4zTgkFL03ZPknQrjx0UzwmTWJbej8
         QF9obID6slJ5JPi/880OGo2lx94EmN56GBHdGDnQMUIN2FjZpUj7uettslsTHDcj1S9Q
         I9Boe01r3oeeJBDYn99L2LgbAakYJpZFzSr6WxEtFOw2zdpE4iEExAuSkhsS5DxOtxC+
         Hzm6EGCBSm+JdExarstw5wISWn29jDLHYl9eRzuJEgknYcBbMYwXMx5k1OBpL/g7JgPA
         3nspQ1LPRvI5/OYgkAqKyV0L6PpNwbLkRtl8bKgevvO5vweXQlJdXkGXqC1M8nQYAIrI
         0f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177357; x=1794782157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdffhIhcUKdlCUb+ddUagwMtCEoAwvnKtouK4rLwIVA=;
        b=gZ/F4/nnfCZQtuMV8YYki3QydEmC3tHLWSt8SR31ZZkU09qbcVa+IOIHYkG96F4BNX
         xfxAR95RcNDWHD7L6mE6nIhDvvX2ndKgUPpyWlFPqO6z0QRKSqWBmoC1X71VUYG74vFq
         fMtPuidQJ2heFzw/V5F1DoUTy+/6IoCz/svn7n7zrjo7ttkjVwkuyPkY1AIHqQ7CW571
         kNKjHkXEhXWgozR/J4uZwVnAwgTomSHOQnUQV0irTD0TymbA5LT60v3qimRzcMtfRMFZ
         1e19nCvXDK/PIDzHgvGaOAJKa9C9myRgr2+eklw5sLUNH+plsVBBEmt+lbUbMGBx6wQn
         Qkaw==
X-Forwarded-Encrypted: i=1; AL+hErECp1uJmsUViBk1UGRBt+HdOiG1Vtjf3WEaoaEnrFd+Tn/yJvtJpp6zA9HO32qjXkn3Mz/ua0dc0bldPr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CnSqd3D1JpKG1CWQ+WjRs8IrPjDlzvn/zz0pLJuxPmLOe72Ke
	Xo7EUFOLH5Ni7HsWk4fmpo9BcHhvnOm9lmBMw00HTD+MITufx7ClEIDA
X-Gm-Gg: AYBFou0BsrOCD/pFfrcKBaydZIA513Ri8eerv7A8DDH7rSnyP9Qm7to+1pbDQD1L+Mo
	Sq4WmbzR2XHOiqwqxroycEDw3wsMqx1n/qNCnWtnRMM6oe7+LJ3CNYkO2IDtdmKHo4txly8EeuO
	MiryijPb/T7maGb434z82T5WOPtIYefXsgghZcmUP2GF6Gki+IicxqMW/VexWtXuysCgbu5p4b5
	yIwTCfY+dgLq7RQ2IWv1DxonID8s3NN4T3rgHad4NuP2o557i6kK7EAg9WgwA001obkJ376HZVr
	JGUe6sm3pZpN90H+b3eex+zcQMbAPqLE0oJEln2QXsqNphW2k6rCYy9fPYQFyOAPb2mO07Cc3B3
	eOkXlK2g2dW93UPiCaYNo0EUuyQWi8o7L8roVhE6KmqcfQ8mURzDsSNSw4ib3sNEQkOixYZ+1Q4
	alrwbfUF5aJXXcFZSWSvLPzWKNGASHRLbYI5akPv1p35Yfnq+4e3Aqf9RNWGJjp8vXeNTaifvbU
	qzZYa1gD410+iDEgeEjFE4miJe4CAxId2SKI5YkLotPQAK92haR8Y4wrwkW2o+uNJBpVzlRJILq
	fPxq+QYDNhqfs7AKeHAtXD8kgxac31Gubr7K5bXbvv8Ot107AZQA0QfBimdtmBENOG+nCXI=
X-Received: by 2002:a05:6402:24a4:b0:6b7:1c:ead7 with SMTP id 4fb4d7f45d1cf-6b722410b3amr1371092a12.20.1794177356394;
        Sun, 08 Nov 2026 14:35:56 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebc7b0sm859272a12.14.2026.11.08.14.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:35:55 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH 0/9] sparc32: repair cache hooks, mappings and TLB tracking
Date: Sun,  8 Nov 2026 23:34:10 +0100
Message-ID: <20261108223516.1125534-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am submitting nine fixes for SPARC32 cache geometry, user-page copying,
folio and anonymous-page maintenance, kmap PTEs and CPU-mask tracking.
They apply to linux-sparc for-next at the base commit recorded below and
apply independently of my separately posted bit-lock fix.

Since summer 2026, I have been working on getting Linux to boot and run
reliably on an SMP HyperSPARC SPARCstation 20, with native GDB builds as
my main workload. That work exposed problems in both the HyperSPARC
backends and the common SPARC32 cache and memory-management code.

I am submitting the common SPARC32 fixes first because they address
architecture-wide hooks and bookkeeping rather than HyperSPARC-specific
backends. Some symptoms were exposed by HyperSPARC's cache behaviour,
but the affected paths are shared with other SPARC32 processors. I plan
to submit the HyperSPARC-specific fixes separately on top of this series.

The SuperSPARC demap serialization change is a separate companion. Both
application orders produce the same source tree; neither change narrows
mm_cpumask. HyperSPARC-specific fixes and optimizations are not included.

I completed a native GDB 18.1 build on a dual-CPU HyperSPARC RT626
SPARCstation 20 with 512 MB RAM, using a native SPARC32 SMP kernel with
the combined fixes, optimizations and separate platform prerequisites.
I observed no core dumps, livelock or new kernel messages. This was
integration testing before this context-only rebase, not isolated testing
of these nine patches. Individual patch test details are retained.

For this rebase, SMP and UP builds and QEMU SS-20 fork/COW smoke tests
passed both with and without the Viking companion. Validation builds
included the separate PIL and IPI fixes, which are not in this series.

Codex assisted with the rebase, review, validation and cover-letter
preparation.

Magnus Lindholm (9):
  sparc32: inspect every PROM CPU cache geometry
  sparc32: flush the source user alias in copy_user_highpage()
  sparc32: do not flush a NULL address in flush_dcache_folio
  sparc32: flush the cache when a kmap_local mapping is installed
  sparc32: preset modified and referenced bits in kmap PTEs
  sparc32: colour-align private file mappings
  sparc32: implement flush_anon_page
  sparc32: retain mm_cpumask across TLB shootdowns
  sparc32: enroll and order CPUs before switching address spaces

 arch/sparc/include/asm/cacheflush_32.h |  6 +++
 arch/sparc/include/asm/highmem.h       | 21 +++++++---
 arch/sparc/include/asm/page_32.h       |  6 +++
 arch/sparc/include/asm/switch_to_32.h  |  1 -
 arch/sparc/kernel/sys_sparc_32.c       | 17 +++++++-
 arch/sparc/mm/init_32.c                | 44 ++++++++++++++++++++
 arch/sparc/mm/srmmu.c                  | 56 ++++++++++++++++++++------
 7 files changed, 130 insertions(+), 21 deletions(-)


base-commit: a9e88d617a25306fa7e532b0b8be08df778872cc
-- 
2.43.0

