Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011074AA1FF;
	Thu, 24 Sep 2026 19:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277996; cv=fail; b=cEF0de8EcaFHrmi7FXZb6eSoSLaN69hU7CsDdqMTQU7Z85WZKUANQb8lvEe8/1tptNMF4IuRUAKidfQU1bCB+uc+lDf4jE8ahiR+ElFMhHWKc174ES7mZqhTJYxGSwb53FlkacWMm9wsb/2XuUf8vV+XlgMIFanqlCZrQH7AKfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277996; c=relaxed/simple;
	bh=penLIBEsTiWD75AGRVhkVtJi+b6ks5WKsVV82NuAo04=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y9KOSqSdsI+oLx0ghnkAelPIJmBQ2hRnXPJ52UwMvgqg/s4/T2+DWIbinX2QA/dKetK6DYGaKg21+NmaLFP3+nG8cBu+GUI4oaLdgc7FCd5565vWtp/eIvdF/LSMcnufoBsN0GfEr9xxdwW4mWKe9dsJcUthBcSKMi1hCL/p97E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Afp/ysYF; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O1VD1cti; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Afp/ysYF";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O1VD1cti"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68OIexXc268740;
	Thu, 24 Sep 2026 14:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Npg+G726iPW4uyitZcJKLC1X+wsPOr/LCD4QgGA4c
	yg=; b=Afp/ysYFeTrJWz4YQ9e4TF1EcFJmOhKyLzEzzGCGT+qIBnE1l2F86h7w0
	CupWUitRisRrYFzvwzipcRKelFrQspR8SaKqivhHSSSzkOApGNcQ41smycr/33DN
	hZJGtDBOdNIxe9oP+xgcGdb30VvQsdzMFG8A2wkvX1sQdpQPh41CDgh4UdaJkKVY
	PYMBOfEF0MytqXDnKa6fkxO3lkRs4tGb92t1yFGB52adDHGUMsD9+EXQQhv4HX/F
	vN3/EbcAHNXENdAICscoDjmkQWK5G9w471IU9/8HFjqhEaieL77FNSpw7B05QHU6
	IQXxNVyvI9NnW87zhc5zeMXFBXQXg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013063.outbound.protection.outlook.com [40.107.201.63])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gw13rbqmq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 14:26:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcB4VtYJnmEVwNUlhhy2Wz62XQQpuhzsNLxFk4bMe0ar3C7ozBXXPVVQs2NS3q1ZzPWKVZ6dEn82an5P/5d5cVl4xW8ca78INwfQq048yhi9pVT+f11d1xvMchZLcay/CRw2n/DBtglasbDbFQ8vIQburD8VDvcqeISZbsPDb31/LhrKOKGnwe0pZRKOOqHTVFFcnkNVZAbIGYALVe4uu6Tg8Gr/eUXsnetbnzny1FRLqBCZV+1F/PUntKFWHZynNhvkGxUwkwO5aQipBPezLNRB2XVdU/tuwycpV+SPpIx5Uq/7e9XrG8wWAiDTVK+7o0soauHHS4yqCr50Od2eMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Npg+G726iPW4uyitZcJKLC1X+wsPOr/LCD4QgGA4cyg=;
 b=E8C5PE/haVlgN5VM8AT1T563UaOno2zOwN2ZVuruB/6W3izg8w25RPX/1+6tvCidHLj6xj/ABRbTKRNRXUWz7QUqVXY/vHm/o6h5K5FMrvmTydZzXV+Zx4mC8FqT9Umi30qWyzh0ixgJv3rZQXPzmoatAG6KJl4aAlIAMX+kCNMxRkfux8tZOHtIjLF8dWcxR5ZxSfSxbmL5Hlgu+6R51sYldJYqpwryORedLTpzWMfgl3AZ/uCuQ4jbg0xBzLELhgt28y7e0X1e4NNje88oNDeHR+7IliKsMI/mkpmxdz/Vs4m8399lWJn07xjq1au3Xs0HS7fDnC1d44P6KNkiIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Npg+G726iPW4uyitZcJKLC1X+wsPOr/LCD4QgGA4cyg=;
 b=O1VD1ctidcx8IZGx1lrXb9MKKU2aUZw63pov9T7Ua0ySBI4yAB0yoCgLOCbM+YdrJlR50PEOcnfm9qLIwkt9qLJAtytUAHx+RsqQD0/EhlIwIFXAzwWVSbD857ygb3OkNk/nVCdsBAz4y664wJPDDGCl+UVIVXUxCuAPfa7BhTs=
Received: from PH0PR07CA0043.namprd07.prod.outlook.com (2603:10b6:510:e::18)
 by DS4PR10MB997596.namprd10.prod.outlook.com (2603:10b6:8:31a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Thu, 24 Sep
 2026 19:26:17 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:510:e:cafe::7a) by PH0PR07CA0043.outlook.office365.com
 (2603:10b6:510:e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 19:26:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 19:26:15 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 14:25:32 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 14:25:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 14:25:32 -0500
Received: from [128.247.75.1] (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68OJPWY9474167;
	Thu, 24 Sep 2026 14:25:32 -0500
Message-ID: <077ed9e4-51f5-46c1-8a9d-eb3c4d945c9e@ti.com>
Date: Thu, 24 Sep 2026 14:25:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] media: imagination: e5010: Enable autosuspend for
 runtime PM
To: Devarsh Thakkar <devarsht@ti.com>, <mchehab@kernel.org>,
        <hverkuil@kernel.org>, <sebastian.fricke@collabora.com>,
        <benjamin.gaignard@collabora.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260831213231.2125544-1-b-brnich@ti.com>
 <20260831213231.2125544-5-b-brnich@ti.com>
 <b6994778-7e69-435d-9f41-e46795397726@ti.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <b6994778-7e69-435d-9f41-e46795397726@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|DS4PR10MB997596:EE_
X-MS-Office365-Filtering-Correlation-Id: 39390193-135a-4f2b-9102-08df1a71b3c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	RkHHuv24XOI51sRXCtux1XOnjghfdN4DOmodGBAMcwPDh2LIQwibQzD3dRJ4SpwhMgIqs8kHXweHmB95UzyVvyiQGBqH8lGhoUPwMgvV8EmS/2BwzZ/RqmMRL56Lyj+fwtPw9xUWDlUSrxTleIzaRGu1Qa7HeSjog+ERNOKFQ49d24akVkpSpyvPcsjv9AyGxOGhNWzFDGCrCtiOtwFuXhMf5C93wIxBTpoETKBEyhgqkb/6YqRSGZiIMyBjgoJ/RnhgHkizCytqeI7HXc2j7TMuQGJUpRVP0d0Z+oQtv4SgTPE3LV5MjPbCZohdyz2OsVFbmPqDyL6uSHgjz+Uptb18/lV6mGnyoSSKyCEGTEHdATbUmJyfAF4oVubG6OZIeNNcq+d5gSlKspljJRLpngc11IGvUca48qqXnwllQEXbhBp60+cnvhev2AoT5DLD4G4P6cK3gLpqTZBn8DZp5zwOAXZRIruU9cq45cKRl/TJNT+iNYetWnzduCATEi9Y6pU5OCHFMTnKBONhQ00of1/INh7+xY+IEpwQc4V9B8au7sCi/dPhBExSgApmJj2NYCYuUVIWNNT3MUlVvDSomwjNa0NXAt6zEgsL/dpY4vRu3KKlkFjhr3bX+NC8eUbTVKVCzWWHzKRVdef+2TeIOkpOKDraXx60+Nrup6gj+i9yL+/Ny57DZYsH5EALkmamaF4P9U0c2bBc+l0mLIjjGA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h1OdtTDh38Y8cv+yFStGMHicrdbeLh/xD0GXYITBisfyx/wGV3QYzC4YCzzbgxjXVKJMkk95p/blCB9kUNt6ljozuaFgJHszU6Kgy9mV53/vch4yqVhVC0oOqznIQMlIHU6HEXnslhdqwmjn+/DHx1oMUQg2GSrvdhTf8gNCH3Dsq7H7bJRbuzZgyoH3+P4SokJk6BmvkBltEmDtqCfsgcb+iiY5qdJus/s21ltY1PGSVCE6wFp+Rkqy5XKLSyqo6va4TNFbOK8i2NYTur+R/c6Wdvwdo4VqPfijL1DAr0aiArjpqlfKbOqMGe2ZTxrsZgcRz7nxn6WM4HeCcZ24+WF4AuiSn8yCcbTMveYuOHy4tAjvJ68pTXt+uL7VgKmP9L/wWxO17RXSmv3je/swa/VxHRRUHEMQumJqeTGLuDjy1YJIRyMk8vFZ8i2EQylE
X-Exchange-RoutingPolicyChecked:
	IfB0xMQkQ5OZJYCKDSTz3ZxMyj6OHwDnlljHEovxtBc84q+GA030qXXI/tmtZQWDFx346PZ0x9BFmCweXzJkmIrsu2m0Z2g1I5bN/mHUyh6OmJ5b0nMQ0m8zh+fp11tNQWA2QUeJxjpKM18svoq1WBZmHGVq1ABk62WAGzYI/syvcd8t6+0K7krEpA/KRGy80YBW4KCSIp/lipEuKarMTW7uH/eIJVX32emLw1mRBFzC6R6Qh0o3UhnTgxV5wfBUx8Rr901Yix01x9M/NzoQNVNGgEA0yh/prU40QynGI2mX5zy/T8VcmhFzFNGMOOeAXC1egtEe41kP7FHskxuxAw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 19:26:15.8987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39390193-135a-4f2b-9102-08df1a71b3c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997596
X-Proofpoint-ORIG-GUID: fBL2LYmNvaWA134IDkT7F0N18odWnxZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA3OSBTYWx0ZWRfX3DXE2hGBfD/G
 rAvkbfjeiTw6KRCq87JTbZs3T2P3QqCpGqCCK55/Cjwp9S0ZKAImA4ryKbNhw+qyjk/Kua6WSpI
 mn9jtc2+xEf9C0ufWs2eqQnvTR6Gq41roNEv65kB6Kowk5qNTTTUBvgrvNBTfOZ5md2hOD4T9/w
 V4aNlyhfQLjjtMbpT7QhdRAvI42frAWKwHUsTPiOl5xeCon03mTVzwA3frkzNejD1yT7xJouek0
 xcqV38Jg4BU5vUVdZZntDaiQyA1cMOROnP52hWE8j/c9HXK8W+VDr8LZbXVlcIdIKVJ/uEs2uCZ
 lav4v8po9yoV1s3EK/5SjUtonXTgIL6Uj6WSroRvqc3NxK8zYQAgrg3NAfZYncWEBcDAK30H3WN
 WQxj0a6tAVzAw71KmGdWJO0dNLTkpI72CG98STENyPxfLWit7IVG75gvgN/tNRdCOcTemf7cWxk
 fgWqrX7ZNRw0TLmy2mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA3OSBTYWx0ZWRfXyzcI0mW6ey3O
 5lDEcOxjI8Ee3/RBpZd9YzSfLrB/3W+wL6vEsVDlMPnxw38JiNYlTSpgwDkEVS3Z5RHOM26QS1S
 oeion9NeKlAqEwmLRQd7K6a2bwaLIBk=
X-Authority-Analysis: v=2.4 cv=OICyTiaB c=1 sm=1 tr=0 ts=6ab5795d cx=c_pps
 a=42Ag0VRmng1YD8CjqzuPTQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=RHblG9S_B4l49GtXZJwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: fBL2LYmNvaWA134IDkT7F0N18odWnxZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240079

Hi Devarsh,

Thanks for the review.

On 9/18/26 10:55, Devarsh Thakkar wrote:
> Hi Brandon,
> 
> Thanks for the patch.
> 
> On 01/09/26 03:02, Brandon Brnich wrote:
>> Current implementation only has one call to turn the device on -
>> start_streaming. This can waste power of device as the device can be in
>> STREAM_ON state, but no buffers are actually being submitted.
>>
>> Need to set last_context_run to NULL in resume hook. This will trigger
>> QP value updates during next call to device_run.
>>
>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>> ---
>>   .../platform/imagination/e5010-jpeg-enc.c     | 41 ++++++++++---------
>>   1 file changed, 21 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/ 
>> drivers/media/platform/imagination/e5010-jpeg-enc.c
>> index 488f5d7e4c9d5..79347014562bd 100644
>> --- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
>> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
>> @@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
>>       v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>>       dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
>> +    pm_runtime_put_autosuspend(e5010->dev);
>>   job_unlock:
>>       spin_unlock(&e5010->hw_lock);
>> @@ -1105,6 +1106,11 @@ static int e5010_probe(struct platform_device 
>> *pdev)
>>           goto fail_after_video_register_device;
>>       }
>> +    ret = e5010_init_device(e5010);
>> +    if (ret) {
>> +        dev_err_probe(dev, ret, "failed to init device\n");
>> +        goto fail_after_clock_enable;
>> +    }
> 
> 
> I think we already do e5010_init_device(e5010) in runtime_resume,
> 
> I understand your goal here is to handle for scenario where PM is not 
> enabled but it's kind of duplication for the scenario where PM is 
> enabled already. I would suggest to wrap this (and also the clk_enable 
> from previous patch) with a check :
> 
> I think in probe itself have a check :
> 
> if (!pm_runtime_enabled(dev)) {
> 
> // do clock enable
> // do init device
> 
> }

I will update v5 to move this check to after pm_runtime_enable is made.

> 
> 
>>       ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
>>       if (ret) {
>> @@ -1112,7 +1118,11 @@ static int e5010_probe(struct platform_device 
>> *pdev)
>>           goto fail_after_clock_enable;
>>       }
>> +    pm_runtime_set_autosuspend_delay(dev, 100);
> 
> Better to use a macro for the timeout delay.

Adding a macro. Do you see any issues with the delay period or is 100ms 
sufficient?

> 
>> +    pm_runtime_use_autosuspend(dev);
>> +    pm_runtime_set_active(dev);
>>       pm_runtime_enable(dev);
>> +    pm_runtime_idle(dev);

If I add the conditional for enabling clock and doing init_device, then 
I will remove the set_active and runtime_idle calls. My goal here was to 
cover the case where pm was enabled at kernel level and we had just set 
clock to enabled state. With the conditional you are suggesting it 
should just be:

pm_runtime_set_autosuspend_delay
pm_runtime_use_autosuspend
pm_runtime_enable

if (!pm_runtime_enabled(dev)) {
	...
}



>>       v4l2_info(&e5010->v4l2_dev, "Device registered as /dev/video%d\n",
>>             e5010->vdev->num);
>> @@ -1299,31 +1309,13 @@ static int e5010_encoder_cmd(struct file 
>> *file, void *priv,
>>   static int e5010_start_streaming(struct vb2_queue *q, unsigned int 
>> count)
>>   {
>>       struct e5010_context *ctx = vb2_get_drv_priv(q);
>> -    int ret;
>>       struct e5010_q_data *queue = get_queue(ctx, q->type);
>>       v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
>>       queue->sequence = 0;
>> -    ret = pm_runtime_resume_and_get(ctx->e5010->dev);
>> -    if (ret < 0) {
>> -        v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
>> -        goto fail;
>> -    }
>> -
>> -    ret = e5010_init_device(ctx->e5010);
>> -    if (ret) {
>> -        v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 
>> device\n");
>> -        goto fail;
>> -    }
>> -
>>       return 0;
>> -
>> -fail:
>> -    e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
>> -
>> -    return ret;
>>   }
>>   static void e5010_stop_streaming(struct vb2_queue *q)
>> @@ -1339,8 +1331,6 @@ static void e5010_stop_streaming(struct 
>> vb2_queue *q)
>>           v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
>>           v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>>       }
>> -
>> -    pm_runtime_put_sync(ctx->e5010->dev);
>>   }
>>   static void e5010_device_run(void *priv)
>> @@ -1353,7 +1343,15 @@ static void e5010_device_run(void *priv)
>>       unsigned long flags;
>>       int num_planes = ctx->out_queue.fmt->num_planes;
>> +    ret = pm_runtime_resume_and_get(e5010->dev);
> 
>> +    if (ret < 0) {
>> +        dev_err(e5010->dev, "Device failed to turn on\n");
>> +        v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
> 
> You also need to remove buffers from queue and return back as 
> VB2_BUF_ERROR I think you should do this after the initial check in 
> driver, something like below should work :
> 
>      if (!s_vb || !d_vb) {
>          /* Buffers aren't even ready; end the job immediately without 
> touching power */
>          v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>          return;
>      }
> 
>      ret = pm_runtime_resume_and_get(e5010->dev);
>      if (ret < 0) {
>          dev_err(e5010->dev, "Device failed to turn on\n");
>          /* Jump directly to the clean-up path that skips unlocking the 
> unheld spinlock */
>          goto device_turn_on_fail;
>      }
> 
>      spin_lock_irqsave(&e5010->hw_lock, flags);
> 
> ...
> ...
> 
> device_busy_err:
>      e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
>      spin_unlock_irqrestore(&e5010->hw_lock, flags);
> 
> device_turn_on_fail:
>      pm_runtime_put_autosuspend(e5010->dev);
>      if (s_vb) {
>          v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
>          v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
>      }
> 
>      if (d_vb) {
>          v4l2_m2m_dst_buf_remove_by_buf(ctx->fh.m2m_ctx, d_vb);
>          /* Payload set to 1 since 0 payload can trigger EOS */
>          vb2_set_plane_payload(&d_vb->vb2_buf, 0, 1);
>          v4l2_m2m_buf_done(d_vb, VB2_BUF_STATE_ERROR);
>      }
>      v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);

Agreed with above code block and I add this in v5 of the series.

Best,
Brandon

> 
> Regards
> Devarsh


