Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F24838DC71;
	Sun, 13 Sep 2026 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302914; cv=none; b=eIGHYXlSyty8eM/2OKKGtcWPZguVL6+PGDkJ49WzCv0N4VKdtLqW99mr4UJMYgQLTOzHrrrT4L73CpsOqLBXLFs2Dw2QMber87eAIGIxSSpGTrUH6EnPlL0gS+xZBd2T2O4buwBzowcMiQ7BF4hTV11RB4iomslXj25TRYObIuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302914; c=relaxed/simple;
	bh=/VQm7rDy+l3Yn2+cH1EHSNLN6ynZmwrJiO1mQrqiOQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kBu0C/fIKwyvDk3tAq7Js4t7lQRgKZkFqO5sMmwXLKAGM9q6ZOHLCOOpkLwSiexyyGx9tnN6kih9Jt1/WidMdAv/ceZnWabdK5BgfJHeVxLPtiOpnxEz5HJcxm9/tAy1cjepnQAebPjZnVGf5uvlYCoxWFw5F7BCBSZN6zAPPEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIB/jOqA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIB/jOqA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FADCC2BCF6;
	Sun, 13 Sep 2026 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789302913;
	bh=/VQm7rDy+l3Yn2+cH1EHSNLN6ynZmwrJiO1mQrqiOQE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CIB/jOqAcJL3hGRTkJTYVLH2GwZ+az3L60bqYb6JceHRTrvcRtR8FuMONb6LK5Nf2
	 lvDl+qdro4pWXnrQ/kQV5GlGzfSgG1dhHJM529wxHAs6g0W/bzcjs0S5xZY1tJCJ6f
	 HSmFC9ZCC6wD1iXq7guh2Yn9nrijfTxEHLwsEiA68VKsTo3t0Ik0gJ0o04OyRcTsOG
	 uXAGT1oqIrY4h6mq5B/GtgIRz3idxkpw7CtQw8uhwN+yHbjRyWo+z5whR5+uxwPqip
	 1EwFmfI8GSZzBmBUS/WaXcDaGREB67ZZi4RMcLkt5lhkYRp0QxBEtiNx7AhIzvsP1y
	 3CUq43cjfpfHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE9BC88E65;
	Sun, 13 Sep 2026 12:35:13 +0000 (UTC)
From: Maria Lisina via B4 Relay <devnull+sekoohaka.sarisan.gmail.com@kernel.org>
Date: Sun, 13 Sep 2026 17:35:10 +0500
Subject: [PATCH] mfd/intel-lpss: Fix DebugFS initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH2YpmoC/x3MQQqAIBBA0avErBtQo6iuEi0qRxsIC6cikO6et
 HyL/xMIRSaBvkgQ6WbhPWTosoBlnYInZJsNRplGdbpCDidtuB0iaGm+vBMk56q6VVabroYcHpE
 cP/90GN/3A47qc8dkAAAA
X-Change-ID: 20260913-intel-lpss-debugfs-eff3580d1295
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=FnouczTsx4tPzXBDK+MbJJJlKWaBRjxUYVgKqRzth3E=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqppiAr1TIjLCVF5PHCAA8MVyyIgwA54tG3Dtw/
 fUvGEbjypCJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqaYgAAKCRAT637qmaOf
 oolBD/49Qua1T+BcMnmIDxFr8liPm9Sg9sz2rubCBcu3R9Y3yFfqo7xLmdkjwho6cEFtv2bvVnn
 HtoRqvsrJXpxc/1Wux/cJGqr9H0/fTl+HDP0ASyWF4hNvXk7mchGANyBNWsYb786Trt4DCfXC91
 69biuX0MMWhHz87CU5plO4nEA05vFrChsnvpKp5y8NBYAuISIPUAtUi2JWYaWPfiQf2OljRaIHV
 BVbBf11I9dEgK2aURhAI40XEgdNNIxu7hA5YY8AFisgBtwYrtve5K2fkfJ7G/Mz2s78vaqqvVpT
 9AIrujq5Z8ravjlCvPq7Ue+31GwANL7gzLW0UbiKVMlQW7vDd1mfsorOK5NZytJckT7XPf0C1S+
 nsZoh/D2xZGosVqodn1uJABy0L9YQxQTJagPbqdyzLAOUGldWPVbVOiKXWO7KqMZSpHnnpTVrcC
 Q5bWrGsMgCFQ4c87F5zypl2mx8MXW9k8RHZMrJkUOMrpwWZjliuDVBSULlJ3f+DEHET62hMorl4
 ganj7KD64C/JTV6fHLtVwlpa0mX1p6A1PUvlqP5xmeNz1eOQWdVHSQg2VQHEhJRxxTxoatgOjJ1
 l2aiwp2Em80q1osKXja5MrTWGuOdIv0Rzqbxc0ikHAEwa3s/ZyMq9q+k+k1HhyS4ZlXIPnHxITP
 a7YtWazRvIRNIYA==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2
X-Endpoint-Received: by B4 Relay for sekoohaka.sarisan@gmail.com/default
 with auth_id=1030
X-Original-From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Reply-To: sekoohaka.sarisan@gmail.com

From: Maria Lisina <sekoohaka.sarisan@gmail.com>

The original code defers DebugFS check with unnecessary warning message
which also appears when DebugFS is simply disabled.

Therefore it spams dmesg with these messages:

  intel-lpss 0000:00:15.0: Failed to create debugfs entries
  intel-lpss 0000:00:15.3: Failed to create debugfs entries
  intel-lpss 0000:00:1e.0: Failed to create debugfs entries
  intel-lpss 0000:00:1e.2: Failed to create debugfs entries

This patch adds proper checks to intel_lpss_exit() and
intel_lpss_debugfs_add() functions and removes warning message.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 63d6694f71457b2e09d238af0a9bfb897a169a64..51550c1835c695b9081b33c67f81c19fee5e1652 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -146,9 +146,12 @@ static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
 {
 	struct dentry *dir;
 
+	if (!intel_lpss_debugfs) {
+		lpss->debugfs = NULL;
+		return 0;
+	}
+
 	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
-	if (IS_ERR(dir))
-		return PTR_ERR(dir);
 
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
@@ -432,10 +435,7 @@ int intel_lpss_probe(struct device *dev,
 		goto err_clk_register;
 
 	intel_lpss_ltr_expose(lpss);
-
-	ret = intel_lpss_debugfs_add(lpss);
-	if (ret)
-		dev_warn(dev, "Failed to create debugfs entries\n");
+	intel_lpss_debugfs_add(lpss);
 
 	if (intel_lpss_has_idma(lpss)) {
 		ret = mfd_add_devices(dev, lpss->devid, &intel_lpss_idma64_cell,
@@ -539,6 +539,13 @@ EXPORT_NS_GPL_DEV_PM_OPS(intel_lpss_pm_ops, INTEL_LPSS) = {
 static int __init intel_lpss_init(void)
 {
 	intel_lpss_debugfs = debugfs_create_dir("intel_lpss", NULL);
+
+	/* Ensure intel_lpss_debugfs stays NULL on error,
+	 * so intel_lpss_debugfs_add exits properly.
+	 */
+	if (IS_ERR(intel_lpss_debugfs))
+		intel_lpss_debugfs = NULL;
+
 	return 0;
 }
 module_init(intel_lpss_init);

---
base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
change-id: 20260913-intel-lpss-debugfs-eff3580d1295

Best regards,
-- 
Maria Lisina <sekoohaka.sarisan@gmail.com>


