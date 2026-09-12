Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFCD36E466;
	Sat, 12 Sep 2026 21:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789248754; cv=fail; b=RyNYWIM8T1YK/nONvwUYrlNAe4IalHXop2zVzLlol/G3Sf+X7YvIuco9PH+xywvtOE9WYdih6KnVkKNZvBsUkrnctBa4h7sjtWwjx03BgqsV6M5vDTE5/QzCM8TdZrrY9DfpwM51yw6R5Ecm8onpswkhU9Ns4S0smzCa4d2wPOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789248754; c=relaxed/simple;
	bh=/i4kvuA6cmC/aLVh9rMJJ7zD5V0Z0e4rG9iMedqG1/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XRpWxNN6ieol/EkwluaqWsuHIMqtL9+UrbNxJ6pKos4NscCIIl1Qn2Ino9XGG2GiY6q8snAGYUoszXHSU4E1/IQrmsOgBI9DyvEValUe4YrYQ/pkzeglZkmVctPolcnrzFbu5fMARgQqfespc/B6rnPMMvfz0R3rgwAulL0oXFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DWuejEdD; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RCjUL1gB; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DWuejEdD";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RCjUL1gB"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CI1c001114506;
	Sat, 12 Sep 2026 16:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aGqZs3pzZ1rkjjoPeqr2zMxAdOLItcjlCaR8JF8Nf
	js=; b=DWuejEdDBB5ZoxJkzH7E5dDc/4S5WiBzMdM3hpPjP0Q2zmfuDfCmN7z7v
	ZCuksXjyGmLRggpSzTDq/yOA+JcLxK/eYmBS4tbGzPcnLzB4uSSFQS63kmB8YipA
	SzsyFVypfCJufs3NDJFORbc+CBMHNRy5YqLiUVPlhpT0LMoKAiiAwIysS2GQKgLT
	dI2IGTPfsS2jd8baKGd7KiTi6SyJu9R29PRSTwCV8a1ysM4BKNUM07+J+8o7xI4c
	QEuU8osl+NylCz1qsFwpo3LdG0U23Ed3189bzX4dIaFiIFYBB/IT5S7uhqatfr+N
	BLxacHwl2XWMjEFzViNtXHzX6sR9w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012066.outbound.protection.outlook.com [40.107.200.66])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gmy6f355w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 16:32:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhsDlYOBs4nGZ6+5PalAlc3qffTJFZdC36pvoBCP4W3PfxOL280BTO1oS9b8SZyRXJcmNJ9VIfrBcOtCzxd9BJGb1Bz1u/cQ/4I/zk4TPacsspW/D4liGY40Va+4NG30oo2NGTVOLX2XIR14uww7GTk58rKGDYlYPvevd6Sqs08gbYU4toA2rR+rb/V6G0lvztg1CsVxjcJKYYKPs4F3HkF+3Pp6ZtnuOU2+Lzwd6U442vkV1oIzQb2ruVfcct2eUIw8ykop0EPxcUiwOEQ7IAPsHcKEzFrkC2GOQqEQBw6Lyqe2LGHiHCaCEN8QyEKu5UNH+iT3D1snrqRH9laMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGqZs3pzZ1rkjjoPeqr2zMxAdOLItcjlCaR8JF8Nfjs=;
 b=dcekOKwo+KFF/FP5bartIXtEchsxgA/JjszYzj42OaJH0x8npfXH+F6uUlPGBweU75jKjwjsrNM69nbqFlaf7f6ePHaPitRTfj85r5jlIeJYKuDox9xQaWlIAh2HkW67zLeAy57j/5PxTFt4/yACa74jbWwCG0grpUbTlDUY0AIWXoNNjtPzkWI0KTuvIBOk4FdIa3Wxecety6Dc14MLGarfRoyIUqT1badVl7GhdAtjIu72tZ/KC+55LBUXUhc2Sj5wSS0TAHTu1M7kszqeM7XS2DDAfEVe5nyWnNbeFOcWw9Ix23HoVAGgD4+WGHnxVO2doO9aHgdPp9jqwZUJug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGqZs3pzZ1rkjjoPeqr2zMxAdOLItcjlCaR8JF8Nfjs=;
 b=RCjUL1gBMqEaGjsq52udU+NoUgAE9pbpZyRkG2G3kwE36P76ummKF+kG/ebTL8SR+8FdIsOPiGmTbNEB0C81usngY2cndVSYkwxSFa3jkxc2nBlEZgxiNw50580Hwy2kH+SYnPEnGRbiqBFsDddEN73fXShMO1FK7r0x3tYkpi0=
Received: from BN0PR08CA0027.namprd08.prod.outlook.com (2603:10b6:408:142::25)
 by LV3PR10MB7771.namprd10.prod.outlook.com (2603:10b6:408:1b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Sat, 12 Sep
 2026 21:32:21 +0000
Received: from BN6PEPF00000070.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::96) by BN0PR08CA0027.outlook.office365.com
 (2603:10b6:408:142::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Sat,
 12 Sep 2026 21:32:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN6PEPF00000070.mail.protection.outlook.com (10.167.248.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Sat, 12 Sep 2026 21:32:20 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 16:32:19 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 16:32:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 12 Sep 2026 16:32:18 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68CLWI8l3511026;
	Sat, 12 Sep 2026 16:32:18 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Sat, 12 Sep 2026 16:32:13 -0500
Subject: [PATCH v3 1/3] arm64: dts: ti: k3-am62: use ti,am62-mcan
 compatible for m_can devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260912-smth-v3-1-6fa661ae5a4c@ti.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789248738; l=1983;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=/i4kvuA6cmC/aLVh9rMJJ7zD5V0Z0e4rG9iMedqG1/c=;
 b=YOHODlpsublhSfNqQmh6yfwETH0krYLfubE8oMFfmQYXc6Qi7e5g6+Isyye4NW1tFQvDqxdzn
 Blo64rBAgRpDpAOrogoDLh5xwmO/KKLAzt60UmUG2+fELt9eWM4uTyt
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000070:EE_|LV3PR10MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c45aece-2b07-4f8c-0a61-08df111553f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8tVWj+BENrD2QzZQS5EREXJMq988yusUCwA/i2oGbuBLxKXgDRcnLWDu2Mknub8wa9Dn7lpXqjzGEsn6hRXWLbTNsLPQX9uSlyOLFBuBAj/HiYy/Z+tOnHytPsTEZHpR/mS9pIffdYPmYdVnXd1EsLw4jmDgbZiAfLQIvWH1bVXXJKwqpNDa033H725qgoERqW1Vq6COah6IOj9RMrMEBbbMYDyUZlV32/FzK55sPjBBNmuc4ohk2UjqXm7H5gRtN0/gR8s6SRY5W8DCBkvTeitM4JIC/81OsaRaFVaQEg5cD6hJ7pS2W60CgdqNfSLjX74K1bbvI04hl1drqKCoYtVhbgK2UuvOTlpRsdnicDj+SmOJVRDIT3hlEk+DgPsTkw7TJ4TRgAg/XaMtq38Vw2UQboLjZUdf+bjsWIDNXyA/TqIyosjYitPvCpVZvQQWSaWOMJNksk05zsONhnR7Bvl1TTtU95L7sKZqva829BWFUDQJXHQGG1vBnVtU4bgF5SjuLg3JraF2tbYoZkaaa1RqCkHFS6u4UqlhatdIvrj1ZnWHO98vC3BQjk2cEODq1QCZsmC33vnx9SzvWjxQgUztOfltgl1nP7VJJ5yYbTWJ+s2h99G5uEMbwNxhcVAnwNPu1Q6aY5c5FsOZt62uAsiLzyFSUAGZy4RoGdbNQwDPwfT3t+br1opqBkhviwp6BFrBMvxqsb0VNzfUC8bbuA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OeRzcxUGcWxINb9afOryso8XGsTSHz3zqPtKPMovagcoYLzT2qHlIBZpsjq5xKyIgQOhf2hnyEZKR4JCBcStBBvn4jpQrnSe3jonXw+xb18B694dWKzkA0m29aOGnpl1av/z1IP71rCRrt2HHiwUVVnTa1Bd0CcCGRvtfA7pIeuex33BxFNCcPKF486I3e+fVQcv7bcSuaAKaxr3nakgBtHJTZAzwLCHTdWgCjFPcTq0Lka/hxj6zGwXQuPTCA0m1aMztWwfWKOICjiKlRC9T4V1zjAQL0t3LYWzrD7wE34h0sDr8eJU3fMVb02K84RrU4ISoZY032L/byyQS0u2IOuFSXWtqhE6bxhHVwzs6DjsTzWmHF2mVlF/ltNksO8n49lyUP4u416o0Eq1AZ1qtiRU6ZMYJQNx3cr2FNxEPmiN5FtfN2O2u+hvwksSWAKx
X-Exchange-RoutingPolicyChecked:
	mksR1ExKDFX/3pWRQVmlWX+F33H4TU+jyZ1J5clT7zfN6U+EnbWkvQNA4wC4zyVLG/WsrdKj/F60wch2tnug2KTnnWxMlNFl4j5XTxxUSyHK39yJ8c4HDBu0l/rHD7DKM704WQOy8gbQRTyx4Xts88TnarMrEp+jyNg/b+vfOusPQbpajvxH/+rO+umqEJ8VoCtvSNcEJ/zNGUCTXUaAye+Z8g7wKL6rTxQSxpi3ROjbucyKpADVDWzpDdykIH6onSOESr2f+lJmRK6muMUwwenhLudgS9hHqb8/U2+CPMCPz1dL7TVtzh691adb/pNMJc6he72LGwlte49pXUlbvQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 21:32:20.9095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c45aece-2b07-4f8c-0a61-08df111553f2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000070.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7771
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMxNCBTYWx0ZWRfX76V/lj4H+D10
 j7wECKo/S2DWAd8I0jGVT8Xsflv4X9RU2eV5VR0f11seB75f8tJY67+9cVSuBbTM6DYJjo7n7KO
 kvSynleS1DjfQBoCF03PVpwejofRXr2g/GSOZpVWVLPi9gCxiaGQXHZv1HSsrhNwutLZiUb1e1c
 zCXkLv9LNP3wG99oIY7TH9SLV1D9S0oKkfrYQpHji+aQZn3ANZObAk0lOyhbLhHzaRmnLsxCkio
 KpiFt8WpOVfhkpigYnLboJsv0Zp8+PQ1se17Qg1MZbWyZ8hWfaKMHuoNypaWTTPzupuJ9vOtVXH
 YxRbsTHaIe1yh+6iQsLIhvnAgYUxI8tp2HAegX9QyNaqyIVS+wksyocEUWfe8vyob4NalxtQGZv
 hMmHfAo5afEO5IFjTXQgIjqJ/aV8gPenoHpVbaSHiVkNrm2m33/chsiEgldpg1R//5IZe9QWz4v
 2hOBHXyMaRu1QFm4n8A==
X-Authority-Analysis: v=2.4 cv=XpxvqlF9 c=1 sm=1 tr=0 ts=6aa5c4e8 cx=c_pps
 a=u7VgDZIRhFIHkGP5DPkLlQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=CB4GRj0auupy9gmGE7wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMxNCBTYWx0ZWRfX/r7AROMW+DmG
 aeVxPqP0VtNsR9rkH3ZxF8hCmKXKr90uTkbrv0Be9qii0iexhMTwlT3QZ2IrvBfGCR+BC8J6ylD
 VORkpiZnaRx1qWQTPnbiv13JazgD2/U=
X-Proofpoint-GUID: yt5S7sDMJ_lhiID7kscI6Fc3CUIhRMqC
X-Proofpoint-ORIG-GUID: yt5S7sDMJ_lhiID7kscI6Fc3CUIhRMqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120314

Prepend "ti,am62-mcan" to the m_can device compatible property since
this compatible adds out-of-band wakeup functionality. The m_can pins
can be a wakeup source in the deepest low power states, despite being
in power domains which are OFF during deeper low power states since
it has the out-of-band wakeup capability.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index c5ee263d34a62ef46b416ffa45bc2ec5c28d010a..4c7e793d84a0e0f2ad3084ae41ae7ba97e8e2b62 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -933,7 +933,7 @@ eqep2: counter@23220000 {
 	};
 
 	main_mcan0: can@20701000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-mcan", "bosch,m_can";
 		reg = <0x00 0x20701000 0x00 0x200>,
 		      <0x00 0x20708000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";
diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
index 68e906796aefebc5eaaa5a231e56105a9cdd13e5..a21e3b889159b2ed8ea05af8543a589e96ff143d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
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

