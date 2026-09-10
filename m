Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907153F6C3D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050349; cv=fail; b=qMRKTPA9SzaB0oRjrIfmnfjeN5GTwH8T36b+fxk0Pnhp3YGbwNb9Iu5r0ndhWUlh8my3uzqM15WWFKwTQLYaEBHmw1mpQ2fG1cFuLqrV8KkIek+J2ec3bnI47ixqz0mwSh+8ISOErLtp3iO5yBD4jpkeEoCNTXV2KzCR5eiVFK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050349; c=relaxed/simple;
	bh=c3wDvPZJon5DttuN98XTzQSkGyPcbuirqaLISFTBF5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WPo2IWWyJ+xKCBDvJRuOTXv8M8bEQVs+2EmG6ic05KrZrIAdGFhZSOCZeMx2I1ntRriXDEdGlAAAmHqcAO0pF6TVjVcmIGDvv+SLdo32YAHf4+Zf7jo3aCa2mlBRCkSVWanGZUuxmL4lt4PeFnGJwmm30Fjff5Fk7Nlka9HzkKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=eJ5Re0iV; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=X1nNtI79; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="eJ5Re0iV";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="X1nNtI79"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68AC9XiE1085740;
	Thu, 10 Sep 2026 09:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9x2fdA3HTVg/S0yxwP1oJ/v5Y5el6H5LEYEb8Y0mV
	1o=; b=eJ5Re0iVBuvwN/peUlso9ntH9NMPB9bX3KKv0bSYqL645mEIJET/NsWEj
	cYBwYRCulSId5OJ67Wbr6GMlIxfiJmvUSyDvqFmflwy12EiBlzbnokDInPix18w4
	mVRQav7bfzlbckEWl2sugyXQDabaKO/TeUziP3NDdsxCrtDFvHE0AEQw1HEZgDy2
	CsGzpb32JOYNi/j+Y96+3pu2Atq0BjiJmXRgGea8UPDCb5nnRSbnFnLudvoZ7Hco
	F++gt32NWWbgegMOqVtl2Uxv31SZldybwb5Ada3KKcdWs2eJ5EhV3VQPavjtqlr8
	cmlakJLhxdUgh+OP61WTUqT4mXxLA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxgdvxq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 09:25:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGtPFvC8aMmdzfQUVuUI5AZWSj04/nQX8ZF3plKjRkS8Is1/rTX0Vsxs4RZoCIEN7b7kbb5d9vLitILtpGNNiFLrtxYdY3WlLwFky82eUhOHIklzlBmenVWe1ldwF94YyyDlSy0ACFi9HnkqhhMPjW9PRNjyHJDKLGBWuN9GYpRI1jnsWQ5UXUrsP2UcAutoBU+8L/nDHoP+Jv86ixVoLW1WGwAXw1TUTngOcMuFKveb1KfZ7k9eaEk/CtHduK0NfaJMMR2g9UFfN47NfTundUxkxmh0ABaZ5/rU386t5vrqLd95FnwGKYFKNexyZJV6KyeFfZrL0a7d1G5cQ1dl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x2fdA3HTVg/S0yxwP1oJ/v5Y5el6H5LEYEb8Y0mV1o=;
 b=BrLnZy9o9gDQAXp1kv8jm6b3yi15Ie61Z5ro69JwaI4LN+5Yw3OY+owQL6ALlrOBAgX5i0LpLL5MishCMWnIPIhYn5I7eP0N9y3x9+LIsvH+R7CBAM9dZjaLFCzGPu64N/Cowb7ZHJMS8izd0Ag4mxvfC4KWGQGSPYVAPKdLRTCbYs3y/LrdKqpMj3PIx0WpmY1+jkS88pWx2ZurX7mV9ceQZnOJmyFuxJbYpw954++7x0CTPQHHNdpj55cZxdWHEsH/6aX4Yeyz5ThKAmMaESfGsJeD9VfWC+P3hZft0iZGXpYagsohLpGuhw31yjEB1e5BVvKdEQHOzPkNxI8csA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x2fdA3HTVg/S0yxwP1oJ/v5Y5el6H5LEYEb8Y0mV1o=;
 b=X1nNtI79I0Llb+Ggg5cytRij8wVckCErjLShQihVAlDXgh2FChQfU0ksGRXOieN3eDvxiTt6rLOdeTFPWvLSkir6SFh3Tob8Wcm8zgsGW4B0MxqAofPJ7zCjSCnB9TPHNQiKI95s+PbU6yVM6v543tVEwBDh+e5d5FpvqG9TbfQ=
Received: from BN9PR03CA0453.namprd03.prod.outlook.com (2603:10b6:408:139::8)
 by PH0PR10MB4534.namprd10.prod.outlook.com (2603:10b6:510:30::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.5; Thu, 10 Sep
 2026 14:25:39 +0000
Received: from BN1PEPF00018547.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::49) by BN9PR03CA0453.outlook.office365.com
 (2603:10b6:408:139::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 14:25:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00018547.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 14:25:37 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 09:24:53 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 09:24:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 09:24:53 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68AEOp8c2488507;
	Thu, 10 Sep 2026 09:24:52 -0500
Message-ID: <96b806d6-242d-402e-be28-53f42be29883@ti.com>
Date: Thu, 10 Sep 2026 19:54:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: ti: knav_qmss_queue: Fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>, <nm@ti.com>,
        <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20260910044551.50308-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260910044551.50308-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018547:EE_|PH0PR10MB4534:EE_
X-MS-Office365-Filtering-Correlation-Id: 093185ee-7e68-48db-0516-08df0f47626a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|10067099003|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+ksHzUqNbFogggH9ZMAZ8mquX5bxagTRmh3CvgW1/XQsgPUXMdZ5YmEQwEGDeXAMVhucdhvt7B1gFLG/uZNKaifi1a2IHPtt5Yg+dNOse9k8g2yPinvxG/FC/pxtXs2HFeYv5Kim0bl+oO+Bw1Yd3cN04e1x+y+SZQPgIyrNXgLKYoC7CzsGbXkq+QGoyo+mAhP2aMm1gmscAekG9Y3v0w1EHDXwD4uHfZKBxogA5way5yi+Z61REyqerAKvgKfhPRSLfTh8bQGx7pIVk+MSTb77H1T53vF208H62B6ZWBEIos4k2mYAV0GpBYxbqy7vvxfjGn6Rq1vpYyx/tmeHPFjCultpiVSQdEGdcPHfBmRb+UxTcnHcMQ4z3Bg3rt0XO7Z92WD8brfWHzirJeVGQvgKDW8NEFpYJOo81DuEnwTMG/5yE7sqUxQO7RIoQKVol7Cew0tXOEubT1nOzDRf065ELZsuV4CbaA00cnhEIJlb3fhtY7auurlVwSikJ6QLeNypUgw+CrEdbpfAwEqRtXqyY4NYMMD9tPVBBjbqbNdQgGcWugwZQlanJHL3Ze5Cjh7kmQzihTkc5IvnwCBKNk7bLSTcjPO78VMoTBf9G8+xEyFiWJgoHiBgX0s91o1rS+7wPQd6oDs2UA1G+xfS447W7Q1HMrOPmipWaTvqX48Y7UYs9bjshlCyhfNqPklVVjAlEuZgzT4ONK+Cn9235w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(10067099003)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+YkcZJ3zUGllfI9HOTO76XNqKh1fSag9wWgxLyiKXHAf/ETAlzuVyuAyPCRDVvrDcf5loIY8YrdYjeAtOR/VZ7v64V2DECBeI+beFEhv/xsExaurS9rUmWVyIDPyi2a1qVVyXw1+Ir0MZUakMBIE4hV1eBz30RVkxBF6YkhMYeCgeT3X2TScoqfQFuzELHG6v1iDxNBanScXIH4oY3kiAneH3EidFy33CrHPUvuninE/Uu4uHSvEFcKnOjZR7UhReLq7fupC9utorBFcm+/2ZiyJBdHSLWf41ndiE67n5Py0E8ZAc1bTrurCNHpd17mRHyaXW67S69N1rrYfLItVEITbt4oDVhDH/by5uavEE8m7LkeN7xi5KSlFQtkPPwr/5EUy7U0LIbTWElM9V5Ly38lrytKi2H4wjZveSz/dlBm2TN69onzf2QDcMgUZ9vyc
X-Exchange-RoutingPolicyChecked:
	4UXm9tk71JjY9XzKGV8AOZtPANhfzAMtCwgBIgAWCZ3cY9W63lZxrVviVF/s8J/DQHZN3K0ve4/G2WTwDr7pZ1p4gtqgdNKOTzdTIspX7MVKGMoBz4p45Ile7lOyAUxiWs8mpL5iR9vDbhSITTdd8InaaVCYXe/EVF4RkeRoYe6a4spBS6WW+9quBoeZQideYBl5r1AlGc17J5Ic0GvoN1+BU89w8APHnpoTlcvcrHhrkkO19gM4uzncCUngqKOLfb0hZCjp4UOBtzTAD/PETt+tvQTULVpfWopFJuuETRaacawyshJP29uVWRFzohjM0TuKXrjh7jQxcAXJiJQx/Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 14:25:37.6870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 093185ee-7e68-48db-0516-08df0f47626a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018547.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4534
X-Proofpoint-ORIG-GUID: QoClW2qSfkYvI_P6HQblgtbpO4MGh6af
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3NCBTYWx0ZWRfX1OKqg96ay0zm
 gfB+NhSvFSQlwZLB0xPtuCgKtkq/86IyHH55Bed9WDOuSVX1SbEgk8P20HMQsXXW7XUACUfhUth
 JIvYVPkZKzf58AxsGMjDR/cRp5zh6wQ=
X-Proofpoint-GUID: QoClW2qSfkYvI_P6HQblgtbpO4MGh6af
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa2bde5 cx=c_pps
 a=v7DXidBSvHT+GL4JoI7fUQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=UPJlqljk8al0t2ttqLsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3NCBTYWx0ZWRfXxXvqlGZsBe5V
 z+EIOY7Hfj6YTdoxMJgwKEkvzyGU1ZpXIunJK/w7cjIeR3PXRlYhM7xsiTTwj4kldQUbOXme+xi
 rKeS5pkSams01yFA7TErPCGzQPsNwvbIA7VpJWzOVtv/oqM7/piQOum2nm8WX+p6QYmnBKpjDJs
 IUARTBjo45xHwNq6t/UlInCiuCJfGogZ32hYCW+mjBh1r0SzxCj4Xj0Dc8YGgeMWz/CDZdxzZXA
 spUMRpV38KCqJo5IoLfSXNHxgZJokA0t11yXxFA3WuF/IBXI7/QHJq0l7O8gZeu3sCVSo8vVwqN
 hPW8iO7628YnPmbSQ0mEFeGynwhjXbHCQkOSp/m0FUmsYnPnLdaPZ/v6N9DEW6fxeqlEw0UQdng
 u8f9ZAGREAB9Bf8mOLJ3r5LbS9glwIpYMeGHel0LjXblWVBW6JL/IY48sn8vky75LtRob5vBKRr
 XJB6LxhIcrTF1cSTMkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100174



On 9/10/2026 10:15 AM, Hemanth Selam wrote:
> Correct "specifes" to "specifies" in the knav_queue_open() kernel-doc and
> "accomodate" to "accommodate" in knav_pool_create().  No code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
> v2:
>  - use the subject convention this file already follows, which names the
>    driver and capitalises the description (Nishanth Menon)

I suggest using
soc: ti: knav_qmss: in subject instead of knav_qmss_queue
as most recent commits are following this convention


>  - also correct "specifes" in the knav_queue_open() kernel-doc, so the
>    file is done in one go rather than a patch per word (Nishanth Menon)
> 
> codespell reports nothing else in this file.  The remaining hits under
> drivers/soc/ti/ are in other drivers and are left for a separate patch;
> "indx" in k3-ringacc.c is a struct field name, not a typo.
> 
> v1: https://lore.kernel.org/all/20260907062247.9994-1-hemanth.selam@gmail.com/
> 
>  drivers/soc/ti/knav_qmss_queue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index 3e4041454f69..6186454dff51 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -509,7 +509,7 @@ static int knav_queue_flush(struct knav_queue *qh)
>  /**
>   * knav_queue_open()	- open a hardware queue
>   * @name:		- name to give the queue handle
> - * @id:			- desired queue number if any or specifes the type
> + * @id:			- desired queue number if any or specifies the type
>   *			  of queue
>   * @flags:		- the following flags are applicable to queues:
>   *	KNAV_QUEUE_SHARED - allow the queue to be shared. Queues are
> @@ -805,7 +805,7 @@ void *knav_pool_create(const char *name,
>  	}
>  
>  	/* Region maintains a sorted (by region offset) list of pools
> -	 * use the first free slot which is large enough to accomodate
> +	 * use the first free slot which is large enough to accommodate
>  	 * the request
>  	 */
>  	last_offset = 0;

