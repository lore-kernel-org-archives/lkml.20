Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699737;
	b=2FNZDtnQ+acIaMtpvFy9Xg/FyU809kBs4BciEpiIGvD/pP9K9DQnlt0kFfJBOMXQaYQg
	 8dhM0lCX3gNk/nKHn8GkyGLA3rNOhRkmbeiBUz8ok/z6pWOziaBF8FX5ImDAV+2spdBl+
	 jk6fBce/6mZxMak9Hq6jAPErjtRngpoc4RDhaDRcs3CslfdcEaGBDqxu8j0kPLQ4F3tzF
	 zvPsYzSv9tkMmuhu2uIFsSlAQseaPFWH/sznt3+VcxYpKv+pShG0QgokXO1eTAunv+xw7
	 3XbnP3boN2BhETJknJUFx6nFWWILuZE9L3yt0XBm6GUbIfnhUKZ4zv2ZLFWBwMwh6Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699737;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7FBJBX+TSMIjchepkURm3wvyuFcqE4x4JF/M3QAuFCo=;
	b=TpTpet01mBoxRw034cRI/t1USblAEMq1cmxlVZ0qz1JlRucbb21HXY6cTlgztZOzSJRG
	 arNLiDE3xHCEcHsm0q7fd76TSZdeDOab8dDQ+6fjDB4wCKMGuYI26jt6Q/yambQnTveyl
	 zw/U7O0vkkr+761MTp6i+7puhx84R0/ljpIDkFUsqT6jHji2RRKdrXmNTpFiBLcgEODLP
	 ilAgyZcxf+OplgmHv1VIEAOl4chLR+nRiZIDSQY7j8tlfQxF/cciclazRGZ3zPBCtrltE
	 e3dudOw4ZPTV0cURIAK3pXDLetc6cFAfIK0+bzM1XriVleFm+RNHg7+XddbpRMFUcCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivmq69BZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C5560A6F6F;
	Tue,  3 Nov 2026 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivmq69BZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A851F00A15;
	Tue,  3 Nov 2026 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699737;
	bh=7FBJBX+TSMIjchepkURm3wvyuFcqE4x4JF/M3QAuFCo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ivmq69BZHe8IaHA6fzWc1vimf4kwoldppY/Zdt/ucDygkx8fd178b9JcmXxyjr6WF
	 COXtP5jO1dDorH7dcs0cXfqHEgggJt62jdohOKFAiWMDX7vIYvGjV7i7GlwvFJNg30
	 wAOLuxg4kOUL94JKOUdEyIor9Rd1jBIubuQBhI+/0iYf8TpQ4UlnCko94dTxApbn3x
	 bCT3mpb7g1p6cWRu8XEvrFhG7sc3Ah1smxGI8Vmbw0YHu2gJ4rzc4SuGSBxRq1808x
	 e0woGyxR5J8sQ2Moa8r2xU4XiMWXpyCIp+W9WHMLt4MFkYTQpuxS8KafVGU0szegm6
	 WqGIjApjN/rfg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] soundwire: qcom: Disable runtime PM and avoid clock underflow in qcom_swrm_remove()
Date: Tue,  3 Nov 2026 09:53:51 +0000
Message-ID: <20261103095445.81414-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103095445.81414-1-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the controller is runtime-suspended, swrm_runtime_suspend() has
already disabled ctrl->hclk.  If the device is unbound in that state,
qcom_swrm_remove() omits pm_runtime_disable() and unconditionally calls
clk_disable_unprepare(), triggering a clock enable count underflow and
leaving runtime PM enabled.

Resume the device before removing the bus master, disable runtime PM,
and only disable ctrl->hclk if the device is not runtime-suspended.

Closes: https://sashiko.dev/#/bug/linux-e26e04cd-3dec-4a3d-94e6-f45403c4bb57
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: Drop Fixes and Stable tags

 drivers/soundwire/qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 29130745c809..a50efdfc3a6b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1788,8 +1788,13 @@ static void qcom_swrm_remove(struct platform_device *pdev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
 
+	pm_runtime_get_sync(&pdev->dev);
 	sdw_bus_master_delete(&ctrl->bus);
-	clk_disable_unprepare(ctrl->hclk);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		clk_disable_unprepare(ctrl->hclk);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int __maybe_unused swrm_runtime_resume(struct device *dev)
-- 
2.56.0.385.gac671c819a-goog

