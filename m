Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99D4E379B;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860516; cv=none; b=HWbnkRHNCj3lyI19g9V6OVG9ctsmTJxDxHVDcpXsSLPuS7SXILEYZqnXs9Kh1MW7utlxyfG9ytW6mSrYrM/LbEi2Q8OI33kxKEGYnUwY9Vn3QaUDjI92YQ6y3/4Rpw7zMNba4NC8+9y/QzVjae6quzhIBlt5gHRFfT7Jbj3lCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860516; c=relaxed/simple;
	bh=vUrdouI6geIRrhvl7FMUbnySUDBs0we9z3aR5YMU6zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MGZKnJIL+Goz7oPX7AHsPGLDytf3vU5Y9JsiEeOtIA9YNsSgRww5E2PLQBFbIbl1Yh8+OngFNszvzDF1W3fS9Tn9rELXUAWDHjzURKvq/LR4BGFk0Z7MW4INZg0yy4zUUX9JTvvsnheFD2Lkpf0qKqtQS47NEOaQ9NLnZh3XV30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKhqAIjw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKhqAIjw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0194AC4AF0D;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788860516;
	bh=vUrdouI6geIRrhvl7FMUbnySUDBs0we9z3aR5YMU6zs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JKhqAIjw/3Novblg8urc1LS9uF6ZHOnbMnXARtaAduLCNUkAOGFeul8TpXFw7e6te
	 3eBvaeHhsKQz6RcWMOr+p/ZkzzsaCB0UTJCDiaNXtck9OhJroioI9TXX5GVQGW+cEo
	 sbWgtXPrixcx7NpNmiG7ffWJjkK9gMkXkSW2FRdX95HZL0t0OQ6YkX8+/N63PFg0GK
	 ElVzjsolP+Jq0apJGPxpj+UNIZq0i2frZAenJ5/m+cZO8/4sHKosRyJKXE5FKW9Pwe
	 c7wS4ebC1mt6puS/kaAe/hsNcyOnnwnX0zLm9xJuNe+hGi1d4rBYOwfmOiAI7imBcK
	 h4ef08ZM+Rzjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2475C79FAD;
	Tue,  8 Sep 2026 09:41:55 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 08 Sep 2026 13:40:57 +0400
Subject: [PATCH v4 04/13] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Drop
 unused phy_to_dw_phy macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ipq5018-usb3-v4-4-b789702f0695@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860513; l=847;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=IZ/hjxmEdOnTJTDZazw9P78aJ5AEBePKGFMJqAXOe5s=;
 b=94b2fzvuiH7G5zZammgV57trIIoPK4mwZqfHv2tpEyLyAeIpxfo/xe/+DsS2EFQY4eRxD2v08
 ZWuehp9sx54DjPwk2XmsfBYVjKTaJMsL7x8hSrAFF2Qjl/52zzElgX5
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Remove the unused phy_to_dw_phy() helper macro which is not referenced
anywhere in the driver.

Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
index b9ca6c1c177b..0256183fbcbd 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
@@ -72,8 +72,6 @@ struct qcom_uniphy {
 	int lanes;
 };
 
-#define phy_to_dw_phy(x)	container_of((x), struct qcom_uniphy, phy)
-
 static const struct qcom_uniphy_regs ipq5018_pcie_regs[] = {
 	{
 		.offset = SSCG_CTRL_REG_4,

-- 
2.53.0


