Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE614F3925;
	Mon, 28 Sep 2026 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614905; cv=fail; b=VqsYP0VIKgPjFFACSiDdyqA3/6hM3+ivkJ9UfUGFdHPKb8eTb400xbbcUr3/+ZbqwKrvAsKXGBYXbbjyuqdyLx6OW8xDlLnL6dc12oC29ScUnHOy1DZFXxTQsxsuYjHdmjPaLiUwICCTBj40L98weZpZ+Wdume1rdCBdNMeFUoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614905; c=relaxed/simple;
	bh=9mgQmxsJ3TlLBWsN0f90h81h4ZbZl54ZL5VOMiFCCNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uIusnCFegnEJEUJQpzVqxRTBmOiZbJ8FUToQUeHnBNKn0J7SzxpzTKoScgOSYdZSJjnoLcJzxiQx6h0c6DXrKx1tHgfZc41dCtVppcKvhZX2qNcw2REpJA033tQkbYx+wF6CgX+npk+J4idAXvNDWOt8FqeoJjdm2JYkaLVcrEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Ouk8iqr7; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=MlEQlDL8; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Ouk8iqr7";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="MlEQlDL8"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68SFK1qf2811863;
	Mon, 28 Sep 2026 12:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rNM63FlV+KM0mO2eMHkGnJW0VbOkvUlfmNl9pSO3R
	hA=; b=Ouk8iqr7ek6WwHjbSMZB34TiFllRRnhvT/MGtcJRHU6lT/rkDe16BoJ0f
	S0kFYXqAHcX/QlItYjjxDQQyCSOKZWnxTW7l3UR4iA0Bs/EAlAotmyHrtRosk7br
	SKQpy1mR0DAjb2HF/OMJ4TT7iPJ3NAa773Z+m6UepF4gu/DRESw+hoMFIrSA81UT
	dPzvHv3uSzsQ4C+LS9t7yPWJoZyxYGtSj4g5fTiVGDJrgGURW1xJ954XG3q9Jq7N
	zHdO4SEWSYtPnUowsCBPelPv4NlNI0kYqnJh2meRQ7riRYRMss5JEBnZ7YWu7fpp
	oaj1xnd8sasgoRvEXaCN6tJ47YH3Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gy00nf521-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:01:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/2R6UUZ3tDYmH7UcYb6cgZhExCPcw/M/2q+Q/0dKpIr1mpOiNpYkUPj9gSoyD5hPKqLEn1hittxGn2sUm/BeK4I+n6LQhCjctUjOq6mZSVuT4/S8nj/kvtVj9s0Pe9De7xJamaCJY6LyIVNCjgWK34qznWEVL9cq0aAwFTC85yyVRhHS0U4dbya+/BOqvJKB2wBjcoFsPdVKVkcs5M2VZMelIGjn019xFg17HGtFWf/TZKzGZ07Nk/cRM3tX7teaKRFqAi6A9iH0WJITE0JzTYABQiki72yqdz9GkZvXgSFCxNZ7lfDntwV8iyXjwbkiqmMvQLWS1G6vCoeGUo4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNM63FlV+KM0mO2eMHkGnJW0VbOkvUlfmNl9pSO3RhA=;
 b=C7IFBBJu/IRqtTBAObjBN3E3zFMTd4oj6VkuYaJQmeOyesjSU/rpnK54HSxUC/G+X3Ujhywn9dLN9JeHPDZEgt+g1DC16kEI3jjltC34II7U4hUqmQprtciVGFmcGesqP7sZtRvG3TPyKd+5tWeYoKtbH4+tfbi7YIyeNVk0JwmNfSqn/XXy/1dfY3JkXQjIOhCPa05qEdqsobW7AsgPS0bM5NYYfd47tOvCW0pd2jgwT3cQfS+uStIJ3PvSebgZP5s2kEPKc2abhf7u2kwhrrnLZc7lIM6+V+uKyYRDT7Aa8F61Fc9cjqp/YptiDlTGHRtqfhrTOJ7lTVA8ohi95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNM63FlV+KM0mO2eMHkGnJW0VbOkvUlfmNl9pSO3RhA=;
 b=MlEQlDL8qNnlIizV6UBcpvhg7jnaXobtPcEIcURgZ2xiE+VHSstG5N4C4U8WTrsrMVUSTWnLQzaPOfc5z2Kw4oD3qQqTwp/WcrCcfYfl60ephwyYqs1W6gLQpHVBHxqzssZnhBsyEMnCVzLfUrhuJCR2aFmILb6YBdkldGal5w4=
Received: from BN0PR03CA0027.namprd03.prod.outlook.com (2603:10b6:408:e6::32)
 by DS0PR10MB8127.namprd10.prod.outlook.com (2603:10b6:8:203::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 17:01:31 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:e6:cafe::60) by BN0PR03CA0027.outlook.office365.com
 (2603:10b6:408:e6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 17:01:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Mon, 28 Sep 2026 17:01:30 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:00:58 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:00:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 12:00:58 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SH0wGT257432;
	Mon, 28 Sep 2026 12:00:58 -0500
Message-ID: <850e724e-539c-47a9-a284-2cc8d362fca7@ti.com>
Date: Mon, 28 Sep 2026 12:00:58 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am64: Set MMC1_CLK pin as OUTPUT
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <hnagalla@ti.com>
References: <20260928033027.1077689-1-s-adivi@ti.com>
 <20260928033027.1077689-3-s-adivi@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260928033027.1077689-3-s-adivi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|DS0PR10MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7c87c5-f952-4bc5-419b-08df1d8224ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|56012099006|10067099003|3023799007|22082099003|18002099003|4143699003|921020;
X-Microsoft-Antispam-Message-Info:
	hYcLANHUbKAuGDIYGlD/bKcQVFdRRXEl/NrwgkTT6+YJvyjNtVBssum0er3sWsWvygRQukG81eZQIJ6wL5mnmnpoD7skQbBW3pWzCo5TUfJzo+lCZ5le5JLAVsTjmyrjiisiBY89crapkqJS+iwHRAypZvMuku0rq7ksOCk0m0hDoaxY49RpYGepbacvYpAZBkYbDX4viQcSMn3514OEak+7lVAuwFcxo6hIQXoKtkILMcrkNaINEb9qTlfpN6O81AOvHYy+lVkEpnGOzmpq7CcwWE/gy2BROizUqRqBa+a4Mr8hlDTaCg0HNX66S6M1LB4DrfxRAtS1NWiXKGLcvT438qHWCPQdH9S8+eTHJExGobfzlybP/RPjGGBu5nMMwH0urwQ7PYg59NwB0oibFuV/t+TYgYkfN2qjx7Xo6wHNg2iNx86Dad0PNxdhDnhSBD9kamv3JVMf6xMylO2g28KLBOqqbEs5mK1XiiPGDCUYFnrDeLb4rA5SAQeCAYO/cY63jRhGPqT3lDEwWJN4vMD2SSJxMgJDuYCSUu3fF6/3/CxubBJP5a5ZSaYY5RXmchUyMMpc94/iXliM6P1brVN5cX0UB75shJp/uHUKNwZS+Mc0vwXLRCkUxF2iXjT8I02HBefEKr3knambKMtHN2jbHZ6ICIpcuuWSzgcK5Zb+nEyqiwCT4tBwUUeXhaAPzoZp5GXRtZ2XkTIpsAvGxS2GpGNEB7yqz07r9p9ArPNBLAhnW6DoEJqJFbFAXcQO
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(4143699003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zhqzg6fxPv/qqtIvoLm0gXV2ugBoUJ7M7Qn2L9H0gho5gUfb9p5dcwJB4aEF7EUNGvIhTZoPOuPG4aVsm9hUX8QE07FdiZNgRVdkqX2rsyZz09eu2yZJezOnSM+tsrYYKZ2/wOG70sjZPHVW8yJ5UMUEv0JwYWG97kJuHOOpzlhjNEwtux3B06nixh1Qj9eMYwygvdtpi7lpUztjrg2uR+JbLH/jEmXLi5JwuEQObgZeuvDOJDsizeAO85EdoQr6IjV0Z8koeTyMBz9abhPC+StVlijg5DzTiiPg3GXd2CI4bsfr7P1LOI8FQFt8MrJLlt+X+l598huDTolvjE/WXJQCbZEjk66VjlJ2wovHO4mEvlsvWn3rAcIJq6VfkkBvFCXa+HMyyjVbTfnDyGVBrNJhVEC0wk/ETPBjcgPUaFXwSvgp/3RhppKuIT5+gZ1E
X-Exchange-RoutingPolicyChecked:
	n0Y+Tc+Jd+8X+KmV6s3/Kj/dTGymbXEvoAjcPmOwQALMbmDd3brBjOFGKk8F5p2XiOqhTrVCZ0IHtOdfW/I0gS2N40caNTtISWXIWgdNUADxOgWyLZ+0n+7afSx7CekIfBw7yAV8N0b+3sa9z4usSFEjnVlHTifTnzzvKfgnLK/zA/OYHsmtoFoMvyX3XtxeAxLiPZwsi7YbTByswVVbtrDaRiibtA9mkrs9ckb072ROKPdtNsn1aJorr6ZsIpBHYZ57nYWX0H3Tj9f2VQfNYNQCH1W/AblWIUTfGPyJddDbn5nleM/S5F03cSQvh86D/wTsTKQO2X4T5qJQmIHHSA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:01:30.9159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7c87c5-f952-4bc5-419b-08df1d8224ce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8127
X-Proofpoint-GUID: CG-g4HPvyJqB4TMRUyzC5hgPMu_RLX1L
X-Authority-Analysis: v=2.4 cv=fKysTpae c=1 sm=1 tr=0 ts=6aba9d6d cx=c_pps
 a=i69ZgmgbQZPDBD2C4G6j1A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=AlX1V0eL3pWp3b1jGnQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CG-g4HPvyJqB4TMRUyzC5hgPMu_RLX1L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfX1GN4WIrFYrnK
 I4XLFD1Fq1SKLfJl7bAt34hvV+swMBbCrhKdHWKYJaOuP7oPyq3FrshBu/rAYwlLgGodJnUbK2S
 i/PK5KsgETWTHqNKbENNF0lDCn+ee5o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfXwmRy5dUA/K1n
 geIXay78W+HdPaxLG12oI5ZKKbbGosZLPoP4Fr3BWiIS8rgIDpJQPP7ipJG06CokFGCINg+yoie
 iI4LKkd/CJSGJtG/v+chB0Jr4/xKg8gHoNSDfVpdUlPHRZWfSxwD5yGEBUM9GLjge+ynZ+HoZN2
 k5O/d6zepQOoExGisFwVtiq5l+hqrj2I6lqFuKA3iB28t6WzV6HKZb4AhrEnALqOyq0xH+dX7Yx
 Yx4VFo6jbmUYTgn4czQVX5omMkq97BSgoFfbH+kj5aGewoOlHZLTqsoHg+yqlVgDPprDUhtb62/
 LGJegumVhIHtZAr9OkrEbEGZ3udo2jE14IGgzPkv05BaUhTDtyx3mSswwn3efVxD4PziOyGH7uI
 Q+B92TmIsROdTkvbJyHV2wgwclHULYzwkQg60bCAh8fWRM8l4cKL3ig9+pjcHKdSScxn1LTQKj8
 RUpRQsWgdSTZrfCV/iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280067

Hi Sai,

On 9/27/26 10:30 PM, Sai Sree Kartheek Adivi wrote:
> From: Judith Mendez <jm@ti.com>
> 
> MMC clock pins must be configured as OUTPUT-only per TRM specification [0]
> with receiver disabled (RXACTIVE bit = 0). Change MMC1_CLK from PIN_INPUT
> to PIN_OUTPUT in AM64 device trees to match documentation.

There was an issue showing up in automated testing that I was not sure
if it was attributed to this patch series. So I was waiting to see the
error again to debug. Not 100% confident this should go upstream yet.

~ Judith
