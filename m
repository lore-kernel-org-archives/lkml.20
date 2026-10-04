Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2641FB1;
	Sun,  4 Oct 2026 03:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791086397; cv=none; b=PXmXTZB8I9ra8SDIKCwiVc23Y2ljEVS35zJNXVdumZIGNSHKIIKix61C2XP0vr251P3zjRloUMlKOMc/WqLDVi2rDkMLNkoCFATZnLe+Hkxrhb3qbJcaVKUnYTOViBlIKR7dtTzH1/LjZTLYn/yT4YgupGaKFBr79lXcX4gWCD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791086397; c=relaxed/simple;
	bh=ZXm5Tp3Cv6uPdj7L5puYAvd6KkreOAA5RvvUD8pUw0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fNE3hp05LMbknOX9Jo7WP1GwebHSyuM87aAroDbyEK4058wWdbuwuJqKU2eULMC9FWWVsE+mFAkFJHTFQOqbY6tkagrG1myR85GwK/r9TC1F4p9a9m4rBi9H/m8GYyoIfQ45YmQfmymvzrkrCXEH6mwbLVKC4a+gbO8G/OfMgEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VDd2+3ER; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VDd2+3ER"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 581D040E021A;
	Sun,  4 Oct 2026 03:59:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5ppTorZNpMu0; Sun,  4 Oct 2026 03:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791086377; bh=k1FuTy89Fo5PtSlYo+7PHjRmcLUAPD+fL6taNzxDg+0=;
	h=Date:From:To:Cc:Subject:From;
	b=VDd2+3ER8slURJr78NAmowfHVN60nfC+cETjumty9lDeCDhjdHGPO3SWSrK731uKP
	 OpRvyuvfOvYbhWh6UbW/J7IvMnYfOQm2O011mQrMFzDKE+yHwZFAfdla4ZFGYl64vM
	 d9Gk5DFivXjOJJA4rAxJmSo/33T3BUlFtgDmNUoU9bLZmJf0xI4EkSg0rv7vKItBAz
	 LiAfPveJ5nPwo4vMasrVV0mU0DJq0xzGXeDatCivFMlO84FT9yyq1MSLNFp/Qvzetq
	 ZzQKOjF7Xs5Arm/AmrPSuNcD2DgWr6E9eUTwtJy0nQ8x560o+qqltdvYvn0qrbp9Pw
	 r99eAJUiAr4GEVLTrXn3CsKQrMQvKOz1/DRkzMAeS3FirPA/XtvevUomMK4/wxjjsv
	 shbsngHTOgmB3SmqSdDY1KtNbyXP9SiPsWIyniUVDKFhTwAa7EXskAdcMrav0rQScx
	 k0eHCkV+xQ9YfRNIokgs/1aJ7XUU9xLI5DZwhzNyM0NNNItWIPKfaJg2yd9d3ByBAC
	 HYt9qJ4A+UP7pXmXAU21UqtLwXuZm6lkj94cs3QkYHVnOTtVr8iIH7eejNlaO2PcW4
	 SnPotI0hZ6BkCIB4z5Yft8MvDdZoylNwW4vc+ajnFDIHO3G2WM0/ko9PT9913+zSCn
	 EJuxOSrIlycNsfMfNQzJqiIc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BA11240E01B4;
	Sun,  4 Oct 2026 03:59:33 +0000 (UTC)
Date: Sat, 3 Oct 2026 20:59:29 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC urgent for v7.3-rc6
Message-ID: <20261004035929.GAasHPIYlVqxw08xmc@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the EDAC fixes lineup for v7.3-rc6.

This is more of the new normal of LLM-induced fixes of error paths. Oh well,
they should be done eventually and hopefully we'll be back to normal
soon-ish... one would hope... :-P

Thx.

---

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.3_rc6

for you to fetch changes up to 5f43a2d35d5e748c09a50a98fc766dc95bb3a6bd:

  EDAC/versalnet: Drop remote processor handle refcount on driver removal (2026-09-27 14:05:10 -0700)

----------------------------------------------------------------
- In versalnet_edac, properly release a remote processor reference which was
  acquired at probe time, on memory controller instance remove

- A handful of Altera EDAC driver fixes:

  - Fix device node reference leaks covering both the success path and the
    various error paths, and route the single-bit setup function through the
    common exit label

  - Fix a use-after-free by releasing the devres group before freeing the
    control info structure in the error paths, since managed IRQ handlers
    could reference the freed dci struct if they fire at just the right time

  - Fix a memory leak by freeing the allocated control info structure when the
    devres group open fails in the Altera SDMMC setup path

  - Remove the __init marking from the Altera Arria10 setup paths and their
    helpers so they remain safely callable at runtime, including after
    deferred or re-triggered probing

  - Prevent the Altera driver from being unbound by removing their ->remove
    callbacks and marking them to suppress bind/unbind sysfs attributes, since
    unbinding could erase active system memory

----------------------------------------------------------------
Dinh Nguyen (4):
      EDAC/altera: Do not allow driver unbinding
      EDAC/altera: Drop __init from ECC setup paths for re-probe safety
      EDAC/altera: Fix memory leak on dci allocation failure
      EDAC/altera: Fix use-after-free in error paths

Guangshuo Li (1):
      EDAC/versalnet: Drop remote processor handle refcount on driver removal

Rounak Das (1):
      EDAC/altera: Fix device node reference leaks in the SDMMC ECC setup

 drivers/edac/altera_edac.c    | 67 ++++++++++++++++++++++---------------------
 drivers/edac/versalnet_edac.c |  1 +
 2 files changed, 36 insertions(+), 32 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
