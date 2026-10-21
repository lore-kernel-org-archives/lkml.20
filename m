Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605952;
	b=WWKCqhgZByvFFDNoB31jFCOx/kJX/1GCbB2jhkE6DsQUdlTQNJHecgmAZqHiW3+YEWOA
	 67mD6BsiQ/owahXOTDLw96qgAfYenOPc/5bVVm/DJYwHaBQq+1jDnMDeSyA2Y48XMLDt1
	 4mRzVgqYjuqJ/EMvZORhWAuz67GT7gDUVeZZS+1CTgM0CNqouPMZvV1ZGVhVJxlia6UQS
	 gH0upZnWcna/ok+VLTgiNgH9D8KKfQRKx5SJEoZiEdD5jDnOpHOXIuPF2R4qNQqVpXdDE
	 U5ql18dYUpJI9qEL7WIUGwCP4JL/F6IAWiZ1PUrFhW+mpu+Jh149HmYtyassFXgCu2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605952;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yq9LVAN5JxUV1XxpBBUTYSSSlaYw6zxP+Mv8Wu6YgDk=;
	b=i9Sk9sYd9Y5TL3mBdLTH7oLlYeSaZJJJUnZPeYTVYd9FlXPe2vlYBahDdGWx8mKhIWbI
	 p+1FmWwjsoaLINU2eHFXEGrG1mmrc1yebdka3TEqpYwGj8VnEjVtVjbra0RTMfw2bVQtS
	 iorKy3FOvDs5budj/b+GBgj+jQvcGGRoRKQPCHBdgizRQg4NdCgczA6LYClv8qFLz/aeX
	 xqOkZ13xxkSbajkS4O5i2j7/tGZmgSnhzQIGxvkehVSySSrdzWjjy9QacG9EKQlBjZ4wK
	 PjJxDpBTk0rzrBUhexlo9g+ITW/5G3TGsoOmo1pdOrq6soDVImcVAXPTzQ33nkrmkaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dH24piyD;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763FF606A321;
	Wed, 21 Oct 2026 18:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763FF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dH24piyD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605943;
	bh=NvsnwJPFAW5v0kVCPBz6237a7VHJ/RsQIoGbPMllOlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dH24piyDiAAm3TGtO4bOQXcA7c+LmoWVFx7TBMqDLwMdnB/Lc1UTCE/N1oBpvZnc0
	 vDDv1Xf+O3XKprAwBfdmTl/2lko65dXfjew0KV4gXcU8tl3tZZVwJAGvutjmV8FVrm
	 c53lyNwBg2PNTtSiQ81/HBwMTyQhjHUFiVKeUUIFG6USn123GAYcYDSXMRNJhF0vq+
	 cAbPB9cHuq0oMkVN/sEYSg6Bzx+gZUfybACowMnJGc3spNtAfS58mU2E1jRcbbyn5Q
	 a3JwyguGmAqrB4lF/PW6ykby2VVPu6DV6D2My6Id+Ss/8OldEyHypZqhB2yO4XWNOL
	 K+wE9sdNqZbMg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D49C17E05F1;
	Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 61F70480027; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:26 +0200
Subject: [PATCH v18 1/7] phy: rockchip: usbdp: Track PHY power state
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-1-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=NvsnwJPFAW5v0kVCPBz6237a7VHJ/RsQIoGbPMllOlA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vdY08luJUkIGee10Mu50u+NdhJaFusvP
 6auT8IGbtXxsYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qaykMQAKfAg0/BAbn4DP0dFWAjAc4cJ2c2PToW8+xKtdSX1GExIVfyWTctPVhWM4a3vjDXXBU
 DSTCmrrBlgeMSOdekQXDq5bMKnSWFOfYC+7qPe3atLoxnr1vvo82HJdQY8Ybsnkv6RrGqVdfu9Z
 gh0yYrZi1L3avy+mx57WHC0mjcFNR0P0Ufa7AyaVgWGiYvjIJFzpm0ClMkEe/62Q1lrUMqN63fP
 hQ4Azn46pKo8puwoEt4Yb/Heg4woJ2Bpbmc/PFmEDznksfSre/y9aCQ3nrFSGo6vcr+AlYnFLoF
 hXTBMbOmOUTbfhFimvvHFsZDErCgRQlKOACD64v7slzxm717u9Gv9wPRbVXt6ZUSZvdP3RFxl02
 LtYFzmHoMQXYvTHC+wuHS2MrnyjMZE9tV2Hp+4BCe9ele1NzhoxoDn9/H2XgS1gK6irRR275RIK
 SUGEilCnIkvUj7Q9uhL+cBvOd/RV1zDMsBINKOFYJCKYXg3CQ+/7pT45OAbqNqyxdN2sHNrPjYg
 spMQLdYdggKO9NKEkFXtYk8a6+zFKOUvnvSvIARFMJMuA3a2qH3i8zQOGBa2BMo8x7xXYJQPnrs
 ZcLPKX1YIDAVg79pmTtGy3H1Nr36YSFaFor6GPC5Wdvttt0lq1sxlC2nuEftLafDpyW4OzZ1iur
 xUXOUP3IwauUIZmK09ek1cg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Track PHY state requested by software for DP and USB3 individually
in preparation to rework and fix up power state handling.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e748acdd2d31..cb1f455accf8 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -175,6 +175,7 @@ struct rk_udphy {
 	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
+	u8 sw_mode; /* modes currently requested */
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
@@ -1051,11 +1052,15 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	int ret;
 
 	scoped_guard(mutex, &udphy->mutex) {
+		udphy->sw_mode |= UDPHY_MODE_DP;
+
 		phy_set_bus_width(phy, udphy->dp_lanes);
 
 		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
-		if (ret)
+		if (ret) {
+			udphy->sw_mode &= ~UDPHY_MODE_DP;
 			return ret;
+		}
 
 		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
@@ -1078,6 +1083,8 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode &= ~UDPHY_MODE_DP;
+
 	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 
@@ -1286,16 +1293,25 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode |= UDPHY_MODE_USB;
+
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	if (ret) {
+		udphy->sw_mode &= ~UDPHY_MODE_USB;
+		return ret;
+	}
+
+	return 0;
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1304,6 +1320,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode &= ~UDPHY_MODE_USB;
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;

-- 
2.53.0

