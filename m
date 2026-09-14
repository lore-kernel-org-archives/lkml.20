Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE35D3A1A27;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413685; cv=none; b=BSnsBweSXTRdEPimaaOGiDwFgmkVX92RAHLF4GYA0ZYkfPKscnVRO4WAumNkPDaCKp0r68RxzMcyPaLf/tgM7WYtch7FJgfzaMEb3KNDR3cotCsfhXipxaA3WvlZuzbQqhmTgUbvxEbKNvkinOOGioW9crORmXKX0fox2CPagnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413685; c=relaxed/simple;
	bh=X7NyouCN65aYsOl9IfYiR8GqzCJ8zRJcFc2sniRidO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPycTl3oF0U78T179gEBlVQ+YV8TmjElgI1ifqNXTfv85+0butCujgRBSq+U8obUIzN4+gM3Pr91iOh7BYR7yya7KFzL9+0f1HbkjtZwf2zR09wUBGn5LF2iC2PuwCw605cwTswPuxabQwbjIY21p8FmpWQe986QZTHiVCpO3hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xXbAOHN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xXbAOHN1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AEF6C2BCF6;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1789413685; bh=X7NyouCN65aYsOl9IfYiR8GqzCJ8zRJcFc2sniRidO0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=xXbAOHN1D3/LzC9nUQrwejxIx7mFJM2gBonZmDHyBt+oZCC69ZbfuQFWWSYrZqqJB
	 BU5ANFgFfMv+s0W1cMM3r6gd6IROCAaJSi1jxAhlO4uqudmZbkpQjqWhjVizBFGvmJ
	 BI0+4jpnq0G0Ev2gH6mzePeUc6OuYMR91yLSxK3s=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4822CC88E6F;
	Mon, 14 Sep 2026 19:21:25 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 14 Sep 2026 21:20:58 +0200
Subject: [PATCH 01/10] media: i2c: ov9282: handle error from exposure range
 update
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ov9282-fixes-v1-1-f520af59df1b@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789413683; l=890;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=X7NyouCN65aYsOl9IfYiR8GqzCJ8zRJcFc2sniRidO0=;
 b=be6Yyk92In/WjPDuMyVaHDaTgkqGHKD3BJ8x/b7FFhUYG5RaY3+gWUmDa+snrnztju5IRIiu2
 c/2OvPRkCFfBHtbvp/8dDlU8/jTDMDPrxy4wv8EkJLYgeRhdIEPvYAW
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

When setting V4L2_CID_VBLANK the V4L2 range for the exposure control is
updated v4l2_ctrl_modify_range(). This range update missed a return value
check, which resulted in ov9282_set_ctrl() not returning on an error from
that function call.

Fix this by checking the return value and returning it on error.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 5d301660a87d8..c10b2e205834e 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -608,6 +608,8 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 					       ov9282->cur_mode->height -
 					       OV9282_EXPOSURE_OFFSET,
 					       1, OV9282_EXPOSURE_DEFAULT);
+		if (ret)
+			return ret;
 		break;
 	}
 

-- 
2.53.0


