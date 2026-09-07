Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4A13749FB;
	Mon,  7 Sep 2026 04:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756676; cv=fail; b=fxlSu4XbqvgaSk1AalW8ewfu/lZErWNLwqBxjGG1pjJ6/SFqkzHzhZl8HhD52iglSYafoxh2CCk+YGYrl/9UFfnyjaKsi8XrzkpDCdTdLNvkNDQiETnn9OJ6DEy6kIYz9PnND3HfJDSAzj9Gz5Ny2SBjw0IWDuYjTrUeuARDRWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756676; c=relaxed/simple;
	bh=gKXF3pSsHIlOy0TozLcFLQeDcoM9EdJ8QMtFuq1Kmak=;
	h=Message-ID:Date:MIME-Version:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bQO6tbK1vS0vWDiH4QgEt8JxRUfTtfCAZ+OYNhTEKFMd8Bk4ZlL3H/dsknqu0OsMoNXyc+DP7CVFT2kRWix7UdQTruP/8YtlAAe3kdvW0rq0g/AxGzQ+EFS6O9CE3B8Nlt5F7OiSpNe8mFNUAV0PguKh5EPvTo2U7Kobus3gRWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OybfWX8H; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gAUYKrR6; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OybfWX8H";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gAUYKrR6"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6873ixiU476922;
	Sun, 6 Sep 2026 23:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=LE5GRO4jIQ2xwgdrSCSRH3P6qYYPJhXXgcPGGwMQI
	RA=; b=OybfWX8HFuxhBZe+/voMO9+G/T649mLCXogrEgOKm+2qu6aMO/xJhGhek
	SfBCjxo43iPQI/rdURxgKDZDzXpZj19L4DU/VODLyRdJEKgMkMM53VUF1zd1RI/X
	Yg4Y+qrxweE98nqdeB9lY6u5Y9ri3CBTgSAcneZsBhlIjWd/jGcVpPhZd6eIOphI
	3QHn6/k4THdcry09cBUzAd9il/bZRjDnCave1NdvWNkwLj5wZD0KjjbJm9Zy+vHW
	hfsvTeFKGC7yrYWAyafb7tD3vYh03LcyUKsWWGZs/1ZLw/RfOFNTUCpDScTWP1aq
	2N6g7wjXymT3a0VWR2lMOk5wmJ/eA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010013.outbound.protection.outlook.com [40.93.198.13])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gh51nk8a9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 23:51:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAMZoOyuinAAQSRa4NBaaKHKK9w3uJEPyoMZUEoDPO+cSNFxeVETD/7U6cAyzCt+vfq5VIrP95kt5dS5Gx9BEztkEcj1wSThLJD2EwGF08xFnl01hJPd77brRuJVqynznFFBpalbtas1UJW04+l7xJOspJfuu85eKj79xPBp+11VRdwZ+M7mpVsK8qEnmNWnQb+YVOfooJeyfh4z2CVbgdmIH4juGo6j/eHkk3hcrhyJQSUFYyrfWTCZHlkzSxvuPb7/8/xIkCxL/6PD5zUVYkUVtF+aGAHD30obgvMKyO3TD6hAdwGWi0plkVAREBMR197ngStEyCXgbM9kdNCBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE5GRO4jIQ2xwgdrSCSRH3P6qYYPJhXXgcPGGwMQIRA=;
 b=DoqolyvlYhqVZ1yLkt7gkIe/gZ0Dg6wm4NjIUynQuiWHG/8obc5cXVG+uchUeCPdx+E4QYJmA8jP+qhH9NezOuPzwzbXa7tkWS3tjJ+plfHaWfXjlXVarG6Dej6jt6EA+hch+OlqGgiifv1bo+N0EZxZR1g0jO10tPfkh1D8Dz/d6b4sgcxsHT7nRjFbADNMLuWmOT1//HQmwqScB0Tvpqb6+lTO/jc26UMMK4BMkhPXsgXUS+lBRC5h9eVgjFE0eNw0ZUfQxJ1CKrB1vIp03NDQ88jKSmj1pFL4cYdGg7UNVvBNGxZz4ZanSk8/W4L0QLENxIFKfF0xc2jwJJo1SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE5GRO4jIQ2xwgdrSCSRH3P6qYYPJhXXgcPGGwMQIRA=;
 b=gAUYKrR6AJ5hRn8RrsxAn3K3wuTicrr6pn75fBEQnQSqPV0UNljvtJu+uvuL2XZ5rwVIU/8xIqRmoeRuD61wWBFrIe2hErGJkJP8IgIq1ECLyyYw/V31TMT6UGKITJkCkNTp2MYs0zupv2jmoeZq1tQibY17dDOr7UFOWXuW6HA=
Received: from CH0P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::14)
 by SA6PR10MB8016.namprd10.prod.outlook.com (2603:10b6:806:442::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Mon, 7 Sep 2026
 04:51:06 +0000
Received: from LV8PEPF0000005C.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::50) by CH0P220CA0002.outlook.office365.com
 (2603:10b6:610:ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 04:51:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 LV8PEPF0000005C.mail.protection.outlook.com (10.167.245.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 04:51:05 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 23:51:03 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 23:51:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 23:51:03 -0500
Received: from [10.24.68.110] (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6874oxWk4013895;
	Sun, 6 Sep 2026 23:51:00 -0500
Message-ID: <9ad18c6d-979c-49ad-a96b-c835ea2188f3@ti.com>
Date: Mon, 7 Sep 2026 10:24:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <s-vadapalli@ti.com>
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-j784s4-j742s2-evm-common: Set
 ACSPCIe refclk to MAIN_PLL2_HSDIV4 for pcie1
To: Jared McArthur <j-mcarthur@ti.com>
References: <20260828195140.3476062-1-j-mcarthur@ti.com>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <20260828195140.3476062-1-j-mcarthur@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005C:EE_|SA6PR10MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab7a892-2109-434f-71e2-08df0c9ba032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|3023799007|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	LaUw/KZX8GXU6ZhgsT+UwEnGNeutL2UY0B1DeShBWpgcFaeMY9xjFC4B+iRw6xtUuHYAkr+vmMz35hPmKISCdCnXsl/ieMkNegnEr3HN37GcQ5C702Xj+41s9X4XfW2vCOqN9PjoctcR1knBG36I7MjM8XIasr7wb2G18EafpMTTWf6oNC0+Q4Av22WQLD/+4Kx+GwJw2wiZZE1EJ+PUssCAcuN1aUs3ft9NLFEFClFYtfik5MyXX1+iZzMWWVKBe05RRrOffsrRsYwrqRbdLHVhbpWSiYCys+e8V+rgXP43DuF4ks/rEY7JpVq2KEL2KtS/5zxSdNkHgqEqZpFcQZAYHTvDGbthEhIj+9aOyeCA3QkhU0I9+Wn4cpzDrsz0QLzIIvgkG5miR06dEUtn39nBq88Obx6CGwCu95Wa8FCqw7LfT+4pxT6sK1JNTLz/BCunoZDXJLSCpGR/Gpz2erB0ycWwPqeqcUKjwKDOr5Wk1KNF5AIhyLgrYRi7bnAMUfU6CDxlwgJUT3rETxIFJ1webUuhUkLfKNGCS4mkuxqjmfgUE4ZfHju2yZHcCe+iM73tsOCUsZ4isLnw/ieoBligsxPzfP+6/AzsHGLXwkZedU7145LY00WX2I6Nz6wyyhY/eBPk/CgJnH3YELavJA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1xtgACfIkfoxffV+hazMyP55ylOKnUS/8Jko0+mobgQlUlsOwbV0jF3Y8+MM4AMTvvCispOMo3D3LI54P7IBoRYFqnMaDzpebQrEWfWrXtl68Lhtnr9WCo6eXJX2skkabktg4XykkbO8AQ87uELAMFnXmSQgvwNpE+Fmii5n+ryQGiwslY1jJf/tNvRA0gzJ10U2Lb+0TUva4AVo+EF0q0uLjWsoRD1qJ68jSnUmKtM9nuAahTjq35TZ8IdguS9GU/X+/4Vr8Cc62bvxLrPO4mKhvfJPKI8MwwE8vpbQtkRi4oRhZf8X9PafzJUFY8lofVgWE0pRffTmoXxJ7gnJOse3+ASSoCPEaQhbIZ/LWc++76MB/d/8E4Fv4QwssrtFOHlXQ4tSjWfNjDGsumz1D6MYIgb8MiTAziUqQZtEeZls2pGdTPbcOLMuQW75gZoJ
X-Exchange-RoutingPolicyChecked:
	EgD9T/UT2NXLNEdsOpuDJkYepwESxbFi3ouPOwXtlk/rkRYU+kJbRB/xxJK6Feen3gu+5llr9d8CD5mPZXT3Rq1N6UIepMp52p5RL0myqoJAGY30gxIk9uZfY22ju3VowxyMjqZgmi0okC6l8qo/2Js/i0zXJ5ffi5AzLoQbkSD0jqT41w/LPkAdWa1Sdpr/3qsy9rfQ3H9XNoAwvXmkY1U7E8w/aUv+0kGVO9XPXPRqFaxkW8A+rwLC5Z2juZYlDPc9l3bbaqGIosiHhvnE/Hn2d0JPvgan50VcPbJAsG2DWC6mPzBdsTjTIlGf2npYQn3nylYGoba3EN1NW1hm8g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 04:51:05.5818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab7a892-2109-434f-71e2-08df0c9ba032
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8016
X-Authority-Analysis: v=2.4 cv=J8GaKgnS c=1 sm=1 tr=0 ts=6a9e42bc cx=c_pps
 a=RNtfRSV62N0+FXzFNxkaPw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=VErd2KFUq15UWt1rfAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Q9qlorxyzOaipoYNbe_0DH1w0wXhbbDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0OSBTYWx0ZWRfX6rk9CgoYHdzP
 wLiGdn+zLCtgbuKV0Slr17Fg5MRFnPoZZANdAcrsszgUbap4W6tfU/i403U2boYjeoIehANpsYT
 cabNfdvqw1NwwAE0RZHntKDzFxQUOSzNagzR6y1lhtgyDt+q8OEW/gUF4UYZgHwOILZZOOjjhCX
 uOfg4TWBRyzjYXRWg3l4TQSPwsLC0KPt0J8kKrwowgHW9RT/569Q2z3FhFFKe/pkX2sxip+K5RQ
 77LopWe+YwJpb7qDAhD/RYswKyDgAtEWRM1M1EmorWbVl8xR7N/XjYFdxLU2Wm7j3BMyCGtGYwJ
 s6SeWf26WegkH4jJ/LG6eKhUPUN/6CxcIT6j58Xqm6Q+1f9/3TW1yDMJ1y4c0FKD4Ji2RjNjpcf
 cXfJUcF2Ivaa2tDVK8gUSzGzQj2ptALs6DajMlup3+Mt0zgrhRd5ddUtbJSiyAQOgzdkluZVcsU
 x/6GHf5+P75tEAprgIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0OSBTYWx0ZWRfX/2/0PUcy+R+/
 39NBh4593F/fuwfxJX3AIy9mbTJ6exGNUhUWIapqzTzgxNWYU35UxFXT3aEJYFOh3cgd8sLa/3m
 a6Czdh5iTPKYqlVRbsdo/JEg7wRDRDU=
X-Proofpoint-GUID: Q9qlorxyzOaipoYNbe_0DH1w0wXhbbDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070049

On 29/08/26 01:21, Jared McArthur wrote:
> The ACSPCIe buffers provide the PCIe refclk for external
> devices. The ACSPCIe reference clock is muxable between multiple
> sources: SERDESx_REF_DER_OUT_CLK, MAIN_PLL2_HSDIV4_CLKOUT, and
> SERDESx_REF_OUT_CLK [0]. On reset, the refclk is set to the
> SERDESx_REF_DER_OUT_CLK. In the J742S2 and J784S4, "the SerDes PCIe
> Reference Clock Output will be temporarily disabled when changing Data
> Rates to or from 8.0 GT/s in Derived Refclk mode". Some external PCIe
> devices cannot tolerate the reference clock being disabled and will
> therefore fail to link.
> 
> This advisory is described in more detail as: i2242 of the J784S4
> Silicon Revision 1.0 (Rev. B) document [1].
> 
> The refclk for devices connected to PCIe1 is provided by the ACSPCIe
> buffers in the J742S2XH01EVM [2] and J784S4XEVM [3]. Work around
> the advisory by setting the ACSPCIe reference clock source to
> MAIN_PLL2_HSDIV4_CLKOUT. Use the TI SCI clock controller to assign the
> clock's source [4].
> 
> [0] https://www.ti.com/lit/zip/spruj52
> [1] https://www.ti.com/lit/er/sprz536b/sprz536b.pdf
> [2] https://www.ti.com/lit/zip/SPAC001
> [3] https://www.ti.com/lit/zip/SPRR458
> [4] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j784s4/clocks.html
> 
> Signed-off-by: Jared McArthur <j-mcarthur@ti.com>

Since this seems to be a 'Fix', adding a 'Fixes tag' and copying 
'stable@vger.kernel.org' will get the fix backported to all LTS kernels.

Rest of the patch however looks good to me.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

> ---
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> index ff3a85cbc524a..7c085663c8880 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
> @@ -1206,6 +1206,8 @@ &pcie1_rc {
>   	status = "okay";
>   	clocks = <&k3_clks 333 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
>   	clock-names = "fck", "pcie_refclk";
> +	assigned-clocks = <&k3_clks 415 0>;
> +	assigned-clock-parents = <&k3_clks 415 2>;
>   	num-lanes = <2>;
>   	reset-gpios = <&exp1 2 GPIO_ACTIVE_HIGH>;
>   	phys = <&serdes0_pcie1_link>;

