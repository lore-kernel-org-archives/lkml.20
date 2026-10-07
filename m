Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5039524E;
	Wed,  7 Oct 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390338; cv=fail; b=A6o+WxSYZIghwctUjIa5SbnzAUs4CNqYItgSwEmhEjcjVAIFNEHgHj5ql2J3HGtprHr5opdauyjxbJlRjILGYFdarRzQuGHOpZ85gBXuvtekChrMXZX4AIXv9znqxPnryPLbYrun/TsupvknxunNI0ts/bFjSuGrn45tkdlOHYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390338; c=relaxed/simple;
	bh=LUvI9Z3/ypUFlOnjaMoCywivbz0GgNayc+TxvwwKtmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r/QUotbqMTvo7EXmwxkRp30kxlLFcPdGHRkbYMZ90Cn3wXilaETjBZs8d/2vCbV8q1S5cp5//tFRjv/fkfi3sFn/C/jtg0Nsxd8wcbdSCDvA4aXhSrQx0arNpleNDkRW4g4NZBkNLYxKNGFkmLAWHGs3mt17L9kZh54MUkt2AtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CkV9BmuV; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=mmjHVfcE; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CkV9BmuV";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="mmjHVfcE"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697ExGWg1055577;
	Wed, 7 Oct 2026 11:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yM/HRPz64TLoEybITPNyYwu3iP6ebDyOnq2srcwix
	cA=; b=CkV9BmuV2v/jUCq72Uv8Um6YMMdK4KtZ6PfehjK9VUz8c7c7BdPN9aFeT
	5ZVLOOtD2LlI4Ng1OFOeOnRuss8WSdUfNvh+d5iC+TrRJDBrMJtyB4XbBFYe4QON
	Gzems92hWsIUNBWlmer1PIvPIXhGFsHzQNXV4HnrSn0n5RV3Xi9sDS+/0akZ2uBo
	phwDpYZQi6zH9gBw86V8eS96DHG++bAE7Yo57/95hFwOTISlmKX+dlwTAEDspIUh
	H8SkvvewSQrPsYjigTDrdysVRjNp+bh3Ha5Q9vtobCxK5ajGDR2aWP37wkBoqeMO
	NiLhk//3PRI886b0amFgVxjFjxamg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5d5nc191-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 11:25:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W59JQ3Rya65IQVcbDxrB1z/VbA0TTWTn46Ah3akXx4BuKDhGmzH3/hrhupwngz2XSG3bMld8RI21XvAVhoB+dNPe3tHCosFIjAddfkJacg6lV//Yi49xeIF2q3b5LcfUTyo6m3c6rBqH5y1LgnWjcTkjNEyftHPtlp1uSpIDOH+kXOjp1zTlHH8mRSW678KorIEJhiuZWsYzeNrjcwxBCjzC3x20a76hK5sdUA3TqxdxbLWY/fxGrRm2OMT7Y2pxJcU2zRp3xP9d6eeGj5eypJJBMOk2TRQl1F4WvjGz+ns1JeapMUuS3De/rHDTdSZ73Wx02owO7IbMS690ad086g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM/HRPz64TLoEybITPNyYwu3iP6ebDyOnq2srcwixcA=;
 b=T9ZeOaFDsq+3hO31hfUwl3NTXqwunxpBMcacTzEWhyM7kxww+rFNsNmcej4gzzeWD9L03aENJW4FmToeuex7qgrZuz4EV7c/xJ9DNKo8w4Wf7dEybeiGkwiw69aHoyKRs2xkiw4KjRMP8rn39R+SNEDVT8shbdqjOskdd6wlSVxd5ywkxv7ZwqU4owJuABXe/tyb18QHVbVSb87ghbMG6Ewwuv2d/3Vz3Erxzm3T7Fa2Nu9Xq2YMkYzaoH+Ek0Ft3bbIqY8bA0IdLAcSg7UCYWKnGYrYblznKOyGrz0xq8KpZ3/ZpKi5P7U65mMbdOkpGlcsq87xQYVF4luVm73AnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM/HRPz64TLoEybITPNyYwu3iP6ebDyOnq2srcwixcA=;
 b=mmjHVfcESjYhaouI+mbDhiRqWiAxhLGrRQmalApup/8W3bq/g681kBgNl3+OsW0UOHpRXMwdxgSRc5twMMlQzYUIKxeXW3on9nmskb2IBn7uJa1Zc4E3wOIFgUquBcKTZIddYihsJm1pGPZtYPbseMn2JTMPjYdLbIt7kqFt4Cg=
Received: from CH0PR08CA0004.namprd08.prod.outlook.com (2603:10b6:610:33::9)
 by MN6PR10MB8165.namprd10.prod.outlook.com (2603:10b6:208:4fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 16:25:15 +0000
Received: from DM3PEPF000265B3.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::3d) by CH0PR08CA0004.outlook.office365.com
 (2603:10b6:610:33::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 16:25:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM3PEPF000265B3.mail.protection.outlook.com (10.167.23.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 16:25:11 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:24:37 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:24:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 11:24:36 -0500
Received: from [128.247.75.1] (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697GOarH1501867;
	Wed, 7 Oct 2026 11:24:36 -0500
Message-ID: <9de14dad-f876-4320-9b1e-7037f8182fad@ti.com>
Date: Wed, 7 Oct 2026 11:24:36 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: wave5: handle decoder runtime resume failures
To: Jiale Yao <yaojiale02@163.com>, Nas Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "Hans Verkuil" <hverkuil@kernel.org>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261003080853.430099-1-yaojiale02@163.com>
 <20261003080853.430099-2-yaojiale02@163.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20261003080853.430099-2-yaojiale02@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B3:EE_|MN6PR10MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: a58b4b68-2e35-4bf2-afdc-08df248f8f9c
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|3023799007|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
 x81iuY6naVJUz+0TOhoYOu/4Lgqhn/W2Xd2UhvjZOIsb0evLD1cnGqZC+tW6Z/XVWbkqfQESRJYx6YKUSfmsDLWqJf5+Xml9fPeyixm5P0sP23SNC57viYmDJ2bq+/yfVCnU5WnvYimIy05qg1akUrlk0KkboT02OKkpmusimbMM4IWG4Zh4q/IJxY9jP35+Jn3hD8wkFfj/UZrYeLoAkeoX7RAbeTTklquU4PqNLYNhuOM9q7TCrZFjc//5363I9Msu7ToU7WFAH0t61dWJcxAlZpKC+gI+3LvdlUXG2xXYrprGJ3ipS0dwYB/fpMYqzCpgDjyhBysLZ/n5tVAxlcRqmi2sPCX2UbAGFba8taFWKIAK0WGKj04Rb/Q8FT82aMzRcBz2mKG+Vsch8+Td3WUpmaG8NBgcugchUu643Jgv6+Q2izzFJvBlTA4GR1u9Bw3V7wUFLAxFQzA75HjsqXCL3JHmGue5sWxrk9ML7p008aj2VPvTrRDtsNsPl5B5t4tN/pU7jHuJLIfslPgGmls54VeQ6Mni1odoJCyTeDn+XYiYVAVHeLzmahg+6waiUMfydt53YkZ0UBXVbAmt9DO05MM0ezvgBxpPE+gaHfLeMPtqPvdxpDOUmrY9juTEkzPFvD9WEB8EgCWznHwKUg==
X-Forefront-Antispam-Report:
 CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(3023799007)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 fCpH+JZ+vZ9tvF+BDxb5rDFqzjAQgKqUv5+DVrxWLvQd5oTpd7ZeZaA3PukMdxi3l8jc0y7H4eVLk18IjVpLyIHtbGg9TYM0jLWWHbvQErT2amoYOeI6hRoREDFZFn8M9SyCaSiECglLyBgFB1VAu0LGhWRqxlonEAW1xXw6eIWvz7tcchXbkbyyfaFI6TkiIXuyJ+Ic9ELZ7szjnoSbxkqAnXhLHjhYFzPY5kfFfDoeOd6S+g2tWh68yo+jIwvswg5hv131KZOJ5aePGB07QSsVSyOue0kjdoqOJgJSiqwJbU/EdX3mroT4KgA1AtoK8bT+MmLr1VEHwwkz+nxsxYEgGxBSbnz9HW3MQiWPWMcHXVRMK5gIOVI+oiFZHlUSOg0TrP89FRb4CtS5ZxCZYrEAM42g6YQYYpL/tnrAc8ifvmUI+SfkqtovmF0AaAj5
X-Exchange-RoutingPolicyChecked:
	gY2iFpSdPGgwb0Zc65335PdnDyYnAbfhYMd9fql0osVSw0ACNQpyFsIyUXmkkQIUDLtf8X7kKHFApunGbzxaVj097SHWPCoitaE6d2qRHFHKBB/NbPBYSB/o5aIfJ1C3zFYeMLP1xlI5+8Hr6XOz2JE8QFi88LK7SBAZZPeDTonaAJX+rej0DBuQ4RklkcjtQngZUXwbOOJRWkKow7DhZFRHAhQ7JdAk6BTd/xwVsHLHnmxDCXWqz+jKDEWVnxgxKNND2Rx/Ot/8oJdihDcu9YCvKujMNvwapE2GfoGAGB9uoPEnn35/JevCz/vy1/HJUdWtAqLLaiesqu63cgJKjw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 16:25:11.7335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a58b4b68-2e35-4bf2-afdc-08df248f8f9c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3PEPF000265B3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8165
X-Proofpoint-ORIG-GUID: Ep6mFXdyIDZz4usSVsEiLDfujxlDVs5c
X-Proofpoint-GUID: Ep6mFXdyIDZz4usSVsEiLDfujxlDVs5c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NSBTYWx0ZWRfX7Y8TJwhuFuO0
 ggaE5J9EYihk3blrm+OVEmnplQsYGgh0wIEaJpfq7Iu6gpVWsP/4esR4ph52/8h8mBMdsmXrFl/
 AYR1xF9vgCb8+MHEkperk1EMuQgpv044bPefcVdouTFLg3P8N/8cFmcfgMTFhvyYMy9pjS7l7sQ
 OUBHWzoaFF5HanfFf2v6KZIknqIeCkyybZkWYjC8jVI9nFzGrnYBPKzdMZLus5UQzfqJ68z16tW
 eg9UMXvlk7G+DOHKK8fLHANO7et3A04RuJSkg2HppiVy+5QH+KQAKl6jwLS8PxaDMj2w3otjkzD
 DWhUjmImN8WLcTxJ4Iw59YbcC13VP1ksmpeohQhyo6HnDQ1tlknf1Ofaq6QfBV25+0ricC6SwJI
 ey1Fig28jHg58SDORE06uNo3xI/L+oPHGcm2a2zbel8sdCL/Gq1EiUHhYcGrTrwjdkSpZO0Hb3P
 wGBxN80bfgAg4EJ20nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NSBTYWx0ZWRfX8I+1KvlpDIR+
 1aEyBlRBDnRHZKLTS9cDUP2gM0d+EJnAJb6rWf5ValaqZ9Kk4kdGOoTf8HmS/HAikA1pWEJzU22
 Xl41hG+HUONvwgFYxbrBiOON6QMj+iY=
X-Authority-Analysis: v=2.4 cv=S81MU4sP c=1 sm=1 tr=0 ts=6ac67277 cx=c_pps
 a=AKd2An130fSphkJyqL6rzg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=xq3W2uTSAAAA:8 a=pGLkceISAAAA:8 a=Byx-y9mGAAAA:8
 a=Ry-OlwSzUFJlPodyGRIA:9 a=QEXdDO2ut3YA:10 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070065

Hi Jiale,

Thanks for the patch.

On 10/3/26 03:08, Jiale Yao wrote:
> Several decoder callbacks continue into firmware commands after
> pm_runtime_resume_and_get() fails. The runtime resume callback can fail
> while enabling the VPU clocks, so those commands may access registers
> while the device is unavailable. The matching runtime PM puts can also
> be issued without a reference.
> 
> Check each resume result. Propagate errors from callbacks that can
> return them, complete buffers or jobs from void callbacks, and avoid
> firmware access and unmatched puts on failure.
> 
> Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
> Fixes: cbb9c0d50e47 ("media: chips-media: wave5: Fix SError of kernel panic when closed")
> Fixes: a52e6f7923c1 ("media: chips-media: wave5: Resume device before setting EOS flag")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   .../chips-media/wave5/wave5-vpu-dec.c         | 55 +++++++++++++++++--
>   1 file changed, 49 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 6564cf3ec739..467c68931e8d 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -829,7 +829,10 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
>   		 * accesses VPU registers via send_firmware_command(), so the
>   		 * device must be resumed first to avoid an asynchronous SError.
>   		 */
> -		pm_runtime_resume_and_get(inst->dev->dev);
> +		ret = pm_runtime_resume_and_get(inst->dev->dev);
> +		if (ret < 0)
> +			return ret;
> +
>   		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
>   		pm_runtime_put_autosuspend(inst->dev->dev);
>   		if (ret)
> @@ -1302,8 +1305,14 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
>   	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>   	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
>   	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +		return;
> +	}

Above was addressed here[0]. However, linked patch uses vb2_buffer_done 
which seems incorrect to me. You are using v4l2_m2m_buf_done which is 
proper call for an m2m driver. You should rebase this series on 
media-next and you can add another patch to fix improper call currently 
in upstream driver here.

Best,
Brandon

[0]: 
https://patchwork.linuxtv.org/project/linux-media/patch/20260718130037.3306626-2-lgs201920130244@gmail.com/

>   
> -	pm_runtime_resume_and_get(inst->dev->dev);
>   	vbuf->sequence = inst->queued_dst_buf_num++;
>   
>   	if (inst->state == VPU_INST_STATE_PIC_RUN) {
> @@ -1386,7 +1395,11 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
>   	int ret = 0;
>   
>   	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret = pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
> +		return ret;
> +	}
>   
>   	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
>   
> @@ -1550,9 +1563,28 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>   	struct vpu_instance *inst = vb2_get_drv_priv(q);
>   	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
>   	unsigned long timeout;
> +	int ret;
>   
>   	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret = pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +			struct vpu_src_buffer *vpu_buf;
> +
> +			inst->retry = false;
> +			inst->queuing_num = 0;
> +			while ((vpu_buf = inst_src_buf_remove(inst)) != NULL)
> +				;
> +			inst->eos = false;
> +		}
> +
> +		v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
> +		wave5_return_bufs(q, VB2_BUF_STATE_ERROR);
> +		inst->empty_queue = false;
> +		inst->sent_eos = false;
> +		return;
> +	}
> +
>   	inst->empty_queue = true;
>   
>   	timeout = jiffies + msecs_to_jiffies(VPU_DEC_STOP_TIMEOUT);
> @@ -1669,7 +1701,13 @@ static void wave5_vpu_dec_device_run(void *priv)
>   	bool cmd_issued = false;
>   
>   	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret = pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		dev_err(inst->dev->dev, "Failed to resume VPU: %d\n", ret);
> +		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +		return;
> +	}
> +
>   	if (!inst->retry) {
>   		ret = fill_ringbuffer(inst);
>   		if (ret < 0) {
> @@ -1812,7 +1850,11 @@ static void wave5_vpu_dec_job_abort(void *priv)
>   	 * device must be resumed first; otherwise the register access faults
>   	 * with an asynchronous SError.
>   	 */
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret = pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		dev_warn(inst->dev->dev, "Failed to resume VPU: %d\n", ret);
> +		goto finish_job;
> +	}
>   
>   	ret = wave5_vpu_dec_set_eos_on_firmware(inst);
>   	if (ret)
> @@ -1821,6 +1863,7 @@ static void wave5_vpu_dec_job_abort(void *priv)
>   
>   	pm_runtime_put_autosuspend(inst->dev->dev);
>   
> +finish_job:
>   	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>   }
>   

