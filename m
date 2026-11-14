Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621653;
	b=i8yswsLnAV+sXvKw36ODlV01Z4muN+YqGzsDTX2glp7Oi2iT8NhaZ9RCYmCHpx749CDp
	 XYuGL/9/F9OvuAWbSVVweMwcmOGoFOnwWgQM5452Z6ggwJ/M0RoUeDRnJkOMN04bIBGim
	 CQ3Au8OVrXdevXj6rRE+PJKorVR/KzzDmSlH0i9MZdQsFqU/WOI8PYO/M8VUYoSa6Ro6E
	 1rLc3D85Ooj+ISNFLNeE9u3zsSxIGm/VwmF0nNQ1/vVJKr2mWVzN6Tq2r/uCOAM6RfMbK
	 RL4Qc29DOkCtwOMKc0aiu2HWuEFDHt9iI/HVtwq2KxTTQReuQOhOIdI1gEDMRGCwuKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621653;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ALZFKbs138rL4X7hGmqZ+xvl7ond3UdYP0thrAs8QzM=;
	b=iUZzoJP6Pe6Z12bD8Od65riHI9zF41EwEBARzFfZko6zik6xHR+/+32W9AhbQCGvxnLl
	 1G0R0B3vBpo9xZ+8BYvSLYbhWDk8/KHK9h35BfqW4gSTqV5NDaFfese37WwOELt17qBYA
	 DttndNuHjItILhed6OmJg7zMLJBGLNYGwgi2P2ZgHKhbbOu4i390lOK+AYRTSIi9GFrDx
	 1ri4Hbn+Tk14n1IDUaS6wlBBQGV0mk81y1aOzHBIHEg+FGL7i9L8uo9m8jqPI/w8oIKtt
	 vrm7N+6JnwYE4uDpXoJ2FkU5Hr4eynOoxJWosFq46DPSV6YevP1DAeTn2ls2VmnkXfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GZ6WEMk9;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BB7606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BB7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GZ6WEMk9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621650;
	bh=Y0ahJFIOGX3bRryRmmv/cq+7XRNRRYPyaAzmDErQaZo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GZ6WEMk93JAtIJQEJVlKe6flh2Yf73lPojU69sLTq5xiupNFFI40fH7DX2SnATYK+
	 MWSYn7eQ5WTx314EianQWkx9vqYXRqXA10U5xiJaYXcVEDOJ3lGwmEw+gDBZfIy98a
	 2rI2QlQK+GqVsStWoNF6s2B6FzG1s9pcrvwoJm5rp6LA3pFVUv9BNNDkoXcrZpzXJV
	 cYIJxJZ6m9snJ3CRa+EV3lQBQfhjwVY1WqUqyM8M3BX/RvhNszAe/IhZTznPbhxW+S
	 jfRw2pTWnuXqIgLo+/rFm6SjpKwHsMKIUxrLy2ktEHH8ZqMDZiI5qIOmjOs11ejXVt
	 qrwyOZqp5GwKQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B66DC17E0818;
	Sat, 14 Nov 2026 03:00:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7450D480030; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 03:00:29 +0100
Subject: [PATCH v17 2/7] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
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
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-2-1af5f566408e@collabora.com>
References: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
In-Reply-To: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Y0ahJFIOGX3bRryRmmv/cq+7XRNRRYPyaAzmDErQaZo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNIUC7YY/gfbXKt7710AWWlX/UHfPtDJ5
 wEUc7CBpV5/X4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qa8x4QAICVEBjAqi2VrmQFH4ChjRkalpYEcqHR6bGJuxMgaxlCNmIacQ5QEYEQ02OXtW4GL/R
 CPCYkUSPX/9tnOHsb5HyrBjOuJbDuot8LGTJTtG+ljSa2kPaSRoR2UYcbAuvU4btKrAkNe0LaoW
 9PdfFqOs4YRLkcDL76EI5z5KSfW4h6syiN3D18UG3Xb0oaYj6d18rqmY292v8hDY8fajlY+jdyp
 lhGu2IrUbFEfWAlQpzqIROLj2Li+XhPNS7wZeww/bYQjtXj5VfUXGHOaWYr/1zaRKoZGBwkV68y
 8LqpZidQUdu4919vkLPv4sZs9mIhiZM/ImQ5xX/w0WnEsxW80dlKj58WPy2KoNCjDEbWG9eW1yD
 R21R5gX30Us2UZNkD/jSrQBERIruK+HidkFs8ciIYooMbOWgg1gqRZLwatMmGyuVnoQ1IUyoTsR
 UW3kTpn/8ZY5kUuPgWlVTy8U5SRxmjMIBF52FrD8BQBJS/ZXdCiVDjALUZG/w0Rt2Drh32CGL9V
 Q/jdPAXMwFckNhbOUBUxOf2VW4g6hL2r+zcva/WcBXq6qdCn1a9XPeTIsyeNIkVJAhMy/0lKqMm
 0ZNnYWwTuifEqF7y5IRKAlbUmROMHdUvG+GpL2ohSiR0MQfHS8SIOpoXXYT5oMTltjgTD8JLkcV
 fiwQPL84muo7LLA4OtW8h3w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index d01a819bf794..025c8d52d72c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -754,17 +754,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0

