Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2025678F5;
	Wed, 23 Sep 2026 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191668; cv=fail; b=qcJZu+AWwf8h4G+axJvErUi3uFXDliHpGC9HgbYyn5YKIxKS3K8ww71MXmex4R0MB82RJPKc5Eib8iV8fnA7f/3DcZJQ1TMnoIaXIHFYpSKXmm9+hcqwXtzN2o+G1rCvne5QKuUqsE4SPCuPFAe0Di3qlaJbdJ20Eyqs0qJs7LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191668; c=relaxed/simple;
	bh=7zC2XStb1l1+Ll9KtIFymg2f85QOQ9sKm8aQN30bVxM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E8hdUeFT6DpKz08jGr1EKTDYzbiGo3XWpTu55moVXgy8Sio7RlyY6i5TnLe5IRdgNsDicyCUTCTQL3YZC+6cudbyPd2Iaa78TwuI2iM9/HAF3vu/fW7ZCazh6djKJNl1hP6A/e2Gllj3/U8BiiBWLQDjR2DvJXvnq6F+Jqs3N9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jS9cO5D2; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AxWB4wmU; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jS9cO5D2";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AxWB4wmU"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68NJOZdA1749976;
	Wed, 23 Sep 2026 14:27:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=LEfOPTOUcDHAq
	htgyXeDYxM9cKpD7uJUx8Nfe2uaFd0=; b=jS9cO5D2bCXHZD5J6SI2U4stENgaE
	dqFghoioFHhko7TfnNpGic6fF7Z4XN8ebTa7q3DCvjXaF8q22lQrI0xkfK7gKXpC
	V+nQvZhDQxyutVLjiuKKUxeEB6i/uh73fMPsj+Knicnz/UT0hjHPWgCj75iv2c13
	6uwZMobCbA1S5aY3UJSiMoLKAtDIicSQo5EKnRZ91TaaBP8rLDEI2dOYy5T7vns1
	IUXuqV9L5N/Cq4dAfTjnprNVx+4WUXAomRREIXbOie00h2YoiQfgi042TjIKi0Nh
	lA227HcV6XZhKn2dEnlqE3gqkcUQaNd+wQ8V4F8tA2HjLevnYo4ld1FMQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gv3tsep67-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 14:27:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJKnc/oY8CGlCIhJEF3Bps+3CyN0wqMNI3AerqGw70xOse7CM4wiBqWRpOnfBjx08GnWSwmzrPE9trlRrj2tcGsIHH6iXwNtgyANGVWS0hZRAmCFkDHm7pyvGLwzgfORLmWXqi0f+oW4bI1gAqPiR75xcXf+qXlcAn2pFTdepfjGJbcur8GXWkiaHSkbrNr13NQqoc/DbPvLH8pEIvazHPEAXF0tE/KvIzIOLzQBrlg3SqFNw92UULH4Q9NlgjHeuTeOL5XaOlgpulxC8/WQnyDUiUQhFWfzBuKafhKqqRbjTg0lpTLrlLaBWS4+wxvLIVqZUBEbpTsSeEIXU1aykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEfOPTOUcDHAqhtgyXeDYxM9cKpD7uJUx8Nfe2uaFd0=;
 b=kS/n6dt2cXdf97/S0ZHp6JQP4M9xGMgXyHB1VfIal4dJlbMQfqnjfJqZx6ifhnd2ckuoYeXJN4YclmzfUldSjeTEZaPdVi2RUidWLWWhBYVYY27/ioHiyPR0lUldoPLxo/04sDETK5rOQW2u2Rhc2NYF94+eli01zPeRK/B1cDh5gwMTX9wJRFGsSh2qZMgDaGJzfEFKC0zVppo8ftEiah8h2RsgaYNM3/JwjRzDQ8r+YRPIU3gxg2xcMIog/bnBGZ0QKzLQOTQnWwNFcxwl1uMNlQ0N9CzYbPR5012HtfTvRz0PBLd3dfyj6YocPT5ThVh2n2puUYfffd9D6NDAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEfOPTOUcDHAqhtgyXeDYxM9cKpD7uJUx8Nfe2uaFd0=;
 b=AxWB4wmUF+HlfEPkAC/QyIa+sDWzG5YAKIiRsmZB97piqYg3apxFqmgt5taZdhNFjthGorF/UvG6QOAzCdS4TdsPKXRNwUZ3ML65deos/9laoS8W5BSwVJ73tXpWZEhHgo2cFwyhR8hmuQFx8hfKUUdDY+ghtpYF6ev6SB4MM4o=
Received: from CH0PR03CA0190.namprd03.prod.outlook.com (2603:10b6:610:e4::15)
 by DM6PR10MB4298.namprd10.prod.outlook.com (2603:10b6:5:21f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 19:27:33 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::a3) by CH0PR03CA0190.outlook.office365.com
 (2603:10b6:610:e4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 19:27:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 19:27:32 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 14:26:49 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 14:26:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 14:26:49 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NJQiWx2642017;
	Wed, 23 Sep 2026 14:26:44 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <sebin.francis@ti.com>, <praneeth@ti.com>,
        <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <s-jain1@ti.com>
Subject: [PATCH v5 0/2] Add DSS support for AM62L SoC
Date: Thu, 24 Sep 2026 00:56:41 +0530
Message-ID: <20260923192643.1362891-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DM6PR10MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: bb706241-c794-49a5-cb68-08df19a8b716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|13003099007|3023799007|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	jny+qhuD3Akdpw/dq8oKkP5+hsWMUgILPJGZE/r6mhPPY1a0LgD+OkF4gUIHegSZ2Do74Bax3lcrfdwQjuytaY/7zPQoid8IL1hPm2Vvrgf33fCZEp+5aElWeDIOp9J8xdcnAzJPzaDNvur+51msmhlgcjQYgcue9mgxNzEuSosuww0minS74NAownXn0SE+0nCFxKgPyhc0wT65HglkLQ1n7inRbxDx+ajcpEEzWRgntrttCQ9niTYj9DjKO2Uf/b4RMSIzcHZm5SNz/9bw8IlKfCdNWoEKaCJsomS699VbDD8kO/pMfKZrKyvOfED8lC0ev+OBZEoD3JuSgnQ9I6bIsVnUab7JKDhZCym+qx1l+t72N6bn6LJdVW8nmdr2rIZbsDWSUR78katOIYzRhyfhzdKYA3nwypaF6mz/PB5pzx0tOaYLjgGQW6YrHhJo04vPe8AjY5NvLz2o9FZcwsT/CqFGjqhJTC41T4z/tSCDmKkbXOEKF3Z10n07o3dQSWbF7CnnaBAtvAxEg8cO6EM3fVhoIKUt/feRM3Yjnfi+ZgDWt0Ylwxch3WTZ7sjQ4vUviljgJ0ABRPLJhepxp1qx3g0KjVJq1sQ3f7KzDwzevb0wkhxo2CoK/wN07AlS0e3H+j73WDEl5DCrwJoQ/rxRDpsbgdMe8lww1ZqYM/K2JvsbOJoFX2pQ9c95lyQoj+rhOwgWafdkF/RwyDXekg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(13003099007)(3023799007)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dJzERrqLMeHXV7MOH2IXegVwzOBqnigyxQGW120swyuU/8/UAlp2MVLQRJNl7t17YTTbw1QX4si7RU8kK0lAKHLNPeSvpxA0xIY54AgTtYGQ8jdlj48gQ1PEGbCXyDhjrEiu9NKx8UUv7ON5pby1hxFT5HVJY5p5FvLiy5RKa16drRjU/jXp9YbqzVFYZathWs1I/NlxQUDF2Y51h6/zjuy5DrKNn1O4sJwhBx5UYJq1rZGwRcqctMmlyLYtMP5EIASbNY+YpLqVNrkWULWwrl3n29cb6CuxL/iIWNtI7qvpxj/n17gtLge2b1K759xB++0P4w+2Fawct3oQbzjema/2/Ip0SgyJt1POTmskVmNn6+3cO1PGBLWt6rrJk0SvhV4EdJONC8VdirF+jbGJCD/VxH8/LqJDXx80lFeZicMtSHdoQPswSPcVec65ChpM
X-Exchange-RoutingPolicyChecked:
	TwBfne64HLkk2m2bTjZEEkC8xos2C6LjVttr4Pisa1nPywJxfn0uRmjKemEzyxDBAT8y8ihShXe4mrbCtARVRiwXOEBKbnt7MEQUpeIe2VViU28FqvCwYF7EKBlOAn3OKFIB1Mfqunqwi1OQ7K9Nxnmr1FQtxG4la5psYMA7XYTspjeBv4duM3c9BoLYhREQejLNcymKxp2nxWN0nxfeLBrvJNRIr0UxLAnAcT4hU3qudDnl1xt8O5TmTK77ajwZzDJee4Jy9o3Zq/Biga3FjMeO0gXbF4ezKXgb9prRX6OgEvDuJ1MvbX0KztpHTu5bjlrTv+U3Mr4aVwjYSTeRag==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 19:27:32.5929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb706241-c794-49a5-cb68-08df19a8b716
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4298
X-Authority-Analysis: v=2.4 cv=INaXmQvG c=1 sm=1 tr=0 ts=6ab42829 cx=c_pps
 a=P8hJoqhRnqo/cwUvmyxmUw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=JLQES9i2aRcSmLGWkN0A:9
X-Proofpoint-ORIG-GUID: ETkzRwgejsEbUc3djwwva3XBdzZiitVM
X-Proofpoint-GUID: ETkzRwgejsEbUc3djwwva3XBdzZiitVM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX6QznUqTa708Z
 wQkFHyTlf6PWCGP7PiQqo5LXiruMTUVnlSlu7LPbrxbCxIS+HOnSChJOLBtBz+g9PbtgWfapQtC
 WkxwoyNPic7WX2wO+7mzU+SYM0TwqNDYAljjY/qcjjuO+LSX3XGSUkEDbjy+a6EPAgS/WaM9f1O
 buVLDr/EfbwaaISPS2FtArzQG4tXXp7y5XlcQOd68YR3Kv9XqsrBCHLgayCRLIylhsxcyhRDJd+
 vew4MhpfvxpqOKtpe0SAOYfL/DmJqWwuUsOWoB1FCTzPH+4o0WoWgJIhSt4bDdl6C5IfHT6Cjwr
 49wZCyai4/8TP+F3Rhd5Px7iFKOhgFwlUIToXs91sErqqj+zFjflbT7YEo9kU4s+6S1phOBDNvX
 Tr+Vy5sVNtul7aWpVo+1b3d08+dXPMMfAGpiyj/JyE2RCvkGFGwGnegBsy1pX1TjJXdkj6Izojh
 tj70W74NFKtNhj+XM9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfXy8JY5lw1HUgc
 /Fot2glvs1urnSCOsCqAQ1o3FRO5hVMj0eoQhiM/LVKedormpAFyBE0lEJBlLI9nYRrEDSuZAby
 TgPhI6QfdvgwUWUu/KMKcmb41j9sdBg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230077

This series:
- Adds base support to enable Display on TI AM62L[1] SoCs
- Adds base support for DSI output
- Enables HDMI output out-of-box

[1]: https://www.ti.com/product/AM62L
---
Test-log:
https://gist.github.com/jainswamil/c21b0d7c5a3b5b2fc2a3f79101a296ce
---
Changelog:
v4->v5:
- Move pinctrl from sii9022 to dss
- Add bootph-all property to all display related nodes
- Pick R-by tag

Link to v4: https://lore.kernel.org/all/20260811130822.2324438-1-s-jain1@ti.com/

v3->v4:
- Change pin configuration from PIN_OUTPUT to PIN_INPUT for
  VOUT_EXTPCLKIN

Link to v3: https://lore.kernel.org/all/20260723102519.3581762-1-s-jain1@ti.com/

v2->v3:
- Split patches for SoC and EVM related changes
- Add dsi ports node
- Correct styling issues
- Drop GIC

Link to v2: https://lore.kernel.org/all/20260528133529.3476499-1-s-jain1@ti.com/

v1->v2:
- Update the commit message to elaborate more about the patch.
- Add dpi-pinctrl configuration.
- Update the interrupt routing index for HDMI interrupt line

Link to v1: https://lore.kernel.org/all/20260513210942.692269-1-s-jain1@ti.com/
---
Devarsh Thakkar (2):
  arm64: dts: ti: k3-am62l-main: Add DSS & DSI related nodes
  arm64: dts: ti: k3-am62l3-evm: Add HDMI support

 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi |  60 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 106 ++++++++++++++++++++++
 2 files changed, 166 insertions(+)

