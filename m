Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042284;
	b=itWVjl9Vv1P6631C87dqDKExNsydskDfh0cOCNvuKQmapVM7FHYToW4GPQr3HGiUu/m3
	 He1d5bKedrfAidfTbtHyDf0Ye3csB53Ydo+TMi2npNU6a9OuaMyj/qUctb1OXZQ7CXUM7
	 5LcS8A6y/VpmXCtpONAuAXfRiPmCXaHmMeJsDhgnZA7I2Clyj2XtN0kIvUIB4NsryXZxt
	 G9iT9pv1nKDEV1OkatNTmcVskGu7AlqjHe3W8Uip6khd7Ubt3vmAjPCpdFQqXjSE5yCaZ
	 lv47HTUr4queORfpW7FCOmc6lbF+h01rapYwG7LCU4ivcD7pfYFR2Lgov2GWrlZGJjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042284;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=0p/mlaTn2+IjGPmTD4Eg87y9QseS3N0pAeXCuAryT24=;
	b=3dJfW/FZGrvvs7dONvgprAvufXGowVJ0ocZBF4rJqq/9gkrIJO3JO80gEaKdjfWeeGOK
	 JmSMjkGXtxyr7d7KQC77k9mjrM9NVt/uD83kOrxTxnGBmYxNHNLBsx6AooKjdyK5K1CrJ
	 03W6a2XtMyaxtnTKEJxMCxQeTLRRyBh5i8bLI+9D6PXuROd/qgJ8RkZ2FSejMKt5mhxgI
	 bRQ6folvGgGE1ExNN2SfTlkQxaeFEEaTN5f6xqs5cvvEmPI4+9Od29FfjmHwzi/eu3K4g
	 NJZtA28QesVnUa8orw9cU9M9nCqJYvaVQvqbVQmgx/ULRuQOZq9+vzP76o+9d1JVw8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VnXo6gFW;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4003606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4003606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VnXo6gFW
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so2228427a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042283; x=1793647083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0p/mlaTn2+IjGPmTD4Eg87y9QseS3N0pAeXCuAryT24=;
        b=NW5sHHW5mHGnIAHzhm/VyZI2z+/NNXoTezedsqlwskf2kycw7DFM2tNJHzB3XCTnRG
         KNXarcIvF41s+hTf0a1iMGM5AX02+PODTjlsWvep/K3w16ykqv4U5wzyDBMTGSvGZ4YO
         FfqwznNT6eWmulX/xBR3IYhGWLCrfvd4fF3Jr9DmVq8FdWtcvu+vJxbaK+yNp8IP3o+G
         O+96/zELiPpyZeo2xOV4Zdf5oi8eXnz6DQXdwmx94WFwT9Pgpogh/IlLEG6OsA34OMMf
         lzt49FX8PzZXiBWdSsaVOcNmnnTFJvd8zLNt8jRDr0YNbSAQnp4t5exbdA1VR90Yo1Hc
         bejA==
X-Gm-Message-State: AFq9FYLM1Ze0WDV7Rc2fSuMcWg2g2iu6G341LlnMRIy85wApT97lUYIo
	YZ6W1bfK37n2Nt6OtwsAhP2tYCyAOMM49gay+tr54z5E6SY2icO0hXfvKVNJ9uMixBXl4n1zTSj
	8GRJYKEPYDX5pBnZ/51Cm3JwEO7z2wU/c3OjwLzWEHjILyn4VvUIAYxCciF1K0Ta5IszyiptF+/
	UX+Jk6O5Wf4WT1Zgv0gBwpCJHrwgul6oS1uZm/QekMaSkmiNbhFwcZdlkS0Ot+uXwo1vDLEWfq4
	VXdm59saGDcEbnOLSnPGi4aNdQ=
X-Gm-Gg: AYBFou1rB/vm8ksCgkcP7iafibGn5/oVgOGXwYYSPv+kUUMbe1Dwt1EGwWpCLjcWB3M
	apxnP70LCtKcnHCmBZPjo9kNmoYKeI9J88g94FejEHt6RS2+1wgylXXMvMyTzsFqlWHkzLTkqwA
	N4e3pwk2lXZudEf7d00DB3Qh/sHyi2vuuEbT+bIln4i9ad3M2fpickvriiYJAwqnzOhFpn/tLn4
	NO1afHGZuLPMcnSFCVyf86sNFi6PFFUj/BScir5i0tIDeInNqsIIWfjEDO5Uad+taxC4iIvXBPW
	Rxms+VvXMkbWHC8kQoCXO6Ky1duYf1YrQP/k2BbZlZsHEN2J2drKFtfQrWD4rLLXac3cJREcqnF
	ADnCh9CoiiUlfC/NIIdieT8bvKIOrv7h46CHcV++cmFk/gukLu3TKQtzeBbFTRH44AW+/mzNQmx
	7gtmo3Jj/0Hs9PvSk2SELVnsqCy2YMW4pyX+Ud6tS1
X-Received: by 2002:a17:90b:5744:b0:3ac:9e76:aa9e with SMTP id 98e67ed59e1d1-3adea1ad770mr6678084a91.3.1793042283198;
        Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae4063d1e9sm344876a91.7.2026.10.26.12.18.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535066512b0so98839941cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042282; x=1793647082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0p/mlaTn2+IjGPmTD4Eg87y9QseS3N0pAeXCuAryT24=;
        b=VnXo6gFWH9nAhmmymggKFZZTI+AkfpYAmNp7DrWbikPLFr5SiGjsQSuc3lllB84tLx
         dU+FbJGy7NMcOM/jvc4SaDcmLF4tVSFZGlYo8fUhVgOhQbZy6B4BMivewgIGGiYs1Yg2
         zNE2mrl698m/8EOSJjbcGWdoAKk85g98j9OAA=
X-Received: by 2002:ac8:5f82:0:b0:536:11c5:1dc1 with SMTP id d75a77b69052e-5383b653983mr109740071cf.76.1793042281919;
        Mon, 26 Oct 2026 12:18:01 -0700 (PDT)
X-Received: by 2002:ac8:5f82:0:b0:536:11c5:1dc1 with SMTP id d75a77b69052e-5383b653983mr109739171cf.76.1793042281166;
        Mon, 26 Oct 2026 12:18:01 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:00 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v3 0/6] Fix SATA support for NSP SoCs
Date: Mon, 26 Oct 2026 12:16:12 -0700
Message-ID: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
which was broken due to a number of things:

- the SATA PHY assumed separate PCB windows when a shared one is used
  for this generation of SoCs
- the clock/reset (IDM) was not being configured by the driver which
  meant that depending upon what the boot loader did, or did not, we
  could have had the AHCI controller still in reset by then
- on some reference boards, the AHCI controller is not DMA coherent,
  assuming so leads to all sorts of timeouts, data corruption, etc.

Since this touches several subsystems: DT, PHY, AHCI and DTS, I would be
keen on having Damien merge all of those via his tree if acceptable by
the DT and PHY maintainers, I am OK either way for Broadcom SoC.

Thanks!

Changes in v3:

- actually submit the addressed feedback

Changes in v2:

- addressed Damien's comment: comment line too long, imbalanced IDM call
  sequence in suspend/resume compared to probe

Florian Fainelli (6):
  phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
  dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
  ata: ahci_brcm: Initialize the NSP interface clock and reset
  ARM: dts: broadcom: Add the NSP SATA IDM registers
  ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
  ARM: dts: broadcom: Enable SATA on BCM958625HR

 .../bindings/ata/brcm,sata-brcm.yaml          | 20 ++++++++++-
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi       |  7 ++--
 arch/arm/boot/dts/broadcom/bcm958625hr.dts    |  5 +++
 drivers/ata/ahci_brcm.c                       | 36 +++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-sata.c          |  5 +--
 5 files changed, 67 insertions(+), 6 deletions(-)

-- 
2.53.0

