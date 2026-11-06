Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793957827;
	b=UIhmfIuiUq7Ce9jNTVl/1AP9/OqTBWjEdxAaVLSqFWUY3nEkoBU/yowd3H5FuhrCQWpx
	 hF9hnvo0Gh8zQdww6r83/yA7C4sQPWriM/Hh4YN+w9DFDVEl2ZlrWKbEjD4B4nCP52WCP
	 jQ+R75YNKSDeZAzYJcWiPfEMJlgijTsJXZ1JeQflM7os2itsZZbRo4MD3MaFnz98t019B
	 Me+fqezsarqZTXxO/tfU7qlAd/3kWx7vZh/v+UIY6vEsIOocOgFbik2rcN6Br34Bjiu5j
	 D2l2NwqNWF5tDwPV/82BaF7rHZC2rLGhZVif408zd2pZNhb9z4OWCe2Xwtdeo7cjewA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957827;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=NPf/baIQF/TRBGCG2auYE17eN8KZ9++FDuWYe6HcsfE=;
	b=Bbgav24Pt/xlFdlsgz3zUS/7UQbmnA9tTspS1pNE/4Hcp4lwwcuPwEW5dK0832aql/UA
	 61YpBahkOvVTOuRaXd/LHs3HerIxAQV5dhmiDxWOd4xKl8QJwAnbOgjEaarPZEosHv/h1
	 /SuLVLUmiJE2kdyNcP8tbIkGE9Fjp8w8L1abmBNdUxbUNdwe2/iwYz7PO+9lgmBn3kcvE
	 Q1Eaa7+adFAkO2C1KmJP0JfmafytJLLTuj0pdSTgkTX/uN5+PX2PrGOdY4T2sOlJmanUr
	 2/57QxxSLnyaExyrNXtIKIfjIDd68NzuZ+iiGi/1CwtYeKd8ESOvwEzAYkxl0F1itqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=MlNBOapU;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=LSlLHJ1f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0104F606A330;
	Fri,  6 Nov 2026 09:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0104F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=MlNBOapU;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=LSlLHJ1f
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Nhuwn2819677;
	Fri, 6 Nov 2026 03:36:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=NPf/baIQF/TRBGCG2a
	uYE17eN8KZ9++FDuWYe6HcsfE=; b=MlNBOapU2swBRF7Rn+Ju6ht7KTugPwNkKx
	znmh8fpwounQDEJGhCLEAclU3ADdRiFsJuIPbnUQV3+3cOfDRfJGExXA183eRDvS
	b825yDXOEjZtftG9ECNeWHIrudursIdwosFwxdVd+iqLRr1GnObDYscAz/pBX+RX
	mRbdOujLqxw8uv+BUol2V837dkReSdHAAwRD2KJGJWpCvuenMx2Ps5JHf5tJJ/Xi
	zlTZ1IfsOmEmTHRDIvINEBEyjnmSIJeg2OFfA8uSuWVA1F4E5HE/mH9Zde6nbM38
	ixLwLwnaVuMp9NVbQWgOWivQ1TInm2+aVk1KDesru4yPGoKkLuEQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020089.outbound.protection.outlook.com [52.101.46.89])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hs3qwgj08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 03:36:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFQpgPrjqg4In+UBa82U+icJ6g+x9uFsgRAnkhE+kjtU08oETgos2Y69RrsKU9ebAeqnlcy5yn+BPxN90fC4FYwdTs8bepv+b/QbzrtkIywWYNVmfsdQxxpDwiyn69nHQr3fMEyI3f4j0lA21UeC33JlEkYL7WBiHGaudS97bMG6bjDdIJUbli+d68IT394qk8wCHWMdZngM07TzdYZXgXtgrLZ/YmhwAyCT2RAw4kwzHBk312KPYk6DZnxIbATCTiIAgHiIAN5pY66VajfSS8DYzlp2Tht/OK/y2+IvhckcTkbFpYUJtZyZuEnJ1rL7UDEvwJVY8d/1jsIAPo7hzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPf/baIQF/TRBGCG2auYE17eN8KZ9++FDuWYe6HcsfE=;
 b=aatNx3a2DwHJzWCArz7bmJ/6VfeVLXVlgTgm0GirbuXNwXaSla6ozs1QjjbbgUj6pMNZU1QQ1+n0onEbNSZOFW8l4QMOlHSqgO17dhFbfS3ZzBo4VPDsdo0Irs4YBiqo+sNzQsu2R/Yk716Deg8d/BGx9Mzk7gZdIoN1NWEkazOs8aMEd6/2Cb4Why/xikJQiRztMZHiDAxuPo8afslNSV2K3iB0CP7ZvZ0gbUI5ghCSRtnuRyiZbYLEenbGtUXZ4i8PVPpRZxi6hC15mBh52rfD4R+W6aL9OfDzQD18bn+VCl9+6h1Gwqt2WzhhEfI5L2vgJrxi0tg4oVcnV3g86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPf/baIQF/TRBGCG2auYE17eN8KZ9++FDuWYe6HcsfE=;
 b=LSlLHJ1f7gARLpwDjNmT93KMk8DZAiscws52welgcir1vBV/wroFHqxy/FeAwZk6Kvo7h9mFjZQfQoOC9Hi0neEx9IzFCt+YaqWQQWtowceuWaQBmfAYAuUBsmR2oy3GBOrTSbJu9UPxvG0Y2qTS/js/9711rCM6fiBX7uf2F8E=
Received: from CH0PR03CA0372.namprd03.prod.outlook.com (2603:10b6:610:119::10)
 by CY2PR19MB502255.namprd19.prod.outlook.com (2603:10b6:930:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 09:36:50 +0000
Received: from CH2PEPF000166C2.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::9c) by CH0PR03CA0372.outlook.office365.com
 (2603:10b6:610:119::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 09:36:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF000166C2.mail.protection.outlook.com (10.167.244.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 09:36:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CBC6840654B;
	Fri,  6 Nov 2026 09:36:48 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A8AF7820273;
	Fri,  6 Nov 2026 09:36:48 +0000 (UTC)
Date: Fri, 6 Nov 2026 09:36:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH 3/4] ASoC: arizona: drop unused HPDET accessory ID support
Message-ID: <au2fr69ZCkgrEd+t@opensource.cirrus.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
 <20261105-arizona-asoc-v1-3-25ec7338446e@gmail.com>
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
In-Reply-To: <20261105-arizona-asoc-v1-3-25ec7338446e@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C2:EE_|CY2PR19MB502255:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ead258-42c6-44cf-18e0-08df3be97c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|22082099003|16102099003|18002099003|10067099003|56012099006|5023799004|4143699003|11063799006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	wS6zbmbJ9OA8H6tpVmXdhz8hO2nswRfhpXZjXQNsIPFRtpxKpbpnf8fgaiXWbiPIEavfUT0yr+TCrRrjJ2MVnBFdA5TPXkjUcuf953UPkgiWiGp13bzdMFu6ujTHqUNGxjbZ6zdhw0JDBmaq10TOSiWegVqhdcvqrwdDnXTdWR5/UvKgqGOMsSGZiY9fKD2KJB4H8fX5l3T3yt+8UGOIIalFW7GCp2okWO9toV3RaguFYx3NSUqCzRHyiLymS5mC4CdAiYjpM3N6rjzA4VOHrrA9lETS9g1IhwWr0VeXfe4zVVZu6xq4hF28AlPFiVIv55v5tLu5tAEm9loHRF4PCSuNXGsPe4AfZvVKacHmLBol7ZyWKcq/e0u0wPEdUNhiNKzcvHGHqOxCQYPF35EJz4YUpWCRr9OJo84+B1vKBsmxoouRkq4NhsqpodjtWMZV4U8MMBMjHFwxUELtROXFzRVRIUQcfpJ6lM7cmpETIkXSRIGehhyuXV37nwjj4uPuRQGQt/fkbjfpx3GSFcLHP5BMkpqDXP1deF7fVXTWeIQDC3GQYqeEtMokIm4qbGIzm7EJQJcfMCTP+HEV1wgUWUr6yov7gNljbY4TVZ+qV819uhOqytSNyRzJYc2GEZpkQwguo8kjSpQ8lGAFh4Q1DHliNpc3o4zOQQNVZDsRAdDUlX1QTSzzjt85Bmr16idmqr7taC7TvbpdfYRgOSC5EQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(22082099003)(16102099003)(18002099003)(10067099003)(56012099006)(5023799004)(4143699003)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zOl00WceSuq7CCTIw589/qRRp9ETKCslvW0XRI65VYkA1YX/yGM/bHecmIMZdUj850I7LP8NAp+q7XKZ/5xXqsREfO5UI7Xj2cL0ENJ4QfqmNPPs7l1Dg9cNBuaif1Gr9SyhClxOh7rl+nYIxV3+LWY2OMRLUVmpt6P4pnnr4mvPM/nMkyRmE0n6UX5cgV7XVg2iRsbCdVCMMoqUnKRPa+BIpOnFhvsxyFn1cz2opRS44VkKBELHmXajHD9mWT5Jx8EukNauWGwJvL8F131Xqfy9apvLYXz6H2Tovp+YNM2ps7ZJFaiOxFFHmUet95IKab0+oDOKnN5RWM1IOUAT3X7oY0qdAu4Oe6SkWndtDoFWYv8ZI+/51QHzm4DKE2zQA7TNvfhYi2HTabL82CLpNdRyKLsToygCSDXYVP6HjCOTLXnzKG/2dagBfLk6Sc5R
X-Exchange-RoutingPolicyChecked:
	ev+SGXGBtuXUEslngEYLSACxFjIe6ZckmjzwE1pweTtXY0WBv6S/XkvrlbZsjq5PaZT3YBj+tNn5aCuPv9PHmF18U2aa88phA2DkZOY6mXofumh1vpvfHcay5wRT8u/xj7PzRSdzJShbTsimWIoXOWmSE/sLgeEMant0gar3yHrdaFe5j9AGTdcGHBB5jpuBaXowFy974KqWdgPoo79/L99HVgHvw0l8ioLAz5z8/URqQf49ABYbsvtFXDfuevWF6uj8stTQ/dFTmdh2IP7Tk+bNsflhIZLv8pAFHko0UYSW81jMg4x7/XnnfGVK+IUHUBWzYaA/acQGogjT5ij+oA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:36:50.1473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ead258-42c6-44cf-18e0-08df3be97c02
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF000166C2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR19MB502255
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX/CXrM1lDV26K
 mOQWlRy5sYWXoPJjsupCPoHhAByCNQhqrv+hA5wUBIDdBEIEFSkWcjwSZyWGonIa5SbKrtIXSBX
 ZZgaZOamzNZk5g++PIH0aiyyUVbBRc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXx7PvJnPA8/wK
 hoiyyKuv+lKhHb+nFODeZTeVK6dUSKnolCtJ3BrsN0AeVWcBe/rW6tvOilUVOwfaQD1Ls4M/JvY
 D3p4dmj/NFCw4/KLY+CriVMcXQptQUMAfWjP2gEoLvm2Yvjkaega4HwOcqNwC4lFo3EEiEuIXNs
 vIeMy1dXPSkK5ZrpaKkH+4Eep6+lE0uvvXGhpqc/jDAKAHiXYVwv1xm2gP+rOE6akdi8+phg5Fw
 bhzcvPdfirAVw8PWPijo6/6UL2C+3ROLffhuYfQb6hMyAPVcaYZQaGn/ey6ESF5PjSv9D6l2X4k
 MbnU1nN4aNPE9jLKXjkaOvl461sbGUJsyq7zPM2nM2PaCHwyWt1WpO+sSObvhpN5eAdL2VvgCYW
 NcJe65w1XKvbgXhh4Wu3zQOOZ6jhXyfwKEcM0KNgDDpYV5KupOQbHGnDgTUdaslYny7lJQ7g9vJ
 H5Bs1VxEa2lCYxQdwCw==
X-Authority-Analysis: v=2.4 cv=K5K3jCWI c=1 sm=1 tr=0 ts=6aed9fb6 cx=c_pps
 a=IMEwmUWWSCLuwm+xmU4zLA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=hDXC-7HyPgnzyJNeKeIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 0JlwdvGpPFHAKrlpxSOagX0g-9_elMbR
X-Proofpoint-GUID: 0JlwdvGpPFHAKrlpxSOagX0g-9_elMbR
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 05, 2026 at 09:39:34PM -0800, Dmitry Torokhov wrote:
> Nothing in the kernel sets hpdet_acc_id or hpdet_acc_id_line in
> struct arizona_pdata, and neither has any Device Tree or ACPI bindings.
> 
> Remove both platform data fields and all exclusively connected HPDET
> accessory identification logic, work items, GPIO lookup, and state from
> the Arizona jack detection driver.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

A little unsure how to proceed here. I certainly wouldn't object
to dropping the added complexity here, but I think this was used
on a couple out of tree systems. I am leaning towards we could
probably let it go?

Thanks,
Charles
