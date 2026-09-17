Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D044E4B4871;
	Thu, 17 Sep 2026 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641301; cv=fail; b=ZvgiCRURF2SIiWYCUgadn/QX8Wd0SgffY65CvxWOqVcvUUyu6myZ6kmvjyhyRzEPDaDjGr3mJEP/SpOwDplOyP8ja1JejFr+mhLnxvU64vTS+iWiI+52uSFeoD8hmC6Omr47DtdtkEjsxFe8LVneSI4+r0J+lSYdXuA5D47PYhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641301; c=relaxed/simple;
	bh=gFCucNWPaAjPCj/BZak2ZTAEavwD9dr1j5xx3oB5W4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CG8tS+v/sVuPnu51L/HJgejtB5F2Q/qDF29B/WKbLMG12+gFffPD0nLgO1Sj6QScCNKdAgkA10vhpy+D3h7uiaUDRJLAH1P2JL1mKvgdhkiLcRLlk5R1odp1B0ms1/Ht31zPNLSnbm7V+FTcmecedmTnxS2DNN1nJBfS2a4leX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Lvkxh63H; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=u2V9Mu+C; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Lvkxh63H";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="u2V9Mu+C"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HAUWba105630;
	Thu, 17 Sep 2026 05:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=fUWpkGbXVobPh3cI
	UdnID/rpm6zcCjlnsuzd8SxltpY=; b=Lvkxh63HpWg0uFJO8DOaFlh9skRqGbpG
	1fREcHw5f1HhjhyGgoRMD+o1x4WSj2izqt3Lh3BnzCFFXhONEAYh1tPLCGntoiet
	d7p0GXUCB3nBYzx7Kaow+xbgv2HcyAWifpjmrvAf7dfOOiB0abkAFCEWxBP5bAcu
	YpMXAulBYkI3gk7ebxrB3ddRTlfO95ejAYsBRDoY/1NNZ15dvUHlCZfj0Mow3e0q
	0QIT6ZZzJ+6pFI9T2692fKcMCL4GQcQZ/oQhLTGu152yLh66a6dYrNoy2t8Zo6AZ
	7srVjb537ND+Jvyfukmhfvqbn1jgOC3JQSwn6aXcMVGzms/3Cj4hGA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022122.outbound.protection.outlook.com [52.101.53.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gregu004g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 05:34:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMdm4BNjqf7sUXbdhXXWfwo84QcDOFzTT/Bm3Hyv3XaSgYgZTNtAnL8T9AV+wcoLWs7Nk1eKxk48VG5L8y74s0ek6OSoTAK69yxGa+YPG0ziAN2rZMs6t/s1Gzg1On+Y9oql1Ko8qGiyxPGS9+O35UcLB3E+wrEYAqLZ63ISQIXrBbXhAG4fs/Uco++DWKdF3SY9Co7H2X2MQ0rpal/WEnC1NWNUgbj33kyyokuwGAsUNHC14xpT+t7XUa1liDxJbvllt3ZSXCIQ4Xqv7EbNF5w8b9vHVyy4hTPyoy2yiLMbnQuj9w8VUK9GDYTo1pL19TQoMuKNfEUmpzXiAkjiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUWpkGbXVobPh3cIUdnID/rpm6zcCjlnsuzd8SxltpY=;
 b=D89WKL6bbGFa1P5iZKN1JQR8RqPxhxmHtTQfLjG6mlyscOsF5Ty2asXtYLORidsRQdvQuLY/KKTAoY8IuJDDc8n8km64NkPKnOW9mSMBtaiCWi3mOVqXkGJJwOUX9fCjTs/SzX1GE5zHYadfSXg6iIFG4S20r8RFTFZhJK8CcQLV/OAR/qqlcdurjORg3qmHgnxm06j/rQlIoKY2XuPwdRDflAznutV4yYdRnr0xR37i1Pxk7LZ3vkXiTIJXkDPaBQJFLnt+hf6Y6XdUIEWQFvtC0Sn1ggn8aw+lDvdzf2xvi9SFjrvR0wxSdOEDuiINtreuoJQvrNTMPw7u+bFc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=temperror action=none
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUWpkGbXVobPh3cIUdnID/rpm6zcCjlnsuzd8SxltpY=;
 b=u2V9Mu+CJIPeq2v1NxODzAfrVLNLvehDAfo4M6uSAYNpYnyIF4USaXuFXCtK/7rzhe/6am9BsjAQ67ERsEC6n+OcJoB+qVTmOQbmu3Z3QrJyxcghTO4uSmlU//1rJswUM6pUazXGAREgAMvHK1k8n3mz+N5unecrZ8SCobKLJr0=
Received: from BN0PR02CA0051.namprd02.prod.outlook.com (2603:10b6:408:e5::26)
 by DS0PR19MB7297.namprd19.prod.outlook.com (2603:10b6:8:149::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 10:34:22 +0000
Received: from BN5PEPF00046989.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::f) by BN0PR02CA0051.outlook.office365.com
 (2603:10b6:408:e5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 10:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=opensource.cirrus.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of opensource.cirrus.com: DNS Timeout)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN5PEPF00046989.mail.protection.outlook.com (10.167.245.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 17 Sep 2026 10:34:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 933BD406542;
	Thu, 17 Sep 2026 10:34:19 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.35])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7B264820247;
	Thu, 17 Sep 2026 10:34:19 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH 1/2] ASoC: SDCA: Improve scanning the SWFT during FDL
Date: Thu, 17 Sep 2026 11:33:59 +0100
Message-ID: <20260917103400.2032913-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046989:EE_|DS0PR19MB7297:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7f9b73f8-a95f-4511-4aef-08df14a73bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|36860700016|376014|18002099003|16102099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZUoutOGuR2h+n+PhbWfh4qtWAWiG3iqFTjRWcpAgkqRJzk7DB/WifvwWTnLg6170RFSWnodARE5kpYD4HkI3Jt9Y8LIZxnNeBrf7vNtCvG+JP/dZ3cuekTX6gaHr6bbj8UfnfTg5lgN4IF7qwyTLsyH3F5AjzISP2Z6+T5Q7eJ17EbWf4RCi0w+rRG6UO5OSupPwnP8Ss/5Z/hw7ZxEoDD2Cqh+3HJGuUrrIs8ZS9WBMUSyNT3ohJfKp8eBa9It11HPKp7hIQTbdpYamDdJ6t5afqgSwTTf4SsbEkzBGnCkX6l0G0C9AG713lW/swSJOMeJAq3nQWDjR2hw9a4lzsL2UBcwNN0vtWVVPXZ9gbZsA/sB/HnKe/Ms6QwfnEVIfjlSqvooq5vIYp6c15iCZC/Da/QTOZXJaRuOI8T6l+e/VHAuH55UPhA4hjtsZrW19p8k4Ek7N3nZjdvmGyjPvU0RXB+pTPFMA/ypgrhTMntxyNOfWbkdioh1riVyYx73LsLFlQb6LXLf9qHyZkkwwGwijLk97NS5hAtLd5WiDEIe8YqIf/K1cRjujmnlAyoy+Nb2iT6vr6tTs6LqgTcHC24RJQ9a2zYHG9e8ns/Ke5fJ6RC8NRBizp1HeveapnElvaNRmhG72W+GYeSyb5E1ccEHOEcoDoQ/tDXEUlMnLGFudc5v70+M1AWy26puVeRpT+382DkWyBd9EB1SYQdSMjg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(36860700016)(376014)(18002099003)(16102099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SwWvMtntlIhXb1vG4p4qXOzB6YfQo0bdVUEYWfptPUeJg0XhsWKFrq6LLFSIFUHdQgR472Zrcj+oD0HHZeAoIiDdCkSu3FRcfN+il7Bfj0c0x/LVh/SyjbkjQv/QwaZsx3qhqaWqn3JRrlesGupBR5dIsw7JXguWZelgPu+zD7UCW+BpCJTxQsjV7AO1Q/Fww+i2yAGJoQIwg3zW2LvfKWMHy5YpMWkVhBHtsv14jpzox3K2J/Wj1L5FnOjIJSh8QKQgCHkCJL6IZWqJKzPnW7AGXXQr1lLa6f7oe85tJRfQBEhYzV4AmeyDyVvD2wy4yjMHs8xKkvMxZWMxj+aSRWnu4TmWhAsiNPQR13s/zG8I21ScMsnR3733mKeKI0z2PfRaR0F/OZbpA8jQ8w1KuXeLZfM3cBWRbfLhacoAtLAlBjiKwwt7WOeTWDb1IE/6
X-Exchange-RoutingPolicyChecked:
	Tb9SIcAkCpjqkjeFfy6+9P3rm+l7vK65y0lnpi6aLZqJk6ULDq9YhpJJEGTnBdM/ScCUp3/FJOA7F5W7r421j79yTGXBnwthSHUbzxAd2R2aQBzZl2ak5uwl3/+CyglS4+VNDYrO1DdU5RH83UJj208tPsK5i0eA57fKLE52VXr3DSRt/7NBo6ApQXLX6AY0kcW/4OGhR6SJEfJdMxpcQz0l1OxlMLEd270uUOFfa+o04kjIiTnyVzb1D7db+dbsGLGD4t4Fk2g+YBMbb89jx1jRobUPxw7YONDb4db9zwrMpyHg/cBxaYB3+7FfW7ASHsDDfTEdNwuH6Ia3OEN1Jw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 10:34:20.5443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9b73f8-a95f-4511-4aef-08df14a73bf0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN5PEPF00046989.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7297
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6aabc239 cx=c_pps
 a=qP3TU6UF/Ksz6PC1wz4cYQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Lo2V-nF-zDHDIts5B8gA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE0NCBTYWx0ZWRfX/Xb8eq5I1QvK
 yUDtsRxRRBbik0/WRqYFOqhrQqqCc6tBdYalJGw0Jej5wa2uCF5XC1XmBeq2ev3yl9PWWg2B4ND
 d0KaEfuzuJ5CwxtVysShgzXQ8dsjD34=
X-Proofpoint-GUID: 2Hd5WGJgcz3VbV3igGLFOyZTX47WaFDh
X-Proofpoint-ORIG-GUID: 2Hd5WGJgcz3VbV3igGLFOyZTX47WaFDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE0NCBTYWx0ZWRfX2ne8OlvAfE+H
 bKOeWgx8LAVkNTGfhWMqUhiLgrlk28QswHTOwgdVLGs8hFSjOtx72E4x03RAJO/dIKdatsZOAJk
 ReROrWumyIGx77qhzEYZ/Bn/D8GFDewzd8yqY8rkWoXpgizHAtc7BAKHR8ShS3nlXQqRNnSlodq
 BCQDydX7b7kvyNDvDEAN9qdH53gjrGXG8tXbI8v6wbkrR2yOIJO31w/UrlT/r0jjygUaYtVwSkl
 kHLoFSo5fNMU4MhCxQ3X5SNjSWxNQ/Jdog0sS50JHddHhDysQg7+p8T53RdyUAvGyW1iNkckCDO
 BVUSKUZYieQ0f5gB8JrtyjtEEj5nKQ1tiThRKSRjF3RzobHOVfYFO7Er/qlah6UbjOgQGQb8QUv
 Xi37HwR+LL//CWvOc7kHR0Si8zJJqc8qCFaTXee8M+k/pPPhQsHnTXzjAXO+oGff70pLuVOH5cN
 lx+aoF3phVRURlTLlLg==
X-Proofpoint-Spam-Reason: safe

Walking through SWFT is now improved to verify if it is not reading
past the end of the table.

Introduce file length checks that are done for SWFs from disk to files
from SWFT too.

Fixes: 71f7990a34cd ("ASoC: SDCA: Add FDL library for XU entities")
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_fdl.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 150e36ed24bcc..e08a553e0eab0 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -199,7 +199,6 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 	struct sdca_fdl_file *fdl_file;
 	char *disk_filename;
 	int ret;
-	int i;
 
 	if (!set) {
 		dev_err(dev, "request to load SWF with no set\n");
@@ -209,9 +208,18 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 	fdl_file = &set->files[file_index];
 
 	if (fdl_data->swft) {
-		tmp = fdl_data->swft->files;
-		for (i = 0; i < fdl_data->swft->header.length; i += tmp->file_length,
-		     tmp = ACPI_ADD_PTR(struct acpi_sw_file, tmp, tmp->file_length)) {
+		struct acpi_sw_file *table_end, *next;
+
+		table_end = ACPI_ADD_PTR(struct acpi_sw_file, fdl_data->swft,
+					 fdl_data->swft->header.length);
+		for (tmp = fdl_data->swft->files; tmp + 1 <= table_end; tmp = next) {
+			next = ACPI_ADD_PTR(struct acpi_sw_file, tmp, tmp->file_length);
+
+			if (tmp->file_length < sizeof(*tmp) || next > table_end) {
+				dev_err(dev, "bad file length in SWFT: %u\n", tmp->file_length);
+				break;
+			}
+
 			if (tmp->vendor_id == fdl_file->vendor_id &&
 			    tmp->file_id == fdl_file->file_id) {
 				dev_dbg(dev, "located SWF in ACPI: %x-%x-%x\n",

base-commit: 260a144af70c8babbf2f15d1a56bacfa83f8aef6
-- 
2.47.3

