Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7DA44A3FF;
	Fri, 28 Aug 2026 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918195; cv=fail; b=PVppst7wWpv+6KmdNlBOoykKXhUXYDJZTpi2K84YD2xUsFv5Fc0/YEU6iRemRk7NEd0EJtGM35PLvc1QtZ65Ul8yaRadt4UPCjrrSHQNt8ynApoLWg5njLXPeHI7j2R4Vv3FFZ+ev86+J0nnQ5giNHWiPiJUfLcndLvWakc1/o8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918195; c=relaxed/simple;
	bh=dukXA8MlEOlFY1qXJZzwNQbBr8o+0Tsq6PKd82cZ8ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AzEHyldzemYFoYM4+P6Y6lOSfQrL9eMd342yfkN6qQpnAmw7xkQZ1BLGhZqVfbEwIy7UWocBlZBDc240c0fwj+jKbZd97sknVtaZuFGaD6cv8NzToB5yS2Ybu80OgdpCFY12XPDhJjCENnLhIpUDKG3fACFzeJlGeGJMUPJ8Sks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ezLoXFMA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bTorFd4u; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ezLoXFMA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bTorFd4u"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S84j4l1191904;
	Fri, 28 Aug 2026 06:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aX4GdKrzextea+m7svOeGjDmHGidsMT9WbTb7UJ6RmM=; b=
	ezLoXFMAqE80U8GS1+BSlyX+FZ1QL7THwF+6TqHUyIFVTO46gVpo7Bdva5nmAej9
	Qhyc451QlSAQGoGUXtxSrhdZv/ItUO8bsBi+Lam5rjvlB4EFTYL/mBNmOMyESP6V
	aMB2UIuW1aFmZfZ0cmH90nEChT1iURs9ZXYEur+lxwqx6u8KpcQ84OT9f2TZXzh3
	kZFaSLIN7CBDXq3FMRexjMtLBT3sdQEirPvHAKNULSaWwj0M2d9Y7u0hr0aTtU+Z
	SV82chd/+h2Bjwb1Ra4Opkn0t3gw218UMJPO/Tn8jSbbZbqInl8Z0WpOqaZ1kFaN
	S+wDOYjyRenq+weWUnYzxw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020121.outbound.protection.outlook.com [52.101.46.121])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gb53t091e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 06:56:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJc4m5I1UyiY1nK6DM8E7uXnEmzIq52pBQOTjFBfRkDlQM07iIkwzzwGeAWroDKFnapqnfNXUe3Nt4npeznxaPqJR/SnwrIkRSdoY85w7TjAJ1wKGow8ERZuI3tVxkzf3vzmIdffaIzYL+NXR5Ej3T9OgWTYYo1mNGcGW8nw+0EZPZLnw8c2E5meBN5D/cDniWkKdXXG4s7A2tH6fxbeAyUiOhfWJL8VMkPgfhS/oaC4TCsAw8jzluaRGNCaMAby1oUVVEcnd9Cg5+CZrZ8rU9rbNJIb2itg8/uFLv108l357Zc+kKjZvz7gPyUYbP+WS7hSQ4zWUJwb1SHsyeWG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aX4GdKrzextea+m7svOeGjDmHGidsMT9WbTb7UJ6RmM=;
 b=C44Uzq934gUiILOHKvZs9srg0QY6BUgo7OQGvEtOOwI0qbMD1FGopv0xYqCk+KLttm417KJoDe7uMvOeIY4/78bVcCdS1Bep3y5gx+w4qClTE0ZuqWlI6mCLqENtux4oHoVO0jCROBzptDf1zt96IwHNaPbX0jDLVZD7SAIqUaQ+7Y6vhsedDYWBrazmxFG2/Keb+tyG/O8MJT6xx+q5K4J7ak6MeFycQKdKYy5QNY9KjG8RF+g0yozOAq9gknU8xCxj3SjDqliEoPNaWBKZg3bJcuaSxyR41TaeNaJr053aewoE9rqR59VVpQRwFJvAzVskq7Ben71AOXfxly6cqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aX4GdKrzextea+m7svOeGjDmHGidsMT9WbTb7UJ6RmM=;
 b=bTorFd4ui5wzP5t01aupi0opwiauRzYp4X016z3TOFB43h5yKoHbgNIhvTVrTxRlVcaakapeHPMWmfx6BZXo7nyTi1bruv3PO91c6BABFuiGAR5R5J20g5g50+ZrbgEfvCRgHWheDcnb7qDM20NelTd8Q0Y3KYyxt4MOjMIibEk=
Received: from BN0PR07CA0002.namprd07.prod.outlook.com (2603:10b6:408:141::17)
 by SJ2PR19MB7488.namprd19.prod.outlook.com (2603:10b6:a03:4cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 11:56:01 +0000
Received: from BN3PEPF00022BBD.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::1) by BN0PR07CA0002.outlook.office365.com
 (2603:10b6:408:141::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 11:55:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BBD.mail.protection.outlook.com (10.167.248.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 11:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8C798406541;
	Fri, 28 Aug 2026 11:55:58 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 625BD820247;
	Fri, 28 Aug 2026 11:55:58 +0000 (UTC)
Message-ID: <38c0d29b-fd36-4fbc-b94d-f99799b43c8b@opensource.cirrus.com>
Date: Fri, 28 Aug 2026 12:55:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] ASoC: cs35l56: Propagate register restore errors
 from runtime resume
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        David Rhodes <david.rhodes@cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
 <20260828113416.47061-4-pengpeng@iscas.ac.cn>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260828113416.47061-4-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBD:EE_|SJ2PR19MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8611b1-9afb-47d9-7e87-08df04fb5392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|61400799027|376014|82310400026|10067099003|16102099003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ehEAK7j37Jy1Yo54b9qgPqh43JeFhM0iIsOd8AW2yKoIVa7BxJz+2v7rCXInqpbwm9bgM34eivAiZZ1nmaNAkx+9XLfA3HwDgj7WAvSsOTtq3BefsQkqiZW/yBBkx7V9mxlPB/J7OusJQjVnIVmUSrxYnbiZECWJa/bIXe/k1fZ9JbepPOoiP6C4QLpcyYz2CuvhQYyEoRZz0nmkz+byhPWUfRA77J8WiuUI7C6RN/1Yg8tT5svUcaoJ1EHdTja7kelDsgcSTausDh1w2JtrqO05OjqCwYqeCxtsVoSQo2eIMvMnd4flf6u8K0zx3Qqrzytu7eb8C3w8SjHZG9xUgFen+6f4sxDc6bjd9gvXX1+PKfQ8GH8LX9O8/g7OVVVzzBRDKjO3T0cLvcs0QCulwRqcCriHn3Il/jWZsxQtOa9aduVLJMvEcjCUCsqqKcs5bd0QSvRL6Y+Vc+tQ+MbVDQMCjIZg101EmEOw82gYBNypaGuUe952F8xaYNOjOxGBl2cNA7DcT0DLa29vOvbkrOW0yUTEUsii5Uylq/Zm1/gvyBX8CVKF3+HI24wr90vX157tW91PIPi5XZIsdeVTbxqhSb9ECEqznEJo0SuHHmXke3QvO9TnBKIz5K1ZCrfMazjFN8tTW7D+Z+thTUK+L4Lgt3FEHU3R+L3iSHG3Y83wLCEvBmfg2uJsNPXgwIHzcc34qCVe8rzoIYlmVdXG0Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(61400799027)(376014)(82310400026)(10067099003)(16102099003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CG2gVgdSpcaHWIyHhK5YcVpsdvRQOy4/cjBRo4STS0aVUYC+uckyfMibY/sTYsMv/xYcdDlgi+SxV0rMDaR10J4BgvhpUxSVZrKzCH5iiCKhvtYMKkfMglWHBTsAGLN/9oTmbzYg9jtbfQfOYzfBk5ovyZn0MAnAYDNJ03GCq27cjOS8455FCCdN7qcxQDOOcYEEtztIkSHjmyGRpPSFsGBGf7nDIqTOnTO+BmAzIMjltt3n7yciNdrIa4cnncGTmOTbSeVDPLf13RBVfyl/vkGrcokSs4tZgm2Opa5VaYy6/PYECMv3KBGrZhexW3DjAOvypLhcbREnHAyCicAD+GLklUrTm5Py9fU/Ffk04nv7ryuY9Aw9FYmL/b0+awa5aEhcUkOpeibfp6tu28pQS3Be9ZKxBeAGC4RSTjAKOBYmIcBrWJyZiT0fr1rFf/gm
X-Exchange-RoutingPolicyChecked:
	HSsvc9u2uGJNhzO8c1ODwaZP305npPm1plf1yGxXf0E5eODQm5iWkra3Y3oO7hK1E3Fwn+vEMMa5GfPfDNCByH/EciUVadJ+5+cTgTAPse5S30JmmKcS1FiJ2VbWX4i9W2pV1EJB1VzZIz4tnNBEmXoLBR7BbgPqy1LAClqvvwI9dZtkbdZvoESpSS/fDTzA1T3NXFmT2sPxqDNBgiaL8KmsOYJRZPcEXoBjdhqmwotwXAEt9s3A17tQdnwe6QMuraHeRqGOZ4KwNjXCUfy43yZbGiDbdv9KFVTKeD18/7AzOBBxvwWyUTnhFW+n4q/KzW0DVm5M3p5DwArna6e7qA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 11:55:59.3138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8611b1-9afb-47d9-7e87-08df04fb5392
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7488
X-Authority-Analysis: v=2.4 cv=La4MLDfi c=1 sm=1 tr=0 ts=6a917756 cx=c_pps
 a=pjPKNKgC2VgaEdt9hcwoBQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=3yTKm9DGGtaRHF3qM0AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwMiBTYWx0ZWRfX4HKy2PBieNnD
 8RrA7tWSdRyjATJ9X+TEZfmdqdXj2+/68XL8Jy4wjQPqc2SymY14HbdIdETP76qgQf6xfAw7eLU
 BSjj2aPNn2cu8AtVAiZX9jIgWd0O27wKsPKHxtlZbJcS6uI3yJ5Vhir6+RtHkmCV7EGd8O+Ymtc
 XVaJDPB96pyptL9mJ4Bhd1DNSpZTReCqbrrKgkKx7i9h7JI2Ph/bvYQNaOcBfEP/wnzMY1taK4n
 8vJw1OaOAvnoGOBRD3YHlQwr1C6jamW1K0AgovqeNlNvKSzEzV8tvoc4rmUFgvjGjiyvlC6/lPM
 DzYnzVXQDdZDMbcDfcqbK6G/yaMuYLMb0OxjW16/kaStAIMsPL+mxDCCJJ0kmUkwCr9f6AeuewE
 59xwGu5l2jh6G4iPT2SV83Rw4lRChImtAwsBl1+XL1AGXNnP6yvk9YfvgiSucNgx/WGHk31Z9vM
 e6v6667q6THEfYZZEJA==
X-Proofpoint-GUID: TxdH__VzYX-XFMQtf16i512-L_BMYSWF
X-Proofpoint-ORIG-GUID: TxdH__VzYX-XFMQtf16i512-L_BMYSWF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwMiBTYWx0ZWRfX83vBkw36xhNM
 nqXgRRCudpJsWV2gO0DHTWaclMLHb6PT16+5mueGi4f7DzzqEud02Sec1Ir+mCtQrEwCWidE1Wq
 LHHErJpudp6uzBhR3SlnR0Aw+7oiEH0=
X-Proofpoint-Spam-Reason: safe

On 28/08/2026 12:33 pm, Pengpeng Hou wrote:
> cs35l56_runtime_resume_common() checks firmware wake and mailbox errors
> but ignores the BOOT_DONE read and register-cache replay.  A failed read
> also leaves val undefined before the BOOT_DONE test.
> 
> Send both failures through the existing hibernate error path so
> cache-only state is restored and the device is returned to hibernate
> when supported.
> 
> The issue was identified via static analysis and manually reviewed.
> 
> Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
> 
> Assisted-by: LLM
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   sound/soc/codecs/cs35l56-shared.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index 7b3e37d462d6..3778c5c2d910 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -827,13 +827,18 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
>   		goto err;
>

for context (as the context is missing in this patch), the code
immediately above this already communicated with the device, with
error checks, to determine that (a) the driver can read/write registers
and (b) the device reads back a valid booted state. So we already know
communication is good.

>   	/* BOOT_DONE will be 1 if the amp reset */
> -	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_EINT_4, &val);
> +	ret = regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_EINT_4, &val);
> +	if (ret)
> +		goto err;
> +
>   	if (val & CS35L56_OTP_BOOT_DONE_MASK) {
>   		dev_dbg(cs35l56_base->dev, "Registers reset in suspend\n");
>   		regcache_mark_dirty(cs35l56_base->regmap);
>   	}
>   
> -	regcache_sync(cs35l56_base->regmap);
> +	ret = regcache_sync(cs35l56_base->regmap);
> +	if (ret)
> +		goto err;
>   
>   	dev_dbg(cs35l56_base->dev, "Resumed");
>   

