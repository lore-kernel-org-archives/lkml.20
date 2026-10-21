Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584863;
	b=wYz/LQQaP74sAj4hBcmkU6y4q13TcCVGg0sDQtP9ynnaYssUo2iv5JKhnRPS1Ryu7cV6
	 O96wgv/Zt0ex6ZoZ7drlZmk1MieRzGsJkihh3M3PdU7+O26hN5zZzfkbTLfYcd1754SS+
	 Z/peKoJ8zYzlPTR1G60kB6yZkxn1S1I/ZnuRtIpVDQH6HNKNS+Uyx2KDkwl6UsCQhQlEM
	 /GSfn0QtYsf8BVyvzSsUquf0pNB8pT0JEzL38wJG/OHZdMjwQi/Dfs+lfGMAzllyU0NXJ
	 l7OmjNQEuAKGjJbFeIy9IHewtCZGKRQEywCBrmibk5G9yWNtTumpwU2g59uFDnkIgpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584863;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=K2Oo8I2EnwQsV5/bIFhjDeneBCs7kbHz8MWA9bokW1c=;
	b=MCT5Oe+fSFGSeVSz05bS4wxzIDDpNrgTpzOqkD9EpD1cpv+Ip4TxE/2LvMa6aw+TWkz2
	 WZZs6oLeq4Na621q91xSqkyKcMKvZ9FfuqrZaKJmdlPhCVhxHklLkQt8Ufnf7l7/oKhG5
	 MiqOVCeCs7GWRZXzcZ2sIfuaDOLP6r1Yyer3M3Lt6NXxQ4/FyYBn5Q9x1jZiPh3eZ/dJb
	 gJ/3KfHjJQECfr2HNpn4B6wbi0EYPuJWNzICCW9UDMDK+uzvUDFbjeNOnS5djicd1EwyK
	 wlEE0K1vBIIEdAbrJkN7gY2PI8LBe86moSvtl0VgKcWdqktYrJzNguZnG85okORgQVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eM0YAfYE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBED606A31D;
	Wed, 21 Oct 2026 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eM0YAfYE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E3E1F000C5;
	Wed, 21 Oct 2026 12:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584862;
	bh=K2Oo8I2EnwQsV5/bIFhjDeneBCs7kbHz8MWA9bokW1c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=eM0YAfYE/Th29P3UqbNbNfcvHATTSV2/CnUUytiTAfxBzzcdArDCPplAVn+D4FISh
	 ju8nPToEFMFs7RZaWd0bwaMwrVThS1y0z2NmY4t3Tkj6pKFazXNEbNtfCPGQ+hQCvv
	 K4bNC5VES+Jpht0KcUoN/VAbArg6tI+OsY8UnXlloKIax/msmh3eNrdk6t7ZKfnwb8
	 qxWm6/IDWjpbLrfqtcjYSYEEN7LUWeP56oggXxR4ZfWxH0tV79O7PTVxKBcvYuZTnl
	 qX9c1auX//+SN9kkRaOsFqQsQqtI3KUbWkUx4mId8CsnR3rQ/qA9FWc0wkiOkscgqa
	 wajDDISRMydWw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/28] mfd: ls2kbmc: Allocate simplefb platform_data on the heap
Date: Wed, 21 Oct 2026 12:09:26 +0000
Message-ID: <20261021121245.3111563-4-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021121245.3111563-1-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
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

ls2k_bmc_probe() declares struct simplefb_platform_data on the stack and
assigns its address to the display MFD cell.  Although mfd_add_device()
deep-copies platform_data via platform_device_add_data() before
ls2k_bmc_probe() returns, the shallow mfd_cell copy attached to the
child platform device retains a stale pointer to the expired stack
frame.

Allocate the simplefb_platform_data structure on the heap via
devm_kzalloc() prior to devm_mfd_add_devices() so the pointer remains
valid for the lifetime of the child platform device.

Closes: https://sashiko.dev/#/bug/linux-4e2dd9cb-310b-4bba-b305-ffacc738285c
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/ls2k-bmc-core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index e245bdee8226..3e3bc835262e 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -470,7 +470,7 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_platform_da
 
 static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
-	struct simplefb_platform_data pd;
+	struct simplefb_platform_data *pd;
 	struct ls2k_bmc_ddata *ddata;
 	resource_size_t base;
 	int ret;
@@ -489,12 +489,16 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-	ret = ls2k_bmc_parse_mode(dev, &pd);
+	pd = devm_kzalloc(&dev->dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+
+	ret = ls2k_bmc_parse_mode(dev, pd);
 	if (ret)
 		return ret;
 
-	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data = &pd;
-	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size = sizeof(pd);
+	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data = pd;
+	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size = sizeof(*pd);
 	base = pci_resource_start(dev, 0) + LS2K_DISPLAY_RES_START;
 
 	/* Remove conflicting efifb device */
-- 
2.56.0.218.g1ec904b173-goog

