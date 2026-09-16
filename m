Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DFF3DB658;
	Wed, 16 Sep 2026 05:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536660; cv=none; b=eLXlcuAIw1XhDck1CwNEVisvUwcQki5C8tSchQUCU8GkvwX7zWmot8bT8sUiZJqp2hZAk95BFSrWCIk3GzSqxqTYUjzbvnJgBj4A+4c0wIL4MpEIWf1+Lbs8aWNM2/pegGlVaI/jDoEiBYZsQtoFjNYCJo+1d5wgXIXdEIY8ZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536660; c=relaxed/simple;
	bh=7kVBSW+iJq7iG0C/gaN+W7UHNDDfaeN9Q8zh7Gh7SjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Eq1nmo97t1hHR28Qwqxs8rxYuMw4SSk2uaq8A/dSlrTDd7+RrxdaHxzZ5JRNmFRs+K1Gx0UpMNkHWr9iJFz9tM00F1pZchA2aoj8ACDVRCeExNyB8mIT3Ma1pqhfF08V0L5tS8PaQ4WQCIKrkJ5Bi5JjDDoNRAX2G0kjWvNEt8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Sep
 2026 13:30:40 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 16 Sep 2026 13:30:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 16 Sep 2026 13:30:42 +0800
Subject: [PATCH v3 5/9] EDAC/aspeed: Free the mem_ctl_info unconditionally
 on remove
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260916-edac-v3-5-23e9ed2fbdf9@aspeedtech.com>
References: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
In-Reply-To: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789536639; l=1565;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=7kVBSW+iJq7iG0C/gaN+W7UHNDDfaeN9Q8zh7Gh7SjI=;
 b=XrA//NurIAmNGbHwpLeqb4LcWk7DgfaoKTQgijaRrS0YYzBv3TbSkIzes5dnSvfOHLbcmVPzr
 3xlUELSmHDZCeV6Pg12WCsojIIrJ7MgjG4VlbtGpSRjalCO8mP/z2M+
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

aspeed_remove() is a driver .remove callback, so it only runs for a device
that has already probed successfully and registered its mem_ctl_info. In
that case edac_mc_del_mc() always returns the same, valid pointer, and the
NULL check on its return value can never be false.

Fetch the mem_ctl_info from the platform device's driver data instead and
free it unconditionally, dropping the redundant check. This also decouples
the teardown from the return value of edac_mc_del_mc().

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/edac/aspeed_edac.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index cd2a6fcca355..352910e1defc 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -343,7 +343,7 @@ static int aspeed_probe(struct platform_device *pdev)
 
 static void aspeed_remove(struct platform_device *pdev)
 {
-	struct mem_ctl_info *mci;
+	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
 	int irq;
 
 	/* disable interrupts */
@@ -352,12 +352,11 @@ static void aspeed_remove(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	WARN_ON(irq < 0);
-	devm_free_irq(&pdev->dev, irq, platform_get_drvdata(pdev));
+	devm_free_irq(&pdev->dev, irq, mci);
 
 	/* free resources */
-	mci = edac_mc_del_mc(&pdev->dev);
-	if (mci)
-		edac_mc_free(mci);
+	edac_mc_del_mc(&pdev->dev);
+	edac_mc_free(mci);
 }
 
 static const struct of_device_id aspeed_of_match[] = {

-- 
2.34.1

