Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D03B059C;
	Wed, 23 Sep 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162237; cv=fail; b=BN/66NFz3ZI07WfbGQdJfdvO5orkbfPiibsZ1d/KjZiHkpLLcF9rg7hcN5hLLCZavlwEX9QT+7mFOPqz7t3JYeBoQ6cCUvcXJmluQBAHdPSJRvqGmG3zMeWT82XssO1lGATYR8y0Kxr7mfN7YqaZh/X0G1t7Uy8QGFMkKx7Blxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162237; c=relaxed/simple;
	bh=MQqJ+j3rNiw2p7ex7jClLfXXnu/2cJumBuS/1qAJs9Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jTAFsSatOFexpWmwwZS8zJ1sitwXto4WBg/V3lny1d55IpeuT7BCehgDtPBkJModCnJOE9bbuee6XTWzS5VNKK1VOJSpJNBGEFYGXGaRl/fzZ0/oBwhd/JEWmy2reBH7SWLDS2duRZkk1rEsZ6f6VewDCF5iFK8jlS2f7wTdKYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BACi+QlQ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=v6iQRmxe; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BACi+QlQ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v6iQRmxe"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JFnF775670;
	Wed, 23 Sep 2026 06:17:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=SoHTN3Q5Cc8aiK2f2Qm0MmfGOGIk8C5W8+JI2U1nE
	DA=; b=BACi+QlQ4/e3zesKWaNa5HKnoLFjO9BjLgLkV7Q+uFelqlXLuaNRuL02c
	EUxzp/V1C7b1ov54sP/UFHZF4AToL4xjkBI8OEKRYJtFIIAL92JsBsYy2lnUQMG7
	jr1MMzf1Jm5OYt3GbIkD9oNE7xmgXOquQlmVU4FmgaegIMvf2dAdL38K4NVaqWOP
	r3gHj1nSHbFHhXwiCYm5akb4Fflo9LpM2+hfjBzRYiztlBsZurX/qcLnym3TDqT1
	Q4eMwj6mZlPfUg3y3vPIvjxeGx+Q3xG9W+VsTPKXA6JlxnfDJvm/QHfQacOMf4Zy
	KmJUr21+cjCPfE943tlwb1zqPnxXg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycuj9y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 06:17:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oynGSal6en+4esW7xK3NuiDhQRR42S76gB3hTr0vFcBmk7ZJXxFYQIZh5wjHFXuvysHtirU/aH026BXZkKxXreqlZdvs/tC7tasCl01WlacxiODkHN7OJsnl5vwBuAA5aITPaUj8Lqsmx9eRHv1DAuivBRb7qh5qCKCvrx3ASpru7cIEVT0usl3SqfKAF1P72IcosoyAC6ipJhswgBWC1Gs3JHPlL1VldgA7OVaEGk/gdYSmynfhClNyaXtrYeEsN16qRk/+DATh4SFwV+QwBK0zeYdX/cV1jOg0tezZ9u/2STSG3eds7VC+vZjcFHuq7qdGSLh2qcN/Wkm965XFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoHTN3Q5Cc8aiK2f2Qm0MmfGOGIk8C5W8+JI2U1nEDA=;
 b=rl2/El5rxXJvpU5trTL/ydvhEuubuVcNSjhcJvxuEc3E81myZAOA+1IzkR0idOG+42beeE2GrFW9StypCw7TbR7IdVsgz2yxugy43DSYX526ndVrlSoopvm2oYOznVUCSvwvCEV8eIRgnmzAdOyq5DT+8k/0L3aOV3ncAav+3I8Z46q30U7HU4M75EnRu+zdda0xBUQofkI0tpiUNl3sw+oAcNxkz8xWQcZseRLdCGaMWKN2uEtWndJfgZUCHY4/wVmI/mq7qpRjy5ldsufYGN6rX7q/23zLVUYYKHwQpDbz/cruuuGeAE/+vZlnyQY714jWDXok9XeE5bsR1frS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoHTN3Q5Cc8aiK2f2Qm0MmfGOGIk8C5W8+JI2U1nEDA=;
 b=v6iQRmxe8kOHBRjfStySPnDrENN0e9a0jslaXTw2NpUgDSRz2SV27fzc6XjVjxQbG867Eizpn2IlBISZqaC3hvWDIXmb03ZvxhKpgziFbEz46sAUg5ti7nZKZYJMBxOCLNGUc1VVnWTko8Mqzzp8rVIPFjHjtBGqIGOsY1YnCAA=
Received: from BN8PR04CA0056.namprd04.prod.outlook.com (2603:10b6:408:d4::30)
 by IA1PR10MB6758.namprd10.prod.outlook.com (2603:10b6:208:42e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 11:17:05 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::19) by BN8PR04CA0056.outlook.office365.com
 (2603:10b6:408:d4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 11:17:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 11:17:03 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 06:16:20 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 06:16:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 06:16:20 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NBG5mG2804750;
	Wed, 23 Sep 2026 06:16:15 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>, Jayesh Choudhary
	<j-choudhary@ti.com>
Subject: [PATCH RESEND v7 2/2] arm64: dts: ti: Add audio overlay for k3-j721s2-evm
Date: Wed, 23 Sep 2026 16:46:04 +0530
Message-ID: <20260923111604.4040417-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923111604.4040417-1-m-shah@ti.com>
References: <20260923111604.4040417-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|IA1PR10MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db80af2-6c0c-4251-6606-08df19643227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|7416014|82310400026|13003099007|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	M6j84yAH55szcyLX9uZY5U41u40DQQ23E7P0h+Ughs8wrUni3IHvH7HQpY62+YBu0frhSkPwqQhJI5V2sHjhUGSg3BfFsOVSpAMlbvY5xukqdoAXUykUBylEKxMwS18MpUrVP0paVphkXLVdSLG0pikvZ1jT/VBurRZSjr7tRmYidrB/LwMoEcPdV0xWvlYEk36ld9ainGVLNIpHImNf+I04R8DzU/Iq6arScmbZijX3yestsnKS0pnRxParlc7IYlJ8PZvnJCmdgnQ3zDhpnyNhNsUy91oQXCgrZYxkrXWdDNGXNCf3O1e+fevok29Pwn5b+RzfVLEqpViFaL/B9hOd4khdQz/d3lj8y3aFhXXBwjp5E+f6F34Mx6CxbLWLLj+Y8tufqSFCpQxTAfLNPP1/EJXpi6eR26JH46v2Lbv0YVdR3FskyrKrZIS6F1av2gfLTTV8LmnXZpDq5uTJ3T5IAORdgAaDEazIqV7wfcsd4F6iiYGOvcYYDetlZE4Qli5iaMRUxDD3pX0YS6EshCSttqeceIOXnYQkKUjeV6hqZENmGeThxcjMhky9UKqUpdPkLh4i1YkZ05kf1RsKOAPul2+JRWrpMvb4Pi20MM9IV2Cx3oi+3btdUChy8hfUh7zELmvqiRpjp2HMqqYzbg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(7416014)(82310400026)(13003099007)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9CAS1wbd3gBon30Zj53rFCThMBHaTT52WkxM07SsEhYhJnqs2XZi57H0o5uNFeXvWanqVFOeoffaaGENDxBb4wajINrARbFO2Jn6R5dHhAUHs4J7g7FDVKA909RPpphaSVJgTAe7LFroE+kidu7oudBV4txiTB6mvgijrrn1gYOWDb46Y6yB24ihUpgr+CWkZhvW7KLtv6n3x+vU7DfsEGM/rA+q8XTg2RaI8GFQRvEzmbcRgAFjydu4AjcNQGxWSXeLEoEMZgagbBQ5iMjLJdUx+KmjY83v5hGpsI+rZr84XCKFGP6xT1pAKsp2P71s5nD3T6QP3ELnFIhPowYpo2cn0zwTkQBWk3+c6LimI/fe74jfP2vxTWLXv5KiIlLJKuaWTOIiJYP67tumb3bGUaHgUGViPg5WYsz5DGcPKjTAXfQRfazZh4ICzBoIOudN
X-Exchange-RoutingPolicyChecked:
	s3/11XbZwoMdoXK7/mKDlbLs5bKtexIXks3RPcj7M7mG0fpFO/+k0l+/DfpQpgmYN/Sl9v1zdBR9Q9qXD5UTdaICJhQgbxUMFBVjYsSRFasgy1pNjnVC1G/c+0fY06JIjvKvN4FSIlxxL0sMOoF4BPQHITqCrtlMrvY6tVqnXoeWjEqwPpRwotcughZG0NL72+5/vWTLVlK4Jl1M4GCHLi4GU6I1+eZJBH0m/1uH36hM7Zl6wkhjklrRAdo6JjQ34mSfiFSc/eNpbaY1i3nPorW9+Pm8G3En6XLyOjR8EN3KL3+vfXteJlM5VTShKut/Z0odggnYE73zegSkYO4H8Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:17:03.7573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db80af2-6c0c-4251-6606-08df19643227
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6758
X-Proofpoint-GUID: WZSIlnaI-1Z3TruTVXeJyS6wNzkdYE9Y
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab3b534 cx=c_pps
 a=0PDhd3HO6khzWhHQYbQRQA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=oFhqMRED-i6X9MmFsNUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX/R/9jea392wR
 WQ11NZVNOjBS+ykKZmAzxcU2uJJ0H77LV1LCT2xWXojy3tpuaPs7vVH8DCwegqIaEqr7LGLGAXV
 8GrXIL7M0NkVwNK1ttRq+F/euDrmEAiuLsc8B1Gqve4m/gWrWBAr2CQFoOJ8KA4iJlJwd8sgGhX
 oL3qbFvxLKThR35P1E82j5LkzfV6j03GXCCSx6awp2hIcQ3ETBY1AP+6dmpaKnmd2eyl0Vr362J
 ougzlpzCznb4cjHPBZPwxa5uSedeZoS+j1D4Wm1QXi5AgZtHkXNqYe76D9g/+KgHpawfY+8+Tfp
 es+9J+S8N1Z1mCLICHRRwv1TrjzRyooW+3PmmJcZq6hdz1KX+9bc+IzLIvuHQMuZUvdudxF/Tmg
 yyxxcINUSlKh196Zz9rPas4Mjq3IrWsxHKxZSKwecYcGpXF0f/IOvsBXMq+gsRY45S3ii6KUcny
 sJpKzDriQrP1MDLDJSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX/S29QESIc5ZF
 MLwZZRL05x4vpcXGNjxRCXSNkEeKjuPwlxUs9tFcTiD/G/oqBVXU94lnZPWNvsrKUTwJ4Pyn1WP
 riNjjK5MuNuLhhe5Ew94P6z4pD2zbWA=
X-Proofpoint-ORIG-GUID: WZSIlnaI-1Z3TruTVXeJyS6wNzkdYE9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230044

From: Jayesh Choudhary <j-choudhary@ti.com>

Add device tree overlay to enable analog audio support on J721S2-EVM
using PCM3168A codec connected to McASP4 serializers.

- Add audio_refclk1 clock node to k3-j721s2-main.dtsi
- Add nodes for sound-card, audio codec, I2C3 and McASP4
- Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and WKUP_GPIO_0
- Add GPIO expander (TCA6408) for codec control
- Add gpio-mux controller to route I2C3 lines
- Add GPIO hogs to route McASP serializers
- Set idle-state to 0 in mux0 and mux1 for McASP signal routing
- Disable main_mcan3 and main_mcan5 as they conflict with McASP4
  signal routing via mux0 and mux1

Co-developed-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Reviewed-by: Sen Wang <sen@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 157 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |   9 +
 3 files changed, 170 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index fcfec8ea31658..bf52ae3e6a023 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -196,6 +196,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-audio.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
@@ -408,6 +409,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721s2-evm-audio-dtbs := k3-j721s2-common-proc-board.dtb \
+	k3-j721s2-evm-audio.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -504,6 +507,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721s2-evm-audio.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
new file mode 100644
index 0000000000000..ac5a827e1b750
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Overlay for J721S2 Audio Support
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "k3-pinctrl.h"
+
+&{/} {
+	codec_audio: sound {
+		compatible = "ti,j7200-cpb-audio";
+		model = "j721s2-cpb";
+
+		ti,cpb-mcasp = <&mcasp4>;
+		ti,cpb-codec = <&pcm3168a_1>;
+
+		clocks = <&k3_clks 213 0>, <&k3_clks 213 1>,
+			 <&k3_clks 157 299>, <&k3_clks 157 328>;
+		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
+			      "cpb-codec-scki", "cpb-codec-scki-48000";
+	};
+
+	i2c_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&wkup_gpio0 54 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_i2c3_mux_pins_default>;
+	};
+};
+
+&main_pmx0 {
+	mcasp4_pins_default: mcasp4-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0c8, PIN_OUTPUT_PULLDOWN, 1) /* (AD28) MCASP4_ACLKX */
+			J721S2_IOPAD(0x06c, PIN_OUTPUT_PULLDOWN, 1) /* (V26) MCASP4_AFSX */
+			J721S2_IOPAD(0x068, PIN_INPUT_PULLDOWN, 1) /* (U28) MCASP4_AXR1 */
+			J721S2_IOPAD(0x0c4, PIN_OUTPUT_PULLDOWN, 1) /* (AB26) MCASP4_AXR2 */
+			J721S2_IOPAD(0x070, PIN_OUTPUT_PULLDOWN, 1) /* (R27) MCASP4_AXR3 */
+		>;
+	};
+
+	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x078, PIN_OUTPUT, 1) /* (Y25) MCAN2_RX.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+};
+
+&wkup_pmx2 {
+	main_i2c3_mux_pins_default: main-i2c3-mux-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x038, PIN_OUTPUT, 7) /* (B27) WKUP_GPIO0_54 */
+		>;
+	};
+};
+
+&exp2 {
+	p09-hog {
+		/* P09 - MCASP/TRACE_MUX_S0 */
+		gpio-hog;
+		gpios = <9 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "MCASP/TRACE_MUX_S0";
+	};
+
+	p10-hog {
+		/* P10 - MCASP/TRACE_MUX_S1 */
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "MCASP/TRACE_MUX_S1";
+	};
+};
+
+&mux0 {
+	idle-state = <0>;
+};
+
+&mux1 {
+	idle-state = <0>;
+};
+
+&main_mcan3 {
+	/* Conflicts with McASP4 signal routing via mux0 */
+	status = "disabled";
+};
+
+&main_mcan5 {
+	/* Conflicts with McASP4 signal routing via mux1 */
+	status = "disabled";
+};
+
+&k3_clks {
+	/* Configure AUDIO_EXT_REFCLK1 pin as output */
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
+};
+
+&main_i2c3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c3_pins_default>;
+	clock-frequency = <400000>;
+	mux-states = <&i2c_mux 1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	exp3: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "CODEC_RSTZ", "CODEC_SPARE1",
+				  "UB926_RESETN", "UB926_LOCK",
+				  "UB926_PWR_SW_CNTRL", "UB926_TUNER_RESET",
+				  "UB926_GPIO_SPARE";
+	};
+
+	pcm3168a_1: audio-codec@44 {
+		compatible = "ti,pcm3168a";
+		reg = <0x44>;
+		#sound-dai-cells = <1>;
+		reset-gpios = <&exp3 0 GPIO_ACTIVE_LOW>;
+		clocks = <&audio_refclk1>;
+		clock-names = "scki";
+		VDD1-supply = <&vsys_3v3>;
+		VDD2-supply = <&vsys_3v3>;
+		VCCAD1-supply = <&vsys_5v0>;
+		VCCAD2-supply = <&vsys_5v0>;
+		VCCDA1-supply = <&vsys_5v0>;
+		VCCDA2-supply = <&vsys_5v0>;
+	};
+};
+
+&mcasp4 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp4_pins_default>;
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	auxclk-fs-ratio = <256>;
+	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
+		0 2 1 1
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1228ac5711bf0..36a01a06dd254 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -74,6 +74,15 @@ ehrpwm_tbclk: clock-controller@140 {
 			reg = <0x140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		audio_refclk1: clock-controller@42e4 {
+			compatible = "ti,j721s2-audio-refclk", "ti,am62-audio-refclk";
+			reg = <0x42e4 0x4>;
+			clocks = <&k3_clks 157 299>;
+			assigned-clocks = <&k3_clks 157 299>;
+			assigned-clock-parents = <&k3_clks 157 328>;
+			#clock-cells = <0>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
-- 
2.34.1

