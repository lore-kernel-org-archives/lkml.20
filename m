Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471105;
	b=AOdYtJgEFDLqInr+LVtei6mOccY2VdDumjL3id+DET85NhzZO2CMXBafhHgiqzT1PpjM
	 xjTDGTANRwVpqAEwrMJT5J7qIgTlF6EsnwwwQZGhe0DJ9xA0DamPaf/kJdIethBOeHmvp
	 bebl57epxk76VWEEZ7JzifmFDKnIgGRmValVbOOww9POI/ffTwy6T+OEuaB6kWDKnMNPC
	 bp9Wa33od05Mj5sV+lUc4zCuZqbMI+CmiTHQ0J46t3BP3vLEXIaqYwnySMO7CcnyNvU/R
	 3CxoFaPLKG/vhWh+bvSg0RL9NLuzZJrMm9grUttlqSYYSmlABgxU4zExivcJjKmi0dQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471105;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+A6n7SiPOKjzYLL6gFqGKWR8utw0/sx3dqoq99lLcAk=;
	b=pfKVSsPjOiobitBbk0eoCGIouh06NP5FsAEeZZMNTFT1DjBh4+Mf6ZkYMO8H+LbU5lBI
	 3Ej83SlZqEa7HSIwmD5Jx6axD45OhE39j06qrEvO4fyHPh+KlfAhUz3hiAHKkW/bix2xA
	 ZYRvsoCKzVPSVMszqkzp+RTb1cZwqJbQ2O/nMnmvKoiPIdMCE6/Z/itm2QiLsJQGRg9E9
	 L82khAyl/csGS9scW3rt6d3TBwjEpiznW7fSb3iccSZvS5j/hUubbUGQ4VtWrXYVqH81M
	 5AqtyQgp/Bh/RDvi3hV9j9zi/PXHnJtR1RpHrx42S+BsF6lljis0TCpXrIvmd1vpTkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=aHAL7SqM;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=hx2eJnSt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB6060A260A;
	Thu, 12 Nov 2026 08:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB6060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=aHAL7SqM;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=hx2eJnSt
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7guTq2308431;
	Thu, 12 Nov 2026 02:11:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+A6n7SiPOKjzYLL6gFqGKWR8utw0/sx3dqoq99lLc
	Ak=; b=aHAL7SqMwNYg/IjbVQFQSC40jxxQ6vpVFNCUKSIFQVTAbfOlbjucEEKj1
	eBLKtkFo04Tk1xImXikXpyANCfAyu8WfFaF8lB+8QMIp7n0RZWWUdIYAoA14UUgQ
	P13waJidt9HOptabve4XWaObTkPfa8q94GCbJsumGnpwJkS87zYsxdQYgnvzRdzP
	bI0NxDqwFOvD9peL2jZ2AvDfC/Ub0Um0MzTSePVenqggbnexgK/cMT44r1R+cYs+
	56DisGI/NZZF2Oc4WFb7rdCc2nAfW9y2qsAhiRvAweiXIloWx1vqoOzfQCgO0JMK
	9o+SeU4dNvxnEqqDakoa4Cs8Ia43w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvvr6vf6s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 02:11:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aq/FelryZG0bLtKp3lFda7z4Ol7jD6H0eQWOLpCXiyxIYXJEQj0Lcv55vnzQIDm+y6BUiCGIxgICMTjCUMm93L/gAJ16F37pGVLo7SvgrV6omo1CwMlyA8a/vNs0rqaogI/hlv0DQ3j+fJljDYvkG5SP+Igq0j6YIhfpaeHYug4Kd56ugabmDtH5G44XRKWaophgSY71Tus905/ZZavorAEc4lOZnDihmbS2BquPxcaIu80wq08qYAsjNsPLqZZsFCnpashizSx6OJRS07nVe1G8DfWFqvzauq7hC4EvpFETh/j60G8jL2ZxWXgjtj1rWkpnLZmZZTAhom5+NKYjwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A6n7SiPOKjzYLL6gFqGKWR8utw0/sx3dqoq99lLcAk=;
 b=m7rRb9+YKXcjYAgA80MATextm5TuSIG2IMXab7MLzVX/yMHiA6biGdPNog5XJelIvBFdsqRFuzQZwUq40DeLCiMK0aa/20TApVOfZYrGWOsXfse7AUQPUjc3I8TU3t+sFJEkeke38d938auMRXIMdjesMeTvpHDFaFbIAp6/cDAf73uuOIV9WIJMGfBScGQlkJ4qA95Ek0Mxkows+H0e93P467a/aPUg6jcfFU5wO/nSEskKChbIxmMcgiznx/z99fv9c0cPn1E0IH1m2DzTWmcJcx3hvIv/IJ3UPIg+HCZ9vGkHDVEvp3RSuVXTX9+eAAI/dCanGlW4dbp7gBKrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A6n7SiPOKjzYLL6gFqGKWR8utw0/sx3dqoq99lLcAk=;
 b=hx2eJnSt5eTFVKImuNlpmQ8ruSN+KdcEasCKSorOEbsgTzYGp95mxw1Rfg0khQP/Z201EnNZdulgPb1m67EqdM8dXSI89y2oLgEZaMVoY8BYJW2fdhekIWyLglVK3Ung/YGqkNr8nvluVuswanOZ5f1kBGcmTMcz6Z2s20QkvU4=
Received: from CYXPR02CA0087.namprd02.prod.outlook.com (2603:10b6:930:ce::19)
 by CH2PR10MB4214.namprd10.prod.outlook.com (2603:10b6:610:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 12 Nov
 2026 08:11:34 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:930:ce:cafe::62) by CYXPR02CA0087.outlook.office365.com
 (2603:10b6:930:ce::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 08:11:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 08:11:33 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:10:59 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:10:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 02:10:59 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC8AlaL1453305;
	Thu, 12 Nov 2026 02:10:54 -0600
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/4] dt-bindings: soc: ti: Document the ti,tda54-mcu-scm-conf
Date: Thu, 12 Nov 2026 13:40:44 +0530
Message-ID: <20261112081047.1550471-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112081047.1550471-1-m-shah@ti.com>
References: <20261112081047.1550471-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|CH2PR10MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: a2165cf5-18e4-4201-2a2a-08df40949090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|3023799007|18002099003|22082099003|6133799003|10067099003|13003099007|261021121427099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261022075727099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	OOpMMUp5LncVjwzdsT77WOKW5EuIPUypq/6B9BsuYu4lQjOUWXr2AJTR6/cEO8IfO0WcnvYBktYBs/54owUXGVeiUlBa6CcVOO23vdAb9lp2JgcoDjxuYPg/qFjCPtEb/ULNTvZgIzzGPfr11reAA94hV5LvIJ9b0Xhvty9lHKLrJw30oODCpBDAxSkYvCdk5PzMX40St88bSza7NZDQGsnh0L0jep3MUf1Ni/L3vodlMx1ATEFb/xEAcDg4JUlpJIzy/FM7TmaZhMWBomedJphR2gOALMLTFRLhSUMiku3olqQdD0NXUeLwdsrystdS6s2Btg5MRu0BPvZW/kjEaKwToVlPUC2pMfyXfP2T1BwOLURuesYo8FhBW6oYXlbFfkD6XAmv3zpqURPnfIoz1apz+6fCGGouRzoLIOBv5RXE3zEICG34Hk9HlJrf3/5lkVAhwh5E+b13C5761xUYzVzuyZt7+NbYB4uyQiHIV/Hk6cNfZBGtboRpkCCr/yYKDyQQZsBT5JkYhDBf96GKcDO0u62VMrK51rAjXBmoNq2rgBMtCxOSgq/CRPdQqNEd1Vic+eGbkh42gmG/tR5c4kU70fyomakXWWJymNsGHdi8jYbZaxVlpc6QogmAQNyowAi7c9ers0NdAv1+zUJfNw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(3023799007)(18002099003)(22082099003)(6133799003)(10067099003)(13003099007)(261021121427099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261022075727099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8hgboXyL1fz1q8j3DgzNuTzxa57hq0ctQK2uHzYywN6YupQTJeGCMphCXa3X8J+z7JjP/Usuvw2MGVwREXQBUYrD2QmMlRIhirD/oSYNGLhyueueVJtjg6AU2LLKznhzORXy2x5mPraw8atLjjP/XFOKlzpxsyguKIgqitVqp37/kSCsuv9wUTS/ktMlm+N80t75+WzGkn0U0IaMB85OkuoQ+ZQsyUCyeK7ik47TQNx9WJpgJq08I2p9g9A+/z5jiE3gh8HAlEjcf/QuDXSk9ZsSb7qLQl1k3/latIrPRMEBHcW2SQ9m5lNEYUjXuJa4V7ugAxSLd5z7HNYY66Rk1lcpz1KA6CuMFJCTEJ9fYS5zw3boYWxANCcKzTq72MM+FCNjt5SuXc/0nXDWphXu9zmwCMMq1BQfKUJk8mmLSlA1bdXEd7dsgSVTCgp/sYRT
X-Exchange-RoutingPolicyChecked:
	Vc7NULAsJ28aAJAZuGKLT6FA5OwUjlMPm+Z9t3D9HCSwd7ISM7RWRIuUQwupMa+9XoIt1olMKIngHSy+eTNYraLw0eo63RxbY94akfhs0C+TyaGDSo/PO2RBcKQWIhIyfdOK9DAZAB4kzp1ecvfe3uudlbjjK7KrNfztsDf7JJKbLV1Es2jL++2pty+TpvQq5YwsaiECH2FV+CgVPXMUfcLutIWqAeytQ62siGfikXhV9lClWu02mBOF9NbCAPscyYLCmqpOs2LU26S6QCdm6rk4U6J/KyzTm1m5wlTCn35PuxFAWCQ1VdfcVOMn0NOPYbaP/4zeIfUP+LoBw6JGDg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:11:33.3810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2165cf5-18e4-4201-2a2a-08df40949090
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4214
X-Proofpoint-ORIG-GUID: ZweD6ZGVxf1u4IyJ0OA5qB8Xgpzkh0Y5
X-Proofpoint-GUID: ZweD6ZGVxf1u4IyJ0OA5qB8Xgpzkh0Y5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX1ZA4zcdoi0dk
 nT5zmGUE2LAobXnSGil9uDsLlN9Jo85EInFQUKT4ui1VArv8huj9LVsUbYYl+umagj8i3CJsH4E
 JAR+qaRLHC7FlL5GNv9YFF+0p4TopiEXjKRQi0zxmjfq+zMX5DnaRfl3bB68zf92a/qTtwwTjJQ
 7tM+PWLE5VFlfTah0PgmlNpu9JaNQYzNPnQy5T7hZduzeQjmdqgJUu12eiturqv9th5zT+jcqMf
 MS63bddJG3LtwOBFn9nefUyOfX3hQaCodrOPCRBiSjG1Rx0S79pjI5vzKvamJZIMR7qzF0vDCns
 qLPNMd/SrBPp0TxMsbTbOEVIh7OAWL0CVXDkVZPNYy5sPj6FLHJQ4rmPZyV3LzjJ4iQ6NiMtIrj
 YK6HS7EHILZamkeHvMGhNteEHIG00dAoTcS0y4xx/+nSw5Vkm3dDKrKJglWesVj6P3X/yBrQcEc
 11s+L7iAf8XEwQxrlMw==
X-Authority-Analysis: v=2.4 cv=MpLHeGae c=1 sm=1 tr=0 ts=6af574b9 cx=c_pps
 a=Ba9BPv0Mt2atAB5a3SkMeQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=d6ZLZpmnShrUSTcg_4IA:9
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX+XZqHuPtwRg7
 75TfgBJ1WIj4Z7YvdXaI+BdlMHPh0O7zbWh05clC/zL+wXHwTB4c3GHk+OvwGfPO9Vw2NUOuRDw
 7K74/LWcTUrc6Q4ewROtuyhi0eFu4uU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120032

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

