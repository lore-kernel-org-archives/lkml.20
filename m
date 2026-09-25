Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931A349CF27;
	Fri, 25 Sep 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343094; cv=fail; b=MFSQyA6+vNhOc+UF2tfP96zvNKatcChUTlh6OOJF4g6DQc51FCy9fHdm/EtMsV0u3PVKMPowRdV/kHMVQLBr356ONlCYOYCTplauOFjnrgGExcpWpL7x1LFtZbzeBSO+jxxDUTBURTFZ+oXLzmo7byle7NX3Qwx+uTVrJnp/V/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343094; c=relaxed/simple;
	bh=vjwK+SOBclmufGG0O/qKxmpHILoEc6WzVu8dXWixJxs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4YZnU1Djo9n7rvM790fiyOrz6G2ytfq55ENkqijsNCn8uoMjtdJHGvIGORMlvOCH16vkYpbYzbfCjSL9zhmQ5PDwCT+y1TdvaOK04ViM94BIf8ZiFguDXvSXy6jDMuEqyBAlgBJrWxel9thnIdVvZVmsoNSLH4b38sJhaZL8zM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KrK8GKkI; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BP4Fe7m2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KrK8GKkI";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BP4Fe7m2"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68PBOVIY2451668;
	Fri, 25 Sep 2026 08:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Rw3VSV4rAnxcvUfqraIy/mQiWWmVzVIAtmfqUD1IM
	IM=; b=KrK8GKkIJnQHU9zxsrPFvXN9fo4VD58eLYFM7ZSRFMcVc+D+9QSRVocrb
	cE43oWsVvQkOCOJmo8FRiaeGC5q+mWDkaj1v834ZsOtxzX+u4Mt579sfDbMPiUsb
	BGmt9vfbeh8yi2WivuAojFxj2fl1vLjkU/OLn4NozN8pBmtmpRpmI2vh2o3u2n5v
	ddQCxxNwM03u+5/eCgeC/cVoaEbbEIF6EUupzg3DMoTbc/1ASRTA4wnJcusT/CcP
	3pAqD411nmPNkQkLCEK+J9VM4BhOk2Z+qXlz3oNjAvUZbycqfwzepkag2p+ZIoYJ
	/uxAm4Bn5IUw9NaB7vg5qOzt8LmNg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gwjq4aafx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 08:31:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mge0TG5DnZN1VWjD0T/bgR4PB+/8z8JNV9jhNMQScToZubkgfbu1nSCR57YYSM+6Mo4mRyQhj/hXlpAynqYPJhedjmDEX7CjhNhyiaZVJ+ysEV0nfusxR08KmbcPOPdw28j83PuGJuYER9OXBtiPJVvEb660VH2PPPBFQzWMxNfJF/2XAXTKcEfDNrktrnZKJn9PAFIaXFVhK/H+el9yCEHzJYc7rbIcaU6qZ1wdo3EmLsrFaNFiRDETnKoAa6AHtgFdhtSCDA2nZjvmkmnAwW4PHK7l6Vi4LxUZ/t1tvfE9lZ+fmAtOkTqabP1d6H7+D+xgvanGhY8/QXj4Fs7ulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rw3VSV4rAnxcvUfqraIy/mQiWWmVzVIAtmfqUD1IMIM=;
 b=E8ClWdDwYlCYkb8hQqE6b1HGD6gtkRkwXzoyMuvbD5f8D8NnAt0wVb1sV4NLc8PcBlKEUE1p6OLZO2Fj0flrcXdahh5W8ZmeNl1396eS7c+BV+Z934Iy7Eh0lcErVac4JN5E4dEwyEcRgo5TSZ3OCRsFkJqVMwZmE7q3NbCSty1wI+VmPYvKZjNo+ixAeNfXSJQAp8ezP/UGxE1LvMqUI/Ph+nB1ok1veOXlBqEADj1Ittsu6hcbjcMd+kM9KC8ps9QcM+MP3cvqWf30AtSfhWx2VBR9E2F8NYAUG+PviUxYN+8sUgme5+UO9+7hfgfX9TgBpSX2IZ56Dq7tgqmXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rw3VSV4rAnxcvUfqraIy/mQiWWmVzVIAtmfqUD1IMIM=;
 b=BP4Fe7m2Lk/MPnorAluYViTvceIOzh2I0bLEK7mhmmCMK4JUyqvxlJ8TbTBaX2KX7NjFRouc+JvxinAyh8sVJwEc2jWvtUZgZNa/BqMQ+4rAeTZK4nsgwB9HwSDwExKv2Flv7ZPOzLb1b3x2D2P00NRbZkMLi2uoZW92rg/z9QU=
Received: from CH0P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::28)
 by PH0PR10MB6984.namprd10.prod.outlook.com (2603:10b6:510:288::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 13:31:09 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::73) by CH0P223CA0018.outlook.office365.com
 (2603:10b6:610:116::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:31:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 13:31:07 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:13 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 08:30:13 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PDU1n62840014;
	Fri, 25 Sep 2026 08:30:07 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <sakari.ailus@linux.intel.com>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mirela.rabulea@nxp.com>,
        <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 1/8] dt-bindings: media: Add bindings for Omnivision OV2312
Date: Fri, 25 Sep 2026 18:59:54 +0530
Message-ID: <20260925133001.2780868-2-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925133001.2780868-1-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|PH0PR10MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ad4b5f-5f3b-4c23-62d2-08df1b09416d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|7416014|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	cCnj07odqTmh2UyTU8pepMrFiX6KXoAfDxq1KdKTh/9+24Xk8Ke5N3BfIw8KHB7Cj4pSVxZGqsjDo4QZBPOYK8mohyavBgeITJK9+Ke9Rm+56jNnYxWK0UpjHqKU4dC/u799GRCXaso7tluLrZfwi7xZpqol41P4E4ynlC34S1JVxkQFsIENJz/SMLV/DPDstQTGynFKCBCtcwMAxDTd9H3zqK91sE17gqo2IeOdpZIH9qwUdYnm5Wbo6vYQYqXK2vL2Cgh5Bv6an+kiLkVcoh1oMOQQqQW0vfEoUG2WyvxjE97inROiIVijQLJa8/CQa9oF3kQNHvjPEXDGvX7oJs1M0CqTg9xNSq1b91b3W4sFsd2gg6P2VucfTdynWcuUlsP/Ih7YvuD0lT76R2BsOgmVDKhp0HIk+R07ks7LeJfmtFStXZ2claY/P7AEkBymRxg9Ag0nJY8y2LqBGRjt+K0FS++sgV9mMixvnTk7vYvIOLDI64xniGRS2FJvMTHivY/IZXJx3szcLUIdQiVBeW8Tq7wGWFXHyET6Ax/qiyetwi9Is5sAZ0nRfFDsd0kXrfFSyvokCh/rOhyfiFom2Tu4beE86DFAzLe3RtrkGJ5VKCknoso6HWmWGL9PNxS5u42uDfa9N82C8gfpmZLTsg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(7416014)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qdwKIWROeZJ1+oy7VVO4AotZAmGG/5jYBAJ3lQaY7C25wz+6OiCQhhUncH+WpVYfOBCrx7dCYJ1/Vl1/JPPJ7xrbAH0SwT8Kx6qlsbrn3htFYOZi+0qXDR+XtC6R57DgIawj6e0Q1q8ayV8c/cuOkmjCQKAoNEjZxX+x4LjbU/OcSpmEGktFzs/xu8da8TC1096mOnpmoystLOYnn29sLDXm0IhuUjV0UijRk2PzpHfZGYUeNFyj3XpFihaNEPNcSkkqE95R+yKZ7lcH94bM/+4ETzuCR6qiMLe8Mse5AmdnaC3/UdhVosYDjVY9S5cFMLigpj5vNgqGwwtWrAfhl+rr2FOeF4C8u+jUOj8dPzKXbh1or9QKxJRo97cmpQ1IYMWk6F0SmL48fxiD6rSFBNfVPQMWaZzxWXjX4U0fSTeam5bRrFmiKqkn+p4bG3Oa
X-Exchange-RoutingPolicyChecked:
	js83NWLsCVExnnaFgccy+ryi7vOB2wfYVmRzmMlX/dngKa8wE3RvMYel0vJC32rNbgTmMEuGeijDsBOQgYEsNI5EQu28iQz6LTq0R+LbXAFJrqh0YrjnEPEYg+5sA8Pqlms94xoHFJaBwaG/3k1/3d0kQTOs3/f3TA3FZK/pdrdHVcagsMWSQV+L/PJ7d+ThBoKM3N+HNs5mnH3cNWOInwH+mPE5m+RPKwu/3p/rnesRlhoI5lc7Gv36s7UxBdhax9YK4Y2FeNLxqiaubVKgnGXp8sXYJyMX+vRlFYsTcNsQXqXuf6fW/rPc5tIiGlESI24cTRgtJZVyODZABasOmg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:31:07.5346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ad4b5f-5f3b-4c23-62d2-08df1b09416d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6984
X-Authority-Analysis: v=2.4 cv=H+pOUOYi c=1 sm=1 tr=0 ts=6ab677a3 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=0AmtJ8XXKEB65C6Zt7gA:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: HJPD_P6ttPlFe6eULnolhvDugOvACkTQ
X-Proofpoint-ORIG-GUID: HJPD_P6ttPlFe6eULnolhvDugOvACkTQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX0mslVmbSqrXM
 Ayy2G1ei8PQFEgCH1NGVsmWrTrpfKqz320LfGUbzABt4Y5LxIMfFestWnGgHt/REjEv4f/Dxy+s
 Q4a/+xGHkLLt3dz6loddcbw7UxuOJ/0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfXwXrrC6ABjPVP
 vzRdDS4NnJr0OSfNh5//UV6UZ0gQ4fZ0s0rtGCV8hB6hetjE7XFoVepW7k/Pb6RBtrMwogQMZzD
 iS9rAgDPK3IMetfv00bsSUy5qXsBuwcvjoxxLvN7QsMeqqgbhxgwEg8781J1jXqulCUYlCs6fJS
 ba0AHSQUWG4EltMrMYXI8UnNGO4r5qvCTRySV86W7m9GZwAwXySusQToaWlyfY/+vMAbID0Qt4c
 InOoj8R2C5IIArM//rEiLMQdI1Q/cNK7ylALV0zndPadpSFF6//1KAQ1yRlbmdVwPkAKDPhb0HB
 Kj/ahHZ8hXpf3EF93QqEhhKQhkfczGfYYeH3HDBSqWs4/2fjx0Px0KTbBNkWRrQ+A1ggPVZa8Ev
 uuddz5wREki9Fk/Jq7jDHGrRh8L4AM69f7WWYaQsah5I8AYKgUlPDe0KWeag+dHupwrqjY92g9X
 5tLznPqLJc5lC1Qdukg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250053

From: Jai Luthra <j-luthra@ti.com>

Add DT bindings for Omnivision OV2312 camera sensor.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../bindings/media/i2c/ovti,ov2312.yaml       | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
new file mode 100644
index 000000000000..76929fcc6550
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2312.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov2312.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV2312 Camera Sensor
+
+maintainers:
+  - Jai Luthra <j-luthra@ti.com>
+
+description: |-
+  Omnvision OV2312 is a camera sensor with an active array size of 1600x1300.
+  It supports capture of frames with a 4x4 RGB-IR bayer pattern. This provides
+  both human (RGB) and machine vision (IR) capabilities in low-light scenarios.
+
+properties:
+  compatible:
+    enum:
+      - ovti,ov2312
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xvclk
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Specifier for the GPIO connected to the RESET pin.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: ../video-interfaces.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@60 {
+            compatible = "ovti,ov2312";
+            reg = <0x60>;
+
+            clocks = <&fixed_clock>;
+            clock-names = "xvclk";
+
+            reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
+
+            port {
+                camera1: endpoint {
+                    remote-endpoint = <&vin1a_ep>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.34.1

