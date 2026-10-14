Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EFB489892;
	Wed, 14 Oct 2026 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970894; cv=fail; b=eAC9wgRFtkdKHW+gFt0JsArSzhQsMPU/ZBz19giTKTK4QYNc7s5BlscPeERAwmx8oBoQrP+FvQgQMnv6tJXxYD4D7PGOtfotatmR0z0/vpR4Qkgaa2E6AnjFHKhjHuSsIdSInToXG4eJfRd5zyf9fO1rMmn/Hb/c+2JCntnH3sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970894; c=relaxed/simple;
	bh=jdhQ0C2cNlMY0PcdZhXyo1H0pRPmi9XYtWEzGk17mpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEk1wP52NVV0WbKhRg1Eu6zlAPRiIl7WN1l3P9yT/xQ8d3u9OeiLSSGmpcRi0TAzX358fUeMHj20rlbU0inbVXVGSd1B5HK6pfFZC0Jv/P/FQblgGkMnzvSmdKmYOXIFmV88QWHYYBCg1pFMxRK/PLWcubXfniFfvyNfGn68y88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=opb41779; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YLR0qTOt; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="opb41779";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YLR0qTOt"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHvdPb745857;
	Wed, 14 Oct 2026 04:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=pja8jV9OqXWmjoIRK8
	x3tkM/g4553yJlznJ2EYJ6Wh0=; b=opb41779Q2FOYuUh3dey1enNcA5aOVBm9B
	jHJA8lACGPFRXivVn5gZAzzm+wQ9pxBeFNdDD2D0TPiDueC5X0x9pWxtveFxdsPC
	iUiC13YX0Cpf9FMCalEgW1TUwsnUAWaygI4Px7zuvQr3yCFaN7SFdoyQeu4DMWCc
	WwedYpJEV4+rHKLJKQaby1FXFYxcvaXgJ1v7aJ9mcIi3pfoy//L70aTg7i9/JtRs
	eM3Vy65/IC8+6TFMDuFnkCDUqI8PdktMFjBFfQu9R16eLsmy4zJ3YZo9+6Jcs+Jd
	drbeEq/WBJ6fqa5TFIZhXBCONUjR/P8QIKY+5OGyhAr9OOE2uvfQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023094.outbound.protection.outlook.com [40.93.201.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h7hsg5fts-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:41:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbrqbsRB/VnHHREUcbH12xPLT4LlcA8eMAqyFqSEwJ2fgMAh/qhg+dmqr+385BNxvx2l3jWTsMh36iS7ANNEeB4mG66Rsr9nhyDp0E+HlKKzE4sTljhvrYhgOTADqcmWiyDqF3zTcb0rL4Qi2PuT7vuopXLUQRr4ktzXhQsO+wX+Ai8vQ9q11QJCcrxvOZv/sPF7JZjS3CLxZdgOGrQM6uw1DkuArUv52hloXREL8AJcB76ss/AgMgRxvuJBAtfnNcKK7x6qtjgHVsut1RUzONIl9T05oa3TZNBqm9zu7H0GXcItGpc2epw6rktgtVN0/nkcfW8tYSiZgIsJHQuZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pja8jV9OqXWmjoIRK8x3tkM/g4553yJlznJ2EYJ6Wh0=;
 b=pHEEjUx5U7YRxhpCYy2Eil7IxzEiSVkIwA03222XNnjNDE3zdttNmC38UHUJ2dRtPhfPEb6xuX6DsFOSoxc54o2o2R2b94d1J6V96Wivt1WvRaRznFWnmvECda0Gqz3rr59igtzRy+s0HSIcPf/kb4XUHlT+gLl+uQK3ucGTlFKSF+7hzFR2yf1Jhx0lCAfciRqVBDKi4RXOUTbn5AwBfUiTa417exA8iTGZ3cGSNSkLr8IaBeVNbUWbGiQoJXeHmVbTFoDsQHGDIQLAzdzxkzwDOn50W+Eol6+LwM/WLoE+Zo4BVAmMUeBByG6aN8Rq1DAZjNPtRlbXAn6nyhEgaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pja8jV9OqXWmjoIRK8x3tkM/g4553yJlznJ2EYJ6Wh0=;
 b=YLR0qTOtw0pbGzWJkO3LEZLViK91umkvVFKOy9yLlL/8qYVD4xZfLMoRzvhuNBSyzbwAApuS5y1kx8Fu77lbFWQtgAzXcaCIZKWiH1ddOXFsgtB4gIdRmez4dzINvwpbMNpKeMSXhsTJxfsg/zlzQG4jmMuIL04Cmpr5mF6JjQM=
Received: from BY3PR05CA0041.namprd05.prod.outlook.com (2603:10b6:a03:39b::16)
 by DM6PR19MB3835.namprd19.prod.outlook.com (2603:10b6:5:24a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 09:41:25 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::1b) by BY3PR05CA0041.outlook.office365.com
 (2603:10b6:a03:39b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 09:41:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:41:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E2FC1406540;
	Wed, 14 Oct 2026 09:41:22 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C13C7822551;
	Wed, 14 Oct 2026 09:41:22 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:41:21 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/13] ASoC: codecs: wm8985: Fix definition of ADC 128x
 Oversampling control
Message-ID: <as9OQXwpY1NKltEx@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <00ae032401aaad740b61d664c861b72d2e5ed520.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00ae032401aaad740b61d664c861b72d2e5ed520.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|DM6PR19MB3835:EE_
X-MS-Office365-Filtering-Correlation-Id: 003f2ee7-ab52-4ca5-0fc6-08df29d74fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|61400799027|376014|16102099003|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ogc7j5Ilf3wMCDNpoVERFuIaYnlEbhP8Hr5iqjxzwniCoRsaaDhPkeNhWjTjvrL85wJvuWwzy/KypLcosngY9zmwwq1YFigkJCWQFKD4ZIIUi0ykuP5BxkjUmgNmxrUFLuksCuh8r6P64OdVFJLjqOhqMBCQAggTKciMNKXCwW4c4hwvkg48AQJpHiwFUs/Yhg9IqvAgr2zevoc6Lt2Ff9YJwPA1qB71w7cReeLcDbro5CMxcdOAodN6Y/OUalU2dzPGNMbSGtP0ttOkkYGEGT51OVRTFrDytnFdVbyZqQ2z6GRL8waIqzE9sbcnt8I4EpHFBZPXhwN7anMXgvV7uwN1KZjO3AAq9+jyIq+aiZkJNPz/j+NjJvXQ7H84b67YtKZkix1rC1dPoFolYFG9XLjW6REmn/+hITc7CiyFBcsbvwAQje7506cIbGnCkMDareRbZh87zbNeexQyWMEiRxxVslDPzQJy15yalqoR7dBM0jjwMlPIOexAhgiGMzLhZPLBM1jKij7dm241LnGMYu9fmWCX+fI8YWnNY7w9c3lUmw6NRe4fchoX/XpO1gqJpEvE2bJLeMiq19fAdhqqxm6wUS47pQLbbqfOQpwGD5n5gWr50BGm9qXJ275N7zd/6VbWK3E0TrHNt2V6PVFC8ih4HexaFe7lukr/xjBqmjAlkVkOn1uEMlDOCuIBEidFK2HEO3S4xVoELocZKWEEzw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(61400799027)(376014)(16102099003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XYbsrYRC+nxp244k1m/s783jp3pPJqYQBjm8hiWRl6+KzBCFok5L4kgW6f/4mBVgeZTFeUTqP4o3tqU6qEWjTXN+nr1JEgrmFWw+e926lcNJWloWaZYRyP/hH4TaKkyYbeEg41LPsEuZx8Z9sHvSrTBcxhbYhPWHBhHIKdGF6qYwtoigk3rmg600KcnktLXzCKGorq0Hn/EET2jJNtc5f5DwawCeVSQOCx0j98XfErkRoLyqkBYwYkS4LGdwITTaYcGzQEt7Z2Hc98mmaZy6KcGhtQZKTGpmATVGN3id45d1KmkLxsJ67iPqo93egKCnRuthXhx08dN5T6Rh3X72sumo95TmRztS+Mgqhv08lVP6d6eB2e+k8rpavohM7HsiCRWBGiOqjxna+HyCRhVjNsqe/GS8nH77eYprEZnh+/9a5f9lXMt3NJHOxVY40t6Q
X-Exchange-RoutingPolicyChecked:
	JfjyvxS2C3HhMggWBHGxnTYA/bufg/0BlA7pJNuGgTPP1a3rAxMGOQg46cyz6byi+id84etWYMx4SY0nETMimB6Fai3UFee1OfpuyfCq4bHpnCR3vuUqyXIIOjb+ic4VlOvMO6traIfOI6T88B6HinYx58uXBXEz4pssVixiuroQaJjF5siNaUDO3x8qHsyul57rOexQsMw4EBt4rzcWaXBJYv85RE7RbxvJgX8s3VsNYPcQDX1ZgaizuWGbbBQYXgcMBvlkaIm8jqgP5bAUl2Ffx+IZpoPlr8xAyTcEHkG0LP2YxgrQGf/P11JbKyh881OX8/e+I6CfgqFgciauaQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:41:24.2321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 003f2ee7-ab52-4ca5-0fc6-08df29d74fec
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3835
X-Proofpoint-ORIG-GUID: iJbFz_M662-RKK4yavhTzhAgafcooInl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX4ocYPl2BR++c
 itntB4BXOJGPPMmDRRNpbpxexTn4ZmjOD/DoiQcFpXVISKdWoqDnLLkUH9CWrc0CszZI1Kooghr
 WFm5ZzVc0f0c2ihISDF7ArhKCANtp7s=
X-Proofpoint-GUID: iJbFz_M662-RKK4yavhTzhAgafcooInl
X-Authority-Analysis: v=2.4 cv=QufLTlyd c=1 sm=1 tr=0 ts=6acf4e4a cx=c_pps
 a=MX41ehtHJXReCjFqbJPviQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=-Q5W2co_tndbuQ5UaFUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX380sI9cDskZZ
 Ur8pQPnnmx4XU0jYEcWQcLu/otb33PI1730CDUV/Q2HKyO9AkgEfD1uJyGgtaVqSrHqFLK8g5Bk
 n8Cb0XDWzinRQvULDDR2aVqZjRSLY+B6WlwaWvYfDDRDpWWQrjP6oC9aMXuLDqrMywJ42s7qNed
 HDCzR6UH/MSluIOafm3NeJyZISR4hV2XlN5zHVRIqtgHxQ8yJ6vzuGk1zEmKrlygFwS09mcv78L
 lWg5ze8xCYgAIPp6KLmiUzevq64CCHx2LE9oTORJ3uJulVcSwQu1RIvQSqkGMa98BE/+/UMZZqb
 P/Eu9D5FHltFzRHjuF+kozV1iPZp3RX0vGzBK9m5nzQwG/4lm5e9jKzlOTJfiyb/dCPoiJRFIjE
 FArfcp3ijYUruH6+lD/1dh9mmrX9ire81mf5zX9P5llF7hiKeUOpqLEEA3XYBa/Qd7396N0YTXK
 3vP1+c7thz50zMmV5xw==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:33PM +0900, HyeongJun An wrote:
> ADC 128x oversampling (ADCOSR128) is at bit 3 of ADC Control, not at
> bit 8, which is the high pass filter enable (HPFEN).
> 
> Fixes: 6d6f8b832705 ("ASoC: WM8985: Initial driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
