Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E49332EBB;
	Fri, 25 Sep 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343105; cv=fail; b=kSAjR0VL1hBPGL/PXrIiJwoYQNE69Vor7P+DHjfl8JlEvg5JJH/iC8MhmHjVRI8xDPsSQrmTos12ZBRBEiAu8FsxajZmYOkgNv3BFaM+lI/cxC+IcU7gUl0KgXK7jN/300numgpffSYy8j19JnAsb6rC+ty8D0ODGcDaJsAYVLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343105; c=relaxed/simple;
	bh=NIZPG60wR6TPIFiO8Os4k9KE0SStuvG5LM4fH8kCng8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qvtlN+K1r+Z62UHuiMHvUad2VVGYvaQImKJHNiImhG/sqH9IzvkZhiAJ2n5DWFcLe9u0nVAV1NkNq19Wz+HP/J6ZUrSFby9JLIW94EHUJEHk05GipjP2a2WjiiVLCwQZD5IHyu/gJ3OA/JOI6Sj5UkRa5uu5Zqg5j3MqCmZXq1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=fVqjZRPX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DX23YP4F; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="fVqjZRPX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DX23YP4F"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68P99oh31903260;
	Fri, 25 Sep 2026 08:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gcIIajnFTbC52hcenbf0AypGgkKg8JIEZaOmcgiaO
	vo=; b=fVqjZRPXxBQ0rHrhPDytk/C9sRj4t+NMNk8RteDg1LL7/njmNT8wh2if8
	gUL0UsWydGKPRrE4qEK7xDJWei88o/ZEZxoxLsWYTKlSe9KA52fJ6Abxh9lnNqbm
	TC4wFC+x2+NSVLLzR5SsKZwGHi2xgUOv5DkmE4yTU6rponOHe+87bddhQCzyiN5u
	iPO4lVrlGSY+SQjvzSDVaScRu0W8yAIjkUxEvvzpc9LPYXG5l7+tyKToOjlYpv/Z
	lJVNbD1KOeUuPDJdrj0buJkrr/XurYBUMHums0LY79h7RV6dRGtbjO0/F6jQE3+0
	q2eu7w8wjKrSrhixiVTAoX53QV5Rw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gwnyfs9ab-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 08:31:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlBE37yZTW1Eetsk9goDoLuv+Gf0QTIp95BmaVg+bIeee8TFWHnFdn9Lqqh3UMhZeTVc4esmIjhl8i0Sad/8vJxSohi7S/WZ4RGJsYQkM/hse2qlG9i/o9KYrjlHN/Mxa/Cd0isZspZrY2isDaoZwRr4D/Hcb26nL2lwfvcEkLw0axQrWj8gfcPtuyMt5Sm1H1rfHIHWqa9eiHfl8F5VgVhrCfBLW4TR8fMtoCNioiswWsaTvzKkqoJD6fdc6g8jj5HUfSydo7z6Zril+z1rPgU4vEofeAZaUK2fvD3sX60PAVKeLodg0qdD76sABpdmJDSQmz33prALzUh+0u7jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcIIajnFTbC52hcenbf0AypGgkKg8JIEZaOmcgiaOvo=;
 b=TcXrZ/1BLYc8s13Lz3r1ETnC0NlMPuwNRexSCFZUF/CeIwO0ULTXi+IrSZwPcKA7oi81Wwi6qxYVq3C/eS9Gs0tzRM4ZUsiroVT+DGITEeUxvCXZ0NjYkUh6qr1Gwt41SXHbNb5s/oOcOaRh18ukqmr8Cl8tNyNPaY9aAPgnyZmpukytJncD11VkSHgTYJfy49xNL/ky8tYiE9UyxUIAV6Hu58gY4PAfs405vskXdC/pJc8up6f2e+Y8G5SArnqZLk3Ojv8uPu6a9UnU0D9rSVdP7tAD5oaLQJxAEyB/OI9dvsA1MXOKRtwHGDMW0Z6hqC9vyAuOR+ot6qtfssCqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcIIajnFTbC52hcenbf0AypGgkKg8JIEZaOmcgiaOvo=;
 b=DX23YP4Fhoo2vv55TFR2NMAsO71ktutDds+rIO2OmCoR2/Z260tj2EyOKrT8LH+wTFG3TDVUv5Z36J3Qe/HGPBx621RJjVKUTabf67OJeckAhKpJ/+Z9N6OHLR1bcaeYcXLQx3yJ8Tb5mOhl+heNC8pc8SJi6lAYN09+tB0ESMM=
Received: from MW4PR04CA0372.namprd04.prod.outlook.com (2603:10b6:303:81::17)
 by DS7PR10MB4878.namprd10.prod.outlook.com (2603:10b6:5:3a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 13:31:19 +0000
Received: from BY1PEPF00026965.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::8e) by MW4PR04CA0372.outlook.office365.com
 (2603:10b6:303:81::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:31:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF00026965.mail.protection.outlook.com (10.167.244.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 13:31:18 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:41 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 08:30:41 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PDU1nB2840014;
	Fri, 25 Sep 2026 08:30:36 -0500
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
Subject: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312 driver
Date: Fri, 25 Sep 2026 18:59:59 +0530
Message-ID: <20260925133001.2780868-7-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026965:EE_|DS7PR10MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: e8259a1f-e166-417a-745e-08df1b09481e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|23010399003|36860700016|6133799003|22082099003|18002099003|260925021311599003|260925021911599003|10067099003|56012099006|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	DiLEg7RgoNjfYyKoeLmREuki8JkQqg1NxPSCJmkdNWheTxlITa6y0qY6u9csFLSeXZblo1FPHP7sJ3BVE2gqicKAcQ0WGuD16Hnh/TrFDoTG222gzZhKW0++G6D6yjg+09hkBQvNza85UwWXwiHEJHkXOQSykfcwaq583K2WoRtXJiRzxb+z9gkHLcV4rzIF62oB8RlZrjLHjZrlyTRuBbs8A5n7OjiQeHw5G7Dx03VhtbmUX9mhlylnJSBtYOpmu3M7Nbnj5sU3ZOEpAwFC3QN13wnNC7aYuD9D/XqNV7RGBv3E7y36GoojPb1agYm2Wqlq5Be5cpMESn5t5zrC1aKlAfaNIzHwPkSrrxRl5thqccrltUveyjlkEClBOcP7eCPUSiHUE3w7ILBiSEcpGdNnFi3k0Q1e+UXcfV5ZVSfr5ytihcMuTZAll2bJUviKA0FthJaqkh/F/4nyHK07KJ6ycPju4CtoH52y4uhrTvVsoYSlWcCkWA9jfQJcgTGaCSXOZgHQb4rFIONrX+SY3/gHmJ5ByeSMV5l5Uq/7KdOHPJFzeb9AvL5u2bBuYYEZZ26Z9u6pvTLa/kdjUfH1nYyC81Od2Bn55YGWCT/win6/wPnpOFlP14trijtEFSWGXlE2Ct6s1ZVBFqg3tEO8n11VLDmXs0JwFpjwuJPu2ZIKaYxO319OZ6vThEZLxx+0yFN+8gfEkvr2mtiZcLlYWQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(23010399003)(36860700016)(6133799003)(22082099003)(18002099003)(260925021311599003)(260925021911599003)(10067099003)(56012099006)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jjftFIVQWpQOjQTW5Q7DkbfMN/fzVwnXr9d67YNzGY9e/lsQCqpP8QyqCAAhnNQKk7nxeyeSssixMDicUh3VNwXK8S19avae8CUTa/oVw/Vs0tfpCpEsGDQ/gmDFWYu/ThfCAAk5m7OJNk3wRl+u7UFtVDtcL2EidcxKzRuop3xse3pwwEFl5OYWQUF5Vr4Lsi/2KDcfULaf867uDyrXncGbzzZNII0EPbzR9oMMZgwpNYmNJeONZPG5CT0I5PxLoCG2pt4K9ulCXYEPN6pIjszx//YEtEf42HQhdKDsPyl2aqmbyxU2n+f+qtlWoj6fFnxiEdYCLJIdRb+uBtfZzVLjuyneTCgqxlbMr8Mws8679vOWyV50cdxRDVwsD/cZurARg3ARlTjLAUVUZYpFFS6ZkkUeGw23b83FBeWwQdo4o3pwXtS7jB+BWZhFfcdA
X-Exchange-RoutingPolicyChecked:
	JSppyHc+pRdifHx06obvTCYRzX+lsW8kaVPJxJzSoDRlDTN8P00SlvKuhsB392zz3idt4z1k6DE/dicZ8dNrdxa5xnxpC2mrUG3kTMfanY/7D9fOnz2ESz+lCi37BiesPyHRJ1qtdyd1vunurdgRSIHFAQ9tvgDkme/4fgUX/mM4ZqXwNFx/Zwt2qxTJo8IeKDZQYXk76qfKMF249EIr2uKUL5qlYfbrqRQuG3oKB7LhDIP9AGQFVpro0hMmqT2oDEQzYPSuORT15tMUEGvxpfqLoKKgEFAhOsFrUWtCJcGBViXOwvSoo22C5FghLvc1r2vmDG7vIj9GFqsKpnFRvQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:31:18.7153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8259a1f-e166-417a-745e-08df1b09481e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026965.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4878
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX/LKBvg2eItPg
 5jNL8PG+GB+/dIjXOFq790wOHdoqynjZBE0yu6LCjhIvTG6yW0lSfYSE+b+4ceB6vnpvMub0AiG
 tz5WEPw8xnvNO8O0FIPn1ijkWR+ldo5moY4j5RN5P00Og2rZeUfuPich9qRQvjMesgBh2DGYbJs
 4ZYsZgjpDlW3Ol1or+39IzkwJTlUIEy4skuiCgBb+u0Lg+9mxnVBLfokcjJBYcHCK3SDMxTgVf4
 3KVUr+ksk+p5Yz+0VmWjEv4FBlhAWXbMYTiKktnpIMY5fAXlWmPyVesB7GgpuUESa6nsZk3QuGS
 gO/n2fkAirGtTcmojKi8gD1hlk7SpVTv7arDcBfK98JW8msMNSlWQDKpva4YXbjojceyECgvLta
 ziaXX0GcCsq87i6mnZnce3ydsNFyAIvnvddqGYjjxo38xqg2qP2F0cazO3SY+PlsmPSmpl1V6cm
 5kJgHPMPs8E6bUrzwFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX7zpHfHp2Rn2b
 jMR77ALho0JXX/fd9SYYuy1bp6xbFcSaJu6oQPBk1RGU86LPSbOaHT+N7UjMRtILcHy/JiC1qxE
 rjr9z+1o4mZL0vFefUCJK8MCzgMYUYA=
X-Authority-Analysis: v=2.4 cv=aeL0Dhot c=1 sm=1 tr=0 ts=6ab677ae cx=c_pps
 a=eaWElexNrpfURq8UtOOyIA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=hSStRiCJ6JL0Mhu90w8A:9
X-Proofpoint-GUID: LaiT-cogOS4i6LOWwugsVfcwqYf44s6F
X-Proofpoint-ORIG-GUID: LaiT-cogOS4i6LOWwugsVfcwqYf44s6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250053

From: Jai Luthra <j-luthra@ti.com>

Omnivision OV2312 is an RGB-IR sensor, i.e. it uses a 4x4 R,G,B,Ir bayer
pattern to capture both visible and near-infrared light. Every alternate
frame, the sensor changes the exposure and IR flash strobe registers to
stream an -
A. IR-dominant frame on CSI-2 virtual channel 0
B. RGB-dominant frame on CSI-2 virtual channel 1

These A/B frames are routed as separate v4l2 streams, which may be
mapped to two separate /dev/videoX nodes by the CSI-RX DMA driver.

Both of these streams are captured at a resolution of 1600x1301, 30 fps
each (60fps total). The extra row (1301 vs 1300) is an embedded line
prepended to each frame by the sensor, containing the following register
values:
  0x4813 - VC (Virtual Channel)
  0x321A - Group ID
  0x3920 - Strobe
  0x3501 - Exposure HI
  0x3502 - Exposure LO
  0x3508 - Gain HI
  0x3509 - Gain LO
  0x350e - Current Exposure HI
  0x350f - Current Exposure LO

This driver also supports a few v4l2 controls like horizontal/vertical
flip, multi exposure and multi gain controls.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/i2c/Kconfig  |  12 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/ov2312.c | 939 +++++++++++++++++++++++++++++++++++++
 drivers/media/i2c/ov2312.h | 285 +++++++++++
 4 files changed, 1237 insertions(+)
 create mode 100644 drivers/media/i2c/ov2312.c
 create mode 100644 drivers/media/i2c/ov2312.h

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4d9946479160..8d9d8d491b2e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -496,6 +496,18 @@ config VIDEO_OV13B10
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV13B10 camera.
 
+config VIDEO_OV2312
+	tristate "OmniVision OV2312 sensor support"
+	depends on I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OV2312 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov2312.
+
 config VIDEO_OV2640
 	tristate "OmniVision OV2640 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fd1cb25718c0..e019f174c5c0 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -98,6 +98,7 @@ obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
 obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
 obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
 obj-$(CONFIG_VIDEO_OV13B10) += ov13b10.o
+obj-$(CONFIG_VIDEO_OV2312) += ov2312.o
 obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
 obj-$(CONFIG_VIDEO_OV2659) += ov2659.o
 obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
diff --git a/drivers/media/i2c/ov2312.c b/drivers/media/i2c/ov2312.c
new file mode 100644
index 000000000000..1561e1b3602d
--- /dev/null
+++ b/drivers/media/i2c/ov2312.c
@@ -0,0 +1,939 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Omnivision OV2312 RGB-IR Image Sensor driver
+ *
+ * Copyright (c) 2022 Jai Luthra <j-luthra@ti.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+#include <linux/v4l2-mediabus.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-ctrls.h>
+
+#include "ov2312.h"
+
+struct ov2312 {
+	struct device *dev;
+
+	struct clk *clk;
+	unsigned long clk_rate;
+
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct gpio_desc *reset_gpio;
+
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_mbus_framefmt format;
+
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *exposure_multi;
+	struct v4l2_ctrl *again_multi;
+	struct v4l2_ctrl *dgain_multi;
+	struct v4l2_ctrl *h_flip;
+	struct v4l2_ctrl *v_flip;
+
+	u32 fps;
+
+	struct mutex lock; /* For streaming status */
+	unsigned int enable_count;
+};
+
+static inline struct ov2312 *to_ov2312(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ov2312, sd);
+}
+
+static int ov2312_read(struct ov2312 *ov2312, u16 addr, u32 *val, size_t nbytes)
+{
+	int ret;
+	__le32 val_le = 0;
+
+	ret = regmap_bulk_read(ov2312->regmap, addr, &val_le, nbytes);
+	if (ret < 0) {
+		dev_err(ov2312->dev, "%s: failed to read reg 0x%04x: %d\n",
+			__func__, addr, ret);
+		return ret;
+	}
+
+	*val = le32_to_cpu(val_le);
+	return 0;
+}
+
+static int ov2312_write(struct ov2312 *ov2312, u16 addr, u32 val, size_t nbytes)
+{
+	int ret;
+	__le32 val_le = cpu_to_le32(val);
+
+	ret = regmap_bulk_write(ov2312->regmap, addr, &val_le, nbytes);
+	if (ret < 0)
+		dev_err(ov2312->dev, "%s: failed to write reg 0x%04x: %d\n",
+			__func__, addr, ret);
+	return ret;
+}
+
+static int ov2312_write_table(struct ov2312 *ov2312,
+			      const struct reg_sequence *regs,
+			      unsigned int nr_regs)
+{
+	int ret, i;
+
+	for (i = 0; i < nr_regs; i++) {
+		ret = regmap_write(ov2312->regmap, regs[i].reg, regs[i].def);
+		if (ret < 0) {
+			dev_err(ov2312->dev,
+				"%s: failed to write reg[%d] 0x%04x = 0x%02x (%d)!\n",
+				__func__, i, regs[i].reg, regs[i].def, ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static void ov2312_init_formats(struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *format;
+	int i;
+
+	for (i = 0; i < 2; ++i) {
+		format = v4l2_subdev_state_get_format(state, 0, i);
+		format->code = ov2312_mbus_formats[0];
+		format->width = ov2312_framesizes[0].width;
+		format->height = ov2312_framesizes[0].height;
+		format->field = V4L2_FIELD_NONE;
+		format->colorspace = V4L2_COLORSPACE_DEFAULT;
+	}
+}
+
+static int ov2312_set_fmt(struct v4l2_subdev *sd,
+			  const struct v4l2_subdev_client_info *ci,
+			  struct v4l2_subdev_state *state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct ov2312 *ov2312 = to_ov2312(sd);
+	struct v4l2_mbus_framefmt *format;
+	const struct v4l2_area *fsize;
+	u32 code;
+	int ret = 0;
+
+	if (fmt->pad != 0)
+		return -EINVAL;
+
+	if (fmt->stream != 0)
+		return -EINVAL;
+
+	/* Sensor only supports a single format. */
+	code = ov2312_mbus_formats[0];
+
+	/* Find the nearest supported frame size. */
+	fsize = v4l2_find_nearest_size(ov2312_framesizes,
+				       ARRAY_SIZE(ov2312_framesizes), width,
+				       height, fmt->format.width,
+				       fmt->format.height);
+
+	v4l2_subdev_lock_state(state);
+
+	/* Update the stored format and return it. */
+	format = v4l2_subdev_state_get_format(state, fmt->pad, fmt->stream);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && ov2312->enable_count) {
+		ret = -EBUSY;
+		goto done;
+	}
+
+	format->code = code;
+	format->width = fsize->width;
+	format->height = fsize->height;
+
+	fmt->format = *format;
+
+done:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int _ov2312_set_routing(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.source_pad = 0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.source_pad = 0,
+			.source_stream = 1,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	int ret;
+
+	ret = v4l2_subdev_set_routing(sd, state, &routing);
+	if (ret < 0)
+		return ret;
+
+	ov2312_init_formats(state);
+
+	return 0;
+}
+
+static int ov2312_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	u32 bpp;
+	int ret = 0;
+	unsigned int i;
+
+	if (pad != 0)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	fmt = v4l2_subdev_state_get_format(state, 0, 0);
+	if (!fmt) {
+		ret = -EPIPE;
+		goto out;
+	}
+
+	memset(fd, 0, sizeof(*fd));
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	/* pixel stream - 2 virtual channels */
+
+	bpp = 10;
+
+	for (i = 0; i < 2; ++i) {
+		fd->entry[fd->num_entries].stream = i;
+
+		fd->entry[fd->num_entries].flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+		fd->entry[fd->num_entries].length = fmt->width * fmt->height * bpp / 8;
+		fd->entry[fd->num_entries].pixelcode = fmt->code;
+		fd->entry[fd->num_entries].bus.csi2.vc = i;
+		fd->entry[fd->num_entries].bus.csi2.dt = 0x2b; /* RAW10 */
+
+		fd->num_entries++;
+	}
+
+out:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int ov2312_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      enum v4l2_subdev_format_whence which,
+			      struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	if (routing->num_routes == 0 || routing->num_routes > 2)
+		return -EINVAL;
+
+	v4l2_subdev_lock_state(state);
+
+	ret = _ov2312_set_routing(sd, state);
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int ov2312_init_state(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	int ret;
+
+	ret = _ov2312_set_routing(sd, state);
+
+	return ret;
+}
+
+static int ov2312_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(ov2312_mbus_formats))
+		return -EINVAL;
+
+	code->code = ov2312_mbus_formats[code->index];
+
+	return 0;
+}
+
+static int ov2312_enum_frame_sizes(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ov2312_mbus_formats); ++i) {
+		if (ov2312_mbus_formats[i] == fse->code)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(ov2312_mbus_formats))
+		return -EINVAL;
+
+	if (fse->index >= ARRAY_SIZE(ov2312_framesizes))
+		return -EINVAL;
+
+	fse->min_width = ov2312_framesizes[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->max_height = ov2312_framesizes[fse->index].height;
+	fse->min_height = fse->max_height;
+
+	return 0;
+}
+
+static int ov2312_get_frame_interval(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_frame_interval *fi)
+{
+	struct ov2312 *ov2312 = to_ov2312(sd);
+
+	fi->interval.numerator = 1;
+	fi->interval.denominator = ov2312->fps / 2;
+
+	return 0;
+}
+
+static int ov2312_set_frame_interval(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_frame_interval *fi)
+{
+	struct ov2312 *ov2312 = to_ov2312(sd);
+
+	if (!fi->interval.numerator)
+		return -EINVAL;
+
+	dev_dbg(ov2312->dev, "%s: Set framerate %dfps\n", __func__,
+		fi->interval.denominator / fi->interval.numerator);
+
+	if ((fi->interval.denominator / fi->interval.numerator) != ov2312->fps / 2) {
+		dev_err(ov2312->dev, "%s: Framerate can only be %dfps\n",
+			__func__, ov2312->fps / 2);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ov2312_detect(struct ov2312 *ov2312)
+{
+	int ret;
+	u32 id;
+
+	ret = ov2312_read(ov2312, OV2312_SC_CHIP_ID_HI, &id, 2);
+	if (ret < 0)
+		return ret;
+
+	id = cpu_to_be16(id);
+
+	if (id != OV2312_CHIP_ID) {
+		dev_err(ov2312->dev,
+			"%s: unknown chip ID 0x%04x\n", __func__, id);
+		return -ENODEV;
+	}
+
+	dev_dbg(ov2312->dev, "%s: detected chip ID 0x%04x\n", __func__, id);
+	return 0;
+}
+
+/*
+ */
+static int ov2312_set_group_a(struct ov2312 *ov2312)
+{
+	u32 ir_exposure = ov2312->exposure_multi->p_new.p_u32[1];
+	u32 ir_again    = ov2312->again_multi->p_new.p_u32[1];
+	u32 ir_dgain    = ov2312->dgain_multi->p_new.p_u32[1];
+	u32 ir_strobe_start = OV2312_VTS - ir_exposure - 7;
+	int ret;
+
+	struct reg_sequence ov2312_groupA[] = {
+		{0x3208, 0x00},/* Group A (IR Dominant VC0) */
+		{OV2312_AEC_PK_EXPO_HI, (ir_exposure >> 8) & 0xff},
+		{OV2312_AEC_PK_EXPO_LO, ir_exposure & 0xff},
+		{OV2312_AEC_PK_AGAIN_HI, (ir_again >> 4) & 0xff},
+		{OV2312_AEC_PK_AGAIN_LO, (ir_again & 0x0f) << 4},
+		{OV2312_AEC_PK_DGAIN_HI, (ir_dgain >> 8) & 0xff},
+		{OV2312_AEC_PK_DGAIN_LO, ir_dgain & 0xff},
+		{0x3920, 0xff},/* IR Strobe duty cycle */
+		{0x3927, (ir_exposure >> 8) & 0xff},
+		{0x3928, ir_exposure & 0xff},
+		{0x3929, (ir_strobe_start >> 8) & 0xff},
+		{0x392a, ir_strobe_start & 0xff},
+		{0x4813, 0x01},/* VC=1. This register takes effect from next frame */
+		{0x3208, 0x10},
+		{0x320D, 0x00},/* Auto mode switch between group0 and group1 ;setting to switch */
+		{0x320D, 0x31},
+		{0x3208, 0xA0},
+	};
+
+	ret = regmap_register_patch(ov2312->regmap, ov2312_groupA,
+				    ARRAY_SIZE(ov2312_groupA));
+	if (ret < 0)
+		dev_err(ov2312->dev,
+			"%s: failed to apply Group A register patch (%d)!\n",
+			__func__, ret);
+	return ret;
+}
+
+static int ov2312_set_group_b(struct ov2312 *ov2312)
+{
+	u32 rgb_exposure = ov2312->exposure_multi->p_new.p_u32[0];
+	u32 rgb_again    = ov2312->again_multi->p_new.p_u32[0];
+	u32 rgb_dgain    = ov2312->dgain_multi->p_new.p_u32[0];
+	int ret;
+
+	struct reg_sequence ov2312_groupB[] = {
+		{0x3208, 0x01},/* Group B (RGB Dominant VC1) */
+		{OV2312_AEC_PK_EXPO_HI, (rgb_exposure >> 8) & 0xff},
+		{OV2312_AEC_PK_EXPO_LO, rgb_exposure & 0xff},
+		{OV2312_AEC_PK_AGAIN_HI, (rgb_again >> 4) & 0xff},
+		{OV2312_AEC_PK_AGAIN_LO, (rgb_again & 0x0f) << 4},
+		{OV2312_AEC_PK_DGAIN_HI, (rgb_dgain >> 8) & 0xff},
+		{OV2312_AEC_PK_DGAIN_LO, rgb_dgain & 0xff},
+		{0x3920, 0x00},
+		{0x4813, 0x00},/* VC=0. This register takes effect from next frame */
+		{0x3208, 0x11},
+		{0x320D, 0x00},/* Auto mode switch between group0 and group1 ;setting to switch */
+		{0x320D, 0x30},
+		{0x3208, 0xA0},
+	};
+
+	ret = regmap_register_patch(ov2312->regmap, ov2312_groupB,
+				    ARRAY_SIZE(ov2312_groupB));
+	if (ret < 0)
+		dev_err(ov2312->dev,
+			"%s: failed to apply Group B register patch (%d)!\n",
+			__func__, ret);
+	return ret;
+}
+
+static int ov2312_set_AB_mode(struct ov2312 *ov2312)
+{
+	bool ir_ready  = ov2312->exposure_multi->p_new.p_u32[1] &&
+			 ov2312->again_multi->p_new.p_u32[1] &&
+			 ov2312->dgain_multi->p_new.p_u32[1];
+	bool rgb_ready = ov2312->exposure_multi->p_new.p_u32[0] &&
+			 ov2312->again_multi->p_new.p_u32[0] &&
+			 ov2312->dgain_multi->p_new.p_u32[0];
+	int ret;
+
+	if (ir_ready) {
+		ret = ov2312_set_group_a(ov2312);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (rgb_ready) {
+		ret = ov2312_set_group_b(ov2312);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Wait for 1 frame duration after setting AB mode registers */
+	if (ir_ready || rgb_ready)
+		msleep(33);
+
+	return 0;
+}
+
+static int ov2312_set_orientation(struct ov2312 *ov2312)
+{
+	bool v_flip = ov2312->v_flip->val;
+	bool h_flip = ov2312->h_flip->val;
+	u32 reg = (v_flip ? 0x4400 : 0) | (h_flip ? 0x0004 : 0);
+
+	return ov2312_write(ov2312, OV2312_TIMING_VFLIP, be16_to_cpu(reg), 2);
+}
+
+static int ov2312_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov2312 *ov2312 = container_of(ctrl->handler,
+					     struct ov2312, ctrls);
+	int ret;
+
+	/*
+	 * If the device is not powered up by the host driver do
+	 * not apply any controls to H/W at this time. Instead
+	 * the controls will be restored right after power-up.
+	 */
+	if (pm_runtime_suspended(ov2312->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE_MULTI:
+	case V4L2_CID_AGAIN_MULTI:
+	case V4L2_CID_DGAIN_MULTI:
+		dev_dbg(ov2312->dev, "debug: %s: %s = [%u, %u]\n", __func__,
+				ctrl->name, ctrl->p_new.p_u32[0], ctrl->p_new.p_u32[1]);
+
+		ret = ov2312_set_AB_mode(ov2312);
+		break;
+
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		ret = ov2312_set_orientation(ov2312);
+		break;
+
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int ov2312_power_on(struct ov2312 *ov2312)
+{
+	int ret;
+
+	ret = clk_prepare_enable(ov2312->clk);
+	if (ret < 0)
+		return ret;
+
+	if (ov2312->reset_gpio) {
+		gpiod_set_value_cansleep(ov2312->reset_gpio, 0);
+		usleep_range(100, 1000);
+		gpiod_set_value_cansleep(ov2312->reset_gpio, 1);
+		msleep(30);
+	}
+	return 0;
+}
+
+static int ov2312_power_off(struct ov2312 *ov2312)
+{
+	if (ov2312->reset_gpio) {
+		gpiod_set_value_cansleep(ov2312->reset_gpio, 0);
+		usleep_range(1, 10);
+	}
+
+	clk_disable_unprepare(ov2312->clk);
+
+	return 0;
+}
+
+static int ov2312_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov2312 *ov2312 = to_ov2312(sd);
+
+	return ov2312_power_on(ov2312);
+}
+
+static int ov2312_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov2312 *ov2312 = to_ov2312(sd);
+
+	return ov2312_power_off(ov2312);
+}
+
+static int ov2312_start_stream(struct ov2312 *ov2312)
+{
+	int ret;
+
+	ret = ov2312_write_table(ov2312, ov2312_1600x1300_60fps_AB,
+				 ARRAY_SIZE(ov2312_1600x1300_60fps_AB));
+	if (ret < 0)
+		return ret;
+
+	/* Update controls on wake up */
+	ret = ov2312_set_orientation(ov2312);
+	if (ret < 0)
+		return ret;
+
+	ret = ov2312_set_AB_mode(ov2312);
+	if (ret < 0)
+		return ret;
+
+	msleep(100);
+
+	/* Set active */
+	ret = ov2312_write(ov2312, OV2312_SYS_MODE_SEL, 1, 1);
+	if (ret < 0)
+		return ret;
+
+	/* No communication is possible for a while after exiting standby */
+	msleep(20);
+	return 0;
+}
+
+static int ov2312_stop_stream(struct ov2312 *ov2312)
+{
+	int ret;
+
+	/* Set standby */
+	ret = ov2312_write(ov2312, OV2312_SYS_MODE_SEL, 0, 1);
+	if (ret < 0)
+		return ret;
+
+	/* No communication is possible for a while after entering standby */
+	usleep_range(10000, 20000);
+	return 0;
+}
+
+static int ov2312_sd_enable_streams(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       u32 pad, u64 streams_mask)
+{
+	struct ov2312 *ov2312 = to_ov2312(sd);
+	int ret;
+
+	guard(mutex)(&ov2312->lock);
+
+	if (!ov2312->enable_count) {
+		ret = pm_runtime_resume_and_get(ov2312->dev);
+		if (ret < 0)
+			goto err;
+
+		ret = ov2312_start_stream(ov2312);
+		if (ret < 0) {
+			pm_runtime_put(ov2312->dev);
+			goto err;
+		}
+	}
+
+	ov2312->enable_count++;
+
+	return 0;
+
+err:
+	dev_err(ov2312->dev,
+		"%s: failed to enable streams %d\n", __func__, ret);
+	return ret;
+}
+
+static int ov2312_sd_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					u32 pad, u64 streams_mask)
+{
+	struct ov2312 *ov2312 = to_ov2312(sd);
+	int ret;
+
+	mutex_lock(&ov2312->lock);
+
+	if (ov2312->enable_count == 1) {
+		ret = ov2312_stop_stream(ov2312);
+		if (ret < 0)
+			goto err_runtime_put;
+	}
+
+	ov2312->enable_count--;
+	mutex_unlock(&ov2312->lock);
+
+	if (!ov2312->enable_count)
+		pm_runtime_put(ov2312->dev);
+
+	return 0;
+
+err_runtime_put:
+	mutex_unlock(&ov2312->lock);
+	pm_runtime_put(ov2312->dev);
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops ov2312_subdev_pad_ops = {
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ov2312_set_fmt,
+	.enum_mbus_code = ov2312_enum_mbus_code,
+	.enum_frame_size = ov2312_enum_frame_sizes,
+	.set_routing = ov2312_set_routing,
+	.get_frame_desc	= ov2312_get_frame_desc,
+	.get_frame_interval = ov2312_get_frame_interval,
+	.set_frame_interval = ov2312_set_frame_interval,
+	.enable_streams = ov2312_sd_enable_streams,
+	.disable_streams = ov2312_sd_disable_streams,
+};
+
+static const struct v4l2_subdev_internal_ops ov2312_internal_ops = {
+	.init_state = ov2312_init_state,
+};
+
+static const struct v4l2_subdev_ops ov2312_subdev_ops = {
+	.pad	= &ov2312_subdev_pad_ops,
+};
+
+static const struct v4l2_ctrl_ops ov2312_ctrl_ops = {
+	.s_ctrl	= ov2312_set_ctrl,
+};
+
+static const struct dev_pm_ops ov2312_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov2312_suspend, ov2312_resume, NULL)
+};
+
+static int ov2312_probe(struct i2c_client *client)
+{
+	struct ov2312 *ov2312;
+	struct v4l2_subdev *sd;
+	struct v4l2_ctrl_handler *ctrl_hdr;
+	int ret;
+
+	/* Allocate internal struct */
+	ov2312 = devm_kzalloc(&client->dev, sizeof(*ov2312), GFP_KERNEL);
+	if (!ov2312)
+		return -ENOMEM;
+
+	ov2312->dev = &client->dev;
+	ov2312->client = client;
+
+	/* Initialize I2C Regmap */
+	ov2312->regmap = devm_regmap_init_i2c(client, &ov2312_regmap_config);
+	if (IS_ERR(ov2312->regmap))
+		return PTR_ERR(ov2312->regmap);
+
+	/* Initialize Shutdown GPIO */
+	ov2312->reset_gpio = devm_gpiod_get_optional(ov2312->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(ov2312->reset_gpio))
+		return PTR_ERR(ov2312->reset_gpio);
+
+	ov2312->clk = devm_clk_get(ov2312->dev, "xvclk");
+	if (IS_ERR(ov2312->clk))
+		return PTR_ERR(ov2312->clk);
+
+	ov2312->clk_rate = clk_get_rate(ov2312->clk);
+	dev_info(ov2312->dev, "xvclk rate: %lu Hz\n", ov2312->clk_rate);
+
+	if (ov2312->clk_rate < 6000000 || ov2312->clk_rate > 27000000)
+		return -EINVAL;
+
+	/* Power on */
+	ret = ov2312_power_on(ov2312);
+	if (ret < 0)
+		return ret;
+
+	/* Detect sensor */
+	ret = ov2312_detect(ov2312);
+	if (ret < 0)
+		goto err_power_off;
+
+	/* Initialize the subdev and its controls. */
+	sd = &ov2312->sd;
+	v4l2_i2c_subdev_init(sd, client, &ov2312_subdev_ops);
+	sd->internal_ops = &ov2312_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
+
+	/* Initialize the media entity. */
+	ov2312->pad.flags = MEDIA_PAD_FL_SOURCE;
+	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ret = media_entity_pads_init(&sd->entity, 1, &ov2312->pad);
+	if (ret < 0) {
+		dev_err_probe(ov2312->dev, ret, "media entity init failed\n");
+		goto err_power_off;
+	}
+
+	ov2312->fps = OV2312_FRAMERATE_DEFAULT;
+	ret = devm_mutex_init(ov2312->dev, &ov2312->lock);
+	if (ret) {
+		dev_err_probe(ov2312->dev, ret, "mutex init failed\n");
+		goto err_media_cleanup;
+	}
+
+	/* Initialize controls */
+	ctrl_hdr = &ov2312->ctrls;
+	/* 3 multi-capture + 2 flip + 3 single backward-compat */
+	ret = v4l2_ctrl_handler_init(ctrl_hdr, 8);
+	if (ret < 0) {
+		ret = dev_err_probe(ov2312->dev, ret,
+				    "ctrl handler init failed\n");
+		goto err_media_cleanup;
+	}
+
+	ov2312->ctrls.lock = &ov2312->lock;
+
+	/* Multi-capture controls: index 0 = RGB (longest), index 1 = IR */
+	{
+		const struct v4l2_ctrl_config exposure_multi_cfg = {
+			.ops  = &ov2312_ctrl_ops,
+			.id   = V4L2_CID_EXPOSURE_MULTI,
+			.type = V4L2_CTRL_TYPE_U32,
+			.min  = 0,
+			.max  = OV2312_EXPOSURE_MAX,
+			.step = 1,
+			.def  = OV2312_EXPOSURE_DEFAULT,
+			.dims = { 2 },
+		};
+		const struct v4l2_ctrl_config again_multi_cfg = {
+			.ops  = &ov2312_ctrl_ops,
+			.id   = V4L2_CID_AGAIN_MULTI,
+			.type = V4L2_CTRL_TYPE_U32,
+			.min  = 0,
+			.max  = OV2312_AGAIN_MAX,
+			.step = 1,
+			.def  = OV2312_AGAIN_DEFAULT,
+			.dims = { 2 },
+		};
+		const struct v4l2_ctrl_config dgain_multi_cfg = {
+			.ops  = &ov2312_ctrl_ops,
+			.id   = V4L2_CID_DGAIN_MULTI,
+			.type = V4L2_CTRL_TYPE_U32,
+			.min  = 0,
+			.max  = OV2312_DGAIN_MAX,
+			.step = 1,
+			.def  = OV2312_DGAIN_DEFAULT,
+			.dims = { 2 },
+		};
+
+		ov2312->exposure_multi = v4l2_ctrl_new_custom(ctrl_hdr,
+							      &exposure_multi_cfg,
+							      NULL);
+		ov2312->again_multi = v4l2_ctrl_new_custom(ctrl_hdr,
+							   &again_multi_cfg,
+							   NULL);
+		ov2312->dgain_multi = v4l2_ctrl_new_custom(ctrl_hdr,
+							   &dgain_multi_cfg,
+							   NULL);
+	}
+
+	if (ov2312->exposure_multi && ov2312->again_multi && ov2312->dgain_multi) {
+		/* Set per-element initial values: [0]=RGB default, [1]=IR default */
+		ov2312->exposure_multi->p_cur.p_u32[0] = OV2312_EXPOSURE_DEFAULT;
+		ov2312->exposure_multi->p_cur.p_u32[1] = OV2312_IR_EXPOSURE;
+		ov2312->exposure_multi->p_new.p_u32[0] = OV2312_EXPOSURE_DEFAULT;
+		ov2312->exposure_multi->p_new.p_u32[1] = OV2312_IR_EXPOSURE;
+
+		ov2312->again_multi->p_cur.p_u32[0] = OV2312_AGAIN_DEFAULT;
+		ov2312->again_multi->p_cur.p_u32[1] = OV2312_AGAIN_DEFAULT;
+		ov2312->again_multi->p_new.p_u32[0] = OV2312_AGAIN_DEFAULT;
+		ov2312->again_multi->p_new.p_u32[1] = OV2312_AGAIN_DEFAULT;
+
+		ov2312->dgain_multi->p_cur.p_u32[0] = OV2312_DGAIN_DEFAULT;
+		ov2312->dgain_multi->p_cur.p_u32[1] = OV2312_DGAIN_DEFAULT;
+		ov2312->dgain_multi->p_new.p_u32[0] = OV2312_DGAIN_DEFAULT;
+		ov2312->dgain_multi->p_new.p_u32[1] = OV2312_DGAIN_DEFAULT;
+	}
+
+	ov2312->h_flip = v4l2_ctrl_new_std(ctrl_hdr, &ov2312_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	ov2312->v_flip = v4l2_ctrl_new_std(ctrl_hdr, &ov2312_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+
+	/*
+	 * Register single-capture controls with proper ranges for backward
+	 * compatibility with older userspace. The v4l2 core redirects s_ctrl
+	 * for these to the corresponding multi-capture control.
+	 */
+	v4l2_ctrl_new_std(ctrl_hdr, &ov2312_ctrl_ops,
+			  V4L2_CID_EXPOSURE, 1, OV2312_EXPOSURE_MAX,
+			  1, OV2312_EXPOSURE_DEFAULT);
+	v4l2_ctrl_new_std(ctrl_hdr, &ov2312_ctrl_ops,
+			  V4L2_CID_ANALOGUE_GAIN, 0, OV2312_AGAIN_MAX,
+			  1, OV2312_AGAIN_DEFAULT);
+	v4l2_ctrl_new_std(ctrl_hdr, &ov2312_ctrl_ops,
+			  V4L2_CID_DIGITAL_GAIN, 0, OV2312_DGAIN_MAX,
+			  1, OV2312_DGAIN_DEFAULT);
+
+	ov2312->sd.ctrl_handler = ctrl_hdr;
+	if (ov2312->ctrls.error) {
+		ret = ov2312->ctrls.error;
+		ret = dev_err_probe(ov2312->dev, ret,
+				    "failed to add the ctrls\n");
+		goto err_ctrl_free;
+	}
+
+	/* PM Runtime */
+	pm_runtime_enable(ov2312->dev);
+	pm_runtime_set_suspended(ov2312->dev);
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret < 0)
+		goto err_pm_disable;
+
+	/* Finally, register the subdev. */
+	ret = v4l2_async_register_subdev(sd);
+	if (ret < 0) {
+		ret = dev_err_probe(ov2312->dev, ret,
+				    "v4l2 subdev register failed\n");
+		goto err_subdev_cleanup;
+	}
+
+	dev_info(ov2312->dev, "ov2312 probed\n");
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(&ov2312->sd);
+
+err_pm_disable:
+	pm_runtime_disable(ov2312->dev);
+
+err_ctrl_free:
+	v4l2_ctrl_handler_free(ctrl_hdr);
+
+err_media_cleanup:
+	media_entity_cleanup(&ov2312->sd.entity);
+
+err_power_off:
+	ov2312_power_off(ov2312);
+
+	return ret;
+}
+
+static void ov2312_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov2312 *ov2312 = to_ov2312(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_ctrl_handler_free(&ov2312->ctrls);
+	v4l2_subdev_cleanup(&ov2312->sd);
+	media_entity_cleanup(&sd->entity);
+
+	pm_runtime_disable(ov2312->dev);
+}
+
+static const struct i2c_device_id ov2312_id[] = {
+	{ "ov2312", 0 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i2c, ov2312_id);
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id ov2312_of_match[] = {
+	{ .compatible = "ovti,ov2312", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ov2312_of_match);
+#endif
+
+static struct i2c_driver ov2312_i2c_driver = {
+	.driver = {
+		.name	= "ov2312",
+		.pm	= &ov2312_pm_ops,
+		.of_match_table = of_match_ptr(ov2312_of_match),
+	},
+	.probe		= ov2312_probe,
+	.remove		= ov2312_remove,
+	.id_table	= ov2312_id,
+};
+
+module_i2c_driver(ov2312_i2c_driver);
+
+MODULE_AUTHOR("Jai Luthra <j-luthra@ti.com>");
+MODULE_DESCRIPTION("OV2312 RGB-IR Image Sensor driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/ov2312.h b/drivers/media/i2c/ov2312.h
new file mode 100644
index 000000000000..8ed435878638
--- /dev/null
+++ b/drivers/media/i2c/ov2312.h
@@ -0,0 +1,285 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Omnivision OV2312 RGB-IR Image Sensor driver
+ *
+ * Copyright (c) 2022 Jai Luthra <j-luthra@ti.com>
+ */
+
+#include <linux/types.h>
+#include <linux/media-bus-format.h>
+
+#define OV2312_CHIP_ID	0x2311
+#define OV2312_FRAMERATE_DEFAULT 60
+
+#define OV2312_ED_LINES 1
+#define OV2312_OUT_WIDTH	1600
+#define OV2312_OUT_HEIGHT	(1300 + OV2312_ED_LINES)
+#define OV2312_VTS		0x0588
+
+#define OV2312_SYS_MODE_SEL	0x0100
+#define OV2312_SC_CHIP_ID_HI	0x300a
+#define OV2312_SC_CHIP_ID_LO	0x300b
+#define OV2312_AEC_PK_EXPO_HI	0x3501
+#define OV2312_AEC_PK_EXPO_LO	0x3502
+#define OV2312_AEC_PK_AGAIN_HI	0x3508
+#define OV2312_AEC_PK_AGAIN_LO	0x3509
+#define OV2312_AEC_PK_DGAIN_HI	0x350a
+#define OV2312_AEC_PK_DGAIN_LO	0x350b
+#define OV2312_TIMING_VFLIP	0x3820
+#define OV2312_TIMING_HFLIP	0x3821
+
+/* Exposure control */
+#define OV2312_EXPOSURE_MAX	(OV2312_VTS - 12)
+#define OV2312_EXPOSURE_DEFAULT 0x057c
+#define OV2312_IR_EXPOSURE	0x0090
+#define OV2312_IR_STROBE	OV2312_IR_EXPOSURE
+#define OV2312_IR_STROBE_START	(OV2312_VTS - OV2312_IR_EXPOSURE - 7)
+
+/* Analog gain control */
+#define OV2312_AGAIN_MAX	0x1FF
+#define OV2312_AGAIN_DEFAULT	0x010
+
+/* Digital gain control */
+#define OV2312_DGAIN_MAX	0x0FFF
+#define OV2312_DGAIN_DEFAULT	0x0100
+
+static const struct v4l2_area ov2312_framesizes[] = {
+	{
+		.width		= OV2312_OUT_WIDTH,
+		.height		= OV2312_OUT_HEIGHT,
+	},
+};
+
+static const u32 ov2312_mbus_formats[] = {
+	MEDIA_BUS_FMT_SBGGI10_1X10,
+};
+
+static const struct regmap_config ov2312_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+};
+
+static const struct reg_sequence ov2312_1600x1300_60fps_AB[] = {
+	{0x0103, 0x01},
+	{0x0100, 0x00},
+	{0x010c, 0x02},
+	{0x010b, 0x01},
+	{0x0300, 0x01},
+	{0x0302, 0x32},
+	{0x0303, 0x00},
+	{0x0304, 0x03},
+	{0x0305, 0x02},
+	{0x0306, 0x01},
+	{0x030d, 0x5a},
+	{0x030e, 0x04},
+	{0x3001, 0x02},
+	{0x3004, 0x00},
+	{0x3005, 0x00},
+	{0x3006, 0x0a},
+	{0x3011, 0x0d},
+	{0x3014, 0x04},
+	{0x301c, 0xf0},
+	{0x3020, 0x20},
+	{0x302c, 0x00},
+	{0x302d, 0x00},
+	{0x302e, 0x00},
+	{0x302f, 0x03},
+	{0x3030, 0x10},
+	{0x303f, 0x03},
+	{0x3103, 0x00},
+	{0x3106, 0x08},
+	{0x31ff, 0x01},
+	{0x3501, 0x05},
+	{0x3502, 0x7c},
+	{0x3506, 0x00},
+	{0x3507, 0x00},
+	{0x3620, 0x67},
+	{0x3633, 0x78},
+	{0x3662, 0x65},
+	{0x3664, 0xb0},
+	{0x3666, 0x70},
+	{0x3670, 0x68},
+	{0x3674, 0x10},
+	{0x3675, 0x00},
+	{0x367e, 0x90},
+	{0x3680, 0x84},
+	{0x36a2, 0x04},
+	{0x36a3, 0x80},
+	{0x36b0, 0x00},
+	{0x3700, 0x35},
+	{0x3704, 0x39},
+	{0x370a, 0x50},
+	{0x3712, 0x00},
+	{0x3713, 0x02},
+	{0x3778, 0x00},
+	{0x379b, 0x01},
+	{0x379c, 0x10},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x00},
+	{0x3804, 0x06},
+	{0x3805, 0x4f},
+	{0x3806, 0x05},
+	{0x3807, 0x23},
+	{0x3808, 0x06},
+	{0x3809, 0x40},
+	{0x380a, 0x05},
+	{0x380b, 0x14},
+	{0x380c, 0x03},
+	{0x380d, 0xa8},
+	{0x380e, (OV2312_VTS >> 8) & 0xff},
+	{0x380f, OV2312_VTS & 0xff},
+	{0x3810, 0x00},
+	{0x3811, 0x08},
+	{0x3812, 0x00},
+	{0x3813, 0x08},
+	{0x3814, 0x11},
+	{0x3815, 0x11},
+	{0x3816, 0x00},
+	{0x3817, 0x01},
+	{0x3818, 0x00},
+	{0x3819, 0x05},
+	{0x382b, 0x5a},
+	{0x382c, 0x0a},
+	{0x382d, 0xf8},
+	{0x3881, 0x44},
+	{0x3882, 0x02},
+	{0x3883, 0x8c},
+	{0x3885, 0x07},
+	{0x389d, 0x03},
+	{0x38a6, 0x00},
+	{0x38a7, 0x01},
+	{0x38b3, 0x07},
+	{0x38b1, 0x00},
+	{0x38e5, 0x02},
+	{0x38e7, 0x00},
+	{0x38e8, 0x00},
+	{0x3910, 0xff},
+	{0x3911, 0xff},
+	{0x3912, 0x08},
+	{0x3913, 0x00},
+	{0x3914, 0x00},
+	{0x3915, 0x00},
+	{0x391c, 0x00},
+	{0x3920, 0xff},
+	{0x3921, 0x80},
+	{0x3922, 0x00},
+	{0x3923, 0x00},
+	{0x3924, 0x05},
+	{0x3925, 0x00},
+	{0x3926, 0x00},
+	{0x3927, 0x00},
+	{0x3928, 0x1a},
+	{0x392d, 0x03},
+	{0x392e, 0xa8},
+	{0x392f, 0x08},
+	{0x4001, 0x00},
+	{0x4003, 0x40},
+	{0x4008, 0x04},
+	{0x4009, 0x1b},
+	{0x400c, 0x04},
+	{0x400d, 0x1b},
+	{0x4010, 0xf4},
+	{0x4011, 0x00},
+	{0x4016, 0x00},
+	{0x4017, 0x04},
+	{0x4042, 0x11},
+	{0x4043, 0x70},
+	{0x4045, 0x00},
+	{0x4409, 0x5f},
+	{0x4509, 0x00},
+	{0x450b, 0x00},
+	{0x4600, 0x00},
+	{0x4601, 0x80},
+	{0x4708, 0x09},
+	{0x470c, 0x81},
+	{0x4710, 0x06},
+	{0x4711, 0x00},
+	{0x4800, 0x00},
+	{0x481f, 0x30},
+	{0x4837, 0x14},
+	{0x4f00, 0x00},
+	{0x4f07, 0x00},
+	{0x4f08, 0x03},
+	{0x4f09, 0x08},
+	{0x4f0c, 0x05},
+	{0x4f0d, 0xb4},
+	{0x4f10, 0x00},
+	{0x4f11, 0x00},
+	{0x4f12, 0x07},
+	{0x4f13, 0xe2},
+	{0x5000, 0x9f},
+	{0x5001, 0x20},
+	{0x5026, 0x00},
+	{0x5c00, 0x00},
+	{0x5c01, 0x2c},
+	{0x5c02, 0x00},
+	{0x5c03, 0x7f},
+	{0x5e00, 0x00},
+	{0x5e01, 0x41},
+	{0x38b1, 0x02},
+	{0x0100, 0x01},
+	{0x3006, 0x08},/* Strobe control  */
+	{0x3004, 0x02},
+	{0x3007, 0x02},
+	{0x301c, 0x20},
+	{0x3020, 0x20},
+	{0x3025, 0x02},
+	{0x382c, 0x0a},
+	{0x382d, 0xf8},
+	{0x3920, 0xff},
+	{0x3921, 0x00},
+	{0x3923, 0x00},
+	{0x3924, 0x00},
+	{0x3925, 0x00},
+	{0x3926, 0x00},
+	{0x3927, 0x00},
+	{0x3928, 0x80},
+	{0x392b, 0x00},
+	{0x392c, 0x00},
+	{0x392d, 0x03},
+	{0x392e, 0xa8},
+	{0x392f, 0x0b},
+	{0x38b3, 0x07},
+	{0x3885, 0x07},
+	{0x382b, 0x3a},
+	{0x3670, 0x68},
+	{0x3016, 0xF1},
+	{0x0100, 0x01},
+	{0x4814, 0x6B},
+	{0x3218, 0x32},
+	{0x3216, 0x01},
+	{0x3208, 0x04},
+	{0x4813, 0x01},
+	{0x321a, 0x01},
+	{0x3920, 0x01},
+	{0x3501, 0x02},
+	{0x3508, 0x02},
+	{0x350e, 0x02},
+	{0x3208, 0x14},
+	{0x3662, 0x65},
+	{0x366F, 0x1A},
+	{0x3674, 0x11},
+	{0x3016, 0xF0},
+	{0x301C, 0xF0},/* AB mode - Group auto switch example setting */
+	{0x3209, 0x01},/* Stay in Group A for 1 Frame */
+	{0x320A, 0x01},/* Stay in Group B for 1 Frame */
+	{0x320B, 0x00},
+	{0x320C, 0x00},
+	{0x3208, 0x00},/* Group A (IR Dominant VC0) default values */
+	{OV2312_AEC_PK_EXPO_HI, (OV2312_IR_EXPOSURE >> 8) & 0xff},
+	{OV2312_AEC_PK_EXPO_LO, OV2312_IR_EXPOSURE & 0xff},
+	{OV2312_AEC_PK_AGAIN_HI, 0x01},
+	{OV2312_AEC_PK_AGAIN_LO, 0x00},
+	{OV2312_AEC_PK_DGAIN_HI, 0x01},
+	{OV2312_AEC_PK_DGAIN_LO, 0x00},
+	{0x3920, 0xff},/* IR Strobe duty cycle */
+	{0x3927, (OV2312_IR_STROBE >> 8) & 0xff},
+	{0x3928, OV2312_IR_STROBE & 0xff},
+	{0x3929, (OV2312_IR_STROBE_START >> 8) & 0xff},
+	{0x392a, OV2312_IR_STROBE_START & 0xff},
+	{0x4813, 0x01},/* VC=1. This register takes effect from next frame */
+	{0x3208, 0x10},
+
+};
-- 
2.34.1

