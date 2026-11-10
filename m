Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347810;
	b=xVtids+nPmviWoGdY5HQoe494ev+2kKSuGYatMoIKiV1isLzRknCeDBWMlaaqLYtu2hB
	 ALR3pJ0LtHOMBU8+pf5SsXZDzN3woqvX4lsX5n6VNZ+fUd0tzO8no+rUf+aP4v6+vi0nh
	 PUPECvRxRMEgluShxJuGWLGnfdtWakMOU/jxK6YrIbS19YvYKOE7wOnWttC6BgPvS3o7L
	 hzKzCRBpA407VYgvBCuyEq1xWprZqmR/gqECZNODY6ybo5RNjCcJVF/yP6FCmcvx96sP4
	 9FC3hsf5KcI1Edg7HFUiUbPwu6PXSjPeI+IMc53r+hyurr+Q93Atrkp787hwNCWDmow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=weZBFqmGCZnQE6T9nW8X1sGdiaZu35IzkrWWAbHlJD4=;
	b=KMSPDbwesUcZuVkLXbqDWpVCNNyd7IHRQzUXj3kccC2ydDyBe0v82KxQjfo/Oeym/GUM
	 jh40xMA4FhDVNzS5kZecJGiba65XLjUc/zw8p+WLrbylGD7yKSJN/JyDudF5kyNcQH1rn
	 7pgufR2Ff76yQqXtCHpbJ2osf8lrMqtEiuidsajrJrInjUZzYA0s7pruu81fWStJMvmm/
	 hQyvR6EsNmtmCs05gPfO/GDf6EAV731rLUXXV/uXYUYo/G3GsDEuEetkux2Pr6f+LRjNg
	 AJoWUx97HSW6Y3Q2O5Xr1yUrgih+QmEKFvSvFojlU5BeKrfCZOg+5Ylu1WNvfdfi8ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VB6W1tFK;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE30D606D4DA
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE30D606D4DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VB6W1tFK
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so27319425e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347808; x=1794952608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=weZBFqmGCZnQE6T9nW8X1sGdiaZu35IzkrWWAbHlJD4=;
        b=VB6W1tFKgtdupGK3m+uafzUuVQh5FzcF3cYogwffNTTGNftOBQHErJaHXdVtudE8xC
         r6ApuKFQ7r53rxc21RhzxiyJNJqqRvudtk6cHFb5+LjUaE7QRoj/40wMXaHcm4x1Amq/
         Grq7khHz6eDTkvQw865OL79cKvLWhFYnKRZonrv1Egsex3Hsvm6gAK4B2vFt0hXdXKX6
         +bj3w23pej8L6O9UzpjYjsAocAwjzvFuhtwmG9fC7A3siqyp1aZbYt6RPHl7aY3F5QDC
         SHqC0/3vx6BWbKhW2vR/gCIZ8+8hcc2NINIW+TPqkiy0lZjzhuMKVF14mJ9ud+q1+QY6
         mgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347808; x=1794952608;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weZBFqmGCZnQE6T9nW8X1sGdiaZu35IzkrWWAbHlJD4=;
        b=n4BCs+ky8/D00/dyi1KGKP7mS2o9zy2AV42l8BGQpwAVtr//RX6pviKxvTs3CpHtqK
         iYNIKRDbufql3ujDfia0B0p6E7/Y1ChfrgKaylqkaFmF5LBBtPYZbnH3i/shKLKZqwoH
         32SMTNwQg0BukuD2bOoNW2p+pIbFHhgho1RwU0Bo9xatuzyEWB7hb9sxCb0jyuHSKEz8
         yfOVwvu9Wubp9ZiAQJweBSwuOheWUy782/mSh7RahZ6+ovX4N6TjqDj0ol9ZlOMmpOME
         MAkCUMFotEcQDrslUGTatlXGrPIDFALs2kf+BvSvrENcc623I+t5sgmM3BQ5mBBh9Xax
         lloQ==
X-Forwarded-Encrypted: i=1; AL+hErELmmjImxaYcz4nQAUbocKiMReKiqQrU0VNdelfaowJH5wJEKuPhOKZ3IZpMWenxpxVYF2wNjON6LPLr1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ADMC0NWbEpzRQJVcofhWYImB2oBSF8GsUUpn5aO2pgY5jTmpX
	Y0yT3njysvTEfajkKax26Q5bGQCHQ4W3HSxU6Xv2YKAyu8Q67QlN9Tn0ag9nHQOMIdA=
X-Gm-Gg: AYBFou0uD8eorTrOAnaeQv58qqs2p7cN6tZzpSkzGiFirJRGUN+pd88fnZEdn6IVEcC
	yD2pE4WAdpCPUq71g84zqYoM8SpIPID+II0leGT5T8mHjRF36Xt++JpN2zo9RXijj7yQTkaDDQa
	xW6T7Fc4aGCBrhNDgTAUaZpkb9VM9CZd8F7zdtmUaNQzQ2rMcHQ4kLdxC2eh/LuYP8KAvfFSkEh
	Bf728srUpD+jDy7+mPeITmOtryyMlP/68s/sN+XVC09zUeZDdwfpZv0tapC2Q2lt+GW2l53llxR
	SL5vxeBrtlioSsAKZmcJoBXPSYkB0dvFwuRfxWk/lpKCSIgnoJvK8FWC3nB/V7ewc4xW37eCPzD
	dRl0Ks0BJjSKV71HMB5wgez3ZOrG4W3TWxPWcolbzS1aPnF5HpD5EEQMAT5pW4QkpRoiEcMIpqb
	4fmOQ2bNO8B2RX3oShlycbT5I+tb71PGFR7rDvPfDSaXeR45StCHH4RwjSnvzbAOjMiSWEYIST+
	6dlyI+vGj1WmZouL8lE7lK+i5YmC03XpPzbb+XDNH7hTgSOCY+O9Wi21ZmivM3LDavBXIa9TKAP
	/idlTj75wxdU83EqK1XBvX6FcLKgU8aaP+c=
X-Received: by 2002:a05:600c:3f07:b0:4a5:87a:50ba with SMTP id 5b1f17b1804b1-4ba0938a6a7mr6328225e9.33.1794347808194;
        Tue, 10 Nov 2026 13:56:48 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fe2c5asm141518725e9.5.2026.11.10.13.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:45 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Peter Tyser <ptyser@xes-inc.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 20/20] mfd: Unify style of pci_device_id arrays
Date: Tue, 10 Nov 2026 22:54:45 +0100
Message-ID:  <9b6547adee2fd84843eb9fa350be8b00faa2f385.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5276; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=FAdg/FTwaP8mLZ8Ekm81L5Oz7XPAFU3smKRxk0ajg+8=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGrzktajUergKbO15bRcqbTYZ3Wb7uQduRUIHkv7AzMQMRhTS YkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJq85LWAAoJEI+A+1h9Ev5OTGwIAIhR tW8CqaOg/UZhMi3Eyl9yHcQb0xA665dbedv0r7hw+d3bMw2rQHv9OK5D3minupCCndAGjxug64a PHvyigKa1xoScPlz94zonbTAKQ+rkSyr6Wsj5ytSVj+IkQQ1SROJtDWkDc2FucpEckbNsqv6+rh 3a9AT2Er+Udq2v84HOnzfw6nWq4B9tnfS8r6CrTHEQPlSjcaCouGOFtRPIXttJ6BefQcEvEWw02 58c4G+TLX9smQUHsmkfeOp15DkzxTpyKSW0bjCJzMDDawz9/9bWi0Kkzzoe3LJkctxr9pNrKWB7 HsdBSPbbeUeeCPKgI0pvbDLfq4Qww+aahYiMkag=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These arrays already mostly match the most used and generally
recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the offenders accordingly.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cs5535-mfd.c           | 2 +-
 drivers/mfd/intel_quark_i2c_gpio.c | 4 ++--
 drivers/mfd/ioc3.c                 | 2 +-
 drivers/mfd/janz-cmodio.c          | 2 +-
 drivers/mfd/lpc_ich.c              | 2 +-
 drivers/mfd/rdc321x-southbridge.c  | 2 +-
 drivers/mfd/sm501.c                | 2 +-
 drivers/mfd/timberdale.c           | 2 +-
 drivers/mfd/vx855.c                | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/cs5535-mfd.c b/drivers/mfd/cs5535-mfd.c
index f3becbef19f5..3b52717aa316 100644
--- a/drivers/mfd/cs5535-mfd.c
+++ b/drivers/mfd/cs5535-mfd.c
@@ -155,7 +155,7 @@ static void cs5535_mfd_remove(struct pci_dev *pdev)
 static const struct pci_device_id cs5535_mfd_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_CS5535_ISA) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CS5536_ISA) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, cs5535_mfd_pci_tbl);
 
diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 7f8c16d82738..08dda59b9236 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -148,8 +148,8 @@ static struct mfd_cell intel_quark_mfd_cells[] = {
 };
 
 static const struct pci_device_id intel_quark_mfd_ids[] = {
-	{ PCI_VDEVICE(INTEL, 0x0934), },
-	{},
+	{ PCI_VDEVICE(INTEL, 0x0934) },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, intel_quark_mfd_ids);
 
diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index bf2be3bc8602..b78dbb98b9a5 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -655,7 +655,7 @@ static void ioc3_mfd_remove(struct pci_dev *pdev)
 
 static struct pci_device_id ioc3_mfd_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3) },
-	{ 0, },
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, ioc3_mfd_id_table);
 
diff --git a/drivers/mfd/janz-cmodio.c b/drivers/mfd/janz-cmodio.c
index 93e1c04bddd6..96556ea754fa 100644
--- a/drivers/mfd/janz-cmodio.c
+++ b/drivers/mfd/janz-cmodio.c
@@ -265,7 +265,7 @@ static const struct pci_device_id cmodio_pci_ids[] = {
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202) },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201) },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, cmodio_pci_ids);
 
diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index d2efcc92bb59..8d4b0a499da8 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -958,7 +958,7 @@ static const struct pci_device_id lpc_ich_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0xa1c7), .driver_data = LPC_LEWISBURG },
 	{ PCI_VDEVICE(INTEL, 0xa242), .driver_data = LPC_LEWISBURG },
 	{ PCI_VDEVICE(INTEL, 0xa243), .driver_data = LPC_LEWISBURG },
-	{ },			/* End of list */
+	{ }			/* End of list */
 };
 MODULE_DEVICE_TABLE(pci, lpc_ich_ids);
 
diff --git a/drivers/mfd/rdc321x-southbridge.c b/drivers/mfd/rdc321x-southbridge.c
index c44a76285147..9405d9ac9918 100644
--- a/drivers/mfd/rdc321x-southbridge.c
+++ b/drivers/mfd/rdc321x-southbridge.c
@@ -79,7 +79,7 @@ static int rdc321x_sb_probe(struct pci_dev *pdev,
 
 static const struct pci_device_id rdc321x_sb_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_RDC, PCI_DEVICE_ID_RDC_R6030) },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, rdc321x_sb_table);
 
diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index b30488257014..efe211b675f5 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1643,7 +1643,7 @@ static void sm501_plat_remove(struct platform_device *dev)
 
 static const struct pci_device_id sm501_pci_tbl[] = {
 	{ PCI_DEVICE(0x126f, 0x0501) },
-	{ },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pci, sm501_pci_tbl);
diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index e75e1d6851ab..adf7a7ead3b6 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -845,7 +845,7 @@ static void timb_remove(struct pci_dev *dev)
 
 static const struct pci_device_id timberdale_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_TIMB, PCI_DEVICE_ID_TIMB) },
-	{ 0 }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, timberdale_pci_tbl);
 
diff --git a/drivers/mfd/vx855.c b/drivers/mfd/vx855.c
index 985f81c1739c..623735be62ad 100644
--- a/drivers/mfd/vx855.c
+++ b/drivers/mfd/vx855.c
@@ -105,7 +105,7 @@ static void vx855_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id vx855_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_VX855) },
-	{ 0, }
+	{ }
 };
 MODULE_DEVICE_TABLE(pci, vx855_pci_tbl);
 
-- 
2.56.0.rc1

