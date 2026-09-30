Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08004D37AF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799506; cv=fail; b=OcaLZhSMwJzeJ3EsfqsO80SD7zflMZw5pY3ohSyUlc1H/Y0s5QLYqjs57dnEUuBCnbz6f3n+rvX2nuFO7czerIHKbAiqANqWPxrQ6N30XkHJmaoL60g+UPt9r7bqrgPnuJiFvUUIyW4o43yxr1iXlLgt+BkKIjW96Nci6BqCL7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799506; c=relaxed/simple;
	bh=AWPKSE1yKAcZhxRrbhhdfxcskQP7qz5RDkqVe3UoH5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YOi3Thvod2YuObIEMwEyWKq2j9ZrwGzCYt4givTrePEG60JzLN1iXQWvBMNfZHV9Ls0cxJwyb2JaXLQ4GTy0gFP6ZecfkTmlAyhBpwOHNG0rEiQZZMQ6CWew/uqiHZkkTcOVlwKumXYs0H2g8FPPCrKpurENwRwWKPSWNxrtQwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Z1KbPCIq; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=LTfs2duX; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Z1KbPCIq";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="LTfs2duX"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UJtIrS032993;
	Wed, 30 Sep 2026 15:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2GUsT38y1+VfrE34q024Cn9d0+L1lkkWXruZgQRuX
	/s=; b=Z1KbPCIqvoXuEVhfa5qwrYY1hzN4Se0M8XRcGhSTcZhN9HKO41Nz1f75u
	mLuld40OEEk0Zp2fALdR/G+kcsGRAlLCdkTMLJvk5MWDX18Cy11M3zBD4C0q/ZiA
	RsAA/sRwOPqsYy5f0o39VKyvGVM2xf5YCxhDGsy3duv7T5Gc0F2PK0HuLDszx82u
	0XhnkzdL0z6pDQAWZQsguXt2YIQSDadPqVSTMwBZSQ/U8bzyvC9bpKnC8XX3wyY4
	aOiKPm9ACJmTihq0lYraaVfm9AOuLAEmB9R80fpXe10pCxhs/ggkIQe/c+4fkKxv
	agJv54Bt6IZQ6oaVJ5A5JaoZpzGdQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011047.outbound.protection.outlook.com [40.93.194.47])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvbqmm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:18:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZ379+QgUZHidjqF4fVY4MKK5mNHKarTuo3RNhXRRz0ssc9Kr17rjqoN/GQZPLLh/QC8VMCFjtjFpcvzCvWWwh3z7ORCEKQZaIlcPejc0O9IuaDtAFda8QjDNDy1UwMzcjj4uXDHP2P7q82HmQuGFiwTfJ+BDAgNl3x4NYvNaEh3a0xB/DIHHeGClfk6yJHPE8W72BqTykavw5pzNU36oxDXwgJ/ggQlaDVss15eKEBI4XQBzO7at9AgLj90wlwHDdWHecyK5Dj8hx2H7URGJScN3NG6POqQDZdnofgNECqMdeadWpM0bsbovlcGLbHYNK6aKU0cfCcb8m1lmAanFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GUsT38y1+VfrE34q024Cn9d0+L1lkkWXruZgQRuX/s=;
 b=eAtZjgqyZuchE5BcTJXbO2E6zeObZuuyhS17nL0XfpeIO7zCiRa8udGuL2STUhj0NEIeeYnfvPdoqt1QMgJkErXFz4zHOA6DAGKN+CbKLNf/Z1euj6XYGSKtEz6CLs5eK8iMVUKoeo84mE4q0l8hpKHqUDdo+ntMBJd+iHPMtzohPMnOSLhY1fJLoNPL2lP0EC7NoeeejxDNEKF4Sq2XYBewWzMx6eNz5LX4rxWwzqq+W9XVXP5Eq3HcPN3h7muN+iugSc6+5T3KnDcoKl98O4/l0ALhKRo0roWnL8NKnKW4q4VuE4J7oMwVCHww+NQOKjIzr1JVdfisdsNGcPAVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GUsT38y1+VfrE34q024Cn9d0+L1lkkWXruZgQRuX/s=;
 b=LTfs2duXco2qBxXA9/r2PVuRx9DSsjeFXkv0gj2bM57uJmHpq7O4rLHe8I85R+FAmqDSDFVa2oNQFap2hd6YvOjoU8LagJJFh/IbKapCUyvBSN5Ns2cG4cJOPcU2Yfo1CRNDOHrZQG8OkyUwcvOS0+t+tndZ75P4m3DU66twSDY=
Received: from SJ0PR13CA0135.namprd13.prod.outlook.com (2603:10b6:a03:2c6::20)
 by IA1PR10MB6897.namprd10.prod.outlook.com (2603:10b6:208:423::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 20:18:14 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::19) by SJ0PR13CA0135.outlook.office365.com
 (2603:10b6:a03:2c6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 20:18:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 20:18:11 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:18:00 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:18:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 15:18:00 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UKHuIM3783495;
	Wed, 30 Sep 2026 15:17:57 -0500
Message-ID: <f38b09f0-1f5b-49e9-8050-df67b645c6d7@ti.com>
Date: Thu, 1 Oct 2026 01:47:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/22] firmware: ti_sci: Use rx_message as message
 receive buffer
To: Andrew Davis <afd@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <ssantosh@kernel.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260930160607.2674980-1-b-padhi@ti.com>
 <20260930160607.2674980-12-b-padhi@ti.com>
 <9785e0e2-2bc2-412f-8ba7-d7cc0b5a694e@ti.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <9785e0e2-2bc2-412f-8ba7-d7cc0b5a694e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|IA1PR10MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: f600d632-3519-4021-d57f-08df1f2ff32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|6133799003|22082099003|18002099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FNfk4YfkD2kQmQ0F6TTspEPTDcjBhRX8ySvkaydJXWrWUwjI+kp48toJw/emLQu5poU7VgMyuBr/9JQvzVs/j6a+4iu5iCIba8jnbrpWKPY6ZL+cel2IG6xWoiU1HhvGW4lCB4FCuVspxcCQahwcrB4Sjv0M1SvuFdGiW8u8zv63rOSqSPVnDNDlP6Aod2QEaehflP+931qRK7j4de3BSpS2qomrebOnri+vXkzFdfkT94Es+GMJ6jp9CPrw/1k9eoBj56tIisnOEmZzPYO8Pg39gsLrFAqRBqnK5HT1d/+UIV/4ApcZMoOLdGD5xSb6qYal6hy8ZWA2D4ArPBvQW602P4hr7ykzQwXXo6eNDgInQtNxikG5t+3+ygAk+3boQFV8IQi8ln+4rvRuRdm1K0/R0FHhl3sCQ7Mf6yWMdExJSolKjvALHGabRaxdlPzWJu2jRxHu23+JjZRgMKbNinWx2dzEUpvrDVZewk5T4ZwnY1PztoTwzKZv+DhIRjL+wWDWGwA4HpMBGpkgbEQYDiFe+ZkhlaMKcnoiNLtXFxU4UnXCQX7UaAI7Fl/bM1mtAdvXglEsRzmTOlAU1Wj81hZNzS443eaOqclUYFubYniHtTJqZrCwdrskk3ZTQjkyMjiptQTm1AVxrJmHoadY6tgcrkxolmnqlmZOOtA7EL6X2JpAEzJIWKElSQSiXP05fRmdHGuLVBQo1LXAPwp3zQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q/4RqNDl7WZsVtjsfUGbcIH0qS3ZjbqSiOAq8CDPTMyvw7aPvUGMXjimop+MpHuA7fEfuvqg99v01D8JOZuKmjNGgNRAYya5EeaxxMJ0k9wMN0+B316w3KRudDQEyEd0W/WmTjwq6VQ8+ciGHJCQEsZDLr2DCEgU8YMlRuZYG8E2D8X4isZYhRIepfU6mgJAIGMHTNV69qixUEtD5pHtkWVujxu5UFjnIOizvnb+/947DGkM4R1nQD9gkMrkop55czp9GghOFHlzCFHzxO2i478RM+yRiMpLXa8fNu1qceovd9q08dJBiYgVdhkRuos6cLGb3DSF12WXw8VKaujO5b7k7pQ6zpgorwobOTlNMnmwVN/TOcrOx/YVGIAwgPsmwZWCJZBbzxB9Ce//jIPZBZD8WxqUD5xDaHU4oua7sVmMuShqmPzfoZ51AZgeq6yM
X-Exchange-RoutingPolicyChecked:
	cuzh1cuAMOFREkTsAmi0KD0zCy2eWYxA0e/KfpoRGoV3Pgbr+mOL5Z4QXZVFqr25QHJuqv40T+nVzpRTFCsb3/sWY2mcX5n5WxHBZgaE22rxMuwOIOEgcD46LpTfNlQXErhJaRzeus7LXYmBHiQ98NkyzqA7Z4jD8dQcKOzudGsrl4JxCUPJYcvFp2r34DAH1yi1SS0VxIo19xVvLJJPIXiVqVUDbq2dDVvqQeu24gsAG7xbTUHCCBg6WY2qdh6yUdMMHfi9uMOI+jfeno3BlDgtrk/T3kA+8I0j9SfTJ+ylKup8TsNUy1kHEXWc8fw6QK8+cJ5yxm1GZyJkE4hLKQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:18:11.2340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f600d632-3519-4021-d57f-08df1f2ff32c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6897
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4MiBTYWx0ZWRfXx3QBO0cZ7FIU
 oXwm9h4Xe3NBMF49P0porMr6A3w4fxCJL43raUMBAY6vpycWdqvaumkptd+1qpVRL6eiHohUtpw
 pX1H8N5A+LKg4zgIhiyTZCA6N/e/53g=
X-Proofpoint-GUID: w5746OtrHri3m9jElZLdcEn88Q4jJwjW
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd6e8a cx=c_pps
 a=bw0VQspFR1l10E3Rz9sV8Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=ZSntAmZuB6xAphrjPNcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: w5746OtrHri3m9jElZLdcEn88Q4jJwjW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4MiBTYWx0ZWRfX18sIgouB4qjw
 iauQhllUjiW+DQLS4zVANDboBlEcr8JfCcJMv6t6pQodA0Fd1BI+gd7LOL37zOLmmGBlR92IPcn
 kgCi23cNDDdnaUGf1LmfPLvQRiAZy0TQy+ICY8ZW3aps8U739nY3dC0unfXiPkalfAuP34kr6xV
 Mz8fGd+/JpeA3mr+rxuHDKzr7DjeqERatkMg0TkzVwhHqe8QMtKGNYBZFNw/NMWLRPG05FRBBZo
 iGwYmKzrT4okZiPaQcZZ6JoIYj60ifcW9i+zQkkRdYo2JCCQ345na43Jldfs1S1kBvf8P904UIs
 q6zRfcz54iFUI1IbuAkvbns3gqI/GJ8UjYmGdZj36YdNIVdejcGkJI7IJIGtmNXVXb4hJhzsu5y
 gfPip3ehK/AxehHPY/N+p77W3QPPHF3amiGjG2bT/TVK9J6BFGk0pbepfBuof3sl/3DaQIJYZQz
 cFH/Zz4rwxa5onCLHXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300082


On 10/1/2026 12:22 AM, Andrew Davis wrote:
> On 9/30/26 11:05 AM, Beleswar Padhi wrote:
>> From: Andrew Davis <afd@ti.com>
>>
>> Previously we allocated a message buffer big enough for the largest
>> message we could receive for every message we could have concurrently
>> in flight. Now have the rx_message buffer during the whole xfer process
>
> s/Now have/Now that we have
>
>> we can use that as our message receive buffer. This removes an extra 
>> copy
>> and the amount of memory we need to pre-allocate.
>>
>> Note: rx_buf now points to the caller's on-stack response buffer. If
>> the system firmware replies after ti_sci_do_xfer() has timed out, the
>> rx callback can race with the caller returning and write into a stale
>> stack frame. A reply that arrives after the timeout means the system
>
> To add, the RX callback checks that the message is still expected
> and returns safely if not. After a timeout the ti_sci_do_xfer()
> function marks the message as no longer expected, before the stack
> frame goes out of scope. The only way this can be an issue is if
> the RX callback happens exactly after the timeout and is able
> to get past the check before we set it, and then also not finish
> the memcpy until after we return from setting that expected check.
>
> We could probably still solve that with some additional locking, but
> in practice this exact sequence is never going to happen. And the only
> time a message timeouts is when the TI-SCI firmware has crashed, so
> your system is already borked.


Yup :D,  LLMs are good in hypothesising a scenario where the patch
could fail, but bottom line being this: "And the only  time a message
timeouts is when the TI-SCI firmware has crashed, so  your system is
already borked." , we're good. I had added this explanation in the
commit message to satisfy sashiko comments.

Thanks,
Beleswar

>
> Andrew
>
>> firmware is not responding within its specified bounds, after which the
>> system cannot be expected to operate correctly anyway, so this is not
>> handled.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> v2: Changelog:
>> 1. None to this patch.
>>
>> Link to v1:
>> https://lore.kernel.org/all/20260929201746.4078803-12-b-padhi@ti.com/
>>
>>   drivers/firmware/ti_sci.c | 21 +++++----------------
>>   1 file changed, 5 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index 6ed67160c6a7f..fef7028d40e39 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -45,14 +45,12 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
>>    * @tx_message:    Transmit message
>>    * @rx_buf:    Pointer to store received message
>>    * @rx_len:    Receive message length
>> - * @xfer_buf:    Preallocated buffer to store receive message
>>    * @done:    completion event
>>    */
>>   struct ti_sci_xfer {
>>       struct ti_msgmgr_message tx_message;
>>       void *rx_buf;
>>       u8 rx_len;
>> -    u8 *xfer_buf;
>>       struct completion done;
>>   };
>>   @@ -287,7 +285,7 @@ static void ti_sci_rx_callback(struct 
>> mbox_client *cl, void *m)
>>         ti_sci_dump_header_dbg(dev, hdr);
>>       /* Take a copy to the rx buffer.. */
>> -    memcpy(xfer->xfer_buf, mbox_msg->buf, xfer->rx_len);
>> +    memcpy(xfer->rx_buf, mbox_msg->buf, xfer->rx_len);
>>       complete(&xfer->done);
>>   }
>>   @@ -522,12 +520,10 @@ static inline int ti_sci_do_xfer(const struct 
>> ti_sci_handle *handle,
>>        * state, then ensure that the response is an ACK
>>        */
>>       if (response_expected && ret == 0) {
>> -        if (!ti_sci_is_response_ack(xfer->xfer_buf)) {
>> +        if (!ti_sci_is_response_ack(xfer->rx_buf)) {
>>               dev_warn(dev, "Message response not acknowledged 
>> (caller: %pS)\n",
>>                    caller);
>>               ret = -ENODEV;
>> -        } else {
>> -            memcpy(xfer->rx_buf, xfer->xfer_buf, xfer->rx_len);
>>           }
>>       }
>>   @@ -3326,7 +3322,6 @@ static int ti_sci_probe(struct 
>> platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>>       const struct ti_sci_desc *desc;
>> -    struct ti_sci_xfer *xfer;
>>       struct ti_sci_info *info = NULL;
>>       struct ti_sci_xfers_info *minfo;
>>       struct mbox_client *cl;
>> @@ -3380,15 +3375,9 @@ static int ti_sci_probe(struct platform_device 
>> *pdev)
>>       if (!minfo->xfer_alloc_table)
>>           return -ENOMEM;
>>   -    /* Pre-initialize the buffer pointer to pre-allocated buffers */
>> -    for (i = 0, xfer = minfo->xfer_block; i < desc->max_msgs; i++, 
>> xfer++) {
>> -        xfer->xfer_buf = devm_kzalloc(dev, desc->max_msg_size,
>> -                          GFP_KERNEL);
>> -        if (!xfer->xfer_buf)
>> -            return -ENOMEM;
>> -
>> -        init_completion(&xfer->done);
>> -    }
>> +    /* Initialize the xfer completions */
>> +    for (i = 0; i < desc->max_msgs; i++)
>> +        init_completion(&minfo->xfer_block[i].done);
>>         ret = ti_sci_debugfs_create(pdev, info);
>>       if (ret)
>
