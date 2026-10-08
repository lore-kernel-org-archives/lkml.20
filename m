Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88F33F12EF;
	Thu,  8 Oct 2026 10:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456706; cv=fail; b=R1nRZkJWDUKpwYOazRlLsIxs+C/KXomEGqbBFeg2ml5QO9REE3s9b3c+HLoZm/YKjf7G7IG+RC6aIsqvXhPA+TgJYJgTvI8wOFKnSdZG+zbT0S38o80vGXlX9eisKf0TZoFIlCcOoeR1h+htK8PtnPLfwu6ZAdWN+FdEOCo48lU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456706; c=relaxed/simple;
	bh=5VZAE7lsFcO3jO1JjvvYZPlggaUOa7ShhBRpkyi9sjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQfdxDhBQv+J/lht1RhiYo6dF/grrobeZuFPUEkplfDCd34DMotCXDTMVfmtF9qpGmWuOE7ntbtH3MY1iRnGNJJHArtsdrGZNWxfvt64ZV7E+Z9bLtNrEyatb2+V1nwyHdmhqNR2yAKsMb1V7tiVHisrzUicpDYHvluk8N/vByI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Y+wTAur2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nYT29qJD; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Y+wTAur2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nYT29qJD"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69874INK2867521;
	Thu, 8 Oct 2026 05:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=A8bPMKXXoUVyRRMnKTARsrth0mIRixkcOPSVQZW2AV8=; b=
	Y+wTAur259muS2CcVjSv+usgAF1Wxemv13sHYAM/udHJ1Q+eTwJ6nIq4/7FhTytG
	D57AKFtcfvI6yy17n+8gM1tzqIHh2N/GPpQPuN7ezW3Uy+MDqmduqBfp+BxHE0J3
	HbpcGwg8xFYAIMjFmPomI3In6C3T6Tcv+3BRrbTZjifiyAWELcERi/syIeM2lqJq
	+9ZaCc7AlHQfWxmJ/YjZdE2kmP1aaqQvHx2vKSJy3mFuJYFZAWBXDe1CgziHkDCM
	5gh9054pWC2t9f4ivyOf9EkVgdHgfHdCgY6EwxaHTFpxlhZDE1psbv1TlskCEuyj
	wxr121o7fNs5R74FH9if9Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021097.outbound.protection.outlook.com [40.107.208.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h5xdagprw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Oct 2026 05:51:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9MteP3YNXCd8D/JfK6F/O5XxJr/E06WAuI8aAhYjNrDrLapGHeF1T8rACubZUxEClYytrrywWIb8ugDq9yYt4Znrekuqw/iBhcafsqHzoLqyfQox5heQSjzFr8peAN+/6Zr8fErmTXuWWdOlfqHOnK2xiOgm3XUEF0MLvJsUmJTfWgCj1IoWfr4tqnZOjA6KX8OC72LhZ3M3PZ34c8KskYfNrYWjPZWXyEIixhh/3476LAXTrGAcj8TTI0IaidLZBO2eFssjpuvNj91coAXKXZ7oDb0yYnaB2UQ17WJBEGeE3ODlkIjzee18zEXi423DaZtUDR1agFgIvriEjcavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8bPMKXXoUVyRRMnKTARsrth0mIRixkcOPSVQZW2AV8=;
 b=iSy2QJTKi9h+1qgoNFJ8JiIhW2B9ofjl68jSYxczoXlWCeKUkaIyb9OoPVLSLA6Qn4TVjkDqKj+k3G5fL44bGmedVihPEGdiZMpI+/zo7nF/Zp/wNxG4ebCSDEr9uiCpeFiRt7WaaTs/CZ8FTvfp2Pv+iL504uRcXzNuZoCOLVGX/YZ1zBMAp6dvgawN2As1J8Pircoum973Z9MzHIZqLCV1hKyGsue1pyhdzj/koxx+/NixBlzXkKFySqw2IgSAZjQQd0QOwXb04HUdZCbCcGJfvBKDX9EFUp9QXl5FafJCyo4PyfJytVPR9MdLEDv6vGEbFFuB7emx5vIrF9AKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=pengutronix.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8bPMKXXoUVyRRMnKTARsrth0mIRixkcOPSVQZW2AV8=;
 b=nYT29qJDNCPcUgiRVJxhf5iJ9/0om/uobx7I0aymKwOJfeDU9lSyvCkZQ7l3AxAkAGcBqeTMQpWjCsOd1PskRy8LxkKAxwzWzVGRVskA84pw/twImMvwvrZQW+PdAp9MuTxhHxYCSVgntVvHOdYr4+UlzLJyfrvzLoRAouuiMFw=
Received: from BN9P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::29)
 by DM3PPF5A457CE54.namprd19.prod.outlook.com (2603:10b6:f:fc00::729) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:47:22 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:13e:cafe::5b) by BN9P220CA0024.outlook.office365.com
 (2603:10b6:408:13e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 10:47:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.3
 via Frontend Transport; Thu, 8 Oct 2026 10:47:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EF1B640654A;
	Thu,  8 Oct 2026 10:47:20 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B911B82024B;
	Thu,  8 Oct 2026 10:47:20 +0000 (UTC)
Message-ID: <fc7d2b73-e0a4-4a36-b6d4-8080ebb883f7@opensource.cirrus.com>
Date: Thu, 8 Oct 2026 11:47:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/24] ASoC: codecs: cs42l42: Ensure the DAI is marked as
 started on success
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Andrei Simion <andrei.simion@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>,
        wangdicheng <wangdicheng@kylinos.cn>,
        Chris Bainbridge <chris.bainbridge@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Neo Chang <YLCHANG2@nuvoton.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Hemanth Selam <hemanth.selam@gmail.com>,
        Md Shofiqul Islam <shofiqtest@gmail.com>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Zain Aboobacker <zainaboobacker33@gmail.com>,
        Sang-Heon Jeon <ekffu200098@gmail.com>,
        Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
        Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
        Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>,
        linux-sound@vger.kernel.org, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
        linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
        linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-11-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20261008103831.542533-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DM3PPF5A457CE54:EE_
X-MS-Office365-Filtering-Correlation-Id: cb147d67-6c6f-4802-4081-08df25298890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|7416014|376014|36860700016|82310400026|921020|56012099006|11063799006|4143699003|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	df5orjxS8nlY11xhd+BPejI/Tr5qCNkqdsoOG1aY77dKJf3ut95qO16NtlKwafdCwuS1td65ixPSVUyADwtaHG0iAlIymOFzqCf2WiNlJNDAPowukdq2kP7Wcvscw0tndVigvvnOE+c096V5tE/ehoGNB4laDbvp01tp1RpgFFh4lkwCjdqqRLPkNTzQVaRZ4wpNPZX5Qd98rJeAdcJobpKXJoex8c8xrA7Lb24s4mQvWyMilR0Hvc8h4DMbDjOYJwKKra+Xbfo/ASvjq82X7MqmhtVxI0dQiq6hV3rUJBvuQJ6rkUqfbperXFMUmZnLDLQXVV6XOXgiAYwUS4qcNy+O63X9nUBCEo94Iy5MF6/sMC0Mff4VjRZrX59gT7dG69yCTusPp6Lp0ZJa7MzOdZ0tPd08b9Dyb/rz+OEst7OF8wEletRTHRolK8+1aUaLG6Qrf3YLf9HEOE7l1q6dq8T3WICYMm4ML4Oy9aSCP2oIUYJai+fAkzO1TMWJcivNTBhocbLbTwewtCUfpPQDU9KS1f3MwH2FCxzNS/zwhEF9W5BzqDKSlZhRmuQqMibGuuB3LyniPaZYHoQSYfeLltQWtZ4XPEhQijie3Ujsa4jneAzxU+9i3yQvYGNsiv11a1+458co0MnbmMOrx3kkgH2PM4zhdlJOlqkF5gw/Ni08exAqWlLUj2+1slllpqKWjlU+CtZqEw6yfqZFEqqVdPkynjpBbyOyXLPyg/LpA8XFEq11fxLL4se+LcDmEr6P
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(7416014)(376014)(36860700016)(82310400026)(921020)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1NYrZWytjYiEzU+eTXjrqMShfB12VXRkmM+r6x0fziNISTQyYIyvBp6SubojSh7UmD3l+0gFFiHZsV7iot0dglPkJaDudv9zo5SeAR59wua8kS8sJ8kKFFocDutWkwZ8rUMBp2tKHZltEw3APoOdi2epyZOmB77ddTQdZVHf3sGhMJ7QeYt/zTNBO6kwiliFu3GdiqAsA3ZRcNJ0yeQHsgcn6VRJ9mFDr8iD26JB3MFkqOT6fJZuAfFw8sIhW/rShpEuumgTlE6boQQKVehS5Rl95Fh5JbH23tirJ5Y6eedF891C0eipCfN6QE+Yjcc0OloK0nZPwU8fJBQdjcBxwvvHZXNPCh5/SB41gVZ3cPVdqb6Wz9nLo9d7a4VZv+4hSkiP7sjoFBcMSLQwR1WBsFLLS6pIYFuRNuBSqZHvtlNUIpOGFgSWRR/J6YU2R8et
X-Exchange-RoutingPolicyChecked:
	RG3xIL5/+MLZhlwnreB/59rWsPi9tYF4DZKtoo8dga88mkGhpv0eU3lqcze35LYNNbN4pTcn4hZ3JXLdeJcYzzmt15LpiEH8lSJtI2eAj5dtU7M2ibXAl7FHzgOf6HOVoougZo+JLe26VHTYZUb88bnlMN9VKKqHE4RUzhBoq1sS+KuEoz94v4T22kbMfC3TIqDQW6eV7QSwTrIqAsGaU9KNnnfKG0OniH4U0HS/5RcWUdPN9gBBNqTy6DF6a3DIOmz7SlhTplOVx8UihPfDJUvBrDmyGQPJitZpYvc1rg5T/8dsHIQmqI5x0H7aHowHNuB0ZrlrarL69uKpRiLdfA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:47:22.2813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb147d67-6c6f-4802-4081-08df25298890
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5A457CE54
X-Proofpoint-GUID: nqQHx7UcZmQbm2MmODX7UEWOOlXKtSKU
X-Authority-Analysis: v=2.4 cv=es1KXYpX c=1 sm=1 tr=0 ts=6ac775ae cx=c_pps
 a=HfG1oWozJQbQxD3IkfRzFg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=a81USf9_NmXag9WO:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22
 a=Dj2-6B8FqX4mGL0U3gbX:22 a=pGLkceISAAAA:8 a=KS_8xAV4BarEr0G-hnMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nqQHx7UcZmQbm2MmODX7UEWOOlXKtSKU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MiBTYWx0ZWRfX+EgRFYeEfzBq
 nBgrZOH1qj7tDfeCfL3RjXj9gOmFxdYZlCw7ODnXJSz80x9vTg1dgeBTh1A8QGOYZ7RNQa3GjuZ
 KtL+uHU55bZBmlR9tHraaknrkX4l0PIa7Fjtm0tfXoajkdw0F8w2G+4iKRRaXaokYqjOEtLrGHb
 R088sy7ouCANvfO78DIWFw9SFcECSmEeeVvCN7ny3K7+9YLTwzmhz3t5RTGKdECK9OR0vuo+CGA
 iqQKLojprP/mM4OvQeNbvPn6CT5eWkwHKPVuaYE7aT1r2qIoa0dDgmF1yT7tKSUF4valX/pqRIq
 Fnulj9fH+2Xt3LvE8k+GcL8vk+5/yWWHPkpyx/PcbYzcaqECBVqS24hYRT/JZAP5CJIUr6oXA8c
 KZw2zT45Az9VsjYVbToI7C43ITgVJGYYIQXF3EMMwxMuLaauVDQniyA/aznn7qxnnVX/kccQH7d
 ZKbR9tglJ2FqF0f8mzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MiBTYWx0ZWRfX94JGDvLw8kAU
 ciF1+Oi8TmVPdk69Bg4Bn/XDqzzKmQ7Bfgx/moNgqsm9LbavgzOzVSmkmavtsYb0tHTATt8AcRG
 urR7PjQEGbIMBMjX+TQRd/kattsvXJk=
X-Proofpoint-Spam-Reason: safe

On 08/10/2026 11:38 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_pcm_hw_constraint_minmax() may return 1, which is then returned
> from cs42l42_dai_startup(). ASoC only marks the DAI as started when
> .startup() returns 0.
Is there any reason why we can't change ASoC to mark the DAI as started
if return is not an error?


int snd_soc_dai_startup(struct snd_soc_dai *dai,
			struct snd_pcm_substream *substream)
{
<SNIP>

	if (ret < 0)
		soc_dai_ret(dai, ret);

	soc_dai_mark_push(dai, substream, startup);

	return soc_dai_ret(dai, 0);
}
