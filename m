Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559B34DAFB3;
	Fri, 16 Oct 2026 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162573; cv=none; b=byAOyvVl8nrKr8p4otLqnXPXHbhbcO9e2f/VcHCkBosp5+Q98gA0SnaobotLzSgJoVubSo8g0ZgIxc+TIrML5GHeQuj0WPb8WRBpHqRlyEA3eqaZdgtWg44hvH5fwfSFf94MuqNLrJokjGEOx71pPwTgJ9AdhpJcLAZz1aCDGEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162573; c=relaxed/simple;
	bh=v0VrKMVD9fdxJiPOnY6hqXtSLPjhyVJ/XO5t9vz1WBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GLqRxs8ZABrbHgTX5xVxb10Vf51/NfM7bxPC/esn2N8I8Sb38OmJ2WX+3XAq+rGJa8pfr2qB3ErHLHIZqhn7PpZYX4uOjgn/aKRbh9TM6MfX2yhsWwZEpIZtKwB3CfEPHWUyx5LwAnjhRU3rWqATewzpbxVdBXtoJiYNVFZ5dQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUlmK3Wb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUlmK3Wb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCC46C2BCF4;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792162572;
	bh=v0VrKMVD9fdxJiPOnY6hqXtSLPjhyVJ/XO5t9vz1WBc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SUlmK3WbfMdCWw4Pmg+0VYWQCpCPq8g35A07GqlY938phGVVN5RYIxQZ94Bn+Du0u
	 tknTOtZylgCZ7MwVFBlbDkrzHo09+S2B6brYtWZ4WSl0/zsK7TcYzsVsiNk9mjweDN
	 Sqlq8FEeY4s9m4gkcfmeK8+aGhQ0giMQZlAOsd9CP3as1QIi5mH10IJ0Gq3kJzjgij
	 LvHnMernBUosqXffIkmmAn6uyoGLjLFPCPgGQUKFwcK3DIkE3c/3VVG6EmFqsP5kPO
	 i8vkDTj7WMaWL8y/aSnuiSqAR4r3spMmK6Bqoj2wieIjFgIXijQIesUcFzWN3xtKf/
	 PkgXWhXbS1xdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B577DCC6B38;
	Fri, 16 Oct 2026 14:56:12 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Fri, 16 Oct 2026 15:56:15 +0100
Subject: [PATCH v3 5/6] phy: qcom-mipi-csi2: Use fsleep() for init sequence
 delays
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-x1e-cphy-rfc-v3-5-40a346a72153@gmail.com>
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
In-Reply-To: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, 
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792162570; l=1325;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=9kgF6eCoWKoJtXzcHCM7JYWoQiK6MqWjKyWCuLZbYNo=;
 b=MJURgf8PcL2d1vyDxikxUMr1tK+dJRgdnoA1QAvGbpfjfoaSr74WoIqg0h+eUoZLDJNwlmfdv
 3WkbvGu0E2dAeafzBDOHgziTqZnzU5jtj8You2l1rWxSqY7RvWnwhae
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

The init sequence delays are applied with udelay(), which busy-waits.
That is fine for the 1 us delays in the current D-PHY sequence, but the
X1E80100 C-PHY sequence added next waits about 3 ms after its reset
exit, and busy-waiting that long is wasteful. The sequence is written
from phy_power_on(), in process context, where sleeping is allowed; the
PHY reset just before it already uses usleep_range().

Switch to fsleep(). It still uses udelay() for delays of 10 us or less,
so the existing D-PHY sequence behaves as before.

Suggested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index a44e104301..84c45f67fd 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -264,7 +264,7 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
 		}
 		writel(val, csi2phy->base + r->reg_addr);
 		if (r->delay_us)
-			udelay(r->delay_us);
+			fsleep(r->delay_us);
 	}
 }
 

-- 
2.53.0


