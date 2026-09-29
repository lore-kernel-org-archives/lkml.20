Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24723569F21
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713172; cv=fail; b=AQR5c19nqmN8U8xOHGrq4Wf664mxF2pUasa6sIFupc9vE8eELKIxCIzJSqakb6c+m96PUezi4llN7NJI5BbDjLn6xa6tG6lg8laxe3SMhnySbk4yRqrwI+zbgGRhByNDivNPS9BVu03Ibt7uhI2bkPVOF2QXVNemEGlkwaYpKak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713172; c=relaxed/simple;
	bh=U6XWDhO9yeWxRvQ5xYlUYz1XXrGvgYr0QV5tJ8squAQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W11DqD0SHxgF+FhaKE8/M+BGTyRjr9fA/Smsx9nWQmXTDKIT71D+C8926ZeOtTevtpJ9WIYYTW1bPTh+a6irDNTeCgnsPhaWHFqnA4P2QIuviMnKDiP7CtBA+tXrLtTgD6Yi/bFWOt7dPxN7MrnoW0UWbL06N1Ui76G3H5Dfkvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CH+xtUby; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=lOMIm3p2; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CH+xtUby";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="lOMIm3p2"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGLhnX486829;
	Tue, 29 Sep 2026 15:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oOZHPEr3EnQHO6uQslORg2f9HSGDUHMDFveRaU2UF
	3c=; b=CH+xtUbyIlAHIJdKemy1G0EsNJ1Jj3WLA/WRy8X1HuqfvL4TXoVWTWYyl
	022eqOHbs4WG0G46ifo7NoHpOWOmxiOXqsiocNtUJR4Dw6diQ4ZSvGuQsHtFViI0
	OCXxvOopQ3zALwsMTg9PWX/MPCy7FfGVBv5Io8KW40DpuCgbL8jM8MvSjIJmPOcQ
	TUO8ebkWcREPtmFPvIIhcyd7056lFXr4AGAXEIfeIK2xySOuA2n/F3UxogGz7T3N
	d1hDl3LN3JIAtzvO2p48CEtbSc5kZ/a2a3d6Oy8CzidjFFcFZDYo8po0kX0+tju6
	qwA7qhNQ2pxYO9Y8M6qhsfJEQB2GA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc3a3k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:19:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UavwdfllMV5heyk6HPNGAK1N160BPp62oBACe3r9EGdxJEYvGtZKrlvHafZyx44ls0G/FXDfH/Glw8sjhMJJmCld6W8DuIkc5KTgrmnGbG4mj4xNoz1KQIajiacM80D9N/UmVpGF2OGSCVMcbYUgYMMnuoF5RXLdymekgHTV+TRgbyBMUu70tbq3cIS3Z1JarJFHwoXpWz53sK+CT3U+OnEOlABARaZ3zutyf0kLa7Eu+Ve0uL7IwnMGsr+2iwOhJ8WymUNguHThoZin3QwlVcPP95pKMtrDWZ1bc5FvzJFcDRbELVU/bfVgZ1xQLIdzhN5HgyDSyGFOoaTSwehVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOZHPEr3EnQHO6uQslORg2f9HSGDUHMDFveRaU2UF3c=;
 b=Qej4Nd0Uh6/sr9XfF2dAu1QpHgOApFbJ4kjTDTeGNpADm3b5peCMPgb03TsMtL/c8e/tc9Cq97rSCjbWaQsJcr+yGByKttyDUQwXgNv4QuazXEv043nHRVm+E9P+XUtn9pA03hrMcg69HpOe7XkFYy31XzFgnwXbp4xFcpImJGWB8lqRerIuffRt5LKnZNUd8c+hvM2h7Vw2vUdsVZLX+VJh6Y/gKdDHTWUPIB5ePIbEOvie0ol7435wVRW/FriwoOIt+zwcB/MQw6SlAyz/Xp7b7OY0jZyesQmTJl+1irCL5kr2uTQG6eKbbMjvZX/J142JSoj6dUJPYjJ9F9DgAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOZHPEr3EnQHO6uQslORg2f9HSGDUHMDFveRaU2UF3c=;
 b=lOMIm3p2sRWLbDewLVHHHHFBcLx4UzoQLG4Hre+SAjOg9eFtXi0PnXgc1ojFygZE2ARswKNIeibuEhn7z1jnk3DtWhijn11huy/985okzIFXgfaunC0PgmBfhLJ7ydvlzhWR4vtoEVShIDmHNCUOAQ+GgsGTc55UsnwNvxbVBM8=
Received: from DS7PR03CA0222.namprd03.prod.outlook.com (2603:10b6:5:3ba::17)
 by DS0PR10MB6799.namprd10.prod.outlook.com (2603:10b6:8:13f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:19:15 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:5:3ba:cafe::1e) by DS7PR03CA0222.outlook.office365.com
 (2603:10b6:5:3ba::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 20:19:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:19:13 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:46 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:18:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:18:46 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMq1688208;
	Tue, 29 Sep 2026 15:18:43 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 18/22] firmware: ti: ti_sci_device: Move device ops into its own file
Date: Wed, 30 Sep 2026 01:47:42 +0530
Message-ID: <20260929201746.4078803-19-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929201746.4078803-1-b-padhi@ti.com>
References: <20260929201746.4078803-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|DS0PR10MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 2286a806-d8ca-4abd-f169-08df1e66ee13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|22082099003|18002099003|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	s8qHa6Nc/4QBNI9to2DITEQ7oL6Q9u2LjHX6Iu4OV6stLvKVWk7lqneg9eBKagvQonfaZnsgYEtukvM7wS1v8vadmuG35f9vA2i3tpNKS8R3ppscEGnhEyfVSktAAm049Md5s4gwOeKgvHAbrRVxy/aiA61DZzRObzN7fJKsacSe/xey6BjZ03BB9un9HwPEa9yA5d5Bh3MPEm3O/DWAbAvLLonqUqgn3XIG3nI7YIyxX33cO4fyiYtOhhyeqcZfpg0gZUSX9koTo6rLQIgqH5c6/KtsNT29EecDqjtxX7nsBZb4eqr7WQCUMbPGZWFu3FGjxuhtAUO4egHIikitSCZqIhztVWuUdZ4r3PnNm0NxsDYb1tFjAWtjQoO11Jl68DA8bAIFvjNNubmQsIdT/6zWPnD6f7GGE06rvwPk9GkwYM6X3lKMPT/G3+0cCRScutipWKo7uV4adhrWTq1+mMM7wrd24fUVM1Tc/beNkkoeTGGce2mwy11ceMrYjZvVCl+5Cod9nOHORodJBfv0wnMZoKZqPEFIcMPbpk0FdhpAKLA/Ude63dKw7lMdw73FeSptWNLwIKV1oIsZVr+7YnJrK1+OXp2JOowcjSwJmzjNHToteJWTgpIRJRCc03fpQHgDZcXXSXSIIOVRkbp08g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YNpF2OfKU7J8NsD5Ub+lDu8sC4xvmBWgSOZ82ExJ6du1EC0H28cneyOqswP3b6sMWZxcuuMf1BTydzwaAFWOrKwLNbwIFBSVPgXaAjANtTdDWLo0WDTY/5rANtpOPk/X315x0qjBYg2vSlICINOT3xNNj7EcM4gm8uY+Xs1OPgeg5FTobV44VSxjcYjPZ7UdSvx/ixTS/W6qpjTC1ETuU+9xZtdAucRwYCeYf9Xtq+HyCQb/v4cS/PFAZjqdL2eMYAc4ncgDzC7simrUMNR7SnoQAx38+8Ws4WSzIMudBOAu0t+zO0e2wAXOpxy0bYOzqPCFB+xjNAPtl124jAxTRUC0gTLqhuYP2FGEN1HyVydCeePJI7AQhz2syrhxobCSGwUrpYerA6Jg6Js/ldCleOMP0KJHqgf0VY/Hu+h5N4MgQw1eNJ7dVgt3ukbRSMhN
X-Exchange-RoutingPolicyChecked:
	WtnQxP9alhz91Lty0mfWs8RmK84lMH3X8GmfUW6wyTCt6WCIz60cL5eZLlS+7+H4vmyc6D6HV2npGx3+OhOkolWNgwKTV6HuMDRpPUFDqYdxL5AWKEk2SR08msi2af/SKWQc7VR/ELWIPX2PpFxXnnLCR6BAzhe37Zw/wWZo3wSOgRzA2wa0s/M8eBvQYXwKvJDe2Aux+eWEXEVa0HUMRJMoQekDrqx2OGoyoilXUhyEiUbB5uvIm2kOGqwlzBdsD/h5r+EHkJDfZeA/F8gh2/m5H0/5/toV3kK1BJUjr6CYU2UrqFF8e23HsgGSlfyMi2fOMyh+j4cMJgBIWY5VLA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:19:13.8710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2286a806-d8ca-4abd-f169-08df1e66ee13
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6799
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfXwXRkKXHQys3u
 rIVnx5qG1N5aGKfqzGDVq15OD52LLxQ61Nt9olqLT4VEl07icO2/W5c4Dj4aEMSD5z1rUHvmY72
 +7jO0igb21rx7LXqVsWQjpZmUZrPgn4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX8d0MYOrt6UK1
 5PHmUipGYZTgYyJzG7aEWAQ5IalEzhCEyNj6mv0/26WFtmdR0yXCbCfePKaxxpFtT49c67ljFXk
 Y4kVQO+tLBMLamC/48wPMTRy9RLdnIL9YTE7VpCfbxlGUssTN5cx75JYGT9tqPDRjU/fR0SuwU4
 AZ81YhqYuHYHBNTQpGCF8i/swIKAj8YTYcdHQ7VnE8JbV3Nq0YYP+zyHykaD6JjZsCE2KSmUT+z
 GEMySij0HvoPUcAcHWK+DVcoNJ1wpSXBjXIzhbwcy1+Lskudxq2vlbFOokzsBTFVBU8gX5EMemY
 7N/o2jYAaAdgRKWS7aJZ5lH1e25lafRCaKZczLqiJH7MwlRkaH8HEoRVs7fBjvwkGiK95NDFSOq
 wMAE7oOndGwbnhpviethLtarZR0lKNebMu5aoGjI8oL4PAuBxgv3MCBuAOgL+U2/QeMuZtYUasy
 mJ9HfCPJuzi+PosxpTw==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc1d49 cx=c_pps
 a=MB7q27p+LIGhC+3RxemCqA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=FsUvqdvTxf3IbMdo6LIA:9
X-Proofpoint-GUID: 8fCnMmfUIWkwlvl3Qrzml6V_yejKS0Li
X-Proofpoint-ORIG-GUID: 8fCnMmfUIWkwlvl3Qrzml6V_yejKS0Li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

Extract the device operations related functions and services from
ti_sci.c into its own file. This breaks down the single large file
into smaller logical files for better readability and maintenance.

As the module is now built from multiple objects, rename ti_sci.c to
ti_sci_core.c so the resulting module keeps its ti_sci name. Also drop
the static inline from ti_sci_do_xfer() and declare it in ti_sci.h so
that it can be shared with the new file.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti/Makefile                  |   2 +
 drivers/firmware/ti/ti_sci.h                  |   7 +
 .../firmware/ti/{ti_sci.c => ti_sci_core.c}   | 378 +----------------
 drivers/firmware/ti/ti_sci_device.c           | 388 ++++++++++++++++++
 4 files changed, 402 insertions(+), 373 deletions(-)
 rename drivers/firmware/ti/{ti_sci.c => ti_sci_core.c} (89%)
 create mode 100644 drivers/firmware/ti/ti_sci_device.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index 433b108782fbe..a3a056eedd9a5 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+ti_sci-y			:= ti_sci_core.o
+ti_sci-y			+= ti_sci_device.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index f2f17bcac39e4..79f56699faf29 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -1560,4 +1560,11 @@ struct ti_sci_msg_resp_get_status {
 	u32 status_flags;
 } __packed;
 
+int ti_sci_do_xfer(const struct ti_sci_handle *handle,
+		   u16 msg_type, u32 msg_flags,
+		   void *tx_message, size_t tx_message_size,
+		   void *rx_message, size_t rx_message_size);
+
+void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
+
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci.c b/drivers/firmware/ti/ti_sci_core.c
similarity index 89%
rename from drivers/firmware/ti/ti_sci.c
rename to drivers/firmware/ti/ti_sci_core.c
index 5d3151571ac33..e98bf3c5f9dc1 100644
--- a/drivers/firmware/ti/ti_sci.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -444,10 +444,10 @@ static inline bool ti_sci_is_response_ack(void *r)
  *         corresponding error if transmit fails, or
  *         return 0, if all goes well.
  */
-static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
-				 u16 msg_type, u32 msg_flags,
-				 void *tx_message, size_t tx_message_size,
-				 void *rx_message, size_t rx_message_size)
+int ti_sci_do_xfer(const struct ti_sci_handle *handle,
+		   u16 msg_type, u32 msg_flags,
+		   void *tx_message, size_t tx_message_size,
+		   void *rx_message, size_t rx_message_size)
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -565,361 +565,6 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	return 0;
 }
 
-/**
- * ti_sci_set_device_state() - Set device state helper
- * @handle:	pointer to TI SCI handle
- * @id:		Device identifier
- * @flags:	flags to setup for the device
- * @state:	State to move the device to
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
-				   u32 id, u32 flags, u8 state)
-{
-	struct ti_sci_msg_req_set_device_state req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.id = id;
-	req.state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_STATE,
-			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_get_device_state() - Get device state helper
- * @handle:	Handle to the device
- * @id:		Device Identifier
- * @clcnt:	Pointer to Context Loss Count
- * @resets:	pointer to resets
- * @p_state:	pointer to p_state
- * @c_state:	pointer to c_state
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
-				   u32 id,  u32 *clcnt,  u32 *resets,
-				    u8 *p_state,  u8 *c_state)
-{
-	struct ti_sci_msg_req_get_device_state req;
-	struct ti_sci_msg_resp_get_device_state resp;
-	int ret = 0;
-
-	if (!clcnt && !resets && !p_state && !c_state)
-		return -EINVAL;
-
-	req.id = id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_DEVICE_STATE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (clcnt)
-		*clcnt = resp.context_loss_count;
-	if (resets)
-		*resets = resp.resets;
-	if (p_state)
-		*p_state = resp.programmed_state;
-	if (c_state)
-		*c_state = resp.current_state;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_device() - command to request for device managed by TISCI
- *			     that can be shared with other hosts.
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_device(const struct ti_sci_handle *handle, u32 id)
-{
-	return ti_sci_set_device_state(handle, id, 0,
-				       MSG_DEVICE_SW_STATE_ON);
-}
-
-/**
- * ti_sci_cmd_get_device_exclusive() - command to request for device managed by
- *				       TISCI that is exclusively owned by the
- *				       requesting host.
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_device_exclusive(const struct ti_sci_handle *handle,
-					   u32 id)
-{
-	return ti_sci_set_device_state(handle, id,
-				       MSG_FLAG_DEVICE_EXCLUSIVE,
-				       MSG_DEVICE_SW_STATE_ON);
-}
-
-/**
- * ti_sci_cmd_idle_device() - Command to idle a device managed by TISCI
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_idle_device(const struct ti_sci_handle *handle, u32 id)
-{
-	return ti_sci_set_device_state(handle, id, 0,
-				       MSG_DEVICE_SW_STATE_RETENTION);
-}
-
-/**
- * ti_sci_cmd_idle_device_exclusive() - Command to idle a device managed by
- *					TISCI that is exclusively owned by
- *					requesting host.
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_idle_device_exclusive(const struct ti_sci_handle *handle,
-					    u32 id)
-{
-	return ti_sci_set_device_state(handle, id,
-				       MSG_FLAG_DEVICE_EXCLUSIVE,
-				       MSG_DEVICE_SW_STATE_RETENTION);
-}
-
-/**
- * ti_sci_cmd_put_device() - command to release a device managed by TISCI
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Request for the device - NOTE: the client MUST maintain integrity of
- * usage count by balancing get_device with put_device. No refcounting is
- * managed by driver for that purpose.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_put_device(const struct ti_sci_handle *handle, u32 id)
-{
-	return ti_sci_set_device_state(handle, id,
-				       0, MSG_DEVICE_SW_STATE_AUTO_OFF);
-}
-
-/**
- * ti_sci_cmd_dev_is_valid() - Is the device valid
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- *
- * Return: 0 if all went fine and the device ID is valid, else return
- * appropriate error.
- */
-static int ti_sci_cmd_dev_is_valid(const struct ti_sci_handle *handle, u32 id)
-{
-	u8 unused;
-
-	/* check the device state which will also tell us if the ID is valid */
-	return ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &unused);
-}
-
-/**
- * ti_sci_cmd_dev_get_clcnt() - Get context loss counter
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @count:	Pointer to Context Loss counter to populate
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_get_clcnt(const struct ti_sci_handle *handle, u32 id,
-				    u32 *count)
-{
-	return ti_sci_get_device_state(handle, id, count, NULL, NULL, NULL);
-}
-
-/**
- * ti_sci_cmd_dev_is_idle() - Check if the device is requested to be idle
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @r_state:	true if requested to be idle
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_idle(const struct ti_sci_handle *handle, u32 id,
-				  bool *r_state)
-{
-	int ret;
-	u8 state;
-
-	if (!r_state)
-		return -EINVAL;
-
-	ret = ti_sci_get_device_state(handle, id, NULL, NULL, &state, NULL);
-	if (ret)
-		return ret;
-
-	*r_state = (state == MSG_DEVICE_SW_STATE_RETENTION);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_dev_is_stop() - Check if the device is requested to be stopped
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @r_state:	true if requested to be stopped
- * @curr_state:	true if currently stopped.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_stop(const struct ti_sci_handle *handle, u32 id,
-				  bool *r_state,  bool *curr_state)
-{
-	int ret;
-	u8 p_state, c_state;
-
-	if (!r_state && !curr_state)
-		return -EINVAL;
-
-	ret =
-	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (r_state)
-		*r_state = (p_state == MSG_DEVICE_SW_STATE_AUTO_OFF);
-	if (curr_state)
-		*curr_state = (c_state == MSG_DEVICE_HW_STATE_OFF);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_dev_is_on() - Check if the device is requested to be ON
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @r_state:	true if requested to be ON
- * @curr_state:	true if currently ON and active
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_on(const struct ti_sci_handle *handle, u32 id,
-				bool *r_state,  bool *curr_state)
-{
-	int ret;
-	u8 p_state, c_state;
-
-	if (!r_state && !curr_state)
-		return -EINVAL;
-
-	ret =
-	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (r_state)
-		*r_state = (p_state == MSG_DEVICE_SW_STATE_ON);
-	if (curr_state)
-		*curr_state = (c_state == MSG_DEVICE_HW_STATE_ON);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_dev_is_trans() - Check if the device is currently transitioning
- * @handle:	Pointer to TISCI handle
- * @id:		Device Identifier
- * @curr_state:	true if currently transitioning.
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_dev_is_trans(const struct ti_sci_handle *handle, u32 id,
-				   bool *curr_state)
-{
-	int ret;
-	u8 state;
-
-	if (!curr_state)
-		return -EINVAL;
-
-	ret = ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &state);
-	if (ret)
-		return ret;
-
-	*curr_state = (state == MSG_DEVICE_HW_STATE_TRANS);
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_set_device_resets() - command to set resets for device managed
- *				    by TISCI
- * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
- * @id:		Device Identifier
- * @reset_state: Device specific reset bit field
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
-					u32 id, u32 reset_state)
-{
-	struct ti_sci_msg_req_set_device_resets req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.id = id;
-	req.resets = reset_state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_RESETS,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_device_resets() - Get reset state for device managed
- *				    by TISCI
- * @handle:		Pointer to TISCI handle
- * @id:			Device Identifier
- * @reset_state:	Pointer to reset state to populate
- *
- * Return: 0 if all went fine, else return appropriate error.
- */
-static int ti_sci_cmd_get_device_resets(const struct ti_sci_handle *handle,
-					u32 id, u32 *reset_state)
-{
-	return ti_sci_get_device_state(handle, id, NULL, reset_state, NULL,
-				       NULL);
-}
-
 /**
  * ti_sci_set_clock_state() - Set clock state helper
  * @handle:	pointer to TI SCI handle
@@ -2577,20 +2222,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	struct ti_sci_rm_udmap_ops *udmap_ops = &ops->rm_udmap_ops;
 	struct ti_sci_proc_ops *pops = &ops->proc_ops;
 
-	dops->get_device = ti_sci_cmd_get_device;
-	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
-	dops->idle_device = ti_sci_cmd_idle_device;
-	dops->idle_device_exclusive = ti_sci_cmd_idle_device_exclusive;
-	dops->put_device = ti_sci_cmd_put_device;
-
-	dops->is_valid = ti_sci_cmd_dev_is_valid;
-	dops->get_context_loss_count = ti_sci_cmd_dev_get_clcnt;
-	dops->is_idle = ti_sci_cmd_dev_is_idle;
-	dops->is_stop = ti_sci_cmd_dev_is_stop;
-	dops->is_on = ti_sci_cmd_dev_is_on;
-	dops->is_transitioning = ti_sci_cmd_dev_is_trans;
-	dops->set_device_resets = ti_sci_cmd_set_device_resets;
-	dops->get_device_resets = ti_sci_cmd_get_device_resets;
+	ti_sci_setup_device_ops(dops);
 
 	cops->get_clock = ti_sci_cmd_get_clock;
 	cops->idle_clock = ti_sci_cmd_idle_clock;
diff --git a/drivers/firmware/ti/ti_sci_device.c b/drivers/firmware/ti/ti_sci_device.c
new file mode 100644
index 0000000000000..cb9888ca54a35
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_device.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_set_device_state() - Set device state helper
+ * @handle:	pointer to TI SCI handle
+ * @id:		Device identifier
+ * @flags:	flags to setup for the device
+ * @state:	State to move the device to
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
+				   u32 id, u32 flags, u8 state)
+{
+	struct ti_sci_msg_req_set_device_state req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.id = id;
+	req.state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_get_device_state() - Get device state helper
+ * @handle:	Handle to the device
+ * @id:		Device Identifier
+ * @clcnt:	Pointer to Context Loss Count
+ * @resets:	pointer to resets
+ * @p_state:	pointer to p_state
+ * @c_state:	pointer to c_state
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
+				   u32 id,  u32 *clcnt,  u32 *resets,
+				    u8 *p_state,  u8 *c_state)
+{
+	struct ti_sci_msg_req_get_device_state req;
+	struct ti_sci_msg_resp_get_device_state resp;
+	int ret = 0;
+
+	if (!clcnt && !resets && !p_state && !c_state)
+		return -EINVAL;
+
+	req.id = id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_DEVICE_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (clcnt)
+		*clcnt = resp.context_loss_count;
+	if (resets)
+		*resets = resp.resets;
+	if (p_state)
+		*p_state = resp.programmed_state;
+	if (c_state)
+		*c_state = resp.current_state;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_device() - command to request for device managed by TISCI
+ *			     that can be shared with other hosts.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id, 0,
+				       MSG_DEVICE_SW_STATE_ON);
+}
+
+/**
+ * ti_sci_cmd_get_device_exclusive() - command to request for device managed by
+ *				       TISCI that is exclusively owned by the
+ *				       requesting host.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_device_exclusive(const struct ti_sci_handle *handle,
+					   u32 id)
+{
+	return ti_sci_set_device_state(handle, id,
+				       MSG_FLAG_DEVICE_EXCLUSIVE,
+				       MSG_DEVICE_SW_STATE_ON);
+}
+
+/**
+ * ti_sci_cmd_idle_device() - Command to idle a device managed by TISCI
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_idle_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id, 0,
+				       MSG_DEVICE_SW_STATE_RETENTION);
+}
+
+/**
+ * ti_sci_cmd_idle_device_exclusive() - Command to idle a device managed by
+ *					TISCI that is exclusively owned by
+ *					requesting host.
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_idle_device_exclusive(const struct ti_sci_handle *handle,
+					    u32 id)
+{
+	return ti_sci_set_device_state(handle, id,
+				       MSG_FLAG_DEVICE_EXCLUSIVE,
+				       MSG_DEVICE_SW_STATE_RETENTION);
+}
+
+/**
+ * ti_sci_cmd_put_device() - command to release a device managed by TISCI
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Request for the device - NOTE: the client MUST maintain integrity of
+ * usage count by balancing get_device with put_device. No refcounting is
+ * managed by driver for that purpose.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_put_device(const struct ti_sci_handle *handle, u32 id)
+{
+	return ti_sci_set_device_state(handle, id,
+				       0, MSG_DEVICE_SW_STATE_AUTO_OFF);
+}
+
+/**
+ * ti_sci_cmd_dev_is_valid() - Is the device valid
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ *
+ * Return: 0 if all went fine and the device ID is valid, else return
+ * appropriate error.
+ */
+static int ti_sci_cmd_dev_is_valid(const struct ti_sci_handle *handle, u32 id)
+{
+	u8 unused;
+
+	/* check the device state which will also tell us if the ID is valid */
+	return ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &unused);
+}
+
+/**
+ * ti_sci_cmd_dev_get_clcnt() - Get context loss counter
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @count:	Pointer to Context Loss counter to populate
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_get_clcnt(const struct ti_sci_handle *handle, u32 id,
+				    u32 *count)
+{
+	return ti_sci_get_device_state(handle, id, count, NULL, NULL, NULL);
+}
+
+/**
+ * ti_sci_cmd_dev_is_idle() - Check if the device is requested to be idle
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @r_state:	true if requested to be idle
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_idle(const struct ti_sci_handle *handle, u32 id,
+				  bool *r_state)
+{
+	int ret;
+	u8 state;
+
+	if (!r_state)
+		return -EINVAL;
+
+	ret = ti_sci_get_device_state(handle, id, NULL, NULL, &state, NULL);
+	if (ret)
+		return ret;
+
+	*r_state = (state == MSG_DEVICE_SW_STATE_RETENTION);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_dev_is_stop() - Check if the device is requested to be stopped
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @r_state:	true if requested to be stopped
+ * @curr_state:	true if currently stopped.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_stop(const struct ti_sci_handle *handle, u32 id,
+				  bool *r_state,  bool *curr_state)
+{
+	int ret;
+	u8 p_state, c_state;
+
+	if (!r_state && !curr_state)
+		return -EINVAL;
+
+	ret =
+	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (r_state)
+		*r_state = (p_state == MSG_DEVICE_SW_STATE_AUTO_OFF);
+	if (curr_state)
+		*curr_state = (c_state == MSG_DEVICE_HW_STATE_OFF);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_dev_is_on() - Check if the device is requested to be ON
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @r_state:	true if requested to be ON
+ * @curr_state:	true if currently ON and active
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_on(const struct ti_sci_handle *handle, u32 id,
+				bool *r_state,  bool *curr_state)
+{
+	int ret;
+	u8 p_state, c_state;
+
+	if (!r_state && !curr_state)
+		return -EINVAL;
+
+	ret =
+	    ti_sci_get_device_state(handle, id, NULL, NULL, &p_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (r_state)
+		*r_state = (p_state == MSG_DEVICE_SW_STATE_ON);
+	if (curr_state)
+		*curr_state = (c_state == MSG_DEVICE_HW_STATE_ON);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_dev_is_trans() - Check if the device is currently transitioning
+ * @handle:	Pointer to TISCI handle
+ * @id:		Device Identifier
+ * @curr_state:	true if currently transitioning.
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_dev_is_trans(const struct ti_sci_handle *handle, u32 id,
+				   bool *curr_state)
+{
+	int ret;
+	u8 state;
+
+	if (!curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_get_device_state(handle, id, NULL, NULL, NULL, &state);
+	if (ret)
+		return ret;
+
+	*curr_state = (state == MSG_DEVICE_HW_STATE_TRANS);
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_set_device_resets() - command to set resets for device managed
+ *				    by TISCI
+ * @handle:	Pointer to TISCI handle as retrieved by *ti_sci_get_handle
+ * @id:		Device Identifier
+ * @reset_state: Device specific reset bit field
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
+					u32 id, u32 reset_state)
+{
+	struct ti_sci_msg_req_set_device_resets req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.id = id;
+	req.resets = reset_state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_DEVICE_RESETS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_device_resets() - Get reset state for device managed
+ *				    by TISCI
+ * @handle:		Pointer to TISCI handle
+ * @id:			Device Identifier
+ * @reset_state:	Pointer to reset state to populate
+ *
+ * Return: 0 if all went fine, else return appropriate error.
+ */
+static int ti_sci_cmd_get_device_resets(const struct ti_sci_handle *handle,
+					u32 id, u32 *reset_state)
+{
+	return ti_sci_get_device_state(handle, id, NULL, reset_state, NULL,
+				       NULL);
+}
+
+/*
+ * ti_sci_setup_device_ops() - Setup the device operations structures
+ * @dops:	pointer to TISCI device ops structure
+ */
+void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops)
+{
+	dops->get_device = ti_sci_cmd_get_device;
+	dops->get_device_exclusive = ti_sci_cmd_get_device_exclusive;
+	dops->idle_device = ti_sci_cmd_idle_device;
+	dops->idle_device_exclusive = ti_sci_cmd_idle_device_exclusive;
+	dops->put_device = ti_sci_cmd_put_device;
+
+	dops->is_valid = ti_sci_cmd_dev_is_valid;
+	dops->get_context_loss_count = ti_sci_cmd_dev_get_clcnt;
+	dops->is_idle = ti_sci_cmd_dev_is_idle;
+	dops->is_stop = ti_sci_cmd_dev_is_stop;
+	dops->is_on = ti_sci_cmd_dev_is_on;
+	dops->is_transitioning = ti_sci_cmd_dev_is_trans;
+	dops->set_device_resets = ti_sci_cmd_set_device_resets;
+	dops->get_device_resets = ti_sci_cmd_get_device_resets;
+}
-- 
2.34.1

