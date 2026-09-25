Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DF24D7964;
	Fri, 25 Sep 2026 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352959; cv=fail; b=sw0KBjjOUCmiPEkh8pj69fe068Nhd5SIZRygV+3xWtDOID/y/Vd8ji2qMnr98qIQs7NnmzjOikQ+bsnoOxMxxizvSdSJEd+s5kJ8hrWZqytde0MNd8Zi0lF16OzBVtAan9c1CWV580kGKxGDCeHmag80g8HAslkFqOeSHFjFYnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352959; c=relaxed/simple;
	bh=I3f6Rc28esmEnPFnk71eMFRk++8aXwCTG4EudkMzgeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gbvyKPKOkhUxGQjI4DKXmnHr4mi40nAgzIU6U9onWUZZC/sC3QxOlL65AUVoKAC+vp57qkJRUSPeJejiKv7E767mbXsTpdcO03EXI7X3js077+hmn9qOLVZzYGcTWKWHs5tnh671sfgOfEfwqzWO9INe/XCyqUO5CXHd/Jg8P1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=PHN3heUN; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P6mtCxEw; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="PHN3heUN";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P6mtCxEw"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG1wt12962080;
	Fri, 25 Sep 2026 11:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Tgj0pJ1x6WPYmBNny5F7IjieDAqhdxo+8fFNU9Tw1
	7w=; b=PHN3heUN2aaKKna5msBRIFVpw3/V/Y7CRbH/ymlsl9onRIYIv5Eg0CB2c
	zZnROwSNycfIOJSbBGmzbbQLHtaAq1cAVDhhp06EVinXH6TIXenPbOBlQ7CkEwpd
	tCV3ImRTscDtjHLu6S5S2VeGYTrJgS1G2zWP9dqSTPruV+1D+ZvLZjssaZn5q2A+
	ZL4Bq9ja79HQQOHkGJD0rhYSho1tutoQT7uyerQbGFYHyJ8XmclKoS7v6r1DxfB7
	xO4QqciNbIkv0Plpk7rmaMW5FgPX25Dp6B8qVzZmw7tNHqnF745RVDDpRvJWbZnn
	vGkOHGbOYIufGisL0YQ2ER7cgJxQg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gwkhrb2qj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 11:15:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gatan409ed4dRSvMGN5Z7FO+ezrHgGcrqvxF2JIuPERoJcnvLaZBbMYVxhUFAkOXSt4zHRFyTsEpW2HtiAnNj71BMk+VjNajErtdAIUN5+Fa8B4h0vsqQpYmJm8MF4zJbgdWDrZwWt1JuwyAkP8w1nEdLkndLNR0KruEKSd6Za0GagtyYoRnJ5UP6lcy/pX1HyBChrK+Nnqv/XscyPpv4F6Lsouyj3D4MvAaQtx70B+FwMF4BkX1B5Cgi6P6dwC5pdu89UXMymIhgmIIwF83Q+ZDb0Hhpwejk17+Far29J6vT3lC+p1AIMQOGPRNUTz+Tr1yOSKLcwTUorK9yEdLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tgj0pJ1x6WPYmBNny5F7IjieDAqhdxo+8fFNU9Tw17w=;
 b=T92cOvNwLBjX8urF8ksObPZ915Pw21ZUp6EbJEySqgaGWjObWhJ+37XstrEoePX5WREBLVonesXYUvbDPDHG38wG3BQqbE4cIdcSuky0MxQe25SBXK/6TazwcoZUdH3iIbEQock0cyDawfbandSq1Dftd1bQRQ8++MWHxvnveygwrn/eq2n91HVBu7OfqaQksvx3SV3qTiSAF1Wpk1dCfRuIHYsaerC35JqrFr4gXrqJQ5vwZ0NSRbPHJoNu9mxJvoSWZC4CRhc+A45QSOKxTrEcJYO6hVptYD45OaSEi9Y237v4/OMWPzo3ewGIDn/eq5uMqaCG9riVfb/SGf3JLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tgj0pJ1x6WPYmBNny5F7IjieDAqhdxo+8fFNU9Tw17w=;
 b=P6mtCxEwN78c7fziR4r5oWWwU18hsg2RGKhS9URgAp4UabW4feiqNJ3hnVnSOF11UyrZHAVJ9ssbHOt66XovYW44cRyebi/muWmtEmiRU4404xwE252It7EPQECRhac/FhNNuM/Jh7NGJE/FI1YNYs8rKHgMVwSLk0JgID7s8wM=
Received: from BL1P221CA0041.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::19)
 by CH0PR10MB5193.namprd10.prod.outlook.com (2603:10b6:610:c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 25 Sep
 2026 16:15:44 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:5b5:cafe::a9) by BL1P221CA0041.outlook.office365.com
 (2603:10b6:208:5b5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Fri,
 25 Sep 2026 16:15:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Fri, 25 Sep 2026 16:15:44 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 11:15:09 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 11:15:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 11:15:09 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PGF4vY2154610;
	Fri, 25 Sep 2026 11:15:05 -0500
Message-ID: <09d30f40-f87b-4d33-af97-de8c1536f22e@ti.com>
Date: Fri, 25 Sep 2026 21:45:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: ti: k3-pinctrl: Add virtual GPIO select
 mux macros
To: Akashdeep Kaur <a-kaur@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <sebin.francis@ti.com>, <k-willis@ti.com>, <u-kumar1@ti.com>
References: <20260922102629.3707296-1-a-kaur@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260922102629.3707296-1-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|CH0PR10MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: fb426ba3-f013-483d-605e-08df1b2040b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|13003099007|921020|18002099003|22082099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	z85jC9/7pThrGEXpWnmbbPFrJYgld76dXt9a/sg0Sqg+paq9ANs9BJXRoqkhC2lLT0EwRIlSeS9wEMaF1RYDCEB7p5vGlBOd2Fgp+33h9hLsP0EFRNjFI6CtcrRj4O+D2T/ZQP147crxxmTv6wH9rXii0wWzshZoAI08be9YUtBZAhwNmb2ICPEgD1w5/MfDfxzieZDdzz4Ng0qAvOrZRcHJ7+/5NKW5caVNNJhfFUYTi5dwUjw0wySIHGbanHrHmdwckr4/CDyvZ20NVemdzChKpkErHLRNKWA9crhapGVddw9IyWYoW4cRg1dlq00bJbQ6XsjifOry7NP2PIESOr1qBy/HzS+A9WJJNn3nBkiCXKF3arlh2tbUNSC4iHATJNA2eE/n1qBOfQjXkFKqAC76buCxUxrrdOlmNLqYmt1j4YOEaM9lYHoyXRHH0Az32K7ZlqGOH1sq9fsUhglSy+KaygFqdS5ioMe9hA/BfQbd2EXEZNCNKIkSaZFcRGYvzBV+1lYsTIFC9HUx7xVU87NNfak7OodszZGbAAohLouncO31f52ktpcj1yWY2scaeZLJfyp53wGPIbI18I+0spvEezp0+24on1TXuVAIG2Hi4uBhhxECqBIdmwma0/wO1VrOuzDOfkE5FDNeP+rjT45TbK9qqy7FKexVkYwWyozPpmHfiAt53l6bCtFjDXMEtAbEkV2dwYMu2rF0IJaFdA/quhm7sn4GR60GCF4jU/G3+Bp60GX/GUOPLx3+5KAp
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(13003099007)(921020)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H/dTuZ3zIb1OtQ5abUzhGxfq4d/2kVx9ViJWRCiWq6AU1AHnAh0s8cU2moMCohxT3TfDKrk1QSj821nX159bAVnPUnd+rS3qz1P4j4LWiCHmRlgtWQ4TMKPzJzQlXkv7jLkNmdGG3z2trMfW8fHy0ZAxU4ioFbBmNjyvog9tIn13QaQu2Q3Ip4DvFX7pgcfwLEu1UxeoZM123fNUSOse8gqrTEk1x+eeflBg/V2EnxpN0ZsgLhpFrtfmWR/kL2KBic2hnB4f2UmIlEF/IDXRrHAcpjYsFP//43wdjCHenXU90NNtn3jVcIB/3hRRt+5k/CG/m49Erl672B6mjSTYeTs0WTpFGpc0NCUECvToXU53vKRBSjUJ0qhGUUdYlyjqvBcT3bNBptlNhTrvYE0gp4UlmGZvUqumVy8muzZCYWYA+W9LGrW34hsVteQIAsF/
X-Exchange-RoutingPolicyChecked:
	sfOTsMHBm3ygxCRjThC0J7WL6Af5gbZxFO/c9dh4RghFviA9Etuejfu5Re9eTHYIpde4WE0/IJb1f06NwRrpfXP5NLQNAtXM/N2HZnr769lCVsUqN7kF4CycaD8wcTemKLh3BQCQUmCU0kmdByX55cCsABi8aiSQuQi0hhu18Wgdk+njv2vYoj7dgjkldogTDGzjawBYorNXjvt0SaET/ztecP+KQqwGP4XUL8IjJ96lM46ngUbf6elFif8eXjAJFkb/KqCvjCdog1h7rB4YPohMWprMePBGSOmljISO9jQcXjS0TwfFJJsWhrmmN9qy9Q4hmzQAdGOBQ+5B6PGhhA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 16:15:44.7137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb426ba3-f013-483d-605e-08df1b2040b2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5193
X-Authority-Analysis: v=2.4 cv=Fv+QbGrq c=1 sm=1 tr=0 ts=6ab69e37 cx=c_pps
 a=5EMrObNM7I5xfgT5kXX3QA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=D0aBROiGLno-LiHwBcUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hBjpMXEa_77xKNCk2icSAkx0brUSqf4M
X-Proofpoint-ORIG-GUID: hBjpMXEa_77xKNCk2icSAkx0brUSqf4M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX6UBuKJSs0ALa
 LN+ewW/yhWFYSFcguNqsIz/oTonsJF1hcPaAHEaLLb2WtMNOwrA7QaAvuL8ko6NtsTUQ6a180h8
 w9s5KW+LVL6URRFBZ8lZvWk4J+zlBfltXsGv4Sb9UPVbQemctsM7fagh6d3AEzUoTO/xB0pNhdM
 8oTQdYwarPAuUqlHWlpRJyeL6/Z2NkgtSeVnbXgRXfQQBw+m2u74xmeD3c/ejFIxmW36lPx6Si6
 Pka2kSpQfAOrimzqmuwMeJmDGpRZy24M3mpM+z/SULdKQZ+isScF6n3fWjy9LWqZDOZjxUy+ewC
 FxIuXYbKvgWb2Am33/XCSkev2ytj14fIVs3XhvLvX8GK8xwXP2u8jIrqSQO/XZ2xs0n6YjxEGdH
 Cq8KoDAg4nbn0LTqJ+yZWMc8ZQtQtsHzcRPjcWcJMF+vGnq8frpKa1PeoOap1Szn+js+CqK5k9r
 FBk1jcbHlk+qMFTP35g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX1dkJsAYLugNc
 lUsMfncmO/tXYsEkzNGBQPS2WnEyxSSemxDUH4J88K9NHjk0Q50Y3b67suV1Y/Sfyr5O58/PLqt
 Q92K+KruNPjGLDKdywdJuOEKk977SMM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250064



On 9/22/2026 3:56 PM, Akashdeep Kaur wrote:
> Add virtual GPIO select mux macros for configuring the vgpio_sel
> field in pad configuration registers. This field selects GPIO
> controller routing. The meaning of each value is SoC-specific -
> refer to the Technical Reference Manual for the specific SoC.
> 
> For example, on AM62L, values 0 and 1 select GPIO controller 0 and 2
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
> K3 SoC vgpio_sel Field Audit:
>   All supported SoCs use bits [5:4] for vgpio_sel field.
> 
>   Supported SoCs:
>     - J721E, J721S2, J7200, J784S4: 4 options (0-3) for MAIN GPIO,
>       2 options (0-1) for WKUP GPIO
>     - AM62L: 2 options (0-1)
> 
>   Not supported (field reserved):
>     - AM62X, AM62AX, AM62PX, AM62D, AM64X, AM65X, J722S
> 
> Changes in v3:
>  - Use tabs for macro alignment
>  - Add comment warning that field is SoC specific
>  - Link to v2: https://lore.kernel.org/all/20260921063505.3986565-1-a-kaur@ti.com/
> 
> Changes in v2:
>   - Add all four PIN_VGPIO_SEL[0-3] macros instead of just two
>   - Use generic value-based naming to support all K3 SoCs
>   - Update commit message to clarify SoC-specific behavior
>   - Link to v1: https://lore.kernel.org/all/20260917111539.3844577-1-a-kaur@ti.com/
>   
> ---
>  arch/arm64/boot/dts/ti/k3-pinctrl.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index 4491898d8294..e8ca69a97b65 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -8,6 +8,7 @@
>  #ifndef DTS_ARM64_TI_K3_PINCTRL_H
>  #define DTS_ARM64_TI_K3_PINCTRL_H
>  
> +#define VGPIO_SEL_SHIFT		(4)


>  #define WKUP_LVL_EN_SHIFT	(7)
>  #define WKUP_LVL_POL_SHIFT	(8)
>  #define DEBOUNCE_SHIFT		(11)
> @@ -111,6 +112,15 @@
>  #define PIN_WKUP_EN_LEVEL_HIGH		(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
>  #define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
>  
> +/*
> + * SoC-specific field - Refer to the SoC Technical Reference Manual to
> + * determine which GPIO controller each value selects.
> + */
> +#define PIN_VGPIO_SEL0		(0 << VGPIO_SEL_SHIFT)
> +#define PIN_VGPIO_SEL1		(1 << VGPIO_SEL_SHIFT)
> +#define PIN_VGPIO_SEL2		(2 << VGPIO_SEL_SHIFT)
> +#define PIN_VGPIO_SEL3		(3 << VGPIO_SEL_SHIFT)

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


> +
>  /* Default mux configuration for gpio-ranges to use with pinctrl */
>  #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
>  

