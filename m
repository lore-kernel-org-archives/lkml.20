Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2224F425CC6;
	Mon, 14 Sep 2026 09:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379383; cv=fail; b=ZocSE4PzdBabX8DVvIlJt3/F6JG1NQy4iiA2iUgmJcupZQpnH2Hn82uJTurQIrGfxkMsq2exdQOBCXvFbGN1QfQBc8oF/XOOixfk93x68FFbS+q2rvyhoiG05e8CfJOKVIhry4zCLKEoJl/bWW7QbYZSjbBXaZcIPPUqQxkYvvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379383; c=relaxed/simple;
	bh=n0RPLOqr26OexMpFWsFbodeGHW/R4DBSTjst4IfWz98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTIlqIbPP2p7iQQgInt87p3BoWAKd/0tzH3slCqsomrNVvITQ4xjDL80u6pkBZADcmvTYzYv+QJn6Iipd+J3DK+oe40vznKPT7T17D/bRNAesnjQoW017/DimDHBLRuWGQBha0hu0R4uBnNfzP5hmiw0bvLocmP0VD4IuEaJXDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UOATDsdG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yKkvu0e5; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UOATDsdG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yKkvu0e5"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E4CV7v218593;
	Mon, 14 Sep 2026 04:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=h82E/DRJ/UndDq0YDl
	ZZ7LIyPWDAo9HOTpFdvZtaIuQ=; b=UOATDsdGwJZL64woNtU8G0ExRqZRrpi90b
	RxRTXFeaR5Oo7Is8cCoJbant+vzLE3E9c933psPor9jtRifFTF1PVVczKbGM6EaM
	mKNKZDdxNeYJII0dgmDFs9LARfztBGub7de1hqy/210hAs31/ZYhiFR5erSCa1wT
	0rSa7e/lDhpYvkgHU0iO5dyIVSoYI5YDQxtY4lqfHB5XE3AFajIYEJJOmqL7J9I4
	n1N8BQnkukIBQqppqJLxa8umVr/dZokqcN3cTwTse/fRReaC3qctj3Q6RWVEcPyO
	i/EAryMA+Qs9WBAzbnvVXcYcz9n9SDcwlhsZfulEKQQhobKW1VUA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022133.outbound.protection.outlook.com [40.93.195.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35h9p7d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 04:48:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsXNJT8/wYcczkuc/xsyMGNeqc8l2rKiHVWVX6Ml4tE4p4kiPnQcfAcB6Yrvv+p8VOr87g4TIu1uKEBpv+namJDBZieDlsVNmQL7Od1ukxskYtcpxSWmyafgf0BHFwoVGsfakiIrACfPyGN0rF46oZw3nedddNF05Vj1LyhdeMldLBqm6pKsfkaGuGwDXLnnftPUqn34uywFBL1LFUnBhjP+/2jv4ysRBWaouE8D8oQXQKXYYO4YR70gySZvrWVk+HUbxN6BC/o0YYDSbDn0tB/Y2Fs+mfT8eGk0KuPATkI0JX6CwdNwN3E+sNir2AJ3fwrCpoyrX+VTjT2bC8rP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h82E/DRJ/UndDq0YDlZZ7LIyPWDAo9HOTpFdvZtaIuQ=;
 b=oFuOh8S/nHHcULRMDIhmX84YaZWQ1UhqePWAADg+c9ZbhS+l3FSBaYuZOa2dbsaPYz120ZYPTc6s+Vlc6gqtruIedtqFYk6Mx4QfLgTzb3G1XGV+JmwtjP9kvXzUfq8ojov9w83eVAn11lmoAyePhmP+czyIWHxUcktwj8WcI+Qg61TJNQ6U9D6PQ/Qo68DBxKa491pG236xcxS0x3H4cxLVGlyYiD53SLMyQ6IJHz/8RZ1uXenXbQCpwxWzqA30XiLtzLeg6lJGkTrUH+E9LloSagZHzq1VoVXsnylPUFSzR3UDoBXpgH/EzquPDV8fmToyPEm6lN35HZVMUwE3/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h82E/DRJ/UndDq0YDlZZ7LIyPWDAo9HOTpFdvZtaIuQ=;
 b=yKkvu0e58lSjyk9CczUKxucFIv1aJyWxZDRq2+TseIGM7RjOd/VIF5+QY2h816BDHKyNdkQE6irr5xhmi4O0yYRXWiLnMfGBxSRD3zO1zAM6Nf5Gj/ykQAo2OM0q6bKFUc1X6f0TORXub9XcbiFesHuK45Zuy2qWOroWLc6W1Po=
Received: from SJ0PR13CA0034.namprd13.prod.outlook.com (2603:10b6:a03:2c2::9)
 by DS2PR19MB389619.namprd19.prod.outlook.com (2603:10b6:8:4e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 09:48:32 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::26) by SJ0PR13CA0034.outlook.office365.com
 (2603:10b6:a03:2c2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Mon, 14
 Sep 2026 09:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 09:48:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B1F7C40655D;
	Mon, 14 Sep 2026 09:48:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 90677820247;
	Mon, 14 Sep 2026 09:48:28 +0000 (UTC)
Date: Mon, 14 Sep 2026 10:48:27 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: Use consistent indentation in the
 example
Message-ID: <aqfC6xt3QoO5Apvy@opensource.cirrus.com>
References: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|DS2PR19MB389619:EE_
X-MS-Office365-Filtering-Correlation-Id: 76460ab1-5596-4eb0-cec8-08df124555aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|61400799027|56012099006|11063799006|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6HKI7SWZjGRKWW2vlEFcGrON+i61FhVTpvj4glN1oWKyGm/tNnAb+m63QgYRBjTD/81HbAImCUk8YP9JwMWUNDQNwEAq/tF2svtI82U8Pha/NT0WNQK3Rex+cpzjV+IfwIfN1eVqIT6/NQzzCukik5ju3WO7xwftXMQY8wA8bb7tGZI/czY8DA16PJ/Xy0hauiWiakem7oUiB54M/rWmJ+Gsfe+sDuOq8VKnXKQfJu/N5edmiKMwzoeS5lK1CJ2U4aVPfrtMuEpkzhSjd68UwwjX8Pd4GfyLkxU0C+X/1YZxKpoWfk0ff1OIPV+PMIrfq46aMm057RNHQU1zO3T7S4AiOLNeZf2/t+5f449RvHXjD272a6gOtdfy9vFoLPIG1HZHDWajJQRZoujjxAMBmHs35aduLul0WNsZHNEOgIuANp2kNnNJEaQDDghJ52UVuXU1PhJNvVtV8uE0WntyMu0gW36ddqqiacJZb7LCHn8llRIgSLAgb8GhPcJXqkgZcg4ByUfcCKDqwlrpCP4ABhpAd7OFtP74bS3YwrjhRlHAxdbuO9BcH4+5kLm9JaMOs1BzrWKqzIQftNfaa1pyty4GvoXGT2lTOuhtB5PYrYr3jHoe9H7V7Yky+J01yGedKi55Ihi9l7vzLbz7oxEONKWqG2jJ6Ti/o3JeuuWKpE8lUTY1/DbM0DB0tJmIEP8ljjie04ex5yoITtCiHz9qUg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(61400799027)(56012099006)(11063799006)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xBaLHAd0dZUYSYaOey7X9fiJA8mVSkHSza8XsF7rBkWoC84F0/RzCGm0FXfdn4FA/1Es6H6xN93w/MWO3bw24kaCqO2cb1h6W/iyx6GwOJlhwMtBT3oSMO30cX00v64JWFWkmybIEeVX8soOppyeWwB5F0IfK1HbvymolJDqgVwXeoFsVio3B0Jr+OcoN+wchHjErUQdvioqs2YPDzf3kbQdpot2jjP18NP8qSFJhBOQjW6aO688PwVyr6fd130YoNWbBNgdSEm/9JnGf0g3eYPHacBzE2D+wog5ZoVonlK1URuapX2Zjx3/uLJWmLXzPTaAHOHwYTR/o3VYrrF8Sfx1LkjX1ijfwOJ2bKozSJ5skhhZt3AZ+9AlNZtWR6HxbiwIx2rW71os/f0n6DQ2OIar7J1zEWPaikVomrQImju0ZHUls4EDp+8JuaEKRTjg
X-Exchange-RoutingPolicyChecked:
	5G4ggRgilKNtU7EQ+Fsp43N65pejWyetoxvAvNtOs+HjNRqyXYUISQJbvA6sqApuz3jXemPoPgVy+z6oVmm5Q43WP6e0GX21MO/Bo5O68zpQT3h8foBjEICjvPmNDmiFK23BBMeG1nMDvRmxhcJFWkEr2O9BbOedVINoFX5Y6G231V5sy70MJYEGL3IE+JrFzHfER8vUDDTINNJ7XxuW+VPa0dfGDJ0g/Rmjb08EC32zK6ssuzOV8oamvMF45h2o8oT8iqStJOmhUjxd4B/BGXSACYeZf+w4VHaW/ew7TQeP/2HWpMyEYdSe3WsfNgk7l6Wf+5pvogxNrSMlVxy4tg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 09:48:30.6286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76460ab1-5596-4eb0-cec8-08df124555aa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB389619
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzOSBTYWx0ZWRfX2p4csdhHvMrt
 qrdGDXMAUcw1b2sEIvj8jHF5GbDM1Z08X8Sp/dt98k9u8NWqrRvmRPitzTUYQt898//iNskR+8w
 yvbP8fQkoDn1Tr/cwlH65FFsAGrgZ0Q=
X-Proofpoint-GUID: 8UAMMOmfmpMJLtQrmeM-WYlT0Uzcoxnp
X-Proofpoint-ORIG-GUID: 8UAMMOmfmpMJLtQrmeM-WYlT0Uzcoxnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzOSBTYWx0ZWRfX0DgxhI1x9xSZ
 KH3hBu1srrXiQKqpzlNUZTcvJxO2wdzacre8NEi5EqxE9MYeF/HFGlmXYXkEyGgC7VPZATk4mbJ
 s+D2cktXhDW6JOizAqGStunowOl/rJqMLmygyKP9a71IPW9aN450VeCAlzIHWC4g7MnSAAvV9hF
 +wvVOxXB0ly74r+mBn97ES7glshLMe4d9MP6GiKRMbXT9lJZfcxwdIaG9Dohp9V4BGrnon6VmnD
 Anwtkhq5ZWf3KmftWaoEimKzL85A0KHqOwCLBhyxsOvAtrLtgjqkWulrJnZkYpnGbyFHlUKpFHK
 Gd1rX0bFAgFkksMI/+cb4i6/3U0cfrHYpg6DznaTr4i+wP6iSj4AYzpIy5Hj5vPPo4e1BEIwqoF
 0t6krRQ1U1TvzJPoonzPBBr/3gKSLC6BhMIsAfl7VIBO94ShHk6vVhzFd1e2TYeYahu9hr9IR5t
 n3mT0QGYlJKYuwffuaQ==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aa7c2fa cx=c_pps
 a=OPAOkIGUrGl6b3ZAImYRoQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=6MNK4Np0iOagQr2kdRsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 14, 2026 at 11:36:58AM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> While changing the lines, correct also node name to be generic in
> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
