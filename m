Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7B477299
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545650; cv=none; b=ouJoVoaVqo0ZR76g48Tde7wCPQPMGGI7ezKActxlA3k4kwE87995fasYMa8WK9ZAvWN40PIXXJ417ACbRnhREIYWPrIo4ozx1cdPSV6o/d86QPszpFeth1N+Xcwi1U5WX5utr717KqeTnJwVsAfwYCoEeHFcSyscNRWAztTv2NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545650; c=relaxed/simple;
	bh=7WdeUDfNtz3w/kOVanMS/2G8C33ZGTEc6MZvYgIdotc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BCIm/mKlnr3ueWNWVpocSDhtCqtBw0D4bRi8k8T+oRQX8JVXL2QarmC8aUiRKuIw48bUmhyEicDCPR92ESoDtIKOSbVlVwscTLzGVS/rDbWTJgQat0X3Z9V95lsGHuurbcFLCFe7Z9z+aJfBOmf0Oyhn/vcrJVzO8w23lCPNFsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rc2IrysV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rc2IrysV"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so532202a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789545644; x=1790150444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1EPm1x0mUz5Pn3Ms5F/txa8My4xRSy/NJkkZxCzQIKM=;
        b=Rc2IrysVTWRJemrkQFAJ+8O3jN9JCMqD1N9yqqquQyj6TlRv9kewSW8gyY2qHtfAsi
         3MoemnLsawnXPlNQiZdT9WQ/j2fgFuQs6GGjXr67ea7pup3AfnO+slXc0gL9CVTkAjjC
         7JkrglkkWb5GahF7TW2iJWoJBXli/RlDOVCn62og3FwBMqa9G84h7RuY5WaODWrmvvcm
         7zkPKeD98W1JnTy7ahY3MeNIHKiqQPi5bAdt0pgcqq+3PRGLR8PyRA4ZkOTHllPZ6bh7
         U8G2vE0RJXj7fg10MWPUPX2tKsGrOaMhvNIGgiIjVUn2W9hSIXRlPehPRwmKoQnTWaaj
         LztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545644; x=1790150444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1EPm1x0mUz5Pn3Ms5F/txa8My4xRSy/NJkkZxCzQIKM=;
        b=b6d2kv/8DcXZD4239Qo+BVLR2hVR39oYjBuzp5Z2biaFr4J2sEbSxzWDpVaujmr7Xj
         /vFhot63gjOUeBKFq6Z7iR3fGtQAR6Oh9P8GhcVlHzsrCY/x/EKzKtiRItP1qbTpy260
         kaGdYp89I64e4XcRj+ncxT9SyIwgiIuWyv4HVRB2OqGNU6RtxkvEPEDB2/ZoSxPPK0uz
         cs1YfTJU0TFiurXAJid59zYVvT/i/tTV0rR8A8ts/RZx47TePApLSE76s/S37sKG9NxK
         CqlX1iOG3JLoS92Wqi4Hwg0v8sPzG9oWflU+zWyG5XeMMO0/cUqjO2vwxb7jlaPvxboa
         Vhsw==
X-Forwarded-Encrypted: i=1; AKwUvBwSK1YiWUrx4W8NbJMW5pvdRfoS0zYh5P0Voui5JNWfXVJRGmSscvT1u4nB41wPxYYhB5pETAU9DOti9pU=@vger.kernel.org
X-Gm-Message-State: AFuF++m92kpKiG9OcVhwq5DHnNLHefcsJFcNZ1Ts4OjOOTtWJ/ffu+0o
	DwTNksSw6DM8aNzXqPZ1Yd7wtRPonDnRAWE9bB1h05f6VsTmM2t4WsIG
X-Gm-Gg: AYBFou15/KgKfAzZFmuYwI799/qYQc/oeMKuYOW6bb65rrl/NzBMlynji7E4y18rjIH
	gP7Q9SvVqAAgQ99/TVFS3AMjO+TfLAERsRv70F0sd2IMFl4wHA0cRQsdSMocxwHv3gTaFAuuqv1
	08C9Gl052pV5YNlTzXfLaPe0yytxTKzJuAwAv/5PMtK12e3AXSsq3evNw5UGZZ5wJEvhZQg74OK
	iwuROf8zQz7iV95Li++x0Oys/AVMOlvObesRW8at5P9ZMUBQ7fz2oaoWJGmFzo/WG3+OlB4HALH
	/GIVnyS8lOu20rrznWPtPB4WY/lNa0gLv4B9wlYsEsTHimWGdOyuzTBHsBrKHT6K77yTkoXCQcZ
	YgQq/Rc0gDam0FUgQcv748tTAyCUtb3ElP8r0n/PWAmUEJ7QDGXf46bJOFhi4+YD10QYH60MwpJ
	QdlUvcVanj2FI4cKmGltdOr9GtS1ogJALX8WLtcTG4ELKqUxWCNBdY8g==
X-Received: by 2002:a17:90b:2681:b0:39e:1a00:bec4 with SMTP id 98e67ed59e1d1-39e1e2e1d8amr4275979a91.6.1789545644489;
        Wed, 16 Sep 2026 01:00:44 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e19fd8ecasm995716a91.1.2026.09.16.01.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:00:43 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Yuho Choi <dbgh9129@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] PCI: keystone: deinitialize endpoint on remove
Date: Wed, 16 Sep 2026 16:00:30 +0800
Message-ID: <20260916080030.2960608-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ks_pcie_probe() initializes the DesignWare PCIe endpoint with
dw_pcie_ep_init(). The probe failure path calls dw_pcie_ep_deinit()
when endpoint register initialization fails, but the remove path does
not perform the corresponding endpoint teardown after a successful
probe.

The successful endpoint initialization also calls pci_epc_init_notify().
Without the matching teardown on removal, the EPC initialization state
and resources allocated by the DesignWare endpoint core are left
active after the driver is removed.

Notify the endpoint framework about deinitialization and call
dw_pcie_ep_deinit() before disabling runtime PM and the PHYs.

This issue was found by manual code inspection.

Fixes: 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x Platforms")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 602516239a57..35787e727c5c 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1349,9 +1349,17 @@ static void ks_pcie_remove(struct platform_device *pdev)
 {
 	struct keystone_pcie *ks_pcie = platform_get_drvdata(pdev);
 	struct device_link **link = ks_pcie->link;
+	struct dw_pcie *pci = ks_pcie->pci;
+	const struct ks_pcie_of_data *data;
 	int num_lanes = ks_pcie->num_lanes;
 	struct device *dev = &pdev->dev;
 
+	data = of_device_get_match_data(dev);
+	if (data->mode == DW_PCIE_EP_TYPE) {
+		pci_epc_deinit_notify(pci->ep.epc);
+		dw_pcie_ep_deinit(&pci->ep);
+	}
+
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
 	ks_pcie_disable_phy(ks_pcie);
-- 
2.43.0

