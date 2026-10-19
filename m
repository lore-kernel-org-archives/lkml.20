Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302734119FD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392791; cv=none; b=hZEtKEsPwcm4XvWHoMEL1N9/TC6VYiS4sMJClbd7xE7BrqMdyYlOkISLkrAb9osZDW12Zpl2vz0cru63u1LnUXx+1qirH1FPGMKr+pdzeAOHjfyKgt5yttAqNuXOkTvyK4/vVeULHy2Wxc/4L7G6BtYqsJFKDefjFfDAslM8Dyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392791; c=relaxed/simple;
	bh=ICWosO4Iw+3uASSl4S01prJwFvtuCvRIE1kqXegzmpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L3Xe6yNmOHCcm4RzvzBgotFdlQ9bLUSigXtc9LlJdg363CVuLROeIBV7o9QMyzDh5qzeaasa84NFAjgJjUITeiIo9Ium6fysoh/AsLx5Y67PsF53VtyWTRCz9/M3BhY2ZXQQB9h9tY4IwCdnYBlpxso2TOd4UNwdeb+gCBwET7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQpQBQ8p; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQpQBQ8p"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e011d370dso1427803f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792392788; x=1792997588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9XPtOkvY2xGoEM32FGfKxcwuTkJk/35iPrfDKXNDEk=;
        b=aQpQBQ8p7Z9pnVRyZ5jNKZ2tHJjV5Z1e8yxK2xV8D1F9kmyxNphJQTvusON6js5Gtn
         IOPJeLvGWko+livZkIfgZckERraUMQxDVGWv4/2pwgV5YmOB6n8Cy/NdOFF872DkYL/U
         uEn17ngFjAPTw17Q1hqdGIzB80ccAOopCnQLQ2sLmDm82GLWiTG0E45UmoVM8BuhHbtq
         kopCGg0JEhRWvuGMabGv0aJ80d5fXy6xPplBTImaxRKKoV6XrZOiasslKf0qnbMPisSO
         QgFYn+P7GIkE7m2ORkKPpEksDQcEQ9yjZdVzeFOPbXHKiAvX0vxgDHSmMsOwcHXKbhpO
         MC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392788; x=1792997588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9XPtOkvY2xGoEM32FGfKxcwuTkJk/35iPrfDKXNDEk=;
        b=Hen+w6PZaKPpKqacq65JPxTle10WpW6XZLsrEBaGEQmmioMy/BNGiQSPX/pOLWBn1i
         aMhFiZAGhb692gA1CYtuAWiZmoQ1xYS8HELUcuBKq0aawbAdt2FLmQ8AttonPPeQTXlq
         hrIpntGq29JH8IEj7BRwhXj0qe28z5W+hBnRRiBbqw3xyGUxiwes1dd3g0SFRGJAIS/Q
         ZPerMxEhGMNeH1EkV+1i6zTyPK24UK73CE4oJQN0dtYR67O5sAEkX5KyYFF2A0a+H7Qj
         uOdFOe3yi2puG75TgJyL1mQE8RZPesLRUccFpmYL2GUCW66Zh6K1BsRsKT/wrH/LQsKK
         nrBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ4CLFxdoNJcnef1UxiGA7i6tKxK0ZKRwZKWgU4OafPEFrmff3DbjpJ7Heo4uWQQGdrm86j4gcYLM2rEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfcRKp3/d1xHx1rgNimGdq3cHI0g0Ed6FHtlV3DyImjMGwxCfM
	b0BY1Og7Bk22D0Zhz2Cy/MFE6noKVo0mwdZKOdJG7y8a3VjJXpTVbl+s
X-Gm-Gg: AYBFou2zfLtNrydOd6xMNKjL+Daw1VsEXbOMf9LSdGwJN3UCajeYuhd2PyULs2oZT1C
	rX+xVpsW9qjaDEU/6qv+q25BGJ33TleuYs48qXKRsooh7oP5gA3SIhlGC4m5ND/wxSrjZ/zVDaM
	Cvt5snMbtiWGWSkVn72UANRCMixutIusz0D/vbWsJGYYl31rhJscUZt5UEChoo/zP47/Zu9roUn
	CgDeVJMb9Tjj1JjNt8ffvSGJNIRFjsU4uzIBsMbvrfZ0D+F5oMJZFWVqiLOHJtN7I2U4iwd3u98
	ICeScZnyw9BpAv2DS335J2S7SEtfrXaiI7cD6ukhuRwiZVfvgapi+NIJtZtSD+dn7oKadwrBcAE
	mF2Inxk+12imMidTvWLJykFUMCXZTZdMELn2WYmIbBcccnGOvHoLHB2HWIYFw9wrImmSNBJ1cIA
	26GjqHzYSueJ526yyxO/Czhrzn75NgyDpGnBMDQhVihPS/jufQ6Uer9vkIM7x2fAlhyAbqZJHia
	T3ip2P2FNwAoJr8xNxngdsuy0piy4gnSY2EENzpuqSV0pzVJyzrG5UHKIC/
X-Received: by 2002:a05:6000:29d2:b0:48d:ff71:dd97 with SMTP id ffacd0b85a97d-48e07975c0emr7979526f8f.7.1792392788079;
        Sun, 18 Oct 2026 23:53:08 -0700 (PDT)
Received: from SVR.localdomain ([158.173.154.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm18545783f8f.37.2026.10.18.23.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:53:07 -0700 (PDT)
Sender: Semih Baskan <strstgs@gmail.com>
From: Semih Baskan <strst.gs@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Semih Baskan <strst.gs@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH] PCI: iproc: Skip BCMA-attached controllers in the platform bus driver
Date: Mon, 19 Oct 2026 06:52:49 +0000
Message-ID: <20261019065249.552-1-strst.gs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 767012397976 ("ARM: dts: BCM5301X: Describe PCIe
controllers fully"), the Northstar PCIe nodes under the "brcm,bus-axi"
node have compatible = "brcm,iproc-pcie". bcma_bus_register() creates
platform devices for the children of that node before it registers its
own cores, so pcie-iproc-platform probes these controllers before
pcie-iproc-bcma does, as IPROC_PCIE_PAXB.

IPROC_PCIE_PAXB sets has_apb_err_disable, so the first config read on
bus 1 reads APB_ERR_EN at offset 0xf40. The report in the Closes: link
shows that read taking an external abort. On a BCM47081 (PCIe core
revision 0x01) with a device behind the root port, the board does not
boot, and it boots when has_apb_err_disable is cleared.

Return -ENODEV for a controller whose parent is "brcm,bus-axi", before
the driver allocates or maps anything, so that the controller is left
to pcie-iproc-bcma. The devicetree stays as it is. The check does not
depend on CONFIG_PCIE_IPROC_BCMA, because a kernel with only
pcie-iproc-platform does not boot on the BCM47081 either. On a BCM47094
(core revision 0x07) pcie-iproc-platform enumerates the devices on its
own, so there a kernel without CONFIG_PCIE_IPROC_BCMA loses PCIe, as
before v7.1. CONFIG_PCIE_IPROC_BCMA defaults to y on ARCH_BCM_5301X.

Tested on an ASUS RT-N18U (BCM47081) on a 6.18 kernel with the
controller/iproc-bcma changes backported. With both drivers enabled,
pcie-iproc-bcma binds controller 0, the BCM4360 behind it enumerates
and the platform driver logs nothing. With only pcie-iproc-platform
enabled, the board boots without PCIe. Without this change, neither
configuration boots on this board.

Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
Closes: https://lore.kernel.org/r/0dcfb2db-5536-465a-bee1-afe160535748@broadcom.com
Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Semih Baskan <strst.gs@gmail.com>
---
This is on controller/iproc-bcma in pci.git and needs 9850907ee1dd
("PCI: iproc: Use the EROM outbound window on BCMA"). Without that
commit, pcie-iproc-bcma fails with -EBUSY on v7.1 and later, so this
change alone would leave Northstar without PCIe. If this goes to
stable, 39d1c645bb99 and 9850907ee1dd have to go with it.

Mani's sketch [1] returned -EINVAL; this returns -ENODEV, which the
driver core does not log as a probe failure.

[1] https://lore.kernel.org/r/179197555828.38040.6359970121400952902.b4-reply@b4

 drivers/pci/controller/pcie-iproc-platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/controller/pcie-iproc-platform.c
index 4c9a0c4bb923..63560c733a8f 100644
--- a/drivers/pci/controller/pcie-iproc-platform.c
+++ b/drivers/pci/controller/pcie-iproc-platform.c
@@ -45,6 +45,9 @@ static int iproc_pltfm_pcie_probe(struct platform_device *pdev)
 	struct pci_host_bridge *bridge;
 	int ret;
 
+	if (of_device_is_compatible(np->parent, "brcm,bus-axi"))
+		return -ENODEV;
+
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
 		return -ENOMEM;

base-commit: 9850907ee1dd4376c09c4129e0adbe3b39d191b7
-- 
2.43.0

