Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D6F3B994F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795182; cv=fail; b=miiOYZYZJCqFexirMKaB/0c1TBd5YoMQazGwtsGrC3JZb/5OB/boWXglPIvTdgD4DVob5FNUYUfHIrRjjcz8kQn2hTn1fzQ7I3gVEc6ZW0ieT+yAe5xQ/qCSNvq/5fM7KxESVP15yIDAm/O1fW47l9YAvniODzo/s0f/l6IhZ9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795182; c=relaxed/simple;
	bh=6hwWjNkHNqGUmxaWFyoxFv2+rw5My+QJQbz7YUjGEFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LT1Q7EG612vzgnkV9i6JYoJwR6b1L1CFRiU9d4Gm8E0XnqkOYVfOwNXUaId7pbGayo0dp0rFvY8qeSNkw2jNc/qFT5bCJ6bxQ37dHFaJQXQ1FG3oYug1pSWUop7dWmt2psR4ng8QxdGsgIW7ObOudQyVAktbDhWQcSsofU53NDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ZPsgx6tF; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=bqFDTWcH; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ZPsgx6tF";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="bqFDTWcH"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UHfGOU3755908;
	Wed, 30 Sep 2026 14:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0SLZJ2816Ai+Fuh0HasewGcjiVyulY4FyEpbQkTyC
	bM=; b=ZPsgx6tFoH190MPw095QdtR2oHVpXO9IER3SXzXkYGq53sSv8A/h2ilnF
	EF1fOW3NJAeshiNn8/HrBQmx2CngEipw9EVB1ow2NtI5emTPbS/mVnCViMRQpbJ4
	0sCAPSrc42CVD+DtBso8nUn7q45/K4XHfRxudM4Xvr4CACitUPHQ0Kzn9LI77CoN
	Kncv2ym+k+57ZEB/F9fn5c7DcnG6dSVjRhogW/5hNvzt7pW/pT9pLQcq3vDsnBEi
	0jDl5Gb7EbDxBs4MctxpGnZPwrufkEMkykTSdHYkTnJQxhRxdeplOJo83EPFSUGQ
	fE3Js8GgTbpFKxWfGAZt5ngHbQC8g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1tvw6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 14:06:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdtyXNAi6COHdxG3JcIBZrc5V4yZqkcq/oV/pBnOtzZf8D25+xL/s2O8ZOI4uEw+Jm/XO3YW1oypDqpDSswCLH2L7+Qti0OAV2VLSs39dVTbiV2IpR92l2Wu3uqn9m0W6ak75KJ5a7fTBP9iJigvz4CPZA/0JBKFvC6iKj8TIee1QSLO8XFD0JHjsR8IReS9ADDpMq+cf0Aq3lLSaRdLt1XIr9tML7zpXXCKIT7WMdGPVIDiF3PB9uJnbd8v2vJgK1llmp4RQkEf2F3Td6s7jsjQxRf/spj3shRBlcVachXZc6TVHk66RdGy70AXe1aquigxaoGS/mZQa7JC4hbvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SLZJ2816Ai+Fuh0HasewGcjiVyulY4FyEpbQkTyCbM=;
 b=vpLv5qN2LzA2f/prFxmwS05o5imOulqXPWIe57V5K6lD3D/ZMobDTiVJh0PK4mkLZUPN5nCWuJhSyJaQhacgy8q6g4IaDJbmk5mfq3p1bq85qO0tEviCFt0ZWXxz2ZLP0NxNmuUPArqOZay9TwDONoeFWGGxu1T8QNC2OUuXWh32LYy7SIzkRlIpbPtYRx/wxj7wKcZ182uLulM3cXy+oHdU6KcGvlbBK9o1wWpAEYBTClyPkfuMhEziRPdRWGYKXfOZK2NjTJkX/ZIfFHn7K9etVEUvAazCGjECyB1rcbLU5J6s65TMrzlpm6HnlkKPs4MZPj4u49bWPH4wZgpMzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SLZJ2816Ai+Fuh0HasewGcjiVyulY4FyEpbQkTyCbM=;
 b=bqFDTWcHhrdGvAptbktJQueD2+Zk03dzqM/GyfefaK5thwheZ/qwAdEKHFOCf1MK9kjRUTjHf+fkSaTTkXn5VFwWyaAb0jbjFJEtGoaZMlWyhAYY4VAGcX4tOpiFzium5ggnwceQ26LkE21E0UJPmRCcePFjT5ZoG0XJcF1bAfs=
Received: from CH0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:610:77::24)
 by SN4PR10MB5558.namprd10.prod.outlook.com (2603:10b6:806:201::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 19:06:14 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::5e) by CH0PR04CA0049.outlook.office365.com
 (2603:10b6:610:77::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 19:06:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 19:06:13 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:05:53 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:05:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 14:05:53 -0500
Received: from [10.249.33.42] ([10.249.33.42])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UJ5qSP439893;
	Wed, 30 Sep 2026 14:05:53 -0500
Message-ID: <19a772de-bd07-43d8-853b-8f68b262f996@ti.com>
Date: Wed, 30 Sep 2026 14:05:52 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/22] firmware: ti_sci: Move the huge ti_sci file into
 its own directory
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <ssantosh@kernel.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260930160607.2674980-1-b-padhi@ti.com>
 <20260930160607.2674980-17-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260930160607.2674980-17-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|SN4PR10MB5558:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3ad4b1-2838-48e1-4a78-08df1f25e59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|6133799003|22082099003|18002099003|3023799007|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	NEQRC4w+lCLxxOe6biLmOqQAFfjGowLNZb+W7rpD+o9lAYuuXZhn8kOrq6E8Q5jFWXaNST/o6ZNSo8PNy9rkPCDkKr1jJUIOsuJZr1daQ4eGYgoTIsV6fHqM02HmUQTQWrgo4uJgWgxlCyP0B51m8MCFJyiPLxfKthJvGNZmaZN/Rsl1GhjLsbY8DgRPiaWF2JZhVgAyveVhI6OTTvg6mkrDylGSub/GS9jd6avFN4tAqaw48vKk4vNvB8ArmI4sT9+9dhoj3GFiF7i+cldPTx6AZyktCIDchtfNx4Eyom8HuBBppuUD08m/44MtkAI7D3cPk1RAoHcb3QG76oTyjZ2vd8OSf1TSt4l7NT1cVWq7oSU8FmkXx2yShsOOrvpjN7Xe45J7cUlMyRKxyz7QBB0XWzzMRahq18ZC+XINDr+oJNZxr0Spx3VeaakcUDvy0XovtqAX3d5T6mmKrFt/0a5R65yJZZM6GuOrwbB/FTIpyjva049VTHHxnHqY7/3Mpwf7NfaqAVplu8kAV8hmt4njfLBEqQxg71pTuffi8MC6SM1F9LfPFbMKqIg/+FPWW6jm4FyVw876AHujg9aC3SNUTC+Zj3b57LDTG/Rl2GeqILYTpMbs1/C5u8LPlvJRARqJeasbTRzMC7avzYZLiDTuqj/YJi+MiubQO3icR4TL2z6jmMD+i4RAWgvC2U+ir7GNV1oSJOYpSlWxtnpfaA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vhH91Rdf5CkQxbfi/vzSqi2X/rgrsNJHnqjGi1rjPKY5yc0kaORo6V8p+lasnHHIFyh5hMRePUbljYTFmpG9VwQsIpyKPKv8X/f/dS6jzhQTceTDdwAWC543O+egokpYXBYXxVVMBKs3Kpm5flByJPwXYq/lm7Slke07tUP+L8fM5Zr+yTFiYvGHbwE+G1cIrWpJQugBpp8P+pL8+Q01w/LG0xwV6JL1WnzagGl+R6TMBQpJGBXz16qfyc4szsGvy+CT+T2vlHUkY1yTSPAnbfp741iM6goKCRg6M1GDi2YS1zVK5QWVNfcfJED2SlgJBgt+wsDlhA7tKpTXlQscTwEMAsgVemqOAWdJTYTWVLiXQXsRRLKJo1EejMBsByhHCAlMwiB/Qux8i5Zv/tKdQM4Q7u+ah6ZUPexAhgQE+sUohngOhLzJ+Xu9QnBAIYmW
X-Exchange-RoutingPolicyChecked:
	WhOaEfB78FEIn8gwUy/7n/9x/mV/V+D4Apwf2q5POVuHqgdqGq3SY3cuizgM87r9rkvxQsoC9rIqnNcKagePsSEN2xQh1EV6zxbeW2ZKj14l83pghYcitfuFe8ZOCX3hbbTpW6jxjDUaj92ZCSOf/mGdP3oeinIUz3LAQmbKHux6GHy/LiG9/JNKSzQDKqDaCvdjZBbIH35LsIHStywjpGJMLGb6aXRzkBIUATwpwJiTSUwcwUP1gEn2G5HRABU+xopodPepxJMmuWowDMW7/XEmdiavPzRKo85GcE/scQ+kFwG3C7MjyfBYzbOwKdVPiDYh/jyXo39rZ8aIzxK6GQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:06:13.5426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3ad4b1-2838-48e1-4a78-08df1f25e59b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5558
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3OCBTYWx0ZWRfX/kWE/4BFNwHe
 uUh6PVMJDv2t6NDm2mp4xybUZeK2kC3fSroxQlOViHMCjrV2q9PrJgI0xzQ7VBaKEocqPx9S7kI
 ZckRas8iZYON8JQLNYFfZiYJ6AALPhc=
X-Proofpoint-ORIG-GUID: RsDiqm1ylF7_3OX4pkFzw6VmOGqKusRc
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd5da8 cx=c_pps
 a=WJg1qJ+8ll6SXBP1xA03Zg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=7Fxcqgx5KeWqRHTrcwcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: RsDiqm1ylF7_3OX4pkFzw6VmOGqKusRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3OCBTYWx0ZWRfX1vYqV7CAzYXQ
 Oo2UpAp3NOGG+iRy0Wg2VFoiw9tEnAf4MPuV29wg+MgM2gK8QN/XxGVEhtwWSohYhmgZyzFJO+W
 b/ONbdQsSegjxkq2GEkPIqAWWgVtu9ZwlmopYGR1UdbXSNIc3ioh9ieJffm/IGGl1A08pf3K79K
 UCOJILp8VGWxW20ClTHPpQa/7bliRllkzwNFoeFDzMGbmVfHjEf9s4qRI02brixPU4fa+tyI97j
 vsY6FyB6Epbzh5RqaZpWHs5p/r3fXzaE+eOvB4P+dtfahnN/8ynSZiVj4vBRS9L8iPnzf69L0oJ
 wTaMW79sOFXiKe7wrmqkaGhKg0UTRmr4JPJkGtJzro1mW7e/7tKU/CCQUEFMNF3ZGT1WctmPUeU
 0PBYs9ddi3rSgaZktYV3R6BsZYqQYzrkhtFj1oGs8yyOM4B6W1NsCcRDkixF4RVQD73uhhpq6wk
 TBGwFbuA+0Utr/MpwZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300078

On 9/30/26 11:06 AM, Beleswar Padhi wrote:
> From: Andrew Davis <afd@ti.com>
> 
> Move the huge ti_sci.c file and its header into its own "ti"
> sub-directory. This allows for cleanups later where this file will be
> broken down into smaller files tied to operations.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

Can probably do the rename in this patch too, get it out of the way
while moving the file. Instead of renaming it later in [18/22].

Just remember to put this[0] in the Makefile here so the module
name doesn't change in-between these two patches.

[0]
ti_sci-y			:= ti_sci_core.o
obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o

Andrew

> v2: Changelog:
> 1. None to this patch.
> 
> Link to v1:
> https://lore.kernel.org/all/20260929201746.4078803-17-b-padhi@ti.com/
> 
>   MAINTAINERS                        |  2 +-
>   drivers/firmware/Kconfig           | 17 +----------------
>   drivers/firmware/Makefile          |  2 +-
>   drivers/firmware/ti/Kconfig        | 17 +++++++++++++++++
>   drivers/firmware/ti/Makefile       |  3 +++
>   drivers/firmware/{ => ti}/ti_sci.c |  0
>   drivers/firmware/{ => ti}/ti_sci.h |  0
>   7 files changed, 23 insertions(+), 18 deletions(-)
>   create mode 100644 drivers/firmware/ti/Kconfig
>   create mode 100644 drivers/firmware/ti/Makefile
>   rename drivers/firmware/{ => ti}/ti_sci.c (100%)
>   rename drivers/firmware/{ => ti}/ti_sci.h (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 30c1cdd0fb385..fe53e152f2249 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27517,7 +27517,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
>   F:	Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
>   F:	Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
>   F:	drivers/clk/keystone/sci-clk.c
> -F:	drivers/firmware/ti_sci*
> +F:	drivers/firmware/ti/*
>   F:	drivers/irqchip/irq-ti-sci-inta.c
>   F:	drivers/irqchip/irq-ti-sci-intr.c
>   F:	drivers/reset/reset-ti-sci.c
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index c183d98c1e8f5..69cce12ae8651 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -233,22 +233,6 @@ config TH1520_AON_PROTOCOL
>   	  the kernel through the Always-On protocol, using hardware mailbox as a medium.
>   	  Say yes if you need such capabilities.
>   
> -config TI_SCI_PROTOCOL
> -	tristate "TI System Control Interface (TISCI) Message Protocol"
> -	depends on TI_MESSAGE_MANAGER
> -	default ARCH_K3
> -	help
> -	  TI System Control Interface (TISCI) Message Protocol is used to manage
> -	  compute systems such as ARM, DSP etc with the system controller in
> -	  complex System on Chip(SoC) such as those found on certain keystone
> -	  generation SoC from TI.
> -
> -	  System controller provides various facilities including power
> -	  management function support.
> -
> -	  This protocol library is used by client drivers to use the features
> -	  provided by the system controller.
> -
>   config TRUSTED_FOUNDATIONS
>   	bool "Trusted Foundations secure monitor support"
>   	depends on ARM && CPU_V7
> @@ -309,6 +293,7 @@ source "drivers/firmware/qcom/Kconfig"
>   source "drivers/firmware/samsung/Kconfig"
>   source "drivers/firmware/smccc/Kconfig"
>   source "drivers/firmware/tegra/Kconfig"
> +source "drivers/firmware/ti/Kconfig"
>   source "drivers/firmware/xilinx/Kconfig"
>   source "drivers/firmware/arm_rmm/Kconfig"
>   
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index a855d36961732..309145992ee5d 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -20,7 +20,6 @@ obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
>   obj-$(CONFIG_SYSFB)		+= sysfb.o
>   obj-$(CONFIG_SYSFB_SIMPLEFB)	+= sysfb_simplefb.o
>   obj-$(CONFIG_TH1520_AON_PROTOCOL) += thead,th1520-aon.o
> -obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
>   obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
>   obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
>   
> @@ -38,5 +37,6 @@ obj-y				+= qcom/
>   obj-y				+= samsung/
>   obj-y				+= smccc/
>   obj-y				+= tegra/
> +obj-y				+= ti/
>   obj-y				+= xilinx/
>   obj-y				+= arm_rmm/
> diff --git a/drivers/firmware/ti/Kconfig b/drivers/firmware/ti/Kconfig
> new file mode 100644
> index 0000000000000..07d7968f9cc8f
> --- /dev/null
> +++ b/drivers/firmware/ti/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config TI_SCI_PROTOCOL
> +	tristate "TI System Control Interface (TISCI) Message Protocol"
> +	depends on TI_MESSAGE_MANAGER
> +	default ARCH_K3
> +	help
> +	  TI System Control Interface (TISCI) Message Protocol is used to manage
> +	  compute systems such as ARM, DSP etc with the system controller in
> +	  complex System on Chip(SoC) such as those found on certain keystone
> +	  generation SoC from TI.
> +
> +	  System controller provides various facilities including power
> +	  management function support.
> +
> +	  This protocol library is used by client drivers to use the features
> +	  provided by the system controller.
> diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
> new file mode 100644
> index 0000000000000..433b108782fbe
> --- /dev/null
> +++ b/drivers/firmware/ti/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti/ti_sci.c
> similarity index 100%
> rename from drivers/firmware/ti_sci.c
> rename to drivers/firmware/ti/ti_sci.c
> diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti/ti_sci.h
> similarity index 100%
> rename from drivers/firmware/ti_sci.h
> rename to drivers/firmware/ti/ti_sci.h

