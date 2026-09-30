Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22431D366
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782763; cv=fail; b=Y0KajSnM9gJfZGX9hk33cyzkRqhn7gipVKB84TvjbIK+iVECS4vbyxFPVKEyZ4nDQcopX9UkKODXuThdd7ptBJwUhsKc0+BI995fYLY3HPHNah3X9WeKaTRHIf1xMJFLmBq96+R4MrUlSTxT2P8RZK8f8oVF/iPpYrzaaItA/lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782763; c=relaxed/simple;
	bh=6LAj9pUAXe7o5nsh1O4gd4TO2mMiPIYmR0XKkrBrYyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pbtxAy/bL0YnEG3QvSCB6crfwFbfWWfvXtfcC3pWJEica20YG7+h3v2/fuDTtIA5l/gCQhGbEnhRbXCTRItvo2G++qgs5xfqkYRwXJnQvxJyOhxG17xXHZORf3F1e0sm1RFP3iUKRnRYBMyDvk8GVbtrSn9NtUDp4OCaHv0EJYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=h4Qc8Yzp; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Qu4lwda4; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="h4Qc8Yzp";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Qu4lwda4"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1btN3556035;
	Wed, 30 Sep 2026 10:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Vw0+QGBCbWXsfsInGnosyG196DDv1P6tmrN4L+rS0
	zM=; b=h4Qc8YzpZ0sfDfXEaL21vCUeugAY+REf/zCy5pmYDA5JousOrl3oK7DlU
	yL6aYjOz/ROK+wd7aJo0KE+VHs5q8TNCBu41Iyme05BhbAzMaL9bH2NWP40t/d92
	8VZH81QYLBsS6mZ1EzT7/ADzxLK/dXu9XL8t7a+ztgbsPuE69Mi8aUGPM5T5diZj
	1E85v7XPriGkqgkhV20e55wof/RPysIj8ViPsvzyRAEnvovbc1iwphoUgzqix5lK
	iQSeRn3XQFqFwb/XcjDj30u5l8ZpuiIzyV2yWyOo8LjRiXegUSm4OgL7opUmmMh4
	5zIEztCh96t2Eg0o1Nfw9G0J1tLTQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013056.outbound.protection.outlook.com [40.93.196.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydva765-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 10:39:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9lbHlGysH6S08sR1Hhr7fjo7RNA/XMDYz1f6wu2Zgru1tkPjeEMTSqxFE8e2hptzLkpifSsduOeaaSxfUn8DaR89wu7ILMax7EocJuNLo9vdZCilIB5zXAR4enk14bBEgCKjU+PyGNR03BPH8r9vDNun6RLC8bUhBhxWx/nyvDgFv+NhLie6o1wNW3Lhh3I17j5S5Ax8wtP3dFoplbFEb0uIxidJ8q9/7qDnuJnBUBnmkR+/MTpK9HUfmcz7yIrGy8x2Y6gtifd2QmueFlLYtxxKgHcB8xbsGGsFLYy81JRNOtNS9bgGQd/1NqKYcicfq5ZWIqRP8opOD5YDAAmkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vw0+QGBCbWXsfsInGnosyG196DDv1P6tmrN4L+rS0zM=;
 b=Ct5jkX9NNf3dGfUCx5FD0/co3TBAMlF7LlBgfMMGd4wxWdpFssagJv5QbhFZqdBwaX0EHXYPwsBbqpwVHmrUbRl0BXbhU8rIKLvkiY0zU6XQFZ1akr7V0WVFO410owHw1OEnvuKwAmXk5QFjOgEuVzdZRu6w4fWhSIid3h9J0VhscgOKqmKYoTNjKZ4KyWCabCyA1gniD9Sefz8eP0/vepBYxgfqtgJOBQZOYYO/LACvkfnQ5bcEDKQI6W02gyXucgcC6kiNeuCuIaoOhqi/h93z3gef+SUuzHgWJCi4RD0CPR8VaNMTcYe1thGnwLu6l2oRgbuKeExWP2/kDqX85Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vw0+QGBCbWXsfsInGnosyG196DDv1P6tmrN4L+rS0zM=;
 b=Qu4lwda4ANvn5GDrM4SsMCJXc1kNQZcC0GaXgQZ0CY1WxIuUL0U49vHD8L2bsTgoCngtUr4esaNJQuVGB495oLRpG1pBC9wu5vkTxsJNh6q5aRzKLVuUSiw6qXtODEQP3PrtxlWzpmJkEqUA3NUMXJIYW8XPkSiLy23WvdIOCWo=
Received: from BN0PR03CA0033.namprd03.prod.outlook.com (2603:10b6:408:e7::8)
 by PH0PR10MB997780.namprd10.prod.outlook.com (2603:10b6:510:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 15:39:11 +0000
Received: from BN7PEPF00000092.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::10) by BN0PR03CA0033.outlook.office365.com
 (2603:10b6:408:e7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 15:39:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN7PEPF00000092.mail.protection.outlook.com (10.167.245.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 15:39:09 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 10:38:35 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 10:38:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 10:38:35 -0500
Received: from [10.249.33.42] ([10.249.33.42])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UFcYqe137720;
	Wed, 30 Sep 2026 10:38:34 -0500
Message-ID: <61f81232-6e78-4a5d-8dbe-c0ef32b5ff37@ti.com>
Date: Wed, 30 Sep 2026 10:38:34 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: ti-msgmgr: Read exact number of trailing
 message bytes
To: "Padhi, Beleswar" <b-padhi@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
CC: <u-kumar1@ti.com>, <nm@ti.com>
References: <20260929200159.4033010-1-b-padhi@ti.com>
 <20260929200159.4033010-3-b-padhi@ti.com>
 <170f362f-b64c-4b6f-9f74-ccfc4cce7d9e@ti.com>
 <de6aa05f-2226-4d7d-ae95-4da24135fee4@ti.com>
 <6ccdd04f-884a-484d-8b56-21dfd07c691a@ti.com>
 <90724400-bec1-4c3e-806d-8a831f705ced@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <90724400-bec1-4c3e-806d-8a831f705ced@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000092:EE_|PH0PR10MB997780:EE_
X-MS-Office365-Filtering-Correlation-Id: fe595593-5022-4bb5-ee93-08df1f08f87c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|4143699003|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iWUyW8MQVmp7PoQTCeL8KhO+SG9V18GPTgzjLmEY3gXblEBYXwYSodjS8MjjQLKvZc9QzH356DCRwO2lTs8ofE0z3ODNCKxsQXg9j/hApFuC7OPCOjHlClOu8woiQpcR+fa1229lrNQ5LzcxEjzybJPqPwQ93DfJCkq2b6mDUw+y4D8BLO8DifBRk+hqagha+Nyt8ViCHPZaiPqHXTE13b4POseyZH8cWb1qAIKM01ZQyEqkelT4scxcmOfiWJi95prXYEelz/sdjxlble/baYsxLT5iTTX2EBaVTSDkwt2FAVI3vIfBweF3nzcmhG7TQJBa3o0K05ArjZ494RMjWPELKdpyayZqGz7nn67uZaa5fjeAl3QmbQWHd25ERGlVSHhUv3Et18MZP24vhIshKxckzBknBipMnCsBwVob/5KrmTIDuNOqVYDRn3FtA5wZ7buz4H9cE/7VuTiytSP5XQlrPZaiyG3A9EZpGMC/aZM+msbtrIVUw7bUiA3v43ka5fGdUa17X59mXNF5+cfDuHWzLCmffgpd2d8zRaqiD2S7T/b3YkRvUBlanKHSeNBrJj8+0xLXr+KlmbeyHL9xjbi1Xlv9d3do3ZVJ7rmxcTFbRlG/8+uPQi+QaijynGYuOY+7AaJ1ECvCDyjJx3vOldagToUAIm9B6d1iwyFG4L4XfRy2nJS0ujYEocOYMtKnuN0s3AL+18CKFqNxLZouXA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(4143699003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4IfXoqMCbRMrX1gefsSL4tzyMccGRF36feVLNYYrafk0jkicBwoDLNVWKnmiHjR5ZyiaokdUNgUGr/7pml8Rj0Vn5t5SIcGbg1HyYyB0Y2hX5occJRrTJhT4Y58lHUBV6gqXn1oJ/LxoBWOyqC/IPTX4ILwuGlqJTRpwHYrsPV99FN+rzVxC0JZs/a3hoeBOtk4uRaKoV4jIlIVKmKSF7m+qjCMqFLwY0+3lcGsZmIzerHICLBfKzcOpWjPoyt1+x5Pupas/1QnIjBlsTTlXhXMZf5S8YwZoGHpv9uOijPCPiO6VbuDp4Z6mMGwqDvhRqRaQbkODef5kTIHmVKV7rjCnyUtz+StKEmgWnDLxYCs+GRM+DqF1aTkMCs6QOXqSAyXoWsmF+ft0J/Y4cGz7dIopaU5BEyN7sqgZk9wh3+lPWr/XDvxHK3q8Dbxnutv0
X-Exchange-RoutingPolicyChecked:
	EVm3JYP+cWyGRPFddRLjgn7cq6A5ejfkt372oM5OoqWDDZ4yebcyrrmifqcb+Eo0MtF9anX8JIgAatgRw+5usq6ZlDZYPrl5f4aAjGbftxi9J6zaMovMlmUl9bOHYutwKsGn6ZZU4DuWY2l1UP6h7p7Rpc79jlupXlsRTRf3Y5Tq//Nn4wspwNZYLCREhWF9NW/3Rh0buMUroFNdF+AjNeIx1zYzYorWX25n/gpMwwFwKuap7xsNfjC+CQEQoZgaQZ/bpO4qK7rtmfBMjc9lYTbHIGzhClUTnLfFb+PiJTrjftNneWXmG3s1Iy/YZvbp1vb2dP2GaaAtgByRQam5YQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:39:09.7841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe595593-5022-4bb5-ee93-08df1f08f87c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997780
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MiBTYWx0ZWRfX8LLSppzalQ5U
 p/VcXz4zqvNz25VYaeF10xnQ5pVrXbcGjHw++zQaHiW7Pg4kcEiOtu/SXCRvkr/uKR9HsRLkNGZ
 GbL4VCjW22xtYJuEH220z1FuQLBsZaY=
X-Proofpoint-GUID: LiJ-ZxYhKDLgP5ivvJaMuFJ85xipbvxc
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd2d23 cx=c_pps
 a=4JO5m9ekTMKpZDxQk7dxtA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=MrLwXJhUbjXpJv3KmUYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LiJ-ZxYhKDLgP5ivvJaMuFJ85xipbvxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MiBTYWx0ZWRfXxNZKE2aVKhub
 kGxQyUkiK7hpC91OQVxlbNccA+RV9iz+xvo2R+idz/nxF9GqRcTSarzC7tLcy3M5bpuMmsI/8Si
 6RxaMNgkOJOuCGdCOaSWhduoVKsqMhg0CDLPQ0NQcqHzx6R+a0k1y/QPTGq1kRGlm620TRenqoL
 b83HocWKsSbjfHRKobG+ZIhjG6pI30wHExoHVd5Rpj7Xdd/b7brALu35X/aDsR4nACOb+yifvuG
 NylqFgQViASSJFOh40YuOsue4P/j598Hb5tpmuUbvqzUlM8ibjrzppsmvG5X70SfSyKn5mjU60n
 kaxF5fbzDCD+YU9MuZl/g1jK7tIjyyeAOOuShi5aS5RJ3nvu/4paQ5ZYcqlZ2SnmH5hDruWwmNb
 yZDoYMphAouQIuQgRluPAMJWuCwlfn6ISgysddjp8CMx/w5r5Ib67SLhPAlco2YEK1/Ea0HwWra
 HrN3sNYZb/gCXIWs2MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300062

On 9/30/26 10:11 AM, Padhi, Beleswar wrote:
> 
> On 9/30/2026 8:34 PM, Andrew Davis wrote:
>> On 9/30/26 1:37 AM, Padhi, Beleswar wrote:
>>>
>>> On 9/30/2026 9:43 AM, Vignesh Raghavendra wrote:
>>>>
>>>> On 30/09/26 01:31, Beleswar Padhi wrote:
>>>>> ti_msgmgr_send_data() copies the message to the data registers in u32
>>>>> units. This has been harmless so far because the clients (TI-SCI)
>>>>> always passed its preallocated message buffer, which is sized to the
>>>>> maximum message size (60 or 64 bytes, a multiple of 4), so the extra
>>>>> bytes read were still within the buffer. But, with a later TI-SCI
>>>>> update, the message size can be varying now and not guaranteed to be a
>>>>> multiple of 4, which would trigger KASAN out-of-bounds reports.
>>>>>
>>>>> Therefore, Build the trailing word by reading one byte at a time, only
>>>>> up to the message length. The value written to the register is
>>>>> unchanged.
>>>>>
>>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>> This looks like a bug fixes and needs a Fixes: tag?
>>>
>>>
>>> All mbox clients of ti-msgmgr currently send 60/64 byte sized messages. So this
>>> is not a bug today. It is only a preparatory patch for future mbox clients which
>>> can send message sizes like 19 bytes etc.
>>>
>>
>> It's still a bug, even if no one happened to run into it yet.
> 
> 
> So should every pointer be checked against NULL before dereferencing
> in all drivers by that logic then?
> 

I get what you are saying, but in many cases if passing NULL is
allowed or not is an implied contract between caller and callee.
In this case the caller explicitly states the message length to
read, and the function doesn't respect that value. Which is a more
clear case of broken contract, and therefor a bug IMHO.

Andrew

>> Probably good to add the Fixes tag anyway, just in case something
>> else every gets backported also that needs the non-4-byte aligned
>> reads.
> 
> 
> Fair, makes sense. Will add Fixes tag in v3.
> 
> Thanks,
> Beleswar
> 
>>
>> Andrew
>>
>>> Thanks,
>>> Beleswar
>>>
>>>>
>>>>> ---
>>>>>   drivers/mailbox/ti-msgmgr.c | 16 ++++++++++++----
>>>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
>>>>> index 425d5f9d9d0e3..44457a896510f 100644
>>>>> --- a/drivers/mailbox/ti-msgmgr.c
>>>>> +++ b/drivers/mailbox/ti-msgmgr.c
>>>>> @@ -425,10 +425,18 @@ static int ti_msgmgr_send_data(struct mbox_chan *chan, void *data)
>>>>>       trail_bytes = message->len % sizeof(u32);
>>>>>       if (trail_bytes) {
>>>>> -        u32 data_trail = *word_data;
>>>>> -
>>>>> -        /* Ensure all unused data is 0 */
>>>>> -        data_trail &= 0xFFFFFFFF >> (8 * (sizeof(u32) - trail_bytes));
>>>>> +        /*
>>>>> +         * Read the trailing bytes one at a time instead of as a full
>>>>> +         * u32, as the message buffer may end right after them and a
>>>>> +         * u32 read would go past the end of it. This also leaves all
>>>>> +         * unused data as 0.
>>>>> +         */
>>>>> +        u8 *byte_data = (u8 *)word_data;
>>>>> +        u32 data_trail = 0;
>>>>> +        int i;
>>>>> +
>>>>> +        for (i = 0; i < trail_bytes; i++)
>>>>> +            data_trail |= byte_data[i] << (8 * i);
>>>>>           writel(data_trail, data_reg);
>>>>>           data_reg += sizeof(u32);
>>>>>       }
>>

