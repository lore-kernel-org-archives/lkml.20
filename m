Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D4D4F6485;
	Thu, 15 Oct 2026 22:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102837; cv=none; b=A4iIKRAYvXrD7Zn+f04egZiS5CpSJO2+tw+2QJ58i1L4qqd0UOPr8MWZNs5NG/BhlxkzQ7LXS63lmjlXn8XPUrUxA6Z6WqfNbRSQZPDjAPeKDD/qatrH8m8IFcSyJCpXOmKXrDpjxRoCXVi0n7KMO5IJo/SNhZJFkGWMUJ6CY2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102837; c=relaxed/simple;
	bh=opFYL6eJfRLIJ4Mi1M4Y9sNi8J7wJU4m5CxqbvcQwSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QR8bD/GK1PiV5WtchLg3xA3KetxYa9ALKhaQt0Wr52NWEwIf20vZm1icbV0elS7DaoZll0jc4xxNR8Yxnl+bdkh5IsaizPCDutkkJTF4EYG32NLwpxTaoHQLV+5knY3AvUx116XEtNimfHTH3Z+jRIirGR4yTNT3RxNyfwMxrKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVCsrwuL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVCsrwuL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B7FAC2BD01;
	Thu, 15 Oct 2026 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792102837;
	bh=opFYL6eJfRLIJ4Mi1M4Y9sNi8J7wJU4m5CxqbvcQwSE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KVCsrwuL5n5Gkp2z4QRuS/+oBmW9JTe5uP0SYvQo+VeelwJPsaeGa6nzWZI378vbk
	 D3vBZSTj46dTrub13+7ko9ZTR8wvC0cwi/UkbchCIatZxaB9bu24aF4HsEdZf1zFu3
	 h7/Or0c/AFKhU3RsuFRzNd+dnr6+IzSfzQBNS6+CHzCW0O95gM9N4FNYFhXTh99PSZ
	 2d95LvyR3ddJoNFtQNGXKLvHJ1FaalWzvYmlG4K/eRLqW049/ClNRg9pGxukDDJqd5
	 1UtRe71e3kwUHO+vWRyDBnkodi1AgxBNBCh5+XGptgUOVe+PON/VBRzZT40bQ1diVp
	 Nx9pm81b65f6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5ABCCA46B;
	Thu, 15 Oct 2026 22:20:37 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Thu, 15 Oct 2026 23:20:38 +0100
Subject: [PATCH RFC 3/4] media: qcom: camss: csid-680: Select C-PHY in the
 receiver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-x1e-cphy-rfc-v1-3-1f3fa9af940a@gmail.com>
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792102835; l=954;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=zIA90Rl/gtkLGho4hrUCxdrlhc5niDyVArSGj4xfgdM=;
 b=dxq1mf8fO50sxXqgXje86lxdhpWCCkmpix7jS568ln4jpofHpoSqOKdUHmWuSicEhghudMqwy
 zROe31y06DkCFz0gFQ8ltbPCGY67/Y7Q6MEooCwAXKNVWlTfde6sBz0
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

CSID 680 has a PHY type select in CSI2_RX_CFG0, next to the PHY number.
The field is defined but never written, so the receiver always decodes
D-PHY. Write phy_sel to it, as csid-gen2 does for C-PHY.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8f..16b199f06 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -202,6 +202,8 @@ static void __csid_configure_rx(struct csid_device *csid,
 			<< CSI2_RX_CFG0_PHY_NUM_SEL;
 	}
 
+	val |= phy->phy_sel << CSI2_RX_CFG0_PHY_TYPE_SEL;
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;

-- 
2.53.0


