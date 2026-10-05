Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D13E2AA1;
	Mon,  5 Oct 2026 22:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239642; cv=fail; b=cDeTdU97RvLQ/nZ9amZABQGSudb99Z+2JClDEP0LqFfz4cepMN8Zt81vCN/tdSO9pACfv3gmmMfFEwE6FGjBDbLcn2WxUsYA0IlMGl3jwEooD0fK5UbbpcdqY/gLheIgg9FKQ+Ls0PhYmyrv26kEgI27UyajiO0dxLW9bHnq+kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239642; c=relaxed/simple;
	bh=QpFpITaT8Gm+59arT66IuLWSgt+wXvwzNnjAsoapvbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kQglbNMUsJfaasPXUnoE/CzEa6KFI1EwBeXHYL3revv/WjgqIMcglSu6iaAF/RZm5lAdY2anpBWjQpnwsagmD6GBnQjTuPpr1g96nm9CCMyWU4kuZSHnLfgHTzrfrNTPqmM8bv2TJ09Di2h7IA+qG3loygPNW2kjlO+NTY3GeOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=RR2Geblb; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=KOSNomFZ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="RR2Geblb";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="KOSNomFZ"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695HKlRQ323156;
	Mon, 5 Oct 2026 17:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=y3IYq/fIvavp45cfZibNPr6AGBSFZHJrxfoLYl4JO
	3o=; b=RR2Geblb+6NIRH2edIb0Q9TEe081nVoDXV+p/PX14BLVjpDSFoA8c9J7G
	kf3C4X73QuWBstjpcPf+RuxSqte1e58QcQCeXhjm/qzzvpO49DnpTHOOePRfm9z0
	Pc+6zq3B5pssp6qioJAr2tElO+wD9G44WDvjjKaPp+If6GSEqbTOlCMBOKbDtGMC
	Y5ynE6nJ4zDmoXAuTV8OiOiqnApaDnt0pOQJY74/fUjYEGwiTmIulnFbIUKIqwkY
	9FBX8UGDLpPsyjkhY/lDgv4LOvoc/8hKXW3zblyCg4N2teIBt0WcvL4Y1tY9F6ZM
	rF3VN5k2ttJbSwKkOGyYQOuIjWJtg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011030.outbound.protection.outlook.com [52.101.57.30])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h4d7du445-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 17:33:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KywpWpAnh7aLAhoqiU18N5qfUZGsgwCiG5EfM2M5xx11V+fVpbhOsHh3P7YuLCO7FGKxbCroW6xw0Q5XwwVemN4nfQ9Lex9MHR5Ry0ZkNIoRZT/C6rRELtOsm+z/eRMwNNUSgLhHr0c6GdWpLgpExuWpT0ZiWmZsAf3oflhmTcVThXu2ngqZeHSkNe6vPc5a9abEU+0X3To/qJwRSQ/Ln080vto6xcIc0TJWiUxIbC66o/ziTrv91LnT5vIrhKpeRDvgDICFA87A1YfGRNzAK3Kvh9zQbLgo7XsHQwHi7IXyocYjrXKDWvnP5qVkLVVu32xVwOZPb3T2TdYaOUKkOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3IYq/fIvavp45cfZibNPr6AGBSFZHJrxfoLYl4JO3o=;
 b=IOwmgWKLKMBsmK/ZDHduDTbrZUsZ23mUcTsOSHvfnmGuXxLW4n32gf9Ix4XhAqoH9kWT1uO0QRzSbo2EUEDytbt/tHD3aZLo5GAwfFvUwyqzlI0AbcHy7BMsN/1GgSFWGErvHuj0hq3mTWjch0fZdQV6RGV5g6rholz5oxtfXJXwPRDMapjGEnfwhrA7NixbcL6UhqD62UW1q/mXvXGJtEVSfBuJWdJxysYYCtYYOWhrAijwZbdxzNp/TnRzM+Wn0J9N3/sm1eUz/Baj2ak6NCi8jaPdm+lI2A0pWZvxRCquyLBKth8yIwuTvygf5gsT76/lkQiHZoH25uAJvUJlSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3IYq/fIvavp45cfZibNPr6AGBSFZHJrxfoLYl4JO3o=;
 b=KOSNomFZoxVtPOGJN4HMPlJIk2AdLE+B8AfNcq4TQvHqZ4mrq4eyfiCBcBWf73G5wXY6zqfngfUhcvIsAGMF/7tKJweAxx0YwwH/hVonA5R4JThgXWFU1VLMvEBs3dqWw8f9LBm8ajO9gpkWo0596m0j/z/FopvcOo6xPeF+PyY=
Received: from CY5P221CA0139.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:6a::27)
 by PH5PR10MB997759.namprd10.prod.outlook.com (2603:10b6:510:39e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 22:33:49 +0000
Received: from CY8PEPF00000052.namprd05.prod.outlook.com
 (2603:10b6:930:6a:cafe::8d) by CY5P221CA0139.outlook.office365.com
 (2603:10b6:930:6a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 22:33:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF00000052.mail.protection.outlook.com (10.167.247.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 22:33:49 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 17:33:32 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 17:33:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 17:33:32 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695MXW7s2001959;
	Mon, 5 Oct 2026 17:33:32 -0500
Message-ID: <8fbb7c50-6215-49cd-b2f6-5a067a0f96d0@ti.com>
Date: Mon, 5 Oct 2026 17:33:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: Add k3-am62p-wakeup.dtsi for AM62PX
 efuse GP_SW1
To: Moteen Shah <m-shah@ti.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260922165714.425576-1-jm@ti.com>
 <b82dec19-02a9-4b93-a2bb-3cbb6f33ae63@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <b82dec19-02a9-4b93-a2bb-3cbb6f33ae63@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000052:EE_|PH5PR10MB997759:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cc2c43-cb01-4163-6ad7-08df2330ba04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|13003099007|22082099003|18002099003|4143699003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	oEi5WhumyjkZObZErcTPm0vWTtYHat/5oHqCbsx2vBlvj9DBNh3P6lctOece33zCAe3gk9sjYZI/chQ937stfl1UhpR/rrQbEuAOekvibvRqFL2TLuGMK8F9zOGPmwnsV9B1BoZaHn4HLDfJ5rwxhcT9xBKQ4E9UeSqLHqskB0tzKGOtf515cu2WBAc0+nbUkRJTNRZN0L0nDktur1Ag/Jc1i2ATFSGlF6K8MQw6EqQOfGvxi535yGFSsDYsEymu5TEYHfdV1l14GQaErt3wSnW7qnJfP+3G5wVlL2Zcvzzm79H4okaq2w2lrzvzpcJcMcinVfd9sHNMbX34xPWszrlF7vtA6Rqa+x7cSXtl1/y45mF6DyyDWf7BEIx1BoOu6YaODFGY6wxkSFYYO8UIRgy8IEk44wrDGeqG9IHLF6WmCNQzkX/bsMOnjfxS7iEoC4rhvkipLvUXSsPkMTWzLLEpYkVLwKGHXx23MujgC0qohIVZqLtmr6BpnGYd3WFWhA6pZ8Ih41U2GSdkN7MPj5ynGnfpC0XRr24AfumpeSpXeDY0pUWANJKOd9fFdVmysESYfNCOefA1Lmrv1/vCZl678iP2+lqx9htNrBKq5gkAw548l4m+UtHaZkKn7h1Ezn3XDGZBb2vC2nUnRXcQog==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(13003099007)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/w7W7LOyDrEmq1gTm0lSlBypwZzYwm2KdK/mXbmroome5t1sXDEa/TyZd+MvfRFVrtvTDPJSVeaN7vVV/cCwfKWd3RRjqHUpPQTODaDBMyOr5J/osyXkQZdGTgSNTlx2se7winmyvhDU/sVkz94j77HLf/0TEKifxpTdtWR1fkQIET9C5RMlIH6PMqCUhP0OQWtP1DiL2sI78v8zT16uxrLyyNW+jsu0D21bdZxRVuVEyRfBz8AoVhDt+lqmgtxceUFRBwHgXPB9lZFK7tdbSYURkj/GUl/plH1DrVN87CE6bXIdCrI+f9VSm1XzZMmURTQA/fl2flqQVps99idNPXEh7M92H5tuYsIbA1XZKI1RrmFEzy4vbr5/cSx39h7Kp/DhU1Hxxto94DS/AT3WoKYa3eTYcjvLqsQyoXhEUg1OCAsM7ku5qib7glNo6irQ
X-Exchange-RoutingPolicyChecked:
	W/wn4jAGElve3AfBt2d6FVrQmatASp8MKuPAEnVKKRvYdJIGRax9liuiQVyrxjePIel3BA7OQLWoqqqFweYoisUGBGH8qP4phNsb70jS6/IH+nULKxPC7JYZS/a0TRKUXPUOy6n6b/c5UwLXKSXaRIxuax1AVahaj/hlLpCTF/5lYeXq1DnVgxf/372hyxVOKj0wJxbJ7y1FIri1n4+ZvW/u4K8N4M5xfO1Sss48CN2lbtwzCpkOGLKyIEOrOtk0itEclELFCu8sfTx3oyNldoPifSeRcX/Uvl0vRzgMRYblgLsevQJyAGgxLXWFg/Cqa0+g6tEVDY5WNzsCTSibdg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 22:33:49.5340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cc2c43-cb01-4163-6ad7-08df2330ba04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000052.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997759
X-Authority-Analysis: v=2.4 cv=AMeVrcbb c=1 sm=1 tr=0 ts=6ac425d1 cx=c_pps
 a=Ye3bCMmY4P27VUsoh7mwQQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=WiYW2-Lz0-wOPB_NMeIA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=z2U-W3hJrleVIN9YIjzO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4OCBTYWx0ZWRfXy9mDDvklOIZb
 WSQ3Z/eJ395+yOjzChwueJz3I9kxL8+cKH0aOuvnOcutf1eJKGdLygIAFNRm5t0xflWGLeAvjrQ
 qfbZANJf7vVkZMtuAyoCfFjz8TfsaEc=
X-Proofpoint-ORIG-GUID: QVbnunPEFpiIF1wEbinstQIS3pJgoTYK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4OCBTYWx0ZWRfX4heV/bh1u8X8
 ne8encn6BwiyLYh5vpMkFY8TSaYQAuGPm4L+w1i/4dewWI240kZtbSfQB7R1J2qPrCRHWwtcbd4
 A6DsoxCRS5lcMyHglDeQHTM3ltKTr4FpbnvTmDHIQBAycFTso2Nfaqrg/4er1cM01XyIzL/PS7u
 gsA7rDw5x3I0mZNG4JKR/ElkzR16H+3/ArOrTCTBRw6tJYop3SIl4yVIEcye2NMB+cRZG2LZunK
 UZTVhpcGPzXY3Ad1qLOaFV5nC/USUuW6ZBWbUyt1BWJUFPJcbVW7cMIW/ONl8Sv7DPkplbqnTYu
 lwJcl2uaze4Wuf+LJWGogPecPv9ZyWAFugFejRsB4yKYphreN5bIdEEYDxE6Xl4wamWxAZBKSBj
 SDp9FS6GDHuwNZ3e66QHabATrXV0XyJ0E5yHZTYwh9uKukX7r0BmZ7I30CzdoUpkVoX1rQvYXj4
 Fjx+OS9ia32NJFxdCCA==
X-Proofpoint-GUID: QVbnunPEFpiIF1wEbinstQIS3pJgoTYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050088

Hi Moteen,

On 10/5/26 10:44 AM, Moteen Shah wrote:
> Hey Judith,
> Thanks for the patch.
> 
> On 22/09/26 22:27, Judith Mendez wrote:
>> Create k3-am62p-wakeup.dtsi which includes AM62P-specific WAKEUP
>> domain nodes.
>>
>> In k3-am62p-wakeup.dtsi, add the efuse node for GP_SW1 register at
>> offset 0x230. GP_SW1 will be used to determine AM62P silicon revision.
> 
> 
> Nit: Isn't GP_SW1 0x230 + offset? might need fixing of the msg.
> 
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> This patch adds GP_SW1 efuse node for AM62PX only now that bindings [0]
>> are in place.
>>
>> Changes since v1:
>> - Move gpsw_efuse from k3-am62p-j722s-common-wakeup.dtsi to the new
>>    k3-am62p-wakeup.dtsi [1] since GP_SW efuse registers are marked
>>    reserved for J722S.
>>
>> [0] https://lore.kernel.org/ 
>> all/178942274041.683176.599438200260103620.b4-ty@kernel.org/
>> [1] https://lore.kernel.org/all/5d4742fa-e26a-4b49-8eb4- 
>> b6291c402334@ti.com/#t
>>
>> Link to v1:
>> https://lore.kernel.org/all/20260915001304.3781247-1-jm@ti.com/
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi | 25 +++++++++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-am62p.dtsi        |  1 +
>>   2 files changed, 26 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi b/arch/arm64/ 
>> boot/dts/ti/k3-am62p-wakeup.dtsi
>> new file mode 100644
>> index 0000000000000..c56fb3890c983
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * Device Tree file for the AM62P WAKEUP domain peripherals
>> + *
>> + * Copyright (C) 2026 Texas Instruments Incorporated - https:// 
>> www.ti.com/
>> + */
>> +
>> +&wkup_conf {
>> +    gpsw_efuse: efuse@230 {
>> +        compatible = "ti,am62p-efuse", "socionext,uniphier-efuse";
>> +        reg = <0x230 0x10>;
>> +        #address-cells = <1>;
>> +        bootph-all;
> 
> 
> Nit: I think the property ordering for bootph-all doesn't look correct.
> 
> With the above two changes, if valid.

I ran a DT checker, and it says to put it before size-cells and after
address cells. If I revert, I get these warnings:

+arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi:13: [property-order] 
property '#address-cells' out of canonical order (should sort before 
'bootph-all')

So Ill leave as is for now, I will fix the commit message though.
Thanks for reviewing.

~ Judith


> 
> Reviewed-by: Moteen Shah <m-shah@ti.com>
> 
> Regards,
> Moteen
> 
>> +        #size-cells = <1>;
>> +
>> +        gpsw1: gpsw1@4 {
>> +            reg = <0x4 0x4>;
>> +        };
>> +    };
>> +};
>> +
>> +&chipid {
>> +    nvmem-cells = <&gpsw1>;
>> +    nvmem-cell-names = "gpsw1";
>> +};
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/ 
>> dts/ti/k3-am62p.dtsi
>> index 9d6266d6ddb82..058f264ee0646 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
>> @@ -154,3 +154,4 @@ cbass_wakeup: bus@b00000 {
>>   /* Include AM62P specific peripherals */
>>   #include "k3-am62p-main.dtsi"
>> +#include "k3-am62p-wakeup.dtsi"

