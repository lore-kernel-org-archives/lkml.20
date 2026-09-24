Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84999440A0A;
	Thu, 24 Sep 2026 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243201; cv=fail; b=Xo1WcQTRqbIydO19UOWnaoR+AnWTwBPmdxR4IypAijtmVL3SBhxCLwtrOnW0q13kwS4NZbuF6UffUEOpU7y20f2g8D+FNEplFu8888J1CFzgGrq5S5Rvbo2wnlWiq6erRb/R02cJj3WRqeQRdPTwPeY5enBJ7cEsfzjR2m+oL5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243201; c=relaxed/simple;
	bh=PX0Ci9GnNGlBFb/8U0QwQ9Kd/6ODQRC0fJzJIW9mtBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sNIdCVaoxxRezkl7Mz2cbJRgPk+AluSTSD/Dq9PYThDiYIJH+/P5pCrs0lBE/HJ/KOORdlvqSoD/zlqmbOXR7bKIx3hLBI4Exolew68wRpR/IiIdWUpClLkqslJHCTFGDX1L0999KRllCHzDpGudMijB8fuRcU00BSZ6JE7KDZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Sk+N6vfJ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AheZjWag; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Sk+N6vfJ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AheZjWag"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68O9HYSt3355225;
	Thu, 24 Sep 2026 04:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fEzdCDGO236Mr1hiw+MPVng+FudS4BTzzCajKSJ+G
	Y0=; b=Sk+N6vfJy3s98BLAHZrotD0pkDi/FoQFoJy7ArRSh22igO62IxSUVkE0X
	A+sWAUI+iZk+XMPVobyVlw6yBvR2hLDevaMlygu1yHZUpdJExf2dv7RFjHHWkIOg
	dOh10d3FljaxlzqMyfqZkpbgwmoGFPCUyqosKMHt+LnLg5/2DhOzjU2VOO7dM3OO
	jQCEo6i9UlhI43jBTS7aHFV83x9kUrJShbG3ljJK4CdoBR5Y5WyHXBtptaZ9o6t+
	lriWqkXLgZ0j8EJ/KEZhS0vK9B5ILFq6BORhR5WXKzjJi5cx7S1qE8d5Px1RLfUb
	ILY6r6F7rpHeqD024b+MbVivMEkbg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011017.outbound.protection.outlook.com [40.107.208.17])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gw13r84av-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 04:45:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmLYFV8sxYuz2O9A+x+/A4r9fROvAjw2+YXXpb3SD0jmqkpd7nCd47VG6rQ0MlJby8Dzlsu3YqbaV0/o2xiRlvlCJjT3MM75XCserOLIm0LQRXjjQBQ8uZA93eVnReilbkyc9zd7knavRqIYdEffOmmut6Sv8HNqTWI4ZrQVXOxmurIJvqCC2mF3YzbVp5F+d2HcGgQD7seyzCcIWOwzlDpkCW3uZNDlTJ/B5ootzqcpbRwXjDiwjcDxlclUvpiwo1fJxqtHNoOgqvBZaYua/iLVlMzMpaiHp9548CAdgc/eLm44ftUuA7mfJSX+SJgjo8K9Nv5Od7/JWRSnvQ1SPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEzdCDGO236Mr1hiw+MPVng+FudS4BTzzCajKSJ+GY0=;
 b=uhpce4MG4kOjIREETge+JkBmrd4wwqBrDx9VRy9ym+iMcb74iUXwDqJ/3b+zk1xN1EMMBeAGkdBZC6sP+itksXOfKzdWBZj+uKNYo0nrw12l0yLeUBCdMuOZKhxzvG8hFODDbDneTzUEtpNfweIzDV37nkfbDbPNQ3MR5NQNhSeOtwHfF/mXNB5ContNWcIqMT+YYnK26loWdhMXy/A9v742dlmFrVUMtpd+awyaxsbqSJGu9on30JMfKwcPW8dQu6CJk5aVKxZUXBSiXiKig3AKgFKAI65Oe/a5GNj8w9hlQ/VY/a1QzHhqCoxzgN42nuNkiMYN5m/Jvy3iw9KKlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEzdCDGO236Mr1hiw+MPVng+FudS4BTzzCajKSJ+GY0=;
 b=AheZjWagEomFdbfZzkD8vWNG8dlZIcOU5XVGcYlo9TgIzr1Xwrv76XhBWFNqS/jS7BB/eCKyh6nhM9YmXE6O975doj2qrzLJSjDFLYQumt9b5QgXukhT25oD6wm7uloMx+N4/NgDqHJQnMlnf5t6DzV9T7i4n7HEpRN5m94aR78=
Received: from BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::6)
 by PH8PR10MB998090.namprd10.prod.outlook.com (2603:10b6:510:42f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Thu, 24 Sep
 2026 09:45:21 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::6a) by BY1P220CA0002.outlook.office365.com
 (2603:10b6:a03:59d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 09:45:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 09:45:19 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 04:44:39 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 04:44:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 04:44:38 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68O9iXJf3859067;
	Thu, 24 Sep 2026 04:44:33 -0500
Message-ID: <fe73743e-98b1-4f76-a126-ac34492000a1@ti.com>
Date: Thu, 24 Sep 2026 15:14:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] arm64: dts: ti: k3-am62l-main: Add DSS & DSI
 related nodes
To: Swamil Jain <s-jain1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <sebin.francis@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20260923192643.1362891-1-s-jain1@ti.com>
 <20260923192643.1362891-2-s-jain1@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260923192643.1362891-2-s-jain1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|PH8PR10MB998090:EE_
X-MS-Office365-Filtering-Correlation-Id: 541b4b3f-c765-49f8-d284-08df1a208c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|10067099003|56012099006|3023799007|18002099003|22082099003|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	O4gc3ur/PnjKIa/aMNualuWareKTE6Hf6EQV31YuJ1f4ITlov2TF5mI3L2REYRt+pl8G8Wt5cSvWvJeo37jTmcnVGPJtFKoz+SSAJYBI3126po1ITM3M9fj5MHJQwLxsObWITcdoGUK7Ub8tPJ3Rd9yIBHyn7fE9oyrysP6XaFJOPo5v00NNKLF6wIO+u1OP6xfwKDBteNjG+v2sZ+MAfY6Jo20ywtDrT19zhO7Gv0VU7MIGP3zoEwv56ws71ZvtKLyRpFQIp0/afqJzHpEvuqCd7Vt88KzHDJUS6jOZkDIRAMWFb/dKM4lsBgqsrnwCkXTB0WDy3rqwna3FOj7IufmdQ0m6+2ssSol5J64ziWgNnTNI+J77efXJXYJOGmEDY6Fyp3IN2B2xxLRuYyh3+M8d40hBY3utzttmJ7OTbgEL/ZmZpw/l4u4fwBrx1tBUupwpLzuAiKQikK6HS+1mN6LgOAcPNT6P4CRts8B1oLTg7vzTXuBcYdWKkEUeI0ZailXiE/8TuYkY57jIACTvD9uFhcH0nenMmTjal6U6WU6Ptl0EauAhfkzVcX4WsrYHdwjh4v/Ou93HBJttHms4Vpch4LfoP8iX/6lwk2US4UPK3FggfKlpDDrfPc5qYWjp4txPKDAXf8CVAE2jj94HnrEfdEAg861KEOfTLcZZSyr9YuqfFJZxwuo/+oVkRBPKdrol7UdAidduqaXnwkP4Ng==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dozCmt4VFFz8Qx9kvhUVpCGzVUbGDONfbeevotSjZtBvWj2LYO637coKGmo5CEuJSnbm//i0kvt0M1wX6JEMVeLQQRsf2h5nvUKXyD6rz1O2UwDLyLBu85ZqURfxLdtFdboIjoBRcVxxhXCg/fxjSpS3aMdW2K7alhLOHzh57yWby4H1ed/TOmyrlHCCI0wGYLPR9lG2jYTEXtdh7ssYg6XXcsvb030IHT9R/0u1b5ZfcAvqh0BQgqK86vZsM7ZBOIJgKA3rVW+lwZRzkZ9FN8JHV3HquFJv+z1xxjkPcgXrWO3DhbJtJqo+t4hoOmzno835/cGAsQ3iJNyAuHtqZDxyAS6oqmA2D30WsvyQq715sboTvSIQJY9iJigdxOjk17u5xoqqPUF7qMJeM2nM7tTawU0NjAmAujYoGjmE0Px3WCxlwY8rP0FW/i3TakOm
X-Exchange-RoutingPolicyChecked:
	Q45m6+NECEjSw2jtP86cSJ4600/q9p/PFrS7AGSpZsq5UWMuwnTWHsyhjaCTA1Vly/xMhxSfqYQuNDmzO5k8eRID4zCUQ7mC6USEjQmy0wO7Hx+BwX98MHETPXqXANZcp74qsX78fnpWW0wrZ+bNRcVoG5rzXe2n7LVj13KC7euYoYyRAUQBMKwko8RvcFOgLibfzUfbAiP3dMbZqXEHXHZNQ9FeeqaR766TquiuwymXSS+1+k5CvNlg4k3ENZrqArOgIggxbVP66cy82J14p++8pMBf1u2R2PhAQvS3rAn1gzWGXeTvHjUafF4JhARWzaWLS8tTCjlLuRS4vZCnCA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:45:19.8776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 541b4b3f-c765-49f8-d284-08df1a208c01
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB998090
X-Proofpoint-ORIG-GUID: aZoCvCrL4KZaPvcSSQfwGDHxPGqCqxWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX4fUKXKpgtka9
 MFyG4nWYUuqC7Q60wS0d1kjFL9I+IuB7BY4x4vKWjm1FsflKW0hQsxISf6mnnaP0dSuu89zgnER
 3P+5+M/2OXzLocwbeSZvi9SibVmRfYf52fS/2z3Uz9RI+tIhDe70UXaIMydPPvEwfcnSyLvwVoo
 BQpgkngoARr90b3jBGF37gaAYRxfYNFF94y2qu+NoMiPRg8Vj/EDRTJapNcaBmg7fctWL9m+X8L
 fKpBqFaQF/ZkKZXV732dQANaIy0HESMyxhMza9RnE3iTF88hwzieQSZz6PewnHFoU+JFo6xQeYE
 mRkJ8nV5Dj48vXsV2CZp4ZG2a+VXTPO+NES5+nQgbZl3YKIlgZOR+Kl+xM3ByV+jsp3XqVL4du0
 rR5xJ6wu7OxjUmZfFnmLHm+j+xjRPHy9sZRImB77VvP2Q6Y7Rg/nxa0IYzsvFpbXxFTGKHAaVTu
 7qXMpN3jEnUhUIBw68g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX0G/jpDs6q+wR
 MNMFSfZqjgjuZdHAdI9uO4sE/bxSXetU2MiemNF439JzMv6XaMW0BFeSgv1bj+YhmUGndlvWrX8
 4cR6G1Po1b653J4DH8GHa7+sGKVD5eY=
X-Authority-Analysis: v=2.4 cv=OICyTiaB c=1 sm=1 tr=0 ts=6ab4f133 cx=c_pps
 a=xsXPfmOQRNjzd7Jig0hzfA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8
 a=IZusBTQpq6T1z_lNvVkA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: aZoCvCrL4KZaPvcSSQfwGDHxPGqCqxWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240040



On 9/24/2026 12:56 AM, Swamil Jain wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> Add DSS, DSI and DPHY nodes to add base display support on AM62L[1].
> AM62L shares a single video port for DPI and DSI output.
> 
> [1]: https://www.ti.com/product/AM62L
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 60 +++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> index 80615ca1e01a..a3199a2455c3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> @@ -544,6 +544,66 @@ elm0: ecc@25010000 {
>  		status = "disabled";
>  	};
>  
> +	dphy_tx0: phy@301c0000 {
> +		compatible = "ti,j721e-dphy";
> [..]
Reviewed-by: Udit Kumar <u-kumar1@ti.com>

