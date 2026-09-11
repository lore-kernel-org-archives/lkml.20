Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102F413791;
	Fri, 11 Sep 2026 19:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154390; cv=fail; b=YTEKMnghsRZpS6qYsKtvKXJyqkFQ0n3bAJs9XTohTZXdKrrK8YJlWt8DOqP7wB4q0/+EDq39NS3dN2zYhQifd4IZyP/QvTHwHQqB7q3Bl0y+fEi08vfhGPKocHE6uM6dSgu0r58E7gclF9AdaR4UWQClPuzixsWjm2NjniVJj7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154390; c=relaxed/simple;
	bh=I5geqlQr8DtRub5zgu5Wq0WBkGAvWn0C2XgfGbwKM5g=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7im/NpnN3o6hzGOgWUj+821AMHf2iYhygXovKRbsiY0Ww7UCoWkroXOm0icHb7U8tKkKJ/b3KnsmwWZnvzS1gs0FNXzmSas9eYtX+aRrtf0oTGMNmY9/HHLTrdZZ6G61+1dJFKig3kMh5BhkueF6pmRQkYw3jJ4Efczp3FJmvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=VEJqEjus; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uQDN0F2t; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="VEJqEjus";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uQDN0F2t"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68BHVAwg2341203;
	Fri, 11 Sep 2026 14:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=aZuiXLmedcmpqQ8
	QvKRfqhl5+IVukgfCfZ/6VYGtgLM=; b=VEJqEjus/6dX1d+Fl83oyAVUwpMRd+p
	cV0xqiVeuw4y/baGq5yNfHAQclo1aCGFPYawAZorBGUUmAJiRGazwapd52AS7JIC
	n1OxXhvbNXWiz2zb/dl2MKrrrOJZ/fbl3yQcD/w54XpVxpHvP1aKvuu6vKaQYj/E
	2zf9a+W3YAYT1Lm5s75g1G/Jz8d4nDp/d831ywvbsCI8Tvs9hCLb/JJr6xBDoeXl
	kBLG6tnElZsfoOl01Le9w3irBUXnEaXuBFjdi0D4ezeBEFP07LJ1yJaHkw7nvNsI
	Vg7VTa0M+G1bcEDfJh2odHnjXOgRjwEx2Rra7IUdduyo3rZE4OJv25g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gm9gqw13m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 14:19:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMAiQW6rJixrcIzTjGdOvWg4r3FmO9GTqGq7XoSKiC1c1NhNgOQSWpCWRttILuOOMr8DTi9wOpP3jTPnwXUjjw9iPwXJp24mvspMJZryE0U/f7OtvdtJnAjART3AyaMvBqEbTGpf+epFyaH+dVCvvdmdDvMlYXV+5gapk3r0/cvhV6qJN8E1JKaS+Ot5zAJp3O/vAQ+d/xauKEauGXtv3X+8hOcBhH5NbQ7S1dgBNeDBVWGBQR4U0A2+OYEUsTt7z9xnu1pOdPW3gOpMe0UK5o29+KZM17kx5fNVxR1UOQ0mTYDFoGrR0i4gtckPusu0ctb5m9HDpgK6VldGtyo2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZuiXLmedcmpqQ8QvKRfqhl5+IVukgfCfZ/6VYGtgLM=;
 b=vW0EI7Mw2VdIAGBFXHHUypH4oWuD2Yh4dN+qX+RVoKM1T+huXpDBlbPMmVHcvT+7CIjAAhyRwrP7QLDFbMuRQxLJWiB0Pgl8jaATWTNl8Say+Hh1WEQjYAEfJvtGuxn0SE0cFDiG0UQIfj+t480d1KhrsvGivxpTOU5cyo7l9vaBx2P3e1JqpNNVtKcDednkSTsSSF+3YcbUuFscxx0rUaZCc7WHtkvSZlQOFJ5NJmc0iR48810APbs3HkB4SN538DnmmhLCm8N8WkiLdOZJhDF4xdXicpCFZyiY0/KI9ciPIDGVKz43mIuZFKIGYeFd7W2ByLDw+giOyfTCENtang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZuiXLmedcmpqQ8QvKRfqhl5+IVukgfCfZ/6VYGtgLM=;
 b=uQDN0F2tV6Xxa4qL2PqTwifLHs7zKi1BWhzKVxxAwP7EL+yThb6pgx0uHZze5OMmhbPOqaA9b/y/bRu/D7+zSPRhKrzDYsZIgZ19KecVvezKMCF22++JpVaa5/63s2QoynH+mulVF8hv/QdLzdhJNgFxbqzK2cUNomb1nL08MRY=
Received: from BN9PR03CA0630.namprd03.prod.outlook.com (2603:10b6:408:106::35)
 by PH0PR10MB5610.namprd10.prod.outlook.com (2603:10b6:510:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.5; Fri, 11 Sep
 2026 19:19:27 +0000
Received: from BN1PEPF0001854A.namprd05.prod.outlook.com
 (2603:10b6:408:106:cafe::32) by BN9PR03CA0630.outlook.office365.com
 (2603:10b6:408:106::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 19:19:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF0001854A.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 19:19:25 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:19:24 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:19:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 14:19:24 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BJJOG61660364;
	Fri, 11 Sep 2026 14:19:24 -0500
Date: Fri, 11 Sep 2026 14:19:24 -0500
From: Nishanth Menon <nm@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <s-kochidanadu@ti.com>,
        <a-kaur@ti.com>, <s-tripathi1@ti.com>, <vishalm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-am62p: use ti,am62-m_can
 compatible for m_can devices
Message-ID: <20260911191924.lpu73cwup33fynii@guidable>
References: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
 <20260902-smth-v2-3-b3678ca44c7b@ti.com>
 <412fc9b3-cac5-4fff-8071-ca2d4855db30@ti.com>
 <20260904145913.a437wnuif4arwb7j@uda0506412>
 <20260911035535.eexmc5g3rdwyahl7@speed>
 <20260911143205.pecdvyzsiokdvpy2@uda0506412>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911143205.pecdvyzsiokdvpy2@uda0506412>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854A:EE_|PH0PR10MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d98cd98-31a8-416d-27c9-08df103997cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	z8NBeafxHZjP/ONSCAOyuJmQlPYqI8uB9TD4iTq/6tN3y1VxeD8pLCMh6+yfHZ+hT8As1V++u9ibCrVhcA8osd8WPvwFaqiOiSEPqlEEDuhp7EG9SoXaupsCS2yydBR058jrWZ7836H4YFvHjA3YPCTkWqKHTv7x/UD6X8uZiTa3LiCESmEcFd8ztrt0lHZCjOXmVAF3v41775G0+ulxMt+jILZWksDasLuIwnLMIHEGaAN/1FGVLeN9gwpwdHkl9HSiUHgUHICNFGPy5VyRqxnuwJdlXGzLMTwZxegbjW5WvnWSCLxhFq5jhhizO3Fl4zH6bgSpaVGkILuS7RJWiCQ8BMv2R1/ChzFPYv+c24UJnVcA+tsqlNs2t9aV0iYEmqK3Ca6DOQwd6GnSW5yVGmMX6n+7z8K1TYak6liyBhrnij/uAVjI7RkD/vjMYhy1/xo2D1INjPlz+3njl9Zyw7AOjrO1SiJzvswYRhyCl/J6sjGa6Fk66f1hsusjnDJff4ZzlaEfufEWkaxSgiDvzw1EJy2LSL8DxQzzmxcurmBOuJwCWVUQrLGXfhbl7P13bWgueQHeI/AAyJx00yRBX9Cuk1TrcnT+/kB7oWyPAukFaQS6OnnsC3c0vUPJGKBt0dqL4roCLncXTjvEV1PW5R1QD9GXdOcAh/BacUghokj6wMMXKrFGSA79hfamOprbR/VqBkdZQElsNP0q1ui9zg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vr3J7v072ARIQ6gKbzkNCJPas1h9SI1+6UsJCf6yGIV10fFC9GlpDSJ7F/CWFx/dXcbeIsw4zby5h1gc4/FPBN4ijb5B5lgPTnY0dolUs8V0Cq86nHHFBxf0UQNH+Q7mwVy56+WlV4DEcDqhJ0GI3bkO1TXZeYXk2FTOgNf3zpazU4bWs9xExFASc8bUOnU0uZz5Hwba7j1JNtp38cvRzQZnbiDAtgbr/pN6KvH1rkZXQu6LezlGwbJO6Z74iB6ulnUlmubrBiQcizhmR3oOjHAqQ1zcFau0UGSO09BpWEIZ3eqsZgsrBGLec3+ggBBD7T0I7TA7RE9+kknClEiBiQlO8/0elL5KQJeqr/7Wpl8rD0q+yOlJuEf/xHKPlnCknhj316WeShS7Cr6JmicO6nNpEsXa9Fqc+lIJxfCMkr1W6J0jbFvnOpwApczi/Jd8
X-Exchange-RoutingPolicyChecked:
	vlJstXZpivg7kT1IHDTbH1IRxNkoGSwJmL2YfN4GyxrnXMkuE+UEA9+zUyOEBwjY5WZC3yIrhVkORyeOHz1Bfp1l8guia86m4KRb9gaBwKtltbzhwo8fCf0HfedbFNeidNXixOq7TsSRC/iUHBqsLAr7FFiKYqdi8XGr0oGY7ytRVbMWqRRw1T72TYWttVW64rAqKqOccjCLIE8NembR0/5ABLKIiYDpUbTrj3cazMpxuhCLMR8yRkwbG0IPD4NIGIIZPWLKkT4FTMFyFXE84WX6CE7mhh5IS+0bx8lhRRMZ123eUyDuhJP1g588YSjCa3t+Kq2V7yMYosKZR/1Pgw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:19:25.5161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d98cd98-31a8-416d-27c9-08df103997cd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5610
X-Proofpoint-GUID: 1eBWJnlQTNHbAnFrQaNVrd2ehKTS3yGL
X-Proofpoint-ORIG-GUID: 1eBWJnlQTNHbAnFrQaNVrd2ehKTS3yGL
X-Authority-Analysis: v=2.4 cv=XaUcX455 c=1 sm=1 tr=0 ts=6aa45443 cx=c_pps
 a=vEsArsaSdKs0mJrCYyxDvw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=RiiM50_fTKWBR1zmL5EA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3MiBTYWx0ZWRfXwJmNQM0VWBUs
 6GywTayXWuEIiMPP67tlROK/9CqcjG1vPBl0VOAa6PqatHIFev0n/Q8/FyeBdurmSVPXjZXf2ar
 bjqyhbkTn7DoWgnVQ09MPiNFMBSEGCtgeP+VPyfAzk8TvhhNrS3HAXHcIk3AXLKbxIBqJ6EKrgS
 dyu9SZntCV3sYVPkFTyzBdeUNTuh7KMxrPhxT9jWMpwuohAkFu6YR4MT/zJb4v99A0o0AGpC6/A
 yyW63b+Zek0IAf5A/y3c/8hCFWPzADKCfvzgfhyVWWY9D7rxk8q22yWh/CuccO6lrinFPKW1BBg
 TBzSyutvsXN8WsqrxfB17woBM0PW1pN2wSEbDfkH2JurrNRmbK/m1nlrNOJuNrv8GK7lldvGUkZ
 opW4jjmPT57wEz4xsIg0zNjTgcTMErL7uLPytlflju0/ZDkVJ166/ZTr59+NN/o6mSPpceuVm7u
 1laUIynKihvy7JirvQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3MiBTYWx0ZWRfX/pWKwBu46cTf
 MU4Orhz6mrJyifemzE3KqOvGT/SPZxnCJ4TauovFxwsozy9q6kSjYA7rn8Fo3izI4sOYReMgiV1
 jqQ6zdKy+fKxJME1Wku25K7gauwCt8w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110272

On 09:32-20260911, Kendall Willis wrote:
> Hi Nishanth,
> On 22:55-20260910, Nishanth Menon wrote:
> > On 09:59-20260904, Kendall Willis wrote:
> > [...]
> > 
> > > Yes, that is essentially what the following patch is doing. But for CAN
> > > devices, there is a chance that not all pinctrl_state_wakeup have
> > > out-of-band wakeup functionality which is why the compatible is needed.
> > > https://lore.kernel.org/all/20260902-temp-v4-2-3896f7d16ce8@ti.com/
> > >
> > 
> > After looking at this driver side thread, Lets look at the DT series
> > once the driver series has hit master. I am going to skip this series
> > for this window.
> > 
> > Additionally, for future reference, will be good to state explicitly
> > this kind of driver series dependency in patch diffstat or
> > cover-letter[1] for example ti,am62-m_can does'nt exist on
> > next-20260909 or master.
> > 
> > [1] https://lore.kernel.org/linux-arm-kernel/20260902-smth-v2-0-b3678ca44c7b@ti.com/
> 
> The dependency is listed in the cover letter, but is there a certain
> way I should list it in the future so it is more clear?

Yes, lore link to the dependency patch.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
