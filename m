Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473052;
	b=AhPXf+l6CPHvlTiCSNadEVJWF7+3EZGi6PKWRXapsvh4NwO5ligL6R0U3PYOQPYxZF4j
	 7FNCBklB9NBPUqoRkc1AHPH/M6lbmanxAjWXL/ITlNvq7ISj/mD7/UhWcMvWDUwLBlkUm
	 c6MbE7twAZp3aA7v9hxGqp5jSlx9Qq50Q/IKDsv/qsWSbQtDiZ71fS0Skt/YmUGWk21Ve
	 ALM1lm6aokHN9xPTF2RaerESIZ4YdHMvTQk8Vnl7fZSB/fYwnpUI5TWil6qvh6XUUUkE4
	 DYcfPYKjpEvYcgn805nfKXSP9+01g6RjSK4j0ausCQID+dWDh4LkHibO/Jd8g0DS8Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473052;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KUTOuBd3kVUkUzHZNREwxjsJVaLX7twXuutZuUI8pTk=;
	b=NDjO+/F/SzFk1wQmIkJuJrKRj0Q9WGNzUa0OHmaKzRzyr8nkNl+/Yp/WCzpXmYnmYl32
	 1PEmh8JiulNzNU4VOMOadZkB9hDiF/oBunG2t4glMCMYIpcOeBxafM755wx901Vu5hwDu
	 FZ7jPQafEMfSLHNEMwwt2xhFfTrDBaPgONcJIzuEG69eBw3phZiXiv+ulcsXab+jkOziZ
	 tHhtfFxgTzqGrx1uNrWWuCeBSxJmejuLBMacMBZJGTcEtGMZBCDBLAIie38rlCGbUiSWk
	 jw5h2iKC2DASRIbT79LYAiwbTJW5SDkBNgQ67kbXb2rUQNcMs2SLaHlRcbQYsrsSc0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RSbWlRDg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.8
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010008.outbound.protection.outlook.com [52.101.193.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A193D606B27B;
	Thu, 12 Nov 2026 08:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A193D606B27B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RSbWlRDg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oB+Uq42KvXeo8P5Uo2Vm9zhsyliNGzHBYWOWKaf2vpiePwVbh4vfYdN1cfg3kM+H68YWzc4NgSblHfmfWaBzX8/OeaSD3PK+34Zavyvvgpc/TBj66VVB4H9ZobsZF01n4kLwz9dK8A5n2ksprVMf5K+C38wXcxVjqNYvsQm6/a/4olYsJIuLdZvbwrUMiML7nTy+M9A190NYPR6C3E8LVvRvuLrcnrssg64RjAX4tw8cg1pMh/3Qp5WNyZHunfYpZlYbHR4oweyhVw3tp307GUTrAVAohE53Q6nZ8MFmCx+jvGVNPfWuJv0pZCpoSddrkUZrdE/OR1QrWGQDkecfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUTOuBd3kVUkUzHZNREwxjsJVaLX7twXuutZuUI8pTk=;
 b=M+VMfQwqkgXPx+lMFUAnDC4AYrriQ/u6Yr2A245uGEmVruqdqlGSPcgjprxBlJ8zCyYp8BRw+17pT5+wdNVEWAYiQP44/lWpKfpVg0ACMQ8yvKAPK8uHvPh/XniJcv+jMmRR0/4IIESj97KDDY01phAqEAmpXJQiUvD1KXOtKy8LnU2qLHFFR76rGU+9oX0XM9rJrlvuxG5tIUA3JvMhFCL2raCtaAr9r+Zfc57DTqo9Cl4zjIkDV8SH7hIqr2Ds1CxIAKK9y8KS4OYxMWICQd1qw8TpRRUuAuQri6TagX4XrpcCiYFfJlCRQJNBj2Lx5BbDtr0jLyf3nTv15PaILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUTOuBd3kVUkUzHZNREwxjsJVaLX7twXuutZuUI8pTk=;
 b=RSbWlRDgPc7QZQihtW4elYVt6MGX4kXPnf9ydNLfTh0Lvns92f9QXz25U1Ip3uNJyKSaESyWGwQZiy0zuOVlL/4wbxGDGZqJVFUMRxV1s4PywcCTIW7Erwk7XAvqz95gs4R2KapCmeq9mU2iGA0+pPzSpA/GQ3MmdG7Rrjb3dNY=
Received: from MW4PR03CA0162.namprd03.prod.outlook.com (2603:10b6:303:8d::17)
 by CY8PR12MB8339.namprd12.prod.outlook.com (2603:10b6:930:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Thu, 12 Nov
 2026 08:44:08 +0000
Received: from BY1PEPF0002695D.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::29) by MW4PR03CA0162.outlook.office365.com
 (2603:10b6:303:8d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 08:44:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002695D.mail.protection.outlook.com (10.167.244.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 08:44:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 02:44:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 02:44:02 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53 via Frontend
 Transport; Thu, 12 Nov 2026 02:44:01 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Sandeep Reddy Ghanapuram <sandeep.reddy-ghanapuram@amd.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: versal: dts: Add PCIe reset IDs
Date: Thu, 12 Nov 2026 09:43:44 +0100
Message-ID: <b06d55abdb0671d9dc987057f44c989317e19680.1794473022.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=michal.simek@amd.com; h=from:subject:message-id; bh=DBR7Ft0FnTklP2607nm892brRt41Fvy6Iow5AEVsyLA=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWR9rfEqLUjevyPjmkgS42L+TWntL4Ln75u8wHtlVsbiZ Rb6G8wKO0pZGMQ4GGTFFFmmM+k4rPl2banY8sh8mDmsTCBDGLg4BWAin/kY/ieEGj9evmDi28WP alK8nuR93LGqtDFMK+5ZROEetnmfmz4wMuzb21IUnpuR91k6ae8PzYM8R7/+N7P9sSXr3AGpqin CbAwA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695D:EE_|CY8PR12MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df5dc2f-56ea-4fc6-6dcb-08df40991d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|18002099003|10067099003|261028144727099003|261022075727099003|11063799006|261009223027099003|261102123227099003|56012099006|261021121427099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	0wn98bXJdD+KJGg+3z+Uykkri1wpyX3bo0H01cukphO2+9eY4Np9O+XqNMnEzj2nRtZjpMbOjJxqHU4ad+SFnFfKL1pKytIEuJYNttspPEGgYSBbylz3tKcD1E+aef/xdK0N7l8y12VNDKWnxTCWgbINmLxd1uVOf+NsZGT6El/F8XfM37w+Pi8OGfvhzOX1THr3D0WD3fTDvBEobT0rPp1ku3XvyIszYBtJ/Ua53aKbikzjAQnEl6V2j8ZEPs+F0JJUKtjsD0wqA/Rx20pNwdIHKo1k0TnGRPfHj+m1Hd8kok0uoj2l5UexQzUqVXTPVCp/hdl2XVX0z/Q8rCws/Sm2hco0IpdVTjw1wxC3FHJ+24NtaASOS2rX+i0Qd9KPsaFWA88TTsjeLoAcn0ec5u8JXQo3iV2vecIwZtsqay0cajuh1k75nAjAmFRmS27iZo2i3OZIzLx8StG76Rgih7i1VAijFPQH+NndPoFavajkt371VPWjUYnc9VjrFDFO53j1Wwp6thXZtvV66i7eq9GlfLCHsDKaP7yJRUKlZcXKV7bN29c361+ASlH9PU5qacfRyiIc2p/Bp3cM7UQZFBk102u2o8F83meeHRHgYHY8DZxRglgH3z6J+JJWXqAg1q2jhiDfScch+XtZHe3jnMy3Eu4pmAT+I5RfHedoBTsDCLQI6+YX63/ap18E9mly5Qkqch4VMcQmXXhL7ENdMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(18002099003)(10067099003)(261028144727099003)(261022075727099003)(11063799006)(261009223027099003)(261102123227099003)(56012099006)(261021121427099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gI3cev2tGYyzoSlxptNNS00ypD8Qsk28P/nrRtmNyR+njwuVu33XnZKrMaNBkBBa5ZIrSY8yE/CEzitSi9ndgXGRGJD+ldIGTO9vwlx6i9DPytegDM4tNFCY/xTjPxTKB7cvNXjOpuaPXAlpsdAFWr8bk8/T8MYzStyHBC6rUADbTrjZ41qyDOXM2/MfHbaSuXTndCpPIp8gGctadmNw0o80xmE0dKumXILX+URXULQoD2NL46lbCTbbqcT6Gr0ZcJDOOm/lihtLo4ZHWLxxATLR7daKENizOFaa2YPgv5T/p5YtirVff+DPePLDNyBfL6JSLOCJRNtH2TixOJgmjF58G8UdomSDAhPyNCkpbLcBXoTZU3nzMnnge+96VJnF8kQMTs1K2JlilJOLHOlHtnv4sAwObvht/z5qqd6lR9794mtPzQpAiB3p1AexurgO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:44:07.7986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df5dc2f-56ea-4fc6-6dcb-08df40991d7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8339

From: Sandeep Reddy Ghanapuram <sandeep.reddy-ghanapuram@amd.com>

Add VERSAL_RST_XAPE_0 through VERSAL_RST_XAPE_1 reset binding
definitions for CPM6 PCIe controllers. These IDs
will be used by the PM reset controller to manage PCIe resets.

Signed-off-by: Sandeep Reddy Ghanapuram <sandeep.reddy-ghanapuram@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
index fe00f4a0ba65..f8189d1cbc12 100644
--- a/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
+++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
@@ -102,5 +102,7 @@
 #define VERSAL_RST_XRAM				(0xc30c05dU)
 #define VERSAL_RST_AIE_ARRAY			(0xc10405eU)
 #define VERSAL_RST_AIE_SHIM			(0xc10405fU)
+#define VERSAL_RST_XAPE0			(0xc410115U)
+#define VERSAL_RST_XAPE1			(0xc410116U)
 
 #endif
---
-- 
2.43.0

