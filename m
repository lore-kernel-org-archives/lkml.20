Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DE22ED16D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883667; cv=none; b=ukNQMAO787d2CKyj4mEQWwcpPq4QuwRjy+xZoDAUzv61PlJAThmxoVKwM/oAZ46/fgTdafR0QRhpGlc7xgnZmS65zJ8Z7MN87DffeL/Fs2oXUD2MmTxcaVL2kUVHC3W08mFcJxv9+OuKUFFYIJAiwdoZGxpgx8tjgLt+hGnlhUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883667; c=relaxed/simple;
	bh=mZy1cqdWdJhHt9O0ElVrbLOd8aw7/ukD53tdlXnuAcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sV4ynOIYAOcm91jdjzFIBMDZou5JChx9v/SsnwJ+Kf6dgbOSce/rQ/0yIsOf7/JJgbeNGE3TO57xJJaJ1tgD8n7RqqlQKjaS67D8Pp6uPwXr+0EJfurjMNd0qNs6UWsK+eQX/tmkfOPKWrovUnmViXeZ+Svw9CHZW4sXVXWvuTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qsHo/WrI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qsHo/WrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788883663;
	bh=mZy1cqdWdJhHt9O0ElVrbLOd8aw7/ukD53tdlXnuAcg=;
	h=From:Date:Subject:To:Cc:From;
	b=qsHo/WrIgmVfRw6p7uZI1OLxOt70hmvt0GRmI+JHoV3y5RDzCi7Ws6iYmpccNroQe
	 tHZ/LBfaypNZ+R8BKp7vDmaGjANQDwInp0fEFCKQsm1spmUb0J82bGNAVsV37saMml
	 mRbq/3+qQ8coeZ0EwoJYv6oDLW1m54tKWRwSH/JNEKiWM2aytDS/mXwSUqBRSlEg3Y
	 6y1IRUo87FZBx+T0Zng+0l4XyGPNLxmDkCTvjFl6k67k893eJgUYg2ezjMztuSPP+f
	 bdebaUab9/5+DIc0XqK48tUGK1E3eEQQeOTfwlra1FtlrRRbmztYTb/8nmFVUrEunz
	 +4a6uVOtcYZ1g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 79C7217E0420;
	Tue, 08 Sep 2026 18:07:43 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3903C48002B; Tue, 08 Sep 2026 18:07:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 08 Sep 2026 18:07:42 +0200
Subject: [PATCH] phy: rockchip: inno-usb2: ensure PHY is running when clock
 is requested
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ7CIBAAv9Ls2U2Q2Ip+xfQgsJVVA4S1RtP07
 656nDnMLCDUmASO3QKNnixcssJ200FI53wh5KgM1tjBHIzDmt7YSriFxBU554KzeIvhrg4nfiH
 FOPS+30/O7UAztZHq3+I0/llmf6Xw+HZhXT+JiLhohAAAAA==
X-Change-ID: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=mZy1cqdWdJhHt9O0ElVrbLOd8aw7/ukD53tdlXnuAcg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqgMs9WpqhLxTPuwexyL6CnHWKALsLCTjiT1
 alS9w/buWlcYIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqoDLPAAoJENju1/PI
 O/qaaJoP/1XvEvAnZaDbwRNrMatVi1f3Kaex+2hUDpKMZPWG1Qhi2YzZmzUfMQ03nM1ZzLQHwxe
 OptxYH8WRRj7r0ZFMo/resXz4IUTRx8fMoW2Aum0pykvB+4JL76iHAZurVS7Gw+5j8REs3jkIvs
 Ux8H7ILqBRcjnlI24t9+2owlvtAuPbbVgsJg154zEafA/dic8DD7drz7dxUpQVygeKtaOthz3qG
 G9fPz/lXRfWD/eJrST3GWjSjhv5o2BabTPWex1hQCb69lNe4DjK3BlCdem/inAnrUDcQE43xzS1
 kXoD9xV8j2JIYRW2TKhum+6KpSYcqXBcwgkEEkPmcaTKroS/12PHkxHh2E1FoOTc5ub3WivgOv8
 6zOgIAgLh0yb6Db7JDx+L25f/phwCxZ8yE8soMs+93Xi0RzVWJConxMAVuBUtV73jqdpCwBpXdg
 /+DU1nv1IQq8mKgKCglv0iDki44nS8piOLAr6yN1aJFCsvVXfXB7MPI6H4qE6xzUu8o0kfHbJT4
 xTRvVSm6GpYAIGQHrXPinFs+wMPXsB5MSsA+8Nhm95xvigTu6RQz4cw39jUA29SXd7P2S9/lSnD
 sBL0P69ooCCZAr/HlESKZ/IKHPiBuHV3AU1GBZdYe5jNI/ycXnljGyCIVx/SY/sXadOixW9PyGe
 lHEOnLeedDxujdklPRG8sgw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

On RK3588 the OHCI controller registers can only be accessed when the
PHY's 480MHz clock is running. After system suspend the controller is
resumed before the PHY. The controller requests the clock, which opens
the gate in the PHY's clock prepare function. But with the PHY suspended
this just results in a dead clock being routed. The OHCI driver will
then continue to access its registers resulting in a board hang.

Fix this by resuming the suspended PHY in the clock's prepare function,
so that the clock is really prepared once the function returns.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
This was noticed on RK3588 EVB1 when resuming from system suspend. This
is technically a fix, but its unclear when the bug was introduced and
system suspend is broken on RK3588 for quite a while and not just due
to this problem. So I think this fix can be merged the normal way via
linux-next.
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 7d8a533f24ae..07d400967def 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -332,6 +332,39 @@ rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
 	}
 }
 
+static int rockchip_usb2phy_clk480m_leave_suspend(struct clk_hw *hw)
+{
+	struct rockchip_usb2phy *rphy = container_of(hw, struct rockchip_usb2phy, clk480m_hw);
+	bool relock = false;
+	int ret, i;
+
+	/* Limit to single port; it's unclear how multi-port should be handled */
+	if (rphy->phy_cfg->num_ports > 1)
+		return 0;
+
+	for (i = 0; i < rphy->phy_cfg->num_ports; i++) {
+		struct rockchip_usb2phy_port *rport = &rphy->ports[i];
+		const struct rockchip_usb2phy_port_cfg *port_cfg = rport->port_cfg;
+
+		if (!rport->phy || !port_cfg || !port_cfg->phy_sus.enable)
+			continue;
+		if (property_enabled(rphy->grf, &port_cfg->phy_sus)) {
+			property_enable(rphy->grf, &port_cfg->phy_sus,
+					false);
+			relock = true;
+		}
+	}
+
+	if (relock) {
+		ret = rockchip_usb2phy_reset(rphy);
+		if (ret)
+			return ret;
+		usleep_range(1500, 2000);
+	}
+
+	return 0;
+}
+
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
 	const struct usb2phy_reg *clkout_ctl;
@@ -340,6 +373,10 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 
 	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
+	ret = rockchip_usb2phy_clk480m_leave_suspend(hw);
+	if (ret)
+		return ret;
+
 	/* turn on 480m clk output if it is off */
 	if (!property_enabled(base, clkout_ctl)) {
 		ret = property_enable(base, clkout_ctl, true);

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

