Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1A754704D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242270; cv=none; b=LMODnjlZ6EKglS3HWMAmUSc2Fn/Y9yZOsFyNNXbEVimkNEAChTqtBmWRUjsG8ZHv5iqYpD7zDwvAjhsz52Ynyzbc3m1giSFBzVLzFJM3JhzvftRvxgVdtPFBK2LKmoZSmLaBOjnlI8tVADs8BZa99hGxIKcl7x7DOZq5+1u/uLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242270; c=relaxed/simple;
	bh=au3jbxr6y4LL+gq0xCbn7TrW5KlkAyo1ztERHFp3jrM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QTq+9qTIlw4O4B6PNXj2vpI4TprPh2NjVN2p4i8N43VLS5nJTNeiZ+DL/z18eiIXhTLkegAH2nTmS39pHZD4mzqWkxeHxdaMXU7LNMXKwT+xFXwudjlXinODb6x95LxBR5idTyHp/6VhQFe+nRU+EzAh+W/XrAC/i4qwbls8Pn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=053M5NxC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="053M5NxC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C0241A0FFB;
	Thu, 24 Sep 2026 09:31:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D7FB5FB45;
	Thu, 24 Sep 2026 09:31:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E628103294C2;
	Thu, 24 Sep 2026 11:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790242264; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=uXekq9sUZ1Rb9ztyZuQyMfRK+tlGw3xEjANbuSVm6js=;
	b=053M5NxCsOVxO8l3zPgNgvTbcOJMCCgBjlguC0U5GRR2yW1WUanOpnG235ZezsgTxaopLR
	IdMplu/cE8yiubEU0qvnqfsJZQMK2UOllRnYMuNDx8tbQPj6uACpbp8cXbaD0fzgCM1yR9
	M9m2Jb5JSF1lmjgjpp0VDFyJkU+hdswnYHel/KOR719xeGc+yRWcHroCBpXMbuFD84TJpZ
	OpGCZxC9yj0h1IB1G9TPa5T2GPyk9LRd1SN3xZcPM9zin5M+QmLSzkmxE0E7R1Q/OTZYO3
	3rup5Pm6kLh7ra/8jZ8UFkQd2R/wo6D5b02kobXc785DHebDKEi5/Sf84/rHsQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH 0/3] Add Renesas RZ/N1x EDAC driver
Date: Thu, 24 Sep 2026 11:30:24 +0200
Message-Id: <20260924-paul-v7-3-rc1-edac-v1-0-70be37c41a18@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NzQ7CIBAE4FcxnF3Dsv2hnnwP44FSUIwWA5Vom
 r67VC8ajcdJZr4ZWTTBmcjWi5EFk1x0vs8BlwumD6rfG3BdzkxwUfEGK7io6wlSDQRBI5hOaUB
 b1I1tKqvLmuXhJRjrbk90u3vleG2PRg+zNDcOLg4+3J+vCefe34OEwKHjVEkpJIlWbVrvh5PrV
 9qf2XyRxDtS/0RERmxZSuSEHbfmG6E3RNBPhDJSSkKpFRWtok9kmqYH8PZZeFIBAAA=
X-Change-ID: 20260916-paul-v7-3-rc1-edac-1f479f96fc57
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, 
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790242261; l=1267;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=au3jbxr6y4LL+gq0xCbn7TrW5KlkAyo1ztERHFp3jrM=;
 b=CjyjO+FlJaBOP6kHmk9aT1tFkVhaoV1ryhjaJYWNilQ2Xp2Dl6HYk7OYCl3JoJRW29dj1iLL9
 4Sn31n1+Gh2BA5rSOcK9m80HRdFtQ3baL4zNQEPCHfuji9aRd1j8LqE
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The Cadence memory controller found on Renesas RZ/N1x SoCs supports ECC
with SECDED.

The memory controller found on the r9a06g032 supports at most a single
DIMM of DDR2/3, up to 2GB.

Add the EDAC driver for this memory controller, and the relevant
device-tree binding. Also add the EDAC node to the existing r9a06g032
SoC base device-tree.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
Paul Louvel (3):
      dt-bindings: edac: cdns,ddr-edac: add Cadence DDR EDAC binding
      EDAC/cadence: Add Cadence DDR EDAC driver
      ARM: dts: renesas: r9a06g032: add EDAC node

 .../devicetree/bindings/edac/cdns,ddr-edac.yaml    |  62 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  10 +
 drivers/edac/Kconfig                               |  10 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/cadence_edac.c                        | 333 +++++++++++++++++++++
 6 files changed, 423 insertions(+)
---
base-commit: d9f39b2c0579f313d14954a9ec584511c543aab5
change-id: 20260916-paul-v7-3-rc1-edac-1f479f96fc57

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

