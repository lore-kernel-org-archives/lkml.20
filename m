Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329420;
	b=To0ndiUglAxjioLqNuz83e5sdKgc2rDM4gz8scZwRL1h1WunQAPwxMWpxdSpEaQnujO1
	 hWUQRMIy863jSbea7oKse8i1mnWXCdMI7gl/sIMAI8G57y7lsnwrYGPkA/mB+d09NAVZV
	 KUrS8uFV/ouTlDN3TgEPHIg/Z530B9KL6/MP7AgdmJUYvT57qFZQyfyjTN6L9x561xWBn
	 +P4yQuTBRo3scMxTUZ8S1yxx1HLA+/s+vLEFWM+QGa5gBIaZyTVlFCTSGkUI08gHwhhJz
	 iNi1X7miXDAZo+ncZitu6KZsxw5ggEQfkMYvSac1GU9VOPXZEf97Nr6rO0Hua26w+zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=mlnRJaRXSoLd30cTRchD2B41nqwVuf0nz45muPTsY9E=;
	b=5OQskG1tDMTDTxqFmr3M3WVibxhK1PbE+6Mi8UKWPg1HLNjICfKK+POkafK9PiSbq4PS
	 4A6nDmmgJGuiJi7RK4RDKWX3jmKBf28//ae0XUoqbBINfbxLM3Yd4YrMhLLD/pGUF9x6h
	 NyezUvZraTfQFShhwC7QOPwlHXgS01AVqd6oYCUmbehOIoI6t1Caskxo0fJMZ07ckoTUy
	 zaqB9YIDhD8Ux/x+En2/KI5oc+u2Uoxv9jQMjgeL79xzL+s//69/qoPixdrASGzkCMzlI
	 OdmMEyo4LTLEIm3BYNItInhv+T8riJt7Ufn+og2k0LCyS2bzwTB8Y2O7NWND4iejYAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=VNvGqZu5;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=K2nUylOa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A6E606A323;
	Tue, 10 Nov 2026 16:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A6E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=VNvGqZu5;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=K2nUylOa
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAGiYpd1707290;
	Tue, 10 Nov 2026 10:50:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mlnRJaRXSoLd30cTRchD2B41nqwVuf0nz45muPTsY9E=; b=
	VNvGqZu5VdwCAmxSWQ00gIHLngEMbu829P2KB6p+mESvsvvuJD74lXIXwRYq6sWt
	OPRn+VR13skfF9o+T5fAZSKg8fFyLQcp+Idy+Bnd4nqc/Rt9zZ7VjmzLnQ6Ul7lq
	R66Kbv7eQsowmjCD8+VZaAC6dbszJwHeVYYe2IavDey05NDnB7+0kipZgL9Anzjh
	fapZu69IuHmY6FGVIcJj6iKdjA9Y27TBxhQKq1iO4mGlPK/iM7V6Qg+7cSJWPgqi
	HYoggiXStw/JT57ulNUKn7xdNXK9QDwOF2Kojn5jSA1UKAzY8aYW3W4EE1Ie4U5R
	zuX6ZfGuKUt4jU58lITZ1w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021107.outbound.protection.outlook.com [40.107.208.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ht19pcaj4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 10:50:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2fQUzjBOgnnDVAd2oemLnDdahTLHOU4TNzk8q+jh2qgV2OT/wDbj7MNn2Pu7pAPvsNufyHySlBR6YVIJJpkCL8bCJDAHhT5KUwix2zWntUU2+C30E//Var0R/aT2aLBOQVt+875DOS0pMbEKWwG0r2vj/SyzIGqKPADsxs4r87LJgdQnCnQIV3fisJGhURrFCnK3gRF+QDOj7TPVK/cKKZANmIor8SXFA9lqBzi7LPyCFY/8KYGXnmbNygo7VQ7g1pydjycBpviu8eznOUkui2OwQYYipqipyCuFaqlf312fjGk4rapHCH3dhMth4khRBJoEzPRVhCTiEOwn1Vwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlnRJaRXSoLd30cTRchD2B41nqwVuf0nz45muPTsY9E=;
 b=i6JmaiTj1ez2Co1NrVb69O8pGP0AkXDjq6o7O2+FyEJ5rRZuj16IUqy+mXLRN5qhw6r+FhczJaZnPIFr8LTiaUq6kaZJbV9/ICBuLtUhVvMzGY40f7HTmTxvY6Xr24HtIq8Y3RUJ2MHgL6tS0ozg7xib2FIOGiojaqo2MoIeYxV29FI/urdvpT+f6y6Ig9HnYNgYiJbO+Z2/69U/ZNRP2I/IBIHxh11dSkINyPiUopX9I7+pkAyZnlDOCmAT41SWJ0jWZ7yngsEr5Y9HIFMmcCLQMSjYpa0Q35evnRDzpnci71HjyYYvSqeZcJvm8H4Q+pWcTTCLM4nvl5ubDvhIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlnRJaRXSoLd30cTRchD2B41nqwVuf0nz45muPTsY9E=;
 b=K2nUylOarSwyW0ib7HG94bJQWouOeQQ2FiNGd3UZA/eNudR6dH4mLbuKJq+Kn3kYpkfgoLs0S6emPUWUaVqRR7nbHZU93lRR9IlL9c4UpponB2FLFqYGaWhhc/hGVm7Yc0pIH8wEjcAx28puond2BVNGLwmD4NwPrsWnTNNmHdE=
Received: from PH7PR10CA0022.namprd10.prod.outlook.com (2603:10b6:510:23d::6)
 by DM4PR19MB5689.namprd19.prod.outlook.com (2603:10b6:8:5c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 16:48:09 +0000
Received: from PH2PEPF00048918.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::9a) by PH7PR10CA0022.outlook.office365.com
 (2603:10b6:510:23d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 16:48:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH2PEPF00048918.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 16:48:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BF02E406566;
	Tue, 10 Nov 2026 16:48:07 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 99ECF822561;
	Tue, 10 Nov 2026 16:48:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: cs35l56: Add KUnit tests for FEID and FEV firmware names
Date: Tue, 10 Nov 2026 16:48:07 +0000
Message-ID: <20261110164807.1671681-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110164807.1671681-1-rf@opensource.cirrus.com>
References: <20261110164807.1671681-1-rf@opensource.cirrus.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048918:EE_|DM4PR19MB5689:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ac32015a-2452-4e0c-e399-08df3f4a66ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|261009223027099003|11063799006|261022075727099003|261021121427099003|261022105027099003|261021123027099003|261026140227099003|56012099006|261028144727099003|261026121527099003|261102123227099003|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	e7SiqmTQyFiPD9Wd5+8Xagf/lO21T0LuY58anhsW/cgJBPmqg0Yeap2qPWu0ZqtCQ58gv2RX+u/w55ZQ1sNJ69Mo5peSHImGTvxZDJVm+ylyu0vC3MOH2uxzrXQb0UqqodXnaHyF88sfh8vZJtf3PRbH2NDMViRuUBhXQ8CKVIBTlhy7C8+Y3bYtymO1Pa3vQmo/zCcDkvMGzeB+IkfPgaLkBeoC7mrfE+/MkgU02Zu9ToidNksuqttFMyNkpeVYwYgeDPiuSM7DTCO9eYJVpj2/GD7jllFgto/jiXXK5EBvnJjWGTiDnLpcJRgaS2fNzoUVs5dTVfiCnXc/xm6wGyFIbIPWobcz8ZZlaUpoq0NkeE83bYwZVoPiDbmH5j+0wvxZ6UVCyy4YjnMlXcSVMoyxzbO9cuIYuPPr0hbiCK5uLUV3dD9HuuB7UWUE0UCd/mXvYbBYMxFu2QcOkKSCo7GpcjVKpl+jfYKHRvnkQaxYp47e6wH36uPtgG5bgSLopcftyAgLRx07cSgZxzpytBaKRvgOGyFX2ykcPS4HWvnxks7XNBYyg9iS0LLMOJ+0ToZtwOJD7d8s1jqBSb2DYDGD4ytiuSclj6SOH7vG0Nmnxgxkdf2FAtWygVQ3UvT/l3TdvYUbu5p9RXsoSn70pv0567xJTlfJuPdlCZcUivnb6kLcAiGyeOc2PBS7pwf51JECpeKi3TeA4HzSPgIYnw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(261009223027099003)(11063799006)(261022075727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261026140227099003)(56012099006)(261028144727099003)(261026121527099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SBwjSbAfmmJxti/JRvx0ZCZPKuATRb7WDBGEKeCXlTwQKtIEoQi3+XLZYLlWhJaF0oFve0RlhFfK5XEcvQw0t96Jjor1/vpyDD0b0y0ctUXnIh4Zlcqp+oQgOOTuHMh0FPWNE1knYx1doHkTmW75CBWCiUclwuXpp4myLgoHz/J/BisTA2LVkdgCnfY+ABYw4R+lptmOsv9Cv0t5Penb7lQbCiD7Z/1XVr1Xq4PLUS1JQoBF9QXDHTxxlFjkr2Nc6jGh9jP4UqR9bfGKauEe/dRmKmWKRV6DNDZLq+y54ktgLtnivTc2lEw/IG3dK3ykd/G0FlUtwGKX4rrbHSD8MPbws5kPCakLdUISvLYUdBFLNbznbikmWlMMLvZGgFiCHROdQRm9VeJTIT6DKEbabBW2aGRYZVVGLkvphK4Syuex8rjXYyH78M8chJb7ijX4
X-Exchange-RoutingPolicyChecked:
	xRMTyfMwXnnBpUrHqPyiZiFz289WlEoHDoONaHvEDCGiZ6WoEOYN8XrTT0DhdDXmCsHLEphpWn66qMcWNMASJjWwkWw1LGhLE69kpO9tuz+9csIpuCSxiKy6H8yaD4st6VJY+axy/SVvGS6CMIqrVQylo/4Cp10Bcnn6lmC3GzkT9AsH4Id0za+4f6RoZUkaQ3EOfZFCwTydCj/EVO2cbRysnGn8tYnkpjEerDTgGIjTmN84cBfVFKk6WWkbS9809owBxFlQJyRliSWPQ0evlIU5Lu+Nyt9q2VStiasQs5z+4lPQmBZY7zQz/5bPrGbmhT1Aep8wtWUjtsHIsLtClg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:48:08.9528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac32015a-2452-4e0c-e399-08df3f4a66ab
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH2PEPF00048918.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5689
X-Proofpoint-GUID: _vBC9xa5xmcnGvFnxr0wGr7PviAQ_bZI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX/cTrU45MpFXE
 EkSUx53rCz72rfdGzcQYlEs3/Iay98F1rXfAzSwJhntNtwRSqeXJ1n9mJo2FH25vMrbEudmxNBK
 zK36/xtsSpJR8mngxsElspqRi85Hdb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX3OdYZ70Hc2An
 0dxiwpE+L2bqxlE8XxDBCiDNlH0depc0SgWXB1+8yFhhvmzBF/Vfcw4o0uR1wv3RY2GWrO+825Y
 QC7LFDPk6ghSbYZUfXBTuTD1ZBHfk4d/tU5r4JzXef+QH65dfdPRnHJqQ/jn4sGcenFnUwngr12
 i1GXqEC+rrj6soDPnakUOyQVsxEJoNiEabZP8HMjBS6g3KyM51tEK/bQ/VWy5ZtyULFwOCVjfbO
 SNXuYG2ZOMfKMwCan3tseUe15w5jRK51S69SVUo2DGPgX11+E5K66tz6dNuxpn1MJPW+raQjOf/
 5OHhs/jfMrdMZt/1Wmn2b69dqjm8opTdfj4AFm2AYQAEHI5ZQUmgNgDIsciGEKKYCavrE3ex/N5
 CBr3qrU3Cf0UMHytKqyXRe2UDNEtB8qThzC4G+Etc17v3AjEjTSCxBjuWyi6GytzDKMSqf3hkZM
 uvTGQMWY1jFWuz+nNSw==
X-Proofpoint-ORIG-GUID: _vBC9xa5xmcnGvFnxr0wGr7PviAQ_bZI
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6af34b44 cx=c_pps
 a=WvTO7h1a7pp8pZEQxufCPQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=8TZbiYBKsE-Jt2ni3DkA:9
X-Proofpoint-Spam-Reason: safe

Add parameterized tests for firmware system names qualified by Disco
FunctionExtensionId (FEID) and FunctionExtensionVersion (FEV). As these
are Disco values they only need to be tested for SoundWire.

Expected behaviour is:

FEID == 0
  Previous behaviour unchanged. If SSID is present it is included in
  system_name, else system_name is NULL. Value of FEV is ignored.

FEID > 1 and < 0x8000
  SSID is mandatory. SSID, FEID and FEV are included in system name in
  the format fFvV where F is FEID in hex and V is FEV in hex.

FEID >= 0x8000
  SSID is ignored. FEID and FEV are included in system name in the
  format fFvV where F is FEID in hex and V is FEV in hex.

In all cases speaker ID is appended to system name if a speaker ID value
is available.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-test.c | 229 +++++++++++++++++++++++++++++++-
 1 file changed, 225 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index 124fe5e75500..b58df099bf72 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2026 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <kunit/fwnode.h>
 #include <kunit/resource.h>
 #include <kunit/test.h>
 #include <kunit/static_stub.h>
@@ -20,6 +21,7 @@
 #include <linux/soundwire/sdw.h>
 #include <sound/cs35l56.h>
 #include <sound/cs-amp-lib.h>
+#include <sound/sdca_function.h>
 #include "cs35l56.h"
 
 KUNIT_DEFINE_ACTION_WRAPPER(faux_device_destroy_wrapper, faux_device_destroy,
@@ -51,6 +53,16 @@ struct cs35l56_test_param {
 	u8 type;
 	u8 rev;
 
+	u16 feid;
+	u8 fev;
+	u32 function_type;
+	bool omit_feid;
+	bool omit_fev;
+	bool has_ssid;
+	int speaker_id;
+	const char *system_name;
+	int ret;
+
 	s32 spkid_gpios[4];
 	s32 spkid_pulls[4];
 };
@@ -100,6 +112,24 @@ static void cs35l56_test_system_name_from_ssid_and_spkid(struct kunit *test)
 	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.system_name, "12b4a7c8-spkid1");
 }
 
+static void cs35l56_test_system_name_with_feid_fev(struct kunit *test)
+{
+	const struct cs35l56_test_param *param = test->param_value;
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	cs35l56->speaker_id = param->speaker_id;
+	if (param->has_ssid)
+		snd_soc_card_set_pci_ssid(cs35l56->component->card, 0x12b4, 0xa7c8);
+
+	KUNIT_EXPECT_EQ(test, cs35l56_get_firmware_uid(cs35l56), 0);
+	KUNIT_EXPECT_EQ(test, cs35l56_set_fw_name(cs35l56->component), param->ret);
+	if (param->system_name)
+		KUNIT_EXPECT_STREQ(test, cs35l56->dsp.system_name, param->system_name);
+	else
+		KUNIT_EXPECT_NULL(test, cs35l56->dsp.system_name);
+}
+
 static void cs35l56_test_system_name_from_property(struct kunit *test)
 {
 	struct cs35l56_test_priv *priv = test->priv;
@@ -442,6 +472,68 @@ static void cs35l56_test_parse_xu_onchip_spkid(struct kunit *test)
 	}
 }
 
+static void cs35l56_test_parse_disco_feid_fev(struct kunit *test)
+{
+	static const char * const control_names[] = {
+		"mipi-sdca-control-0x5-subproperties",
+		"mipi-sdca-control-0x9-subproperties",
+		"mipi-sdca-control-0xA-subproperties",
+	};
+	const struct cs35l56_test_param *param = test->param_value;
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+	struct {
+		struct software_node nodes[ARRAY_SIZE(control_names)];
+		struct property_entry props[ARRAY_SIZE(control_names)][2];
+	} *disco;
+	int ret;
+
+	disco = kunit_kzalloc(test, sizeof(*disco), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, disco);
+
+	disco->props[0][0] = PROPERTY_ENTRY_U32("mipi-sdca-control-dc-value",
+						param->function_type);
+	disco->props[1][0] = PROPERTY_ENTRY_U16("mipi-sdca-control-dc-value", param->feid);
+	disco->props[2][0] = PROPERTY_ENTRY_U8("mipi-sdca-control-dc-value", param->fev);
+	ret = kunit_software_node_register_node_group(test,
+						      cs35l56_test_dev_and_af01_node_group);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	disco->nodes[0] = SOFTWARE_NODE(control_names[0], disco->props[0],
+					&cs35l56_test_af01_sw_node);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
+				     kunit_software_node_register(test, &disco->nodes[0]));
+
+	if (!param->omit_feid) {
+		disco->nodes[1] = SOFTWARE_NODE(control_names[1], disco->props[1],
+						&cs35l56_test_af01_sw_node);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
+					     kunit_software_node_register(test, &disco->nodes[1]));
+	}
+
+	if (!param->omit_fev) {
+		disco->nodes[2] = SOFTWARE_NODE(control_names[2], disco->props[2],
+						&cs35l56_test_af01_sw_node);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
+					     kunit_software_node_register(test, &disco->nodes[2]));
+	}
+
+	KUNIT_ASSERT_EQ(test,
+			kunit_device_add_software_node(test, cs35l56->base.dev,
+						       &cs35l56_test_dev_sw_node),
+			0);
+
+	cs35l56->feid = 0;
+	cs35l56->fev = 0;
+
+	KUNIT_EXPECT_EQ(test, cs35l56_process_xu_properties(cs35l56), 0);
+
+	KUNIT_EXPECT_EQ(test, cs35l56->feid,
+			param->function_type == SDCA_FUNCTION_TYPE_SMART_AMP ? param->feid : 0);
+	KUNIT_EXPECT_EQ(test, cs35l56->fev,
+			param->function_type == SDCA_FUNCTION_TYPE_SMART_AMP ? param->fev : 0);
+}
+
 static int cs35l56_test_dummy_read_onchip_spkid(struct cs35l56_base *cs35l56_base)
 {
 	struct kunit *test = kunit_get_current_test();
@@ -559,6 +651,8 @@ static int cs35l56_test_case_init_common(struct kunit *test)
 	if (param) {
 		cs35l56->base.type = param->type;
 		cs35l56->base.rev = param->rev;
+		cs35l56->feid = param->feid;
+		cs35l56->fev = param->fev;
 	}
 
 	return 0;
@@ -587,6 +681,125 @@ static int cs35l56_test_case_init_soundwire(struct kunit *test)
 	return 0;
 }
 
+static void cs35l56_test_system_name_param_desc(const struct cs35l56_test_param *param,
+						char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "feid: %04x fev: %02x ssid: %d spkid: %d",
+		 param->feid, param->fev, param->has_ssid, param->speaker_id);
+}
+
+static const struct cs35l56_test_param cs35l56_test_system_name_feid_fev_cases[] = {
+	/* FEID == 0 retains legacy naming and ignores FEV */
+	{ .feid = 0, .fev = 0, .speaker_id = -1, },
+	{ .feid = 0, .fev = 0, .speaker_id = 1, },
+	{ .feid = 0, .fev = 0xff, .has_ssid = true, .speaker_id = -1,
+	  .system_name = "12b4a7c8", },
+	{ .feid = 0, .fev = 0xff, .has_ssid = true, .speaker_id = 1,
+	  .system_name = "12b4a7c8-spkid1", },
+	{ .feid = 0, .fev = 0xff, .speaker_id = -1, },
+	{ .feid = 0, .fev = 0xff, .speaker_id = 1, },
+
+	/* Nonzero FEID < 0x8000 includes SSID and FEV */
+	{ .feid = 1, .fev = 0, .has_ssid = true, .speaker_id = -1,
+	  .system_name = "12b4a7c8-f1v0", },
+	{ .feid = 1, .fev = 0, .has_ssid = true, .speaker_id = 1,
+	  .system_name = "12b4a7c8-f1v0-spkid1", },
+	{ .feid = 0x1234, .fev = 0xab, .has_ssid = true, .speaker_id = -1,
+	  .system_name = "12b4a7c8-f1234vab", },
+	{ .feid = 0x1234, .fev = 0xab, .has_ssid = true, .speaker_id = 1,
+	  .system_name = "12b4a7c8-f1234vab-spkid1", },
+	{ .feid = 0x7fff, .fev = 0xff, .has_ssid = true, .speaker_id = -1,
+	  .system_name = "12b4a7c8-f7fffvff", },
+	{ .feid = 0x7fff, .fev = 0xff, .has_ssid = true, .speaker_id = 1,
+	  .system_name = "12b4a7c8-f7fffvff-spkid1", },
+
+	/* Nonzero FEID < 0x8000 missing SSID should not return error (fallback is allowed) */
+	{ .feid = 1, .fev = 0, .speaker_id = -1, .ret = 0, },
+	{ .feid = 1, .fev = 0, .speaker_id = 1, .ret = 0, },
+	{ .feid = 0x1234, .fev = 0xab, .speaker_id = -1, .ret = 0, },
+	{ .feid = 0x1234, .fev = 0xab, .speaker_id = 1, .ret = 0, },
+	{ .feid = 0x7fff, .fev = 0xff, .speaker_id = -1, .ret = 0, },
+	{ .feid = 0x7fff, .fev = 0xff, .speaker_id = 1, .ret = 0, },
+
+	/* FEID >= 0x8000 does not use an SSID */
+	{ .feid = 0x8000, .fev = 0, .speaker_id = -1,
+	  .system_name = "f8000v0", },
+	{ .feid = 0x8000, .fev = 0, .speaker_id = 1,
+	  .system_name = "f8000v0-spkid1", },
+	{ .feid = 0x8000, .fev = 0, .has_ssid = true, .speaker_id = -1,
+	  .system_name = "f8000v0", },
+	{ .feid = 0x8000, .fev = 0, .has_ssid = true, .speaker_id = 1,
+	  .system_name = "f8000v0-spkid1", },
+	{ .feid = 0xabcd, .fev = 0xab, .speaker_id = -1,
+	  .system_name = "fabcdvab", },
+	{ .feid = 0xabcd, .fev = 0xab, .speaker_id = 1,
+	  .system_name = "fabcdvab-spkid1", },
+	{ .feid = 0xabcd, .fev = 0xab, .has_ssid = true, .speaker_id = -1,
+	  .system_name = "fabcdvab", },
+	{ .feid = 0xabcd, .fev = 0xab, .has_ssid = true, .speaker_id = 1,
+	  .system_name = "fabcdvab-spkid1", },
+	{ .feid = 0xffff, .fev = 0xff, .speaker_id = -1,
+	  .system_name = "fffffvff", },
+	{ .feid = 0xffff, .fev = 0xff, .speaker_id = 1,
+	  .system_name = "fffffvff-spkid1", },
+	{ .feid = 0xffff, .fev = 0xff, .has_ssid = true, .speaker_id = -1,
+	  .system_name = "fffffvff", },
+	{ .feid = 0xffff, .fev = 0xff, .has_ssid = true, .speaker_id = 1,
+	  .system_name = "fffffvff-spkid1", },
+};
+KUNIT_ARRAY_PARAM(cs35l56_test_system_name_feid_fev,
+		  cs35l56_test_system_name_feid_fev_cases,
+		  cs35l56_test_system_name_param_desc);
+
+static void cs35l56_test_feid_fev_param_desc(const struct cs35l56_test_param *param,
+					     char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "feid: %04x fev: %02x",
+		 param->feid, param->fev);
+}
+
+static const struct cs35l56_test_param cs35l56_test_property_feid_fev_cases[] = {
+	{ .feid = 0, .fev = 0, },
+	{ .feid = 0, .fev = 0xff, },
+	{ .feid = 1, .fev = 0, },
+	{ .feid = 0x7fff, .fev = 0xff, },
+	{ .feid = 0x8000, .fev = 0, },
+	{ .feid = 0xffff, .fev = 0xff, },
+};
+KUNIT_ARRAY_PARAM(cs35l56_test_property_feid_fev,
+		  cs35l56_test_property_feid_fev_cases,
+		  cs35l56_test_feid_fev_param_desc);
+
+static void cs35l56_test_disco_feid_fev_param_desc(const struct cs35l56_test_param *param,
+						   char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "function_type: %#x feid: %#x%s fev: %#x%s",
+		 param->function_type, param->feid, param->omit_feid ? "(omitted)" : "",
+		 param->fev, param->omit_fev ? "(omitted)" : "");
+}
+
+static const struct cs35l56_test_param cs35l56_test_disco_feid_fev_cases[] = {
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_AMP, .feid = 0, .fev = 0, },
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_AMP, .feid = 0, .fev = 0xff, },
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_AMP, .feid = 1, .fev = 0, },
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_AMP, .feid = 0x1234, .fev = 0xab, },
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_AMP, .feid = 0x7fff, .fev = 0xff, },
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_AMP, .feid = 0x8000, .fev = 0, },
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_AMP, .feid = 0xffff, .fev = 0xff, },
+
+	/* Either or both can be absent*/
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_AMP, .omit_feid = true, .fev = 0xab, },
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_AMP, .feid = 0x1234, .omit_fev = true, },
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_AMP, .omit_feid = true, .omit_fev = true, },
+
+	/* Other types of node are ignored */
+	{ .function_type = SDCA_FUNCTION_TYPE_SMART_MIC, .feid = 0xffff, .fev = 0xff, },
+};
+
+KUNIT_ARRAY_PARAM(cs35l56_test_disco_feid_fev,
+		  cs35l56_test_disco_feid_fev_cases,
+		  cs35l56_test_disco_feid_fev_param_desc);
+
 static void cs35l56_test_gpio_param_desc(const struct cs35l56_test_param *param, char *desc)
 {
 	DECLARE_SEQ_BUF(gpios, 1 + (2 * ARRAY_SIZE(param->spkid_gpios)));
@@ -669,8 +882,12 @@ KUNIT_ARRAY_PARAM(cs35l56_test_type_rev_all, cs35l56_test_type_rev_all_param_cas
 static struct kunit_case cs35l56_test_cases_soundwire[] = {
 	KUNIT_CASE(cs35l56_test_system_name_from_ssid),
 	KUNIT_CASE(cs35l56_test_system_name_from_ssid_and_spkid),
-	KUNIT_CASE(cs35l56_test_system_name_from_property),
-	KUNIT_CASE(cs35l56_test_system_name_from_property_and_spkid),
+	KUNIT_CASE_PARAM(cs35l56_test_system_name_with_feid_fev,
+			 cs35l56_test_system_name_feid_fev_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_test_system_name_from_property,
+			 cs35l56_test_property_feid_fev_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_test_system_name_from_property_and_spkid,
+			 cs35l56_test_property_feid_fev_gen_params),
 	KUNIT_CASE(cs35l56_test_l56_b0_suffix_sdw),
 	KUNIT_CASE_PARAM(cs35l56_test_suffix_sdw, cs35l56_test_type_rev_ex_b0_gen_params),
 	KUNIT_CASE_PARAM(cs35l56_test_ssidexv2_suffix_sdw,
@@ -679,6 +896,8 @@ static struct kunit_case cs35l56_test_cases_soundwire[] = {
 
 	KUNIT_CASE_PARAM(cs35l56_test_parse_xu_onchip_spkid,
 			 cs35l56_test_onchip_spkid_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_test_parse_disco_feid_fev,
+			 cs35l56_test_disco_feid_fev_gen_params),
 
 	KUNIT_CASE(cs35l56_test_set_fw_name_reads_onchip_spkid),
 	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_with_onchip_gpios),
@@ -690,8 +909,10 @@ static struct kunit_case cs35l56_test_cases_soundwire[] = {
 static struct kunit_case cs35l56_test_cases_not_soundwire[] = {
 	KUNIT_CASE(cs35l56_test_system_name_from_ssid),
 	KUNIT_CASE(cs35l56_test_system_name_from_ssid_and_spkid),
-	KUNIT_CASE(cs35l56_test_system_name_from_property),
-	KUNIT_CASE(cs35l56_test_system_name_from_property_and_spkid),
+	KUNIT_CASE_PARAM(cs35l56_test_system_name_from_property,
+			 cs35l56_test_property_feid_fev_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_test_system_name_from_property_and_spkid,
+			 cs35l56_test_property_feid_fev_gen_params),
 	KUNIT_CASE_PARAM(cs35l56_test_suffix_i2cspi, cs35l56_test_type_rev_all_gen_params),
 	KUNIT_CASE_PARAM(cs35l56_test_ssidexv2_suffix_i2cspi,
 			 cs35l56_test_type_rev_all_gen_params),
-- 
2.47.3

