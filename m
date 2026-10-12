Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazhn15013063.outbound.protection.outlook.com [52.102.174.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84873379EE7;
	Mon, 12 Oct 2026 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.174.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820783; cv=fail; b=Oaq7F4276bFWE8Z7QD0P7rpaEiYy9LoQk+x/uIPIR8QBO4jypsDAKcPcG1bpu8t7awMA2QCKcZLYGBg6x6TCtORQu9lB8aqDn7a8Cj7KOo/3LCZyakf7K5jmC7Zb3zKECShPkHUxAwJuhUZO2xXp6UPhJuoEj6CI2xjliodZ940=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820783; c=relaxed/simple;
	bh=NGzY1vLIF793fMpxNXkPvVTL4KlKxUaa2P+WjGQrUlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fW9Gjig3ca8LbPstgKYNiYjsHyvMFWSpbgIYvFexJNdIz1RdsjXl19L6HY3t27KSnpFIfkccNFkRbO+HaSDEo7lSQquam/+MI9OOJprwOgRgiyS/G/NJKuXN7WQ0lkMbwhWz8jCLO3JOabQJHAAmkGPPAG5t6uZAeq0452Cxx5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YxNedkc8; arc=fail smtp.client-ip=52.102.174.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YxNedkc8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJvYXSoLfyJXYFAiusJurCQFOm8UrRNmTEe1llbQIJjP9RbDB/aZw8QgFMewIZ/rkv3oih6gdrkXjm1/nhNiOV+zidh4hZ1yeTHKt2sbWriH/0mxh9ujNDM8UYogoqucugPb52vuoBiRgjt2uQDnGJSyMr1qGIiQuNsxac/N6nicEHhNGasin21WeJaNOcR18KBz9cPYqKmT+g+71ZRXcenunclWYb9LahIQbpc6xgal6kPIahTYIEPWCQYPYXpRwozCERkiR3n9oeg4+/+YnWaX26ZU5E6GvI/gYeqSMYK+leKGK9L58FJrkeicRm1wubAAUoU9ICxvU+o+ntMwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRNrEiGEKaRbNbGD84T795cPibjs7HX0vq2KMqhkN2k=;
 b=dK2zg9eNzYJ0boKpwGk0v3fUbfiGJPk/qDFgUWDH9FWLP//A1pFGAQmXFe9QO+WbmkLf6QCVZT5mVOlsMROiHqj4EWw7tzg3CGsooHMniztIO/RrdFlkCO58403AW05KMagQm+zxd1RZea4qSZxlFzOZ02thI5hppiRQ8JY54i2keBzXK62C3kH0qdyDoqDnhWaw9u6tOgswWgRslpob1BI+jOpcZeo/Va9GKdQg4EghUMRy6iwkfJyApYd72yM9CVHUg6MGpLfl6okv1rmjA6MwFeNE2WMJ5I9dilidPExGmxOPedmedmpBvsnaWa0nNKpulInAG7TdoyLdoabL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRNrEiGEKaRbNbGD84T795cPibjs7HX0vq2KMqhkN2k=;
 b=YxNedkc8gikg16LDOYd1owgvSLK/W3HqNGfO0XWYQR8mNa09lU/Htish5w7tHWOvulIvTbTLrTf6//i4OstOlcf62FOtPZuDJDYL06R2GYRwy7hIXOapO0igCT4tb4Ub5CCMhT1RMssJVwHWp9sQxsF6E9QW6pYGvqsvwp0bYqB15CSzfsY/Cz1Qr2bgiBk2h2Vql/p13N3akAUzNSRFsRjs20Oj3QS+vm/QgbLe2dDtZqBlAqOY5n5wCTf4JYuPHQCr0LFSY/Bml31MLE/YLL49F60zvUpTQgEkasmopZg2JRIt7Cm041NLXDFibF8p1+NdumL6QdmKeqsWlv+XCw==
Received: from MA3P292CA0068.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:49::6) by
 AS2PR10MB7527.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:591::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 15:59:38 +0000
Received: from MAD0EPF000008BB.eurprd04.prod.outlook.com
 (2603:10a6:250:49:cafe::49) by MA3P292CA0068.outlook.office365.com
 (2603:10a6:250:49::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 15:59:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008BB.mail.protection.outlook.com (10.167.241.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 15:59:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 12 Oct
 2026 18:00:03 +0200
Received: from [10.48.87.64] (10.48.87.64) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 12 Oct
 2026 17:59:36 +0200
Message-ID: <ecd02e00-f635-4638-9a72-c11b8f57eebc@foss.st.com>
Date: Mon, 12 Oct 2026 17:59:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: stm32: spdifrx: fix synchronization state check
To: Avi Weiss <thnkslprpt@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Liam Girdwood
	<lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261011035459.2289403-1-thnkslprpt@gmail.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20261011035459.2289403-1-thnkslprpt@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BB:EE_|AS2PR10MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de21ad8-79af-40ac-c0ee-08df2879d17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|34020700016|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006|12100799066;
X-Microsoft-Antispam-Message-Info:
	iycZNagI9srOeS5zydcWWVVwDahRl1ARIVft987MV18hct7ma+LJzSuavJ2wbX0tUm1/84ktY9hv042N19jHH2vWrbqPfSVPkX+Ivo1XjYM+yQizgYFV8Ufa0PuvP24YePkmQee7ENEFEB34FFRmvxr3Jg0hW1VwDzoW+YFpkgItWmIvapBv5GtnTpYKP7QPCD0yo1mmh749a4OXJVddIEFBcZxd5hfQjXH5eZ1izwc6+MtZ3VlDYDAcQwvoelnIp6gArI006zy+7D6zPI3CxJmZKEMDpqG2rDII0NHiZW96m6MHp21417rQOYu7BzX813PY6p6Eqg3AYhTj4xlD6C2knfV3Hrlkz9rDTCIvXkt3sLWowCaGkN7d+9OjhXuKNTM/rQ+ElE8DqyvoLOF75kvN6mAKOdGYok6RhU55PPp/8cUMOwb3Zw8VKqoP8uJKOBKDGyKIDc1dNxYe5+ptRMDu0W4h9BLasaDJ+k9yaB1fvVkmLnebR+yMENKuEoEOLDfZ14iyPlr9mN5hkCusSd6ICR0JOLqUlU2Vq6/1ougfNNOZrtV8I17NPQALA1/+PAnMreGWZC/llKQGIaAdgLPWCpLKzinCTWtwiYW/tUIQEs9zM0TR/EWkZxK9kJ5nwWKWxdiBzMQ3hIDUxIO4dObwk5tT+UQTC7FRnZzkX2SanAGnzPUH02rlXve2P4YJEFT1BryoFQV5oq4Gi8/OUA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(34020700016)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U0ron0O6p9RtmlIqFV4F8viaRUQLvzNtzt7nCPefNFGiPXpJaZRFpdBb+8+4BKXzs1FN8BP8TILD3hxrddz63fexCJbG/8DBtZ9T7Rv/5rbQPCPar+E9EBFDtVhYlKC0YIWPW2Hx5qx7G12wS+1ioQ8ylzisr4LH1rb1mHZLakFkjcOnkYwdrlfnLAFXmLZ1k57rh0ZeaZj3Q9aMhS32xHCrqqCv65Ck61WT4L8kGCjtiBKjHzbLxIPQDd4RlHzCy9JFfe2HdMTrPOUMuYox6e6M/3r/WLny77sKt0hFxRUtYTi0sH0LqMX+HcITnXp3UCuQPJWWKZAL5Ninbbtx1/KyyRvMUPQfsYYbR9coKFWTzxLoMWd2+U3lhi8QSjdSWG9dltfNTWvest5QmVj9Ex1EflOD1CN+g1y+a1Jq5oy7L/eyWuSqASL5drAYdP+W
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 15:59:37.9505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de21ad8-79af-40ac-c0ee-08df2879d17d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BB.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7527

Hi Avi,

On 10/11/26 05:54, Avi Weiss wrote:
> The interrupt handler uses a logical AND to check whether SPDIFRX
> was in the SYNC state before clearing errors. Since both SYNC (1)
> and ENABLE (3) are nonzero, this also treats ENABLE as SYNC (and
> any other non-zero value that might be added).
> 
> The logical && basically just converts this to check for != 0.
> 
> So errors occurring while SPDIFRX is enabled cause the driver
> to retry synch instead of disconnecting the PCM stream.
> 
> Fix is to change the logical && to equality (==) and only retry
> when exactly in sync state.
> 
> Fixes: 0c93c291321f2 ("ASoC: stm32: spdifrx: retry synchronization in sync state")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>   sound/soc/stm/stm32_spdifrx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
> index 0ece547407739..88863dbd05d9b 100644
> --- a/sound/soc/stm/stm32_spdifrx.c
> +++ b/sound/soc/stm/stm32_spdifrx.c
> @@ -720,7 +720,7 @@ static irqreturn_t stm32_spdifrx_isr(int irq, void *devid)
>   
>   	if (err) {
>   		regmap_read(spdifrx->regmap, STM32_SPDIFRX_CR, &cr);
> -		sync_state = FIELD_GET(SPDIFRX_CR_SPDIFEN_MASK, cr) &&
> +		sync_state = FIELD_GET(SPDIFRX_CR_SPDIFEN_MASK, cr) ==
>   			     SPDIFRX_SPDIFEN_SYNC;
>   
>   		/* SPDIFRX is in STATE_STOP. Disable SPDIFRX to clear errors */
> 
> base-commit: 611680f6050a66b84e5cc0af33862a83d1f7a200

Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

Thanks
Olivier
