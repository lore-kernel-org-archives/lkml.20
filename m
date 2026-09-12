Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A5B381B01;
	Sat, 12 Sep 2026 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789248794; cv=fail; b=WEaiSzST9tpCdBR5xa6DoJt/k17G1TF43x0jJOePqv7bA8p2qN5ZJM3zYVfSoNvMDft07tdTf8fGy9WctOp+Gn1PblIdvo51oIqpzvESleWxutTLaccZMJzbqLn6qwRWBSfYaZ8rmcJMPb8wUEiNzojfrz6tDoBIWKoWzBG6cyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789248794; c=relaxed/simple;
	bh=YRTgOaVwPxH+jKVn9JeTMKZNQR839ArwvxywwTpBLAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eIWcmvmukezVowj/3tK4i1nrXgy/c9fr3h3kNcUMOl5RywC4d7FFsXo2xiRqKCXoNhtIlkO1MpLSkrIS1HIzz+wvd9ZhusaZWZ9HhxRRh+qBO9CG+xhvd94rvD2w4TYvAEqfp8gveB5ZIedxuzCdQ9T5WYWzOAYM8+DPD5wq2IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kB7TOgyy; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Z5qrajDz; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kB7TOgyy";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z5qrajDz"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68CI1LNV901940;
	Sat, 12 Sep 2026 16:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=60MAC8K8VhX8A/5Yu8rhJ/FgiqlwTDjyjqEQCpjoT
	1U=; b=kB7TOgyyqdnz0rUPg6TGJcZNQDpk5G44Aer71LIquHc9vDWwvEYaNteDQ
	+qfL6uHwCB/22woTH0r2u1Vb9dzipugQGDHYBHofv0k9nvd6DPSx08rJqoLXICBV
	BIk06uxTLSOwLwx/NVBNxp40eqRM1jGKI1uhwQWcd0DVG5Jii/BzOpG5NGtkmLJK
	47h6HYH0Ou2gNhiPqRagMfol4VXlHLVsFdD7bJzpTVZM7AGSQrrWbQ+pwxckAzDB
	Z4GoPBwm/8t9AR1EBlF5tmOAL3O2BiVnCUEAO4DckHKrRCD6k/kdbNFzlPXtcnhI
	MTLD9pHIipAZSsjqSGeANWiJ5j8RQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011020.outbound.protection.outlook.com [52.101.57.20])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gmy7au4a4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 16:33:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=li70M8M0YuG18jRKIK4nkqz2+U3aWmawvv3OiDtVjM/AydxBfh8FPYrylrglk0d5cGnt6Af1GHjHb4G/RUrEHMdMEn7urB3SQHt1uw2hrOHmI65XkxhB6LaeGLlmpCHflAoy21zKJNuFMhAB+kcF30sZ0M8EBHYu7AL/Bfj7F6y+lvKRJl0qPgHLElnpBHIdORCOsFyS5nfITMGnxE6/sv7xMYs3OCRBCoEfYZwmUj6C/2DUHukiT55MDO88Utg9/StbcbNlVRqThtYezlKRd7P+/pnmlHO15IXYS6fuZ5EDyq20NhM3I3BpiVsF6G7aeg1ftKgAHOCXwfw+rBINqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60MAC8K8VhX8A/5Yu8rhJ/FgiqlwTDjyjqEQCpjoT1U=;
 b=ZkrWRY6ZKP5KT74mzBxUcvfVupyOBwIfThUh3UEw24t+1I0mArfZ+3Bj9L7MX8gpJfMz7Ne2mlx1BHtffu49Ug1u22cr9Pwrkw9C9XweY0hw831MiNVFqDnMg99gT5c3RKTxiK5yEjSnN6/SrackZ97jqHMsK1/2/9GBf0+un6VNURjqz/32itK8XCW89kB8CK71RWXtiXl0K87LB7aqBRwQfgwL6i+yMHTDQIrMH7fGNOqDrQHPJeSa0llLBXaXLvaN8oYJfB+GH4wgZhF2V60Ug/FLRpxvzcFgotb24jr+CXENUhypXw6TlchArTNwT7/8kLdo/mm04svABnTJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60MAC8K8VhX8A/5Yu8rhJ/FgiqlwTDjyjqEQCpjoT1U=;
 b=Z5qrajDz/fFqIAC0GZdd8hl5JiY7uRbmZEvtXAkf3jPCB2Aw7KmjnpwGTJZeyAbFTYuGgxB7bopscGCL2MCZ3hsvQU3AfMQ8uGYT5sl4okQqi0z2PtRfzko3Mu4mx/DgJHnCXxUaxusEmh0sB2pFuisa5ivyN4FCxgm8rQlSMXs=
Received: from BN0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:408:e7::32)
 by SJ5PPF5467E3597.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Sat, 12 Sep
 2026 21:33:02 +0000
Received: from BN2PEPF0000A992.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::82) by BN0PR03CA0057.outlook.office365.com
 (2603:10b6:408:e7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Sat,
 12 Sep 2026 21:33:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000A992.mail.protection.outlook.com (10.167.248.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Sat, 12 Sep 2026 21:33:00 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 16:32:19 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 16:32:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 12 Sep 2026 16:32:19 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68CLWI8m3511026;
	Sat, 12 Sep 2026 16:32:18 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Sat, 12 Sep 2026 16:32:14 -0500
Subject: [PATCH v3 2/3] arm64: dts: ti: k3-am62a: use ti,am62-mcan
 compatible for m_can devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260912-smth-v3-2-6fa661ae5a4c@ti.com>
References: <20260912-smth-v3-0-6fa661ae5a4c@ti.com>
In-Reply-To: <20260912-smth-v3-0-6fa661ae5a4c@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789248738; l=2005;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=YRTgOaVwPxH+jKVn9JeTMKZNQR839ArwvxywwTpBLAQ=;
 b=q2b5JvNxkaHjTB91zhvzGksQqfIjSCPJjfOWCFmSunBYks7rRrrEcjSc2tcmeYXImp5gezptN
 BpD54J9uxdFCT01cKBLqxveDfo59KSraK+CmTqSPaTc60n5VqfG78Du
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A992:EE_|SJ5PPF5467E3597:EE_
X-MS-Office365-Filtering-Correlation-Id: 08990c41-743b-41dc-ecc8-08df11156b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BIQo0fK9R9ToB158GwUl5CQ5dSzyRN0aCD1lEkuUtMt8mpZhkA9ssYovyUAvUbcdfhRYeeG9coMmay/orwtA2kfASWMBRkZAkGpqXKqy4C0G3jzqduKSiRHT3+vwI/aoPwYarxZsCt7N5B/2ZlkdUCrsz/77+UXterBLaD7F2J3ehUFFf7JZ7UU3hQPG5CpZarjd7KcjQv7iuN/iPMHA8P6D8A/Ek8VS6vB7//FoPKNd38p4H53RW5u0aKYJOaAPy4cPRCeBroGMz50i7xej3qpMEvgrwxtckDbe/D7gOVb0EwNEMd1qXolKsFms384/gX1z4gpW1s2uv3AIlp72kP+ElPLiUR25dnOP3TB/p1a/2Q1qiGgNCGA0FN5IiVddjcPTvXr/bN0vT0zyS+iG/6S/o14uAhdYXIa9MTjYHj95G38Z0xpxzXtsp3I3a2yQJwbACplhOAMbCjUOrzx8o4Qy4irAZLxpHcvBj9a43H6YswwCquxksdONTJvBYigsllUeLtmbrRI+PQ5wwmfNN9MTG6tZebsW4d5pBGj/nd0UK0fjwvX4ZmXuXMO2vt2QG6a6hSlZ0x1OBNN8j+f48PQIy+m0S9o6VEgG0QoE5N4IcnK6PYj78RuFkDTQvWA0GVxYhcFjIQ9KgPupNIyy6wvpbJxrDgZdpw7bFggKd8YH5tky+5TJt6jUJTPlkrwMRn8cA96DW0H14T4GcZwHxA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y3zb+yly3Quk98tRO/wd2UmE4NX0CQvMiBr25n4RM9Ylgktr8fRTIVh041OjdCtRUqkjYYZ49IV70PFdj9lqk4yrdTNLNZ8Gwe3gcthpFcNKY5C+nXjfEZvtUoKyuKYBWrg38cbcP73F/Yiz/jXXNgu/sOuTcXeDfa76cweyvvZ1CeDTE983wXtgbw0nntqYv6FPqtIakPCoeSlda0QvPOnS3ry2rzYmC8hYUMtQKAFer8Ld+bddSjXulTRZlD/dxxYsNMagvqSTw75TeTRBl5t38cCnIcbO9hshmlLdai/vXNocfJXCNzYVbDOGXLzdsEDSt6/8nSkM47Lg2XIc6FJBbUMA43UagrMzt2ClwLOCekJfsWfwaucDjOkge2fc16kNhklF2iQtkKraRQ8+XdVGrw4GkgFRsqrf4jMG0tkKi9pEruMittBiC79+DUY8
X-Exchange-RoutingPolicyChecked:
	Mk6tY2AigVgE6zVtNz9QSYOU5W6K1m50ctvoZN2593Zk/gUGcw3ny9esehVgyMFH9g4vWvmTNFR7+jTq2lA43VsyHAvhl99myuTy6MN9448oY44J9XOIB3JP97DulilYAYMa/Dhrg+FG8e4iGG3hZQ0WZHkR+V+BBpgaXeZ73DRIogAec/ehNVz0Ax8GD4R9x5VF6Ci4HBx8HeJAQTut/EDqw5cUykl2lnPAvIlLHuKsz7lnGJZ2Ozb6axrQ8fmsvNrGfagfp+XkUgfbg7fyZNEsXGZfHOsE69LmbficK0a83D0wi+TL5cGS3OVeQx+r+GRjVYwDkKuXbGNzBS1YSg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 21:33:00.3981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08990c41-743b-41dc-ecc8-08df11156b7a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A992.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5467E3597
X-Proofpoint-GUID: HJR92KSJv9ekpPR7fcprukoTGGNVriTv
X-Authority-Analysis: v=2.4 cv=XZkcX455 c=1 sm=1 tr=0 ts=6aa5c512 cx=c_pps
 a=pqTWcw9xC4/AVWcamW/T+Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=kEN_4Xw7oY-NQBIjgk4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMxNCBTYWx0ZWRfX5pLFUOFqCzvY
 WOugfnzkb/OY0j89aTleFXRM7Km/s+pTOgnkqn4K/C/Oeiv8KTf+tMg0GQIBp0SybkXZc0AqBsi
 AS/5GQEmpKujlrcdgdJw/R1Lb5N4XJ7yJzZzkelhTXA+tRceXQzU7TtISb7v4Qn2gZOUYq7k6u7
 tHnob23UwRlCtFJAByHw1FRb8jGWJMrUqiXGCjJe2kuivF9+J31533KNO/Vw9/9KN24dUVFkSLH
 uKgsgE1sI12hDjkTeBQU0lKO/Hqib2LRF2NzKtpaPMwePVtJCaOyHfHtgwJD46odhiC3KW6q2J/
 RkVEJYO9ZRXC7zYYNiTpoWwe2qBMDBlmcNQ+LCl9F8407PyDLvNGNvTZUjYvweeE8pdGWqUv+7s
 2CJdYZjCqA2b5vJxRlOrVAaqVqh/HgpiX8PiUithMaHLmw+GH9aBkYecfdK5l/OwpS1aES2IYPe
 Fl+czG6eFmc5SEPjG9Q==
X-Proofpoint-ORIG-GUID: HJR92KSJv9ekpPR7fcprukoTGGNVriTv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMxNCBTYWx0ZWRfXyMbpmY/qQ4S4
 8FAAyLiXlOrAwA4ylTluVoHMnr0n9agUNjbz1TEvQ5CsJGB5l1Dhy9IqVMLsCofYsJyt5hf5uHI
 f0+Tj89psUOX8O0rz7psqQjPmDoIows=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120314

Prepend "ti,am62-mcan" to the m_can device compatible property since
this compatible adds out-of-band wakeup functionality. The m_can pins
can be a wakeup source in the deepest low power states, despite being
in power domains which are OFF during deeper low power states since
it has the out-of-band wakeup capability.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 2 +-
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9e5b75a4e88e23c74270b667a0a02d5efd931532..1552029fe4d4945b8fbe87792719c7ec7335bebb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -848,7 +848,7 @@ mailbox0_cluster3: mailbox@29030000 {
 	};
 
 	main_mcan0: can@20701000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-mcan", "bosch,m_can";
 		reg = <0x00 0x20701000 0x00 0x200>,
 		      <0x00 0x20708000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index d22caa7c346b35dcb11163a5e73e17790ff751dd..b9a66e884434132dbfe93811578ca436e8c6103f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -152,7 +152,7 @@ mcu_rti0: watchdog@4880000 {
 	};
 
 	mcu_mcan0: can@4e08000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-mcan", "bosch,m_can";
 		reg = <0x00 0x4e08000 0x00 0x200>,
 		      <0x00 0x4e00000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";
@@ -164,7 +164,7 @@ mcu_mcan0: can@4e08000 {
 	};
 
 	mcu_mcan1: can@4e18000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-mcan", "bosch,m_can";
 		reg = <0x00 0x4e18000 0x00 0x200>,
 		      <0x00 0x4e10000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";

-- 
2.34.1

