Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85CA59B69B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096583; cv=none; b=MmTR7QoM4U3hYgjmuSCzwuOQsY0BTSs6MuLuaVXVcKgNlz8YaTkTbvEtk2DZEawXOjFL4diVyPszEjlKZXLSTD7a08Ko9wtls1jDqAkFsiSVqMR1OSc9MKN2gkn1Uu+rmLkXZqmYoEr0y/8zkhJpaGyf06tmOcTQlE1sfETFGkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096583; c=relaxed/simple;
	bh=qnwLbPGVsMK6OAjr6047Fe3etPwsuFGTr5s1R53oGhY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=La4jHYZcpEJNa4GJ+QYhq5taXWFDxip/3EZIRIdrYrMNDzDRx/PeqmNx8z/2nSMeHJ47F4jYAQEMWUpanGoESgkfdMv/WYu1fLg9WwexGGQAkGJYxn7UevctkO16l8WVwBpmctEl0+qd7yOiBhP3VFR7vYXWxU+7R77TxQhinN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YTMJF580; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CxsyJFsv; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="YTMJF580";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CxsyJFsv"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 443ADEC0012
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:36:18 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 15 Oct 2026 16:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1792096576; x=1792182976; bh=pI
	3zZ29AOcHjmwZ74HnOrjeoVGmUraKW/9PCwaGZyP0=; b=YTMJF5803X6pMtqrHw
	AFEsYO/M2SkmFajECfd5MK/t5xzx/xk9wipcpD7n5uiTvk8K9Bq+q7J5dMnhnt3Z
	BnfPj+H7JYuKIDjD6x7WYBcfmyU88DBqJdWk7ITw9kA1+4xPfmxsThOMjLamjYis
	4FrZsi8gd9/AeBruZ5+5i6iyD2V9UHIoGZikEmS74fgWUoIDezmq2jQv+ifHD7Ri
	6tCHp+ErGyOu0qxIFta5MeHfhNUoJUpixoIEiMq2iJ79BvVO7focxg63ElPj5c7l
	lcHoSH+sIBQ9o35R914b/AUgG15vXlnRTRc9wNRmjvVazHI0dKnIKdCoXBlZFA9Q
	qEPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792096576; x=1792182976; bh=pI3zZ29AOcHjmwZ74HnOrjeoVGmU
	raKW/9PCwaGZyP0=; b=CxsyJFsvV1DRR/o21JtKYclBcnRnMr5DfJEEmw1GWZow
	t8+MjEAfI3WYlLJf3R1kn8c0Hrz5LQmOwswpqypc64GydHpGY2KbXWwRAyKbxgJI
	P3pP7anBFoMhHa78U6bB8qhJfaJ9eYlaG5/Hhb3nxNuBO8xUkaMcgZy+P2VB/j5N
	uHBXNPf+g1dJV2LQJ/Su18eA12EPUaJOnnAg15xsWgbHeJ7LJPJODHbYEl0V1EN2
	cGVITG5TRfuN6NO9oNVs/kWUl1UV/AWqXhFYMXRNg09tvo6v4bu1ykEfHrpkRkv6
	1pzK+4WvXlofAvACHFbOoPXcRdjtp6iUNxehggnzGA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792096576; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:hvMR66WxhnHL90WtXNlYwp4PFpT38AKBnaFeZJvmB1ehCSy
	VIttZQ4ygHCicaMVFL7sH4gaD/nRZksFU0sFaYltjn47GS9e8aWvtamiWtuyeoW8
	6VV0m1i2Bd5Z08Qs7CxaF+CilcMhvG3h5+7QgmnapAFw9tl6ik47SUBM++MSKowu
	KTB144BAVBXMvh+vuaDBoHN9fhpgDa3zrztFDm+gi2O/OHt49YLtaeVumXrKPSMU
	a7h59oxJ/kiZZ5SrHjdWhJoAyn/mRqyDU+Q0qaNQLMVWTzLMH8NTcPx+zn+HqUhJ
	ktWIlQ2uzRlJRjaBDrjbfo05PLQPVGdo0XqGLCQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:fQPqkfCpephV9SKBRb5ukJh7pWrDjJwPJ9ycN0dM7yg=:qnwLbPGVsMK6OAjr6047Fe3etPwsuFGTr5s1R53oGhY=;
X-ME-Sender: <xms:PDnRauws3QurykY31iIHFupbBHjHGXwlZcVQoMEHXOowDv_E6cA54Q>
    <xme:PDnRalH8prAb2Cofn6dT1I6x8pI6hT6sKnHSpSjmFDlp8UNp4IrpvNZwI896DlWjc
    0Llc86u4AQ_4FjbcA54fUhWrBPUD0T8PxbyPPWlo4esKGhHtz2mLUM>
X-ME-Proxy-Cause: dmFkZTFx0GH7V3XZb7Wc8HDaC57T6GbevYcYxPWXz4GjZ/5D3TvnwOhgZe4MIOwk+NClY2
    X2+h95Due4metXrYoPYdsiQd8bl9CW/jRUNwTLeHRsEq3om57sow8rXJFIIoH9UYXJzAF/
    3BDBcIDOi5FXNolyog3G+n2UTiWCIKwKSKfFHmtZgFdtZGwY1q/Yb6FmA/Iy5Fgw7FDeb/
    lEr8ySqcFKyfgi13ytdaPQUtUn8IS8Cva3zbi0inorPksCtiiiFw6N+E+QbW5Jmn7I6YSy
    tn+q+vXwiK2aOW8GviZ3XO0xSWkkwNIXcZGAgu5l0C/Lmo5wQmK6R9FYxM/4WX5lpbdYWZ
    nGuI7D8c3LK7hJJU6Xjt6e19w39oy8YCizklVBi+SgEaxJt+bXipXhyrLIQQmLWAu2QNKz
    Q/2hVihZZPRYWG7jg+ocDEXwajUAQAIOc/RDV2EsaxGPj1cN1eDEQx5G5LAMYyiBgz3T7y
    4VyIHQIYPQukGuNYX5oWtsAG6F7PouNDq5W66RJs2xtP/cxkIIuPDKq3PklTBiYDHEHRk4
    inNN5sRTETxKie8UestpgkzttKcPWS2y8LLBb/WLk1glkjA9HZSRbR4KY+nz5EN91wSuzo
    +NnlOJXwzYjmzu0IASDjaJScf68i8pa+ep8Xghty76+9+fwDw4YRPWfXcTHw
X-ME-Proxy: <xmx:PTnRaqYYPdpaVvSOpFIYJ7l7IFZ1G_5TTZ96nIxf3yUhyZs4zoZgcA>
    <xmx:PTnRao3wxstVxKNDjTxbhFLm4be3P0YjhQH6Q8eP00v5HSx_JTxoJg>
    <xmx:PTnRaoctug8tdOJbVQYcNrLs9FCL4jCoIPXDkvtMnpN177jQp3Z1Gg>
    <xmx:PTnRahGTzRz5a0-GbHYspr3_WSTcAMcigOZVgynzEXmPPsx4igsiPw>
    <xmx:QDnRavcLBnUJd-mXN5CV5C0SHQ8uYWN2oDRUu-Q4SXt5PPrDoIqQzG4N>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CEE2632A008F; Thu, 15 Oct 2026 16:36:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 22:33:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <66aaa5ec-c39e-4652-8607-4e2ab6541a64@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.3, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 1fc2d80928b706147e371602dabd0ba927dfe4a3:

  Merge tag 'tee-fix-for-v7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes (2026-10-03 23:33:02 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-3

for you to fetch changes up to 59f522f5a0ece96ce051a27d15533667a1d0dee8:

  Merge tag 'at91-fixes-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes (2026-10-12 10:27:57 +0200)

----------------------------------------------------------------
soc: fixes for 7.3, part 3

A small number of last minute bug fixes came up since LPC.
Most of these are for devicetree files:

 - Tegra264 needs fan descriptions to keep the system from
   overheating

 - A cleanup on TI DRA7 caused a regression on PCI support
   and needs a fixup

 - The beaglev-fire board can no longer probe the mcp3564
   sensor after a an inconsistent update in 7.1

 - A few fixes address compile time dtc warnings on tegra

The other three patches are all addressing minor problems
in tegra drivers and the sama5 defconfig.

----------------------------------------------------------------
Arnd Bergmann (5):
      Merge tag 'tegra-for-7.3-soc-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes
      Merge tag 'riscv-dt-fixes-for-v7.3-rc' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
      Merge tag 'omap-for-v7.3/fixes-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into arm/fixes
      Merge tag 'tegra-for-7.3-arm64-dt-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes
      Merge tag 'at91-fixes-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes

Conor Dooley (1):
      riscv: dts: microchip: beaglev-fire: remove double definition of gpio interrupts

David Oberhollenzer (1):
      ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition

Jinhui Guo (1):
      soc/tegra: fuse: Add missing newline to APBMISC error message

Jon Hunter (1):
      soc/tegra: pmc: Fix uninitialised clock rate

Pengpeng Hou (1):
      ARM: configs: sama5: enable current Microchip KSZ DSA symbols

Thierry Reding (4):
      arm64: tegra: Add PWM controllers on Tegra264
      arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit
      arm64: tegra: Reorder reg and reg-names to match bindings
      arm64: tegra: Add PCIe root ports on Tegra264

 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi       |   2 +-
 arch/arm/configs/sama5_defconfig                   |   4 +-
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  13 ++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 180 ++++++++++++++++++---
 .../riscv/boot/dts/microchip/mpfs-beaglev-fire.dts |  18 ---
 drivers/soc/tegra/fuse/tegra-apbmisc.c             |   2 +-
 drivers/soc/tegra/pmc.c                            |   1 +
 7 files changed, 174 insertions(+), 46 deletions(-)
