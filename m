Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B874503E2;
	Wed, 23 Sep 2026 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156227; cv=fail; b=SRekqUZHe87V3iFxAppq40Nv2cjpnGHW2rSZU2KhBP5dplgoPiZKtTlw+ZlanvghQGSDtjCYF0EJuIHwv2JxowHuZCQQFbYQBtl57RyJ2cglSxAxapUQVi/Dsbk3E4Wxh4SLAQPFclAxRNJ61vY4hhLsDgYrYmZW7QMOD/OjLxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156227; c=relaxed/simple;
	bh=NE72TFIzNTvS1nJXOwrY0+bncZ+3kiEwS0tVDv4wkDk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AKpsmMvL38t40EMbBVvw3I7HS93GmTIFpWsOe7wX1mAOA+9rQEDCVBYzFT1urfS4rGQ5udcktCy/r7fAyEhoZPasvuVz0hOq0Z/e0EkKM7XkR8UML9iFCEOYSoi5qTYOTGYzS/CCF5mIHdE487Ig8QE4/OxLCIhQag8ZF5fbVms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=F1cckDSD; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WYF3D61q; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="F1cckDSD";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WYF3D61q"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8N9o41611710;
	Wed, 23 Sep 2026 04:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ICqqHKwRDZrJbM/4uXzyXoocvfYxnIgQVMFD631sb
	TU=; b=F1cckDSDrAXdV9u2KY1E3aYMGKI5y9lc4uRRgs7HZYz7sDCxWc/Q/QOMC
	5VXpNXwwVsdfTfh39oBSxxLrlaeYafEOXz0MjrOpWZEnXTjc1GjvXgpqQ4m8Yant
	UF0Kkc353zlFVjG6LoJxWs5t1tCVP3PO4DAPg7LETJIhiA3mdsD8qBwvaVc+JuBT
	tcz1wZ3NRzKYFBjfuykg1s9RK9HaWsJjKdPwoRDwYUOdZoH8ErWq8YaWvyoLEGqP
	aKoDNcO902rJiDmMVpoJUsoypo8tiZiryqG41WpWMeWAfGaKk0HcLjl7GYPfaLN0
	yG+3es38AQ4qs+FuvPy0ofYoBWGmQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010021.outbound.protection.outlook.com [52.101.193.21])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77rd8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:36:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uktK+9GuXIXhTp0d6niT/mGoOm6Fet2XMRaxWUd3VhS+Wr2B3Lf4TAFEF1jY7Nd9xLHA7BAuNLTn9lsV94rb4cEd7rZVEXMF1qnGezFYi3hhZkG6gZNAaCE02a9y1WEIMx8sCueM1TQOls0Q8yw0ytBRY6PT8LOI1AC/2vOae8IrCmGLdhcw2eFwxkpH3Tzw9L5COsQSPTEDz6mbp1o+MK2p7JPA2pBr1HgYV+pAhk/ltkQRWn3CC8PCh0fsl0AOQqYNqY/fZMMWZUJ0d3IxGRtInphLtBKhFm8nnONhR4pTpZM33uQ9C/SfR5hKHQfISb6m9Pd/5sBC2ril3/GQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICqqHKwRDZrJbM/4uXzyXoocvfYxnIgQVMFD631sbTU=;
 b=LC5p7Qx+3EV39sEInRx85x72jCGKwUqaoajg7k8Icd36HX9RpmlPRdy/ETf0Fs8jtsQ+QGBOWOheefX9ArnVg+YVznrmjpcDP8R6CAZ9x964CZR+vPd90EgL8w8lkrYZVjzNHXyUOfF1U/Rrst/DlQiqQApsdvHu8AGkW+Wpkpberv8es75IylpH3tR5YghJ+x6plob+AVQKKFYPIWmfltLzd1t2AD6daSEXrzanKljNiBZMGp58DfSryyc1x1wH5mKMLs3uhQ1cZbLDaqzkGy4ef9M605f0fdao3vUrgBQZoWpYZZTrlb8uFH38dPtpQ0kdutBQQo95xnnoRrfj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICqqHKwRDZrJbM/4uXzyXoocvfYxnIgQVMFD631sbTU=;
 b=WYF3D61qgYg7krmN2NUidg1C3u66MzziXLkEdImdO8luf6uqkzeZe2jc/XJULw7YOz8T/c5bHt2MNWh75fiLXQKVzNk+O5xUsIdyTLEMC48abaYpKYqfEwFVhnZYPQvUwmBfehMbaWfMvSbZhZV0GHzlJMeaBrAJII1DbztVflg=
Received: from DS7P220CA0049.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::13) by
 CY8PR10MB7218.namprd10.prod.outlook.com (2603:10b6:930:76::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.14; Wed, 23 Sep 2026 09:36:33 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:8:224:cafe::45) by DS7P220CA0049.outlook.office365.com
 (2603:10b6:8:224::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 09:36:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Wed, 23 Sep 2026 09:36:31 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:00 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:36:00 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WU1760658;
	Wed, 23 Sep 2026 04:35:54 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v3 06/18] arm64: dts: ti: k3-j722s-main: Add multiple channels for CSI2RX DMA
Date: Wed, 23 Sep 2026 15:04:47 +0530
Message-ID: <20260923093459.28125-7-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923093459.28125-1-y-abhilashchandra@ti.com>
References: <20260923093459.28125-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|CY8PR10MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdecbf9-a744-4bef-673b-08df195626eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|7416014|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LyLA3xRAKA7W/bJb2ize8hAkUdHDhoq5DM5QX2zBCyxppFPlYXdecODrNAtlMCo1HZLO0f2PD0CS3sq+YyEggbUvm6oE8zuyV7vyAV2Xsvhd3PbFKmatxg9rS5MnKIXDiz/XCvdhHCv8NYmbrDnPLgjQooVhlQ7Q/MkAoaDUBZmW19LCz9t2A7of1rP1PqAGFhLwvD9gTJeM6kNax4kNID8yfIX0DD7fhCcM0Lx+reDvohpRLK0AKi/TmJ65wPjslqdpjNyT3/H3nDo9kKRHKkBcrSkOoVSf1l/Cs4wheYclhP5RaZXIHR2V32TNzKky1bpRt6Uox15/2fAgKL0iijxUUG+IU68GnByttOeNKqQ+/WfJDaL4pEb91twaBHbs6hEDC8SVY5d0pjk4yPoDeIj5yYjyxa9pGfufPCcFrlq65wOIRTpWxcq+y5ouT7duznLLhJp0YfyYDvnP1V8nnlotgC4+d9y757olmG++okJYp1P4nomtWuce/n959PJqQwUE1R1qgoA8BuUTcSdsRLhY3JoBPSEnJ/HGb5hiIjiwI/hp3IVQ1bwT3d8U69RUyHwqBTrpFvTanO3HagHko61IWs/+WSUgm1R0Gbjj1rLgDhrkuhATLi9PhL96iWL8Squ/CedQvFfFe10lSvONPEhtKSOZzi2nVj+2whR8LbUgjfH/RtFco5uuTPU/B5m1A5RvYkNSNFCS+K41qrQXDQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(7416014)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l9lSkhK9ZiyAYHM/GHvFnk+xV4tRILdU/QuMhwSzZPMWakFtOhBF++YNjJ30BBNPXBzn+kzz6F8MI86Nzt8PMNo/iNnJDLaRSNEjEN739uw5UwAsgTL7ZPKBkZnPk23W91KPnvomxN+6vgbdrCqh6J2ywSk2JeCCK+dwbp/x5C8EQ9G6im4dlKIZE8+y3LERNnlIeBWj6dO8GIgWM8tE3PCr767jodqks8CKUXSkH4XpN1YODi3kYP716PM4Jpc/7sUZhSJmO3BEJOa12EMDiPA7cKE3hj/UEwbYtt4z0g78Jzta9YhirgpxZmHN1nuHNYcoFVHyJTnua64w4hy9b6pPtQKrybeJUPb5UTMUSGRlFLejSH9+A82gMo08tZgCZ62Jw1Khl6genRtotI3rowcWDDyBAYPGE1bZYTYI82RJx5oFXYG0nffUA1ucGxzf
X-Exchange-RoutingPolicyChecked:
	n658ZmkHzCF9Qsdp+1c7IU2DbA0AAGnEfFQKr5FQkoIzEIYZkelk2/zK+Ohustx2WKctYNFrX1CaU5dLpCR2tNoC7DbQsToVkaUtSJNns5pkCpr8vDZ5GniQr1d4rR1ppfo/b93OMf52z0vk8hNg5Bmth73ZQxfK3tjaFPMYxCPBbUl2Q3Z20oOUFAq8MNPp8x8i8ZpGsuz6NbAHz2vnwSAE9A2OFN8Ag1UD2U13ULHcwfPs0gmePaW9xXkqsqTc5nLPUqHYmfrEzq6zTrVLsbHHEn8OQroRBWrqhKyI53i0XkqbVxuhQYlw+GA/f20VYpDmEcxJsjyYRabXXn9W1Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:36:31.9776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdecbf9-a744-4bef-673b-08df195626eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7218
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX+y5FiLBm18p7
 KstBaQrKn1QJ/rKftKTW8oFC/x8nE+Djq1MSsZr/GyrHEqGTF8wOfWrwOxCEf09h7JsMMZH+iUw
 F+D4oE9fHewRLSHI3bOqwZG+J8F3mTUaqzRWRvcPq6agyxY78fTzzzC0B5jYbDtCLN3VwEXFguG
 au2B7cnkuomeHrmKC/vAORyDxSPBtMoz1CmpOKWlDTSBu8QlzMui0K+nQlb2i8g6wNhl8oNV6aK
 8E2APyYNDuilNDAvXGgaC+/c/FNUXYf+4MO0DPh7DZ7g+VFmtlIQLASAR2UwCg3nnz/HyD/aCIj
 Nb76+eJoKTM+Kd6EYDEBXwMbV/zDpYAac9O9WbXy7LHmnPpcjOdnfA06QJJjQ/r1VWLEf3G8bp3
 uxwfN+86QdiIRhn6zba/j7qmz4wuZoZYrDuuKmYH7dyJOR5iMiYoBDGHK6kZ/U5jvpmw7Y8lWNF
 eTbOIJ5aH3OosE0VFgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXzCt6ith4Hg2H
 aCV7Xs3onJ9KRGj9+yuhmDC0XycfHKGQizL0Ge/IelwS+HswrrS9XPD95AXqsmp1fGhe03b8/XR
 a0U1ziIHZRnqYCeAfoSJ4pc+wo1noj0=
X-Proofpoint-GUID: qG2-9lW6R9VyJ5uQmOlNEzPMi4RYSLNK
X-Proofpoint-ORIG-GUID: qG2-9lW6R9VyJ5uQmOlNEzPMi4RYSLNK
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab39da5 cx=c_pps
 a=up4QpmAGzzRqrgyk5KT4IA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=lWlUmI80TkwTl8jqF04A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts.
Add additional DMA channels to enable multistream support for CSI2RX.

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 5a5b9a1bfd9e..199c8652bcde 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -173,8 +173,9 @@ ti_csi2rx1: ticsi2rx@30122000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x5100 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5100 0>, <&main_bcdma_csi 0 0x5101 0>,
+		       <&main_bcdma_csi 0 0x5102 0>, <&main_bcdma_csi 0 0x5103 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3";
 		power-domains = <&k3_pds 247 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -230,8 +231,9 @@ ti_csi2rx2: ticsi2rx@30142000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		power-domains = <&k3_pds 248 TI_SCI_PD_EXCLUSIVE>;
-		dmas = <&main_bcdma_csi 0 0x5200 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5200 0>, <&main_bcdma_csi 0 0x5201 0>,
+		       <&main_bcdma_csi 0 0x5202 0>, <&main_bcdma_csi 0 0x5203 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3";
 		status = "disabled";
 
 		cdns_csi2rx2: csi-bridge@30141000 {
@@ -285,8 +287,9 @@ ti_csi2rx3: ticsi2rx@30162000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x5300 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x5300 0>, <&main_bcdma_csi 0 0x5301 0>,
+		       <&main_bcdma_csi 0 0x5302 0>, <&main_bcdma_csi 0 0x5303 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3";
 		power-domains = <&k3_pds 249 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

