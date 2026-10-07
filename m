Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3293ACA7A;
	Wed,  7 Oct 2026 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389772; cv=fail; b=S5hlFA4iRMEZ52VQzB36tzAPSK4/qRvLWhNTwUJAm4i/ONhHSDaXDTyvhH5Fn8/1MMcqj9CwDNe2rCeUC+xybOmSlUnvcRob9ZpC325TP1HBZMu2GuwgddEZ7q4NMwlK9A5Kpl5VtS0fesY1GgeLaijvsTzBzbuJh4qVd8jf94U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389772; c=relaxed/simple;
	bh=+GWt9v8YyG+5sEdSzcJMM40RGG19p6YTROym0OMVAtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EFyVxNh0fz3TAtT+u+GuXaLSn3ag6SsBK76aZ1rkRtOUcEPDZoWydItWknOmfTQUxSqsQ0x4EO/E9PoceaUOEH98pxO9XSpXRLOFuGgeXWwNhxLE+LIhUj0W9Gsz/Wa4cWTJ18UsHi/kbrakSB42uhcebfLMXUz/axwMh3KgttQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=d6XSDj9R; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=A2F9wnwZ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="d6XSDj9R";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="A2F9wnwZ"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697ExFaU1055556;
	Wed, 7 Oct 2026 11:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6spBliIDtf16/WuAT4zEAkhxGHtR/1aLlJlEqN8tq
	RU=; b=d6XSDj9REM9LnRHZDBQjZHW2AsVjBl1DnHnA88aax35t2WSUWTYTvwhxB
	dBCch6uKevPpVajZ1VUsw72Oj9rsmpHNSQxUPDXTw+J/R1yZpg+qfEBf7uT1YZ4O
	HN3ulzRtAbZnJ0jrBmoAN1n6ioLbE8s+fUYfs4HLtH0YmjD61rNuo6MfvFZbLh1J
	M1R2fHbARc+MqK0Za/ZRcxuucWjwmXitBBNDBcLF9j1k7cGn/9V+oepNtioI9dXF
	ucHzau78Thi5RmBKAjV2agoBg9uP3IQW0RTT66mliOhacC99QNDGyo/Rieo4C05H
	4+mvgYPDPmkyo6C6g7EKDTKl8eT1A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5d5nby2f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 11:15:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpDUkENEXUMXh/eDSw2s9l7BPLQHShA54uJEzwiqINserMBvv+tL+4Bbhst4lYXPB39raUsdtskVcMbh7TMJJ876bRYBXxnFvCiSsyfAl6G7BvoeMJ+BMa9Ug0gxbaYS5Hdjdr09dKwGVB0sKKsBpQtjnl/DMbCNgY9TiAJ1v5Vw1V2wg6jqeTUEGqoA4FbyJKgkyzwQbVPzutJI6K3qTvYd3DrgJ4R1jicayp/tw5vxW60Y2fWAHTWEkrbwxbgmLTY6znSMz2khTPnUway0klFNgn5iBwTCOE0dsfgQ6oVsbzRhP9G43qaVhA/OjHsSsrR0kY7fF0V8ZzdWWe5Hcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6spBliIDtf16/WuAT4zEAkhxGHtR/1aLlJlEqN8tqRU=;
 b=ZJJKBeleZGopX541wi2GAcgmvRQC63IzshKjRM361WgFvOH3kuCRFUmGi+dqt36VoPLryojApJLYgxJCDCcvCctE/C0gZ08y/FeUTeQIhsieVzEPfcSfsB1jXxuduOvv2gSOJZKRvycCk431O1ItpJcFxPvkBd/G9AHd0vhRtv0wizYHbCICuk7BtiBd4wutNRdUHu7Lo8E33IKf18IItlwG1aL9u6oF6IOA/aoFTdOzlsvIBTIXcxodxL+L5sYPcy0Etjd1TwumbXhdcsKeWlEYxS5jAuWRC7n1gdDRmaWG9U6Hx16Dpkh41PpclJM0FZkR2YcI88fb7g4+AXW9ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6spBliIDtf16/WuAT4zEAkhxGHtR/1aLlJlEqN8tqRU=;
 b=A2F9wnwZGMmiJfHjAy2tfffb3qqLejn2FGYk5eYrYsVc6uHXfYV7Hgi2cDPZIHRxHH+ipN1wDfPPjpMzrUtO3QkG8p8ht2wlDBbvIMd59CM9uLNDaVF5YViqHTCpuY65bs1l8jKMdBty+jTBDB6J9Mwg31hLK4WHrO1DUABpvtQ=
Received: from MW3PR05CA0029.namprd05.prod.outlook.com (2603:10b6:303:2b::34)
 by IA6PR10MB997680.namprd10.prod.outlook.com (2603:10b6:208:5dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 16:15:50 +0000
Received: from EA8PEPF00000007.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::46) by MW3PR05CA0029.outlook.office365.com
 (2603:10b6:303:2b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 7
 Oct 2026 16:15:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 EA8PEPF00000007.mail.protection.outlook.com (10.167.249.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 16:15:50 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:15:21 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:15:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 11:15:21 -0500
Received: from [128.247.75.1] (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697GFLOO1487227;
	Wed, 7 Oct 2026 11:15:21 -0500
Message-ID: <ebfa9a8b-89f5-445c-8d17-12ee8a830a07@ti.com>
Date: Wed, 7 Oct 2026 11:15:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: wave5: release runtime PM reference on encoder
 close errors
To: Jiale Yao <yaojiale02@163.com>, Nas Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Hans Verkuil
	<hverkuil@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20261003080853.430099-1-yaojiale02@163.com>
 <20261003080853.430099-5-yaojiale02@163.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20261003080853.430099-5-yaojiale02@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF00000007:EE_|IA6PR10MB997680:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f001603-61a1-49df-6f96-08df248e40ef
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 pUzIz/I6ghQfreCz76ehShdBZn+hWiZT/+zKW8YjgbT6vGhr1/z0X5wQxn66PS87oFy2dxMTSwgLYkHpWdLaRT6KUuVZGJKzkOb5j3zuXTNQP9TxuujSlpyACGPbNUbqPEDlPN4Ax+CnZoYFkGccz7NLcC/dcd/o3iKDgTPcUGk8MG3BMePKNns1dRVAldCJIyR5/jZW+MMERTOEBBlDvslFGA3MB7EfOy5fbzwlHTgKnJtpDHKQu2X4HRvFhG3vRZkCm2j1jnCOmkabxZ8NDtXk70I7+vsH8JBPidWoDr8Gcp/3aYu2uayOUcCCn3TgaJVjh/gvAJ4N72bTFRb/ai/BTnRpOW4pJegDUe4kQP/4lTioZ3v57n0IQdg0WIEusZ1+Y8I0aJbnRryXQrVsSGjZ5YfVafEJa6w7ZGnQeFrt7hjbnxygiN0QGYblQDvITZeiGYdpXKyLubXKSwhSRAUEuJxtevSFrIE2c/EOVm9tS7nG9aePcd7D1qr3V8C8m2EzFLHBODIsHz6T6D2QenfQkGj8t50PYgkL5/46LHlBqSMnF2zWQ+qAWm3NqCWqTtieb2nXUmiro8L5tx9dlrgmWqLrVs+C15zOkSLdf0KJERi3WO7neT1KXUAIe9erS+iG14g2nNM6MrqnXHFSrQ==
X-Forefront-Antispam-Report:
 CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 JgDrEDOBHfpUeBSaNlEf53+XAMkeEjhxIwKldNJH/lDfyiDKOebkuZ/cMi9wnn0/3U4ElAUK2meoXsznYbNd5IkDxsc9YKX8hTN7wORVUJzp99s9teUeFaJCp7ZT+zmbtTr54Dj1en2TTswWR3imY52csqNjumn+gAv/TRhrh7pE08VIZtN6B49Dx8l8DZUBl3Y5BJ8EK0LZpu4W91XPBHJn1ddR+EDnFvZm+6sPPKR4ZkfSnHGxFzI2rwv7zKdJlGK5KakFyzW3ft1HdugkTv7my88IQolfLf42uQ8ofRZT0glTaYz+vutxohVQLFQQU0xURR50bs6H0mC+XN+U2RwDbBoLxlYV13fz2bLV7mgeaalOM7SKez3OtLsJ16Ns6O4A++kDbJebB8+spl0Xq+y0ZTj/cDJ+F2h2EjT8sR6nCLdLkcWf2eQREy4w88uu
X-Exchange-RoutingPolicyChecked:
	oIgGOdqJZYXhb+lk15QQ6TlSDiKRssIa/biSLAL/T/o/0lVWFsa8RGtZuNR/3Hnfan9CZ/SiuDWuUw9iVYjeWzJLjLvyBpcg7d8zRYIAgAlM1b9r+dYkrNORovKdxEKPk5lzmI2q3mCv6zMp9DvFCSj6IAW+ECELLJ/hg4pWBw9rTrcCi0YeNSVww0391RQXu7SykIZ91rwd8ekySMHakW/LOi33Clt+hAQZJugqBstlD1GGg1km1J/OkX135k25j+0IhmSBnBirRXzkoi8xLcme9KlLQI6lb4YmDRBD+gVpJ3JN1ZKzeCQhfEgiMdfaPaRDTHhThM+We31J9SDohA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 16:15:50.1997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f001603-61a1-49df-6f96-08df248e40ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: EA8PEPF00000007.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997680
X-Proofpoint-ORIG-GUID: jSqkMTyZWMv15z57Qf42wMt3hEvGXaPC
X-Proofpoint-GUID: jSqkMTyZWMv15z57Qf42wMt3hEvGXaPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NCBTYWx0ZWRfX//tIWjt6PNff
 13efS9+lnhzFX/Rd4NqzP+RUUOQzktITZEUZ80ldIkTfMQA2ODLO78d+En00tg7rJZtdagrzyqZ
 yCrFG88ZTFxtew/L9sZ3+rFmmkjx/Y/Qb0TsV/Z9CzGFjG7VccyUIj30JHl0+tNQUE5Kuu8qs8B
 B2duMYt7EvNL5nhs/BIPhuLrpCQARVyB/xHNrIiuroezcnEKa+X/4GRokTUynSssJvKu6E/paW7
 9fQbUJmPhXJkw2Qtie33bEIdcudQ9/UM1SIFLvLrag1HucCJY8rBMuu7T6zfglWYURsG83IM9ds
 Cu6NLu3eDoa7NNTvSZ+NwLQegXAg+5ghmri53wh1dcNb5wUOxsqLPUCzDEK4AoieZOU+Wp5k+Yb
 xe0FQEk9JlJQmzjBP5UWNoq1cbodhXh3pVchUvuhlTk8ai3/zAfyY463342884ulcVnxDl4Ik43
 l+5mVqMgBYMUP4Z6nxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NCBTYWx0ZWRfX0We5VrsaO7lW
 O7a9dAoVzrozdZJxX8OC5G9ibP10vRoXyjSr367AJU3ZAv+rnPjrVoMn1oaOIwiIHXKlg/TZJYB
 5hEsqrvKXoptjuMaDmcGpTSHi3xV2YY=
X-Authority-Analysis: v=2.4 cv=S81MU4sP c=1 sm=1 tr=0 ts=6ac67039 cx=c_pps
 a=55pr0gqEmxT9FJl44qZDsQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=xq3W2uTSAAAA:8
 a=Byx-y9mGAAAA:8 a=i92EXho9ApMYDWYoLZMA:9 a=QEXdDO2ut3YA:10
 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070064

Hi Jiale,

Thanks for the patch.

On 10/3/26 03:08, Jiale Yao wrote:
> wave5_vpu_enc_close() acquires a runtime PM reference before taking the
> hardware lock, but three error paths call pm_runtime_resume_and_get()
> again instead of releasing that reference. Each failure therefore
> increments the usage count and can prevent the VPU from suspending.
> 
> Use pm_runtime_put_sync() on the error paths, matching the successful
> path and the decoder close implementation.
These issues have already been addressed and are accepted[0].

Best,
Brandon

[0]: 
https://patchwork.linuxtv.org/project/linux-media/patch/20260717075714.1508938-1-lilinmao@kylinos.cn/

> 
> Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index 42bc737c6980..062f0b5c318b 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -758,7 +758,7 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
>   
>   	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
>   	if (ret) {
> -		pm_runtime_resume_and_get(inst->dev->dev);
> +		pm_runtime_put_sync(inst->dev->dev);
>   		return ret;
>   	}
>   
> @@ -766,14 +766,14 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
>   		ret = wave5_vpu_enc_finish_seq(inst, fail_res);
>   		if (ret < 0 && *fail_res != WAVE5_SYSERR_VPU_STILL_RUNNING) {
>   			dev_warn(inst->dev->dev, "enc_finish_seq timed out\n");
> -			pm_runtime_resume_and_get(inst->dev->dev);
> +			pm_runtime_put_sync(inst->dev->dev);
>   			mutex_unlock(&vpu_dev->hw_lock);
>   			return ret;
>   		}
>   
>   		if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING &&
>   		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
> -			pm_runtime_resume_and_get(inst->dev->dev);
> +			pm_runtime_put_sync(inst->dev->dev);
>   			mutex_unlock(&vpu_dev->hw_lock);
>   			return -ETIMEDOUT;
>   		}

