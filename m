Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476771;
	b=bFnujSm9wjBz2jW8r52PK+/3OZ3aIcQ6cSgSwEwGid9PukqQO/AhbBPFPogP/V3VGqDW
	 6xc9eFnKPKL+oQgGCCbqB2Ot6qIjjCDwawr+FpMoUXNMURvUZaAR0Nga3U5Tw5ln3wnNZ
	 25uVh8PDp9XbQfs39lnMkdrnk/YwBuaU7xFZ6TQm43kpbHVL1QmQcWQ3ZsKmbE1kXnALQ
	 sarpBckKxfJQWtbraDOjYAKEiVIcUJu15ci1JmgOyTujb9YTPaTU270DCZhDsxTQaWk0R
	 csmwDtFRxZ7HjRE9gbkImHDhRkzzUdrlAzzBPhfrtCy2iVC4xJc6sqg3qkxkIXm+hMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476771;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=fCULKqKDk8YwLrMRzEhmE9a1B0TjEv5VZASYtqajRIU=;
	b=0BNzxzHs/D81ZAIlhDDVl6BJrkB7PC14EnVrz79aAMYTNa2JtTm7Ch6Gw8SvZ5vtULgt
	 HiGh62jzc3bmtvnDAzL4I+TSUil/H6sPEqJU/os3szrBmqrw0BkdzyEmUGB4MhCzO6xiB
	 VZ79TosQpQE+gTzJrHKGW+diZ6FJoIP7xBXQ0fJtXDB35yDkAKLulw2WVHGmEIowwOP/+
	 d+fHsF4C3Y9l5WWmXs45U76SOofBpaMMlcTP6Vr9F5PN0JcCFbSc/Y/0Q8bQPXYQmAr2Y
	 n7cNolZTfOtIbqDTI0IxXb2NatyKX+HtyaHySQJcMVmC5vG7tmqyXgpaZyc0aofK9Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ElQzYcuR;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20EA606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A20EA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ElQzYcuR
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CB6CA40E00E8;
	Tue, 20 Oct 2026 06:12:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vD9LFwrQtuXw; Tue, 20 Oct 2026 06:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792476765; bh=fCULKqKDk8YwLrMRzEhmE9a1B0TjEv5VZASYtqajRIU=;
	h=Date:From:To:Cc:Subject:From;
	b=ElQzYcuREaFQx19HVYuR5kGQ/96Sf91K9Z/OIeWFlNepR19wcOYcTvgSGr3+sWWcl
	 diE82tNjCk5K7rPTbaMnDWN6lgHvGT3J/8NfY4dQOSDgIlem6BNbf+GW+lWqLb47z0
	 Z1u/at36NWggznViYugORhDSAWVEad/mor1Xc7u9lpen65Nm2dAlRiuZFhTor58yJp
	 tbxqyaAAhpuxbfhWLLRfgoDJZJDJPQgpSMZw5uOh+w99tZy9QZwknE9WvSYjIgvSjg
	 LjYIx+VddJHazBBjjZt7LS+RCIhlBjJfVL+iS5f5tHj+C5PjQxuSqyl0jWk9Gu9N4A
	 gFpFT4xdlhPnk9gJCWc8d0OirbM0Ges1F1CdtOafH0SG0Gp33GlRL619rFGF1JFjWL
	 3FLFIitOm4Ii2oVarcEyvGl8V9u23GdNGc4DcbVv34Aj8IluQcfIW97ENdBl3zd2BB
	 kbEd/Q3TGJo0g5RaoqatNH5IDcSzXetj/SZzoW0zD9flXZGafnYWuofCNbhNd19CUo
	 sbooCTX5aowKf2L8iL+Web/J/pV3NFdwoWVlrNHf9rFNJuZmxTwrX1VaZyq8jkSKNS
	 8mEMq+HEg70eypjLqugC9DI8gRQzhKVdhrtAwG8A7+skT2DlXDf2kg6NOWlWklrx+b
	 c8GrlltwReGlPCvGwbCLv+4o=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5F68240E029B;
	Tue, 20 Oct 2026 06:12:40 +0000 (UTC)
Date: Mon, 19 Oct 2026 23:12:34 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/sev for v7.4-rc1
Message-ID: <20261020061234.GAatcGUtJQYVgIvn7k@fat_crate.local>
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

please pull the x86/sev lineup for v7.4-rc1.

Thx.

---

The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_sev_for_v7.4_rc1

for you to fetch changes up to 250ee734115bca1c1f7a38d838909aa83cce87ae:

  x86/sev: Report MSR_AMD64_SEV in sysfs (2026-09-21 20:28:44 -0700)

----------------------------------------------------------------
- Report in sysfs which SEV confidential computing features are enabled in the
  environment so that related components like a SVSM can query them and do
  appropriate configuration

- Add support for a new AMD SEV instruction called RMPOPT which can be
  used to reduce the performance overhead of doing confidential guests'
  page ownership verification and the like. Work by Ashish Kalra

----------------------------------------------------------------
Ashish Kalra (5):
      x86/cpufeatures: Add X86_FEATURE_RMPOPT feature flag
      x86/sev: Disable CPU hotplug while SNP is active
      x86/sev: Initialize RMPOPT configuration MSRs
      x86/sev: Perform RMP optimizations asynchronously
      x86/sev: Do RMP optimizations on SNP guest shutdown

Joerg Roedel (1):
      x86/sev: Report MSR_AMD64_SEV in sysfs

 Documentation/ABI/testing/sysfs-devices-system-cpu |  10 +-
 arch/x86/coco/sev/core.c                           |  30 +++-
 arch/x86/include/asm/cpufeatures.h                 |   2 +-
 arch/x86/include/asm/msr-index.h                   |   3 +
 arch/x86/include/asm/sev.h                         |   2 +
 arch/x86/kernel/cpu/scattered.c                    |   1 +
 arch/x86/kvm/svm/sev.c                             |   2 +
 arch/x86/virt/svm/sev.c                            | 172 +++++++++++++++++++--
 drivers/crypto/ccp/sev-dev.c                       |   2 +
 9 files changed, 201 insertions(+), 23 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
