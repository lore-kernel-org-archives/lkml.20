Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792561581;
	b=rgBhizqCeFHWoLvxt1yFJjA6JVKCEdQl7EKUl3uNFYN6BUVBT1BwBOzeEA+Jt7AbY+do
	 Oz3w0I5FsOHIB8P9/BrIlRqmefOF5YSk4k8yaG4ud8fN0cZrk4I9G1Z+Xeh3v5VMlpdPE
	 x6pNxKyU9UDMz5gjYqm99dLoWHjVEv0QKCYw3IZqKCf9nfGPXqYMdOgtZ7hO7zd4RwZd2
	 GMBBIb4TOi+ucKA3nkgi5Yd4EIJAyRwBP1P0ULSIcDpvokE6Pfw0Sajp4hI6Uxxz77z61
	 pSxmtHuSVBtKV9gCVNqkriE7SWkNcitqCTUDpzwr9be068/6g29Dje+l1Q1nnN9L+2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
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
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+fcaVqpk3TbWv2ROi3DkwupOi5ndLDXyohhJTzhmT4c=;
	b=s1jrtrmJzfhVDmNkR6izwI1Q75GHLAIaCDBB8EvBNqPugQg/S1BnVZ5orqncHyrERiCx
	 EdMYSXUcDkDrAG3s8lCn421AwwcmJmGCUAyGcC5FiYlyWrJUC33oUf3MJFQ9kInuFC2Rs
	 8nMTvYB0wPhnSeKYawjkypenDms91X13U6qKYgWJE0/onAjY7dqc+qiUVEzwTIiP3bOUy
	 jfO88sE0Rf3uXYh1LxgiHzhNvQRu5/xE2qqJozcQWtnEf2XM5+p9JwmUnsQYjX4m/hLRW
	 NViIdqEQR6Z44cYqwVA3CUPT9QzzNiorn3+FduCuda1nLSJzB/1q1BvXKrTnUuIN7tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="gy5E/d8+";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="lPV/OEZK";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20299606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20299606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=gy5E/d8+;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=lPV/OEZK
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5hPGa889452;
	Wed, 21 Oct 2026 00:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+fcaVqpk3TbWv2ROi3DkwupOi5ndLDXyohhJTzhmT
	4c=; b=gy5E/d8+PEdYORRlClV9FMDzq8btyiJP8Ei3bMvrnoiEx4OFtSuNKFZDq
	99yXQGti+BvXaH84c7AMGnJ9ChniewzmZyg1PXrGVVjzVzRPUrNRVLTS6Ffljp6u
	6kpOT4thfaRnv/E/B6c7Gb1m0w7/dEeSDoQ5JxcuGQDfA7bj0OrjakQtl//fT1fM
	j+fchRsUQwfDaA0ImrfLKrPwtYlv6PRkZiJdgy/+njrSpAGznIdh5acJBA3ZmhGI
	4QhwhESXz1tIANlhHUgvqo4wxcpO//X2NwDrNPG8jVRG1dr2GsU9Hzh1ijhjsm1h
	BYPkBBKE2pwQJhIMZMlqypJ/PX1FQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4henaagjxw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 00:46:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDpKUbXQ8i8UbQaZiUQQpoT44CjdrZqjQfrlnu+JZ3nWTSNijpqWgROdM3uXwIfqJGvlpssEsj6tM8lrl9Gvm5YkhkIw1u8MF0Iwo42raSPCsJIPAHPIjEB1Ur3LdMArargb6aaPnJvcC/HtxCFN/DcDp8+11Ofmz9cPwmRt5GWLdUgdmLCz7skKNRw4SukIXwVxTAz8Tf81DCY4BpbLfgyidhNQCB7K6JIX3gqK/vtmswHKPuUzND8qFA1Cs6SRKPL2T50xUnkYT5vYFUkARjKrk6rzcTQroUTtVC9KPdrK65HHE3j81ayFjsKZMB5E+YUYX9CmqlgEMkQ29METIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fcaVqpk3TbWv2ROi3DkwupOi5ndLDXyohhJTzhmT4c=;
 b=cbqkvcFu/k3AtAydQXIAT/udXyjzBjHQ+iRxNSL34Z5mvET8ft9x47L6CPrpxRdL/vgBPrrVdJiD99Oe1qG0AQjYtl/Sz0Sn6ktcN+6j4HTRtQwcakuIi0H4iaJDMlDh47NNht6TV9pIiWXYxV3x/bQ56IQrI2o8Db4R7jgBhSD9jv1k6WUlou5WdGykFEpwbgOCLWNxuUtiIzvAFtmR1wiFE/y8DmGh0i7q83i4OB6Cyu4UZphO4fE29CDRepwPnLmav7xkVjcpUvUfdJ020e8kkUzq9q82K+51HIW3EK5af56V9v1+Yfsx/zpyz0O9hx6khuKGkMLqxqFRZHZlaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fcaVqpk3TbWv2ROi3DkwupOi5ndLDXyohhJTzhmT4c=;
 b=lPV/OEZKAZik2J2ra0zLmaWLJjRfAYqd0t6Ybwtg1rf35hbVdZyO9nGOMNHELtu14C//R5eRI0KGudicDDd8QhiWszxA0iT0GnbSp6+B/tUtXUXo3rTT0JgUEVX9J3lF+axMOEZpQ3T1JdyspKvd5N6t6dw0FNGZTY5DsvrSfrg=
Received: from SJ0PR13CA0159.namprd13.prod.outlook.com (2603:10b6:a03:2c7::14)
 by DS3PR10MB997703.namprd10.prod.outlook.com (2603:10b6:8:348::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 05:46:08 +0000
Received: from MW2PEPF00014674.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::1b) by SJ0PR13CA0159.outlook.office365.com
 (2603:10b6:a03:2c7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 05:46:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW2PEPF00014674.mail.protection.outlook.com (10.167.249.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 05:46:07 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 00:45:29 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 00:45:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 00:45:29 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69L5jPwA1988750;
	Wed, 21 Oct 2026 00:45:26 -0500
Message-ID: <6eee4bdf-e3ce-4079-b5b4-69ab4492f838@ti.com>
Date: Wed, 21 Oct 2026 11:15:24 +0530
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
Subject: Re: [PATCH 2/3] soc: ti: k3-socinfo: Export SoC registration helper
To: Andrew Davis <afd@ti.com>, <conor+dt@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <vigneshr@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>
References: <20261019080736.944127-1-m-shah@ti.com>
 <20261019080736.944127-3-m-shah@ti.com>
 <4f8ff34b-d16d-4215-b7ed-b23a0d8663f6@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <4f8ff34b-d16d-4215-b7ed-b23a0d8663f6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PEPF00014674:EE_|DS3PR10MB997703:EE_
X-MS-Office365-Filtering-Correlation-Id: 71439054-ad22-400f-d2eb-08df2f369a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|4143699003|5023799004|261009223027099003|261009221227099003|10067099003|22082099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	KNXe93cd9ROc29HNUhY5ayYz0NeogKY3qCFmyrxp3w/JXZnRRIKlNM7nUP0COYlEbo5fOZ03bp3aQEGbBk8amTvCf0yNeaHFqBc1pNpvuM24PMyIp29462N/FYrNmhCSK2+DWeDas1AkKXyLLOK8e5OHYyN7Zl2Xvn7enj4zJRipV+j1mdn3ZSEyzA81yj7XGs4d9Jq/CHA0dCTTA1QgEVXccf1/uxNZuUMrDAAMVO70sMWEqXxitatORZg/r/vi2PpiB2Ybo1gwecIxCOvspHc0LLwru3gkPHuD5RFtgaTCHbYzqq4kTpQZD9VVPYkWQPSz+x+I/oomillopnGB+2rbGFV/F0ojiXvzdadF6gf/4C4/itOZJ+KnSiShoBd6ZRuVN9oOrzh89z88psGR0AyU2mD4QqN2XkDLej+n4oWe0eg8/XKtq3u3sd66uIlGJM3c/+yNKyNQwlKB92sAqzSLZ67/y6TBnZ3BmzIPof7OOX97hgl1/xSoMeNqdYQGKGBzwrWUpegYEQqeUy97GJGrgDuCcM1LmT4/17qA2Kj8m6TGG7DzDnO+IKs/VRwH7BndHCzDWJJ9DBeaTgwiA/c+DWYYEucW9MMqlgdUbCx7rJIxAl+iD65EG9Z8vWHc5MEKPk4+4LfBIlnIAp+zZw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(4143699003)(5023799004)(261009223027099003)(261009221227099003)(10067099003)(22082099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vFAbcoLE4nHP/DdF6KgAiVy2669RNuLsMDq+hS6wHiFc7QrxXaRHj+lPVilfLIEUIyyM0ONiCFmjBAahclEPzsuYw7lTHEonQhYkGXJu2mGsEY0+MMxKhJRY41pjo6a9ZTzZ/PJDIySTIwnLGB2cpnn6cQG+k5+VXiI8BFKcTLJsW2RWkMd5TP4uGH8cEwY3NPA/l1Ba5Vt572lfMMBJOcXyG87Luqfcsu0Tn1gDkD1pu7QquIEAanGOmM58qrxEEAc6SkajX9cmXUkO1E4qV/BMb+BKvg7ZJPadrM43UWS0YMhtNCHGrOluBAKse15RMJ3wWCxBJbjdg2Jrl6cybpmHfovtlE/Dha6xgaLnWkR2NPeSr40Zd8AfGnQeXcL+k6FMs7X0edKrv1uZF5aYT6tlCc7A6roNypyL0BDST5DkghJKwgNWAWUQeXv81c29
X-Exchange-RoutingPolicyChecked:
	qJB52i/RIgnIytTCEmmi6o0l3CG1emnwwI1NvoAfreCKLHcNZMgRA04ByVOcpu0pjyrVvho6Qz523TzM0TSZESGxTkSiHVDsRlPSehKBj6exFWd/bPxXSlq1jEozzbLFFAdAQ1ycKdOgQ6+B3mQ7PB5B7gplf3f5xgILM62npq/fonQDR61ggEc3si9GoTK9QFd9vMzRIe2Sp8qXLy+pzF5aX3gZiaRo9nt3/X0AQABp+4HsAVSsy++w1Y303JEg49xvInxosYqJqzgrmz7dqY0UmVZupi7MZXJJV8bU2DDZaBYDECvYOd5XwCCAb05FypFnNX87/hRWbruu5NNYDg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 05:46:07.0527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71439054-ad22-400f-d2eb-08df2f369a36
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014674.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997703
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfX+UsKyuYJ06cN
 TgmUDRQQOGnfU9FTqG9mnQXMGLZ0tMw88X3MKPDmr+JHag1BLJblWl1mbJxRQ3eXQt01X0Dm8fY
 t8lLO8H7zAbiDxa378FHq00yqf6P64w=
X-Proofpoint-ORIG-GUID: q9yxz68M3-Z7FU1mO2WGc5NlISiGc1tf
X-Proofpoint-GUID: q9yxz68M3-Z7FU1mO2WGc5NlISiGc1tf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXyFPlIL4Lo7iV
 0oEba5hL0kDLUmJ/Ljj4Y0vzb8xH+JOKoqg6HD5jpduqEN9GfvH8mdpTO4NgfA0EZ4EAnENISuS
 6b6yHQaCOGeImFV6UtrY4np9moMabCck8v306iG82dzB+ExmknqbsBYWeZ0PWALQQcxFbXBGqjg
 zsmeOHwYvLQUO7kgXcP7E4AlGmul6GduucIn0g1P6cgk8jGanzSO/KrJDcZ34tvyBBlEhjoC3Yn
 THxUhhTvn8M8ry01nxrgHW7O1PeWhJXgENalNlgzweOODvgPAaS3EQ8dITIWofIAJGwKtJvReAr
 3Jj+VKf3kbQiZjmt6FpG8uqrKxBslGG6cGPm+ZIjqow+Q0+qSm0kEoHkb7ZuFwb4oiXdjM+IcW5
 QXXZngQ9bsAivxC8D0cDCfMGaNh/gxHtjc+E819WgRsiIokFaz57eF1mFCmBE458Awi3FWrqKyh
 odQpl/Wt/HPfOECH4ow==
X-Authority-Analysis: v=2.4 cv=cJB1IVeN c=1 sm=1 tr=0 ts=6ad851a3 cx=c_pps
 a=oUdh5d0wO9iyjQqwpg+wBw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=Vg_lMtDAUzEJadqGD4UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210022


On 19/10/26 23:08, Andrew Davis wrote:
> On 10/19/26 3:07 AM, Moteen Shah wrote:
>> The k3-socinfo driver reads the JTAG ID through a dedicated MMIO 
>> region and
>> then decodes it and registers the SoC device.
>>
>> Newer TI SoCs like TDA54 use a different path for accessing the JTAG ID
>> register, but the decoding of the JTAG ID into the SoC information 
>> remains
>> the same.
>>
>> Split the decode and registration part out of k3_chipinfo_probe() into
>> k3_socinfo_register() and export it, so that other drivers can 
>> register the
>> SoC device once they have read the JTAG ID through their own access 
>> path.
>>
>> Since the helper can now be called from modular drivers, it must not 
>> leak
>> the SoC device when the caller goes away. Tie the registration to the
>> calling device with a devm action, which unregisters the SoC device and
>> frees its attributes on unbind. Callers need no unregister 
>> counterpart and
>> the helper keeps returning an int. If the soc bus is not up yet, the
>> attributes are only parked for later registration and there is 
>> nothing to
>> undo, so no action is added in that case.
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>>   drivers/soc/ti/k3-socinfo.c       | 101 +++++++++++++++++++++++-------
>>   include/linux/soc/ti/k3-socinfo.h |  11 ++++
>>   2 files changed, 90 insertions(+), 22 deletions(-)
>>   create mode 100644 include/linux/soc/ti/k3-socinfo.h
>>
>> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
>> index 48dbef3acceb4..5fae03004e350 100644
>> --- a/drivers/soc/ti/k3-socinfo.c
>> +++ b/drivers/soc/ti/k3-socinfo.c
>> @@ -5,6 +5,8 @@
>>    * Copyright (C) 2020 Texas Instruments Incorporated - 
>> http://www.ti.com
>>    */
>>   +#include <linux/device.h>
>> +#include <linux/export.h>
>>   #include <linux/mfd/syscon.h>
>>   #include <linux/nvmem-consumer.h>
>>   #include <linux/of.h>
>> @@ -12,6 +14,7 @@
>>   #include <linux/regmap.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/slab.h>
>> +#include <linux/soc/ti/k3-socinfo.h>
>>   #include <linux/string.h>
>>   #include <linux/sys_soc.h>
>>   @@ -152,38 +155,44 @@ k3_chipinfo_variant_to_sr(struct device *dev, 
>> unsigned int partno,
>>       return -ENODEV;
>>   }
>>   -static const struct regmap_config k3_chipinfo_regmap_cfg = {
>> -    .reg_bits = 32,
>> -    .val_bits = 32,
>> -    .reg_stride = 4,
>> +struct k3_socinfo {
>> +    struct soc_device *soc_dev;
>> +    struct soc_device_attribute *soc_dev_attr;
>>   };
>>   -static int k3_chipinfo_probe(struct platform_device *pdev)
>> +static void k3_socinfo_unregister(void *data)
>> +{
>> +    struct k3_socinfo *info = data;
>> +
>> +    soc_device_unregister(info->soc_dev);
>> +    /* The attributes must only be freed after the unregister. */
>> +    kfree(info->soc_dev_attr->revision);
>> +    kfree(info->soc_dev_attr);
>> +}
>> +
>> +/**
>> + * k3_socinfo_register() - Decode a JTAG ID and register the SoC device
>> + * @dev: device on whose behalf the SoC device is registered
>> + * @jtag_id: raw JTAG ID register value read by the caller
>> + *
>> + * The registration is managed by @dev: the SoC device and its 
>> attributes are
>> + * released automatically when @dev is unbound, so callers need no 
>> matching
>> + * unregister call. If the soc bus is not yet available, the 
>> registration is
>> + * deferred until it is and cannot be released by @dev.
>> + *
>> + * Return: 0 on success, negative errno on failure.
>> + */
>> +int k3_socinfo_register(struct device *dev, u32 jtag_id)
>>   {
>> -    struct device_node *node = pdev->dev.of_node;
>> +    struct device_node *node;
>> +    struct k3_socinfo *info;
>>       struct soc_device_attribute *soc_dev_attr;
>> -    struct device *dev = &pdev->dev;
>>       struct soc_device *soc_dev;
>> -    struct regmap *regmap;
>> -    void __iomem *base;
>>       u32 partno_id;
>>       u32 variant;
>> -    u32 jtag_id;
>>       u32 mfg;
>>       int ret;
>>   -    base = devm_platform_ioremap_resource(pdev, 0);
>> -    if (IS_ERR(base))
>> -        return PTR_ERR(base);
>> -
>> -    regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
>> -    if (IS_ERR(regmap))
>> -        return PTR_ERR(regmap);
>> -
>> -    ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
>> -    if (ret < 0)
>> -        return ret;
>> -
>>       mfg = (jtag_id & CTRLMMR_WKUP_JTAGID_MFG_MASK) >>
>>              CTRLMMR_WKUP_JTAGID_MFG_SHIFT;
>>   @@ -198,6 +207,10 @@ static int k3_chipinfo_probe(struct 
>> platform_device *pdev)
>>       partno_id = (jtag_id & CTRLMMR_WKUP_JTAGID_PARTNO_MASK) >>
>>            CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT;
>>   +    info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
>> +    if (!info)
>> +        return -ENOMEM;
>> +
>>       soc_dev_attr = kzalloc_obj(*soc_dev_attr);
>>       if (!soc_dev_attr)
>>           return -ENOMEM;
>> @@ -224,6 +237,20 @@ static int k3_chipinfo_probe(struct 
>> platform_device *pdev)
>>           goto err_free_rev;
>>       }
>>   +    /*
>> +     * A NULL handle means the soc bus is not up yet and the attributes
>> +     * were parked for registration at soc bus init. They must stay
>> +     * allocated and cannot be unregistered, so there is nothing to 
>> undo.
>
> This seems really messy, the only time drivers need to deal with this
> early_soc_dev_attr hackyness is if they can register before the soc bus,
> which only happens for drivers using early_initcall(), but that is
> not the case for either driver using k3_socinfo_register().
>
> Can you explain why you added all this?


Hey Andrew,
A miss on my end, I was trying to cover for an edge case which won't 
happen in the way we are using the socinfo.

i will make it unconditional for V2, should I add a WARN_ON(!soc_dev), 
in maybe a case if some user in future does an early call anyhow?

Thanks for the review.

Regards,
Moteen

>
> Otherwise just allocate soc_dev_attr using devm, k3_socinfo_unregister()
> action can be added unconditionally, and only needs to call
> soc_device_unregister().
>
> Andrew
>
>> +     */
>> +    if (soc_dev) {
>> +        info->soc_dev = soc_dev;
>> +        info->soc_dev_attr = soc_dev_attr;
>> +        ret = devm_add_action_or_reset(dev, k3_socinfo_unregister,
>> +                           info);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>>       dev_info(dev, "Family:%s rev:%s JTAGID[0x%08x] Detected\n",
>>            soc_dev_attr->family,
>>            soc_dev_attr->revision, jtag_id);
>> @@ -236,6 +263,36 @@ static int k3_chipinfo_probe(struct 
>> platform_device *pdev)
>>       kfree(soc_dev_attr);
>>       return ret;
>>   }
>> +EXPORT_SYMBOL_GPL(k3_socinfo_register);
>> +
>> +static const struct regmap_config k3_chipinfo_regmap_cfg = {
>> +    .reg_bits = 32,
>> +    .val_bits = 32,
>> +    .reg_stride = 4,
>> +};
>> +
>> +static int k3_chipinfo_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct regmap *regmap;
>> +    void __iomem *base;
>> +    u32 jtag_id;
>> +    int ret;
>> +
>> +    base = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(base))
>> +        return PTR_ERR(base);
>> +
>> +    regmap = devm_regmap_init_mmio(dev, base, &k3_chipinfo_regmap_cfg);
>> +    if (IS_ERR(regmap))
>> +        return PTR_ERR(regmap);
>> +
>> +    ret = regmap_read(regmap, CTRLMMR_WKUP_JTAGID_REG, &jtag_id);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return k3_socinfo_register(dev, jtag_id);
>> +}
>>     static const struct of_device_id k3_chipinfo_of_match[] = {
>>       { .compatible = "ti,am654-chipid", },
>> diff --git a/include/linux/soc/ti/k3-socinfo.h 
>> b/include/linux/soc/ti/k3-socinfo.h
>> new file mode 100644
>> index 0000000000000..487e69d0069d1
>> --- /dev/null
>> +++ b/include/linux/soc/ti/k3-socinfo.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __LINUX_SOC_TI_K3_SOCINFO_H__
>> +#define __LINUX_SOC_TI_K3_SOCINFO_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct device;
>> +
>> +int k3_socinfo_register(struct device *dev, u32 jtag_id);
>> +
>> +#endif /* __LINUX_SOC_TI_K3_SOCINFO_H__ */
>
