Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4974A49A3;
	Mon, 21 Sep 2026 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012642; cv=fail; b=M00YvEuhUtps+BLMCLE+leny7+hxeZJ3fk8ulwmO5di/7kxCYbOK5bPKTBMPCHHJq7r/KljcnUVHNa2OeRbmanSWrpupSWCkz4ZfXNxH47HxNQVNNqpUlLnzJiJyMB4C56EEHTYW4GL2vo3mrnj2CTmoVlhlWKT1yIElGbUMDNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012642; c=relaxed/simple;
	bh=JrxlMwtpz8QHURNdhMmhT7vxgsX3iigQgnu7KwDIwT0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4gxGotFBKSohscsahzvGhvlc5+7Bl9hGbSpf/gzaxUqJbt4ZM19cWf9Y3Vc6lFkJsB5QRfvqYY3aA7MVHnI4AOE/nKEvm7EqvWqFLB96B6KunFEvs0G8lKQ8/vYh1utn6C/r1Slq3nrMbs6sEhXyUuHQ53FlmkkyYYiFKZRScM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=A777DHd3; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=a3YC9gLk; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="A777DHd3";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="a3YC9gLk"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68LGuY7D081522;
	Mon, 21 Sep 2026 12:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=IJuyzH7cPHUIgpq
	aU6HSxwUMqdBJTxi6zjgtKm2lyu4=; b=A777DHd3C3uZk0UrwMg61KNrlS9Iiat
	0P9gFp6myN/iSGhaCZQQN9ZWU4YXw31Qc1PDZngm4s/n1WAqatd0pbrB4V2+vudq
	AlTkcxjPTf2WaMTYT34Q+F9K0mF9WHthrOpzut2p7RxuXHwzx2LUBezNgeQWdKzI
	47cMT/Gpva5fJS1u6vlLrCR0X7UtedZP4L+iuKFCKeh/M1UE0M0IPybJN0HLLEiE
	BRL9G/36VTG9pkXAUxfOOUfdtaNd4V+C++GjYk1FE7H1njWYbhjOTroelTx4EQxO
	k8uc9aGAf/d1Z7/O7Xk7cWxXBAPr9a+BL9MKe1k0xZksgL7QK/QDjOA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gtbdngfjn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 12:43:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg/wqxP6NOlLDdZwjwMLqJ8TtZ2cy/elrGCgzz6TQphBhNq2DLfxmuloTWxocQVi2YXQ0A2aLxtiZqlaM7FROmn6d0sXmdODJtJ0GqajIXUWc2HKwL6JoUuaS3r/2wONcUDNuD7szZ5K0jO9kDasaYSPsNaniIPmiEI1FPvwZmlLexEOcuM+/Wb9JlgMt96S8BusiaCS+WQkPFBuOXwyxY1YMd5L0tS89N3pkEEe4sEcPPCi+e9Wkk7BvIy35ESAs4lUJmbSEKyJNa/oUE5WJ73AhSfOi0Auf3m2QJFYOA99LdgvfyjcmEvGh5SnSVZr+Xgv/zzH+rQLAzcsPh/B1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJuyzH7cPHUIgpqaU6HSxwUMqdBJTxi6zjgtKm2lyu4=;
 b=DKB5uj1WMQiVQYkoesJuSKAGtagERKDe7YAlqC8NG6+UA57k7wi1i0PSxd1lWmJOC70qmwQHrnph8H7kq9Dolb3zTA95JWUGd2NGFDqyJgIfCBLufRb45HVgQHFz+ey/fEdaZ0cnqcZjZr3Y2ntRpRlLtdmOIAj1UA26/y94tQYs7vgQut1bCPr1f7v6L89dbAWCpaPdvgUCzNg2XogT+za8kNA8iRipYmoR4O8Z2aKhkRlikgRAT1zHgkXzb5q/ymRGeLDutgjcuIBrZieD5/eYR8gC7tWQOysOuCqm3b8LI0gCN6Y74iQLS6cfpidla2IOWyEWDwYYQr0caUtGGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJuyzH7cPHUIgpqaU6HSxwUMqdBJTxi6zjgtKm2lyu4=;
 b=a3YC9gLkQATb4XL0OSibASH/U/faQs60LjVWr54vggIgwW1yUoUflNhsYod2vI9jzGihytoINmIWJQrGpKFexXUFhChULH1hx27WrpOP013OEsc6v+xG9PNHl8LoOPeLgzdFCNzHayfBr6PI+5ROlGPh1LlfOuJr3WyF2xYCdfY=
Received: from PH0PR07CA0116.namprd07.prod.outlook.com (2603:10b6:510:4::31)
 by PH7PR10MB6626.namprd10.prod.outlook.com (2603:10b6:510:209::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Mon, 21 Sep
 2026 17:43:49 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::84) by PH0PR07CA0116.outlook.office365.com
 (2603:10b6:510:4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 17:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 17:43:49 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 12:43:22 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 12:43:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 12:43:22 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LHhLYw2524345;
	Mon, 21 Sep 2026 12:43:21 -0500
Date: Mon, 21 Sep 2026 12:43:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Akashdeep Kaur <a-kaur@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sebin.francis@ti.com>,
        <k-willis@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-pinctrl: Add virtual GPIO select
 mux macros
Message-ID: <20260921174321.vaf2krmhnuhnmael@record>
References: <20260921063505.3986565-1-a-kaur@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260921063505.3986565-1-a-kaur@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|PH7PR10MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0f83fd-3796-464a-be2c-08df1807e50e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|13003099007|6133799003|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rEXmieCDLFa6wQ+pdJi3mdqgzrNloYKKapO96GlvrR4bybYHm9e2EVjZrp47vEgEbqwuJk2N1pjPghBfCYoz4Tf2c+W0vqgfCQ1KvG+0L8/FiqdVBSgWqEqpBCa2maV2ktKycDaScVWUqTBzXQgZloU045PLA9gAb/JRhpNsX2GXJdKjZaJ+8vtTvcGtPvybYSDrTKQ2s+lC8E1StReiuhBUgLLALUQ3OnEBMsaSWSLa/LXsebOfVIh7VmKK63vnZTRd9G4bFEZjtygs4SF0/JmT9Wb5yJHnTAE7OeOiQZ3V38ZPVtidJ1ugtKtU17E0yd5NTpibX8dyaw/+pHmo56vaLTZMsQbf3chyJzUgA1/5nXk25F0VDQRPP6leCc9NsLnGcnikIZVfNMrrH6nWfRrxcK8sJwwm0lLf8PdbEPHQTQ+l11qLn6VdUh2P76mgNQDr1K2VcE0ewoJrn2rJZIdaayw4nIoDm+L5Zu+B6gH3W42qrwRdsYRlJ8GXlHFs0knhqIF9/jipI0hm3EuuMT7b04UCd7mSnhKPm+Q+19nXeg9RuSxEohh3CsXvnBetXPMWC4Ddew/kiui6RJ2uqSwDTDfKNTCmn+Q1WgDjbD0L2bZtLTmdR0FxzW0+ZUJCQ7QfK0y49KvRvyw4XnVgzw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hN8QDuTiP/4je9Us/MxTiuZ8E5bjZRGP3Q9miRJITcv128a+5NRHRMC3I4+oXc62CItEsisvwFkndi4qjBuAPypoPwDG1qLaOCii1pBBvOHG/lHXJzedTvmrP9/nlMmtG13Jpa3C3Z00L76qg5KimB0LLLIz6RnIWCdrlMSueYMx1NWgTJ9fgqMNYYJ7CAAIb8pEqEcClAAlk1g2PpJcQTIl6jiCg4LtrDUeBNm5pqtXq8JSmUGbX9O59XKMa0Y4UAJ6sJ8fGbPlkLmxTCkEj75t/XTvcFfYxyrk2aT79U19pTo7lbsQEXpwzJwnRLOO2/H4ViMg75kCp4O0UH2s5cvg+tE1XvGKYgJz6pHSwxBzn81HwPBIYXVONMb9l4nfcLFpYx3dBRbmTuF8T3SybOqbzJsp/euQSKQrVL9tojFLJ994NTHWuhv3Msklrewg
X-Exchange-RoutingPolicyChecked:
	Pnroxgirn8K/alqSh8Lpnt0UKqusRl4zG/O2NLGtWK4zoXJ7cd3HSQwL4qJ3XCrKGurSz4P6wYehiSOHh1bhMnYJmyGWARVzr0SseT2z+ikVB9voAOXb6oot9cdNinVphZSSzloq7hWcURBDP8BsTRAVJejSHQZ+xqSzd+JKM7zngE2i4BBz/JDh9P737fPmTHOKx5eBY193FR8yeaSgmSSabaymzdY3NqBwqEC0k5VPImuFGlLkir6HjAzH/XESqLHfxAZsFDB3VHQMW1V0X5qmipb01EHuVYHCGl/hASq41PZz/n+X8bb6Hyc+mU5El+ToMlSxIbGWL7RJDkZGvQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:43:49.5256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0f83fd-3796-464a-be2c-08df1807e50e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6626
X-Proofpoint-ORIG-GUID: C3JzjmTifPzepGRni2TOZ6lAVhfnrCiT
X-Proofpoint-GUID: C3JzjmTifPzepGRni2TOZ6lAVhfnrCiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI1OCBTYWx0ZWRfX289Pi7Njy/Hx
 cN98+pu9BBroD/eZ7to2EejCpEQeiWnm1Hw+uE/077tOKTviFgKysbZPpla4N3yc0+R+5fxDThK
 E4pxjmIvq4ivCU5EH2KfFfVgzCrNSN7F2LlgtqSTDWKAYEIEnmApdiBWwWALefGBcBDE5zpsKQj
 w2+Z3Vjhclpi6jYOMx86HCc6I0lSe0i8fPpro4nVJhow96LuJDS88UKNx3xnLdWAmfKKzSFW4a0
 lZZavmoL/EJ0Qw8mAHJpFARt7epy2ErmB93Bq/PRxL25Z+s6SXsFl1ZADwfkKk6paZiy0W4oZRJ
 mVL/OwMc77XDMDrENyTCXuxGr+bjA2FbyQxBVG/UeZdjmrH7gQAXtdZztg4KOyXR4cVkrN+CaNh
 iL+il/f32zveSbCdUvrDUyY/RQUlQXNSIsIsT5ZqnRvvCdZyemsA5BonXfpeHleLsgOnQWRwzbm
 yidFh2M8pES3VqSecDg==
X-Authority-Analysis: v=2.4 cv=bpDZl0ai c=1 sm=1 tr=0 ts=6ab16cdc cx=c_pps
 a=cN7CqoUBHbDFA2NMQtMNyA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=1AvZFBVZaH1epbb_bosA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI1OCBTYWx0ZWRfX2pQWBJELCE8d
 lKg2EPDW064zNoG945MFe3nY/5bph/1QB+9pwbmaKsFKfwcnfcr6rEVALRMYS2Us59rW5TH29VO
 VvVwrnlN8E8iFK7EwwSbUU3nb2O8o0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210258

On 12:05-20260921, Akashdeep Kaur wrote:
> Add virtual GPIO select mux macros for configuring the vgpio_sel
> field in pad configuration registers. This field selects GPIO
> controller routing. The meaning of each value is SoC-specific -
> refer to the Technical Reference Manual for the specific SoC.
> 
> For example, on AM62L, values 0 and 1 select GPIO banks 0 and 2
> respectively, while on J784S4, values 0-3 select different GPIO
> controller pairs based on the pin. Pad configuration register
> field details can be found in each SoC's Technical Reference
> Manual (example: section 14.2.1.2.1 of [1]).
> 
> [1] AM62L TRM: https://www.ti.com/lit/ug/sprujb4a/sprujb4a.pdf
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
> 
> Changes in v2:
>   - Add all four PIN_VGPIO_SEL[0-3] macros instead of just two
>   - Use generic value-based naming to support all K3 SoCs
>   - Update commit message to clarify SoC-specific behavior
>   - Link to v1: https://lore.kernel.org/all/20260917111539.3844577-1-a-kaur@ti.com/
>   
> ---
>  arch/arm64/boot/dts/ti/k3-pinctrl.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index 4491898d8294..f6d262933fad 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -3,11 +3,12 @@
>   * This header provides constants for pinctrl bindings for TI's K3 SoC
>   * family.
>   *
> - * Copyright (C) 2018-2025 Texas Instruments Incorporated - https://www.ti.com/
> + * Copyright (C) 2018-2026 Texas Instruments Incorporated - https://www.ti.com/

Drop this for trivial changes.

>   */
>  #ifndef DTS_ARM64_TI_K3_PINCTRL_H
>  #define DTS_ARM64_TI_K3_PINCTRL_H
>  
> +#define VGPIO_SEL_SHIFT         (4)

Tabs like the rest of the macros? I assume checkpatch --strict didn't catch this?

Did you check *all* k3 devices to ensure the offset is the same for all
K3? in the next revision, please add that audit in the diffstat section.

>  #define WKUP_LVL_EN_SHIFT	(7)
>  #define WKUP_LVL_POL_SHIFT	(8)
>  #define DEBOUNCE_SHIFT		(11)
> @@ -111,6 +112,11 @@
>  #define PIN_WKUP_EN_LEVEL_HIGH		(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
>  #define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
>  
> +#define PIN_VGPIO_SEL0                  (0 << VGPIO_SEL_SHIFT)
> +#define PIN_VGPIO_SEL1                  (1 << VGPIO_SEL_SHIFT)
> +#define PIN_VGPIO_SEL2                  (2 << VGPIO_SEL_SHIFT)
> +#define PIN_VGPIO_SEL3                  (3 << VGPIO_SEL_SHIFT)

Same - use tabs (consistent with rest of the file) - also add
a comment above these to indicate the user should read the trm
corresponding to the SoC for the meaning of the values - people are
not going to do git log to know these values should be selected
carefully based on SoC (same value means different things on different
SoCs).

> +
>  /* Default mux configuration for gpio-ranges to use with pinctrl */
>  #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
>  
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
