Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792491400;
	b=fXfEbM8flBmHUcH4LRK24vpUYNLnPwV4ZRUm6wSkyLRYtROoyO/JgWiv8msQyzyd0rto
	 pxuvopveE9M3VQwEWGDl1jWhjHXbPhkbmDD7YY40O9t8PiYzcdPHTMpMccGHBAUjpRELh
	 zUcDpRl955pGi3pFjpYK8Db886Lz9ID76+zONbFLPnr4DMrCTegKfaI20cQCN3+jI2NU1
	 sFeodicKu8nimH3o9CEWW75vkSclNWY2/FAAKoTHiTcZzmHCripEj3a96h6OoOazSqncD
	 rmXDg27uOSfsfLYcOWLajYgW8BnQKRBd8fZPl7FVT/GExyv64Wsy7ONpY+nr+Ar9g1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=65Nq0mYHoZFswgLhv2ILYNP/2D+eFVtyhZEd41WNaI0=;
	b=kD6AbkFSiohYA5WiWvhfjKuVc7f/XUPR+MAjZroF28ZZOgQx/PVcQftOEKACHz4/aOd7
	 zyatYLHIF4g1R2BNX8PhNjKkmj/9X2k2CMpEuWJx/OCyqG5shN4x3tQ20Cr0Jj+NAJdO6
	 1cVZ0Xs9MK7L+vTCBgRcNQ4xHO3/+EOmO3Uyc0/NyIb+Ckg4rowaOHz81PNESdhXEhSnV
	 guRBz/M4PD2gS0PoUNi4eez3s3AM1ogJwHLi9IzCmIr1zGBh4udOhac63K5YgzxBFJ/jc
	 RCCtwquIgLU/XPd1AhmGd+NuMdArfvrVQ8sr/UmK55cJMDINSqcuboh8lgZ00U3sUHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="bsp/p67U";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=qMV0ys6z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991C360A2633;
	Tue, 20 Oct 2026 10:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 991C360A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=bsp/p67U;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=qMV0ys6z
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JNi6BJ3322721;
	Tue, 20 Oct 2026 05:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=65Nq0mYHoZFswgLhv2
	ILYNP/2D+eFVtyhZEd41WNaI0=; b=bsp/p67UBUHXtr1/QLR44iZedJEnZfNH/k
	fneDK58qJrAUUtQf9N70QL8rqcwwSc3dUsr4LOShdmmOgaxs8dZD+6gT1/bifb1k
	45xIWFd3XWCY2lrp8jkoPGWpARH1lT7U5C9J6o9fBEcVhmmWhVB554lvum1aPkft
	qvWzHH//teKx+002+wxL7ml6TGkD4Xc6/YKR0EDZS5QX2Y/tEsGllmZLdGTsZFYI
	F9FuTtO2Xp4OdUao/+IlOkBEx37gRMQgjHFAKEf15IwOUAw4d79+KpqOI4XctShu
	p68UZTBvBxOi7+WTlaYQg/0s8zb/2vHDfKPnFb5s3JRCLsAZVzKg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023142.outbound.protection.outlook.com [40.93.201.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hdw4vrmxf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 05:16:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5m4aLtSPV5SmB0umqzeUImgrTr8ODNlue7yVGHyqWnF0MDZ9UL0pLSd32iMsvrMi/1czyAzoBtxDKSoWPYAgX8tBjrxHYYq6P4oF2Chby6kxRd/1r+pXu7ehB4ou7qDEwDoXjNcPrmjLqlRDHq9Cfrhymp1Ks0yXDlDQh7i/i9x944zW1FrdBhQH2DS+yh9FJPzFM5xkKfDDMzK2tXfTFZkutEn72qqcLsvZrmOJ+ZgPUYoWLQww2YDWXkJP09b7XNaM1gDy/Q9On2IN0CHmbZY36ErrI+4z4eM7ahlEN1z3SzBaVKywP3Kw1Nky8hSsONZCSuPMBDztsfrwAvjiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65Nq0mYHoZFswgLhv2ILYNP/2D+eFVtyhZEd41WNaI0=;
 b=o9TZr918E6TBw9MmUfydS7B3gdgIeJM28EhzzGL8IFXHroLT+pOYaeOv5GjbDlOh7T5s065hG3CBpkGgF+1eEO49rJgwZl0lH99Ep3AJweavQq+wwm7iVfFSBgNahtWxiZf204aisvZCWQvn6tFsn6WpIFozKfVvYMqtH6TED8cq/aGyPo9gd12zs0rOHTsNRx+OGt00kVKEAS8qqYcLkQWUb5DVOBi1JyYPifcgS8t5lmVWkY6JF3vLHL3DsdjMU3ZWdiHlKXhhXRBehmah/JeOr4GZ5dSG/gZgHiTt7j1sFYsgAWC/qkXhWCAF3eOFHti2GWr7dBAcYefta7dShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65Nq0mYHoZFswgLhv2ILYNP/2D+eFVtyhZEd41WNaI0=;
 b=qMV0ys6zM8Tmxk44m4CUqk38d8JIDMKGT+bKDlAJAmSOVRUyJovXdk9ncK5TrQYnei+6JvVnEufJzuK0JZYuawUjLLlDpoHRfTXBt0/TIyjIjD4rcRqpyx95mbS01Q8Hr0hPgKY5c5aFuavQn6LMVs7LDqW6u9XNjXTHRhiJMgs=
Received: from MW4PR04CA0218.namprd04.prod.outlook.com (2603:10b6:303:87::13)
 by SJ2PR19MB7557.namprd19.prod.outlook.com (2603:10b6:a03:4cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 10:16:19 +0000
Received: from PH5PEPF0000002B.namprd04.prod.outlook.com
 (2603:10b6:303:87:cafe::5d) by MW4PR04CA0218.outlook.office365.com
 (2603:10b6:303:87::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 10:16:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH5PEPF0000002B.mail.protection.outlook.com (10.167.243.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 10:16:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DECEF406540;
	Tue, 20 Oct 2026 10:16:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CDD3682024C;
	Tue, 20 Oct 2026 10:16:16 +0000 (UTC)
Date: Tue, 20 Oct 2026 11:16:15 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: SDCA: class_function: clear sconfig.bps on PDM
 data-port terminals
Message-ID: <atc/b3fnnE0Y/SsU@opensource.cirrus.com>
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261018192359.287987-5-srinivas.kandagatla@oss.qualcomm.com>
 <atXck2Ef4OllKrAA@opensource.cirrus.com>
 <e1d55639-bdb2-4b26-876b-68c71e7f724f@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1d55639-bdb2-4b26-876b-68c71e7f724f@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH5PEPF0000002B:EE_|SJ2PR19MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: b04b5128-db82-4cd9-6079-08df2e932ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|36860700016|82310400026|56012099006|11063799006|4143699003|261009223027099003|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sosSjYjr+msnPSrFFPylyP1u0/vuxazrt2m03wdmjkhiBeBaOylarpp+Oiv6Xn4fJx8WAn4dH6/M3h0Kyn17Vi1WTO6REi3sVpnpmTIjIG6I/EOOdebBe7n/yj2m6b/V9yB5uEdpjPshU1w6oKM/bB1wGleOpWJM/+GlqOXrU7IjPyAOQ8WoRkkKI4SFsVXyrvBO+rn7g5vrxNeyiNdQgx7NuCUnxto0zBrksyIGJNGzcKPECrUUG5WmfBLgBR1cYVj1y/pMwuxLYsE42EoPCqxRezlTne8t3W/qycjFNYGTc8PCrohNoxs42qMyeyw7ubiH61ubXQIE1LHQtFeZdScAbpYIg/uMC4WyzAx6YJ/ybFI42z6bCBmrsYQrdG5ARUr+Xi3xFG+BdDkf7yvYyszvO50OoBKVld8Rl4aIaj94TARkDS8LzaM0ijJrCn7wwbA07ddqwEUK1L2FuEm71/EUqFMPURJIcPKOrlB6lgkqn1/IIVT+TIRCEN7qTCuMpA8U2150YmTkLvttIssaOtU9D/CID7MdwThxDxuCBxLDnWQgrJSqPrUDinABvyogXKJGaeTkywYMBNJjsOM5aXiSWfjH1Ls56MiuTu7yP1YI6Ca5DFWrylEyHN6/IhqUcFPji7XR3/oJmjQYtUwG9IxPCXYK4TcEqbkTV6dxC6Nu/x04e4fKM3IuWYtrBU9jX7g3rb8o5Lg2uo5kauEOKg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(36860700016)(82310400026)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RtvnyWLjVbQyO6drwR74x7Ux9o51Y3CXFH4eBXuz+dVkHCJpaJiaH4xlloUilVi1RXSBHOZnaIHIBUQmuPN8jCfVyVXpFs6n9NFxNo6jqPyuKuUQySoY7wT1MXD8Ron/wIWbTtYww8CeLhW1OF0iXnRHaymLl43hGJPwba3D/XBfGVxpfa3P8ZMoMHpY7B50mq3pPeX3SCUQ8ECStLv5LLNZ6bG1MIC8HLWcMr2A42/RNSbObIMgrF9hbtSvL4JIXWYorMR28zLzOCTW89AC8fWKubsXoq6SvBMVBSgALCQDN/4HINSCZXcbmTCXxqpF/qOROPIkYCzDqzps8paIXooEI07LTqB9kd8tptIgizWogVNZ6TspgpAR7JDQEEDiNqDa4WfvQHchd1Kndf81akZvpcFhUobxPYC18+4zq9HAwBliUPgygjVR61/Wa/o+
X-Exchange-RoutingPolicyChecked:
	UgVpgAXbXYanixG1WrsUx5BJUVg36YnXMuY+zkVrjHwf1IsAW4Z5J9+6nDhURTRGRzqCEzD9Ng8BlNJfXf2qn0OHQR6jRVXLqkyObtVZdTsGdWLWb5qGZpeJ6lyvS3mHmSgnpGMX+OhFh9TcMWQgd+iMQXQdP8Qui1EvihPP3YLEgbUyz+1d0HFtpMrysRtOGwdTeOswGtWRWPY4+1QM+BXOgvefzbxGmvacdabvNg7zno0PZ3U9pwO0q/fIyyXw++Aey21A7jyaHv8lQolAqN4dxSg1O4pQfi4UBtLNbrQtPQqi7Xwv3Zx+TWGcMXT1BZO9ZXfnY5Kfly+tsRQyGg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 10:16:18.6224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b04b5128-db82-4cd9-6079-08df2e932ebf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH5PEPF0000002B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7557
X-Proofpoint-ORIG-GUID: yVjPuqE5vTmhs0Ggaz1e_VnSQMXKap_h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX5M5Q34fu1DuC
 C9XK/k39CdNw8FtgJKqldeLCiflbUfQ0j1BsLBKc1Zbci+IVXf8AA3dWzw+kuWOX3pLySJNpvne
 lxzVIGoKXRXeL2jiTXkFet8beLv8VQw=
X-Authority-Analysis: v=2.4 cv=H7tOUOYi c=1 sm=1 tr=0 ts=6ad73f77 cx=c_pps
 a=h/+960zEkKFrtNevg2BoYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pn_daZeWPT5AFLekyVgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: yVjPuqE5vTmhs0Ggaz1e_VnSQMXKap_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX2G7OdCvf3xq+
 7+DJFBeO5i6oUzLO6v1rTMCQsP4O9G/J4EvxdLcCjiTxCfb7UPEwMqGm28Ty0/3dHXoo7nJFzV6
 VLC8kh8Cq39pXZtBqzuA0RHOXb2YHcWTGXNdDG7LkeSD9QvQNvggi2b3gmiHSQggK2w1gFBikas
 GrD0ZA2W+0XP+SeLZ7RWoWPP4t0XGx/4utw6yTm+QuTpmo9w+nIUrsv5MmhBOqxBVbxIBs7+3xy
 wlmwn4cAhvLDJRycIhN9jwCLWrnvxHeX4X11vsJQJre71xLYpISR41VL1pRfvniil+JAiF4YXfB
 vjl1HbMu400LFN+tf3dEjIBg6eZ6qV99QpFwdsMzUTKrbJjIITnPzBAkczBFBc3sb40n/yXAmi1
 4/+2wBeTSmiv7HVnk4ZY8XsR+rMc2pmA2JMefCaLyqFj40qE3NFY9TZv8kFgeHVfnW6o/Rnjd7H
 x9+4MRskyVsC/Z5BNDw==
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 19, 2026 at 06:19:10PM +0200, Pierre-Louis Bossart wrote:
> 
> >>  static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
> >>  					     struct snd_pcm_hw_params *params,
> >>  					     struct snd_soc_dai *dai)
> >> @@ -133,6 +144,7 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
> >>  	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
> >>  	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> >>  	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
> >> +	struct sdca_entity *entity = &drv->function->entities[dai->id];
> >>  	struct sdw_stream_config sconfig = {0};
> >>  	struct sdw_port_config pconfig = {0};
> >>  	int ret;
> >> @@ -152,6 +164,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
> >>  
> >>  	pconfig.num = ret;
> >>  
> >> +	if (class_function_terminal_is_pdm(entity->iot.type))
> >> +		sconfig.bps = 0;
> > 
> > I think this is fine, as you say bps makes no sense for a PDM
> > stream but I might need to spend a little more time working out
> > how this all propagates through the core. I guess my concern is
> > if other drivers don't handle PDM in the same way.
> 
> It's a bit odd to rely on bps when we already have a type for the stream
> in struct sdw_stream_config:
> 
> @type: Stream type PCM, PDM or BPT

Thanks Pierre, I had a feeling I was missing something here :-)

Thanks,
Charles
