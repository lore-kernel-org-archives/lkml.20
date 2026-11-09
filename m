Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239490;
	b=JM/NgfZZ+OjRjkpqcb03ozUroOEgSo5eJCnLv+JiNY7hqhquCslT1r/ghjOYxro08vs9
	 EPhyopM7CCDuknPab/Chcjg4QcU17Jr3WRuzU7nOaS4yHvmzGX8QWdeYbeAuToNEyev68
	 qzdqNScm1cIPTDaZn5z83PZcYUJpt5Gr/3MU4iPQ1OQzLGCt79fsiXi3AEubH5RkkfwWB
	 HDqj3radvGJHeMwyvlFmZcaxbyfM1iYnT5Q113cDLYEJ52vgA+RBQ9TFT9O63KaA5rQhl
	 7BIqnu4lDKN11tUZAmGq204710ZEbQHQ4w56AG7mtB3gSS0+iNoNsohjcDLkZsoRIWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239490;
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
	bh=ZEHOXCC3jQbl7wZ1tCVJRYUsEwH/F3IJCT7lrrQ+DIw=;
	b=2dEniL/E1w6sXNH4AjUfnLJk6wKjRxVci7UXC1ZBXd4ILJL/SYYnlBXmuH9BuqfBtjN3
	 Ra/G58/KdBgcMmtXm3pjMkRleqWpCl5/89yfp9UmfdIrpn4ESM4pyF61qzDBAXzUhhcvc
	 /LDRyCfdgKnmo9caqnRrakDqwrcsYRv7iBYa1E80I0bxymaYYn4timxNDjgCcNT6NxHBP
	 bXjc40OyUpfWo2yPAPKxAIlNy61HQfhnRRbLlxAkzfVBmJmGm9K7idI6l8IU/tyouJReB
	 0+Ie6lNnsLbxV3asvushICHRwEjIZn81vAPX9o6UkBE1l+A4gcvZB/8Lw7YLBJXSSkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=m9nDxwcd;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=g7AxrtJy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFDB606A339;
	Mon,  9 Nov 2026 15:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFDB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=m9nDxwcd;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=g7AxrtJy
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9FJgAE2615299;
	Mon, 9 Nov 2026 09:51:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZEHOXCC3jQbl7wZ1tCVJRYUsEwH/F3IJCT7lrrQ+DIw=; b=
	m9nDxwcdV7GxZleIP7cna6jEDVe42VMqbHQ20YPEGpfMV1pbbGMX4+gXCiUCscQE
	VcD4hUMrawFuWxzgJpZoZ61pkg+Yx2OevB0MlGjGJMm6cbH0iLaqaSxlv/AjCgeO
	fhMkNTSR/VMXZgNfUb7crLIw7ivLyUbrHWeUPnKR5ufslfuttXTlPUz+kp4aO+tv
	J+ceEfxN7vnyOeh95fbrkHHr9iMElJi+nYDoR2CeIBwmZHQhCaj2rwiX8S+V5xOO
	yiwOodcl4nhmRQZYbuCLkoeGWN6O9A75xl9v9JhRZbo2orVayZeZQFxSWWC0yfxq
	mpJ2ZksZCFrYrw9tQRaL0Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022118.outbound.protection.outlook.com [52.101.53.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29ha83w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 09:51:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJia2uChqOnD4yMODzjQjAyFeByecUM8E1Ecj3rDtN7aze/Y66M6o1t5rGa9ChP4LxHC9dAxxyyGb/b6A5/4JvYAl4hc2cB+1Ky2V4sJDRhoEVPbmmXPlbqttpb7uhEJ9Mi9LPPDDMo9EDHs+DLT6Lia6HKdfkMT1/IxSbjszmvi0LRL6uvIW2z+Zy8UPfLS6fdCHzfVtO9FHnvp0S+gnJ+MoZEnqWAh98KCbzvLjXb3BUgNGpSNCufZpwEO5Uh/4c3OFc/pfJtuz0waB2J4fYiI+L+MBvSQKddB3+Nij9PiNaxWQIPk7QnGUPoTJFaSNAuo7cVbgx0XUXYNzGMOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEHOXCC3jQbl7wZ1tCVJRYUsEwH/F3IJCT7lrrQ+DIw=;
 b=sR58GOwhZPuW3u9sCWdYsyh75tK3e03hKJiNVCqAHKt2hq/x3o1IbS9XCDY40/1ofmCArNI5TeZYdVQdSrPYU7Ed2svDahrWhDvhf3KU3T3nQTygm4X4sooXKVPIcdkeEcdvd0IfmCfvOli4EWhZA5s6mwe1G+M93jL2UMAoQqjHoYLZA1vFAOH4ozj8VjxYAEfC/i7MFNHFMe2fgZ6xqrrCSti+XCWBOIQAROVjBk/zrDqDdk4SVYLyaR159JX8bAaV4qqbXfJEjq1qA2qkI2AbmBc5TPHv90FSU1STn+x6j7Dtfp4y4c/z6y1xg1BzaWcfrP9WUVpIuA9iaRnUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEHOXCC3jQbl7wZ1tCVJRYUsEwH/F3IJCT7lrrQ+DIw=;
 b=g7AxrtJyDwWJketkkpk1iaTj/JZfpVxsSyQEzDldTnDEj1z8EirXVGCzCssu6V8mYz6kD+3rAFp/gFeDzBYrxZY6B/JQSWqHuYLD5nAQw9sYLa2eU8jBZhSG7cjtDFX8z4tbfQCtn4g2yVtnisCZ4BZQfP3TLucmUp4KIMlF0m0=
Received: from SJ0PR03CA0245.namprd03.prod.outlook.com (2603:10b6:a03:3a0::10)
 by CO1PR19MB5205.namprd19.prod.outlook.com (2603:10b6:303:f4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 15:51:13 +0000
Received: from BY1PEPF000264B6.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::89) by SJ0PR03CA0245.outlook.office365.com
 (2603:10b6:a03:3a0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 15:51:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF000264B6.mail.protection.outlook.com (10.167.242.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 15:51:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BDCBB40655E;
	Mon,  9 Nov 2026 15:51:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 99C33822564;
	Mon,  9 Nov 2026 15:51:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 3/3] ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()
Date: Mon,  9 Nov 2026 15:51:06 +0000
Message-ID: <20261109155106.3727597-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109155106.3727597-1-ckeepax@opensource.cirrus.com>
References: <20261109155106.3727597-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B6:EE_|CO1PR19MB5205:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 57e26d93-1b92-44de-6f2d-08df3e794806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|23010399003|36860700016|82310400026|10067099003|261102130727099003|11063799006|56012099006|261021123027099003|261022075727099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|18002099003|22082099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	iR0ceZOIWoNlWCHI/smhOCm4jXb9ezHgmaxFQID9gNpLAUeDmlkVltJjbEO1l3Zt23BugkzTt6a+sR3oI2iVdqiLrb9oTvVdtOvakgbOTG80ldDGFKVX0ttB19F/pUeXqhIztQl4OZ9y5Bwc/NEJXt0JLxV5l7U+T00/u1n6/jWCE5XpWUgcnpfHqmUIj0n4tWU1SH5WxKex/aUQEesD9lP7vMjCsLBusGdYVOHZDot4gD/RYy5bDQfKjPForhUgBgH0+zKEJ7qGlVQtEKVNIkz7bIThdYussygqOPHGvNXSFk4ZGBgB34Uhz/uhLAbrLzfC/9MZxVd3DEBuMf4bnElnT93+9MKSH7/y3TPehdBTuVBBzBXR/eZAkXeeW/fcKneW2AO0jkTcCn/M6CmiVbMuUtVCK0NHsPhE1e7D/1atu4usS7GMrp958FlQOWZAteAPdYzNm0v82/JYgcMJ0d1Vf1urAwThjAXRhX+jmf1a8Jz7xn7qyPGZvFSharamqu+YQVF+2U0jhqddmryFAVay7UXzh5U9mIEDHOmjziM5zBHQpNeNjgDtEtmEPbGefOGTdIt9HS2mC5k5tgW6s+tXPiMyv8DId/3L7Gx3pFLA8GnWAzh/33Knje46icIn8JityuJ3fm76QGooSVgR5wY2srzRk2qrNOkuTVi+5hG86zUqs0gnxohRHN8Vk862Nt50BbXZCt4ChAWnoq68mw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(261102130727099003)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Et3VsbEWTNuBBUYmd7YqC4vFfmEy5KRHPG3akVe4HePh7YSF1kmVcOfnOQoM8zeuGcTudACJQ2ygMxFmSuV5h6ljwsaxCQTHpNO+gliD9wGKo2U6nKxYwbaBPYO/yhdacrkeilntQPCz84oeC3ypZMO8NvbFFzbHymU8qi/PMhRPKawh146qlIfca7ZiDNKb9BUo6I55gEObS6uyXnJ/7LY6U8p6SdSujymJH4o8u43/sUX6prT2eim9jZFaV8ZJtv60OyhY264GxabS83Tv5O2Di+gAkjdU2xmVeuqrCA0SBgYqg2MFgkjHXuqe6mnhZ5mdM3gUQuT1EuahYdBB/yHZ8stUl+JSrLFqFUI46b3srXNwadyP8S3f9kYNWgHSqCJxG8qCeWtVkbwnCnHA3E5aey2eet3yEInfVU6YiDJ2CVBh8yY3JU2KOy3Y2pfG
X-Exchange-RoutingPolicyChecked:
	fUXc7vzCmanntC4rBMlh3Xr59bQHmV2ijutdbArb6XpI3ZhMf2u11eArxsZTcnHyxT9WIzPexITi1rkf0PPixdFen9XMrdmc3LhTOQM1+9ZkNZeAU2r2dJ3O7drOxrsCS/JskBL7jV0Bqd/dHdglHdf4Fx8PTEW0lD6r+ZVaecZmLgV32H5TCsm6LO5TqvHflhXEMHcEjCOKApAZNwotyrFVPTa1bkJ5a6n/QdEptM8oPT7LdnlZqDqnxPpsxHoiDkcDhPfj9f/bq7FNzop7n1RICAPLs/fdd8+4ok1wSizoBKEdGn/CltmhDRSXBSAFOZwopezmjGOiKCEBKrvahA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 15:51:12.6844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e26d93-1b92-44de-6f2d-08df3e794806
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF000264B6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5205
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af1ebf5 cx=c_pps
 a=dEWqTTejV84EJJvpR54jlw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=GxslQ5yvgL-McidNO4cA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfXw1Dnusyy+LN0
 hdkIEFEc+PliDfZX6MNRihaKZie5TgI3ROeRn6jyoqciPxiiyqVaBl+Jsg4TAKQe+Kk7qGpAJzL
 M0yXQyxRSjHXXfJJu2s0QlUPxpLeTi8=
X-Proofpoint-GUID: -KGrdoTQ5GwMuKE5wHgX-ySWHDfMLQKV
X-Proofpoint-ORIG-GUID: -KGrdoTQ5GwMuKE5wHgX-ySWHDfMLQKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX8XwqEhdc9+k5
 D56+HgKz7oHt741jI3zImLST0TYydREwUy8ckD3JEfYGf7BpH2k11xzpqd6in9/1nVmpKMM7ZkF
 CI/DhfXzQbvFfDbgBBbQeU0aXF0zbTo30X8PARrIlHooDjRqxHzq6L74rMZ873WYdKRyQpvQyR+
 R++sLFKyqj8zY4PcbFKkfCPgF+Sue3yjtn0nHw0ylwCL2/L4YjprYZlQbu+RaDFKa+P8ThgyIOK
 3OE6+LF77Sv0Y60z1/y6U6x91BdKjR+dYnAqrvqhuP6N27BK1q7Psp8e9vraGblWSrqAxPfoetN
 WOYsS5T5ShR4FQ4bakGOapikDLKwIHDx0Ad3MyPLS+CxExGaTLunsQfWvLLpLkW/fIUcOl4eJJz
 krj1C8aHhiryLLd/+1IwNl7XVRVB8tX2iFSBUBRiF8Sfr/hekTH1I0wDQIkLDjv3ejHPpUaROg9
 W6kkrQmnZ7i5H3QGkkw==
X-Proofpoint-Spam-Reason: safe

Currently the SDCA code constrains the params based on the DisCo for
the SDCA Terminal used. However, it ignores the properties of the
SoundWire port, which in some cases may further constrain the allowed
params. Add additional constraints to apply these restrictions.

Some minor additional refactoring is required since port constraints
should be applied for both Input and Output Terminals, whereas
currently Cluster constraints are only handled for Input Terminals.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Add check for ending up with a zero mask for channels, as this would
   allow all channel options
 - Switch to using SNDRV_PCM_HW_PARAM_FORMAT, rather than SAMPLE_BITS,
   as SAMPLE_BITS equates to memory size not data size as was intended

 include/sound/sdca_asoc.h            |   4 +-
 sound/soc/sdca/sdca_asoc.c           | 137 ++++++++++++++++++++++++---
 sound/soc/sdca/sdca_class_function.c |   3 +-
 3 files changed, 128 insertions(+), 16 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 236a441ec9d89..26740f69f2bee 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -12,6 +12,7 @@
 
 struct device;
 struct regmap;
+struct sdw_slave;
 struct sdca_function_data;
 struct sdca_pde_delay;
 struct snd_ctl_elem_value;
@@ -91,7 +92,8 @@ int sdca_asoc_populate_rate_format(struct device *dev,
 
 int sdca_asoc_alloc_constraints(struct snd_soc_dai *dai);
 int sdca_asoc_free_constraints(struct snd_soc_dai *dai);
-int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
+int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
+			      struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai);
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index be1b4c0075796..55b2ef6abb806 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -13,11 +13,13 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/device.h>
+#include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/string_helpers.h>
 #include <linux/types.h>
@@ -1436,6 +1438,7 @@ EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
 
 struct sdca_asoc_constraints {
 	struct snd_pcm_hw_constraint_list channels;
+	u64 width;
 };
 
 /**
@@ -1507,9 +1510,86 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
 	return 0;
 }
 
+static u64 get_word_mask(unsigned int width)
+{
+	switch (width) {
+	case 8:
+		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_U8;
+	case 16:
+		return SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
+		       SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE;
+	case 18:
+		return SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_U18_3LE |
+		       SNDRV_PCM_FMTBIT_S18_3BE | SNDRV_PCM_FMTBIT_U18_3BE;
+	case 20:
+		return SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_U20_LE |
+		       SNDRV_PCM_FMTBIT_S20_BE | SNDRV_PCM_FMTBIT_U20_BE |
+		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_U20_3LE |
+		       SNDRV_PCM_FMTBIT_S20_3BE | SNDRV_PCM_FMTBIT_U20_3BE;
+	case 24:
+		return SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
+		       SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE |
+		       SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_U24_3LE |
+		       SNDRV_PCM_FMTBIT_S24_3BE | SNDRV_PCM_FMTBIT_U24_3BE;
+	case 32:
+		return SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |
+		       SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_U32_BE;
+	default:
+		return 0;
+	}
+}
+
+static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
+			  struct snd_pcm_substream *substream,
+			  u64 *word_mask, unsigned int *ch_mask)
+{
+	struct sdw_dpn_prop *prop;
+	unsigned int nprop;
+	int i, j;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		prop = sdw->prop.sink_dpn_prop;
+		nprop = hweight32(sdw->prop.sink_ports);
+	} else {
+		prop = sdw->prop.src_dpn_prop;
+		nprop = hweight32(sdw->prop.source_ports);
+	}
+
+	*word_mask = 0;
+	*ch_mask = 0;
+
+	for (i = 0; i < nprop; i++) {
+		if (prop[i].num != port)
+			continue;
+
+		if (prop[i].num_words) {
+			for (j = 0; j < prop[i].num_words; j++)
+				*word_mask |= get_word_mask(prop[i].words[j]);
+		} else {
+			for (j = prop[i].min_word; j <= prop[i].max_word; j++)
+				*word_mask |= get_word_mask(j);
+		}
+
+		/* Only handle the number of channels for constraints. */
+		if (prop[i].num_ch_combinations) {
+			for (j = 0; j < prop[i].num_ch_combinations; j++)
+				*ch_mask |= BIT(hweight32(prop[i].ch_combinations[j]) - 1);
+		} else if (prop[i].num_channels) {
+			*ch_mask = GENMASK(prop[i].num_channels - 1, 0);
+		} else {
+			*ch_mask = GENMASK(prop[i].max_ch - prop[i].min_ch, 0);
+		}
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
+ * @sdw: Pointer to the SoundWire peripheral device.
  * @regmap: Pointer to the Function register map.
  * @function: Pointer to the Function information.
  * @substream: Pointer to the PCM substream.
@@ -1519,42 +1599,71 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
  *
  * Return: Returns zero on success, and a negative error code on failure.
  */
-int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
+int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
+			      struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
-	static const unsigned int channel_list[] = {
+	static const unsigned int constraint_list[] = {
 		 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
 		17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
 	};
 	struct sdca_asoc_constraints *constraints = snd_soc_dai_to_priv(dai);
 	struct sdca_entity *entity = &function->entities[dai->id];
-	unsigned int cluster_ch_mask;
+	unsigned int port_ch_mask, cluster_ch_mask;
+	int port;
 	int ret;
 
-	static_assert(ARRAY_SIZE(channel_list) == SDCA_MAX_CHANNEL_COUNT);
+	static_assert(ARRAY_SIZE(constraint_list) <= sizeof(constraints->width) * BITS_PER_BYTE);
+	static_assert(ARRAY_SIZE(constraint_list) == SDCA_MAX_CHANNEL_COUNT);
 	static_assert(sizeof(cluster_ch_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
 
-	if (entity->type != SDCA_ENTITY_TYPE_IT)
-		return 0;
+	/* FIXME: Currently only a single unshared port is supported */
+	port = sdca_asoc_get_port(dev, regmap, function, dai);
+	if (port < 0)
+		return port;
 
-	ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
-	if (ret)
+	ret = get_port_masks(sdw, port, substream, &constraints->width, &port_ch_mask);
+	if (ret < 0) {
+		dev_err(dev, "%s: no properties for port %d\n", entity->label, port);
 		return ret;
+	}
+
+	/* FIXME: OTs should inherit cluster information */
+	if (entity->type == SDCA_ENTITY_TYPE_IT) {
+		ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
+		if (ret)
+			return ret;
+	} else {
+		cluster_ch_mask = UINT_MAX;
+	}
 
-	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
-		entity->label, cluster_ch_mask);
+	constraints->channels.count = ARRAY_SIZE(constraint_list);
+	constraints->channels.list = constraint_list;
+	constraints->channels.mask = cluster_ch_mask & port_ch_mask;
 
-	constraints->channels.count = ARRAY_SIZE(channel_list);
-	constraints->channels.list = channel_list;
-	constraints->channels.mask = cluster_ch_mask;
+	if (!constraints->channels.mask || !constraints->width) {
+		dev_err(dev, "%s: no valid constraint masks channel: %#x,%#x width: %#llx\n",
+			entity->label, cluster_ch_mask, port_ch_mask, constraints->width);
+		return -EINVAL;
+	}
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
 					 &constraints->channels);
 	if (ret) {
-		dev_err(dev, "%s: failed to add constraint: %d\n", entity->label, ret);
+		dev_err(dev, "%s: failed to add channel constraint: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_mask64(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_FORMAT,
+					   constraints->width);
+	if (ret) {
+		dev_err(dev, "%s: failed to add bit width constraint: %d\n",
+			entity->label, ret);
 		return ret;
 	}
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 6406c9d0f6119..abccc63640c68 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -121,8 +121,9 @@ static int class_function_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
 
-	return sdca_asoc_set_constraints(drv->dev, drv->regmap, drv->function,
+	return sdca_asoc_set_constraints(drv->dev, sdw, drv->regmap, drv->function,
 					 substream, dai);
 }
 
-- 
2.47.3

