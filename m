Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0784738F64E;
	Tue,  8 Sep 2026 06:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849224; cv=none; b=A1JkqrB/7Fl0AwB7OnUPrNqdatzY51RVk2njGL7W4dHvpuRN8EOIEJ+QqfM1mF1OEYRy8tYppMFWgciWMyD3pO+Fo1h2MyladkCUQ++Uo8Wr20aCHIFrc8xaVAAk7oxyuGmzSjVptu+q3EeZkcapLVqSTRV/mdaKoIvlDp1kA8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849224; c=relaxed/simple;
	bh=/jVIAB1ZwOuEE2lnzrIH/2EVQW4YzOQKZhvoy1j+qpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9COE9xD3lZPIkoHZQOYM01kCb6Kg9BbYkitixYUYxlCewqvHjSsoInn0A+7kLL0vhAL3FPCQ5RFFfH5ZUbORvFx7u+SxVIlcy08ZS0fuHR9cmj4MHV1jOT6OjUraNlfaCUB7gFMv7Mbex7UCsrrXKbJfBgEt5COW6MSbilWc7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D9QXHmWu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D9QXHmWu"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02524EAA;
	Tue,  8 Sep 2026 08:32:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788849122;
	bh=/jVIAB1ZwOuEE2lnzrIH/2EVQW4YzOQKZhvoy1j+qpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D9QXHmWurTJmhd3RFO2kHte2ikMWdMl9Av/SoNXs4PlL3RLZqmOZTzMImEsC7lgRF
	 oFv+r0w9QEigxS4v0v29byZXPaQay1bIdIqk030G/mQsQ26sf+Oq8p+zEi4jMJJvig
	 9433fJLi9pvuBMwyT0dxnGX1B1JjCpEnJO8hC+Ec=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 08 Sep 2026 09:33:07 +0300
Subject: [PATCH v7 03/11] media: rcar-isp: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-rcar-streams-v7-3-c406a2c2930f@ideasonboard.com>
References: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
In-Reply-To: <20260908-rcar-streams-v7-0-c406a2c2930f@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3099;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=/jVIAB1ZwOuEE2lnzrIH/2EVQW4YzOQKZhvoy1j+qpA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqn6w7A037vP5BiKWa6iFylmWxNMszEHLdiYYiv
 yAB6WPPJrKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap+sOwAKCRD6PaqMvJYe
 9WCsD/9GDj+v6yLJfhZ67VwUsqWo9vfLAcP63ipCpd7gCPFOXEPwQGWNsSUh3WGUTYv5phOhAR8
 aCO9UEqkW4AbbudrJWwO7COcemi9Ka8VvDVw+QyuTA3rq8jJuRy88l04aTMjJSh9VR1IDS17unm
 6n4T8aZZArgB7PAE7ROlb9eEwoUcceOxDhi80PD8KgjSil1mzjXY8MpedIS7SQJR+QEE9EYq78g
 EpiGPInxuLNX0ImMYP+zwzzEUveA9nKiTXfHqjlTWRVKuY/rGvRK3y5ACqAJwqIEhGY8WVjjswU
 N4gPDSD0aA2dZ2MxQ8FMoBkIRoX7mPThoorRXHU4FNplFZV2gEVWfRbpmXpwwSjfEaBJpwxUKPx
 yutA7u3U+dgLIROcesPRiACr/l/pxXrNyRrz/MUK1SnygtEC+ThEr7btd0HVZbKVsHlyzrg+ILB
 2u920yDyBTi0nSvlmZ045pHvaQ3Mu4RgrCySJiMDY3gxAUv+2H2CPXub8eOaVDMuGAf8mHz2yAM
 ougLwrq8xPBErD5sh2qSCN+LY7EFtc7YtV68DMFPY0wTIEVaiSFEFob4Ieuavse0ERGu4mjiNRV
 u/kgxwLfxdmM3GkJmzqIJfwrSN0syQON5GKrA7BexOGvY0uRZcOmBzN9fA1l3ibYEF6LjrVyo7F
 vuwaU8s6v/qS0Ug==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With multiple streams the operation to enable the ISP hardware and to
call {enable|disable}_streams() on upstream subdev will need to be
handled separately.

Prepare for that by moving {enable|disable}_streams() calls out from
risp_start() and risp_stop().

On Gen4, a side effect of this change is that if the sink side devices
call .enable_streams() on rcar-isp multiple times, the second call will
fail. This is because we always use stream ID 0, so the second call
would attempt to enable the same stream again, leading to an error. In
other words, a normal single-stream setup continues to work, but trying
to use the current driver's custom VC based routing will fail.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 27 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 53ce47020d17..97ddae942fe3 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -268,18 +268,11 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	/* Start ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
 
-	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
-	if (ret)
-		risp_power_off(isp);
-
-	return ret;
+	return 0;
 }
 
 static void risp_stop(struct rcar_isp *isp)
 {
-	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
-
 	/* Stop ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
 
@@ -291,7 +284,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			       u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
-	int ret = 0;
+	int ret;
 
 	if (source_streams_mask != 1)
 		return -EINVAL;
@@ -305,9 +298,17 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		if (isp->stream_count == 0)
+			risp_stop(isp);
+		return ret;
+	}
+
 	isp->stream_count += 1;
 
-	return ret;
+	return 0;
 }
 
 static int risp_disable_streams(struct v4l2_subdev *sd,
@@ -315,6 +316,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	int ret;
 
 	if (source_streams_mask != 1)
 		return -EINVAL;
@@ -322,6 +324,11 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
+	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad,
+					  BIT_ULL(0));
+	if (ret)
+		return ret;
+
 	if (isp->stream_count == 1)
 		risp_stop(isp);
 

-- 
2.43.0

