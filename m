Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474665;
	b=0K0q6/UK8gO0ZFPVLF2dLU88aG3ILwz1wKE/R1+cZhRcY6RHCNVl+ovaBrzM7YuI23DY
	 1J/hbKNFDdmds4ZeFvMtwj+ldC//Ee5Dvjq+WKQ84aE8i2kezsVBixe8P90aQYIITtrOY
	 4rQB+Ukgrl3Ct/EugQhpYO/381gbbbXL/rEtrpIHEBHZGiGV0fGcmiDrD3FPczAoBPIxa
	 PuwyN/yO9dyQP2OfCXwnn/j0oDTx7xEez+eGvDT+5+6HR6xbBcH8CyfU9Y+oS3Fp6ROlS
	 TLHJUNT6rWhcI69o3PEeGb3XcSUVg9Qlvst7bSXHPNBfqNE4F1FmjmP3wpiRXaMiDLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UMyMk4/81LTEQAz6CjGHt+y5Spej6cPdWEHIBnJO2UI=;
	b=Au6bWAecrLrTinXwpQNWv7g71Izpsw994e1GuwKf0rf6B2uE4rDYXgr4ZcRacr6fcaW0
	 Uqe6FNa8FrhA5vYCggR1kX2QIDIDI2FskPK8UAo91Ta1WkZdb2keObxG8Ax6Uqdq0dzjA
	 eHKfIgb59XKKOEUA58ImwILrHefiqNsPmdAbLIx7DbcBZ75zCVkqQgb489Di1g1ZmL7wV
	 BVn8W9raMgMBFR1MeVT3ds5sClzbBnpunlIIf6+gMg6IkURIog8ASl3VhHiPaq25PGhaj
	 8woxCCFmqbMoHh3T6ui4IOv/LuMjnrg1oS4AreGeS1tj2F7/SaSY15m2eFSTGzn1uAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Z5KZjFbD;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Te2TJ4cv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170E3606A337;
	Thu, 12 Nov 2026 09:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170E3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=Z5KZjFbD;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Te2TJ4cv
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AC5ipvs2297454;
	Thu, 12 Nov 2026 03:11:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UMyMk4/81LTEQAz6CjGHt+y5Spej6cPdWEHIBnJO2
	UI=; b=Z5KZjFbDqqNymS/3khLBnOSlkMclJasno9ago3jOIe/eCiVxkwhHtj/J5
	atZh9pngFh5ICeF9sUNMJWsuMtlW5pED3VJtAud+TcDVuoj09pddjtqyRvvQhRc6
	qa/LN5LzBT3YrwsFOLlwZhzelL7PbesJ8dOJb9YzVUT//n4+YUHg1p1aUqp3KlJ9
	3U1Tq8rtm7z9GsXv1BQTd8p3z6vk8RZPpVfdrI/VfZT9Y9a4gUil7/xcZF3BHPqm
	gzgxiXOlBRX07oJDVt+uhrDro+RX59aYeSHXPgX0qBE+e6vz3BCkZngPpP13UZOi
	hWR2lMKdPJ6i5aDupeR4T//ZR72Yw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010028.outbound.protection.outlook.com [52.101.201.28])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hw7k496re-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 03:11:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nn89m3i41kPOUBb8i2YP+Chd4HVMrCB7xbbQwhofC4LCpOMfpd7gIYtYIzAM5IgU5Zx2yPJzxRBAyx+1fpuOKGahcF/9yLThJ+oHypizxtawTWQj5jl/YuVa/9b6mi4rD0aWAuhBtoV7xhAsPtAd6ljjf7K+RTmNAASqaqQcYrMsAQw21UdCcBCR1nod9Zoi1QOG1mEHZLcDu+umVV9MK3Ko9H9n5YyTdu0MFnEIwXBAOZboNsyrDWiBo8ZnpKL3tJCfK6UmQHlK+EjdH20jPrIr02Pa0oZsdjZT2psHRnnyp4S1lud8xkvwLyjD/wfgEBh5JmlKCCuFIyougL2/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMyMk4/81LTEQAz6CjGHt+y5Spej6cPdWEHIBnJO2UI=;
 b=PmH8BpA9bIh1WRu6Or4s+oMfpZrmWZ0iqepg967FiyssVvaT3J79hQdlDuRPEkHB99hT0oku9S1+ZQ4RIR0RzubfkiMTxaiZMimaqg0FoSSf85JTrX0bzAx4sTkP9WCOLVUr3E2MVFy2pEWQO4rtQXFsqTdHzxlmPtHMqSkexo9tln9l8jI/nEYVEpXbTToTkTF9QzNeOUJ5KCgvlFIKq0gNHjlhBW5w3LD0SBTC+KCZo9Fua0UvuSZtMlqMKf5MZJkuG/VzBRHrB/Nx+soMcZFqVdAP7NXRdFj84IuzDg/7vb1yQODmzeLWZ9ZKHn0Op88IJ/1c6g5sTDjIVzD2sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMyMk4/81LTEQAz6CjGHt+y5Spej6cPdWEHIBnJO2UI=;
 b=Te2TJ4cvoO5aGKL3b+NfRC9eAATHNeoRR0WWi6hVlBhsLTA7pBrskJeugwVAVAg1fS0zMswn4XfQd6udtNcveNgpH93AT520oYzcSZJd1tcYBf6BHR2ckDa+V4Z5kuEbxNKFXpqqC7aH8K0O6pH5oliqM524KBqSwYyhFv7sVRA=
Received: from DS1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::15) by
 CY8PR10MB6802.namprd10.prod.outlook.com (2603:10b6:930:99::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.11; Thu, 12 Nov 2026 09:10:58 +0000
Received: from CY7PEPF000000F2.namprd05.prod.outlook.com
 (2603:10b6:8:455:cafe::5a) by DS1P220CA0009.outlook.office365.com
 (2603:10b6:8:455::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 09:10:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY7PEPF000000F2.mail.protection.outlook.com (10.167.247.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 09:10:57 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 03:10:38 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 03:10:38 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 03:10:38 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC9ARXx1549289;
	Thu, 12 Nov 2026 03:10:33 -0600
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 1/4] dt-bindings: soc: ti: Document the ti,tda54-mcu-scm-conf
Date: Thu, 12 Nov 2026 14:40:24 +0530
Message-ID: <20261112091027.1601122-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112091027.1601122-1-m-shah@ti.com>
References: <20261112091027.1601122-1-m-shah@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F2:EE_|CY8PR10MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f58517-b4e9-4a9c-15fe-08df409cdd29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|22082099003|18002099003|6133799003|3023799007|13003099007|10067099003|56012099006|261026121527099003|261026140227099003|261102123227099003|261022105027099003|261028144727099003|261009223027099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	wsR4GXwwHYUmiefdYlGMwKkzrvcQVlMSW2btZDEZ7/Me5DIEqBW88n7YlP3kibtcsWPWFRvXRhgxUrMzUjt394E/WgdAOj63MUQPTD43QOCbRGnBaJ0f/bVRXABHxanq7LYjBVo97lk6yJUzqYOUkydDk/uoKNXTWrYyX704DW3cbT1KFF/ISARqyTNac7844eZC22fzKRzZy1Fsr4KRtea6B64VnSQqsc0kQV0gVVwMVpWFRJrZ9k6Nmvri5l8S3h7u7uGqrLp5NxKWs+Hg27FoeJ1eyf46cOeA54Kwdl6+fX8GDXY7dQVO7BCUfjUDUyES8gSG+dXrKv7QS67ZmtRMzt0JjD1VdJzl67iCbNyaePaZewtjriLLouAd3pXgU6+hUzpt0k3tRyrXjouNxTmm7doee9WxldAxnp1raWpP5+wylkZsPAdYw8XrGF2mRdwrbktF0OyUXVD9kN65/vu9DMRFg/cXQt7FW74SlvyGngcIvIt0wUQ4tLFRIg/dwz6iTDh0zFCFPel6S61WdjTDjMsR3eLrc6HvH8Mx3MxV+dTk24AY7f9RKzg5yKET2inT0nFJ3hYKHGhzbNFV5KQDg8hpCA8S/Ei2rTObps/s8uu/qDL1ra3BvPBfMqsu+fQr8VQ/97PNum97s5Lmvk533Qz7OwOc35q2KEThRPY=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(6133799003)(3023799007)(13003099007)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261102123227099003)(261022105027099003)(261028144727099003)(261009223027099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s3/Y1WkJf9NQsw3wRRhhm5CTgXqWC46VKR7ORHp9w8Si1kpiSIZP8MUUpnY3qqwJOvUP1DCfj7+5r8biG/DkoWDm/FgAfkEWIIlBMYnXyxpC6AKYJKSCn+IFZ9fMzRAzaOwzkJCJ/2sti4kW8ULgO/iHb4SlTiXc6ma9xkGWWZK48oIoFj/OA3kOYYTWh0XCqeBcrFgAdLDmK8i1ImG4iKwTAP7OAndpm1w0ZnCsaBZUvNG3atCloUx6p8cGMhd1pz3x7Xmzk195rGsp4l3CYxXXD/Teg3hO2MLy7sk9WmYO2LXQJBJ5ISppumFAvD1m06jBm4SF0dbXrv1+0O2b2wCLspfBcfMzO9dSem3BrfJrgHekoedDtDtT9lvA+4A0CM19YQoujKmI0DhLbpPAm3Clo6ktRXzJhZX8NEQL5nV7lLOeiMdx4ioKCOA06j7u
X-Exchange-RoutingPolicyChecked:
	LbXVboThh7AQWHW9//sg3kIYzLRyR+X2POyjz296S8/s7F3FWWbqYC1QNKNZdeC2V7Swfae39ogi2Fy1deTNa1IZtvcWi9L9kQn4Nr8WMhn+ZTw0dD9BwTe7vjmd3kPzQ+YpmcE684l2tO+Lz2hpFfWZKZ1Ru0qijC590ZD7TgOZscF5j5UZK8Fui6UzCUOlGKA7oCxWR9Rry8I9380hJgewvG4pgd2yTwCYbsriAJgecwGQ2gU3P+xOHbjQAvnizyQ6VjLLa75Fv+o+mj7iHFvMXQf3WJnbPXEsENXtDEClVSzqLXEzNKjqpSBLwD3ZH+SvgW33qHmwA4sHamxhzg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:10:57.8625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f58517-b4e9-4a9c-15fe-08df409cdd29
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6802
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX2JUUTbakefym
 SAf4fj2MGiEoptOWWgVzrKa6g+ka3YgxZDUErf5nNtWgHZd9EahdPKU5f16LJ0lSgIpmyUN2+QG
 qz+x1XZWDFn3+oiMzdr+T3eBJhKoLpU=
X-Authority-Analysis: v=2.4 cv=fNCsTpae c=1 sm=1 tr=0 ts=6af582a5 cx=c_pps
 a=BtfbQqI9UiSbTyLCKkPcYw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8
 a=d6ZLZpmnShrUSTcg_4IA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: OWNO5NxwBvAmrwZ-d-P_0oCiL7KpW_oR
X-Proofpoint-ORIG-GUID: OWNO5NxwBvAmrwZ-d-P_0oCiL7KpW_oR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfXwg8gDDuauuuV
 mGtpJ+cT6DIwTjEz/NI91Vn4IkTjjFL33H2Y+dgUGULB84DeL9ibNXS6p6dJAs2N2y97tC/XCrM
 CV5kXIaraNZy4YsCMyET5PC33t4HAtzpngGNrUNG4gcW4p9hYwrmmzmHgbaw9yEJmcio8aODNmK
 c1+hTCjXOoSslei1TgFjyRwM61IHtL36QM3PsMQeH2bvIlVqZgGWEOq/G09LRb/ozbMCeFn76tk
 nKCahxkS9gDeASml5EW+5/fp/kCPpeFwG24WQV9Gn3B3awOnchPFFzTA4Y4I75jjoljgTwg4jTk
 fS7AhsA+mAYO2TmJ/qtNRydpwOFOJB+P1zmqym+ajqNoQ2WJNFbDAAVIQ2Hs6Xk4bFZvrqmqGjg
 YDP8dIOyUNmhFRunObpQaMvpPy7cqF13RNFbpuOIy8/+lEzJ5UB6AbgO1JJ5j9n3MuA7C4gy693
 49cKlr37oPUQk4ltRqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120036

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

Co-developed-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
No change since v3.
Changes since v2:
- Drop the additional "binding" from the commit subject

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

