Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308EC3CFF56;
	Wed,  9 Sep 2026 21:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990530; cv=fail; b=bcO0c2eUcsktxf9gI65m9MZt0Znd8KPcPKEkpHxuzr321t8iA46MqItkhcHWQms1+0KDwLy9Jburkfhr8hjzOSBME/ynRqq5WlnXjgCMnIKU4LkQhw2zuksQwu9mihjVOWR5tmzD+04+iGGbwhdUgWyeJuLlSE2xDq+wkTU9xdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990530; c=relaxed/simple;
	bh=PeqtEYTsXNwBHFw2xWwsxrQ5qwcomGYxGApFhx+Y0II=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J19luwN7ajyw9mijHqAJe1TVLNZ+1+KCG8i8nMIJ4UkU1yrCUWKwhtAi08caTsXShGhOgDTw8r3BkaTFUkCJJ7PMIcvP0SD3esdTPyiGM6rb2mTAMfl6aQLTuVyO+i6v3xECY2Nb/WveDNaCSq4/ND/Kx7R/NnDm4gPyH7+yinU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=RL1l3KMl; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bldNhtcX; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="RL1l3KMl";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bldNhtcX"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JGGeh1099762;
	Wed, 9 Sep 2026 16:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7fJyC/HgCbHdmNiR+RjzPwelJ6bUq1ihVyoIc5VhY
	Bw=; b=RL1l3KMlGldL6y43v4rvzfxiPvrpqpJlGvwntXLigLFgk9MTKmlkW8kDz
	qD6X+YUbB5MU69uNCst+5bAjoBLkYRmLRG02KMyJFIf0weYDhsC/uYx+pzVqJuez
	mPGmOsD96ArrycAhFvUmGWDdoTCghVS/hSuQe+tSqlChFasoqBqynOjZTPXoPswZ
	th78d6nEqY/wSw/1Dk2ocoqY8QTI0gaLMN17ExRABfkVMehSbm0ecHRGikkxqRAj
	k2vnCunxMw2cI4siFoe2RiiXjzxHTHPsPaogE98mzc2JYEkaLVULWyo+bVcNr2RC
	wooy2QGevzDaJii7rWrau1JfaJFLw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011021.outbound.protection.outlook.com [40.93.194.21])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxfs2sn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzH8Mtz3quJLSdaWCbypHVLboDGV6gzzV9YDyguHDlfY+IAyRcP9pA83Xd86HrvCWUVfUmZbzqQyvww9OiWNkJ20udHlob0tMLHeMegp2XLFBuFykWg/9WdxuE5VNdcaKtjYHYxHfg4B6SUJWtqPe0hV18DJYU/MQv7PpV+NNe58WZRkQx074Ew2fH71jD8nxZWmyILEoFXtJKfj337Kh3M14TFCcXQdDERG5knzIj/zDKyUWQaPdFJSolhQ5o/5O/jl5ELj+lVWo2R5JIORzOgq4xphWxa3OlIXBpg2nw80keX0rzwrcT9PRjg94R9s4eE8EW8kzKpL0lsGCbw/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fJyC/HgCbHdmNiR+RjzPwelJ6bUq1ihVyoIc5VhYBw=;
 b=mSEuIs+j1yGdYzVvLhBLulZp8iEmY78nZuXH/ZF++tXkLXrK/GFSzr2x9j8QZIL0NfYnLW4+oEO3ojs8U2JyUpbQZPFSwBQShjUfHUelWNaASoN0QW8wqWjaQP9+yODB4GmEgjmVeaE3ZbGRN5us5wlVGgegdsngmYjp/uCGgnBy+RuGU8mW1pQ9cIx2PT/ihViVtvvgyDzapYL1gen7zO5N7DPHXQRKi1Js72jzuABgJW57Yd8Hz0j4xdHt1+RAOc6XmO6Vbbi/cUTTCKSxiozRuht/Og3KGwHCqmrDQxl4qCmd8RkkzVfID3xyjvDAA6otyZPIJo6Tox+IXfOnoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fJyC/HgCbHdmNiR+RjzPwelJ6bUq1ihVyoIc5VhYBw=;
 b=bldNhtcXwiQz0TadUEHYKO5E/28QCb9gXt/8EIgjNwPbx73w4lRal64FJMbttalUyFWqiGBSFO/IgUbRhXUOiNn+RwWJqxOF7fJ91IVlzhPsVU6QFy96fB7Cozt2nCbsc8tHoAVTXVXzkopNelBxB32Jni11ZZnuADfeKEHBMRU=
Received: from BN0PR04CA0175.namprd04.prod.outlook.com (2603:10b6:408:eb::30)
 by DM4PR10MB6085.namprd10.prod.outlook.com (2603:10b6:8:bd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Wed, 9 Sep 2026 21:48:06 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::77) by BN0PR04CA0175.outlook.office365.com
 (2603:10b6:408:eb::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Wed, 9
 Sep 2026 21:48:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Wed, 9 Sep 2026 21:48:05 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:45 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0P1072162;
	Wed, 9 Sep 2026 16:47:45 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: [PATCH v4 12/15] arm64: dts: ti: k3-am625-tqma62xx: Set MMC clock pins as OUTPUT
Date: Wed, 9 Sep 2026 16:47:40 -0500
Message-ID: <20260909214743.899477-13-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|DM4PR10MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: cf72d86d-6d18-4cba-24dd-08df0ebc0800
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|3023799007|56012099006|10067099003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4z8y5WiMZBO1ok1XOUO6GgKb+kR9zDgKoc3QaPbpyGLfURqYOQSceW+lmLVjBF+KL9dah0zdE/nWXe7fQwf3vN3BrkE8JChvf3qVyRlBmECss7YmO6ZnnAdPYpLAivjslWJswklWEc0hta310k+iN43ovfi1pzHUCTGonFeOU1qWoVPqeZ5zAyELzMsPzAPz+BNUW2ciKj3axa5N1NlnzZxM7Vh7dPotJFfjPbOG/+apEJuyyD1AOKzR14g51+jOazMbJYPMDwbAfi8c5lvtLuMDS38Mx61LIBcxdmDerCXR0t8XT5li69ug7usSsB7gJY2tiE47PgEHWtPuDQ8o7euyX7Nd6Qn/nsqlO33ToMTsZic0L/ux4asltU4C0QeGhwkyeTyooFueUklC9KpZqahkep0stOcPGb9VlOXa52fcLigI5ZcF81a4i955JNGb5GwZJ/VmzfBY4xrORYjowqZMDjK7YXro8k4bhsRxo5ULqQW7bYdUPb/kqdVbOTVRqRDc4cUYDa+TVgh2H1SenZuNxXwPed9Q0haQ+r/LX+eiugyLPFBZhSjXfdnZZ3S/FhcMZpDdxizGmi9IcQOE+nKuSGUO/Twh2pFdzDwvBKlu4HM8X3gJfePxZNUo+0vHM8T71UvEGXr9B2wMIgZZ4tVjDloH7UEQUmTuGhHGIUI=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(3023799007)(56012099006)(10067099003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YWnsUeLxuK928nb5sWhT3b8tRCqhqgtPk7P8rb9dyYH3emnzhT/VizdbHcpQfDqIDDJpVQzjVP0bPahLL2DxH6siq76gCZ5JKHeYBRdX+yk4EwOpz4UEiA5kzoPGkRvQzI5ssz/o81Tz3gn+3vRpjnJT1tqPCGP8d5Tzlssu/v4Bl9getIZb8+FFCj0d8fAWOZ53QDtqank8LDJzTMGvaZn35Na/Q4EctAd8Wgxk5fDDytRPMYfcUM6QC4guSwuvsi/p4CNCJh/YyKwKodN9dhF9bnuqEyGzhxJFsAaG6+OpogJpG1qG200hZmcI12p8uafHW72sVUUEyyyRKs+W6ypc8Vg0AwRdyVQgSsUmGxA3X68wStFZdRdQhuj9UFP84j65Anm71xZGzUuY40DlXNEjefClG2nPyF2n8NH/EUfecXGu5o8GeFGJ4cYaPeEl
X-Exchange-RoutingPolicyChecked:
	mhtE748zKacHWwz7I/0FQ534pGGPwMFcgRn+DmpEHPJ3AE4z+qQJUllOggvH5d3px5bzCR67ZZ/J7LTrdfJoelxAITmoo1JDbFEgH8smLPI4zACAw0vieZM1an0R/PG1AHi9R5rUkpd/icWOJMgtX2rKUO+IYxPMLVUU+pmP2po+D8hY0Q+0cUpuJ2vxRxdDgT24bHkDnVnL3rxUa/fOnURgo2ya4kRBzzsNZJ8CeByJZCs6F/DhrjajxGy7fKAyWGB//AvZKz5MRz1dX+YrJdq19fgxIEGhUkoQNuZmsD4R+YX8TiTb+SN1qBiiLLzkjGCgiNm0teEEj1PFgEhFng==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:05.9618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf72d86d-6d18-4cba-24dd-08df0ebc0800
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6085
X-Proofpoint-ORIG-GUID: Cf278rG4Xq3xp_wNrq0MPmr6puWR8ugJ
X-Authority-Analysis: v=2.4 cv=SoAFe/O0 c=1 sm=1 tr=0 ts=6aa1d418 cx=c_pps
 a=2plZotBPgSoI6Rnih3N6KA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=zCnASpMi235LAPRNvxcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX0e2mk9X9vfqB
 axp4lZx4MqH6NZjb6H8nmTokL5UeYp2LQXEyhJSr3/AISK0Z/CeS60cO2Ft5b3prHvpLxkxaTDp
 gY9yZlKuYBh3gSReCjXvN3Zy7mXO4g3aQTQO6thL33JVK2SMJiQLNsccVxd/eTW3kLUqW0HxUgy
 n3gHx/ZWNRKIaTVKaO2TeNO93CMLfUi+US2anYjnuYUSE9Vw+BGtgk/6FyjeRTgz3L8jeDGTjdm
 S4y31VyA7sViZrkH0HS9hxo1BsQ4U7mnTGSzDzAxTaAF+5P2gpQMe/UtJhZi80Vo3ZH8YrUBZ2v
 VzzdG+BhqEaTIJ0YXbs2iBcBzqCBseQwIEVXTfDftGBw4GBSUXDhuy2ShYKWgY6gM3biozy0c/4
 Ks5G6BT0dILlQmWJYd7tlgjnPmc8udB33kSeVGVDqQWH5kj7ZzSOLkx0UqhLudgV8sxd2z9brV0
 t91fUVf9HgEBa5nzowQ==
X-Proofpoint-GUID: Cf278rG4Xq3xp_wNrq0MPmr6puWR8ugJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX+LPG7XvACvqR
 MZFekECUUxAKuRgmBO1zdbUOWzSCrognJD6goN0xPJ2WI7IV5kx4/fsM3TvyTDuvxQnkFBc/Qt+
 tGNrA0fZ5wASdFhTHicf27rDhhALhUQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Fixes: 5b36d8c72c91 ("arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board Device Trees")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 4 ++--
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts b/arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
index efc00d2a860a7..3859512c42628 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
@@ -735,7 +735,7 @@ main_mmc1_pins: main-mmc1-pins {
 			/* (A21) MMC1_CMD */
 			AM62X_IOPAD(0x23c, PIN_INPUT, 0)
 			/* (B22) MMC1_CLK */
-			AM62X_IOPAD(0x234, PIN_INPUT, 0)
+			AM62X_IOPAD(0x234, PIN_OUTPUT, 0)
 			/* (A22) MMC1_DAT0 */
 			AM62X_IOPAD(0x230, PIN_INPUT, 0)
 			/* (B21) MMC1_DAT1 */
@@ -755,7 +755,7 @@ main_mmc2_pins: main-mmc2-pins {
 			/* (C24) MMC2_CMD */
 			AM62X_IOPAD(0x120, PIN_INPUT, 0)
 			/* (D25) MMC2_CLK */
-			AM62X_IOPAD(0x118, PIN_INPUT, 0)
+			AM62X_IOPAD(0x118, PIN_OUTPUT, 0)
 			/* (B24) MMC2_DAT0 */
 			AM62X_IOPAD(0x114, PIN_INPUT, 0)
 			/* (C25) MMC2_DAT1 */
diff --git a/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi b/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
index 72288678cd01f..a200a2afe16fa 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
@@ -299,7 +299,7 @@ main_mmc0_pins: main-mmc0-pins {
 			/* (Y3) MMC0_CMD */
 			AM62X_IOPAD(0x220, PIN_INPUT, 0)
 			/* (AB1) MMC0_CLK */
-			AM62X_IOPAD(0x218, PIN_INPUT, 0)
+			AM62X_IOPAD(0x218, PIN_OUTPUT, 0)
 			/* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0)
 			/* (AA1) MMC0_DAT1 */
-- 
2.34.1

