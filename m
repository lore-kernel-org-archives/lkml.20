Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833687;
	b=1QwKFZQ/uMrAp5ySn0TcIlolgny5L8FzoSEYe8+YfxNKcqWqVQU6T85XV9378ILBTzUz
	 FggtkDTmp+yd9bpXfHgRtM/NXB9rYcp5EpLBHKN+7q1IeXDxj+PpSPTU7WYhbmG620Pp1
	 aBTR3JtLEI4Nv1bHgNiCdzyts2ObyAQI6XNMfyC25LJtNJ0KYuWptbe1++rmiQgnXBo06
	 KmzGo8nFVovG8ZlLJyqmGRW7nuXRnC3l+qAt8vQ/wqWGWuwWVG4tfipXVeoqsszXNBEoL
	 oro19nt/eb5rgnc8i24q/fu39qZFO0Wx4NpuHBEAkJArl+ik6NPOKtZ9yY4WD0ab5vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833687;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OoF3aRNGJqqbd2oRzv6Oip0g+e/zxx4qNWAnUfl9xiY=;
	b=crffAeUJO3MTIBM6b0Pu2AS5SL9OzVrKHgcM/Y38sz/SFFkUVs1LL7GRtNjCxcCLVMEy
	 E2h0ReGC9Imlhr78qJSb43TyT29qZ60UqqEhUT+JsGuR/+o9F0c5dAlvGlFmtMz0tvb5x
	 /YBnE+pMb3E7JNup7ZAoGOqpvqIiZg3EyRifkSiaM8Q1dbDTLHqOrQhVSSqqrjMQBhlj0
	 /hkgzITKlBvxokTHm4xNLfX6WTkQau2W9c2LApknM6hrx0THCHWU15PcvLKEL/natDu5D
	 4HUCX7DYJAyrhb20WAF9sWiu7G8QK9ez2w4AjclectL0jypL/76E0NjRolX2U6EBZsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="C/ghEGYc";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C513606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C513606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=C/ghEGYc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793833685;
	bh=uFqwrEitMpuVqtGdZ248siC7EiGtmnXVduJ9OWh2cXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C/ghEGYc7JoBjZgBA4Rj4apupcPsB47OKneyF4/MbJMqtgO9GsO/8eWb4Wk9thMmg
	 iPcr/SXD41fXew9ukufw09a7pxhd8Tv6zhlRMwnJdRpncZUYFW4AG6PgbPg+ZQPqHt
	 /tcRlWx275rPTRkkh4kM5HhSr5LZc4iuTtil0tuiwMZyVXTuuR3kVsLqUYAHtXDgEO
	 Yk4Lf8hnzUJVfX9sPtrWEC4els+GO11QBmu2t63beIp4zXcIg0isBfbELLJ5F02Z6Q
	 i5uokvjLaPmjYcfrVALUfoG0tMRD4DphFkGGYfsDtXuoOlRrt0JEUPUf4UkZPZYLdZ
	 sZtRpiByhzpuA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 957F217E078F;
	Thu, 05 Nov 2026 00:08:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5A21748002F; Thu, 05 Nov 2026 00:08:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 05 Nov 2026 00:07:58 +0100
Subject: [PATCH v3 2/4] phy: rockchip: inno-usb2: drop duplicated update of
 rport->suspended
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
Message-Id: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-2-b20608c08b94@collabora.com>
References: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
In-Reply-To: <20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=uFqwrEitMpuVqtGdZ248siC7EiGtmnXVduJ9OWh2cXM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrutXVDHZuLTW2GNGtlKmx7y1TfVLj2l9Nk
 XpEw9aduS7FOokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq67rVAAoJENju1/PI
 O/qaHfkP/j6Y/+i7bJ4su2tPd7GrvEYCl86NHL6dud6vLD72/u+F55GGjBg/Rwushf0SoETWKAA
 IbEG+nHc2Zcwb/PWSLwakFdo0UlWSDbOxYSW2DtbnSvd6VKoR9gpMHkG3zvl52Kk4YdATwpbryb
 GEeiRldew/KF3eey2yI24sfHB3/aGaHycdWrNURQEyQjVGQe/W6L0udP3zCo6j3/2GGx1VvgPsq
 SUfZ0QrUfCi7RMV9Qc9DkivNNIvEreU8XCZAj8WE6E17bHHPmrFpe0G3JzUKsrHAtFnq3r4BCFc
 HY3dYS8782kGeGnsOPSGPity+pINIoVq5+FV6+XK0jYeMUSIcbYC5VP4eA2Zz5HbjgHVcor+Sl8
 jqGpPLby2z82ccpPF7i7HX8MiQdwaPAeFzvcT6Uxy2gsapdl3RHsDZ7Z4OKa53np/WBRUcyVhaF
 rZvsQFtWAB1zSfYPuoFr+uJ9osr7Ye2uUnHNeWzHhjPJMgCq2174szgrxlK8uEZrtblFa+gnq8x
 OU0qMNDjM6oe7loY6Fg0Uj2lQeObBPecDq+2rwSwa2dDVpP6Kz5a5UDaWzv8cCDuxnO24RbkjZi
 YRBKB4xLo1wCd4oA7283pyzLnX4hF2PqOqjyZJT4QObMmU24iYFr4RpAJYSidE+YWY47ANdTeg1
 0Dx8e1opZNhP57AZlcXQsoA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rockchip_usb2phy_power_on and rockchip_usb2phy_power_off already update
rport->suspended in their success path. In case of error it's not
sensible to update rport->suspended. So drop the duplicated update.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 0b61f152eb3f..51afbcc40c4e 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -994,7 +994,6 @@ static void rockchip_usb2phy_sm_work(struct work_struct *work)
 		if (rport->suspended) {
 			dev_dbg(&rport->phy->dev, "Connected\n");
 			rockchip_usb2phy_power_on(rport->phy);
-			rport->suspended = false;
 		} else {
 			/* D+ line pull-up, D- line pull-down */
 			dev_dbg(&rport->phy->dev, "FS/LS online\n");
@@ -1004,7 +1003,6 @@ static void rockchip_usb2phy_sm_work(struct work_struct *work)
 		if (!rport->suspended) {
 			dev_dbg(&rport->phy->dev, "Disconnected\n");
 			rockchip_usb2phy_power_off(rport->phy);
-			rport->suspended = true;
 		}
 
 		/*

-- 
2.53.0

