Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0161A4B4044;
	Wed, 16 Sep 2026 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574181; cv=fail; b=HLOI6xlPnJJRed4ZXJ/9jRos3Mg/W2vmyex/38qRlOxmhFRoSQ2j8EBJo+f7ONHBQhUdp1hQ15l43rISkm82/ACcSY/VhDIYmTYJjEfluZM1th6fVSdiRAaqO2qWWAXjkOQCfipPUfZ3EPYaSesU57JuOfx3hFyswFC9cgJ/WZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574181; c=relaxed/simple;
	bh=xXEqsnwqBO7RuY2yWBhU1IGuqGcNZhtGXqs/luMogD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sym70guKmJE/H2/85yH0Lh/vkmSs0ac45F/XNUdFqiGpYJ/km4CMkku3Qy39VeKEnY+wxe3kQPFIIfdaVflkMeIO74cErDLuT5tzVF113r35VTUhQwnvSFvq4a5qGpOraKpOX0n1apHrwSGmxf3vHUy2ZO1GgRG6aZm63I1VF70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RUzkgYBe; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=H68bcxBg; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RUzkgYBe";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="H68bcxBg"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GDBDYN1837606;
	Wed, 16 Sep 2026 10:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=BL3NE0is/YN90uc/e8
	kiZTGpClC5xHpNfTPpIKmXeSk=; b=RUzkgYBekmNWBOujUoa2rWmcJ0TUFqYDxG
	cLPbUSVxIG7fbv65+8fW07MY7ojAPUC+C36G1mNlKQ34jROdonPW1Lf70IsLQyEt
	pB7IS+mL72DFl27cqS8x19ZaNo8c2AzI9We1I4hqgVcONzG0BlgRgn49MlqOgoQr
	iOLcYyIyb7P3w89zLzh5/R6XlJWOT92EUv9S7HGh/1HliMWzLM68RY+/+Ngo7CuN
	VUgorPFc4ds1LLN3r+MUm8KtuTpQPa9YFkbIDwvTFk3v5Ub7ENIC9ft91PHo0+HJ
	3ecF1c9M2nhkT2BFBDuHP/j3h/0HlBmW1dnOrM1R3h7Ps7ojYoBQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020087.outbound.protection.outlook.com [52.101.61.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35hdb6m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 10:54:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrADsvrAB+YzOvSr9sOzPDgX3gLkWdEz98eTbsT+QgECR95HjTqLcu1Vj+rRGmz0JoY2HKnDxT57jIW/x30Mq6Y4G+434DVlA13IbQtaRLp9qAbg6v+e+mQCD4eKZKlYwn3zfESS7lAEnXMK/ieXYpb3gDw7ph+wIxxjOLivMdUUSdexJi1zqnWIYxqAqmSVWHWPr2F8g37WksJPHqqvO8gAtu8JM9WJUfpgpj52ZZAEAUX6xENH71/mgCQifRlaPCx6fNlt6Sy6oevMHvFSwq3hm6Qmdp14ZzxM7qQoXktbzdCnDFaxVnjegk9ri17yQJkBuF++6mrlJ2poSvTiKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BL3NE0is/YN90uc/e8kiZTGpClC5xHpNfTPpIKmXeSk=;
 b=rWmuaHZ/bfHxW74oaC/XwSVH1+v21yVu5bhZRRSw/Ue+KPXcEuxgMQ0xkbavpJ6+ra2Mp+9x07wVyMqfdW5UuT5jcz2KsRuppxwi8JTrl/De4nayN7Xjm211eOKmuPFd8NFF0+Cn+bqJnE2Y6TE8U+Uz1r00Z2yK4vr4VmGLb4R1nO0t0WlKc8WgcVKuFKLZk9gpspHH6MltazcysPB2diGYJVy8w/G4Rq5ltycUOpuUNkFOQbzFRno+WJiiIzds/ojQi/mPUNfRw+zcfl6M1vjjl+XxLpB0pQz4chV7lchJxJvbLpZ4IDUXL8cMfzmncBr6Ely2xkX+ZivDw/DIZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BL3NE0is/YN90uc/e8kiZTGpClC5xHpNfTPpIKmXeSk=;
 b=H68bcxBg3PMQWpHvTPMtnYNnAkidehE4NpveTJLrgt3xT7OeyC9Ydwzf65/nrfATibe79LzH3rGiJ23I2l4xOx6qToN/AMHboPmWnpM6FPg64SOwJTjqkFJcRTcyRqS5RRXeR4mHcjnNMXyHrnWoSx/yMMH+1WR+99WT8UZLcEk=
Received: from LV3P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::9)
 by DS2PR19MB9175.namprd19.prod.outlook.com (2603:10b6:8:2b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 15:54:13 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:408:234:cafe::3) by LV3P220CA0006.outlook.office365.com
 (2603:10b6:408:234::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Wed, 16
 Sep 2026 15:54:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Wed, 16 Sep 2026 15:54:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 61E43406542;
	Wed, 16 Sep 2026 15:54:11 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4BCDC820244;
	Wed, 16 Sep 2026 15:54:11 +0000 (UTC)
Date: Wed, 16 Sep 2026 16:54:10 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Shuming Fan <shumingf@realtek.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Niranjan H Y <niranjan.hy@ti.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Julian Braha <julianbraha@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID
Message-ID: <aqq7ospXwXfyFB2N@opensource.cirrus.com>
References: <20260915211658.1671821-1-arnd@kernel.org>
 <f9c9aef3-6e0b-4f7e-914e-35a82b5f962a@sirena.org.uk>
 <d09d7709-e537-472c-82d6-e532e955f137@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d09d7709-e537-472c-82d6-e532e955f137@app.fastmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|DS2PR19MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 73259e7c-35da-4cef-7dde-08df140ac0d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|7416014|376014|82310400026|36860700016|11063799006|4143699003|56012099006|6133799003|16102099003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PWHldtlfBPPZFrePBMsJA4k0wlgb42UA+h+nVfgzKonz9Ukjc6WRv/gDZ/dYW+8xr6OhAJcQmjpOcIbDdK02IFq/+Su7GQUZzwNVjgANKOK1RD3p5008jZRLWyIq3PtVHsHPWilRyuHdLOf/f9j3F1qNncFNqoceEG0UuwH/OnJrzjKMYyNlY17omKKBqlxJOT+ZZB+Wz1OtFeHnWb5z6s8QDPkHkt/DFXjub9b4u62cb0CNoo6Y7frAZckgW48keQfZdrHXpy+80nENmCb5v1k8Av7Jq2xPKcRNFt4/QTTpP5ZWT8R+37SuBhzniaGaA1JagYODDJgp166Nr1E4NNbY/e84+6QFvQglmAdtwNfMRQ9jk9w/lSP50lYJGeqjTDMsKbdNBKvMOPauIrIUlYe20Z0Thk19F09RN4fRI0CYtva2gYfpgy7B74aD60cSu0ABdYyEKXiiGl0M/X18AJQVfD0nlezqgT1a0i5gKRm1MxKV8RhJE/kNaPNOtM1z/ySFCe2kNv3wQUlN/6iwhTsB2OS+ui27TqG+1r2iPd9TEnoF2CiN2MleBNaGNTgt38lhANC3InjPpXjxX9TbZAY0r3kd2LO7Hy/O/mC8U8n914G/Mpfv3roXRQx99QJMwIYF8AobyZdkw/i8kqnGQ+AhrkrLXZSRzz8cLfS+DJf1HECGzwg8T2z2c0LnhmbjnJ6rvhbo+N4cciuQNWuKuw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(7416014)(376014)(82310400026)(36860700016)(11063799006)(4143699003)(56012099006)(6133799003)(16102099003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	No2tgInzendSD37H5d1bHbYf+o3Lr7+JC2hpBnPIkMd1h7WXK9UYtVBIgWPPHhVUKp9Qao2S7+VNVogkD3YDvZwbcB5LoHQbaf2zW8pxjbUOsIB4WIAjLJlk3uH/DBMO2BCCXqbnvLV4aKVOK/QEMkB/YvyQLRaFQFyQRLhckE3vHNf7XO3reUBVhq2cZPEJK7oMhfhoQUBQQYRVs2zEsKqLvyoMcRSm9LJDOw4+yiA0FKdtL1aOlv3XRFGFOen1a48tdnmyzE1DVyou+Kk0RlM73BPWPnajA1fpWYr89AIDma6eW5MfjUjwuOadAkEFwYO44bcwshLxZ+xOCRimbCofadvy2QX/lXcKA51eGUl219p2K80miNGb2PZJCRhD8dimmqbumkG60k/4RXLSTM4EervR4+nk6pH7UoKue2p9kazU89sOpi6SWGL7J79v
X-Exchange-RoutingPolicyChecked:
	L/uW9yEjQ7PIZIdB+wWLhqNURF5Nz/iA/K+DjJ95L2EpzLS1iBXumZnxfI3eeYa5QCXARrULzDkvcmKxnb92paUTXEK56mwYEcR3sElJfaFrWc06B2Ml8rtXDOCSuACx1vc/GLH7aVvLF9rlMQauqTOBEra2IpCpYV+MZkQG5WGmWXyZ5k2qY5Q7r7P/QwfbPebyveBXhjb012KO3P6OYcEbbI4UhTl4vzIxcml4EDoQPqLTUOac6KOsambOYoRdVVqmaAAXP88sfEgojElhZpy354LlH0foSqn4pM5DwsfUuZrFjNdex+z+X6QRIs1VahzX7brZ4JegNuuJdnQIKg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:54:12.5149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73259e7c-35da-4cef-7dde-08df140ac0d4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9175
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxNiBTYWx0ZWRfXwG1T2ahwUg9U
 K2ucrgKyuDlv4Vo8UBPbMBPX5UTWZXza5qgPlHvuTZWgjAz7kKRZBS7aH6q7UZA9uiMzKwMh9Ec
 3EOxtKio+xJIpGruSr7iLfkQXQ9MlG8=
X-Proofpoint-GUID: tstQJ5x17ONXrZZmcnl3LzBwAjfIaN17
X-Proofpoint-ORIG-GUID: tstQJ5x17ONXrZZmcnl3LzBwAjfIaN17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxNiBTYWx0ZWRfX+0OIj820ePGO
 zNWMVUgzYGQ1i8RrDXTUOgJJKAI9yruUeZnQs7C+PmIoR0hLRCVO1VV/fBIBIlD9BR/3d0qXBer
 1FnpyPULTfsn9ra18eL0zWKxpCH0sxIQSAMlAhw8NGd3Jw25w3LKjk6l3KZGY5OFgFjdNv/PK0o
 qDM+wzg3MqBKG/Bz+aBULrMWWZ6zwgGJiky0KTVNMnfQw3U76cXYTnoQ5e2OVoxpjSegKk3YGQp
 DSqA+nhGXhqVKiZE+AXtIwccfopXJgvybN80c5xX+XvGmlsso85wf2JniV4XxbEB+3UWIcJMMvT
 Or/k4dks+PgDzcTf+mM7UTLOdm0YlwZRF7QLyAmIeHQOk/iLM1n+H0NxKI2tXI+FBCIoHwfQTH2
 7tGaegXEx5f6sFtyYeqLbRlo9zxkwodqOMe4oFMUn7jkHcxmwo0BjjuEAFkG6dUDJxZavk5VMYw
 ju/DQD/TsHe0SLt7nRw==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aaabbbc cx=c_pps
 a=uUOONCeAppmmVOxUvBiRog==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=7_V6Y45QZqM_IbsKU7oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 16, 2026 at 05:36:02PM +0200, Arnd Bergmann wrote:
> On Wed, Sep 16, 2026, at 17:10, Mark Brown wrote:
> > On Tue, Sep 15, 2026 at 11:16:34PM +0200, Arnd Bergmann wrote:
> >> Selecting SND_SOC_SDCA_HID only works if HID is enabled:
> >
> >> --- a/sound/soc/codecs/Kconfig
> >> +++ b/sound/soc/codecs/Kconfig
> >> @@ -1992,6 +1992,7 @@ config SND_SOC_RT766_SDCA_SDW
> >>  	tristate "Realtek RT766 SDCA Codec - SDW"
> >>  	depends on SOUNDWIRE
> >>  	depends on SND_SOC_SDCA
> >> +	depends on HID
> >>  	select SND_SOC_SDCA_HID
> >>  	select SND_SOC_SDCA_IRQ
> >>  	select REGMAP_SOUNDWIRE
> >
> > Should that be HID=y || HID=SND_SOC_SDCA like for SND_SOC_SDCA_HID and
> > SND_SOC_SDCA_CLASS?  The dependencies on _CLASS should stop the
> > problematic cases from actually occurring but I'm not sure if it stops
> > the warning.
> 
> Yes. Just as I was trying to write up my presentation slides for next
> week trying to explain how nobody ever gets this right, you have reminded
> me that I can't do it either ;-)
> 
> How about this version?
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 181ed1b8a6dc..f88381523ea3 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -1991,10 +1991,7 @@ config SND_SOC_RT715_SDCA_SDW
>  config SND_SOC_RT766_SDCA_SDW
>  	tristate "Realtek RT766 SDCA Codec - SDW"
>  	depends on SOUNDWIRE
> -	depends on SND_SOC_SDCA
> -	depends on HID
> -	select SND_SOC_SDCA_HID
> -	select SND_SOC_SDCA_IRQ
> +	depends on SND_SOC_SDCA_CLASS
>  	select REGMAP_SOUNDWIRE
>  	select REGMAP_SOUNDWIRE_MBQ
>  
> I think this is much clearer than the original version or my
> first patch, as it avoids the fragile 'select'. If you like this
> one, I'll send a v2 after this passes some more randconfig testing,
> or you can apply that directly.

This seems a little odd though, as the driver doesn't actually
depend on SND_SOC_SDCA_CLASS. That builds in the actual class
driver, which this driver doesn't use, it only uses functions
from the SDCA library.

THanks,
Charles
