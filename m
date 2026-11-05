Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793875301;
	b=TsMiFzepGEcEXKCxJrvcK1g76/nP9WEJVYhc5ynHCxWvT9rX84ON4DH9xDRi7Vsewgnj
	 LSlimAr/N+AIHsrHk5VLy0ZzfhUhc7/oVLk7N+hafTogQHuDtyD/9H8lFqRr8HTXSPrLp
	 cEkhNOSVkUM7pKFvsTbUzmqxmFUhuOvCAwAKACuLfr+acLksCiPegzPPGoZjNJval/o9d
	 oejodODm2tLUA8dSsSHkvvm4oMGi6ruR4qENCYk4YYi2aWfGT1o717d0PM9EWpNDZ1ibl
	 AeEI8TfiLM2G4RQI2/Wqa3Ecshnkywh4iTPSIfphEEgTUROOq+wGWoonUsc2QpzrC1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875301;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yobi9EdS3srU5arAQHyJYj9lTY8+gHpU5vkqhpcsdEc=;
	b=k/2bmQgF0ey48Q4Biw1dCuXL0CJzo10G9QZekDEG5d8mJX6Knx83L3HJnem5euc6Xm+u
	 weMOPy4SYWd5LASt0DeaqVudEC2gLIjaFu32TxSy7u2lzyV51SkZht1yDHAJGGdTYE66t
	 Wa5I3u7Jdb1MOhOWgw81BQSax4I9GMwV+G3NjERZfTBCK2PurOHwFo2y4gabEX6nQZwyE
	 SBiNPwz6Qh//aPdC5vawYdslzpQPv/ihUJrq+DhjgMhuNf6/VcTrISmbiwJd6kkbyLbGB
	 gSMKF7tlRaeYKkPt7duOr1zStDpD2g49TRZJK/s4k78TdJWZXb7/gSZT/oLEpX+Xkqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=n9YBhhgV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.20
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD42606A31B;
	Thu,  5 Nov 2026 10:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD42606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=n9YBhhgV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAQc/WqwV3nURBrySuWM6i5MyQePKfiE0AkAg0d6sTy2ItjqdB2ALpfBtj9+OogsQA33Wo7PbnAd0MVRpvn+lQPPovN9Df49tLhUPb11nBYktfGLNxxodWfFGBzGJ695cMOsfeCiEdWBfO48eNFayHd04aS99ojSL9qdEFiFhtj+X+bhInhT7bzVAuo8+BZFpiqsejiWlY+El3qXnTxzr6Lkr7RzU5VEi01dYbSsYzwdmUoqyGiJyRowNpH87IlYXTWjVurnqj+Z3KzzmTX7oczNRK/gAe3hd7vTWBPNbYQXodzvGwQFzkYky75kLvDtZzuEOS/hdvix16qQtoklRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yobi9EdS3srU5arAQHyJYj9lTY8+gHpU5vkqhpcsdEc=;
 b=WYv4qTcBjR9IYD64ef9Hh4POthE1qJauqFK7f5b1OFQhoehmdxRZGal7Mj27XzzHJhs7korlKAhYILNLX7SJHdwIV2MQersvNkZS58oI9zyriiWJRaJC66Wrr/ftUc0xxt0VUqPr7CvZGuEcN9ZvssK69nMTxbPJo8qhW63UP+WTsHU/1iG6lXfpa4eRBtTIfl48t78BvdQrq1Sg90HDj7jMauUaqzM5yYb6RFnxswBz+aw6PKOMXgXDTsE54/3inH9nPX/IQHuIbpPaVU/J0TlWjgUeoa8yiYH58WL9xhndH5fTgGJc9+gZki53QMVJHsXEnD/UfF2PlcwB8HXUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lwn.net smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yobi9EdS3srU5arAQHyJYj9lTY8+gHpU5vkqhpcsdEc=;
 b=n9YBhhgV6W1oWOKRewVsKYMbVXFXuZe4dg0bHHQBo/cg/Vpy+5bXA2kkI8f/M2f8gX+tYgCk/LqxZ45UXz3S7x3lp4sqwXDu0kIol+1YEHvoKbdDiQ5HEbLqCowYsx8GH1TJjm2tnFSwE87JFbmoXHF9/lHN4VSUgcId53VmNTxX0cMOVOl8+3XFramnEAfDPEsxCdBL0Tr3B5tU7kKHaop8rbTRnATHFz7EPo/fK4qcWKZl4srxNje2sUJOlzMKAjmjsprj/adojzoG0jr64JzibasVQXk8S4Z2F7YXcIpefczDsdE8FrSVpt5Lr1Q2OvO2EcW3aiobWG9pTNauHw==
Received: from DU2PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:10:3b::27)
 by AM0PR10MB3636.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 10:41:38 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::69) by DU2PR04CA0022.outlook.office365.com
 (2603:10a6:10:3b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 10:41:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 10:41:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 11:42:05 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 11:41:35 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] Documentation: .gitignore: exclude .renames.txt
Date: Thu, 5 Nov 2026 11:41:32 +0100
Message-ID: <20261105104132.566314-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|AM0PR10MB3636:EE_
X-MS-Office365-Filtering-Correlation-Id: ebcb8792-e62a-4111-9938-08df3b295e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|18002099003|3023799007|56012099006|11063799006|261026121527099003|261009223027099003|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	Z64HueVNHSdB7YyRgENcv3FcmScXvOYKAiD14uzFyY2DS/U4EchJfso51Caw9ojH3gUUDDcXueK9ivDbEMQu4WGhFrebE/bbj+k2uqqGyb+zIFzuaNDq7B2PEwk2tO3UqvpDjcR4xDewik4wpDXG65RHAl/iVV0+EybgPRBWNUl9zp7265Z+rSLgmTB6F/8mIoZl04GzquKefvwIGduCrF7hnOPJQSj73b8HQbmYpEtN/B3WoTnWB/TwDpUSXRDLCA5rM9+mFM+Vg2vaOAXEGzTqgqXpVSudzsSyyHyEIBh3K/CV+5ekXp1muF05r08u9LXhQlBSQS+62fi1S/Sj/ak5Xsvn6kdBhjPr2x4zjJpCFv1jpsPzBdTDcZTqkVkVIjasyjfY5Mp+G+oO2gNn75fb5eOUAhJpeF6Dis46ugcGlr71Fk3i9oyfLhJVaM1FrbNyxly9b7EtwIG8uKqtcSug0jcmrD0zj+2km3dtQ7tSXMptLbNmlagaLyqlnfFPXaDsgSu3Nb8arS/ZZVABRwEuBhMLhxk3eLisXRhYHxuCx74MG78Z3RBvKR/MqND2DgV9fCpYMta6L8L74BQ1gvFqqF4ejkvQl0yBLucxSRIXWo/nbOH8gEhoEKaur5Hhx3Tiz1gtQpPeqmbPppBNauoyT0sP8KogVhwJI1INeV02w+O0GSDiWwmiSQ69uzFkQvp0hC7fj3lC7ajgzS5hkw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(3023799007)(56012099006)(11063799006)(261026121527099003)(261009223027099003)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jiDl/Q05D5lsTLtHGzHzMduA1dDAK4Y+xzyuKj8REqgLmHaVElCxR3/cXYtKzIT/o1IfytsckG0vGugcFYAsA22WlKisuLyN6k3B6bMz4JYJ5Njjd84Nd/TPB8k8tOiIPtAtBDLvlu1gbQpiP6noVE+YHggDVgHMKrDrhJIVqGUbHS4dP30tWIR64sZytTsnJXgy4aClGLqOZqb47uido3Nj1xMl0LHKGORQ1EBGuAbAfYT+ktNgenVbKPJq9XoX1lcZQ37wzqFP3A8ZzYeNqVntLQPgGWVUExe1POKja0HNnkZy8Pk1R+FxajQq0kzfqU7KPen+9gvvIALs+IpIltKaFRxKABE6LyeThgQw8G+cFlPV1xmQkfOnogaQm0lu48hOlh9HBtWdihFdIYiRBpSCWNEqYgRn8YsEqFXw4ue6drlUPaJg3d3npiwbOTjx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:41:37.4722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcb8792-e62a-4111-9938-08df3b295e8c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3636

W=1 builds reported warnings regarding files being ignored:
	Documentation/.renames.txt: warning: ignored by one of the .gitignore files

Exclude the file in .gitignore

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 Documentation/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/.gitignore b/Documentation/.gitignore
index d6dc7c9b8e250..9c7247f9449b4 100644
--- a/Documentation/.gitignore
+++ b/Documentation/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+!.renames.txt
 output
 *.pyc

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

