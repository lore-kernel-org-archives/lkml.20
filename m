Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417232;
	b=yJxZXmq27lPBw4p4mE15XpVO4wgTIV5Ss8BYoTjpYLstEykBOh42HLh4kV8ifMwpmqfD
	 B+T0AN+J2y/V0lLNOCEogOj+OZAxY/2V52XiwJ9KxU9gjCeqHPZVS6fsHafD4YHrP+qds
	 Vs4flaaGAaoioLRLZhhG6sA7dvQHA93SzyZCn31iz5is8hfwUHPuOsz+0UDyWOytLra1A
	 qcA5O4ScxD7nPX4zVQXEJOgTKp9d51WAUdH1dKm4kfLkPcpZ6Z6BAOV4SRzZDn3X42taM
	 9wfPDFR6gUiLtEe+eR4oT/WuMM+7gzHP2zfNfRqCJbCQ9SVqNQj3CDk9bd1y+4+wEig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417232;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=H8/lrIsnUSnsyfpvh3aJqt503G/HX57iau2y+kmIORA=;
	b=hnzMO0q8B5Dc5OWT+ubc6fwtDZK1E104PvADyMVe3221aFYTSTzEcPsIplgk0rKKu16J
	 XdYuxG7rgTdSGt3tSxae/oGWwRqJZzhxwIwkBPsU7+8T9g05F3dwnXvqARtH3pf25vlZd
	 U9JsLrew5EARccQCzz5dd/lbT/VHMvq5fzv/smgR7kwUvknRAn+U6kwAtj1AX7oDq2vUO
	 hB9C4KVgzcbNeCrjrOEnCLQ8CuEfESJV68VD+nMIhTeXDJOuV/YpKA1p39iIga1YlSXTU
	 W2Z6/s76H3dsX0ZItzbNcp9pqTTnx+TMbTAczNljkTyOBXy1TAgh0OBgofsJDaz1iWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HWPTEXxN;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=VxvRNEPa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A29606A333;
	Wed, 11 Nov 2026 17:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A29606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HWPTEXxN;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=VxvRNEPa
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABGxw1O4184227;
	Wed, 11 Nov 2026 11:13:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=H8/lrIsnUSnsyfpvh3aJqt503G/HX57iau2y+kmIORA=; b=
	HWPTEXxNGd/CRmteQbra8UwFqNouSsNcCCzolV6vSViZnJYWVS+O6sVlVoGaXaMc
	2HplShyI8/2Z65ipMD4B/f6sRwQnvM3hhZsCgKf/kbV3CDKPV5KrLN1TF1pbidV7
	hkBuSfNQtkU7B3fbRZQPYDIrKm3W5NgnpWx6aMbDd/QX0kkyW0e64/jWzP5/ekpR
	O36c9IctYoOdKRFwP9gA7cpJ5ve8Se3Riqrj/y8KGglZFXrFFaAh/Cnd2/bGIaAE
	YbPzR3ShFJZoCKn0hF7MG9VA3dSpavgHDiXCiSH3c8KrWYxGx/TLUhbv5uVZpUdr
	Ds2/ggbXnPk15KyH/DiQfw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022131.outbound.protection.outlook.com [52.101.53.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7urswn6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:13:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHS9T2BilVcZZuFrBBSgZCIDL6621t0pmdL6pJMOYx9HeuSI/2jZo72SPobFnJwf6lLQYsGADZnddwzXHnB4tnJzm3Ljrn88oEhtbwVC45aTBaLt5OqaKy0mRwhkrf1So2EBEBVZypyJq7lDJIZU1GKYdvhZfNU/YvuX0TO93oriUoDDaNH0El1J34TXcSqZwXTO2ZRQAaRiGKHXsheZECTdNVFW1Q30Qev+s0ciVVQydJ8xhOnQZC344Mj4eLYdil+YJhzP1YBXKTqWDQNsFS8DQBz2djVDZdY2wY1+ULV9nufMLBjNuwydt4f7L9Iv8tWdpPFu5PAOmK3rckXBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8/lrIsnUSnsyfpvh3aJqt503G/HX57iau2y+kmIORA=;
 b=dt+RRIq3SmMDKzzDiSS0qI7I7cX3FDJuX/cHuW9j8PfiRG20ktfMR0Vvh0gAIjdtjgvZtP2vVazHBdCwQra2PGzNMlQ681fpnhPTT9OhQlQGsoEbBWEWecYCbhLcV5MzcuTvsDh+dHtqsjCULUfJpGN09X4RpViYgGGqCI8vBjzrXdcgfpKtvLkcl/TtvTGZfg4EMmjS9HZuB3GQtr1TqNjQuTEMtXhd9Itrqu+O32gykVDG+UtQwVq2rUReagUXgC4Yy90xwNGJWixMqMaPK9fIQK2w9JZ4cmuEAwuJ/7C9kSUeZ8RmAvXgDD2gQGMoWX1R6S2BtXdihH7IiGxfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8/lrIsnUSnsyfpvh3aJqt503G/HX57iau2y+kmIORA=;
 b=VxvRNEPapXan0ZVS/mqrlHuViWKjOH+cE9gsqGkuIr9fSq3BAGEyOlyRrlFLULAth8RVubcxc2lOQGLg9L6aIASyHq8lcprKhTDi/SRVNnP48PyE3prtrefkYTqOgwThtzHOXpU65NH+iB4QkzQDOBDZjJc/cjpjurSQf+uYLIw=
Received: from CY8P220CA0035.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::19)
 by LV0PR19MB9360.namprd19.prod.outlook.com (2603:10b6:408:328::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:10:38 +0000
Received: from PH2PEPF00048917.namprd05.prod.outlook.com
 (2603:10b6:930:47:cafe::7b) by CY8P220CA0035.outlook.office365.com
 (2603:10b6:930:47::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 17:10:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH2PEPF00048917.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 17:10:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3ED04406566;
	Wed, 11 Nov 2026 17:10:36 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1B938822561;
	Wed, 11 Nov 2026 17:10:36 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: cs42l43: Update load detect procedure for cs42l43b
Date: Wed, 11 Nov 2026 17:10:32 +0000
Message-ID: <20261111171032.1491717-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111171032.1491717-1-ckeepax@opensource.cirrus.com>
References: <20261111171032.1491717-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: PH2PEPF00048917:EE_|LV0PR19MB9360:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cebd6768-1f95-4a9f-1499-08df4016b4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|61400799027|82310400026|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261022113327099003|261022075727099003|261028144727099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sJXX3qEHCVRSvpJGAE3NKoCiSevvW9tZlD5GO78dHzShagHk3wEghA4JaDLsiIJK8+B7k/YZIC5MYpGuKT9GjyJ45pOPnhqzLNUxy5baHMr4jyXCwIgnHzbd9oRd/G4PrEuTuyJlkJ2Oy5gEYb0I/+LD3YsfvtEKPkqzCXeCzSr9iz5xzCaooIRuKC1turQS7ziMkZ4PRBCKCmiiHS2M2hXE32PPNObwn1IUrN478+ilUAdpPGpQZFRT+r0BhO9OUhjnGozb+btbUyAUeggTtQZ8yD+x8HMQ1sPKPCS/XWjLg5ZzSfrBocG+mCl9yKBgp41tphmrfXqdtFYY3MdxkfZ0YelFV1OlN1XdIPJf9Y9oweFMX6EdiYpmJehIPXOPOGc5qwYJHYySiR33v0D+5lCTDsyxgjiLRhioZK6DwTmzlB8UDl+BGSj29E+4o6dOYk7wOiI55tL/j1eaVEzm2hEZzoQ1uZKvAMFKLqm9xej0++Gn06Rdv2+aq/Xf9YlQhn1MyRk7nq3GeSPaI8gHhSENiiPtTnVgfkKNPyhMe9Y4Xv0OTCXmfINNy2WB1g3ewjrVIlyPG7McL5QEgLHoAGvsDcfp1ZkDHwUnk2okJQVEMDIwBG0UUN9OvajeyeVYLicWKE8Q71Aj4SoA1/z/1SMfBhskSYALnbaVRgscCsUtkNBCjJOfIlrcttv/9tHNhkHVMYA/G4hw2wJ63JfNKg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(61400799027)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022113327099003)(261022075727099003)(261028144727099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ck1faaCScFjmapDHoWA13Dv1pTklXIC97cCXOEw8c9MczT6iGAh9glRz+sqJhD2KRp1z6MO0R1lxFnu04d/VcFvMLQ5hMx5oglx8n5b1eB2XPZj6d0sbOt3aBnDz7w2l51KnnIhN8w5UmHhKkYh7HQXRssaz09kzJdh/nXqr1BROUoWPpMR5KI++dHsOpopePT8ORBPxx4DJjL+2J/VVhvHdEbI5yaY7Xy5G7DLmnG7N6K5LI/uluUYV8JZppQGzmYsLmKCegWkRQR7XCvsyXKYTGQVmuhmeZaydDcyOIuWeGOZ3uapEdRxpZDPyM+CRVLlaH2+eAM5mqFHk7YJHHE8ik6RjA9c+hgebPMuve2FSrGXoPeJBPMuR9ZS8vRibhMbFtrTAVc04ziaOTwWrwjriqtfM1RVW+cnZS7nBD2udfeYtGb57RDb263JcXrje
X-Exchange-RoutingPolicyChecked:
	G2l0Qdjt+yRqgO8OKwnPfTo/FUvvYVafFsKGYNiojrvhmYmCHvMHzcmTOqCbY1Q2zZMGiFQwpWaY0b5gzSxddZ2QVsAzlNcB1qpZfQ42hj20jQTYhNQ/+bQkPE+lYSCqLJzWtc66X0IAjQClMTzFtY9+2Y7OhU4uJENhxFfSea7ghqCWSUNT9FQVtBavBLwtchfpqYdFsjoT158HodoVM+sDeyYTZ+MJqWEZ1KJXRwRsr6km4L1urwxTRRo5so6ZoMXJz6tZxZ0UYgWe2JS74nqp8aBJ8CX25sVt+NFqfJCumRK3rEYh1N3YCv7sJO6+/r4+1kyuy8N4+bhHgy135Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:10:37.4577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cebd6768-1f95-4a9f-1499-08df4016b4db
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH2PEPF00048917.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9360
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX6t3CN0iaME32
 N7FXo9QzqMMbyLFjb+l3v6NY62yjmqWlxMDI8sg1MKX1gqAdOwzgmxajJCZF1mTNMiB66AGMn0a
 rMz+3gRk9b/Nw9MH/vrIo5SyM11fg67b6ZrCIKdU0SmV7f5E5f2lrPcgtFZY0yfypK6VFk9k8fG
 gc90lzTcO8Ea95ZOSz5Ce5q0KYbsg6WNNPDRDnQrLdXyRFWYUlh/g+A3ZGWAW+J14+6Nb5nuuN6
 zO2fJ5B0GncH9TtmwETADCr02iVjJmi2LKwTGH4djq1GmAO/oFZproivEl1woL4jomfDGv9W9DF
 7jNBtpibOtmNJRJYxm/TTF+oYeKx5l/UKvxKsN5bK6O0Li/qnG3E8vC6ZTwtT4pny2maVxExA+s
 mrmXqRlfc//szh/L/frpyr9q7EUKUCAyQzfKcR0grLWZT5/XUI3Q27DaD8663VYJahydjcuXc8n
 3xXPKQ0/SjtNCh/mLcQ==
X-Proofpoint-ORIG-GUID: MchcK5vnh0U6HlWd-okEB4eaiozXiHxR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX55R3btliYHre
 GUjVvj63C22+Wy8d0ynDJO1qw0qaTNGQJWbb8KQ4wRDw+8VBl/1kCLlZAEhtUSviVFPXi/UZQf/
 D2d+YwKsAJk9UxOdIPOWBGcUMc6Fl7Y=
X-Proofpoint-GUID: MchcK5vnh0U6HlWd-okEB4eaiozXiHxR
X-Authority-Analysis: v=2.4 cv=JagpPkKV c=1 sm=1 tr=0 ts=6af4a24c cx=c_pps
 a=6tOaaN1fXmJE/LdyR88bKQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=t_SYNOdkF1KoeevYuH8A:9
X-Proofpoint-Spam-Reason: safe

The newer variants requires a slightly different process for the load
detection. It is no longer necessary to apply different tuning for 3 vs
4-pole headsets, but a new field does require updated for CTIA vs OMTP
headsets. Update the driver to follow the correct process for this
new version of the chip.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 101 +++++++++++++++++++++-----------
 1 file changed, 67 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index a2555dd9229e3..b3f89c712ed93 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -324,6 +324,11 @@ irqreturn_t cs42l43_bias_detect_clamp(int irq, void *data)
 #define CS42L43_JACK_BUTTONS (SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | \
 			      SND_JACK_BTN_3 | SND_JACK_BTN_4 | SND_JACK_BTN_5)
 
+#define CS42L43_TYPE_CTIA 0x0
+#define CS42L43_TYPE_OMTP 0x1
+#define CS42L43_TYPE_3POLE 0x2
+#define CS42L43_TYPE_OPEN 0x3
+
 static inline bool cs42l43_jack_present(struct cs42l43_codec *priv)
 {
 	struct cs42l43 *cs42l43 = priv->core;
@@ -502,9 +507,11 @@ static const struct reg_sequence cs42l43_4pole_patch[] = {
 	{ 0x4000,	0x00000000 },
 };
 
-static void cs42l43_start_load_detect(struct cs42l43_codec *priv, bool mic)
+static void cs42l43_start_load_detect(struct cs42l43_codec *priv, int type)
 {
 	struct cs42l43 *cs42l43 = priv->core;
+	const struct reg_sequence *patch;
+	int size;
 
 	dev_dbg(priv->dev, "Start load detect\n");
 
@@ -526,14 +533,36 @@ static void cs42l43_start_load_detect(struct cs42l43_codec *priv, bool mic)
 			dev_err(priv->dev, "Load detect HP power down timed out\n");
 	}
 
-	if (mic)
-		regmap_multi_reg_write_bypassed(cs42l43->regmap,
-						cs42l43_4pole_patch,
-						ARRAY_SIZE(cs42l43_4pole_patch));
-	else
-		regmap_multi_reg_write_bypassed(cs42l43->regmap,
-						cs42l43_3pole_patch,
-						ARRAY_SIZE(cs42l43_3pole_patch));
+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		switch (type) {
+		case CS42L43_TYPE_3POLE:
+		case CS42L43_TYPE_OPEN:
+			patch = cs42l43_3pole_patch;
+			size = ARRAY_SIZE(cs42l43_3pole_patch);
+			break;
+		default:
+			patch = cs42l43_4pole_patch;
+			size = ARRAY_SIZE(cs42l43_4pole_patch);
+			break;
+		}
+		break;
+	default:
+		patch = cs42l43_4pole_patch;
+		size = ARRAY_SIZE(cs42l43_4pole_patch);
+
+		switch (type) {
+		case CS42L43_TYPE_OMTP:
+			regmap_write(cs42l43->regmap, CS42L43B_LOAD_DET_SEL, 0x89);
+			break;
+		default:
+			regmap_write(cs42l43->regmap, CS42L43B_LOAD_DET_SEL, 0x98);
+			break;
+		}
+		break;
+	}
+
+	regmap_multi_reg_write_bypassed(cs42l43->regmap, patch, size);
 
 	regmap_update_bits(cs42l43->regmap, CS42L43_BLOCK_EN3,
 			   CS42L43_ADC1_EN_MASK | CS42L43_ADC2_EN_MASK, 0);
@@ -586,6 +615,14 @@ static void cs42l43_stop_load_detect(struct cs42l43_codec *priv)
 			   CS42L43_ADC1_EN_MASK | CS42L43_ADC2_EN_MASK,
 			   priv->adc_ena);
 
+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		break;
+	default:
+		regmap_write(cs42l43->regmap, CS42L43B_LOAD_DET_SEL, 0x0);
+		break;
+	}
+
 	if (priv->hp_ena && !priv->hp_ilimited) {
 		unsigned long time_left;
 
@@ -605,7 +642,7 @@ static void cs42l43_stop_load_detect(struct cs42l43_codec *priv)
 	snd_soc_dapm_mutex_unlock(snd_soc_component_to_dapm(priv->component));
 }
 
-static int cs42l43_run_load_detect(struct cs42l43_codec *priv, bool mic)
+static int cs42l43_run_load_detect(struct cs42l43_codec *priv, int type)
 {
 	struct cs42l43 *cs42l43 = priv->core;
 	unsigned int val = 0;
@@ -613,7 +650,7 @@ static int cs42l43_run_load_detect(struct cs42l43_codec *priv, bool mic)
 
 	reinit_completion(&priv->load_detect);
 
-	cs42l43_start_load_detect(priv, mic);
+	cs42l43_start_load_detect(priv, type);
 	time_left = wait_for_completion_timeout(&priv->load_detect,
 						msecs_to_jiffies(CS42L43_LOAD_TIMEOUT_MS));
 	cs42l43_stop_load_detect(priv);
@@ -629,23 +666,25 @@ static int cs42l43_run_load_detect(struct cs42l43_codec *priv, bool mic)
 	if (!cs42l43_jack_present(priv))
 		return -ENODEV;
 
-	if (mic) {
+	switch (type) {
+	case CS42L43_TYPE_3POLE:
+	case CS42L43_TYPE_OPEN:
+		switch (val & CS42L43_AMP3_RES_DET_MASK) {
+		case 0x0: // < 22 Ohm impedance
+		case 0x1: // < 150 Ohm impedance
+		case 0x2: // < 1000 Ohm impedance
+			return CS42L43_JACK_HEADPHONE;
+		case 0x3: // > 1000 Ohm impedance
+			return CS42L43_JACK_LINEOUT;
+		default:
+			return -EINVAL;
+		}
+	default:
 		cs42l43_start_hs_bias(priv, false);
 		cs42l43_start_button_detect(priv);
 
 		return CS42L43_JACK_HEADSET;
 	}
-
-	switch (val & CS42L43_AMP3_RES_DET_MASK) {
-	case 0x0: // < 22 Ohm impedance
-	case 0x1: // < 150 Ohm impedance
-	case 0x2: // < 1000 Ohm impedance
-		return CS42L43_JACK_HEADPHONE;
-	case 0x3: // > 1000 Ohm impedance
-		return CS42L43_JACK_LINEOUT;
-	default:
-		return -EINVAL;
-	}
 }
 
 static int cs42l43_run_type_detect(struct cs42l43_codec *priv)
@@ -686,18 +725,12 @@ static int cs42l43_run_type_detect(struct cs42l43_codec *priv)
 	if (!cs42l43_jack_present(priv))
 		return -ENODEV;
 
-	switch (type & CS42L43_HSDET_TYPE_STS_MASK) {
-	case 0x0: // CTIA
-	case 0x1: // OMTP
-	case 0x4:
-		return cs42l43_run_load_detect(priv, true);
-	case 0x2: // 3-pole
-		return cs42l43_run_load_detect(priv, false);
-	case 0x3: // Open-circuit
+	type &= CS42L43_HSDET_TYPE_STS_MASK;
+
+	if (type == CS42L43_TYPE_OPEN)
 		return CS42L43_JACK_EXTENSION;
-	default:
-		return -EINVAL;
-	}
+	else
+		return cs42l43_run_load_detect(priv, type);
 }
 
 void cs42l43_clear_jack(struct cs42l43_codec *priv)
-- 
2.47.3

