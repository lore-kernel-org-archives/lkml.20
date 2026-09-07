Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745654749D6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780398; cv=none; b=QYAT2oocc/ydPBaMPKtcwn64WlJmpSmVgRcFPpMejr7HiEr2Y0FVIbQF30EJZ62Hd2xrigRYXjbOqB+In9mx0/q6ZTAXQdf5QLI+JqjjO6nrr4GpUlTKQmTmdGX87S3UIsdHJHKOUSHLvyfZew27aNR0QCxdqqw09Hjo5Kufo04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780398; c=relaxed/simple;
	bh=5FeeOADUNbByjyhwFpHXMXOzMsToXCwZgtfQIgCGMQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pqaUGNJHuoCTNSnOF08EreWp027Zmqug8pq9XK7ggXI0wRhkAEpOd4a94axV3e4bP8rc9SNTtJyhSQykeYTMRf4uTB4WJBRy8B3jtNwE7uYYfCylfVp4HBuqI6XBn4TNacTCREQohCDXnhLU0gTEs8F2LnHeogDtvOq1ozxZ0mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjV9n3gS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjV9n3gS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3964e480f76so4067951a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780397; x=1789385197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCIRpQj2OSAEKhN68oM/fFJ8TP8Qm5gHiN+49vtxncM=;
        b=NjV9n3gSk/Shikew5KEzgivBXHIKN0n6IhfFESHAmPUVgJk7J2IgWt9T3CChL+fm0d
         XDYmGUmRBoiMOOs2nMfTF1JLT0rTFXNAGUbsQZ/VRul+yMQlWiSDqJxlYvFIYw/fg02/
         sgoGQeQrrwDzMwik4jjeGu9MLZembRhnvX1suSr6FPNhgMzPFdFJWWdAicZT6uAJh5QV
         LmK8BXO0O5YI0gcLHBRSpxXuI0nwsx7b3UdRka+PLN1kYpuqWVtiFQ9KXf8beiDMBPWv
         RhR+pHlasmJ+p6Z7k8VewAvt/8OCIEKpMTySd7mnzk7ed8BCLhfPmm1S+BDEz72fJPuY
         zIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780397; x=1789385197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCIRpQj2OSAEKhN68oM/fFJ8TP8Qm5gHiN+49vtxncM=;
        b=mAK22aYeERq3xX258GWwyXy7SdluZImS1Ck97dsveN1m/CSNGRRc2JCMtg+F3OwYO4
         G22fZ6OPZwBv52weglLgT/pVz7JFAGIVRcXz125JHvwEUzhim/9iNe9sprTqFuXfoPQ0
         +fElbDe8jWX2j/dsvs6oqObJzHur09HKf74IqEy7YGCE1LDvKl7vE1cXd8YGOJG1nyr/
         fttB/y4wGXDlYgPSWZOuruOMQPbUbTcig32RnmElf3dfz7bvUzfGg7W+jrn+1mBTmwOI
         pVOmVNHo3C6euo1+1KqnMF48suRrtUbntITkKXctICWuSuHaj0SoFmrnBiMJgxEOran1
         Vg2w==
X-Forwarded-Encrypted: i=1; AKwUvBwlV8r3lfbLqExLyOg44N+PFoXtm3uPdJpZTzoaKIcexb9Es4jWFN7/2zdKR5S6rEK3YnEjckfmGE006cA=@vger.kernel.org
X-Gm-Message-State: AFuF++md7fpZQweYZAFYUPIy6BeAU3JIWp/DD8WvTjtjVlICmnKKnqDj
	cZXHyu+Dv8sbfllFJCUmLalXU9b2usSD5DFiSL/pkk8cXmWKxizEyIHZ
X-Gm-Gg: AYBFou2jD3MBSAl9TtEc+PNqsh6jryn5pQ+wGavsYtlzV3ZVCEEeFf4eunV3UsO5diC
	dprLSNw9UCXY4sLFRpJOg58oyZHoY0SwvO5WeD35zUWFuF4NhSNDeS/1GNk7lGuaRcN0f5b8XBg
	VVSi7yJo0CW6AUvYyR04nlGhQwfDGq5pGdj7sywW1kyLXNsu0RsYe9ZY9CRViAe/QBmmhxpLjtY
	n4GbLghsNDxim2WQyQzFKPC4SUzQu+nZvwj+JDopi8Ag/9CpIR24DVppNIBGYXWIAJHNoy8YWtj
	rqGWzOzyoiC398riWS58eNP09Ovljw9Q6cKCa1+/mJu9WxJ1tT43VU3jfGcfxfLzpTT6UfziIbU
	GPGqLR3D4YbfM8ctn9VY6nNKoNRUizi7FC49aCVxmhoMI24/jz2f+RbiHzt+yTMUUr1Vn6e3xvh
	4kGelNvCWW/ubvAamE0Oi9rPBWmDdzFLw0M67l
X-Received: by 2002:a17:90b:544b:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-39b261e3b72mr33475243a91.12.1788780396594;
        Mon, 07 Sep 2026 04:26:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm31225121a91.14.2026.09.07.04.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Mon,  7 Sep 2026 19:25:59 +0800
Message-ID: <20260907112606.465778-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra control and external MSI controller
(IMSIC).

Add binding and driver support for PCIe RC controller support on K3.

Since v5, multiple vendor fix are included in this series, you can find
in [1]. And this version required [2] for phy bulk data support.

[1] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/drivers/pci/controller/dwc/pcie-spacemit-k1.c
[2] https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/

Changed from v4:
- https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com/
patch 1:
1. fix comments
patch 2:
1. Use phy bulk data to simplify the code
patch 3:
1. Rebased to latest master
patch 6:
1. Apply several fix from the vendor code
2. Use separated init/deinit function for K3.
3. Add some error handle for K3 init function

Changed from v3:
- https://lore.kernel.org/linux-pci/20260703020003.485436-1-inochiama@gmail.com/
patch 5:
1. Add missing interrupt/interrupt-names check for K1

Changed from v2:
- https://lore.kernel.org/linux-pci/20260517014841.254085-1-inochiama@gmail.com/
patch 2:
1. Use unify PCIe phy get/enable/exit function for both K1 and K3.
patch 3:
1. New patch for updating device id for both K1/K3
patch 5:
1. Reuse binding for spacemit,k1-pcie-host
patch 6:
1. Multiple cleanup for the logic already generalized in the previous
   patches.
2. Use generic description for the Kconfig entry.

Changed from v1:
patch 1:
1. Remove post_init callback.
patch 2:
1. Fix devm_kmalloc_array arguments order and error check.
patch 3:
1. Apply Rob's tag.
2. Change check from oneOf to anyOf.
3. Fix spelling mistakes in commit message.
patch 4:
1. Add comment about PHY handle.
2. Remove interrupt "app".
3. Fix spelling mistakes in commit message.
patch 5:
1. Remove all logic related to link up interrupt.
2. Clean up all unused macros.
3. Fix devm_kmalloc_array arguments order and error check.
4. Remove unnecessary start_link logic.
5. Make all magic number as a macro.
6. Fix spelling mistakes in code and commit message.

Inochi Amaoto (6):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple PHY handles support
  PCI: spacemit-k1: Add device id update helper
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
  dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  50 ++++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 210 ++++++++++++++++--
 4 files changed, 244 insertions(+), 27 deletions(-)

--
2.55.0

