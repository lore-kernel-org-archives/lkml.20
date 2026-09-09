Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9985427EE;
	Wed,  9 Sep 2026 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952972; cv=fail; b=Kq7wCwP8Dvk3NLqkDaKQIP2cThLbR4M7XuCygEPjpAdwVUmHoeL5SI1gECyArt3kUNBSPxS9TEsweSOAL1HLiHLlo/U6n5hxA58erykuoeminoSHxJH86ypw5MQBkdJZJcZgQv+m6AgHuhIs5+hmRcs5hJf1EbacIIWWJRF+viY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952972; c=relaxed/simple;
	bh=PlPb5DfDbHBU4XgpQgVn1mYtViSr+KS7d3Y/MceLT2M=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0RZkRKcD2ecGz3VAUpb4sqTWV5g+HNI6ulnyB3jgRIrHCpyJx3d/qEl7NpYzgw7esbmBn1VexB4SDQbFm0jpUqh3XbFp3mE9dn5qCaShmL9peojjcR0ye7HkfSVtBmBnUGJjbY+cSbQECX8CDTf+tihGOtXl0hd8GKA/CR0N5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=HMV7YV1L; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CnTVjK+6; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="HMV7YV1L";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CnTVjK+6"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689AoDXB182102;
	Wed, 9 Sep 2026 06:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=Clybrbntrz8xFd7
	gHUzTU64JtGTBa5k4qaLvxYuVqZU=; b=HMV7YV1LeKSN00GQLCJOJngaNenp00i
	AfKwUf0EAsZR4fIPztdbXX3CQht5Fa8IE/liCxOZ/Fl4CrNjKB3Hm2JxMWVlNyx1
	hV3pet9xmLF7X09y7PwOt7Ju+FgWJ3GAkSA7/nP+HuLjXXvceEqtkKlxtfhksMyh
	7q3DxAY5fK4wT6BNc/d1RQP0lBQcAPkZcaZ66CGcEcwOW9FurN2okvUwtA/RxlWQ
	r+omTvAC5M3mfQ1/P84kijlBNywzpY0NqxqlrZQAzj1KCQHmW9XJT9NrBjbyoJZb
	qtWQpATLdn/B2uscTeMQNUEcR6BXJSjo1he5ysJabRgGTKwKDbo7zQg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010021.outbound.protection.outlook.com [52.101.193.21])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gk4cy8ks2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 06:22:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2ioUdd09d0AUp7Czzh+X/p/flFdA20HrN0A/Rsvy6lkogI0DiBFymPHVWkPAVP/aAYM64FXfjVnaLBDICbaENbXgtnJLEsNmuklQjCdphYx6mQeYYUQ1+Uj1C1Lgs70TQaTPPojL7ol+mpVJ8sg78PT1h1qjgSGoZVxUNvotRvLgtmqc8RhJCaB5LyZtAu5h5emjiUbjrUxvuWrMycrl57ubnwjwfu/NBvzIAKIhnv66IzL2bJvIOwH2XKOwdB5hqkjYTFhg5CGDTXCFEaWyljAVqKYuaIj2bnphG4Tr7WZD3cGyUFxCivpebs7bs7zOZiG2sqHfnQBacoygWi8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Clybrbntrz8xFd7gHUzTU64JtGTBa5k4qaLvxYuVqZU=;
 b=f4TgBIAuDFxb7JwaZnbTnoCYlELWabK2G/8KR8V9BfX751OCkjZ8+lNmkCtwjGNhoB6k6vA3jsEbtvdMM/7mYJRBR1bH/ejGgwj1+XOHxOAJwt9ztAfDmYMXgAx4gTukdZEX84XWVtTDxnDILrnXTX3kHaRO6CU8T4UthPxsyYctK6Pf3l1ZZQe3ysqi74QXg7pIPyc2rC/EIUu8L22sL+Q+oNOYzadAt9jwKFsl1/zVDep65bP++j0xyHM8i27DNwjAYIvchzUSnf8Lk2qbeU98Q0I2XkhSnYUmp7PhVnhXB+E5oUOtG8OEzEgAMovi4NSQQgif67zjR31anEaOmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Clybrbntrz8xFd7gHUzTU64JtGTBa5k4qaLvxYuVqZU=;
 b=CnTVjK+60R/gZbCROrG15Jv53cD374NKjfwTjEPIWIVeBlw9CG1F2uK2pV/Ge66ijvtx2zu91EeJasu6TIh+tNwrsex5XjpPRfXHXRvl922raS3twIRMd5D5rklFmCCz1oqWaPp9KKGPRuRPHbDTHkb9U1J8qaSnf1z618eFq1M=
Received: from DS7PR03CA0038.namprd03.prod.outlook.com (2603:10b6:5:3b5::13)
 by PH7PR10MB6335.namprd10.prod.outlook.com (2603:10b6:510:1b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.5; Wed, 9 Sep 2026
 11:22:25 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::49) by DS7PR03CA0038.outlook.office365.com
 (2603:10b6:5:3b5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 11:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 11:22:23 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 06:22:12 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 06:22:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 06:22:12 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689BMBX21174249;
	Wed, 9 Sep 2026 06:22:11 -0500
Date: Wed, 9 Sep 2026 06:22:11 -0500
From: Nishanth Menon <nm@ti.com>
To: Scaria Kochidanadu <s-kochidanadu@ti.com>
CC: Kendall Willis <k-willis@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <a-kaur@ti.com>,
        <s-tripathi1@ti.com>, <vishalm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am625: add standby cpu idle state
Message-ID: <20260909112211.2zckbx2omnrjhkwp@scarily>
References: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
 <20260820-upstream-standby-v1-1-6a0553b9713d@ti.com>
 <38c8d72a-50e5-44e2-a196-fb6b9f7530b0@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <38c8d72a-50e5-44e2-a196-fb6b9f7530b0@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|PH7PR10MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 0111760f-57ce-46b2-d6ce-08df0e649f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|4143699003|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	ElAB+K507UhwJAYc94ioIYRAncq14eNQox63pHx0XylwDpvkANZ3n9HPjguPKhlvm6mwkLOMeqXsW1Jf2QFj0IjHGPBG6DMPfJRRGaJfueEdH+oxzwhZ+tISnGt0tbGdQpEcFktomVc1jlA91qllZ46lqycwrVKR4/3UPCR8lNDN+Q8nz9m2FoTStu555IAVyvn/UPSXgxsWDEXOdSflheHqVfd9DEK8pSrVv/wVm6XPrGeqB335gcl7ooTUVLwk76vd6w8eS4scFfhdusBMkyykZbmnSEIIWLtOzAbasodBZHG2CIzJVn/36jscOSCaIXrfvpYnO0StJW/k+3e0OznrYFNnAjKiXAwsniKyumeniXSFMrgi40QFpTqQ4iFcr8R5UCMbKWy5x164fMDqCEKfTUO6HYxWRefFYELx5t2appojjNyB3iy2cgbGKUE8c3G5gglyOR39mn4Dcn8FWwznXLx0r3styix/jD8lLdEFw3UP06a8oHIir48WWsQtCLmKIhBE7uMhdnFWWlDkQA+IPKJsCClPAAx2mEOibu5x6M4Inw5ueiwunMJtB10i0nufPBSxxx8qHn5f0o2ioAu65J9nQLRwm1TxT7BYZ1fjFkLGnST4P+S8pEKQOdaDfwAQYRa1XmtViv7FiC2p14bwzK5TqTCr/GKR/+FLB+mZ14jVRRBFWXOnSPVxzqYqpRKRerS87dHWCsaMh+qOLA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aIOgeWkgUNaFvZh/QSh3cx+1yl9JWumjSSTkxBcyvBpcBPhWH8N1WDy96qiQaGU4g0xB7fWgcIzDHlPuim0MCRQqMZEvpwnXl4bqA4Ix5wUe/rhmOxNvim0h9pglmMZHMp28bYJMumX50GpfOb6UVqwei1KCz9/QqZXi30givRMWlkW34G1P08Ad8zXxO/nJT4Z3+eCv7W9B6+6YmK4oTFpUASLlfnocitZk+nWP7oCvZ7IiKFRXR/DOOpY2ebGJAsKYe6CAcr8dXzjLbWnGAKjj/5i+issDTpnpxdFSey0JbrMU587KDUw0s+ppX3cDSnS0vfQ17yuMn5ZKihf85rGPDURuAqPtWZGr+QsspPFx5FGQM9AdTqkGX4CxH9tSI1hzCzh8CKveO/mBSbO3FoUuytUrS3LxWCBs+cBMNhA2ngQzUT63zi2yVjetiqpn
X-Exchange-RoutingPolicyChecked:
	HkXYpreb0W5icjhxYYqnIPodBezThZoSjhhv3zPnNjZNo1IRl0C8F0h3tCyq5b1Y9C1qneIQrhzBH0BZGxwhkh2A51zpFzYLaMDJ/HFv72uEWCOGftlkyr5r2PZqv9d8mUJ8erigHuoSnPR3j+Pv2HtrTFUIXoMXLocqtVucJ9pBuTXbgaPyCYEcE27yTG4GJKxkmNDLy0IFip1YOFLNKdiT8Jcc0Yy3wNRgPgMTKxZ2AKuAgF8G9KMZk/E+7fNOx8WKzpax1VGECNsZKuwyYF1F8N0bWk/aoxKGfRc9lJRBsSZ2XCeRwHF0m97K/PG4CaiwH2rfb/MbisXacMXBVA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 11:22:23.9991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0111760f-57ce-46b2-d6ce-08df0e649f3c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6335
X-Authority-Analysis: v=2.4 cv=NPHlPU6g c=1 sm=1 tr=0 ts=6aa14177 cx=c_pps
 a=up4QpmAGzzRqrgyk5KT4IA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=iFTEyczDGvxaJNKNb94A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: Nt6ZruBTAapNtjZ0EYByImeuR_Ia18hV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfXwt7lEqOd6SWN
 9DzjZ2/0mOQubp6wk7qrNYMC6sFDieL1c3hNAKLbn/Mn6DT9O3o7ESESB5oWW5VqBsevFDJf/P+
 r/qjehsNNB57Tdwl8RXge2A6NPApF5Y=
X-Proofpoint-GUID: Nt6ZruBTAapNtjZ0EYByImeuR_Ia18hV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfX3IDMaUnjdl03
 cIzqGY2J4WbxCZ67aiNwC+h81zNr1vzwQY7HYlv5PyCahQn6fP+RBURZTby30rCdRuFPCsnOPVf
 dOBBeH59Z27sjNE08OcGhPtowJMWNXKOOuCxFX6cW93QJU/ay7yfg+fRJyOFQU5bjoWP92OCrOF
 Zo9+4eRUK//dkIQTA9U5E5QCDv9rZqN0NdzFhkEz80S60ozqQNH9P0Or8sah+sMweE7DdEEsGVo
 Zf8NcIM6WRGdSmRhYC7Rcn5e8blDqCQ0pZm5Nh/qrOVkcr2Sqf1xFH39nGdgphIYGhu6uh1ZMmH
 UZSmPeqlktHrFzxu4Z3UrVJtOZuyu4yAqpFNvQ7f1VdccAWTXaeC/kiQTWUYfOAv1b1Lc875Dfp
 /3Vkm8iTY8PKBMv7ZyqibfZMoC17AYXGXk5QWjV8ynBRIdGHbxB8GCsJqbOhE7EGAFF5C7sy7GD
 SBqh9Ioxh32hKnMn/Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090126

On 16:00-20260907, Scaria Kochidanadu wrote:
> 
> On 21/08/26 00:58, Kendall Willis wrote:
> > Allow the A53 cores to enter standby mode on the AM62x SoC.
> > The standby idle state enables the CPU cores to enter WFI through the
> > CPUIdle framework.

A very basic question: Default Idle in kernel *is* WFI. So, what kind of
savings are we seeing by explicitly enabling a cpuidle state that goes
to WFI and more importantly why?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
