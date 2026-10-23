Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792748177;
	b=QdyZUH6p48NyOI5BuwsWkXDMHv84nJVWXum3jMplYRr7L1EjIRumwphWZ1zquLZq6lwD
	 TSGoihSXOGuKXfoA3PQJu1kfcmqE8lutHtFcdT7+r7jWtHd36Fk3CzfUiuxsnN3a+kpCa
	 v8SQjMHMqFbVkwMVl53v5y9A/dv7FLBw5W89MFv5cDwpJC4Vx4kDoEqboxE4BYu5t9+MS
	 onDLWftTdcp/WN8jmUJowW/Vi+BUdMtWDnJ3ytlC05lj0eT83cGEUggba8I7ekj1BxhQY
	 8CGNaZH/ID2AaQR+cOoyZr+pHNUSsDYIr9KpqVEvcc/vjheIDZpI0hEUnxpBks+EMVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=16/sxfQV4g4DXgCu2xdMRl7HJIRCJ36iDHUmgaFDYKw=;
	b=GThl7nqDLaZytLChsiZB2S6sfx4zDikNRKQ+Ct4sNtAMXr2typamxQvZn+PNZVi9JfZa
	 FT0ODyJkwqePPlfyb2s8y5SNcFW92S+aFAR4OXdbf/cHaOImB63zfvucEG9TEZNlwzM/A
	 DwJw1CPPCNMGXV31hosF6vRqKO/7k3O3F5xS18PCIu9erv0RC/rUnu0HNeMsvQSr0AJBY
	 StdTrP/NgITgHaJGDelHHHPya0TN4qVDNtO7qLGnJ7SRzQPuEHJW1cvf2CV/jxzYvjtb5
	 1JsV7Zoim/6gy+ZU9F+Q1z+g89QiAnPUfUWWSo1yupTb4wx9M3CseTmdVJ+QxEccarw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nKohpAFY;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Vs+59DV6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBBE606A31B;
	Fri, 23 Oct 2026 09:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FBBE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nKohpAFY;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Vs+59DV6
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N8wQCf308929;
	Fri, 23 Oct 2026 04:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=16/sxfQV4g4DXgCu2x
	dMRl7HJIRCJ36iDHUmgaFDYKw=; b=nKohpAFY5WctnhvrPOd0+ZmcG+b3N2Jak6
	luNfNPZ8/zn67i8rO7o8awp2PlHomvvaZzRQD3GdoR0zSVl/nwj3u7sKvzhJiFdL
	C4UInB6eZBwH3ymnwtjYHWeu0qz96SQ1biOsUY3xLKxb5yhzbxrFzWyNJCxgoq6H
	oboXjzUM03UG3evLJcGNcDM6XFhLZBPcLaMSs+zo1Bq3WoGCo9HvCxMyGqDSCmME
	k2MwiZp4nINxp9Qbd8byOO6TtyvXbfkMpteL+ecu3PIXo1u6NGQtvkzYlrNzrGB5
	HSNs3G8pErGCEMGqT4IWR7xKlI9ISIWa+gCKH2NwFQTdJoHv5rRg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020085.outbound.protection.outlook.com [52.101.85.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hf9809y9y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 04:35:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbAwSCXczYUn+b6qHjrM378qKHz0txUN/dvTxcFvbzfKJq45fN0nd4zrn23grWJExyNsH9h3VrLU/LS+adWrOOk6jq6nJrlGyHIPB2ZnjqazpuI3PT06JqWdPNoLnbMbTQE89OWnJ/tnKKO5E5jVBK7tF4PdmnLsUv67JnK6upbOW9v0iqTXLM/wsti50ATi/o7S9HUA0YE+A6AeYNKkxR3qHLmJ6Pp8kTPkb02aicSyJbZfvVGT2AkUbVvVsneo2EMBH5/NI5Fxrz9q9/24Gj0JukYZ2KRTB6SVhbjIBuGhYB8Zso87jSCINHGWC39l94u3/wMzk0WdRAR3En/CAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16/sxfQV4g4DXgCu2xdMRl7HJIRCJ36iDHUmgaFDYKw=;
 b=DxdnTfpC/r9Y66TEHNLzbePNACrRQrq9DDGQXmzmkrmsDr8A7ieVHRQ9EAJaE4zg7LkZpiBC6QpqKL9SAFqtaNuIR3/UuhmR4QL6N+9RU/ew9DtYOcjskAoDL5bByOAPJ694mFqU8AXXuX1gpYmgy41MG4iP+mpiEw/OzmLNief+fyq0udOyLml5Q/6fM/3Kz6VXDsAbxs0ZXo+FbX5bqJhGoat48AmOmQv1LCZKTnF7k1ne9DHewnLwUkghY5EQuDtbNdvrM+33GawX1clZA6WNNSWOc/jhd2pC9OVk0vQ9DO8lK4HTdHleXZ6itX9rXpK99xVAnxUO09Ktb1fU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16/sxfQV4g4DXgCu2xdMRl7HJIRCJ36iDHUmgaFDYKw=;
 b=Vs+59DV6zT9dMfQ5eH9klpfgoEOj5B5r1/x/3Yf3Tk4foADuXOsi6S5+9DMviRH3F63VvPEUNKEfmnCVrAPbhTtpQuPlV8uFcvj3ztq3PF5bR3/67u0Nm/gPxTeiVRbTk2Ds32yLsXb0hYFIyTkjSuHwpBafzoiCDaEZe+HC4Lc=
Received: from SJ0PR05CA0194.namprd05.prod.outlook.com (2603:10b6:a03:330::19)
 by BY5PR19MB4001.namprd19.prod.outlook.com (2603:10b6:a03:219::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 09:35:23 +0000
Received: from SJ1PEPF000037A3.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::a0) by SJ0PR05CA0194.outlook.office365.com
 (2603:10b6:a03:330::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Fri,
 23 Oct 2026 09:35:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000037A3.mail.protection.outlook.com (10.167.244.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 23 Oct 2026 09:35:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 59401406540;
	Fri, 23 Oct 2026 09:35:20 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3E84E82024C;
	Fri, 23 Oct 2026 09:35:20 +0000 (UTC)
Date: Fri, 23 Oct 2026 10:35:19 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: phucduc.bui@gmail.com
Cc: David Rhodes <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wentao Liang <vulab@iscas.ac.cn>, HyeongJun An <sammiee5311@gmail.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: codecs: wm8994: Handle hw_params return value
Message-ID: <atsqV+4xOa+Wy8RL@opensource.cirrus.com>
References: <20261023090157.518032-1-phucduc.bui@gmail.com>
 <20261023090157.518032-5-phucduc.bui@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023090157.518032-5-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A3:EE_|BY5PR19MB4001:EE_
X-MS-Office365-Filtering-Correlation-Id: 01909c36-d9e8-4d7b-04f8-08df30e8f5e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|61400799027|36860700016|82310400026|56012099006|261022105027099003|261009223027099003|261022075727099003|11063799006|4143699003|10067099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Gh+oyilpZvFW7F31bb+U93wOQIkNNNZzaJN1zeqXu7Xa06Km+IrdLGGKmSquo+U8iqWDrP+QitioqazpBMMVS9OJSzFPpfavK/sp2dGmHSaGbHb+Bh5JzY59iGexYPSqg97pNG1tnhCE6MW9V5cYtx+MHNMA5TIjyHTFc2FhmXQziqNDKoQDEZOVqMx30cHM/9gyE8AauZiDgok5DDlYS2s0FGTDXGTc/BdG7PAhM9KRab/rLet5nLSwXV3j/0QHFDPf+4rtKzgfnuTYTKB179LncPf62APNSNfh/aU92kcpqoygfELxRWd4tne+a4zowxW8bF/j0n4oXHsFmYI2qACv+IAI01HPT37K9Pgb7NuBnI/p9YBmNXNUt6vsU5aNX96//JOk0dKv2Tdo8Y/M5tr+0z+b0nXbTKtF3T10DVMGSqKqJp+9M5VSYahNZL+gG/qXQckr5pehSA0vArgt2gdPKGOKFAyyvYu/rx1LtaP+xL3CXFFSlFGofgu5Ek1DWVVA5RdCe/dOWCoHsXsZR6fJG2bhLwgWAtpMh3T5Osqh1FA3Qyc4t6+x2h8zgxGa36w+YPzeE7Pw0IA3tl7R9f6rF9QbqxbsG8XJ+OLAXvIYx8IfzejcAykEa1ENJ/xfjRy/UbzQE4JG7NMMLpVOdYp6JVizwg8jwY6lci8E0cwJkYgvSE97SWn+aSTxKsdloqZt22NaVIXxq8IgqcsD2Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(61400799027)(36860700016)(82310400026)(56012099006)(261022105027099003)(261009223027099003)(261022075727099003)(11063799006)(4143699003)(10067099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	17ZklsdUk7kVdHcNdXn9dDPTCZYeMeHR7MIrWPAnQ71gHcW4e1RnW+PityShv875keS++YxEd4y0phnF1vgUHjztd1OAOjMXJNeNH59U5WmNUrfU2IGHgk8RXZuuxXGBxJN/RqDfLMHVqO+mMb4YSXLPP5sSVKZOKE1mCsOHrcPyEgaZBJELbIJ2x54klUBVw4WHi3wsgvKr4YoOiX1E8dQ7pFAtCKlNN/IyJRB3oJXnmg5eSzaKHVhAtqleKQyu9BG2q2IGVHyPeHJgTMOvzH9yo0NE7NcOACVYbiuz9LPrqJMPDWVP4cbTxZgE8aak2Mq8yzBzPHG6/0eG94qMIQz+MJtO2QlYtGSG9x9IDhlLRRa+/xGadqkWnPdev0Eg0o8MgBB0a/KmTegwcnX0m4P0M7RshO0dYMeN/8Zc/WsL8/WWULskDhwH9+SY0xlW
X-Exchange-RoutingPolicyChecked:
	a2vqVC1MPiQyRqmy6mHJKxEvmoetsUHL96F42YwYil3MxrSdPTcPMUmSUH6/fRzjdOXerAVeJXSA9/suIZ1cHMEnE8+eUDyXxa/dE7jOGaTkfMCtsf55Hfw2UXRUjgRC3ErjTJD6jSwYcoZzaB1+UNlWUJ6AT0rtBp/hmp3Kgftjii2AYY9TdFyGnqPnBvCuJU7Y7gVghBkU8Yo4R/fR8Zyy5TuVAHoXYjzmIaxriL7zNulSOQCsl7EF5u7tIsgaPTkAf420hzKOqoJQ/WPAXeU9rkYp8rI7k6qXyU3QMqQjYkTzxmeMmcMB4oMO+7Pol331Lhq2UTnqvD35nOqgzA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:35:22.2551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01909c36-d9e8-4d7b-04f8-08df30e8f5e3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000037A3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4001
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNyBTYWx0ZWRfX023OGgJ+Pq5m
 dxoCQbAxvRE0iE/xV7ULypPRIUrrquc05WOFBAFkqEQlXMY+rYnXH9CiynkJLQWYK/zikkTgthr
 H3+FDDMOFVta5Otf3z+2Ub/KHg/ekGU=
X-Authority-Analysis: v=2.4 cv=Er5HPicA c=1 sm=1 tr=0 ts=6adb2a6b cx=c_pps
 a=WcQbdmje/HnKHP6F6rQghg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=NC2tVYWS2lCoPYbCSPIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: YLCNb4Ko9nCuuluvbr9NJuKPogkCp01z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNyBTYWx0ZWRfX/SrgKW2pHCUE
 76x7stBNycOXwyRt274rLtUcBYdxvMPaZFWcwyLCHhRnyDXBCGTsFLVU3UOIj9A6OX2rHHzNT/e
 a4qwlws24xQD3bI6vEeSxjRSzjc2MqIkCX+WigIPhANooigapRFuqPgUEW5JzDJYTD0kgPxkyCW
 iALzmEvm5zWj0WaXZvb/30bSdvRkvHEr74fOSwkDlxuiYclns+CdQ9X7YkeXu7yfZcsIIWNKryW
 gZeUycOrUjUvt5ncOjhnBxHRAGgcwhnI36Ew9NH6fdt+/SrBWnPVM5++iw8zONgnDYH/P0wQ/Xb
 o2Cosm/RB9KyRnp3FPcWl62wuYpJHM4huSSu3qTvipE5dKM8ZtHDllMwUtzpygckBYRUWOohMWM
 Tk6Yp9ox7sx2/RYpg8GY8fr1ODqbSWjJDE026WC5tlkBeunUVrwDTPtvu+LbbceQ4FNzy2dnyuP
 2j01A+53vz04gBJ1y6A==
X-Proofpoint-GUID: YLCNb4Ko9nCuuluvbr9NJuKPogkCp01z
X-Proofpoint-Spam-Reason: safe

On Fri, Oct 23, 2026 at 04:01:57PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_soc_component_update_bits() may return 1 when the register value
> changes, but ASoC only marks the DAI hw_params as done when .hw_params()
> returns 0.
> 
> Propagate negative errors and return 0 on success.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
