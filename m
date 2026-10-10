Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEE432142B;
	Sat, 10 Oct 2026 22:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791672017; cv=none; b=VpPvYbFRIUXNt1u7A20WshDyDziZI3zqbjAYHRfX9oFvAlCKgnlvZ8hs9N9DeS7Az4qV/6sgGwMeovnqq/ZCVfIF/UAwiLSfNbGMjPjT7a6r1XkqrUcht8uWNYneyYi5slxxDunpoHrGjPVFnrMF0yLCvnUZOevjO0a00qsWWok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791672017; c=relaxed/simple;
	bh=GtHoP63iPZIbUPdawW2RiplLrwc+rbs2HYfiK9uD2z0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NwxgNeiCcelFofn9BuI5e8M8idu/zU1axM54iicplYOMocaWmu06votmwL41ANhTsECF1+dr8fWFgBPwpmTLwGS3pCLMeWpLRpH8GaKfPBB8WQdC/800jD+ErpqONBNSugooGUGn2HR+2lTBHzjoYaKagCSE+pHobuFwKxTH30E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XOs4Vn+e; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XOs4Vn+e"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2508C40E048C;
	Sat, 10 Oct 2026 22:40:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qcWqa3Oc4DBb; Sat, 10 Oct 2026 22:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791672001; bh=LmapBEYR3R7x6MIahWuulBdCuxfiaUOHVo9p59VFJe8=;
	h=Date:From:To:Cc:Subject:From;
	b=XOs4Vn+eCyar2PRzHT730iGfkiOlAN6uOhBz6Yghw/09fCVJIDm4OyUa3Qtd3nOQ6
	 VTXgzjFG09MGw3Sw42ZkWrhxS1ArFcINg4ctVsv+YckgygI0lWYLBDLtYNdqg6Ig7n
	 ae2QZYaHGw1XEPu8latX7mDQkdKU+xpMNbJL2mywF9RLdMKAfmQ1acLfmL54mOo/gJ
	 HvbMhsZ1iE8OwDhC8IEdPMmwi/DXiiRstedRscRq3hpue+mYROge4PvjeW1gimvBKH
	 mSCoKkcuNnRjSe4Kmw83aobfCKS4rUDiUYjXdEev1l/WLGV6OPnwGlvLcPYJk6UTur
	 KvRi3+MtyrTSZtryZCMAXF0G65Mlf7gSenj68pUIHkaYh4mULn1JCuWCbh7twzCwXk
	 gekqmS0Fl+HdTAydFKkzXcMamUHrkGoY2BbBoldSbiGq6IblpQoYtmaDXkeVuHjCXe
	 khIliQUxj980kQBYXFA4yR1uVzU7qtCKPoMef0G4wIyS26tKhZ1/RohIu/JqlR4AxL
	 5Gg+RHDitDypjtwQ+a5RMpkEW2a2wCSdSWGDL7dJI8w1Oao+fZsqh7qfhczySrHdiJ
	 4lr+Vu8ns03RwGkzGLmcqh19Oyb4vSQZiwQ7uzmXzSS3TXCqSaB+8dH/tvtOz5rNJ2
	 xUKYYGzhi92eDGnjaKm01LV0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A72FC40E03BE;
	Sat, 10 Oct 2026 22:39:57 +0000 (UTC)
Date: Sat, 10 Oct 2026 15:39:54 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC urgent for v7.3-rc7
Message-ID: <20261010223954.GAasq-unx3IIBs4zTh@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull an EDAC fix for v7.3-rc7.

Thx.

---

The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_urgent_for_v7.3_rc7

for you to fetch changes up to 7484bc43ba6b8e189b482db5b75e7842890a82b1:

  EDAC/amd64: Mask UMC chip select to the four implemented selects (2026-10-05 11:02:42 -0700)

----------------------------------------------------------------
- amd64_edac: Shorten the ErrorInformation field read from the MCA_SYND MSR to
  only two bits. It is perfectly fine to do so because no system ever
  supported more than 2 bits of information (the Chip Selects used were only
  4 maximum) and newer hardware will use only 2 bits anyway

----------------------------------------------------------------
Vishal Badole (1):
      EDAC/amd64: Mask UMC chip select to the four implemented selects

 drivers/edac/amd64_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
