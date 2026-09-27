Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C1354707C;
	Sun, 27 Sep 2026 05:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790486685; cv=fail; b=IHcRWkfyj2J6TymEGYQvQ3LdlyY0Rsb5mh+3x34J8GgEXelS2ctsJyFEAplaOrLq9Kf+PA2XQeJzoLP9oLU2GgIw2xAvU5kuiuIAhDCgUSSkK6pEEKkdYLt2bdIW0VbWZfQYfdIqr+3WqEfuwmEamsY7Q2hykuHENRumPkqgJko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790486685; c=relaxed/simple;
	bh=a7Jumk5E7usiZ+n10xaqjbGUukSDe/YOK1CEsos4V4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rFL8KCIJNEGpZ5boqwXCvVT8cx+jht7lUY7mtFTWUf9AIIVk8ivX6xvBLchnFgqpQ51CZDkRRRBvOvEUSzIGP1lcJukJWJ+9VPmP6vfGyCqdfjZwgBoThgjcYN6yFPSFj9JJFx4YZJlEebo75+iN7sVMjna9ut6aVmrMhyLbDio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=HuSPBejw; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WVfc3zBK; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="HuSPBejw";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WVfc3zBK"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68QH0cWi2071943;
	Sun, 27 Sep 2026 00:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DJH23R3uiEcXpgXbXjuy1rlwTqfEdV/9zsCh1m+V9
	l4=; b=HuSPBejwuPGwgdx4UwCXAVWsPWpCGtIKDB1ejSsNOb3xzToghgStvB5VG
	et2eRNb4dC/IcOkRnWxPsHGuyqg7hWousqcDJ4w6JYAlt49mX293BvYN65QHTJwG
	bkhguxkHmxrUS82tlx9ndmpu3/WwRQE/a8ki/G+K/laC8KF+287Hqj/XGJalBn9l
	EZmBjwzgYcz6rUsQt13FaC8TVgM8Oq5JK8JaewXP4rVLUXXFVjcVwYrnQKoNdAiE
	k3Jwittf6R0wtY1GudNYCFW4HQAuO2f6/rVULzr9UFU56QL3LS7O/Yz9FIkkk20l
	Ui2lcW/tYCjl2gTSL5MYCj5FtNNRg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gx0agnk6j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 00:24:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEowcDkZXicBjMlFRUGKZjlOaFRm1ozi5/fSRC8/STKab3T4rED7Qim/tLcIc369helqk14P6MzReJq+pXHW/9Or7zzojQAO3HAXJG6r2YhyWT6RfSbqcHevsbrYbcubi9py2WtC8F36rMIqx/D8jpmdc/JvpW3VtmmYd9ZUEd/ucVT+WivymjBlCt5h8RR7WSL9rJN+vO02Ep3jjIlBmQapO2A6ALo5owDUFWHjTlFEDxM8lj55advRp/nL5Tf4gpy/h7PspMVZOHpCri79OYhp3dDE1V7BJDLU372ShDFLZ54BRtjahk0nqsKYafw8YQzFwZDByr7zVsxibQzkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJH23R3uiEcXpgXbXjuy1rlwTqfEdV/9zsCh1m+V9l4=;
 b=ZRqlsUO/VH8kTY3ohj1lhf+EtoKywUbcp0mX/abJY3bqsAKhWZQBaC9pJPPmNCoPFKS8KZIVFKpJcMt1Er9K/6Pzbi1L86/Y32CzaRdn5NFmUjhoKKQWC5/phCHxbptJcggTwTD+GptgV2jMjGrRy12Ssb+cUcXl9t5uTE2FDP7l/JGN4jPIiNr0RMelX+82dtgse06vcI1HHhLQUoB4MPmsGFQ6zwKyM9f3b0HAR/1SCJDZ+Kc8RdSTY9GdHhDmtG16v69oIKzMHiSel5Uw4TRPQlayahL52TWBu0Qr0XdkvjXTm3a3KGujKC+b0Kv9h2ZjsCUcidUi2IGSRXrW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJH23R3uiEcXpgXbXjuy1rlwTqfEdV/9zsCh1m+V9l4=;
 b=WVfc3zBKLQbS4Z+fQrfBlH8mRhqItHVYbcH+yKEF6I70R7Q+6pFNq4Bew7AdQTFBYcbLTjpYa41bZuEaEHiyjqRCvq3CvGWypa8ahOMnOdBUJS7H1ufYW85G/+JawyhorLUT0bZkrTuxkJ9hgRlFaa2FjT5E3kyKD8GcPm+saNw=
Received: from CH0PR03CA0052.namprd03.prod.outlook.com (2603:10b6:610:b3::27)
 by CH4PR10MB8228.namprd10.prod.outlook.com (2603:10b6:610:1f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Sun, 27 Sep
 2026 05:24:23 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::9e) by CH0PR03CA0052.outlook.office365.com
 (2603:10b6:610:b3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Sun,
 27 Sep 2026 05:24:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 27 Sep 2026 05:24:21 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 00:24:00 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 00:24:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 00:24:00 -0500
Received: from [10.24.52.125] (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68R5NsNR1594042;
	Sun, 27 Sep 2026 00:23:55 -0500
Message-ID: <9d947c6f-b112-441f-9d24-14b36462dbfa@ti.com>
Date: Sun, 27 Sep 2026 10:53:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] arm64: dts: ti: k3-am62a7: FPDLink overlays for
 LI OV2312
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <sakari.ailus@linux.intel.com>, <mripard@kernel.org>,
        <jai.luthra@linux.dev>, <jai.luthra@ideasonboard.com>,
        <devarsht@ti.com>, <y-abhilashchandra@ti.com>,
        <mirela.rabulea@nxp.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-8-r-donadkar@ti.com>
 <20260926145715.GF764757@killaraus.ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20260926145715.GF764757@killaraus.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|CH4PR10MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5423e4-9e49-4b04-948c-08df1c579656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|23010399003|1800799024|10067099003|5023799004|3023799007|56012099006|18002099003|22082099003|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	LM6kWf9s2vhKZluY6a9ga77mRkANR2MyB/139dGPDYHIqtYHojU3z5Rgi+V5LZ8rCHXbXsRZ4KEcWXscJYn/ORU17LEAhjAIYRY9vtYDfrTA+ibaTJEqlKtrcnoi/SB+s2gYmbuCs94Tv6qsRCFGnm1vMVBkV84i8ufoJXBesrYGuQl85VS/DX93un3fPLCDgg3tgxHjNLl6vtsL4v1JeQS23Cc/TwCAskOUvqTYbRt0fyB+t5s3PZ29Es5Mk5kuDKtNLJACZKVieZMK53sPcYmad3YwLSWVK+ZmLfx1yUcTy4K+Xq9VwAJNAYncgx+58gSmqr9DZ4ofHggEYfbveIJTwYINpgMnVsHtkFqXoJPCWRWP2RqfYJr6vb0xjmXMy6VxJw0xnhFgQHvhXk12Ok8OAZbGbnMue9Abzad2yeNPnN4kgfGCHVl2XIzAeqGYdZm+0dafVaWzAgdXcfGSV2VT20RC4qjMihymfxQno/3aUxhP5ZTz4sh0caMzNS+1+B5e0N7EdKJjTexdhM9iBYjGnjzMEbrjoXX2bSUR88z+2g6YS83ve0/5NL1H8O/JpuTyG8/lzxmrlit+5/uhbT8lqA5elaS33uCqhzPwuITCEfaIUAyW5lMgULMIU2pGPMD47XnuaDOBnwEjbvNKaA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(23010399003)(1800799024)(10067099003)(5023799004)(3023799007)(56012099006)(18002099003)(22082099003)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lLzHGmeWspsYJxZ+BTjvQ/ZRXw1tTQjjpZ4kPc2+lxf+4k9fAmRUrmoMdNQ4D3Dcqhpinn2ETvv9kQK4XnAi6mChn95qn4WS20mw1bUGHqMOi+8OQ7INqNIgm2mNdYkHZG6U+73Nd/3YRVwqH1MgYeme6zAMGVn6hpzD7H6qFFb1Re2m8S7OKwMtpVv6AlIi1s3Cnvb1c64A1hsGTBKPOfa24RiPXdQJ4Ruacz1UP2PzQbeLE+GB5DMdZ4mrgPh+5fzGEYG/x+fmaSQegm+4GsZQbfGJfovuGzk1BRBTAsi4gEL2hsQ8Z4elXtlLtQnp08BXosoljOQLIvACDn/X3/dk3ZXb8hJ3IwWE9jfPwH/XUcfR2PNgqf5vmG2fiwx0v3zgxJpgIma5Z2MgbNG9cbdv5Q9oVo6piQgebNxruCNn15WGTQh7Tmsi6wggitu6
X-Exchange-RoutingPolicyChecked:
	3gmVoRpcj/Olqc2HDqYccgp9I81hTi6KQcDUHYls5wrhsMwZndCYNHVIG+S2vqEZeeb0Ssc8EehNNIPJdAHfkxO8GGbhaj7qzzSLyDF6Md3Isx3VoPXCocRLF8xDXruFYRb8d/pzuvWJoFEKpdjpfw2Gv2/gLMQROpjYKUTDWt7nvqAmdtx/cTwNC1AK8E0shbNZJ6ebREpcyHx0F2GdkF2rUO6RcksbtisIB414LSQppY5+XZeIgNKdZTJul6J8UfmQ34tdwefyNuhCsvIYD3wHbHDbYg7xXJziIJFmfoEdQRZ6sej4BZ5h1QNXPvDi9Z/Zbjr+Gj5YofRmKtJoJg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 05:24:21.8977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5423e4-9e49-4b04-948c-08df1c579656
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8228
X-Proofpoint-ORIG-GUID: jC-dI34jMXVfPXjz1q8KUeA49TwC3HEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAyMSBTYWx0ZWRfX+0hrxS3S7qjO
 ZaFST1xic6ATa9jI3ve2Y1v2OxiQ7ef/E+trwWNNB+ctjZ1r14le6BBqth0+LCrmimKkDDn5HPb
 Zk0ZQx4pvx4cuWU+U6AGfDPtxF6PLfXU7/PYt2awh5fVIDHlT7BJ64pAH+kzgrANqz/crxqevMO
 Z/OpI2i9P0mj6wgUFLgY90P1LPUT9/tUaNn3xaRbLPcDUfI5+Rf4Gr24M1UGgsYv8wbmIWtm5PV
 2Ar/RkSzZvEiqBumPZwq1m4111F7t1J2nJhVstc1oWnfMQo7IaQz0dk6IH1K9rQ8lPFHSEw5FtF
 UXh4LNw0AqRwka8ZaMFkjciMHUUNELNNQwRXHe1e+MC7HswKLFHyvmtxS5awpPxmIlI2D6fG+X0
 e06JRzOh9lEvr7ZTpK9Z7aDZMr96TyHcGAmXJsMqB/tSllrV/gW2M1i+xf8j4o7rzp3pemYV2Xf
 TQZno9fewrXjKeg3DmA==
X-Authority-Analysis: v=2.4 cv=dYcVTnXe c=1 sm=1 tr=0 ts=6ab8a88c cx=c_pps
 a=J0oTDZHsw5jmD/+vARdUUA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=BIeaPEhIAAAA:8 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8
 a=XIoLjVCwWtJ1T7_h64wA:9 a=QEXdDO2ut3YA:10 a=xdwx0GSDnVkbZ8IFV8PL:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: jC-dI34jMXVfPXjz1q8KUeA49TwC3HEf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAyMSBTYWx0ZWRfX3mVQjvxrdn/6
 6syd4JhHEKR/794hfrtdMekc43P7BOdiE5KsXG4wW4s9jvVoRxqyjvBs/vBFDUxu75IPNhpOcik
 FPBNVhCmzw2ndwNjcFIqamrQQEbu9DE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609270021



On 26/09/26 20:27, Laurent Pinchart wrote:
> On Fri, Sep 25, 2026 at 07:00:00PM +0530, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> OV2312 is a raw (4x4 RGB-IR bayer) sensor, the LI-OV2312-FPDLinkIII-110H
>> module [1] packages it with an FPDLink-III serializer (DS90UB953) for
>> use with sensor fusion setups using FPDLink-III deserializer boards.
>>
>> Link: https://www.leopardimaging.com/product/autonomous-camera/ti-fpdlinkiii-cameras/li-ov2312-fpdlinkiii/li-ov2312-fpdlinkiii-110h/ [1]
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/Makefile               |  6 ++
>>   .../boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso    | 89 +++++++++++++++++++
>>   .../boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso    | 89 +++++++++++++++++++
>>   .../boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso    | 89 +++++++++++++++++++
>>   .../boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso    | 89 +++++++++++++++++++
> 
> This seems to be a very strong candidate for the new DT addons
> (https://bootlin.com/blog/device-tree-addons-describing-non-discoverable-addon-boards-and-connectors/).
> It would help getting this feature merged if you could give it a try.

I would love to give it a try. However, I am quite occupied right now, I 
won't be able to start on it immediately, but I can revisit this as soon 
as my schedule clears up.

Regards,
Rishikesh
> 
>>   5 files changed, 362 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
>>
>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
>> index 795978e962ee..8d608e244087 100644
>> --- a/arch/arm64/boot/dts/ti/Makefile
>> +++ b/arch/arm64/boot/dts/ti/Makefile
>> @@ -508,5 +508,11 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>>   	k3-j784s4-evm-usb0-type-a.dtb \
>>   	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
>>   
>> +# FPDLink Sensors
>> +dtb-$(CONFIG_ARCH_K3) += k3-fpdlink-ov2312-0-0.dtbo \
>> +			 k3-fpdlink-ov2312-0-1.dtbo \
>> +			 k3-fpdlink-ov2312-0-2.dtbo \
>> +			 k3-fpdlink-ov2312-0-3.dtbo
>> +
>>   # Enable support for device-tree overlays
>>   DTC_FLAGS := -@
>> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
>> new file mode 100644
>> index 000000000000..0829f01a0f90
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-0.dtso
>> @@ -0,0 +1,89 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * IMX390 FPD-Link 3 Camera Module
>> + * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&deserializer_0_ports {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	/* FPDLink RX 0 */
>> +	port@0 {
>> +		reg = <0>;
>> +
>> +		ub960_fpd3_1_in: endpoint {
>> +			remote-endpoint = <&ub953_1_out>;
>> +		};
>> +	};
>> +};
>> +
>> +&deserializer_0_links {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	link@0 {
>> +		reg = <0>;
>> +		i2c-alias = <0x44>;
>> +
>> +		ti,rx-mode = <3>;
>> +
>> +		serializer: serializer {
>> +			compatible = "ti,ds90ub953-q1";
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +
>> +			#clock-cells = <0>;
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					ub953_1_in: endpoint {
>> +						data-lanes = <1 2>;
>> +						/*clock-noncontinuous;*/
>> +						remote-endpoint = <&sensor_1_out>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					ub953_1_out: endpoint {
>> +						remote-endpoint = <&ub960_fpd3_1_in>;
>> +					};
>> +				};
>> +			};
>> +
>> +			i2c {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				sensor@60 {
>> +					compatible = "ovti,ov2312";
>> +					reg = <0x60>;
>> +
>> +					clocks = <&serializer>;
>> +					clock-names = "xvclk";
>> +					assigned-clocks = <&serializer>;
>> +					assigned-clock-rates = <24000000>;
>> +
>> +					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
>> +
>> +					port {
>> +						sensor_1_out: endpoint {
>> +							remote-endpoint = <&ub953_1_in>;
>> +						};
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
>> new file mode 100644
>> index 000000000000..06cba8c7397f
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-1.dtso
>> @@ -0,0 +1,89 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * IMX390 FPD-Link 3 Camera Module
>> + * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&deserializer_0_ports {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	/* FPDLink RX 1 */
>> +	port@1 {
>> +		reg = <1>;
>> +
>> +		ub960_fpd3_1_in: endpoint {
>> +			remote-endpoint = <&ub953_1_out>;
>> +		};
>> +	};
>> +};
>> +
>> +&deserializer_0_links {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	link@1 {
>> +		reg = <1>;
>> +		i2c-alias = <0x45>;
>> +
>> +		ti,rx-mode = <3>;
>> +
>> +		serializer: serializer {
>> +			compatible = "ti,ds90ub953-q1";
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +
>> +			#clock-cells = <0>;
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					ub953_1_in: endpoint {
>> +						data-lanes = <1 2>;
>> +						/*clock-noncontinuous;*/
>> +						remote-endpoint = <&sensor_1_out>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					ub953_1_out: endpoint {
>> +						remote-endpoint = <&ub960_fpd3_1_in>;
>> +					};
>> +				};
>> +			};
>> +
>> +			i2c {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				sensor@60 {
>> +					compatible = "ovti,ov2312";
>> +					reg = <0x60>;
>> +
>> +					clocks = <&serializer>;
>> +					clock-names = "xvclk";
>> +					assigned-clocks = <&serializer>;
>> +					assigned-clock-rates = <24000000>;
>> +
>> +					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
>> +
>> +					port {
>> +						sensor_1_out: endpoint {
>> +							remote-endpoint = <&ub953_1_in>;
>> +						};
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
>> new file mode 100644
>> index 000000000000..7d377dbe5bbf
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-2.dtso
>> @@ -0,0 +1,89 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * IMX390 FPD-Link 3 Camera Module
>> + * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&deserializer_0_ports {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	/* FPDLink RX 2 */
>> +	port@2 {
>> +		reg = <2>;
>> +
>> +		ub960_fpd3_1_in: endpoint {
>> +			remote-endpoint = <&ub953_1_out>;
>> +		};
>> +	};
>> +};
>> +
>> +&deserializer_0_links {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	link@2 {
>> +		reg = <2>;
>> +		i2c-alias = <0x46>;
>> +
>> +		ti,rx-mode = <3>;
>> +
>> +		serializer: serializer {
>> +			compatible = "ti,ds90ub953-q1";
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +
>> +			#clock-cells = <0>;
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					ub953_1_in: endpoint {
>> +						data-lanes = <1 2>;
>> +						/*clock-noncontinuous;*/
>> +						remote-endpoint = <&sensor_1_out>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					ub953_1_out: endpoint {
>> +						remote-endpoint = <&ub960_fpd3_1_in>;
>> +					};
>> +				};
>> +			};
>> +
>> +			i2c {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				sensor@60 {
>> +					compatible = "ovti,ov2312";
>> +					reg = <0x60>;
>> +
>> +					clocks = <&serializer>;
>> +					clock-names = "xvclk";
>> +					assigned-clocks = <&serializer>;
>> +					assigned-clock-rates = <24000000>;
>> +
>> +					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
>> +
>> +					port {
>> +						sensor_1_out: endpoint {
>> +							remote-endpoint = <&ub953_1_in>;
>> +						};
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
>> new file mode 100644
>> index 000000000000..f74bff5f12b0
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-fpdlink-ov2312-0-3.dtso
>> @@ -0,0 +1,89 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * IMX390 FPD-Link 3 Camera Module
>> + * Copyright (c) 2023 Texas Instruments Incorporated - http://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&deserializer_0_ports {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	/* FPDLink RX 3 */
>> +	port@3 {
>> +		reg = <3>;
>> +
>> +		ub960_fpd3_1_in: endpoint {
>> +			remote-endpoint = <&ub953_1_out>;
>> +		};
>> +	};
>> +};
>> +
>> +&deserializer_0_links {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	link@3 {
>> +		reg = <3>;
>> +		i2c-alias = <0x47>;
>> +
>> +		ti,rx-mode = <3>;
>> +
>> +		serializer: serializer {
>> +			compatible = "ti,ds90ub953-q1";
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +
>> +			#clock-cells = <0>;
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					ub953_1_in: endpoint {
>> +						data-lanes = <1 2>;
>> +						/*clock-noncontinuous;*/
>> +						remote-endpoint = <&sensor_1_out>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					ub953_1_out: endpoint {
>> +						remote-endpoint = <&ub960_fpd3_1_in>;
>> +					};
>> +				};
>> +			};
>> +
>> +			i2c {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				sensor@60 {
>> +					compatible = "ovti,ov2312";
>> +					reg = <0x60>;
>> +
>> +					clocks = <&serializer>;
>> +					clock-names = "xvclk";
>> +					assigned-clocks = <&serializer>;
>> +					assigned-clock-rates = <24000000>;
>> +
>> +					reset-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
>> +
>> +					port {
>> +						sensor_1_out: endpoint {
>> +							remote-endpoint = <&ub953_1_in>;
>> +						};
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
> 

