Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434443;
	b=MHQFFU36dUFwu//wZLjXKKZKMT/IZuXtaSeMluxbVM+Uzlx3WvHvnAQvTtVI/gTuDoi0
	 K4XQT66WfxLu4DLiYtRcFT1U/aAnOuzemeTdxXs6ZN/PX60cJIbxjIBPkLpmDfhg/TPkW
	 8hXoQ7EQTenJDVtZozyR0DA0iDdwZ7cdEzuRLcLzkztMN+2Kc5TWRODCoDrVAbnUMiCzo
	 tupSczMC0yYzIn9iOQIgz6Z2GHXX2xfxtBXhTwb1HNrLXhP9iJBKds1FDmhVKF6BjBVKx
	 PscxoT1WP0jqS334mz4mYV6dFH2a5jYMDfRwtS6g3SfKGxGnyFLVZSzO3VwVFcwljow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434443;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=W9kXttG4rClrDnvywgIgW0SroYJcWm63UforQOlfVCA=;
	b=zBsRxETq6I1EjnZsIqcUUqqyDMLptN/DJZtCY78Z0KNtRNSA03h7j2ibOXZnjmahj0ma
	 e7CAtrw897sSCq7Jp05CmjNmAsN1/mZu9VAFjtYRNy6hhH0wkZBy7nWGzSTUALWFa32kk
	 FHmjwLPbjPiY2RTdKh4MtGkFVBLeuBNMHG/J5cfAhdeQxDMfyj7ZFt1nmEhSxjAvxF5my
	 1zCD+FLEtNehCTOCeQS9ZFCBYZMcaVEia8hAOKN0Vdtzw/KTOoRh6cbKpJ0OIfgZEEVSU
	 tlgm4m/hvZsN3iggLqPhEf2w7COtKAegVMpCN2nbsbesNdIA4UZTAeyaCmXy5tVSGzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=SPTx5fhM;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D24C60A5BC3;
	Mon, 19 Oct 2026 18:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D24C60A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=SPTx5fhM
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 66ED540E02A0;
	Mon, 19 Oct 2026 18:27:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RkNoaNnqF-b2; Mon, 19 Oct 2026 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792434435; bh=W9kXttG4rClrDnvywgIgW0SroYJcWm63UforQOlfVCA=;
	h=Date:From:To:Cc:Subject:From;
	b=SPTx5fhMhLPz3DbODFE6FTTJxiJe8ZLyXwtE0QAIzzgKLgyxuurVAvsnHc5gWfYHN
	 p8RbtHY1zvVAYQrdrvLMuVLMPHaTCu6XCTyAt8f/if+Zl18d1xvV7Z+L5MI89qA3Z8
	 5Fe6ot/mHTpOo5Y19o34czuwqgISnxrvm4SgfNch91hXfnHEcwZtVx0eW9p5tQxZsx
	 RAqWd/q4NAU1CE8lokkPDTI9bRroEbf3NiWlsE8z1sqO9Q8kV4nyri6KhTRJA+GHO2
	 CdeZux/zKE1t5bpjbHJtF4CZH0WCPZsxWqoxeu+3mP3WWfXIoW9DRT5/jw+6VY9bb9
	 8i0N4dfJmbWYPpWu9M9DN+r/Sw562B+zigKMQkr++oquCcmCoMjcrCLBOC5DljCXCX
	 4zO8Ylf7n9sb56BScBLBf0AEHwwJ6jf2hzr8UmI4FOzcpkpBxDyPSlc/QOKzouhPeL
	 h7DUOMDjm7mhf3nE1CLT+nlyGxlImRNr/qnG1yeOS7YAc7iIhI1on9xWndrWoBMIPj
	 2OTXlsXiwr0sQBnMq6YJ96NOoZiFG81un+GRtBZo5LoawOFTvx5N7FsLMJeR/c15x0
	 GdbELqIczilPpVIEl6mUFW1Mn6ysVlxic/IcPlM4JRn0H5T6H5Lj8Rwe1rYR+33n14
	 93fskVqfI552t07BFZcxgLYE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9BF6A40E021A;
	Mon, 19 Oct 2026 18:27:11 +0000 (UTC)
Date: Mon, 19 Oct 2026 11:27:08 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] EDAC updates for v7.4-rc1
Message-ID: <20261019182708.GAatZg_AcjQ76Ubjvt@fat_crate.local>
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

please pull the EDAC updates for v7.4-rc1.

Thx.

---

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v7.4_rc1

for you to fetch changes up to 5dbc181a22ae397b53adb26bc083f206b9631c83:

  Merge remote-tracking branches 'ras/edac-drivers' and 'ras/edac-misc' into edac-updates (2026-10-18 12:01:02 -0700)

----------------------------------------------------------------
- Orphan several EDAC drivers: i82975x, x38, xgene, i3200. Those have been
  receiving just drive-by updates and no one really uses them. At least there
  are no traces of usage on the mailing lists. So, with the advent of
  AI-generated fixes frenzy, and because no one can really test fixes on
  those, it is time to sunset them and point them towards the eternal happy
  hunting-grounds

- Add a dummy EDAC driver with which the EDAC core glue can be exercised in
  a VM for the cases where one does not necessarily have access to the
  hardware. This glue should be extended with all the necessary functionality
  that needs and can be tested this way

- Add an EDAC driver to reset bitfix filters in Intel hardware. Bitfix
  filters are a hw mechanism for tracking stuck bits in memory and CPU arrays
  due to, e.g., silicon aging. Those filters can become clogged by transient
  errors accumulating over a long system uptime so this intel-bff (LOL :))
  driver glue resets those filters on overflow. Work by Qiuxu Zhuo and Tony
  Luck

- Export get_cpu_cacheinfo_id() for use by the new intel-bff driver

- i10nm: Handle the case where hw disables memory controllers which leads to
  reporting the wrong memory controller when reporting an error

- The now-usual AI-powered fixes and other misc cleanups and updates all over
  the place

----------------------------------------------------------------
Borislav Petkov (AMD) (6):
      EDAC/dummy: Add a dummy EDAC driver
      MAINTAINERS: Orphan drivers/edac/i82975x_edac.c
      MAINTAINERS: Orphan drivers/edac/x38_edac.c
      MAINTAINERS: Orphan drivers/edac/xgene_edac.c
      MAINTAINERS: Orphan drivers/edac/i3200_edac.c
      Merge remote-tracking branches 'ras/edac-drivers' and 'ras/edac-misc' into edac-updates

Bryan Chan (1):
      EDAC/skx_base: Fix ambiguous bitwise and logical operator style

Myeonghun Pak (1):
      EDAC/ie31200: Disable PCI device when probing fails

Pawel Zalewski (1):
      EDAC/{bluefield,loongson}: Use named initializers for acpi_device_id

Qiuxu Zhuo (3):
      EDAC/i10nm: Fix Granite Rapids ADXL MC mapping
      cacheinfo: Export get_cpu_cacheinfo_id() for loadable modules
      MAINTAINERS: Update Qiuxu Zhuo's email address

Tony Luck (6):
      x86/mce: Add enumeration for Intel bitfix filter reset
      EDAC/intel-bff: Add stub Intel bitfix filter driver
      EDAC/intel-bff: Add Diamond Rapids support
      EDAC/intel-bff: Reset bitfix filter when it overflows
      EDAC/intel-bff: Compute unique ID for overflowed filter
      EDAC/intel-bff: Report frequent filter overflows

Wentao Liang (1):
      EDAC/i10nm: Fix mdev reference leak in i10nm_get_ddr_munits()

 MAINTAINERS                      |  26 +++-
 arch/x86/include/asm/mce.h       |   5 +
 arch/x86/include/asm/msr-index.h |   2 +
 drivers/base/cacheinfo.c         |  17 +++
 drivers/edac/Kconfig             |  22 +++
 drivers/edac/Makefile            |   5 +-
 drivers/edac/bluefield_edac.c    |   4 +-
 drivers/edac/dummy_edac.c        | 191 +++++++++++++++++++++++++
 drivers/edac/i10nm_base.c        |   2 +
 drivers/edac/ie31200_edac.c      |   4 +-
 drivers/edac/intel-bff.c         | 295 +++++++++++++++++++++++++++++++++++++++
 drivers/edac/loongson_edac.c     |   4 +-
 drivers/edac/skx_base.c          |   2 +-
 include/linux/cacheinfo.h        |  12 +-
 14 files changed, 567 insertions(+), 24 deletions(-)
 create mode 100644 drivers/edac/dummy_edac.c
 create mode 100644 drivers/edac/intel-bff.c


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
