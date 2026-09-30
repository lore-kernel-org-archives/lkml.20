Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3843CC7EB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797383; cv=fail; b=mg4XbrgBYAvbSCOa4dyxGBy+yFuh5CZu32xCE6dGjPEcKRQlkb7+l2xAil4aVIcDi8F8m6yu3q/bi2HSAaVJwDk41MIOya9b1I8gj83JUjRpiQipn2BgUwp+uxdT9+U9pKF1Dke7TUUHt7xWqtU5M+P8zU2u+hQCRX3O7pd4tS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797383; c=relaxed/simple;
	bh=NkYAYBG23VwCUKAtwzQOMo4XL1ps2kGknNjmFJEQUIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=udBV2P2ACNnQXg88+W/tL8rGLydPBVMIbdNKUSaYhpcrOXy5pOtouMCeuhd6D7NIVowsEXFMpXFg36QTEpMf/YfdU7TjWfWwiN7qQRluLhJOCXjpZDDqxJLR/X3Bo976chyrXvjtz9ihXUZjT4sCDnwpl1Cyf4ACJiECPWyYOUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kmYCi5oN; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=HUSuE3zh; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kmYCi5oN";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="HUSuE3zh"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UHewOv104573;
	Wed, 30 Sep 2026 14:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=N6F5kY4f5MGE7ka2CG+SMYziUHJvMZbQLeieKN5bo
	C4=; b=kmYCi5oNON7BtGEcSU6QM6K6ioBYPskNXhecoNmhxUmiIS/LWtDdyD+RJ
	kb/FHcgTSmh4Q7Km21lQ0WgLq/EGiamT59/bBVBHiCALx3W86vJN0dUl8QpjwfdC
	6l9lEJNtLf3WwywYBAielsF5J31ey4WUQQyMj6Q8Nx4QJZcDwYP53mvDgvOsMe/J
	GZ3v1lhfjinIrXNQInkY67+W2xxQ+XDiyGLPKO+MEix82/cHFo1g1m0X1iDCUUQb
	Eih9oFYv2cnA1wUzzx2DgpnJWweofMU8hzxg1tmuxrhcTC2aOsA02IDk4YCS3a1t
	ZRTrWcfzCtA0sgIpMjZ8m4sdtbCAQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s234e8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 14:42:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulp8lzcU6kajXqUu4BNYZ2ICIAu2Z1nuv1ZsaCDdp2eil8M46LqdpbyfE7mybi4UShDv6gWRD4z0wqGZM8GUzFAf83fJBEQIWJuBwd9ipx36EDKAAKbuctYHAcMSLLtX47UxHyvEGf712VyeIsErGjDAlEcKe9kifafYNK8SRPJjJdhmWLkfC0RFlLeHFLC4AqhJ2rq8YW2SpDUfRqpGqJdqrQnI92PoJOCCYr841u9dvor8wG/MZ1//y/4UyEjaaQGdYGtk8v65KnODEXZPBkj4i/ujvfY5HqRLwxgD/dBOYeJTJmGh1+k2/z2h4iZgjUFza7U2HWpT/i76KJ+Jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6F5kY4f5MGE7ka2CG+SMYziUHJvMZbQLeieKN5boC4=;
 b=Rb9HSRSMgB5kyk7SDM1QjYWAXOADyby7Gzq5rFm3Nqy5gxekJ2bGXBLr+S0XnCHcr9Vu9+M4AVj0MDoJIUkTsXlxi5/tN66rlFEpTht/3S7sQ9XfuxWG/pMco46clBNMtSd2W8yjHu/YGDbTsdnv3mrtTee/qmV9RxVtOT9ZpIp3IKN81ZOfLCqTxZago/HnmayHcexz8lHlPXk+4BpZl+WtL33jNDZ8wL1XLL9VNZ21YAaSWx/2XnM2Hu8mRmLKbcH6tZ/7KDmSWhKTannTDahBn2kDDlJZNgDGos4r2eGLbsq5Jt11hKZEmnENz4r6DhoxbvG565JaHLkHjsPuAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6F5kY4f5MGE7ka2CG+SMYziUHJvMZbQLeieKN5boC4=;
 b=HUSuE3zhBONQIoJ2+67WlPugxw2nDmvBAlr9XuMg0lFMa42hBU+1wuYn8h7vyXlEwteiagQwKEY+MaiRL6/ivC9Ox/zfVNgtTwC2K1vb2UvyWomUjWObqkHiI/FKnY3RIHl8Nsx+VaWfM4kcSpwDyApzGlc190FsBTmar/Lkhxk=
Received: from CH0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:b0::17)
 by PH7PR10MB6204.namprd10.prod.outlook.com (2603:10b6:510:1f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 19:42:49 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::a5) by CH0PR03CA0012.outlook.office365.com
 (2603:10b6:610:b0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 30
 Sep 2026 19:42:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 19:42:47 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:42:10 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:42:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 14:42:10 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UJfbCk3734543;
	Wed, 30 Sep 2026 14:42:07 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>, <b-padhi@ti.com>
Subject: [PATCH 6/6] firmware: ti: ti_sci_rm: Add ABI5.0 compliant basic RM APIs
Date: Thu, 1 Oct 2026 01:11:31 +0530
Message-ID: <20260930194131.117129-7-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|PH7PR10MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 252ff4bd-fba1-4fbd-bbc7-08df1f2b013c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c/nWebFaQjaKHyeE8TrOJxGRXQT/hYi2c+0nKD6aK6W3a9cTTGqqZNySXFRGNYVY3sG0KRgcV2b8zdypaG5h6oppdiqmTZnJOeGRfLZ8/z0xeXlrXpUYOQKGFKc4dFX8UOkaeok61h6CwqPPJyA+VSebdkM2Vn3MSYiSEs6I5m5P+jcQ8DLbV5PGKT8+qU2wlnti5HsvenI0uY0RXZKF1R0YYg73g3ABFWgj/BYvM80AcY1f/gkfdgv6Wx+Rq/qWckiQXYppFgz8riZ7pz/o8E2wq14182JtkqK1GUSGdCq1OhaCW7avDTg0uLQd5nj2CFmSFnpQesRp629eS9bSuwk/tjMcthm5h+wcAtVYuLdU5CBBeap/YvOLrOccRYfeYDUFgcjyakKjf3GMhkhtjF4TZmXm8390CggrDnR8uV3zdRkoUPSUR8Nu5P+EYJETXPJ2k9GNqG51ATxr0ZpA7DyCt04iGFylUcUvV8R7pFSJfbfWagxI/TeeG9umpb4ZmNqiZQcjzuGk555HHxoH5YZtJcuoudtaGxa97j9ONW0IDUATr6TczSYGB9OEGP/tmjvhN83T0Av9x3Ztn2+0Nl7qbrGU7xREWjexMMPRZUICAvrTiLuXstj1PkuwGhZ1SzcaxMHq5UZPty/FD+6gNOMn7kPtlJNd2BgsRsiDvqSRznnr8qVolXyMR8zE9yvWSgkjDEmttieFV4IBJDHZQA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	24SnQO6YkVMcFXQB/nq0KFLUtBzpHJADeAn87R0Y6x66hrA+orCJhl11m9et3HwremPGY6n7MBpZUCabUyWff5QWryL66bF2OoNs0UcjAEWdfP3djLnRwaxU/teSuN0ftmJBXD42n4gXkrQ1YviAYT1E2c6c4EaR4XfWUgzL5Na+KoOBhQL/XSHiAUwHbKbamRMqGfBzbiwo3tZ67RplqcGmk0lobAt2xKBKUzyYl0D+sTF59x7cW95eerfpaiamvBTtdlhsd+36wSX7AGAbh1ftrgrFUtp/T7JGq9HGbQ+KrO/Bv92QfviMMG2fpmJHJDUH/zTf2DSgqVFMFeWSUiGKC5J1XDfzTFvPVWgfrGr+pXBAbFjboXH5qj/izdtTxjv0aGPTFdmPVVeuvTZhyD48tpmLCdHe/VcgogWjoTCbz8uknd5k1IrN9VH2cbOz
X-Exchange-RoutingPolicyChecked:
	CV04y5b9vEgk8znRUHFWU+/4cY/OqxP2ptVopaOHRtFFm3UqYwumbZahR+3r8nvOKySMrksekUD/scGbywPDDwKB/cphEipCjlq/l8Sg3L7OJL90wTXhQ+8Axip4nNjW+Zlj1zwiWibbqSABFsJ1iVvnDsdshhx8/FoPofzFM6xI03H3/kL60Qn6sBiN5um36P7V41/Ysw1KKSUaHZkqHmPs7yUkywM0JN288TywsUZkJ+szkJavsz3nL8smD41Xzv/Vf796WmZYXr/U1H8WmwiCSJ1UgFPh1uXjMjGyUETkRg8MtQCNoUq+hLYf0Kqxoj0XfZueEOawu07kEyljwQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:42:47.3769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 252ff4bd-fba1-4fbd-bbc7-08df1f2b013c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6204
X-Proofpoint-GUID: Up9jijjbj19Q-eW-ZtsXdwvRtTa7wT3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX9y9b4DvtZcjN
 qwi+Akqa0cOq5qzV9Br+F7wIp0+9VFCBUb5aqt1dybuBbQiGiXTPL7ZSglI996sDcsPY6OFa5d+
 hqWJtpWmSpoh/8XEmKWIMPkUHmbnDC2t54pwVv3OHi0EwvAdbNXv2vVurUY+El82MVxgy1U+FWy
 XNXdGTYLRXUQo0gR+9y2uNaa2V+O1x2UASGwcZjwf1APaCHIVEqitZD88+TzFrg0mqtQrcbLotj
 5JwcVgk6bM7bZkppba3NB0MO5mfq22CaG/af7o8WWzkUnIljcPZ0KrH4z1V09JIHCkQoohsllOM
 b2RyrmBhObZx3N6rAL/0e3uBwFn2O/G2f7w4AkmAjqvv6R+kFM/TXoK9kaeFRIlcwgORtZbQZRz
 6G1i4FFpj8N8cIMfBExvrYaPFCFqGgQ6xGa9nrWpYyFVQkGINyvZddLg/sjVgKORgP7u5nAhoj8
 yIDzyN3GkyHD0nVAmRQ==
X-Proofpoint-ORIG-GUID: Up9jijjbj19Q-eW-ZtsXdwvRtTa7wT3l
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd663d cx=c_pps
 a=Fekr5IJHOwr6cQga7yOItg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=fM95QmtDON9azFMmV0wA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MCBTYWx0ZWRfX3VxF3dHJelzJ
 MhegKgvHBQ/zRQE81SZF0QTvrS4be5St0/a4LiDw47ICQuryk+EclOqmNXfxFCDCxjo31O0qgHi
 EbI863jjB6OZKT/edgIKdi2G3bnfxKs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300080

The previous TI K2G and K3 architectures were tightly coupled systems in
terms of Safety and Security. All the TI-SCI messages from HLOS (Linux)
were sent to a single sec proxy thread terminating at the core running
Safety service (DM). In K2G systems, DM handled both Safety & Security
requests by itself. Whereas in K3 systems, DM serviced the Safety
requests itself, and forwarded the Security requests to core running
Security service (TIFS) on the HLOS's behalf. This posed various
limitations:
   a. Increased latency: An extra forwarding hop through DM adds latency
      in requests and responses.
   b. Freedom From Interference (FFI) concerns: Having Safety service
      proxy Security's requests (& vice versa) undermines the isolation
      and FFI of the system.
   c. Potential Deadlock Scenario: Forwarding messages between Safety
      and Security cores can result in a deadlock if there are circular
      dependencies.

To eliminate all the above limitations, the TI TDA54 class of SoCs
introduce an architectural change: Isolation of Security and Safety
services. To realize this enhanced isolation in hardware, two
independent sec proxy threads are now provided for HLOS to communicate
separately with the Security and Safety cores respectively. And the
TI-SCI message forwarding has been eliminated in Software. The System
Firmware ABI5.0 version necessitates this improved isolation and FFI
change.

In ABI5.0, the message structure for manage_irq has been updated to
remove the existing ia_id, vint, global_event, vint_status_bit fields as
they are not supported in hardware with TDA54 SoC. Therefore, remove
those fields and flags from the ABI5.0 structure definition and add new
APIs and wrappers to send the manage_irq message with this updated
structure. The TI TDA54 SoC has no Interrupt Aggregator in hardware, so
the event map related ops are invalid in ABI5.0

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Note:
This patch is dependent on the following 2 series
1. https://lore.kernel.org/all/20260930172948.2901336-1-b-padhi@ti.com/
2. https://lore.kernel.org/all/20260930160607.2674980-1-b-padhi@ti.com/

 drivers/firmware/ti/ti_sci.h      |  34 +++++++
 drivers/firmware/ti/ti_sci_core.c |   4 +
 drivers/firmware/ti/ti_sci_rm.c   | 148 ++++++++++++++++++++++++++++++
 3 files changed, 186 insertions(+)

diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 5e0a35b394d19..32276a66bb8b4 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -1104,6 +1104,39 @@ struct ti_sci_msg_req_manage_irq {
 	u8 secondary_host;
 } __packed;
 
+/**
+ * struct ti_sci_msg_req_manage_irq_abi5_pdm - Request to configure/release the route
+ *					       between the dev and the host.
+ * @hdr:		Generic Header
+ * @valid_params:	Bit fields defining the validity of interrupt source
+ *			parameters. If a bit is not set, then corresponding
+ *			field is not valid and will not be used for route set.
+ *			Bit field definitions:
+ *			0 - Valid bit for @dst_id
+ *			1 - Valid bit for @dst_host_irq
+ *			31 - Valid bit for @secondary_host
+ * @src_id:		IRQ source peripheral ID.
+ * @src_index:		IRQ source index within the peripheral
+ * @dst_id:		IRQ Destination ID. Based on the architecture it can be
+ *			IRQ controller or host processor ID.
+ * @dst_host_irq:	IRQ number of the destination host IRQ controller
+ * @secondary_host:	Host ID of the IRQ destination computing entity. This is
+ *			required only when destination host id is different
+ *			from ti sci interface host id.
+ *
+ * Request type is TI_SCI_MSG_SET/RELEASE_IRQ.
+ * Response is generic ACK / NACK message.
+ */
+struct ti_sci_msg_req_manage_irq_abi5_pdm {
+	struct ti_sci_msg_hdr hdr;
+	u32 valid_params;
+	u16 src_id;
+	u16 src_index;
+	u16 dst_id;
+	u16 dst_host_irq;
+	u8 secondary_host;
+} __packed;
+
 /**
  * struct ti_sci_irq - Description of allocated irqs
  * @node: Link to hash table
@@ -1879,6 +1912,7 @@ void ti_sci_setup_clock_ops_abi5(struct ti_sci_clk_ops *cops);
 void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
 void ti_sci_setup_rm_core_ops(struct ti_sci_rm_core_ops *rm_core_ops);
 void ti_sci_setup_rm_irq_ops(struct ti_sci_rm_irq_ops *iops);
+void ti_sci_setup_rm_irq_ops_abi5(struct ti_sci_rm_irq_ops *iops);
 void ti_sci_setup_rm_ringacc_ops(struct ti_sci_rm_ringacc_ops *rops);
 void ti_sci_setup_rm_psil_ops(struct ti_sci_rm_psil_ops *psilops);
 void ti_sci_setup_rm_udmap_ops(struct ti_sci_rm_udmap_ops *udmap_ops);
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index a8135e611a515..cb83ba99631c6 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -716,9 +716,13 @@ static void ti_sci_setup_ops_abi5(struct ti_sci_info *info)
 	struct ti_sci_ops *ops = &info->handle.ops;
 	struct ti_sci_dev_ops *dops = &ops->dev_ops;
 	struct ti_sci_clk_ops *cops = &ops->clk_ops;
+	struct ti_sci_rm_core_ops *rm_core_ops = &ops->rm_core_ops;
+	struct ti_sci_rm_irq_ops *iops = &ops->rm_irq_ops;
 
 	ti_sci_setup_device_ops_abi5(dops);
 	ti_sci_setup_clock_ops_abi5(cops);
+	ti_sci_setup_rm_core_ops(rm_core_ops);
+	ti_sci_setup_rm_irq_ops_abi5(iops);
 }
 
 /**
diff --git a/drivers/firmware/ti/ti_sci_rm.c b/drivers/firmware/ti/ti_sci_rm.c
index 87f2ef5785e09..23535cb25f051 100644
--- a/drivers/firmware/ti/ti_sci_rm.c
+++ b/drivers/firmware/ti/ti_sci_rm.c
@@ -155,6 +155,45 @@ int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	return 0;
 }
 
+/**
+ * ti_sci_manage_irq_abi5_pdm() - Helper api to configure/release the irq route between
+ *				  the requested source and destination
+ * @handle:		Pointer to TISCI handle.
+ * @valid_params:	Bit fields defining the validity of certain params
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ * @s_host:		Secondary host ID to which the irq/event is being
+ *			requested for.
+ * @type:		Request type irq set or release.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_manage_irq_abi5_pdm(const struct ti_sci_handle *handle,
+				      u32 valid_params, u16 src_id, u16 src_index,
+				      u16 dst_id, u16 dst_host_irq, u8 s_host, u16 type)
+{
+	struct ti_sci_msg_req_manage_irq_abi5_pdm req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.valid_params = valid_params;
+	req.src_id = src_id;
+	req.src_index = src_index;
+	req.dst_id = dst_id;
+	req.dst_host_irq = dst_host_irq;
+	req.secondary_host = s_host;
+
+	ret = ti_sci_do_xfer(handle, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * ti_sci_irq_hash() - Helper API to compute irq hash for the hash table.
  * @irq:	irq to hash
@@ -253,6 +292,35 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
 	return ret;
 }
 
+/**
+ * ti_sci_set_irq_abi5_pdm() - Helper api to configure the irq route between the
+ *			       requested source and destination
+ * @handle:		Pointer to TISCI handle.
+ * @valid_params:	Bit fields defining the validity of certain params
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ * @s_host:		Secondary host ID to which the irq/event is being
+ *			requested for.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_set_irq_abi5_pdm(const struct ti_sci_handle *handle, u32 valid_params,
+				   u16 src_id, u16 src_index, u16 dst_id,
+				   u16 dst_host_irq, u8 s_host)
+{
+	int ret;
+
+	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d\n",
+		 __func__, valid_params, src_id, src_index, dst_id, dst_host_irq);
+
+	ret = ti_sci_manage_irq_abi5_pdm(handle, valid_params, src_id, src_index,
+					 dst_id, dst_host_irq, s_host, TI_SCI_MSG_SET_IRQ);
+
+	return ret;
+}
+
 /**
  * ti_sci_free_irq() - Helper api to free the irq route between the
  *			   requested source and destination
@@ -325,6 +393,36 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
 	return ret;
 }
 
+/**
+ * ti_sci_free_irq_abi5_pdm() - Helper api to free the irq route between the
+ *                              requested source and destination
+ * @handle:		Pointer to TISCI handle.
+ * @valid_params:	Bit fields defining the validity of certain params
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ * @s_host:		Secondary host ID to which the irq/event is being
+ *			requested for.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_free_irq_abi5_pdm(const struct ti_sci_handle *handle, u32 valid_params,
+				    u16 src_id, u16 src_index, u16 dst_id,
+				    u16 dst_host_irq, u8 s_host)
+{
+	int ret;
+
+	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d\n",
+		 __func__, valid_params, src_id, src_index, dst_id, dst_host_irq);
+
+	ret = ti_sci_manage_irq_abi5_pdm(handle, valid_params, src_id, src_index,
+					 dst_id, dst_host_irq, s_host,
+					 TI_SCI_MSG_FREE_IRQ);
+
+	return ret;
+}
+
 /**
  * ti_sci_cmd_set_irq() - Configure a host irq route between the requested
  *			  source and destination.
@@ -345,6 +443,26 @@ static int ti_sci_cmd_set_irq(const struct ti_sci_handle *handle, u16 src_id,
 			      dst_host_irq, 0, 0, 0, 0, 0);
 }
 
+/**
+ * ti_sci_cmd_set_irq_abi5_pdm() - Configure a host irq route between the requested
+ *				   source and destination.
+ * @handle:		Pointer to TISCI handle.
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_set_irq_abi5_pdm(const struct ti_sci_handle *handle, u16 src_id,
+				       u16 src_index, u16 dst_id, u16 dst_host_irq)
+{
+	u32 valid_params = MSG_FLAG_DST_ID_VALID | MSG_FLAG_DST_HOST_IRQ_VALID;
+
+	return ti_sci_set_irq_abi5_pdm(handle, valid_params, src_id, src_index, dst_id,
+				       dst_host_irq, 0);
+}
+
 /**
  * ti_sci_cmd_set_event_map() - Configure an event based irq route between the
  *				requested source and Interrupt Aggregator.
@@ -391,6 +509,26 @@ static int ti_sci_cmd_free_irq(const struct ti_sci_handle *handle, u16 src_id,
 			       dst_host_irq, 0, 0, 0, 0, 0);
 }
 
+/**
+ * ti_sci_cmd_free_irq_abi5_pdm() - Free a host irq route between the requested
+ *				    source and destination.
+ * @handle:		Pointer to TISCI handle.
+ * @src_id:		Device ID of the IRQ source
+ * @src_index:		IRQ source index within the source device
+ * @dst_id:		Device ID of the IRQ destination
+ * @dst_host_irq:	IRQ number of the destination device
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_free_irq_abi5_pdm(const struct ti_sci_handle *handle, u16 src_id,
+					u16 src_index, u16 dst_id, u16 dst_host_irq)
+{
+	u32 valid_params = MSG_FLAG_DST_ID_VALID | MSG_FLAG_DST_HOST_IRQ_VALID;
+
+	return ti_sci_free_irq_abi5_pdm(handle, valid_params, src_id, src_index, dst_id,
+					dst_host_irq, 0);
+}
+
 /**
  * ti_sci_cmd_free_event_map() - Free an event map between the requested source
  *				 and Interrupt Aggregator.
@@ -879,6 +1017,16 @@ void ti_sci_setup_rm_irq_ops(struct ti_sci_rm_irq_ops *iops)
 	iops->free_event_map = ti_sci_cmd_free_event_map;
 }
 
+/*
+ * ti_sci_setup_rm_irq_ops_abi5() - Setup the Resource Management IRQ operations structures (ABI5)
+ * @iops:	pointer to TISCI rm irq ops structure
+ */
+void ti_sci_setup_rm_irq_ops_abi5(struct ti_sci_rm_irq_ops *iops)
+{
+	iops->set_irq = ti_sci_cmd_set_irq_abi5_pdm;
+	iops->free_irq = ti_sci_cmd_free_irq_abi5_pdm;
+}
+
 /*
  * ti_sci_setup_rm_ringacc_ops() - Setup the Resource Management RINGACC operations structures
  * @rops:	pointer to TISCI rm ringacc ops structure
-- 
2.34.1

