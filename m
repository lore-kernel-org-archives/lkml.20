Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C5149B446;
	Fri,  9 Oct 2026 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541710; cv=none; b=KNDD4K2E0xdvnVMgyL91BbeO/2Sj1HSSBquZE9ihc/XdFPkFrZkxgi6VQZI4RAv4B1UcvJa3s7SOmKlVJzM4JRRfo7SDQTeexpvUXfgb7LdH5Rq4Z3XiZ5ixtSDnk2D6oRrxxPgPOwfccF+cxTbZ4u+6bsM5cQAFmqNR4eCVxa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541710; c=relaxed/simple;
	bh=s5o8hjnMeqhFQOvtWpc3KUG8e/sBVlSSnhzX3QmrNNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dZH+YywYZB8AX3rKnFVxlOheSEw3AP+sZmKDr6C/uiEeZZmb24h7Oqk6bUyp1+YZF1xRsxsLj0RpInUJ4GUmxQNEAT2kBUN0m7NsRs5w8wvzMx4S9eLrE8wO0EFXLLxXg9j3nWxWWafVnvCzqdQWcqhovSTTA1XkuGOrn6nWw5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Ow110x60; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Ow110x60"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XnsR0KETvrIrxr8TgcJoYUlVXVij5jqGsWpWykcaXPA=; b=Ow110x60qiVKzU4QFvQQ7zZZMP
	21ySDo5I/3Vfo5Rx4eCcOK+KzAOgMdNVzWXsNsPxFWEy6mnkrs9GtBDFy0X27Cyuzo4MnesVbTveJ
	tcV3u1ntsINCEdBLjDrXANGUqK6B54aFY3S4XKnASwzB+ioeiJvjnq4rgewdnfoHBVR4NJ2K+Hv7O
	JqeHi1Ioy2rbgUpw0I/bXxoWtA6tvRtcOeqi8En1Liedz4+hB/bS33NHACYK6DQlhEqwtO3230kfB
	JHwytneVehJRXwMmKihRiyc6mfGZ0Ig3kkPAybMuXK/ztMAyPMxs+XNIrSiEKXbffT8KTdX599ZQU
	kn61WS7g==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:58316 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xF7pu-0000000BsVC-2DZG;
	Fri, 09 Oct 2026 12:28:18 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 3/3] media: mt9v032: Add get_mbus_config subdev_pad_ops callback
Date: Fri,  9 Oct 2026 12:28:17 +0200
Message-Id: <20261009102817.2421388-4-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009102817.2421388-1-primoz.fiser@norik.com>
References: <20261009102817.2421388-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Stefan Riedmüller <s.riedmueller@phytec.de>

Some drivers like the i.MX6 IPU driver require the get_mbus_config
callback to be implemented, thus implement it.

Signed-off-by: Stefan Riedmüller <s.riedmueller@phytec.de>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/media/i2c/mt9v032.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index d8e34e128d77..7cf0421355b5 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -1003,6 +1003,25 @@ static int mt9v032_close(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 	return mt9v032_set_power(subdev, 0);
 }
 
+static int mt9v032_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
+				   struct v4l2_mbus_config *cfg)
+{
+	struct mt9v032 *mt9v032 = to_mt9v032(sd);
+
+	cfg->type = V4L2_MBUS_PARALLEL;
+
+	cfg->bus.parallel.flags = V4L2_MBUS_MASTER |
+				  V4L2_MBUS_HSYNC_ACTIVE_HIGH |
+				  V4L2_MBUS_VSYNC_ACTIVE_HIGH |
+				  V4L2_MBUS_DATA_ACTIVE_HIGH;
+
+	cfg->bus.parallel.flags |= mt9v032->pdata.clk_pol ?
+				   V4L2_MBUS_PCLK_SAMPLE_RISING :
+				   V4L2_MBUS_PCLK_SAMPLE_FALLING;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_core_ops mt9v032_subdev_core_ops = {
 	.s_power	= mt9v032_set_power,
 };
@@ -1018,6 +1037,7 @@ static const struct v4l2_subdev_pad_ops mt9v032_subdev_pad_ops = {
 	.set_fmt = mt9v032_set_format,
 	.get_selection = mt9v032_get_selection,
 	.set_selection = mt9v032_set_selection,
+	.get_mbus_config = mt9v032_get_mbus_config,
 };
 
 static const struct v4l2_subdev_ops mt9v032_subdev_ops = {
-- 
2.34.1

