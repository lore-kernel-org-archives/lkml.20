Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA373AA518;
	Sun,  6 Sep 2026 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788701989; cv=fail; b=OcnsHqf5dy6GSiLlmO6rOKE8sX/2vynbB4tuI7/chYLvicyTgc49+xRswLmM5boV8zVWuBpUB1kpIHD18r8q56g5UBUpIfPygKySmZRFfUp8/p6RfA2UFOshkRt3+dRuqIIQXKrK8uwtQvQ2NW+4sa5vdHo0gvOf+OSq68f7aps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788701989; c=relaxed/simple;
	bh=nHLnMRTFpt+a3wmzZGamuFfEIoJKLYD4d2R8by1G9ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PZVfQQHh3sR2jPBdrXOijXNZheMSlR8Sym7vYTVeJExhHR+Uyr/JWxxn82uMVq6XHmZ1NIjAztxozVR+/zfI2iiTi9HwR2WGj8Fc0sjMusHwJrHoxUV9hIbHT0XmzWvGAlPrtY4VPlwN0J7G8yw3EMQEfTd9A/Ns9ESQ3jVPDQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=khBBmkLG; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NysHj3n4; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="khBBmkLG";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NysHj3n4"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6865dtE23829171;
	Sun, 6 Sep 2026 08:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=k42i4GdT694l3wr3h9u6Ls+QTqJ6MSjenBHRvQltr
	8w=; b=khBBmkLGHZTMXhh1A4zsHaIddi1IyceseEV6BY1ofMO6La6SlQgeehGrd
	c54X2hqniv4UtllVITfxmqq/ZYwwbHX1H/kTdgHOw/jXmlVxwNLuUPm/T8vdnt9e
	ny6yBPSDhb6CCc3rQzIz3ZOsPjBRSDZ5lF3zsGxN0HMG0ryZ4E116y9c1muCUjCg
	/OQGvadSAJLpT6gtFDLF/ziQVv09QOGnaU3en77r++qkBnjXBsn3dhxGAjcqQSkV
	8DBTnLMEvREnXdDUOJ/+IqT3jqKlCy+grsaTPaN9JuD6m+24n7I63WHsFu8U9s2g
	OTrXTrPbdS4nSbTcgFK46W4O+B1fA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013052.outbound.protection.outlook.com [40.93.201.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh27q12sw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 08:39:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s50rhc5r8KiOpgYyHUWSnTR3qGavRdNmN8AzIVmeXjgu8ft47AQPxEwx7hhZDjGCCxuDRa0W/W0Fula9vJuewwwu5JoT09/KrHAv91G2iCNeGEODDciAcI5cEObzUmVhESeQDBuJl62ZjLGs7lfvehoDZKZOKdxqje+p0DMTFldifz+E/T6PszdgPN4+scOJ68r4jFY3v+sE0DUf+F2PbmsaBtCrrphwqEeMjIF9aeR7N4XNASEWuUXxS0HFoX3eurmbRiscF1rf7xuVoJZlqlOC+NQUC1HIA3nWkenfBJJMwUOSao5q/7Ei0hNbYKdsa2l+ZVnHAVW7u+QqmXWvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k42i4GdT694l3wr3h9u6Ls+QTqJ6MSjenBHRvQltr8w=;
 b=bjdAVgKp2viliPp26khgSBvqVf+j+/6lW2TgxpZc/pobHQmSfHTQGZFyPq9Ftae41t7pyP5v9TNzMbNj5a9Z6BG3O37vVd2rTek+h0vNm7JJLdq+V5Ih2tbXlPrfmQ0h4yjQP7zSf1LZXoKD8rKec0uAzD1pujxJRZBE4Iyv76Y1ylkNjNIWIhkroTpyYVCa24+4bWezYkPQY1V9Bif611wOK4au8BHIwVh6gJsp4e+1UJLLRRbZSef0Dv3qzTFnYgABUtnqr03lIC5zDAj+37lgzlGLgmBJb6F8uYdT2uilhXoZwsH/Wr2n25b6WLTNLMLZk3mqzYt6NdErBQdTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k42i4GdT694l3wr3h9u6Ls+QTqJ6MSjenBHRvQltr8w=;
 b=NysHj3n4CEh2PklyZoe4flHD1yUtKxRGoz4/Yw4m+ei4Op7AogFAPt3qfZ7+f5Ye9JQoPl1ffd8ct7SkVXdBZq4MQTtZoy6kdoZN1WrpQQYhGmQ+HHeuS75lNvvL0D93UL3PQwq3SO8H1OErgEG0tExeoaEs3YINjcLAx21Qc4s=
Received: from MW4P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::21)
 by SA1PR10MB7853.namprd10.prod.outlook.com (2603:10b6:806:3ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Sun, 6 Sep 2026
 13:39:34 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::5e) by MW4P223CA0016.outlook.office365.com
 (2603:10b6:303:80::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 13:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 13:39:32 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 08:38:52 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 08:38:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 08:38:52 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 686DclwC3911437;
	Sun, 6 Sep 2026 08:38:48 -0500
Message-ID: <f49852ba-c484-4703-9f5a-457443bd4942@ti.com>
Date: Sun, 6 Sep 2026 19:08:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add DSS support for AM62L SoC
To: Swamil Jain <s-jain1@ti.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20260811130822.2324438-1-s-jain1@ti.com>
 <5727ba42-4469-4a12-ab70-9f85089dc6c1@ideasonboard.com>
 <25d22caf-c971-4a6b-887a-7770a0bfb6c4@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <25d22caf-c971-4a6b-887a-7770a0bfb6c4@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|SA1PR10MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 846c8bee-117a-4102-fe80-08df0c1c48a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|10067099003|3023799007|22082099003|18002099003|56012099006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	TQWfU3JJZCn+XQzlsiwALpaZ8bHWe5tGN2YFJGsDLPSzuU0zHBvcoEeUVKAG8VovKoirJOivj+LEc69KbUn5F+crreKE67n+TMcbm8nNLFaijego3c6On9pWdL1kT/gNtFvcvWFrgIimxqROzFliSjTo5xxZyuhfgCcdgHzy2UhyzalOskCSsF7NOw2RY5+zsxCkfdNsfaIvoWwk82g7Ge+oWvMidOp1sr7WLmP95xO0xbq0MimjNatcz27u+fy9cTIKrsGJAyT1UNszMaT7W++8hBQ8ANUrism2wF4VJITawl3Q1fzzcGYQBdBFzdLgJyHkyE7ceDU9RGsOHRXE9O9xe+VpBP+/A7TxjyAxZENw77CZ1H+4CeW1b20SjR4MKQL/Z439C5IB01ZrDRyoBWg/A/8xn4Ncv10Rx0CTslVSQvFv7E4n1n306zOalN58zQF+Pnx8+EesZyESAZapL1HF93dE7LNwSQMYR1K+Bm2e/KS2UBDt9odsw/Jz0gVW+hgLeHLf1SrL6a0DFTVrCKyBCMNJY5HPyOfsf/OajxmCmevuFpJCjj8eVz/ZiUdYE3b+t9ktwLgA5rOFkRLtGrGSCvtVY4tDbyl7uZhqSJ1ne8pJoD7QePlpsLvqnNjWYe4b2ZlD1hK2GrDSdGzBV7m00lz4xWdZoI1M+xz2+oMQVQtt0SFKXS+dm/uhbLyh55LoNG3vDKT28HSd5lDp1g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KWP+kETmzpvMTFE8e03Aix7V8/lDT+Fh7DNshZ1frsm9viNGHs2BLpZehr+RrDz6yGGv9uLdASsrsQ49Rdu7UlEmvxH/YrPR3eUCJ+zKoPAtMqaOViMbND8f0VbpcSsGyS1ZYoQSTxK+OuCGfu08k3gwrQA5QtMgsHbcrCLsz1uJQhOh+fMDCgCCn8R9l5GDOIhQtk2MDaQBGg7pSTz3BE9MnSce2r3jZ6yjAD0ZPyL0nO83NhuUp9NUNaVoGr8SSojiruzyZOtTYx3uMWByuir+qcUI/8/RMgRdiIth0D3G64rrxHhgV+2Ln7bmcB3I2LoiQs/igcizoSi2ciMA0iUOo8sQLxr1dy6bPHtt75qKPmFq6smV2MfI8Njmjq9FmiNC92NHjFw4C5yqJZj+DinD4Aly2p9LAKqBdyFg1BBWwvCh4Om+kxdFBf4lZojT
X-Exchange-RoutingPolicyChecked:
	RHSsJfbfMklnn5U7LDi5pczylJqqbbMElI1xUIZbCfM30mnueRLOf15zH0BIBpZTCUu09unng/fZCk8Y3uulRxJkqPPrvLb6XX1waAUZU3jTVmSLhXQrMdvNktIpd6kAJNLqMRHgQD6tyC9kPzdhBZTjfGrtsH7PBUhovW+NMRoMvbDKZ2JXL7gcgPnsZivri37DC2MirUas1h1oKQOhl7EdexsWW9B32f3AdvBihzEt6xFm3hjJ1412ffCOZtNKlChr9+cnSTfU8SA5778Qw4GgmLqFj2ziDBqxftKUN8skv/CMKgFioQopmGmIa/Rl58aZQL6Sm35sQRBJ6Lw8iw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 13:39:32.5645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 846c8bee-117a-4102-fe80-08df0c1c48a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7853
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1MiBTYWx0ZWRfX+OLPzfRvu4pQ
 g5HoTE7nZmKjxw1ZZCGfokBh3OUq55/Cac7Bd0iL90SGy/EgW+Aq8ewH4b87pwYeRxB/AykkkpA
 TMhDFM1cKdSoFaV5u/b7rpuXiO76yqmrscu+QWOoHU86XOL8wtFYPIilUYFVHxp6hdgyPVOeYPm
 K9AjohZi50jxzAiu8cKG93/GflD+1LAkD5DKcr6wFRWVdD4euCUq+DapaDJj3eadN4j+Yfk4B/L
 ExUC9fhgXpAoh9YPLLv4L/WITGHdh9I2X5OwTcSF34ic0bReEAX4l8GdcLSHFGBZOCKVn/r5s72
 UGU4bH1xIGaa0RDvIv9N64p2p/uNe15j5jZAevEeudn3fAmBmTNCgygNUNr7Z44pHg5Qdua/fpP
 nz5r0N6DR6bM2J1YlQ+Enlyv1tcl9dcwnhVH3f7cbIszwfRR63WJqtbbeDf3VKx3PXvdgDvnuDW
 w4NSaxjrROqhiU7b53w==
X-Proofpoint-GUID: zPBdP2BoDaBwaHsQ0HzK37z8cSZfPTpK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1MiBTYWx0ZWRfX6xJYjiVHTeNQ
 7RxENMmHIeW1nKGXP0QE93RRBtDncsmSx8o/9b6XfalvOOHiK3xT3cV0NLOr8nVT97uWx3rJBZh
 MnAKiG3Owe0MK9PogZxk7p36VUVPAxc=
X-Authority-Analysis: v=2.4 cv=e/82j6p/ c=1 sm=1 tr=0 ts=6a9d6d18 cx=c_pps
 a=MYN/bj0IIkanzoD+9X5qzA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8
 a=3sG1UfLu5leUIEMgcpYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: zPBdP2BoDaBwaHsQ0HzK37z8cSZfPTpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060152



On 9/3/2026 2:46 PM, Swamil Jain wrote:
> Hi Tomi,
> 
> On 8/21/26 14:32, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 11/08/2026 16:08, Swamil Jain wrote:
>>> This series:
>>> - Adds base support to enable Display on TI AM62L[1] SoCs
>>> - Adds base support for DSI output
>>> - Enbales HDMI output out-of-box
>>>
>>> [1]: https://www.ti.com/product/AM62L
> 
> Thanks for reviewing the patch.
> 
>> Do we really need bootph-all? In any case:
>>
> 
> We need it to enable splash-screen.
> 

Then you should have in ports too

> Regards,
> Swamil
> 
> 
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>
>>   Tomi
>>
> 

