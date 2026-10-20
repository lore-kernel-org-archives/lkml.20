Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792473329;
	b=SqgKzHeHDFz5eaiepswJizxfMRN3qxCon7msLQSvpOPXMH9vOMfJKzPFj4PElILXL01T
	 UG8+V5+8BvJHV1Czm0hGbOzO6tsF280pRGnRujl/bY/4urqv7c6GUx3e5gHj5RfySgzyG
	 TPPmRu5fZgtfYzhrP7Qhlt0UweI2vZnoObjbAgWzod9Wl6qSu1d9K9eaefJZDtnEXsiio
	 gwCzjmBzTOsi1m15z6FV3AHygSNSlWfmQK2SUnr1X229PSjs1v72yLRoF5DICx/vmxc5j
	 4yLDRQETjw1QhjCUMam+6qHef/CMSfq2k2T7UeoXXfMpxOb6nLS0bliBMQtQIqFlHPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792473329;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=DANha9B5jzRY+YgctZgpuZYZVjFpnqDHnfddNLPRcbk=;
	b=jGTio1tcRrBhSs/MqcjXfoMIL2wm/eXq/VJ0iXi2jm5npAu6hQJLu0dhzfraLjHEJX/s
	 b+GlHyY6DGPdm7gC0wdaEpDs3tmpGV1Eeg72Er0DgFfeXOtDJIWfheZVxRzgEaCq67Nzi
	 Y3Gk2x/b+AvqXirM2/cIfrXRv4Bgz8BiH4ZkmNdtc+pFIagQT5ppoM6DYhzaoscGEO5FC
	 cExQHDOF3tn+b9eOH58kdvunZRppl4oalyMM5WAesVtLFX0r+dSG7ov7yYx9WtDmzSfXs
	 p9Orxp+1wjNO4qop0oqbuM/625FLYcWb9s9uZXqK1I5uMWTcbrPwZHt/Q3VMX7QNV+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Eeey8yR2;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC935606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC935606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Eeey8yR2
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id ABF2140E015B;
	Tue, 20 Oct 2026 05:15:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id W0VpvVrJUbj1; Tue, 20 Oct 2026 05:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792473323; bh=DANha9B5jzRY+YgctZgpuZYZVjFpnqDHnfddNLPRcbk=;
	h=Date:From:To:Cc:Subject:From;
	b=Eeey8yR2zC4NHaKNkhEixl0W1Tkjc7xfPFK/XDEbN3Gzh0Gou7dRvQeOYiTkgGFuu
	 nSQlquOU+Jk8hOpFuyKRoJDBW4pOk3JXTUHd4etH5Wads914fuXAe+azeOxgYNymJb
	 lw6B6p+c5NgnML628RGtaMPCyeCVXHpiVkZUCSxeVvApce6OTwMWXWXBRHeR8Ttmyg
	 WQGxI1QL7IkaP86Jmlj+cFiSm9inzaaxHeNMuC3MQrzscKZfwR2avElpbN+YsQdRsL
	 vWBQ3avY+kx/yDj8gaSwhhmXncB08Zt1U40hnBZaaYpqb72APixiAJYfVYLiWbpCFT
	 UZQ4ud1hySc0Rf3PFInELNF0CDy2jgWvTYWcAo912P2COqWkScJbZIqb6kijQ7BThs
	 r1r3Mzwsq9N23+3bnx2Dk9Zweor0fU7q9devFzNqu0LjEdv+Iyd8sACYL6kU2J/a0K
	 DWwpU8MKSwJiQ4/dfcWBJMp57ui2WCyh0fYRZPVdEhu6J50GiwnB66fI2S7cfZgxPs
	 pYgkkMIOwABLHWnXwy4fdN8HgMlXie1pcZ1L/jv9kaN8gCuPRgPRDsH4gbXX5LX7lh
	 plUPwnK3tnbrBpf4XY9KnOWJw34JLvBTuFWWSFyOH7q0Lz40DumxYiznRYlXJnltz+
	 EqLDhU2axbpJeNmZldtuCl7U=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9D00040E00E8;
	Tue, 20 Oct 2026 05:15:19 +0000 (UTC)
Date: Mon, 19 Oct 2026 22:15:16 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/platform for v7.4-rc1
Message-ID: <20261020051516.GAatb45LUEvNol_yJ1@fat_crate.local>
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

please pull the x86/platform lineup for v7.4-rc1.

Thx.

---

The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_platform_for_v7.4_rc1

for you to fetch changes up to edb2b6d8ea88659679787231253e1acefca63f28:

  x86/platform/olpc: Use named initializers for acpi_device_id (2026-09-29 20:35:00 -0700)

----------------------------------------------------------------
- Remove code for a no-longer supported Technology Systems 5500 board

- Use named initializers for struct acpi_device_id in the OLPC platform
  driver

----------------------------------------------------------------
Pawel Zalewski (The Capable Hub) (1):
      x86/platform/olpc: Use named initializers for acpi_device_id

Sean Young (1):
      x86/platform: Remove Technology Systems 5500 board

 Documentation/ABI/testing/sysfs-platform-ts5500 |  54 ----
 MAINTAINERS                                     |   5 -
 arch/x86/Kconfig                                |   9 -
 arch/x86/platform/Makefile                      |   1 -
 arch/x86/platform/olpc/olpc-xo15-sci.c          |   4 +-
 arch/x86/platform/ts5500/Makefile               |   2 -
 arch/x86/platform/ts5500/ts5500.c               | 341 ------------------------
 7 files changed, 2 insertions(+), 414 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-platform-ts5500
 delete mode 100644 arch/x86/platform/ts5500/Makefile
 delete mode 100644 arch/x86/platform/ts5500/ts5500.c


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
