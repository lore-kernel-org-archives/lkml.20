Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3014BFE6F;
	Fri, 18 Sep 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721842; cv=none; b=iZ8esXSA1lDfoFEchy/eng3PV8IQ4KLOYSKg/WSZeKR/lON/IYBMwVFZqjSq2DRHcIw+sYSV+eF/m/aN3ubexxi4Dkkc/SiSHyVzAyibNiS4+jefCgK9utAiMbPIJ0i+nzLqaZXtU6URZ3G91mpfMMQnpCH4nlsULjL+jnRcki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721842; c=relaxed/simple;
	bh=s/ykreRJ0uCDvoPYZfLjy6AF1TwDdHCJ9gJuzoAi3o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvpabsZaVKX10VpwgAAkU5GwgSN8G0a5CMosdNn8jE9/R6VCSJOx+FJEGTHsPX/pCD0qBL2l/AaTwBiiubLp7Om6TpCI+bfawG6+FUr4YxW/mQA0ywnLjlWCDW4cDrz28El1rVy5geDsp9MuUXQfEeeAa6dvWx3TrMSaKfzTV9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+hQyT1t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+hQyT1t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C158CC4AF10;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721840;
	bh=s/ykreRJ0uCDvoPYZfLjy6AF1TwDdHCJ9gJuzoAi3o0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o+hQyT1tEVFwSwwljIVdvkWy51GiUfAozhQ9ZYe7yGheduoIZJQjlx9Uw2pRGnZfW
	 aIbeSFG++M6c7bE6pU2osHkX3vqjBvNCT10+KgIK/vRNJGxzFKYVUVf7l3FuDCXlvX
	 qPUJbC2LJhsZlFNHm6QUB0jKBeyHN8feCNiiYoh4dprei/OpRCPdHT+hSKPcb6aUcu
	 13PUNZqdueFov7n1wYQuKlwdpzCihA/Sszj4cLBQVFw018s5i2E25F6YlsEnYuggXe
	 FwsiN9c1rhzNxUuK+gaOoNJzWcusQWuYcKF9Y23HbYje3M5/MXjwShV7tmDOT0fSYf
	 UCWVX1Plx7E3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BCEC982D7;
	Fri, 18 Sep 2026 08:57:20 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:31 +0800
Subject: [PATCH 16/21] media: i2c: it6625: drop the private CSI-format name
 table
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-16-78d72d7886a5@ite.com.tw>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=2207;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=1QBeLpweBexpuPT55/o9kOEnsNm6TzwXFO32asay3lk=;
 b=BKX++v2fjL4HLNPNzaWHrzbk5oo/WTl17NO45uq5t0yu3DmyL11IHTPGWrTYGcy0nnlCaOuJl
 0huuaU3kuRmBx9yBQ5154lC6VyHEqIauCgHZbk1pTbtmATRwuKvanXz
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
index db962bc100cad9f4d71fa4156b10ff5b4c952a7c..4a54de2eb42bba7a6efc84c0b43cad4d2465d3a7 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -1343,26 +1343,12 @@ static void it6625_polling_work(struct work_struct *work)
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
@@ -1376,13 +1362,11 @@ static int it6625_log_status(struct v4l2_subdev *sd)
 
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


