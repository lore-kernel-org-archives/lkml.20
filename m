Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792467128;
	b=DmURA0UJuCO1RWjW3R7LmdM37faj73NmKyyXQXMLuXgXMjaKYUxsvJZPnwaxNWlJfJ4I
	 oYsApj4oYM+jM7BKumbmn0SdoMXIUTJyKfALlZyjknAUf8PHb2j17Rhc/PirCzIlM24XZ
	 dyPTht++yzgvZ+YM30Z2L6HdbLLMGmNc+6ovtyL3r/jW7FHgy1XNaFNR8INUJ0fBXNmFn
	 fw8m8dzb7qcA76B2GfCIrowDrOzonfhdrLgs/fAhwKCsgeZJ0pd5HFdOgeCL7iN9ERhQ2
	 nyxnv4hWaCM41itrH6mTMCoF24868Sig+oypNgUDx7KjWPreG68ZxUnUtQOPX2oqkaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792467128;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=c9I/644OQmcseEY8wkzxQjuyezLuSKGdm+rqpEdEV9U=;
	b=W3fKtIWewlYN7oI8JoLNrmSD5Trow0CJ58TPhhKUgG3UinsbvE1ntVD6GscY1no0BCrB
	 uGITOqkHP2c/zWr8m4kpb1s7EaTtO2d/KxcVWoaw1SDQxSqYLBi9Ya76tNDyY4rv9VT7R
	 JVKQV71ERa/fuXAOkfC35rk7HNmgFBezK1mcidYaxkWMoSvJSw088OU597PWs/gCN1wZw
	 G+SvIdk4XZsh3BE9nsc7+YHlyToNzVgeaXc1YwwzavuKuSUJH8fcMsrUN2eF6WNdFT6jf
	 C9dOp+GzVtLNxnuamkPlCysJgPg16JuUAe/gQ//3fGeVPBzL6ZHtANpDGjZvBHK5nPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=H4yXcK6H;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B51606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51B51606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=H4yXcK6H
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 80C2140E029B;
	Tue, 20 Oct 2026 03:32:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8TsnTHJ75GkO; Tue, 20 Oct 2026 03:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792467121; bh=c9I/644OQmcseEY8wkzxQjuyezLuSKGdm+rqpEdEV9U=;
	h=Date:From:To:Cc:Subject:From;
	b=H4yXcK6HHz+e/B9iPzy+1rIQ0tw+gLCeLjSt1OClIRff/rXGXfQMwatxGb2wvFRS0
	 DJLmXD+NOUvaKm+5rb2O7QWdLKQfX8db3oXKEPkcVffof0cVE4he+QW5rb1FuEkhkt
	 kPx5y1h8pNJ/DS71DSWeueiZmZ5KqyImdLTvnBP0u0pYJ+OJkbX31QMWMah+Uy0bgq
	 ijrdQoZSDH3DeIVJ1GD7n1DN/4hLcDO2OwtIsdmiDNJm0Tf2Tv4KTCFyv4TBFDwy5k
	 Zfh5aS05ohiYdQWiD56DnllwmkcgsWsct00Tkwh0eeyxzofx6BYjYIgOQNdNlq9xcy
	 lxE0pJeQZ5S905fEYT4iE27MnfSQfneyw8Ctnx7VgnTiyMcf0MMXR/kuaAHNbSloJj
	 vIXua/As9KKnwPxezSJu2Gs4+dx2yUlM0/XVV24uMtswN11lpgPMplaCF4c0kzc+DI
	 MxEHF0FQxMNgP59vh0higVnhIkkMbL7Xplh5HS0Uo7chKAi3r7XbkB8rZh+YgtcWCF
	 EfReP8dD7sqhVZEgK5PUjgK9iPxcIo24k+Nq63eQ98Heu5fpUI504AFtdR3kxqZ2N6
	 TyaLUkxiE7yNQeb7pr6gU7JvDfrEK51GsOUM3mrG8UWNTywVWGeBaqpWw+7wXPbuZJ
	 51XVhNmn5DhYggJZPpx/DNCY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E070740E00E8;
	Tue, 20 Oct 2026 03:31:57 +0000 (UTC)
Date: Mon, 19 Oct 2026 20:31:54 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/cleanups for v7.4-rc1
Message-ID: <20261020033154.GAatbgqhp2_A-T569i@fat_crate.local>
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

please pull the cleanups lineup for v7.4-rc1.

Thx.

---

The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_cleanups_for_v7.4_rc1

for you to fetch changes up to 27441d76b3d6604de9162c4c24d034bcfe3249de:

  x86/asm: Remove CR4 read fault handler (2026-10-01 18:04:49 -0700)

----------------------------------------------------------------
- The usual pile of cleanups all over the place

----------------------------------------------------------------
Brian Gerst (1):
      x86/asm: Remove CR4 read fault handler

Christophe JAILLET (1):
      x86/cpu: Constify struct x86_cpu_id

Ethan Nelson-Moore (1):
      x86/um: Remove unused <asm/required-features.h> header

Manuel Ebner (1):
      x86/mtrr: Fix kernel-doc notation of amd_set_mtrr()

Mauricio Faria de Oliveira (1):
      x86/asm/string_64: Remove unused linux/jump_label.h include

 arch/x86/include/asm/special_insns.h | 13 -------------
 arch/x86/include/asm/string_64.h     |  1 -
 arch/x86/kernel/cpu/common.c         |  2 +-
 arch/x86/kernel/cpu/mtrr/amd.c       |  9 ++++-----
 arch/x86/um/asm/required-features.h  |  9 ---------
 5 files changed, 5 insertions(+), 29 deletions(-)
 delete mode 100644 arch/x86/um/asm/required-features.h


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
