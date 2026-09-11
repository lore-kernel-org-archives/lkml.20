Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA57F4A3877;
	Fri, 11 Sep 2026 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145754; cv=fail; b=fAFOsTGNLPIUzMnelXrYd7Qh/cmtr0SZ/CuSwewFncDfE9LVwuwxFV9mcNTURO5NSL14p4Zt+q9XwQ06y//jf4sClCM4AdB3b6Qe6iJVrqgQvIw3mKf+fdvp81zc4HPEeFovl49YKePGYbwimO9xNhE/+qm/vyLJLKaftQLp3uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145754; c=relaxed/simple;
	bh=UPqOdw56mDUIL8mD+bFDOsxPUx+WWcTpCHclmLUXl2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cVcKr+RUa7uB/1lQH6+ytp5Qzm5u08XsS6d0YhxAc2gS5GZJIzGUEEGTfUaQ5SuOsHisa+CjrAAxymTnIiwb0tboClXF/ZFIQv7NTnpL6UJpP9YqukL51E6VShCO3is8F27t7BVXEykWz6Jwep+Y88rNB4+Ih0WP0QOY8E1T2g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Xy0i9XR0; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M546PrwJ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Xy0i9XR0";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M546PrwJ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEjma72222273;
	Fri, 11 Sep 2026 11:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KTa80jqO3svUzJMaVcOA3t7Su9Pi/nyY1Hhx3Hsg2
	m4=; b=Xy0i9XR0wRRLh1+uR9H6fqo1knZ/jjjOGxMWjlZ+xoqSoFYT+s3Ak5KLD
	iSP9uYFh786HAWzvcIXQmWAwu8IIYsMGlpyxjn8KnbFskZeA2Vs3SXl2a8kHjEZx
	LaWj5PgMTPO0l5qxoGacWZU7bfp3S8FfuX/HN1Ywgo7yQD029/xZff6dYS7NIUX2
	wRsC06CNYfvD8bp6I/YYHRHGPiL2iRvb9oUJ8ns7i81zcrXjV204b3s71ZgvIHWC
	6h/NCSpq+GMJyhLOTNGDxsyJKGvo8W/kFAjm2TAQMGFBLUcNWyEHlVSxpJcY0jnT
	q6UMOwBjVJ+OGcN7g4HP76uRGfrbw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013014.outbound.protection.outlook.com [40.93.196.14])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkyw9qs6a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 11:54:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzO3Rarw7+AKSy+i63jsy5+55+3NAMhALQQiNGUyWD4dD631pYm42KQPwR/8rIZN3R2lqU/YFv7IX1CK24SVSGqjdAu+n9f2O2ms8l7E9DWslJkSPZxJXFmsHrt2Miil8jg18ti0WmoDrUtc75Of7QUsBzGLGGNjyWQ9JqY41h7f0IMU7dHWgF+hF1+NYeBQPBYKdu5Vua64+OkGscrbKtzYenyoXGTR6BBk4bipB9ngGAqqykCkQyGd9+pMpcswyQu6P2fS9iN/M+LrR21z1yuftd8oF87VYF3ZdE2+QEKnhVdwDlt3m7STH8bzK1lD7UJBW15d6KIEcb5TuB85qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTa80jqO3svUzJMaVcOA3t7Su9Pi/nyY1Hhx3Hsg2m4=;
 b=IvSJvMmVZaO/J04qfILW+ZX10D5JqAKTbD/wv+ZdRnqH5nJvQqUXF9Fi1DLmrFsnRsOJhzQ7u6U46oCecJLcNCvxbkOlUrQVnkNZEENuC2TUu7gOxyAwAdq6b76eleH/mRrZNSDzJ53FUhtYqT8g+K21DDW62tPEp3dr7V129+RvQuvUOzBX2pxvwKGvjBebZYAngSG8enWyMjN75EX3SPK5gpnZJuc50PppfBhEms58ePHdoaDbj7R9yGdkWRz8anFqQh9p2TukBGnvaCxe1bBfyt9gmSPvsCRsTvEZHjBXV9BElCdcsOOEbzbBrb2InX4VRKM6abPkQeyyUJ2EGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTa80jqO3svUzJMaVcOA3t7Su9Pi/nyY1Hhx3Hsg2m4=;
 b=M546PrwJ8fj/MFJ4hn1lXqPLqniqyNcoQPQTfa7YHYJ1/edIxAdcP9mdI/MLijNdvo9+jK6ZyIZezT/Iho4nZvLIi81/wpLyAZ99AP1OXcxO48hlTb1d2/s0oRRTvKuKJ1Bpz39xJDJOo6SkyPCLP7XK9fGhJhly2QHVBGzusUI=
Received: from DS7PR03CA0042.namprd03.prod.outlook.com (2603:10b6:5:3b5::17)
 by DS0PR10MB7067.namprd10.prod.outlook.com (2603:10b6:8:145::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 16:54:52 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::97) by DS7PR03CA0042.outlook.office365.com
 (2603:10b6:5:3b5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 16:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 16:54:51 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 11:54:31 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 11:54:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 11:54:30 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BGsVBE473052;
	Fri, 11 Sep 2026 11:54:31 -0500
Message-ID: <134505de-78e1-418e-8cd0-855697633696@ti.com>
Date: Fri, 11 Sep 2026 11:54:31 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] arm64: dts: ti: k3-am62a: Fix MMC0_CLK register
 address
To: "Kumar, Udit" <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
 <20260909214743.899477-2-jm@ti.com>
 <9a1146e9-0c00-4348-b1a5-31be7c597eea@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <9a1146e9-0c00-4348-b1a5-31be7c597eea@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|DS0PR10MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc4968a-7b40-4c51-6ca6-08df102565ef
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|6133799003|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QnPBxuNBIBmfwb6HN+1sZFxOdDfrTwFTJ1XNStnxV4U7Msmo7l4uuJfMomOIlsbyRZkbGYWoKFIistMefhsWo9DjeVF6SqTUT7CNBY/C/vjF/GQ9Af5WcdmA/Jv/bJMCbUJ+JWUyvxpTvfsCdk/x5Z+gXp8G3V1so7X5jHt6KkDWdOG47RuYZYxB7tPHJ3K3DqFZMwo7meQhNB1IsPuDUslGTmGyruZq82ebKJHzgwct+qdkfX4t1VAh/lywggwMdk3e6YZouYJNLWP8AeRy1kvMWoVn7yvyVCkl4N0jSN7FCjVEwpNuoqKzCq2oQ+H671YoJAkhi+bDQRCeJsogc1xJLc4Lh/PDL1hvkbjilmy4zwYB6PzfOL/IVz7Q6I90iTnhAMhGuTPEHNnUhbDkrOG3RQuKNrmdLj60EVoQJCqqDXk6V77dlRiRQSa2gl1E9W/1d4yLKfgiX6d8Q6G/WzMz353+Mys8msfhFKhlYQxAF0VheAhq5NDPoraeZ782H3slLvSVdZzF0oP2Sw5If3ndLsSZR/+PfNio52UnkYOOywVx5X6Van4GDegE//PJeUhRvixJ0Mo30svFBzuGX4rgOx1pDA7h/e+Nf0OzKeAG2zKow4mFQTw+csbm/4b87tR1BNgumIUVqbp0W5WK4dGGR7+HraboHHW25Agrq9UFzVJgF0bZbnIkU6s1GY/1nT97ybG/uVsFn3LyuQNp8g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(6133799003)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZjIl0ZX1mlFFYyD5Sb6zHwg6jCBMxx+rGtzFwdrliVeRAYJdhMTqVTYJeXl67jvJZbtARIE1DbTqjPDTN82UFh14qIyPhWhGqX9+QQ+dEGO6uQq+rWlzXh6yaQRL4H53eJuDITG6YUm7gy5hSxiVKGemZMU/Enp6lR8/li3D0FVXCx7M8wbHhh8I0QwVuN3/FxoApEHBzalhf3Mb9y7EM93y1Ws1Q4mgn161TLFHoV/TELyhxTBBr9TANh7DDL1ZniMkfylNfbd/OgbElOayMZXcrfAAq5lpvqsiA1z0sQHD9qGkGsHyJoumlxWCU8sI9OL5/5A4/t0sAqPQpdKGzttn5/0u2D3kZpY+H8Ib2WFJks8bb++GCbiEBslZZHVuL6sS8FnF8lPGhyXQINBy/LP6Gc8dhzkpP6VQBCa4grEQ6V6HdIfX0kZ6PWfQ8uGm
X-Exchange-RoutingPolicyChecked:
	a+pAMjfmuFcHEK9z54B9OnRB96KvBGG542fI07tJ0b/L+mte5l9cebW0MnQTB59jJYYLIMB9plu5zIkphhFVEg/zB2huAjdh2x5wMSptG6wyDHt4imXQqxYSKpiwoQO8FoNZqebdyZfvhSFBg5YqOap9Iv4AjEfxvB6mxnYyHxDtKKqW0V0FzkedVVN2BquBm+vZ/xOVa19IyTE2GnQTFsi0V6sM10phuOaaec5dGI8fDoFBlNFsk4/LHKze1BlaOGOaHYm6/keoFwLPP3k8rdxnpnvRCp7WGro3nnbL7Z2vTg/kXVQsUmHRK5ofjaLaF8CD8nzLT6bf25zi7dHLYQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:54:51.8873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc4968a-7b40-4c51-6ca6-08df102565ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7067
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNiBTYWx0ZWRfX258QYiKRHiTb
 LDiRwYLhKkSUi6OZKtzEmkESGK7192vQ8z+64zXZqYwIcYzhbc9VI3ihF7FQ+2p+3pxhD7lWhes
 R0qq18ynsk9slJ4MKDhVB2lHwh8/yBE=
X-Authority-Analysis: v=2.4 cv=ON6yTiaB c=1 sm=1 tr=0 ts=6aa43262 cx=c_pps
 a=hwAR686YzpmZ7aH69gEPcA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=XRC_AYY96FsfdDYP95gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: I1H4ps_Z1Cwgcorq-cO0NoK4MDT7jo9B
X-Proofpoint-ORIG-GUID: I1H4ps_Z1Cwgcorq-cO0NoK4MDT7jo9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNiBTYWx0ZWRfX+93gNCtGurMS
 KFZURfFOPN+U4154wmv4xwSgRFni+1kSRGSQZFAdnQTiIFW86jXGGbfgKSniXO7gVfGF4mnHDXE
 caBMYblci7O0S+ltqUoKAa67jrwOEe9q8afQ6LtcpnZYRewHAGWZywhtqGmHHnAxE2j4vGPb9og
 TPAQKMm+RexR5wH3YLTvZFkiIqNweLbZU8CF/VF8hrDlcyZSRyJGfK4q+px9dSjRtXiKF6V8fm5
 jOH7VtDzWxDrVlEGl/2ItzXjGJkMZeGNGuphfSYO/x6uf/YtZwasLvNmchLsNJtr5NJkmmzQaJs
 APl1PU2tSyGIvxjImF+JA+WpKa/QMd5hVOILM+rd/etv31AYQlENw0b/8myRtrUJq3m7gu1NohG
 OhKDlCgISO2KjYggw8gMh5aXmcNiGW5BeW/iEeziuMW0PUxKww6tylBUrNzWYRAjGc6dD/Kmff0
 /F4oHCK1H0ZEVXs8a6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110236

Hi Udit,

On 9/11/26 2:57 AM, Kumar, Udit wrote:
> 
> 
> On 9/10/2026 3:17 AM, Judith Mendez wrote:
>> MMC0_CLKLB and MMC0_CLK have incorrectly swapped register addresses
>> as per datasheet [0]. Set the correct MMC0_CLK address and drop the
>> unneeded MMC0_CLKLB pin configuration.
>>
>> [0] https://www.ti.com/lit/gpn/am62a7 Rev. E: Table 5-1. Pin Attributes
>>
>> Fixes: e041ec6e86e7 ("arm64: dts: ti: k3-am62a7-sk: Enable eMMC support")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> Reviewed-by: Moteen Shah <m-shah@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> index d3b3675e7a8fc..b04636cab71c7 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -328,8 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
>>   	main_mmc0_pins_default: main-mmc0-default-pins {
>>   		pinctrl-single,pins = <
>>   			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
>> -			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLKLB */
>> -			AM62AX_IOPAD(0x21c, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
>> +			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
> 
> Shouldn't be MMC0_CLK be o/p, instead of  PIN_INPUT
> Similar to patch [0]
> [0] https://lore.kernel.org/all/20260909214743.899477-4-jm@ti.com/

Yes it should, and it is in the same series as  you pointed out. This
current patch only fixes register address as per commit description. (:

~ Judith

> 
> 
> 
>>   			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
>>   			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
>>   			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
> 

