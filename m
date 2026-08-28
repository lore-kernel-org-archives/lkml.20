Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF72326B742
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908483; cv=none; b=WNe0A16CTrGSob/NfHbVhNAmTvu0tSUpwZsQfj+eUTNVjPzksTJ2yUlOCCdoaJrdelcEw9Uk4YZot9erf+e8EhwLA33B1jznhTi/NtdnQDwaBhIBqBPaQGKjaQpbjvTNqoIlcigLXJTUrTn+03/fy9Hu4O6GOjHgllekpDkQaLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908483; c=relaxed/simple;
	bh=ymqJZIWZ41LCbFZKBpop+VYcyeuTRq274vUKpDF1tJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PsyRB8+bASOaqie8HE1SGzd0h/1xemhTF2P06GYGlfa77/wVPa6iK+WWyHcxjHfGqWb58HrsPPsfuDnYspbDk6Yt0mhNqSL+YkU+lTVuFdexJJ4xeOf75vZFQO0BQOatkLunrENhimTnqqDcUf7JIuXNqZnxHNoWfb8/JdZSlCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowACXnDpxUZFq_zN1Bg--.54465S2;
	Fri, 28 Aug 2026 17:14:26 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/meson: dw-hdmi: Propagate reset failures during initialization
Date: Fri, 28 Aug 2026 17:14:23 +0800
Message-ID: <20260828091424.6375-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXnDpxUZFq_zN1Bg--.54465S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF17Kw45Xw45WFyfury3Jwb_yoW5Zr1fpa
	18Aa1UKrs8Ar17GrW7Aa1FyFW3K34Ikry7ArWjgws7Cr1xGF45JFy7KFs5try5uryUJ3Za
	qa1fCws8uF1YqrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUFg4SDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

meson_dw_hdmi_init() resets the APB, controller and PHY domains before
accessing the HDMI block.  All three reset results are ignored, so bind
or system resume can continue after a reset controller rejected part of
the sequence.

Make the helper return an error and propagate it through bind and
resume.  This RFC intentionally leaves earlier HHI programming and
successful resets in place on failure; feedback is requested on whether
these SoCs require an additional rollback sequence.

The issue was identified via static analysis and manually reviewed.

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index fef1702acb14..1b55d1c89f62 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -595,9 +595,10 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
 	.cntl1_init = PHY_CNTL1_INIT,
 };
 
-static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
+static int meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 {
 	struct meson_drm *priv = meson_dw_hdmi->priv;
+	int ret;
 
 	/* Enable clocks */
 	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
@@ -606,9 +607,17 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
 
 	/* Reset HDMITX APB & TX & PHY */
-	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
-	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
-	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
+	ret = reset_control_reset(meson_dw_hdmi->hdmitx_apb);
+	if (ret)
+		return ret;
+
+	ret = reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
+	if (ret)
+		return ret;
+
+	ret = reset_control_reset(meson_dw_hdmi->hdmitx_phy);
+	if (ret)
+		return ret;
 
 	/* Enable APB3 fail on error */
 	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
@@ -641,6 +650,7 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_MASKN,
 				       HDMITX_TOP_INTR_CORE);
 
+	return 0;
 }
 
 static void meson_disable_clk(void *data)
@@ -754,7 +764,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	meson_dw_hdmi_init(meson_dw_hdmi);
+	ret = meson_dw_hdmi_init(meson_dw_hdmi);
+	if (ret)
+		return ret;
 
 	/* Bridge / Connector */
 
@@ -819,11 +831,14 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(struct device *dev)
 static int __maybe_unused meson_dw_hdmi_pm_resume(struct device *dev)
 {
 	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
+	int ret;
 
 	if (!meson_dw_hdmi)
 		return 0;
 
-	meson_dw_hdmi_init(meson_dw_hdmi);
+	ret = meson_dw_hdmi_init(meson_dw_hdmi);
+	if (ret)
+		return ret;
 
 	dw_hdmi_resume(meson_dw_hdmi->hdmi);
 
-- 
2.43.0

