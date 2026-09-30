Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF804339376
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750288; cv=fail; b=YpGPgG7sNdRnQOEUVtj+OLqqd2pxs4609w0Fnttw5Uyr9KDM9ZHl/WjUctGXDxyklElb+iHukty8fOHrrNdJ4ZIlmHN0KQf9fFcOhHJAh7uEog7Ur/Rg03f4t5dwPXWvdyUV095HwP8R1TIm+7kKZCFXUFsnyh/rE04pRrajF40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750288; c=relaxed/simple;
	bh=bQfJUYWyK2sJtAX0Tt7NNOghbrH92tSrY4fV5qivB1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H4fILo2vU9XF0SRNMZuVpOQeJvD8QXMevgNdYKjsM6ASONtN0J4BYQevMPlnX3gr7W+lS/F+O8V/ontDsoiUsu1gWyYvc4LpCL3yt8ebG8mJnqv7V7UBEdnn6vNVZUatg+LCQs7/9yHksUNNdBMeSPQlPQWoucT5RbClCLN6yGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=GXihRg3s; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=iwBMwFjb; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="GXihRg3s";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="iwBMwFjb"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68U2YF0X2569307;
	Wed, 30 Sep 2026 01:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=iTj44rAbIT85JvxOISdkws+jAe9xZbC6xbz7q9g9W
	gc=; b=GXihRg3sA/rmNekN/mturIhAbE2UBcFEwnmyamyzPy3ESrTl+mH0G8Btt
	YBskbLj1Ye3At1jkSiYh/a0kNo3V3QNvx2pABaPfaz06Dvm6XQL8t0n/Hxa84gM6
	OzmPvfsuvKh0rw0nBc45TYKWpBqG/KmF1n6jX+UeCMycZQRC+OaTSMiY3FDPQTb/
	yM+cpSgRntNWHk9IWUckftwIkdo5iMU0hOaKXxJjiOSeLN88v8lVqW4C/2M7fOO8
	YDULOjoJQFp9jwFV1mgP19PgKlXCjp612nP0KhIxEMNuEP7IqaYxPu9k7ILlhY4a
	c+oKSoGg9572tRM3JRbSjRioXhmkA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010048.outbound.protection.outlook.com [52.101.193.48])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h0srrse25-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 01:38:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jq5DXAWFdkbGToOUxl0HGyqgqHAH/B744H5BIEizan24p7XP+0uImZlSXPyqQRqGjErNuA0kJNI4AkW8aZk92mY+7U7JByqVMmWqPsiVpOXOtEBhmFdjtEhGFASR0Yk2TqQZkxJZTAFcaPpCI5M29clPlgn/DTC/j0ak7R6//lSlLTkLsGMX5CDjojU508hTV0/U6PX9ndF2I98m3ebLhPOgq7dzugzPpZW0DNXDaAI+XwcEW0b76etki+yUy6+1ny2H2RWY91cY95HXrVJXLiKeX91uLiIk1ysjLHedi03+gW196/VR10iVbQ2hciWdWIbiztbzhuBTgEW7+GxY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTj44rAbIT85JvxOISdkws+jAe9xZbC6xbz7q9g9Wgc=;
 b=nygwr1EoJoEnT1RR/fBuhfnKNXfSBxTpAh4N+lsKqqKOTf7v4bkcEjixsjNH2YtzpQST7ffc0zzc8Gq3GqOA/Paoqkqv+9ZZLmMKUX2T34Na5KSQG1aPCxggyWQlPNzrVnypOwZnU5y5XOxOMvU4NV5KgCpA9K5hLOBqLnQNU+KlETzncNkCoKkxrrW90uxtHs160eJXsUMwNemxTtDcuwu+pzQIZug7Xvs2Us3IakLAoU8xbi+FFnCnbEU8kguV7sT4qjf51FX94+JFkfDT7Ql63/oBzgoNX1xrKyWlMVENkQkrlFqQ4RZ6C6wi1iSFluL+afvb9diTrYaOmu9yRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTj44rAbIT85JvxOISdkws+jAe9xZbC6xbz7q9g9Wgc=;
 b=iwBMwFjbHZC7huW8zGD/86ZmmwtQtA9CA0ToxlaH8+JB9YLcqMf0dh66TAcSHS6IC0PJUPL0AgyfMD8pSwPyAv2YiPjbhwCa1ABYoTsZ4fqD0h7maXxb4TuiseTsLaWzXyxLoQ5SY9eJFciR3QlRz8HBIky0ok9CK8T0pwDC9rY=
Received: from BN9PR03CA0268.namprd03.prod.outlook.com (2603:10b6:408:ff::33)
 by IA0PR10MB6794.namprd10.prod.outlook.com (2603:10b6:208:43a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 06:38:02 +0000
Received: from BN3PEPF00022BD1.namprd03.prod.outlook.com
 (2603:10b6:408:ff:cafe::3f) by BN9PR03CA0268.outlook.office365.com
 (2603:10b6:408:ff::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Wed,
 30 Sep 2026 06:38:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BD1.mail.protection.outlook.com (10.167.248.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 06:38:02 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 01:37:48 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 01:37:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 01:37:48 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68U6bjTW3538120;
	Wed, 30 Sep 2026 01:37:46 -0500
Message-ID: <de6aa05f-2226-4d7d-ae95-4da24135fee4@ti.com>
Date: Wed, 30 Sep 2026 12:07:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: ti-msgmgr: Read exact number of trailing
 message bytes
To: Vignesh Raghavendra <vigneshr@ti.com>, <jassisinghbrar@gmail.com>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <nm@ti.com>
References: <20260929200159.4033010-1-b-padhi@ti.com>
 <20260929200159.4033010-3-b-padhi@ti.com>
 <170f362f-b64c-4b6f-9f74-ccfc4cce7d9e@ti.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <170f362f-b64c-4b6f-9f74-ccfc4cce7d9e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD1:EE_|IA0PR10MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c3a430-e895-4851-2445-08df1ebd6061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|22082099003|18002099003|6133799003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	TNE9A+PCYiDHTLI6W2A/K1dYqIOJaxeu8We50hStsX9xgxewMJlP2e8R7TJyyXl7OvYco8/slbfhEXVGq9C+PhzGpKIftZ6fKQSgSF5wnQXDJ2QmkIBIbNyxqb1xT5xcwg7lowfU4OKWdkPpqKGoQ2l1X0lTLz0rIY1NLP4mc5TsY6NOEjGnMhYD1BC2TAeaxrAXeRQRYVPN2voaN+XDlTt6Yl2DEyIgnFqSATrKhk7YDhZOe+U8xneN0oLd5TyPK4EHyNLtnVZi5KReChBHAKs4is6VUav0G8RGug1oPOsfSrGjFcLkRq/mqrS5ZR4LemhqKeeq0NAYwgEgxljnRjbXdzW2x0NmsbKY117VsaEE9FM+TDcFHl0xhVV34SPVfFQkPeJUm8w1aGdVlwFQi5J0+Rg9RzV/fOPRXS34BYoenl4pn8mokZm1Vf2Cqo6Hf4ZgA6KxFojO9dHpL0RF09DJ3PUg13GyJ33c5dbyN1CG0oUs+4tgybNbEDEIPwu67FPhp2Qu3wq9GgybFPVeYODLrsJOt6gbZqlpTXPCb39/dDDOJlb6tFmuZjHgtp+SqUOeQxCbJHSIZkNy9kKUz4cGjCbzZrchezLmn+BuHqfPWE1Yw0LH+z9wYZjTc/QjkKUVOhi7tmBJoIBuBJZd6xmbSErYtqzR5tAVKsOnIZdDnkckLkZY4cNCzSSfrXZvBpLbdmgpZIpM65sb4c1+aA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jxIUnnrbSZoTTtx7NzQWC+Z+9XoqmAa4DohdZ9knHakt1GK9UgKmo/I2GGLBnhR3NncYzi09jTDSqPBm6LacgBpRIGyOpJPlIadtk8ZlOt56HM36RpB2an0pNAbdwy/jWOy4BClln+/ujjBSbOA699PW0ayaW+FhCfZUnGzWc0BG8yFanAY3nuxDPqFEKejmaLlAU7/Am4gCkZ9XA1k/8mBCU/7bh5Bcsa/6Z9Hb1kn90r4XzHOH+68KVo/vk8u3zKBzVh4vptVaF9a5owR1op29e52jOURopatazeff5jTJZ1ObUiFONaE46FN1NjqhHjY/SuT7DEpQu+d3MSfuKLbcWnUVKdQtpAul+PXQ4A7DB2mxIrluxwaHWQWlp8T0UPAuMm4ZHR7KL2/QTK2NFfq08U4ikK0iMF7zVRTtsynJywXSvDStrV7kH8Bdq9ZN
X-Exchange-RoutingPolicyChecked:
	A+W7dlsgZWXXImZ8OQSZarCjsX4lQ/PxwcMGI0hWGX9ghEOo94lazU3Gg8WlS2pzVRsXL/ThpNqjZsoERn+TfH40+jg1zu0TDsMCE/lN5lHjvSWZI7tx4mUftZ7BydZEkAI+WsH3IzLCon9AzIEIlbb7KfxxZrDrQrXJ1MAyGiJeTM2WD8Mwr/Waz4ThmuD1bdGuo+kdx4q9bJ5/YE+YSoRylysG/leujvyITy1r/mRN+OCw2n23WtY9tYVxrj+VIqI6/rqgUwK6Xbc1nUPSD32jmeM1vpI+rIZIOQ9ycl8ThtmsAdsJ/OKs8iYGRZl99FOvS3y1jYpHem9kFext7g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:38:02.3374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c3a430-e895-4851-2445-08df1ebd6061
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6794
X-Proofpoint-ORIG-GUID: Mef0WxmNcfJNY1ctofgPoewjFp1qY5Gb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX5t+vtAptqASf
 ryrZ79d5U2UZnWZTU2qMiipO2FhEy3ovBaEK5tW0s2pjrxQPMrPfeoyrKSMawUAwQQX0BDPDQHc
 nLZmZS5ekllakzJ+XR+Wt/dZSLOHNC0=
X-Authority-Analysis: v=2.4 cv=Q79HcI2a c=1 sm=1 tr=0 ts=6abcae4d cx=c_pps
 a=lZTGddAnKZ6AR5Pw1xQKMQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=kzjxhzNMV7bWNdnERZ0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfXxcusZ6jsUzkE
 KwUlgDLiOxKptH2dLGH+q0tywVCPMqKuUhOdfurIFdgRJfeeIjNZpIOCBzco2py9zdsobz9/SdU
 yvs/TeC7H9t7aXv26QQaCe6aRKtIB+8nZcUv8h8jS6ihii6u7ysnAxzFHvbsqIkcaCL8z1bGkc2
 WtSeG9MOxwMqQQy/hjqcmJMym846YW1mfU7O6zbPLhRop7BGHomBULlMKFooww3ZoVITII5USIQ
 WqR1xkk5iPrE9HqPBd+qWlbY4XYaSmIWTLpsb0GvxpB55IMjaYZwCr0w4/YLxfloj2eONaBGSO2
 DWq1AZbYUSyCPZmrYDFy32KHYpzyJw7lAw4ShfOjfPPk0zzhqJ01IR5fYJ42F5nKKa5PjTDM0DT
 xFxlmOh6joS9V/uT1gZZ17M6wB77MHRl1qowOVM7CsW2csuUZE953p9hhdMyWEbNa83Tim3geeQ
 KxZ19gVEb0yeHz9jJVw==
X-Proofpoint-GUID: Mef0WxmNcfJNY1ctofgPoewjFp1qY5Gb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300026


On 9/30/2026 9:43 AM, Vignesh Raghavendra wrote:
>
> On 30/09/26 01:31, Beleswar Padhi wrote:
>> ti_msgmgr_send_data() copies the message to the data registers in u32
>> units. This has been harmless so far because the clients (TI-SCI)
>> always passed its preallocated message buffer, which is sized to the
>> maximum message size (60 or 64 bytes, a multiple of 4), so the extra
>> bytes read were still within the buffer. But, with a later TI-SCI
>> update, the message size can be varying now and not guaranteed to be a
>> multiple of 4, which would trigger KASAN out-of-bounds reports.
>>
>> Therefore, Build the trailing word by reading one byte at a time, only
>> up to the message length. The value written to the register is
>> unchanged.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> This looks like a bug fixes and needs a Fixes: tag?


All mbox clients of ti-msgmgr currently send 60/64 byte sized messages. 
So this
is not a bug today. It is only a preparatory patch for future mbox 
clients which
can send message sizes like 19 bytes etc.

Thanks,
Beleswar

>
>> ---
>>   drivers/mailbox/ti-msgmgr.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
>> index 425d5f9d9d0e3..44457a896510f 100644
>> --- a/drivers/mailbox/ti-msgmgr.c
>> +++ b/drivers/mailbox/ti-msgmgr.c
>> @@ -425,10 +425,18 @@ static int ti_msgmgr_send_data(struct mbox_chan *chan, void *data)
>>   
>>   	trail_bytes = message->len % sizeof(u32);
>>   	if (trail_bytes) {
>> -		u32 data_trail = *word_data;
>> -
>> -		/* Ensure all unused data is 0 */
>> -		data_trail &= 0xFFFFFFFF >> (8 * (sizeof(u32) - trail_bytes));
>> +		/*
>> +		 * Read the trailing bytes one at a time instead of as a full
>> +		 * u32, as the message buffer may end right after them and a
>> +		 * u32 read would go past the end of it. This also leaves all
>> +		 * unused data as 0.
>> +		 */
>> +		u8 *byte_data = (u8 *)word_data;
>> +		u32 data_trail = 0;
>> +		int i;
>> +
>> +		for (i = 0; i < trail_bytes; i++)
>> +			data_trail |= byte_data[i] << (8 * i);
>>   		writel(data_trail, data_reg);
>>   		data_reg += sizeof(u32);
>>   	}
