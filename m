Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C1C569F2A;
	Tue,  8 Sep 2026 17:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887808; cv=fail; b=piqGHwZckTOZ+ATaunfQN0mHwm9jPeystiuoPL2PBsH9+M2GF+8lj4fxcNdjd8WaliL0RGcMxX7Do43FvzM755AWtD6eb0WCP+EzqhK/yvOu4ZIg/Yl+3npuolAJVtXAjssGjaSE4qetglD/IpBFRE9xpeOX1CPmnw3IJqHjqrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887808; c=relaxed/simple;
	bh=lYoFFsWzGm9pqwEsRqIyPgIr+qcCJNZL2xpoBGKxSy0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVX288+57lmxhTVWPZ3b7aUTlA4LvUNUj5uFuvE/3orK0uVBnDdhyUwX6516TbxhmJY350/2d2HQJLfzEFn9X83j3DYMkP5AQ2nF6Ozgx6MitruaUrEpB/PNzn7WRoEOZ9ChJ6Trtas3QfQWdf9XmPWahjrxDDbW6qdyIY4VcFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=cLEax5Dz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MpG6JFNo; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="cLEax5Dz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MpG6JFNo"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 688Ejwwj2032955;
	Tue, 8 Sep 2026 12:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=ATiXsXtXzB1U/ao
	PwnnVlcNPE6+RcamDQRT86DiChxw=; b=cLEax5DzbVCRQfaySdcD+BDgY0/xlYG
	XCmNIA/lgNjpxTGxCJYI9PKZ/eJYzcMV1mmoqQPKcRuc5RH6xtb7e58U7m8rG1Yz
	DyAtBrYHjr9TNYgOHLwdHzTVJGMZwcaPyciUJACzk4mXXV19LQwoTTfNg4l29oOc
	M9Hv6iuVlG+tZmYTUU0KZ4GtozEQX2BjChE1KXUfU6riG6Z8OJBGUJBFiMqwLm5+
	weiXF24Rl3USI0qO7c9tnpzc0gRGvNB9sKk4snODBZlZA2xEq1GVx108xMNMiU/Y
	rzJYkJmqqcV7tF/ZdOu+v5HA5eyELWrBSiIqFPxr0uaLef+1ZXWGLgw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gjffmtykj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 12:16:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZBTQq2SpF66wl3RE4DOJCMBoRZ5LALJuUSceQqOy20gnslLCVI24ip0RNGogZFytfDYFTA5JtRcsRp5K/dhbamy4VQy8EoJShWOLAukWb1X3pXpwb+6zn5SG/4PsJutdVIZdQ1nry0C8HJtXL+aAHy0dFhK7UAP/UfO7vfHkLt1IcZLFsHj8Mvvb+BTviR9ycEQMJ/7k988gwDHo39gOrmWR6IDiOvfJvXI9MzwldUHBlR62LrVUNdr0c88e/DtLS7CsYJioSUfdSk2Yn9XlsWLlkb3b9t4OSp85TIitxBHKsGrbHTMf0J26vNj40WxrdemLv9mb/7gzhNToJPEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATiXsXtXzB1U/aoPwnnVlcNPE6+RcamDQRT86DiChxw=;
 b=ZFIGxBh2ZFodcm+0ZdSp6F++ik/qz5vOKpzTDznmChU0+l4sqMlmlVJHts7u1ZX937QOV2fTCuvnjfxIu8nnh/ltzMaNX0dXKm3FCAVcqsz7rI/cMHLTcObI3xCNAc0o+yl393STcKo2FGPXNVa0MmaFA8qHTa3zyuXxSwGviX0FcdfGCmuKF8H+WbcQmLBD+7scK/LpD+c1GIs792RaHhXMj5rJbeYg0reEUTXn5lZR7eW5/1/Ikkx9IiETECVEYuSuxKUuZmAsnMXzpdeaknF8us+++cDFeGhsaDdZIzXoN1baAS7UaOUuqrZv81YhfKkxgyiyZib6hispTZG5pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATiXsXtXzB1U/aoPwnnVlcNPE6+RcamDQRT86DiChxw=;
 b=MpG6JFNowVaSnZirhuiFpN15YfwvflndcVf/E98M2eu5u2BtawzWyyHg3y9iwoiPlMLk/VLQSqtX+KfoXnln1PD3UYVElhQqeCcr6fhns33XO+p70kwaNNJYwrpvIVA2P4hkg24WOwxGJSXX412ps7s1TBB7FMLfyeIRq41S88Y=
Received: from CH0PR03CA0052.namprd03.prod.outlook.com (2603:10b6:610:b3::27)
 by MW4PR10MB6323.namprd10.prod.outlook.com (2603:10b6:303:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.5; Tue, 8 Sep 2026
 17:16:34 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::a5) by CH0PR03CA0052.outlook.office365.com
 (2603:10b6:610:b3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 17:16:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 17:16:33 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 12:16:13 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 12:16:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 12:16:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688HGDRq2874254;
	Tue, 8 Sep 2026 12:16:13 -0500
Date: Tue, 8 Sep 2026 12:16:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mmc: dts: am654: Add 650ms power off delay for proper
 MMC power cycle
Message-ID: <20260908171613.bpd6eo53cjtlrztr@macaw>
References: <20260908170635.238775-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260908170635.238775-1-jm@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|MW4PR10MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 182c1198-16ab-454a-4aec-08df0dcceecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	nN7KgazA3TTERR0LQRVATTGtXc6mLG8OpDhlf5RAVOOrLiU4B3O6tp2GX4TVFycfFtngkZrFrOSx0Ys2IAJcnIQJ2xkCKTM7TqO+mWRKor3Vr4njck34ZZKd0iesgSkYoxEI4JqTmosrVq4JQeT5KgTCvEBTsXdT/nrBig2SsnXSbv7qfU5/apXsWZlz4jHIZNada01f1rpRWKNZ3ZMPq43+qSuy9cKIEStS5/lxkHIgbYAhJdN4UhkXUX6GWjosLhMDwfoi0qlcEcVL/IwHFFxL9KAqL7DFQXg+UfCLrgwhrXsnNnm0xvbq8KnCth5R284ZoJjMr2ooHNZHoltpW2rhB08usLkld20NcCdWeqNrugz9X1rhW0N/h1JtzyuVy+WHR0DkQppeidYpmomyqvD/tDLXmXPhdz1EqeC/hwuK6Go51bRzB3C7AteBM3JXdPguTHDPGLjKsX07ySkV4AWIBBnYtaYCI3FRsCYJRj2yMXDtlhWlKfqIPik6hTMl+tjxdCYIylrHmyxUHVrZUMCxUox6ub0+E6bcYAf5Sn9HfW4hxqiagyJjn6XAj4HiviNnqCtJHC13BHBD36xE/siedhlsat9/Vx9cDiI3yFJ/6iBVZiipymMEAF02zwDjzJdoQRxBNkcue8KTethtdQj/tx5MItJQXcC7EB5TXTx2rqZjdjUAQO6VBSa3XZmvTEV6cRTF9V0iylhYfMgltA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hlfRhdSyNqVvi08URSJMrYBI1yarJKvlSZvEu0PqEZlqtw1EPXQqztW1Uu9/QrtIKexNpKes3WMKp+ehqatZ4DZoaPV6G1RsJy+UQhzJeTsUbAblR+plPl8x4wPdRL7h6sCyp5DXwDtntL35C+eQhXFAL17QKQr8FooiuSmgV8Q+qCYBalONE0vHmkqLOOtGQwJlu06gvlXRyC/RmqDeMWKftjLkg5gWPB56mZJYPYriJ7i4UD2xZAhmnwETtMPepvG4CFc501BA8L8GcxwsOnnDO130+vtzsmtqJW4nujLwbBbBrTvDX8b2VHV+wm8mZDhQvGELtTadFN9eT+RiSna9SGb8UL+Ku2IFI8/IGSGXm2vtE3aJb+AzDDg54Jmo2D8FKbKhjYPYAjcoNTrlBSbVI7O1Ll/bCHk2Ulutlfc3FhmG9Uza2mkSyVnvh1xN
X-Exchange-RoutingPolicyChecked:
	nD2Zv36ywppa55fmnmJUqwMiVtV0IxXRWCzXM4AOBIOBUmEKsMQ1IJZtLNuP4ckoLxVUwnrqMZsKKIPmD7JbEGJ24y84IBBhfX8OWu38AJacjzberSiycKFkE/fBccbAmPJ5IUFumorZyU93wSD66hSdyflMgzWyj/9w4njhAtQdSh7pC5AT1yk7b3KUtf2W+HHukp3NdqANWBFJ8dHBQVCHLok5SaMC1FXPesGjFWIULX296d3AOoXxqgFBmDPCjYx0fc5DTM73iXgewfeH4whpZhnUEP66JPD+fo7f7JdOu7HANyj3Vyn0dH6/M4/dcN8Rtl43ZXK/9kCLeaeCKw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:16:33.9855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 182c1198-16ab-454a-4aec-08df0dcceecd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6323
X-Authority-Analysis: v=2.4 cv=FewHAp+6 c=1 sm=1 tr=0 ts=6aa042f9 cx=c_pps
 a=awRqKgK+okXhs1gjjWqUCg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=dZH2efQupJZS0o7Nb20A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: T5GVsjRkxEn9on5OQiUh5HJl5x16QspX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE4NSBTYWx0ZWRfXwva1D0V1H9nR
 DkHlnp13p4PeWcMiaCtgC4D+GTCRvWsuskiflZfR62ro7amOgdyWnMH5LbvMFWJHlZss148ewgR
 YUM6dWT6fZHyxCXqMoF5mqUgjp4FF4xjoWA31hOWL8XXm8xynV4w6ECB3I4j0CDLPG4g2zgYwzx
 YL7oQR21stdd0BTFoobs3LNMMKJX1ltd2Cl5tlY6k2B1y+whUVtVQjSbwuBGJ7gn7kOZNaBK1rl
 UKYpSM3fNhN42OM/ZxB8Oo9ZEi2NIAFzJeeHeytay5J8xIzqubgVfGmSFzvUtlUfkQUL/sZjqws
 goDxgniEmeU6hN62i85DeQns6hOyZSAfOgZlK9Ghf97Gm/Ar5U1Tq3Yg4cF79+U9ZZKPm0Kp8Dx
 7ijs3dSM15YRGJ8D6lSrDdffKZnCu/GmeqiWqPFql0LM7NXbZ0NQx+IRz1a/T1bN4SxpdfGrBZ5
 88lkJcYPgrdfyT6GCKw==
X-Proofpoint-GUID: T5GVsjRkxEn9on5OQiUh5HJl5x16QspX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE4NSBTYWx0ZWRfX0c9iv6OlTCzz
 /sEdlp32hlKedU0jQBAp56h4+fduLt9mamf5LVyvbVgT8cVePGnYo9Aoh2hh5q+LZN5aRJ8cZNA
 peOwGYtdhiHl2P1ofqMLvUnoPHO3crU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080185

On 12:06-20260908, Judith Mendez wrote:
> The AM65x EVM MMC1 VDD rail discharges slowly through RC circuit.
> SD spec (section 6.4.1.3) requires VDD < 0.5V for minimum 1ms during
> power cycle. Measured discharge time on this board is ~632.97ms to
> reach < 0.5V threshold.
> 
> During boot, MMC power cycles between boot stages. Without power off
> delay, VDD doesn't fully discharge. Card retains 1.8V signaling state
> from previous stages. When U-Boot initializes, card no longer asserts
> S18A in ACMD41 response (already switched to 1.8V). Host misinterprets
> card state and forces 1.8V anyway, falling into a bad state and causing
> a boot failure.
> 
> Add power-off-delay-us = 650000 (650ms) to ensure proper VDD discharge
> during power cycles, allowing card to fully reset state between boot
> stages.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>

Fixes ?

> ---
>  arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> index ca1300e130936..edcf039ccfbd0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> @@ -460,6 +460,7 @@ &sdhci0 {
>  &sdhci1 {
>  	status = "okay";
>  	vmmc-supply = <&vdd_mmc1_sd>;
> +	power-off-delay-us = <650000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&main_mmc1_pins_default>;
>  	ti,driver-strength-ohm = <50>;
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
