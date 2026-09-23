Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42387568FC3;
	Wed, 23 Sep 2026 19:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191675; cv=fail; b=eL1oGMr5EKyqg8hbao9GpaXhd91UgNlts1MUK+SE6UYvwjUibQeHBC+ZYTjO5cEmcxaHJMz4/ypQ9W1K1JLB5FntM7S4Fr4JiB1pZEqdBr9e5eMphl/VPdsL37CSN0pv0xik6ZhQXj1qANPiUARhpcESpaSRlU5nbHjj36Z7rQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191675; c=relaxed/simple;
	bh=jMlH0HX8qIYv2Sn/dFVkV5JDs4qe6LXKEsbetqcF1Q8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0u2CGjv7Q8WLHLQgaXswmD95sz0PK/rHYOETkBYjAA1LXU/TXs9Mk+d2NGoo1jgPt5VSNO/hisq9ezkGD8pFVYPp6TMrDQTw9gwKOz67qddCyZsTNaccVH33tpDu0Bi43kSfn8cWSPDKHeqXSsN2rwH880UzRSzcT/D1TxnAnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=SEXr0Gpl; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Hm4U7FET; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="SEXr0Gpl";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Hm4U7FET"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NJOnBv2057627;
	Wed, 23 Sep 2026 14:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=woeWlellFD9oDhXthwmwfool1eJzmliq0BS2Kh/Ng
	Ig=; b=SEXr0Gpl3ukKDWxrarJveVLRFvCP4hc6ulZfPvFZr2P+x8cAU6IY0ABee
	juwggsmZhoSrsAfdBRoftULY+zyD2Qt9p2sYJ+o4yKwZ8am9lAJVK6Aw3gyTFH3o
	vJk0SjPN2cSMbVl9JEmGje5H9CDg0kgZKcuL7OK82XNaJbwKUCxhKvpi5rA56+fD
	iHTCVBgFZLVCPJ5MiHMsPtoeSqQCFHcqWgv6C4hgRGnXdgpUvLknYlkuG6ZyrtyB
	/+YsRzD/to9EkznwqwJIE8N2CXSNaKQ8WSrZPEiqFG0Hyvdki4ZIXl9syWslBEYL
	x8IkJOiZRJJd3k2Vkl78Uu65pG3pQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010041.outbound.protection.outlook.com [52.101.46.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycxwt5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 14:27:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j34ITT7elO5PMJDFztQz3f2TX9CPvnYDuVDiw97s9RV54yfeNv9V7FKECSmjcUUs8qTMkr3VkMtAhT5dwCfmjbjDpKKHwfMQxpqIGr4kJhDPXqbzxXaHWfPQoKT5Kd7jdSwY8YTcLPg3hb8sWt5mXyf4qzniuBngismAc4plzBTpX3LAThZJbYlzhtB/ilhzwDL1lx4/MPh8K0eJX/Lp9Ptih7U1IJLQDHcELb0AAUI/h7a7+dag7HpFthGfnb5KESaZNNb+qP7gZaeyqfafr+EaeYIf8Byz+/ZReO49ugyiV33aGMTCjmOnQu/msRNVX/BQEnCa+vsovudQYQsLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woeWlellFD9oDhXthwmwfool1eJzmliq0BS2Kh/NgIg=;
 b=CtORxV1FbzlLuebgy5ennQHqo3GtLjBwtKd8Doz7NbWQM+mh6qw1gAz+F3zElI2KYmORz+AUgYflMjjIeYETyOZMnDcflCAeeSmNsj77tzmC0dZUuha/f6OawCbkNemU0MCCUGYXpWuqrShgbOE4x630Wxi9i/3Btko/mzuse3GF35G2lt5MX3iSvDIqL2cjKTa9IeKE2coEeUvng+DQSloj62IkjcGjDVUbu1S+bm/gziu+hbGo1sgX3paVFNT9UQDqVxPqSU0Q4vjLUHUX30KRolQnxDOEUz5ZsQzxu/b5MZDDvEIhK9IZGb3B3z8wq3UZLE4LMpmJGvEHgSjR+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woeWlellFD9oDhXthwmwfool1eJzmliq0BS2Kh/NgIg=;
 b=Hm4U7FETEMhxmqc0Sk657EnpSaD1/6NP2oiCkQmRV5c9eTbrJo4toues6ciDu9LzhaSxKXYX1FsXF2OO85rNbL0Ve3wj7YhSi52nTO//iyIc4mQ2h7isvxN+3UfqAQC4HSDAOic7fGigb2kKyVmtIE7GtdcXoMyyRGSFGdd8P2M=
Received: from CH0PR03CA0181.namprd03.prod.outlook.com (2603:10b6:610:e4::6)
 by CC6PR10MB824513.namprd10.prod.outlook.com (2603:10b6:170:206::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 19:27:43 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::60) by CH0PR03CA0181.outlook.office365.com
 (2603:10b6:610:e4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.17 via Frontend Transport; Wed,
 23 Sep 2026 19:27:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 19:27:41 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 14:26:53 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 14:26:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 14:26:53 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NJQiX02642017;
	Wed, 23 Sep 2026 14:26:49 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <sebin.francis@ti.com>, <praneeth@ti.com>,
        <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <s-jain1@ti.com>
Subject: [PATCH v5 1/2] arm64: dts: ti: k3-am62l-main: Add DSS & DSI related nodes
Date: Thu, 24 Sep 2026 00:56:42 +0530
Message-ID: <20260923192643.1362891-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923192643.1362891-1-s-jain1@ti.com>
References: <20260923192643.1362891-1-s-jain1@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|CC6PR10MB824513:EE_
X-MS-Office365-Filtering-Correlation-Id: eb439201-7c55-4399-7152-08df19a8bc35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+LiNCB+FrT4e4sZO8ASHMCnV1tmJPkHUWv/9jfEkyVIii0kdCv7iQEUsaY8xRgMdGYOF0jYFMS+AKAO8KJoIInQe6R7B2DbMbNHUfZHj689co1lgwOvkZUGQIrjNqo3LOky0mhU29NJnhBaOuZ51xTIh1Cp7xrZM+bhySp5O9QACTOSEVtOa+2dG1SXLRYfl74LHmvSFdfFBXe569YbqrG6ExatBLAGVMzEw7M3WlYLLF34X8drsZqO7O+GJ4GKVgmIzwvfUPjuxgFV8zHvVkTer5SDBzieFhw7ZxYIKyXZjemYdnQTne78MRoGartxNTdhbR/Ne59/rcJYOaxf22EzinC9NAsW+5VowMQnRFqI5J6vLpjelZdSAPlsgTQ4fv29/+DcrIPV/CW3y7+5gEYvPBKLHKFpwd2LtPKS7qQkRd94OkEfa3Yc+JVQ8bVhxLZmKfdSo/EvJYxIZ4GowSkX9isdJ8MXkqPSALD9XypiVKBhxQouQnWCH0j81g6cocwNKws+UIW/vYmGsSvGji/eCq5oekwXImDANF7YsfVI3geT9aja0vYnv4ynwoUw+NadgGO1rGS01qRbdtFxJYXlr24aOr7zMwl7aKEoIT69CdEmREz+0m93GYsaGxZFj59f4yESu4vIluJK8aLL4RL+Y1jn8yFBLJwUQ6YSgztFGFA/gB6fT0hEM7+DcBqgswUUOFIamEGg9OjPNfEzXjw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yowBPoGKi1TrPmAP6HEMQHl0Rh7sXuj24LlQXl6far9XPl9GiwfhpnIkHUQ+UC6w2mhf4jub2Ha1PS7LBWIhHBmBZstfB351vGeB1xg9jbN6YBJgkqft3n4A2I6y6injIqFxS1gk9JtSpzlE1gHW2Zhj1lO+RPgZ1LqbZlsDgjOC7l5NioNmCiUnjSbVus4MlJ+W1Op9q/tSIJr2wReX6JC7ooxJlH7ZiAtbB0DCrL6W2we3l3s3f4kN8n1IQHmhSpqcJudEiLPmdBEq2idCpQqTqto+exADIC3K6YEusYGJ4imYXYKyuyPJLzIVZIwOwdxCXuAyKEq/DBG6CpKEeGya8R4NSB+hEXKpE7NPJLP0BPn7EebFHeAFCEh55FTZKqcgYA9WzKuKzC09YwgZ33yeadh/wBJljr46jVEDor266ifOK951dPijJaR22KQa
X-Exchange-RoutingPolicyChecked:
	YioAzPolSwbKpTBiTUFVblL2oVqmH/t8gA+qWcnV/XNRAPHp3rXyLytXldrMkP+gifbX9EBXtsTU4LbfTyje7Z+feoTA5t5BJ9uHfkUmQOyqYoZuTbV3CY5w3t7fH5pHVbKlzlU6KxZq0Ahdfn/1E0hDLXWaXc/pRh6yqr2NwiOcDtkuvCalu4/9AeyD+Vs2zS4HrNOwcOuATMj0PedMMVbu1VMDk5bqwKx2c5n52RA00I3GYkWOS0pZjgA1ZVvNDeoVGuF7h978MkHONxOLHsv/wzjE7VFfORE9ilEq9yNzA/Xkuhjsq61GAssCDwUMxva87+Xp1xcHF3owDX6t3Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 19:27:41.1731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb439201-7c55-4399-7152-08df19a8bc35
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR10MB824513
X-Proofpoint-GUID: A2etxJAqIdqnyQ6cdrEJobDf7IGJ1VpB
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab42831 cx=c_pps
 a=yJkyEzHMNmsTB3XYPV+H7A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8 a=FLfJYUKuRQtBdiMmcTAA:9
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX28v51vMWKfUZ
 3OpCTJp3aqk/NF0elMCQamrecQMmJTHYUrgrFVpViKFCQ/nS9sXcxlmpaGRrfnAQ7Tw01aaP3Zx
 C9UMIgkvONJtI5YSFNCogPx6IaC02iZsDJgrG5IehEhxjYX55PW/yI662Cv1rWuh6AUKe4zA1Gq
 xXp4n3ChUiWU/Xvokvjgb3w5FsmP+P+bJ4bdp9h1EcefvWgzsIUKimSi8N9yJrEODCmIJtILLaf
 0pJvuOEKQGYCbke0em8KYnXMWd2rjIjUGpS6BLBF+kIciV45oZ/TWQddVHCGJwDBtQN2VvVZ6bP
 uHcHOXvIQ4DapWS2nMsoewbt/SYUkeuXv3mVINaJ8MiDPyNPbPBjKLBu5Mz/w1w5+2Xt9tLB2le
 Y1pXxoDRPttAi8vcOiKIOiP839wCzh8xQWrEEnsCgz3FxC9VzMSEl3vw6kTDS0I9l6/pglG4BmG
 Rg1v3P23jZuelAlO36g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX3P/VMQVNHpAY
 C8i2Yl5yZmCdxQIQMnDdZtnPXLWQNfzEP3FsNN5EMSmJ+OjMIYqVs3k7jfrF3aC17ipaE2rk1Ex
 +hgGLWQlHvleqTq9X6dyTKW31Ta9NBo=
X-Proofpoint-ORIG-GUID: A2etxJAqIdqnyQ6cdrEJobDf7IGJ1VpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230077

From: Devarsh Thakkar <devarsht@ti.com>

Add DSS, DSI and DPHY nodes to add base display support on AM62L[1].
AM62L shares a single video port for DPI and DSI output.

[1]: https://www.ti.com/product/AM62L

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 60 +++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
index 80615ca1e01a..a3199a2455c3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
@@ -544,6 +544,66 @@ elm0: ecc@25010000 {
 		status = "disabled";
 	};
 
+	dphy_tx0: phy@301c0000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x301c0000 0x00 0x1000>;
+		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&scmi_pds 86>;
+		assigned-clocks = <&scmi_clk 343>;
+		assigned-clock-parents = <&scmi_clk 341>;
+		assigned-clock-rates = <25000000>;
+		status = "disabled";
+	};
+
+	dss: dss@30200000 {
+		compatible = "ti,am62l-dss";
+		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
+		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
+		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
+		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
+		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
+		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
+		power-domains = <&scmi_pds 39>;
+		clocks = <&scmi_clk 162>,
+			 <&scmi_clk 161>;
+		clock-names = "fck", "vp1";
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+
+		dss_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	dsi0: dsi@30500000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x30500000 0x00 0x100000>,
+		      <0x00 0x30270000 0x00 0x100>;
+		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&scmi_pds 38>;
+		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	gpmc0: memory-controller@3b000000 {
 		compatible = "ti,am64-gpmc";
 		power-domains = <&scmi_pds 37>;
