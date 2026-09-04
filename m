Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6972F3D6688
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508326; cv=none; b=Dx9Js3MH+E5pgNL4sT7AwC7V43Ja4HSIoXTMKKhQgaaZm7yF9YGbuAz+G3wS6PSCZ4ATq6LxPfXXDXrfxMNyYcn6wxdJp92gT24VLKXvC8LrJrejHybC8UcOH+YPd3dtfBSru281QHVe+w/1/rRV3a1D27bIRzSoHPsf/u89jPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508326; c=relaxed/simple;
	bh=s30E2MW5wW1e3GDry9skCsc7+1RsL6FhXie5ijCcqMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5ZUQwIHPTQohDVw5HwoOdrUhO3MV1Vkj5BZXgojjQNREsZXzJDOFVvXI7xXFsVMCLEvdmHB+vuSc7oxX/QZL+eBOidBZhDWXea8DgecdfI+h+pnjHsTzIYzX/+hY4I1c0mOZI5B5UZ8d4CsO069m465RU4tQZiT7RCY8SNWl10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HeXrBZ2T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HeXrBZ2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788508324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1x6pa7zD2FT4ykUicH5mxRTizvTeGsAjI1Ucs/bj7w=;
	b=HeXrBZ2TNeSwuxwCBuF7Yizcinh08yzI3dVkpuIbLcFJRBf34GmHUKYm4JFWbOWZxEjO+v
	rHGqRiSb2KHS1CI6zZ9m/MT0Nw90G5JI5uhUioCv8pUgT01EwqvSpLCdZtJQ+2//qsMcnU
	qV5kcAUJ7AsJCDlIO3DUfklTZIeC4UM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-106-nZ-w6ECuMtyrJy2TFcNUzA-1; Fri,
 04 Sep 2026 03:52:02 -0400
X-MC-Unique: nZ-w6ECuMtyrJy2TFcNUzA-1
X-Mimecast-MFC-AGG-ID: nZ-w6ECuMtyrJy2TFcNUzA_1788508321
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA7F11954206;
	Fri,  4 Sep 2026 07:52:00 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6C3B7180034C;
	Fri,  4 Sep 2026 07:51:57 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 2/3] media: i2c: imx471: Name the PLL registers in the OP domain
Date: Fri,  4 Sep 2026 15:51:12 +0800
Message-ID: <20260904075113.125751-3-hpa@redhat.com>
In-Reply-To: <20260904075113.125751-1-hpa@redhat.com>
References: <20260904075113.125751-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Define symbolic names for the registers in the OP domain, including
IMX471_REG_OP_PREPLLCK_DIV and IMX471_REG_OP_PLL_MULTIPLIER.Replaces
raw register addresses with meaningful macros to improve code readability.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/imx471.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 3c939f2a9056..316383076b3d 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -71,8 +71,17 @@
 #define IMX471_REG_OPPXCK_DIV			CCI_REG8(0x0309)
 #define IMX471_REG_OPSYCK_DIV			CCI_REG8(0x030b)
 #define IMX471_REG_PLL_MULT_DRIV		CCI_REG8(0x0310)
+#define IMX471_REG_OP_PREPLLCK_DIV		CCI_REG16(0x030c)
+#define IMX471_REG_OP_MPY			CCI_REG16(0x030e)
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
@@ -233,14 +242,13 @@ static const struct cci_reg_sequence mode_1928x1088_regs[] = {
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
 	{ IMX471_REG_LINE_LENGTH_PCK, 2560 },
 	{ IMX471_REG_PLL_MULT_DRIV, IMX471_PLL_DUAL },
 	{ CCI_REG8(0x3f4c), 0x81 },
-- 
2.55.0

