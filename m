Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDE93DAAAF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484783; cv=none; b=N35t/QZMt+WIoQfO6din0Pfd2MeeV9QiisfJGdMnyOpruljMTwGqmWVxR/hRt5xMoQDtP9/ao6lIV2vcJzgC6TxbTDNoLrqkYELZj3gRFA/yRtHZiuX/dCQz2eA1H0bpAqCe8Lk8kFERPg3B3nDcm2dj3P+jBO/Lw/w5OvTjIUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484783; c=relaxed/simple;
	bh=ORTgeXoBWHzhph1db5nH3ROLXbfd5UE84Yvg8siOcNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LfwqrC3t6aGNdw9X11FqICYtKtp9Q6Kr8Deb9h5fGjn0cHYI6jVdn7sKiQQd+uRLW4hzD4ghYg7rgBa+ZIM1J3t5DtIb9Y3HXe4SoQaNNJ1rdgu3IX8dUWxSk7GWXLmhoi9/L+V7aU1Zvc7j8LlLk/OAsMekBR6fyUMAJmqcEAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VZbpz08/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VZbpz08/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484778;
	bh=ORTgeXoBWHzhph1db5nH3ROLXbfd5UE84Yvg8siOcNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZbpz08/GTHJOTDuae6L1HH4jzDWq4Jj0uF0HEt0TRnI5m9k95yAnqyXddXsrASC/
	 5yLENW2jbDN6Hd46JbA7cNxn5pabLEhexpbBJ61Dyj+MoqegCyqph4ZSI8qMbxuVwW
	 yceQO3s+43k1YPtVH0W/v5q78mOeF4Gll9xnGjdSROkCNjZ3WmYl4QhLglzwaBFJ8H
	 X7H2ttQ1FGrygms5luyj7G9b6RTwg0NXuq8jwc2mzFcrynQA36DkhZr50pH/m/VXpY
	 mGzqYUVhlX2LgDqHsKfmpXHaGi1oKU01RHfUdqx4OXAYgaajP2moW6llfozn/TlvD4
	 LJAPVUUqUldbw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C26817E015A;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 622DA480030; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:06 +0200
Subject: [PATCH v15 03/11] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-3-8d507cb1174f@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ORTgeXoBWHzhph1db5nH3ROLXbfd5UE84Yvg8siOcNc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXuqvJxfb6SjKucFa5VdpqsNmkVhLhP8fG
 UXucuxt7FkaRYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qa9HwP/2cU48QE1osoI9QFtS6x+MpynnM2oZW33/E0WStGxTuofP+w3S3EOwKzEEevJVq9r8O
 0XvzFn/jT5Ovkvz+xKgRrmxpzJtwe9iA5tpIJsut9t/1Es8dpC8EBNOSGwzbkg9841NpYEtoDR+
 rAlZWnbp0oYchd1/58Bf2uVoaKXc19P7LBKvxYvIxEHW/umRx7xaPEjLPpt7F5/qocaAfZljazt
 j2KxWKG1D03cDYKijbmqY4+XL5oLBZNje2oKyDiu/+fIKKjv4BXqgxNpv9fgXgSdBm4PhfddOXC
 4AvVyFIf8T5BvMBN/c5XTvaJ0bOiazhzBl1YuSTtskz0zfDkU9Ebz9Cw5wcGP10J8QUnG8qJj38
 Mh+6EzipsJXhxTpP78gm1DxvmSbnR0TQoGsq5UrLAQTSqWNGJDT33yh0OYCGYIIiAxUqyoIr8NV
 rtYdkyKCLlW8cGtVCLwkvIxs9NvWopOn13usow8WvbJZ//E7qv41Yl+OFLPWPr8hawnmpxrB/39
 fm4tSqLCK/hofRBOHl8EWzg+ho199M20pfLkDyLULrTWpg3+y/XZDX/sBGY8X8SiyW5XccRny95
 KuB7bYg7tSl2/jAklL42I07rM1DGTYrCuJxNTQb4QlRBOKr3GVms8CPBkneIxUU6oNmxWtPRJMz
 b/414njHDrwxxv0oD1pI6LA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9767fba23660..9a4ead585151 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -619,6 +619,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -630,7 +631,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0

