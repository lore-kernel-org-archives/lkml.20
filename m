Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74F55B21A;
	Fri, 18 Sep 2026 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740964; cv=fail; b=kGPeXCL0P2tSXU3OmKUhsv9NUd/pgp463jS0nLM2FH+Tw9Gwicp3w4sfzQrtsShy9cOu/Sud9ZREB+z1RVEsYbpByCcnV34b/y7WPalpDzpFugg40wZXvWmjG6Vb2rB56UdbHuQOpKvIUavnqQvzD0XU5Ojf5vubjJSHAZ9R+aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740964; c=relaxed/simple;
	bh=zs3I5u3MQLr8olYtI0GVBkWliOq2AF4SSnAPX4r4bbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oN6LZDAYVGmkOJGc4aRAYNH2oeTKGKqRKgkFYBjVqiRtsmN6E7jtbUDe0LajgiWg9oXU1S/Pmmz23rG/xabFWU/FuGH4JbQgb2Ga7ownsG1hQnKUot/BSAPoXz2ic5yOauhUoU3+3okJyfKeAqLGq8326dec8c1p2N1ccidalZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q+TAl5t7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=d/L6R5QI; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q+TAl5t7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="d/L6R5QI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IEDlEA2648389;
	Fri, 18 Sep 2026 09:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=lIQESLOMf65CYXTiDP
	kK+Q8JyYPEBnRHU+Jr9g/5mFc=; b=q+TAl5t7PYiwXJlVSyKg2LX4RaglAT2V43
	QRkPUZ5tb9CQ7PKIdfB3PAHNI6GCl/DGYJh4ioPAfXsimmf2t+N8qE92Ts9moDdH
	VdmVx04/WG4Nu4Y5ArFrsAy+KL9CzufsSJNqGF9O6wMZrTcThu2in2XVAPzQ6g2+
	BTk7wRqoIuBU/957kaelSJn6Zn71ivMl3GJH7ueftJpUuCHTsleS8wjgOtMc1e9e
	gM2JIXn8bgmBR6bJ0ToaQxJNGplcLLWpcWfcLXxmOvzZpk/Gq/sGaz0x7G6y0tBE
	nIPuPGpQWL3ZiUt4zfT8/eK5XPdG1u0b6oJBFei52MPq2idWtjvQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022101.outbound.protection.outlook.com [52.101.53.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gs6vmr02s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 09:15:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHb+xgE9P7HK1VinaYhYabBZuM53Hyqym8wxp9Wco6rxH7I6UhInTBBC4K9PZ9RuHagFtLe9w4UOeSN6q3kiDXbRx1l4cZShpWgvLCXCzwDtZjg4rEvDO4Hs7zyPA+nHORv3t8cDCLweU6JwltXB1Riswbpt3QbTh8RUmWk0GsYRG9CgFAX1FjsANKgxIaafcw3gN6q5OOhjlbUe7RmE49wUyk6wBth2JhA3OPzRDxmyRoSTu5u48kws0B2Bz244EcSsQel0YfiptK/d/jMKdcqUYh8m4EUIStVTYB2tD3QN5u74imDh+4UL5IXl8v4Bl50TPCnyZgmpNE9TF1am/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIQESLOMf65CYXTiDPkK+Q8JyYPEBnRHU+Jr9g/5mFc=;
 b=y6zrlXVbOfCLzGck26JNBbDX0Kkas9+5cna2aSwqZAWQ8My94//wBmNRVqttJgkeuj5JXgj8zgZttZ1QNKmJCPP7W9RPgpQf/TTECWOT+9YwUttlsNOVtqjwaLq9t4zKK0xkPo5bjVlXthhcWz9Xe9sLlnK9ZW2LL2TyLLR7OaR3GNrhNLUxDWbRJRSu3G/WMDeACDFH4BELSuwoFNxOSAoL8ZYBZBoPSaqA7nFcrxDaBEPBP+fa7DiDWTU3F62TySHyjmWUIhaz3XQyAHlSK3evmFXRUN0DKOvkCZUU5N7qgnbwTLUrDYdd9X5kVycbVTJXoaRnGqyvIOTUs2I3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=temperror action=none
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIQESLOMf65CYXTiDPkK+Q8JyYPEBnRHU+Jr9g/5mFc=;
 b=d/L6R5QIyP/IexCVFlgMytNJ8p/FmP5W5ReJ2mATiD9L/0x09EnuCuDQEue868KWI0iMH2pIS28N8Zc0QPJgXFxzL0sOzByPrHzGUihMZKZxXYVIrC/WiDtsK63mYmFKZkXm+ydYCYyUmugn046vIkd7gnJNQpundPjC1NKd7Nk=
Received: from BN0PR03CA0052.namprd03.prod.outlook.com (2603:10b6:408:e7::27)
 by DS2PR19MB9174.namprd19.prod.outlook.com (2603:10b6:8:2bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 14:15:24 +0000
Received: from BN1PEPF0001854C.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::4a) by BN0PR03CA0052.outlook.office365.com
 (2603:10b6:408:e7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 14:15:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0001854C.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 14:15:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DEB8E406542;
	Fri, 18 Sep 2026 14:15:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C2C3882254B;
	Fri, 18 Sep 2026 14:15:21 +0000 (UTC)
Date: Fri, 18 Sep 2026 15:15:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v4 4/8] ASoC: SDCA: add class_ops with populate_function
Message-ID: <aq1HeFH16y0lmxYZ@opensource.cirrus.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918131914.681588-5-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854C:EE_|DS2PR19MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: d232c3c3-5c7d-4c27-b734-08df158f4741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|61400799027|82310400026|36860700016|4143699003|11063799006|56012099006|16102099003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BU4FdkWGWJC1zQPDt2QnP8uKhbOmjXd9rJGaLyTQAHNvCGw0FjQV3uVWghSSg7T5oXch7Ebykd1HZY62vfcfHLk+wKSCSOxTAhVjWBORfxMHo2PcEGz/+esfBRiyy8bTK8iWI1FTKYo4YQVciHIao+FJWm3tgllUXlpg+HqJdrU2l8p0zqdPbGu88u0C9nyBGcu4UxcXbmXoWqZ9qh12EA4tyhuRlhV33V6XOgEITlZD/PX38hvx/S7t7PIB4mH41TPNOUSAQyaIuNEwqV5g0mLtP8cNa7ktDay/3l9mM6R4Ix0F/eZ5biJXeaAkS14i4ybv8Zvylluvuwp6hd0jRnujCjutZLrmuppkWY0gbOM5eOY1ktri85VKHZYtgDwJ3StH4cA5CCUXZDrQR++QQQAghx059ebZ9q9e6xluQS1gpKEgLpWg5GRH2Au66TlqqfLrIVYOEf7830vPl772hnXyjYiUtZCH5ZoQiIPs69Vu+URd+MCSISHIXGL79WTEQk4LdlT+dbcEBl/PNNtvzk9qyKhUVn7fi4aR9Pc0ZHl9eEo9kbPAa4J5TITfp8/ZuH7WxwfBDro8lXWBMXOQKEJgvAdqZip69OBts/NdSJjcmIzpmMNPWOCHC2YfgjVDr1nuIXQxIYaSKe/vAnShZsx3rG/M5C4/G1iIOHp8LvTTZeUqR4p54qaPu4JTh3oaxNQ81Ow9Jr2HyWAgmywvoA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(61400799027)(82310400026)(36860700016)(4143699003)(11063799006)(56012099006)(16102099003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eNLKKJpcjcx07rg9x1cJiZ1uIb4AdAqN2yM722lY4Q/xZWfSx1UpPBqpljRacJ6W1u2xdY0w4uKvzAyFMtEUl54L6lxUuMeEaU/+ozEXW4M/3DBIUE0yHPLycmvBymf/r+JJ/mCBwhc5MWY25AbmwmX4Eb7tGW7bZXTixJjcE0uA06eTfRNjSZRSODf7ttXS01W6jTe0CrZzU5kIM8HZ2Ki3EBakl/I+7Zt1Ng1rX8qUTCuyiF6bDIwoBGSFyr4Z4q2+5BjkTVSojoaabGVAnWh0Q8vHxKw4CcDA5uwHeWw8vVSVfKCzsJYJEDbYNKtp4OcfvRztARMBp+briQVj4QFZPhlZdprYZVLtiodkedoD/unWWGHgBWwU3vIz+vDqfjPcfpYNtuN06M3M+MX82F4ZD9DjWocJqy+aJjDkYgTay3hoX9nAizH6rnrmjkCH
X-Exchange-RoutingPolicyChecked:
	q1CpWBcoW1qhpoWSXqMGVSJGb5jTDqOPLKoopklc4zwAMNsak5xc0K2Pk8aspPqJn2gFKJNJR8WJxTchmhsgR85AT7D1JwlGG7QTC0xU3Pe0mYSfzhlX+Ex/clZwt+ZR1urPp3eCZD2iVgGit9fKofJxy1hnQE4Nzcrc7pVy6P5auaKvbU1ezFc3c3wmvq1tHDEPfA1CP3KoRuF2AwLczVwE/rZKUEWpefsutaFFPsZL3uC6Pnj5s7zoT7rkYYRJ+S13iayrgaoKaNw9vi0AwuPn0zu87HEkJROglbpvovCmjviBrrSm+GEshzPxRF4XGmA5VGda9vtv+vVWqrpqWg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:15:22.7757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d232c3c3-5c7d-4c27-b734-08df158f4741
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0001854C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9174
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwMyBTYWx0ZWRfXwqjmA9VwCIHP
 Qi5hOaWBlNNRAZNAJVG5p2jx0AHr7UxIoQD3xK7Wq+K5lrh7hOu4BTrAdQ+Z8VOygZq37eSrP48
 iJRSh4MhVyVbVx6ezu8NdWeKSS73/7DFvejBjeeNdoh9DRhF4QIe3mM9gxGcrXbmgQk4maIy/Gq
 Mx/L8qqcIhgBvAbHtlNdTMB2685GmVp62clLwu7l1QVR4PpDOou0kytEolrVVySKgXbO0St+pH8
 OFoGCR2G7Upm0bMJ9q/WQP43AIg+GqggKhyjG3Z9uLjNi4EAnQp/IIrEXYuKNQvJajLXHMMcGQW
 NzSYfplSvMwxW9Zz9BjdyMigpFdoC5tYkGjDtpE3CVLTHnIBG9OMKd86AW3HECOhfpDDyXfqfJq
 qnsQAaMMPHQcndGeSXUgKWLQu+IJaiBy2sDVoRRURtUsR6XQuGVNH4dlSkJR7dyHgCSqB0Is/32
 rLH+U/JvHk7md0iRjlg==
X-Authority-Analysis: v=2.4 cv=YawodARf c=1 sm=1 tr=0 ts=6aad4784 cx=c_pps
 a=ZOOYKzJuauqLjokEqQd8dQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=cZt0A2t4umnqaDRzGh4A:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwMyBTYWx0ZWRfX5SvN3FN+c8ki
 d2QlD+mgDBDKkdwHVwu9JAkVNxDEflsAaFhutM/JBljmh0rEiBV5rVf4GdzPZ9xH/7Wl43iHTV9
 FfOyyqBxpfqq0SN8jyxl+x0HDK2khmM=
X-Proofpoint-GUID: gxW69-k3J5G3LAf00DCBcbL9NooH2wYQ
X-Proofpoint-ORIG-GUID: gxW69-k3J5G3LAf00DCBcbL9NooH2wYQ
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 18, 2026 at 02:19:09PM +0100, Srinivas Kandagatla wrote:
> Add struct sdca_class_ops with a populate_function callback that lets
> codec drivers supply the SDCA topology (entities, clusters,
> init_table, ...) from static tables in place of sdca_parse_function()
> on DT/non-DisCo platforms. The callback is a pure data source and
> performs no bus I/O.
> 
> Codec drivers embed sdca_class_drv in their own priv and register
> their populate_function through class_ops passed to
> sdca_class_probe().
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
> +/**
> + * struct sdca_class_ops - optional codec-provided class callbacks
> + * @populate_function: fill @function (entities, clusters, init_table, ...)
> + *           from static tables in place of sdca_parse_function() on
> + *           DT/non-DisCo platforms.  Pure data source; performs no
> + *           bus I/O.  Return 0 on success or a negative errno.
> + */
> +struct sdca_class_ops {
> +	int (*populate_function)(struct sdw_slave *slave,
> +				 struct sdca_function_data *function);
> +};

> -	ret = sdca_parse_function(dev, drv->function);
> +	if (core->ops && core->ops->populate_function) {
> +		ret = core->ops->populate_function(core->sdw, drv->function);

We should be passing the function device not the soundwire device
here, this is a function callback.

Thanks,
Charles
