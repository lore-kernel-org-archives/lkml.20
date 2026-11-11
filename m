Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794391441;
	b=d4DkHwfGgNnpQMC+4reOhIB8CMgNOh1cqIx5MCmXMrigT8UTKrxSTktus4269V6+vBm/
	 StOfCO+RJp8m29geGi3qhOngEvRg/ayumgLUarMup4W9Duy/elJl5MWKXOD3zD2nQRnIp
	 jgjvn4KhYV0no6ZvvGIp/h6T0THHmofWmrrOwYt4Uy1hGnyft24AWuWJm5hxXs29uO4Nn
	 C6ig/1hRFFIo1V0NQgwWYhF3cMKAeqvLeCPSTlKUT73TtqQgvCSUAE5hA6tJc3CsTf80A
	 USu9mJYst9/SHRty/V3QRNVgyAM6uX7etQfhz7ndgws/70mdQwb7MPQJc+/WTLCQXQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=nsohwnE4WcIHO3yJrFJa+wnNoiHcgUH297NpGRrCc9Q=;
	b=2mnpow+R3hU4qtbL9jGv3f5uZAoFS9h4r/Upwim3rEj4GcKW7IZRlfIFgVSscQPGLsO6
	 d1edJjtNW3KuLHV7SRXhHwIkzjyX2u27hKj8+FoxL/exTuDq8EFfn8QxOQxea/yawBIO3
	 osNi1DYHd618Id24b5Em5JRepDcJ0C7OlibURPuvJ7jsdyQtVdkjDSY+1EwjrAl00ZbpY
	 nXA+LGYYIvGSiiBtouB7s0+L3ttIxaSXU94n75+RZKA+sn3DCrXgd5OFKBz1e1i8SFTBA
	 sE8DJG2o9+aGjv/4dS65IPrEUUruOgEgUkq7m3uUOhA1So5KjT3eZRe+rQdKl5+NtWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iUaup7cL;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=qSbIeyJP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2644606A324;
	Wed, 11 Nov 2026 10:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2644606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iUaup7cL;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=qSbIeyJP
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB8Ct6a2386679;
	Wed, 11 Nov 2026 04:03:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=nsohwnE4WcIHO3yJrFJa+wnNoiHcgUH297NpGRrCc9Q=; b=
	iUaup7cLFjVYd36J3svxbeMQWr3G813zqrS8ko4RM/EaFGrz/HNb5hhg2Z4D9nMk
	uMDp9CKU7bnQ/QIfo7kMXjU7lvvdHtsKzmg2DtbJ0x6cwtMKseisdwLvzT2MQ2/0
	9wspbHpqdVOz70T2b/MrD6Z2c5xina+frEy7/YetSc9beDF9xc6fo4Fpdvm1OovH
	RhSGjjUKz7oTPigvBpfKXEBZ/Qa3lYp2cWcnmO/brSkerNjEQcbDr9LJJ2E95eny
	oiwHnEIyYzn4A03Uvsi2DfKp7LdTJe4BEH0xIq6asZLyfLrdsXzBXbBHAv8b460e
	f5FXxvP/abeUHNe8BwzwDw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022081.outbound.protection.outlook.com [52.101.43.81])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7rf947g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 04:03:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZE47R8SHThAj2lhzcIuC05p+drrMKB091TMWC6C6vodFwXPCA1XCSDdaqyN5va7Et8fpIOnhLbuFWh+r0mvfsi9aayAA6pxnBTrYX1E8PeA8jE5VHkGPUtTXykk+OOoLrcxN69oPtCCG0qBLdD+GIeeKTF5ENTDuaz1vvueJ91DUKRVNS4y+P60yNGxDwjEO0fDiNuRdgpmH31Gwbx8+xcHbI5RTVb7gLA4Oomw7NWwhRf9ABqgbTh4Qu04CL6Es6pj9LSH54bV/yD5b0xWJTqspliS/OqlyVV6ZGc0Ug7xhbZRf0/jooy4WYRlli9bcMZhhz79seNg4mNnitDK/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsohwnE4WcIHO3yJrFJa+wnNoiHcgUH297NpGRrCc9Q=;
 b=LpvMtXNicesjfTIQ0poM3iKS8CAT2FOYAfUaU1prK8rMdyiiAMFbRudzqrSEkEnlhlDnrgdejMtGT8DMUeypRZi5ZyKKslPAUDwh7xjjOVfQUTZ90eodiZyQkphTUnl4sWYg1sFouHn9yXKxUcVTsFdzvamltp+rpnqtu/7fLrDNfZ06w33gm5MCJ+oQB8QnjzCwncmFYYHkztcoPCjXth8xPAAidEYyCGIzq5i73TW+n/5H7j1sBeRsilSUAlh+WZ/9Eeczy4fQAMHgAqVr7I2OtqNwqk2uOtum4N4MbqknHbecdPwQFgkZ1y8p7Ai48iWtDJdbx9U+LCbHHQo8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsohwnE4WcIHO3yJrFJa+wnNoiHcgUH297NpGRrCc9Q=;
 b=qSbIeyJPUClBnB4xoCLy8cQJ7RPsKIlnpCAl67elHCBZ/7Y6q9IG6asc8Cmh2c6h7I9hc3rxEN+5lHme/fXxqVbimqBp14zOXe9a068HrqAI8MMoqjD5xdCr3Tj1MP2P+cH/Ir1hfbkRyXfVmaxswvAFMow53kj/oBxW0EHThq4=
Received: from CH0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:610:b3::28)
 by IA1PR19MB8868.namprd19.prod.outlook.com (2603:10b6:208:597::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 10:03:50 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:610:b3:cafe::59) by CH0PR03CA0053.outlook.office365.com
 (2603:10b6:610:b3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 10:03:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.0
 via Frontend Transport; Wed, 11 Nov 2026 10:03:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3048440655D;
	Wed, 11 Nov 2026 10:03:48 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 21D6C820273;
	Wed, 11 Nov 2026 10:03:48 +0000 (UTC)
Message-ID: <82344831-b6ce-48ad-b7eb-f17e9db05c61@opensource.cirrus.com>
Date: Wed, 11 Nov 2026 10:03:47 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: cs35l56: Use Disco FEID and FEV to qualify
 firmware filenames
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20261110164807.1671681-1-rf@opensource.cirrus.com>
 <20261110164807.1671681-2-rf@opensource.cirrus.com>
 <7c2574fe-1741-4119-be48-e7d314015787@linux.dev>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <7c2574fe-1741-4119-be48-e7d314015787@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|IA1PR19MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8a1e6d-0aa2-49d4-65b6-08df3fdb14f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|376014|36860700016|16102099003|22082099003|18002099003|11063799006|4143699003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|56012099006|261009223027099003|10067099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	3EK9xlzm7Ic149AUYmDkGCM1ER/mqWzh5fQ4BTGsM6EZ5JiZJ1AV3PEUlDsw+sui58s8BdZOioJb9oZBxmn/5ukzFeFCdVrF9hKZcMEsGiV/rl5tgtzWba6yYHBg2TBlhWH66GZysZiEVk0OL9nkXtBNQzC1I7G9ccHjIaT44L6EItmpd5rPYA82zwH42Sz9fj2mv2ydwbaq184wwHpeOpIXDj9Sh15AKD85okg92cZsZF3UHXlFoB3Q1o11+ygYnhtNHXQ6VtWvmRGILjGfQ37K2SGkxHXcmEoyhamBBxCbEb3IC70caYb5PhIo5IrZDlHO5qz4yXyBIzOMjBTAQIzT1XR9FixMQUx8HK7y4NdiFt68QTuHtLxZ2r38ScARHLrStRawpXzfWPrEiJ2g6Gyll2cztcMU7KmpONbjt/izvxXY379LpmaXoxitRIL3c3EhUcFO+RO+b9VDYaTh2ILCMLxrqIUjM28xUfuHr37k06YcB4EMCa5QbftYaq4Yn99ZOk66x8hoES2Fgf8bCEDV2/6Xya8CF0yHJ3szoGbiM6wStSfctAWW3i1ZtKk0iCUwaEf/xgNHwkCDrQQROj/wkeVQgG1rv0uX+uBJkqu5WjQvkwjVpjeTxf52H+xRJGfa+75fr7myxw+37OVfSlocQIxnTWUqxXyJzcpwNQVNwwxifVwyWxUmJXqZv+Fn4jsIf6AU8r6B7OXtahBWWw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(376014)(36860700016)(16102099003)(22082099003)(18002099003)(11063799006)(4143699003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(56012099006)(261009223027099003)(10067099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BFIexHSRA6zCCL55VV9oMzpHsY2qUn6djNQWWHPAX5pL2D5Dufp1NBlSts8RcbTnkP50Ag+QcMlfWWNX1lNw6gWuOtecZtmTKtoe7wzFde7UmBjQKFvpy+St2XtWplKG6KNemEWX4Rmvrc6NHLvPt7sE09VQIHw2LvZgd4WiUEJoEuYVMcN8ToAwe5u7OLE/2vEFvr7INR+MvMIE4XZcrm9IIQ4DCI619oHDKAPUsam4uVed0MPO8wCN+1CozQw7MQMhlQqq3LK1tuTWGuFmlW75Hbdoc0iDoLSa43zz/RYRIeSP/fmFE+q3+t6X+aeFoLdjFzuQcRlRa5FAfX8/3y2MpB19Xt25e1RfXoQ/tOxGKhq9poj93VOZrjbXBwb2cG4HqhT9iLkXZ3/pV1ePpsMBh8ol5h2niUS54wXp2Zt2MOJ0T5pYrSaZHcmTrmmd
X-Exchange-RoutingPolicyChecked:
	cyDjXXuNbPzzYYvryb1MRwsIWaGvZVDFilxkjO8xuYBUBLCH+l3QM0QJqH1zMTx2TpvF4qJ9Tn7YnnmJ9QyAgsSzyDhD5AGcZjW4uQn49cwZYZOfyRxx4IanzA9ZLC63SUAxE8AcVWUSzAqBD4rqI30fjJuAGttRtAhTi+GRgibCL3UdbgC6NWEJsBeAdE83sbYnEw6oPIvmtq+LlDkKW2F8QNh4UpynhyHFEDdqrO43SIfoKKrGyYyUTH8NJ2rxsl3aWN0vzVAaoOTsMD6Sy8rW1L8Hmh5aqE7cQut07gxg0vngLX9d/EQHAu7M64lxbnkW/TZI8tapazPKHW55yQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:03:48.9587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8a1e6d-0aa2-49d4-65b6-08df3fdb14f2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8868
X-Proofpoint-GUID: rM3nxRQYe4rk2yj7mG5HG3S9v1yIScNp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfXxgloHfshEGPX
 9haBcBx+iCzVhLIMugKDfPCAQ92RNRhLZ8uIGQ44jfaNlhhmu6GwQw1WWDpqscBJfxkTXzKZ03Z
 4Z1vamBTEHNWsoEq3XafE4EHXePVMpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX/DXakBPRR7wK
 liOOvZ/IJX4TA4ga6rkvbFJZuhc071MCEH+wMX+gQymGjBoP+QDZt5jswyW+Hs/pRP8PmOnh+Er
 hfaxIKv0ZCv7etaVPPqiIIYotxh+IUV8tymrP0RDs3NAbeFDXcGi5ko9JL9Aah1QhqolNDuzc8A
 cMw3TCJkkEIDC5VQcPfw0wno1NpFkRLk8ufAP+H9CScW58DCZ6fZq3fRRGpJPCPLlbikhy8ba96
 MKu1iPh3R/sVif98ugpRo0y/hIoROXSenYRKIROtri+yhnR4W6OVgXM+XSbMF2cvoPi+t//OfT+
 bCHaUOBjzTh5HpkFwbr9edSldQlcv/Vmlrh3Q+c3gdDT7zbyNXCb7am3uKic/68KGAbfh1Bb3CW
 O1w5KGSmikYRNLG0dTD+yPP+xmEgOHUYDSg/TeJxHN38lYbdV6e3fGuQAmTQYOhXRumImgb96FY
 xBWylSUu88wTH4csO0A==
X-Authority-Analysis: v=2.4 cv=I6Hw19gg c=1 sm=1 tr=0 ts=6af43d8b cx=c_pps
 a=hO11pga2tcgH964FPuxqBw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=vC_9qN9YPI9JTF9HyFEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: rM3nxRQYe4rk2yj7mG5HG3S9v1yIScNp
X-Proofpoint-Spam-Reason: safe

On 11/11/2026 7:44 am, Pierre-Louis Bossart wrote:
> On 11/10/26 17:48, Richard Fitzgerald wrote:
>> Include the FunctionExtensionID (FEID) and FunctionExtensionVersion (FEV)
>> values from Disco as qualifiers on firmware names. This mechanism is
>> required to support new products that use CS35L56/57/62/63.
>>
>> Some manufacturers are starting to re-use SSIDs, and the time between
>> re-use is decreasing. The SSID is therefore no longer providing the
>> unique hardware identifier intended by the PCI spec.
> 
> D'oh! It's crazy that with all the technology available it's still
> difficult to define unique IDs...
> 
>> To ensure that the audio hardware can be uniquely identified, the FEID
>> and FEV will be included in the Disco for new products and must be
>> used to qualify the firmware filename (unless FEID==0). For products that
>> require an SSID match, the combination of SSID, FEID, FEV will be unique.
> 
> until the next time when a firmware person doesn't update the DisCo
> properties and reuses an ID from a previous device?
> 
This is more about ensuring that the Linux driver still works when they
_do_ add a non-zero FEID in their Disco.

