Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309127;
	b=b7B5OaaveB2BTGXFPGC1aFep6YCRwu95A+b9XAMRIbRq9vSmpph0EzrTU1J/o3TaB32u
	 3GMzus4wxZZD4Lnuj0EAasT+xO4iwvdgI0/vvH9KP/rBR8lANaDin8auNjEZPr6pq6LaV
	 FP+YT0GyIg/DXXjzJurs0JW0BiAD7Iva/ttJkmHc06sGwogB9ysMSsf2z7fFXRsGPKfh5
	 tX4LTCkokyF4xnz8xCNBY6VQMYRshjJ8SnnB5UD35xp5diNo8f7BpjFF5YJKAn9q8Srbg
	 4mzbIZVGHVzwi/I9ZB3/rTVWfCjpj4nczpvcNJ2ZVLwl9odBJGq1q1M0pJ581ONYRxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309127;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Hsj4il6cwMzAfFBtIiOor6rUHPJ7kpQPufbre1PFxQc=;
	b=2LnLy1OOxx3a3zJf3kHFNcLsZ1WaaAGn16VAVi3oSr8OwBr9uEpsDjZhQTKqDSLp+bEd
	 o9xtq2iC9ytrzBYVyy60UGQLRKKGQsLw8FWPRtNDlrP0z7KLIDas4+vJpaq164JMLsdmP
	 Apm1rO4U2k9ybL29ux2LPclAN4EexVecCZwJbwTcP72rYo0SrZVC2VGCWJesCcWgtP8da
	 gQCBT0gMzayoqg6FOsfGpVh/tXCD9PoG6dxBR4qxkrTxCpRnX9j9voTdOskbkRF0IqKWc
	 HiebJBRdNtxzylK4fBFsIVXEyQEQa7jX94IjQmlDG0agnKrnNQfsU8by00kNeX6MKKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VqBP6e8V;
	arc=none smtp.remote-ip=209.85.219.97
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F125C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F125C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VqBP6e8V
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-91c79f306e9so719926d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309126; x=1793913926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hsj4il6cwMzAfFBtIiOor6rUHPJ7kpQPufbre1PFxQc=;
        b=2OR7yLq8qnBDvh+Dtfq/61AfPUETU23XE6Yi3hF97RwQGUF/XYljqCpDvIDpKa6/SG
         1QJS9tEdWBEZe1vYHqLhAF4DjUlUPJmktCOPl2THDnogoeq5Ioq9f2xc9CYL7xnC4hpg
         +mjnPusogWzuPc6406gEeqIJYtXDCcaOMp5PueuuUMFHA9PLW1T0gcdMU5Gj4y+wNpVQ
         4ocNffEYdiWvLMIvGqxLwUSS156McqngrJBA6NBVtcyghUh4051ASaBaZV8LmlbMZTaJ
         ljuSNX/72SjkdpW6htSQu0922CYtRk5jGBlyoTempTD+b/mpJzCXc1hmlQ0QEH3NKZRp
         d6mg==
X-Gm-Message-State: AFq9FYJ0+qQi+SrqAhqbQnJz+pnsyHpu50AxTM1bjlhVG5bqYCH439Di
	E9Fmh5px4pr6Pyqf0Jt2hHkqv0/fiy6VZblBJ9a2BUTki0SJP4dfnRekcWdtJZ5NNNuJyTYoLno
	GPdbSYFz2P9NrqvN0aWwUyI7o0X2YcOvWFVyx8yb4BNd12F6Ht1/x9ywkKD0EPsdwJm/jno8QtX
	cmd3lJMhPxL5hq/4In5ZroqQdDNtAQ1gcEhgKDDP6zoDdFJ2psnyRZnwHobRb4OVi9T8a3vlw9g
	KhnhKta52FDvdHeWS171LoqvOY=
X-Gm-Gg: AYBFou07n5PODRyib9OH/dRAa6fzLC1dlInQpe0P7HPzKgaUsGvx6uY+TeWVnT3zEeM
	irA4FGlS0WH3vGilnrEDMscPB2rK8L9wpOIPzQCG0nKHFBw7Cxa46Z9QQvyTNxXz5nx9BfDiZ9e
	z+btrmZVxQE/Fg11kM2637UdS6e+JHaDUbOgQLYrLMqoE+jCCe+q8O8pNqzmPX/N2KGqEAiyAey
	LXzXq+D7rXyA1m+pECZxbwJhzO1u4N3dKU/iFBvsDsIRaSRl+FubMMZ63uzlqtBiev39CXEAeos
	SlA6vT7thv4BdQ3PprsmIy3fx5e0p/pN5GuWzM80Eymxir1EdbGh0oW1YDoZRIqE/lWoX1PwYBs
	ZOr4v1sWwe+y/zam4aTCSRu1G0DPjF8/OJ8RaLRMRupGQh0L4v9n2MB2m2j8gSrSr0DkpQPgua/
	er+GdfV4JgD2GLBVTfXuGtHwwr0xOOzn2qEW8xE4Xw
X-Received: by 2002:a05:620a:400c:b0:944:16e7:15c1 with SMTP id af79cd13be357-94421659b79mr90788385a.19.1793309125876;
        Thu, 29 Oct 2026 14:25:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-94421299e31sm5957685a.17.2026.10.29.14.25.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bebff9fcaso1974446d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309124; x=1793913924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hsj4il6cwMzAfFBtIiOor6rUHPJ7kpQPufbre1PFxQc=;
        b=VqBP6e8VEQ2KEiAgBWT6S1gLO6pIB9FkID86wAbT75o2ugVvv/tDkJ62/ahYWSTiRz
         9rI5s5UpE9IW6LMP9RXLg5z3/AI28Someu0k7JsQSpWDAhD9HGIb6UHIyoyEDs4Ud2NU
         UKDDGlGhb2xXVR4eQDvul39j/4vMhcCNREuLw=
X-Received: by 2002:a05:6214:ca2:b0:91b:d948:c415 with SMTP id 6a1803df08f44-91ca4b78b78mr3774576d6.44.1793309124255;
        Thu, 29 Oct 2026 14:25:24 -0700 (PDT)
X-Received: by 2002:a05:6214:ca2:b0:91b:d948:c415 with SMTP id 6a1803df08f44-91ca4b78b78mr3774056d6.44.1793309123730;
        Thu, 29 Oct 2026 14:25:23 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:23 -0700 (PDT)
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
Subject: [PATCH v4 0/6] Fix SATA support for NSP SoCs
Date: Thu, 29 Oct 2026 14:25:07 -0700
Message-ID: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
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

Changes in v4:

- move entire allOf to the bottom, before "unevaluatedProperties" per
  Krzysztof's feedback

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

 .../bindings/ata/brcm,sata-brcm.yaml          | 57 ++++++++++++-------
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi       |  7 ++-
 arch/arm/boot/dts/broadcom/bcm958625hr.dts    |  5 ++
 drivers/ata/ahci_brcm.c                       | 36 ++++++++++++
 drivers/phy/broadcom/phy-brcm-sata.c          |  5 +-
 5 files changed, 85 insertions(+), 25 deletions(-)

-- 
2.53.0

