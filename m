Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B984B4053;
	Fri, 18 Sep 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721841; cv=none; b=ngMQsWvb1YyNBDGBFjVVLFYs8MonMKqcd33a/VSy9vjIcdJkzlSZcCwV6bC0lZ+FGXI48DCqgT0bqlzQ2yRYfoeQVxHwe24Rd0b16XJokpxhlPGvUtQOEZAblb0u0b5dT39nLzf1r4T2UrATIltmzbdyeocgvBxWpRNIowThAH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721841; c=relaxed/simple;
	bh=1adET2WNpJ+rq+GkPFRn/9/C7ULGQjYJxl63G3P3Gaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Adm30WJFE0/zH7DRtHlBEHeezJfv/UBg19tGzvkQwn9rHLWg2Npb0YrL7IN+2KdFdJcBaf2Ge/iBbgyXreRwcrLhh1HXMLjOGr4zDgB4RflfTD5dst0pZOYyzfECx6Uzm+VybA+hg1abxvr4j5XmRPeC8/3M43GSWEUklVgr26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbSlPewY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbSlPewY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A82C9C2BCFB;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789721839;
	bh=1adET2WNpJ+rq+GkPFRn/9/C7ULGQjYJxl63G3P3Gaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UbSlPewYLBbH5B1+SUvdBRdxFZfgpUD71HViBNQqumBPhKocFcDHb4UuB785pMtED
	 a0RA6KeyuV+FrJQS/cM/PmbS7zeua2oSOazhpytxq0ZRNSEpCyRZEXn3fMjC2ov2U4
	 ao6ZIjQNm3aSrlOWxuGHSq0mjHqso37oJ+bJvD6Be4ePbcD4iqUoqQejSStAHyIDf3
	 2LkS1TyNn/PgwNxE0q/EOyFDlqfd4gJVHs298RGM/l9TGBtf+6JsuIJsibpTXxxqN6
	 zM5hOBLIgmqYgKXIdPjnD/W9HruyICWz9gVT4Fuuky5r3U4wmZILSNp/JKnQi0+EyB
	 yDjlK+w9BWa4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D8FC982D7;
	Fri, 18 Sep 2026 08:57:19 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 18 Sep 2026 16:57:19 +0800
Subject: [PATCH 04/21] media: i2c: it6625: drop unused bus field from
 struct it6625
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-upstream-it6625-follow-up-patch-v1-4-78d72d7886a5@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721837; l=822;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=O0b5O1RyDeNdNNk76taXPqiLok8wVKvLOP3Ji3Cxdyc=;
 b=EGOUNNXA+j2Zjowbr5YOg5d4qdmcLFrnEvC/b1AIpAh5KMffDz1tfdEryFqej662IUybmQpeX
 tTWE07/vFVbBYu8dNyNLpLbBn7rXjAgD50+xfHU1V1/D9D11fZllBL/
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
index 42bdcc3af326ceb6c529b8da35836c49c8c43643..e18baa6e1a1933f301d9d3057c2c08411f104077 100644
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


