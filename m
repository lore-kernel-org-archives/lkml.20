Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A7A5013A6;
	Mon, 21 Sep 2026 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016580; cv=fail; b=E+0ecu5mkLl4nQjNAHa+DlhzWJyPM2FTap2Crh+IJ1YVbeAPebV81VoP5AvblX9xt+4d6orVNNaheni6RkijhrAUSv1p5Mt5gP2/z1yl1Vh73HIeyprGGSUOtrJ+HyKz1boxcrTCtQ8bkLmSRU58NBEkuevrs+REVbYuHcxFM2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016580; c=relaxed/simple;
	bh=76+LpkgBLw01HbI4BB/MKEnnmrYOVtTutrr48vIgRbg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ei2qVffartI2d/bKeDopyBt2gWimTjw2vLY40Ztou3sViiv4vmpU/iUF6yTw6HobC/dMBS3fZ2ehGp42mI38EOsLLW69TPSBYDGE9tABkK9B/H1Q2ca/FMjoNctzTO3wwqXU2xybPCEBXmbOnTEU18CRak0tYLJ/hegIhaU9q94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=IPqlTS72; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cmTfRNZH; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="IPqlTS72";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cmTfRNZH"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LIU8x9126040;
	Mon, 21 Sep 2026 13:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=YN+whNfFVHAN1yVorBnwM+rzd10hocZvoH52VNbIp
	YI=; b=IPqlTS72AN+jnBljIILxMWQq2MuIjJEcjJIr0xAdBRb97Fd+Eur3iXk77
	+fcujZTbHpzkduOXdZjhWBWGCYHvWFuS6MXDVD7qSfCPGnxqTlEf4YmvIQ8UOjnC
	As6PyRHp3hDtTixNJ57TwlIZxJHmQmdlLZFYf+RBzycGDeGrpFWLmUaC0YN1XUQl
	Bhn81UyTCIz7PFuoCs+NWHV7pK96GHquroLKQeAcR+Mr8FTntPPITuK7GL7rRHOk
	6vKNwpsmX1zcYBnT16FCsmDdYqsSrvGv854ZzUbzROaWyIML5RxHgIS9yjEbyJjW
	tsSygWwTHnY8JDMLHhI7wZsgPqb6A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gtx9fchx6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 13:49:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmuIlIsOif45NnLhC4RFIGZm2Vg9F9Do4VoCKC3Arsx3PYXs0HgvIAvZZQo/1wBLP1TvwlUH6ps4b29RZGpKVdlLAaYIKgcRkLmNv0L5AMKdGBq4Rr3i84l4vIRZ17KbShIC0CbEoKElhBJzGdlg5RR+L7/5o/HOHaAR+M2hm9ZwgpLwZqg9ZkCVOpO1eY6cY7KPW9++38tXoH0l2AZpzTh4M5wzu7Nty2KM7ut0K2u05VFFe1HcBEMCW6LWOQwKCq4ly9r7VUjVxiDuDeuJKXBjNRN5sRj21hSba2iW9ZxDQaw6j9xySj8bd90OcXbKlTERjL4t8ybQDyOgXaIVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN+whNfFVHAN1yVorBnwM+rzd10hocZvoH52VNbIpYI=;
 b=NXn8GutNJWK+BfcXKyE4QJNX50hMlMcZh7h6A30J/7+XCmy8r5y9ZWngb3xjEifiMifCXpaOiDrcsyWrGdEBcO1YESLzDKq/fkEkm089eb5s2FRUAh51p8074LzqkxcfWOCvMkzA2n7mvOQbDgvkVTArgbAOxhRePINFkDpvnNtqFRvN1DkAAf6z7VXWWDoO2nPwRPEoYpii6PVvC6h6fgWinqz5R5td/A+KpG17TysUbdNkidM6+l39kOg6Y/XbnFaPC05DQcbYV2vKsaVjjuzZaqxi46IRj0L4U7P+uUV+nXUYkkMN6nQUEhMLqpErHFZY7J5CTJAJdsEuOv/c3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN+whNfFVHAN1yVorBnwM+rzd10hocZvoH52VNbIpYI=;
 b=cmTfRNZH/lthGQ3CNLBDuUbIF/fnSB0335nLf+/Zt35yG/JDIzfMBRbMQXU8swrYJMIuWZB78tY3uc2Cfe3PpiB0KedNm28QNfbG2gPtebuEHNJU+B07qnnho4L9t/Hyn6C2Gso8yH5hTYNatn2VhrJWU6FMB4sfdbs87VFXHEQ=
Received: from BN9PR03CA0588.namprd03.prod.outlook.com (2603:10b6:408:10d::23)
 by BLAPR10MB4817.namprd10.prod.outlook.com (2603:10b6:208:321::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Mon, 21 Sep
 2026 18:49:15 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::a1) by BN9PR03CA0588.outlook.office365.com
 (2603:10b6:408:10d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 18:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 18:49:15 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:48:56 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 13:48:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 13:48:56 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LImtie3523558;
	Mon, 21 Sep 2026 13:48:56 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v3 1/4] arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to main_navss
Date: Mon, 21 Sep 2026 13:48:47 -0500
Message-ID: <20260921184850.3810018-2-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921184850.3810018-1-b-brnich@ti.com>
References: <20260921184850.3810018-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|BLAPR10MB4817:EE_
X-MS-Office365-Filtering-Correlation-Id: 38fb5f8c-1118-4134-7592-08df1811094a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	95LxwDmoDlm5hpD3Pf8HyIaYJZzTeJx7XTWYZuVXo8pAFwYXz9t1RDB5ttO68acBhfCni38C/33mRiJC1TZyPSTN4n8Dy20Vq5yF5+fjEje70Iled4XBWrr9DDdfNHgAcYvUoh7uzbTM2a5h7NMieAjCc5jUYI9WS38XgqGSCEHvmJdvCiEMsyXu8qvjN1QLWYRQJbLXlNvAySnw5cL5eB4o5MfnyiP8a2CeVHzoZNV4V7Caeq1BJTq7eZAVeGSreKnkbx6hgTUCR8y9xUuDwRmUehN8aQEwsaarvRaoz3Gl3LmzPOyoLulKlD/2OOLXxP5cvtaN/KrLIBUkuDs5g64W3PZ4BnFw61Nlz5d0Mkorg4X9w3Ng+1ht28aRlfGefzyz8bfElx1FrhmhGNMUuh3jOljt6rK1V5nDGmRP7g502VPwtp0b3bo2YoVkBd0rNE47ReThSuWxi43EHVbBvzuWCqlg1ukmc4sraX9XFa4hHD/ipNxInYMBy4nGyV7Z7Ylyh+60Zp7Qb++FNaqsft3Cjecd0c1i201f9Vh1TgtymrQenxFsydwHPPzMKuxjlV5B7NGSr447M5Dw8+mtYd+3u5O+DnNchTG9f6h8Oiq1ShHPL7Ksytj3hjrYfTU122J8Ow59QulaPJSBR+aegsgWJlVLBRU1dtnzKXqmfmvcqxwhJko1J7UAlWOMzDTBDN9NQs5o+u/NIWrgIcEw6g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0jvTg0adIHowxGfAQoAm6WsixPaeZ3QorNsicxE21AdBhiskMltGiofp3RIJ5wR0O8cUF7ptLyNqP4xkdZ32b2IPEmBxjIO2Bhw/yVWpVuy0DcAOEnfQBhehkAHOSqZUq08sHiKVa7teCNBj0iyY3kRMS02CsCUvqCIK4spKmRtGERZNB49tpAocXz96e7HkFNeLXQKlN7Ud0jrFg7FgPZCEuc9z8s5c2h7fR8NUfKI1kOoZJPBqHwTvAx9xhMsuEi6CANdYAhzaWgNSkC+cCdVoTT8+pwxwhDr24emuEuLWl+tPl3XBjNMTuuH87r/xoElr/7s8rqKWrvwFjmg2c/e02o6041q0DJGOw5j61gKARXaxJ+5R9BgHxTB5swA3V1YrUcmf4h7i1E7BrNLGq+JjSHCqxXV5lc3Xo+XLx2Y1ya0wBf9E4W0GInPJBvON
X-Exchange-RoutingPolicyChecked:
	nRSmdHit60rg5Iy0PhHOpTKRSd5l02H2iHoivAYN1Kn7LnLfzkL6S8jzhfirPI0CMUvuBUBSqWwwyXCPVR6G9joWWahmZvpdTKrY6mNob4xGkV/6kX8eWk1waEwZmu85uVn1STWYmHUp3UhW0qom3ITF/tqeIS2Ts3bPEDnYu2s13mdhvCSzLbW3PCdZOlPnCHNJlSL2w2pqvZkJdmTfYUJU2qEBnz0IgBIOokw4D45mvfiP3r+AsKDTrQBnx9Q46q/WRdblwR9x+JFxMgLaalSqWbjFj6IDxhswO+dle0XS7pZWhZy+6KYTRr0DMA9Kwnbn0+wt5HT6IlSmmjG7JA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:49:15.8114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fb5f8c-1118-4134-7592-08df1811094a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4817
X-Authority-Analysis: v=2.4 cv=Vou2kO2n c=1 sm=1 tr=0 ts=6ab17c34 cx=c_pps
 a=n6quz47VtcdWtWxmUgX64A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=t2EuUbTCF47BKSFJwqMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NCBTYWx0ZWRfXx2141Cx267nh
 kG5AInM3ghOElbPxbjEBuAgWCW1yNFjW9nwoKsLNcd5UW5JfY/oWNBeBLDeLe9obChK2AfIA0E3
 p7KKrH0/bCisRanWyzJI6kxxc3XbSc4LonW1lUJQ3/ONqogw0CDxS98leppzMI3Zw30Xqdr4Nbo
 Liin6+Z9GQ5xh1pG3JNrO22olY2JQ6VpmRtxeTpAFQseMQO/OKxB1PrxFYSS3PcIUinQXzp8XRk
 IiHUUkI0LjmgzMYqDhds07GUgJN02vgzlTM3GfVngYSubS5+w3AHohsQMzpp9HXJaaYRs27PRMH
 dNkcybx8US8pE6Bja4QriCtcKVfAJNgZ3R/FTfGGjDGz1AUQfwG3yjeY8UN3OcqBe2gvhoB2wn9
 xbLf7NzI5kH9gsqKjz3DBz58dhLrrN/HUMjQBtpuJD4AJoINPB5guu/Bw0rmFXkWHIJcxUkVA+4
 lR+mWG0uJfZctmt/tZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NCBTYWx0ZWRfX0mnjjkAfxBJD
 AlOrgZ2qpJw4EaehxxqH4t0OWsBb+Hh9VJ1AwM54Jcd3mLTB92G39yFMjPk6RBOKMZgLeeH4A6t
 w7gWx3Pbk4zlQ6W4eytMZiiToT3QveE=
X-Proofpoint-ORIG-GUID: xhsModps8QwxuqoeAOK1jhLJbyPG2K9s
X-Proofpoint-GUID: xhsModps8QwxuqoeAOK1jhLJbyPG2K9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210274

The NavigatorSS (NAVSS) address space contains a 64 KiB on-chip SRAM
region at its base address. Add an mmio-sram node to expose this region
to consumers via the generic SRAM allocator API.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1228ac5711bf0..1fd173a68c0b2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -784,6 +784,14 @@ main_navss: bus@30000000 {
 		dma-coherent;
 		dma-ranges;
 
+		main_navss_sram: sram@30000000 {
+			compatible = "mmio-sram";
+			reg = <0x00 0x30000000 0x00 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x00 0x30000000 0x10000>;
+		};
+
 		main_navss_intr: interrupt-controller@310e0000 {
 			compatible = "ti,sci-intr";
 			reg = <0x00 0x310e0000 0x00 0x4000>;
-- 
2.43.0

