Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715771;
	b=GwGUWk/w5fhT+XckpMG2QnG9otnPeYqJd+kjDaAOk+R/ouJoR8o3s0ONn4OZHeCKbMh+
	 Bv6a4D5nTAJ+5meYBDVLi+6otW2+cA8Dezn89sCd6cVE38M4SFRiSTrcB+O3ePFgxQNCP
	 LU7KGHavIH03KenrpmQh9GJPpfHOTOZcpElm4EgiqBWZ/4qYo9NCVwXqpo5tJaGyBFYMS
	 vCZrVA92sDLQBEqZY/9JTIxO0NB7kNc6PjcGmf1ljGRLqfpRLZTriQPUs67AF0qq2D8Tu
	 kFhr5G/8isLeUhFnkZAuhetrA+GDkiUpAQFmnv94qkDH9GccWcdQtps3p8QivyboHSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715771;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=W4w77+RPwlHbpkvDD+Ye+WRCYSCNKOL1Lw6/Zpg/dSk=;
	b=sBFhe/nOFhPkm+m1YeLyMuAr+ruFEKxdbzpNO674CcbZytxqIsiICwSY4QaeHXM0/58L
	 ALhtZWIqnurPWdJ/zrXnHmPm63W/sb56XE8GPAOSXCoLiN12wj2zsnZSH/Br74nC4C1pU
	 04DgTMWO2WDdGLR0qAS4StyAvbTatShEDD4dspeV3KFmQrLCzPqz3NHYgv+fnIkXhy4lN
	 uPOnl7tj3bqQBJrUlqUdefgtlSXrCpBSOyBhzQyCLS94HOefvW7bVKN9TGZ+ZtAqb5uFF
	 eoTgcpbvH+qXFMHmrAVmV46zgb/11L7xE9pZHHcD8B2gwuCwAla36N9A3KhowqFDcGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ELziZf2l;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PbPWHiRV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628AA606A32C;
	Tue,  3 Nov 2026 14:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 628AA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ELziZf2l;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PbPWHiRV
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EB1w51173730;
	Tue, 3 Nov 2026 08:22:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=W4w77+RPwlHbpkvDD+Ye+WRCYSCNKOL1Lw6/Zpg/dSk=; b=
	ELziZf2le3vGrB7DbaGGUw+jA67GcZC8g8nVAZf4mLjXnwUV3SrWCnjHSZNTOBSn
	YM3GsOqfoMcImywMwE+7WA9OtJShwHw8JHGDYcXGcL896y73adU3cX7bjSvQhfCK
	WkZ1J5VHp+M7wnMp65aV1QeWHfx7pNj/HItP3Z3tF/UZBhI2e5/fhDAkoHcqPyE9
	ahgQAm6vgh++9jlvTlc/GaXurGP8wBKpHfMuELCwIc8WbjGQRKOsdpsHTeIG5TuM
	2dhvSX1hWWCJ/Ktm50t7zEWM2+tXuNnsay0N+rYOfPAPT1fk0qnGyMGJ5QCd6zqO
	21TzEWr3omCeU5xKzQty2A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022076.outbound.protection.outlook.com [40.93.195.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfbk7e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 08:22:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpe8xLUnvIAcFDneGQSy9YpS4tH6E6p1VTe0E/Yt1lscE0e3uxrDEi7OY3uvIIciyPOTxnjP8gPbPpMWkKNioG7gM4e8FeT5iQ7GAYH3QURqs4/CIP1eHWEBcaeLYJ7jQb8ejov71yEPlFSCOh8lnTKzbZGsgxLjswdeGAnl15yLwGHWCmbBLguQI5iIYnQZkrJOLjSyTJfahm8pCSwwXZExarq4WZzXKc3WcIxX17RYgu7a491Fy2dXJ0ghqqWaAEpR/1HZvu76/y4k1qDYQU49ef8Wf3LJDbEB9F4M9tnTBhUdxwWBPr/f3YikeLJR7wG5UYuE/P7rdQcN/86xeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4w77+RPwlHbpkvDD+Ye+WRCYSCNKOL1Lw6/Zpg/dSk=;
 b=gxGY7qeV4OXnVv8XgSHpFjcyKIdzI4Zbp9U1ZFFtaWolF4RO6laOyY15SpU//clTqMhiF9viAVWLGnQmy9uLvw+1RHZm+W4oXWa8TfctXvjwVtciG2EHNvJezvtPF2VozjU/tTSXIfBa2z6ek6ckdZMkj6SsQNvbuaizdkYCmkEQTAzl/MJREtwgXXeadqd0XHVtfoimWrqRFyE5/R6OxaEIhsZqxPXacuDW8qHEY/1JiR8zGOSRHQP8Gq3UJkzzXBEry1aZpIv4HfMP0zzNoYFye1oNnSmK2MBWnA66NvfnDxboRS4NSp/lo/qT/0dgpTcTvaauR8XVE32BSepcNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4w77+RPwlHbpkvDD+Ye+WRCYSCNKOL1Lw6/Zpg/dSk=;
 b=PbPWHiRVPeD0odSdIYagKGtbTzTa2mfhSXSsAC+gqNcCwKLmK/HXCnQT8pAOohM00N0E/6+nSTtl81zQ8Puh2Q8MHXdvQ4xt3SlO3ETeGa15pUe+QRuOgwslg9aa5ay0zK2R7f/iVBXFETsikPMwMFDMtQobEpfrEsg+TB1xQrY=
Received: from PH0PR07CA0108.namprd07.prod.outlook.com (2603:10b6:510:4::23)
 by CH4PR19MB8534.namprd19.prod.outlook.com (2603:10b6:610:227::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 14:19:07 +0000
Received: from MW3PEPF00001657.namprd21.prod.outlook.com
 (2603:10b6:510:4:cafe::30) by PH0PR07CA0108.outlook.office365.com
 (2603:10b6:510:4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 14:19:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW3PEPF00001657.mail.protection.outlook.com (10.167.249.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.0
 via Frontend Transport; Tue, 3 Nov 2026 14:19:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 046DC40654E;
	Tue,  3 Nov 2026 14:19:04 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D852E822561;
	Tue,  3 Nov 2026 14:19:03 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 2/3] ASoC: cs42l43: Factor out decimator startup data to an array
Date: Tue,  3 Nov 2026 14:18:56 +0000
Message-ID: <20261103141857.672537-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103141857.672537-1-ckeepax@opensource.cirrus.com>
References: <20261103141857.672537-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MW3PEPF00001657:EE_|CH4PR19MB8534:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 62fdaeb0-f510-40e6-85ce-08df39b56afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|61400799027|23010399003|10067099003|16102099003|22082099003|261102123227099003|18002099003|56012099006|11063799006|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	DF4D5p7hc19puUBahi1wjxZufidbJysvsOvWKyHYh/5PbTp1xPW/QYqLDhPaGKpUkH5ADgnwDPhZPNEFuL+4gyyJjgMtt+Qfur6XX5C30YBF1CTOB6paVYhh+12F+n8rQD+MA1eBSILo7dlCV7GNQZsfT3PiRDefNJnWOyWbn0ohg+fFUOKp8AlEWW0JyxK/8lc32jKv6ytIfVb35NdKX2J2+kbIlo7oh5YYue6dHXTxA1ZlqUpmYIaQ8LOVp3uE6fiwCJ7WYHOSZjGQG4qRA0yTljX7LAu6OvoApiQ1B56BezLHLvGMWoj29Aodq5hST4lEEEiYvTzh6ubYpphCm/b/JRitAkSIYgGBwk6sP5okPyD+0vaURfZrtFYlExWphK6fQiZSzUixR534NYXobQdLtZe0YXvswLAZHkRw7fUCpkdTXjKKO8SAMbDd7OObzNdXRopEfSz8qPxRS+GeVBQTrThu7AIGczxr3iVI3lJPtAaEZtK4vz3iXbMi/CAvt6/7YNVDTd+FDvonulX/elRwviLNxqAIgCkGImRc9N/TgY1Z+YlzBMi143WWX/pZ72tlAOpf/19PDFdLx/KiHRLa1d9svcz1TJ/c5wP9UI0MxVhT4CvfEUfxappMUFr7Uq+jlcDoaXzVnfamK7DCoOBttNBaYjte4UthdLZAbHgLqEZSQ8DPJjK3S7LE1R4u20kGz0TQYFfkOtTDTtiGNw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(61400799027)(23010399003)(10067099003)(16102099003)(22082099003)(261102123227099003)(18002099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yPcTGnsQ58x/VY/k45/dnWEu6i3Q6A87LwvbpGnOs+HUHC8lg+8CgHWUBUs5l39R0jsKfyllJV2iifLcxCOTJJOxywjXWhnw/kkNPlbtDge90HXLTup4P2uP17QB0LeA6d2WM/hRon5geZ9zpDZXoxRkKLs05SPbv91BWNJylsYgp76+4dyG0kFxCEJO21G4H0+1542oVL9qRQtzn8/YmOdMWYQLZjLpPMD0YkhKJc0lDyjvpnafzq6kfDtEFlLRuZg6XeT2cu3D+ZrbDDHX1kIj7Ybch/alDPV8ZEWAQAjcDFs3skh4vhQ84S9R/ZhT4tnBmzWnZBrGPeqGH1JbTqb50aWa8GhlpkSEQhiFRLA7aTkN+NsAbpdT/r759f3W3dX6D+PVgT+O9Eky5dUnfVdKsSMNiLjrmwfnnXWqDhX6GOHcKqPUDgKExJHudJ3v
X-Exchange-RoutingPolicyChecked:
	inP4nfW7Zc3azaljTksMuP0JEZTcahjKrUP36okV2aweX/8FKwrvAX1iHE+BVJXYHEJUbjjKx8UJcO8QMc/iH83MiqidOMMBNZuNn9ch6k2oFiVkRrJSRBoUucGVZX78A/piavy0nW0erFVfLGgUUhKWoDuEjsquKccZwToGOKV+Sdv+ZZ1BGNWXWIZek94XjrBozCCfup/0ocvKkKko0Az+Kx57hdLCf1qt703hB6pGgsKzOKwxO3/AeeDKI9d2gNrZtwmWt2RvKPrDAjl5+Fn7N1HgmAPAjy+NxwXsnu6EsXwhEru9u+xNVrDuTAiJZJy7iPrEmC5RVerkqi0FtA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:19:05.3440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fdaeb0-f510-40e6-85ce-08df39b56afc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW3PEPF00001657.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB8534
X-Proofpoint-GUID: qFM3ukvVBYxG_BnxSHEYe0gY4m9-iChf
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6ae9ee38 cx=c_pps
 a=eCb8aTw/9lghk0zZp47djg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=OYnTXKH6LEPfpXWJz2MA:9
X-Proofpoint-ORIG-GUID: qFM3ukvVBYxG_BnxSHEYe0gY4m9-iChf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX6N9m3ieRbs9H
 8VJvLOY4NeznVbZuWmZAW75kN4Hp1O41EBLV2eveJ6MrX/vshRB7OIBwC5bOl1JbcWv4wZUwlGL
 tdGWd/2HiMqmLuiXTm5EtfCrkVhVLr0+huzRS5QY4Bszo47K3A/QIdnzHjFQ1m94OZRUpxcQHnq
 8wez0G2cvpld5BYY+oFoXmTf+tKiRjHjLNcLzQobRu9jhHnnIxQn7T10LRSPwTkSGyj7pAIJN4Y
 ZqT4wURRHg4kv42gYk5NJIcHdM4SAJeB+mvIzWFXwkiE/UBSCvS6Xq0ZGshBucOdnUegKHshjG/
 YFSGQmw9gzAoYhceolLOn2YN1ESXAY1l3tcICiWTR3V/lgziixOGSajJPrbgplWGjsvLyy+7/pR
 XGvvsyt18NZfO4UuAe55m6vTOemTiatuCeC6Pp40ddEAjt3UW+f8YAtljuPTkykMijpKqUq6icc
 zooYrT+DbPmA+3r4lQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX+JFlP5/0ChR9
 CAl9cDhjrP2CIEzXmcMZ35tbEptIp/pEOZ8KaqixbcTBOzmq2ADxFsS124QtzHHCtZsOaUOytR2
 o9dklPQnOSjdsp0jT6bsuT4LMHkaWnk=
X-Proofpoint-Spam-Reason: safe

Rather than large switches factor out an array with all the data
necessary for the decimator startup. This makes the code slightly more
readable and prepares for some incoming improvements.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added static const to decim_info arrays

 sound/soc/codecs/cs42l43.c | 150 +++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 82 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 90c83bb33d69b..8fccddf7a1b22 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1736,97 +1736,82 @@ static int cs42l43_hp_ev(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+struct decim_info {
+	unsigned int vreg;
+	unsigned int vmask;
+};
+
+static const struct decim_info cs42l43_decim_info[] = {
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
+	}
+};
+
+static const struct decim_info cs42l43b_decim_info[] = {
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		.vmask = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM5_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		.vmask = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM6_MUTE_MASK,
+	}
+};
+
 static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
+	const struct decim_info *info = &cs42l43_decim_info[w->shift];
 	struct cs42l43 *cs42l43 = priv->core;
-	unsigned int reg, ramp, mute;
-	unsigned int *val;
+	unsigned int vval = CS42L43_DECIM1_MUTE_MASK | CS42L43_DECIM2_MUTE_MASK;
 	int ret;
 
-	if (cs42l43->variant_id == CS42L43_DEVID_VAL) {
-		switch (w->shift) {
-		case CS42L43_ADC1_EN_SHIFT:
-		case CS42L43_PDM1_DIN_L_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
-			mute = CS42L43_DECIM1_MUTE_MASK;
-			val = &priv->decim_cache[0];
-			break;
-		case CS42L43_ADC2_EN_SHIFT:
-		case CS42L43_PDM1_DIN_R_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
-			mute = CS42L43_DECIM2_MUTE_MASK;
-			val = &priv->decim_cache[1];
-			break;
-		case CS42L43_PDM2_DIN_L_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
-			mute = CS42L43_DECIM3_MUTE_MASK;
-			val = &priv->decim_cache[2];
-			break;
-		case CS42L43_PDM2_DIN_R_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
-			mute = CS42L43_DECIM4_MUTE_MASK;
-			val = &priv->decim_cache[3];
-			break;
-		default:
-			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
-			return -EINVAL;
-		}
-	} else if (cs42l43->variant_id == CS42L43B_DEVID_VAL) {
-		switch (w->shift) {
-		case CS42L43_ADC1_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
-			mute = CS42L43_DECIM1_MUTE_MASK;
-			val = &priv->decim_cache[0];
-			break;
-		case CS42L43_ADC2_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
-			mute = CS42L43_DECIM2_MUTE_MASK;
-			val = &priv->decim_cache[1];
-			break;
-		case CS42L43_PDM1_DIN_L_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
-			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
-			mute = CS42L43_DECIM3_MUTE_MASK;
-			val = &priv->decim_cache[2];
-			break;
-		case CS42L43_PDM1_DIN_R_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
-			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
-			mute = CS42L43_DECIM4_MUTE_MASK;
-			val = &priv->decim_cache[3];
-			break;
-		case CS42L43_PDM2_DIN_L_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
-			ramp  = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK;
-			mute = CS42L43B_DECIM5_MUTE_MASK;
-			val = &priv->decim_cache[4];
-			break;
-		case CS42L43_PDM2_DIN_R_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
-			ramp = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK;
-			mute = CS42L43B_DECIM6_MUTE_MASK;
-			val = &priv->decim_cache[5];
-			break;
-		default:
-			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
-			return -EINVAL;
-		}
-	} else {
-		return -EINVAL;
-	}
+	if (cs42l43->variant_id == CS42L43B_DEVID_VAL)
+		info = &cs42l43b_decim_info[w->shift];
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		ret = regmap_read(cs42l43->regmap, reg, val);
+		ret = regmap_read(cs42l43->regmap, info->vreg,
+				  &priv->decim_cache[w->shift]);
 		if (ret) {
 			dev_err(priv->dev,
 				"Failed to cache decimator settings: %d\n",
@@ -1834,10 +1819,11 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 
-		regmap_update_bits(cs42l43->regmap, reg, mute | ramp, mute);
+		regmap_update_bits(cs42l43->regmap, info->vreg,  info->vmask, vval);
 		break;
 	case SND_SOC_DAPM_POST_PMU:
-		regmap_update_bits(cs42l43->regmap, reg, mute | ramp, *val);
+		regmap_update_bits(cs42l43->regmap, info->vreg, info->vmask,
+				   priv->decim_cache[w->shift]);
 		break;
 	default:
 		break;
-- 
2.47.3

