Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0BE3955FB;
	Wed, 16 Sep 2026 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571397; cv=none; b=Oa6cKzXCM8oNMBZTri+xyNYMlBQCmn/ikNh0ZsGPLZKoniwV+cTKNofgQbEQY4tnjFQmPoGHCpIRQFb1n31m2LuqlkhTDmkjYAQJVxLA5fSQiCFTv6DVswmvvdufQsC1H7DfcuI/muPl3ayYLXm+YLTlMJTBA5yItiM4RIQa9Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571397; c=relaxed/simple;
	bh=6lYoDfIk4NpAcOB/cW6IiEbe+rssQS994U/XwaDkBi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePvdl9JqrPIL3goVaKnBRAf3FiiaLTtfomrSFMjPfqk9dQKWkzxby4G0pVUwc+DsJkRrrSjTo0POqCXziN4IjIOogOuHV+AYKAWVuqxdsyMsWj/UyE3SRICDvf6BUwjy41kREX91PamH+V0OKYjUmMEV5zRLfMFUSWo3LcDY0Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: ezequiel@vanguardiasur.com.ar
X-PTX-Original-Recipient: jacob-chen@iotwrt.com
X-PTX-Original-Recipient: mchehab@kernel.org
X-PTX-Original-Recipient: detlev.casanova@collabora.com
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: lgs201920130244@gmail.com
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: kernel@pengutronix.de
X-PTX-Original-Recipient: s.pueschel@pengutronix.de
X-PTX-Original-Recipient: m.tretter@pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CF4A32059FC;
	Wed, 16 Sep 2026 17:09:52 +0200 (CEST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1x6rGi-001Fsx-2K;
	Wed, 16 Sep 2026 17:09:52 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 16 Sep 2026 17:09:50 +0200
Subject: [PATCH v2 09/17] media: rockchip: rga: adjust get_version to
 return the version
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260916-spu-rga3multicore-v2-9-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Guangshuo Li <lgs201920130244@gmail.com>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2

Adjust get_version to return the version instead of directly updating it
in the rockchip_rga structure. This is done in preparation for a
multi-core support to check that cores with the same compatible share the
same version.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c  | 10 +++++++---
 drivers/media/platform/rockchip/rga/rga.c     |  2 +-
 drivers/media/platform/rockchip/rga/rga.h     |  2 +-
 drivers/media/platform/rockchip/rga/rga3-hw.c |  8 +++++---
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 4d7b0a03820a1..190104f3b2954 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -474,10 +474,14 @@ static bool rga_handle_irq(struct rockchip_rga *rga)
 	return intr & RGA_INT_COMMAND_FINISHED;
 }
 
-static void rga_get_version(struct rockchip_rga *rga)
+static struct rockchip_rga_version rga_get_version(struct rockchip_rga *rga)
 {
-	rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
-	rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
+	u32 version = rga_read(rga, RGA_VERSION_INFO);
+
+	return (struct rockchip_rga_version) {
+		.major = (version >> 24) & 0xFF,
+		.minor = (version >> 20) & 0x0F,
+	};
 }
 
 static struct rga_fmt formats[] = {
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index c24bc8e26b91e..2107d0f4a1659 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -860,7 +860,7 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto rel_m2m;
 
-	rga->hw->get_version(rga);
+	rga->version = rga->hw->get_version(rga);
 
 	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
 		  rga->version.major, rga->version.minor);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 0e62337f8dd38..0e854cdf739f4 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -158,7 +158,7 @@ struct rga_hw {
 	void (*start)(struct rockchip_rga *rga,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
 	bool (*handle_irq)(struct rockchip_rga *rga);
-	void (*get_version)(struct rockchip_rga *rga);
+	struct rockchip_rga_version (*get_version)(struct rockchip_rga *rga);
 	void *(*adjust_and_map_format)(struct rga_ctx *ctx,
 				       struct v4l2_pix_format_mplane *format,
 				       bool is_output);
diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/media/platform/rockchip/rga/rga3-hw.c
index 46ba6d270f232..a80dd7609ccfe 100644
--- a/drivers/media/platform/rockchip/rga/rga3-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
@@ -299,12 +299,14 @@ static bool rga3_handle_irq(struct rockchip_rga *rga)
 	return FIELD_GET(RGA3_INT_FRM_DONE, intr);
 }
 
-static void rga3_get_version(struct rockchip_rga *rga)
+static struct rockchip_rga_version rga3_get_version(struct rockchip_rga *rga)
 {
 	u32 version = rga_read(rga, RGA3_VERSION_NUM);
 
-	rga->version.major = FIELD_GET(RGA3_VERSION_NUM_MAJOR, version);
-	rga->version.minor = FIELD_GET(RGA3_VERSION_NUM_MINOR, version);
+	return (struct rockchip_rga_version) {
+		.major = FIELD_GET(RGA3_VERSION_NUM_MAJOR, version),
+		.minor = FIELD_GET(RGA3_VERSION_NUM_MINOR, version),
+	};
 }
 
 static struct rga3_fmt rga3_formats[] = {

-- 
2.55.0

