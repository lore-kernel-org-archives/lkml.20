Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B1979DA;
	Sun, 13 Sep 2026 00:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789259016; cv=none; b=s+0Wh+XEtn3KoyaMLgc1jNQwoPEmdVqEUH9byFTqnNODxzrmttEJkfcY3Zlv2uLGJ3xtGC3j3TUHUMek0GpbApXe1la25x5diIesAEJUuv1tKhHHntCOiErz7YA+hBc/ncTSWqu0hEG846ewoIUsL104vhKUh8oVsWF/djcT1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789259016; c=relaxed/simple;
	bh=U+lUCV8rUjGu1i4IQci+lo9TAJrS1MeqRPaQCqLpsDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mlwYcXavG0UgPel5/X2MChOdvXagPu3KWk0LjFF/OtBLZ13zL3N92/qDb1XUzF6HGlhFkRlBmQWK0hbiZaoVeR6WLgVMO31BIrDsLfJUPs74AyFhx9ZJP8yxI+ihFOqeGY2j2RdDD/xVylnwbqxPy1BVqWSBNsR6gFhcUbWFYq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jcsATpaF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jcsATpaF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6EED440E022C;
	Sun, 13 Sep 2026 00:23:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mTUqYkDGyN5N; Sun, 13 Sep 2026 00:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789259004; bh=Kv7VbwyPc5L/1pzXSFT3BuccvcK/UtoLS4ndjFDtzWE=;
	h=Date:From:To:Cc:Subject:From;
	b=jcsATpaFFjiEX9t4UKUew0JEszk7CbWmpgaxloQ30X63BRUGoScdPvz0lmqGBBSWZ
	 llA6+M2hBr1Iy2cmOXWvR30zj/cOVaYB0+NvepC4G+VDPplIpw3ELUKCxYuCvVWddJ
	 /NcQstf0dtjPReVDD5yw5wTpnNbiZXmfbZ31ypxJ99pk8Lh+HASswdU0SRqmIQaFRm
	 LEC2DpkYCf2EHgzp7qc5MkQuDN8u7WcwadxT8HhhQ3GNdU4oClC1pzMVTxZ/APktFf
	 oj/Ke0CHcYPtOf+mcYHiLsmgwubAo5/jty432OBeXEMDuLMVHmXDToAcwu3ZTHOdkh
	 H7n2GTTWN4Tt+PH8PGDVs93b90/BxchZAxma3YJGWzVnkbHbyS0LUIiquWi4/o9e9M
	 NMtm70Dz31jgjDg5cPhUWE2oIiTCqQr8Q2KPJnYWAJeh1nJeJ3tpl7yLQYZTUvH8fz
	 KsQyipwmF5bXlFXMOPOunV1u8ze/H+7SpSFVk1+haSM8wAzvTj/LoRULADbMypv3rX
	 s/k8kvod7gShZiXIhyduHeTsIWIpaAz6YhqADGL6USP6hh/xbGzNTBrxcHZtW1Aodr
	 OfrXwgAyqMxDTDiyUpsyZ9/yJuKN7lb1CSaFE+ILZ+7WCLAms+XTgFdHBSg4ZRObp8
	 llqfz0jAKoANuTCR2hI5nO7A=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 274C040E00E5;
	Sun, 13 Sep 2026 00:23:20 +0000 (UTC)
Date: Sat, 12 Sep 2026 17:23:17 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC/urgent for v7.3-rc3
Message-ID: <20260913002317.GAaqXs9SdEYi-p0K2g@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull an urgent EDAC fix for v7.3-rc3.

Thx.

---

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.3_rc3

for you to fetch changes up to 9868f5c077dfe0b606331f2e782484f91a5789a5:

  EDAC/altera: Use parent device for devres in altr_portb_setup() (2026-09-07 21:29:44 -0700)

----------------------------------------------------------------
- A single fix to altera_edac to use the proper objects when performing
  managed device operations instead of using temporary shallow struct
  copies which can cause dangling list pointers and havoc eventually

----------------------------------------------------------------
Dinh Nguyen (1):
      EDAC/altera: Use parent device for devres in altr_portb_setup()

 drivers/edac/altera_edac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
