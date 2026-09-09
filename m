Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA54237D10A;
	Wed,  9 Sep 2026 05:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788931746; cv=fail; b=BGW4Cdd1g0wvL3g5SJvaFgIy/NSn/Qu/GageNLIJucggEb0NaTjz843dNG5cToL8c7ca6siQ6sZ0tT6pqb/vmYMKktG0T1S2Alwym+e6da0sHfRgN+AfOlo5MajBIOkpNX3Ly/fOWGj7fdP00PNXof+GbQ5bjwpZ6AJzBiZmYGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788931746; c=relaxed/simple;
	bh=veE0kTznoNmtQ3opVe0saSsdqyayoPBx0iauJqYlbfs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c2h8FPkPdUn3zklFcN6+ZqQNDbx3ur4MVVwtef85q4CBagSZtnsG+/qShphgAwvjXI3jIjZPVcInSTU4HsZaR+4Vl1PBCSrLNxx/k9mCVNylmOGEBHtewmkk9kS08cD4gPL9xEwi2WmAzVEqaMy90CqLLHxp0mrgQLq+m4gGdkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=J3LY9okp; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xJO9Xxar; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="J3LY9okp";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xJO9Xxar"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6895S0RZ2899450;
	Wed, 9 Sep 2026 00:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=veE0kTznoNmtQ3opVe0saSsdqyayoPBx0iauJqYlb
	fs=; b=J3LY9okpsniJfsCwe234I/DZBOmWxb2KGLf5mVuCqlZadlZDVzm0YpQcO
	sq9vlAWeX5CKXFJm0eGC6NiN5mAoU4UU27FlWxXrHLUu2pLcaMRKdK9VpOVL3ol4
	4SdK2DqyWvfUt4d8tiPoAVHXZhJ3soJxyqzxTpiHvEnfpJWBOpOH/auHSKWG5NG+
	u6B89gMXkBL6E5b6o3R6ktWufAgDzx5iCqZoXV1aHkjSWASgDM0wUON6hjMk6t0b
	inSyaDCmEOAgpEpXMYq0EBjf3bYn4rfC8SCTc5OMjC2Xw5fexqCgeol5lcAkZmEQ
	iuVvdqqOm/t3oMhx3bxboo8x84lLg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gjt0ktdqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 00:28:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bekCDcUQzxfx82Hu+k7fQubjAJkDlnlXcpvIBhej7nWs+44DXLPlNmmkj7k3pFPzsS8vTs6e0BaeLjgotG8xw9rrYx+VKOcTEFAzyaJO+Cwu1shOrsGx+/DyFk+vPnGfWhLJVW95XU1+FJAXz0u5Vlzb0xE+h4b4yctllV/lZ8TAkNuPxs0iVscdCHV/Ljm9MbeXLvJkNkeULucZn5NbTzmbJB51MSD4ZmAGpU90JNquyS32AxKl3bpmnEqwweU6LWIs6pCJ8tF4nKrVvH8WMOgJ7bWZ93rfWPZmNzdPHCarRxf6oyWx7txb6/okrzI/2AnvETuTWLzhxkj4sTjsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veE0kTznoNmtQ3opVe0saSsdqyayoPBx0iauJqYlbfs=;
 b=Qw6E8my9j307q/6EnMnbPY3ThIO7E4/Wxym7pgHE0wv4NlWc6eodWMvRSKKerOTVkTO+ZFUl9Yr+P5WAFzUq/Scx/MC2+ck8wkUezmhfWJkl85lnKRE3gBw0w1Ig/z0aS6dBctfScWzevrfqhX0F6QP9q6IXRj2uwNu6QeWAFbmtj/4VthNAkWF2/eglywVcZWo6hgRDd+w0C+bcUisQnb24eYyHiTxmdD3x3HE62DHm6ftMEaUmQ2wdov9A+tdcAQHM3FsMm5+N+JHRrsFOToCGAmZcgmJFHIf9YvjVZx1xuq9rnpetd3LCDcbkQ6M+HyursvmHWWDOhgCr+KtEtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veE0kTznoNmtQ3opVe0saSsdqyayoPBx0iauJqYlbfs=;
 b=xJO9XxarPaX/HBbB575rPmLq8b8P+nQYAWAwSZhtLo8ArIugO1OMAhjTAvWm7N8Ngt7+wKkRfUpzvASCkA0zYvtE2njinx0wv/7jL1Q4s7x3P6D0MYb7pb1wbAQH/5oBSTJHMAYW+Y3CebjAB83jgVlLgbuCmGUDqQRrnmfaXj8=
Received: from CH2PR18CA0054.namprd18.prod.outlook.com (2603:10b6:610:55::34)
 by BLAPR10MB4851.namprd10.prod.outlook.com (2603:10b6:208:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 9 Sep
 2026 05:28:36 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::b) by CH2PR18CA0054.outlook.office365.com
 (2603:10b6:610:55::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 05:28:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 05:28:34 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 00:28:21 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 00:28:21 -0500
Received: from DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf]) by
 DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf%14]) with mapi id
 15.02.2562.045; Wed, 9 Sep 2026 00:28:21 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "ckeepax@opensource.cirrus.com"
	<ckeepax@opensource.cirrus.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
        "Xu, Baojun"
	<baojun.xu@ti.com>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "Kasargod,
 Sandeep" <sandeepk@ti.com>,
        "Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: RE: [PATCH v1 1/2] ASoC: tac5xx2-sdw: add tac5272 support
Thread-Topic: [PATCH v1 1/2] ASoC: tac5xx2-sdw: add tac5272 support
Thread-Index: AQHdQBwG35/7YNdoCk2wQkbfiGuwmw==
Date: Wed, 9 Sep 2026 05:28:21 +0000
Message-ID: <67099caee8984e4fa28c7fc4b5e717d9@ti.com>
References: <20260908032757.389-1-niranjan.hy@ti.com>
 <136b37a6-05ff-4ea1-8715-211a64040433@linux.dev>
In-Reply-To: <136b37a6-05ff-4ea1-8715-211a64040433@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|BLAPR10MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cce90b8-60f1-4990-fcb0-08df0e3331b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|1800799024|376014|10067099003|22082099003|4143699003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	vCkQL+neIbe4IIcW49vLYuJr2YeDkbsHvvUATLtDqPyiiSMmWAWyry0+9g9Pwdrj03DXyD5sJqDTvBqfRhK0eBLxM/Iso0QzMIL0GeWVqXeorAVs1gT9fhJTPrYDjSgyeLkaARPyjQX7jm7F1XjRtnPOIqfAh2LD59ccWt5ckLd5WnelWtgSKahhZmrGqldj6FJfv5NIwbEDgVQxOaezieIcAwoZpkpu3qDyogsQ0vgCrBaPgVZdYRdxtswhaGa52UHTF00US0ArOMpjoThj2/Fz09dDwXy3g18bbw0cekqgHEXLtAxwjGyJzW3lm1C746EnMEeuy2NCDalcOQj00cdfRPASj2/uCbfxBW4nct13Plrj1KZJg8x7TKe8DwI6nzg7qYag4LmKc3/2OQ5x2X1zrG4kTCi7975ZlZNpkH7LW6sI9Evp55t193Nk95/Cj3DDYr14Y4qQ/Z1UGKveAEfe2lUY+OQ6tsEV0cD8QxlVXt6Q4HeVB3QifHlMyMe93/8iv9O6wsL+ajVT2MZQdTSkFS9ZUs7st2JAiNK/1GKjP5FauFfL2BoMUYHFheN4oNsD7GgByvl4gzt/ZacsRLF4O+lI1LZtYrfYxvIYX8dmUrLLh1JUyxcbwNmIxamz+w0H/wrCuebG5JvHH0lAbAouiuD7tvO0hTs+V0jW6KSxGOUA01vCAx2Z9t7JbqYI1mKwIf0AY63txW6jwM7Tkg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(1800799024)(376014)(10067099003)(22082099003)(4143699003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	95llkYi7yG4sr6WSoPumPsTYMHzV87i1valfQQorLQyAKt+BhvxFx1AGOwTHwZrTYNbUiuvgoNl9ZIogc6x2J8/qFdFVmhoPHUz8J9lKpPPy0uRoph5ATE6kMO2/mSiE7BiiyjFLiyMt8Oxln7eDBLNAZlXRveIFIiJe3sVwwXQ54TiYShAVt87PihJQMhxnhfr2kioKFS3j16Kp1YOZHDiksdYJ/G1r8a1+cxWXygyd3VfvZaqeNM7sLQQXTduSo/1rvqHZdDW6vHT8hlm0WA7EowZYl/Vpv/C4830zBgaTNIsWPjYvDgw80pLP+6ENDl1wuOo/fjW7lhoIoD8X3WQa8lLKfKqes4Pfu/L95lI/KmfWgRZ1F2wAeAjkmqTgma2U/z13h+CAG/urRxng5qGYCiR3jUdsB5r5cpMovkw83IDnFISQlBIy2qK0XgNW
X-Exchange-RoutingPolicyChecked:
	ZcqAoyYWTtlmxTq13Hu/zwj49BcUbQHkbVquXNQ6rIKj5ZfuhqxbHh6A5MwWspB6u85cgqpktzLLD4/pYrIVzi7K4jj17LzV1CHb6VhwG8z3hTeKi0uqt4epxuiSC+4L+/Wh+Wp+W0YE4IJJoIHhxVytN8SpHAbJHBoz7gZvXkDDmW2vFMPsqH5SayXqtDoXCICOQlSZ2iAa9SMHDf4WWsNENWZeciKvEFElz4XpikgyhwqM8P2foOvwRuBb/SkXPIdN5H6vslzS9YUTnUNfXVsgWak9B4/OEE+2w2HQGnSu3pwCXLT1+gJbWHTFGvsOjziv51UTESDTJ0BCT0QVtQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 05:28:34.9112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cce90b8-60f1-4990-fcb0-08df0e3331b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4851
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA1OSBTYWx0ZWRfX7IXVasXGlgq9
 +Rx5G4yuDPb+a1R4pdnEJA9XxdsjGzZpfM7w5iQWtsAuzbcjzAt2qzw/fQM58BeRuqGFANpy5xP
 vlWhgjHplbrKhHKzJ2sl1UOJDUq2c6lzfJwoBbmDyeGderQihgN7Wk/YKIFOSuIdfNSI2ka90X4
 BGHSJnCGDjGjqdlPpccfCpojHdrMlWWS3dF+b5S12SznW20cVjfD6wKlPFo0TxMrYCvQkjGQxM9
 Nt38tl8CothpEenpu9jF173+0EXeZzSkbteFpsLYDAEPv2hmytLyO4Ss4Rw6tUA2/Mmc1RIyVF2
 fzHqGxgux0cXr+eUYWt1dt3syca8NRP2o0DaZnaTF+x9C4ycniORD++KE4DX9q0MC1dzcZUh0Tu
 lpD6tEAXm+6rd7rMStn72QuHyW1z19v+cehUGcL9CLHDIHeCH+HyLbBuofLvGJTBat+TCjtBV2z
 AVIOIGr6wxFeaNfdBzA==
X-Authority-Analysis: v=2.4 cv=ReagzVtv c=1 sm=1 tr=0 ts=6aa0ee87 cx=c_pps
 a=OGRNNHJcR/XwrOfql3gobQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=Nv4s2AKUbUkA:10
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8 a=6Ajdf0g6AEvIocOJlHEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pR6K004vAy_jDOgo9oitHlJb2IjCeUU0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA1OSBTYWx0ZWRfX3U77I06gnDCJ
 vD46GpKqIp8rjB1rF9aZlLI+9e3XsL9TihllqSymauvItWg/T863akGH5VEIWcvjjZkr9YVJlTv
 h76iLoQh4xn90QEXzYo4+uk+y65kJrw=
X-Proofpoint-ORIG-GUID: pR6K004vAy_jDOgo9oitHlJb2IjCeUU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090059

PiBPbiAxMzozMi0yMDI2MDkwOCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjEgMS8yXSBBU29DOiB0YWM1eHgyLXNkdzogYWRkIHRhYzUyNzIgc3Vw
cG9ydA0KPiANCj4gPg0KPiA+ICAgQWRkIHN1cHBvcnQgZm9yIHRhYzUyNzIgd2hpY2ggaXMgYSBV
QUoNCj4gPiBvbmx5IHZhcmlhbnQgd2l0aCBubyBzcGVha2VyIGFuZCBkbWljLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogTmlyYW5qYW4gSCBZIDxuaXJhbmphbi5oeUB0aS5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IEJhcmQgTGlhbyA8eXVuZy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT4NCj4g
DQo+IHRoaXMgbG9va3MgbW9zdGx5IG9rIGF0IGEgaGlnaC1sZXZlbCwgYnV0IHNlZSBiZWxvdyBm
b3IgaW1wcm92ZW1lbnQNCj4gc3VnZ2VzdGlvbnMNCg0KSSB3aWxsIHNlbmQgdjIgaW4gY29taW5n
IHdlZWsuDQoNClJlZ2FyZHMNCk5pcmFuamFuDQoNCg==
