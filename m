Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A5237E5C5;
	Mon, 28 Sep 2026 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619394; cv=none; b=CA9oNhb5LxIKQqDg8k0tz40adp1PmMQ725+8fzdEjNJ8FsObRbpvffw1dlOJ1IsLr0t8b/0r8at24OQ8Y55yIHbMv8agzYI6yjS8yfwisWWRGPKpOSvVoXWnWihBGXTrDMaCBXB/DX8H1f6+AG50DT+rRNRbi6KVk1cZdYropGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619394; c=relaxed/simple;
	bh=PmaO83t7PRe4HczkSaTr9aLkTHEtYH1agSDLYmZqAp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EqdDaA5QjhJ0XvGNGkCK87OkHBB0tTZDwruGwMEUnQ9Ii492V0ANLqdnYgv/VLblGg1cIMdnkLXTu5CEBteSrcsqdKjqm/rAyBpfrl/OjrvGHpbWkk2KRSQAEaBbkGdLfLoNHc7tNzoHVT5cIZd7vnWGxrDzGG+oLoPjlZ1/2cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URLeFls5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URLeFls5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58F65C2BCC7;
	Mon, 28 Sep 2026 18:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790619394;
	bh=PmaO83t7PRe4HczkSaTr9aLkTHEtYH1agSDLYmZqAp8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=URLeFls5xDxm0GeaD8B+BdnRB/41+yC67smUZdHfad1vf4vTuoGJ6iMLSztGsYiAn
	 ivtjnlwLxnNyOTUZ/3m+6+rY1G31zDDa3eldwVCjOf9QToEP+oMXuuYuNAO0jvppb7
	 tA6fslqnBeLzzeFnUzf5IaTYZT3kl81cqAFvG8jzcd4x6KIXd5wMOYGvXFEHmcrcIQ
	 64thzBPHW2o9k3j7ut6lyGmeVghQwtsFtA85ccZjMOB3rC8fX9caQxuWog/9m8s72u
	 iLmMQ7KJ5NXTqul+srfhxLc28UJHQQFtDHEWGhXGN4pXQNHjWNO6SaxB946ESZQn2D
	 rOHn9unmdoNyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E3BCA5FA3;
	Mon, 28 Sep 2026 18:16:34 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Mon, 28 Sep 2026 15:16:28 -0300
Subject: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host
 with wakeup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxG4auQrm2CJRDwKsYFU36kqCAzCiaEu
 zvK8lu8t1KANwQ6JSt5zBZsHCKOh4S0q4cr2JpoklSKtJKSm0UznnR88F1YO+iNkbk8rxWtK4R
 i+PRo7fOfni+7w9v10NfvRNv2BTbuNNt2AAAA
X-Change-ID: 20260928-dwc3-qcom-l2-check-e3b55acefb62
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790619393; l=3338;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=kTgm6rFNJ51HgyF1+bhK1uBxwLypDtFEi7P/iVrPY/M=;
 b=s+l+3PPixIi2c5hVLy8Fdn/OQHPA87hXlNkWFP0pgQolbC7E5p2g+Kt68KYFBMgt9IqJpmlH3
 Ou5vl5s1IsSDCuH50PYMVjRUI7s9SY7WkF05DvqQxnc6O13anbq5/Uq
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

From: Fabricio Akio <fabricioakio@gmail.com>

In peripheral mode the core disconnects and powers the PHY off before
the glue suspends, so the link never enters L2 and every system
suspend logs "HS-PHY not in L2". Check only for a host with wakeup,
the one case that parks the PHY in L2.

Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
Tested on a Motorola Moto X4 (XT1900-6, SDM630) with the sdm660-mainline
7.2.3 tree, in peripheral mode with the cable attached: the "HS-PHY not
in L2" message appears on every system suspend without this patch, and
not over three consecutive cycles with it. Host mode is untested, since
this board runs the controller in peripheral mode. The board binds
dwc3-qcom-legacy, so the same change in dwc3-qcom.c is build-tested
only. Applies unchanged to next-20260928.
---
 drivers/usb/dwc3/dwc3-qcom-legacy.c | 16 ++++++++++++----
 drivers/usb/dwc3/dwc3-qcom.c        | 16 ++++++++++++----
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom-legacy.c b/drivers/usb/dwc3/dwc3-qcom-legacy.c
index d3fad0fcfdac..ba3f70dea4ab 100644
--- a/drivers/usb/dwc3/dwc3-qcom-legacy.c
+++ b/drivers/usb/dwc3/dwc3-qcom-legacy.c
@@ -431,10 +431,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	if (qcom->is_suspended)
 		return 0;
 
-	for (i = 0; i < qcom->num_ports; i++) {
-		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
-		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
-			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
+	/*
+	 * Only a host with wakeup enabled keeps the HS PHY powered and parks
+	 * it in L2 across suspend. A peripheral disconnects from the bus and
+	 * powers the PHY off first, so its link never enters L2.
+	 */
+	if (dwc3_qcom_is_host(qcom) && wakeup) {
+		for (i = 0; i < qcom->num_ports; i++) {
+			val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
+			if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
+				dev_err(qcom->dev, "port-%d HS-PHY not in L2\n",
+					i + 1);
+		}
 	}
 
 	for (i = qcom->num_clocks - 1; i >= 0; i--)
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..e0920da280ce 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -343,10 +343,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	if (qcom->is_suspended)
 		return 0;
 
-	for (i = 0; i < qcom->num_ports; i++) {
-		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
-		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
-			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
+	/*
+	 * Only a host with wakeup enabled keeps the HS PHY powered and parks
+	 * it in L2 across suspend. A peripheral disconnects from the bus and
+	 * powers the PHY off first, so its link never enters L2.
+	 */
+	if (dwc3_qcom_is_host(qcom) && wakeup) {
+		for (i = 0; i < qcom->num_ports; i++) {
+			val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
+			if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
+				dev_err(qcom->dev, "port-%d HS-PHY not in L2\n",
+					i + 1);
+		}
 	}
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 

---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260928-dwc3-qcom-l2-check-e3b55acefb62

Best regards,
--  
Fabricio Akio <fabricioakio@gmail.com>


