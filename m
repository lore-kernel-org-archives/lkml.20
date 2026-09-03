Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962E93EDE60;
	Thu,  3 Sep 2026 19:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463090; cv=fail; b=qwusOy2p+zhMkSoGkvuddLtv58QM5sc/MwoI4qp06C3ITL9FevPiRyokb6zO8RpoySp2zCoiuGiwbrxHfjS4rN8PWP/ZqcDPncjBHZb4rCd+87HigVBGqZGZ1b/T8hW7xagJzPdcrRC423kuBauoOtVp8g40sEbXeX5s7qsuOtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463090; c=relaxed/simple;
	bh=NGuIoN3McwqU0M4xvmgpNInSeq0zK1g/peuuye9U4tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bwHP3gZoyw+dk59JfZg0hhH5Rbi1pdXGWRxDleeCjM4iv7zywx3jcWtEp1Gn/FXPFSdijfI0hUh6hec0i0yZWjxVAUNDV7bQMiM38ITkkUAS/93oJ2cFYTKAjmjaoYZ5tnoGppxXF2Ha7hnMNggnr2SC0yCtk5z7rP10GjaHRi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KMojQD6J; dkim=fail (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TTrrrY9Y reason="signature verification failed"; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KMojQD6J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TTrrrY9Y"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683G0ia71342871;
	Thu, 3 Sep 2026 14:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ThLf9Uua3ttAIauFZRFldwUNYghpiswEHNfk0wIZ9
	rY=; b=KMojQD6J3pFn4hxF60rQQcMaE8F/ZPvVOERjJryR8pT9v8fGizcwB3MHw
	vzqgC0EXJKez2A/uhGwpLlA0FsrRlEA/u5Z1//fk/BxHZISQPFDzKIg6mqeL4ECh
	FcoEOAJr1ZigagxzedjsK4k4YhHnmfh/lbQMXsQzhzm3UvU7zwZOBu2HXgeLH1/L
	Kys/5zFl7uZTXOWiKw7RYP+zdKrZkDwgrf7sOhax+Q4lj8KC5i/po2DLHUNzwhqK
	IWHxs+V6/JUWVFnZ9zz0abEBcZ0l3kAxMqXO7xYrSBz27xcsPs7u2m15kg2NXIew
	SG3AwZxundzlsFJvQhWKCh0yIkNIQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gewt8ppwn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 14:17:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdCOdAgbCu6d+gV4DPDEttQdlFHJejQJTiahMC0nLiv2xMtfz+uvjZNytwNGjSX6TVKy52oct5GyQgQJXMBGZu6Bqkn7ZjF//bjwi+5J5ILY5yVliIrHOiojHSYfHuNiHdhmNXK4HZB97hMSU7e89Axl8RoRTV5wEMxlh70VeLMsQM/759cL4+wMKN+8G4rWDKHszE3HtDkBKaRIHS+McksrIoQwga219m/7dDVgUGoA4+3WgQMfopfQHlRp5K6HC6wQgEcH6GiVQIAhdRLLIIx6YAa7YYOYUoREc3SzeHUxcJ1Qluf5fKKslubuu8ZiNR9f4t8LZHLpEsUzs0K2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOrY0ruZek/tCtW34Q/Cvyr6LsA1LgXv8P4O/gNrtJY=;
 b=htgb85R/ctQjSSlQ3Bgh6gwr6vUP2dwRT32gJ7K+T53/0PWQYV5vUJbIRb9hHT992HELkCp4m+PxLqdVbcA75YDHZ5Rzs6doqdZTQ9gPx6PuZkx+og13WVPF24kOkRIxiD+O2vCI+SMi8YFcnIdkgrQopuesS5FJTYQLYHXJKuOXAfhQ65GzsbcLgwAlvd7UrSECCteBQPiWmsIdS8rKAMKo7I/UwJrJvd/JlbjwtilS4fCZmqMCfByj5B9nT49zoSC/Wf4x/1DCpQhffrlda82uUqnCv7+dmjZgavfa673Ye4LbH6C4e48MqYj2Oz2WmwspCufMDBqRaWrMun4LHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=analog.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOrY0ruZek/tCtW34Q/Cvyr6LsA1LgXv8P4O/gNrtJY=;
 b=TTrrrY9YSGLWtW4/lzUmtXVaI+2HEP6C2LJn1uxy4Gcg5cIOc3wMX7wFYqwvUcxGu6Y/UWjRbO0T7loWIusj7ng47GFV3W0ZgP6uG+CxyhDaMwQ8wWZH5zO8AvYkfT62vpsLq6bQ4ZTvU3QpC0vbGxnTpK0q9dSfzkrHjRIrLik=
Received: from BN0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:408:e7::11)
 by CY8PR10MB7267.namprd10.prod.outlook.com (2603:10b6:930:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 19:17:43 +0000
Received: from LV8PEPF0000006C.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::2) by BN0PR03CA0036.outlook.office365.com
 (2603:10b6:408:e7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 19:17:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 LV8PEPF0000006C.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 19:17:40 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 14:16:53 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 14:16:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 14:16:53 -0500
Received: from [10.249.128.199] ([10.249.128.199])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683JGnAP2092340;
	Thu, 3 Sep 2026 14:16:50 -0500
Message-ID: <bb67e942-ff5e-421c-8556-18a9eb18be22@ti.com>
Date: Fri, 4 Sep 2026 00:46:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [EXTERNAL] Re: [PATCH 2/2] mux-controller: ti: add driver for
 event mux router
To: Peter Rosin <peda@lysator.liu.se>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vigneshr@ti.com>,
        =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-3-r-sharma3@ti.com> <apL3StZuqeV-gaIa@gryt>
Content-Language: en-US
From: "Sharma, Rahul" <r-sharma3@ti.com>
In-Reply-To: <apL3StZuqeV-gaIa@gryt>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000006C:EE_|CY8PR10MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 772f2fa2-29ab-4d41-9a84-08df09f0060c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|3023799007|6133799003|10067099003|4143699003|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	wtI9dYGvHbk4ycMVIv/2E35pRy9QQsrpecpgEDavWOVNCLvbySlFJTxQ8Tc6wQczTeGmOuTDUnRTxKPl9LPzLDmumRYrRDh5/m81obh3VhZhMHze4HnQg8x4Kww3457Usow+carGDMwJYEfgNWknKO6Aus2Myf+icwsSeGLx97v6xjDDuqImmkDEpXPMvnwDp3ObuBuKrj0eL5yhIhIUgrsv3VlAuaGYtWhc6jxo90wVcKRI65dyXd5sVcf1RdJrJB2NDfvv48NlpHpaclwcbKIrmIlWmCzLepnIq218Kc/ab3aZLh+0LRwml3opvev1kG+PtpOvVBkTj6UhZgZOVlSLiyVWQ0d+uNafDRlY1a6pjyc24SgN4797JzNKRRNMGIEj9nCXyz1YOl5ksXB6j5DZ6Q4mCAfE0LDq2P7wpcO8TaeT3CMimsVYHq9xjG8Ok6WVa5oE0ATjs82To8nmmu9uAZpbvi7wZis1879xkodCzrnpUkEcpsc0Qq9i5qwSCzwvE8CiFglNnK/BZMtXX+TkA+UgcIhkJpFpw7Q6OTAfg7WK8qP/ZpwJHTbBxPfLnNl4dhM62LA95z6sJYnI4dyD2ft1VP4PQd0qOPm53Sk8fKV7BpxUjo+FGo7rCKKLr84oZcCCvmnjMaJFhiD/lA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(3023799007)(6133799003)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ujiYa3p2q3We211Xbjbb5EQBB8eQpQOTYgD1usGzurDQLrgNUcdgCzwvUws45J/Co3uXnm16Gn+qfEyZs8HeT4FT8cbqYs79yEsLNpgCKB3Fp6J3kA1E09Wf2aaTSy15oCleuhZuZd8EzXwW5QC9QdFp3CC4wcW+auFdif6LF5IOrmIYaEAn4qQaw1oDi5iKbxuHaqDOBZFAtgxeDmIHpJ37khYZoTcHcixh/Fcl+PzXMq2bjHGdEHUPbmrdPo8v9cET9Xuexe8vJTcVGTd5Vomt5oBEesw+G87CmuPM25fXzs9MVcPUdD0vZqQ9LzYw7xUHen1i35xZVK5WmD/kI8O7H6YCmU7UfODS8Bm4ChDrpmK0MkU5iChJRAu+gVWfcOfDhTlTTDYCv5MOBuS/0C33FGQg/2/5QpkbUE0HwLds0pn5MnGD3WOInKCNU+S8
X-Exchange-RoutingPolicyChecked:
	0c9GNx/8/slf2PpT+FcBRl4nPwLE8HrcZ4u3NBIJJWy5ICZEUZBpEkB66hVnby2bU/hAl3NLFv4YfmodP/oLZ7LNe3AP4C9DJ+sayyX8ZGJ0occUFDDM3Nar4IoP6UeZGzRxEhZqF+o1lFg2DHhpK533OGnnN3fWUiriaOB2ngDBzNBL7/00h/7ST0p67PRkERseeAsuGvAE9o8/NVjTQPRzr2U7ofIdS4q1wC1OAWMhCudwhc8/ULqdVx6ptWpYWGLe38butNMBdT4mVOPfu5XTu5Tvhiob7JgrcJglcgcBDuZ/XCH/7EB/RvB0It/Y49gfFsfG+GwR+8XDrUq3zw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:17:40.7041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 772f2fa2-29ab-4d41-9a84-08df09f0060c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000006C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7267
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=de+wG3Xe c=1 sm=1 tr=0 ts=6a99c7dd cx=c_pps
 a=htKwazZePKloe4WR6Wq9JA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=RpNjiQI2AAAA:8 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=NEAV23lmAAAA:8 a=tXlBmI_yJET82ZNZlEYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: oZT06GlT7XbbnrFVbwXXy4ZBA_g0yY7g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfX/46/83UkRfcz
 Lu5aFUmgYLoRRdY6CW+msw5gBYU7FSd01jhba3NpIG7CDz7NygixV+sMEhKpWx97i6wpE+pho06
 cp33+sbJP5ICfbCQieH5tPoz60heFX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfX6hzfCICDnxJ2
 gFFO12EDeUIVeux1yplyTbwiOAtgdW5EYKiUNK3ThpzBk5ipXM04DTEwM2ScknX/LG7RQV5gs+Q
 JwlklGXQdY64ovbkmKnPm0qohI5m4ZDJMXDd/scacWZwQfRbP/218V+EW+gUEdy5mJLwHj9y0sA
 xkLU0f7yvAS4BMxNUGL3zwHSSI3Vdmzjjs0GooTnByvI9aXUChZtpyALeIZK4kHERuiOib5/OA7
 APvJZ2mHwdiF2/euyt5otK6zhTa7BaQVu5vn5V6KBABjsG9kwg6bIXDr2INekpTfQim91tPYHTs
 2G6LSXSN+y3u6ti5wc2KIQJDzStF/KyIXBGj/pWRLN3Dd9un6CjbL9zvcjV1F6unOi6glKvPW4e
 K+chNvRhAaQE5YdIBOq53VESh6QTLaTLT9h4qIMuLrQOhO6RnbwEOALGlP00z4OZ2aq5WEve/yd
 VUJWxypgTZDzvFI63dw==
X-Proofpoint-GUID: oZT06GlT7XbbnrFVbwXXy4ZBA_g0yY7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030168

Hi Peter,

Thanks for detailed review.

On 8/29/2026 8:44 PM, Peter Rosin wrote:
> Hi Rahul, I believe you posted something like this as an RFC about half
> a year ago? Please include a pointer to the previous posting along with
> some notes about what changed since the last posting when you update a
> patch series. Thanks! And
>=20
>=20
> Hi Rahul,
>=20
> I believe you posted something like this as an RFC about half a year
> ago? Please include a pointer to the previous posting along with some
> notes about what changed since the last posting when you update a
> patch series. Thanks!

I will follow this with v2. For now I am adding the RFC link below,
https://lore.kernel.org/lkml/20260313060437.3704592-1-r-sharma3@ti.com

Not much has changed since RFC was posted first. In the binding doc
there was a term "syscon" which got added mistakenly, is now removed.
Event mux router is a complete IP block and not a syscon node, rest of
the content is same.

Due to lack of comments in RFC, this time I posted as fresh patch
series. That was anyhow the original plan.

>=20
> And sorry for being so very slow with the review. I intend to be more
> responsive going forward...
>=20
> Den Fri, Aug 28, 2026 at 03:36:15PM +0530, skrev Rahul Sharma:
>> The driver supports event muxing routers like gpio mux router and timesy=
nc
>> router. This driver is adaptation of original reg-mux driver, along with
>> changes specific to support TI's mux router.
>>=20
>> The idle states this driver supports are only 2 which active(represented
>> by 1 in dt-node) and in-active(represented by 0 in dt-node).
>=20
> I don't see the point of using 1 as idle state. Why would anyone
> do that?
>=20
>>=20
>> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
>> ---
>>  drivers/mux/Kconfig           |  15 +++
>>  drivers/mux/Makefile          |   2 +
>>  drivers/mux/ti-k3-event-mux.c | 235 ++++++++++++++++++++++++++++++++++
>>  3 files changed, 252 insertions(+)
>>  create mode 100644 drivers/mux/ti-k3-event-mux.c
>>=20
>> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
>> index eb34457beaab..58739a01f0d5 100644
>> --- a/drivers/mux/Kconfig
>> +++ b/drivers/mux/Kconfig
>> @@ -83,6 +83,21 @@ config MUX_RZV2H_VBENCTL
>>  	  To compile the driver as a module, choose M here: the module will
>>  	  be called mux-rzv2h-vbenctl.
>> =20
>> +config MUX_TI_K3_EVENT_ROUTER
>> +	tristate "TI Event Mux Router using MMIO registers"
>> +	depends on OF && (REGMAP_MMIO || COMPILE_TEST)
>> +	help
>> +	  This is extension of MMIO mux for  timesync router and gpiomux
>> +	  routers on TI K3 SoCs. This driver supports the 3-field format for
>> +	  mux control: <register-offset mask value>.
>=20
> The first sentence has some grammar issues, and the second talks
> about "the 3-field format" as if that is some well established format.

I just mentioned because it is different from standard Key-Value pairs :) .

> How about:
>=20
> 	  This is a mux for timesync and gpiomux routers on TI K3 SoCs.
> 	  The driver supports a 3-field format for mux control:
> 	  <register-offset mask value>.
>=20
>> +
>> +	  The driver allows configuration of hardware mux routers using
>> +	  memory-mapped registers. It's based on the mmio-mux driver but
>> +	  supports the extended 3-field format for more precise control.
>=20
> The person reading this would not care about the code ancestry, that
> info belongs elsewhere, and the 3-field format has already been
> mentioned. Thus, the second sentence can be dropped.
>=20
>> +
>> +	  To compile the driver as a module, choose M here: the module will
>> +	  be called mux-ti-k3-event.
>> +
>>  endmenu
>> =20
>>  endif # MULTIPLEXER
>> diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
>> index 0854c04613b9..114abf88b75e 100644
>> --- a/drivers/mux/Makefile
>> +++ b/drivers/mux/Makefile
>> @@ -9,6 +9,7 @@ mux-adgs1408-objs		:=3D adgs1408.o
>>  mux-gpio-objs			:=3D gpio.o
>>  mux-mmio-objs			:=3D mmio.o
>>  mux-rzv2h-vbenctl-objs		:=3D rzv2h-vbenctl.o
>> +mux-ti-k3-event-objs		:=3D ti-k3-event-mux.o
>> =20
>>  obj-$(CONFIG_MULTIPLEXER)	+=3D mux-core.o
>>  obj-$(CONFIG_MUX_ADG792A)	+=3D mux-adg792a.o
>> @@ -16,3 +17,4 @@ obj-$(CONFIG_MUX_ADGS1408)	+=3D mux-adgs1408.o
>>  obj-$(CONFIG_MUX_GPIO)		+=3D mux-gpio.o
>>  obj-$(CONFIG_MUX_MMIO)		+=3D mux-mmio.o
>>  obj-$(CONFIG_MUX_RZV2H_VBENCTL)	+=3D mux-rzv2h-vbenctl.o
>> +obj-$(CONFIG_MUX_TI_K3_EVENT_ROUTER)	+=3D mux-ti-k3-event.o
>> diff --git a/drivers/mux/ti-k3-event-mux.c b/drivers/mux/ti-k3-event-mux=
.c
>> new file mode 100644
>> index 000000000000..2469500d1b48
>> --- /dev/null
>> +++ b/drivers/mux/ti-k3-event-mux.c
>> @@ -0,0 +1,235 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MMIO register bit-field controlled multiplexer driver
>=20
> This is some left-over I presume?
>=20
>> + *
>> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.c=
om=20
>> + *
>> + * Based on drivers/mux/mmio.c by Philipp Zabel <kernel@pengutronix.de>
>=20
> So, why did you drop the Pengutronix copyright?
>=20
>> + * Modified to support 3-field format: reg-offset, mask & value
>> + *
>> + * Author: Rahul Sharma <r-sharma3@ti.com>
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/err.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/mux/driver.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/regmap.h>
>> +
>> +#define MUX_ENABLE_INTR BIT(16)
>> +
>> +struct mux_ti_k3_event {
>> +	struct regmap *regmap;
>=20
> I think this can be a single pointer in the below chip struct
> instead of "wasting" one pointer for each field, no?
>=20
>> +	u32 reg;
>> +	u32 mask;
>> +	u32 value;
>> +};
>> +
>> +struct mux_ti_k3_event_chip {
>> +	struct mux_chip *mux_chip;
>=20
> I do not see the need for this back-pointer to the mux chip.
>=20
>> +	struct mux_ti_k3_event *fields;
>> +	int num_fields;
>=20
> This is redundant. The mux-control count for a chip is available
> as mux_chip->controllers.
>=20
>> +	u32 *saved_states;
>> +};
>> +
>> +static int mux_ti_k3_event_suspend(struct device *dev)
>> +{
>> +	struct mux_ti_k3_event_chip *chip =3D dev_get_drvdata(dev);
>> +	int i, ret;
>> +
>> +	if (!chip->saved_states) {
>> +		chip->saved_states =3D devm_kcalloc(dev, chip->num_fields,
>> +						  sizeof(u32), GFP_KERNEL);
>=20
> Why not allocate this up-front during probe? Or, on second thought, why
> not just add a saved_state (non-array) member to struct mux_ti_k3_event?
>=20
>> +		if (!chip->saved_states)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	for (i =3D 0; i < chip->num_fields; i++) {
>> +		struct mux_ti_k3_event *field =3D &chip->fields[i];
>> +
>> +		ret =3D regmap_read(field->regmap, field->reg,
>> +				  &chip->saved_states[i]);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int mux_ti_k3_event_resume(struct device *dev)
>> +{
>> +	struct mux_ti_k3_event_chip *chip =3D dev_get_drvdata(dev);
>> +	int i, ret;
>> +
>> +	if (!chip->saved_states)
>> +		return 0;
>> +
>> +	for (i =3D 0; i < chip->num_fields; i++) {
>> +		struct mux_ti_k3_event *field =3D &chip->fields[i];
>> +
>> +		ret =3D regmap_write(field->regmap, field->reg,
>> +				   chip->saved_states[i]);
>=20
> Should you not apply the mask here?
>=20
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(mux_ti_k3_event_pm_ops,
>> +				mux_ti_k3_event_suspend,
>> +				mux_ti_k3_event_resume);
>> +
>> +/*
>> + * State behavior:
>> + * - state 0: Clears the mask bits in the target register (inactive sta=
te)
>> + * - state 1: Sets both the value bits and enable bit (bit 16) in the r=
egister
>> + */
>> +static int mux_ti_k3_event_set(struct mux_control *mux, int state)
>> +{
>> +	struct mux_ti_k3_event *fields =3D mux_chip_priv(mux->chip);
>> +	struct mux_ti_k3_event *field =3D &fields[mux_control_get_index(mux)];
>> +
>> +	if (!state)
>> +		return regmap_update_bits(field->regmap, field->reg, field->mask, 0);
>=20
> This is confusing to me. Why do you elect to leave the enable bit as-is
> and write only the zero value? Would it not be saner to clear out the
> enable bit as well?
>=20
> You should handle state =3D=3D MUX_IDLE_DISCONNECT here in the .set funct=
ion,
> see below for rationale.
>=20
>> +
>> +	return regmap_update_bits(field->regmap, field->reg, field->mask | MUX=
_ENABLE_INTR,
>> +		field->value | MUX_ENABLE_INTR);
>> +}
>> +
>> +static const struct mux_control_ops mux_ti_k3_event_ops =3D {
>> +	.set =3D mux_ti_k3_event_set,
>> +};
>> +
>> +static const struct regmap_config mux_ti_k3_event_regmap_cfg =3D {
>> +	.reg_bits =3D 32,
>> +	.val_bits =3D 32,
>> +	.reg_stride =3D 4,
>> +};
>> +
>> +static int mux_ti_k3_event_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct device_node *np =3D dev->of_node;
>> +	struct mux_ti_k3_event_chip *chip;
>> +	struct mux_ti_k3_event *fields;
>> +	struct mux_chip *mux_chip;
>> +	struct regmap *regmap;
>> +	void __iomem *base;
>> +	int num_fields;
>> +	int ret;
>> +	int i;
>> +
>> +	chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
>> +	if (!chip)
>> +		return -ENOMEM;
>> +
>> +	base =3D devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base)) {
>> +		return dev_err_probe(dev, -ENODEV,
>> +				     "failed to get base address\n");
>> +	} else {
>=20
> Drop the else + indentation when the if-block always returns.
>=20
>> +		regmap =3D devm_regmap_init_mmio(dev, base, &mux_ti_k3_event_regmap_c=
fg);
>> +	}
>> +	if (IS_ERR(regmap)) {
>> +		iounmap(base);
>=20
> Why do you need to explicitely unmap base?
>=20
>> +		return dev_err_probe(dev, PTR_ERR(regmap),
>> +				     "failed to get regmap\n");
>> +	}
>> +
>> +	ret =3D of_property_count_u32_elems(np, "ti,reg-mask-val");
>> +	if (!ret || ret % 3) {
>> +		ret =3D -EINVAL;
>> +		dev_err(dev, "ti,reg-mask-val property missing or invalid: %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	num_fields =3D ret / 3;
>> +	mux_chip =3D devm_mux_chip_alloc(dev, num_fields, num_fields *
>> +				       sizeof(*fields));
>> +	if (IS_ERR(mux_chip))
>> +		return PTR_ERR(mux_chip);
>> +
>> +	fields =3D mux_chip_priv(mux_chip);
>> +	chip->mux_chip =3D mux_chip;
>=20
> This feels backwards to me. Should not "chip" be what is returned
> from mux_chip_priv()? I.e. something like this:
>=20
> 	mux_chip =3D devm_mux_chip_alloc(dev, num_fields, sizeof(*chip));
> 	chip =3D mux_chip_priv(mux_chip);
> 	chip->fields =3D devm_kcalloc(dev, num_fields, sizeof...
>=20
> (error checking omitted)
>=20
>> +	chip->fields =3D fields;
>> +	chip->num_fields =3D num_fields;
>> +
>> +	platform_set_drvdata(pdev, chip);
>=20
> I think you should use mux_chip as drvdata. I assume this is why you
> needed the back pointer to the mux_chip at some point.
>=20
>> +
>> +	for (i =3D 0; i < num_fields; i++) {
>> +		struct mux_control *mux =3D &mux_chip->mux[i];
>> +		s32 idle_state =3D MUX_IDLE_AS_IS;
>> +		u32 reg, mask, value;
>> +
>> +		ret =3D of_property_read_u32_index(np, "ti,reg-mask-val",
>> +						 3 * i, &reg);
>> +		if (!ret)
>> +			ret =3D of_property_read_u32_index(np, "ti,reg-mask-val",
>> +							 3 * i + 1, &mask);
>> +		if (!ret)
>> +			ret =3D of_property_read_u32_index(np, "ti,reg-mask-val",
>> +							 3 * i + 2, &value);
>> +		if (ret < 0) {
>> +			dev_err(dev, "field %d: failed to read ti,reg-mask-val property: %d\=
n",
>> +				i, ret);
>> +			return ret;
>> +		}
>> +
>> +		/* Validate that value bits are within mask */
>> +		if (value & ~mask) {
>=20
> This is broken and only works as expected if "mask" is a bitfield
> based at the lsb. You should keep the limitation from the mmio
> driver that "mask" has to be a proper field (without holes)
> and you should shift things such that "value" is what will be
> written to that field, and not what will be written to the whole
> register.
>=20
>> +			dev_err(dev, "field %d: value 0x%x has bits outside mask 0x%x\n",
>> +				i, value, mask);
>> +			return -EINVAL;
>> +		}
>=20
> I think you should also check that the mask does not clobber
> the enable bit.
>=20
>> +
>> +		fields[i].regmap =3D regmap;
>> +		fields[i].reg =3D reg;
>> +		fields[i].mask =3D mask;
>> +		fields[i].value =3D value;
>> +
>> +		/* This driver supports binary mux (2 states: 0 and active) */
>> +		mux->states =3D 2;
>=20
> This is weird. You apparently only have one leg on these muxes,
> and need to turn them on/off with a MUX_IDLE_DISCONNECT idle
> state instead of abusing an extra state that can never be used
> as an actual valid state.
>=20
> I.e. these things are not really muxes at all, they are more
> like gates, methinks.
>=20
> And all this indicate that the idle state handling below is
> completely bogus. The only sane idle-state with the current
> patch is zero. So, why require the user to fill that in?
> Why not force it instead? But see above, the idle state
> should not be forced to zero but to MUX_IDLE_DISCONNECT and
> state zero should be the only state and the state that "opens
> the gate" when selected.
>

I will work on the idle state improvements and masks usage, thanks again.


> With all that said, I worry about what happens if you write
> other values in the reg-field? Since you have added this as
> a mux driver when you really have implemented gates, I have
> this feeling that the hw spec calls these registers muxes
> and that they can be used to wire vastly different things
> together. If so, what if you need some of these other values
> in the register? I don't know where to look and have not gone
> trawling the TI site for details, do you perhaps have some
> reference for how these registers work?
>=20

The TRM for this IP block is having better block diagrams. I can't paste
them here but below is the github link that shows ASCII equivalent block
diagram for event-mux-router IP block, this is the best I could get.

https://github.com/lucifer-9852/linux/commit/aed1746e411a9f0ad7824f4e4a7121=
e6f56a4ef2

For detailed view of IP you can refer Section 10.2 and 10.2.1 of TRM
https://www.ti.com/lit/pdf/sprujb4

So, from the above diagrams you can see that it is indeed a mux block
instead of a gate, why ? Because there are mux registers corresponding
to each output lines, and they do the job of selection lines in the mux.
Here, the mux type is not many-to-one but instead many-to-few. The mux
register holds the index value of input lines, which are fixed in count.

BR,
Rahul

> Cheers,
> Peter
>=20
>> +
>> +		of_property_read_u32_index(np, "idle-states", i,
>> +					   (u32 *)&idle_state);
>> +		if (idle_state !=3D MUX_IDLE_AS_IS) {
>> +			if (idle_state < 0 || idle_state >=3D mux->states) {
>> +				dev_err(dev, "field: %d: out of range idle state %d\n",
>> +					i, idle_state);
>> +				return -EINVAL;
>> +			}
>> +
>> +			mux->idle_state =3D idle_state;
>> +		}
>> +	}
>> +
>> +	mux_chip->ops =3D &mux_ti_k3_event_ops;
>> +
>> +	return devm_mux_chip_register(dev, mux_chip);
>> +}
>> +
>> +static const struct of_device_id mux_ti_k3_event_dt_ids[] =3D {
>> +	{ .compatible =3D "ti,am62l-event-mux-router", },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, mux_ti_k3_event_dt_ids);
>> +
>> +static struct platform_driver mux_ti_k3_event_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "ti-k3-event-mux",
>> +		.of_match_table	=3D mux_ti_k3_event_dt_ids,
>> +		.pm =3D &mux_ti_k3_event_pm_ops,
>> +	},
>> +	.probe =3D mux_ti_k3_event_probe,
>> +};
>> +module_platform_driver(mux_ti_k3_event_driver);
>> +
>> +MODULE_DESCRIPTION("TI K3 Bit-field Controlled Event Multiplexer driver=
");
>> +MODULE_AUTHOR("Rahul Sharma <r-sharma3@ti.com>");
>> +MODULE_LICENSE("GPL");
>> --=20
>> 2.34.1
>>=20
>=20

