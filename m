Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BC477E31;
	Fri, 18 Sep 2026 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754766; cv=fail; b=vDQl852VERYo/KcYP5IXkQTwwJXpWM4+BgaZxwv+NycxLpsgbhRe+AT29kYBBMpKUeXrBNKL4kF3FVTyL0zIXoDzqWdwJDTXy35t/sS29HITFH3Cvq4izE6gzNRP43PHC7QOTDk2ju7xvI1/5fDXVZRPeqyWVE/f//bJPDIH3Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754766; c=relaxed/simple;
	bh=DCygsRG8CBRA85PHOgPv3SDWq0LJ7ozVGhhAMG4qN5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WE7SrQpQ8ui0Lr6gvEF1I8UZNTXszoR5wtb8yW/27tC9/kNtHh6ojauVF2IZzV9cUIe8DZDtCCkeCkgVqw0AafqlXKXni+BtqSnDLwHieGy12dNce+Cb3RofI2oM70/PNgDKP7CCS22TppYNZg3arAr2FGcf5t7zR5/vqlsC2x8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=bmisL/23; dkim=fail (1024-bit key) header.d=ti.com header.i=@ti.com header.b=D6qupXrL reason="signature verification failed"; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="bmisL/23";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D6qupXrL"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGof69397892;
	Fri, 18 Sep 2026 13:05:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yGSbO2cY3jF5srs2cjQv7h9LWNXshQLcTnDfEFcw4
	io=; b=bmisL/23eEChJtAxUZKS/A8CzDr1XMQ4kTgbgK9Mr3kaH/1KKtYiGR11i
	h5wnIKZMKbBEi/15DpdTUi3AmJk/Y97w3q9Ij5i0klBRe9FLGX00IFo/ASGqqelV
	nH9/Rfwqlwn9p5bXAPfust0MY6HKf14L7hFCAbRuoc6fS9PHrgjXJD6POi3yLlX4
	1Dwtw2kEUjG7N6ROijuYHpK608V5EPSydYDtBoEgp1xwCOgdbBgl9m+r83c130r7
	1WMFqyekO2bDm3iYMkhL7+k6cHLjukVetn116SqDqTIEyV5ifamHsb/jZR+q5tyY
	Up4hX1Of6m2kTDdGSzZegSoh/NcZw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gs70yha7d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:05:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhvpNKzlKwzvqnzyqANXIIPNMTNl4UXgoOWTTRzuYVaiV3V2HWCzoVHVZAsHRgmuSZUS8L+Uhq9k16pUPgNM+fo20VIAyFZ2212dMIHDLRNIKk60byTI/oGvgPraIgfnSjAEt1un+wdiY0Xd/kGVbhvm8Sm2yd54M4NK8efNzp5ta+Jwy4BVOlSLFjS//S3IO1IzPcyTdv1jv8NDFhOtj3M86gv5hf4uOJcFxk4uLud1OYMR1STGRuEPXTXDLJvIQI17e16VIBqqYxVaRwXYEh2zCz7U9+KPHas0qBe9cUkiGrx7Z9Z3aarZi2B9QXzp1Tm9Gi7Br5a1ezWGhoWLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tczBwwN2szuDpwimC1fATfaWsjIgbfyFHzFXziourk=;
 b=cHXtpb8AGZvI4Zhm8xD3JzxwcQuTcA+XQg2mp7Yskz04l5Yj/2Mgkyi3Es4hN5IO2kyssRdZstIyXaVhQAI/gMbzt0myqDRpEAtRGTzRODINtTlfuoS7/HCT3APe+6qxp/xMyTLRQ4/wi2tBop+gAsaGajOmHlOAnIVIrksN9Ni31Tfo00Xfo7nReH6FnOPxoQ/mBoJckGJJQSIvzoY0IYPwTJow+NeuEDhjNu5xApQEGRadJcDp1JhnytlCIxlo43NFRa9Yxrf5uOOPCI8kBA4YkyG/OcfpZqC36LbfBv4cvraxDXQYuXFk/ONreHAz2gYomeqktLt53UsBWOXHVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tczBwwN2szuDpwimC1fATfaWsjIgbfyFHzFXziourk=;
 b=D6qupXrLNDjU2RRaq35lnC4F1FAGsdoV0IIjAPFKrBiAuWZUXveA7zZ0W9K/Xo8ZGbI8Lnp0orvZSqBufpxkTdpFuooVt1SVYe+09rBcb/xKgw90FtghpZfxhmBRa8xNAvQFg4FYd+DDB+OzGO+cKfiBoaBj4LYErbbluLGdYzA=
Received: from BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::12)
 by CH0PR10MB7484.namprd10.prod.outlook.com (2603:10b6:610:182::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Fri, 18 Sep
 2026 18:05:49 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:59d:cafe::72) by BY1P220CA0010.outlook.office365.com
 (2603:10b6:a03:59d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 18:05:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Fri, 18 Sep 2026 18:05:49 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 13:05:32 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 13:05:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 18 Sep 2026 13:05:32 -0500
Received: from [10.24.51.39] (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68II5Ti02178961;
	Fri, 18 Sep 2026 13:05:29 -0500
Message-ID: <1cd03e37-a9bb-4c21-b8f6-557a1fcacc5b@ti.com>
Date: Fri, 18 Sep 2026 23:35:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: Re: Re: [PATCH 1/2] dt-bindings: mux-controller: ti: add
 binding for event mux router
To: Conor <mail@conchuod.ie>, Conor Dooley <conor@kernel.org>
CC: <peda@lysator.liu.se>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vigneshr@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-2-r-sharma3@ti.com>
 <20260828-goes-scrawny-a5cf40c9514d@spud>
 <bacf61ea-91b1-454c-97aa-8c6e4ca07b16@ti.com>
 <20260915-shredder-liver-219bbc18dd18@spud>
 <62194a7f-5b7e-419a-8235-9eb46f2f2e7d@ti.com>
 <8724E360-7B38-48E2-8A5D-9BBAA69EAD06@conchuod.ie>
Content-Language: en-US
From: rahul sharma <r-sharma3@ti.com>
In-Reply-To: <8724E360-7B38-48E2-8A5D-9BBAA69EAD06@conchuod.ie>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|CH0PR10MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: ec58873c-5a65-498a-7a43-08df15af785d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|6133799003|18002099003|22082099003|3023799007|13003099007|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	wOOjEYzF6I25Be/uIsdi2kcJKmdw6ZuAlriI7EgJLsyBbTDAJpVM5wl6AVqCaJldHUFvw1+ELvEiDcSZ+1gelYzWeknOmMw+Ed1WLQ4bBqGgMWTSxzhALWPbbI7ACVbLDRMSOkhr4E2BbahrAZIg1ODiKDXzPXUGDTdP+yjZFKEO/BJx+o0sTOb7/w1UUNlc94Zl36zE4+dJdAxbKyzuaZkI3eExyBPlBnLYehBi7Jr1IrniU/MdX1NE51VdHVhy8EWfTC9QG32UvLMlm5v6CGyZwsPBbIAf5JphMDS9YY1QhOfNeQWCS7wBON2L9J/aqQXei5yEhRZjTvujCw/pC2NTRFddQC2PrBlCZLRXS+WbVCPUmRs3+/OcWTSkPJ4ieXh//YQkK2MI9ZCOcuyl3GKdEn87JvOn2o4cCUsGKqZtwFlyNKACNPBOgHAvlr9cbBw658B5Hjprado19bv7HlbilNh5cWQgaec4kxFLHiiVxKB2VqJ+sQ0lAZ05TyAWy/ZZqIoGfT+RjuIj6U1akNb/SC8XqfBxdfMcGDhjK4L+Vc/gDJZk9LNSlK0imEi3p6kiVdBaxmj/bkhOUNmyfHUUj8MGwe/65kRY0fH+RdoVxurWh7uf6xZrjbR7hU4IYFlqx64t0jaHrVDAwktlfg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(6133799003)(18002099003)(22082099003)(3023799007)(13003099007)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7WKuwEdCiONKVmvjQLUeZNDUamfn8gCLUo6P4KDLjcOSnLkkeup7iANgdw76TcE8MMzA5eiVDL4Vs6o/4rFsTawfT2FEerqYPjXxI+b5tYIHwkGeQs7jMfZ8DW5aA8mS8ZanyOpQlXoCCwVBiYRYZ4SAc8ZB5pYSHSVqKr1FzpJ2EobM7VI9dpoHvU46Yq4GCEU2Nonag/3iZtauYk18mR/qaBGL5qUdbky/92QrzdjPKtcEWzboSKhhS4kRXOQNM50EhQbVpFJaL5o5Sz/ROVEP87KKqriCapnYSM5RoN1tdL0gQeRg26byLbQQA261lgoFFjzLoVAlpRZxvPbXFrcB0dfAG0P+oMAIlvunIiUClFI3zG1GYZyD2ASBWHBTU9sklkuM+yZM0svEbAndexAOK2m1St1vhOZDFc8NhXG/REdc+7gJVRfqn0Gidruw
X-Exchange-RoutingPolicyChecked:
	2tdBo9REX2cDCvIQDgc0lKqtZoDcnr9YdXDaqwvQzROWQyF24wJigUQrXYjYao5mbSmnDLXCFUhhI/GoVu8Zz2a2d7zRaoA6+PuWJw2TMZurA1pCQnVXWj+ptjIoImzItpfgoKzjz9ZwgNouY68f9cM1wnPmd5TAriO7mWClEjalNViw8PmtG+5pf+rJr+aEcf2JA7RJDvAl4YbpknLEZdUrShukRI6r6tgwyIzTdKd1nx9SssHIYNam81DlYeeKond5I1kwdppS4johO5zMUXG691z+ffYcx3BCuVvXFPKt4ErwmG6swiEfNGNjDwdmvCvlh6HD5wydwGZ4fZ+MpQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 18:05:49.1445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec58873c-5a65-498a-7a43-08df15af785d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7484
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VKVIDNPX c=1 sm=1 tr=0 ts=6aad7d85 cx=c_pps
 a=gjcLB77VbSPYcqvaeYBpgA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TXF05nYbSb0vizRg:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=RpNjiQI2AAAA:8 a=sozttTNsAAAA:8 a=uherdBYGAAAA:8 a=gEfo2CItAAAA:8
 a=NEAV23lmAAAA:8 a=hqgTioDd-K5usMiy-fsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI2MCBTYWx0ZWRfX+/9A+AXIT8CL
 f4luO2O78zoVvck729uJp5rPUeim643U2/kkGG/y/CIZzp4o6ek9A9qKMbNONoMxyF35jtwDzkx
 cvOv7tb/6guGkAwg5nkAoWCJY8F/o3EvUepSYFs+9wERcSvxtUJr9pGSs9h4I/tHglzlV23ylTU
 GsLSSDm4wY75kM4raeeZxC4p535Kp9VrvMjNkf+FAODFSeDbJTXxag5r503MDDcdDMMyzr41zmW
 xvmW4c4P5glC3Pj4UrQYtA3Gu4XeHp+KV/jJa07I49GjHn19snhHMwHkzg+jJ1aPlv0Al6BPsbq
 oytnANQWhi7r29uPAP2fkW+zeKx5Uc9CBiBcFrgwkuUymiJLucr3zHQ5i4tSgQnhMs7nkjBBKGw
 nRF0vOPHWQwfQ0y6nS+6uLLC8h9+gEu92H0UOPBuoXJfELHZn7yifVMFMzE2OiGYN4U8KcJ2Bxc
 P/Ow4ujycnQrbpPlNbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI2MCBTYWx0ZWRfXxYrbkbihfqGq
 fuPq5y/BStO+jNTjVT7ZEWbxUV2LyuypOf6gplfRj7tmi7N1gh4jRSGqbmZtSYt19jkp0aBj+fs
 MjKpmNhzhv8T9fGaumZJmcSPwHaiOUQ=
X-Proofpoint-GUID: K5CBEF5PSARXm9bsu1KqdaCrSh2luXfM
X-Proofpoint-ORIG-GUID: K5CBEF5PSARXm9bsu1KqdaCrSh2luXfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180260

Hi Conor,

On 18/09/26 03:40, Conor wrote:
> On 17 September 2026 17:=E2=80=8A44:=E2=80=8A21 GMT+02:=E2=80=8A00, rahul=
 sharma <r-sharma3@=E2=80=8Ati.=E2=80=8Acom>
> wrote: >Hi Conor, > >On 15/09/26 19:=E2=80=8A19, Conor Dooley wrote: >> O=
n Tue, Sep 15,
> 2026 at 06:=E2=80=8A10:=E2=80=8A45PM +0530, rahul sharma wrote: >>> Hi Co=
nor,
>=20
>=20
>=20
> On 17 September 2026 17:44:21 GMT+02:00, rahul sharma <r-sharma3@ti.com> =
wrote:
>>Hi Conor,
>>
>>On 15/09/26 19:19, Conor Dooley wrote:
>>> On Tue, Sep 15, 2026 at 06:10:45PM +0530, rahul sharma wrote:
>>>> Hi Conor,
>>>>=20
>>>> Thanks for reviewing.
>>>> Apologies for the delay in responding.
>>>>=20
>>>> On 28/08/26 21:57, Conor Dooley wrote:
>>>>> On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
>>>>>> Add binding for the event mux router of TI's K3 based SoC AM62L.
>>>>>>=20
>>>>>> The TI K3 mux routers which route the GPIO input events or Time-Sync
>>>>>> events b/w peripherals instead of routing to a CPU.
>>>>>>=20
>>>>>> Refer Section 10.2 and 10.2.1 of https://www.ti.com/lit/pdf/sprujb4=
=20
>>>>>>=20
>>>>>> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
>>>>>> ---
>>>>>>    .../mux/ti,am62l-event-mux-router.yaml        | 79 ++++++++++++++=
+++++
>>>>>>    1 file changed, 79 insertions(+)
>>>>>>    create mode 100644 Documentation/devicetree/bindings/mux/ti,am62l=
-event-mux-router.yaml
>>>>>>=20
>>>>>> diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-event-mu=
x-router.yaml b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-ro=
uter.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..a5ba7f78a156
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-route=
r.yaml
>>>>>> @@ -0,0 +1,79 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/mux/=
ti,am62l-event-=20
> mux-router.yaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-
> LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDckFu6UyA$ <https://urldef=
ense.com/v3/__http://devicetree.org/schemas/mux/ti,am62l-event-mux-router.y=
aml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4x=
VdCcEA5bQcDckFu6UyA$>
>>>>>> +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-sch=
emas/core.yaml*__;Iw!!=20
> G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQ=
cDdyRJuLcg$ <https://urldefense.com/v3/__http://devicetree.org/meta-schemas=
/core.yaml*__;Iw!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc=
-0Kkq4xVdCcEA5bQcDdyRJuLcg$>
>>>>>> +
>>>>>> +title: TI Event Multiplexer on K3 SoCs
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Rahul Sharma <r-sharma3@ti.com>
>>>>>> +
>>>>>> +description:
>>>>>> +  The TI K3 mux routers routes the GPIO input events or Time
>>>>>> +  Sync events between peripherals instead of routing to a CPU.
>>>>>> +
>>>>>> +allOf:
>>>>>> +  - $ref: mux-controller.yaml#
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: ti,am62l-event-mux-router
>>>>>> +
>>>>>> +  reg:
>>>>>> +    description: Register base address and size.
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  '#mux-control-cells':
>>>>>> +    const: 1
>>>>>> +    description:
>>>>>> +      Number of cells in a mux control specifier. This should be 1.
>>>>>> +      The cell specifies which mux control to use (0-based index).
>>>>>> +
>>>>>> +  ti,reg-mask-val:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>>>>> +    items:
>>>>>> +      items:
>>>>>> +        - description: Register offset (relative to reg base)
>>>>>> +        - description: Bit mask for the mux control bits
>>>>>> +        - description: Value to write when mux is active (state 1)
>>>>>> +    minItems: 1
>>>>>> +    description: |
>>>>>> +      Array of triplets specifying register offset, mask, and value=
 for each
>>>>>> +      mux control. Each triplet contains:
>>>>>> +      - register offset (relative to reg base)
>>>>>> +      - bit mask for the mux control bits
>>>>>> +      - value to write when mux is active (state 1)
>>>>>=20
>>>>> You have a device-specific compatible, why do you need this? If the
>>>>> active setting depends on the device or w/e, why can that not come fr=
om
>>>>> a mux-control-cell?
>>>>=20
>>>> This is a boot-time/board-fixed routing decision, not a runtime-select=
able
>>>> mux that any driver ever calls mux_control_select() on.
>>>=20
>>> 2/3 of this property appears to describe the register layout of the
>>> device, that's not affected by the board or some boot time decision.
>>>=20
>>
>>You are right about the mask element; I will move the mask into the drive=
r since it is constant across all entries. However, the reg-offset must rem=
ain in the DT, as it is specific to each BCDMA channel's trigger line confi=
guration. This allows the DT to define the unique routing offsets required =
for the hardware.
>=20
> The reason you cite here for needing reg offset is exactly what using mux=
-controls from a consumer node provides.

I will refactor this to use mux-control-cells. I will drop=20
ti,reg-mask-val from the bindings and instead source the reg-offset and=20
value from the consumer node.

BR,
Rahul

>=20
>>
>>>>=20
>>>> Please refer below link for the IP block diagram:
>>>> https://urldefense.com/v3/__https://github.com/lucifer-9852/linux/comm=
it/=20
> aed1746e411a9f0ad7824f4e4a7121e6f56a4ef2__;!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-
> LL1vTj1BNr5NNBonzfy5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDdDoeFS5w$ <https://urldef=
ense.com/v3/__https://github.com/lucifer-9852/linux/commit/aed1746e411a9f0a=
d7824f4e4a7121e6f56a4ef2__;!!G3vK!VJUh5A8cDCko1ZAGtTQ8V-LL1vTj1BNr5NNBonzfy=
5GnFCQkP4Oc-0Kkq4xVdCcEA5bQcDdDoeFS5w$>
>>>>=20
>>>> For detailed view of IP you can refer Section 10.2 and 10.2.1 of TRM
>>>> https://www.ti.com/lit/pdf/sprujb4=20
>>>>=20
>>>> That's precisely why we added ti,reg-mask-val as a controller-side pro=
perty
>>>> rather than sourcing the value from a consumer's mux-control-cell: the=
re is
>>>> no runtime consumer selecting between states, so the routing has to be=
 fully
>>>> described on the provider.
>>>=20
>>> Why do you have #mux-control-cells if there are no consumers? I don't
>>> understand why the GPIO controller or the device that the interrupt is
>>> being routed to cannot have a mux-controls property that contains the
>>> "value to write when the mux is active".
>>>=20
>>
>>You are correct regarding #mux-control-cells. Since, this driver is used =
for static routing rather than runtime selection by a consumer, that proper=
ty is unnecessary. I will remove it.
>=20
> I still don't understand this argument, if you have a static configuratio=
n just do it the probe of the consumers driver.
> Then you get to use standard properties rather than encode the register m=
ap in the binding...
>=20
>>
>>BR,
>>Rahul
>>
>>> Confused,
>>> Conor.
>>>=20
>>>>=20
>>>> BR,
>>>> Rahul
>>>>=20
>>>>>=20
>>>>>> +
>>>>>> +  idle-states:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>=20
>>>>> This is not needed, you get the type from mux-controller.yaml.
>>>>>=20
>>>>> pw-bot: changes-requested
>>>>>=20
>>>>> Thanks,
>>>>> Conor.
>>>>>=20
>>>>>> +    description: |
>>>>>> +      Idle state for each mux control. Each entry corresponds to a =
mux control:
>>>>>> +      - 0: clear masked bits when idle, also refers to inactive sta=
te
>>>>>> +      - 1: set configured value when idle, also refers to active st=
ate
>>>>>> +      - MUX_IDLE_AS_IS (-1): keep current state when idle
>>>>>> +
>>>>>> +required:
>>>>>> +  - compatible
>>>>>> +  - reg
>>>>>> +  - '#mux-control-cells'
>>>>>> +  - ti,reg-mask-val
>>>>>> +  - idle-states
>>>>>> +
>>>>>> +additionalProperties: false
>>>>>> +
>>>>>> +examples:
>>>>>> +  - |
>>>>>> +    #include <dt-bindings/mux/mux.h>
>>>>>> +
>>>>>> +    // Example 1: TI AM62L GPIO Mux Router
>>>>>> +    mux-controller@a00000 {
>>>>>> +        compatible =3D "ti,am62l-event-mux-router";
>>>>>> +        reg =3D <0xa00000 0x400>;
>>>>>> +        #mux-control-cells =3D <1>;
>>>>>> +
>>>>>> +        /* Mux Register addresses: 0xa00004 + (J =C3=97 4) */
>>>>>> +        /* GPIO0_40 -> BCDMA trigger 15 */
>>>>>> +        ti,reg-mask-val =3D <0x40 0x000ff 0x00028>;
>>>>>> +        idle-states =3D <0>;
>>>>>> +    };
>>>>>> --=20
>>>>>> 2.34.1
>>>>>>=20
>>>>=20
>>
>=20

