Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CB043F08F;
	Wed, 23 Sep 2026 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156180; cv=fail; b=nfrf3+OBLxLm/EQfx3J+JkL6E8U7qrs3UJfopDcUvqmUy7i25mAQHTbzYY63wTi9tGIZw2jk/L27pRbkOmS3lBVWQnCOBV1H8lnV+PN+lIWX2Wg2Cj21JJ+8SQ1dzY8Xf0kYapIpchH02sNF6bHfa/dTKnepuxvJOMXrWw/gsvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156180; c=relaxed/simple;
	bh=6hy3PqYLkq6gKCufPPoJJeksLfn5i0z9Lhn71nLgZNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FpzyYizpzJEAcFW+6td9WFLVbINmmRojQi3oImGzaCuAjynuj8jD0megVASSE9Od5TcULiJUVKWg0Fj21UsuuglOqkjDZOyWD0mW0O7DbEWEqhJfp0BdTHP5nW+asVWckDbopB0q24wRPJVRFsahU6Oqtw0bBuwzEz3vEHhBsHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=AObNzFGT; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HeClHpKH; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="AObNzFGT";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HeClHpKH"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8JK83461464;
	Wed, 23 Sep 2026 04:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=odORZzHIJlPG2mmNtZCGeh5hEViAMRKchHbF9bRR1
	RM=; b=AObNzFGTVCblL/Xc2QjWBHJq1mmtUZi9n83BA6vgBej7N6tCSQi8aTDY+
	6TmoZ+EsNGHcImMfccdyWZ4u3ouLMdid5U/gw1V9FKv6qsdQuXY75OahGdue3x0A
	EPg6Gohd4s7S697QHbguFRtxDMUEZQGYt5oZ/LGEUwjIekpmSfUi+eW9K+zjGR0s
	82r1pF8RoxKjfl6+Pzzr3/z67EC6GiYLrdJ51cL5U27W8CT2U8P1JyxOF1dhXmwx
	7EfdkOt3841LBEErRJLyP89qGQ4A1gWEfSXu1JoeVImy/khlbwu3Ef/0lEfMYOwW
	cTlJKx9NdCiVYn1T4onQK6wJqtOeQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012013.outbound.protection.outlook.com [40.107.200.13])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gv3tsavja-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:35:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMrsRYjKvlTaVKPmZdqUYIuPwVQ05pjThjK37ebzl0/yR+07lP1galgdsDGoi4hQ84qX6TPrSiLiBC6VHQRUnlxM4iUui07wf/2iotfUL1MCBm8UTB/obHE1K2vmNBa1xkGPHhZtPCbgwnsjCrw/CV4bnfZ9hG81cqec8h1zU2JotwfOVCbfn4+BfD/NVV8wpJoZJfQh0SA5P6HH3b7zjN9dpPXIpsRBOp07E84tgxraoIO6wE2hDCaY3oI+qk42zPSs2huDC6QXCWdtJWjLs5pAzSNKRc94Cl88ky0TPHlyVAogZseHAZEm9aGU/9fmKnzs9XsYOODlWb3d/WrWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odORZzHIJlPG2mmNtZCGeh5hEViAMRKchHbF9bRR1RM=;
 b=YG6B14vhWo4iernHxj+QcAuC0Z5rfGkaQ6oSOYoZQgAGPsyq2pVlmhZjWXijo4FhtjsOGkBe/hs4U1cmEB5AP+UvCSvza4Xt3MsU2O5grcJA1e6Mq43QMZESeJ8FUzRCayObegJxYLQbnXzVAdqKGZ7TEmw6Kx9PznVvvpd45Nmzt747z2jJbKHp5pTIiXm2MPEJKe5OT1WuiIA9lm3zB8DDzvflQXM37qQCrwA8B2tnmkWXJt/YycrJzwIBP8Z5oCcD5YkKrcKOgflCh+TP5ejV321U4ozDUVpuxPvqJBXT75FLU0vvnNnVQWdN6jZMRg/Onxm6Mdj2rWdwb5JD3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odORZzHIJlPG2mmNtZCGeh5hEViAMRKchHbF9bRR1RM=;
 b=HeClHpKHaDZ5MAeiVj/sjPMmY0+nGRrZsZW4rdJmOJ6wsCpF0PA6vHXNMnyHC5ECzYas55gYs2PL7/vwjVgaIv2wrJxnaaOWZecczvmY48cJ4gjaF2bZEvr72pXr+kHl7sX1j8NJY+Nf/HcTuFteMR9MFQbd/l5+uJYUbtKsC4k=
Received: from PH8P220CA0058.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::32)
 by SN7PR10MB6450.namprd10.prod.outlook.com (2603:10b6:806:2a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 09:35:45 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:2d9:cafe::3d) by PH8P220CA0058.outlook.office365.com
 (2603:10b6:510:2d9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 09:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 09:35:44 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:28 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:35:28 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WQ1760658;
	Wed, 23 Sep 2026 04:35:22 -0500
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
Subject: [PATCH v3 02/18] arm64: dts: ti: k3-j721e-main: Add multiple channels for CSI2RX DMA
Date: Wed, 23 Sep 2026 15:04:43 +0530
Message-ID: <20260923093459.28125-3-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|SN7PR10MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: f2038ea0-f630-4e31-7eb8-08df19560ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700016|1800799024|23010399003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	lzr7jRmgTLmPtlmlG6vUA9O3IbGlzMX8U88TPLCWD5Qod8064m3ywb+IozE3M3hDz0IvKG/L3AaO9CuIV1OU5673309zxXtzzvOhz+OLUw1FVqt0bdDaL/c8cBMHB+pgyWc7u0I/YgEZPae9FCtpiNW9uf1fbgY6mC3QqelDBpeCokOhhB9OVmmztA7KdN6pmJuKoxwO65/+MoEIV8WZ/Jl+ad8wrijeYNrIDt0Ttn7l9MvIk5SSWf0GIWF1aFThzefFMAC0nZMo8xQjwaVvNnARODbSgQjqnnSqHKHwRh8CjELn9ollCBvAXTs5IZ+cSoQ+H1k8+gYOUWgtY11qIhWmoBUjvYwN59DZlWjWkWZyUQkHnkpnEBOSvQcT+VhU5vJC+DjAW4kI2FZ+9IWZuP9Im/zsOnnp1NYxNX8tpBDgPKZkLj7NnoIsO3LQ+MkvKTJdJsgtjKSagzPeBDW555O1euo8153cx/QwxDA4njbt0X1rthgJox3Uu5IikRLKFVXiRWw5LdoNeAZOY63KNoRBJIL5IK8dSSf4ptjWcCLsozyNc+YpKzR7m/y1EHHQaUuycQDW4Q4jJIcAYflaWKA/kpzqCn/r4/h+jxte/F0pe/h0WXaXB0SZljH43eQ+oo0bO0+NxhF/gJ+lKaYEdn9g0USxZ373/qtjd5IzakcUAKQJVbca7njVryoFpumnF5E9pZHW9Ppcz0J0QlYpdQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FRlO4ZggV7WXcItwdizD45kqp+J0J1vQplV27jJcjie3sRhjubtFu8ePivIBJf+mrjDEgAz0MBj78xCJHP/1Ij54Ul1HYT6hXL0emeaEdBCqzDL2I1haivM8tNp+Dr3CdoWX0Qej3csW+p30kJ+DkRu/o3CP5uqxiAhbzUismRQItZXOyYIn4TbzuyFzsOdgd02/a09FlJL4Fm+N4uCZpIgBwpSMRxMkKIVbPnnu0xpMF2TuWEkQoNu84x+5aRou6gbLhEuYo1EjipSm9TMyD393hGOGOENod3tQTk0dxw/LOWxvXnmtq17AKjMtqwsp6xpfuIthVYNnvVOEGmFhjHu+SSNXqJE1RCY8iDtN7/wfU8ZWTXjHGVWHzjU/XVP4da8eJkRS9S306dA4eL3aPwhqns+2v4BADThXIb5vCMke0sRHIZ3/BbTakr6iPofu
X-Exchange-RoutingPolicyChecked:
	sDHb53A9Gunk6vrkVZ61AWANtnBeMVjCOW5AK2xkmZheCszZ+5cYg5am8cX46NetmOdKXSj7aZwXKRTEDgOoidKBrsLmOrpe1nkkMQB1UlX8kBdMjZ/22fkMMnYhXGu4X7+axxeOc6IvNq1AVJ23F9olDl9lTTPWMGI8onAMdOwY5kMe32/q5jAz9GXNLQNbZb5eB9VLdafzleHWAA69OPj2W66G1BzbX5fnc7zeDW6QVjnGFivoCA2y86RH3VNA/WA2gt63PuOMt70LytbGkiFU7Gtw4ntIuS6UhJMBs2plph+xLrk2WYJHcvFvZPPlqmkgAP0zFcQ7nYueXyWb8A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:35:44.9292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2038ea0-f630-4e31-7eb8-08df19560ade
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6450
X-Authority-Analysis: v=2.4 cv=INaXmQvG c=1 sm=1 tr=0 ts=6ab39d74 cx=c_pps
 a=qiA9p8iyC6UfobZpVQ7+mQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=lWlUmI80TkwTl8jqF04A:9
X-Proofpoint-ORIG-GUID: svdY015DX_tk2CjxrwSbXaCuwY1rXgT2
X-Proofpoint-GUID: svdY015DX_tk2CjxrwSbXaCuwY1rXgT2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX0To/sWCyHT0C
 itTPCf7p7Cr8tdfn7+xEjca26N9a0SVCroHQTph4lQ3VhAasnYbLQNJVcqi+xAYbHmBnL5IovEI
 Ey9S9xcyaNi+B97hSRgcg1OtXaNULyHKZeY6M3W+ItSZJP/uhDnfrrUWehuS9P25G8mmQHdqGpx
 9lBZt3SdB56SuTKHNv5KwNLu91l8kYCVds0ZGDPMaTJS8ssg+RPKGWxkYfQJVYrpwvojERZN7ao
 xDSjp682y2cJKwvar5HP54G4la2an+1KFivoqTO6VuHIcaTkdV3Zmu+c0oLwqE9DCnLMjucdwi3
 NmGexSxYE2Q3MYJc8f+sS6ORgOkRy0EGBz+ilPAC9/Lu+hg2b3otD8CBv72iKwRpjoHtO7Qm1qq
 mN4aB+/y1ciQa5wCQegN+r/Yc1kNr2F7UfDsQ3wywg9k9UF3VR1VJxwSl0+u4yhAQ8SwsXmstJB
 ZHouVgiq7VNtkttuNyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXxloc1t/sUTTI
 6GVN/ihho4EZOGvrmVeFYhHqfGUbqkZxm+fE8sYAV0giI5WKoj1XM9l3bRjbDRq2KfL/YWVITLP
 qCpnsDPG25OUHVfUShTFURNTGiRS7wc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts. Add
additional DMA channels to enable multistream support for CSI2RX.

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 5a8414fc5751..b1988437f52d 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -600,8 +600,14 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_udmap 0x4940>;
-		dma-names = "rx0";
+		dmas = <&main_udmap 0x4940>, <&main_udmap 0x4941>, <&main_udmap 0x4942>,
+		       <&main_udmap 0x4943>, <&main_udmap 0x4944>, <&main_udmap 0x4945>,
+		       <&main_udmap 0x4946>, <&main_udmap 0x4947>, <&main_udmap 0x4948>,
+		       <&main_udmap 0x4949>, <&main_udmap 0x494a>, <&main_udmap 0x494b>,
+		       <&main_udmap 0x494c>, <&main_udmap 0x494d>, <&main_udmap 0x494e>,
+		       <&main_udmap 0x494f>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
+			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";
 		power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -656,8 +662,14 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_udmap 0x4960>;
-		dma-names = "rx0";
+		dmas = <&main_udmap 0x4960>, <&main_udmap 0x4961>, <&main_udmap 0x4962>,
+		       <&main_udmap 0x4963>, <&main_udmap 0x4964>, <&main_udmap 0x4965>,
+		       <&main_udmap 0x4966>, <&main_udmap 0x4967>, <&main_udmap 0x4968>,
+		       <&main_udmap 0x4969>, <&main_udmap 0x496a>, <&main_udmap 0x496b>,
+		       <&main_udmap 0x496c>, <&main_udmap 0x496d>, <&main_udmap 0x496e>,
+		       <&main_udmap 0x496f>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
+			    "rx8", "rx9", "rx10", "rx11", "rx12", "rx13", "rx14", "rx15";
 		power-domains = <&k3_pds 27 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

