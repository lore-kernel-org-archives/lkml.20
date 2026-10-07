Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63D9396D1C;
	Wed,  7 Oct 2026 10:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367712; cv=fail; b=NSIVJl2jHF8efGp3F3QA1lawMzL026m0FH6yAbH5Jf32TKNDgyeID5s6vbIJzwmxNhiDGSD2KU+Ri2fd2fnqmO0YYgH4EmbnuqyWJ9QVGSOazzVJVqMIwnI/d88uwi4UOqiO6uFnX/vkkeP+IsFUmC+a7RX+89v9Of/gYxp+Pug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367712; c=relaxed/simple;
	bh=kC+4pLE0Kl3XK8MsaMYkiZdtpjdX7UtGO4a4Dzvg3K0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ro8UkhDntiaCqa9MRQQk5cesJlt48vfWa9ecwZnx7aCqtgD8EYhKuppmmr3Xas0digMG8/+OTFqB9PjatALy4rvERAkbCHiPg2dxh95VttFlUnCS86Ib9Qlya/bpenydugbdyx4amhc31fp01U9iSilDrqZg+5cU7vOxKcgDle8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=lwDAkWu8; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Zof9P5b9; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="lwDAkWu8";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Zof9P5b9"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k3HM753292;
	Wed, 7 Oct 2026 05:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8T1ClgVl/HWi8VJCZKi025obesp5Y2xrkqjAQ0Iei
	e4=; b=lwDAkWu8S4z3I8VACx3PO4tC1Ronl6wQ/RCcYT3HjsfWUj7M2y/hAB7uS
	lARbptyNEClnhZqczxbH2bx+QxL4R5VGv0gt2u6PLPVwMMOUJQBSsBJo9QtnyVEp
	ruSx0GJvHOWfNfU7v8E1o7ox0Xl2cdVQtmIaKEUNYZwh3871OlvKhWZ9xQMvLOYu
	bzndbAk3s+jkrM3+qv2kNGN/xHkZqIiPlDvEQ+VuKg0JRJUaIFH9YXEqzm0SmVMs
	4kbn79Xz/ctSOMXl3ZSATLSwBngTLdg/4/1SszFuXNj3vkHC0uYpdV5OJXo4/NPj
	HDUyo9rq9XhAuB/Bm0xNa+Zf2ZUJA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010036.outbound.protection.outlook.com [52.101.85.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw78md8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:08:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQ/8vIKK9Y+YgTfmuS7y0BizXn6DInFhW490prbgfFvsTmW5HL2ocH6kDWZdjOiEk/bFPGaGtF6GB/z9Xn+v5nMqDzIK6N2WtSCsdVlr/szgwkOpfRGfh9+D3jOhGBeVXbVM4oKGdPLe5In9GCModq356RP/7dvYm4ypV28EK9rqkUm5v2U5my4YMaoB7IeqSrdn17LBtC71pgQUCfQGivjkWTOHXMRDXM6lBUN/I8VVGtN/1g0/9SunvRRK1Lvr4251AM2JlPgYpkdvFxkbiiHWgjkh/OYPoqSp2qK+zhtiu1SYMlq0cGweq9S4Tiv3PP2U0mG6HbE1lpI84h9gTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T1ClgVl/HWi8VJCZKi025obesp5Y2xrkqjAQ0Ieie4=;
 b=lHbmBKUuekrec7bsfHJYVbqTz5LRdk9PVNlg1tvVaUfkwEkSvp2K9HAA7ohCN1nUoItqZG2iT1Dn53RtbfaRefGpp3N4XFZvKgmgzk8YMacminXJPOB9Kgp2ERYxKXPdK5oArQvJdz0xKvymvRNnGeZ+8QCbiBI+rSQoZmBO8Ebwk05T0+7wJajB0cxPRanZ/oSv9+pAWszWNyo6hkzzzsVhb/Gbzxf8cbWBNkOUKb+ddhadlDqsoxhcXEt7PMOeJu2UXgCeGj3Ie1xsTivjeqRZlQgoALJElNfiC0HesrviVMvIZZ6GeFxxTM1I2FdArOR2JSZAw4OmNtMVKpKpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T1ClgVl/HWi8VJCZKi025obesp5Y2xrkqjAQ0Ieie4=;
 b=Zof9P5b9dCeMPzrzh0e8ytgmnowPwofxAn8JRKw+nb3wTCuneGoXkx83toms90kCrBaizE6GdU2hQ8oz8J41o1Z41k4qygFTgnWDIY2DM63jRDN8sGNLpa2epxpIh5hyfS4pnYrnwTgj5n5LMAymAcx0/A3SwB/RNColS2iR1dQ=
Received: from BN9PR03CA0551.namprd03.prod.outlook.com (2603:10b6:408:138::16)
 by IA4PR10MB8495.namprd10.prod.outlook.com (2603:10b6:208:55d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Wed, 7 Oct
 2026 10:08:01 +0000
Received: from BN3PEPF00022BD0.namprd03.prod.outlook.com
 (2603:10b6:408:138:cafe::a1) by BN9PR03CA0551.outlook.office365.com
 (2603:10b6:408:138::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:08:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BD0.mail.protection.outlook.com (10.167.248.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:08:00 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:07:21 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:07:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:07:21 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697A77rK4171897;
	Wed, 7 Oct 2026 05:07:17 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <sebin.francis@ti.com>, <praneeth@ti.com>,
        <u-kumar1@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <s-jain1@ti.com>
Subject: [PATCH v6 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
Date: Wed, 7 Oct 2026 15:37:07 +0530
Message-ID: <20261007100707.1065564-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007100707.1065564-1-s-jain1@ti.com>
References: <20261007100707.1065564-1-s-jain1@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD0:EE_|IA4PR10MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fdaa709-eb09-42ab-8691-08df245ade15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|18002099003|22082099003|56012099006|10067099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	lbz2dIj9NmbkGvUTGviquiyR7Xl1+qqrIgGgR5BB5Ce0WhJcZ+Q3pbM9QcxSbDbv4EshLBOz85XsIiSDOxjsmJ0BjvtIReSv8MvdsAo+lie1D7Zz3CI9rFokGiWRaYnJoSeTTpitX30XwtI3Kk95JzHf/eptn9tYJHfUSogOsq49x8ynRx9PZN6WkLSI1pGb7cpFAWHZKr0xZpVF4iK/fVchM1ZJzPmgEhiWz8tp4HK7pOLLHnRVq5/s4pDgrBKGqAcdhjtkAgGOigxkEspVbKu23M8yIy6SDg/ezqfZ6uRqasl0+o24wwSO1y/3lQd/bW2L593W4r26r+q/Paqf9hD029NsojMsBmURQ1iR+5u0xZbXML90c5vZNQ8EwMW0EoOwL0zugY+nqYfiP9rMR9Su15EyS/Ax0YAHCzvJnDJCrtw0mkaDfIlPNqaolU7WaoLZE1fdJ+LcJDgoVoRMcm78FCHjwxDnaDJEMqp792zR7Wc7vhXsrzpsaYlY3IKxSmJgPj1YyzCj7lgiy08eve0+o4/PNs7aJnjXqRU5QcRlGKzOH3JXLGJ+gnDZIoX/yVv+NHVtkjLlbb8A6XbAW8WntZSS6c5m0cfluzLaFpnkwEvnvJzi9f+FOWasYcDHo/4cMm409QYrD51X7+pVtds/VLt1orFZtI5dgRLP4GI9lStmq31HrfLgfiQRcp6w7UPqfDztPpZogicPjMt/ww==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099006)(10067099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Te9CBcJkJg7YkDx1zawwdlx248am4cqfZt6SKmnEVenVp6/VKnUtaEEVfZfd3zKh6Rus2xtuQF6KSY5WJJGYhoMH/RpgZmVlwyV7A7IkqKcNb6vYpZmTguzjIAIeukGBo7GkDpGvHgMJ+tGYWlddcsA/nwdGZOl5Kn2ptzYobNQm5CJztJiptlyRCeaehcfwM4y09XRpvM2839mB44HjJQ5mPI0E5DEf/wTKI8oJybZRayirglQEYP5b5dA/4xHiTHDM8KW++gR91Bdok7MPfrw/fpawp0uwZ3kGX60tmQVSsEOvfw466HYWFjxev2xthftqWLpGjy3Gy9BbkCVAMZmUhlilFKQn/JEK1BxWtjvvHMGPdbfpJHlMloiWHmiSd+38bQl0KkBkPWbKlUeE4gU2Gojh1kSJIcsyi9JPDc/XWP8hGrEODq+lZz2UWXPs
X-Exchange-RoutingPolicyChecked:
	oP+TpL2EU4RbLZzrUo9DVwRSOBMHppltso3mI0ntC0FVK93zobV23SDA12hMH6bRNjIdxZRl5mjHtVoIAruE5gQXfK4J9nBpIcfTyIFpZK3hNmFJCo1FeRgevbZqh0/cIEoRqtWEum858SN1f4YvPXWo1YSqT2YtuNUlQOyM6cf/TuVcUrrkVVqrwov3G0X73NpswduaKVVRPH4MmCzpG9HHjqs8sz5TgTe+DAku0/39hrI/6lK0XM8Tee06ZdbchWHkehXuNgKlO958dhIC9ngaImv6oQfwxOHPo/BHjZtddhI6qE/GZ9TiT/RqdKSv2YCV+6lNNP1i6sdOyDc5Hg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:08:00.0315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdaa709-eb09-42ab-8691-08df245ade15
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8495
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac61a06 cx=c_pps
 a=Pnh5LeqhM4XIZ/aCP1A8uQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8 a=WcmwVEcwf4aBJvEe8xcA:9
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfXyKPqPBDrxszu
 CgQxTGQ4ukgiRhvWbxCEmiXd/BI+3eU6ZKNKTYmsgzVUEHnayu4tbhBFEj3D+ySvZl9Hgn74VUj
 PK8ylyc0kV//1D/avXmHcBfCP+tKngg=
X-Proofpoint-ORIG-GUID: yW2riREZ01UCFHxvKOVpRJSPFraaDZPf
X-Proofpoint-GUID: yW2riREZ01UCFHxvKOVpRJSPFraaDZPf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX2I5dO0JzAA6G
 0A8mPGCPO/hTy/W0VmLXooH+MqG63CWeHCUh9BqRDmVIqx4OUgqC+8vj3MOe0E7O5KduqoOieEL
 33I+pV0fM7+sloq1JMZ+LKp0mKZ3bBt6nAhdi8fiAs0DBJO4rEvj+9l1v/BNU8QyaIgOfGauBJ4
 ZOUem6dwwmvOl/3fWrdvvZfen18a+YqnpoH4/mKFzcIjkLhrWTN3gHlBL9yLHvW3oc5izswmSqV
 fGfnk3b6/CFv0DUZ6CGwK03fxkxJriC0vXczRkSKKwNmR812OowDW5rQBjL9CsPLDbmBYE2JSXm
 ZQAeKk0XG50arK6/rM22KEyrYjFEsZQ3T0L3D5Q//XZ+Es2GU56EidaGMuPvSqxqaDiftqzGYNR
 G6sp2YxHBx15oLTI4ebrjzVv1Bw7W9GFTXqFPlx5Hg9foY6z17rCGuNCnV+GkFo7UgDP3ToCf/D
 oiegUMfjnLsPbtWTH2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070040

From: Devarsh Thakkar <devarsht@ti.com>

Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
and hook up its DPI output port to the SII9022 bridge input, and the
bridge output to the HDMI connector.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 97 ++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 964387eb5178..3cda48c3a918 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -44,6 +44,19 @@ usr: button-usr {
 		};
 	};
 
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+				bootph-all;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -192,6 +205,37 @@ exp2: gpio@23 {
 		bootph-all;
 	};
 
+	sii9022: bridge-hdmi@3b {
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+		interrupt-parent = <&exp1>;
+		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
+		#sound-dai-cells = <0>;
+		sil,i2s-data-lanes = < 0 >;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+					bootph-all;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+					bootph-all;
+				};
+			};
+		};
+	};
 };
 
 &i2c2 {
@@ -221,6 +265,41 @@ usb_con_hs: endpoint {
 };
 
 &pmx0 {
+	dpi_pins_default: dpi-default-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 1) /* (L20) GPMC0_CSn0.VOUT0_VSYNC */
+			AM62LX_IOPAD(0x00dc, PIN_OUTPUT, 1) /* (N21) GPMC0_WPn.VOUT0_HSYNC */
+			AM62LX_IOPAD(0x00e8, PIN_OUTPUT, 1) /* (L19) GPMC0_CSn1.VOUT0_PCLK */
+			AM62LX_IOPAD(0x00e0, PIN_OUTPUT, 1) /* (M21) GPMC0_DIR.VOUT0_DE */
+			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 1) /* (L22) GPMC0_AD0.VOUT0_DATA0 */
+			AM62LX_IOPAD(0x007c, PIN_OUTPUT, 1) /* (L23) GPMC0_AD1.VOUT0_DATA1 */
+			AM62LX_IOPAD(0x0080, PIN_OUTPUT, 1) /* (K22) GPMC0_AD2.VOUT0_DATA2 */
+			AM62LX_IOPAD(0x0084, PIN_OUTPUT, 1) /* (J23) GPMC0_AD3.VOUT0_DATA3 */
+			AM62LX_IOPAD(0x0088, PIN_OUTPUT, 1) /* (K23) GPMC0_AD4.VOUT0_DATA4 */
+			AM62LX_IOPAD(0x008c, PIN_OUTPUT, 1) /* (H22) GPMC0_AD5.VOUT0_DATA5 */
+			AM62LX_IOPAD(0x0090, PIN_OUTPUT, 1) /* (H23) GPMC0_AD6.VOUT0_DATA6 */
+			AM62LX_IOPAD(0x0094, PIN_OUTPUT, 1) /* (J22) GPMC0_AD7.VOUT0_DATA7 */
+			AM62LX_IOPAD(0x0098, PIN_OUTPUT, 1) /* (H19) GPMC0_AD8.VOUT0_DATA8 */
+			AM62LX_IOPAD(0x009c, PIN_OUTPUT, 1) /* (H20) GPMC0_AD9.VOUT0_DATA9 */
+			AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (H21) GPMC0_AD10.VOUT0_DATA10 */
+			AM62LX_IOPAD(0x00a4, PIN_OUTPUT, 1) /* (H18) GPMC0_AD11.VOUT0_DATA11 */
+			AM62LX_IOPAD(0x00a8, PIN_OUTPUT, 1) /* (G23) GPMC0_AD12.VOUT0_DATA12 */
+			AM62LX_IOPAD(0x00ac, PIN_OUTPUT, 1) /* (G22) GPMC0_AD13.VOUT0_DATA13 */
+			AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 1) /* (F22) GPMC0_AD14.VOUT0_DATA14 */
+			AM62LX_IOPAD(0x00b4, PIN_OUTPUT, 1) /* (F23) GPMC0_AD15.VOUT0_DATA15 */
+			AM62LX_IOPAD(0x00b8, PIN_OUTPUT, 1) /* (L21) GPMC0_CLK.VOUT0_DATA16 */
+			AM62LX_IOPAD(0x00c0, PIN_OUTPUT, 1) /* (N19) GPMC0_ADVn_ALE.VOUT0_DATA17 */
+			AM62LX_IOPAD(0x00c4, PIN_OUTPUT, 1) /* (N20) GPMC0_OEn_REn.VOUT0_DATA18 */
+			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 1) /* (M19) GPMC0_WEn.VOUT0_DATA19 */
+			AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 1) /* (P23) GPMC0_BE0n_CLE.VOUT0_DATA20 */
+			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 1) /* (P22) GPMC0_BE1n.VOUT0_DATA21 */
+			AM62LX_IOPAD(0x00d4, PIN_OUTPUT, 1) /* (N23) GPMC0_WAIT0.VOUT0_DATA22 */
+			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 1) /* (N22) GPMC0_WAIT1.VOUT0_DATA23 */
+			AM62LX_IOPAD(0x00ec, PIN_INPUT,  5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLKIN */
+		>;
+		bootph-all;
+	};
+
 	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
 		pinctrl-single,pins = <
 			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
@@ -321,6 +400,24 @@ AM62LX_IOPAD(0x0004, PIN_OUTPUT, 0) /* (AA23) WKUP_UART0_TXD */
 	};
 };
 
+&dss {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&dpi_pins_default>;
+};
+
+&dss_ports {
+	/* VP1: DPI Output */
+	port@0 {
+		reg = <0>;
+
+		dpi_out: endpoint {
+			remote-endpoint = <&sii9022_in>;
+			bootph-all;
+		};
+	};
+};
+
 &sdhci0 {
 	/* eMMC */
 	pinctrl-names = "default";
