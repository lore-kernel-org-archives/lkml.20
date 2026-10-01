Received: from mta1.migadu.com (out-76.mta1.migadu.com [95.215.58.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2C3C09E5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876199; cv=none; b=P/h5JMLQrCMwDCUzBRNOPKZ3//+1ifZtS/5NvrzqytrRqIPcIPM7Ax5rhVhFaeMSqeuTnA4XW62U2QunCI2s9hzr4OgnQtc3uPfLJDAMZcB1HQipuc/mqSpXnBjTP6oIGDF6RNLxGjl+ZYaZX39HbylZaj6kGls2YosX+iRoSzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876199; c=relaxed/simple;
	bh=3q9hkY6d+6TpF0+232lr0z77rEQqbqqKqfmC0Qvs/Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9Qm4kN8eCk1++X9s4zLUO3QOxqO9onKiAObQnhJSTE+armYJvRdzu5UdXGT8wHrkUTJ6OfhCR0bBnaLqh9Vb54spednO6V9ZT1MT9BieTHqmG8VvaAK3dmk8AKmCCNMgmbysy56j2xNDR/lVkyMJMGvoeXuvC5pLL6OmBuiWFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=cTz9miQ4; arc=none smtp.client-ip=95.215.58.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="cTz9miQ4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3q9hkY6d+6TpF0+232lr0z77rEQqbqqKqfmC0Qvs/Qs=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790876194; v=1; x=1791480994;
 b=cTz9miQ4ycBVTc1cjtYvm5bXA7DeDx+Ua2ylGPR02uo15KHqJ2GsA3G7ZTk9qgXWi8ItoHjq
 f7P3IDWP4WcEoSH2K1AR8EdHLy3XabYEkXQeDniQdceQ/bKtbG2b0h+Zo8p7eYBcHf/Kpo1Sq4G
 vaB6whsEnJvB4V356zqLw4YfMTUtyPTofWF6hg6yYnxVi+gM0L39cSHtubbAfrv+KA94FRWh+FW
 tetbq2vhFvOV9IbuUhREKyNylclxvEnOkuXgd3BBopELOdNBxygYEM+HSRA+hDfUpv5OmDNZXMe
 x+W2bll0gD3K8ErMn/lCCF5F5r2wQUsHtL7YlhZmuZ5BQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2a51c1c8e8fa7f37;
	Thu, 01 Oct 2026 17:36:34 +0000
X-Mizu-Trace-ID: 2a51c1c8e8fa7f37
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
Subject: [PATCH 1/3] media: rkvdec: Switch to modern PM_OPS
Date: Thu,  1 Oct 2026 19:34:51 +0200
Message-ID: <20261001173610.158931-2-diederik@cknow-tech.com>
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
compiler, but discarded if not used. This lets us drop the check for
CONFIG_PM.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 061281f903f3..936abd92f703 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1877,7 +1877,6 @@ static void rkvdec_remove(struct platform_device *pdev)
 		iommu_domain_free(rkvdec->empty_domain);
 }
 
-#ifdef CONFIG_PM
 static int rkvdec_runtime_resume(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
@@ -1892,12 +1891,10 @@ static int rkvdec_runtime_suspend(struct device *dev)
 	clk_bulk_disable_unprepare(rkvdec->num_clocks, rkvdec->clocks);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops rkvdec_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NULL)
 };
 
 static struct platform_driver rkvdec_driver = {
@@ -1906,7 +1903,7 @@ static struct platform_driver rkvdec_driver = {
 	.driver = {
 		   .name = "rkvdec",
 		   .of_match_table = of_rkvdec_match,
-		   .pm = &rkvdec_pm_ops,
+		   .pm = pm_ptr(&rkvdec_pm_ops),
 	},
 };
 module_platform_driver(rkvdec_driver);
-- 
2.55.0

