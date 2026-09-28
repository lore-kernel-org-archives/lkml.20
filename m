Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF3326D4A;
	Mon, 28 Sep 2026 03:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790566906; cv=fail; b=AWYP/RLLe3OGZAg1b7BTTAcdic6OgtwIqYKn1tEZ1R42eSeyeWyw1WiaJARBTul3YM5fBLu2qLXO7yh/NgLRFHU1neRcUusfaq5DeV4fTQXgwI4I5JamZ+tS4nuBWEX9Dp9R1Czsa1cQhonKNR884xhSVktuaNWlHYAm4kaQwRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790566906; c=relaxed/simple;
	bh=bSwrS3QyBx/pQLf4agi4fx2V8PdeqqOKdOvQjRJShsc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hzMAszBdKaNyItmbBwcDf33H+LJM+pwN1kbp8QDrCcBYk0/ZDWs+Ldk622+sH2yYO/bro02gfKRXZDaxFtfxZacalkkMuPIzRXY2w40TZaZRYFYnYygSz0P8Lul522oR8KIIQ29zXWvzO/maushmUhJyD/7CrGE3SF2L+K6m6yE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CojmOudk; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eZojHlHf; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CojmOudk";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eZojHlHf"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68S05DIn3708738;
	Sun, 27 Sep 2026 22:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=K55Xzo2/iXaITsZj5/xMdwrqX8q8+5xuFlJ5rbd7E
	Dc=; b=CojmOudkuMDSrD5HL6+Nr9XQlBz1nbtSMxzByNkx0KxJjG//tXlN6PyWK
	nqvJNzQpjkX6dmmRrWchNBxl7iKBDjbScnXUFYyNTpKFfXIQXwIENJzYvMaolkN7
	Gl8/2SOVAFk8Z/oyLAlv3fOYQNtOANPEi9jdzVK6eHKp4PHqvlh+KmQzEgQFh1yi
	SPoxnTlAnbMV+k5++5ZiHCfqtph3EksSGDChW6s6Zv8N5RFAt1uWDKZs0A8MeFLd
	BpwlsF4Xb/mtkrY+ns/D+dkYEgCFknrs4BfGITRWY+LOQDYY466b1H8oAdyqhV3u
	uty3ZHAS3lM/7DxROr5HZ0bzhjv3A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012004.outbound.protection.outlook.com [40.93.195.4])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00nb735-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 22:41:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ka8cgVnJ6Wl1NAprcArcfOC3P2vo8duPlnOegMGP/XTxOOpYVfJo+nSf/YlRDXpbYzlswpd60K46eo28GMQ9bCmpC9Vjfik8HSmatXP7DqSiMOLmpoQle/v+TYPo72GonU02ujczlTNbRwRg366va3xG3vAxvfAts5WddJgDS9CnO8dD/7VqS40voF92I8sqGYg+XMDb8oO3gj5KVoswYY54HX4NlkCnqZCy/a4MC4r+frdsBT84GLXX3iQd2IQuZWFvhEwEOTqrV5eWm0gvxC21EJpFer4omFxyVNQmEyD8ixRcfizj7fX15VijsHutW19BFabuDCoGWx5/1kMBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K55Xzo2/iXaITsZj5/xMdwrqX8q8+5xuFlJ5rbd7EDc=;
 b=jXy3szqWBhiUmhatM7tNrLJIqoZzx016O5+SZpaIIOCGEJgMStSO/Qb3p1bBb+fYBNdeg8IuH3LnBJuB++ZtcYmJ+gPTsMNM1JbF+g9UqiQPh7ulKrNjBBb9zgSdE+blx4AfR+Q+dI0YYsiZHEPKI2VikmqM5KUMMojqYhDh5GSr5FPqrBh9o//Y17E3CHY8f3pdQAQpCt8QCApLHQLIcbl+IptQQ52uODYmg1eADIQgUzIJBxD4Jzf62cNm5oRiTcUXJJJBxGZy8X99LYitam2Z4+Om5eKI579ZE1WOJK9n3cF0CKkomuA4okDovqd6IiaAQCHemALXAX/D+inBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K55Xzo2/iXaITsZj5/xMdwrqX8q8+5xuFlJ5rbd7EDc=;
 b=eZojHlHficwajZ6bAx7hOrgKNByw1vQHVnjuqr8f8e1Pvlkjp3og1CYzTNTmkP9ioGNUfjeCYTaEpoDbpJEpQ1gTvkFkNk7MTgJcxe58dEWTLjV4WCHFR2X3ATQ54se8BbbIJLQWHP7Lwx/6BLL9p9FTHUN+rUm+a/N8nU+J3gg=
Received: from CH0PR04CA0081.namprd04.prod.outlook.com (2603:10b6:610:74::26)
 by CH0PR10MB7409.namprd10.prod.outlook.com (2603:10b6:610:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 03:41:36 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::16) by CH0PR04CA0081.outlook.office365.com
 (2603:10b6:610:74::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 03:41:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 03:41:36 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:41:25 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 22:41:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 22:41:25 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S3fHEx3232462;
	Sun, 27 Sep 2026 22:41:22 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-adivi@ti.com>
CC: <hnagalla@ti.com>, <jm@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62l: Add alias node
Date: Mon, 28 Sep 2026 09:11:08 +0530
Message-ID: <20260928034115.1084840-2-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928034115.1084840-1-s-adivi@ti.com>
References: <20260928034115.1084840-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|CH0PR10MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf07f67-ecac-4e84-21af-08df1d126608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|921020|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	twUMiAZvtlaAXCc6fy98WZfCgPaJ0Y3EOBQA+YPtavA8AJ2CCHWMulQ6cFQoL3KpOTyWoELaXuskkHdynoDc0eqtV+hqK42GF0rC+D5YxtfT6vKRMauoK0zFlQFGpk90huvzIullTYPlKHQ3iDIlLHpA5LqOh+JfCNbZb7c4/Ouv6QAM4WLCMnyF5HZE4BXlli2C4zW/H2jycKFtVQ6BS50V+4nFJaHK0BjUqHWrYDIsORAB25lEelhZfbUh7fwBWmd/VwYv8iTnyEqp0EU0y+/A8LuuNXiG1xMX0bDdL9BduRsdtVBRUezV7CIxZ6hx0rEjnwiYnPBpNMZ54McCqA9NYiWkaPqNE5U2SiqZyoM166d6i/uH6HDPRkuiKaWlJUxNU7s9kdhBoz1CzxvkITLnRgGVNrRAUDsp6ZcBdLWVH8nkQ+AQaZOa8xSQrUACoUT4yzESEmOneBPsu8A9+WVBGJsPPeIkyZlBNApWRmgc/Io8tBIFil/8bcyYmonf3jGgAhezPO9rVjXzPw85vAmG15EUL9CrvDInBbCWfkAvvn1Df8xlfw4z8utlf8/BpwIAXqO/Wq17AaQiX1AOt0QNtTI3k5JjM/WDzG8K5SWxSlWICKU+FjibcmXAC7t/6GDqrrHuS3TLJwUAZRPH33qEkoKwlwPeYcL4q5wJHzSOuRfb3VdazR3x0hbjqEQzymF0/QK2KEBqLTZYtqleY0SbkJBxa6+pmlXUNHrD7EvQB9UtnREuinNu6Jj30IG4
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(921020)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N/YEisdF+GesGgP+4XEFGXPfvRl3qQM/KDqt+aP+004eKxPqR0u3xxZdl/UANDU0TSTZKxHH059GyXb2Y+jdE3JG09FoPVwmMHDuG5v/JsoxeYSApyUuq2CVu+B7FH6CWI5NNvpS9i/X7sqrgqQOCneYqIcGjHvn5rV4D90xSc8H3sPVtXP5U1Gxjig7e+derKCTWUwUQp/iRVVqmVTH9bzZhXjtqcq8rZpN4srv17HCmq8yG51dkhJvxdUTN3ReDeyi9VPKGOzH1mXPlVZ3g81FgTTQKxyu4jMsEbNNGO8S1hcPU/0sr1jZSK49+T+eSMpgoVwj0rdD3Ve04llxc7uKJG35SoYMyoRa8yqBz83bI7qKQ0liZ0KaFEyx7b6E0+G1l6JJ2gt+t7cY0J7g02eu+rkyMSbkepVm90O0/iEdE4GnDoR8GHyc/NqbFNvd
X-Exchange-RoutingPolicyChecked:
	5CwYcgGzVGkL+kAM8M5TB+hvVhBIA8yxIDKsBTVVTmCP0C0Vmzd41oPUgeGNnrQelp3PF4HHBUGt1xSFLYLPXK+adKpaeBYczXEZrPhU1LvONRH2EIBCsCT+Z5Fo7dLji8fyA7L+Xh80S391Du2MitJ3N4Ue/pSS2nUddIk36P4KfVkaBoQXeaycCpYfT2neNAAU+DJDKICwqLW+Zjfq6RfuM4kK9w60/G6mYfvzuHc0kh3Wr34drywf/nCF/6w3wFyLwXTtMVWWe481LjzqozOc0cbi5F9J0B1fUBC904T5Gk/X6U5IoJdxKVXtzTq44pmdSSRlndbfI//9thSZAQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 03:41:36.7275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf07f67-ecac-4e84-21af-08df1d126608
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7409
X-Proofpoint-GUID: 9Vtv0rTwBWcamVzRKCynTCMqkGYVMH65
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6ab9e1f5 cx=c_pps
 a=eN70jGNn7EKSdYhrfilGAg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=h7kueL0Xk6d6XVDAbtUA:9
X-Proofpoint-ORIG-GUID: 9Vtv0rTwBWcamVzRKCynTCMqkGYVMH65
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxNCBTYWx0ZWRfX2LuLamqFVV3L
 C0gs5FgdRf6/Us4OjNkEcHQ40auSmA/oKM218BkWTRao2kIss3xlrm2MGPdifQoca54oVmNkxcb
 KPL3DYWpZ0NuprSjLKTPGFBkb3QsEwk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxNCBTYWx0ZWRfX9zGBcsltZq4g
 IghVbxI8Lt40EUV6w+BsOHdbeWKpM8WqNaD+9IYVEgyxuXxt9ENu8yWuSbyBq9DRKy8Tfap8n5l
 SApf/z5qPgNUMCuBRZEF9lKXXMGOiwRgWi518WJ/ce84igWWNP0xJ8M3KpRsYrW79uJ0jC2OY8b
 QLXHy6An7e6InCTr9uQu6Bi+37tJAgvKqGmQ1vszimhwrlCUlYRcQNqCHBNUhkTR8S1UizJT5//
 KwTQM7jU5BFKne+MTDZBwPSQEBs8ExMe0br17j3Qr6L4jPwJsDyqgN0BZ+1oZMskpe8fMrr23md
 tW5UCvERBj12eCVb5f5t00VHANNmbP8tnqg3bO/79giLijjfL5fIDX3LaHBKtCMiBN7c8gUC2Ai
 mz7Ccc7sA1QJdvwjoqep8uyzVgPWOAeP1iKo+HSsQlXzaFStbslNuB7qYq9nGD/6l/P+a31lNYB
 kiCQIqW4jNCNBAWmjsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280014

From: Judith Mendez <jm@ti.com>

Add alias node for am62l3. This is mainly to link mmc0
alias to eMMC and mmc1 alias to SD in u-boot.

Signed-off-by: Judith Mendez <jm@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 964387eb51788..f357dc56de1c7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -21,6 +21,11 @@ / {
 	compatible = "ti,am62l3-evm", "ti,am62l3";
 	model = "Texas Instruments AM62L3 Evaluation Module";
 
+	aliases {
+		mmc0 = &sdhci0;
+		mmc1 = &sdhci1;
+	};
+
 	chosen {
 		stdout-path = &uart0;
 	};
-- 
2.54.0

