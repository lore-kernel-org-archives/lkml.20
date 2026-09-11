Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7132728B7EA;
	Fri, 11 Sep 2026 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137168; cv=fail; b=Fzaudg/tP1/UAw1PEm1SJxZJcRkxh1esXsnFzQ/BX7KHoIyQerduoJtkEgt7NWREbP3/HnB5BH6pkIBsy1d1qTf084paz7kDwqYgOXdeh5+fD27FrYm4pc7gaj+FOGdgD8MhCstn5uzMbDh+0YP+nMK6fVNYgtRc8irNSlrOSLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137168; c=relaxed/simple;
	bh=yZQau/Nx1dIsRSn+HWZoQrsnul3UPBDZDwv8lyRitlI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXo+koDXDgF/TJp88QilzdXrUb6aIptrvsEAVPYq1Y7Nsk73X0QyUIdBONvZlv2D2USx+/t0HTTpHVZgCLau69MRnPJo6W886ENfG38YYRNXrfWn4431+1SijfGazP47PtUDcDgGxsNN25NSTJoqoFVoNehgilFLzr175fnSMfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=kboq/SOU; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tVgepA2Q; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="kboq/SOU";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tVgepA2Q"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68BCibQV3861652;
	Fri, 11 Sep 2026 09:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=apzbnKvz/AIud+R
	R/DT4vB8Vb/G5R7WNVuvNeuK5hcg=; b=kboq/SOUigSo68av5X/4xk5q9VICdnt
	Lim2BlRovlQbXWjYYW7CxordV+QavdY51K3dFZMFzFK2KDUG0Rnc+gD2rEWKy2Ag
	xYvbx3+By821GFpnJirOtXXSdiQ5Ll0CnkP57XjLAzzwXqObqUqRwbGO1X7wzxl6
	2y/cSk22zkDFzuKx3CO90Q/NFWbJN4mrTiJzw2pf6lYTXQ4VYfRgq5ud8lZ0ThSu
	Fk35ZRU2dP6yH5q0YlDQk91ih9TR0MCy0v50zL/svRTeiGvthwZljkQQpBvYjHLp
	Rydv72f13BOgxvQCJfgdNw7H7XfISyJXETYB3nG9ObHPK9atPnniYLg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gm3yyw2h5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:32:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EI0FwKOAFthsRHKYc501Cm9VQtGrW0B1m5T1rejm6iOqKeBFSj0brkm4Nvx2q6GGLCVKl4mSCYiiSkD86O2x2412YEUE/kg1ydMuZwhVsuwEjbnuHxMBAxbT0KlrJnxP/+RdEGTObuA2bHfT/ga4dODqwZ/PbA27pR0rRALH0h5RItio7qT6jzlXo4ce00pDHQDNq1dUAuPy54ZZZfODMetqNMHUSsO1ZTSVTYPKMFdojgMoDuDFzLvZL32LPcrz9Mhm9u8XUWG+DPSLGWxCNKVB09NnHSypZj93/7m1w2FCMlkZcN60Q/GvRrLhuFhrW4iPmPF9vwDAMMZBWAxCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apzbnKvz/AIud+RR/DT4vB8Vb/G5R7WNVuvNeuK5hcg=;
 b=ZQGeE7srp8gwbmdb4EYaZDtAetY3UfWSMa2p2DV0UeV5+BYiBo2OXJSd44di/ARIMZBHfOMDaJKPqXrO4qFW6cmiG3hTVFmwk5/ubJIxn1vrYjOx2mC5SkE3XEKaFtvJ/HUXqUbNzw5oz1S8M/76hruBK+wAbQvco2B+wcfLiLOSoqWXCZAuVgzFaO33wFv2Aj5SG1509hG5Iim58wJAcGmkBiIW2YWCIRgTXqH1ExaNlx0k17IaE8ukxFYyBGRy5fEJF7rZuFPCH1BIO3IW+yunOJmAv3ItIRCgzRjzFpNBFIXlJcDHdhbIRp6qdXmDlsw4wRsbtSMEH9MQ0Q4+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apzbnKvz/AIud+RR/DT4vB8Vb/G5R7WNVuvNeuK5hcg=;
 b=tVgepA2QsmxH0WI8t3owMs/RgDTp0VPhTwTSNoIrYOiNJl04DM6KX+Kqe8febq5LHB9LJgU3b47bqulhC3uzZ6VuU0TRGUvLDxznlhhhZ6BZqG02liFUMiup9Z6myDcOh7rtxjYvPx0rde+rxhx/y7MRFBMLSN2UaxDjKMqL/1g=
Received: from PH1PEPF00013314.namprd07.prod.outlook.com (2603:10b6:518:1::6)
 by DS0PR10MB997576.namprd10.prod.outlook.com (2603:10b6:8:310::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 14:32:34 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2a01:111:f403:f90f::5) by PH1PEPF00013314.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 14:32:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 14:32:32 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 09:32:06 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 09:32:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 09:32:05 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BEW5v2281753;
	Fri, 11 Sep 2026 09:32:05 -0500
Date: Fri, 11 Sep 2026 09:32:05 -0500
From: Kendall Willis <k-willis@ti.com>
To: Nishanth Menon <nm@ti.com>
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
Message-ID: <20260911143205.pecdvyzsiokdvpy2@uda0506412>
References: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
 <20260902-smth-v2-3-b3678ca44c7b@ti.com>
 <412fc9b3-cac5-4fff-8071-ca2d4855db30@ti.com>
 <20260904145913.a437wnuif4arwb7j@uda0506412>
 <20260911035535.eexmc5g3rdwyahl7@speed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911035535.eexmc5g3rdwyahl7@speed>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|DS0PR10MB997576:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c01e21-43a4-49fa-e14a-08df10118450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	x/FvvEI0ii9Fj8jInb2DW08ya2M9es9W3rVD8IdXtPahgFuK0fIOnLeG0n00WKrnjuJRofBt2tBq8XsEuBAifqQUg+FgcBbk5W6aq9KUUXPaAyceXzxOY/g2OJS2RK4Pz3HR9s7vZWliaxe+qBKKk4q8csmX6Smt9bQwY4w3FziEaycXL0Yd5rSjIeItPdfejRnnqRRHxn6uqM9IZvHWxt7AZIrnIC/19LV7wv24LwDf+LF/otJaHN8qn6CQ1xELLV+YvHSXyaQXyQtAFpq4x/5v7zwP4+PhEj/l9C03VY+z0dYDwwKfJ4GPCtY5CsGzDVE5ax+y7fELgccxPKlOqas3GgeML0PWqVmN7m5vTtQmT5OepeHNe+ec3U522CMa6uQ16Bjw2KCAXLPC5vL6IkYlmkavz8aD4ggfzOz9mSnKDqoSzfTF+6rXieOh/J0pN55mE/6LetN16fJm8wi6eyypAP7jxP3/Q/DjFqmEUfTtbQVfy33UVIontBFFI6jJsS9LcO7Nz3nheTxLiO2tCUtXKJ24pQIxleMviTohF58TjL9UZXMX7l5ctH3Dp8Y0svNKU/yWRQA4rt3EqyY2OpNtTsnsDz1fiI6BGVqLnZfd8hb90CKwc3BLucisWH2QIyIS6MHu9RTYNa3tIJh8cmYNVZY78M2yXbBP9yHd+oqB/L64fjJAwQvC37GNPwhdZR6lSTtRrpOpAksGZBfjCQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	leGjLnAK+qB3xJddQQvTLAyu9090kEAi4KXsRvCGTgyWvbyKSBkKIZCx6GVr99QjaN3ZCKrEw2+T0O3fflXaik07Bxe/e4SrsQyJpn3S6GV5uz/3ICTyLdQYHu0BvDc4R5Hj5iNg3RLalxhada6nsqIapjVgTWF9Fm/bqdT+oyG1xT6rZ8G0v5Gg23fbMMzmTNXh2Q0+L+YIbRJNSoAHEkh+TPCKe+zz4PGdUaXu49/9p+TXR7DzaGLBZk7XZ/H7N7meTx6WBvD504Hb/4opM67O81DabQ0ojsxf/UWSGqAnUriw1cBn8wa9b+PKJcbzkQrqxuXAzKiUCkz1+XdGXGCI4nmKvx1uoHTaSBEBC74nqHBqR7heoPtrvSZen0QtMeIzddwP05s1k+jPXoBwr5kh6gs1nAGVpmmBggNuPmIL3bIESOXE/sb8ecaitN+8
X-Exchange-RoutingPolicyChecked:
	QunBGi9F+xIIbYoEy55xb+uRBE5/Vs0r+DrIHlKXTmR/JyeWPtaHm3beBa1WqShu7mhK5Shthlvl/PAxJkEFy/GQFSCr5+K0Vo7D9GmNyvaQZPXWbLFemXX2vD3nupqAB+AddFI9b1y1S3oI5yJMiApQdbxlQUgRSJ3D19wLnTfbhoS7QQfKCsy5xzQ0Xmcl+Okzmg9XiYMyNEpfR7/mNXCInpxCFDG6JerD66CxdfaFl/T5/rERwRXS+79t2UX4y5nVx9W8T8Vfwc8aiTw0FbF5wyh1gu4Rcm/dr+aBCaKr3eooye5+2aAIXQjDPfUZ49lICBrrwzJmETbLFFd82A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:32:32.9469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c01e21-43a4-49fa-e14a-08df10118450
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997576
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMyBTYWx0ZWRfX2uTSMCwUQgwD
 r6d4s4UmuN91u5yRTjPo3sj723zonxoZ4Sepcx1X0mx5axuEf9RVY7odCTD0y8Wluf92/+x4CnA
 Wi90u2/iRuvgjyeKNl1o51zFRh0TU64=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMyBTYWx0ZWRfX1lRGxIjMWNMx
 ZPycnp/iYRekmvr74MtXG2bw+t1DYWQGg0pIRH5SSPdULwjwvlnCVjZT0PbjVYevPWQgcUmv/6b
 OqxcUcEUnFn56ckoQYiMi6R3DLugiZuKTNzRqHqvlH1qV7byezQS6D23dKACZPQu5L4ep0F0BN3
 rIiLP5iWlPvOEVkXef7CtQhADh6CcSg85UN53iV6vsjhM+21i5zNneXuX392S5HDJVr1nlhg/rW
 +ezyKy8nfgFsc77FEUK2mMNHPtq8uZLJngHiwS2YKubNj069cSP1PrxpbgxS0703c9m7KZM/B2F
 bSbI82aIjS5/YZRL2cdbO1inqZ2IK0t2o1Ogy43IiJMN01YqvLctXUO3ezuOPqp853PBAteKthL
 pdATQ3bXjIx/VYQQSQkrmQlk3DkwMmTW4NGKNn3+NjGp2UMFVSfnpv/LXDZYlCd5cLVuGZDv61F
 gFIdEP4EO+1BEVJTEOg==
X-Authority-Analysis: v=2.4 cv=Y8FtIReN c=1 sm=1 tr=0 ts=6aa41104 cx=c_pps
 a=wsTBi80DslKxnI1CMYi+3A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=emS4ezyyPzQZwLKetGEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: CkAG-61CGSoQC37bbqs_CfcPQXAh5yKi
X-Proofpoint-ORIG-GUID: CkAG-61CGSoQC37bbqs_CfcPQXAh5yKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110203

Hi Nishanth,
On 22:55-20260910, Nishanth Menon wrote:
> On 09:59-20260904, Kendall Willis wrote:
> [...]
> 
> > Yes, that is essentially what the following patch is doing. But for CAN
> > devices, there is a chance that not all pinctrl_state_wakeup have
> > out-of-band wakeup functionality which is why the compatible is needed.
> > https://lore.kernel.org/all/20260902-temp-v4-2-3896f7d16ce8@ti.com/
> >
> 
> After looking at this driver side thread, Lets look at the DT series
> once the driver series has hit master. I am going to skip this series
> for this window.
> 
> Additionally, for future reference, will be good to state explicitly
> this kind of driver series dependency in patch diffstat or
> cover-letter[1] for example ti,am62-m_can does'nt exist on
> next-20260909 or master.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20260902-smth-v2-0-b3678ca44c7b@ti.com/

The dependency is listed in the cover letter, but is there a certain
way I should list it in the future so it is more clear?

Best,
Kendall
