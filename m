Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A064D328611
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871312; cv=fail; b=kXU5bO2dF+soqMAdmqL8LMbmw5cg/0rCBeOGn9vg7QF3Bc9935qbKdJ4NiiiimXJ+5tdQ2/GGPD4ZmGE+cfSlVijqOpMooSzVw0xRSN1MnvTWFH/76gJLfxn+DM6w0o4gXEh0yhoJ9L/B6edlrV3QhItQrjz8f6IQo2D5O2oHTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871312; c=relaxed/simple;
	bh=8NP1/d+KB4AoktegunDGxaSQ/OKaA6WeNAGs695phSk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gbD3VC3Pz+/17i97YFdInbn9NwRVhrdzGJkZJZXH3UiMWPqnrnL9qWHqsNpUjFJgOOvRSLATjbUDquk80qEYZBqmNfIEyZlFumHExpWqkn3R99sm2DMAk1lRnykV769eg92ivx/7Ee/TTxJyAiwtkMCg8NfMrJewpPWRcHWNcWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SjcxXPuq; arc=fail smtp.client-ip=40.107.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SjcxXPuq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKrbRKa8HBYBleESbTKmChaAXTi1TwHJ0aFDky1bSy59AoChXH/1UW09FQU11N4Ezoy+YJ4S6pe8oKubIbAChY5cq8FQC/PS46y8zmCUStZ0kd3zd4DAZsBBN2q9RuzuJArSTemshNItYo9E2RNS/DvK/kMEp2IkkRaAbYadWIknxiMJ8JobuizFdkUXeOmYEsUqaMfE0F6Qtyyibj5RUeOofYbjPWEw3hAkC8oYrEpBl1ax9yL/Qhq54LxYAPLRWaAqLkSIaGBCxq4ionGAj6yh/1LfNOnv8VvZ6AYzwX84Tm/LR59tAN7oRaKLdK6mRsAYQ1EvwdwQHrDLjLIkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0RsrZXZurD1B6p+0CcjQ+WuVBEBmdaEDrvgGMsKOPo=;
 b=qbr/rZ9Zu2T2LXPAKmUM1yUdOZYQ+tYw1NvXcfhkyq2m8bV6aBjE+9I8dbLIjUPx04n2tqRByKLdQrPUJ0D2ZUsnrvekYkN6LOr4TjkVqb7uqYoWOEmHTjzvXZls4V9Qy61uk/wtDpcHWuWAlSgCOr9R3pqIkZG0EGLE8m1j2kbEmqIUUTFNAKnrj3XOM9NGm9DENXWaq+vykHIfZg+n+TFtouLxxoihOE5Mv5nY0Z3R0GLnf2gConrhkhuRLAQ3viqgSEVjEwHDVMfYN8K3o85gaYOrIQ9XzsRABunHOSKPjUfT0ygfRJKoX3E9t6jncJ4dDzE4c/9eDCJE7JrFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0RsrZXZurD1B6p+0CcjQ+WuVBEBmdaEDrvgGMsKOPo=;
 b=SjcxXPuqPZFSZJfQxH7mPlsV3++7a4I9B2aePXCrvnfGb91b7RkkgZl1BQZGCLnvEgtS94ulunGA/d1wEONLn06GSzAWfnjGrw4cvqnyJAPshIdyTC433J6QWThbsFdmNWw64ktI4ZTyfYCgEJJzEo/s5cK2wwg4j6f37PIR2Ivt8pW2Tuwyj8GFD9kILQRFyF6obDhZ65h5creDk4TBghiKNrRzYaPhzqWaDlGHjnmJ9WaM9J3YdsLPIKDN+8hjLhmnaRBNMNHzbG/8f71HQOfdmsfyZpK5fNpuurPit96l78i5pRk+ogkjdnYNeRaiqUyjW/XJBMGSP6s6z3KrDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB9596.eurprd04.prod.outlook.com (2603:10a6:102:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sun, 20 Sep
 2026 02:28:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.014; Sun, 20 Sep 2026
 02:28:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: orion/gpio: use __assign_bit() where applicable
Date: Sun, 20 Sep 2026 10:25:50 +0800
Message-ID: <20260920022551.3145595-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 54724adb-1642-49d6-166a-08df16bed93c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	lmRnsrr9A88pd5MqKHBz+8mQgQ5kYGtHiVqU+OLORzpe0I6uOSPrMwsVnBpnFX2f744/3u0FwJXpV4NxiLAgZ1dMmr7dvGnybyR3gHC0sK/OOleOUF6wTPXiDvlyjEfPyHQIs3V0WwT7FekI6arSNnxVsdYEjxfa3Wxs+8sq56DhgjPh6z9o0oQDv7T2nkxzLfL6Mb/6ei+RifZs987zH1kT/QRsWw9cV2LQuAR/L7Htjn3xn7kO8ew55PuO3J5DdxfR7rrK4XTrCj8dAceyqv4R1MnDuOAkpvzCxvmv5elVZYcRUUzfcbH2nGWP0mrRYXVdb++6mS2dtjC10Q0IU9gebrXlfEg94aiQhLbmo6KZrnD0sUmwm3/wYtcB93wX7zMpF1mgGy90nziO28dnIfa3q4erLZobe2N1csO50XojlXf0wGFDfd/EcSDVELQCUyT89RgAyVD/0U0fUl7TzmjP+tzBPx3veJkaaxNw4BscffiCf7Y9v64KOLn6OA+2NAECIaPW1+FEftFDOR8wFz6ZybVKUIr0HevI/lCiiZ26dlKCEuI9Msuu1UXhM9l7z0p6xWN6QrBVpP4hiK8sqrKfIw2qazPDE5EJDWBSysPHfHUUPV/N1fXAhIKz9nbVJXa3G7tCDaJJlaS0V/QPHZSdCFPsHz5Pgqbyfs58c68=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uS3i3HrW3LukQ6WujnLEhIugVwyVAjamp2Ub/qjCgqKoJfh+QrKL0Ngp8DdU?=
 =?us-ascii?Q?roUOty93us0YypebNzDbPDhL3N30/68gxvOW5ZLmhWMqUKDjsIQ9bGOF4I9t?=
 =?us-ascii?Q?dGM8GRqMFTL0ySapG43hIj/TMUWSufmmsv+jk0xOYxCHIuw6f339vgn46kO+?=
 =?us-ascii?Q?p7pyQ/nSKMI4rReBVa8l07Mc8UsBsxweN30CWlJ6XHxVsBWr7Eha3WRlX2sS?=
 =?us-ascii?Q?1sp7Kp+bN+8TxZiWC45ZHPjE9IVzk8elGLdSRbYRjWKHtrDy5ulHRmwmToAh?=
 =?us-ascii?Q?SFQyCY8v1EkiOTPc5XnHvwF4vYL7+XRlv5s6JtGE7snSk1uD+baSoBz1wyV/?=
 =?us-ascii?Q?7DhDcrSKZw0zmqZYJ9T8etvkDc78zI75+Wy8Wqz6GQWzsi6xUCZ43/I7CB+/?=
 =?us-ascii?Q?nvzhB/DbXJMv2LlJjT12xjSow4RWx9au6knbyGir39FG50KDYLoSd0K5P43g?=
 =?us-ascii?Q?HUz07HROAkmdPlWs11z8P/yRuIJIeDOIgFAqJjNUpULLfo7Bg4OaL0YphLTS?=
 =?us-ascii?Q?HBm4F+Fd62HZBXfdRK5wn/m30FBW05FiRcIs+ZvoRbiQ9kKmcMM59eonVHTZ?=
 =?us-ascii?Q?WeNZEeVegS0ZGP9aJxFOWsC1IR9nmSylOVUiZR5kHFMtxn7J33aXesGom/8F?=
 =?us-ascii?Q?+vB4E33IksVwUV7BaCIURNR0Ny2lLPWcMFqeL3p7NcNTbx7Q8tukIgBAjf8P?=
 =?us-ascii?Q?IbC59NSrPmf69KaijVWMGxOlnIaEMIOW7YhqlKPVBgS6kpa9cRP2b7BPEObV?=
 =?us-ascii?Q?8TlQmlUVCkCOAsaOLaL1uDTw/BYwI/vMgqtLb3IyS5cZ466eSn7k+xuFXxg3?=
 =?us-ascii?Q?qVL74wTHHMVEai9gVPtyueCxbVcUYDPEy43jpAdzX0OVUVRmJURHYnKFUf9Y?=
 =?us-ascii?Q?sDKh7oVUTqtGo0pOcsowe0uPWCoCiEqe8WwPcjNklrO0oqu0c6AJir8PejTI?=
 =?us-ascii?Q?CGRj5d8Pmf+EYLN46j3zxnKfPKvtp4laqbroteE9Tvpged3yELDwmhcGhmXH?=
 =?us-ascii?Q?prtFBFA0VooOc+2+IeO8/O0nbe02QD1OaYkyCo3nkZpfQXSATuzHriNcDg2N?=
 =?us-ascii?Q?4jotyECLkWUFlVegSxsGARGhTjOTefrCfPsAF+Ot3jU0DieGqzzMIipueGkd?=
 =?us-ascii?Q?7PS4KBj5dF2C8eDoKLuCbhXeI6Y+ZUAff9FIzVAPwDBJVb9CfSUVfb2vdh/E?=
 =?us-ascii?Q?qa7k81LshBaTpsJYNXHm0jGte0KEts4x1b/pGY9koQu5fIeZQzen/lLqjy6d?=
 =?us-ascii?Q?uWggAFsLJtRUo8BTqpMjns+6q8ISSvEhyEna1pJ78KjJiWPXv4OU6QT+UijQ?=
 =?us-ascii?Q?e07eu7EzLLbR/IZ8YGZK3IpLTDjS9TFZ+CVhGR704daexIFCO8Mn0argmKd+?=
 =?us-ascii?Q?EtTlOp8oYog+O5wO0ovuTRP1DT1SMIPayIHjClBBTYJw8KJhCsNLSSWhJtAJ?=
 =?us-ascii?Q?tIDGVMPC+weaGj2CzpqGd/bwyWB69g8HGycQq78wMrjhF3W+6mjthuqvq/vf?=
 =?us-ascii?Q?aC0/bc8AE2kuPc+5HUcR9rB0ECBQAhgk1t1Z4sDQOM6pq9t/kpeYYwjiJLt0?=
 =?us-ascii?Q?+AOPrPtFIqwsJe8rcvoJjuVnVMyyWuzsxaJOvmy8IJR7clqU0UnoXOpB9sjW?=
 =?us-ascii?Q?yAXaHhYp+ROATW7SKM472FojCbttiXBjDZxSao2gLRVG0xmEh0EzAYKdFt9j?=
 =?us-ascii?Q?Go5FN6UVQ5lWo8HlXXVT976mw6vZ1pAMI87AKfySXeYfVNgeG2Q1CSWVkHBs?=
 =?us-ascii?Q?l4lPq4oAMd9atS/P+s6UZYp7Qqs6PfoRleVuRqHu60lNpX877tHh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54724adb-1642-49d6-166a-08df16bed93c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 02:28:25.5754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6/v7eU8PU15yQLDsJbqvtRVWFfm5tpeWP7wmyPtgz9qkCR86P8jbaCr2VMdSBvHTO8wUuIJcVJyUqrC/BHVAwcEVh34HRfnG/iTP0Pp3brPOm3Hm5s2KhLx27BwYfvp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9596

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with __set_bit/__clear_bit to the
__assign_bit API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/plat-orion/gpio.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 49e29b7894a3..a8412dba97f0 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -275,15 +275,9 @@ void __init orion_gpio_set_valid(unsigned pin, int mode)
 	if (mode == 1)
 		mode = GPIO_INPUT_OK | GPIO_OUTPUT_OK;
 
-	if (mode & GPIO_INPUT_OK)
-		__set_bit(pin, &ochip->valid_input);
-	else
-		__clear_bit(pin, &ochip->valid_input);
+	__assign_bit(pin, &ochip->valid_input, mode & GPIO_INPUT_OK);
 
-	if (mode & GPIO_OUTPUT_OK)
-		__set_bit(pin, &ochip->valid_output);
-	else
-		__clear_bit(pin, &ochip->valid_output);
+	__assign_bit(pin, &ochip->valid_output, mode & GPIO_OUTPUT_OK);
 }
 
 void orion_gpio_set_blink(unsigned pin, int blink)
-- 
2.51.0

