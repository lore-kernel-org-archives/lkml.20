Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587687;
	b=zQiixa1t6IM5RDm11AMZWkcfBsKU4yVOiubyaofW32RhFvBEL5CVnLjpT9ANY17JQ0QT
	 7TwlPvdiBSdNTrlYSz3SrG0LW/PTjlerLIpOosYywJahddAWB0PcfiWEoBWOfyFMRNFsR
	 c3xnx0esGaYLTV0vDSWs7XVn5L2LmkH22gObnE5WqYsusKPGWqZYvRteRBarwHacyHTN6
	 zktABuwCqEhvTVmD9HCLjwSDk7OG2dbo+WQVCw+zkYrbdWgP4Lxo4j/Om8yazkFdIynHy
	 MHh4gXUp+Sj6JV+az/lg5Ru3q6R4/3oDwn9xzNZV5A5Ny1Tw6inV4ijLMe510L2/t/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Reason;
	bh=46d2Rfx+hOnoFI+QooYn6FSKXbZIEbI/5rnzJTAuSLI=;
	b=hO2AOpOLOPMdk7CrOt3SqF1gltCas8EMfV1jhNMfi8Z6PTv6SvgX2YlzkPZoBIPsqzf6
	 AQf364Yl75VKAnWNw3YQZ5HvmJgGu79cFX+xxEhX1SbMJWN2djF3o1NF5i5MiTGR3C+ho
	 48JS+ICz7Bs+ixYx2V2/GFWUdxP8PWwD1/SL8YseoFfqi5NRIhW8qXTvFITBdcF9Uly6K
	 WgS88eHCdoCbiywzIhLD7lSHLwoXJmwf6gCf1nSX6InbJFsk/ktJ8AvlS0wT82EjKAXQx
	 Ab+xhT3z0hjyMw2s3hNrV38IH2TnOzAQuheYnV9ZvQ2xFYSa7kQlQ8DZ80DuRzUqBYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=CfZryvAo;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=p+g1NaR5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EA2606A323;
	Fri, 13 Nov 2026 16:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84EA2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=CfZryvAo;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=p+g1NaR5
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFfeuP3586199;
	Fri, 13 Nov 2026 10:34:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=46d2Rfx+hOnoFI+QooYn6FSKXbZIEbI/5rnzJTAuSLI=; b=
	CfZryvAokytqtCaLis2j9UXJOvQnWej2jdOjU4HzrtolrO260byL9WgKFi6w5IQ0
	mcOYfKvpJc+ifZmNYAZaQGKnUQRt+JVvQ16HJE1cEmw2t89DsL3jWZ+CEGv3DDij
	WAhRJjeIW+2EK6/XsV7zZ2tFoDNfuJkr+nLLuoJPcxbyNpU7hsle1AOyPIM9d+oB
	qZ7Yk5/CubvIYMUpoZu/eOFqg6pt9ERIckmZ7vtrOdwU68vDRskmVq4y7uGDbIsI
	VyZKSv9jKj2dqDLJlJEzWeIAIejIV0XO0ixt75EC7pzj/eSXzhdwKLfRqf7fXYRD
	WNT1WKQ3nF+mLiHAYymk8Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022106.outbound.protection.outlook.com [52.101.53.106])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hx4h5r5tv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:34:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjvaLr90JoQ79Q4nEoBxmU6XXtBO+cEGNj50GoydaNbXiJ+DTROOWdbV1L8455nBZmjxKwv4SvTpsEmPtTbCQXKIMwbdWnhzu/m09B2GYjA4drBgJir7JpWShQECnVyGPG81tcnsE6oKiPRSkzi2mltxYHy3rOL8qUWDXSGjFQa9ngEnW8NtXejHm8oSIhIZMqU2x1//n49aDbd6uDVBRqtwwsYhTUuWm34pZZBBjmgUgOBazEU0ZDuXRrX8NJWl1yIfFbXL6JOCMHM65h1yHmxwQf4289SqRxiTl7vtppYM/K+ftX6sCynGxZcBOtXIiSppAc5JYcbAWEBDm4KUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46d2Rfx+hOnoFI+QooYn6FSKXbZIEbI/5rnzJTAuSLI=;
 b=xkPDjzmfXHbOk9Py9ldH/AQHNAKroUkOg+3Q738CFGJ/OS/g2t9LU1YzjRcS6XIq+EIqGDJxtdMJTh4ANwdmN6CN7vkFzoQobJr7MqvJs7ck/0koQu+AcsMULjFFG10G/ZQvxQ4sqk6LcVIrR68SaRyUi4sOqmI/3Hgjzqqo7lYBmu3ujM5XNZc/Tq3KHomcjBya7ni+sYY/SfDkWf8G2z2PjjB9AgQ2HIDCa8EN9WYoxuqe5dOrCCFlZzx3d4qScD2kbcBw2oowzWOoelsC+LZN5TrduDrlmD6Pnv7mdWd4qExD2GTcYHG8n7AtUBgNdlhdRbt1tvz/JFujxamByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46d2Rfx+hOnoFI+QooYn6FSKXbZIEbI/5rnzJTAuSLI=;
 b=p+g1NaR5/gsl7Uj1EUmrBPlHv3m633t34ScbRIirjzAV+smSz0LuWnOr0QjAjpNyD+KgDBNDZyVXG1J6tlU1AiPSSfJVJviJLWS114ph1Br7GgTBC9cHcvkAXFDrecuh9yZvDC8suPQy6YgwWossdNyqCn2tfCSDYauBICpHbDI=
Received: from MW4PR04CA0182.namprd04.prod.outlook.com (2603:10b6:303:86::7)
 by SA3PR19MB9501.namprd19.prod.outlook.com (2603:10b6:806:49b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 16:31:44 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:303:86:cafe::20) by MW4PR04CA0182.outlook.office365.com
 (2603:10b6:303:86::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 16:31:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 13 Nov 2026 16:31:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 51FAC406559;
	Fri, 13 Nov 2026 16:31:37 +0000 (UTC)
Received: from [141.131.156.165] (unknown [141.131.156.165])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5B401820273;
	Fri, 13 Nov 2026 16:31:35 +0000 (UTC)
Message-ID: <2e00b4ef-08ab-4c1c-8aa1-91cae559a140@opensource.cirrus.com>
Date: Fri, 13 Nov 2026 10:31:33 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: cs35l45: Adds ABPE properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-cs35l45-bpe-v1-0-9d7bc95a90a4@opensource.cirrus.com>
 <20261109-cs35l45-bpe-v1-1-9d7bc95a90a4@opensource.cirrus.com>
 <20261113-handsome-original-shrimp-abfae3@quoll>
Content-Language: en-US
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <20261113-handsome-original-shrimp-abfae3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|SA3PR19MB9501:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e34aeec-da2c-44c5-20e9-08df41a3979f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|7416014|36860700016|376014|22082099003|16102099003|18002099003|3023799007|4143699003|261022105027099003|11063799006|261028144727099003|261026140227099003|261021121427099003|261009223327099003|261102123227099003|56012099006|261009220027099003|261009223027099003|261009221727099003|261026121527099003|261009221227099003|10067099003|4076005;
X-Microsoft-Antispam-Message-Info:
	a+jeYW0ANaKcGovjAMZteMOUQvUwFA8FDEGvmjj2J3tNR5ozDTKX4bw1wAS6VRpy4SzDHvJyd6sdOBLhHUL+JshEcbopSweWoKoBrseFQaX+u/3KxsD5H4TmArl7XpmRoqSEDxJ1a6n4PX7WNgyGSY58j7cP4jLwt2S33YwS7JmZNLXkfqnRv1+LBE1imXWEjnhb6ihTFxXEF+y9pQ3DVV+e5tv99n4zfTcU6nkc/LIVg8ux11xRNjg1g6WC14UEuxMHVe85xIxKFe/qvebHF5zCCfEfnLQO8jwu9SSYz6OorAB0/NYPGjrR9DQxvXOgom270CpWtlL3aAfSRD8OP6Ee2n+Vz34fXTLFcOGiztTAWJx9j6kRA5H0ozA4CkxockXYh2kqDqEeCzfPoaOHlEecC1C59NRmecPz6fGp226IQC6URANok8inb3/ONUu7+kRATi4GUkgjiBepNW+DGPLbz3BfQP6HLdKifH6jjwbs41QYNTl4rY15I1thmrtLB4GZm2MDoGJ3xkK+DQWXsQFMRxTrGgL9EiPxB9nyHMIXwJvr8f+wTKib5UL+ZNPqYlShH9aQjnz1UzluFeWpHaB9U4K+ymxgwbEk/W7vjZVfV1+2Rua/MHzD3aYMhglABLf8t5zCzhUJ3jIjcrtApquP02wTMpUcsy5nod6v0+7nsfLWcx75RLxf6AjA5ENox1PJyd1HvVT+5+XzXIMTCRFKuCioi/h7gtbU/cI/MOOTtfwE4v7kKStbpJyKX5CJ
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(7416014)(36860700016)(376014)(22082099003)(16102099003)(18002099003)(3023799007)(4143699003)(261022105027099003)(11063799006)(261028144727099003)(261026140227099003)(261021121427099003)(261009223327099003)(261102123227099003)(56012099006)(261009220027099003)(261009223027099003)(261009221727099003)(261026121527099003)(261009221227099003)(10067099003)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2J9S/y6ZC0D2DP4hA75wyMkBQUZ0aoHFWgMP29pqHSRuLOe3x0rWmjZzxgYDCI5WURe7VJxbvR+5AS1eRy1/3prphta/S6y8ao33sGySF0ar+1gQaq2x229sW1gi71oi8xPIwaWUL2GYjWmdX315yOxXTtIf98VqkGX8iKRrFZjKE6zU/lM4KMkHoX8+0NHFG50oqxEEcysPMMUY/Qf5nyS/uqtKNy/6J5jxXYMsY6qD/8LwQeMPCZBa5AOdACJACrdayzLvq0L2ezXd7gwYlPb5Z5IvOM1Ey11RAA7sFaOH46eMeOsPr+6U4+48QXgNql7YL616ozZZuAwrv690uyeVKFhCJ2kxt8PWdxgpkodbl4naDv3Vw3FT8VagiSBIyZpwT3qQomtu3pLoH9tZSTKWKITKwODAY7kpfsj9PdTFC/SrgY/VURDSPqkyIOym
X-Exchange-RoutingPolicyChecked:
	Lvm1il8cUMypbngOEQZy3Q3tI1g3zLha8cxFSFtXHPJDvPyeP9r2MiUgNIJ9bZg5ZMDWufkKndAiiCPzs4zifo6fRj7WWkzr52QFbPO/npUdsyik1e3sWkQp2X90A9iSU9lpHgUWryKF8KfSh55rG9oxZ2h2KxklWmIB8hzYBrV+OTyOVycnz63Ns+lbIr+N1B1jejzLka167JFrEro/qXJBgmrg1PRjbTRUwbX9rcU0cXFZwYqASYs5oGBeexyJFCEDSSldbg8V3fuIwiofMOzfONcO6AcgoJO/18s+LrSQr9PQSOy6yYyGSeQeQr7HemRZfLk6RyvONvbE8RUHmQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:31:38.5995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e34aeec-da2c-44c5-20e9-08df41a3979f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9501
X-Proofpoint-GUID: a-RnQ4BTf-QdyMPQPGmjthXk573P4y-J
X-Proofpoint-ORIG-GUID: a-RnQ4BTf-QdyMPQPGmjthXk573P4y-J
X-Authority-Analysis: v=2.4 cv=feo4WEQF c=1 sm=1 tr=0 ts=6af73c0e cx=c_pps
 a=lgz4Zsbfm4nnj/Www8P8jw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=0L778s_8SR8yYWsaThEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NSBTYWx0ZWRfX9uZBQVVI6+l3
 8qvHrKoiuHH02uDQ9fSTnG8qKYwVlTJFnoRK5Em9lRt6grFhPPnuX5WtdVwFenJ1poqnn6aUXzK
 ZTLgpVT6ne6aIu3vbgkOjKPJP9QDmak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NSBTYWx0ZWRfX0DMwqvxO36qx
 iSHCrv9vWoMI8hfXRDOxukYiDxwUsU4l7Q7RkmgLq9+tibqAWy+HCsavvOozHISC+joSiBaGTWN
 kb2A44DwMt+Eum4vT52HaS+PygdYYZYsq6niGls0O44cZQrwmRNhpTL0mNjds37xnX1eJ9OR2zK
 3T/7L37a1VgsTgSglN/wlA3YWHHKn2ZD9ENvE59kezNkC3hXklBEOdwh3c2aBCBdnEi7KllcAIW
 3s1r018ujL7tDyClsYIhie6C62QBs1DEXWAKzX+X9WA691f7patpni4EB/OjVhCRERo7KwOuF8Z
 TZPYguwm7JG8CID3KMtCeGUdKNUFbvm+7uKjy+qUmlbGPfGxVCbyWno/EJUuJIRgzGCVIoQU7Uo
 xQ31tz7xEVTr5uq7z8jKOpxqHj3CFvIAXWS4cgGfXr+Gg2BgVlswsmyMmA352aB1+yhHUgjfOX1
 piKCwcm6DxQkEEXhSbw==
X-Proofpoint-Spam-Reason: safe



On 11/13/26 4:41 AM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 11:57:03AM -0600, Ricardo Rivera-Matos wrote:
>> Adds devicetree properties to configure the amplifier brownout
>> prevention engine (ABPE).
>>
>> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
>> ---
>>   .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 161 +++++++++++++++++++++
>>   1 file changed, 161 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>> index e674811b22b2..2c118fa57ad1 100644
>> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>> @@ -16,6 +16,62 @@ description: |
>>   
>>   allOf:
>>     - $ref: dai-common.yaml#
> 
> Entire allOf goes to the bottom, before additional/unevaluatedProps
Ack, will fix in a follow-up patch.>
>> +  - if:
>> +      required:
>> +        - cirrus,amplifier-bpe-enable
>> +    then:
>> +      required:
>> +        - cirrus,amplifier-bpe-response-mode
>> +        - cirrus,amplifier-bpe-thresholds-microvolt
>> +        - cirrus,amplifier-bpe-attack-rates
>> +        - cirrus,amplifier-bpe-hold-times-us
> 
> ...
> 
>> +  cirrus,amplifier-bpe-attenuation-levels-db:
>> +    description:
>> +      Amplifier BPE logarithmic audio output attenuation for levels L3, L2,
>> +      L1, L0, in whole dB steps. Half dB hardware settings are not
>> +      supported.
>> +    minItems: 4
>> +    maxItems: 4
>> +    items:
>> +      minimum: 0
>> +      maximum: 15
>> +
>> +  cirrus,amplifier-bpe-attenuation-levels-microvolt:
>> +    description: |
> 
> Drop |, other places as well unless you need it.
Ack, will fix in a follow-up patch.
> 
>> +      Amplifier BPE linear voltage audio output attenuation for levels L3,
>> +      L2, L1, L0.
>> +    minItems: 4
>> +    maxItems: 4
>> +    items:
>> +      minimum: 187500
>> +      maximum: 1000000
>> +      multipleOf: 31250
>> +
> 
> Best regards,
> Krzysztof
Ricardo

