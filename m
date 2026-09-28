Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BACD1DDC37;
	Mon, 28 Sep 2026 03:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565315; cv=fail; b=oU1JWYOKEAQct3nw9uz0fc3NHd5wDfArE7aoZQgNYiccffrtegN+loblydNf6fNH6Xana/fxYJ37mXec+i/KtP3rvkZO6nXYsATon9ZbT7X3iiXTwM3s+dyPHCvcieG3dVq0GIiav7m9ekKy3om8OjkLVt46Fg/qx4D4I4Yigl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565315; c=relaxed/simple;
	bh=om64m1i1rPfRJnsv7fi9Vq6pjuu5eduvaJ8zFT9rI60=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=auGiNizChElb/GT3Eij2fKpRj4P3olUksp46PdKFu003aucL0q1V2V4tTMxT1wGie+q2UEt2FFFTN8eUbzG9nPnISqQo8L0A2etUfQCjxOtVSbTUdOMDO3UToAg4m4ZNosWDkdeqlsubetw6dV2CzyNkJhycU8YOH4dtTWQm/es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kVd4lSXw; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=p+co3d8n; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kVd4lSXw";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p+co3d8n"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RK4U572807666;
	Sun, 27 Sep 2026 22:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=o0XXYpWEXc08Lr9zpuwpvaa5eiFE72+SHeG+0Ai6q
	6Q=; b=kVd4lSXwigjslVgBPamPMwybMOy3OuvDl+qy2mbA236ERElQG+TndOuUR
	oYSAC1EkqhcfExiS6JB9HMJJtuEU+5J3u1IvR193Zps9AD9A4SLBY+Ylqduklkxa
	yeCW5nkB582BDwsZ8lb6R7JJyxhsL5lVuj66VEekNMmgav/wZeKxUTIkPei7VCv1
	DDlZvLoIFI5DSz+ZXK1W9CctB9ygB96MdCzbAPsQCp/T1TusUas9KcAgM7+2Jvss
	Q0++uoVrER3ZWjEotnDMwsmYS3AW3txx0RKuIcgNlxytBOrgebRG6NTm0E2AFHE7
	Hkwp1wGilw7jaD1Ext3bmsDjN9hNw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5khru-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:15:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8VMliUef2JoBoYAqbP3aTlnTMr5tgowyDdSle0ycaq7kNQq9/ACbhPuR6a5/qHTp2XknTGmXHD/pY3e93OOL+G9df7BuVkWJDKE77CaQJrgwp+KZqBy2LbEuL097mDDvZPJ2EV3TUZIsO25Yh9bvg/ToazixFqiqiiSN9NVzPXDCGNxigqMqyKzaGr0AyznnWmr+Wd2PXfsBMREsiYfI0y9EchX8dPD366uqUX0/6YRJwqbw15/bveJusVj0Z5k+zcRkR0+wUM9Xn0tsjuKZDo3MNlNy9Y5NYnj4749VT/78+7VgjbFO93cDjajQRea+tYCirKgdb5AayA8IOyJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0XXYpWEXc08Lr9zpuwpvaa5eiFE72+SHeG+0Ai6q6Q=;
 b=E8CjGU8gMnFXF4SUFuaDnNsvO8NB3iDjGh+frJpnENLwvfTOUuvcoly2bLglqpq7QVdxLWuvcHSpvJaR36s54wfbqgdLMUn+yJRJE2rBnDZRfDS2BVrTUr0DbN8hgsd+zaJL60f7b/LzhUN6dztSpsR+3218RNvl3JIwzCU3DIzWq1GAtG6U0VPq6yU/2uuKcMBfJV2CgBukR4cqZ7DJ12mzAuZBniADrBfoNfTftlHmUXBUCJmL1LKcO/QQ1GUYqhfYucXitqqp5WSeNIWLprAkvGbwQHJZm9g+Dmm+yE45iu9TLyh/YcjNy6uVQtuzXxc2tq6WeN66nhHDZAOMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0XXYpWEXc08Lr9zpuwpvaa5eiFE72+SHeG+0Ai6q6Q=;
 b=p+co3d8nfpONefau9zV0sC032R6M5HD/XABB11qLxIQYHDqnC7YTn1yFPN+W80hh5mOGlkUzIfo1EzBeAz0y8zsbZGXfOr6zDEKqKpAY8J4KMyZY+VACGLCTzxrR5CWOy9CrzpepZWG6SedrnRu7t2e1XSnafjGCZkTPbZijx6E=
Received: from SJ0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:a03:39e::16)
 by BN0PR10MB4887.namprd10.prod.outlook.com (2603:10b6:408:124::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 03:15:05 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::47) by SJ0PR03CA0281.outlook.office365.com
 (2603:10b6:a03:39e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 03:15:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:15:05 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:15:01 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:15:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:15:01 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3ErDk2281678;
	Sun, 27 Sep 2026 22:14:58 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62a: Add MCU SRAM node
Date: Mon, 28 Sep 2026 08:44:25 +0530
Message-ID: <20260928031440.1067076-2-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928031440.1067076-1-s-adivi@ti.com>
References: <20260928031440.1067076-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|BN0PR10MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: eff4ae2e-ee30-402e-300c-08df1d0eb153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|921020|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	is7j4I0pb/FJ4B6N0/QVSBPgNqIMjOOwd2u/+/+ek5jDcIJG4iCFAS/T3fccoEZfJ1/i81EgQL4BeYz9KG/OeWNPii9hqBpAxDTwJx2sWsp6LX112xFjhetYluO7alwMtHzC0hyrFma4be50lXgNool9VNR/H77zSptb+q4Ir1f2YxtkxwPOlIvw2Spcrk/vkldOmx/OYoLR10zHvVe9Z3Orniefjc1tcz79oJk3ltQNnNR41N0OGnSudzfRsL68js/4Rd6Ryd0eV8Y9PrvRsyPfKby9LfdbM6tP2i0eHiCq8FZ5HZaZF7jfuRkmFoOUCreFBCwjkrZNNvoU1SPNtcDwAXQW949kQJepjPeSKTME6jtX5123TeCOr2Qu0g+JNBV6Un/v6Oz2giiYtUs3akhra642bkFDxN5EhSjhXpEK6soHcPQxn7S668cEFhdsL86b8TZ+htLSQbcPAQN50IMfXC0n6SgJ/h0uycL4IK5ftyrPRciM7dBNFBYnOuBD8o7sUmwAX7a9D39AC4tQDCn0Y7RCeNBbs7XxaHTXJNuadmXqwPA3hbuuGusZsfkIbxjC0a3WNwxUHm1Z6P4cJVDOaiS943b5doUEd0tGOnP25C+KJef9PilnawKxTiZ/MHXoGTrjNkqRmKlEXz3VSbo/eJYaVw7vLxUi6HnKm7Xchc18bTOlB4iJF33vnhqi9JcPO0MaGlbVESukih7WXF9rxO0UzrmWfUTwkhcGkJ329swHzF6HAFTSmyNHySbi
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(921020)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NwbgPJvPsKYbtJh1LISEDySjDReYyJ51tFjtT1otG9KL1CkaQrI6EObQtMRuvV3TjYsFYHOmk3xCYyb2IXa32mh7ugZzd8ZTZfqTeSq74Hab+BxmSd0tSOADsujOHFC75DNKdSLtU7vl7i7+ubJBEiaOyb5I9T+gKTBRvBfGZrqMuAitoDBXNZoTrwhnnkQmdrgv7646bTrq/9n+Gdb/yHgJDq2ChwPuxATw+FS6h5K1szZdmk23YXHKWAox+fIIcrIu+Fh7KiUzujmhEHAtfPV4Fy2xBqAEez6i3JMcaJDj2J6LMNTEutyQjxRGj7HINY3AIX0nxZkQJuOPIXIVWgK7DBwcFQ20eGEb1TC7v3QhIdjv0IHLe7oGLNjuoXQ/xQQJ6ytO9L/uX5vdTncwDx1FJu2SZn4Ki/Qi90pXRn3coOBBNOABiNI9W1x3nqCi
X-Exchange-RoutingPolicyChecked:
	hUE3hoprGvYiEo/aJkCnLaPSM2sEiATcVii6IEaMXewkVNQpvztiUHOQB+ltwry4yx1jRkyKXVv/wrsEQGmh86FFEyb8DL87kHdnPU+uihp6NAJNwX544ytNgcKZ+rfD2Xcr0crp2j4WPrq0JFIfuVcuFAceu3pTzEQNeh91OeKmDJETKcP2XWGPCVrfYlGZb2yRbKMyYGoVDNq4D0ocbnCmFf3m73voAYAMyXTt3tzSQ08ThY3OmgqW02nPRKNGncpKxR+2qiugsrj/9x/Ax2xDm7h5SipLOOS8WOsbMSJiMtW1gpUZiV88yR41+V8B83gDaHRbDNmWP80R8y7hlg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:15:05.0392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eff4ae2e-ee30-402e-300c-08df1d0eb153
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4887
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6ab9dbbc cx=c_pps
 a=jCxDXDPT0EaKR6BOOOS6sQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=t9F6Xm1siACkDYzZU-YA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMiBTYWx0ZWRfXyuO8kVjHojpk
 8M7BzDDs1SJRqgNKnoMpS8TGaeNqnpX/hkSjKxaiGJUKIStqogVhbJQ/UIQMOS8032UWqLMuC26
 ohnm0HUUuoWvLs/3cfzRLcY0mLCBYjbpvG81lSYQN81bUAQMOhuftL81N68KmQSfJLqTEspf3j2
 c9HosoEIrm7TDiPUtHF1WgYqAbHsAnY7YsqgKpFlDIytP9gBcAsZ8bOzk6DlxxOaIt9QkL1b0Fs
 vLyvZwcAUHCMwvsp1y+L0MipeLREPXsuDc7tWSRkxq7AmdLlUoNgYunzXvYuibE9q2Ms9VMeRV5
 OaG3g9dXgFVlObrv9JOhbnet5GqTiC8etqANRxdJjLaA9beceQkC30d8pCussp2JaFCpayydI1y
 JXvr36IpM3JgsfdWiI65yDZSqy27xfdWdto0g1oCcXJlACRRRuzkKVU/pGr3dsrEwO9YZC2vaL7
 7RrhD1r+ubsT17aPsUA==
X-Proofpoint-ORIG-GUID: tkzIvpbemg0AfdhGf2boFbUnDxClN9Cx
X-Proofpoint-GUID: tkzIvpbemg0AfdhGf2boFbUnDxClN9Cx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMiBTYWx0ZWRfXzce6GNwhHHKn
 N+wT64jhwgXaLGUaZH730TnLJv4HG57XJx6EM9tT15V4gkXfnXnDOKcOmi5JJZlBa+zoQbLGBH+
 M4Qh3knjxgvgitb6WQY0TF/Zyk+PAmc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280012

From: Hari Nagalla <hnagalla@ti.com>

AM62A devices have two banks of 256KB each SRAM in MCU domain. This
memory is typically used by MCU R5 firmware for low latency accesses.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index 5b90320778747..23cc9be1dd5cc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -6,6 +6,18 @@
  */
 
 &cbass_mcu {
+	mcu_ram: sram@79100000 {
+		compatible = "mmio-sram";
+		reg = <0x00 0x79100000 0x00 0x80000>;
+		ranges = <0x00 0x00 0x79100000 0x80000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		mcu1-sram@0 {
+			reg = <0x0 0x80000>;
+		};
+	};
+
 	mcu_pmx0: pinctrl@4084000 {
 		compatible = "pinctrl-single";
 		reg = <0x00 0x04084000 0x00 0x88>;
-- 
2.54.0

