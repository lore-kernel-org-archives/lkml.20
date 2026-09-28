Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB5376BF2;
	Mon, 28 Sep 2026 03:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565765; cv=fail; b=qZGR3VjB49iItWjtdRPfojaAy3wn6IUuR5UIad51DaHOczLccvD6mFkKC/5izFunuFnS7dFFZibc2f4YUwPdpPScuz5iW40KM2f/v4cVIPidN/RjXZ2vIvZI/VHCiHfU15QqLPOlly1nCiid9VzxMqkqN01142w7fJFFnaKSbsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565765; c=relaxed/simple;
	bh=7UjByT1vy6gtk8DnCxWFCcbKg4rFT6HauTTXHdZZLYk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nhWFgt4fGliJqPElpTaOZTQjoWdlLbkLa1HrJTROD0oJZnv2xrQzpUX2yrvd+enV4qSxyhmzMmRbZX/G4mFSS/FHzqUeCbmqfBmepH5Elk3eJHKzijegysqbbAI0vjjYPEYhl7B7kwAS0ugpY4R8b9PwRJ8NuM6qs60QKT5/XFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Ins11dGw; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=u429VauI; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Ins11dGw";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u429VauI"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68RNiAbB3706250;
	Sun, 27 Sep 2026 22:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+u9Jf9GyEMc9I8aVrq+ppBdDSejdteqXYnIkj3zOl
	Ug=; b=Ins11dGw2pMHEbB6R05NMFlU5Ni7eNYOsIXzQIeKJ/2JrmtoRPwXKOAdj
	9Oxslu7ZZfcsXmopvjRUpVRvY6DjNLRtfzsPLjNC5FK+7KUUIjktjzkRDGiHqfdY
	/cuYcX2gNl4CtRMEcux9ltWBwLCpHElsUwDJl1FMjM0Tbk4eYe1gRpRPCxByjJmB
	UXDIkgmeSXwUzNEJhao+w9ysMzJylVB7AtiLEtuYSXFb2IEmzcmzapA2r2gUEAaX
	J6c+UYCY1GL+/L00mCY4+j8Ei8oIq5Vv35fYF5izwtHtw64RmYXIBo2OYpQRQhY3
	PEfCUaPKnP43mVmdurpv1gyaFlwBA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00nb4rk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:22:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=au4SnpzQzG7kxT/PgUVH3p+8hHu5Rybc6DCkpI0xefzvztQ0vIOmq8aXNKFt6tB5We0KWnmMpSil7g1rPP0158/pQi0+ZhHcBjEH5ikiLoSzABcU/GTYQ8FFcbr02ccy3Nwb1DQForCaKaAcAIdN4jM+8WqeujzmfN8ma8FPZKuDvz+434CMAS2goQ0s/hAXktAFAaV/c7A5invusKfOgmHxDynI4CV8Ka2BuPpmuoONLlgHTOUkTtsuybs4PjIfnjIjQgewkPK84LVPSFzh3CjUxMA9O8l6CteblwxAQPMPMu/W7gf3LIMkw9nZOX7qmaW0nkmOjn7OzE/CT6DNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+u9Jf9GyEMc9I8aVrq+ppBdDSejdteqXYnIkj3zOlUg=;
 b=cVRRaMSa8uKJwrd7+QdQ/ambWNGCOSTovtagvui8SYPt0EZQw0JIrqpmWcf9CaH4vBGzhgmojL7iGkm9hhfJ27IIGdCK4ohoCsuAGzjEDNtcNTIlkcli64XRZaWRbZzKSLW4qr4gMOTzz89tRaqhcKsr5eWdc8w4dEaUbhEtbq2buJahClAItpmluPUPr0uvIWQLIXoVprJKzsORKTtVKgkwGiASZG9SpvwNQnF6TnA1SzA7cDtDL0xoiURtFenOkHdftnn3zDeSJLYe+83NEHXVn8YV+iJ3IKzGjVJNh1DSyy0Gh8S+6/+/f2gLq1EqWXfUbNofRmq/5W7hbwLqlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+u9Jf9GyEMc9I8aVrq+ppBdDSejdteqXYnIkj3zOlUg=;
 b=u429VauI6oaLu1aUnyL+Zbdpkm5qUAbYb4Mpqrl8giy8NiCGMBtibQteLsE3XDjqb7pNtwsqw4XJo5fvqJfQ8HdJJ14abLwG7WuqLuc1TeUmTXyWLqHUINLleeVmn9KdZ4Iqwv+y5QYeuAPsGyHvpldMgYDNo7tOkfSuRwI7jIE=
Received: from SJ0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:a03:33e::14)
 by IA3PR10MB8616.namprd10.prod.outlook.com (2603:10b6:208:57d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 03:22:38 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::1b) by SJ0PR03CA0039.outlook.office365.com
 (2603:10b6:a03:33e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 03:22:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:22:37 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:22:35 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:22:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:22:34 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3MNu33209268;
	Sun, 27 Sep 2026 22:22:31 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Reserve RTOS IPC memory
Date: Mon, 28 Sep 2026 08:52:11 +0530
Message-ID: <20260928032221.1072316-3-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928032221.1072316-1-s-adivi@ti.com>
References: <20260928032221.1072316-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|IA3PR10MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a58b19-2ac9-4746-1bd0-08df1d0fbf41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|10067099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	xZxX5ozdunmVAidn/1XO7GzLtnAvEozlpVRkCX25V2OdGZVdy0OTbjZqprYFmAv410vzL3BPkung791KtfJJhW+nZsDMpG39VrnEqqILELn3wgo4jQIh9LQ2AHohtP5x63fT74lZdq/zuqlMPDKyJPVmHArKy8PJE5PBqwx3trgb8JHQOA1Ih8UKbptj7TgwuuL4bO+AaMK4ViRGtraVAnmSxkTtJ4lNQtI+YY+NXK2s/M67X0GIIYX4JT9CbgpDFymAUm8vO5xtLlRmP0XiLShiqcCD5DtxVXJau6gLnFaUs8LrWUFGVuf4pAyhrOAzcvNUDU8t5T4EXhG7grDZDqT4VmKmXlJ/6RxQhN4rMQCmhf53tBEc/eWlDCZFT4ZHSPX1zzKpOpk98DVzyr6DaVkpuKKiE0I4o8EuO8tHHnL6Xt4+9bX4PLm0ZVuY3XDESrj5ug6bAi9uNY19Mjkg+6tjVXkWMH69JRpcYxq7Fhow70zHGloa8fYORVh65gFX+4poa13q56u/7rMLoz9zMr4iUN5cr9SDgzuu8f8xwCLbEZSrKzjdRA6wNMrOs72aluqYKAhqw5Sn6TJGwqPdIJklsu8UqVvOnU1mrNpBughAxh9GH8J3b5SyKhdahPXYvKZnnLldJ1+uQy4sopIhul9L85BWHmtoXrk3ux8wkIlav9k45iQvDMUUUoQtx/wnRaw802nRPwjHmE+u1yXFa19F5nR/l++0LjDnNpfLtKIbaQQY9XX6SWjxYuFBhL/f
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(921020)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AG1HJlOcI6Z1HOEX8VZAOwlhW6E+s4MSFhw724+KAGjaouUZwA8Uo/F+xMrIzSOAanElzsP+rmWaOyCOhxFeEe6xNPiRI0YtQLNx+C32Kyzl83UPrbEjCmu7eeZnAfw2M6VOdaa3ZOFTMu1e4cgefLG+EwDmJ6pHmw5PDPCh0omRHmPx0EhljW24IEZhdm2Q79zBKaykQFMgEZwjgZwourgizkr+cW9LgWBAjdTahKs2CDm0aZdTQbpIAOux7hivIN0Voluo74SznVqYxyKIT1SiDJMC7QkGv6O2gvXFlfnCWIpT8qMR2VQclYIH9RoXNrMfOoZaUEtSqtokg8yzGdb0xDUISRSVP0pZDRthTqzwk5dZcPuR8rYuC0JCq3NyW02+jwfnTu20LRgTDoFCZaHYMIGnYhMubuI9dEEyQkUJebj/i6nLRDs4d5oQUxi3
X-Exchange-RoutingPolicyChecked:
	rm1C5Lnw86hnEQRN3wVTnETqhUhMQVne+Ipxn7lwa/zbGmKK3QEwIx3PDqcGwoYzBb+TqXdt3zqQF5Exhtr7+JElmpsZjbBrj1Q8ayeoX3vQ+USOf4Q/R0Qtl8G5pqe4wDuA/QtaxuKxpZLZxc1sc1z0dYVzk+lwOZOE3xCHYRm1Q8GrD/0X+5nIxdpg7u22/poU/6Anq/y+CBW2AY1AraTSBLNDoAsHma5X/1XNBIQPVx1xfl+qknvXl35CjvV5Yd10Os6qJW/9yOpBNibvyfZtMqbExceZSkzjCLNgcQ7kN5uvghw1/2bW4gJsmqtn7TnioHYV1rAcLdYncUeyIA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:22:37.8942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a58b19-2ac9-4746-1bd0-08df1d0fbf41
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8616
X-Proofpoint-GUID: 58K1weg536809D2wSI4Cdh95swELl5mJ
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6ab9dd80 cx=c_pps
 a=nhquEFRPp8Cuo1IKRjcF3Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VYn6-awO5kv4_cH0cR8A:9
X-Proofpoint-ORIG-GUID: 58K1weg536809D2wSI4Cdh95swELl5mJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX5isA+7flGc9w
 gFci3TXdX2IJP/R8RLys2KqgGYl+T797Ig9lIoUTlEyPJ1Wf3XUgBRKCMibDAOeS1BBAhiPJ2F9
 goL0XDo9Ma6UZ94GBj8h1u2x9AquwW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX4qOeTPDIx69Y
 PI6lxqBG0za2PWtNwVuvWKgZFlDzQoAT0CNBPbWoA/fbAmF7ELI/ZcaaieZ8nmKEiPje6eirk3x
 ju8r4Lp5JJZL1Li6maGH6GbFtOaz/VvqRCH7FJVdVPkBK5UaOPGfkmitl/QdKBOclwJbQuXL6C9
 BKyte55tWMX/jn5fOo5R/xeCEdO95338dKd0lZGSQhCV7CCeMaSwJ9/NEXYW+UFPNwoVdJxPN5i
 kMzjWRYwTqyB2k9E3gGBOIcserDj5au0zdR0i39xPGwRE4+evskZvdZODCCEpjFUk6biF51+Y3Y
 K5ENN6AHsGC0yqRlpSfHlLWse7HilADdTBJ41ShMedpuWqYVHF2wuPgC6yYW5+v0Zj92wsHX0H3
 4a113hMJYC1K8n2XrjaXdPgXl9k2QXxwbm/WeJUOO94vgynwpu5IPSXet6NSdr0iF5p/AmghmAF
 3JjXKHkr3udj1LtG+Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

From: Hari Nagalla <hnagalla@ti.com>

TI IPC firmware uses RTOS-RTOS between Wakeup R5 and MCU R5. This IPC
needs shared memory buffers. Reserve memory to facilitate this IPC.

In addition TI MCU R5 firmware also uses MCU SRAM, hence make this
SRAM accessible to R5 remote proc for image loading.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2d..7084d85665f4d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -6,6 +6,12 @@
  */
 
 &reserved_memory {
+	rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9b500000 0x00 0x00300000>;
+		no-map;
+	};
+
 	mcu_r5fss0_core0_dma_memory_region: memory@9b800000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0x9b800000 0x00 0x100000>;
@@ -54,6 +60,7 @@ &mcu_r5fss0 {
 };
 
 &mcu_r5fss0_core0 {
+	sram = <&mcu_ram>;
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
-- 
2.54.0

