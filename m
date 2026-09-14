Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECC43A380C;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413685; cv=none; b=JwD8XuXDAPM62AICgzLzHG+V4SQnL+hPfLZYjuFGHVbDa/06mPlg08cdj35g+gdSCfPCGxquKX4pM2GJoZ2QcjdsD28OPorAMYS0uWjcNgZxxEG1IamCtFeLvlbrlTbF9/bPuz+R2l8h+bJuIDgjKMVqiVw9TUqsPKfdamtdmX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413685; c=relaxed/simple;
	bh=ER+zQkWzydHRzZp5pEY5WGaoGbUivQBZvblB/0wtPVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YyScnnxCRqKCsEIHhyinf11HF2g9c0D/FJgXTjzTHdCl95G8S14qeRs01yj4Z4jeOo+A+2HqG4vB7JOfUyg1PlcscHlImeU0V9JvLRuqE1z1jdhITTX2eZSQ9uHeYKnDyjjZRQ/FjtLFl0Q2FxIHS15mOOLxJhtXQgZ/MrkOimI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qPCdmJwA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qPCdmJwA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90737C2BD05;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789413685; bh=ER+zQkWzydHRzZp5pEY5WGaoGbUivQBZvblB/0wtPVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qPCdmJwAABpvamyyBgc7mlmppm55CF7lUXUVPxtNRWbg6lfMvpPySG9klzqRkenZ9
	 cgt9M6ofq5ZLblrQbgU+B8mN/AK1Aoc0OZgvnbmixErX8ipgigO/ZzVcl3QHNAXIk/
	 SQrAdPI8diCEjq1gXUTQ6DIdG8KgDnp0vfyxPHhs=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766CBC88E7F;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 14 Sep 2026 21:21:01 +0200
Subject: [PATCH 04/10] media: i2c: ov9282: update flash_duration range even
 when powered down
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ov9282-fixes-v1-4-f520af59df1b@linux.dev>
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Martina Krasteva <martinax.krasteva@intel.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789413683; l=1346;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=ER+zQkWzydHRzZp5pEY5WGaoGbUivQBZvblB/0wtPVM=;
 b=koYQdyi9oc7cfHz0ZeuMXhUNtWxeq6ydv4PIYUL370PQLk5MMIKA4vGyfMUg1op2icjHT+y8n
 mxHUVQxPG4NAKtt+GiUPTTb8SRUbtsIgr8DzalMWhI8RcIBXdTNcNZL
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

The flash_duration range update sat inside ov9282_update_exp_gain(), which
ov9282_set_ctrl() only reaches after the pm_runtime_get_if_in_use() early
return. So with the sensor idle the ceiling kept whatever value it had
when it last streamed. Therefore setting exposure before flash_duration
while the sensor is powered down may clamp flash_duration against an
outdated exposure.

Fix this by moving the range update before the power check.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 90a0fe542ce4a..4c88de1965171 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -645,6 +645,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		if (ret)
 			return ret;
 		break;
+	case V4L2_CID_EXPOSURE:
+		/*
+		 * Ensure the flash duration range is also updated on powered
+		 * down sensors.
+		 */
+		ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
+					       ov9282_exposure_to_us(ov9282,
+								     ctrl->val),
+					       1,
+					       OV9282_STROBE_FRAME_SPAN_DEFAULT);
+		if (ret)
+			return ret;
+		break;
 	}
 
 	/* Set controls only if sensor is in power on state */

-- 
2.53.0


