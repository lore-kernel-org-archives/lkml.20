Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023098.outbound.protection.outlook.com [52.101.127.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689F3E0758;
	Mon, 19 Oct 2026 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399715; cv=fail; b=SeU5ug+3digh7RmcqwJNa6W0Kfv61g42gfrx5zAAEXiuBAJDYJyNiCyoub0L/sGm9Yp7oLbzJYfzystSX8cNF+RzkelgY+vGlAZa9kk7HOcvGeN+fw8lY77Hrz4Ednh2L9oGxDUH/czM7DkscB1fRRwJspoorAUm254cc2aR7a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399715; c=relaxed/simple;
	bh=Cmnbg3EZ1Thh6kE1YPKPoNkQpFwN8Ml7YKlGTv+OlQA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sf3AnNE7aD5jjHcLcUDzmvI71hmtWqJzi+k0gL3SI6FN1l9te/YdKy3Gf99I7RuqH+7ICVbp5PFiHlPTGIFXX9jxBOKoXBEkTkvTQ73r0UYU8U5OoG3m1M/rnanD9kD0tMzS41PdHmmrVyYVFhfq8mNVU7tbou5vFdINwCDlwkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=IiyqDg1M; arc=fail smtp.client-ip=52.101.127.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="IiyqDg1M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pspkLCWzKjygDR8E1c6oKjuM+lEGn9CnaYQclJPELl3Bl05bmiTW6bCFviMbAFC57iaDQjaT6c58ffFsWD+hCC1/616IC1F6FOyHOU4zZlb1+vIB9iw34DCilGnBf8Jn5onczBZ7nheNZ2VPaTJSQ2eahY4X4TywMvROR7baeZxUmQBvv0PUAX+wj+XNegOTf7aBdcdY2wL7Urqx6n/iltYldG80j4QASk2molcKtK+nJ2RgkGX96YCJeMwztly0GonQgnFpPzrmMcf73puHI6qDB+OxVgDH5LW8rS9/+XE5OuHGvw6Xjf24h4hmVa63r1dBSkP9mkK4ynXOcObfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH5WFJMd3CD/5Gvm1l3QARewPMzviATYFgzcK0mNA5I=;
 b=O8A+nt8rWOtBPrf20PhDVv1EuqinQJNPu4BHqAabZagO/DHQxArcLtQ9jI5FUdLTRquwNKFm+uZy4LTvvjBIwMoqU8LqcnFCObPognftWrrWtD7Hv/YKJwI4ir1U2x/wpAoUXRKhT1Pp3ly/eCQfMsn8Llz2rnZ8fuHoVf/BRM38mrHrimb7F6ythz5zoL53+4F5GC/2h0Qd4HycWkmSu+bgKfk9vkzOu5dFWCTyrrrKvlL1wmzqvyfSrXuc5U5vGpcrM9TSFocRyr1s4zMEOHOBLoFg+GO6+aW3fLWSEd8GaVObfozdOzQHUQAA4C0QIbZcjhLOdLuHTSTmCV3DbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RH5WFJMd3CD/5Gvm1l3QARewPMzviATYFgzcK0mNA5I=;
 b=IiyqDg1Mpo5Wf+BOq87VC/TxU+07OvBDdAKcM0FSwyER/iUI7AZAVnqlR+obb3nWYKh3Q5HaJ/qVPe2KCAUNPX/dk/Nc7Wb0d+o25JS/5lO7PNcd/DfF8KFg6d7Jdvn7ew4uYMZOyvWvgBksbkImDQVyP5Zpo1BrXSCDgoN+A0OzEsuCPA6G3vTQaAfnwv+0rgTf/55RfvprGHT+9PDWH9eh1sn6PZ4SYCRhpPixSoSNyPFh5dgFzf54qX+4H3V4RTphNSQ/zoNivkIWABWPB3oVsF2zDOcMDbMlZbTYvaiUlYvuon2LOst59GXj2MVl9TfsURgq7WHxrLrik8Pn0w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TY1PPF538CF1BBD.apcprd03.prod.outlook.com (2603:1096:408::a57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 08:48:31 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 08:48:31 +0000
Message-ID: <d8fe5c5c-4b60-4acb-b659-a963273936c5@amlogic.com>
Date: Mon, 19 Oct 2026 16:48:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: c3-mipi-csi2: handle runtime resume failure
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jiale Yao <yaojiale02@163.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261003081129.433041-1-yaojiale02@163.com>
 <20261003081129.433041-3-yaojiale02@163.com>
 <99b34523-8ee2-431f-ad1b-c1e11dd1412a@amlogic.com> <atXFmYHrVP5uwIbj@zed>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <atXFmYHrVP5uwIbj@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0079.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::12) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TY1PPF538CF1BBD:EE_
X-MS-Office365-Filtering-Correlation-Id: d147d903-06bd-4b5d-3f3b-08df2dbdc042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yOBPQ2FZeg6y44UOekgy93LUdpTXgCGIycyg4uj+lxcdZKkiEPMRUOcJLgeFESMTTV7VI27YRzyNYQEPfMsOueweB6hofQhRyuCDFYiJW3HCP2tjj9fbjqA0kviOOcOkypCBCi5bSGD45UF062HeKrJHx4C9VH6c5jevjPAQXHB0wbIvprw0qkpudKJLpZ3MajBDtzjcNI+GLfNxxE6i5XZDc4sPNzTRAIVFWXmkfm/QinFQueY0fwXfR66Ch1KBHPrfYzBHM1EF0a28fWC9v5Le/cwscdVZsRNyz7ZCzQ04HUh1h+PmKqx8nL8Ne717mfQa9ztEADSN7diGLDVEI7X+2yeZ/YbL8Eif7mp77QUDfgb9BPxBrzfcSvirck+bp2IoE/zU5a9kutQlPD9t2yyyvP4YzdsruEkTMqMxaelD8vVOcqnouWy4TkGa7NsG/kZgM2eOrXTk1aoMMNBkafKdCrt2OOsZyo3i1HbnmcZoyiXHUbN1m8+Bue+cxaezztXVxeIkbsJkmhcwIHAdnNFcog2nZbA7jtX2fHaQXoJn+cUer0HHLNSu97VDPNgJ6TlZThubim+fANyZ8qDsB8qQ28jrdeLas2FnjYKWGWfJLEby4m7ctipCEyg2jogkiN+0Nu+a+D7i7ez3zxUjF88JHB/jd8gENbzffVJwKVM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ujk1UGJaY0ZDOHNPd3FMQ0hvNVpUSkRGUUJ2ZmJucDdqcG5TZTkxR1ZtVGpE?=
 =?utf-8?B?VWk2dDV1NW0yRGorcFVMcHNab3Zmb3Q0UGluWitZOGl5M1ZlZDUyQkdPYUV3?=
 =?utf-8?B?TWMwbm80Ry9BQnVpTitzTkRhV1IyQjNrODBObHlvYlBTajRxZTdIWGdDYWxm?=
 =?utf-8?B?ZVV1cG5zTHRUNE9KcnR2UlpDcklVdFBuTjB2Z1ZraVpYaFliSUo0NmdQVVE2?=
 =?utf-8?B?cmt6UEE4V3lqT0JkYVVKbWhRMUpKMDB6d05IejZxa0tVdnF5dXpXUWVwUHZz?=
 =?utf-8?B?dkl1NmxJYmc4WHhPQTJGUFJpOEsrRWw0SjRrU2l5Nmc1dmJYTUUweDVyOUNW?=
 =?utf-8?B?OHFxREFwRnM0V3dvYXZFNTk2K3VkUmR6OXpOVUk3N1Z2dlNEUDJtci90TlFB?=
 =?utf-8?B?UHp6ZUs0d3BocDNRY29FNmpJMFJmVWNmZ2ZJSDgzWCtQYUtWZy9nM0ZkU0pr?=
 =?utf-8?B?Nm10Q3lIazBNNlphTnJiN2tRZTRnQ0RnTTNlTmdFRmcyNWdoZ3RvUS9zeTV4?=
 =?utf-8?B?cVpuM3EwN2hOU1J0UmtoTERyUmwxcjN6UHZabFVPSW1ZRjlLVXY0dTQwSkJR?=
 =?utf-8?B?NVJrYzdmTlFmWlhVYU5VcU5pRVJlVmczV1ZYNHk5VnVkMExQRXFOQU1Sa1A2?=
 =?utf-8?B?cWdHdVNFaWRNdWZNQVQ3a3pIK2FHZ200TFdRQjJyZXlsVmFNZG5PeEJraTRx?=
 =?utf-8?B?YzFtWUdvcU5wcjFSWkZ5SU5rekpDamNwdzFCVHhPNm5ZakNVSVhLZXdHU3pw?=
 =?utf-8?B?dDVGeWJ2ZjVYaFl1Tkkzak85a2V4SVcrcTNuSnczZkhBamlOeS9ROFREZzlm?=
 =?utf-8?B?dGoyVFltOHNES0QzKzRKay9XQlAxU0ZOVDFIT2o0TVdvNVcvNzNFNG5lTWUz?=
 =?utf-8?B?eGhFZFh3T1R0d1RJUkdTUGh1TWFRenRUMmFkOERuT2d4MllGWUFySWtuNDlF?=
 =?utf-8?B?a3Mxb2lqR3o5UkIzUU9BeW1SLzhzSFZiUldyeEFsUjl6RFFldGlJK3hXZlFG?=
 =?utf-8?B?cUxUYWNRYithc1NQaGFOdEJyRm9ZbzVQSEhBUFJlWFpTWlgrQXA0Mlo4UXFQ?=
 =?utf-8?B?OUlNckd2MldwdlE3YUc4SCszNXdhTmQ1TUlHUzZzek5FVHFBc2lHZFVtekZo?=
 =?utf-8?B?VEhHV2daRnFLVGVyVmJ4bmtWTlo5VG8zTEU5d01PUDF4N2w2ODNFT2o2Tlc4?=
 =?utf-8?B?REZ4L0FFQmdUQURJbGd3eVBIQVB3SHJNdHVESXI1NTU0eVM3Q3IvM0dXL2M0?=
 =?utf-8?B?WmhQaGZCSnI4cFc4NUU1ZGtuV2hRdVFFdlJOTlFJWktiZk1udnNPK2Fhdmo4?=
 =?utf-8?B?NFVTRkZPS0VHWDZLL2pOTHh3b0pNTlRCVlhIbDdxMnJKZnQxUVNva2N5WDlN?=
 =?utf-8?B?QnJPL2JXOEQydXRTcW1rS0dqYUtmWkpnQ25kbko2Tzk0bHhBSHRmVHQ1bHQv?=
 =?utf-8?B?WDFaTUpPeDV2ZVJscVB1bm03V3NNZFZzbE8xSjU5RTRjNXVtOUtVTE1UY3Q4?=
 =?utf-8?B?cm90MnpzV0JBRjdBTE1HK040L3Y5cmIxc0NndU5Zd05FbERwTXc5QlJKUXlu?=
 =?utf-8?B?dFFVSzFod2huVFlsSFNWVTJ6K3ZkZTdNUDk0TjE4cVNhbU9xSjRyUHZDQVpi?=
 =?utf-8?B?TUR0RFFBZjFuVGh4cFNUWG82ejVGSkgyMlpVei9tL3lscEN4KzR4ZGkyWVla?=
 =?utf-8?B?MVNtUnFmaUUxY0tRN1pUbmczQ0w5Z0V4bU13cnlYbVEweUpYeTRpNXhNWGNh?=
 =?utf-8?B?VGJiOHl2M0JIQzJDKzJ1ekxCaFpRS25kaCtaVzZpTHNTNHhYaGNzRllPWkRO?=
 =?utf-8?B?TFAxbHNqYXlzZFZMSnd1azBzVWFRamtqT0hKV21hQ1RaYzAxKzRwK2x3cDhY?=
 =?utf-8?B?OHAwMWdtYm5sYk1VOEllZGxtOGlYUWJiL2RaMkFWSG5mNEtGTGVnUm1ZaHls?=
 =?utf-8?B?b0VEWFZnbjF0d1pZamF0RjB2Sjkwc1dsc3N0dUN6TTFxY3dSaUpLSlQyOEhD?=
 =?utf-8?B?R0FJaFRSWGNncnVDdzNNbzhtUTJlQk9lQXpPeStoRXBFcUxVbURnR2NXL0JD?=
 =?utf-8?B?R2Rjd0NRbWlzNHd1OGVIbmxMVDhPK3QwR2M4eHk4S1BaQTNKcHV4UFBqY3dU?=
 =?utf-8?B?RjhMSW5CZm5LM2lvSmwzbHVKRzhXbG1iSUppbDlFWlNmbWtoVm54NTFLbmJN?=
 =?utf-8?B?MHl0V3ZBSmdQUXpnUEVsNHphRDRMbnhESHpVZVplZi82ZVUyZXo4YVdTaXRP?=
 =?utf-8?B?dHI5NGZ1SnluQ2h2cllYM1ZGVTgxMjk2YzJuSUI1ZlpFeVpwSGRzUXU0NGJv?=
 =?utf-8?B?SCs1dlhRVVBtRW9tcXE1S1JtcG50RW9lSitMRWFpZDVBZ0VCdDVJdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d147d903-06bd-4b5d-3f3b-08df2dbdc042
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 08:48:30.9137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BET6pfY6qoQzW5R/R83kIMHv6b7MVIolLv8/o3UUFcqSmc7qwOfSm5YRoBXCFH169X2FiXwh1Knyr+Mt8DX7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF538CF1BBD

Hi Jacopo,

Thanks for your reply.

On 10/19/26 15:31, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
> On Mon, Oct 19, 2026 at 02:24:34PM +0800, Keke Li wrote:
>> Hi Jiale,
>>
>> On 10/3/26 16:11, Jiale Yao wrote:
>>> [You don't often get email from yaojiale02@163.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> [ EXTERNAL EMAIL ]
>>>
>>> c3_mipi_csi_enable_streams() ignores runtime resume failures and starts
>>> the receiver before reporting that streaming is enabled. If the power
>>> domain could not be resumed, this accesses unavailable registers and
>>> the disable path later drops a reference that was not acquired.
>>>
>>> Return the runtime PM error before starting the receiver.
>>>
>>> Fixes: b63ef604a28d ("media: platform: Add C3 MIPI CSI-2 driver")
>>> Signed-off-by: Jiale Yao <yaojiale02@163.com>
>>> ---
>>>    drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
>>> index b9e4ef3fc308..4731d58bf2dd 100644
>>> --- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
>>> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
>>> @@ -431,7 +431,9 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
>>>
>>>           src_sd = media_entity_to_v4l2_subdev(csi->src_pad->entity);
>>>
>>> -       pm_runtime_resume_and_get(csi->dev);
>>> +       ret = pm_runtime_resume_and_get(csi->dev);
>>> +       if (ret < 0)
>> Is   ' if (ret)'  better?
>> Does your driver depend on select PM ? It doesn't seem the case to me.
>>
>> If PM is disabled pm_runtime_resume_and_get() returns 1
>> if my reading of
>>
>>          static inline int __pm_runtime_resume(struct device *dev, int rpmflags)
>>          {
>>                  return 1;
>>          }
>>
>> is correct.
>>
>> If you
>>          if (ret)
>>
>> also this case will be caught as an error, while we instead want to
>> continue as the peripheral is meant to stay powered on from probe() if
>> CONFIG_PM is not selected.
>>
>> (I quickly had a look at the csi2 driver probe() routine
>> c3_mipi_csi_probe() and it doesn't seem to power up the interface in
>> probe() to support !CONFIG_PM. Personally, I would just select PM
>> unconditionally almost everywhere these days and be done with it).

Yes, you are correct.🙂

a. Here should keep 'if (ret < 0)'.

b. Add 'select PM' in each Kconfig file.

Thanks very much!

>>> +               return ret;
>>>
>>>           c3_mipi_csi_start_stream(csi);
>>>
>>> --
>>> 2.34.1
>>>
