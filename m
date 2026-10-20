Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792469071;
	b=f107Y7PMeljwhcspsRFlXGq31RTW09qTXBYONcIaZ4czJ8Ek2LtmJKsHGyS3mJeyCyWR
	 0fBLse16xf/zmTfmpW12uuZJiphFiRBtc77EkqoZtlzrXmtyDX74NPAUZ57m/dz59+a+H
	 HjYqcLSR1KdkQ4ltG40HbduA7I1GH5kIw94w9jhDb4oh2ykX4UTmzi7K/Vp9F7uia3YFT
	 ubNiXfINJ87g0VBfmfr8BpPQf1DGypD+HSy00uzqQkD8YPpvTPD6i/GLYDajGXmrMHYhH
	 X2YQnkGxrOIVkA+r4NxSjWNxVeTh0+sQP84cpPol9ozmTRMAdbgTWACzq4ycBBuL2pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792469071;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=azyHE/kwhma2vzkQ8Qv+XIIP6pxTj4UgZnMo+VZ6rDA=;
	b=TZDgOZx0YzapTA8H4XHuqnBzu9E1C2nYUq0vAjVu9cTHDGn4pg9KE0h/qp2A3aX3wHZg
	 vEuJncWxif4DxvXP9X/H1L/FmrpohQN39z7+Ik6PyK5G47t+5xXK6JA0e/NUgPNkQjfdl
	 mk7QL6LK6q0TuaVBC4afHOOPPI54KnjsIQdYavRcap1yZMnhoknSnc5lchYwfzU9eANFr
	 B4V7CZDDAS15hz5I/z9tqLwhPIS2XxP3ephwBjQrB6oDnk6iV8ED7U1PlJzItgan9feyV
	 bp2Ic6cXNjWFJpLBzGi2Wuk5ryLYAEskVMB/CFkFF/lkHtFMtLY7CZ0PY9KA06AArGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hjfmfjpP;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2089C606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2089C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=hjfmfjpP
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D563140E029C;
	Tue, 20 Oct 2026 04:04:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bTbv_SB3cr7b; Tue, 20 Oct 2026 04:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792469064; bh=azyHE/kwhma2vzkQ8Qv+XIIP6pxTj4UgZnMo+VZ6rDA=;
	h=Date:From:To:Cc:Subject:From;
	b=hjfmfjpPkjJz/AN+EgutxFkVAUXY4+CGuO43bHhZuwGoAHeqhJZ79EUrPJm3S0Hgg
	 NZVPOExuTZdqsKnfV9+2eyx0OCtFkqurLDbLOcxqPF7aTIQTub89zhV8lezil25L5R
	 Ju4PaZXvCOO600d9qgPBZfBLR0WTFq+uElDTSPKL2nwlOBtsAmimWsKx9LGAslUhpl
	 HZwNpRVh2YInvL9wwk2D/qpyYJ70MD75JvgPRDvAhPYyN2ooaenSGN4F5Au+kyT4gb
	 O7bSQAZ1L8MBWhR8jXPEY+3IljODGyQzoeQsoZUmmJiuGqPbbTXRy1dGVpxh937fK/
	 d1Oii90Ev6etkq+HXpKjaeu4KTXQ2yGbIPZk4DDmmKC8zm+30cbZTG3cDqfXMzRed9
	 4SjscsSz7PVz0xMcBn9p8aKMKoZK6sIhZHhq6XUkoLi2GbrYdmTA7Tg+0Qv3rAKxvR
	 zJN8h9E1t5AT8zElj5n/JZ9FzM8QSWzesOgp+m2n9mLabLJA3EjU/KdF88WCzZRMMq
	 cQX/HwcaM53CFkvmqh0veqOj5K0g4DIDGtp8a8ZWp3ahQPYPwvrwwYz+YY/keFzgue
	 dhRZw9UgzLGLmiFCMitsD5z/RvXiMWDEJ0tCf+v0ND3dItt+Bor2JlESw17AM2lfUs
	 3AMtyhAHaZHwEJxqeT//86Eg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2111140E029B;
	Tue, 20 Oct 2026 04:04:21 +0000 (UTC)
Date: Mon, 19 Oct 2026 21:04:17 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/cpu for v7.4-rc1
Message-ID: <20261020040417.GAatboQRu2kKhkvhPz@fat_crate.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the x86/cpu lineup for v7.4-rc1.

Thx.

---

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_cpu_for_v7.4_rc1

for you to fetch changes up to 2711d67bc3a776abcfc651ad87be5d29ada19166:

  x86/cpu: Don't transiently clear the boot CPU's capabilities (2026-09-17 02:05:39 +0200)

----------------------------------------------------------------
- Rework early CPU features detection code to handle a case where recorded
  CPU capabilities are temporarily cleared in an interruptible region. The
  practical implication of this lead to, for example, KASAN complaining due to
  5-level pagetable support disappearing intermittently; by Ihor Solodrai

- AMD Zen5 started reporting TLB sizes as multiples of 32 so adjust the TLB
  sizes reporting code to consider that

- Return the proper retval when trying to enable user shadow stacks

----------------------------------------------------------------
Bill Roberts (1):
      x86/shstk: Return the correct error value when user shadow stacks are disabled

Borislav Petkov (AMD) (1):
      x86/CPU/AMD: Fix Zen5 TLB sizes reporting

Ihor Solodrai (5):
      x86/cpu: Factor init_cpu_info() out of identify_cpu()
      x86/cpu: Initialize boot CPU cpuinfo defaults early
      x86/cpu: Inline generic_identify() into identify_cpu()
      x86/cpu: Move 32-bit SEP setup into identify_cpu()
      x86/cpu: Don't transiently clear the boot CPU's capabilities

 arch/x86/include/asm/cpufeatures.h |  2 +
 arch/x86/kernel/cpu/amd.c          | 21 +++++----
 arch/x86/kernel/cpu/common.c       | 96 +++++++++++++++++++-------------------
 arch/x86/kernel/shstk.c            |  2 +-
 4 files changed, 63 insertions(+), 58 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
