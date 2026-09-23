Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C255E47DD50;
	Wed, 23 Sep 2026 09:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156272; cv=fail; b=ZBREeT5WtWoR4PDtB5vomDHGQtNubfXwW0Sj5sxz+n8k8j5WEYFy8zhFzP7J2apSCFXgajZsHuAHoCwU6I3hQj2L5pjOzgEqGd8b8nTNXS+LNP09VJ0ewBk/Rt9ETFdVh0J516Ua9WySAy7qnMVTuM+z1jOFNXStKruvCD87+ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156272; c=relaxed/simple;
	bh=ONtM7gQtTnp6oZiHE9iueUlVjbh/dl5yhnC42NXbiD4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJzJd0VJUXRKZZd9djMGMpQBvfxywcBskP+IjFMTo3n46g7ubrB3XNfYuEFormRm/x3SgWEBSgsLFFUp5fhEUfPOtmnc2uHSoRhHECgnXCC4wSwosItjwMVZjYu0IUoEG+gS4aTAADY6oX6fSoc4f4WvDp+bja6s/OwRF9/hgho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kBycuTSH; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KPrvim95; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kBycuTSH";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KPrvim95"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8J98p299789;
	Wed, 23 Sep 2026 04:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KZejlpT1iTHcM7Y0p78xZSmQziylNIvIayj2zaG29
	LQ=; b=kBycuTSHI4i8J4zhe+HeM23HuISZd5oaNryh8gywvgkj7telkCU+heURz
	viR5ZOmNsNd5qDLUFzl56/8xNtqCvjSSbchcmB1dcf6FSZgKnoPLcHeY5gG/++gb
	kQXcY1xfVb5JK4PA9mUX0aIduwuBsLa7EcAWMgLXsf/zvegHB8z7PfTvtiLh0p3L
	WgHd2ueWizrkBtcyu0QdkCLuy/EETihHAt93WZEp/qMg+oSYZw8+Yrsr9VWyMjPY
	GclmWLfbQfRm+EaB4g7R8+TxTuYHcl+yIVlVuQPYxa5cIz5ACxw4OxJpz5KdxmNE
	oTQxu3wfJyjkOci5N1qt55E9YqrcQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013033.outbound.protection.outlook.com [40.93.201.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tjcpg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:37:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqRNoVkIWEpGD9ZOF2Xz/NT46h7qyIV9tZSJs/al83Iog7BI2K5xB/OCQG/2Ga0RolJv8C7w41+MCXzl8UykkacwLCRqG8YvdZLBEbc3sy5rebPVI2Px0rpjDBEBTqB+kR5Nlz1HN2Lk2B/G4DJzNIJa52vn6e59JYyD3+xBISoJb0emPCFw5BNF5iFA9zhzXsNlwgYmQqzZHEsGbyctCmtUjib15juQtPfzE5JeSACfWD+T47SuAt6iCLDNaiJLGtuvQZpCOq8bHZTZIKzmvl0zV+7dLBHrbF4oia3JmSY2fh9bZCAcE3QS3akPdUCcbd+IMGyjQGYUU3kBMwVAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZejlpT1iTHcM7Y0p78xZSmQziylNIvIayj2zaG29LQ=;
 b=PGrXu4xAqady6DfRKd5+MiBuVOt+HGWekRQipGF6rPXDgFz/muEZyzXq96ivLhz3Em8INkuucJghZOLikhbMFOIqO4SMM4MvbhyN/chVPjAEig69uDAKIfV1xjt2LBi1gJUHCnu0EM9+TWnrj3MGnIIHB9m/+BDlORXEgdTuAP1LxOusY5swPuNji0qwSmlQUU6Qn4NaC+BtBPFYmPmScVHvRdI8HLHsM+LKKiwGrcIom91gdpPFBQFc5jMk3J0/byU5Tc/nyIHDfkKbmj5Zq0rO/nMeeE1wYmZEL95wuF4iBBTjBTCeLcrHu9aZHg/DhR9XAz8SIO9I2HmHMQmDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZejlpT1iTHcM7Y0p78xZSmQziylNIvIayj2zaG29LQ=;
 b=KPrvim95rFKRxujjOU4uZZ8RBxa9jM5FtX6pe2BJmmeczMnhQWDO3GkutirQGmB9iQl17efjF+efFNa6ICGCRnMfJvIIPRxdwHdSIvKQ/1sULstEWBjUacPY/M43n59xRoNNSbGOuCsblcOV6ATKBa61Yf4FSPKHfp5rtIu3J/A=
Received: from BN9PR03CA0426.namprd03.prod.outlook.com (2603:10b6:408:113::11)
 by IA1PR10MB6709.namprd10.prod.outlook.com (2603:10b6:208:41a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 09:37:23 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::62) by BN9PR03CA0426.outlook.office365.com
 (2603:10b6:408:113::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Wed,
 23 Sep 2026 09:37:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 09:37:23 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:37:10 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:37:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:37:09 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3Wd1760658;
	Wed, 23 Sep 2026 04:37:03 -0500
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
Subject: [PATCH v3 15/18] arm64: dts: ti: k3-j721s2: Add overlay for DS90UB954-Q1EVM
Date: Wed, 23 Sep 2026 15:04:56 +0530
Message-ID: <20260923093459.28125-16-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|IA1PR10MB6709:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c4c085-a6b4-4791-4b25-08df19564574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|13003099007|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S4V6Wbfm4+Dd68Wmrf9Jew7GdX6F+2w0eKMoY+8V+SiiJatH0nV13cdtqMhqEKZE9bkvmQFeBQ0oEvqVQ3CpWEwaZJ/CrNKb7OkvpQ+75GF+ROjWHCBViqLvxUzoj89LjU1QIQCy0/bfSHa1bMDw1f8UJZQO1RGaavpYxINxcpAPkKAX4nrrh4fB/024/N5CApKuPu5cZ54A3kTlgAjzjjb0/qHvMhDyhPSPmMnLk/2EuE4DrFwAqm+iMYmBw/OKic/BrBb81W2xAQRHl33Pop7w8Oo0zBO/ZEfLv+ZRxloBOdQfGe7mSE9vtupbTWtS8vGEdQfgtnXQhUZ9IWEaAkJTJvId2+FFFOn8hhBoIMmwBBZdyObgQ7Rvxb/wRLt/FK8qBywROZt32ConfksdK87R2eTEvC8j6DVnwx26QIqzqaDborZJbI5FnQXNu5/5K2IKPIvjYCG6kQ60VEVtLpZkVilTZKQF1TrrWUd3WzJ/n5rBZDp++PGY9cXPnbI2tJq6ElY9wwyu5NJAqpZVu97J8FVhcLxcYRle/GSf46C7fHsm0Xb1R77tY3Q98tkLBkZq7N9Fi+luGZnhiccXjtbdcFiJAOnIG7sTyD4ZwDwK/UHMrDWdtHmQlEc1PVHFN9C4c1sScqUa5fTZfSSgmg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(13003099007)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	02K059Cpv2stJ35ot0TlPzDZlJ6B6xwKY6HthbAreuHMOE705FGpUpuI8WDkypI7oY17cR7ppIezOpESWpf9trOn6dTDvNt8bd/NNnic85tzwe/Ec4q900WPwtuRaDldbDo6i8mBB40r7BoFahp4pEWTaIzkuuSbLnxlst0w3m6jUG5NDZt6wp+NKr2EbB/rnWVJfFIuvZU3QbQ4LVa1oP2wTtwOpavzewn30xIDViKww955E70gvcXiptM45JAZFAo9GfEEChcuAsDLbRjFRUSW/ZecZoE+MNyVOAOK/Krmsf/pet5yKi1Jlu2KOR34Hk5aYRnj2EI/xEbP3l3Ugop9W3pWwcy38UQOMKX7JZYdjQZcaE0D/uZ5g0M1sUzXDEjos5XiuG9xESe5nV1VhQMWc0YHtlVxtAOe6l+po9+QIrC7OVTrW3ZJzVVhB48w
X-Exchange-RoutingPolicyChecked:
	g5oCbBdhWduqv6iiZk8w3y5mpdfAjOlvc0zZ7DdPno0nhUkZKuXzeJCVv8deTwN5CjV//Vm0i5qXUbwurid/xTUK9pQNxHDOKfKKir3ENqVPaLaDhx4MWj+5i9TJ/lMrzGaxAyDIHCS6K43jxXuJerQX+H97UTbdK7LKEtFjMs94qQv2fj0qsEQC/YHIElOzTOKQg1LTgEgFgBpylGwbntUuNhht8hNP4nsr89EBWf385G4bDijDk6BcPMdBeu0bhYgLEC3AJyrSQi5mZe82KLU+dEZHgZgc3aJOyWaQAS767ZD97olWimdYr3v1yxl4s5xRtyDDUgxM9xH7wl7bsw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:37:23.1901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c4c085-a6b4-4791-4b25-08df19564574
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6709
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX1YUL6SXigtIy
 cqoIvcCCfTCnak1qAOrbPaE4VpbRSuyZ9HhxPCNADOjtCmDtKz2oof6PUeAeyyrACC2DwdkH2/2
 rO3EthsYuEEkOXXx4l/27TARUyMBQy4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX5UhZ3bozrVUz
 cawhuHUuxUlbZik4Ak1dDAZzoiwBT9kaXMno3P0U3SIPun3C262ar2RIALIfAvjwXWQaseI3CSE
 7FmNhZyKaLZzmPbWV2Y16+A9plADuz7ieIxjwRcg3RdA+bImal9NwONazPURHF5eII6E/XLEciL
 jSFOx7SgcRMpaR92ilygrDkgguU8av3EqenrThgwzfxi0Z+sNXvgritNedQSdDLZ5y6diR2GGm4
 FI9vqgoIMAyOLzRpPvvRqADT8xwHRT1SyxLUfTQkwgjjIzwqjcRBVyS20cv61zWw1P3L6ZUvfAp
 bAHY01R8NRMJNV03RXjb2PPg3mNxSdWbVgqRAo/4725LsD+leqq0voZpLp0Y4fkTG2X3hfJjDd9
 ZXkXW15vYo8kTNjdDoSWk0tXxYNKtGu43bwSeaGFmPCsuPFWctkEkyZtJykXpc3eg72yaHb7m4f
 gOfmVnd4mwJI1E5WInQ==
X-Proofpoint-ORIG-GUID: cr2pJRw2QlujtPOQASEv-OAko5SXpqoe
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab39dd6 cx=c_pps
 a=ZRTQSBiCf/ik28kxSsFIIQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=dddYAUS7GpBDi4dWB1gA:9
X-Proofpoint-GUID: cr2pJRw2QlujtPOQASEv-OAko5SXpqoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

DS90UB954-Q1EVM consists of a DS90UB954 deserializer which aggregates
data from up to 2x cameras over the FPDLink-III interface, and can be
used to connect FPDLink-III based sensors to TI EVMs.

Add an overlay to support it on J721S2-EVM. CSI2RX connectivity on
J784S4-EVM and J742S2-EVM is the same as that of J721S2-EVM, hence the
same overlay can be reused.

Link: https://www.ti.com/tool/DS90UB954-Q1EVM

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changes in v3:
- Rename fixed-clock node to the generic clock-<frequency> form
  (Krzysztof)
- Also rename fixed-clock label to lowercase
- Override CSI2RX port using &csi0_port0 label instead of the full
  &cdns_csi2rx0 node path, and drop duplicated properties (Krzysztof)
- Update copyright year to 2026 (Udit)

 arch/arm64/boot/dts/ti/Makefile               | 10 +++
 .../boot/dts/ti/k3-j721s2-evm-ub954.dtso      | 83 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 44ee01c7ff99..a66d11359bd4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -201,6 +201,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-ub954.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
 # Boards with J722s SoC
@@ -434,6 +435,8 @@ k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
+k3-j721s2-evm-ub954-dtbs := k3-j721s2-common-proc-board.dtb \
+	k3-j721s2-evm-ub954.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-usb0-type-a.dtbo
 k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
@@ -448,6 +451,8 @@ k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-v3link-fusion.dtbo
 k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
+k3-j742s2-evm-ub954-dtbs := k3-j742s2-evm.dtb \
+	k3-j721s2-evm-ub954.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-fpdlink-fusion-dtbs := k3-j784s4-evm.dtb \
@@ -458,6 +463,8 @@ k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtbo
+k3-j784s4-evm-ub954-dtbs := k3-j784s4-evm.dtb \
+	k3-j721s2-evm-ub954.dtbo
 k3-j784s4-evm-usb0-type-a-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
@@ -549,6 +556,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-sk-v3link-fusion.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
+	k3-j721s2-evm-ub954.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
@@ -556,11 +564,13 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-fpdlink-iv-fusion.dtb \
 	k3-j722s-evm-v3link-fusion.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
+	k3-j742s2-evm-ub954.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
 	k3-j784s4-evm-fpdlink-iv-fusion.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
+	k3-j784s4-evm-ub954.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso
new file mode 100644
index 000000000000..3c3eb16031ed
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for DS90UB954-Q1EVM FPDLink-III deserializer board on J721S2, J784S4 and J742S2 EVM
+ * https://www.ti.com/tool/DS90UB954-Q1EVM
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk_fusion_25mhz: clock-25000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&main_i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	deser@3d {
+		compatible = "ti,ds90ub954-q1";
+		reg = <0x3d>;
+		clock-names = "refclk";
+		clocks = <&clk_fusion_25mhz>;
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@2 {
+				reg = <2>;
+				ds90ub960_0_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2_phy0: endpoint {
+		remote-endpoint = <&ds90ub960_0_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
-- 
2.34.1

