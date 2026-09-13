Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48343EC835;
	Sun, 13 Sep 2026 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304037; cv=none; b=bzZRwrdvoqxW+svLJa/QrWE5azSZUD1TWJ+nHfEut4tLiraJMlz8802WJ/M42F7qc6chplZUHdXtwo4Od7BVQTpbV+2iVTmp1uyVlL2U4oszpL5sMGZkuB7myf2Is0AS9jIh+Ue7dQWPMEfkp3fiyjvNeFtxUzow3djOiZCld08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304037; c=relaxed/simple;
	bh=Qc9SZQmB2pAE2xJsmzYzAmCAQhYfLKrysJL4Vs1vbOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vDco63JzQPuAshcyhMAUj3xM7d4zV6wJtqOHVRKSWmCaj4F7Qj74tQ3V4QBoqfUHnjiJCzBQvtD0h5piYFpwXbuCP1I81A6Fb9erND0pb4rTvfagPQWwfjBLBeeGeE9lAVkH6dRUuqPZbjKZRQwDbno5NMffKdQA7GAEN0kE1r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+3b5dhu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+3b5dhu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 058B8C2BCC7;
	Sun, 13 Sep 2026 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789304037;
	bh=Qc9SZQmB2pAE2xJsmzYzAmCAQhYfLKrysJL4Vs1vbOU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=B+3b5dhu+dnQjM9FBpfGt9JbXmODd7aGpSd9Ty6zMw3LsEjhSUDQJnhnwAdtJ9hMS
	 bFh6lf8n1aq+tCJuyFc145aIVhmDVdRKc8surJayClIazn0zmKiIRN4q+lYnX5Xq5k
	 p6HTSGlc0QJKajpVtnQgUJs/cuMxjLKWuG2f/dCB4cYfjkoU6Kw7clchjcrT5auo7h
	 56r6oSaPrEpFpt7AA59/dymeE+j2t7DRWt1d6UzoiguDjIPlQTe9XrDio6YbvKO7OH
	 e4rNYncgeuCDKm09SVC6YYvdEmKyygddO9LCxAZG5s1oRhPbQy2AOOWhQu6QJJDTyN
	 06hwFWhyUKYJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77B2C88E65;
	Sun, 13 Sep 2026 12:53:56 +0000 (UTC)
From: Maria Lisina via B4 Relay <devnull+sekoohaka.sarisan.gmail.com@kernel.org>
Date: Sun, 13 Sep 2026 17:53:53 +0500
Subject: [PATCH v3] mfd: intel-lpss: Fix DebugFS initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOCcpmoC/4XNTQ6CMBCG4auQrq2hrRBw5T2Mi9LOwCT8pYONh
 nB3CytXuny/ZJ5ZBUMgYHHNVhEgEtM0pjCnTLjOji1I8qmFznWZ18pIGhfoZT8zSw/Ns0WWgGi
 KKvdK14VIh3MApNeB3h+pO+JlCu/jR1T7+pOLSipZGeOapkREV9/awVJ/dtMgdi7q/4ROhFX2g
 hYL50rzTWzb9gGIcA0c9wAAAA==
X-Change-ID: 20260913-intel-lpss-debugfs-eff3580d1295
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2621;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=OVkJMMmF2nNAP+pSJ+NbAfwUA1hhsgKU2CZw5r4W0AY=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqppzjEw0hXTFqWpVN3rqwYCWeMDGy5njMudwbP
 clhpm2zHJGJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqac4wAKCRAT637qmaOf
 oj8DD/9tdUlqGKBOVJOZG4JdnJe8DbuTY4weyNPBtJK2jgwUk9Y9V4cO5dVjlcFpTAv5P5DFTZE
 yvzbPS34JmdH216m7GcPWv9+gzPgf3w6XOWE52DbxSJFPBYFpcNcJABtwO4Fu9/4EaxnJn0o7M+
 d8OSS0nZPFw+COlkjgOv/wNBEB0oVTHLNes9NbdRtqw4Rw5I96pCVDBNpir9iZ7NAY92BxuEKUY
 MPumWSoVcsSy7OeIR5CN+ALgJ3uZavtDA//FPQb3NbmKVA/KTgBtDsgjuxHjw70p3R/DgzhjAXg
 hNrMYWP5JMHnY1sBv4aKNJ+iHFzKFgKDJFppXXZeyGr1B5+hHqjB2vSI0rthEp2f0xmQOrQwKKU
 faiwbSUxqrQYiay9upI0Cj+bSDYGRBFF1RtUnBfP3ZijPKT7VKmtfbx0RRGs0v7fTL5QZnG5Ma9
 GyOmKyxBfIIIeKG/W4nETwoK2U/HZIzsl6MWaVB4v5RVrrOrmDCVlPp/FJrpiix7SNLb/mi7P3C
 ueVsUUeNhXb00LAhLbqk8ZaQyteiwmy7aGa7En9ZH5ex39gWAiq8uE+aRjc3zvgmo6fqQjV5X28
 hwv3rJszGiq5pE6VNy2PD1OBGQWfhIjRetMLudcKKewEIlTcAsFdPOJ9yXhRjIqq46BhDEVpsYE
 H5qQ37aacTcYQjw==
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

This patch adds proper checks to intel_lpss_init() and
intel_lpss_debugfs_add() functions and removes warning message.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
Changes in v3:
- Fixed commit name and description.
- Link to v2: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc63@gmail.com

Changes in v2:
- Fixed function name in comment section.
- Link to v1: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com
---
 drivers/mfd/intel-lpss.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 63d6694f71457b2e09d238af0a9bfb897a169a64..c2cb58c0f98a996d5a2718956092e74139f2a286 100644
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
+	 * so intel_lpss_debugfs_add() exits properly.
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


