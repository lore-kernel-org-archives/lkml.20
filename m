Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621656;
	b=hGsyV10WR7/YFms3U0IgQZSLdWKSYlG/gWdHEBgnNXbATIfURlqSXEk7wKhShMpyQAek
	 yonxogRMrPvv2cQ087JvAay5oBAtBd7kDmUayRaCVuxKZ7q1O9+VWzkAJO+yimECwPHjF
	 0WNPtD1tmC7ckIXiTeYBUQ887eWKi7WsFd5MQUzU9gkICuhfyXlvglD+cSHLeAfFGAAM/
	 FoWR72K6RT+Ec+EzHzrEpKAa0dGTG59PT8sPxSeMY4ql2lh9Xp1Ro2Zi6mOj0TF4TUSWu
	 VEXAlIgu7LEmFqUQWBTPrhoyHFDygQ1rswpgZouZkr2rcvMbL+LQFwWh4BiDS576M5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621656;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GkS3v+cvghTt7Trkg/TnH1y7j0eRF4IG45oyXMxC+qE=;
	b=5Ia3c0myrjzTWDH//urlHfjxD7CU78wc0PZqmy+r8nD6CcAqhQZurpu/UDh65tSVx9iF
	 4+uCDOTsKB6K39ikTGqg5gMnRZwfpfYBjTGkF3/t+cGowtrxuPWghrdQ0sa/70DKe0HR3
	 cjwMXiuU7Qy2+vEkTChIUh3b7/XNd6Vno1XPOPQ8fXvI9WvxTx4ffWqsXFoxV6kyfopZ2
	 w7s9yVR5GWxZVLH+U3OAQ8dLNwgErUiWcio1xrG+A4sVO6cxaUGChmZiRktIUNoowoAmM
	 lh4FckDWxiluobVaH7ewNn9hach0YF7hVO/ax1/+fU11Whd9gHasdCBcPIh0dblPTWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qe69jm5b;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301F606A899
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D301F606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qe69jm5b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621651;
	bh=2uU+Fg2rde1/iaxY1/gZPrSMN8fWrie0TB11Q40V2fk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qe69jm5bQeBpNJpzlFBs+wv/8/oZktcXmv5H0vc4iQ7s2jWGP7ABNlUyNuUKB/BcW
	 SOXqSMtlZudV8aHE5cnzkcAqAtCkiZewCsknEmznAp1EUfmHYXNPAZ+ogQNtpVpHjC
	 PpWgQBoPjkpdGRUmlt+B7WlHZ2UsbMVX19Y+IZ/bMfuWmWOyTIA0RIYzw2SeHHVMzY
	 KjJHwxPKjraoBacYuSQ1cycdsVBHKQVmNSWbA1b1UWxui3yJsyRAgl3Q33Cdqv8ElU
	 BJjlYIUiK+YgZ26+j/6Yhd7dYlmePr5Rkl0B7SvJuPsUwDUoK71ibiMNH9US+F1exn
	 XadWUKOHTZ0hg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1408E17E0E57;
	Sat, 14 Nov 2026 03:00:51 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 79A56480038; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 03:00:32 +0100
Subject: [PATCH v17 5/7] phy: rockchip: usbdp: Re-init PHY on mux change
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
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-5-1af5f566408e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=2uU+Fg2rde1/iaxY1/gZPrSMN8fWrie0TB11Q40V2fk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNLzkcIEd33rqXBWbHyZ831ZOstB4dRGD
 gkBWXZ0i/+X4okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qaAcYP+wXFHc9n6r98depbW2xi5A8KQ6jVkBbQhLO5Hu+kRo1VtuYV4+j4wHbGVlmeUbMbT2o
 qKNa6XRUbGqZ41SYtYOiTJKDucsVERNd2IYVoswJK8Oi9vDKhwocyL5uns0w5qzymhWCQzbsF1x
 0ui1+H3UzPCm3TU5eJAB0U2dq6j7SCHYKW71kU+hrKgQho0NwH44zPOmF6eNCprrPomywo5Aahx
 dwHg5IXUZF2wQLUA+upnhnT6gQaxlgKiJDxodHvAP7SwI6TQAMqZO+ApXHMVBa2vAEG+aSBm1DF
 LFbLqD7HQ4jgu0xE1v8ciUpQ97VZnsosMpQvpQ/O411Pokp0ZbMiB01qCpfCu+Gs6Ch9cI+ST9Z
 sOrmlwOx0J6gNawTxNq021W3T6/GnW2T+4TRnDBtGDOLthsOy1UY2vxuOr5P5Ng88ruvIOeVVuO
 Pb1FvaXN1WY0kmUFIL/7WWE1Yrb2ZNhDCFPyceskEB5nU8qUiPAWzVJolXsMJEamDt5b4tLurDY
 HPZjOiEkn+5aSqLoS/vPN+PSlN1QDvqc+YW57/IVYCn+0a8fhoDsGT0+AyBTnhmJ4wJtMK4q0tt
 gEA3dOb+soHHmLbUeA1u53bzwDfbbCMBy55fEWiopSzaQgAHEtWzLBq5Pza207/lZxk2O4CLGyr
 /IGKjt9XehYY+Hy/1CZ0yYw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fc3c4104dcd7..b79b6db96a0e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1434,7 +1434,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0

