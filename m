Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645240;
	b=X8V4GSqYy7dWbtJDlJzPByM2vH/OaunW3byi6l4THtRfGSMej+wmB/1FtpkvuXtqCa98
	 VI+3zhT1TzrdWQo0UKTgRRa3WthhCXs48znvayGrvRaOZQyVKJ7nKY0+9rV8X98TQZEVm
	 YFNTLKehKLDzmhFE1IZIkcewz9Sq243SPsgnZ0hd8yBLBJ2HKBytRAZDrpTZRMuV4SVze
	 6t6Fmqxs9CD/Hqkwv2EJrIbi9DUq8DXhxsF3oLEqIl1/MUXAORHynveE6NNBE3vHrS6ua
	 3HBV4yt9F+1ZTxPAtQxL/XD+xsKzPJPIdkW0ZftLewsH9PWHXStqk6pK31tgehf65xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645240;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=PWh9Kr0XFJPQCqbWVOwCtKI5Lauc8b6aI2PRFLhyIx8=;
	b=IdQpN1gakyLm9EN0Y1NDaB/zhFDW4c9USR9ydMF5vLxYRDuaAAWGDCTJ200ESuqSGG2h
	 C1FVjw1BiF7xozG39AiRrQVAD07VU9hO8A4mIJBV0XQqZoVeR6TCr1higS4OedmW5SJu9
	 q1pZ9rC6dR5lqO0wZWZy43NBYNXBwfyEYIplPjtPXeJiXFTF8bTXgh6wvJKBbl6gf1uPv
	 RdEGjQa/9NEXqXMSfI2KLk/hRLoFtDSO7dvaC1NLIcrLBTRxBcICllJd369KEesRwJrS6
	 JwTs6ef4kHN17tpEbOJusysAi4YZc7xPHvN6hePU/0xsB1jEC7NYhB/bYSyGNN7uwgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PnSAMjBp;
	arc=none smtp.remote-ip=156.224.81.116
Received: from mail-m81116.xmail.ntesmail.com (mail-m81116.xmail.ntesmail.com [156.224.81.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F373A606A893;
	Sat, 14 Nov 2026 08:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F373A606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PnSAMjBp
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54aa8868b;
	Sat, 14 Nov 2026 16:33:49 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 4/4] MAINTAINERS: Add entry for Rockchip eDP phy
Date: Sat, 14 Nov 2026 16:33:39 +0800
Message-Id: <20261114083339.600986-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261114083339.600986-1-damon.ding@rock-chips.com>
References: <20261114083339.600986-1-damon.ding@rock-chips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d930ff2603a8kunmf52e9804102266
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh5MVksaTUNOSEJJTUxDHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PnSAMjBpUSh/RdCNFtNWPMPcKjFnQug4jv28YwHMo/UnlDHGhfSE0L/a39lSuzM5OxsDWBM5YQsIwMf0FS9ukpw5Aw/5cQlTyjeRojQoCyNUl7MKBhsEELDwDYOZAh9JxHF2CnZ54z1VhABnot0ny3/FQ83LNxaJnCALp21EwMk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=PWh9Kr0XFJPQCqbWVOwCtKI5Lauc8b6aI2PRFLhyIx8=;
	h=date:mime-version:subject:message-id:from;

Add a MAINTAINERS entry for the Rockchip eDP Transmitter PHY driver,
covering "rockchip,rk3568-edp-phy" and "rockchip,rk3568-edp-phy-grf"
DT binding schemas and the PHY driver file.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c4f4e48774d0..824f1b8d9c3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24375,6 +24375,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/rockchip,rk3288-crypto.yaml
 F:	drivers/crypto/rockchip/
 
+ROCKCHIP EDP TRANSMITTER PHY DRIVER
+M:	Damon Ding <damon.ding@rock-chips.com>
+M:	Heiko Stuebner <heiko@sntech.de>
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
+F:	Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml
+F:	drivers/phy/rockchip/phy-rockchip-naneng-edp.c
+
 ROCKCHIP I2S TDM DRIVER
 M:	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
 L:	linux-rockchip@lists.infradead.org
-- 
2.34.1

