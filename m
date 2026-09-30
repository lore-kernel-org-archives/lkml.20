Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C993F44C9;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=EnsThVHVoiH+5g154K719vcaFxVy9FNWnXXRiKSPXlNDwhJwgXqQK4r+ZJ2dkPkLZ3iA1Fd386qD1kl4XAOYASmVtgkL/0cATqnkkYOkhctA50DP8G9PigUHaEff7TR7DmvUvZpnrWz8XkcjoJA5IRxtOSCjMiqU6KG6Vr91kbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=qqBc5eXs9JcVBir3iJDtFfbZkzcUTtSm00qiggjsgEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oh7F99XAx8ejxQFupUulqn7DDVNRR3/oHrqnS6urFguMD7tHAnkVa6IEjOtTX2zkxfHk4RV55FpLajCJRReqam6HW5L8rucM1L2I/QCQlWmzBS8Kveoec6I38jnSpkSgljAFemZI2dTFDK/JOw7t1jsfhgtVAIUJ4Zi3NlEAG4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iqgwb7hP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iqgwb7hP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14776C4AF1B;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=qqBc5eXs9JcVBir3iJDtFfbZkzcUTtSm00qiggjsgEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Iqgwb7hPQkfHdfvRNmD9HVy/dFV18MmQFnG/QL743UK7VVw0/L9sz5/VSLWitJX8I
	 qmYH3EMq/MVfliKUpC6HHRtfw04n3M3Ep1m7Y4sZSphj+yebdmjoL/K2wxjXOLryWA
	 Unbv2JLvLt8NLIqehvfeIbi1Dxu5Hr1vmLxjdjmY2glBQ0CbALbA7TWAVZDoyLNAuW
	 QEQE31NgXN/raqzWUbQYO/+Zvt2lJeUfk/zDsJtv7cgX2tvciTYs6B+0XWEB7m38qf
	 h6R126ytw5wMnkMRwIgtOL3/9e9ZaXefqv0YUd/gzEjCKv3ibV6wPV56BDCNtEAIxf
	 kFnNiwS5vu6Yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C1FCA5FBD;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:22 +0800
Subject: [PATCH v2 04/21] media: i2c: it6625: drop unused bus field from
 struct it6625
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-4-e353f887e7fa@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=822;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=k9VvBoEJz+7QdNYx+hA2cckZ/HnZLYyg1rBLK+vgdfw=;
 b=wgLsMrnlSl+sYJw4cmLITLHha8AGuLbpeQRc7YMd9NoYfBF424NF1JC79opzpp+uEWvhVzd6w
 LAq5K16QzolB89y9y0/oD1+Pl0xs97goYqjgNsEBNPuSId9M8xigM+d
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

struct it6625::bus has no reader anywhere in the driver -- the mipi_csi2
configuration is produced fresh in it6625_get_mbus_config() and parsed
locally in it6625_parse_endpoint(), neither of which touches this field.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 7cc2ba0d26b8dbc439807e350434137f102d9d9f..b09b331b20364a8e169429bb309d1112ec83d919 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -268,7 +268,6 @@ struct it6625 {
 	struct mutex if_state_lock;
 
 	struct v4l2_subdev sd;
-	struct v4l2_mbus_config_mipi_csi2 bus;
 	struct video_device *vdev;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler hdl;

-- 
2.34.1


