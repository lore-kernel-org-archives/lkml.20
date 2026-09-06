Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDED286A4;
	Sun,  6 Sep 2026 05:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788673464; cv=fail; b=Ic1geNFUcWucFAWeAB/+gcuM5UFins7uNEJkt7F14AQVHWvFRLRUYq135EZiGpg6f0wy5sd8EWwxCPAZSgoNWBl84cXlDLWEwIKvLd0MFTinI3cpD7b88JeR5EEJr8CyoLFLo3cukRze9aKpd4YI8M/fk7BZwihTORjvC9KafyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788673464; c=relaxed/simple;
	bh=1ivwwTMN20adrr920xBO4FXTkJ1ujsmPb/bnwWScglc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AK+Tmx22ExZy3xdmeY5c5Z6nMoW/1z2MEKsbr+WfhzXmrqwChDaDgo2XyjqbNxTf6y0fZ3DNRM1YtLw5sbTFy9DDGAry/oxN3TMkAXFq+oIsmc9VCjA1h0xDmy7KT9tsn+48o8abu2RuhnIi1VKtC/eveTisywjQtCuOLwLBrR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=GbBY6ZJe; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lQA99Kl8; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="GbBY6ZJe";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lQA99Kl8"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 686009LU1775812;
	Sun, 6 Sep 2026 00:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aUNG28NvTbtffc76xszWs10/Q2HJ6xcO0vJoOaM4H
	GE=; b=GbBY6ZJezVL8gQdH/ioZTABBCCxKx6axXebAy5YHKIfHRSqSDKthkC1SD
	J5eC4KO4TuBCLftVTYNs4rMeZt/JOuUUxh6PT+QuRykJkpDKufYqNKFPO/ZF4gQv
	z+CZIhhrXpFIqIaHhwrP9vCFOcPt6EbBR1+sEczWFst/OLMrqgQccXv6+iy4G9bt
	aJQNYpLEizaTfZFY0Nk0BO4GmV/+Forugu+HoeaBNKVVVsesrI7A7byZ9oJ3n2vV
	yisGP+Miz0VcZ87zEQhgqAIHX0mKcKn5acFBSGoZBBFRIDUsVdqqwCG2wakrCxZv
	XUZzVvyEtJRaHHYe1yqdU9RDKXeqw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gfyx80cx2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 00:44:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XciO3J/FOrmd/in/2JCPR5HLdTszWxPM8771LbGx6zImbGOfgTuFZ+tqFqJyIo0vlyxfNvIUrl8+eR3eIIZfn4gpTfKKv02+F/P3qb0qBm27x6poixdy8lz5LTKjRuie+TaeL2jcXlaCkl88tVxc7nniCq6RyNq9hZyfNAbr9Oo/r63+iKJbDtJ4XuPNB1GL9fB0oM7e4Lbg6pFJa8BsmlLK9YjvhEgwymyQNAFOarzQaBocFV2ByQ45Y3TyMZRope1SA1j4tcaOyp+PSItqEZktPtfcjWQcpTNDKR6eDzuT5gJEqJF8WiHu5VoDnZkyr7CzsM522OUoBKqxVitFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUNG28NvTbtffc76xszWs10/Q2HJ6xcO0vJoOaM4HGE=;
 b=E+/RqOm4rSuZP+8DnvYhiPRmSQKpeDso6NygEgqW0VizUK+8mmsl7vCvm6sVw+nFCB6HSCKXh0zyW1iTiaKOZMeY7Um4r3HvHbLX4yt4BRwXUSAJb7U3ISwFdx90KdkFP34W4Q0XnciACltIdZRLrzrCfaeUcTcKdg3RCWNcR5tKGM4hFUSzKG0r7d1vc/jSGJVwP50mpGdH3DFswhVQmOiZx2gxLUKpnoDttoS0xBeWO551BVDy+qLG5ZSmu0c11X+k8LmZbJ1I3VDm08D4tn9WQfSfzZ+tf5LbLirXtjyTKgmEYi+J/IqjH8i2wdR4uOR6NwvpHgqk3XH4QJ0arw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUNG28NvTbtffc76xszWs10/Q2HJ6xcO0vJoOaM4HGE=;
 b=lQA99Kl8G9l+KhUDkdBrOan/OIhEDpMmjf5CUnyw5IB4WJg6jmvXiDyQMTe9LJCHXwoBveMqxer+NtGNPcSjMNXxnkXe5iaOMHQdvGjiA5oen/nnARWDHBUWEs1ZwzT8mftIZ+VQYom9gYbR77CFGJR4r7Dyc2XmUrqdeLAHopg=
Received: from SJ0PR03CA0376.namprd03.prod.outlook.com (2603:10b6:a03:3a1::21)
 by DM4PR10MB6181.namprd10.prod.outlook.com (2603:10b6:8:88::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Sun, 6 Sep 2026
 05:44:05 +0000
Received: from BN2PEPF0000A890.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::59) by SJ0PR03CA0376.outlook.office365.com
 (2603:10b6:a03:3a1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 05:44:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000A890.mail.protection.outlook.com (10.167.248.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 05:44:04 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 00:43:32 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 00:43:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 00:43:32 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6865hSMH2362681;
	Sun, 6 Sep 2026 00:43:29 -0500
Message-ID: <b7147489-00bc-4f55-bfe5-2c9cb675c7ec@ti.com>
Date: Sun, 6 Sep 2026 11:13:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j7200-common-proc-board: Add
 ethernet alias
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
 <20260811061351.2538688-3-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260811061351.2538688-3-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A890:EE_|DM4PR10MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7d5a91-6d54-4cac-a531-08df0bd9dc59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	k6NlQhywSdeSpdF1Gsn4aM585HD4KmoHioKt2Cgreb/Co2OFnGSmCazWYPdgIEIpGEf9qUJmfXWNl/hcXYOgudUB7a0FoadWDdkZXvnRijN5aMyE6F4OY+kKW9TvXzNL8CIsgZVa0GgUk9P6b8NZpN5QSjjo7NjVWVMd85VPu10lfqqZXcrvv6+7ewNN6Wv5ckwiWsi+yqBwmqFP9FybcMEL15aSm4J2wd8FA8lrtbw4gTWHObusqp33pw3yoF8Cft2ZnmnreeTIjHo9noUnjryapOxdp66HniL59mQRRXx2eNKRb5zwhPlYmQ39/JQWesKONVOXUDO5Lf60RX4hnfD062FUIO1gZeciCGP6yWsa3u+c1D2x0fdh6jPE3SDMZ/SZ9v78ZT9qBh1UAE9jQ9fol8ZloHW5EOGYPLVbDH1ii/Lh+U7trL85tXATG0LAUt/yRdjdVXkTgECPxhdszgDBdt3Mu/39t8YJXQuHLEUpCznsHjXBKgM7d2gVUiUt7OroBODYILlUmYIHJO7cxxb3RR71A1GHqpzLMWXTn7qg8P4OrxROD/sEe8jncrKwxCdhrmZ1jkiadVjXS93s2OGaTnuAaHSm4YzTMSKjo81PYf7iHOO1ss6dpsKzT9cH2i/e5FbPZrwUU40wWsQR+rKy87+ge8yjwet8ytQ6bTjMP8m3uNHzIoaGz4arAxyVHreFr0aUtfRG95gyCfE0MA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MBPPiiiJma3QC92R/a8uNIVLIEUEFMPslyKrCGByoX9KHbLSxRHIzTF8hjVa+o6UysN+bl0dmjQkn+sJZF21hkdszXAYtUcRqY8jaYHhwDoaXeeuRwXmV88+yExQlfc2OCStWgt2r8/DyUkoYIqPQ9QoWnGVa+iVNkmXUunFqDnmijYrcWym/UDA3QMj8pUdBhHWOa+eL5suIgFty/UD4tQFvlhH3kZSet22pXkCTftGyxQKifLB7KzzhwW6fFZDAdygnH5+Iu0FCRblA5l/9G4aglSw6FXHfTHUmiuLM+3fMBSRcVrf1w3UhSai+CiHc/23J49DkLXM++TT+9qA1y/do2t36xmM2JNWIPGo9R65o/Zf3eAYw6cFnxTn7IrPSFRKLoSmGQLFLklun9TTXxi9ICsFOU1g4H928iXaxLDrNJOt6RfCwcGU6IQmo0W1
X-Exchange-RoutingPolicyChecked:
	Q3V9GiU/A/6LcuHoqXW3D3inQtMLbkmfjXWTrO7eRiKug7peUIHWsZ7PUX+HuQenKGxkl3zY8uTTyqVbI3oyGJI8cTb64/TZljxoIdU79gmDFK+hnLViLUuu6HSlhLBrMvjnb8043JkWO/JwXOEXBHyX3wWSoBnBT2uYy5pnpF4VY734kmlym29VeKOySGOgKqCTjTrwqKC7e9sTPIjmhw9pPTwEcwl8SAfziAdhKltFXccvM8ZA2l7EQNIPZWWhY1vySg5/gneN07AD0cLKHhbn+0LFpU+irZjo93icfpcG2AbK95mgbYonkCOBaVoaogePh8H4T0OhRVpfdWZ/NA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 05:44:04.1361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7d5a91-6d54-4cac-a531-08df0bd9dc59
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A890.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6181
X-Proofpoint-GUID: Gk8muPBTe37zwFbmaLr74aIZRFYrSR3S
X-Proofpoint-ORIG-GUID: Gk8muPBTe37zwFbmaLr74aIZRFYrSR3S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDA2MCBTYWx0ZWRfX/VvrEw3r/RVG
 QmJh5A4/MqLkRdh3MJMMAzEB8cWRnb3U8iVUw7jOxxhskdo/m7TFmc3Nnp72lFpOhgRtLPyp4J2
 NF2JI5WDJAZkQdK4cIFF4j1pszPmLrw=
X-Authority-Analysis: v=2.4 cv=PPM/P/qC c=1 sm=1 tr=0 ts=6a9cfdad cx=c_pps
 a=x0D8RYL8GqfJKF6oaN0fjw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=y-xD0QDI5YpglimYbfAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDA2MCBTYWx0ZWRfX18gz25vyyC5Y
 Z8uoWdmE8fMpUuLxpasLSU76ZtRwcFuHSmDsjf68t+acnnz2rluXcVbgJtNE4vt4+GELlgSZ4M1
 N4KaTSfCQrGhZXuq3pG9If3fE84OIAhJnDuNTkcd+YDGo38f1GLgy12b2GsSEw6HfTGkW1Cn39j
 2mhE6efllDhiPHWRh0qW4crR5Y3/5Nv8/FQYps74fJPk2eDu0QznsvXBkQzdTAkNWZU8wQ22Box
 EJuXbsSzkdCg1eZluJlgRi8X8K7ArojSZr0z5sY2hW6Vk7gWuQUakX52UzcMKPmH4sIxeDw438c
 qcNDXJI/PhJkiAmjHDilD8emylWsuLfIdc52K7JzyQzE/v63IeESx1iN6M7LZgWfFlaqFKE1fID
 cCLZ9U+oSQlwL6g72fGTiWqNLeVNW1oYLvcFAjeLZHMgHFF0jbInEUBD/f0bHDJE7a2Km/JHdp8
 goHZg2ypAcy5qmux7lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060060



On 8/11/2026 11:43 AM, Siddharth Vadapalli wrote:
> Add the 'ethernet0' alias for the Ethernet interface corresponding to the
> MCU CPSW2G instance of the CPSW Ethernet Switch on the J7200 Common
> Processor Board.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> index 54dea36b153b..ac1c1ffe40b7 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> @@ -24,6 +24,7 @@ aliases {
>  		serial5 = &main_uart3;
>  		mmc0 = &main_sdhci0;
>  		mmc1 = &main_sdhci1;
> +		ethernet0 = &cpsw_port1;

Hello Siddharth,
As default only 1 cpsw port is enabled for all boards in this series.
So ethernet0 will be cpsw_port1 always, In case you want to enable more
port in default config then having aliasing will help.

otherwise, you can consider to add aliasing in overlays where you enable
more than 1 port.

>  	};
>  
>  	chosen {

