Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7965A49B5A3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789078660; cv=none; b=dzirVQUvk78ySvOCfVWeitRbv2jlltujSWX8H+BpMe/GWIQA4qcAJwJqYpB4PH1XngH1pOKJaUsrYm7L1Rr3hfJdhSTasKt702xhJcgSIWAlQhU1XxXyvHPbCvBGuPWhU7hBF8bihrJVbwnJi7qZ8xzGet+PndQBlov22THUaYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789078660; c=relaxed/simple;
	bh=dD2MbE8iWzrOQjOcB9Fc+ItDw8U6u6JrMfm3i3wPru4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OrHVIJE1xH7TuwblFiNpQbukEqNKisKby9nCv6VTVEU7MSKEyR89gIe08V+xEFCIDqdKDLp192XH1Ft8GeLnIJsqrI6cjbz6b+qTiuaRUv7b76knYOqkaHpWpJU+2dkdLTesndqzHa2g3/yMr1lBQNNTQOcN1Euorx+aiOdmZe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gq4KVn9I; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gq4KVn9I"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcc3e03so868406d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789078657; x=1789683457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=phZqrumo434IM6M4R3cvUgGvziwdgVdo1+7d/hsBRIU=;
        b=gq4KVn9Ilm1wljKBeVQy592L/SpDUiJN2XnPgfvdH+47cShKSxeXua/19r30MF801E
         jCAanBo1QVEAbUuFfp1kvwJ33U6wY6p3lJsftZEG5iRF6omFv2corCxi7ye5NDXXiPko
         NW8gZGvvRINCJ6qngKybtvs7anG+f7n1Wht9Kds3FmTfTQNZc9PoWrEVl3aT/ufYifEb
         11oeC6vAyv8QQyR0z2bfR4dji0OtNkQDiwFOr/MOJSZhAfyFxhR9BL8BDL11Fzj1D1Fw
         jkAx1/NeRQ5oo6w/KzWQZ4rVwzf173N1i4MIgYVVuo0vHdAFtrK6WueOSqSv5ObAJ0KG
         8smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789078657; x=1789683457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phZqrumo434IM6M4R3cvUgGvziwdgVdo1+7d/hsBRIU=;
        b=ctlL80JeogZx5WfOpbyvMSU3mZ0cBg3JQUTBqW5g3hDdpKQhJs477dF98XdZaYWg2e
         rjRswnAio8UqUBQ+UqQ+3JXO1eFDLnCLxKVANFLbriIHUalzEwPNHUPhHQsIexGbZNX9
         Ob3jOIRmQpOratPGqd9OxndQCwgrJA2OgklbC7XDMy4mmjQN+eJcNAhD8Z5wslNtgWyZ
         mua+aSKo6S3BF/LGiwRcCAJWIe7PzJtSZdBpj/aD6VEdX/pgL7Jx20tp+T4iKnFXx0AE
         Z8xtfWUQVpS4UYjYR+is+7uq96cgxxebThA5TBZfMQyhJkKlYGpfmDhFeS4Finbp4/11
         pq7A==
X-Forwarded-Encrypted: i=1; AKwUvBzJ8VcTTXaMawXwOUonmEs9ATOGcL2KOSlp/FRRa+7guNY89Xj0AkOFDrbG2WLhLsb3A9dpy87f44yx8XM=@vger.kernel.org
X-Gm-Message-State: AFuF++kqIyhD3BFIk+piA81iNArbJ1IlhL9RTfg6rHTwCgNv8YsNR/Ss
	kPKW9x4tQHI/GEAUvFq1BQelsL5W3uWQJt6glsLz9QdpZqi0PkZWAm4=
X-Gm-Gg: AYBFou3Xi0XrbA/pjmG7Z1g1nnXinU2vxpg8zEZhFATGJw6tgyJbzhFtkd3uzL5WE2W
	hjCZboLj59ZN/82PoHsVLe70ZKmAj961I0XXhi7ZuyUPsnTcxKDbchbDJmmlLfEZPZhXtNgOa3u
	L1dAbxLD5l3W1KSeEgI08xCcxZ2+Hh2BnBV3ZIIrIQYwHl7L/9dfipPso+NmxIuL1xoGz8j5Qyk
	z4oD+DpQghvlMEiHfhPjmd9KRwePuYxTHVM6rkb7EVTlXKDyMtmrx5AYF3NJXugMiwLeao0E0J4
	ZwcfnOJvmdLyflN/F7ZBFcvVCtJ0DAhqgbc7EDF/nfaOq9Df12apzfkGy0QaI7tIRE57Uc5WO8J
	/UsV/MYuVUR0EabrKaSsY9f5PaL2AlLRSlsVSDNA1RU8B56VMT83cxNnELz2ci9mkBSc4Vt9tsP
	k+T1Ad/ZRZY2FO1YKVfXGrb46B+4FNqmWv5SpsRRTH+1Iykh2VqzVLzc4zefi+GaACjsMc2zESo
	vZgY1NyWNHSZReHCiebzmFOSCQsXAB7x7vLrZc5F4DoXFTyLdbOLm9U+CqBrHUWlqREt/amU4+i
	hWzIfAyhdz4bnuBiSuxjK4cviGRUPTK76g==
X-Received: by 2002:a05:620a:2604:b0:939:a9de:83ea with SMTP id af79cd13be357-939e8b1c875mr207985085a.10.1789078655448;
        Thu, 10 Sep 2026 15:17:35 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80d453esm87548985a.38.2026.09.10.15.17.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 15:17:34 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: linux-pci@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com,
	pali@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] PCI: aardvark: Disable PHY on probe failures
Date: Thu, 10 Sep 2026 18:17:25 -0400
Message-ID: <20260910221725.91980-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

advk_pcie_setup_phy() initializes and powers on the PHY before the
emulated bridge and IRQ domains are created.  If any of those later
initialization steps or pci_host_probe() fails, probe returns without
powering off or exiting the PHY.

Replace the direct returns with staged cleanup labels.  Remove IRQ
domains in reverse order, release the emulated bridge allocation only
after successful initialization, and disable the PHY on every failure
after advk_pcie_setup_phy() succeeds.  A setup_phy() failure still
returns directly, so its partial internal cleanup is not repeated.

Fixes: 366697018c9a ("PCI: aardvark: Add PHY support")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/pci/controller/pci-aardvark.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index ecb81ac73019..2bbdb73cfb45 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1864,28 +1864,25 @@ static int advk_pcie_probe(struct platform_device *pdev)
 	ret = advk_sw_pci_bridge_init(pcie);
 	if (ret) {
 		dev_err(dev, "Failed to register emulated root PCI bridge\n");
-		return ret;
+		goto err_disable_phy;
 	}
 
 	ret = advk_pcie_init_irq_domain(pcie);
 	if (ret) {
 		dev_err(dev, "Failed to initialize irq\n");
-		return ret;
+		goto err_cleanup_bridge;
 	}
 
 	ret = advk_pcie_init_msi_irq_domain(pcie);
 	if (ret) {
 		dev_err(dev, "Failed to initialize irq\n");
-		advk_pcie_remove_irq_domain(pcie);
-		return ret;
+		goto err_remove_irq_domain;
 	}
 
 	ret = advk_pcie_init_rp_irq_domain(pcie);
 	if (ret) {
 		dev_err(dev, "Failed to initialize irq\n");
-		advk_pcie_remove_msi_irq_domain(pcie);
-		advk_pcie_remove_irq_domain(pcie);
-		return ret;
+		goto err_remove_msi_irq_domain;
 	}
 
 	bridge->sysdata = pcie;
@@ -1893,14 +1890,22 @@ static int advk_pcie_probe(struct platform_device *pdev)
 	bridge->map_irq = advk_pcie_map_irq;
 
 	ret = pci_host_probe(bridge);
-	if (ret < 0) {
-		advk_pcie_remove_rp_irq_domain(pcie);
-		advk_pcie_remove_msi_irq_domain(pcie);
-		advk_pcie_remove_irq_domain(pcie);
-		return ret;
-	}
+	if (ret < 0)
+		goto err_remove_rp_irq_domain;
 
 	return 0;
+
+err_remove_rp_irq_domain:
+	advk_pcie_remove_rp_irq_domain(pcie);
+err_remove_msi_irq_domain:
+	advk_pcie_remove_msi_irq_domain(pcie);
+err_remove_irq_domain:
+	advk_pcie_remove_irq_domain(pcie);
+err_cleanup_bridge:
+	pci_bridge_emul_cleanup(&pcie->bridge);
+err_disable_phy:
+	advk_pcie_disable_phy(pcie);
+	return ret;
 }
 
 static void advk_pcie_remove(struct platform_device *pdev)

-- 
2.50.1
