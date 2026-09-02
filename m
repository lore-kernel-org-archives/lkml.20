Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD94747DD4B;
	Wed,  2 Sep 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352023; cv=fail; b=Ga+vIkZckxvaamIrCKi1oVnSwnJHbvzmNFPPflhOmaB5g9e1FfSlowOx3oeQMGdNmJTfnNx1pY0dGxEzry8JJFgPXtDvN1TcQgM6ziRvGkMgKfqyWovn/Lt9YamrY/+GrC6lJxEYlJ1+SWpqT+H88d9T9uYhmvT8msInyCA5aIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352023; c=relaxed/simple;
	bh=S6YIZpcQK+pvz/wOMt0yHUpXDQWswwe8VM3Ovwc7Blw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EydCZdwnvs1EDSLIVy/UnUDRH6fiemdYPSAsH0thcjvkxOgku14/fw8Jz0dTqjDrtsHGCg3CR400CdXs9rehivXqdfvQ9tuNJYGVpl9S+GqJYCmUy4He+0fIbvyNIRIj+1YUFrcwAHUeLPFnKItzx8W/AGsv8MsjjT4z+N/8TFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WPC62GKM; dkim=fail (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dYatDuGw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WPC62GKM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dYatDuGw"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829S7xa2131267;
	Wed, 2 Sep 2026 07:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=94enj+qZnmzylIlgKKh/NuiRNFjsDYNDBZAWfTGJt
	Q4=; b=WPC62GKMhVnJQ2O6+3eJJYIhXMyaCfbaKzNkvy597LMA6RjjV6WL3f0F6
	/LPwOhKHymGENEFBOe02nLo2DcWrXNij1GBHUcT758iVceNy4oJVv1PJxq3SjigA
	z0qAd1snO/kjfwqQNW58uRMcybQ/oIlEyI7EvwMw5ziXTUVGSRnMWDnuOUMlNoLj
	Jydh5GBPHw825G4PyAshixI4JxD7rV8Fx3YSPc2T4VlAd870xkNDzNW8TE6iMMDt
	OW6RgLm7e1T/EctLzv2tX3thJ6NpbkG6FblYM3kh7cHINY1WVfRu+D0fP96HHtZj
	L23iSAGc841gmDr/QosfxXtR693Uw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ge8squgvp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 07:26:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZT3lqTGiKS7HmOvsxd/uUyODc9vdCrQsuEWqsPgikCwlG7OFAja3DWStTTA4+TswZgVRd1ua91wTaDNF2M0tbo+sfVJd3SkisW/P4qsu34F0mqHDUi4RwCxCzUIfsBb6iifNjbY0Phk9rtHzYUu2FhtGLvMhFRIjD1cwEHkIhVtzuZJZzvOaLw9W2KcRb7z2GHvl/6xHwM//OkyS5QJ+acrL1wp7kRuHjyAbekGX6wjejS5KYPeAiQJnU1aMntT8OqocSZaDs1XyBVvNWNF4BWjI28cEDgb5/Wn+FYl6pPlltMDFYzxbBOjxQAh16WxE09KdGMrHqlAS1b9JSpFGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyiK+6cdWQabKmbdsG2uO9rlvkobEPdlwoo8yQVfodg=;
 b=NYvzjjivCn3GNpq77agch4O5kUhlg7suY0/a18Q1eNGQdqrjbvcoFk1gooIcl86ghoomuKaAg360sIjlD8IKngISKEGtXz/ULpvryXhf1OTcXOCEYqne2eICdEqSHXJhQQwg+TLg2cGxvDgmzmBdJPL6NzuzK1EeKNvdK/qWm8g85dVyPXtg/ulvC09y0e1ahY9Dstt/xC6iw2HAv6smTV9iOQm9uCCoMbckGGOtTUS51V61a2NDl2uE7B2Tb6Ltc/CowI5FIY39oqe9SBD9qlkCwCYrNEoxIT9DjSlqERGYzGBCZqRlZHzvIHn23SEe+b1VUQY7eEP2Ki+D55YY3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyiK+6cdWQabKmbdsG2uO9rlvkobEPdlwoo8yQVfodg=;
 b=dYatDuGwi8fu3sYdZ1rvINduLDqejs+kpcURU7YkJERkC5aKiKlbywgpcbdML7ZLplno/QnN3MlMXe96MlCVNVhn6d9zaANcv4j6aq+H0udyfycCG2IaTmufCkWUf43B1ZPYySUgsQg5CV6IABlKJhYB/8SMc85P/SYc1XsBniY=
Received: from BN9PR03CA0805.namprd03.prod.outlook.com (2603:10b6:408:13f::30)
 by CH3PR10MB6835.namprd10.prod.outlook.com (2603:10b6:610:152::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 12:26:34 +0000
Received: from BN3PEPF00022BBC.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::80) by BN9PR03CA0805.outlook.office365.com
 (2603:10b6:408:13f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 12:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BBC.mail.protection.outlook.com (10.167.248.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 12:26:33 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 07:25:44 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 07:25:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 07:25:44 -0500
Received: from [10.24.51.39] (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682CPfne586452;
	Wed, 2 Sep 2026 07:25:41 -0500
Message-ID: <ca616c2e-8a90-423b-8b99-1c5d030c9e71@ti.com>
Date: Wed, 2 Sep 2026 17:55:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH 1/2] dt-bindings: mux-controller: ti: add
 binding for event mux router
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
CC: <peda@lysator.liu.se>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vigneshr@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-2-r-sharma3@ti.com> <apFyu65OOQF1XF2o@analog.com>
Content-Language: en-US
From: rahul sharma <r-sharma3@ti.com>
In-Reply-To: <apFyu65OOQF1XF2o@analog.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBC:EE_|CH3PR10MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e65656-3b81-4138-ba8f-08df08ed6ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|6133799003|4133799003|3023799007|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tfbijdXqKcAivJMbxIX5pbt5BUryNhIB7CGmTP6mr3ae83GdvwHJJA1mJz1VWn8FJvUMUyRO/kLF9nfw5MQuP98Z7EniwrnTNxoBoZ1GMHFE1SFOdRU8UurtgazPpAuJrIem7cGhykoJFUKEwIaHv7Z7mmYw/o2xTWj/ECcm+RQm2xeSMrmyqPQsp3RmoXUvrDPXTadiWnYPzjSJmlEVDSWK7SWD2KqrDfnFSPMFeI2zk71AU+3EaXO5vc39Z+xkFruQF74+VWlC5cDTeLFVy+T4R3MD3rgPqeB+mPwqwdcyIFPzaiWJCjKZlYdG2P0qiOm04N7+YUA0ysZ1Q0qFGWFHvtiO9nYpSYSGjUuVfGhjlw76nn9IbjUZUpccOOVJeK8wOfQk4vVIkTlv5ycmhcWbhN2MGy4hAJgcazk6bmllt2H0QBqGLKHRkRNhY0A/aJAHBWMH3AOWEhSaGiszVnMRJxwNeEmYkLV6NmdiD8NLlCuAn9qPQuuzikwW3j/yJp73ANZGlgcYjIP8D2CAZD0s8pgJmBAgVWdQismzfPBR/LKY3zZmvP5dO/vFhWx/BC6QhlcP/xuMW1X7kWP/teInMX93tthY8KG0POS5r96MS7LbwrrXEYQ6aIyKQGGcZjyGPnzbcWlMJnNEGWac7DhRI5/AGhWb8ToLltinbtk=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(6133799003)(4133799003)(3023799007)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R7unHhyLw66cS0SDEMnJGj361qqBsNOTOu0CDMfCa+tRbV2Bt6sPWiQ9j/1yZcFgdziFcg7PmJ/ieWc2okzUpWH2DORUHPVsFcZypfic0TLJSr46tdmzxk4MKlwZ6pDjDDaGoCUuzQFJoI+vqNVLTcaEIBpgRkv1Wdslem0x94Mj8BQ/YZ5OzInakzxmjD/q1rlTGLO1Llt1ffvU4JdIpTCvh9w3JLHsmi4r/i6kYON3ePajCNyPwgajI0G32/gDf4jDgiJypX/1owOA3J+LRhmW1S8OEDVNPfJ8oD2M5Cg7EWKnOjcCzjecFNY9uIgZAfoDPBSZhjOMSIFcw0CLvURFLVvQrs9yNFZZUuI8FGx/oKakbkAlxjkUB2eVO9QvsjPglob2WeuzVhv4RQpH8u/PcF3DAIltDjE4S0bnCUO43+5uuKzbz4OT/SvpQVt5
X-Exchange-RoutingPolicyChecked:
	0sBHYsFdF8QGVgkARB//7f2GPSnF5OhRP1p5kqEJVkXp2R4FAwj4RxzZdikXDCC6yjfWrlum6sVlGYCc0jzyZdty5DYJcmJku7Oaqd9BTNOe61a6me3DOi2kHAweEq4SECbG2T9mKbtKAdBJIx3vTgai8xnSRvQcK629OhSLIm2l6Mb2ugfZlLL+r13xn0OfXsmn+MXFbO8o1jQDpgoFZXKIQyt5ydjpldJmTMbndrD76lbZN23tm9YptS4l2SY0Dpd+mKRRcsTtbRwvcAB7ThDYEdXdWBHkU5VIJ7z7jepXQApzU5SzKTFcneL1gwE913gCjOCPzKYgpHyL9jXqWg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:26:33.4536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e65656-3b81-4138-ba8f-08df08ed6ccf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6835
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExMCBTYWx0ZWRfXzcH3CH/Avpc7
 Qe4o/KP+jDUFF9ShHoftzQLYVKDYfL4cU3cF1y6JOpA0Xl7Rga0GprH5GX4shM8mDnoYoQXC4VI
 pIbzi7kCqY2ZTEyC84EDc/+uEYoCxcI=
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a981603 cx=c_pps
 a=U89Fr+s++Oy0xugnv2TZpA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=RpNjiQI2AAAA:8 a=MKqIecrYLlFEDdW3oaEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2UeAJFAIFt4WeBsHFbzONtRaRQXbIxSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExMCBTYWx0ZWRfXycNyJpHchqSQ
 dMYVLBzDdczKe4E1fyuYarIby6buWrnOZlLrjoVaU0FvEJhM+AFOuFxlRqXpFz2/rQcv9furcXc
 QOk0bnCReLvOHLTCKH/PK3uwMhqF9ZTliYvHNXx0UQtM8MUyHbk/x+oitErqqjgmet0D+HdddMS
 b/x8f2rneMOgcWxKwc/W1WMFa8XQajChjpmyA9sn0pp7yCNotnOy2re7X9+p0bu151vZFmS2gSV
 ay96h4NGcYMaWVYhgZhBK40IFsLeIGHZX1f2q+WmtriGW1JYXe3wrSyQ5q0F+OxTBVPaVwvLEg3
 yMwmOs6t0W4rf49c70IJFfZ5SaSV/wA5oqsfMV+gkPRkLDC6QND9OGuFToCjwMTFk9GbOxzaNX5
 1ml20CpTNCeYuOEYDC/e7N/cQemecOMtmLJ8WLDpuZlSTZBjj6RwG5yWs03PB2lOVs3UsUFpoiF
 xmxmdBDvRp0MJBaTO+A==
X-Proofpoint-ORIG-GUID: 2UeAJFAIFt4WeBsHFbzONtRaRQXbIxSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020110

Hi Alvin,


On 28/08/26 17:20, Alvin =C5=A0ipraga wrote:
> Hi Rahul, On Fri, Aug 28, 2026 at 03:=E2=80=8A36:=E2=80=8A14PM +0530, Rah=
ul Sharma=20
> wrote: > Add binding for the event mux router of TI's K3 based SoC=20
> AM62L. [.=E2=80=8A.=E2=80=8A.=E2=80=8A] > + ti,reg-mask-val: > + $ref: /s=
chemas/types.=E2=80=8Ayaml#/=20
> definitions/uint32-matrix > + items:=E2=80=8A
>=20
>=20
> Hi Rahul,
>=20
> On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
>> Add binding for the event mux router of TI's K3 based SoC AM62L.
>=20
> [...]
>=20
>> +  ti,reg-mask-val:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +    items:
>> +      items:
>> +        - description: Register offset (relative to reg base)
>> +        - description: Bit mask for the mux control bits
>> +        - description: Value to write when mux is active (state 1)
>> +    minItems: 1
>> +    description: |
>> +      Array of triplets specifying register offset, mask, and value for=
 each
>> +      mux control. Each triplet contains:
>> +      - register offset (relative to reg base)
>> +      - bit mask for the mux control bits
>> +      - value to write when mux is active (state 1)
>=20
> As I understand it, you are creating a binary (0=3Doff / 1=3Don) mux cont=
rol
> for each reg-mask-val triplet. But couldn't you just use the mmio-mux
> binding/driver for this, delegating the value setting to the consumer?
>=20
> [...]
>=20
>> +examples:
>> +  - |
>> +    #include <dt-bindings/mux/mux.h>
>> +
>> +    // Example 1: TI AM62L GPIO Mux Router
>> +    mux-controller@a00000 {
>> +        compatible =3D "ti,am62l-event-mux-router";
>> +        reg =3D <0xa00000 0x400>;
>> +        #mux-control-cells =3D <1>;
>> +
>> +        /* Mux Register addresses: 0xa00004 + (J =C3=97 4) */
>> +        /* GPIO0_40 -> BCDMA trigger 15 */
>> +        ti,reg-mask-val =3D <0x40 0x000ff 0x00028>;
>> +        idle-states =3D <0>;
>> +    };
>=20
> Alternatively,
>=20
>   foo_mux: mux-controller {
>     compatible =3D "mmio-mux";
>     reg =3D <...>;
>     #mux-control-cells =3D <1>;
>     mux-reg-masks =3D <0x40 0x000ff>;
>     idle-states =3D <0>;
>   };
>=20
>   toto-consumer {
>     compatible =3D "toto";
>     mux-states =3D <&foo_mux 0 0x00028>;
>     mux-state-names =3D "gpio-trigger";
>   };
>=20
> What's wrong with that?

We wanted to go with this approach initially, but we had trouble=20
assigning consumer node(s) because of lot of modifications will be=20
needed in already existing consumer nodes.

So, we came up with another plan of not using a consumer node at all to=20
enable this. Now in this approach you can see, the mux-controller itself=20
assigns that value to mux register and takes care of routing.

Also If you look at the driver, to establish a mux route path we need to=20
2 things to be done 1. Set the mux register value, this comes from DT=20
property 2. Enable the mux route by setting 16th bit in mux register.

And this cannot be accommodated in current mmio-mux driver.

BR,
Rahul

>=20
> Kind regards,
> Alvin
>=20

