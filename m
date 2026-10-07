Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792103D7D67
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791349339; cv=none; b=SrH1P6RYWCrtGYjAWaT7WzUwoivaNHs1wgo3ZFR8y/pIgvF0Pengz4FsZ7fN+JUSxOJCpzk0Ymk33mCDu741fTzX+YZZPtg2c2Sjy42Lz/8hJZ3pIX0rPmxDLtpknlIX3mljMHtY8B7RK61I0b3cYrbXtP23yEPOCR2nq7KVntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791349339; c=relaxed/simple;
	bh=HBz6/1jKv3A92D4++qlLo7U7f4XTi2QMgHTd/YuqwQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUb6BNkQGefXLuCI2dM8Mqf4Ugw5TVx+spwVfXm6rwg1+oMgTzCk/j9cSbvwn8Ndgc2XpA8PTU+Xmzb9V+NxPMlLpgy246HHkVdmqG1NQLVZZrLnemUVdDRoW1qFSmgedaJls7JBkVhoNSYw+nXlNqH42wcJPcm1Cw5chcUIoYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ODLPLcr+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ODLPLcr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791349337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ejEKuXGlJ5SVXnp1RnYvtVeLkqAYtrV16J72R2PUKHg=;
	b=ODLPLcr+MWV5OvdkSPBi0YVy0JwPMu7AznUXSwOP+dXYEvIZwsa+QWza8Y/Ufn2s+MKjXd
	Ahn8LK/nISheyaIkO22JJ2uUjIUozUTYG0Y7dxofBM4p66/l0YiqbLRaSfILQuZ1IICZfs
	ojXxdmsDwBj2RnKqQrwuFLtwD449/Ig=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-MehdZqSTNDaTb_oRHMoIYA-1; Wed,
 7 Oct 2026 05:02:14 +0000
X-MC-Unique: MehdZqSTNDaTb_oRHMoIYA-1
X-Mimecast-MFC-AGG-ID: MehdZqSTNDaTb_oRHMoIYA_1791349333
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E1A05184A0A0;
	Wed,  7 Oct 2026 05:02:12 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3646F30000E6;
	Wed,  7 Oct 2026 05:02:09 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Christian Murphy <christian@themurphys.eu>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 2/3] media: i2c: imx471: Define symbolic names for PLL registers
Date: Wed,  7 Oct 2026 13:01:39 +0800
Message-ID: <20261007050140.26604-3-hpa@redhat.com>
In-Reply-To: <20261007050140.26604-1-hpa@redhat.com>
References: <20261007050140.26604-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Replace raw register addresses with symbolic macros to improve code
readability. Additionally, fix the register sizes for these PLL
configuration registers to 16 bits.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/imx471.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index bc6bf11ecf31..b469fef7eef9 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -68,15 +68,24 @@
 #define IMX471_EXT_CLK				19200000
 
 /* PLL */
-#define IMX471_REG_VTPXCK_DIV			CCI_REG8(0x0301)
-#define IMX471_REG_VTSYCK_DIV			CCI_REG8(0x0303)
-#define IMX471_REG_PREPLLCK_VT_DIV		CCI_REG8(0x0305)
+#define IMX471_REG_VTPXCK_DIV			CCI_REG16(0x0300)
+#define IMX471_REG_VTSYCK_DIV			CCI_REG16(0x0302)
+#define IMX471_REG_PREPLLCK_VT_DIV		CCI_REG16(0x0304)
 #define IMX471_REG_PLL_VT_MPY			CCI_REG16(0x0306)
-#define IMX471_REG_OPPXCK_DIV			CCI_REG8(0x0309)
-#define IMX471_REG_OPSYCK_DIV			CCI_REG8(0x030b)
+#define IMX471_REG_OPPXCK_DIV			CCI_REG16(0x0308)
+#define IMX471_REG_OPSYCK_DIV			CCI_REG16(0x030a)
+#define IMX471_REG_OP_PREPLLCK_DIV		CCI_REG16(0x030c)
+#define IMX471_REG_OP_MPY			CCI_REG16(0x030e)
 #define IMX471_REG_PLL_MULT_DRIV		CCI_REG8(0x0310)
 #define IMX471_PLL_SINGLE			0
 #define IMX471_PLL_DUAL				1
+#define IMX471_VTPXCK_DIV			6
+#define IMX471_VTSYCK_DIV			2
+#define IMX471_PREPLLCK_VT_DIV			2
+#define IMX471_PLL_VT_MPY			121
+#define IMX471_OPSYCK_DIV			1
+#define IMX471_PLL_OP_MPY			83
+#define IMX471_PREPLLCK_OP_DIV			2
 
 /* IMX471 native and active pixel array size */
 #define IMX471_NATIVE_WIDTH			4672
@@ -236,14 +245,13 @@ static const struct cci_reg_sequence mode_1928x1088_regs[] = {
 	{ IMX471_REG_DIG_CROP_HEIGHT, 1088 },
 	{ IMX471_REG_X_OUTPUT_SIZE, 1928 },
 	{ IMX471_REG_Y_OUTPUT_SIZE, 1088 },
-	{ IMX471_REG_VTPXCK_DIV, 0x06 },
-	{ IMX471_REG_VTSYCK_DIV, 0x02 },
-	{ IMX471_REG_PREPLLCK_VT_DIV, 0x02 },
-	{ IMX471_REG_PLL_VT_MPY, 0x0079 },
-	{ IMX471_REG_OPSYCK_DIV, 0x01 },
-	{ CCI_REG8(0x030d), 0x02 },
-	{ CCI_REG8(0x030e), 0x00 },
-	{ CCI_REG8(0x030f), 0x53 },
+	{ IMX471_REG_VTPXCK_DIV, IMX471_VTPXCK_DIV },
+	{ IMX471_REG_VTSYCK_DIV, IMX471_VTSYCK_DIV },
+	{ IMX471_REG_PREPLLCK_VT_DIV, IMX471_PREPLLCK_VT_DIV },
+	{ IMX471_REG_PLL_VT_MPY, IMX471_PLL_VT_MPY },
+	{ IMX471_REG_OPSYCK_DIV, IMX471_OPSYCK_DIV },
+	{ IMX471_REG_OP_PREPLLCK_DIV, IMX471_PREPLLCK_OP_DIV },
+	{ IMX471_REG_OP_MPY, IMX471_PLL_OP_MPY },
 	{ IMX471_REG_PLL_MULT_DRIV, IMX471_PLL_DUAL },
 	{ CCI_REG8(0x3f4c), 0x81 },
 	{ CCI_REG8(0x3f4d), 0x81 },
-- 
2.55.0

