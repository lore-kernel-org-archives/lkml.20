Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E8B5237A1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876202; cv=none; b=pToUyP0j+mt0HWPc9R3E9mju3oYIxTMgBjALWjzaH6KvQmIDD08g7fZxIcPTr+dubJ+PLhvu4dzMcBY8YB0ZdrMS6+dYspCp+Yx9qRx14MO/VvshU0P635o0eq66oCtKrj4MT+bmIwejvMwgFGzSyyR3MyWyIWT8pM+9FcAeDDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876202; c=relaxed/simple;
	bh=+aL1i0lxNCeiEOWt9v5pY59s5NqU4xro0mHTazEQe6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKfSvuHaLclGahzWHUzuGW64ZmH+DCkQughI3fEW4R59kPI8hBWiHe3PflVHHutK9S6Meq1Dkih11WPy1+3mTCdPfPwuG/W4bn0A8tRSYUyzzfOz8VB7c/g85pcPAa2RVvcH/lXoBI0I2Re+9fPbIt+E2Cp/UwsX7Bgj69qjJB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=PGsVk0bA; arc=none smtp.client-ip=91.218.175.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="PGsVk0bA"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+aL1i0lxNCeiEOWt9v5pY59s5NqU4xro0mHTazEQe6g=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790876196; v=1; x=1791480996;
 b=PGsVk0bAf7E2GjwQqubTwMs9wI2e+lsOvv8WHUkijTxzzr4eJxohuFWFwooi1JKCPIlkvz7E
 THa0cu1Uw/bgZBhyKyAu7qQAt6pLVF4E4+yb3KjFRie0uZWqUtolWGXpPe+XQ3H+5ZVzI+vtCcS
 PMQZfLNgMtO3En55v5mq7gjP38EQpJ50Fa9/W1OJgjLuyhaJ6QRPHhRg+R4fZQ2qzsudW2ygMVS
 9nUcauCBEVapvtgturtDIuSW3LEmnS0UTnE3FtCSitvRIK2Ztls05nPaCfKhOL6YMz3yIZUtdFk
 n/gtInFKXAM43YyO144lHaWEwWZoCdIVTxPSHeRc4SzLg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 28778f0b3f296ced;
	Thu, 01 Oct 2026 17:36:36 +0000
X-Mizu-Trace-ID: 28778f0b3f296ced
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 2/3] media: rockchip: rga: Switch to modern PM_OPS
Date: Thu,  1 Oct 2026 19:34:52 +0200
Message-ID: <20261001173610.158931-3-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001173610.158931-1-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new set of modern PM_OPS macros got defined in commit
1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")

Switch to those new macros so that the PM callbacks are always seen by the
compiler, but discarded if not used. This lets us drop the __maybe_unused
annotation from the callback functions.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/media/platform/rockchip/rga/rga.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index b3cb6bf8eb86..f28c93d63760 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -883,7 +883,7 @@ static void rga_remove(struct platform_device *pdev)
 	pm_runtime_disable(rga->dev);
 }
 
-static int __maybe_unused rga_runtime_suspend(struct device *dev)
+static int rga_runtime_suspend(struct device *dev)
 {
 	struct rockchip_rga *rga = dev_get_drvdata(dev);
 
@@ -892,7 +892,7 @@ static int __maybe_unused rga_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rga_runtime_resume(struct device *dev)
+static int rga_runtime_resume(struct device *dev)
 {
 	struct rockchip_rga *rga = dev_get_drvdata(dev);
 
@@ -900,8 +900,7 @@ static int __maybe_unused rga_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rga_pm = {
-	SET_RUNTIME_PM_OPS(rga_runtime_suspend,
-			   rga_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rga_runtime_suspend, rga_runtime_resume, NULL)
 };
 
 static const struct of_device_id rockchip_rga_match[] = {
@@ -927,7 +926,7 @@ static struct platform_driver rga_pdrv = {
 	.remove = rga_remove,
 	.driver = {
 		.name = RGA_NAME,
-		.pm = &rga_pm,
+		.pm = pm_ptr(&rga_pm),
 		.of_match_table = rockchip_rga_match,
 	},
 };
-- 
2.55.0

