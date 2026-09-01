Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ACB44A3E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292647; cv=none; b=S4FDtqAcp7ERroQ5SZOnVS3iETwceebe/hI946SwBqPGWzxadEmUGUQM3DhhtdOxKEaB3w7SEZZtiS4E9IWIwX2YwU6940XDW5QJfhAPn45dcCAtE+tR6Qh+H5EKyVMUdKD1HLskHGrTLv33b07NVOsCIDfkEsHdJFlgviIKy+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292647; c=relaxed/simple;
	bh=rCvlPknLGM17Xc/ny1wY7xGWECwsix65LrYdnOlW7MI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fg8yL7XqftYa6A2VRIqAb9Z6F90N1QvZo4ckdD6jnQ1NbBWG9HI8+B/t2gszcTG7mVwCv9+9O99FqAUB5UJoHG520Yu9oj83baSkJyRn4/mcVaKCq9zRw13xHa5nO0tupv3rLodKG49IrufAkMF2wPMrkgj2qkhRxGxyMeSIvww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AwQldk14; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AwQldk14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788292644;
	bh=rCvlPknLGM17Xc/ny1wY7xGWECwsix65LrYdnOlW7MI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AwQldk14HlTia8gWljufFe9X4XuwnSW57CSg9aaW+5JdeAR+5+ozFGd0heCPgzSo2
	 RxZGkaf9GGbshx0tdL3CgIVLSgj30Olup4PdpJV+KgMlNZAyB35Rj8vZm/HI27nLDr
	 OVA1rbLs0N9hU3Jdy/lyWlZe7RnMlGXdG2jL79pql5qhP81yXd0nYsUqIhx9AQ05qR
	 JDftH1nkqLACGA1lPBz/zAKFPoyOHHS6HUcr1oa+UMgmIK0JBHN8QGLTpViIOcFlH3
	 JERZWsJjC7jiuwLCehnbJSXM+B4VRWq7Emhk6dCeSo2IxV6mcSAeghJRpznwNHWTEI
	 YRtvE3auxXyHA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D24E517E057E;
	Tue, 01 Sep 2026 21:57:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 22:55:13 +0300
Subject: [PATCH v2 1/3] phy: hdmi: Add optional FRL TxFFE config options
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-hdptx-ffe-v2-1-3a5922c76fc5@collabora.com>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
In-Reply-To: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2

During HDMI 2.1 FRL link training, the source and sink can negotiate a
Transmitter Feed-Forward Equalization (TxFFE) level to improve the
signal quality.  Starting from zero, the source may increment the TxFFE
level up to a maximum agreed during the LTS3 stage if the sink keeps
reporting FLT failures.  TxFFE adjustment is optional and only attempted
when both the source and the connected sink support it.

Since the existing HDMI PHY configuration API covers the FRL rate/lane
selection only, provide the following fields to the frl sub-struct of
phy_configure_opts_hdmi:

* ffe_level: the TxFFE level to apply, only meaningful when
  set_ffe_level is set.

* set_ffe_level: a 1-bit flag that changes the semantics of the
  phy_configure() call, i.e. when set, the PHY driver must apply the new
  ffe_level and ignore the other frl related fields.

The flag-based approach reflects an important invariant in the link
training process: whenever the FRL rate or lane count changes, the TxFFE
level must be reset to zero.  A separate phy_configure() call with
set_ffe_level can only follow after the rate has been established,
making the two operations deliberately distinct.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/phy/phy-hdmi.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
index d4cf4430ee8f..1d4b62475079 100644
--- a/include/linux/phy/phy-hdmi.h
+++ b/include/linux/phy/phy-hdmi.h
@@ -19,6 +19,10 @@ enum phy_hdmi_mode {
  * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
  * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.
  * @frl.lanes: HDMI FRL lanes count.
+ * @frl.ffe_level: Transmitter Feed Forward Equalizer Level.
+ *	Optional, only meaningful when set_ffe_level flag is on.
+ * @frl.set_ffe_level: Flag indicating whether or not to reconfigure ffe_level.
+ *	All the other struct fields must be ignored when this is used.
  *
  * This structure is used to represent the configuration state of a HDMI phy.
  */
@@ -29,6 +33,8 @@ struct phy_configure_opts_hdmi {
 		struct {
 			u8 rate_per_lane;
 			u8 lanes;
+			u8 ffe_level;
+			u8 set_ffe_level : 1;
 		} frl;
 	};
 };

-- 
2.55.0

