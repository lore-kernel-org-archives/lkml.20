Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AE74E2348;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860516; cv=none; b=DiAyfpUtVDHZVjZBCqhgJKRdQuSmelHM06792SwAMFbdCG82m/aigGtpa8yEzqvC4HlPaH+4jrjptq6LB0Drw6mYUDuCsZlsdTC4ks1sRRB2lwB01SVbVZB7AmO83VJ+3sQWseC5ZHdhsA/D0xfWW1nw+EtMwukYbin5+x+u3T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860516; c=relaxed/simple;
	bh=XJ6yOYRHmExtgCBY9qgx0PWkSsgAEmtcH8En113ot5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJqaRbZ0kB7D9W4zwqdlOdIJFOAP1tg8vNE6JtCX95T1SOyMVo/Vzaw6WWZUc1gINjbtgXwnBMu5JIwyPPq3E1CjfSVE8JyomT9YgvG2mOoJF2kIx7dwhRw+/OFdaDgeeCYJpx+E9I5TYDuf8yoBQ60lAnR54HXgUkORGHsXbBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mN6/eogA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mN6/eogA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9085C2BD04;
	Tue,  8 Sep 2026 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788860516;
	bh=XJ6yOYRHmExtgCBY9qgx0PWkSsgAEmtcH8En113ot5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mN6/eogAkZbzqjvWFtEatTPOr9Qhv3XpQaWOJtJ/NUeeVmPyNp1H3VMIZdlEEnrsL
	 0FFHkFXlEtvohsZ4VuSjF37S39i2Hgv38VC/szstDP2FdkVNN2PNMJqKXnJS46b0/2
	 C876uV8YKabqt4HjZ3Bsmt2DeDnjVzfqW+wMure1s4zwKJi8CUi5220pJJFwQSZUgn
	 P5c+Rp1Y5phdoxmKw7lxoosQ1UW93X6xyXlJP/c30+UqnXKa0V89xkjtYWlZ35HjGl
	 AnsGBxP+JG+ureHDmR4LWqecM7nthxM8+rm9A70bUyBe2/kypNQesPWiXXbTseoU/m
	 nsTaqNoduuDOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB46C79F82;
	Tue,  8 Sep 2026 09:41:55 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 08 Sep 2026 13:40:56 +0400
Subject: [PATCH v4 03/13] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Remove
 unused of_device.h header file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ipq5018-usb3-v4-3-b789702f0695@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860512; l=932;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=x3YqnFvnYn/dCrkEKgaRYBlPO+FYsf46oEelUL8OnI4=;
 b=Z6muUtm7Pdr7gd25BHnn0SL9Th8zJf9BxGrRZH5VgkYh2/tMv5XhZmJAPRCmqvBuDxz/w+rx7
 WgQl+YY1RUxBzyjyoufuWzTS/Um6a2gcF4t1xVvhHpS5BPvxiYxzuHR
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Drop the unused of_device.h header file as the of_device_get_match_data
declaration was moved to of.h in below commit:
commit 82174a0a9c5c ("of: Move of_device_get_match_data() declaration")

Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
index 53512db90eb3..b9ca6c1c177b 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
@@ -10,7 +10,6 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>

-- 
2.53.0


