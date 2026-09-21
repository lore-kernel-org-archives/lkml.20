Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F74B0C98;
	Mon, 21 Sep 2026 17:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011684; cv=fail; b=hx8pVJdyGzmsy2K7th/SSUQNtZIv9+3hJu5fwKN5bkI/lokntamFLEeaSuaSqFcKg4hn1gLebOJ8F/Qwe+aukkygE/vyCE7GZbbO7Is0O6MPRZXM30UWIr1dT0ytjs0HN0saOqgdXb/dYk4Nt9tg0QkCJsol9qfpBcWvq92zzRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011684; c=relaxed/simple;
	bh=ihd6ApIW7jQrV4MWA/qGSrw8EyMQpQc2iyihROprbRM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABDTtoqFP+qgIA+F8vo5/6cCVqVX3OAt0WuQuwu1dnmqF2VYB9Y60BBcovnKy1vYe0ImFxuBoUQJ213KjgL9J/wkowntLeebGPG3Rgv2po1MOSRI09+we1TnWph1Mv2EzDg8PDZ7dzi9xnrBZxYY9uVpwU1t4BlY9CVruEe15bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qqGE0qZu; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AeP8MUlD; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qqGE0qZu";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AeP8MUlD"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LGuOIY4140747;
	Mon, 21 Sep 2026 12:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=j3OFlUQBxN9agIp
	NKi5lnHusJ88SHWIFUzPy8SYBk+A=; b=qqGE0qZul2dCaCnWjlYD4wUf//7KA/M
	Mp9HQyEYlGuiPPUKAW7luyMZ45uzlNUhIwt45Og66uZW6F67HR/5JlIN5vv19cCq
	s3S1QuPagnjeY3Pnv0daKflwFHfZO7GBB5bOvqTBQ4oiYe+2qw7rfsIFtuJ/HFSB
	IHd9Di26DLG3GzAOgZaaE3xK2VOj2jBLOLUMFzFrJuNilwRCq3fPFNsEGh3TT8Xy
	i0XiLhlZ/P7KP6Tu9iWuatCHJI6lT4Ur8d3kVa89jGBeUD+OB2KlHF9jFZwdMEI+
	2ERd0rBebREOFeXz53sZS5ogjNWRiK2zvROp4qTROlgLS6L1rafA5oA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011035.outbound.protection.outlook.com [40.93.194.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gtx9fc31w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 12:27:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vR1Y816dHGfqRGT+rKiUHWJpCj4Ni1/1iVSlRArUH5gHg7+beLnN4J3m7owA2xbuCZvfvHTFqd4JfbVMF7xQJgqc9KmVbdAnxscMpUmvUESmmYWetRXfphcrnYDwtZ0gCsvShBNB3yGMVfaUbvVndbgrvKR92rpgAe1cIXCsP974uD+06Fb4HCEAR4E9fkoC+A11ycBOMZRBuekyWRvt+GVA3Jexyk16yjo8KqDFnQSyAQydQbok3UHexFxH4fQoIoylhjJZ31n3+SPVw4Sleib6IpVKPm57ex5Meb42+b3ucf0IWjMpYZXUa4xzdW9yeC/t4x09pdkLCnQCGu3eRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3OFlUQBxN9agIpNKi5lnHusJ88SHWIFUzPy8SYBk+A=;
 b=YMj1oj1LI2ORYfDLGbIOzBEzqRKI+IhpyNtB0s8EZlzAE9Ok7jv/r4zGSbTp0a9S1fpEC9Q0stS2wpgNUNroob4f2ZppFn/EuPAJpNksAoOl9gOL7OgTOE30UClkJrda8dt2EfcqqdpdWSOYQVT5G9Hwg61Ouah2f6J/915s8ilIzV6WATwM/yuVnw/v7+x/2UY+Yk8VDomVmemn2NWUY6O8M8QotwDqGSt8yWhh+CpLQaiW1IOEZ50GpDFfzeLuEy0zgiV65MlawWpMx2jXBT24FGm7mBuolD8L1E/sQC/3V4srqYzdV+o7Oy/jipnIQxBsoSgiwEgftZ+UCIgyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3OFlUQBxN9agIpNKi5lnHusJ88SHWIFUzPy8SYBk+A=;
 b=AeP8MUlDyCD5beTmpUyi638BFIArc9BzjWhQArGbNg+wJvr4s+WEv2QtUsrdfKdBfrJhrYbh3RUTXziuZ+W5yN05+FmWi0ZNjyf8ehKz1Yc7qU9qgXUOgVYVNmHKWZ+KFAa+y4DVTEUmK0yJwe4AOYG5iZ1wjvHAhnt4Xub8hKo=
Received: from SJ0PR13CA0126.namprd13.prod.outlook.com (2603:10b6:a03:2c6::11)
 by PH7PR10MB5878.namprd10.prod.outlook.com (2603:10b6:510:127::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 17:27:53 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::8c) by SJ0PR13CA0126.outlook.office365.com
 (2603:10b6:a03:2c6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.12 via Frontend Transport; Mon,
 21 Sep 2026 17:27:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 17:27:53 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 12:27:46 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 21 Sep
 2026 12:27:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 21 Sep 2026 12:27:46 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68LHRkhR2503018;
	Mon, 21 Sep 2026 12:27:46 -0500
Date: Mon, 21 Sep 2026 12:27:46 -0500
From: Nishanth Menon <nm@ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <afd@ti.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 Assign SRAM to VPU nodes
Message-ID: <20260921172746.jge67yswqjeolwz3@impulse>
References: <20260810205206.685971-1-b-brnich@ti.com>
 <20260810205206.685971-5-b-brnich@ti.com>
 <b5dc14b2-9b8b-4da5-b48c-274bdf6581a3@ti.com>
 <01ff0252-1580-4934-af34-6ef70d874f10@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <01ff0252-1580-4934-af34-6ef70d874f10@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|PH7PR10MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a397910-dd88-479e-cdea-08df1805ab5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7+iVifmOXwxts6+Dklk+derURNeDb3x1Ll2xUy3/F/SD2gNH0PBxMNtWy3fuS0Z4jeDNogaqsCMAT+unbQXqMlwQbIwkgXe/7WCgjJRJ4EuCNPwl/MAIZhvMlArwdHo5r7O+HSff5p2prg5bQlDW6p5zP81KFBAh2IqnceQMDgK6XI8IpLkMVFoxaT8cksD+WQZghBS1ACj2HHoHcUihq6/MIP40jeip/lW/zlLzYQfr5gWZ5ul9fyxduG27Abq8IAVDmeOhoQ2qejc8W2WMuWhdLhC1FjXVTbEY6Z+tjowuMnGSckZvvvH+0Gsnzl43XJjWH8I9YV8Yh27EeqfYymRNmelwrebv+d2UsD5MnV+5PmEaAdS0r5XhrIvodl6JIauvFaapsHCz8He9bSPsHd6/rWQOxEehpFD3zIqXm3TuTWPvtbLi7PB/ehLwQHZCbBFIwiKGaGUh32es2xgkuE3MofAW363tW45w1QpZzDoL3qWsHIrPMo2Qy8k/McYBFAe88K0BCjjZc7tmVOlhL7STcF1PrW7aBqBfQL1G/ksXFbBifLhUnzbuX8G9KXwcbofnzDcttAYkZ3zPRcW7FXxE6dVN9y8/GZtUuQMihZ9+X6lh7SvmtOdpDAO0Otw+LMtPeuPMJuth78R0gJ20EUqEWsoh7xf4JfalESLO6g09QMVwl3F5hoPPdviGPwKmb9LPYy4TkuFkCRgqC0Orrg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TzzijbvkUQnoeHKmq7hRgn+4VkCfS/TQf7ohR9tvlquw+MlSe/JTGGn0Dwgdz/Z997LFOfdCl1Yjpg44q6WwKE/jXE1gSX8O13sNWvBqIAsABDVzZSp6ZEO3aNCCynnHkJPZkNe/svDnUhAsUVYSvsrS6ryi6JQkxCjytmmnqXAfJsOVEQiGYYPhEMt4tnJ4ooWiHK+jWaGVQPcVNE/IZi+UE5GSZMxZ9LvsQV+3nnIrPILQR7tZx72ukBVUnogqVD3S+j593aVqRx0Sd3Jm8RkCOobpVz4WjFtO5PFExqqLuffStbHxonudRA5TubpRrewuiol6d+S6Cp76ASf9TEP7ajrK+sAW1+HBDSv/ncS9pXkkkxK3SmqQuOOah/ZOvzg3EF7OcBpgt9NKjzRA0bMKoF3m0eMjgWYMaT3ID/TZVNLE94K6FTz6onVo4au2
X-Exchange-RoutingPolicyChecked:
	FJJ6ncOzuRXgeDFKsSc4fJ/bte1QhCt/rb79MxJp8rQFm3thizMiwokZe47jvPmzioPI3QUTlMfL7NkBmsMSbVFLY52uEmz66of+yF30vjq5f9lwMTCOV11vPffP7z/qgk+xJxZxujjNiURPjO0NlLtzOAedafz5aNcBjBRfd45kjNAH5W7crAdb48AvUQC5j0X8kC4iz21631HXZSTbfIzk0CYX1e028eOCeqQczqHpSkHBMtSAKSpObCzBMvWRKJq96Qtwg0iH5PN0WO8pXFSOrLYqKQcmOgVEhTBSjs97z5I5Hik9vEkNm2/2NXFTDHBdYTHs6ywt8ibJf6ocYQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:27:53.7284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a397910-dd88-479e-cdea-08df1805ab5a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5878
X-Authority-Analysis: v=2.4 cv=Vou2kO2n c=1 sm=1 tr=0 ts=6ab1691d cx=c_pps
 a=ALJIVG5iHo/ZE5SKMfQyZg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=3V7uXGYgJxE3oTHjHdEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI1NSBTYWx0ZWRfX6G5+38Eo+9Nb
 1RY2iyWaMHhMspDqQCdHpvhn0k3vNZu1liaiU1i1LR9OsonaGC2m/u85ac8D7uzxwCWalQaUQG2
 bpiTE5eai7H/HEw3K948G6/155bfa7PwBGIVp9QSj5aK33BPBfb5ngUgBrMvBGXr/eQ+ALGCTun
 i+cloWwnoBd5TPrrF3YM2SiYUqXTt7NtNXVaSeZFdQFo06qf7/FTaA/pTAS31Lcp0gmoqVgsBJ8
 Jn+T/azJn620dt53ZXSlUL/O3l+LNMn86XpHJNqsOdfd9AmbKO2m4mqChl62wCQj7Woqt3lDjNs
 +tX4OYE2Vsb7zO3qFHJFcklX5rq3PmR8GfF6WRZfc4YUHujYjAqTRAXJrSNfLwcE4Vq26cNzM4O
 sAAhIDPIzIT4ZF8CyBlkCVwk/gFv3AWQndJB26lkIPmqB5M8k/Vun5nEYG9Y7c6X4/Wjeph8sXS
 lZiQfrRsJPZgLO8XDiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI1NSBTYWx0ZWRfX381vBJBs/R2O
 5rEkJg9ruM8syM8grFMPH8VjwC8i8uen8zM013VYyF7FwMmZPCtLbx//Ci+pG3+4WW//X7oUBUc
 VfMbwynsloh2DBWamyXKFpBZxyEreyQ=
X-Proofpoint-ORIG-GUID: l82YWqnufQY4h7HxMG_SorrStPp4tH0H
X-Proofpoint-GUID: l82YWqnufQY4h7HxMG_SorrStPp4tH0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210255

On 10:31-20260921, Brandon Brnich wrote:
> > > diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> > > index e836f0f42e30d..21ec9f207ff63 100644
> > > --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> > > +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> > > @@ -1002,6 +1002,7 @@ vpu0: video-codec@4210000 {
> > >   		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
> > >   		clocks = <&k3_clks 241 2>;
> > >   		power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
> > > +		sram = <&main_navss_sram>;
> > >   	};
> > >   	vpu1: video-codec@4220000 {
> > > @@ -1010,6 +1011,7 @@ vpu1: video-codec@4220000 {
> > >   		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
> > >   		clocks = <&k3_clks 242 2>;
> > >   		power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
> > > +		sram = <&main_navss_sram>;
> > >   	};
> > 
> > Hello Brandon,
> > Could you check, how two instances of hardware can share same sram ?
> 
> If both instances are used in parallel, then only 1 would get the benefits
> of b/w savings with this current patch. These VPU instances are in a race to
> see who gets the pool depending on which instance allocates the first
> stream. Current Wave5 driver will take the entire 64 KB pool once a stream
> is opened. The pool is not released until all associated streams with that
> instance are freed.
> 
> I will look to see if the driver can be modified at all here. If it can't,
> then I will find another node of available SRAM that I can hook up to 2nd
> instance. For now, we can drop this patch and associated patch adding
> main_navss_sram to J784s4 in this series.

OK - What do i translate this as? We may need to change SRAM / need
more SRAM? Since this is a pool, I'd rather have the driver use SRAM
optimally before pulling in more SoC SRAM - if we really need it, lets
send an update explaining the usecase where more SRAM was needed.

Am I correct?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
