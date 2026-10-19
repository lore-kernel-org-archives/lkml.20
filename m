Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C43DEAE3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397303; cv=fail; b=tsfQFMqalph+3YvxAOVsK3QgUwL8ab4o1gfa+Kk03QtCBvsxNGMJDjTBK19TfIBrka95RTZ5Kx4ggYp2pnvTHupYB1zMWCKd1Zn2oQqu1X/UZP4z3SV97DeNCOWZHD7sBsOcbwQbFMOBI0wYO8Cliyl/M2GcqUBEx8OGxXCpj64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397303; c=relaxed/simple;
	bh=ImOC+Q11iKsQmw80PeHz9rMCRuhq9owulF9SQtl6Qpw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pPSGGtF4RHvRL2iLaPcOuIBWlnLlQRDtvrT6OxYgF5OAivcc0rk3u27X99ZW/OVDtEsGnKT8HaU3qBafzZB5AZpJqhAPiQDpK+zBcNz+q5I0PRu3zWE1p1mdLYEsY0caHGPLie8fprD9Dp9acIN/V8ctVyLyR8IllJAiVA8Mjnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=EgbVtZ2n; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=h3E5tdcd; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="EgbVtZ2n";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="h3E5tdcd"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69J4god13373222;
	Mon, 19 Oct 2026 03:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=sKw3bsosNkMlg
	TyE9SsLQ1WAbbfJ8fCnDxkY+F/lr3U=; b=EgbVtZ2n1W0Crf9EGxfN4G19ts6Mb
	aVF4m0+ap4X2MQwVeqkiHpzRR6p2cx6xHb/+zzK/4yVVHhMw+QDlUfbcGVCogQ5Y
	0lZ3J4T8NXka+7MzyqnVGB+8F6ncmxp40YzSfworuAqp/TwM2p2J+GincmssHcB7
	rGuAy/p7P2gG0whEJ5pwlUkeIghL99NLs+EhBtnbUrVpmx0yVsv1aJSEbNK1zgFa
	7L7loGPgLRyqJRZ5ho+51gUzdTTvC/R42C+PvoSJN0yoDFYmuItnbHPGezf/0Xia
	q2xfJigtw+jbpm77tItu39iB8qmLU43pc9BW0p+iTgvReZ7i1WKawRiWw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010064.outbound.protection.outlook.com [40.93.198.64])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hct1jme0y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 03:08:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVjP2vn4sw5mHmWwQqlbl2roMu4As86Y+6iI2rxhamWUwd3MwEk2aGz74AGI55au8J7xuMOtv6IsZpbty0+G+LmDW1OKsbH4mXTQs1t4vYa07Y2cS9Amy4SsSogw4rkTGATUgPKAmZ9t+BeKtUNfEefJlG7soFYALl1F6RvrFVrJvlXaNbxJD5FUiBXDJBMbSjlMYG86UZMlGIJuYWzLTFJFkJapuLupQhXD429/qs9S2b/OIfM/7hwBthdg58oKZRjHw7CTEQoU0RNee9pzx9RnGCDVOKC7Jmdokqm8Yekiw0o9YAxZWWyN4UxQ0G2V+cQmaNLFiYLoygu8njnaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKw3bsosNkMlgTyE9SsLQ1WAbbfJ8fCnDxkY+F/lr3U=;
 b=eAJiA21KUgeCqxrV9oUztU64jRzy/bCYHmh96D8FqCook1Q33fh62EXcX9Tg6/j6/XoVkLYjCwoYD2EDpIymdAaDKA8bCxD/iYK2BVN9ggVOOcXeLD5+Wn6LFP3STWzqH0chr44hjy6QKESALwOMIlvLD1CsIZdnUHsWfHBbBxbgaaxadN4ReP8usihKtNc+wKzb1QIEp+cwAxlcCy1JNeh7NLPvPqqpxkjM2DC758HwvcQj2dhL7W2H6xI9NYVZlJluZKxA2mo9fJtyuGrS/Z6mRr3t9AaVOGQdBYSoqs3bD2aTI4BNYpQm03LUzLgU6ZDft77Gv7meHAY9MnESgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKw3bsosNkMlgTyE9SsLQ1WAbbfJ8fCnDxkY+F/lr3U=;
 b=h3E5tdcdYBX3+EurzYtvJRHYbF7a29cUITRvSrNCD+AUN/k5PGpQBrUrnUnikTyKta4g4vSLarNcWQewQ6wSiYyVW8U+te3IJ+JpHmD8Qh19t08K8/ClR8QETVuP6E9/2poZkgfCoDBbaL5AXW7J3q7CGn0ru4KhI73sd/MB5tE=
Received: from DS7PR03CA0117.namprd03.prod.outlook.com (2603:10b6:5:3b7::32)
 by CH3PR10MB7532.namprd10.prod.outlook.com (2603:10b6:610:156::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 08:08:14 +0000
Received: from DM3PEPF000265C0.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::5) by DS7PR03CA0117.outlook.office365.com
 (2603:10b6:5:3b7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 08:08:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM3PEPF000265C0.mail.protection.outlook.com (10.167.23.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 08:08:13 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 03:07:42 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 03:07:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 03:07:42 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69J87aSp3342624;
	Mon, 19 Oct 2026 03:07:37 -0500
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH 0/3] soc: ti: Add TDA54 SCM configuration syscon support
Date: Mon, 19 Oct 2026 13:37:33 +0530
Message-ID: <20261019080736.944127-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C0:EE_|CH3PR10MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f6839e-856b-4454-36b7-08df2db81f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|261009223027099003|261009221227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	BOBMlcS92iyEWZfLLoI6NdjekM3rGM8mKBWt6462WPsvjf20lwFL5a5uactK+BGTK2RX3/nJFc6RPCBj40ZdenFuZBHXpwzR+zTCnHP5JnI4qgrw9d99j5aOKo4KW+3xAp2VpK4/aqvVHNoAMkalaQinWbC1SLOCcKrWaM6dftd0n+90Ff4VK15NUo/unepZiLTMkbZQYYk7kiVDm5BM7/f12PS+KA87rqMG7FqJG1JNI1D0o+caE5Eh0eIveFWjDJv9YmM/WdvGo482vCMiLIO7nZLx2CG66H3M7LPrejUJez/u6xmjEMBAok1VHIw1by2IXuAA2Q6dvsTxpdN8GfVKb2QnqjnagJuCR29iv7Qzv4MkS5lUX/9/UR/qAcTZHL8OrWrndGJP4PtHBC8tJs+4VZ0uhD4epwQ3qkkp5TPc26oleDY2gV5roXhCEFAWQSPu3qKxK2A4nbYJYlp/p8H2JfZ7vjlb4/oHzGsmNnB6MPoNzlDoeISOozn+hWclBRNUbJPYaN1vn3Ai7CqLHTq86yMlLy/TJyuRcFTptvC+t99LRJnebf/nIrGQAxha7cJ5kGKgZ3LEndycJO+3X/j51z8nvU/zNb8AHy8+k6A0xUlS8cUR1MbK2WkPBl0ksOepYRwXKLaQPvlNdT4OSt0vF+L4sYPknMGoDL0XlwiNMmeqlzH+ZdAh4X73zwW1ztt27VG+bHSbRsCe8DuoZg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(261009223027099003)(261009221227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XrjK0VCZ4yFCkV41/TzP9Y4aeU6Auo+Y07XjpX46SpOvqFI/whdr+NKHsXiK+13OBhwKJUeZ/oil8M2uTZEYi+1jeAm5UiA+CeXIh1nJS7jhT/Ekbope9XlTENRzysmT5HPV+ci8pub5Rts11EEzQWpaiwTKrarm/3au1ZXe6V+QzBztmtx17n3y+nTyyqr9ooY+GRMs1a5IQEGfcc+9wAzXmCKc9TyoDXhQsza4TZJRJIlAP2pbCqt15RUcdhZBSWV3UPeglDqp/M+n0otJLzQJuTw4mhA7jg4JpRSxbGQ/gygj6UaUO4nhyo5niV1/nwXNxA1Ql5TiymJUgxUK6BLd5LFvxf9izoD/rk6PMKbQca8XSPXXIlTRX56IxhIfjWp9dE78nhGkZz11gWkvlTmwMAeafnlCjh/ouFMdPOmo9Hp+TCXaiJlzhNgFZT1e
X-Exchange-RoutingPolicyChecked:
	ctsQ8vbnKmvLgJ3wdaKcQXpMJztj8IUX/Is8gQmPBUObe5J/pWymUjnDHKdSCOsYMajQ77j0HqGVeNpSUHWCFKS6HGJZzGBX/uoM9oUlev9vHeL+pLv+Dt+kTl3VEjaxvHQqeT68I4z9l1xq8weAB8ZIgVJ14OmMR9Nvfh9leF4+GONvS4xCSa69D9lU/N2Kcq4bPJjVuD9Q3D7kZz9K8QPH1Rn1V7PKmO43lK/YCJYdBmSmnDr9T30Y/MBmsP1oMqSUfPsbmiEiSrQq/yNuZpTO/3IPwNfJzN4GxlaJUwOeO0n0q59m8dEGcqe3wjXo7EghYs8cDdMKTWWY6e8xUw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 08:08:13.1466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f6839e-856b-4454-36b7-08df2db81f50
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265C0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7532
X-Proofpoint-ORIG-GUID: tdmESw3d5tN2ZUgbH8KddeoMbY4_Ht5w
X-Authority-Analysis: v=2.4 cv=ZN9CCn7b c=1 sm=1 tr=0 ts=6ad5cff2 cx=c_pps
 a=NRkibxwGrRsmaa9wFTKTPQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=gjunaNRE3G-0dZuiZfkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfX9TZml6N/ZVB/
 lLuPYuGRR8X0j4ccYT3E/pDrjD2AoCLgm7SnryUIusWIR/01fPF2PmhZiKkFSCTas+/Jpp7GeO5
 YgF5ETbeZ1lMUJdlWpjFe1WOTzzLQYggpuK770jwfpiH3REd5fHgNa8+2ca52jicZwHrnN3wkez
 SLsBYrG5IHcWfYDpEkQc0KGCZNMTiAFPCWxgcfXMMaTNkypJJJPhyg5UI/FzGHqSDhs2TNSfkWe
 lE8T+pfTbEHwrExZpAApsgYqHYWJ1ZGrogK5KPoAxRJ4WZpXwFHfK/PaCI2f4htIvejFNI6AH4p
 b6Gz9AcvN2BjLsXGikw38j/rfLTFJenlYLW4DsPg+I1jHrHvcNXfsvUTh9br7yDTVR8aS8u6CjZ
 gooU11guyU1dbgEbUr2Er+KB8JLYWvI/+sh3/56BETwH8cmclrfRa8EQy6No7euGsMs7a4G+2pV
 Lg/oroH26GyML9orvig==
X-Proofpoint-GUID: tdmESw3d5tN2ZUgbH8KddeoMbY4_Ht5w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfX3Q3PQSMzIumd
 776DODfMZWDpbJ63U46pVkx8+MmDfKlVsCLPuaZ9iVoM8ivOFum7k3e3ucCGdRxbuOe/K0EeoW0
 kzLK2tJn1NuLmIodqGEXi2O/1X4Z0h0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190032

This series adds support for the TDA54 SCM configuration region in the MCU
domain. The region is shared by several peripherals, so it is exposed as a
syscon regmap for other drivers to look up by phandle.

Patch 1 adds the device tree binding for ti,tda54-mcu-scm-conf.

Patch 2 splits the SoC decode and registration logic out of
k3_chipinfo_probe() into k3_socinfo_register() and exports it. The helper
ties the SoC device to the calling device with devm, so modular callers do
not need an unregister step. Other K3 drivers keep their current behaviour.

Patch 3 adds the TDA54 SCM configuration driver. It provides proxy-aware
register access with SCM unlock and claim handling, publishes the regmap
through syscon, and registers TDA54 SoC information through the helper from
patch 2. The option defaults to m on ARCH_K3.

Moteen Shah (3):
  dt-bindings: soc: ti: Document the ti,tda54-mcu-scm-conf binding
  soc: ti: k3-socinfo: Export SoC registration helper
  soc: ti: Add TDA54 SCM configuration syscon support

 .../soc/ti/ti,tda54-mcu-scm-conf.yaml         |  78 +++++++
 drivers/soc/ti/Kconfig                        |  16 ++
 drivers/soc/ti/Makefile                       |   1 +
 drivers/soc/ti/k3-socinfo.c                   | 103 +++++++--
 drivers/soc/ti/tda54-mcu-sysconf.c            | 216 ++++++++++++++++++
 include/linux/soc/ti/k3-socinfo.h             |  11 +
 7 files changed, 404 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
 create mode 100644 drivers/soc/ti/tda54-mcu-sysconf.c
 create mode 100644 include/linux/soc/ti/k3-socinfo.h

-- 
2.34.1

