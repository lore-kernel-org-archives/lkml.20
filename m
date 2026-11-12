Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794493315;
	b=3wWl/7sPG7gLVTmcIlUV/+faKM8XO7WKNis8ZKoDMHDtgN/3poJxcIinWDYLCqX5pumJ
	 h+HuGJ00NG9UYkW14B0VqnIm9Kb8PpibmNRlJUl0uJ4gCz90FRx2wBLzxy/QNIQpO6u5U
	 tVRLsajl5V77gCunb9c+PYaOG+rHmvOxf0Hkp1fXB5kMxXTVfC8DCspVUF/aJk4xWXVoI
	 WcMba0iqhtQhQTaGhobMfc4CfFA9T/Pg3i4YbVKJPMP4wDpBcVtlU9C9h7zYxJo234dY1
	 b9DGx6SquvqHvjGyI/z2ThYSid8ADDJ7YgjMZbqvPOf25aGeT0srJHhAtuh+JM+UUSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493315;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=Qrcfk9ZvOgS/7Xr9UX2jcIIt3JUFEIvdBdCxwh+5n3A=;
	b=IPgHuOc4a5g34m04ZGSFSkJWIoOwmNze47qvZ3XOV8UptEv3NAD9HAZyJKwiSTll3ca3
	 T0Bjp7WDIWzjYnWsYyoAUPsMTCLwvjMiK3Lxv1avVpB5cz+3ms5wJy5VqIbg+cLOAvwW8
	 U/wyRC9vX5u5l+pdUPxTZZupaZvsWNpzQYIBjghWTJ8KdgWIq/PNwAnIikLMtkE8aE6ui
	 jNWVufyOgNkYULpzm6l903cPNiNXkDgIVn9lAmUrRbAB1tmERwft0p8+CDmPD+l9QNIuF
	 jezon9Tx/1Hc8lqsJ4L+6/Fh8bFVLW7/tazph6x+q1V8IWZ0e5ua8PdFPtO4HNpkrDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Rb6pHFJm;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=D8E20+aO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32AA606A330;
	Thu, 12 Nov 2026 14:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A32AA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Rb6pHFJm;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=D8E20+aO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACEJ44R2168319;
	Thu, 12 Nov 2026 08:21:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Qrcfk9ZvOgS/7Xr9UX2jcIIt3JUFEIvdBdCxwh+5n3A=; b=
	Rb6pHFJm3oQCEp1R3KToKqQZOguTHgH4sZppkoQQ4Ibhzc2boZzyD5SAKeGWHLjO
	mHpjnTqyPlQhlbLt5CIn8n9QnF59qe787dh9Drp9hNVDOZwdPO5/ABJrXP9MHVXX
	9n/X6hSreZWWbX28pQZTCa2MGHk1Sv6OzvGKpXPrZ7avgEk0uRo5PNMrFdCSzMCR
	mEeKiXlRHxKwzDgcZP3a1gaMJNvEJL3m3AeC5UN5bd2Tn6yZUpfw4Mqp7P5LKF0N
	6RtEoeTR7CPi/YXav11ZtiylIT7BKoLoJ9ZRs0WCJpBU+f/4fdCIW6A4vH036vp6
	JRMqwGre39gH7W9x2kPerw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023108.outbound.protection.outlook.com [40.93.201.108])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfpg7pt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 08:21:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkXcESCFRMFkE9k7adu7S737Sb4XkP6C5ji1jxhDEKF1uN6+fabQHInYfq5fgwOgC1waPGqJjl3Lc/HK0OaImOyMLY1RpxelLgFhBiSrlwcYVFKISM4f4lUjtEDwDMdxp0i+sVaH8dfVsQn1mTppIxC4IUT5o6Sx8NX0uaz65q9GgKS78ISiTRP7l3U/KCarCug3Oo6bAF5li4KDyDTK0ajQy7U0QhUtjCKWagAWAgq7wa1DoJI3CANYqVHDZ7uEC1hil6xuIHhQQrRov9xTZCizmrkmGJY2b2t00J5FxMN8yQdQGm1t5o+exTia3dshIKhUkNZqQbLv8iGZzKeabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qrcfk9ZvOgS/7Xr9UX2jcIIt3JUFEIvdBdCxwh+5n3A=;
 b=uDIxx42TbwBCSmTa/PLolag4ZM9dt22lKMFmAdEzG5Gq3oQ/Z3y63g3eE4EEJ39XFtkDJ27u6N71b417l0hMZ78ajLE9Dz/Jy7S9/Nj3A1+5dNvgpsyj8aiMCo3d/+Sf/r8KzvSH/F21YA5uTp+m40Xqp+EMAxLbnK/wt1ENLzeyRM2WO91zBAF96u4jE9k7n00SXeWzOn9BKfYCljzTC+q5TxqhBVk4NaSL9+935VpcoW2KNn6VYoxZcLHVjPVhqH9xZ3qixAt3bTMtJTAuXTzXpiXfmSs9VY32hEiUUyfrbrSZQoa37mH+xEX850OtjA9XpbTZF4QWwIG6zftonQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qrcfk9ZvOgS/7Xr9UX2jcIIt3JUFEIvdBdCxwh+5n3A=;
 b=D8E20+aOQ+zgvamPjlz/QxiZV0h5UWLcfogHOReQfOA/RjeZsCRQkGV9XJI4V2JYLGul30v51B9QT93SO69yl8q5KPr1H5474kTm/d+TMGZTpDiizLETc+ckK9pPtyg6yITFDq/qHftSbcRfeyXloLwpuIrLaleBiGjQgVo5C6g=
Received: from DS7PR03CA0220.namprd03.prod.outlook.com (2603:10b6:5:3ba::15)
 by BL1PPFFA0C0F384.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ee2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 14:16:59 +0000
Received: from BN5PEPF0004698E.namprd02.prod.outlook.com
 (2603:10b6:5:3ba:cafe::45) by DS7PR03CA0220.outlook.office365.com
 (2603:10b6:5:3ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 14:16:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN5PEPF0004698E.mail.protection.outlook.com (10.167.245.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 12 Nov 2026 14:16:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C85E5406566;
	Thu, 12 Nov 2026 14:16:57 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AA84D822561;
	Thu, 12 Nov 2026 14:16:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/2] ASoC: cs42l43: Update load detect procedure for cs42l43b
Date: Thu, 12 Nov 2026 14:16:50 +0000
Message-ID: <20261112141650.1931348-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112141650.1931348-1-ckeepax@opensource.cirrus.com>
References: <20261112141650.1931348-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698E:EE_|BL1PPFFA0C0F384:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d07416a0-1d1a-46f3-88a9-08df40c79d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|10067099003|11063799006|56012099006|261022113327099003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1SbeSWua0NtOgyuB1o7HKN75fZqKiY+chGgVA056fhNSXjgLcM6QAaMnvTw5JHrMTgSaB/z1I46rOVhkKI4o6pzDuQZu7HocKJhm2OAu2iEzOlomMvcHSgxSA22E6B3A5o7op43k0S2k5kH7xY+mvCj+flnyYYw2iWjcSbYL6r6atHr7XrLSCIU/BaNL5HTl3PGp+i8PHoJd22QfS+aRX44OHHx6wRYLuNadzdUzeuvsCXxJBQ/wCjDQmCQjc6g8nRuVL0NZzeG1FOyzz2DiB9FCg0+3rTgvStWshGfFfsuFvTuGaxaC9DyvPJaPO9KiJTqBRRWODhzhLQMe86Tg4+fMFHowjOS1En8duxtXu/y0ZUx0hETCrgwHLMGNbHJU/s9PZqpa09i3sTqZ3wEzcWUid7XUIpxzLVXreUCQhzO8wq+RqTkbt4g/gU8CvrRU21oBqGH82bIjJdg2GVPwmPtVjGyhgoWorACN6ORpHZmq8eyXWyifJsspwRm99VSx62eOHoaRRoU+7M8Wx+Oql6tVdn8x6MC7SbcE95QS5QTJHQrz+khn1AZkmJCJgHeAvgnZzMUA5tOUP8RoIjQxyR2xJubWwrK+V0rhq+9ft9E2uZke4cSP9qwUY87xVoe38MjSQ9HR/pBxrRNB2WttxK3dtK0MtfxNQqBYD/UqM7DjB8fkpCV9qOlPMEOdPld1vwhxFphnIh+sjbXTvyA+BA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261022113327099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hyA4Ui1RSckuwoLBDInNw6GaarU/I4vmV+hJU+EAyVMeXgKTf4bqpZeykIS3HisEoI4AJQSmjF630V1r+wbbT5I97Irra44WDKIgGphXRUqz7z92Z5ZakC9b0aaDV/nK+g3abd7PcVi4tAjkMXNbKEU+5NUBUZ9wBnUCIupELU8Tc+sJYoNJoV3g7vcdqJ2+15ZoRKLZFT1Qlh3g1ynuHio1//zvd2hExAQvVoezs7N7l5/4K+Vhj5yo6Nll0uDernCQvwHycgnmK1oBs/L+ru+8NOGfgegxX5rIGHszbja1oKfnL/gaY5uz68+L4htRGRg7pW6D/NobnEObpRRVV8AXsfV1Gv8h2rm8HhDMm0JvQdd48637Z33X3kRbUSBdn9/F3frSg+olwJUDLSezGvQHZMwYxJw4KIFFbCrYb/kHspU8qW9BRSw2BEgEKon5
X-Exchange-RoutingPolicyChecked:
	5PqPm4Ts7Y7OQbQXnql4IYAG064TEFTjpRj4b95dbJWDwdctvN81Vs/OVEMMn2WxnLgIgfrYORM/lpgyirW+QhTn0odomqijyuop2axhJTNfnwXx9e5sykCLelub66KfqWsKXzdzpJjkYHnAcenhxFhCPqPJYVH53hHXd+a4ewPZWLnCIH5wh35bwIdPKlKrr7fMxVMSMWfOPO/f72Ksxoj0oJ6yfd7bU6t+025jU8a2mqVFtGs8Y/wfwbzSHh6koEgO/FvCCdDMt7iG0DTuZHgwxhdwITxHcy9Brk7SiEF+oXhvPqf6EjKGzHmxaW7R6034/WjzKLha3AsU0uhAog==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 14:16:58.7181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d07416a0-1d1a-46f3-88a9-08df40c79d29
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN5PEPF0004698E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFFA0C0F384
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfX4r/MRHNp4/A0
 70ymzD8YbgdGxXmhWAIJO8dejobvytgBwzI/LRfxVOQWnt2lQk9TSw8g6inZPI2b11UvISAY4qZ
 7DaWiut9ZEoybC8joz/CTLAQPiZdsNh5m/lfsH8naSlUhCbpA7SEpNO6G0IlCSLx3/y1Wid3Lss
 n8Sfb84LiOEMKxuNyJr4bir38PL3U8c02T/zIDjuuHge/h4MGtbWtjnBF5OY4d4QKuq34wNtFKC
 JwCvtcmZQt4O5a96VLqFypiSTcg3z0wFbRNbavIOrN3Mc65pZ0D263NWFWuGqDJsiBasjwB1IGH
 cAuHLUMnIzsi26naIeMyefoc8UT7wDxY6myKwAAzfAglRbhLXjUUnwBumdRVIEfI0aZUgzEoWEE
 NaIslgB5KIIpfjdkS7oGZLqDj2DBQ/ZnLRtEfZYNP3M+WJjw/xMndGMdYufiETOGCAGjyvMYtU6
 Cwthz/17w5k+eh5rV6w==
X-Proofpoint-GUID: doRjMl5HiLrj-DQO6TsdPJWvfCqdCE4P
X-Proofpoint-ORIG-GUID: doRjMl5HiLrj-DQO6TsdPJWvfCqdCE4P
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af5cb7e cx=c_pps
 a=zpEXwJxT+I6ikN8M3JpNfg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=t_SYNOdkF1KoeevYuH8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfX11ovDm0Cya4k
 oTFER3c51RYA13Hr7I23DIwpZx/4E7nEMCEfYAQebMiqjZq+cLR0ojFhzt0W1QLyPo8l1fkF1cA
 MY4bzJXebX+lYpgdhLCAtCf4u04lwc0=
X-Proofpoint-Spam-Reason: safe

The newer variants requires a slightly different process for the load
detection. It is no longer necessary to apply different tuning for 3 vs
4-pole headsets, but a new field does require updated for CTIA vs OMTP
headsets. Update the driver to follow the correct process for this
new version of the chip.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

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

