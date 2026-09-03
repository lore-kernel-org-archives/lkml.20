Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF73A9870;
	Thu,  3 Sep 2026 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440858; cv=fail; b=aad1NheScV/UxIfOol/5gJZDM3JBcJg2Bq+2ggrNDMSNGv/xpHhr1ynh5zA/1RqYAel7I9NXN4Le5Lk+kPBnujp5PuLP+f7LAJ7oKQn8gr//NpjHlIYMKXODOkDMi2EGX3fdLcPgsTkqi13EnidONLlEtGuDnflxntwlnuhkN3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440858; c=relaxed/simple;
	bh=8qzl4flf5y+M+LQdRmwZjoKuw02wmWd6awrTWVuZdg8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+eBl3NazYrEn9n5ILKW3opdpeLa9na3ELRBHxMcE9yN4YeR923+Sjxq83WRPyjBBRgtD9GWSifcm7mGOmEUDcYrUpsTZllSexRiJgd26uzp7rFNV1737PvJVRp6bZvLDta9JNVi3OcXKXIUIoCSG94lwCBmNAel5ivZbDmU/FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WU/n9mAY; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KvNcQBoi; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WU/n9mAY";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KvNcQBoi"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AGeil464602;
	Thu, 3 Sep 2026 08:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=irnpWppQO7YDxVo
	PhmcEzUJOhqrjL+BpakM6eLjTxoM=; b=WU/n9mAYpaQKtB/iHozW1VIaOJ+B5L1
	68WKNjjCCd9M6vdmy+bRQss1gbfdfPxrzM28vALZOYYhTr2NbB6625PtxnkjBdAm
	VP9087Qh0O5CUeRnfrD+Zp2Q53onY8qevtmNs0sthwCg1wxqPxYXJSitJbO9G8p0
	1Y2PdgDAQYkkwl5lMcPsRMR+PeGa4o+WKqO0o3B8tCcE89dUG0ks3YX0Ax41/X9K
	YYkNyPTPGJn0Fju/rclGUXTNtfLLUcix20TT/3I3l7NkDg8Js15d6iGYStqW9lTK
	6IyNkZcjspeKrsxgWAYtQrIScW5vx8Mul6/rUXlqel7Yr33dINIpFiA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gf68j92ch-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 08:07:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRBAaGBm3bmoTCBuMno+T8cXAqBtgZU5fvSEufDI0GHoiq9gJGFXQLemAscdjwCSG65RMGYhJ83rqqm+j4X+JiBZPHpahpGpia3F0LigxgbIcowi3B8bcXE0fUt1poQcv1hW7rqsfI9O9BJRfw6UAuUQ9xKSZWhoBrE65bhhlS14jTcEchJPQ1xaWOysNWrnJ87zIvvQ4m/tVjGom4xQ+Rt7goIzKwpftDkfdGMzY+P4SlMjtAK3ys54P9OxQJrvF6DlwvyxbnbWAKFchB0p+w7JnUvLMwh7+myizgFy6PYluFKaO3mcp7pwuxYkrtaIYKkIUQgbXwKio+0ITJfGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irnpWppQO7YDxVoPhmcEzUJOhqrjL+BpakM6eLjTxoM=;
 b=leg0SQenrzsujNV5N5DjwSOVwCZcaJC1IYAMj/DK4URAOnK1l8EJSv6hhODJlC1tIqzH2UpnZHqFKXrqCCwvyXvnLneuSlJ0lC6ZAm5KLNNOJS1pPKIaoM++ouETiqaHFj9P2D2uvtJ6gygO48eziKOb66nXx/GaYATEdZDjdJ5wtqcedcQ0opvrGIUS6G5vM/91Bz2Ek5DgHggAjm0B7Yy/ManD40WYFXXKkZwHAwZ0y0WWCZBvfBh01KOCLFr17YxocnCk0i4r9QF15IsYzpqCR8ZPXFTmwRTquCpjLP6s+beb1xET+H+oPlgkuiO/pEMnSDD9yTZlkpMucElvGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irnpWppQO7YDxVoPhmcEzUJOhqrjL+BpakM6eLjTxoM=;
 b=KvNcQBoigRNTTn8rSpOI2ThFWRxqBlkDefb656szuZCE/EMsaSAEtHxyIKKyYuSv7HkEm3VGahWpCMuQmUb0V6k1N7l8zZfYaz3oySTsFqgZ8EppwsgjRfU4aSLl7oVz0V9JU8sJukui886sSEDm+cT7hYV2t6fYAmDN3gEvYkw=
Received: from DS1PR02CA0010.namprd02.prod.outlook.com (2603:10b6:8:452::18)
 by SN7PR10MB6620.namprd10.prod.outlook.com (2603:10b6:806:2af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 13:07:12 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:8:452:cafe::a1) by DS1PR02CA0010.outlook.office365.com
 (2603:10b6:8:452::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 13:07:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 13:07:11 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 08:06:10 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 08:06:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 08:06:10 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683D6AkW1580655;
	Thu, 3 Sep 2026 08:06:10 -0500
Date: Thu, 3 Sep 2026 08:06:10 -0500
From: Bryan Brattlof <bb@ti.com>
To: <a-christidis@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: add am62p/j722s GPU node
Message-ID: <20260903130610.pasaudigf4vrr6nv@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20260831-am62p-gpu-node-v2-1-69945a2db2af@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260831-am62p-gpu-node-v2-1-69945a2db2af@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|SN7PR10MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cad8167-5809-4ca1-302f-08df09bc4441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LXH4ip7m8Jjtv8VwNFutwggQPLuQLxjA57WR2psldhcB29lY5nEJTlrA99A1K6nJ7CnjnMqwDH1KKCOzOJ+0D86i9v1eXySLyJpIuz88VirbVr6xM2nP1fm6imrU7KY98gtmFTn//gwBQ5mUOgGF8ceCKoarldHe61d/8phF5TCHm6n6y/4ZVUqwytFT1Xvwt7C7qqNeDjE4fyj9N0L84RYrO5Nhy+in9INiwwV8H71PuU0G+NiTcAuv09OQ3bG6F7JgRfIK5Nu9JpuUqo0RNoOoF8coRf+Eh6Iyo3bLnVVAgxyKM2EKlyBKK/BXmZYs5wpiyFo7+/QW0cbKncHmy2ws13dzh2fmLjy/4i92mD3qI6694Xqxv/i58ga+K5KtTeuz81DyEwJA5L+tzwEGKOp6qj9BCJVcRULL8lU96DG027WmKY1jJAP7Ewdamefzhf95FSfOz2VvjXVIxA1XlAT6hg0rMfBjd7JRnX5zXldyDABd6DTDXwsqbQ6UM2MJF+70rHYqTnsFxJG4S8KsHdqUz0gppREg+l6g8cJxi98Sf8dQHbJHKNN4daocd8Un1JjWaakRbwps4nvpnTioB3R9hN8ns+8I7dI7RWQHaA9PDy2kZ8rTjeneLoTgblrkR/zLZ7J+yQvFCqU7NA4NPybZhq4qavToTWRbDrlnj+fvBYdVGXEXCJ+VeNg0z9OjNygnU3Lez6iP+DqVL5qtiA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4tUnvcV6HLm8B1TbY/GknGGSShedy+bdPrAVD0ZFmS+8PSE62hJ/EpsEksw5XUdVjzhlQt4mGRkLsUQ9kM5SpkfMnJVs19XITWnVOf8UjNe4jq/VQIRBVB5h1k5LOpoHKnagPbAfBpIZvSLCNWFRlZZARv9MMV5nDyU51LSzylRpmGIhJB9+2TENHMjNJ+mRftFAjO881JhbfkLuAkfbREN+d8hcNAIYdoiDoXy0qEIyf2UnSYgGo8gme+UAjwVBAutUXSH+xbgrZJNE4HFJusGRnuuU8Jec6h1xELiAfSPbB14MmHezOgHpWo6lubMSbzehMNSdAPcETfry8UhMKMcLFFPq0ph8BbxKdE+BNY//XJzKLuoxC2wCfWFcvREQFaoq9VrCdPeL175YSOf5FrL+48kCHZ5nozBVmS7qDnCipkJERJFIiaNP+g0xSlrt
X-Exchange-RoutingPolicyChecked:
	hc9TEGpD2YzyoAXjh+Nh0JJE9HhfVyxAgE+ws8f6sXvbhAqadixFqc8khUQVlcBsLOMOXt7qKpwEKiGhPCQwh2+Tq0pJ9xetdmqElyI/IbR2L3jjgVyWxJykEhuxMCMp3o2yv/Plbdz3Ekph0PTWKVd9a5N1O1XkrC9d7vP9Wx/HlCgLnqUOzQFHELP7AFgXgtzzRQrzXLao6StoZ7qUpiqk8t8/GgeXt9Iy7ZMgDV2Hj0ef7A3srjQEkqu5UPYmZOyCPpM4CTMMJIw/z+dig+Wj5/ZG0lu4ktErxXpVrqU3KPgN6dWHj68KXPbcvXY7QoOrz2YhBTVR39jjb3UVkg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:07:11.2841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cad8167-5809-4ca1-302f-08df09bc4441
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6620
X-Authority-Analysis: v=2.4 cv=MvBiLWae c=1 sm=1 tr=0 ts=6a997106 cx=c_pps
 a=XJaUxuKKdFC3a9vqRM80qw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=cb4AZfpdGXUeh5uxrLUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: KoVEhkdUTLNxzwAmQ6irJF9unpuIb1TO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX/AvzvA7uVkLf
 kBw+A9GjhiZvh0W5Z/IVFym3jTOUYX2SzKrxpO5Ztj8gkBnapXGM6pX3z5npvJIVMkf3ynPH3Rd
 vPi6tkZ+iOQR46TaLy0WKmQlJoGvdAtEy14B/zIJ2WMSLIgVKNIAHatcDChyih8L82sKfpgwGbm
 hdVxA1g3OqSsnSIsRWVHn9r/MHwOJ7qebOwnmbYmvfH+Bg5JQR/wfMqBe2jMj8TFapYilSJUutN
 1MEJptPYl+yCJw7YPcul7IqwX4ItyCrA7IU9chhVQUoggxci7uIVolUv7wRZYa6u25TG82Eu1Yt
 L1Y+RGi0CTa4aIEo8/U4rLt65r1ioZV8vDGW4p6Ho9R/aVN3SsMbsnnbzj2w18XVgZtYmiQbmLK
 Br+Ut//rFYwwwKUhWtgl4kreBFXzxRNu89gAKSDXVr2tycsZ73mttNZh/TKoWvdBNs3pgY31IrO
 OJHp6DND3Ux4QNmgB0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX7kfHDGxIzHH8
 T2HH6g2feQqGEB2+FEkrQzDbRMlo/9sjvyO45XVXlpL/aF6HhhdFK5Nnhey+LFga3mJ8CpqNTbH
 U6i2H6cMMTL99eT2izIx1xZw8g8BQkc=
X-Proofpoint-GUID: KoVEhkdUTLNxzwAmQ6irJF9unpuIb1TO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On August 31, 2026 thus sayeth a-christidis@ti.com:
> From: Michael Walle <mwalle@kernel.org>
> 
> Add BXS-4 GPU node for J722s/AM62P.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> v2:
>   - Reword commit message and title for clarity
>   - Resend patch, missed merge window previously
> ---
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index f130c7cb998d..e36205eccfc9 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -1111,6 +1111,17 @@ dphy0: phy@30110000 {
>  		status = "disabled";
>  	};
>  
> +	gpu: gpu@fd80000 {
> +		compatible = "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
> +		reg = <0x00 0x0fd80000 0x00 0x80000>;
> +		clocks = <&k3_clks 237 3>;
> +		clock-names = "core";
> +		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
> +				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
> +		power-domain-names = "a", "b";
> +	};
> +

What an exciting thing to see! Way to go Antonios! Without talking to 
you guys I would have never known how much work went into this node.

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
