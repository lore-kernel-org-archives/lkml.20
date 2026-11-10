Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794323349;
	b=NDgky0JcZOyG9aaGuDtD+ktke67jZAzBqEaYH+q8kbfNbGXQTbIoajCxBCR+zA63ZXm3
	 RcebTZ7hECp6cwD47MW5oZNp8nT/sz4ZTXF9SQcnPvBwScCfaZXPITq6ZoQVpv7uvjO/D
	 vn58YsFPCoIMhQb0GvoeiQDLcw6AK0m7TfM2iCcXug2AlTCtOPYdrpHBq3+z3RYoUIQwx
	 1PLYbNjxnelg56flSwYw/DoWakvxt50lknjQYQ+zSLN8DHa1S0Ik7DKRsnXiqD8Psais4
	 8qAzkJKIXkMTjpfQlg3ktpyYnwbeQCCDO/AqtHN5iZqT0g4QxPbriiAnLBGD44L5APQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323349;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=yt6t12CeWU0fiDMDLNDwAJYJEBG/N+sjr95ZQLr5iik=;
	b=nJmkzbiD97Z/KkreazEvORFieDOc0w/yLMtTVkhWncFFBL25wiR4RO2K3wFF4xH/bmu6
	 dsHQnM1vrMGm6lL+QaiitG5xJYDxpfqsX78Y7YJ9ptKqB1mZ7OIxNviWooTR3lsWHICxJ
	 cCBUIzoWUMox3erf3HEe2BCsiyUQ51spPaoqGTiVJH4op9XW01thp93dixYjXhOjz/dzb
	 vNr8oOMLq9RZ2C+5TN7xULWPcMomFuy/R85hgsTrVFoEvLerh3sbcO+U8cSKxkXe8oQMS
	 kH/NdKOO4oiLCir/JsdbZTD7jdzhcLcIZmv5laXCsq52W5PEDVZQcU8+gT7KdgJ+7Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=KV3G8xvD;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ofeBGJNe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F64760A2603;
	Tue, 10 Nov 2026 15:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F64760A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=KV3G8xvD;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ofeBGJNe
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Dfk723454;
	Tue, 10 Nov 2026 09:09:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=yt6t12CeWU0fiDMDLN
	DwAJYJEBG/N+sjr95ZQLr5iik=; b=KV3G8xvDwhQt8kQHsyiNsPhwhyfESCpJrQ
	mi1T2IP8gU+SWY62kl7HWV0OME7GOiDUHvMcMBoBhkavE/S5TgjwmYduva6gUMyE
	8uAQOdttUlJpBTKDUC4g8rkjGz/W+DGrXAQafsTgEx3V2V7oF8rjRzooK68pzVyq
	t3bLMlvK+9+2+z7LJFqcUozM71QJjruKmTBfdVubqyj8cUt+BEZ9L9yBjwgAeiTy
	MKoGBvBsFWG2nPr3CixlSEVy4U5I3flc8IE8fs1GwkjWLH7uWp4rwgKGoGxjdr5S
	jlD8RbOqIayA8ACXRX4ajQcUH020mFEjMzfo7HnCp9K8B5zRPLDA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020080.outbound.protection.outlook.com [52.101.85.80])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29hbuf4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 09:09:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tj/ra3EXrn33Ot4GPgt5PY4GcEdY1++C7ADPT5VbVPRBdHkfWWDw/kdo82VQxKEnYxn4nqcqBKfwKwqEUI4g7xgZldBAR9yXJ1eZt+T+ItwrexfnTx090ia3vyFq0a/dtaNPM018LV8tYh5cmLTyd3OGIHxK1VTKBmcEwvnN4I7qWalkLXV00cT1UD7ru4do/rY3r+uvABvAITiwMdtB7msa77nT6MjIFPN1/+aHoZyYgjsxovJlcBWc1+uZXhY0oiOEHQUXYZdNPfmSyThQjNahvyYJxMYXLd4e0U2MmgoaACd4FwepHSAZFVnx+lSbaXfI9tsHEbtEJzYNB9IOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yt6t12CeWU0fiDMDLNDwAJYJEBG/N+sjr95ZQLr5iik=;
 b=zSlYVAxwmwHtv5cP3JmT0kbBlneBt3Bf5W6kZJLUoSYxRu62D5wYF6VJZQKc78JtlxOI1kADzzCRzn10OcbZyX5p2Oe0XqzPSRfoN8Zy13rP8KqW2Mz5KjvVkaj1vL+sn8ciR2uSzA8n2mlZnLCt5damfCxh551szkeah6Y/Gc7NBw7zMQAomJk+SKPkj6f+9wQBYn2TnqgpdDwFWo6pusuQRYA5b65Xdn/HaeHerN8HYUOVhYqJ0QSQfUapJ58eBK9JiZJtYAkAudPrfQl5CYufKbqByxHS7+4UIotfPZCy7jvvJZl/joowiTcGcCcSA/nM6qAVdPd9jO+agJF7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yt6t12CeWU0fiDMDLNDwAJYJEBG/N+sjr95ZQLr5iik=;
 b=ofeBGJNebcRHa28eHd4TnN6iFvdNlcFw9Nbf4XA68m0SIiRDTW6vPJHh3NlU65MB8W1uF+O3NoZbBPujS8JCB8dAWDKSLH0HJYOWvAQY8nQccet6CljX2aR+qN8hLBbr92b8IQdRr9vtfv/rFDKoPuUno7o3lNx7Jv78Celfi+s=
Received: from SJ0PR13CA0173.namprd13.prod.outlook.com (2603:10b6:a03:2c7::28)
 by BY3PR19MB5240.namprd19.prod.outlook.com (2603:10b6:a03:363::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 15:09:02 +0000
Received: from PH7PEPF00000005.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::f) by SJ0PR13CA0173.outlook.office365.com
 (2603:10b6:a03:2c7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 15:09:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH7PEPF00000005.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 15:09:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3A492406559;
	Tue, 10 Nov 2026 15:08:59 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2178E820273;
	Tue, 10 Nov 2026 15:08:59 +0000 (UTC)
Date: Tue, 10 Nov 2026 15:08:57 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/2] soundwire: Assume default maximum valid channel
 if not specified
Message-ID: <avMziZ9tYT5lg0Oa@opensource.cirrus.com>
References: <20261110113842.347883-1-ckeepax@opensource.cirrus.com>
 <20261110113842.347883-3-ckeepax@opensource.cirrus.com>
 <105b2b77-7eb6-4b96-821d-51af94a2e21d@linux.dev>
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
In-Reply-To: <105b2b77-7eb6-4b96-821d-51af94a2e21d@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF00000005:EE_|BY3PR19MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 67785902-c5fc-43a1-3470-08df3f3c8d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|23010399003|261009223027099003|4143699003|11063799006|56012099006|261026121527099003|10067099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	F7EccIkkFEBSYxk7WyQ7uOz+xy3TJHkL8WgsCGjiZevXaRIR7kqtHcP/qzkihp3QCOAUiQSdz6wKNgLSob6RG0v3zffw9egnzf5faPNGgpsJqWYWW05QVDL1c/baJDdx8rorUk4PLe9UnG4c5rSGqWELyy7kPD/1keJXgtNjTI2dBphwohHpDhpC6dvtdTjk91hCpgck9rLzFzrJ+sU/9zGrRJHS22++SFT++kLzRhn8MqWf4Hjg6YITqy7Po48f5ldGEJ/P9crh96nD6D6EnS/5zrmtxWwdbqbrvZzL48Gq7PHYJ34glZ7/aKC91CkF0HO3lpYsZ3Igw7/L/nDbkQGLRdtFWlhbM7Hu2Hb3VvzDBu9lKIUi2fYIXxBXStFLaAs3hwNwSUJ32DGkn0rCOQru2vXOHLuTaXzLTSiLQNJ1fW7+1pzNvAVAxEykPz0+vz4Pb84LmnsAmoCJKvte8xspOzMJVF687lbcTm458WQfBvu+sI1e+EmY38+RDfS0+H2s85xgT1z05HuQ1kgillw4wJQWQ/bNhUknJfJDo3oC69yUbT0Qalq1Af1XHFj83tWDs+RCEuYzDqJwbXnkDmj7b21HbBBzyg+a+uTWw7IxTIdKdmICTVs/A/Qobgqsp202dfMOLmFAPRTcevIfcxfpa3nGF+8zoYEf4k8zmequi93xqqhTngXTZqxCvA5tyn7ZnvrsrLQFG9o+veuGwg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(23010399003)(261009223027099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(10067099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0vHljwGAZNgMJzDT6e70TemKQ+JHE6FmxI1Rcil68/3YgQBhQIdPzjPi3BnNMMGZ1jp37Qe7PF0Wzg0/YT3F+/JS38u+r9BJYOhl1ETBIV6uPkKzD3tVyRSnT+VMOvxpDr7kiMUBC+q8zv1RrYrA8K4rVP9n+Wyxby6G4fiXxghOnJjnrZnznPRKeQOzXC4dPabDYY6HoKvV9YwnxTrE+kg1Di3gPbp5+dzQYO1xnih6oci3YNFEvuadrnCPK/sWW/A5rw4MfvBwaYoINKdQocOXZN6NSHbDEIJuJMu9LxdGbekGzbYkCNtd/XVB5sSuoxw4p5Z2RCPBMTNekaboGcISh7u01FYPtl4l76z2JQYP2nYc0Y474Mzp1ThubRC/lfI7vu/KcGXvB3yRQAxh/mLv/T+Bc+XafstWEoj2ajr7/BY7JaYANv59Vnl31Bhh
X-Exchange-RoutingPolicyChecked:
	mmcdwvZH3vStIRLiRbOurKJhtBn3lMKRJCef+iupBkcrRvOWBr4w8WUz0OegBJYIbAFPoK0YTL8Nf5pZaYOcyM/mRaSmMqBMwTG0Nf/CxQdnWIwYoRhG3Oh8E25hvcpWF9V/BVSFXFS3Hu04tW++K5aKk1EsApfgFMoyylbImpT9Ry9Umwp8rrSwlhIG9svcjRHerOzsX8CIZ9UWHcy9lHpLqxmexHMcPsk7TlrvHTA8NkWMTgvF3B3D5NwqhmiVa+3hT4LC+etnMe4rsWbmcF9gXdmdZ2YhcrgkyTtVIXMzhwRJqrTi/b+cAqdz7va9xAiWv7r5k4+rcwkh+9SLjw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:09:00.4849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67785902-c5fc-43a1-3470-08df3f3c8d1c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH7PEPF00000005.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5240
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af33390 cx=c_pps
 a=GE11VYRMVHt3yMfnQg1OWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=X2uv5zIWf0mfNaVAZ04A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2MCBTYWx0ZWRfXwvTy+bhS2zzT
 xIaHYHddX92Ir+NoB9mcDI58sT58IRpFxb4JzRCu8SxT3EdYW19G3fTFcw8vMqJ7xPDyhbnX/by
 VTTwRWVFBvwimhCTz6hhcs/9WXZLWs4=
X-Proofpoint-GUID: kpPTg1wvMKCdrNXBM8Y8bCDySTVfHNgj
X-Proofpoint-ORIG-GUID: kpPTg1wvMKCdrNXBM8Y8bCDySTVfHNgj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2MCBTYWx0ZWRfX95GxITbW/kKA
 wtTjoC7WMrCg9qa70JUVAHulSvYTbBZEFYsGOI8duzpHJFGz6sGE6aNKXNaSw01ZjuxMccmj5ge
 YuPVnt3df97Pf4u9jKsgO8Uiqm7oL4WKRqy4cNXyOQDXYcP5JpLQDHg+/eT/DYtuln4ArUETwkY
 xHkkbYzMEdU74KciHrGBx7t4gjaQyB2YKtVug+Sgxj5CP0ssmxNbYm18Zt1/9h2nCcUEVRQKPKZ
 H4PZ5aDPRPHjp9qG7SHWaGbuqUAyN3N1fAvmMU2gpP92Bo23VEZvHOIMBXXol5mu/oBQwRJer9M
 RK9ocuNiCotacMA/EGISEgWlm+0tchvLQWc0u/v7kvSDUqzfafzcB8HPEp/mu4ZNUA0D9xQXEmB
 L22LF7FH9Anhmq8RAPB12Z+dWKAbSTZaLa90Q93G3xNblP1Ktev2q9I5CkvcEJrywM0IKR4vY2T
 6+AuZizNWk4gFHLSLHw==
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 10, 2026 at 03:30:43PM +0100, Pierre-Louis Bossart wrote:
> On 11/10/26 12:38, Charles Keepax wrote:
> > +		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
> > +					 &dpn[i].min_ch);
> > +
> > +		ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
> > +					       &dpn[i].max_ch);
> > +		if (ret && !dpn[i].num_channels)
> > +			dpn[i].max_ch = 7;
> > +
> 
> this works, maybe with one possible improvement: in theory if
> "mipi-sdw-channel-number-list" is defined one can ignore the min/max,
> the two approaches with the list or min/max are mutually exclusive.
> 
> Something like this:
> 
> if (!dpn[i].num_channels) {
> 	fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
> 				 &dpn[i].min_ch);
> 	ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
> 					       &dpn[i].max_ch);
> 	if (ret)
> 		dpn[i].max_ch = 7;
> }

I am happy to do so if you feel strongly. However, the spec
doesn't really appear to rule out both being present, it does
imply that the channel list takes precedence. But given it
doesn't rule out having both, I quite like parsing both and
allowing the driver to make a decision about what to do with
that information.

Thanks,
Charles
