Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893093;
	b=EI4CCHYpVL5sHqZRCH911/fEfLGgg54842S7n0ZKL33uFXyrR+XwzPNFxyTkW3RZ+sLW
	 vp6BRqX9q36b3J65odnHK6L1JQYcM5qdqSXMSainZT6VnPsA5JPh7eVkxFmTrFz3kZIEz
	 xFss97PDP0WsVCdIu7zVY3JbdJBfTkwCUZ2SVB07HU89rsZmJ1XJfA77tRB9DPG8DuSIF
	 N0iBOdL52I33xi/vdM4kMQJgctVAipQ843dsGGaNKZe5fP+fntlGfb/S1CVakTD8X7GTC
	 dmKhvUX3I/Y+mzXHUBCsgzG/pLFbCvnPqSoelZgrv748KasW24jFMnlh0UW8K4q2aqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8y4St0IhZwQVyzFdSxU5JacHnztQsqHZO0Wii9zP/Z4=;
	b=NdX5k2F/elvkZqubCTCmanPUmct+aq0W7b7qJl+GGYJflcctBv+9GoRntlilmCSwcsL3
	 bbvVLjGDVPTtlbyacynPO8YYMM+xBNOHgPWBgnjfTaQ55gx/inx39HtVbccfx+wC4pQW6
	 +Whvspby0d6HB8J1D51TSt2K/+o2bkAO1pZu8Qe2W7/bDFMwzllNrwAg36WJLlUE0bPJ6
	 Ku8aDJ7fDUPIb6dWHefaNZFjMI3IYHUYckALxAHlOUxtBa/H5GUS1LveHJztZveUpotyk
	 zewB2oksxHXKXjqvWOs3wxZJviy3ypp9UURzigGwbqN0dur1ijkU7wvSCnkzgir7svw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=5KN60z+V;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539BE606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 539BE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=5KN60z+V
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-55e0090c580so768844b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793893092; x=1794497892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8y4St0IhZwQVyzFdSxU5JacHnztQsqHZO0Wii9zP/Z4=;
        b=5KN60z+VeUPIVPforSmLJZ4fHI39IfjWlQrF0OEOlpgnrL+kFR1BWr2JibCftcnkMv
         UtVTLtkzxm1KGtHU9g79wLkVn5n11rC90lH84cQCCd8Dkeo6bLW9SdmwpfyCEQbliO2b
         jhNxe6IGhhfuS3nmRM5fNugHo2WFpjiNOu9O1flHSluOpaeoVTW2GXoSk8jVDHbzuK+3
         hw11BbX8JGJCNzDELKe/j1/bz/DwOcPmFRC1qJfOaCsINUn9i/sLVUf1DaTT4PuS1K13
         gXGwvG4yTZ3bNqqjQrGoy71RHbtUkpRG9lC3Qic6R6mZk93Ax/Q/N/CQ+ukAnDhgcSwn
         z6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893092; x=1794497892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8y4St0IhZwQVyzFdSxU5JacHnztQsqHZO0Wii9zP/Z4=;
        b=idg8Xe4G3BrPbQE/gPxeTBP+LIibnMLYv6P4MO27mib1dLomoVBsnkaNx2YTY7xC8Z
         yGiA4Jgg9uXEVOuso6s/EONObc1/+Gg4imEJHgYeWavCuCPZTzE5+gmTuZyaHeifVmIK
         AAvEeYx6yrpmMiWPfi3e+f1rkdepbDRvNRg/n20CprBKw2/zliXTLfl2DB+P8DjatRdf
         o7smObmxS8DYSuLvCPr61CYIiLghfpNl2XifWz92KKyC733vadadyZSN2ET87CAkn8Ce
         N0vexDt8UNt2Wfpiie3LqQJsaUAxuSanP1DnFbqaITReUvjve0IA3j37hlJ+s2coDn5A
         PJyw==
X-Forwarded-Encrypted: i=1; AKwUvBy7SmtopDU91dkpYsiisLEeAi5MvgQmrSgl31Ub9KH1FrX3IotxQ14sdETh3IbuZbXSHlrPdOnQi5yuAi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o9NRXtirbc00A55X6YL+tlltbSau4ZrgxKzfYj9FHwtUACm6P
	PBtVpdLCDxgerFws7BuibxgNkhIvFIF2WQR6Td+VwuXCUaM8UBe3ZWQsp0KA0suIz5I=
X-Gm-Gg: AYBFou2C9+w4PMoMTOG1zMaAJ5NHlOvnWbpgzHh/PA5R4kSK6qLzhyKAbws08OM0mBc
	i8vRjkAMczBxquvLj52pSh3X1h1vaj/6kVsokTCNNpAxtW0syZQc881xaBJ5OUv1EpFjDCrF2Lp
	PYGG9iWDxwzTCBRITUfqo8BC1evSQG+328coJeKRN3sdu3UokIsFob53q3EBY6Ech/v6rlgVAbN
	6dWqGVKp83bYWzou/Zg00CRRtzLXlHvwJAjNmLY0LsatDM7+iUm1lk3antlKZYd4I5luaoHf1cH
	AMfZQW9S5zqvYarpIfTwF41BEEoFIFT+lC4I9PrS29SFgJtQ4TRRIu6D0wheJaLOFG8mEL/BRss
	JMz7/SVIXEe1v6i1SyQOnn7GVChDoqlVHfSV4w84czlpZEWo6rfJPN8PrHn5D9CbkdgcjWtDCZM
	cEF48AMtIsIAk46OijAZC6ovl8zmmi0Ese5RNH0C282v21r6jZpmJChT6JklkJ5irlELefdYvv1
	Pkx7BO0I3iOD5vcX1OSuA3jwhJcxgE9G1APbdl/m9zmfibMv6+X6r/vzbmBTiPWA6DhMPap2LLY
	20pYHq0dS2gCwmdAFLCB/ElocwkQSN1Prj0IHu2rpBXiNzaVJLptcoU=
X-Received: by 2002:a05:6808:4491:b0:4d6:9283:1bdf with SMTP id 5614622812f47-5640de7a752mr12836651b6e.60.1793893092182;
        Thu, 05 Nov 2026 07:38:12 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef6e3bsm4435329b6e.5.2026.11.05.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:38:11 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/4] PCI: of: warn on bogus device_type property
Date: Thu,  5 Nov 2026 09:37:57 -0600
Message-ID: <20261105153801.435566-1-elder@riscstar.com>
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

  *** Bjorn seems happy with this series, and Herve has reviewed ***
  ***  almost all of it, but we'd prefer to get an ACK from Rob  ***

Add a check when adding a PCI device to ensure the device_type
property is (or is not) correctly defined when the device has
a non-null devicetree node pointer.

This series also includes three other minor cleanups to the PCI
devicetree code.  The first patch prevents a possible null pointer
dereference that Sashiko pointed out some time back.  The second
and third patches are simple cleanups.  The last adds the new PCI
devicetree node checks and warnings.

					-Alex

Between version 6 and version 7:
- Simplified the wording on this cover letter
- No longer check for snprintf() overflow in of_pci_prop_compatible()
- Rebased onto 7.4-rc1

Version 6 is available here:
  https://lore.kernel.org/lkml/20260924150222.1179235-1-elder@riscstar.com/

Between version 5 and version 6:
- Simplified the patch header on the last patch, as suggested by
  Bjorn
- Rebased on v7.3-rc4; otherwise no code changes

Version 5 is available here:
  https://lore.kernel.org/lkml/20260908213459.2519059-1-elder@riscstar.com/

Between version 4 and version 5:
- Made a local variable (bufp) a pointer type in the first patch
- Eliminated an unused local variable (i) in the first patch

Version 4 is available here:
  https://lore.kernel.org/lkml/20260904134607.1856121-1-elder@riscstar.com/

Between version 3 and version 4:
- Insert a first patch that fixes a Sashiko-reported issue
- Drop the final "duplicate warning" patch from v3
- Include "pciex" as a valid PCI bridge device_type property value
- Add Herve's Reviewed-by tag on the last patch

Version 3 is available here:
  https://lore.kernel.org/lkml/20260901011338.1323243-1-elder@riscstar.com/

Between version 2 and version 3:
- Drop a patch that made a change only needed by a different series
- Switch a function header to use kernel-doc format
- Add a warning if a PCI bridge node has no device_type property
- Added a patch to remove a duplicate warning in the devicetree code

Version 2 is available here:
  https://lore.kernel.org/lkml/20260812172247.276554-1-elder@riscstar.com/

Between version 1 and version 2:
- Check the PCI devicetree node even when PCI_DYNAMIC_OF_NODES is
  not enabled

Version 1 is available here:
  https://lore.kernel.org/lkml/20260807194100.455599-1-elder@riscstar.com/

Alex Elder (4):
  PCI: of: avoid allocations in of_pci_prop_compatible()
  PCI: of: drop the reg_num argument to of_pci_set_address()
  PCI: of: don't zero flags in of_pci_get_addr_flags()
  PCI: of: introduce of_pci_verify_node()

 drivers/pci/bus.c         |  1 +
 drivers/pci/of.c          | 32 +++++++++++++++++++++++++++++
 drivers/pci/of_property.c | 43 +++++++++++++++++++++------------------
 drivers/pci/pci.h         |  3 +++
 4 files changed, 59 insertions(+), 20 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

