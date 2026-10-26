Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039366;
	b=lteZxrJCyNGy0t9gW3ttGbOJ09WB+lTqHqXWf9fZPZrOBBR+HwIoubXAmlkkbKhbEX7f
	 zaD0Q05DSZdAEHbDS5VYyB8LqrlnD8nO2m7NltmIZCEkCJCdT+MLinoU26vPZQ4mOBMeL
	 cA+Cp2+NLsVtYTAMr3vbGLzEVbiujMcMKQn9ioiu5R6jSPSUMwa7gUa2AScWxg6d3g4sD
	 17SqUG4UgxJVSWYe0sJmDPgFMeE9p4Wfd9uJU1cqK6U5LpigRrb1bDesV9EUtFOOMEZEn
	 Nswqi+poCmh3kCcgDsHx+x4PIfAE4ZyffZ+eEZyZciHqNa04BB19rG1quZhrtCOAfHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039366;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=hGqeu2xbMnoE0Rt6DQ1E+iwd2CSMeKN+5rvls1JxyJk=;
	b=gnftEQn+XUCQdGjB4bBfdmTBMWaqeaxhPytfwx/Qn6jMJYq2TQHanOS5gjHiNFP7kKS5
	 97f6ocr/cG2yMWk3NzPeOk1cy49I96S5T1F4rIjDPRI1rlJHgmxxPbn1N4IWKmjAGVoPo
	 rTvpjWEeR3Z+LbeKQVjHraWFhMhhGAlLXGlm+kgmcsMZpO6BRaRmF5LzdL/OnUMDPmxuh
	 hHLyq7KfIfMQMWZfy9OVyEuZ9s6ARxGyAk3o6H+ecncmA13A05iQA2n6FO5J+0JR0Ow3e
	 N/q+bfenwF27GpW4BCLlur6beTwTezq+66DzFzUITa0flo1BNetaQXU/xmVHjD7YAjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EkEknSoA;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D87C606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D87C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EkEknSoA
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so2222637a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039365; x=1793644165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hGqeu2xbMnoE0Rt6DQ1E+iwd2CSMeKN+5rvls1JxyJk=;
        b=rvTogAO5G0xsCdGPe+tAQmArCS19p8zgyIdiXhciaxZOi0RvsDe1Ke50gFmijAHfFq
         Q/rjFcszVOyHNrm5RwJwON/SBi2AiYxZHHCkv6zoTFotO/ulECuAsCM6lc1ZVJkiP0e9
         R8pMIQ18uD7eZKu1J/lXV5r2AsyPDfxh2jzCbbAgrIKCQ8LyOtBI3WWlp8qjSVWH9fFH
         jc72752a7nHCRv7BdlZcMun2AqIOFn0iL57NKSR7syf67Ld2FSPQkqK5OMFOMTn2Eefd
         mWm2PCncmM+qCNnrrRttsNKuknktAsyyaX6n+wsGBPw24jfLOM7cPOV8Ai+cTRQiP2fr
         kGOA==
X-Gm-Message-State: AFq9FYISkP6UG7n/i/6zA1JWevyAlcmUzZtpftkJ+vr1p/UlFJSrcoL4
	KdXVKZ1zKvgQuND8vjZrcCetUooCCxdqHqqSX5epOQahRz8ZYh9UyT1qZWOXrjovCODwZZCypn7
	HHf0hHTMkYnlTTwyWkiIO2L2qum1WAs/KZy30IAipV0Kpp9kz/d0ad9t214KJEzUSmeqDMdvmdb
	+CA5ti5psWDjU6BmzDDigJg1GYfg81QKirJzoZBaYpw+KI2Lf+PjUzeXtGN2pCvajfE5rI2KN2+
	985GQnZINM2kUu6UI4uLPMiCXE=
X-Gm-Gg: AYBFou2VT3kj3LK0fV5M7PF/o4wOeB9BWV/z8Y0CY8UH5+tPnotYC9pnEK0pPf9fGoC
	0ARyEdKMFhMMVbDSlVoV3Z4NUyoMTJRO7v6JJ1GlaUQYE8I/l947AbCyZFXb8qWlvHoDhakkFPR
	1IF95CbPKKCXRlWDuXbhWdyDLUXtBZxHuCUPZdg1ck/xZWERxIw+/u2Ms8/E9zdg1JGRYrOI5qR
	BykKCs4sHPhHi9cR+blzLC2qVNFnxXp3dYaozB53mn9HHkOpxuDcuuctsqFALbfm2X7o40SZXHb
	NHonuxEuqzlheOWAIoyAh8DwX4YSZe688Dv1jX1hbxQcQ6ZLt8T7vXLRx7bD6QdmuhHNH9OMa48
	HJYOh87BWIS/swK70/Z8BliocVFX+COFghZq67JQJ/Pq/SFvdFZ0y7HCO3cIdfS3WTfKsGFzV38
	ZtyvyCrj+5NT3siX3JAOQKTEY5MlgfKntNpOIVZDlJog4=
X-Received: by 2002:a17:90b:1c8f:b0:3a8:699f:959d with SMTP id 98e67ed59e1d1-3adeabe535bmr6832400a91.31.1793039365515;
        Mon, 26 Oct 2026 11:29:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae404ce25fsm292715a91.1.2026.10.26.11.29.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so2392665eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039364; x=1793644164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGqeu2xbMnoE0Rt6DQ1E+iwd2CSMeKN+5rvls1JxyJk=;
        b=EkEknSoAd14g9rRGILFvsZzS5deAAhjeegEQlHVP21tfStxDdR1k3SA85rKQ7GtJPl
         exhJTSenUj0mOD3Oar+9yidiO0D4Dlx9DnKdeZJ0HJMQ84i2JEdK25RKzCvqCOb6BbSg
         InNAf4NO7MqUWJusyBxTZGL6+HVLPyEFjad54=
X-Received: by 2002:a05:693c:8943:10b0:366:fbdb:2070 with SMTP id 5a478bee46e88-369e84c7e51mr11553955eec.34.1793039363782;
        Mon, 26 Oct 2026 11:29:23 -0700 (PDT)
X-Received: by 2002:a05:693c:8943:10b0:366:fbdb:2070 with SMTP id 5a478bee46e88-369e84c7e51mr11553896eec.34.1793039362799;
        Mon, 26 Oct 2026 11:29:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:22 -0700 (PDT)
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
Subject: [PATCH v2 0/6] Fix SATA support for NSP SoCs
Date: Mon, 26 Oct 2026 11:28:50 -0700
Message-ID: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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
 drivers/ata/ahci_brcm.c                       | 34 +++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-sata.c          |  5 +--
 5 files changed, 65 insertions(+), 6 deletions(-)

-- 
2.53.0

