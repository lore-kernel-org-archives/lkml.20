Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C9B355F35;
	Fri, 28 Aug 2026 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908750; cv=none; b=NnVcd2A7nj9qq4L5PnNOa65pl0Lod61R2SJSC3DmRXTma+Sv9cIbj8ZKIWZTe9az4ftdQuw8XFleOhg14qDy0oQFZfKb/5YSqT3g1RSpEPejWAtg31znUm2FuR7ejlXuM/TSbY3n3Ojs7mKnemomxUrnb0VjMK2H6BehKY5xEOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908750; c=relaxed/simple;
	bh=UJYFSOjCyD6OpslueE6ZnfaacQB+ddfxRIuLZ9r6K6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TGic65yOaNfTBkdnZfPpIwWz4X7hRoS39OfPEU+i2MV5TSJhfQp7TNtmfx39mYrPuprGRwZjuJJLEqeg3l5xJI1dtquKOe8VgoMkn89a6RnBpymAv1Hkn02GSH/tvTMEbjh63v5KQTu4c1adhAUb4NBhiIeO2OCYpo1LfvBofmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAAXGzmCUpFqrkh1Bg--.64313S2;
	Fri, 28 Aug 2026 17:18:58 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] phy: qcom: ipq4019-usb: Propagate reset operation failures
Date: Fri, 28 Aug 2026 17:18:56 +0800
Message-ID: <20260828091857.8581-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAXGzmCUpFqrkh1Bg--.64313S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4rCw17XrWkGFykXw45trb_yoW5WFyDpr
	W8GFWft3ZYyw4fWa17tw45AF1rWFW3tr97t3yS9ayrCFnrXw4jk3WxtF90gF95GrykGFW5
	GFs5JFWruF13urDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr
	1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbtxhJUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The IPQ4019 USB PHY power operations ignore reset assertion and
deassertion failures.  Their callers can therefore publish a PHY power
transition after the reset controller rejected part of it.

Propagate each reset error and restore the reset that was changed
earlier in the same HS transition where possible.  This is an RFC
because a failed reset operation can leave hardware state uncertain;
feedback is requested on whether the proposed best-effort rollback
matches these PHYs.

The issue was identified via static analysis and manually reviewed.

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 46 ++++++++++++++++-----
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
index da6f290af722..8c1834cd6a8e 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
@@ -30,7 +30,12 @@ static int ipq4019_ss_phy_power_off(struct phy *_phy)
 {
 	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
 
-	reset_control_assert(phy->por_rst);
+	int ret;
+
+	ret = reset_control_assert(phy->por_rst);
+	if (ret)
+		return ret;
+
 	msleep(10);
 
 	return 0;
@@ -40,11 +45,13 @@ static int ipq4019_ss_phy_power_on(struct phy *_phy)
 {
 	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
 
-	ipq4019_ss_phy_power_off(_phy);
+	int ret;
 
-	reset_control_deassert(phy->por_rst);
+	ret = ipq4019_ss_phy_power_off(_phy);
+	if (ret)
+		return ret;
 
-	return 0;
+	return reset_control_deassert(phy->por_rst);
 }
 
 static const struct phy_ops ipq4019_usb_ss_phy_ops = {
@@ -56,10 +63,20 @@ static int ipq4019_hs_phy_power_off(struct phy *_phy)
 {
 	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
 
-	reset_control_assert(phy->por_rst);
+	int ret;
+
+	ret = reset_control_assert(phy->por_rst);
+	if (ret)
+		return ret;
+
 	msleep(10);
 
-	reset_control_assert(phy->srif_rst);
+	ret = reset_control_assert(phy->srif_rst);
+	if (ret) {
+		reset_control_deassert(phy->por_rst);
+		return ret;
+	}
+
 	msleep(10);
 
 	return 0;
@@ -69,14 +86,23 @@ static int ipq4019_hs_phy_power_on(struct phy *_phy)
 {
 	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
 
-	ipq4019_hs_phy_power_off(_phy);
+	int ret;
+
+	ret = ipq4019_hs_phy_power_off(_phy);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(phy->srif_rst);
+	if (ret)
+		return ret;
 
-	reset_control_deassert(phy->srif_rst);
 	msleep(10);
 
-	reset_control_deassert(phy->por_rst);
+	ret = reset_control_deassert(phy->por_rst);
+	if (ret)
+		reset_control_assert(phy->srif_rst);
 
-	return 0;
+	return ret;
 }
 
 static const struct phy_ops ipq4019_usb_hs_phy_ops = {
-- 
2.43.0

