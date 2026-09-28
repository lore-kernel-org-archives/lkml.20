Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8075F29D288;
	Mon, 28 Sep 2026 03:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790566284; cv=fail; b=EXSnQjiKsHicISRFyOC/5nEmVarY828o+zLeoG4HbB9U37oB+cgZeytgguzuOCA8y6CFLnw3TvSwertqi+5JNnaejwJVw6rvBTfa2oPsa+3gzJwcoKPKYLWMXqhL/dwBydKhwQxq8ZAJu4eQTsLgCs1N1qE3YNHktBTFZUK9MAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790566284; c=relaxed/simple;
	bh=Da71YjTKszcMNtwsB7MNZZMpf90yLXzgNccCsaIhuls=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hBvHfu/d/0KEhVrPtHnnV6oLWtpnOal+ZMyXCdPJlfaZQPx8mUcm4vk1zvfmTHD89F6bBG87qlSWfnvZbMEJbwjc8kgjsV6i7ZoXlAYg31jRsTknuF+CWZNF0PRTTZzJ3W0864ZQtyyq7z0fbbPzj+PpVmRiOmjylB2aXrKI4DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=oMkg542z; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VQuSln/D; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="oMkg542z";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VQuSln/D"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RKA60k2283027;
	Sun, 27 Sep 2026 22:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=MdtETTIQYFzYw
	xfWc9yIYhq6wqvuM6GMPH6jgmXKiwM=; b=oMkg542zl8ZYU9oom7o4mudrxNBUt
	0CMh3BoMZPtWf0zXBmbl8H0Hdh3BQQMDaDValwyRPcw0yj8cB6dYHhFC1osiDdza
	XDetm4eFB4jpfTT5NqGBeFfIsiOiq20R1BVRuMBpHFNvll22YKWGXhTAW3GD5LMV
	kJ+wg6QMRps5UYjoqNYaWHrPWswukinwmrAoo0PYtoIR33HSGfHdo7lKXByTi+jy
	a06OgRIdlC8JBCrHyHK6GF44nIl28n43o93NLHkiF172oOOREm4wDueJnGgsOexZ
	IPG6C0TaPjAxro6mJ3w+ESOvWkupyMOmVxPsQTieEBuiC2sSVVwucq8PA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6num61-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:31:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1AqPTaMPimmnkIlTTUZKAtQq4zKqt8PGf/CbR//IY9IUPX7jsJ8q9+PE3IIL2LWajTGGbNOlKVy44utW6RBjZuabuUPj96xsIz6Yr0i5VBNs1BXyetHCxpz9a0XBtVubL7p7TJnYafTD8wIyiFmiOanndEAKESPHVE0oq9PTWUZajPR8HbE5lRZVw+YSNSGpJcHLjOSxi4qorUNwR559FnVjvSbcWMlriq4pNwcuNpYjy2SnVsp7Q8FzV5Xi+8jtBVoRnYH0ndhggw6v5bnvbJIKM/KMhPrw6wZuIt/MIeYxibHTVGN6k03OiRbqLBATFjyBFLdbW/V7L3GwAI9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdtETTIQYFzYwxfWc9yIYhq6wqvuM6GMPH6jgmXKiwM=;
 b=hdbWPUt2ZM9j3yRbwnBJjc8EAaaFUe8GQfH979COraUN1qEznryBWq2w0QNy1aAESYyx6BGVqF67olGXJv53g0pxUX2mVndOVwtrNSQ1alW2D1xZOur4iBv6LC37y2YilB0Ic/bGUEqsWeLaB1puaG2OABciUowp65TMRaqwZ0IdQcDgv7hkOh16E0YBMAain+yp7HtSTMG5x+nAqx8ZMnyKQe39ru1+qicbDXJLbd2HfUbeRypIDc3VeKz9usBeQm5seeTRO3xugPUNcL88hMWFcgpxx0a/clfOM9Rqwk++9ec4CMikO5EKL4uBOkFUulBMWAjCX+lrxnzHkVFEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdtETTIQYFzYwxfWc9yIYhq6wqvuM6GMPH6jgmXKiwM=;
 b=VQuSln/DkHldcVUiCA9DaeDwnhhwVEtbozXvsy6RrwR6QK0AQKucS5xGZPkX0FL9sp0dbconE0hKTKZm6jh3qlTbi3uO6/ex1Gs8Dbwu1myrf6MpXgzkC5MnPxLxqE0aGzKShdd7OBBmOA2LDNuoqk0sP434pttp9jmduIJMziA=
Received: from SJ0PR03CA0076.namprd03.prod.outlook.com (2603:10b6:a03:331::21)
 by DS0PR10MB8029.namprd10.prod.outlook.com (2603:10b6:8:1f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 03:31:07 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::24) by SJ0PR03CA0076.outlook.office365.com
 (2603:10b6:a03:331::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 03:31:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:31:05 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:30:34 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:30:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:30:34 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3UUvb2302035;
	Sun, 27 Sep 2026 22:30:31 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 0/2] k3-am64: Set MMC CLK pins as output
Date: Mon, 28 Sep 2026 09:00:16 +0530
Message-ID: <20260928033027.1077689-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DS0PR10MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: e11c3441-ac64-4d9c-24a3-08df1d10eddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|921020|6133799003|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Psera08+jUAkCNL2MXFWRVEMVwKSTVJMB+oR+/PlbMKzpXSNwmZb7Z3l841Ry1Eun2ZIQxEisvMqpbfYTK0iVGAHLQ7ChkWh2Qji9tpNfPtVdqyGj0pgQWaon7nJ9VS4fhPlUVDSi8uYLU70TPZ6H3qGlkTyq+Z96WxhfI+V+Qrko2MjrOIwNTp1D7DinE7ZQhCwNGghzgQwQSGfmwq6ycWHNcwmjZZg/Iuae4xKj+CCwIXEAXpaaLakNRnlEjF+nKxjxTCxW/VwHp71AGgvzkmeDBXmIQVLN7ntDuqSwv+5r9yMdRuV0DibNMpl8ETpJNCssmDuYPHct+SfxAiF7/APGtdiWaMlco14NrjUeV6ounlj250BOxGlKGVtjvIT/bk2s/hSn/LUWA8AXhJeCkXDN9Zj0iR6SgO4qv0Ywi2oBQ8VIBHqu4CnS87wio/94hBPdrQmfolnsrDStOM36Xvf0y69uBqDlDKjHmx+4L5z/e+xAYhfFEOU1pkpnqlGBu+V4NokYkjO4S2RJXQOHokDT2AO8TIlWXqDlojOiDK5MTt5DsT7lCLGI2ikK/yHQ4yHTW7/sqp3iAm9FHgB24r/30lYSqNQAjY5IL+W4e2Cl21PaouGmYO/jWM3MGkGx/IUDFRSkowXhBKr/uurqlyH/4T+v1EegzgX2xnMNVojmlY/7ruYSWfEkgRLFjDXBiTnJFmRotNtUwhjBCKoiF89Q3kfhVtkgW7ljP42KqYW96yWBKr0tzfPIaPeObbU
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TP4MtzyjjOlKJiKQoZDrjEpLqamwxArEOW345LFg0S+04/I8EBObbP7nA9c5QAUT+BMgkYff7XoAEa8in0Ns7h7PAOKfRM3I4UMiye0pSL7Yn7IGHIusfInDBn84wwL4ry6EdjmEbatFLp3F16w2sXn21gFFrLxavKliAfLC2JdAabSY9QZlLv3td5YpDC5RE4T2Eymlx35dft8flHEGOd13xty16YMyKIhe13N7LqfpeBWegkJt+xWw8f1YwPB8GD1jZIL3HlAIt7q9aGUUBAPkkBoY6zRCJ2CD/QxPJ2wTE3+53MHk6HLcnKDUY3PZ1XvZhP6Iac4sgb8SAe5FBKsj2VE1uAhqIcu9pRJJf37/ZgRH98+Y4aOvJLAdsqywlLF/uVvpcshwejMBWmnuvBS29W/+bQqcNeA3K/hMPPZ9U5eVPe2+035emmQ5PjGz
X-Exchange-RoutingPolicyChecked:
	WXp66hlc+N4RxQREt7mHbryFtGcx/fVKSZ6ZBMgioJbeTSpeq9jX+Tzxgs4HaNqkwJK3X/dLTJMVw4Qap1H5GYFS3lUMTzodAJTPmL/AnnblynvhEmyW/+XEsuBY2Kr9NNEwYNiL6LcsmdZriYgRq/irfYDzJLr9CXYtRkJ+W5813suHKHd0ZT9VJxSKRJugpAkXzeudv+cCtMmjurwqc1vXHrSiw8sfzBbeKtU0kU82ikeOo3RnmVHsE+r4jvP4d7dGYvKPY9Krm2PXHauAur0n1AfCvVGU5CxtcMf/bkNMvjQjqoOmQC8S+VHHVsiyAshpkQY7YVGj18u3p59z8Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:31:05.5887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e11c3441-ac64-4d9c-24a3-08df1d10eddd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8029
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX4jX3cipPWlix
 ASPQN6OXo2sqcGID03Glz4YIuLdI9s/Fa+jpGH2N9+C8ZcEsQaNkSwtvMX1BXnJSAbIRjR4janR
 qzhpXV6x920EO6YcMDbXFxRzmllHnUg=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6ab9df7d cx=c_pps
 a=GRGg88i0IYp+MSRJKvRoYg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=ksZ3Y0XGvr-vVOpflKEA:9
X-Proofpoint-ORIG-GUID: XE7VVa1Dy-gnWr-n2B_hbbltQsY0tnST
X-Proofpoint-GUID: XE7VVa1Dy-gnWr-n2B_hbbltQsY0tnST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX8qDURFriqfGO
 LZu2eBsbIrsBAAaXXc4QXiVFBbx+AIay40qhCt5AT5Iuv+/6jYmOiPfv9VlZLPZwwP52bFAOPEl
 EGY/3qKF0ObWGfevToHBLDLCLoxHtKBMPgJzC/yJEfTN6WOJtKa37hbsZjPpIDkEpe1fW2+PtpB
 lM0n0a87DrRZpprqnMf1IGHH3sobYYai+A3RaYzYztx884brXpFwiixNzc78lXD6xMTkqCJw9Sb
 uF0n+6J/4F2DVXO0aUXn90vlJV4qqV53T5v0A6cPv477uBlJbCrzvU5Ta4IV5kT3cXWtpG1/WwT
 agwUxIop8iQkZBXzR3NbIGzx8BIlruC62XdmY3UUkVGDutQTdcZdvB3hstdyMg6uhGqQVTWkvIx
 vVG1NbutaDEmt0KsDI4NH9Jr1trMikmODpL34+COmpRxwxqZ0mQ2PHYxj4gG3zgZaBrGflH1Neo
 CciSoE1oeKxxcpwGnXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

This patch series sets the MMC CLK pins to output mode
according to TRM specifictations on MMCSDi I/O Signals.
It also fixes some issue with MMC CLKLB pin configuration

Judith Mendez (2):
  arm64: dts: ti: k3-am64: Drop MMC CLKLB config
  arm64: dts: ti: k3-am64: Set MMC1_CLK pin as OUTPUT

 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 3 +--
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.54.0

