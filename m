Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD73EE1FC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416968; cv=fail; b=cmhogpmtvp7mfSAYHGT51QPkWXfyvAgrCJWx8rfSeYIdbVn3hKRxV2tZ68GvRsvqhuKO//W360UA0DDNxgV751vWs8VhCxZQWdZk6q9TDbmFPL75+VClO2tamIbHOWYam/8dTvc63iOq2+YzjC+E3248QLGuRT3Lh5iZDYEUdJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416968; c=relaxed/simple;
	bh=HIq3d2THEE+uceefQSDjo4gK9vlo/Kdo3bTukB9yn8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ICMIYZ0Fm5puizRn+nVcHOkns067lMxpItSN1mHalpsHQ3jpu9e/eGimk7nqrA//ctrRuagbDH7VqhOA2Q6bRMcUc+rzwq0mTerGzteoYmyaI+7abjE3SB1e+aRUWzh0kF3bn1+QHeAts7wCly3wIUaCLXOTUov75j7EC4fGhEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CdtX4A/1; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CdtX4A/1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvJJCer7yud5qGnCoF+iUtc7uUyTaLa6KQwP4QwSF5SpljBJIxMZbPFbRd1uduYM7L+T48lEv2ui0JVmvO8TNo7fDwgZNpJ9J5oskyRNb5A+lpsNj/gnFF3VIxO35x6oEaIVHtUAp2mZUVxxSdGJ5y3V++akVPEwUVqIf0gnx2GpiGyRPaeziMc+CVoxyUQ7XvcFsxSbVXIkJULXR6JQW3aqjUkCl7aGiadMFzCKQJjasLWYu6Y6RLLx23Ry4xpMxpsAfoJTO/0Fn/5y7WsqrZQdroLhUgx3651wdy/rLODuGhbdWOr4h5J/dSBpwPx0sUw7F18HgwHP7/F5ILtzDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70ypXDo+cUSvzBsmcNDgWX4GSlEbxKHOqqHQ/jmsL2I=;
 b=qZLioXfm++DNLwRZOCf/vhQOuaJfpQ68LCSRoGSzieI4ZDNjYs/oTuGEVTXf8TFBUjND4P/pjtJYsNBNZsjnopwOtOuNxc6BD70LqJH/mBvWL+l0M2qPQRX9GfVI0CTOi8qVs/LoskXl5SeaKY8rsjqQw0r1/qhRV/pM40eH1t6c/C7TjSbKdQRgD9An7taPac6AM0TjZ98xCVCD443fgukdUnKamv5Tfc1QQWgUdjLeklYzgPXqXQ2nCmUCXFz7Dsyc42lJzdbgMqhCuNpi+A8cWRCe95ryE/0HUeQVObHhiJsTrnUMRwjay9+ZJUM6mz+4ZWUYyF0OKGtANJSAVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70ypXDo+cUSvzBsmcNDgWX4GSlEbxKHOqqHQ/jmsL2I=;
 b=CdtX4A/1UQ7lvvpUo7O+Ot7UvyRW3vQyfulTR1ivIPcZNMieMugiaDd/aHk6dj5JiwKNjyvgNmkgNY7D2dKKO6z8dZSvPM0EElH12cDTORnlWNgjfcUU1j0EowXGr1pPgqZTlBSDhCRu04yI5CVerzvx6AyNfrMNYgSwC9FwIvI=
Received: from TY4P286CA0084.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:36d::14)
 by TYCPR01MB9450.jpnprd01.prod.outlook.com (2603:1096:400:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 20:16:02 +0000
Received: from TYO1EPF00005022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d:cafe::50) by TY4P286CA0084.outlook.office365.com
 (2603:1096:405:36d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 20:16:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005022.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 20:16:02 +0000
Received: from demon-pc.localdomain (unknown [10.226.93.156])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 0CF9C300026F;
	Tue, 15 Sep 2026 05:16:00 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH 3/3] mfd: rz-mtu3: enable runtime PM
Date: Mon, 14 Sep 2026 23:14:56 +0300
Message-ID: <20260914201456.2018403-4-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005022:EE_|TYCPR01MB9450:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 76f00bbc-a10f-432b-15d3-08df129cffcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PwOTc4rKYAdRtubk/XbklSJfLT7UXZKz/oXvEwgji0t1wzZQBpb4VpIa++A4hPor9XPegNjQMJODgdB57L/7fMrI+ViJZpKsgUSFnn+inF4NGa4DPP9ObeGeT10dbfFTyjw1vzFD1YiSJSM1DvgTkjzf94AOHGzak1exZUlxj8WLrJ9BTSjY69CrCzl3zMV7mmAs75ZkzL2mbMwJQmxKEeFDIDFB90UA+3jv50eidn6wvo5vW/TQ7anbGTiAFPA58C/U1rNeInpPRtDfmf1Jdgqi2mxbfRphAYzuWMRMsvX9dgjRF9fBwPyxbnVcPj6xdo0PlkV1f02Y5a+1nu1wcXEBvtmSw3tdBROFSETGg5GPVMqnEw24A5tumu0XvIi6NPO3iIgHqmMdB9cv8z7JWgGNAFvamRkbwM5TzfzII4MP3Qtj77MrVO1joW6rkwnhPi+D8F9NRqryK2KIf2JSrF5SdOStE7BRp1nkXdrvbAav3PBosD/0Dqpa+E01inOrNliPqo4Kua9DDaE+HL+sb0M3crfs69uAmXuMOWx9ocOu55AvvIE+1bTt922cIwrTbMcPfmMdT02w2Gy+QFVhzuFHaLMJBTZ+N6H3vVWswJJI2/nKQKTgGVvrMWMdULV/347nHhm6Xo03VbwLgI5FvIJYlkx+TF2zoyXWB2N/BqaLdae95Pvayap8hGi1BIaZPwVKa5PgbuCqMa9ln9ndYA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5HaJR0C4CQkXjGyjYdVjQzcbfVRj31MiNbMK1M6+DbBVXJfAJsU31MzCiisHQwmSsOnAEMktPi8ueVx6ILIcIykJHwOUJjlqxdnOB0hmPZw69Af3rZjFP1yI7E6F67vIQb42AJlAmhQwHJchvWzFZJ+7puiesPiNlutkNBgJ7+aHe1/XUlKwDrOo/3FDaYtM+1+phqSoXEXnECiei3vCtTnRI0cNcxgI0NeE7Z23ogTUouldJ3J+Ou3FRlhA37cLsvt6bpA0G0X5wrs6sJv+jpfyk8umh7iyCUQuCreVB5a7E0wkf2S/MDUBHqF13FGfAm4h5wHxp2jG8o/UxQCJV8OADIow62d3kAi9aPp2ReTGnM0P6hqPKy5Ll9TrqOoBQ+Y53uOQIjq1qn1gZ1GoSG0nl7Dkdf1qhhfFYb4w4xnXjR8PX2PmMGd0OVHc+Hkt
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 20:16:02.5361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f00bbc-a10f-432b-15d3-08df129cffcf
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005022.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9450

The MTU3 child devices use runtime PM, but the PM domain is attached to
the parent MFD device rather than to the individual child devices, and
the child devices open-code their own clock handling instead of using
the PM domain logic.

Enable runtime PM on the parent device so runtime PM usage by the child
devices can propagate to the parent.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/mfd/rz-mtu3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 88aa1fedf1ef..e24e67e7a66c 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/rz-mtu3.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
@@ -298,6 +299,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 	struct rz_mtu3 *ddata;
 	struct reset_control *rstc;
 	unsigned int i;
+	int ret;
 
 	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
@@ -330,6 +332,10 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 		mutex_init(&ddata->channels[i].lock);
 	}
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	return devm_mfd_add_devices(dev, 0, rz_mtu3_devs,
 				    ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
 }
-- 
2.55.0

