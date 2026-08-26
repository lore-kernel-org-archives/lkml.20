Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC2C3F8249;
	Wed, 26 Aug 2026 12:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787746615; cv=fail; b=LPQNNhlcywj/JWZYPMdX9jT0gpVzEJl3h4EpajKvejifl3LvJHdD8GRCAEpXjUoeV0/MWpcWS2xWSxubt4c3F1rlDZ0TuAW7oP7oQLxflA0301JU7LvSPWt6vFBnu7/Z2KAUCWdTE25mZY07tecct9SbL0doV4Qm/r6jERhhLM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787746615; c=relaxed/simple;
	bh=ylRRszY8iENTReUqEFznCDqCz8V5pj67uNeWax7De4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Cu5ZuoOEMZCVyX2MXi7oGPBK7aAByfPhbG9mwq6ioHcbXozsNw/zVBtsnnOQHU0+Y0gnrKK4M3VOE4pAFDcAQ+r6yokLG2ivPV9/zK2r7LWS/mZZs7TUKyzpfjRXtRBcXxONU/SCzF6Se015+zARC6qnbBWB3DyiGU8QmTPkIeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=C/Gwc5f/; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="C/Gwc5f/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xElJ+brzbMLKKUg79A0T1P1fLmUpEVdqAbMl0QglzASmADCW4yxw8F03tR/f5N9DgNW2rJ2qa3hRkqv3x4AzYIiWD/feIgVeoGo+U2ySMtBlePKIDURSnTY9J+s/DZrCx/tWwaI3albadJMMML6xmA5vRRt7tX+BTu7MpEeF53enUSW4GNvtuQpxjMKy2PwfGaSIz+ozO9vCywq2ssFoEcsefXHmC/bFUu8G4c2u7g3Y4RHaUvdD5FETWGe0xDbId5cXgsFWo5Hq92r44jK190ecgCMgRAg5FDoHmC1Np7xqUe8rSvWZs7VT6AMt2aZ9DffzxJeSidzHoVyE3IvMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PziIsrRTc3wZQZPZjj4rKOpH/H/+cqYy1Bq9g38KjCk=;
 b=sPsmJj64d2ktFUjD4RB7PQuMypbJu2kgfTtXbDYdE9s20L5Kxx41Q69DH9ATcD5tfNuq3oQeEelllVq6kZbHLVCcfp51G6rx6sr9VuaDgXDZUudFB/Q9wibCYL4r76pAIMlCsDdV33llZjqe7NHxfnW7hCua3zzW15f0WabA1eJw8HFrjcN69tzAof7Zu/ZIXxo3HL60rq/pmK/xoCvrK7k/VJsYe0KMPtj2mRU+bLODMVC5YHW9G23ebBUr9YbaiQeairHa76HKTyr9y46zZbCTBubkqFr2/P6MUFQD2gcU+iF5B8NCsKXdV4MXKPdqHumbgoCj2igxbF0Xe0Pfmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PziIsrRTc3wZQZPZjj4rKOpH/H/+cqYy1Bq9g38KjCk=;
 b=C/Gwc5f/L7VoW3ZlgX+B32BFv3tSwtXXCdHv2PrbTzqkHCUUhe6ikc/4suSeFwk1s3CqVK1aH4GIvXoPM1a1JIzom6Ft7jRh1GZuSBrn+CspdoAedsHUklFaFFWwTaT/Jn3bnlFgj/HRndKaLVa9w2euGg+JzfS/P0eqA7Xv0SDumJkkV1SKrA1zdmOIAVOmoAEGgqB5iuKj3rC0AW9ITsbHKIqG+qLnauUWRP3EWCxbhPncFcYE8xcufG6o9nxB3pysh2vLVdt1G09ezhlOT8IDwdbxTD3JpHHVwtXkZHq8nySb21e9azLtJJ9NxUJzTJFDzowTU+/E5dMdhwG6/Q==
Received: from PAYP264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11e::9)
 by VI0PR10MB9468.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 12:16:47 +0000
Received: from MI3PEPF0000848B.eurprd02.prod.outlook.com
 (2603:10a6:102:11e:cafe::27) by PAYP264CA0004.outlook.office365.com
 (2603:10a6:102:11e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Wed, 26
 Aug 2026 12:16:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000848B.mail.protection.outlook.com (10.167.240.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 12:16:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 14:22:41 +0200
Received: from localhost (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 14:16:46 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 26 Aug 2026 14:16:36 +0200
Subject: [PATCH v3 2/2] usb: typec: mux: gpio-sbu: enable when only used
 for orientation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260826-usb-fusb340-v1-v3-2-11927682504d@foss.st.com>
References: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
In-Reply-To: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848B:EE_|VI0PR10MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 123bc728-c193-442f-a40b-08df036be68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|82310400026|1800799024|36860700016|56012099006|10067099003|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Yo5gAKSyhMIcSQ5Up/KytSoez+GVcqNQtToEpedFlf/XOrjBPm+qD2/Mw88LWO0edY0P7OPzel7pKYvkSh2vkZ12r8JtbLIFcxjJzzqpjbosN0Ii6Cim4fVfgC6W2xG0pFamvY383O+B2n+sydnZc//6f724k32eCC3ErBejcOTioj+YEYLyzp5hvg5UWSdpPXOh4Ui8vxiEtBzBmJOUgUF5PBrDQcRDRArFzXxaZGJobAg6tC/b4f86a7SfcKahG3brLqvKMCKEaKCrFsF6oieJnYOrxfxotKcN9QbpaKGcoxKuQHudDRMkv6OXDVyog/s9OTxRJJMOxstFjDd4lSuKZNLAMPPtNTfEg8pZVmG+kQrETo8n5kCGsoCU+O7K9GeCOhULFcXpNq/e+yJdEciOPxUxALykGQBf9N/RFyggjD585hUf34/ab6UJzxoErKGnHczIjSuGi4sDP8DqBcJEfkoKysifCh9KooUcbQ9zsi0+u6zEohRDM9RYntZugEZ3/Y8e1gB69pPJD67v2KyXcALvgVPpCL9+x2dgH8gT5I9NSnIqQZmo1oa31AumOaP/3lnq54tVZMdtkpxYaUDShFo8vBH9stmg9Q8WJypLZ2YTc/AjnCwI4jh9UQWEhf9Fu4KvJks5GhZyjLT+W1dgZglOU0HWJjFunaHFZOmftm6kNE+yfspF0VO9w/dPQLb34JG7KAPOrahCNmJDjQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(82310400026)(1800799024)(36860700016)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RZd/ZXnmXOaTAaXdxQw3FVQI3MlGk8YZQxYA9nbFQ4m6Kf51rdGPgrhACKgieoKJjTCoRyCyr5tbkMEpP1fRQKOcZMlo2QOxMBlCKH/8Ph6wLBGIFMCITvl8CfZPVuKtXMQeoI5krCOwrt6cqiF9CrafD7aQSNCqssFOBX6l7Y1GwE1wDA9Jz+IqE3mkg8/TPRjrOrZoehEP/lEveP4UgEtAL4I+SDeS/5i1vsG3cfG2ucAHKThmVOGlW9SYF8BwCqoaZAffcW52qDIpanAxps0nrvRGEiXLnzXZ5VjXrKHAWG8og3luq6ui4EfMfLFvx3yhMyePn+zEgqaWyZQJUtfoEW30EOaoQHvDG3Hn2eaRAV1ezfmYYq0vHbsD+lfobIYPlya2Vbyc8BBxnITFQ+wJjtRdxdpVO3TKYbSfM6LQHAoxn2VgKEip1x1vhLjV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 12:16:47.3472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 123bc728-c193-442f-a40b-08df036be68b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9468

When used as orientation-switch only (no mode-switch, e.g. no altmode),
the optional enable gpio remains disabled.
Enable it from the switch_set() routine, in this case, when the
orientation is set and the enable-gpios property has been provided.
Move enable GPIO configuration after the swapped configuration has
been done, to avoid possible glitches in case both signals are changed.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v3
- Fix missed v2 update on probing mode-switch property.
Changes in v2
- fix issues reported by Sashiko: probe mode-switch property before
  registering Type-C switch, to avoid possible race. Configure enable
  GPIO after swapp GPIO has been configured, in case both transition.
---
 drivers/usb/typec/mux/gpio-sbu-mux.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
index 1834f1a2dd9d..b1aa976aca24 100644
--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
@@ -17,6 +17,7 @@ struct gpio_sbu_mux {
 
 	struct typec_switch_dev *sw;
 	struct typec_mux_dev *mux;
+	bool mode_switch;
 
 	struct mutex lock; /* protect enabled and swapped */
 	bool enabled;
@@ -40,19 +41,24 @@ static int gpio_sbu_switch_set(struct typec_switch_dev *sw,
 		enabled = false;
 		break;
 	case TYPEC_ORIENTATION_NORMAL:
+		if (!sbu_mux->mode_switch)
+			enabled = true;
 		swapped = false;
 		break;
 	case TYPEC_ORIENTATION_REVERSE:
+		if (!sbu_mux->mode_switch)
+			enabled = true;
 		swapped = true;
 		break;
 	}
 
-	if (enabled != sbu_mux->enabled)
-		gpiod_set_value_cansleep(sbu_mux->enable_gpio, enabled);
-
 	if (swapped != sbu_mux->swapped)
 		gpiod_set_value_cansleep(sbu_mux->select_gpio, swapped);
 
+	/* If both enabled and swapped transition, set enable GPIO after to avoid glitches */
+	if (enabled != sbu_mux->enabled)
+		gpiod_set_value_cansleep(sbu_mux->enable_gpio, enabled);
+
 	sbu_mux->enabled = enabled;
 	sbu_mux->swapped = swapped;
 
@@ -120,6 +126,7 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
 	sw_desc.fwnode = dev_fwnode(dev);
 	sw_desc.set = gpio_sbu_switch_set;
 
+	sbu_mux->mode_switch = device_property_read_bool(dev, "mode-switch");
 	sbu_mux->sw = typec_switch_register(dev, &sw_desc);
 	if (IS_ERR(sbu_mux->sw))
 		return dev_err_probe(dev, PTR_ERR(sbu_mux->sw),

-- 
2.43.0

