Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2E4071DE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397295; cv=fail; b=tB4eLg2J79JZczlENtG0p62MXzzkxb6w7COSMLL8PYDc/rSp1l+MACyVCsaKghQsoSPDbAvT5nVQm/m9B0Q08U62IFofYMiEgS6gmR8w2R17m9Pu8+oQ1HA9E0kvs0JeAPmM3ypWleGNsL85zWGE/2t8lV8Ke1jDh0tBkLzlzKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397295; c=relaxed/simple;
	bh=TFdXGMTLdyiw4F6yskaC/owJatKRdHQMiOsvOeO05RQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dcIvz8Iab9FizumKes6SNbJb7ljS+ItAKqi3SwW4P5szlkXljqx8JcwTYxt6CExLPSQAoSa12UaJn6ukJHycGBJtLKO0FHyNVGZdx0DRGyjN5fvGFZFvPw9LkgK75cb92TXTSR9OSfzJ9shK+HgchhiFn88dm9PoyQUh1ERh3m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=THpSZIwg; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Zadx+8TW; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="THpSZIwg";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Zadx+8TW"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69J4h8UU2314099;
	Mon, 19 Oct 2026 03:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jiG5kBxGxShdYw/qKYxmEm5EIo5Vkk7ZSrmbCLJ3G
	IM=; b=THpSZIwgS6jo3MW4kehTl7ZZ9d1KM2YER9dyKBPRtYXAA4nN1KTF/JQoO
	f2gh6URQszY7nK97FhofJUf+frXPfUHjAOZ38kXMNOAM/emQATUcB/6EqAnUQphB
	cLrDSgXGfQNhSvNy4HjbHw5sFPAsD5Jk7ZCXIWUDVcMk1oRtG/vEYLAdkKzVOJMU
	7Re8M9HIKZUJ4OTmqN/+77g5gHgskRadmrD6D/HAFr5t5qRBgtXKHXOVCCNEKDej
	vELDXANP/i2PAC0jXWSPDYfobZS6h77hKnyasOwU/Ls/BU+lGXZ3yTZgyBmY7vZT
	hyP+CaD7bo5tuZGhDO9WsaMQwKw3A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hctync802-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 03:08:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmDe17mLjDnjjOD3mXmfADQkR982QNnKsP3Ef+S1AFiOg2tOyvtYKvh+EL0yK0vk4uvkifFJ9NgehNsaE2fotld2+mHpIwvtkEx+2wFZOP01UhykfUoRNOlCQw2FdRxMbj/A+AwlAHcrLcm/ABa1bSE0NAjt4GYliSY+8Bw46QzQchhxi9+AFNTdEt97ZmAuYK5Hr1PD/Wmc6/Y1b38EjrEEkS4UqvNVVqJ73H0g7ZHIAFzGS1I0s1+NCKY/4NJMlv/wsz0lHkhH93B+5pfYcg+1UI6PUcK4A4i+6XsginRpPyVcaKN6B1FSlp2QCl4PBZzh78FYz8syYThdE6xpvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiG5kBxGxShdYw/qKYxmEm5EIo5Vkk7ZSrmbCLJ3GIM=;
 b=vSACmUPwMARGh2xKGc1V15M7wNArWQM02HHqjBCn1SzfsT9qQNu+6OkZDgApdd3M8K6yKhS6vyTbbyaizc4yZ3WuBSHTXVwX3VavLAKedH0LNwI2lI31oZSVrXaU23SsHNNpw3MpAWFtMkYpY5jl63//ITrtqrHgCEVIgqly3cbnbHeUpQYFBK6+yL4tcGI5cmFXOz1+xuVp9hUIvDnJWvLJR0D00o4fWj3aKDGujM2Ggz7JwhSHZhGJ9Z+pFjoGUjZurDVFS+uxgCVNJ/6vo54N8FGGpyDHYahPdAUTErrCqCJ0yiBi2NZODUF0bu00f+Mf+dQKZC5kFoil3YGvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiG5kBxGxShdYw/qKYxmEm5EIo5Vkk7ZSrmbCLJ3GIM=;
 b=Zadx+8TW1BbOUqFSy+Je7DzsOsHSkJ/eMWF1CnOipNvgnO2MLe9CNn2HnjKGdoJyfE3AGtyq/zv6fK1BHeqVpC1I+SE/FcozOiXt/XFB5mTDywSRdkCGxtQ4tXqiTEMKLXMtZXnccReJVK/K8X2OtO+vTYMVG0n+qs8mKDlSREY=
Received: from SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::22)
 by SA1PR10MB997714.namprd10.prod.outlook.com (2603:10b6:806:4be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 08:08:02 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::43) by SJ0P220CA0014.outlook.office365.com
 (2603:10b6:a03:41b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 08:08:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 08:08:01 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 03:07:46 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 03:07:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 03:07:46 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69J87aSq3342624;
	Mon, 19 Oct 2026 03:07:42 -0500
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH 1/3] dt-bindings: soc: ti: Document the ti,tda54-mcu-scm-conf binding
Date: Mon, 19 Oct 2026 13:37:34 +0530
Message-ID: <20261019080736.944127-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019080736.944127-1-m-shah@ti.com>
References: <20261019080736.944127-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|SA1PR10MB997714:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d42f78-3dbe-432a-933f-08df2db8185d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	Ar1af3sHL4yBOfGrcg9Ryz3IzoNJPxHQP4duc3FNaj5DkFXc4kqe54YvIAN4hqvnNBOY2NC3nOBBheifeyQmqIowg1RYcUrQcz0XFBIPbczCV+jA2qhlm3uvprd5GHTvW/MpY77tfxeve1uCwz0bPx+U0XWF4gxDnNO4eUukP4hsebmY0GPOsAQ4Z7Is7uIgp+tuZHdAqFm4p/52OC8gQHXn7++A8ozzBAA7lP4u6o01s9dw0wFgW1NxbZI8KELKdY4+t7CsrvHHxvXpub5npHkmvXIQvlV5P/KWHtcl8wCI2rbyiuEiXyWZIu2lovaCKgEVmBBUVT0BaQzL2SeBNqdIMOnOMrlHBlEEUXUCB+5G5+Js+bej/xbwjthwX0vteKzXel304AZcTULWfHqX5GqZ1NbvpmEr+MCVv5QHWdkVWIYUFWeDwFHJcVEgQ3rU/aqyDx7w4C6E9KBCuHU0F4x6iyT/bu0XnAKD/eNR/Ys6RIVWUMiJCDvmkmfbBBEe2RwCu5taw8OkYr53qz3eMMDroSpf7mL7kCxPhMx/NFOcNusfzpYiXlYQXsKUO6O7snwClRaReNfrXl0kkdrAPFy95t8u/cKe86Q6yIxIkEXZKjxhn41IjwPl4fSn2fVXoK7y/H7yMs8Tc/dDNDNQtA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tBZbjBkGy3XG9t6n8I/ocRb0BMH+OBtrRBPahcdtjTCsqqaNqki4mbQNTMt6rSL7N9JTdyhA9leFBQL3N4mfeuPqDH667XJMRC0V6UVKjhBkw6kJUOoBIiu4N7DhV88vJbz6DhZEDbUL2sD4AIHjZKF65LFMAW9wSPKJ2d0B+Lgz1hJ84oa28y0cZQaSMzHryUVr5keRaVPpjc0hvZp8I/2Q8/Infz+bNO0fEoUxk3OcqV9XLXqrcIMt2OpDx4DG2HY6UkiWoUgi8fPMN/oqPHfx5wDxYPUTACdA/S1zOxBrei5YMjHbtsUnT0/Oz/xCvejy7PxYIf2wuBd8VeeKy1maBLl349xRk3AMXD9NPOnoSFEX63tmNzVFlhQ20OaAD6mEQ7TMkOCagA9oBO/Q4E0x/cWgT8CMbKq8/jGPOXbmq82Nsj2r0EHuB3Qt7K8S
X-Exchange-RoutingPolicyChecked:
	BfRnQaziLAdAmSO/YELOXYm9/YmvKw6NQOd/RC4q3jsPG5eHHm1D++2ZRZmlr58I6LSsyZisAnWLR+LJG2SNz2RTwrnOjvB4vbhRqIWSxOZk7vfdf+C9JRKulQ2h52xH2OWAhDtZVW0bRV2xP1/2Tz+BT6j3bSfG0DfiVsN3WN7mybrCZN9eUuePOoJiw66B/g7Jv9lFYmstRO+FuNTKgGao7e6eZAEmik1R+dwxdTKsnZtMNd3ImPFC4j+C/k6MoRBEbUf7Ygk4Sxd5tF63B2A5CNl3iMBl6Y+wtXMFWrLkFygi1NynI4zB++0T6tJI5n0BDCiSs/hyMf9ntOE5pg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 08:08:01.4512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d42f78-3dbe-432a-933f-08df2db8185d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfXyGlP1pwFVgTl
 Qd9edlqC5dffg+9PSsFE4aNlfisQWXxM7h75Q3cdmfW8UYvHjkG9PgxuhbFbEKLDq8ucbicIl0g
 dZMV1zQvtGXCYfD9vJiSRkVBNPpeHfs2s/liwd4QQlGSbcRGT+TjTDr1muV6e8YNPIs3eOfekwH
 Sw8i0VDxu7skQXLDdu+/k6xwDb6ypAmpNnLV2b0UomdSCJf/aZ6IQQkBJG7YEq5hgSTQuEnrYg3
 EYgE79FGLNDHConjQpO+EoR6lZr4kt0ibAZ5wdqH17MYwTo2racg3e0srhIjF8S0mhrEw61zIhM
 sF1OTYYtSBKz/QrTn4BEHmJzHpOicbp2LA1sCqL5biwhz2ZueRVl88zDSV9PAY8RtJ05jXVZjXo
 +LCwaV5NxprqaRwoSvFoBsBnqgrhRXjukRpRSMdpLt0EMAQLcnIZ5Gmqu0mWC/UivUwI67Uv/Vp
 r2OY+4wGNem2KY4p2ow==
X-Proofpoint-ORIG-GUID: QG4BN4V89HqmFDnVffH_q-5E8hawwcya
X-Authority-Analysis: v=2.4 cv=afT0Dhot c=1 sm=1 tr=0 ts=6ad5cfe5 cx=c_pps
 a=+v7uXpzEFv5PX1YPhMLqHw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8
 a=cuEB9orMtnWyPlDtN_AA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: QG4BN4V89HqmFDnVffH_q-5E8hawwcya
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMiBTYWx0ZWRfXzB28kSa/H1mF
 ojFEC3p182r49lSGy5TtDu3PYzXdwpgpkAQP/jdY3mJP5moRHIcU9wkjwu2wmvKU3wg0hs+vAdx
 jtlOu1ApSC9e6LJJHUO2pbhj6P9HLMY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190032

TDA54's MCU domain exposes a shared scm_conf syscon region that other
peripherals, including chipid, access into rather than owning a
dedicated register window. Rather than a bare fallback entry in the
generic syscon compatible list, give it a dedicated binding
describing the region and the proxy/claim/lock arbitration scheme
that gates write access to a subset of its registers.

Some of the claimable registers are gate clock controls, so also
document the required "#clock-cells" property that lets the node be
referenced directly as a clock provider for those gates. The clock
specifier selects the ePWM time-base gate by instance number.

Signed-off-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../soc/ti/ti,tda54-mcu-scm-conf.yaml         | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
new file mode 100644
index 0000000000000..111cbb739b5f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/ti/ti,tda54-mcu-scm-conf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TDA54 SoC MCU Domain System Control Module Configuration registers
+
+maintainers:
+  - Aniket Limaye <a-limaye@ti.com>
+  - Moteen Shah <m-shah@ti.com>
+
+description: |
+  The TDA54 SoC's MCU domain exposes a System Control Module configuration
+  register region (scm_conf) containing miscellaneous control and status
+  registers for MCU domain peripherals, including the JTAGID/device
+  identification registers, boot configuration and status registers, and
+  device feature registers.
+
+  A subset of these registers is write-protected by a proxy/claim scheme:
+  each register is mirrored across 8 proxy regions, and a host must unlock
+  via LOCK_KICK. Any proxy other than proxy-0 must also claim a register
+  through its CLAIM register before writing through that proxy. Proxy-0 is
+  the default access proxy: its claim bits are tied low, so it needs no
+  claim and can write any register that is not claimed by another proxy.
+  For example: Proxy0's CLAIM0 register sits at offset 0x3100, while the
+  same register mirrored at ProxyN sits at N * 0x4000 + 0x3100.
+
+  Each of the 8 proxy regions also has its own fault status and
+  interrupt registers, but a fault can only be handled through proxy-0.
+  Hence, interrupt/fault handling is not described by this binding.
+
+  Some of the claimable registers are gate clock controls (e.g. the
+  ehrpwm_tbclk gates). This node is the clock provider for those gates;
+  writes to them are still routed through the proxy claim scheme described
+  above.
+
+properties:
+  compatible:
+    const: ti,tda54-mcu-scm-conf
+
+  reg:
+    maxItems: 1
+
+  ti,proxy-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    description:
+      Proxy region (0-7) through which this node's clients access
+      claimable registers and their fault status registers.
+
+  "#clock-cells":
+    const: 1
+    description:
+      The cell selects the ePWM time-base clock gate. Values 0 to 12 select
+      ehrpwm_tbclk0 to ehrpwm_tbclk12, i.e. the gate for ePWM instance N is
+      specifier N.
+
+required:
+  - compatible
+  - reg
+  - ti,proxy-id
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+
+  - |
+    scm_conf1: syscon@5e800000 {
+        compatible = "ti,tda54-mcu-scm-conf";
+        reg = <0x5e800000 0x20000>;
+        ti,proxy-id = <0>;
+        #clock-cells = <1>;
+    };
+
+...
-- 
2.34.1

