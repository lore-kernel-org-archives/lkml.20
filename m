Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9BA3D9552
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791349342; cv=none; b=lPMvd+eo7GIIHiREAELr5uj2oyQTkM4GAHbfKNTkX1XKRaNaHhOXugM1B2VArq5ZZRWjf0W98OO2NiWJgSHBUvdUXTtSmkRd5UIjgfHz/k/oLZdnbAdFQv3n+fwCpO37JKg0kbdWS4MZBxQZwyqi3WZyobrc1eB609KPBLjUQsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791349342; c=relaxed/simple;
	bh=/zh6UVP9aUeYN3cpUcykQQNd1mhLS35RKv4N2oJL8cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALk434z/d1X8PyDae94xV2ZU7HVPY8CEMAAYnZDXhWctFZOy7bbidFWCor5evtz/buV2xLnNINzPHLQkTC3+bEs9S49VYWm0IE6aBoXW76xR3BA3xwnzUSYmvjQPEiolUXe5SceE8Y9MEgbdBGR+f8ZC2iiE4ZycmGm1AAokvPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yu7qLn4v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yu7qLn4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791349340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d/g9cmQypPEzwZ0ihqpR2nlNyILiLISdA/oMiZxLG3Q=;
	b=Yu7qLn4vQYkiulqweaOCPRHqfLHEcbRhhzVSx7ob4Gpy8C7dcPmDJ1JlL9L83pDOyyDHrR
	x8YDjKkYmV4dpH8rxh0nm6DJYA404+YUWZUlCNMt0kJuleQi1YW4EXXqZr5eimlL3E6re4
	/c3b3WXXdIiMwoIkTd+OuqCDOedZvvA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-5QF_KDKINXuc1NGN-huTPw-1; Wed,
 07 Oct 2026 01:02:18 -0400
X-MC-Unique: 5QF_KDKINXuc1NGN-huTPw-1
X-Mimecast-MFC-AGG-ID: 5QF_KDKINXuc1NGN-huTPw_1791349337
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E0A41921EDB;
	Wed,  7 Oct 2026 05:02:17 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D02FC30000E6;
	Wed,  7 Oct 2026 05:02:14 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Christian Murphy <christian@themurphys.eu>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 3/3] media: i2c: imx471: Derive pixel rate from PLL configuration
Date: Wed,  7 Oct 2026 13:01:40 +0800
Message-ID: <20261007050140.26604-4-hpa@redhat.com>
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

Derive the pixel rate from the sensor's external clock frequency and
active PLL settings.

The discussion of pixel rate can be found at the URL
Link: https://lore.kernel.org/linux-media/CAEth8oHj1Jon9m_4aFzRGoKcdopUMym+MyV0JxTo6F+AUFOLoQ@mail.gmail.com/

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/imx471.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index b469fef7eef9..fc6a12943991 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -65,7 +65,7 @@
 
 /* default link frequency and external clock */
 #define IMX471_LINK_FREQ_DEFAULT		200000000LL
-#define IMX471_EXT_CLK				19200000
+#define IMX471_EXT_CLK				19200000LL
 
 /* PLL */
 #define IMX471_REG_VTPXCK_DIV			CCI_REG16(0x0300)
@@ -704,9 +704,15 @@ static int imx471_init_controls(struct imx471 *sensor)
 					   ARRAY_SIZE(link_freq_menu_items) - 1,
 					   0,
 					   link_freq_menu_items);
-
-	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
+	/*
+	 * The sensor runs in the dual mode so the pixel rate is defined as
+	 * follows:
+	 * (ext_freq * IVT_PLL_MPY * num_of_vt_lanes) /
+	 * (VT_PREPLLCK_DIV * IVT_SYCK_DIV * IVT_PXCK_DIV)
+	 */
+	pixel_rate = (IMX471_EXT_CLK * IMX471_PLL_VT_MPY * 4) /
+		     (IMX471_PREPLLCK_VT_DIV * IMX471_VTSYCK_DIV *
+		      IMX471_VTPXCK_DIV);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
 			  V4L2_CID_PIXEL_RATE, pixel_rate,
-- 
2.55.0

