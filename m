Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617760;
	b=X9acGhJscRczlTRf7zQ4G9dN+vgI/q49vScHjekRYAMwSSBSrtjU4aPbAJODC1Tmk8bZ
	 2k3G1dTcRZqSX5x9Apoa9an768O04KkK6nzs34VZ9AFD9DqVUC9f+y5GX22qqCPbWUIev
	 Ik8gua4gn5VIWFn7fMUw8x6B/q6ZP9PbuBJgsUeOZtWNtw8ZehG0t/tmlYngFEjVHsmTj
	 kiKiMINP0qNI08RYTNifRnUEGJ/bBeE+wKXnMs7LCAw6XsAp8tSTf36cIhe2gxg4B3yL0
	 B/Av7mYp3d9z5ddOphPXx4mKhGi3WsLZ62/PDLDTfH/3ifpt2HgefgMDOnfEOqvH2MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=WDPlWEr5vvxFvs1r3aljWZo5UyQa/QJd8V63WGEeymo=;
	b=3OyPlet7i1JrZhw14tv0liujWsWd1CaGsRweTAmcFTTpkSlNDe695qtM76g6wyxxOj5l
	 wjWx7w7swzLTGyRl98mVKVgFfuDt2tzhY9VJHJHKeR0WtIJCTXprs0lpSFfZYFSE0aNz3
	 3QE5YEaUfpNWyZloSpArdVswK0WYeNhuc1rzl5rMWo2vnJpbK/qGpKkGfcd0i9+gwXNrw
	 sVWtuHYrBid+VXn1yo6MP/WURgC5Xu93nv7xU16nMgcDemJbED5u/j+ov0dcK20InFAqx
	 LSNnnCJbx93EHK7Laf6u2PKc9dIPyzJvbGJCQBTTa3kONAPxDsTgeJu8y5d6WAhRKJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=o9ovnRGQ;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00841606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00841606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=o9ovnRGQ
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1647983f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793617757; x=1794222557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDPlWEr5vvxFvs1r3aljWZo5UyQa/QJd8V63WGEeymo=;
        b=o9ovnRGQIld9UNdYZeopARKH6BGbwR4ZZINiPl16cIzEf78zZgLtUSJ9HVBkrQxLQT
         7G7lNXV+3iD6rn7K4/sEy9r0qh8imBu+Nhsi2puebCBKHuONtiP43ryj6BHViqg2t8AA
         yZg3K/Iuf+mnbm83klmhbeYxRUkPqC3Nqv6O1AujkoJwJSyh+7N9xPIPd8ZmDuSNrSSx
         p7FHdDBcsWN9Rll4+gEWKOn0G4R087TNSMxF6zzOXFRS2V9v/zWtjvHbD/bK6uL/4mGi
         HRaOHugX/VtgRz5u0JVMjmnMwyYtiWeVPqYVRe6qIzEmBHdBweOc1qR+cE2bkP8wR76z
         8N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617757; x=1794222557;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WDPlWEr5vvxFvs1r3aljWZo5UyQa/QJd8V63WGEeymo=;
        b=eFuqzAZIJ/w8eIiT3YQpPYhfm2g4vIZSAGOQNU85TZqBJCfeCW3SqLxeqlBjSsBXfB
         kkDBZ/2KlRtHcHnPvmyvA2iGDmUIVV78mlz7txaanW++rB3akcpzMLzbpYEO7o+sBBpt
         tPZVNdXoUhmYlFJRDU/naTtgY99zfX9SQzUMi3mC7/PuKNRBYkylxg92/mWP7K18hCkk
         7zsL70imbaelm+EysfpJKaW9/yVKUtvIJyIXtcsjTZF3i8QfxxTtx7GekIbL7rXC4820
         Rn3gHSjYTsCqcxb/7KEyl8edeftifRPLQpLx3O6zaXuwW93AD7u/KDdk82LXWwjY8gg2
         FeNA==
X-Forwarded-Encrypted: i=1; AKwUvByTJOwLVdtOig9SywmXVOUYrBiqReO2a67pWBreMVWWR4OzMeInivVR2n6/Bzitk6ny6//TkjNR0RACpXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QvQMA0M1QD9Xz03CPkHHScgsjdm9RalpoVYvbftilH3HtFQv6
	iH1IhcztY4SOmT37LzCP/1fWX2zGHzvP41n5dSXPB6oGq+/Ie/9PoccZh7t5O6Kskng=
X-Gm-Gg: AYBFou36T8dQRDIDTjqfc0E0QQ2LLa+Ms76rmKCZNtv6sJMDmrZc6U40PDDgHb/km0I
	4CaIElUso8+pR9/FdoNAFW+9iChvepRceHbJW1dFqXi8bKhyzGM6UbLGwV/SwSz7L9CUost5pjr
	01cL8aQtjcAjzGIYtnWJFhHSNMRav1iDLmtMs+HiAQlwjgxXHF5IGiQMd+I6YPZKQ8Jl+yK4KSR
	ByG6X23CI/XFftJxnGyyLfAnKyjlGrRoEyKk9Y7VQJ9bzZFOQI8FN40vBDb+pE24WEFqCTUqm3t
	7vPdY4HaDeg1nDnPJRlhGJEXqbxnoI1/mNqaHIEoC1z9njdkAceQHh0JeJpiKNs0YOxXYORgJO4
	oLYi8VelC7bkEqHAjLS2y004UIV2Brf+bgz6lMnaQ081qkuQnOY4wmNd2pby8zvQ9J74OXJcxsF
	qNaYaG+gmf7dCwF7YKs4EV0yqHYn5jeE20LJ/2gjmHWy6cqTWm6UHwKwDUmkd3Edoig5l7ACh15
	66aFhfV9Z//Xh8FTdOk8cJr8HURxYIzKi5mFWJqrTyNl/j3vg28f953nKLxAenoK4K1XTzp37NY
	T9wAhTHEcaVHOCsHcKYQGgc2CiYsWjBeTJiziS6UGKVOnAPMAXvFgY/FgUgeQZfBh8j8mhnDrqb
	g3jHp
X-Received: by 2002:a05:6000:1aca:b0:48e:932:aefa with SMTP id ffacd0b85a97d-48e6e2f66b5mr22271387f8f.26.1793617757065;
        Mon, 02 Nov 2026 03:09:17 -0800 (PST)
Received: from localhost (dynamic-002-212-042-085.2.212.pool.telefonica.de. [2.212.42.85])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e71b8a84esm21497528f8f.39.2026.11.02.03.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:09:16 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: ena: Fold header containing PCI id definitions into driver
Date: Mon,  2 Nov 2026 12:09:05 +0100
Message-ID: <20261102110907.356621-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4495; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=RycBR3t8kWq8R2cK6MVVdr2eo2PDh9pdi58mZ8/8Dpk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq6G9TZ7dCfpj8h9L4Ng/H/irEiddEXtPl04VQh ZnbNoJd5l+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauhvUwAKCRCPgPtYfRL+ Tt0IB/9ze1ziQmqGU0i1ymAVWu2nVGONE7hNXRYQtuoLuvB5y8bxY8WlSwRKCVP6E7cfab7Kp4j Nln4sGMI02gSTGfr1SZypCv0QPtZl3vkH5ruuVt1SQt3eLjvZ+p9HeEdFsKsToTV0CKKPHLw4Pm pr5a3O4o4FPOg0+iPFGFpcl4hX9TfQ3TEjJGxd8Rg28PohcQccMqN7AZuPewwmwGCVWZB4q15rY rd7MLNoXWq/uO/C53m7SkNDTUmDc2b9grAoS/qcHwpVmMUG2Gcwe0yRrpQfganxfCBJ6gxKXC+M h9dqVqsl6+vrwMAMLUSjx8jLZNpx8WJFv78HXiHISfMjEOg3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The file ena_pci_id_tbl.h is only included once. Fold it into its only
consumer, simplifying a bit en passant.

Note that I took out the trailing comma from the expanded value of
ENA_PCI_ID_TABLE_ENTRY() and thus these commas have to be added when the
macro is used improving readability.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I'm currently working on deprecating <linux/mod_devicetable.h> and my
check script stumbled over the header removed here as it used
pci_device_id without including a header to get its definition. Instead
of adding one, simplify the situation a bit.

The change with the trailing comma is maybe subjective, I don't feel
strong here and can drop it if desired.

Best regards
Uwe

 .../device_drivers/ethernet/amazon/ena.rst    |  1 -
 drivers/net/ethernet/amazon/ena/ena_netdev.c  | 18 +++++++-
 .../net/ethernet/amazon/ena/ena_pci_id_tbl.h  | 45 -------------------
 3 files changed, 17 insertions(+), 47 deletions(-)
 delete mode 100644 drivers/net/ethernet/amazon/ena/ena_pci_id_tbl.h

diff --git a/Documentation/networking/device_drivers/ethernet/amazon/ena.rst b/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
index 14784a0a6a8a..72ea5ebf2f71 100644
--- a/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
+++ b/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
@@ -55,7 +55,6 @@ ena_regs_defs.h     Definition of ENA PCI memory-mapped (MMIO) registers.
 ena_netdev.[ch]     Main Linux kernel driver.
 ena_ethtool.c       ethtool callbacks.
 ena_xdp.[ch]        XDP files
-ena_pci_id_tbl.h    Supported device IDs.
 ena_phc.[ch]        PTP hardware clock infrastructure (see `PHC`_ for more info)
 ena_devlink.[ch]    devlink files.
 ena_debugfs.[ch]    debugfs files.
diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index 7eb6456ed0d5..c934d1e922e5 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -16,7 +16,6 @@
 #include <net/ip.h>
 
 #include "ena_netdev.h"
-#include "ena_pci_id_tbl.h"
 #include "ena_xdp.h"
 
 #include "ena_phc.h"
@@ -41,6 +40,23 @@ static struct ena_aenq_handlers aenq_handlers;
 
 static struct workqueue_struct *ena_wq;
 
+#define PCI_DEV_ID_ENA_LLQ_PF	0x1ec2
+#define PCI_DEV_ID_ENA_LLQ_VF	0xec21
+#define PCI_DEV_ID_ENA_PF	0x0ec2
+#define PCI_DEV_ID_ENA_VF	0xec20
+#define PCI_DEV_ID_ENA_RESRV0	0x0051
+
+#define ENA_PCI_ID_TABLE_ENTRY(devid) \
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMAZON, devid) }
+
+static const struct pci_device_id ena_pci_tbl[] = {
+	ENA_PCI_ID_TABLE_ENTRY(PCI_DEV_ID_ENA_RESRV0),
+	ENA_PCI_ID_TABLE_ENTRY(PCI_DEV_ID_ENA_PF),
+	ENA_PCI_ID_TABLE_ENTRY(PCI_DEV_ID_ENA_LLQ_PF),
+	ENA_PCI_ID_TABLE_ENTRY(PCI_DEV_ID_ENA_VF),
+	ENA_PCI_ID_TABLE_ENTRY(PCI_DEV_ID_ENA_LLQ_VF),
+	{ }
+};
 MODULE_DEVICE_TABLE(pci, ena_pci_tbl);
 
 static int ena_rss_init_default(struct ena_adapter *adapter);
diff --git a/drivers/net/ethernet/amazon/ena/ena_pci_id_tbl.h b/drivers/net/ethernet/amazon/ena/ena_pci_id_tbl.h
deleted file mode 100644
index 3ecdf29160ca..000000000000
--- a/drivers/net/ethernet/amazon/ena/ena_pci_id_tbl.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
-/*
- * Copyright 2015-2020 Amazon.com, Inc. or its affiliates. All rights reserved.
- */
-
-#ifndef ENA_PCI_ID_TBL_H_
-#define ENA_PCI_ID_TBL_H_
-
-#ifndef PCI_VENDOR_ID_AMAZON
-#define PCI_VENDOR_ID_AMAZON 0x1d0f
-#endif
-
-#ifndef PCI_DEV_ID_ENA_PF
-#define PCI_DEV_ID_ENA_PF	0x0ec2
-#endif
-
-#ifndef PCI_DEV_ID_ENA_LLQ_PF
-#define PCI_DEV_ID_ENA_LLQ_PF	0x1ec2
-#endif
-
-#ifndef PCI_DEV_ID_ENA_VF
-#define PCI_DEV_ID_ENA_VF	0xec20
-#endif
-
-#ifndef PCI_DEV_ID_ENA_LLQ_VF
-#define PCI_DEV_ID_ENA_LLQ_VF	0xec21
-#endif
-
-#ifndef PCI_DEV_ID_ENA_RESRV0
-#define PCI_DEV_ID_ENA_RESRV0	0x0051
-#endif
-
-#define ENA_PCI_ID_TABLE_ENTRY(devid) \
-	{PCI_DEVICE(PCI_VENDOR_ID_AMAZON, devid)},
-
-static const struct pci_device_id ena_pci_tbl[] = {
-	ENA_PCI_ID_TABLE_ENTRY(PCI_DEV_ID_ENA_RESRV0)
-	ENA_PCI_ID_TABLE_ENTRY(PCI_DEV_ID_ENA_PF)
-	ENA_PCI_ID_TABLE_ENTRY(PCI_DEV_ID_ENA_LLQ_PF)
-	ENA_PCI_ID_TABLE_ENTRY(PCI_DEV_ID_ENA_VF)
-	ENA_PCI_ID_TABLE_ENTRY(PCI_DEV_ID_ENA_LLQ_VF)
-	{ }
-};
-
-#endif /* ENA_PCI_ID_TBL_H_ */

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.rc1

