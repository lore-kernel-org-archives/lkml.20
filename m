Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581B3A783F;
	Mon, 14 Sep 2026 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413686; cv=none; b=J1WDwYy/Lc/noHkjRI31nwmSSvkJNs9ajIhNUGvgSJWnGszcmf/bwC0ncvN0ssDlBOZyQ6pKTzW264YJIKmhYYJHiJgeAz8YtHzhtrGCUeZWsJXHdEoxLb1Z90KR2IGOFwj6FCj3cs2nmsMqSNAH1RMviuhfIp1Z00p5yDU4zbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413686; c=relaxed/simple;
	bh=+9D94c2OnHxByotyk71RiVy678NF0Rq9EnxYDsY4DUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTnNNZehlON6suUOENN1Ss4PkR2Ekecg8yWDuEyZjCViNlRBdftZ1g+/bppKs1qJb2tnUyxG5rEKFLEwRG0W4FpIOrEGQtsLHovflx+89fbUxJpOo1mVX52CBsK/6xrpeUJDIkCjSMsH+BhMismDD0LO/VARhJ2LjEY7Wi/P6Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=egQwLWZy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="egQwLWZy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAE21C4AF0F;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789413685; bh=+9D94c2OnHxByotyk71RiVy678NF0Rq9EnxYDsY4DUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=egQwLWZyMglPRGyBR5h2X6MLH5aZJuxNppHtk1+BChHeKsnIu5Fgl5sDZVEBLEqVj
	 94LxkSqW/zmDQ/MdQ6hT0yFv18u1a3efzG6aB72CCGhA6+9HSRctKjyoYbRcu4cC03
	 TOitxpbBUCa2l2ZRteqLRiNPOgNPExlBbjL+2MA8=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B6EC88E73;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 14 Sep 2026 21:21:03 +0200
Subject: [PATCH 06/10] media: i2c: ov9282: refresh flash_duration range on
 an HBLANK write
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ov9282-fixes-v1-6-f520af59df1b@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789413683; l=1339;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=+9D94c2OnHxByotyk71RiVy678NF0Rq9EnxYDsY4DUE=;
 b=JZMY05pUX3MajCM1j9FFQ79UlIRT5svduZfkVMrNnEvqzNZy238MT6AzNBwL5QWAcgg8uqnnD
 RdSoL8Wu9EbDPb1Zb5bsQDN35moVeepLsqT9UU2PfDf0LSwndBOWPHK
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

The strobe ceiling is the exposure time in microseconds, so it follows
the line time, and the line length sets the line time. Writing HBLANK moves
it and nothing recomputes the flash_duration ceiling.

Therefore add the missing flash_duration range update when HBLANK is set.

The exposure range is counted in lines, so it is unaffected and does not
need refreshing here.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index e64d8343c18e9..632184e76b9bd 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -674,6 +674,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		if (ret)
 			return ret;
 		break;
+	case V4L2_CID_HBLANK:
+		/*
+		 * HBLANK affects the line time, which then affects the flash
+		 * duration. Therefore recalculate the flash duration range
+		 * here.
+		 */
+		exposure = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
+		ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
+					       exposure, 1,
+					       OV9282_STROBE_FRAME_SPAN_DEFAULT);
+		if (ret)
+			return ret;
+		break;
 	}
 
 	/* Set controls only if sensor is in power on state */

-- 
2.53.0


