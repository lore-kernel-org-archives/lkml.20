Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB9353A94;
	Mon, 14 Sep 2026 12:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390390; cv=fail; b=bVokCRBeqwoiM5VhKDJIgXYO+ABnOkPDEKmYSSxLkB/isX4PfRRRf33g2fRby3eho7Kxarp7lAQWsaxV/O/+vJth/2dpBjMKstpr42792hPeiwQfzz19Mr02aHLUcWeQQeQs6jegKE2xPLI/UcvYmpEvqlNXVMFZLOJkU9yaq14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390390; c=relaxed/simple;
	bh=IbLqScvEMyaAivF4az2X15J4Yf0juUMqw17fAoABnQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNiluKWEzwCDC8wJgw9NKqBR8ooCDmYEEDo3t2oLUGMccYfeeyEqxbchzcQURTZboWvr7oJVEUHvLCD3ThFgs3qxs0VvhORMimqPLFeHectzOOs1/AzLvQ4xh56a6k3nHvPrJ5Enz+MpxXLwQ3GEZSPDuimozIZ6HU2XkBUgw9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eL6KRR00; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ovhwPT65; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eL6KRR00";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ovhwPT65"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5gop9937705;
	Mon, 14 Sep 2026 07:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=mnGcbXjZDeUkrzeWx0
	et5WS++g8St2M7umZrftafjtc=; b=eL6KRR00UJosQU/hN2Wc1T4h4OvA15Wh0o
	PQAtuAI/aVetZ1imJZWL3Rj50YBJe2VrcRVB9cVeTIIGxRR3ocnJu9Uw0LnMGwgx
	4uR0XuUCwCbN0K/dd4/zKTE1S5Ce+vsrq6C4lK8QQ/1Vp/96+44HkSbnmy5oSLj3
	T6s/HYD4Bhqge/3CokryA5bFI6c7sYkz1dxiaKvfpEMViV6YE+xj0hAYxUzSLYeG
	vXRs1EOpFjSo8uk3QnGo74TVCtU4XLvQv0dk4lqrWe+0t8vuV7UnIeNbowjL8Xq3
	g7f/nVtr6d5PYmcyqqSh6/M1wh/aRQavUhDeV5xPInqB82kpCshw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020078.outbound.protection.outlook.com [52.101.85.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44w9twu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:52:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+OWeyO1JvUcB6/CoC9m8bstSWP5pkR09TjO6/peJ5E0X9EDfxZXQGaS4YGkJHi1Y6Ky9kEAP2K9iA29mj6FPsgKeKHiOCUNXgEUatqfE8KE8ninaMUIoTWb90wwsfRWTvZAj0/vG5mQW03EYL/ERkp7VHyj298+SFyRIDzozCY/CXTERjDzNaZ6G/outvXCoYKCk5ILqLmY7T2FXzfDa9zjVz3dEqdrs4cAX8BGT+ue49mbdMcqBp/38be0j+7bmYb+6r6bakAdPwZFIfBlGTnS+fEOSISs2mKaWC0CbDlHlCQL/u4PHuT3uIbscGYkCz58mmlVrpxPfJH2ew7PmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnGcbXjZDeUkrzeWx0et5WS++g8St2M7umZrftafjtc=;
 b=AI0viErLmsvuYLFggaZXaBO4dD49bOJzZYzC2XUIL2bxzqDO+ncHXqA6NnO+DkiAbav9MdgaQ81alc/v82CepUbKGzaWDptXckXMyQDTqtEVFDXKGe3NewfURjIXv4coY1WYPkeH+uURTHs0nb/q1BBkE8vA51sQICxVGCCivHr5Cj631lr1wgKyp2pihw4+rPEqpSoW21k0GitDlvR795Wmixh4+df9tN+HJJo8OCeIhYhhucaC1oEBgoQpMMV6nXRBXpG7w50CvkoX/rIzxhRA4Uqd/D5UAoXOwO73W4XmsggpUjPZ81iOePy+iKoipYJn6gZbFZOwWOU2/XybLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnGcbXjZDeUkrzeWx0et5WS++g8St2M7umZrftafjtc=;
 b=ovhwPT65HXupxWNpSgSOQjizHxTaI+izG7/0P7w/VCwRKP6f9o+mV+2YhamfSQI21KcP2EFlB0bioKMhrLhxpHZN9soqIxs+GyXd29f9ryU/cjQ0dBdVNzAeZjzNN1Yw+nY0vsxWVAuqb0xjt6TUDba8/cdcjAc9mjvC2leRvUo=
Received: from BN9PR03CA0100.namprd03.prod.outlook.com (2603:10b6:408:fd::15)
 by CH2PR19MB3765.namprd19.prod.outlook.com (2603:10b6:610:94::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 12:52:51 +0000
Received: from BN2PEPF0000A88E.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::72) by BN9PR03CA0100.outlook.office365.com
 (2603:10b6:408:fd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 12:52:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A88E.mail.protection.outlook.com (10.167.248.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 12:52:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1035E40655E;
	Mon, 14 Sep 2026 12:52:49 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E7AE8820244;
	Mon, 14 Sep 2026 12:52:48 +0000 (UTC)
Date: Mon, 14 Sep 2026 13:52:47 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] ASoC: cs42l56: Fix beep input device leak on card
 re-bind
Message-ID: <aqfuH/NsSiP4OVfn@opensource.cirrus.com>
References: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
 <20260913101531.2787654-7-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913101531.2787654-7-chancel.liu@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88E:EE_|CH2PR19MB3765:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb64fdb-bbaa-40c5-8296-08df125f15d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|82310400026|376014|36860700016|30052699003|61400799027|16102099003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	QsKp/F93U3xrFB/2/xs16hhq9L9ZLJojRatFQBcqGPEYCDQzrHMTk5CroqYe2TjnH63RZF8lQ/lqFMheVoG7EMbSdjpxVmfxJXP7YvoutPdFPkEVWlWp4Hw8Af39gD3u9SCcYKE2qKpvnQd/hyi/IQ2zwqD9H1yaiz3l4ODKgZEwambRz7LYaXP97IkpwgvhVAi9rKh8CGnKBv8rf2fUEG0Tuj3v/+DEapC2DVMbwWoHMPDvVx4yv373mOuzjHG99P3xCBb4WvlCSKL7gIgLsyRVI+LaLNdaQKfD+LKGCrdVFG9x0ql8+u5vJ1lP2sJ5yOsu4kOyA6ZeX1gJErzQEF20JhKpFAMFMtAejhzHBHslZkIz92QUD2bM0mKwXlsflLhayUhrBwWxzBQoiTJENyCWuPn79lccNlpD9Zgre39AoD46KLmnodoe9Q2QxYt/SGmAEUEQ0fEqloirBRg8skBoKoqYnVmc/nFU/Hd03aw6/KG9aVlmEleKEQUeq5tw3Y5N8LLMkF8K4+oiysn49HC8IUdxSobFRZbxIMO2jMvr83Bl5OIWHs5v6JeoM6WlX0lB0HHKef67Lu+qkXh00aqF3xVYQLqVi6lO186akKyfmzgjSGAn81U6pc9T5HYkcNXD2Pzrxuk3Z4dPlYIDKs7g7KryUKQqBwlfq0l0WdDIaMrViVc3MX2xk3dWoihvtfKjfilqRn0zdC2VJXGoOQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(82310400026)(376014)(36860700016)(30052699003)(61400799027)(16102099003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rNvvvbeODyw4SYufswCyl1XNwxfwfXOC3AO2Ge/lNVLLvAgXaKdfpQfOYzpRuYb+juM7GrVOQ3I9bAhdEfx/mLYJzGzbWeegVHwKvk+Xl4yWEvk190aIECeKS5gmpGh8Xbjwk8Bd+dIs62Mn2psrX9BOwQqELq5yEvVlxifLYwzco7Hgle3kpKqd3dgUZ58tdLZEgCzCepqf7Jeq/pB/9aSYAwop9Im/FF7LfP/jgawq07tkkteuLzGj6l7p2LW4y9ra3Yr1x4c5fUoIWiJPm6zNCirP3miENCy4IuIhq2cRkW1A0snE4sg7TqKTffY4ifSVUnrEX4PLx1xmwJ170YOvPND2j+RnReE8VRvZ2+570IV1z6YT9f7PSaHFYS+mKhThT0AJQobsBNC8fVjAGprNhXeb3XW5ChcNXUfXqq2c2Nxr3w4wUd6CgqIrrO8e
X-Exchange-RoutingPolicyChecked:
	wZjkjoBuUwBewd69FvMCGeUPehZFsJyK6j2hbG32fye5qCTpJtfBAPMUZKrZP8rVC4CN52hY7UVA/vXtQV+pJNEMNYGGeNNuVacg2U3Gjp+GNtGMV7n4uQUm1wbR45Zk9nJuStdchSSObhWQaE1yUrB1CR5k8Rdb2lEREzkMi0DtZ2feuIiA7sWS+Vx4lb7NwxPlV0Vi2DuXbEpS8mSLmbhM9A33LyMv1tBLcbCTbTk3/522EFeqJy3CaJkbMn4CYFVAIwbRaaUx0rCuQMzvwJy3WqJlQpnKbpt3HAJV43XAdT3GUUKBO+OlPGS4JtfXn9Ab84kjhJksNsA0YyPLlA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:52:50.5077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb64fdb-bbaa-40c5-8296-08df125f15d2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A88E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3765
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa7ee27 cx=c_pps
 a=CrvRUVoOWFViJQNMqJwZMw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=8AirrxEcAAAA:8 a=w1d2syhTAAAA:8 a=fqY00Y6eEr81RKnWAucA:9 a=CjuIK1q_8ugA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX7CEk6naTy5rc
 rYiUPZ52Jz0C1jPsG91yqoWLwBsOG7zqSogJJleWpCNoL6h8vIholcMpcXRlaiFGbxno5nj956W
 gAXDOWxe0/tE/YDOuNnjf8buPOjCip+dUVb03hk0efJLVw5ZVmeBB/fNlDNKe03PoZhFSQFkFOW
 o3+eTPed2976BMZn6L5GkoPMjhqQVa3RkdQs9eZP5EqBeM9VNiMMgmbBQYK4Lp40goRz5dZ23VA
 NV/G2/KNVpXtZ452XJDxym1tEMYuSsP2IxAuxnQ0Wc2TUHCbP2QEYTqHX7N4mLUecyQe5X7DOwd
 IGgDoIaGiiYHi/a7uBmksWHvdcpV7F33Sjy5mj715LridwwteRbX391z8/X0npIRdTK3cFRAmYy
 LSu6OBtgkJL3HginG3OsQQzcfpQdYttLm9JC30VQHuxE4tHTGxk1EYkQDmvVLfi/SYNf+Bvl037
 KmCi8CAVPAYmm5u6FhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX7B2GTLjYSJMk
 Sw3cEqN0jgfjte4LavBNmsfw5Qx7OPNeZi/4wIePAlMMQsOepBSgtRPwq3yvlZbv5JRgbZtUsLl
 IVQ/vZpX4Rl6l50oi75AJ5URGSeXndA=
X-Proofpoint-ORIG-GUID: gIn_Fua-7_XzYVOZy9cSmhKQptCwgRFD
X-Proofpoint-GUID: gIn_Fua-7_XzYVOZy9cSmhKQptCwgRFD
X-Proofpoint-Spam-Reason: safe

On Sun, Sep 13, 2026 at 07:15:31PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> cs42l56 allocates its beep input device with devm_input_allocate_device()
> from the ASoC component probe, but the associated devres cleanup is tied
> to the underlying I2C device, while cs42l56_free_beep() on the component
> remove path only clears the cs42l56->beep pointer.
> 
> The input device is only leaked when the sound card is unregistered and
> re-registered while the I2C device stays bound. On that path the
> component probe runs again and allocates and registers a new input
> device every time, leaking the previous one and its sysfs/input node.
> 
> Allocate the beep device with input_allocate_device() and pair it with
> the component lifecycle: input_free_device() on registration failure and
> input_unregister_device() in cs42l56_free_beep().
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
