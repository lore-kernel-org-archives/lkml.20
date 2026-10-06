Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A7F282F05;
	Tue,  6 Oct 2026 05:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791263996; cv=fail; b=nZ7wO2ElmVcK/gHfG9iOamW6l/61dWS1qKdjIqfI4NvLIdi6FuGhtD6vrLn+iEedDBtto8guNI662O1cwVeECa9aAqPigW8/mmKgzRp+vxtxXMcc0ScdJbH0dxJ2L8TgBPnx0ozhTU8nKqCCDkbvFa6EAOvixLHRLYOMrxNuLS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791263996; c=relaxed/simple;
	bh=67gp3xoCotzliz/Xxjikz3t2DZgrDpwNhh0H1W/lHsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ncqcs6fF8xy/j+aP8ECUgNgJF0Oup3nRXCRpMxU2GrsWgHmjPlBWbvbO48svXCsNAJSSFCH1UeV+zfuXBzKvqZ8qALns5pu1igDurFVQ7+5NKWz6ODhRJnuymps3JzzvCWCELwmDs+FKj48eKQHXBbkefLVrYXYEpKHym9Jxn+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kqx4SiHj; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=IpPLiuwQ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kqx4SiHj";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="IpPLiuwQ"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69639R0b1498687;
	Tue, 6 Oct 2026 00:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=n6VuWwqIuiyJsIzaKs27cx1CP8hzYtP1fcwlrVpgH
	H8=; b=kqx4SiHjnw0h7agY2bfH9LmtuSup62+7XLTLFHX16aKbOp8bulA7Ta35S
	eKIwCbsmFFc8/rN1wGTsbdeZGMuKaNG9+5DiEGXZ896x+YNXD6H0FYDvmbqQTWqr
	aMYXnn/M9lfLBwx6arZtHLSeOlPzQfsb72dYRwsrsHdS590gMzuVCzV3w7K8xC5e
	AxGIml6K2QqKKxbK+ScP2wjJUS/d2QXP8qpfi3PBy4H5tgzsAe8LNv5k1h8tEgQq
	DqORDzhbxIgrPjcdrq1vJUy2ThoyfFSVxHTyWtFmyfF0YCa2+nT2AS6lY76wTXBi
	muejxKFDnc2mqn8RbyVapqMtJi3gw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h3knntag3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 00:19:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfbwgQUFmZvfvIlTL7XEIiGDD5XkePMihMok+HKl95xLpHVw084kvrn/vCWLKOsl4++OcJlF6TnGtKyVDF1LhFAUoUv+yUq8KAGAUciAYPI4/qlY2HgvRlYmFswQHMQKiMBB1l5Rs/Qq5WSa/i0MkeS9I7hMfEWb2E53qVQPv13BLLu2Cs5bSgTx+mzq5HnlTgUnCIjVpqvbq0hRRR0crv4VfYfVUUfxXuu9PEXWKJfi8TNe+F8PM8w0kua8rKPxhV9I9AS2mtD3TmHia7uCyaZETQOYkRYmrZYkWR5NhziQVZq3IqzaaepryjD4EJtAO7wUJ0XIFv5dromf/nYgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6VuWwqIuiyJsIzaKs27cx1CP8hzYtP1fcwlrVpgHH8=;
 b=Y4mwTrf+jmbxzXkk7I2uRBrLrCBlfy0TyLuBdp19LyMX7VPfzpSiiSikJC/8QJk8jxpSUSqY0mXP0IjjnDb9KP8FJnbw/FqudgbizshMaH04K/cn4uc3X3PlL6R9ykJI9nbMwxvICzFM2pSLa6SylGzAdEubFDxVZ/UEHcKrqANX23CZGKRhnBdbDKMAHMC0vZ6CeSkAahiWL6GuH/9I+Kil/uwn6YNB6GKHasxWy2AUf87RWTFkhYA733kRos0+t1/QwXkj4RDh7JJskUmzs11NR9fBL0GLdGZCvT7YIm09e8QT2sUtHvN2VrXCWfoiLqv29Ym7qpV+0DbOef6DDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6VuWwqIuiyJsIzaKs27cx1CP8hzYtP1fcwlrVpgHH8=;
 b=IpPLiuwQTUIx2SnCaBgaoL1js+LsDAdGIKhtz6D7+Wy4JO+cU19fd4LcM44MQSE1CpQQaHSzjMZzPIrbrNpcTr6yxYwYpNPDkIIZftMjXIbPtAUANEFcAg9TxoSo81qqSGDDEa/rrfTgsxTvmwrpLyHBrIafyjrvVBvyUpniVhg=
Received: from BN9PR03CA0206.namprd03.prod.outlook.com (2603:10b6:408:f9::31)
 by DM4PR10MB6207.namprd10.prod.outlook.com (2603:10b6:8:8c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.18; Tue, 6 Oct 2026 05:19:31 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:408:f9:cafe::2e) by BN9PR03CA0206.outlook.office365.com
 (2603:10b6:408:f9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Tue, 6
 Oct 2026 05:19:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 6 Oct 2026 05:19:30 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 6 Oct
 2026 00:19:10 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 6 Oct
 2026 00:19:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 6 Oct 2026 00:19:10 -0500
Received: from [10.24.52.125] (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6965J4K31592423;
	Tue, 6 Oct 2026 00:19:05 -0500
Message-ID: <3a488385-bf10-4500-b78d-e43c152387a4@ti.com>
Date: Tue, 6 Oct 2026 10:49:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312 driver
To: Mirela Rabulea <mirela.rabulea@nxp.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <sakari.ailus@linux.intel.com>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <laurent.pinchart@ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-7-r-donadkar@ti.com>
 <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|DM4PR10MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bc18dc-82c0-4ec5-82f6-08df23696691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|36860700016|82310400026|4143699003|3023799007|10067099003|56012099006|260925022911599003|260925021311599003|260925021911599003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	l8fqbQsOYJ0L7jGZGxkZubtYD/nnbKe+n6im6ozsKKZOZECrkyHTCwE8FMYtSu0iJuXQp5N8uue2KM1eyuOW832b+y/qHymYjxLmFxEqa3gDUjmF3ey0Fwaiap8IXKRqxzk9bGp0o/PEjnUFsRbXRZ/UjrTx3RqPmpERpiVukNNJFDOnxpRcOCe8g9hf9KYAervZoYEIC2NaL7LmBMibjwe21PIx/GIJfw3jQalkuzb9oagVQ1T31foY4xA4cB5OUijRCkDo0vH12fQuQcGe6P+QkJmL7v6dQ1fPcG7M0XCCaOkndFbp5oKEtQKFzflQ5hXI6RT7sikezJo/WNjh6DCq9sPD6As3cjy4mC0Rh+QI25N63T1zvpm5z+KxwJHYDA6gXswkwvqHLD7qu3rSlS0NCQSUklYNer5OOZEdKwzmLcKGaN7GvXWcal/XI16K2Gwv0a4QvsgUMhLZA+KVbn65TQV4xIbXeyKk3J/WNU+lfVueTGGnmo1glpCtGFh5rjstp1pBl8JFH5hYx2ljSRkuKz4M5s0ok+Hzq/49SPO1dpWCzRtF7qXFixkOh1Y0nRG643cjUS3p7y4UPlS84aptiJOvc1ikLeiCTVLXEt6km/FvUy0VVqaXa426011KugNztponahOd26UDyuWnSRJqtZr1LwsPyuf6eAYxIn6q8F3kDgQGWktLWIOU4HFW4+aCJ5PlOUCtbHZSTVTDng==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(36860700016)(82310400026)(4143699003)(3023799007)(10067099003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	plmKxDxTM6biSdeEYBlYtSEXmX8HfJZyAVS4dEwWTr9Mey+dLR8S99i99ByBuaUrGkBlvqeeFrkuR8K7Q4jD/lKy6Ec4rfv8czSekuV+PEDZ6Z1amJVhnYBd1em3ClwhiFonV+S8WcbcUtShbrocLg7cMBBzzD9MHxIQjAgx6XadWH2H3QPuZcKrMJXmhDxWJoubnJiveE04sgcX8fL0gOk0+hSUIpWw7KTdInZBJKALoIPj/X9ILVfBefCTcxgdLolh8Ddd7cczNgPAsXiAjvFifZ4o0O/EYXFm3GaCHGJTr7abRW4TISRGqIrF4YEjM4Y0aFB6ijVL4rwH9tOdkoIQT/sklbEfqAe6tXropa+u2o3kCE3Pz3B4t09krrIA/DI2nyKlMQ703pj5GdgPh3ylEOrbx9jzCDAzgthyim3wfAUyzEwdX5MQDkXAx41D
X-Exchange-RoutingPolicyChecked:
	uc6NMK7j1l7rNt4tz06oCWPhJaZy0G/uYYv1k2Hv7vq48MG0PyJfrzVbZ2YyR4v1WkGGXvrHTwBtKjepvh8ZGNDn+wx4CbbKhasOeWlgiKy6ebiBDtcKTKves8sGMiv0+TKDmNyBwJyK2y0aUd4Q2rcGiNsEOu/ovhYo7OWMRNZcWIzCiceDFEropfHR4yitIZHb4TPbzZIo1bJnrb/LFQM+N3ZL2z1SkLhLGGF7vBeB8aqRuLXUUmBVbz6imT/f7vD3J+3ZfyBXE+Dyy8QLGbeWPGoo7l2kLm9b4q61q5E6Rlkf2Nh9gKjqBPgYSeTUrKYRUc7H1Jjny9lf5JOzvw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 05:19:30.8085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bc18dc-82c0-4ec5-82f6-08df23696691
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6207
X-Authority-Analysis: v=2.4 cv=I/7w19gg c=1 sm=1 tr=0 ts=6ac484e7 cx=c_pps
 a=26exYMEZoLJjBWxBNK6Yow==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=H3YlM2HQjALGYdipHVsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LJybgPlbIYRaQvPib1g1XYuvcgP61fBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMCBTYWx0ZWRfX4SDomniFRt6o
 TfjbKTnVOU8AZwqzqL+LZRGEBqwA7cmTNqLD8R70GfuH51d0OGrQGY/HBYP30aJEnzNZR8ZOApg
 yEx7uTZwoDoDXMvn1boErZMG/gZ19QyHJ4ppQV84fy6Jnf12UHNFFokucpvpfCVh21VjBq9wgca
 Oo3oqegxOADUCJJy9kKRqSZYlWbFUZdUedWwIr4VnOaPrxoN3QBzwAWqJv0/2vTvdJkzsShs77S
 obcj5SivHoizlRnelnChn6DommwjJRu0xgxpA1OuYB7zUsI5N2MRi6LRRGeb4uJp/M6Vq3MyDV6
 Z8zywiqD3lKUgthe03qJwWcM2L6ZJ6mHpSS0tQ6Q+CUJ54rmoQ2/plutrm9HNyksbx6HCcNte0a
 PYskNJvMD0NVWW5YZdjPKq5sZmU7O/86sXlWmyaDoFkXkn1ekROYGq1h0LAnHfXOS4TxdCRV0Ov
 sQ9GtohO4e6YILzlUXg==
X-Proofpoint-ORIG-GUID: LJybgPlbIYRaQvPib1g1XYuvcgP61fBJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMCBTYWx0ZWRfXysFxIIfK2oaQ
 c7C7nrI0MccTJtvWTV41PRY8TUDFvYwdZZKR937FByWJ/ZqAhfHQk61hNw1nN21KSkLeO9j2JAy
 FLMFz9/rcgmzSYMDPJPnA4GDuaixMcA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060020



On 02/10/26 21:46, Mirela Rabulea wrote:
> Hi Rishikesh, Jay, Laurent, Hans, Sakari,
> 
> On 9/25/26 16:29, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Omnivision OV2312 is an RGB-IR sensor, i.e. it uses a 4x4 R,G,B,Ir bayer
>> pattern to capture both visible and near-infrared light. Every alternate
>> frame, the sensor changes the exposure and IR flash strobe registers to
>> stream an -
>> A. IR-dominant frame on CSI-2 virtual channel 0
>> B. RGB-dominant frame on CSI-2 virtual channel 1
>>
>> These A/B frames are routed as separate v4l2 streams, which may be
>> mapped to two separate /dev/videoX nodes by the CSI-RX DMA driver.
>>
>> Both of these streams are captured at a resolution of 1600x1301, 30 fps
>> each (60fps total). The extra row (1301 vs 1300) is an embedded line
>> prepended to each frame by the sensor, containing the following register
>> values:
>>    0x4813 - VC (Virtual Channel)
>>    0x321A - Group ID
>>    0x3920 - Strobe
>>    0x3501 - Exposure HI
>>    0x3502 - Exposure LO
>>    0x3508 - Gain HI
>>    0x3509 - Gain LO
>>    0x350e - Current Exposure HI
>>    0x350f - Current Exposure LO
>>
>> This driver also supports a few v4l2 controls like horizontal/vertical
>> flip, multi exposure and multi gain controls.
>>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/i2c/Kconfig  |  12 +
>>   drivers/media/i2c/Makefile |   1 +
>>   drivers/media/i2c/ov2312.c | 939 +++++++++++++++++++++++++++++++++++++
>>   drivers/media/i2c/ov2312.h | 285 +++++++++++
>>   4 files changed, 1237 insertions(+)
>>   create mode 100644 drivers/media/i2c/ov2312.c
>>   create mode 100644 drivers/media/i2c/ov2312.h
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 4d9946479160..8d9d8d491b2e 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -496,6 +496,18 @@ config VIDEO_OV13B10
>>            This is a Video4Linux2 sensor driver for the OmniVision
>>            OV13B10 camera.
> ...
>> +
>> +static int ov2312_read(struct ov2312 *ov2312, u16 addr, u32 *val, 
>> size_t nbytes)
>> +{
>> +       int ret;
>> +       __le32 val_le = 0;
>> +
>> +       ret = regmap_bulk_read(ov2312->regmap, addr, &val_le, nbytes);
> I've received in the past feedback to use cci_* helpers instead of 
> regmap, see drivers/media/v4l2-core/v4l2-cci.c

Sure, I will use them.

>> +       if (ret < 0) {
>> +               dev_err(ov2312->dev, "%s: failed to read reg 0x%04x: 
>> %d\n",
>> +                       __func__, addr, ret);
>> +               return ret;
>> +       }
>> +
>> +       *val = le32_to_cpu(val_le);
>> +       return 0;
>> +}
>> +
>> +static int ov2312_write(struct ov2312 *ov2312, u16 addr, u32 val, 
>> size_t nbytes)
>> +{
>> +       int ret;
>> +       __le32 val_le = cpu_to_le32(val);
>> +
>> +       ret = regmap_bulk_write(ov2312->regmap, addr, &val_le, nbytes);
>> +       if (ret < 0)
>> +               dev_err(ov2312->dev, "%s: failed to write reg 0x%04x: 
>> %d\n",
>> +                       __func__, addr, ret);
>> +       return ret;
>> +}
>> +
>> +static int ov2312_write_table(struct ov2312 *ov2312,
>> +                             const struct reg_sequence *regs,
>> +                             unsigned int nr_regs)
>> +{
>> +       int ret, i;
>> +
>> +       for (i = 0; i < nr_regs; i++) {
>> +               ret = regmap_write(ov2312->regmap, regs[i].reg, 
>> regs[i].def);
>> +               if (ret < 0) {
>> +                       dev_err(ov2312->dev,
>> +                               "%s: failed to write reg[%d] 0x%04x = 
>> 0x%02x (%d)!\n",
>> +                               __func__, i, regs[i].reg, regs[i].def, 
>> ret);
>> +                       return ret;
>> +               }
>> +       }
>> +       return 0;
>> +}
>> +
>>
>>
>>
>> + */
>> +static int ov2312_set_group_a(struct ov2312 *ov2312)
>> +{
>> +       u32 ir_exposure = ov2312->exposure_multi->p_new.p_u32[1];
>> +       u32 ir_again    = ov2312->again_multi->p_new.p_u32[1];
>> +       u32 ir_dgain    = ov2312->dgain_multi->p_new.p_u32[1];
>> +       u32 ir_strobe_start = OV2312_VTS - ir_exposure - 7;
>> +       int ret;
>> +
>> +       struct reg_sequence ov2312_groupA[] = {
>> +               {0x3208, 0x00},/* Group A (IR Dominant VC0) */
>> +               {OV2312_AEC_PK_EXPO_HI, (ir_exposure >> 8) & 0xff},
>> +               {OV2312_AEC_PK_EXPO_LO, ir_exposure & 0xff},
>> +               {OV2312_AEC_PK_AGAIN_HI, (ir_again >> 4) & 0xff},
>> +               {OV2312_AEC_PK_AGAIN_LO, (ir_again & 0x0f) << 4},
>> +               {OV2312_AEC_PK_DGAIN_HI, (ir_dgain >> 8) & 0xff},
>> +               {OV2312_AEC_PK_DGAIN_LO, ir_dgain & 0xff},
>> +               {0x3920, 0xff},/* IR Strobe duty cycle */
>> +               {0x3927, (ir_exposure >> 8) & 0xff},
>> +               {0x3928, ir_exposure & 0xff},
>> +               {0x3929, (ir_strobe_start >> 8) & 0xff},
>> +               {0x392a, ir_strobe_start & 0xff},
>> +               {0x4813, 0x01},/* VC=1. This register takes effect 
>> from next frame */
>> +               {0x3208, 0x10},
>> +               {0x320D, 0x00},/* Auto mode switch between group0 and 
>> group1 ;setting to switch */
>> +               {0x320D, 0x31},
>> +               {0x3208, 0xA0},
>> +       };
>> +
>> +       ret = regmap_register_patch(ov2312->regmap, ov2312_groupA,
>> +                                   ARRAY_SIZE(ov2312_groupA));
>> +       if (ret < 0)
>> +               dev_err(ov2312->dev,
>> +                       "%s: failed to apply Group A register patch 
>> (%d)!\n",
>> +                       __func__, ret);
>> +       return ret;
>> +}
>> +
>> +static int ov2312_set_group_b(struct ov2312 *ov2312)
>> +{
>> +       u32 rgb_exposure = ov2312->exposure_multi->p_new.p_u32[0];
>> +       u32 rgb_again    = ov2312->again_multi->p_new.p_u32[0];
>> +       u32 rgb_dgain    = ov2312->dgain_multi->p_new.p_u32[0];
>> +       int ret;
>> +
>> +       struct reg_sequence ov2312_groupB[] = {
>> +               {0x3208, 0x01},/* Group B (RGB Dominant VC1) */
>> +               {OV2312_AEC_PK_EXPO_HI, (rgb_exposure >> 8) & 0xff},
>> +               {OV2312_AEC_PK_EXPO_LO, rgb_exposure & 0xff},
>> +               {OV2312_AEC_PK_AGAIN_HI, (rgb_again >> 4) & 0xff},
>> +               {OV2312_AEC_PK_AGAIN_LO, (rgb_again & 0x0f) << 4},
>> +               {OV2312_AEC_PK_DGAIN_HI, (rgb_dgain >> 8) & 0xff},
>> +               {OV2312_AEC_PK_DGAIN_LO, rgb_dgain & 0xff},
>> +               {0x3920, 0x00},
>> +               {0x4813, 0x00},/* VC=0. This register takes effect 
>> from next frame */
>> +               {0x3208, 0x11},
>> +               {0x320D, 0x00},/* Auto mode switch between group0 and 
>> group1 ;setting to switch */
>> +               {0x320D, 0x30},
>> +               {0x3208, 0xA0},
>> +       };
>> +
>> +       ret = regmap_register_patch(ov2312->regmap, ov2312_groupB,
>> +                                   ARRAY_SIZE(ov2312_groupB));
>> +       if (ret < 0)
>> +               dev_err(ov2312->dev,
>> +                       "%s: failed to apply Group B register patch 
>> (%d)!\n",
>> +                       __func__, ret);
>> +       return ret;
>> +}
>> +
>> +static int ov2312_set_AB_mode(struct ov2312 *ov2312)
>> +{
>> +       bool ir_ready  = ov2312->exposure_multi->p_new.p_u32[1] &&
>> +                        ov2312->again_multi->p_new.p_u32[1] &&
>> +                        ov2312->dgain_multi->p_new.p_u32[1];
>> +       bool rgb_ready = ov2312->exposure_multi->p_new.p_u32[0] &&
>> +                        ov2312->again_multi->p_new.p_u32[0] &&
>> +                        ov2312->dgain_multi->p_new.p_u32[0];
>> +       int ret;
>> +
>> +       if (ir_ready) {
>> +               ret = ov2312_set_group_a(ov2312);
>> +               if (ret < 0)
>> +                       return ret;
>> +       }
>> +
>> +       if (rgb_ready) {
>> +               ret = ov2312_set_group_b(ov2312);
>> +               if (ret < 0)
>> +                       return ret;
>> +       }
>> +
>> +       /* Wait for 1 frame duration after setting AB mode registers */
>> +       if (ir_ready || rgb_ready)
>> +               msleep(33);
>> +
>> +       return 0;
>> +}
>> +
>> +static int ov2312_set_orientation(struct ov2312 *ov2312)
>> +{
>> +       bool v_flip = ov2312->v_flip->val;
>> +       bool h_flip = ov2312->h_flip->val;
>> +       u32 reg = (v_flip ? 0x4400 : 0) | (h_flip ? 0x0004 : 0);
>> +
>> +       return ov2312_write(ov2312, OV2312_TIMING_VFLIP, 
>> be16_to_cpu(reg), 2);
>> +}
>> +
>> +static int ov2312_set_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +       struct ov2312 *ov2312 = container_of(ctrl->handler,
>> +                                            struct ov2312, ctrls);
>> +       int ret;
>> +
>> +       /*
>> +        * If the device is not powered up by the host driver do
>> +        * not apply any controls to H/W at this time. Instead
>> +        * the controls will be restored right after power-up.
>> +        */
>> +       if (pm_runtime_suspended(ov2312->dev))
>> +               return 0;
>> +
>> +       switch (ctrl->id) {
>> +       case V4L2_CID_EXPOSURE_MULTI:
>> +       case V4L2_CID_AGAIN_MULTI:
>> +       case V4L2_CID_DGAIN_MULTI:
>> +               dev_dbg(ov2312->dev, "debug: %s: %s = [%u, %u]\n", 
>> __func__,
>> +                               ctrl->name, ctrl->p_new.p_u32[0], 
>> ctrl->p_new.p_u32[1]);
>> +
>> +               ret = ov2312_set_AB_mode(ov2312);
> 
> So, the group hold for A/B context is set right away, when the control 
> arrives.
> 
> While working with the Omnivision OX05B1S, which is also an RGB-IR 
> sensor, we run into this problem:
> 
> The normal expected sequence is that the sensor will output alternating 
> frames VC0, VC1, VC0, VC1,...
> 
> But  when user space tries to do automatic exposure and gain control via 
> v4l2 muti controls, if the driver applies the values immediately, if the 
> virtual channels are not switched within the proper timeframe, it is 
> possible to run into frame duplication (no more nice alternating frames 
> VC0, VC1, VC0, VC1,...but duplicate VC0,VC0 or VC1,VC1).
> The information we received from the sensor vendor is that group0 update 
> needs to be between 2 group0 launchpoints (similar for group 1). We can 
> use the status register to query the currently active context, and in 
> order to avoid frame duplication we can update each group only when its 
> context is active.

Just to clarify, when you say "update each group only when its context 
is active" you mean when the frame for that group is being captured right?

Lets say group0 is launched, do we need to set the exposure for group0 
before the next group i.e. group1 is launched?

Rishikesh

> 
> This is problematic in the v4l2-api context, it implies that even while 
> streaming, a v4l2 control cannot be committed to sensor registers right 
> away.
> 
> Even with workarounds in the sensor driver, to defer for later the 
> updates for the inactive context, it is still problematic: defer for how 
> long, and problems with overloaded systems, a stress test can bring us 
> in a broken VC sequence, as there is no atomic way to determine the 
> current active context + update the right group.  A broken VC sequence 
> shows up for example in libcamera as lost frames.
> 
> Rishikesh, Jai,
> 
>   did you notice this problem on OV2312? A way to reproduce this is to 
> stress the driver with frequent repeated set controls (for the multi- 
> controls), and observe broken VC sequence (I observed it with libcamera 
> and on the CSI analyzer).
> 
> 
> Laurent, Hans, Sakari,
> 
> did you encounter similar situations? Any comments or proposals? The 
> concern here, to summarize, is: v4l2 control cannot be committed to 
> sensor registers right away (even when streaming) and we are also unsure 
> when the right moment to perform the register access may come.
> 
> 
> Regards,
> 
> Mirela
> 
>> +               break;
>> +
>> +       case V4L2_CID_HFLIP:
>> +       case V4L2_CID_VFLIP:
>> +               ret = ov2312_set_orientation(ov2312);
>> +               break;
>> +
>> +       default:
>> +               ret = -EINVAL;
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>>

