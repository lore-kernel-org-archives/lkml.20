Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15D03CC7CD;
	Wed, 30 Sep 2026 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797432; cv=fail; b=A0+lBF4Y4n8Kc6Wo7BQJI17lkSkw6x80xGKLbZ+rBb9pbbYcUB3LeAYhNqg0XJNsL+l2wsAAu9fjAgpanDPJEiTYFUTDS32hAMab4I7RNjuw/454DO7YQCqGWgFb711aojHewMC4v+G2nxttgn0bD8WuEZSPFOOPMxGFPpkDUK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797432; c=relaxed/simple;
	bh=98ZIjtSeCXjpuUzOrv8KJq4PUXQZg7Ty9ck3EwkFIiU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSEhxXN4q44jh6208zAnhHOSjcG7kG8Quc7vA8t6cVLCxtijf5Bt9eNRnJFfFrqW1bWKIKTrQVTv/ocVcn/t4Q3frhYtlzCJew4b2PBrKWR7c1psC+Sbvlse2w/ai0AdGEdvqjNsSEcdo/WMrV/nmRMtLuMgCsjwadalyEicgzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BE3AH/bL; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=slTxmcWh; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BE3AH/bL";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="slTxmcWh"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UI66ES3525072;
	Wed, 30 Sep 2026 14:43:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TTIY5pTZCBUi+K930r8QvsphxI20CtRzhByQVkyzK
	18=; b=BE3AH/bLnCasTx+WXE0KwsfeYXsdZYrr37fA/qVLJs30EM7Xf1DnNwOvp
	ZAmpDOow2wY241d1FufDXshD5QpYQAo9MNCPdrx1DQdjHxPPembM0VghqKmdaku4
	Uk7LlYrEG++ji1taEEMFbOjBkWenQahaJKdn7XjtjPENlQjChuQqRXHIQqia2oXN
	stRocnV6gBsEXbE4+JMMElRcEhlpEF6gPIQup9bWpK99lW1JFCRuOpWSHlk/tX4Z
	8YLFqH/S7k4jxnbPiUoC2GTUCDaKWb+XfYo9IrK1i1DoxzR0PHoU14lzwan/zBUX
	dsqTQZ70C/vxN/6VNxBZxWGVPwHpA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djrf86-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 14:43:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYxo443Oj7f/5e9qq9JV1ba450lyWLx+WUZSCvubLW1Mc/4ly9Z7HP+R/c8nX9FqFJh5ChU7h//MMFHgf6KxiFriIdYSUpPnkxj7P9bmb59nXsyog6PDYHfGNR43wl0SXSmaiXzp/a8yx3Sv9clmXnDJgDbiwXCXIskIWxaLCEZTbuwm8l0veaUf+/aOWutnH5vrBMgKbp+jD0d2psJ9vnD0+aFbXg9t0s/7TQvIykXvhYzfaxUcgU0mvZfcxUYs2TF9oP2Aw36bZh7rxbhCP6REEdCqOBK9KncjqnykWv8t++VMtV67Y/Vi6ipIRLpAbBEnwfrZNhKasmwqKvrvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTIY5pTZCBUi+K930r8QvsphxI20CtRzhByQVkyzK18=;
 b=JVKaLslGw3hWaoYg0t9rs/5N8zRXwFt/EVotDW6KdoHVEup56pqEK+xZEpxWSYp2etrjF5wnhSZJfTOd9nVO+L8S+VIxjAGctOEoxzRLsjC48iAQmeVZayY7OtMaZTMa/s0x3JVXGk4xSA66v9+QncwtHfYSySKwn7w41aCiG0NQRdGVU4NOTIy3yizypLIIX65OXFgOfjy9/c5CQ0MqhpXn2sIoZWzOKNqgE2JodTrCpKaU6jwcXRlSsHL+lA+z7AZqifzZGxtrr7A4pHGZzkg77lQ+ClmhgCyRx/lMVOnUCBMkPb8EOO9tDWbEntlMBEOx79IXeVqlqjbUs4nsgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTIY5pTZCBUi+K930r8QvsphxI20CtRzhByQVkyzK18=;
 b=slTxmcWhbunNMJSfp7GgI7HeFo98Kb9AAb41V2K9wRZ75eOp+2GnhvGip2nmXOXbEa1WoPeQ4DbZTw3MUlknS1m4zpAoXgOkovK1+qu4Vcxh5Z77RNZISIUozLVWHe5KnsiS8B3d3B5NJPF9tBxiOLjuK6SDvSHn/JL4fOu9GLY=
Received: from CH0PR04CA0101.namprd04.prod.outlook.com (2603:10b6:610:75::16)
 by IA4PR10MB8350.namprd10.prod.outlook.com (2603:10b6:208:55d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 30 Sep
 2026 19:42:30 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::9d) by CH0PR04CA0101.outlook.office365.com
 (2603:10b6:610:75::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 19:42:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 19:42:26 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:41:47 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:41:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 14:41:47 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UJfbCf3734543;
	Wed, 30 Sep 2026 14:41:43 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>, <b-padhi@ti.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/6] dt-bindings: arm: keystone: ti,sci: Update nodename pattern
Date: Thu, 1 Oct 2026 01:11:26 +0530
Message-ID: <20260930194131.117129-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930194131.117129-1-b-padhi@ti.com>
References: <20260930194131.117129-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|IA4PR10MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: e7af7fdb-3543-4087-3372-08df1f2af4ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CxNZTgTtOClnfLfeznQ71wLXeWK8H3KF+MJhNXYLzvmc4SIgOuxvDpHwvRm/MqGKjFrg+HKxqxgzZl7iIdj3Sp9c0Sc7eb/6Gy8ZSIiPhWQ6gLezpG+5zvxi7gWt6cVD8fPy2yU97vWC3gdJSddQ09ZyqysmYVGzhly08la+hkYDeJUrH5cqtSpVeY6T4dSs3/5bBXv/43KF7nApokepSsNQFTO++06XY1eymrNANbgZH7cwYpt4FoqBFpISENzRZJYROoOuVBP3unK9CGshAAUmq8qqLqlYrS2dILzkQzpaq8sx0ewH3To7aIOxIIJjPNjbDLIU52n0PDUnkbELm7PwxA+nrw6X9tsX80/PFB+JsjgwGNXWuyfmlOnecJmoPcJn5+1d0QA5kXQmRVwqD1ArRc0Km8xr3a7F0WErLREi3gglcNnzQQ3IGEf9OD8WcrS2s7oWQW9Cxrkr2j8h4OEfyVqzdSJ0nrO1xhulvxCT5Tzm+3dQnl7nz0toj3gyAgoQNjWICjMHG1TF59nou/WWn75my2Kuu4lJku0lRjvDJ55eSnmSWR4w0CtLm8C4rrrElmear/W9vzLvWxzEsZB6xN1YtGbr4LmSTPH5UnZlquld3MYYMkNVIOXeYYaK9h3qQJ8MQuc770oiH0HaO6tTQUY57lHpFws4Uf91jFg0gugrGyEd38gWcrLMzNAJyZmLtd8fBNsZQvc5Te2TTA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mGVdhYJXb9Rvc5O8TghPnDmWSSJeI0U7+eEHKRNgzYhxT6F4xUDTxozTf/z01Zlt39ZJwRgQW4ZyTkkIMdE02nEpeywfvXpGuevXpgLgL8Q62iQunhuaS9xI9eDgm7eeSsclpJjLfCBU4R4mMrqXe0+m58EyW4FyIDcH0be+C8JVuV0pnFc2QMf73kApBwPQ70uxGk8/1FKjVNP9wJjdFxIWG7JcXD/E0Lfrj0UTFk6HSG4uZrvhZOVx9FzIzN2fzAGRyalZmEKT7MX0nOu3ZkrOqdi08zb3F7Ty5KR2W6GetPFTwQ1/sz8o2W+g3BLQuc8S6cFUjHmpSI50BEfaF4uoI6w2WmctVNjkxuuV4d2E3PGA1KRxxn9Bvp2YZhAfsn1GQlcE84Sd17Xqk8HF+tFHB7di4cWY59Ihz4JpDYQnOaWyZcb/FfCRCtdpB291
X-Exchange-RoutingPolicyChecked:
	Xr4IQvNvtBnIuLzoFd8fFd9q63C8qYoon0ja2/hRlgaUGQLWrkl/2FV1wYDGiKCxoMAYJHTJusDsCcm+ckO7i7pEhXegoxD1sQMy+N0rEmnzmvTUgWf76sG2Cnj7IvWJTj+MM1Rcjn9T1p0/heuhcRCOFUS+ia606qq3VVeHCg2Ah5/+cX0C8L9kw4lijWQLKlP4/86TW2r79IJjoeo63pyKQaYW6iYCPy1KgOkmBsmVNmAwCiAfZ558bTTBOQtdY1Quzg32G0AHY57F1vOtNZnKSdhscCBvCdeo8siziQ7ETPuUlu51j6OeTGTWvh6tCi2Wfs6nKCCRPKWW9toh9Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:42:26.5164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7af7fdb-3543-4087-3372-08df1f2af4ce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8350
X-Proofpoint-GUID: xrZnK-Pyt_gPG_z5zt68q9fANIH3aD2n
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abd666f cx=c_pps
 a=qX5DP9EEIf1faxnBSU0rOg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=IeBu188vSe4QffjlIpMA:9
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: xrZnK-Pyt_gPG_z5zt68q9fANIH3aD2n
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfXwaainENB1Tpc
 5SVl5pryC3Ub9eIms1SwyMpUTqO32v0v2aqufGMxzafIAojTpXQBGUPL36kwtOmCd2yeK9Dhx5Z
 4FBb+SGtItgBiqh5NxNyOKUwfmaLl1o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX5AGp+YxZHoej
 C+AjMh827wZfY7p595gVSUSqg+zPXdFjBqZChrp+Y07TVgOZyqlpbP5R36EE+Bg33/0Zr1E2535
 69e5guMyCQO8R+09akQ6z93b6SeUZrXevQhvQ6vxJqh6YFDS5klcR24sIyoKG4VWj7Ul8jLojXM
 5JBX91Y192/LNHZx7K9QvkmLgQxFQ1uxMUuY/z7i9kqI4r36jHFpgoaYZo6WUb9y2IPw6LtWY6L
 Oh23hnLw7+Levbjf119fWTrypUewMzfu7zwmo7aF4RmSqyotQ3xyoXsz4tv/nfRxVGet5kA5QAz
 Tjshyc9kJzyUlNM7aixGmS9fQgTnq8qqTmPixy36xghuwuFYtc3n+qLVl32JA7RlAScCFJwjKtE
 evwiRuOc3BZtbOOunIV+XapsbRh5yu6hhUhxtOoz+7tEBwnalyWA/haJpygEkVggTwrR1djnXHI
 T78bAAMjSne7J5/mebA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300080

The $nodename pattern for TI-SCI controllers mandates specifying a unit
address, which in turn requires a 'reg' property. This 'reg' is only
used to describe an optional memory-mapped debug-messages region.

Some controllers may not implement this debug region, so it has no 'reg'
and unit address. Therefore, relax the $nodename pattern to allow the
unit address to be omitted for such controllers. Keep the unit address
mandatory for the existing ti,k2g-sci and ti,am654-sci controllers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Note: This patch is independent can be applied directly.

Cc: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

 .../devicetree/bindings/arm/keystone/ti,sci.yaml  | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
index 25a2b42105e54..67acce8a559a1 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
@@ -30,7 +30,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^system-controller@[0-9a-f]+$"
+    pattern: "^system-controller(@[0-9a-f]+)?$"
 
   compatible:
     oneOf:
@@ -84,6 +84,19 @@ required:
   - mbox-names
   - mboxes
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,k2g-sci
+              - ti,am654-sci
+    then:
+      properties:
+        $nodename:
+          pattern: "^system-controller@[0-9a-f]+$"
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

