Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703EF4BE439
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781184; cv=fail; b=bg37aL/pIM2+6A+XPXyiDfhUZ5BVgL7Bij7CEfWvlA7iMg64lRcF+o3OfijjPIt1TMCx5PMS8TsaevUFSn6kbJTi3+fdDU9b48l6LKFl7V8SDIWablq5/sAM69ghiMs9G8SmiCxUM02OktX5GrvXBVmUpSeZ/8Oqd8rrHJGReog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781184; c=relaxed/simple;
	bh=gnNwL7on7BZJPzyd0IZz2BuxtcAUlzWRomIjerwz640=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ttLublsotIWKhGF2K2nL6FS41KXcyc+y4/uTlVio78UVqozF9GxFkU6OPWHEsI3Ftc1M74DkYHTXQfllo47euC/ke+0dP1CaQ22yMJcLX9Jui1rIn6xBlOOeKGp3XnJU7y0CyrcyocMrSPj2PhqgLxbrLSMbHzP8VueK3xdnf78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=B4+TcA28; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=ifALVyxS; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="B4+TcA28";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="ifALVyxS"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1VVC3890149;
	Wed, 30 Sep 2026 10:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EYfoXkfN0mKIj85hAF0/yFkZR8vQDAz4Ezce6foEM
	h0=; b=B4+TcA28tzuv+aQLbBuaT8whblOszCTqmSam1H79KPFgNtyscKHNxKBtU
	rbOnQ5KyimhVHT4mLsoj4MNPOKkEpeZ4eHzVc3AUO334MLgjp9KgvoomnIT9ms2O
	uhqp/AqdTfWOB03Ap13oAFA8Ij3wKIMo5iubzZEWWQ4IGQzRYcNMzZjPRMNhZrF2
	sNVYFkXU9pBoYku6MCaz5KmHTFTKGrkxpFBUfof1kZmLQWM8QRNHQg+ZwH5ZfebZ
	T+q7GZA4yxqpFiEULK9M5qoiO3Pil31jGylqcvar7fY1NnFmlrerMTcHXd3LruKm
	4opeUX0gte8IyzoxdEhU54C1YISQg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s21n0n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 10:12:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjwU+2VQF3DtQv6C39jlQxFCw0UUFbqEvYZM80/k1mtDGAsp1b1i/GY8PsAzXgON2AhnccT6goj3AssDWYCnaInMU5nqka4cSwHR2u7Vfe6ZCvpYEhTi7p4vrZBc0MI7mZtv1KDyCJDCWhUwT2RKI2H5dPZHF4GGc2NZLs2RJc7H0hxdKNdtKvHfNk2ebz39OtqYF8rKaGMfZBfHbx+iWFiux7ri2UfHC2jk9hCEX5NYfxnRkOfF1WotdWgsn1/Itp5bvkP7YE5/I9T5BgiBJ+9vTpM9jpfddshPM+3iRWVozYZZMBW/I27cJ4dbHwG2JPFL78p5D3VNoAH/gCdZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYfoXkfN0mKIj85hAF0/yFkZR8vQDAz4Ezce6foEMh0=;
 b=RShZnCoTuVVOvH/VJPbeJE8sEcQq66kc60xGy92TqnJBvy8e8T6TQAstcVX4QXLZCVrNsd6XzQ5iAaQK9b5ynYpTXoFe75tqJOeS/1FN/FFhLeJrLwaslGdLup85tJcj4saeXGg0uGAVi37Svxx+y7RVoOH4e5pdwWKtvyrrCDWhD3TMzQFbXRa3emoiDTFT9i/DJHfME8GZLInooThjfCHLvjHroyy26jmU5ND4RB9ty+leR8SUMeJWWdG1wyuYYgjbKeeTKMF3+7/FBMfuQPuB4WG35iVzDb26wmSCxUiWVkoolg9JDi55baUVbcwRxdVTHLZ6u+ANS/kw07q5Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYfoXkfN0mKIj85hAF0/yFkZR8vQDAz4Ezce6foEMh0=;
 b=ifALVyxS3jYc/0unDSYmVU+dc5ozrkAScGBq5xOJ39paGr+ljoYPXTiwuEuv/aytQSRMHRubMi8qZlnMqrKNnpJrrH1WJiJessuJ06gXeEmgryCuq4rM3oL/0j6csEcCW569t2JbTrOEPpgG8Sojx5q0zpMVwnQGFyU8z6PpMU0=
Received: from CY5PR15CA0162.namprd15.prod.outlook.com (2603:10b6:930:67::24)
 by SAVPR10MB997794.namprd10.prod.outlook.com (2603:10b6:806:4e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 30 Sep
 2026 15:12:33 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:930:67:cafe::64) by CY5PR15CA0162.outlook.office365.com
 (2603:10b6:930:67::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 15:12:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 15:12:32 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 10:11:40 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 10:11:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 10:11:40 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UFBaG63350951;
	Wed, 30 Sep 2026 10:11:37 -0500
Message-ID: <90724400-bec1-4c3e-806d-8a831f705ced@ti.com>
Date: Wed, 30 Sep 2026 20:41:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: ti-msgmgr: Read exact number of trailing
 message bytes
To: Andrew Davis <afd@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
CC: <u-kumar1@ti.com>, <nm@ti.com>
References: <20260929200159.4033010-1-b-padhi@ti.com>
 <20260929200159.4033010-3-b-padhi@ti.com>
 <170f362f-b64c-4b6f-9f74-ccfc4cce7d9e@ti.com>
 <de6aa05f-2226-4d7d-ae95-4da24135fee4@ti.com>
 <6ccdd04f-884a-484d-8b56-21dfd07c691a@ti.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <6ccdd04f-884a-484d-8b56-21dfd07c691a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|SAVPR10MB997794:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e681ad-6d1e-41e2-3d23-08df1f05402f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|4143699003|10067099003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zi37vUGUXLxTGxntyxY7swgnFGu00v34CRvnOD8FcTrxwJJ8rlIFjQk98Goa3kosA5i5eO48aKAsIdIBTGxvIAIAYmldCH6shr6IxfLbwUZzX8Z3a1/Q7J/1JD+jU8SnLZm+jb2aqOPnQIpUgxD9CJpvTusJdqQu/avz7gBI0HS/paRe0WOYB55kWzu7vTBkL26bd4GP0UpdaokPH3GnT3bAlWHx4KYffx1XRR1xmNGz6QrYB0jshh6+T9Gy+FpPSpFcJnDWyBuI5bUnEpGTT3e17H0xFM07NykYsGrnAa14WYdhza9sYnvrgf5VRzgZibrPG4cMae88x6VfY02KtwD0P53vof1k/P0JiNB3sUeEDE4/8x/S6AL4W3J+tqR74UDCeTQ8n8FWqC2hGdNpC9tue/Vo1DckQLOAWWF7BttapIiPvNnB8vlvzbYYGaTxPBuqm2StX/pMhRhB1E9ublj5cjiFlfigM/Ixf4Vh2/mjgit2HjHy/ASt3YP4CzukC80nTRRd0iZ05q2/VfR0G1VRxv8xigpA88EYlgAWsuT9axpQR9ZN7e9fZnEznxeGD4YBACxM7Z6IuBZqYkad41JVQkuB7DofGTJqS19UeGVr8G3GOLHIZq8vRzAfdwiFeV6DNo1o1gnnJlTAytoxmnX+H8eIXwPpW+hmdBt3Lk2dnyoKJ2gqfRr9IihQ/rrvjwqUbgNCAQMdkM9OtZTQmg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(4143699003)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uPOks4ygZ6yYKR7mv+vmx88/cykt2fU6Y/3fJDGGqt7YhnNfwdCWKwCu64e/j08Uiwmx4Abl7SOOkGSXatVk4erbsKOMXiEX8cNi39u4RJU9j7G0xwabF04dOuNbnhgNppxrZVEYZLzP/vPPsDN4pU/vxRqxTT3OrSSyXQdPXtgVtmrmFxXEJzV/R+R4+kvfyMb3JVwRi5FOVsRFqOO7+CacYd+brS3Ceg6O2JGFufvoodrXYU6ooPrbQaVuxpUagKE22V1wUGUiDlfGvTPGN8uq9E44hUj0fDEzf82N3YpKpixvQJGpyU7wZtabX8dD/0TKeUEKbUI4i7aJC0mPgAfYLhmzyXDvoXek+79CnJ7gOh0z8rHrXN9pXjyOyWExTe51Jkiu9iFeanau1/1+5SO2UjqjuDUcuWj2YtJaPIwvj9DZiJB/lF/TLjDVFuWh
X-Exchange-RoutingPolicyChecked:
	m8mCt7qhFH4y6Qus/P4pxC4RiO3uiiIEnRo3NTuRffVIAznzOkin6wEA5x4AfD7q9+zZMjVk/bjtvUJyd/9aAiCWYBn/OJvrc3KHEel1N0UCdgeGFo+Hk//zdzgKiBb1ouBMsJPrCgMnwBrGP42tPP/ZBSIfTHjiOq2s5Ys4FteCYs2IXfldLcmeDlmuluzBVdFySP+tPDFNQBvMjfwjAZVxmD6A5KmFwlhAMzzjWUipce1XA2nR8pP+xIi/xdXGwtZOTATQhxkZf5diMSRAzv2NB+/fc5xCN/SupO9b4l/k4KUkLzGvbCSAO+wAlE25USligMW47bQtTd98jPmb4Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:12:32.1422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e681ad-6d1e-41e2-3d23-08df1f05402f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997794
X-Proofpoint-GUID: n6pXJZtvIKZZtxaCXDWWVtYv3Wcf0tgp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MCBTYWx0ZWRfXzS6iSRol/2Y8
 +bRyAxSgaOLVM7SSd5x885onFNZ37K/IfJYhAJOABCP4CNaBRrWZP0CofFTbbdAh8ENLnp44FTz
 WdB4shOuxwCF7YOX/C4ot5fD2vmz3Laf8VeDL/igNbQBNtMDBXVwnkxkD27XitJoWNseE5TgWUw
 Wn0t9KT52/ewVeWQ+j3vk75ntS2PWz/qTKK6gSmmm9vFOFbVexFSWFFv0x9sSo9OkgHpiUkhnoD
 J2cuCbY125TVG0KJaAomzi3u5wwqJgc4NFDfwOElby8iASZQ03W3QOBhs5504sd6kb0UxbqbDb5
 43/8sUyL7OVjzt6l74Z4TIVtpV4Zixh3DNvp9eo+CgHwB/dJREUJZyL4hMRWRZ7+rP7g8WwDDOI
 5PDMCS01RPErvUe8V6ArcKzd+KR8RDMlN0kno0868QnxnoiHhMpOaxT37skZgFhZBg1AL3wK0le
 QcwYjARM98XSqt7o7Dg==
X-Proofpoint-ORIG-GUID: n6pXJZtvIKZZtxaCXDWWVtYv3Wcf0tgp
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd26e6 cx=c_pps
 a=GpEVYLJYGEqcjCz3zNP7Sw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=4eUWqsTZ45D2_nLd5wgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MCBTYWx0ZWRfX5kWLfAISNvN6
 ZgR95A6Y0C83I1SNI7jRcvtvPEJneGqjMVQruRbvO/L9FqBHzmT7tQcBeljPD03s9Ml10NdBvpA
 dfUp53OJoA8ng/3ClhtGsNMtE7moO3E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300060


On 9/30/2026 8:34 PM, Andrew Davis wrote:
> On 9/30/26 1:37 AM, Padhi, Beleswar wrote:
>>
>> On 9/30/2026 9:43 AM, Vignesh Raghavendra wrote:
>>>
>>> On 30/09/26 01:31, Beleswar Padhi wrote:
>>>> ti_msgmgr_send_data() copies the message to the data registers in u32
>>>> units. This has been harmless so far because the clients (TI-SCI)
>>>> always passed its preallocated message buffer, which is sized to the
>>>> maximum message size (60 or 64 bytes, a multiple of 4), so the extra
>>>> bytes read were still within the buffer. But, with a later TI-SCI
>>>> update, the message size can be varying now and not guaranteed to be a
>>>> multiple of 4, which would trigger KASAN out-of-bounds reports.
>>>>
>>>> Therefore, Build the trailing word by reading one byte at a time, only
>>>> up to the message length. The value written to the register is
>>>> unchanged.
>>>>
>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> This looks like a bug fixes and needs a Fixes: tag?
>>
>>
>> All mbox clients of ti-msgmgr currently send 60/64 byte sized 
>> messages. So this
>> is not a bug today. It is only a preparatory patch for future mbox 
>> clients which
>> can send message sizes like 19 bytes etc.
>>
>
> It's still a bug, even if no one happened to run into it yet.


So should every pointer be checked against NULL before dereferencing
in all drivers by that logic then?

> Probably good to add the Fixes tag anyway, just in case something
> else every gets backported also that needs the non-4-byte aligned
> reads.


Fair, makes sense. Will add Fixes tag in v3.

Thanks,
Beleswar

>
> Andrew
>
>> Thanks,
>> Beleswar
>>
>>>
>>>> ---
>>>>   drivers/mailbox/ti-msgmgr.c | 16 ++++++++++++----
>>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
>>>> index 425d5f9d9d0e3..44457a896510f 100644
>>>> --- a/drivers/mailbox/ti-msgmgr.c
>>>> +++ b/drivers/mailbox/ti-msgmgr.c
>>>> @@ -425,10 +425,18 @@ static int ti_msgmgr_send_data(struct 
>>>> mbox_chan *chan, void *data)
>>>>       trail_bytes = message->len % sizeof(u32);
>>>>       if (trail_bytes) {
>>>> -        u32 data_trail = *word_data;
>>>> -
>>>> -        /* Ensure all unused data is 0 */
>>>> -        data_trail &= 0xFFFFFFFF >> (8 * (sizeof(u32) - 
>>>> trail_bytes));
>>>> +        /*
>>>> +         * Read the trailing bytes one at a time instead of as a full
>>>> +         * u32, as the message buffer may end right after them and a
>>>> +         * u32 read would go past the end of it. This also leaves all
>>>> +         * unused data as 0.
>>>> +         */
>>>> +        u8 *byte_data = (u8 *)word_data;
>>>> +        u32 data_trail = 0;
>>>> +        int i;
>>>> +
>>>> +        for (i = 0; i < trail_bytes; i++)
>>>> +            data_trail |= byte_data[i] << (8 * i);
>>>>           writel(data_trail, data_reg);
>>>>           data_reg += sizeof(u32);
>>>>       }
>
