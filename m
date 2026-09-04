Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49E54E80A5;
	Fri,  4 Sep 2026 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534024; cv=fail; b=Y0MKmdsdGqiAMVdhByKMqOwaGfJ+u104Hk8HCXOeNUG8C1MZnOoisBT/qq/Bo3/AgV1mFi2Xm21H61lsvFcArjDSMq8GwFMbX+qHM2u0v3S0QBSI9kobqFIFGZB2p8NUH65kx6lQCzOv4wbnXzRs2o6x0BR4FOiE6Bd6aENR11g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534024; c=relaxed/simple;
	bh=sNh6sE3eiEpNMLUOF1GTCLFO/QfGol9pHOEbBuODmmc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4uhrJV1XhONYxSVdBIv91bgVTjDD+y9ancrZARr7C/ZVJpb4dy42md3wmU6oS9tfWv6MjIbmaZLgUsVXDjA+gnfofHLaGhKqFNEVKRMRWhtlHb48T02kKiNZZHLrdjRi7p4TwfAJo2vNUbQAfKDphPWgjhR/iAK9PgBJyWrrd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=GQGv2fz7; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=s6jDaw8W; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="GQGv2fz7";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s6jDaw8W"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684EsWTP4004532;
	Fri, 4 Sep 2026 10:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=3kt7ogs6ftKoLEz
	ksAw8YMbsUaFzEc69j4NbJkTyxyU=; b=GQGv2fz7P2r8fXH0vRUmPLelidFEofo
	D4Xs6hbF9zbovidx1IOXcUB9cKnlD/OOftv7j3hN09lR0ECgTRzBtg8521A9GVPA
	drYH0n8AMrmMwKf73K2zfKBTL/MVaqQZNohrRjJgpmx9dSNVryLDu5UWF705OGa+
	P99gjUBVHld/0WuOHuI5h9yJql2DSwTPjAqsfG/SSUIoW8v6RdNZ053fkVwEyjdA
	Ky+FejadhfuJrX/UgPuG2QTqqHQIr31wR9NlZk3WfPxuJWGizATrTpQJODvfhryE
	3GzvQjhOvXSQHDcYDD7FuMwZLQTC+DUpjwDi7HeA1dRfkX8+XzrwuYg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gg02sr3yj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 10:00:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miV0MvMIrTELe6nIkmCP5WhsPbAI7n8AjNItp0reExoBiqNTi4cl3UpoMyzW90/f5ewzc/0R0fDknGSqo/ywy1zODROtTOi9NqoMm5IxhpskY4EgpdBSoj3y5ZbfAhxbQ7sN2l/cRsqHp+UEpixsy9TPYHE9dzhy62DOaiPewpjKybUWBEQLK/qhPR2irKwLss27fUsTzygMVbAFKiwgILcO5kGXgpePW95uJCfb5qasKbJK817nIe6jLgOjvYx4EcOZLI9xVtgvUS3pH7ekRLyLQm3hGKhjFegq6rZWvY4yPCuujvIv2pq2ylEKR+LIz+0lbkcYig66MwwdDNSBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kt7ogs6ftKoLEzksAw8YMbsUaFzEc69j4NbJkTyxyU=;
 b=eXqztE9PeSQkeMMpF+V5QSihtPk9ZkYQ5mrwDmZOHfXnmBZuVXT1E068BzBqsoZFx8mDI9BUJ1YwhUDyZatODzFLLCwfBwli6qiBgEMxFKc2DKgHzbie5viwdy8Hb04MT3LvDVlu52tIcNOxT4t+5qx4V+fSkFy19vtzrXdDoDA2LMBUYxlJo7HRzGCn436ndRDGfBvHzUVsEi344AT+zadlKXCus+5YJZBA+ea+R71VA7r5gFEtF9KiX++WdLFNx2inlgUSo7gwdbmC3+u/FIrdB89KueYKrpy7jSARQ82FIe9yc7GOh23uQBKVT9GYVRnj+W/pVr3SqiY1Io1djg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kt7ogs6ftKoLEzksAw8YMbsUaFzEc69j4NbJkTyxyU=;
 b=s6jDaw8WWK4AUlx7D1viQMQx5lr0AOlg1P+EXKbah7YQ3+eKjQZXTHNNVRdpxqak+3/38J8g/xUl+Gs9fBTeGG47WD9NsEjq3Fvb3e3Bb08ZTrTk8kfdQJsZOHZDN1wpvyD2+F1HAMhE5WzMmnzYQksp/4YtjWnsZGI9QEZeM/o=
Received: from BN9P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::17)
 by DS0PR10MB7149.namprd10.prod.outlook.com (2603:10b6:8:dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Fri, 4 Sep 2026
 15:00:10 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::71) by BN9P222CA0012.outlook.office365.com
 (2603:10b6:408:10c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 15:00:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 15:00:09 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 09:59:13 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 09:59:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 09:59:13 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684ExDO03704141;
	Fri, 4 Sep 2026 09:59:13 -0500
Date: Fri, 4 Sep 2026 09:59:13 -0500
From: Kendall Willis <k-willis@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <s-kochidanadu@ti.com>,
        <a-kaur@ti.com>, <s-tripathi1@ti.com>, <vishalm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-am62p: use ti,am62-m_can
 compatible for m_can devices
Message-ID: <20260904145913.a437wnuif4arwb7j@uda0506412>
References: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
 <20260902-smth-v2-3-b3678ca44c7b@ti.com>
 <412fc9b3-cac5-4fff-8071-ca2d4855db30@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <412fc9b3-cac5-4fff-8071-ca2d4855db30@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|DS0PR10MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: feb9db98-bd1b-42e5-368b-08df0a9536b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|10067099003|4143699003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	CWqhqXbq9Jcd07HuQyIqxg3zXfBAjeaklTRUOd8kgdcoAooGg2flAnRwSl0ygToW48oNv1pIYOSVYWs3SbeIMpIytpAlod1FkTG/Jau64IWteTLYxshQ0Tt1KT6OhoYp0bOsxgw0sDaaG6EUQ2b/dkM9WylpsANoqBkAxqAz82JW1JjdYS6+6B4xgyze4xm1DtbLx6GHAFU1ek+uNQyDS9eXCWpRH/DqUCaeqULo9yp5RGO6oNSuJMOlbtGwS9cgWHHTfAX2JaARvB6V1lnROAhf5mZscqSpWdWC5jKT9/AXlAbqLhnG62sQVkdXOW0rsQ5ScErL3xdz/CytL0MGXbnmLkWgkSSNqPCSsqI9v5vzQSeLoWYphdsk9yV0ys5onoJM01PkEQrB1fKVxR3IovAMD6hCFfxZllMsJACG6Yau+W3a02WrhOe5TnJBbBH3/YRJChc8TbRganV1zgQhEbxO7o6xRjWy84/ctTOfkwi+9o1rKMzb1PI1PXTwXNsnE7+u9/q8zyIUelAiWM60xRQdtGZyeS22FMk3fMbUZs6LlN4pgfCGriJmv3ELhESWuBe4+WNVQSRsfWktaSr0+2Sy0Mw7c3j/T8N+dl08Ytf3+AQnThicqJUrleZ/oj6T0ABQGBMhz+IDqr18WKiU793bZdpmWuGONxoyqUTfhkI+qBj71DFu5zoQhPlYVRDUAZH4VrGVeQyh23IWcFLYbw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(10067099003)(4143699003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	78o1CYH3Iv6gAbD92aIVSDBZBcXOhDd0dIQ8AOipHzhLTaV2yKs/qm5v7ZPXcd4xdtaTbY+v1/H4dI/P5FbOTdB8Pb15j6jk5rDhDnFPhy9M5V0E5O0BNU0to3/MtyPp5tlrFB5RSl5bbICOzdWEL17FBcf+MkHtuaiLFU8YQ6XFOf5d18sIRGfn4CxYDxu9gyZIUn1DmfOZ1Hj6rs1yCQ4RHUnRiUnpoXom3Ip/UX2PR6t28XO5XQkl7YL3Hgn+n1KKIsOuInWncwXgTGhJZCM182uDFEioBtKPL0Dzm90yuKmWWSriKyy8qaktvGvZT4SvI36EhCfJC8MUCI4+0LKLQFPVj/EWslYKFnt29FqjdpG9y7cjy0kEmUWx4rtyu2aEU+FbVrxYWgxgiF3dz0mYSyfDk7lKVnAKrN0nWT6Ld3fKm0Bip0b93it5oP4f
X-Exchange-RoutingPolicyChecked:
	1OoM0lcsmra/az3qhVyy7l2Kz2bqfNmC2BK1EupMuXYn/kZKii+DfLr4q4SCSqUjIpl9Zw+e5Siw7nbspNxsflgpGy+LQIjcsxqEzbaNQQ7mnomYfn4l1GdNrZVjqhjuXoPn1Cf2Pqe2ws2+O08FdbGHjWWYYEnquYfaS5xA8vFKmIrxX5vrnyKFJpA5fb9paKvvl00Hqff5OzeGyOxwxhKf7DhxeYqV2n5S47GPlVPB9+bi6NXd9vdV5PVyJf3WYG7dbECFXdOWZPJQdVwoMePpti47l+39fwSwoVoE6X5zp6BxJmhWV1gCKVJRIfHZpTr3KCkZMaqhqmWCRg1EFA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:00:09.3184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feb9db98-bd1b-42e5-368b-08df0a9536b8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7149
X-Proofpoint-GUID: pqwlJXJmjnvwFcE2rWq04cvn856wH9Fa
X-Authority-Analysis: v=2.4 cv=GZMnWwXL c=1 sm=1 tr=0 ts=6a9adcfe cx=c_pps
 a=333l4QiDdYhx7c8CB7C9lg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=y251maI7i6_vEpQUyzoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEzNiBTYWx0ZWRfX90PYv3nM/9XK
 Tt6COzOq/jDdo5ZsG+70yIksVO5JuMcuN3LYNhyd3/F3TSCWQaudyjiLDjcXHV/HK4KCUM3/Is3
 /Fg5HnWZ93RyDNQOp+wRosUw0frOMKg=
X-Proofpoint-ORIG-GUID: pqwlJXJmjnvwFcE2rWq04cvn856wH9Fa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEzNiBTYWx0ZWRfX/cZzr1DiP/U5
 pPxdDtiK437SABGHKYRNRE5e5P2oKeBMmo+wWm2a7ihwZL/f1VicfD7aRabPdNsEkuc4lAc1pLM
 pVqhomctBIZc3ZAkRh8l3QM8z+syCxw+k4/oSogQWnrE6KTay/TC1c1ZtP0E2ng4MEIXYIP9aME
 vWKMNiF/6+Ym5gtRtAt8iZ6cbuOEdCr5m6KmotGOXGCbiQMYvQ3eHTFuEtSll3JOtKLZeX3Y8pz
 C+a+y2U3Wvc1XZW6BKFmHQDNrkLarDsqb3fIDfwvWdpXQ01rRUWX4QIciVCQMGIVIG3Y/I4LDzq
 hKWcQGe5Dxv0jd70uUO8kfJGWmfJfbWJu0O2VkJ6JyZ2Ms552sP4BZBT/LCHBThOeraLvtSWtQz
 YJoyIVZw+bk8Vl6ShYLPZ0D6qXgZeKJw7Txy204lx/+kRGSwrIj+1jIRg5PqVGlimeo7J6xUOiK
 ZXYhXUWxcvnxr4K8taA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040136

Hi Udit,
On 19:39-20260904, Kumar, Udit wrote:
> Hello Kendall,
> 
> On 9/3/2026 2:34 AM, Kendall Willis wrote:
> > Prepend "ti,am62-m_can" to the m_can device compatible property since
> > this compatible adds out-of-band wakeup functionality to the m_can devices.
> > The m_can pins can be a wakeup source in the deepest low power states,
> > despite being in the MCU domain which is OFF during deeper low power states
> > since it has the out-of-band wakeup capability.
> > 
> 
> Instead of adding new compatible,
> what you think
> 
> 1) if pinctrl_state_wakeup is set ("wakeup", prop in pin control)  then
> treat this as out of band wakeup

Yes, that is essentially what the following patch is doing. But for CAN
devices, there is a chance that not all pinctrl_state_wakeup have
out-of-band wakeup functionality which is why the compatible is needed.
https://lore.kernel.org/all/20260902-temp-v4-2-3896f7d16ce8@ti.com/

> 2) if device itself enabled as wakeup device treat as in band wakeup source

MCU CAN wakeup is IO daisy chained so it should be treated as out-of-band
wakeup. Additionally, the out-of-band wakeup capability needs to be set
so that TI SCI PM domains does not set the wakeup constraint on CAN so
that the FW will allow the system to enter DeepSleep.

Best,
Kendall

> > Signed-off-by: Kendall Willis <k-willis@ti.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> > index 5288c959f3c1aecfde363f9e2440253545591171..d26d6b6d0cf46a19bde9f58769b3eb8c86c836ab 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
> > @@ -154,7 +154,7 @@ mcu_rti0: watchdog@4880000 {
> >  	};
> >  
> >  	mcu_mcan0: can@4e08000 {
> > -		compatible = "bosch,m_can";
> > +		compatible = "ti,am62-m_can", "bosch,m_can";
> >  		reg = <0x00 0x4e08000 0x00 0x200>,
> >  		      <0x00 0x4e00000 0x00 0x8000>;
> >  		reg-names = "m_can", "message_ram";
> > @@ -169,7 +169,7 @@ mcu_mcan0: can@4e08000 {
> >  	};
> >  
> >  	mcu_mcan1: can@4e18000 {
> > -		compatible = "bosch,m_can";
> > +		compatible = "ti,am62-m_can", "bosch,m_can";
> >  		reg = <0x00 0x4e18000 0x00 0x200>,
> >  		      <0x00 0x4e10000 0x00 0x8000>;
> >  		reg-names = "m_can", "message_ram";
> > 
> 
