Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794588381;
	b=337YU5YQC8IJxtarzSg28oz79SPMtxz9vfjTx9gHEufTRHpwhUnVBrkeQh4FZSdCJTEM
	 j/Cl0uY8662Cwl168XtZAfN+eHG62SoFfDD42kA0xos1XZtATf6JNSi/wUQfr855owA1s
	 QKVixgjBazeFBADX17fYtHxeySiwkdka2sACGoFzOr+rqYMEyhpq4Sa07ejkncWwi05/l
	 4r04nzqqjUJhyDO6kxDokyBv1KwswuFMX4V48YRRRlCEs7E+zxBoC0Ym6H4LmSPA0838R
	 AfW536iFND6i9WYoHfa5ARl113S4S+SXzKEj5GANFFFNneQk+/geDmvf1dWuID1Ty8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588381;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=Y9DULNjmW5mCgTcyYQoCbLRJfZbQUvCEGwkw6HD6e80=;
	b=XQONOz5CnjNe7F5saIDJxxKYsw3bM1Jc3DKtJI4c28pLdj3O8se18v95xsO1zxGUb1P7
	 erVGTVdB2rSyJCKlY/4rAjOYeO19egIeZhKL4HcWmJM4AYMTIfSDd9oafcWjIa+EV7Dtl
	 BPsSx3c3tN5GRAImyi2stdSjI+JeAWg5a4pIvIO5PCP1r2JkILclDbaKDFgHbaWHc/0Sz
	 kLTr3lP2bNYaxWokg3IeZT9KMf+cEkAo8hAHgjElH7K+1eNEGY1F7JZq4nSZgdqoPi2d3
	 ulTWshXhZqBdMG6tt9cWcISacRRY6rq/d+FfTl4yla4kkdAVfOATLppl8a4aSl2t6kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=jBD479vK;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=gC7cMG2F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F27606EBE0;
	Fri, 13 Nov 2026 16:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F27606EBE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=jBD479vK;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=gC7cMG2F
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFsn0J589497;
	Fri, 13 Nov 2026 10:46:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Y9DULNjmW5mCgTcyYQ
	oCbLRJfZbQUvCEGwkw6HD6e80=; b=jBD479vKVDcCusWDTTswUMPtuTvXf2jfi/
	I77I/qfbGynstgU0hBSs25patG3uIgjoygEeya1pj9dax+rTcYLWfQ/+B/NTgyS0
	So2FnrP7DJFT43suBWtg9KtKN5fR5aFwrlXk8dAI5XyrhvM+UPyTQM0c41kEtbsi
	X7QD7pg+lF/WcVOgehg792kTWZnwUAG+c0ZIpV3M9uUe1pbrilt95PNZv78ioqDh
	ngaBO0VsoWfO1kzYZSkmU04gRDI3K5Ry7F8nP86qZf/oquPMnbqODXpMthg/W82G
	FBGcyK2B2dpH660WIo1pSfREHp0z/F16Kh0hWjxrxXbgQGbNlXLw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020131.outbound.protection.outlook.com [52.101.85.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfpj5nc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:45:02 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1eRA1uJ0OYY/HmCY6o/s9HZm9DrynXhvelANyZKiYVXHU35qMAoduecRQ0Gy4zOkgETg5zQJ/R8VIOAvELso/b6ARm0MzMtlDeHxzLU1T4fzDkrM9P2rThVrH98mcQEtlOp4o2K3TAOv+OBY3/BJaWdZKLzqabo33Rnxs1vJ44XHztt5z09Et9GydmigtKZNQRJHZZUj7N+CWLzGX8s63JeGMWakmMPW05SnpRsvBYloNxnq8L/xXB5JNoiCauMR46CloCtQYe6j2Ovn/0JS54OgYpYI3gLiUy65ONw3dYM0/ODXSl9L/186i7B52Orq2nO3J9t51OjpzI1VggFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9DULNjmW5mCgTcyYQoCbLRJfZbQUvCEGwkw6HD6e80=;
 b=NMlB3oPT5SPJkH3EWNy5E5cf5es+HXPy1edy8Qky9AZvGfSD6aI0bFQG0QtN3gAdfLk7FEEN03smTIUvEPPwBGOyTDxRpuBLGaLPXqunwsmIGDCDh5pIgAog3T51FytIvHb0RxCWMvDBwYH1QesKNS74lEfo0xVYAE8kHqaOb8n9SMJWPRN19iTpNR54R+QWYN86FVT/eH3MjKDKqPFF8D3kX1iD78nDih95naxIw3/rmwhXaTHyKvBcnfmbwvgGJWdN4ir16s/BvvoX9pRUnJXNy+kX70ZRbCagY4KSm7Sh1AR7niii+w89Nh7oBzZONWDC45aA9PHrU+FoNBQFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9DULNjmW5mCgTcyYQoCbLRJfZbQUvCEGwkw6HD6e80=;
 b=gC7cMG2Fuf9GPLS8MIV/UQuvJXKwCOEN4wCkizqYATL/InWpPR45jH0HxcNgr1uJ2FkWZ4OG1QVFZJEkPyQU4/1/y/lr4Eqg6T4EA/uAcqeCDXgfJrK/LW19Mu1jPI1LrV9jMED6lgIaKJFhIpd1gv8OGe4K1rCIY2z5HP7Ve7Y=
Received: from DM6PR07CA0130.namprd07.prod.outlook.com (2603:10b6:5:330::22)
 by SA3PR19MB9503.namprd19.prod.outlook.com (2603:10b6:806:49b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Fri, 13 Nov
 2026 16:42:57 +0000
Received: from CY8PEPF00000050.namprd05.prod.outlook.com
 (2603:10b6:5:330:cafe::2c) by DM6PR07CA0130.outlook.office365.com
 (2603:10b6:5:330::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 13
 Nov 2026 16:42:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY8PEPF00000050.mail.protection.outlook.com (10.167.247.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 13 Nov 2026 16:42:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9D11A406555;
	Fri, 13 Nov 2026 16:42:54 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 88C50820273;
	Fri, 13 Nov 2026 16:42:54 +0000 (UTC)
Date: Fri, 13 Nov 2026 16:42:48 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] soundwire: bus: Hold bus_lock when looking up
 slave devices
Message-ID: <avc+COuQMX74xTHD@opensource.cirrus.com>
References: <20261103095445.81414-1-lee@kernel.org>
 <20261103095445.81414-2-lee@kernel.org>
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
In-Reply-To: <20261103095445.81414-2-lee@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000050:EE_|SA3PR19MB9503:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd1d48d-13e0-4deb-8cae-08df41a52b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|61400799027|82310400026|10067099003|11063799006|4143699003|261021123027099003|261021121427099003|261102123227099003|261026121527099003|56012099006|261009223027099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	qSDyZwIEHmOJ6wMxXJnWSeN21Rtmh59I731oetDqtIt6VRlZQ/vPiu3+KPhW/FeVmmbms/+9OUlmSzoCsIUYUcZKVNm2lQyZwgfm/IA4m31ZNc5IJlNednUHiZzIvuvi3YNCc6Al6+6su2YvsabcoYEd8nd+IIASqCqpl1hyfIqXIF2wefD+ASmZqY7GrXfO9pFcIrn97FPb/E1vTaOtYr+e9pn/2yILYrjIsr78X4yl1UybRvNp7B7+IsON9PbBrvMfcmAOeqRWcSAiWXGuAdyUAtLlF95gOcOzXaLyzOFiBNCf+sYrC+9rfwBjsoo22xEuqNeMXOqlyaSsf8/dbW/XhcsqvpAsijV5QUhz4PqJuV2NHdLf4EQx6I6RGnlDRqUShqG1/3ukaxWQaP+GnM2pyj86YELKedobj8is9uTxZV6ZnX0t6a96c2VbLRhObxTn4vlaYcltr3c14X1RH75TigIrbFLe0XImuR/GvhuZg2v1qmpI9FZnZa75tka14JqD5Man7J2PVTUHWkI2+ZLKoMcICQ3mq8cxyURdhc7TRtk+fvQDPaexe3XGO9o7DH5LwKeJ2UL+IckydeZ0gTOV8+ejZOM5JXmt9dYVBPESeqZiyZltoL9mu53burhtw791nSPb4ub3j7fRZBnWsQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(61400799027)(82310400026)(10067099003)(11063799006)(4143699003)(261021123027099003)(261021121427099003)(261102123227099003)(261026121527099003)(56012099006)(261009223027099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j/YUufuesqOkn8ozbclGG93PoDqp/4TOLPUi7YQ7cL/ZdWODO3n3e4kX+avku90TVDFXFFwmi3n591QqrNmV/1ZYhQA/uukBNZM7VdccObL0ITAwAddwtY5IQfqQAGdYE3cRg8FSfZqZLJbMVBEnSJaofPovCBcNgLyzAaedSy80WXKeS30K9eZbzhaBJGfX9jrJyirjtZ6eZ2r5tLyNJRehi53tyzhUribA/bwGL9iej+u6QdQjtk7935rhPWTksJxXGWEIfasb0WoVqEMdSFOiB3hqsa99h0E+F9Sf0Hl/Xkrpu3fke+ep5SCXGyIoYENzT/tJCCQJ6LXXiBK3aH6nBDuf981Xau1RSM1YNu7YwtVwBNN0rCG6zMI8Zkgg1yNitXiFayTRCm68sfgpLL+DxE5wwYo5b8rWg4XZoSVS803c+fEmmU3DPcP/ISFA
X-Exchange-RoutingPolicyChecked:
	U9YwT8HrjLR9R6z5lFX5jljtuctC/pGMoIjwipl1g1pw2zCUQTGJnkrbSM+v2Vl+WPGTUE/jKUATtwr2O5V/1vwrhc1YGKz9AFvRpCREcByYARUuMvWeSFwB0yQV+O9O7JqyUdv+U1yqwgPSOocjl7tWIx8MljLr7oVIoEsadCoqTjepYHyT18Tnj44De1ZajHKKw7akxeEc4uK/QCekioxBThNZ3eIhFnBg3BhZ+PI35sm1HyBJNJDPRxprjrK4fuReNaEJcX+1JG8I28r8OHgcDrN5eh48O/etE1F+SQqbdZewBDEPYdz4eDxHnFjEAPsFviSpiyIvxuECgVjlsA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:42:56.1999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd1d48d-13e0-4deb-8cae-08df41a52b7c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY8PEPF00000050.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9503
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NiBTYWx0ZWRfX3SuwEaW9ER7q
 z4NA4jv+QBMZP6HEhlkFnbOoomQpaTBVAFcYYUAYj9JebgTimzNgrD/EiOL6wztCAC9vbeXPGAe
 vtG2czC2VKnJlym/9IvBUTp6qVYTv7EfhIw+jsmQp7VrVJGy5nKjYwthzC00H2hwdhXNvDvOFHM
 vO4rdPW3mgwSBHVdi5KzxpAV0S0RX8KarILCX0yi8WN/B4OwuvZC/z37bt3Ao8v2NsL6LGJd1ug
 ZM1EOEjQBq91OKzA9tYqJ3tboGWC+b49rC1pRYP+F68vybE+yKzAHyf4CmScGM6/DPksjJwOz9h
 X8ejp2H5C7qbHXXxhK6LiZQlOew+MWnwTNvpMY8VRe46Gd/rMxtdJzTHzxagsr0Wj5EPeh7Lm0z
 k8SX7TXyBzpDC7uSaga19Xjjd0x9ODaw2NK3VbnN+XQW0f8gtjUmzDCXXo87SXJTHOlDDv7LHBc
 9x8aDa5+zUEaf+lYgZA==
X-Proofpoint-GUID: H4IpcAJ7-sRFcOC-k1yf2upZPRoh5eRU
X-Proofpoint-ORIG-GUID: H4IpcAJ7-sRFcOC-k1yf2upZPRoh5eRU
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af73e8e cx=c_pps
 a=/Z3c8qHbY2P/IDgIPrWVhw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=_Mand1OKYCNjoHo-9yUA:9
 a=CjuIK1q_8ugA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NiBTYWx0ZWRfX1I+f4EoQtWDC
 W4Ikw8TtqtMZ8LYy7a2DYCNpp4K8gobsGd90cqXq6/BvZdm5CieckZBG/ObWB6co4jtv2hfyEVn
 K2QRl/1aKoew7Ok3M9fQV983iNO0XuM=
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 03, 2026 at 09:53:45AM +0000, Lee Jones wrote:
> sdw_get_slave() iterates over bus->slaves and requires bus->bus_lock to
> be held by the caller.  However, sdw_handle_slave_status() and
> sdw_clear_slave_status() drop bus->bus_lock immediately before calling
> sdw_get_slave().  If a concurrent slave teardown unlinks the node via
> list_del_init() and frees the slave while bus->bus_lock is dropped,
> sdw_get_slave() can spin forever on the self-referential list entry or
> dereference freed memory.
> 
> Keep bus->bus_lock held across the sdw_get_slave() lookup in
> sdw_handle_slave_status() and sdw_clear_slave_status().
> 
> Closes: https://sashiko.dev/#/bug/linux-b0e65a93-dfd4-4e3d-a96c-8f13ba0aafd2
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
