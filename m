Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3634432E79;
	Wed, 14 Oct 2026 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971212; cv=fail; b=SIn4Y7arNdrxjiUq4+gx35cm+Bmv4zZY1YI3dQ6Dw676nDtAajJLD+arStqAf9UXJ070lAuGklcJCGXbtH2+30+JxH+Huols7L3ygyWKAjhYsUACHpstwQynFPdodh53dNgT8sTZhbUIaBjfRN+IyjOKDql+aIdeL4jq44P+wfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971212; c=relaxed/simple;
	bh=RrkHMAazvc354WpVJN2PSa7PcKFATwld7zsS4UKKydU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=hUirXAsQ7rEu2fGuLWEJuQmnck7snbq5zx6e+CYf9C2lcDASWaPuxUMOPGrn9tgCBddnr7BDHU2NiQ3EJwst443gAIuUwRkz++q48RoY124ILkk0b7hrZJghfsJLqeWlFTylSfF8/Ill0TPDK+kuKJj3JHqQAUzCDff++LaG3vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SOsfsiIq; arc=fail smtp.client-ip=52.101.69.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SOsfsiIq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OC5ClqvlOsUyvkpu+PKsTNH1JljjjNKvvVyaovsdO9llT41liZl7npgOqdcYAkSJGs09J+V6Mx6evCLe8qxI2XiMtyZu3QmR40zUiQYSUG3QlnlEzhWlnYJHwGsGdRLg6MYET88tfMvfQaob60HiuuE/LUOJ0VHYWaP25ZSHegpWs5OB0tqZnph9t3mogf6Hzu8EwvIa8k99u2SniAhKh3oY4kibuxsZ0UDypB9FIXBAPty8lCl0wfIZbA5LwEA8pow4+bnUDnb35ljTJHPg1Yus6mBRcGKlUM7zr/+6gxA7BXdwGipGOyBZTdsYB9ojwUaqLF0gLEENy6ymaOr2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXPfklaqyHZImYhDlc9q/ZZbPNBUmbDqJ9G8k0F4vjI=;
 b=EBdt29fYG/vL31Owj1ZiVqVNaX0NEI4RCa9JA/wECJihfJldVStA9UApGo3jumdt0th2FY//N62biNWI/O/Y0n5UwuyOziXLUdJY/Dtr6rVcBKOzkPNOup7fCTA/Onfi47VnhHvC4ltj+IJ+Sw/3F33wIBJzHIA3qyOlXDxkCjzpCY9PyOA62N074t65ds9nGI+d3mK+8VNDd6BgCXG2nSVoQswtbJJINTb0EDNTt5hmcIvRQCXXLnAwgLcZU/w5z1Fln7wYPsYKqtcE5L3ureBg5xXiVwoAEZrtwNyH9NNT3KrNOPT5gJvjeiCs0ur38w6yytw5R/ge+TWHDs2Q9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXPfklaqyHZImYhDlc9q/ZZbPNBUmbDqJ9G8k0F4vjI=;
 b=SOsfsiIq6+dPBzBa706rwkqvF3FFRjxbk6+y+5bb1sLA/QA1sMrNTfQmp9aIsP6z+b1NWQmBQgEzw8ILmbVAUTeVcLC94xPd/nomW5lxvV1OpEyJgIyGq5ig3kS7vFbhzYqX9a1DjUiP1bIl2bGE3cQyIvSKcGFY6cibccJVvs26YuDJ/yMkxDrCsA6i5m+vhEtI2Vu6TlJXwFlbWtJiQOFnH/HqE/OIKgbgrWzgkgoGQzDLc5CYAONXW2yk2K4AUKqcHpkLRmcDfblqaM3BhuJb11ez5x3033Jc1mvunTj/Z+x+yitfHU2FX7iWAl40w7U3Lfs+ZIU9nkl86VGgLA==
Received: from PR1P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::18)
 by DB4PR10MB6918.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 09:46:46 +0000
Received: from MI3PEPF00008552.eurprd05.prod.outlook.com
 (2603:10a6:102:19f:cafe::96) by PR1P264CA0031.outlook.office365.com
 (2603:10a6:102:19f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 09:46:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008552.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 09:46:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 14 Oct
 2026 11:47:13 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 14 Oct
 2026 11:46:45 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 14 Oct 2026 11:46:42 +0200
Subject: [PATCH] usb: dwc2: wa for isoc packet tx fifo flush at periodic
 frame boundary
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261014-dwc2-fix-wa-isoc-v1-1-f261ce0852bd@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAIFPz2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0MT3ZTyZCPdtMwK3fJE3czi/GRdM+NEC4NUS2NzAwMDJaC2gqJUoDT
 YyOhYCL+4NCkrNbkEZI5SbS0Ax8SX4nQAAAA=
X-Change-ID: 20261014-dwc2-fix-wa-isoc-63a80e937000
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Fabrice
 Gasnier" <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008552:EE_|DB4PR10MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: e9215d52-47dd-41d4-553a-08df29d80fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|34020700016|1800799024|376014|3023799007|6133799003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zuR+QvpRKeJgCM2YiCTj8NnEOKaFwvhuptUfE6dZ9rpGNsfCddyE5mTqLZLQirLsprgO3N4kT82NrSmVln02JKTblkOhMisijlQ2U+bV7cLqvYJatoLFsQcXEd1jy2GxSXCrG0QraUKG4tvWHxDck+RItn9fhjPNeZLu8yUGDtl/MKK57Crk8SpibK67e0Tt/VCy5Ju+r5rEKwTAFJjiQ9n0de79Eglu33LyDzEg6o8IQTw4spkJhgQyYP9BeH1U3VoMUveflrhJnLkspnyD/wGjMilwlEAw3+aIH5twC/gui4gBcdl7FVFKxa7DBGiSD/iw8uGANtl+s1tsFQ60SdIyinqa5o3X/t4NTYPRRwJJckE+BsWwtPNegpVAiWmd7FvdUNU1cvVpXqqz4cWVo6OFbZW85oDjppkWGomk6FN6a1QbKH2okqbVK0ZuYIQMWFTfvwBG8le5Nvyw6ZDWpXG/Z1jItGS3uuJmBJn7aCmG5Je9Ht5ZzuCdOllO7PuYUtZFEIRw3t5qDau3ku+EJRlwImXtM9w+wo2sBNG4FLhtfdgiXYch3VxSWvaz76fVHLFcbaYh5T3BC9tEWEcQGauJZQy8bma64QB4HBZguSSe4+FlpfH/KjylOln0T0q62pF/BgHxOu5DgUHtZWIXFrwx/o18efoq0HXvcWgJWUH4Ao7Wi8QJ2GmQ1HbU2/DxgY4vE8khbJT82kyI0dTTEw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(34020700016)(1800799024)(376014)(3023799007)(6133799003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6IrR+7EXNS7iYA5PVY+bHU7gk/lZgNy6Xn8kjnZ7DzcLFw2L48RbgA8nHSDJ9nPrnKA64/vYGI/K3bJiQFF071UZomlR65e3RI21S87PPLt+qH4erkTF86Rw2F8wBErfUryjEA7qcjPUf/d2r7wj4hE1EW+uzukL7DFpYR6eDYW5l54d6QbYm723V9V01bhuUcu1MVWZzb+VbCv1CZbEH38v5qis4yFdl3GQTpn9CrFMvvizbL1iuhLHNRAl1FKq/r1ecDnVUY46Q78etNHu51tW+mgGeKQRqHHXyqZnM3AjJqkx2K5Go+bnNYdj0bwePoBCF55ZpmdkfLY+/PRm0TMbvvyE293MDUxvzbBQ9FCGf2gcwiiH6LmC+tildUAr3VcfARjHwnjrdGHrwIz7lHDn+E2ppH1Bp+3WU/hteCcr3x9hHjXqAHyuLtW+OgyY
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:46:46.5261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9215d52-47dd-41d4-553a-08df29d80fdf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008552.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6918

If an isochronous packet is still being transmitted, when the end of
periodic frame interval elapses, using dma desc on dwc2 controller,
the device wrongly flushes the pending packets from the tx fifo.
This can lead to a huge packet is sent on the bus, leading to the host
finally reset the bus, and re-enumerate it.

Workaround it by tuning the periodic frame interval limit from 80% to 95%,
on the affected cores (2.70a to 4.00a). It makes the issue very unlikely
to occur.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/dwc2/core.h   |  1 +
 drivers/usb/dwc2/gadget.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 767251aa1aa3..3bce41b4dfa6 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1108,6 +1108,7 @@ struct dwc2_hsotg {
 
 	/* DWC OTG HW Release versions */
 #define DWC2_CORE_REV_4_30a	0x4f54430a
+#define DWC2_CORE_REV_2_70a	0x4f54270a
 #define DWC2_CORE_REV_2_71a	0x4f54271a
 #define DWC2_CORE_REV_2_72a     0x4f54272a
 #define DWC2_CORE_REV_2_80a	0x4f54280a
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 102169b40419..9f02075ba15b 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3449,6 +3449,19 @@ void dwc2_hsotg_core_init_disconnected(struct dwc2_hsotg *hsotg,
 	if (hsotg->params.ipg_isoc_en)
 		dcfg |= DCFG_IPG_ISOC_SUPPORDED;
 
+	/*
+	 * WA for Device Flushes Ongoing ISOC IN Packet at End-of-Periodic-Frame Boundary.
+	 * Once passed the end of periodic frame, and the controller is transmitting an
+	 * ISOC IN packet, the device fulshes the transmit FIFO. Tune periodic frame
+	 * interval to 95% instead of 80% to avoid it.
+	 */
+	if (using_desc_dma(hsotg) &&
+	    (hsotg->hw_params.snpsid >= DWC2_CORE_REV_2_70a &&
+	     hsotg->hw_params.snpsid <= DWC2_CORE_REV_4_00a)) {
+		dcfg &= ~DCFG_PERFRINT_MASK;
+		dcfg |= ((DCFG_PERFRINT_LIMIT << DCFG_PERFRINT_SHIFT) & DCFG_PERFRINT_MASK);
+	}
+
 	dwc2_writel(hsotg, dcfg,  DCFG);
 
 	/* Clear any pending OTG interrupts */

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261014-dwc2-fix-wa-isoc-63a80e937000

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>

