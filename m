Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1872D41440A;
	Wed, 30 Sep 2026 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750571; cv=none; b=YavblKVC8pg5FoQvW4LjP2KKWrSmh8phwHnpZjhEJwQGuGbHK9t1mNL24rG5nsPZpO2L4Cb09zkP7O8MUDWlziTozI5UNvbvgbD5fAJy7awC7gcJ6NzC4yLKLCFoBR1cyY2w4+cgahDJj8Rkw6akazx4l8BRfTPzCVZHN2ZRF+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750571; c=relaxed/simple;
	bh=zy8WcgNDxPORMC5xYJLLaE5AV77rBHPhlyArhIjTUjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tpki3c3y5cvWjt7n5Afm34KIue8GgtJ6g+r6vn+ko5Er6vlUHpYrx5euqopJAA28kNIlAIoCbXf/lPriuMgGixXE30mr0nkgjrMzSrVV56gw+IZ0TE4PdUfjT0JS5vP+2HvUwU9yzEPA60A6R2BxcYPLNXsaxXFfjKMV8/NcnrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOCOq+TY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOCOq+TY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E14E9C4AF64;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750571;
	bh=zy8WcgNDxPORMC5xYJLLaE5AV77rBHPhlyArhIjTUjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TOCOq+TYfA+6Ln8OhfjJ3Vjd0/oZeBDsaM2rb42CUoCVlweginGb5enaCs0MdfVCJ
	 rwKlIwvPeNrK3N+k5VhTQzfgkzvIkUTYHj3GPW6bM9begy53MaoyryLo5U4aaTY/Yn
	 o/3VaYmYKPXLBO1/sib0rFSrynFaRy55tXtrla4jdGGBcAO7ZaN3ZJuUyYbCHmy3et
	 tchr9KeWcL+lZQ1qeL9j5y6QS5F2v++Mma8LLFkZ4YGWk5FgpVxmwrQcCXzWHrA/rj
	 gyGLPTD/bVIyWT5y5stIwJjC60GiZa1LAh8tyZKZifvUXb1k940g3PihsN7O8b1o3e
	 sWZntAxVrdSzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33B5CA5FB5;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:34 +0800
Subject: [PATCH v2 16/21] media: i2c: it6625: drop the private CSI-format
 name table
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-16-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=2207;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=wCpy/UplelcFSxnwqg95Ja5ADbd8Nx3nmIgWYK2WAOg=;
 b=KRWq9lHLgL98Dn6Yq+yck1Q2RTntOj+L/nyWuJh0q7GEOKFUC/VLvTrqnJkSsYrIswG8Zi/LF
 dE7rOHskoCTC5mZowGrpZmYYjx358cL7JYrUYQ7+QJQUZ6uUXLSqlHI
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

it6625_csi_format_name(), used only by it6625_log_status(), maintains
a driver-local name table for a value V4L2 already exposes as a
media-bus format code. No in-kernel helper converts MEDIA_BUS_FMT_*
codes to printable names, so report the raw media-bus code as %#x
instead. it6625_log_status() now snapshots it6625->mbus_fmt_code
(the value actually used elsewhere as the driver's representation of
the current format) under it6625_lock instead of the separate
csi_format field.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index c972a74dd5d63655d531579cfd4e8dc3f72cb7ae..7637418c5a214d32f75d197a1e0ba1bffe7235f9 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -1366,26 +1366,12 @@ static void it6625_polling_work(struct work_struct *work)
 	it6625_interrupt_handler(it6625);
 }
 
-static const char *it6625_csi_format_name(u8 csi_format)
-{
-	switch (csi_format) {
-	case CSI_YUV422_8b:
-		return "YUV422 8bit";
-	case CSI_RGB888:
-		return "RGB888 8bit";
-	case CSI_YUV444_8b:
-		return "YUV444 8bit";
-	default:
-		return "unknown";
-	}
-}
-
 static int it6625_log_status(struct v4l2_subdev *sd)
 {
 	struct it6625 *it6625 = sd_to_6625(sd);
 	struct v4l2_dv_timings timings, configured_timings;
 	struct v4l2_bt_timings bt;
-	u8 csi_format;
+	u32 mbus_fmt_code;
 
 	if (it6625_get_detected_timings(it6625, &timings))
 		v4l2_info(sd, "No video detected");
@@ -1399,13 +1385,11 @@ static int it6625_log_status(struct v4l2_subdev *sd)
 
 	/* snapshot together so the reported pair was actually configured together */
 	scoped_guard(mutex, &it6625->it6625_lock) {
-		csi_format = it6625->csi_format;
+		mbus_fmt_code = it6625->mbus_fmt_code;
 		bt = it6625->timings.bt;
 	}
 
-	v4l2_info(sd, "CSI format: %s @ %uHz",
-		  it6625_csi_format_name(csi_format),
-		  fps_from_bt_timings(&bt));
+	v4l2_info(sd, "CSI format: %#x @ %uHz", mbus_fmt_code, fps_from_bt_timings(&bt));
 
 	it6625_show_avi_infoframe(it6625);
 

-- 
2.34.1


