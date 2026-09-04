Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0C3612E2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508335; cv=none; b=uiV3/pSiY28Ay48t8nJOxyjHyPQ1or8+hGmHshAd5X884MmqC5dDCIIJHwDpGZYT9bmiSwpTa4EQ2eBA3jVwlp9yPF192mlR4nsSEHz8YreKldkKTlN9RwxOK6CCL4OlYR4Yu4EQW6qLcZ+iROS1NcIhVv6HivpunJYLCZUXMzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508335; c=relaxed/simple;
	bh=IiaOlIOx3X3W6DFnx1Teyhn32TkW+Oje3m5teqBJGiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NujFAhRjsU4NHLtLHobdNPx/ADnwqdtyRB51BqFiBfit12lwmDofyfL8dwhmjMf3x1aaFsq8eqRKnxhsIZYGWwbqF5fb+YU8YrDx6p4pFs3nyjgvXiZerDPqEKraFvHXsk5pxzD2SxJ/xO1sxqE7IebS1wupPua6Fzel0UyCuGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpanSPlV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpanSPlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788508332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kce8DglwAH31zHJL/kQHurhnPheFXUZ6gKNThVu2MfA=;
	b=MpanSPlV6ua6NGi5M91iu/kqjfatp5QY2FMI77hJraZaiGST9U6Rh50ErDBwevH3qYE16r
	PWGDkP3+fWTHZ2ynlwTgpmsjUaJ4A5N18G1axUu8fFrPOS28tPPlDCLvLrfNwzMTUPNFZW
	ML/h1xde+vsAw75E4sETYLnK9R5ABDI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-MGoWLxE2PFa_LpGguzij3g-1; Fri,
 04 Sep 2026 03:52:08 -0400
X-MC-Unique: MGoWLxE2PFa_LpGguzij3g-1
X-Mimecast-MFC-AGG-ID: MGoWLxE2PFa_LpGguzij3g_1788508326
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 90E07195DE67;
	Fri,  4 Sep 2026 07:52:06 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D3331800609;
	Fri,  4 Sep 2026 07:52:02 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 3/3] media: i2c: imx471: Calculate pixel rate based on external clock rate
Date: Fri,  4 Sep 2026 15:51:13 +0800
Message-ID: <20260904075113.125751-4-hpa@redhat.com>
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

The IMX471 sensor operates in PLL Dual Mode, so OP domain configurations
must be used to determine the pixel rate. Based on the IMX471 clock tree
topology, the pixel rate is calculated as:

(extclk * IOP_PLL_MPY * DDR_FACTOR) / (IOP_PREPLLCK_DIV * IOP_SYNCK_DIV * BPP)

With the register values, this yields a pixel rate of 159.36 MPix/s.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/imx471.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 316383076b3d..d81d64dd8761 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -701,8 +701,17 @@ static int imx471_init_controls(struct imx471 *sensor)
 					   0,
 					   link_freq_menu_items);
 
-	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);
+	/*
+	 * The sensor runs in the PLL DUAL mode so the configurations of the
+	 * OP domain are considered. According to the imx471 clock tree,
+	 * the pixel rate can be calculated as follows:
+	 * (exck_freq * IOP_PLL_MPY * DDR factor) /
+	 * (IOP_PREPLLCK_DIV * IOP_SYNCK_DIV * RAW10 bits) = 159.36 MPix/s
+	 */
+	pixel_rate = (IMX471_EXT_CLK * IMX471_PLL_OP_MPY * (u64)2) /
+		     (IMX471_PREPLLCK_OP_DIV * IMX471_OPSYCK_DIV * (u64)10);
+
+	dev_dbg(sensor->dev, "pixel_rate: %llu\n", pixel_rate);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,
 			  V4L2_CID_PIXEL_RATE, pixel_rate,
-- 
2.55.0

