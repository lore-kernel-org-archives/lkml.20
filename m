Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazhn15013060.outbound.protection.outlook.com [52.102.163.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1CF3839B9;
	Fri, 16 Oct 2026 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.163.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148679; cv=fail; b=f4ut+m1Qz+0axK8zyhbXNtE7izEPHVYKwofOoVSCBUBvAQtVA5sZGyaRb2wDr7iDtwOgtlBERDRtVBhfZl//TKkjEQI24CieL4qQviSfvlWJEAtWert3PtuNVlVqp8VSJc+HvvLgzq/SGS/7Wt5TJLmFWpIValXygfi19qnHUDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148679; c=relaxed/simple;
	bh=UFVfmpqL3l5+fR8uCvXnOxasWfob672suiDcODpddCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ozp0M38OyV/wzijwqWl1UmGAiq0IJV5ONHa+e0zcrQhNhv0IUPMTOJFAsvmLIubL+wquk0nrQnIs//Sox52fr3vsB8fjnKZcb9Qatx+TU/x5LSf6ct/48oCGbuSVDvfliUUdagem744ILYbDkplE9u6mo/yCLfZTDslCJ0dA+/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AS8d1/xh; arc=fail smtp.client-ip=52.102.163.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AS8d1/xh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPBs/HyDMPMv7k7RW9qoDKIi38yMgURyE/wgHbCF6jOONrbd8bSl/C5Gm2dF8pNF4cWbun3hJQuXrpfkUhOg0/ScgxWHs65sDQi29bUlVguu0jxZxntCogF29FshMcNL8bL/MLVcUmZI6Fyj2JNVwsIY/doywyuuqpOj8n1k4wFeFHc+l/s0JW2C+SLzRCVdz7XGU2Z0NgXpZYFlrxqDfzhFy6+kQZK9oy1XdiYHP0rfqmXbtZI1x4xe7fwTQx5xr/cfq/JHIE8AohpuS7LLpc8QpqvEjnUA2kT3Ok7mmwctR2w85bWgTiJM2eSs3K+BmtsVl2muPfGIpL79xh25TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iA/Lbr8qOvNG9fLUoYzmaL3WLOSvLtCSldmJ5oc+BMM=;
 b=QYD8l9p/U6Ngr2TWgZm+yoHYSqlq1rSMGOXNGZMBRqR48KAFN+yPJ3siA4DgYaeyDLKmy7S/9QuM2E/KbGpjwMKtZQx/+ktDzwZHB/OxCntIPGoozvlPqlaKgrj5mLT+kAp6kJRrqyCpOUOnMwu2GsTDMHfu/hCiU8h8ofg8/XbVErjQF/eXU70jJMZzSCoARebIi+oath2GuJHtx1J0nXR1NeUSVLCWdaCmLp3cF5xchUgJEGr+F05v7fLwdFLGVT5zPKhWav+xtkiSx1CkuNcq+zqcjuulEbI3KD8+d5Usn/U3eDTc5quaLEciilIsK3p3QRBI9TmN+H0xWycboA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iA/Lbr8qOvNG9fLUoYzmaL3WLOSvLtCSldmJ5oc+BMM=;
 b=AS8d1/xh45ULMt9jGmDsftvve57CaDfHsBnstRPA731QQd7ATcghLvrsj8nt7GHpLJnW94WGokocJVnN6IBZTFRKNLtcIg0diOv0wcukiv6JJdZkWrmnS9jgptiin8/tRK9daj9Nz0ABiM9GbVxtxrMp3MAYOfEmbY50heYh3tUyoUlRw7h+DgJ7XONkCnlvgEyh3j5pu6/Eak+T7vX79Wu5+akmJtnmv0HX5vkEJyGfhyESKx5nhF2EzlJuIgFyDIEwdRtHC0hftnHdxUMap81UdY5yAePzIIUXkv6U3HDSJuoNw8JNF/pGbEuiJeYCrSSsDmLpV7HezGU/i88wPA==
Received: from DUZP191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::8) by
 VE1PR10MB3821.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:164::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 11:04:32 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::32) by DUZP191CA0048.outlook.office365.com
 (2603:10a6:10:4f8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 11:04:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 11:04:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 13:04:48 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 16 Oct
 2026 13:04:31 +0200
Message-ID: <073e5fa2-313d-4d7b-ac10-3a74c57d3c62@foss.st.com>
Date: Fri, 16 Oct 2026 13:04:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: vd55g1: Register as a sensor sub-device
To: <geocausa@gmail.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Peter Marshall <pm@petermarshall.ca>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261016-vd55g1-async-sensor-v1-1-cd72f6d68ea4@gmail.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20261016-vd55g1-async-sensor-v1-1-cd72f6d68ea4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FE:EE_|VE1PR10MB3821:EE_
X-MS-Office365-Filtering-Correlation-Id: 3288e2ce-a546-422d-ad25-08df2b7541cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|376014|82310400026|1800799024|36860700016|23010399003|6133799003|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006|12100799066;
X-Microsoft-Antispam-Message-Info:
	4fX+UVlkUePerZtqXeye5fZVFXhEDIuwa5ll6Xf5qzd3xu43IO4aXgkfWqmTu5gxq7qypskSH5EUxxyyV3xIXs0fA8Rsu4AqhWR9oDMzqATafXKuAgFc8F0pCPoltzwPo/s9iUf+gA1ajhmW1KI6JfrMQSNODZGDGq3d1W46Jl7XshCV9SjO67WQt0dR7tAXIOgT61nN0GB7VuSPhn8fBjn6wV9+RDmEzY7HwAhMr+Q47drzsQqqFcQwDjdRQJ+fVKtXAEYrx7HFTQL6Zhhj/9UxGGoQDuP9ZGy50B+plZPcmUGZ3PCqv2tl2PKbk1e7lJNrlnVzE1tx+iHLvzVoi98BncSiib9YAcDaJz8y/0xmAg3SeGp78ELqFi7PbhP5ZzN6//RJaUfhF0ow6P4QVMfCKo3IOtKCd+hhu9jVOQWLCJBPVgVgBE7v8rhMgjdPJdKfHr8++o1upkghFWcZRUeSF64hyWiX74DJpudechptWorJHh1/tPrdkwd82K4N3jmJElYUJPoCS7o9h9XmLNx20mr6FFxdj7bcPmvguaeyRfK1i2vv1FhgfGxhsOJL0/Rx1yDAT9S8fCM1p5EOBnF6ZrKBnWx0M6ooTrlaBvDzayP9Z+neSehnEjjeMq7f46PCYXefuZwnzuZB8MONwmKQryjJ3iaR0JrGnzXUXG+wL1RYRTbIDq1Kx6Ud6pBvbPsl1l6rPtxKGn5Vc+f0sA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Mmm0C2RhB2lbusnTAzNl989Bmz2UddYK7mK5CTIr0zsojSbWa504ANdGkGzXarJUH2dJQG0OpMZ+fS87SuwdDSK2LGKxfM2ruUWkiZF3n4XiiaAQxGtwwNMYjGy6fwRmC8MlgfY3PoaBGvhck6ya3bsTG6EvdRq45iNmoFpP3aNtp8m9B5Drmi2oly6UtGz/v8i+OQIx5LJWsZ7TPh6qd6jMYw3gNsP9hQO3IBswVurYpBrWL2dVdLdJTpnoCgV9qgHZB3JsIoefzjN7E4ziY35+4f9JLwIT9nR8pkuSx/h/U5vvmbEK8D4fGQi7aMqqdCXT2jaenoE+Sp4gTLs9F3Vv9BuZ0TqsxwPsGr4yNI5C9j8xbCdbHQt/mHuzIvmkIbv1IECW6WoZI4Idf0cHlTUzIwERy8VhTs+hvH4cqfIfGB4k6gwIJKGG6wv3NZBl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 11:04:32.4094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3288e2ce-a546-422d-ad25-08df2b7541cf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3821

Hi George,

Thank you for your patch.

Le 16/10/2026 à 08:37, George Neacsu via B4 Relay a écrit :
> From: George Neacsu <geocausa@gmail.com>
> 
> The binding references video-interface-devices.yaml, so a board can
> link the sensor to its illuminator with flash-leds. The driver
> registers with v4l2_async_register_subdev(), which does not parse that
> property, so the flash sub-device is never bound and never appears in
> the media graph.
> 
> Use v4l2_async_register_subdev_sensor(), which also handles flash-leds
> and lens-focus. v4l2_async_unregister_subdev() already cleans up the
> sub-notifier it creates.
> 
> Tested on a Surface Pro 11 (X1E80100), whose VD55G0 IR sensor (with
> Peter Marshall's VD55G0 support applied) drives the PM8550 flash LED
> in hardware strobe mode: with this change the leds-qcom-flash V4L2
> flash sub-device binds and the IR LED can be armed from userspace.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>

Signed-off-by: Benjamin Mugnier <benjamin.mgunier@foss.st.com>

> ---
>  drivers/media/i2c/vd55g1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 6f458f6..8e050b4 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -2043,7 +2043,7 @@ static int vd55g1_probe(struct i2c_client *client)
>  		goto err_power_off;
>  	}
>  
> -	ret = v4l2_async_register_subdev(&sensor->sd);
> +	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
>  	if (ret) {
>  		dev_err(dev, "async subdev register failed %d\n", ret);
>  		goto err_subdev;
> 
> ---
> base-commit: 62f482ff73bf3ae88b0c899115527752cf9cbf13
> change-id: 20261016-vd55g1-async-sensor-5be09860b38a
> 
> Best regards,

-- 
Regards,
Benjamin

