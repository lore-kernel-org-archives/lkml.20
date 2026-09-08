Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCBB4F0541;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860516; cv=none; b=n03jUnLCZBRSJjMGyqdR3tJtEN2mTMgds6XpMpD069Mk8Vv3DLQLrezhO/hZQOCp9JQR1WULwaV7JeZDPhJAygLkxticug+uUPtWoa0iK9B/Ak1OmcA69NgOH+oJHnSQyBC2/GJZI54F94m03vydFzPnBsZeMecexSVMtGYQVEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860516; c=relaxed/simple;
	bh=uWZIHL2RMVsnz8x+iZFwErDd550WZ2Cci9TFAmY6WQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZRVn2ZvBXH89GTOt8qDwtKRzEcqg0Tbf1wyF7xObL84TC3fC/PHgEbkc+eNFFjAwlvx6EjYkjb+Qv6ogbdib+uXu0x/8JJJVIfs1KJ2Ul1a5akFGWtEPMJ9YEdMvid6CLt4Egoy7m/Ipal6qrT5t05g6p3yRRejm+wGB3Xd5R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAL2Jtmp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAL2Jtmp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CCC6C2BD00;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788860516;
	bh=uWZIHL2RMVsnz8x+iZFwErDd550WZ2Cci9TFAmY6WQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JAL2JtmpRRNA13Kt3DTbQkNYbJHVZcl6FKbOGltm24A7BA0i/g5Izl30h8F/A61JD
	 3jfzlyD+WsWbh0t/cPjFwKmmX8iq39cWLMOwNLIXRluAq6Sg8kzkSMfurc3JlxAK4H
	 D9dp7gU3EesnFl6D8xvgxG8/XYPVfSu2ccQ5G05wDpatXuXoGizX3GSPPYSyNesWPY
	 TgatRavAUHQZmM9CWE6vz+U6A/aB3XQZ5KnhBm3kvQBykddMAKLBeZcC0vjZuWJOCG
	 MNkzpUDArFVHNV5cbZRgD5OFwBWchAQgq5gw9LFWObSBODS92qY5Gxrvlq28akJK8e
	 v626PbWCDSKEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FB1C79FAE;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 08 Sep 2026 13:41:00 +0400
Subject: [PATCH v4 07/13] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Assert
 reset on clock enable failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ipq5018-usb3-v4-7-b789702f0695@outlook.com>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
In-Reply-To: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Stanislaw Pal <kuncy7@gmail.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860513; l=945;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=Xt9077phHCqVPqMVNZVzBLq0pYjZ3VnSS927ST8gSWc=;
 b=AIvUePJfwwQReYU60ZhpE5aFQZ4csdMBGKGnxFwBKh1Lt4PYR1ueo4LZpPFkx4/d3/w64mEWA
 Oza4apZiP0TA+sqkwp7OeyVBpJW+NfuQMyYtbemzANyG+LTdKMQ9qR3
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

When the PHY fails the enable clocks, it leaves the PHY out of reset.
Fix this by asserting the reset before returning the error.

Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
index 0a50eb44c0ce..15b17044fde3 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
@@ -164,6 +164,7 @@ static int qcom_uniphy_pcie_power_on(struct phy *x)
 	ret = clk_bulk_prepare_enable(phy->num_clks, phy->clks);
 	if (ret) {
 		dev_err(phy->dev, "clk prepare and enable failed %d\n", ret);
+		reset_control_bulk_assert(phy->num_resets, phy->resets);
 		return ret;
 	}
 

-- 
2.53.0


