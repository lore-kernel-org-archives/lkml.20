Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA344483A9;
	Sat,  5 Sep 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612607; cv=fail; b=VFtJP4ODHQlV0XSVwtqQP7u1Rhl1qAbwED5JSKFrW7lCc81hoebzfvkcwDPYWWMmD0jplTPXZX4VLoMI3CbajLbsQ5NGsdofdYUmZO2c+IY3krhjtGs0v/uNQOLF1G90oC12f7tjp28iy7m6eEMcJ7Rd5H72tsJBTTBuAWuXShE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612607; c=relaxed/simple;
	bh=u2Cf8Sb7lsj1eRqcIEPTy8+z8v8LnedsYzlunnrXTC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=byfHq+6pxFMLVEojQ54RhJ+jH6sQenbT1magNDu8DQIJ/ju1M9Z0/J9lQQm1Tgn4oOomgtbSqaTVnDdkmgCdzhpMYX/V/CI4cytv31e6oAYZ9h7p3uxsAf14QG8Nq746zLVSe377wCxgBgi6OFWOUH+vju59m3mTfly5f+oNx90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DSqObyuc; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qU8SYp9G; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DSqObyuc";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qU8SYp9G"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BULhg1885438;
	Sat, 5 Sep 2026 07:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DtfAObULRIIxOluWx4C0+rkgymR02M84fVuL4a0OZ
	So=; b=DSqObyucIrtBNJbByuC9Rc49ioGfmAIEfe2f/pDbTz21rpsUy5ucnv8Jf
	rw79S7fGzHfSxR5V56DXXmxMvyafo/OyZKapXfzZMio53ICCAkTmINNd2XfucLrT
	wnnxRPHmzTWQhjrgMd1wTbkrTzVq/IgW+/WL6a1KJsPkQYv6Dqdxzi7GYJTudJ46
	FL4Rh/yCtCvL/mlCN+fol42o2DEHq7hPWIVv+soiQg9eSvRTE/b6gLiBkejjQfPi
	7bzhSstJgzUUUjOS+80CJ08TThYI4Tphl5k1CxI+WcvLBCLVI1CMGmF8Nn5cUbku
	OJBNJtQEgNXlsh0eL1ZISJBLjh/sA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012048.outbound.protection.outlook.com [40.107.200.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfyyq5r28-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 07:49:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeIPJ9lHwYUmy6TheC4hwc4QF9F87jRruqFO2GYnluJ2zRS9K6RQ1UOBGlvLjsADuMch79k8yXxpcfggsBDcUFMWPL4jTIzCwjXnn+1/0fMLY1IPiHHAkhbO6u1GioAJUlSlMjDRF4KP/YfsRQezwcpUPFC6YYoAetdmgiDuG45Bb6vJCg9jAgHtmhiIJPJnPM/toc4YYAlfjtolupiJ49qlvh/NfkIzVY0rHQmXJrU9oyi7baGNaULCKBolnUJl/zdU8SC3ByM+rAarqTFHm5w7L6neXRk2R8hFlrJFto3uwprZNxFj17quwgWeMVLkRJjDi+3H9HI3RjOLbzS65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtfAObULRIIxOluWx4C0+rkgymR02M84fVuL4a0OZSo=;
 b=O8ibgUYOiIQ5csUgK1m6b7FHhx5VC2YpoEZ7VEg0YST2CQtzEmbHkLfUa8mkKAkawzfSRH8gu9Nasoq7aChK6k0s60JpzKMehuLXt1sjgG7PfajTOM+TOVqnlYwoxlXjtAD9YnOcWU5pvz74uoRcbYGE2M51nmjC61g0DT38yKg9Rf2sg5Z8IgCvlO/CVGxwcgwqIdXDa5YJRQbC88DmM1oFAN+KQ/HNCJI3P3g2KhDed1KbdXXSfritOspilrvdVQRn2gzrhTDudUD3M7p2iEL614nwNHJqwceIwIZvgKrCKKtCDiyQfkHRdFq2pDMNqnHtTGkOZCPZ0cLR7POzvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtfAObULRIIxOluWx4C0+rkgymR02M84fVuL4a0OZSo=;
 b=qU8SYp9G2kwk/R2rbJdHiasEzWzuH2/ZmpdyNLjlJSTynnWBXzVXniXLnrZ5GLrU8RzMhQNevmQXeHQAPEZeBj7Y09XZ6JFJdqxOv6EN+JFc2AUKy+3IDtVixAwm9TCov3ZO+otHIeBTpvMi8dal492I+rigNTJUjCtMNvS4bag=
Received: from BN9P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::33)
 by CO1PR10MB4660.namprd10.prod.outlook.com (2603:10b6:303:6d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Sat, 5 Sep
 2026 12:49:51 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::af) by BN9P221CA0006.outlook.office365.com
 (2603:10b6:408:10a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Sat, 5
 Sep 2026 12:49:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sat, 5 Sep 2026 12:49:50 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 5 Sep
 2026 07:48:16 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 5 Sep
 2026 07:48:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 5 Sep 2026 07:48:16 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 685CmBSo2186145;
	Sat, 5 Sep 2026 07:48:12 -0500
Message-ID: <b5dc14b2-9b8b-4da5-b48c-274bdf6581a3@ti.com>
Date: Sat, 5 Sep 2026 18:18:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Assign SRAM to VPU nodes
To: Brandon Brnich <b-brnich@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>
References: <20260810205206.685971-1-b-brnich@ti.com>
 <20260810205206.685971-5-b-brnich@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260810205206.685971-5-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|CO1PR10MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 452dfa32-f64c-42d7-63c4-08df0b4c2d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|13003099007|921020|4143699003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Xk5SCw7lmufioLfOR3hpAcaT9dc+C+7fowj710ATyjmtzP6HuYycdcTWHxa0UBw+DEHPeD4Tys8V4lLUsShbcvwOnSZKSGVAy8UvD7w3j4lK2RNC6A//8lomawcup4i2oMSUhctpye5HSZCsZpq+hhDC5pSe2/mZm4fEgpyYIZaKHqPNaWFgsiOJdSo6KocOve6T4WQJ0PWT088FgpQkrFvzCwP8sE7t4RFFwItXs7awrjZWDIdW0A3q9C2GHmUt2DGPteCa5lJPo7tU0WY1TeLOoVKVQ64BhxiSlon/lsymzY9pAECc0gaUa64QXX6QJUE6IKLtSK8Ddr15UnF1N51m60e+dSH8iJP+qCCT4PW5L8HqMPAytKI3fecjzJFmSVky1bR8wpzqINtwYF/1SoSjMdSnoFuP+M+DZvVAbfh55tsX6mTYU4kE6bQgI0MhwDhzifZQE4C1Z88UxR6pBKWtTimhhkjeNTpuhf/OT36DokgWTnRp9CwpPHyEfM67+Prx2crvF66+2FELrQDl2FC4ybbIxOpwO1CaRnNEZAQXWy1U2xFMmRob+jbrRLI6QrSirtzObCrXV/8sdpDEEc8mCYaTp7eaMbE2F0xEuVC3T1f4gEbt7L4Ez/cvx3gPfDudmYJ6chU6NMbFUCFKu2NgMcuK6wx0P04T69ZZ5HFeLg6Q+Hst0CRXwvnhi/1oP0vgnDv3qU06FWGdY/QphA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(13003099007)(921020)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x8jkhELA5XK4gDkzIG7A6k4d40dybJE02ROexvyVhS2S/L/9Hau7f29bGigt5sxQjEQOOT9VeP8jCK9hng7udHdm+/GBevK+C6kvK7AhEXkg4K5YofW6rT2ckzZ/4CGw9ycmRQ5rpng6qE2rd9mu15ce4UbIK5X6xN3BH89XzS7ZpVGnrRBnvsfnaietPCSio9zqjlkvgBSPf74Dxx7pnR2dEHo4eRkTcDhA81aJMsa+1z85b4YiKWOWu+Ci2M7XQTmud9Pnn1IRmO8PuRbfx/G0Ra5bLzZyRd9OA6K9ZX5O3ecxaWcrcCTrRXhYThtBpgSHhfuhGi8n5C1RGiimtL4Ie8FxiX6ePvC/MecYTVwBmTvr1LKuKchk3tofW/soObOfrjlU+udiiIUGwiQ1TDWUzLmSBa2h6ZsEB2PjoY7OTk62icu65E8eHz75gaPd
X-Exchange-RoutingPolicyChecked:
	xnu6CEez0RQzzeklSXmB/Z3D7ocvd+vzs4IzgV7uVOZYQqJVABuBYe82lOdVPj74l9eeUTdOLC0oywcKL0vH+cP0iaBJdlEgCzJT3X48RGGE6oywf270q/Jt9xjEQBBF8q3zuVqNFaIV8pmYcXr03l6I8i2mXTUuPEBZlzHAAttsPoSGsXPpg2qBFmWIT4TWnIUFx1TepEfT9KRJkYT2u96Ixy3H4zAB+FcpeJIg/MMoHQoVMlqMNierlJXMg3Qc5injBB1PHF5fhc559V6kN5V6LmCgM3ZQrJWmegBoTdmYrDu+J0ezldUYKVfVMtOTpZaPaPfqQ0fovdTQoZgMhg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 12:49:50.9523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 452dfa32-f64c-42d7-63c4-08df0b4c2d06
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4660
X-Authority-Analysis: v=2.4 cv=AfqB2XXG c=1 sm=1 tr=0 ts=6a9c0ff1 cx=c_pps
 a=JJStoDgKLvGmSPu1zToK9A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8
 a=rdVYSk_NxjMM21v4qsgA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: iT0RjTd-24WRSdl-ZpbenJ-T_SMTlwOb
X-Proofpoint-GUID: iT0RjTd-24WRSdl-ZpbenJ-T_SMTlwOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE0MCBTYWx0ZWRfX+u9nxWW0JHXN
 ezStrZ6R5EcVhoTqA6fRwqEfSjLzuKeM6BZvSaXbguINPYSfz+NFPzftt+g6dWcxemgNUWhmuSC
 GIo4JsPTpZzCwMUkRFL+rTH1g3GIbpaOrJC46/oUxC0T6ZrwJtUI6Rh4U3gIf54NmWsQisqT3Xb
 slIucCc7nmkcmYVYgtNJk05WA56+QWKsBLeliiiso3RsqZj68TGqosbDzx8QAsc4TtyhXs1uFYe
 T8RchjJQK7ArLVDdj2+9dEMgrUlAUy0NSvHZkHjNzghhLRzgRnFpMt389x76F5m/fSFcf5m4kho
 5JPzbofBWZYwg1TYYvk7OtxnivWOkpVPNtPXnAFpDFeXwGc+iYe2r4JD5MDW8Zn1u4OgziFhu7d
 EiO3feJFC8HAD4sbBllS3tf3UWErgQmP+U5bp7sVij9O/SIcZ7tz0SfaJ64+hEcB0CFFR2zkeEe
 YU2xJwvdbEZdSWAQd6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE0MCBTYWx0ZWRfX6RKL3PzuM7Cf
 wXttiJEut78PNkhXuHHgiQjBdIzcaZrQC9m/u4+QiGA9wjxKvxtGHMx+oU0mdzhSrl2AKC0bthu
 02gh1STtoCvZpMnTAthDpteChHOd7QM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050140



On 8/11/2026 2:22 AM, Brandon Brnich wrote:
> The Wave5 VPU supports connecting to on-chip SRAM through its secondary
> AXI interface. This allows temporal buffers to be stored on a per-stream
> basis, reducing DDR memory traffic.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> Reviewed-by: Andrew Davis <afd@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index e836f0f42e30d..21ec9f207ff63 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -1002,6 +1002,7 @@ vpu0: video-codec@4210000 {
>  		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&k3_clks 241 2>;
>  		power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
> +		sram = <&main_navss_sram>;
>  	};
>  
>  	vpu1: video-codec@4220000 {
> @@ -1010,6 +1011,7 @@ vpu1: video-codec@4220000 {
>  		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&k3_clks 242 2>;
>  		power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
> +		sram = <&main_navss_sram>;
>  	};

Hello Brandon,
Could you check, how two instances of hardware can share same sram ?

LTM, each block need 64KB of SRAM
https://elixir.bootlin.com/linux/v7.2.2/source/drivers/media/platform/chips-media/wave5/wave5-vpu.c#L463


>  
>  	main_sdhci0: mmc@4f80000 {

