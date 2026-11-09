Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794245190;
	b=CJ2EyzGTOSGb+Vjeudq7drrc5TQchh0dGcpkE8KKyZnzBnOj2nYLxoWe1lRU4Rlr9mU6
	 6AWmSdoQ1DaR5Qz/JPPEhtE5hIh2mVE+QHmnlbdPlVMQaZR1ost71Js/msAYyP9QTO7Em
	 HEX1y5TuG9zqhObuPpt81sg81ZZxzTimFu+cS4D4OkJ7o+85ZoD2PEMtLh78+DRvXAgJE
	 6imYasv+dA4hEPpg6taOn36N45YKCxofvTTql1zcxiTuPQDTvdSu/r3pXKLOPHz0QJynn
	 OsW9j5wkd+j8QDZqLwjwy8uhrLE3BmLW+nWSCRUo43lKw467AkYNVwgRoRcRTqCYJiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245190;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=KH4JF61wed18nQ0/ZZQZuImrfL+NKRJPNIWEUt8AikU=;
	b=hRn6SKzwh/DP6Sa16nVZ8yIIQtmlQjJqvxfsp7a10XbDmsPgvomACde9YtTqZO8v+Ewg
	 YVDMBE24rhhurzinVC2x7KhpnNHHrQ86fxT+ryNGeswJ7zBy23RVN6piiVgoDiKgXrCWs
	 kdeXH1ffiysZhKyPIkq+IsfwQFeumfLveiWSZKfoLLI2bLViRF70Nm9xpuwLpoQQxfQyS
	 0WgKSWSVDTnIWJS6OOz4HizQYHnWaSczxkH2wYcSs1Tx5QC9XAUPYw4Jw8LLFN7vAt4Mt
	 m7V9CP2Q+l6S8Nn8OFey4RePIBKG7JEADoHV/D73fsltjOwOjgX5NaeVgQ0WWX+pQIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=E0u2CMR0;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=qy3cCuJ5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B71606A321;
	Mon,  9 Nov 2026 17:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B71606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=E0u2CMR0;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=qy3cCuJ5
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9Emf1Y2564800;
	Mon, 9 Nov 2026 11:26:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=KH4JF61wed18nQ0/ZZQZuImrfL+NKRJPNIWEUt8AikU=; b=
	E0u2CMR0oAPxMKSKvibaPvMKzFC+OQ0uNhra79MDmbGf/QKmBvUeKTugXTvwgu2j
	WBXms+WkRI4r7QOzf2pAse95xiaVKfgNol4phDjv5fiVHu8vpIXEMphtC7bipUX5
	eR604iHwESlH2eKpvysMhSvZ1RE2QlMWYk1oI9QEm1aCxTAwv3Nm7mR9nzmT8Bde
	L5V/wiKiNxRsggcXxodgK+pncNGpJGarCvl/6scw6WKpL8/t8vtd0ZHjZsA+y5CD
	t8TwwnGNvhVCXDD1MYKk0koDVsD/14I0XUcGyXmW32aFMt/Qjtb/ukzx7x2ew6+H
	cboHeQcKhI0zQLODmPLRcA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020075.outbound.protection.outlook.com [52.101.193.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29hacrc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 11:26:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRRogOhdy8yLBdXFqjcebUhVZTZ5o0Fsv4KzeNi9QRrhQ8hJxfZ+9nIZ/+3DLkpnidsiLbEcGG4AKc+bHA4W21Gi1GRp1Xz/MwQ3G2aVYX/LxCZqrzf5o9WA9sCEFdkFd1dfxE1jX+YU3/xo81n7v+Wlvoc1izjUZBB37t4zbafZpqEBW9Dn9ttKQ23hNndDEsIUrZ3flgmNng6SPAU0igDfsmMnbCXsDNuD7LhZxksATUzDYKNdGzdK/5Ow8Nk4tgqSfINPBQWsXhIKgC+6W0M5rihozZ5+vE9w0t6ZRjvmPzyGfpJGPGBtqGTJ74n1LdONnU9rKE3f9oCH7mdlgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH4JF61wed18nQ0/ZZQZuImrfL+NKRJPNIWEUt8AikU=;
 b=W+nb4tLNBHNGUAw6pWheEUVmN+zXQ0anzJff1AtfObsFNUihBXHnJLX1W5CqZ4IiTGoweVD3bYQlylqKCGTB5QQ1O7NRz0afGB26KyICW6EIRn3n9AFbP6DQ9+A6e5mcKep/JZsAUT9TajR56jkSTv7igWAkyLGugQ30OkhwRcvnRn3YlBqQ7p9hiCl+HTMQNqwpzctDqKNhRVfoxoblIBdJe9dJd9bXjEykSXz0/+LP9zZtclqagNx9TGpfMR5/rYozMAZ7Hx3v8Xe/objKGn94pNXA+gNyw5hH0yqmxVJUn8LzaNn0rhpA4bqqG3Eq0CK4SJfxB6uXz/tcSzbNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH4JF61wed18nQ0/ZZQZuImrfL+NKRJPNIWEUt8AikU=;
 b=qy3cCuJ5eu5hK6hQHQpd56nrxTnOGry7Jx3edlweJqy3NpdwCF7iEaZDK6N0NoAzxFLpSLSy0W2BSs5YIfcdb0KoLLGskFFeQy/FbFBtQirq/QgH0fBfyF0sn+3m5N33nBV7mvaLx3PFjF67U/cm9GeYi15hlkE2U7HNQoLnTy8=
Received: from CYXPR03CA0005.namprd03.prod.outlook.com (2603:10b6:930:d0::9)
 by SA1PR19MB997340.namprd19.prod.outlook.com (2603:10b6:806:4c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:26:11 +0000
Received: from MWH0EPF000D894E.namprd05.prod.outlook.com
 (2603:10b6:930:d0:cafe::57) by CYXPR03CA0005.outlook.office365.com
 (2603:10b6:930:d0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 17:26:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000D894E.mail.protection.outlook.com (10.167.249.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 17:26:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 943CF406561;
	Mon,  9 Nov 2026 17:26:07 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6E8B1822561;
	Mon,  9 Nov 2026 17:26:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 2/3] ASoC: SDCA: Factor out helper for creating mask of Cluster channels
Date: Mon,  9 Nov 2026 17:26:03 +0000
Message-ID: <20261109172604.4077312-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109172604.4077312-1-ckeepax@opensource.cirrus.com>
References: <20261109172604.4077312-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000D894E:EE_|SA1PR19MB997340:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d113d97a-2e26-4828-a80f-08df3e868b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|61400799027|376014|22082099003|16102099003|18002099003|3023799007|10067099003|11063799006|261028144727099003|261102130727099003|261026121527099003|261102123227099003|261022105027099003|261009223027099003|261021121427099003|261021123027099003|56012099006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	3hiliZ1ooXuUX8C2ovuyzIRkbI9UtUM4+pZmZ+ds/i3k9/bleXXBn9Re8uqPNeH9E5iQ09jA57SShFZdQStm0O/A+4vPuxagEVdYd+/ONPozFXyJfAcN5PRxuL/mZoUb4YCXAnP0834VxB3wCkYoyfbXl71Q5fLK4+A0xPJ7vw5G/MLjBDhFH9tN3X5VZV6bOINvOb7V0ALeCzXnRikDE1DDR4MC6T2U4fYawgecwUskh5Gtp7y9jZhF/4V1lTHjaNLSIwh7/R6NMEgJSNrpYJDFVKcgoEQck493zcbcssD0vIyvG/72wBDOHC9OTQBLCrwmrZmsAZMi5wLGOPXsZsLJkz63aVSErXovpqdcrfCIix1bNxRowXgX83PG02pQOL5PsDrp6zXuRFI5i7dXp7oTkI4C+XAdi/IS0+tfiIqOb+1HPdxkx890X9lW4Rrjb+87QIKLtcy+gyl1ouNC8cpxlEPi44MYlPJyehrPel2SCi0nb/CXGkh5dLwgAH2n7pABzgxgpumaTwqTAoVpq3mFEcbNks0cmmrmv/+Jq9YBiWoenSDIDPH9IckM2MsO8mFFGroqcyv0eg3YS5f0LUKRaOub5F5XNrqSyx5aS59+zMEreX0Hnxw8Gn/4A/XnjYbg+SbHdQFRzqEAWsNO8r++0+RTs2/9/yWQS1/1FtPIA+hm9MI4dhseHe689CFTjPS9yNw/gPGfNVMFbpAxZA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(61400799027)(376014)(22082099003)(16102099003)(18002099003)(3023799007)(10067099003)(11063799006)(261028144727099003)(261102130727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261009223027099003)(261021121427099003)(261021123027099003)(56012099006)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	laRoNdUU6gkGh78SlMwb1Vt9MPGZo8xlT4y5mIXL4VreFMjgzlhiTHZCUKtoPGFdLRf8wTzvhEKOe0xF/H2F/2eOJ2IJ38nCwxoWnIVl8K4Y41Ej0pOjzfrBvz+XPbznfzXJ7eBlIPFwj9Qb9fdTzUr/Ci+iAfLVr7BOSa6ac6yALr+HsgvHH5EmXlECSmINsIX+bkHAAKG8nw4J68klFrWVmN9v4CqUdDJU8VQvE9yr6YHTSVM2vZIlREvCzyYqjBVPa0Ai7z45adhRGSQ7oMDmbRNie2JC7lnj8H2yQqHO6h71f+JyMVBGTuGAtRJn8xXKQUfkD7HKFcmbaykYh5s31EjYRARKIf7Z7ptGwqk0xe/YuJjeD36PwhJyv5MBvHZP895CVlw3Jtsa4EEgmcp/el+5pra2u7oIuMa139YI7p6PyDTT5qvtU2Qz2Vy8
X-Exchange-RoutingPolicyChecked:
	qIIDFnCnyPYnILNZQnjYa+Bp5+4Woq9i0rubdj3fxjQeyL/RyEk9KG9x8rKRA0D1oii5VI96QcKl/9wEM45OZNwi0nI79jtxFvG8oOpASH1zdHs+jXNvNilpP+X51FlfX96P6u2BbGlc/K2zLmbtsxIs7nJ/NnBSwEdUT2QX3rY1AzwTR/V2XmwpYoVceaHNS7pz1jUbcjgCJsIHCBOhcm8QNt2Ywz7W4cYtdQsfABtc9+1mRTVOlF0N6oPW1vL98fRe4JlNIite7lQdAdjtIAeuWGZbngr8kDHFrCfGGacdrj2yRVohl1EKOF0eru3iHiJkRFc3XdmrqijWbPc6iw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:26:08.9353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d113d97a-2e26-4828-a80f-08df3e868b40
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000D894E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB997340
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af20238 cx=c_pps
 a=dTGz0tuhMYfsSU3NwIzouA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=oHLFO8r6Pw0-5CqiDFUA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfX3XHdCmxnvoKx
 KbJgSKU2MBkCQ+ndK3ycERJA5URC848CqNsMjuOy/4eHRyUvqZ/7tpZBL+ySsjOQ21/+Ro5/7jx
 c8bSpZ5GYxs9yMnlCasZRwKE7InyxUQ=
X-Proofpoint-GUID: j6TAqw5wNI6G6Q8EsRK0VOiJRyQKJaWv
X-Proofpoint-ORIG-GUID: j6TAqw5wNI6G6Q8EsRK0VOiJRyQKJaWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfX2YV4+0x9Pqxt
 EsEMu7QN91qev+3WHGvNNaBaQfyXe1buHV1xYJqSj8FfF/fZv/FIIQY1yq3LhguDkJGKbwtvgb0
 l80lSvpjThg1mhib/guNVnyj0UppiqEe3a7CrA/Ccikq83riWEldLW3Mv69NZbibiP82rnapnN0
 TrLeZx58SoGfAg0+25wdbBA+fTClBcoA8W9keTxRp4ic5nYOQiU8rlr8bcT2EJmgU6Dg9dPjzLu
 4X9PUz9p/oNz1z3H0AwbdgycAlYs9u/jWrXFCx8figToLHsN6xTaMb+phWJjoPC1U3BoVu/7GHq
 EHOXBvZXiMXVzSA56KDj0aw1ZVspLSORb9KbXKkaKhxbGhS/JzYpoCXRfVAPk8WlywpR0iWUEt7
 OVLRQ36VMmzlK/jOWLGsK+TVKk+oDMnghnmwtNkO84SvhG2/s6WuYw7JEtK9txpmzrAssOI6/8r
 BvezOt7hcVn62B9207Q==
X-Proofpoint-Spam-Reason: safe

Factor out the code that builds a mask of the allowed channels from the
Cluster information. This is slightly cleaner and prepares for
additional constraints to be added to sdca_asoc_set_constraints().

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/sdca/sdca_asoc.c | 64 +++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index b8bde56298706..be1b4c0075796 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1476,6 +1476,37 @@ int sdca_asoc_free_constraints(struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
 
+static int get_cluster_mask(struct device *dev, struct sdca_function_data *function,
+			    struct sdca_entity *entity, unsigned int *ch_mask)
+{
+	struct sdca_control_range *range;
+	struct sdca_control *control;
+	int i;
+
+	control = sdca_selector_find_control(dev, entity, SDCA_CTL_IT_CLUSTERINDEX);
+	if (!control)
+		return -EINVAL;
+
+	range = sdca_control_find_range(dev, entity, control, SDCA_CLUSTER_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	*ch_mask = 0;
+
+	for (i = 0; i < range->rows; i++) {
+		int clusterid = sdca_range(range, SDCA_CLUSTER_CLUSTERID, i);
+		struct sdca_cluster *cluster;
+
+		cluster = sdca_id_find_cluster(dev, function, clusterid);
+		if (!cluster)
+			return -ENODEV;
+
+		*ch_mask |= BIT(cluster->num_channels - 1);
+	}
+
+	return 0;
+}
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
@@ -1499,42 +1530,25 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 	};
 	struct sdca_asoc_constraints *constraints = snd_soc_dai_to_priv(dai);
 	struct sdca_entity *entity = &function->entities[dai->id];
-	struct sdca_control_range *range;
-	struct sdca_control *control;
-	unsigned int channel_mask = 0;
-	int i, ret;
+	unsigned int cluster_ch_mask;
+	int ret;
 
 	static_assert(ARRAY_SIZE(channel_list) == SDCA_MAX_CHANNEL_COUNT);
-	static_assert(sizeof(channel_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
+	static_assert(sizeof(cluster_ch_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
 
 	if (entity->type != SDCA_ENTITY_TYPE_IT)
 		return 0;
 
-	control = sdca_selector_find_control(dev, entity, SDCA_CTL_IT_CLUSTERINDEX);
-	if (!control)
-		return -EINVAL;
-
-	range = sdca_control_find_range(dev, entity, control, SDCA_CLUSTER_NCOLS, 0);
-	if (!range)
-		return -EINVAL;
-
-	for (i = 0; i < range->rows; i++) {
-		int clusterid = sdca_range(range, SDCA_CLUSTER_CLUSTERID, i);
-		struct sdca_cluster *cluster;
-
-		cluster = sdca_id_find_cluster(dev, function, clusterid);
-		if (!cluster)
-			return -ENODEV;
-
-		channel_mask |= (1 << (cluster->num_channels - 1));
-	}
+	ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
+	if (ret)
+		return ret;
 
 	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
-		entity->label, channel_mask);
+		entity->label, cluster_ch_mask);
 
 	constraints->channels.count = ARRAY_SIZE(channel_list);
 	constraints->channels.list = channel_list;
-	constraints->channels.mask = channel_mask;
+	constraints->channels.mask = cluster_ch_mask;
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
-- 
2.47.3

