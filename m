Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CB33DB339
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484782; cv=none; b=dcIUYbjCem4sNmRlfCn/E3RFyR4TOK2ioI6FtdtxQsxhqFbw2pi0Xhqz5G3prgZ7PZS7USCzp0CO42hxqAMtOCq4Dh07FXadRDQMy8ONPqBVMYlPJePQsUMneNFrZfRSEmAycVWiSmVIoyEBftyEe7CINb5CkhodWubnGnWgJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484782; c=relaxed/simple;
	bh=aDjYZwERGTJiJG4ozumjnc6hne3xhMzRv8ABZSNpd+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ETkLtc5L+G4u7GMAJFKmCBMGxNY1gKha+yuoD5iQw5c9dKPD1/VYEWDBnp6ny8qrUfMDWZcHmYlLH7ys40qBsOOgU9OtbUljiJ+t0I47AtVacdQaGmSMsQgGI/ru/NK2dPSuiizMqQHA72zYzpwgq1y4Wmsn7er3LkML2c9xpDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VkrYVeqW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VkrYVeqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484778;
	bh=aDjYZwERGTJiJG4ozumjnc6hne3xhMzRv8ABZSNpd+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VkrYVeqWo8xcdS7DPv+ReRGnTo0+loU8wEfrNe/42p83Z3a0G1oT2dOlq/LYWJAB3
	 9/ultUtjQhwb1zG8zfN+ffJEGgtHPGbFNgQCLnVGj3pVA3fJr9FpeKg4ZCZXCgRj68
	 hadCqEL3JL9N6+fZ4aWDi9HR5ssbL3SfgyEHEHGOljm+BxVZoNF7SIUmtetcf1C+U/
	 QCtudrPIW2GJ/6WycLIiECOL0SqTHlBCY7mMtDuXvp0VzMvt8Y2rDxwH3598pnbKv/
	 Dj9nnyQMzHogOm5eyk60uauxI7BwJgnzMj2f7Tw4WN58bdj1r5QNQgqB+CIgtarjtc
	 XKXSpHXzoL7JQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D79E17E01C5;
	Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6075A48002F; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:05 +0200
Subject: [PATCH v15 02/11] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-2-8d507cb1174f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aDjYZwERGTJiJG4ozumjnc6hne3xhMzRv8ABZSNpd+E=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXunL0OwZnhXEJ2biylrCBLOC7K3FRHWM0
 I+Z9WYxol3B+YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7pAAoJENju1/PI
 O/qaDsoP/02ITRUoEU5gveI7bfsRZ54Xa29vbsuez8djEwL8rwF+/++fxMkJwI+93p30UBnYFRK
 th6Mat5lX8L0iZX2kBB+etY9Z3Q00DlLpSC4M0wjeVF1ddj+X167aX23e6OMCBCjb7ZK705yRvF
 QFGzCG7CL/OZJ8Tu97AkOG7BYH3s/qH0BAiHgSn4Gn/L7B6qu57U5OtOjVgciEW+EkRgU3VAuo7
 Qxsa9c/hu7KCLvNjyoXleqPHHGtCpwi3fM3Kvkt5upEEhKYFqp1OADwfo4OedmR+8gfSNykz9XP
 oD31Y6iQethfbkuPau+t1Wg0Bk6Sk9/rqXpx8CrfvJEp8jM34198RnVqSjypSxEwJzaX3b1YdLg
 S/knPL9qhXIQ9M6bEnt1p9vxXFRmppkcXvN7WaeodgAbtI6KqDd539gix6s22XApNowx64MvLTy
 u1/Umi1cPYPHOP8dL7AhG6Opn+Lrkwr8TytzRHe7bJkk45KO5ab28i0XQqTZ3eLwFhsUNqhh1vP
 pqWj4bddjuoHjtDXihGYryDEN06luLokp9RQrfJpo+F7pZ7ReQZWE6X3GwdozKGtyVQ7Rmu/m8v
 M7ifVGd45Dqba1ZBMACISXwBmeIKa2QtA6todFK0DBYdNjCFuniP82uCyUOQa08LSpo3uYwyzUr
 VLuFmhNq8f9uyc5uiWZkwzA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 03a276c08fa8..9767fba23660 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -170,7 +170,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -577,7 +577,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -950,15 +950,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

