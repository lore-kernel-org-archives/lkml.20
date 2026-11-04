Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793809639;
	b=2mKirTUpWQobC9nKG2CWuaN2xJ8mmII49goX838ARK65XPBAx8BX7HVNAYcoUVe9WHKG
	 ALDarsNI9+flcsY8pUkPfH10vgYJcqqBpxgQ1Nq+YZIAI3CSxzl5n26Bd/TG8W4Eez04E
	 pm4y4dLt6ACdySu4upzvbFmeAiYDnJy77TNecJsKSpih1UArgKam/d2uwZyNmepklCMUH
	 bAHwlsJqPdgS+V81rj3/oG9pEP5SYDblRHBZv2VlKihNEUBfMnSqMGhuUjjCVCDunOya6
	 cwfU7Bo6ml5rI0TB72AFdHEnMVzLtSQWwsYGcFx7pfMtA4wFU34AoBBGQTQClu5hJbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809639;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=wIRMp3JMoikdPfcRxHgx2ZZmHA9adyxy4zn94Ld1cHA=;
	b=2HeDInS1xSJdqLUy/FuwrU3J/LnHqHeyh8h/9Ek9P6q2H0k3PHBYQ8/nWjxuZRn4fJdG
	 lNQDTNK3ILtivrJt2I0B5B1/vsFRfVv32UoFThKp058jKmyzCLynqI34VWTasFHERTjxw
	 9XGJyVNid0XJkMA+gNsefZYoWvnD3WLVMOLUpe3+X5I8XxZQ8cXCAjiAHu0uCrkldQ04T
	 51cJASrkjenT1i/VENTj9F3MYGrhk2c4JHapvnjyxWFIA2tSBftkConDVK3jmfdOeIDTR
	 jB0aKA3CvF/GZuQwNRCnz6K1KxoPZf72kbUoTYBepSJiDfIQzxethEOzvVq+Cs1ZyAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FTycrXao;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=xLO1kpcd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C8D606A326;
	Wed,  4 Nov 2026 16:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C8D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FTycrXao;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=xLO1kpcd
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FdPN43660112;
	Wed, 4 Nov 2026 10:27:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=wIRMp3JMoikdPfcRxH
	gx2ZZmHA9adyxy4zn94Ld1cHA=; b=FTycrXaoEjqW82ae6OnMAOawmv7sxlM/mW
	6aVdxoN6QPGzMI+IulsrKubb6w0bLQcy0OSUyVH3mJ0g9acYvk1NcRkqFBwE2cTn
	o94VUpQvaIhPPm6xwDlPwU9nmwOX56D8ZaCpLxIROFdLTZw/D97o/wjIKzvY8ZSH
	GTvR13A/CeuwtSF7e+aT4MGEQ8UV0Fc4Spf0UI4R2SlbinGq8Dc+OI3YObiEMYf1
	fQXF74Cy/E96sGyE0iapLNmhos3qc40nctH3Z7TeQA6RULx0vMR15Nhkq2LrT6uv
	j8Qfi7MTbTD+fgNJY25M+wulLwwegZXQH0lB9zkq40ecLX8tF6YQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020125.outbound.protection.outlook.com [52.101.85.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hr7c783ne-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 10:27:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOGmcJiWKk3Wiz8Djcp+oXNDgurzp8Oj0YSjypJNDjYh3lkCH6jqGjZmEbx6Z0v8i2r5/LiqMvnlmlIBOF3Ea0VU6WcWgenVwkZwCjVwly/v0r3amH55vPfD4t36ywMomgKoIj2aOPwFZsSOclxKX5ihHg8701yxWh1DIJ9D6ehxxSGhawaHHx0BO2UdnSPwX9kkgTgOxX8H5lFCzsusaCoCVlHRmiWyflG0CAlg+/plAGy2MCFeAywOJgAhOQAFoWdOX6FN6WM4/klL42mr7YxlsFaQQUoN66vMUQrqHlZMBXqG/YVi/kq91po5RwY0BTyV1KCyCNxaVDTCyhXtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIRMp3JMoikdPfcRxHgx2ZZmHA9adyxy4zn94Ld1cHA=;
 b=t4wknjsusbqn3MA4AFJmdbQ3v4h9iITKe44xIBzjWSWy68zW+notgTncuIuanXhKCFBaoeibXeXJFwMZnkoNtQ3MeNQs9FzK4Ts0C3pg/qcV9Ys/he6t+zrA97qqkQU658bdmpDpnjX6NiKVW/UjNZks5eAQ/8XO3s8LjfSM2wFHBomv/22tA1VYOUtsDPNKQS+oJ7MEbBkJ0H2QNc/OAl+k5LTDxPnT5yeFQ2w9p+bdRpGHYUVfN2iwdaXuqg7ZQUk1JBiLqqD5PlTrMUAgisF+bckJvuL1dfqzgynqzl4KZUsT+6pA76tLii3MEU+eQRIAAIbtM1ffjtNxkygoYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIRMp3JMoikdPfcRxHgx2ZZmHA9adyxy4zn94Ld1cHA=;
 b=xLO1kpcdQFAz5zKgVLeOHtgHBYKr5vdBQgYt5+LG6hzplenko1N9QbFQ3zZeIi3fX/WfADJ6dMy7ZS2LM9WEuLn8qvWdqQOJuQ9QGaasoYYLX2EmcwBb4xtqopCVjN7oeIKGdB7R7zqJXxto3AwObStS+s2wxQbM4DjSOp01ST8=
Received: from PH8P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::25)
 by DM8PR19MB5286.namprd19.prod.outlook.com (2603:10b6:8:1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Wed, 4 Nov 2026 16:26:55 +0000
Received: from PH4PEPF0000B60B.namprd21.prod.outlook.com
 (2603:10b6:510:2d7:cafe::4e) by PH8P222CA0012.outlook.office365.com
 (2603:10b6:510:2d7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 16:26:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH4PEPF0000B60B.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.0
 via Frontend Transport; Wed, 4 Nov 2026 16:26:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CDA8F406544;
	Wed,  4 Nov 2026 16:26:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B536582026C;
	Wed,  4 Nov 2026 16:26:52 +0000 (UTC)
Date: Wed, 4 Nov 2026 16:26:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        pierluigi.p@variscite.com, alexander.h@variscite.com,
        Stefano Radaelli <stefano.r@variscite.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linus Walleij <linusw@kernel.org>,
        Kees Cook <kees+treewide@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v1 1/1] ASoC: wm8904: Enable FLL when switching an active
 SYSCLK to FLL
Message-ID: <autcy3Wqks3Q2WXv@opensource.cirrus.com>
References: <20261104155832.57738-1-stefano.r@variscite.com>
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
In-Reply-To: <20261104155832.57738-1-stefano.r@variscite.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60B:EE_|DM8PR19MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: 887da1b6-f089-43f0-1bac-08df3a90708f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|61400799027|36860700016|82310400026|11063799006|56012099006|261022075727099003|261022105027099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	/4uc6ZKncooDF7AKwL2MJsiLH+uPLpJ7qARFha3SKn0YZKCVFCkbKbsCUq9KzxLDibQDAAZpvnj/tv5lAWJAjU+M6hZ8+9t6qgTb8X1x+Q/AamSwozqxSMhGo/wHPN3PlsaGz19vsr5FjgByC0hWjw7zhDTyoHxvxbGPcrz8y01Q+7ixYMStNHZQB/KGaeGJB1OZKu3msJ9txZJaNNzfI64gok50oPr6jat0nG1SjS5TkygDzxDghq2gFfQG7tO1eXolbl/L5t38qZyESiM0mHC2kjcqlA/IxgHSqJ5xAd2e4Uf6AjkYo7aiEUJPj3C74SUe3GLLb1TcIU08Nk/Uqe6UbSypLKi2zhcHsnkJMi0xgVhAYbNKgqCvrvZWVA8VybcdG+3/NZl5cAsQUyUy6TtNSnCSwLfj9DZ8u8kFO1OFKr5M+DKwF0qbG4IZ3AjyxqnASZUUDVVly/Zf1QqMds52oKA6iD2lsfwLwHzKIjKrZzOYknQ2YyhQ3Lc/XVQdVr2xs1xcBFdJrWHLjk1XK4SF6VRcdKOEJDS/89ByDwPOjOXQbkpq58LLwaHHA7V6TB1+EZMGGFDbn/g3Y2hFLJo37f8PmMtUSzPdb8/pM7zNo+Unvo9tBW5JqUm3SVIsouwQ1QKStZ+6rMyeJR5ZSjjJVSlfXJINorQCC49dtA7ceWKSKSKPKpC8e5YqlXK0kfbxiKXeZBGMdz5I7TZviw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(61400799027)(36860700016)(82310400026)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PIzqs7ntNWS55NAMT7j9KOoNIW/PTC4wBxg6I/+bGtLNC2CXsGFjlJLZQhti+mfCHowPmQERD7ydEdHjr21uZocu2b+CMYSibPivo7O883ub7Qbb7aGjspCEmnjEZj8cLKkCw03r6ZV3spaecd8vdZlg2ftXiiEptco5SL1Wk6zIRj9Pqea4IuZm4ZqeflZsg/opcnCCuVkkol9rWaLA9BoIhZ152fRO2OAVWBBkfoTHps/Sn38OxSb94fL4PxlHuvaodKlFdPAG1MZ0IODtyngClxKbRDm1Vf7F5evdVYyE/ivKnYDg/e4nLixCSDvNA6GF0MsqZ2IVIxcuDsqQiPo32XfEFoLH6o33IIjUJ3LT8cVqKwSWGSx5FL6QIkIpEcmzKyJWsWieb52MOYhqxrzBu5P1FzJAvJcrWo2Ziw+edmMlm0j8gX6T9d0/39G8
X-Exchange-RoutingPolicyChecked:
	RIBY05Vxh74sLyjqPANEEewwJAp2uoSILTh+hxJS01kqNmV9D/URnDlSS+Nk+bzS4DE4dwrYviNzjHD4mgJfk+/4RJKOBkrRahp2SqCFK15v9r0EsU1khqkjpXz0q9xN9UBemKbOGq3Pmvw5wk6N5be0+Z2gnB/blFgj73MwAmVPhZcQVD+rVCzvE4Yr3iMTEKx7k5bX5v0A/0zU20782WoEU6ZSzow0G+ShMoymeoYd2RKQp5VRyuFMZd8/5n6vi8ZJF6pbkxSVXfH6AqOgGeQRr/YkkWzDv6W+iZiO3/6X7G2BlWMyxpZRY5ZCdK3uixN3yFe81kRSDCOrcIJgpg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:26:54.4944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 887da1b6-f089-43f0-1bac-08df3a90708f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH4PEPF0000B60B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR19MB5286
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NSBTYWx0ZWRfX0t4OA2ohKSSG
 Ju2e0bRpBqmOaiB24iUKihUb/ZntfhXUt81Vv6ry2VQm5gb+m7gaqKrKBjBh1yJcTidRm6UjMgL
 T4k5rfgui23Q+mqLODKlq3S3AwY4eUSc56K8/e7i0Ib9zpBY7VwPxiXhNreaRtVDg9whMMQU77E
 hLh9rvtFYvwC65xhiV3btwGRox7VTjytwiZbFH9X5prqaDhD5bMCkUTXlM2YkIxKVVNwiNZxsM8
 Vq7fP/ZQzabkqgtAsXqkT4elrc4xRAwxVV8wCPo3Ju1SrdQ8uR7EshUt8LLAul2HxyB4+RRQev2
 UHx/LGzA7i6CMER9oCHpgUV0N9MSZU38twioSrDDMR/MRucg9mXyi3MW5XSoZSLiNajDKTZ+1n9
 Bjv7B4CHyFzmIMMnfITvZIIBUCkA+NAKrrr7y5tPmgOuizuagv716HCmpQVY1+ROK0mgi/+LJzl
 juFmwyv89ksNrWfN4yQ==
X-Authority-Analysis: v=2.4 cv=Vr62kO2n c=1 sm=1 tr=0 ts=6aeb5cd4 cx=c_pps
 a=bA8WxO540RzhAQ9tgvMHlg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=cMDUSdu-AAAA:8 a=w1d2syhTAAAA:8 a=e_JNoOPcMW4zKQtYRXEA:9 a=CjuIK1q_8ugA:10
 a=QRaI_VI5Kbc4sAalow4w:22
X-Proofpoint-ORIG-GUID: 5KGfNtaVGLwZmavPglh55bV_SLNcrmdm
X-Proofpoint-GUID: 5KGfNtaVGLwZmavPglh55bV_SLNcrmdm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NSBTYWx0ZWRfX0k4w/WbRt7H+
 AxBGd6O27cv3dOQ1QjY4YpAPxTmKumefvRdsU18dCEZCumPR5GySv5g5enj9xvgiOJ1GzrrzSdG
 YfqwiCCc319DmiSx+NIuSw1ZDr3FjwI=
X-Proofpoint-Spam-Reason: safe

On Wed, Nov 04, 2026 at 04:58:32PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> When switching SYSCLK from MCLK to FLL, DAPM may keep SYSCLK powered
> and skip the PRE_PMU event that normally enables the FLL. This leaves
> SYSCLK sourced from a disabled FLL and can cause playback to fail.
> 
> Enable FLL_OSC_ENA and FLL_ENA before selecting FLL as the SYSCLK
> source when WM8904_CLK_SYS_ENA is already set.
> 
> On VAR-SOM-MX8X, playing audio at 48 kHz followed immediately by
> 8 kHz reproduced an I/O error when switching from MCLK to FLL.
> With this change, playback succeeds.
> 
> Co-developed-by: Alexander Herfurtner <alexander.h@variscite.com>
> Signed-off-by: Alexander Herfurtner <alexander.h@variscite.com>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
