Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979F73B71B9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508319; cv=none; b=prlbsd/zj+2PNLc1JXdRpfmprJKOmeuWXIRq9yP9NKPUy2UcdSb960xKJ89H/i0CQ0DdFoxamq4hx9mXh+KA/w9wXhSTOeb448VZ0a61zaDekfmenCtFDYq7KzZl2M2+OJUBODw/bBktRk1oWDSezlZvTmYxv1Xnr9EgVTh81dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508319; c=relaxed/simple;
	bh=rP1BEpNy7j59pYCuXhy9GQIlhQNX/qMgcYlTfd8auyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQvF1/O/NyHt5ioIyB5tMBTk31eSzhxZ4A9L1IXIHsrnMucmMhBZwA/WBlFXapNBY9sdlLrtcyXgQ3DdG5HqrbPkrGtI/c1leR8QB1hnAgcVrqy8smAacydroMXBZSU2T/wlGxlg+G75tBnnuX8gVBZVg0AIwDZa22oNWvVSFjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XeUHtofL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XeUHtofL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788508317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGdvgtkNrs9KN5jbXelsFzF+Y38oqarYUi5pXTI1gUo=;
	b=XeUHtofLqmPQNf31dFzQ5R0L4P7xvvW4XzHmr6+OTRPFlUNrKWnjR97JEXnW2liv4a+D2L
	WYKtJdyMB4hW9CiD1xoyNCH1gBB3ak2IkIJioB7YyNH1wfhVov2fpbijuzp06yGvDVP6M/
	+yWwixT8sIOF26Ibs4fCPEkrjxQNJQ8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-tdxsGeK6OSutJDY6UNxSqg-1; Fri,
 04 Sep 2026 03:51:56 -0400
X-MC-Unique: tdxsGeK6OSutJDY6UNxSqg-1
X-Mimecast-MFC-AGG-ID: tdxsGeK6OSutJDY6UNxSqg_1788508315
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6A63186FB8D;
	Fri,  4 Sep 2026 07:51:54 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5BECF18001D0;
	Fri,  4 Sep 2026 07:51:51 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 1/3] media: i2c: imx471: Add line length PCK setting
Date: Fri,  4 Sep 2026 15:51:11 +0800
Message-ID: <20260904075113.125751-2-hpa@redhat.com>
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

Add the line length PCK setting to the IMX471 driver. This parameter
determines the horizontal line scan duration and is used to calculate
and control the sensor frame rate.
Set the line length PCK value to 0x0a00 (matching the original value
in ipu6-drivers), which maintains a frame rate close to the datasheet
spec (~150 FPS in 2328x1304 binning mode).

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/imx471.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 4053aed84340..3c939f2a9056 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -91,6 +91,7 @@
 #define IMX471_CSI_2_LANE_MODE			1
 #define IMX471_CSI_4_LANE_MODE			3
 
+#define IMX471_REG_LINE_LENGTH_PCK		CCI_REG16(0x0342)
 #define IMX471_REG_X_ADD_STA			CCI_REG16(0x0344)
 #define IMX471_REG_Y_ADD_STA			CCI_REG16(0x0346)
 #define IMX471_REG_X_ADD_END			CCI_REG16(0x0348)
@@ -240,6 +241,7 @@ static const struct cci_reg_sequence mode_1928x1088_regs[] = {
 	{ CCI_REG8(0x030d), 0x02 },
 	{ CCI_REG8(0x030e), 0x00 },
 	{ CCI_REG8(0x030f), 0x53 },
+	{ IMX471_REG_LINE_LENGTH_PCK, 2560 },
 	{ IMX471_REG_PLL_MULT_DRIV, IMX471_PLL_DUAL },
 	{ CCI_REG8(0x3f4c), 0x81 },
 	{ CCI_REG8(0x3f4d), 0x81 },
-- 
2.55.0

