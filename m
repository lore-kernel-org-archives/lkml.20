Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8589552F299;
	Tue, 22 Sep 2026 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073425; cv=fail; b=i3yc1TMwEl6ocB7IPhs6gp2EDrT20zQqwe1mKtdMcNwk2WoXoIs7WFaExKXUVNBJsPZ04f8H/9cHV1M6pXWA+C0zpIuntSN6p7cDteL1c6TgynfdcngWmhvXI/IVn+cNtsXR8hUf4oIlLI2fRMtJ+SDj1VHblxKhsqM/oKZWwJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073425; c=relaxed/simple;
	bh=ARnunrr330rRedV/VMKd0QCAbiEwV8NS20Yw81H82uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RkIF74yeUXlpf6u1yJ3qfLTwLvNIYUH+jHnQ19QW0MEKNvKFnQOnyXZdiW9pJfHwqw20RHueg5/mp4YEdtqxxH6d9WMVJF9eXCB/Sv0EYaEdemLRHGRz/BZCikPHZcaKI9S9HG161WbIykxKFkidd2GmXzawWM1lPHzkDmdm1sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=AHlJ98DE; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sYSu1tOY; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="AHlJ98DE";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sYSu1tOY"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M8j2ed3143896;
	Tue, 22 Sep 2026 05:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UcM6sjLXUgVoan+6RDzPG8Z5mRz/5UvVG1kmv39pt
	Oo=; b=AHlJ98DE8MpJPXR5YZXahTiZyQUXXKWM3SdGhPA6TRClbE7TmpDzz+/TN
	hEtlLXnbL0w3D6p+lW3OC52Yd4X+8aTJxTeNEnfMBSSdlje7bNsHAPbZps0l8upw
	LgkMF2cb91izo+4SqydlOnZUIbgmjSf7SfgOOrwWGzl3BiWomvoIe0Cgim2/cwYY
	PPvN/+MQB0y+XlpxdyWZ06sl7lccWYyKxlKbKQk/bYl31o5Wo13xcDv0Sc6OXEMV
	2PVZyXZzRLo5mpxJmJdz7xNLBS9J9omRE/gTPAlClL8jrAgK4iFij8LqCMcgNVvV
	14H4Tpv+TwBnk15Y95Vfza8QbgO7w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gupea0gj5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:36:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFFOhZe3gqBjko5UzCwapXQHNxH9ShZbBsQQ+eWhasgTdnHW88oxrsqqVrw85sF2UtjAKyBwXV17/ixCM9xfssAbQHcH8exnlbOn4SNCZ6bCnD6WbZMgXbB/5x0wdq++trpZHxyBLSKBt5xBI3dObvVp0wQaHk0rGPz66aTZR7T8E+9vycpJANHnNfV7aSkzxZh5k4rUN/NbzzK8r2eQL2nLHtUe6fsNaXzvdj3UWUznE71WIjAvTE95ysw94UOFjRd+o6L737GUH9F2W7yW2J8HW4FY2GgE+WtsAbRSqrSSOiwL9Y1+ifoC88ejHKLUhY+o+hqsfXSsrEtAMrjdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcM6sjLXUgVoan+6RDzPG8Z5mRz/5UvVG1kmv39ptOo=;
 b=pKJFsXlWbxyGVFrJYxZ5KzTcsGCK153mbcXGD2b2Cj8N0wzvJqfAuWb3eJHvj6RZ6H6s5DkobTYulsbRZx50fg0jRHOzGhf7Zw5bM9jDiDNXfgbnpL9fjkVqATfUA6ncCo6kuqy8hYOU2Z90PvvDZUfGAzip0fBK4aZcP+V+gooxf1ehd9f7jvahU1qTaVBtzadfMroCszzWNJANPhxeSaRoKeTdFlLWnF1oz4LePqBVYsTXm8JlasevdOgiy2xYrJXkwrWets1xlEISsdAv5FsZf3Rnf0oAHJFvyc4zfBClNprv1o+9Fifwd7YFXGZGrcF9FsDdkHMbxG9h+f3Gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcM6sjLXUgVoan+6RDzPG8Z5mRz/5UvVG1kmv39ptOo=;
 b=sYSu1tOYeNwSri28TCaf5z+nR4YtHBECCKfc9QsL2pgD3TMQsRQjhZzozLMVVyBID+eQPWbolkqQpFejrjZ1x2kxTcvtytSAmKIOqKDl0I7o6zAC/EeUPSYuJ4gGoANRYysyM305lKBzAvAhMN5ANByPtnem4rVlndfra938N6k=
Received: from BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::8)
 by BN0PR10MB4999.namprd10.prod.outlook.com (2603:10b6:408:129::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 10:36:50 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::8b) by BY1P220CA0012.outlook.office365.com
 (2603:10b6:a03:59d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 10:36:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:36:48 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:36:05 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:36:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 05:36:05 -0500
Received: from [10.24.53.39] (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.53.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MAa1VC3974168;
	Tue, 22 Sep 2026 05:36:02 -0500
Message-ID: <adf3f06f-d2c9-424e-966b-9ef9d51e5104@ti.com>
Date: Tue, 22 Sep 2026 16:06:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-pinctrl: Add virtual GPIO select
 mux macros
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sebin.francis@ti.com>,
        <k-willis@ti.com>
References: <20260921063505.3986565-1-a-kaur@ti.com>
 <20260921174321.vaf2krmhnuhnmael@record>
Content-Language: en-US
From: Akashdeep Kaur <a-kaur@ti.com>
In-Reply-To: <20260921174321.vaf2krmhnuhnmael@record>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|BN0PR10MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b74efa1-8502-4aad-d6fc-08df18956806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|13003099007|3023799007|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sq/dO2Rx+jwzDalz2zOAOx0hQt24SY4JUjBON7bPVP6pIw2RheiTR7BXACaVf3ZfJHmgVRcLphTl6YHx6sc9z+1oKKTtNpsSzlAWR4HHYeJVW3rt1ivQIUeZ1bzT4DOuxekE/m2NrPyEqb9RbcVBqy62tR/vR+l5z5G8TIiID9SpsQuqyx/t/HLOUOJSf2RXeL1SVgQrFZflmh/43S+j6ncXe0y35s4FtsHCxZSYYAdyBEUi3aCE4uVGlm6sGav1uktPtYrLUAH23GlxeBxmgAiMMNnchuN/yKc3JcTXj+C+LkpPlXU4/SO9Z8U9R+oSIkGZjaLLLaIi2CD0tYxpANkVqWU96sWyz9RHyTbFpoG7lmZKc2uuvdAK01ocvyZh/NDheSg9cNWr1VeH+py1+jeQjUjUdBAR4XRXGPqzn16G7sYaAxqgaOmow3a0TemLlwnB6N+mYvI64p7LyeeeIvmqW059rssYhwHJ+8rSGlI45PL0YXby6fdf7MEAKxodBPjTcxXn9SFBb/4+0Fj2AKPkE/PskFfS6UlcQ6XYCHuR9GVG1cP2iPE4PIGTYMKWhhmjQsvXxxy3KU7pyEfXwwkDq8/rAcfHZr0IG0JSDbfw6A1CpOlBmMDrO+bHItLnfw+Y7XJG5mPxIXRlz2ePUw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(13003099007)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	351akbLF5Mgo1XQef8gLjn7EnvSL+guavlG35ibD6JnJKaFszGIvhMJYcdezrd8VVoSTLb/MvtROlBsgvfnndDeMpAx3Bhzgd1sd8Axp9yHbV6yh64ZCMOzb37xkuqb2rDgKUAOaLyFm9Gc+vWf5YX1n0bRT9uJEKJscLOGnDQwsGWV7wipkTK6wxjjU5K9eFXZw172hokakPFwzg3YxRNupE4Z1uN3hbJ292o/RR8v1YXDDKkdu9E5RjMf3Zu9UvK63SsbK9TdfDoUc8Zr60q8eGUicc7XjkORILVeOnaVF++pnpr8Kfrq+6AdRTAwaUhBBUuHzd+DHcMfJbYNuCQyVbn1rzUFh2eDTyL6HTt5SqqXNERVBlGd7jk19fHQw7JWfeIHDCGUWKdM0CU3B4DS0JUNL+UuJcpIvUtrKaTxMvbNC4czQiZllZePmMeIo
X-Exchange-RoutingPolicyChecked:
	pru5zdyZsfmSWaDMBSJ+yF/cM1bF0ELuWZ20m9/gEhxGBaWEscxnmT7yUm6D7J7LBEyw/2rNsernA7X0oCyuitBpghQwITx2w1yHTiEJeq48FPNFydMqrasXK6DfwN7cnGdwulhEp66nqoaS4fkid22Fy4lv+dZvgd93s56bXc9455bPSlQhM0LW9jt44Uskpn1g3SJ2Y/o5XNAdFW/XpMHdamXw+7JEYYSlIukL4Xwd9dEJDYVIxZuNYqtjkqSOnkzbO3yksCi38Kt/sWlQ3MLXXOUTj0mj8/5TxtqbAX/t8YLRHE5KPD1LpkYxx6+6AT3vb4o92wUKn6NokmT3DQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:36:48.3068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b74efa1-8502-4aad-d6fc-08df18956806
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4999
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MyBTYWx0ZWRfX1n59GJd0hRCt
 YD7OaxHgRcqgXvhiDrCeSzRWQ5tFFsYyJEhvX865O0RryM1ZB4gUOWtznb3W3HlJ3XN94TA8Bb1
 UhkB9oWs5XPVOveUQYP9oWSsTMfJP+/2Cv4qgh7QGgla6S/aAAMJHMc7RRH/DiLz3HDSmLDEN9n
 HKdm7javLCU1VdibDkRv3IqFpiFyeFC7wZ8Hj93FJjIOpwqaRiN2uNDBgZjoduoOzJWdWLDlzpL
 KZi9F21BUyCSCWGx7nK3oZDcMYezMqMv2DxJSnS00fWXPsZktzqg4jP0T1bRVW3IMEn+Q7sYog9
 vsG9MPZ+6KWY5GzHs5alI1QAFhdNabdmXwDMmJWWea6C+nb4pfdxZDpkX1ra/SWXdCcUdhW34Ah
 xxwn5rLLg+Nj3wqEyCis/sgyR5zO+5e0EGJjB5F5SYnibAfLXpcdXUNpMrjCtAidzuX/gxpfVbe
 9a6nKtTpoegwuWPfAVA==
X-Proofpoint-ORIG-GUID: MXt9ICb-mWWOYHb9j4bm-jRAE77DyJR6
X-Proofpoint-GUID: MXt9ICb-mWWOYHb9j4bm-jRAE77DyJR6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MyBTYWx0ZWRfXzl1smrhtTLHZ
 qBZNOO3ZV6mYkvF9sMCdN3YwYwcAH9IfX3mHE83v4VVkTILk9zM1NviX/tWekq2xQPj2OMY1B59
 ZkNhHHb92UoHDywZ5vAIph1R0L33lFs=
X-Authority-Analysis: v=2.4 cv=Mdz5KJ/f c=1 sm=1 tr=0 ts=6ab25a46 cx=c_pps
 a=5tz+rB/kfTqQMEo17N6B4w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=fQNsR_918SZIXC6XwWwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220153

Hi Nishanth,

On 21/09/26 23:13, Nishanth Menon wrote:
> On 12:05-20260921, Akashdeep Kaur wrote:
>> Add virtual GPIO select mux macros for configuring the vgpio_sel
...
>> @@ -3,11 +3,12 @@
>>    * This header provides constants for pinctrl bindings for TI's K3 SoC
>>    * family.
>>    *
>> - * Copyright (C) 2018-2025 Texas Instruments Incorporated - https://www.ti.com/
>> + * Copyright (C) 2018-2026 Texas Instruments Incorporated - https://www.ti.com/
> 
> Drop this for trivial changes.

Done
> 
>>    */
>>   #ifndef DTS_ARM64_TI_K3_PINCTRL_H
>>   #define DTS_ARM64_TI_K3_PINCTRL_H
>>   
>> +#define VGPIO_SEL_SHIFT         (4)
> 
> Tabs like the rest of the macros? I assume checkpatch --strict didn't catch this?
> 
> Did you check *all* k3 devices to ensure the offset is the same for all
> K3? in the next revision, please add that audit in the diffstat section.

Published the audit findings in the diffstat section of v3.
No, --strict did not catch this. Thanks for the catch! Fixed
> 
>>   #define WKUP_LVL_EN_SHIFT	(7)
>>   #define WKUP_LVL_POL_SHIFT	(8)
>>   #define DEBOUNCE_SHIFT		(11)
>> @@ -111,6 +112,11 @@
>>   #define PIN_WKUP_EN_LEVEL_HIGH		(WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
>>   #define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
>>   
>> +#define PIN_VGPIO_SEL0                  (0 << VGPIO_SEL_SHIFT)
>> +#define PIN_VGPIO_SEL1                  (1 << VGPIO_SEL_SHIFT)
>> +#define PIN_VGPIO_SEL2                  (2 << VGPIO_SEL_SHIFT)
>> +#define PIN_VGPIO_SEL3                  (3 << VGPIO_SEL_SHIFT)
> 
> Same - use tabs (consistent with rest of the file) - also add
> a comment above these to indicate the user should read the trm
> corresponding to the SoC for the meaning of the values - people are
> not going to do git log to know these values should be selected
> carefully based on SoC (same value means different things on different
> SoCs).
Added a comment above as recommended. Fixed to use tabs.
> 
>> +
>>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>>   #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
>>   
>> -- 
>> 2.34.1
>>
> 
Thanks and Regards,
Akashdeep Kaur

