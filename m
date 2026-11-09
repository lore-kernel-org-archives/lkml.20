Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794245190;
	b=xtylcOhE6rd1F73PU79KD8ghQ6FsPBtCH/7CJp8t7sLjRtcmcdgzrKFgiPdozDyVRnEB
	 kHldsRjbzTNJClRb3gHPo3j2jtB3Djfvu3HvNl3a11cxHzA+AmCQBjecyVZwI24OpQOgE
	 yT0C4ni1WJ3BCjOZcrKqg8Y3h6T/3+/qDzqM3+LzkW3Hmbfo8aS1hQf/g+VI/160bZL+o
	 tNki3hVLW+2C1G1wAVpY9RlVF835369q6j9w4/ZPUNpu0CARlST9PvOZcgwwlADaDtwjG
	 rtF8ikKrNxMUBIH2MguGM6gXKQylxoEmRJNjQ8ruDmu3rn2NAVWivWNN9uNsnXBK6Cg==
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
	bh=ijZttrfw/Ogo4Jt4m9ERj8XHqkoE+Bx5Xoll7gFTF1o=;
	b=2hGpNRosckhOSMZ6ky5BDklnHFQeUE+mnsHlVXeHOJxjFaJE+V+nZrAWHHTYf36oyIyy
	 Bqs/rqL5iuLtdBYj+irBHiKD4uXwARa3/ToOq3IL+o+FKKqjIUSGfLuL6Zju2APXBH6Ys
	 fSmU3TwVT4/eljy5Z5BJ72eu/AAZAjP9yGDFb3AMux5Hf4dJ92GhTn62/BpWwq5Spcn0y
	 y3dTBucrtD+v+lFpNTtpPXEZrqD5S1EIepOFHx/cswNTZ/YVZ+kXGEubXjI0nJmaKBbA3
	 OuAPn/P1WiNTQnZqKEGEX2lZq1ntffSAutaQLnHPynYiPBWyQLU6+5WUF76sMKxmz8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=QSig9mds;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=FpuhHYkI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3733606A325;
	Mon,  9 Nov 2026 17:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3733606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=QSig9mds;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=FpuhHYkI
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9Emf1Z2564800;
	Mon, 9 Nov 2026 11:26:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ijZttrfw/Ogo4Jt4m9ERj8XHqkoE+Bx5Xoll7gFTF1o=; b=
	QSig9mdsmmbMFFx1JIYRqXstEoWDZDejeJzUKk6rcro3j5TxsHpDBo8xu3m1nyyn
	2wxAVoxz1yCHFtTWY0j7YbeE0984+wP5fk3jFul8ZNedTCEJPgeT8vB6O+yN5E4C
	deR3d5pYnaZ/GI0j0yDolgnFts2cgSLdZ9ogkxs8l3h8Xf8vmRGZb6fw8AQ29QrZ
	2Q2PLjXyZuHuqM61b72zNn7oddhbLkWByI+HVTMJ8aGpFRHTtU3/RvgKlUG2vpXp
	rMU/89AH9MOT44jH/0C8flcIaPTXEhHLJ75xWcHRvL7kKl5xGthe3QSnNcKsWHGf
	z+RW0HkbjA9QGq3+dPU3JA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021089.outbound.protection.outlook.com [52.101.52.89])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29hacrf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 11:26:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGjBgcZ2aVb1dZnbc0ctBAwCdem0vtyi7eGBBvAL7+DVMGfRvn5iNID63P7UruuJy7NeR9i5zWxkcjwbhgUSuOOWpNThumIq1CboWI7cvGGu5EdymLO20IcnPgLpHyU0S6lUVYF3MeB53NxBLpsWC1atWJ8ALqSBh6VSMld7mscvpbGZpi8WPWzyCBcxJ/qI6XQggAnk+ZBvmpMf2Jq9wr8faGCxvpV1CzK8gzT7p2wLs3Ifo284N4u2/swICoR9Y4kmCQqRW0VtMUxSB8D7qyQ6T0K4hicMQDtaVItpcnn9N1NB2NDj7HJASVRarUmygOkARxKyRdPC71uKC/2jjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijZttrfw/Ogo4Jt4m9ERj8XHqkoE+Bx5Xoll7gFTF1o=;
 b=XzvQQo0fWGey5nf8WFsie9cuRmnQ1TokyJKsR1QiUrTdIIDg6ccWRCpNrp0CJg5GElyuD+CNeoDNyWGTFC7dsxHNvhMC4ghrlRd2Ut2jtuwA0WTvT7k9MSAZiKgONekdOnGmxVV2GdAv5Z4XpjbJCryaUwqU2T12rBzEwKEGhs+HJI74KyPhzQ5/l3t/AWlDCNeaUg3FTSEQE7hyxb0Xfw0CEdi38JXDQ4T0Mu4GVypey2HK4E+bh9oM0RxBqXTVxQOGgnHaTHEYA0iMgXrGSNWP7l5yWKmnwOOZF7YMXWyLYXA1zgAmUZniRga47hl0lIlZ5MxXAGjIgJ06Rrw8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijZttrfw/Ogo4Jt4m9ERj8XHqkoE+Bx5Xoll7gFTF1o=;
 b=FpuhHYkICndAyoB5UOFeBRJiLqnmHggeRz4rXYiAi0u2YgHkG+Jp0EuFVBIk4Lt7Fe/zYyarvMjZdxflkqcJXZGg5gOoyefic7/+05IqBQmzA4VlPlcz38BlRmdLBlr1FujMP2B55ixFt6AKDWgJ3NzEvxrDJBHIxV6bICFYoo0=
Received: from BN1PR12CA0025.namprd12.prod.outlook.com (2603:10b6:408:e1::30)
 by DS0PR19MB7589.namprd19.prod.outlook.com (2603:10b6:8:149::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:26:09 +0000
Received: from BN3PEPF00022BC7.namprd05.prod.outlook.com
 (2603:10b6:408:e1:cafe::9a) by BN1PR12CA0025.outlook.office365.com
 (2603:10b6:408:e1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 17:26:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BC7.mail.protection.outlook.com (10.167.248.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 17:26:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8A8E4406553;
	Mon,  9 Nov 2026 17:26:07 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6B6DA822540;
	Mon,  9 Nov 2026 17:26:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 1/3] ASoC: SDCA: Move DAI constraint allocation
Date: Mon,  9 Nov 2026 17:26:02 +0000
Message-ID: <20261109172604.4077312-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC7:EE_|DS0PR19MB7589:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f5fdc145-7a2a-40a2-6b26-08df3e868ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|61400799027|376014|22082099003|18002099003|16102099003|10067099003|3023799007|11063799006|261028144727099003|261026121527099003|261102123227099003|56012099006|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261009223027099003|261102130727099003;
X-Microsoft-Antispam-Message-Info:
	8utiArQnEdb9Vdcc5eijvmQKX7GnTjo8NbiHv9CMy/GfkVDBu3aNYH6FEhMuT28ZlkqR4OwYs971/dMoLTXlrq1Iye7da/nHBazxarU/gnakPaLd17cD2bVTWNf9ZQN8Nbn+HX2NHXyN8Xp27SJFO+vjCo0IMOxXzbnb54UezFXWuCgJ6Vyfe4hovoe7vI4BzbdvWvapOMteYnzG4VMF/8bisLwnNaE32+6BcUCLHGd+klBRDN+QlJ7KJjlCp2ggdN8KYTlzQrNz4omdNt2uTtayIiWFAOJoc+U32yKuCuvPL62ZSOXX6oMkxoELeaVVflfbgDd2koLDfXOqpmim2r7BAQq5cdavtW4wU3GzFo7kPTwqH1WeQ419zCFcS+UKAlU4B13+Nkn7p5WvIf45YqoxsDsNbdIp/4I5d0bjDw6TGdCSDnD+y+Sq+uXdhfiG36/WiR20yG9zKLP5HysBkCqOdGA8nQd8RGXWWZ1pTXRvghWcv1HBuLcN6ka/4YDev1Ggb1U9lJIK69Xb1lQgg5Su/XCsJaBtdQWAg2L5A729aKYPz1qZedyHcH1sNlbVunwWnmBuzHLFN4Kf/DJjiexP2/U5nLxvTC/Ub7OZEDyMHeaLYvjesiOXnzko116eTChjEHhAocxDcWl5QiN3S9N7yda1xhV1pP8+y0o/hK2f3aHImXqdWAlODmdtyJfuk/L9Z36TDe1mnpbWLXp9yg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(61400799027)(376014)(22082099003)(18002099003)(16102099003)(10067099003)(3023799007)(11063799006)(261028144727099003)(261026121527099003)(261102123227099003)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261009223027099003)(261102130727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+/Z65f9m2e2UMZmFbR3FG3XxM8NiM9rWu8spSueI8/LediZFLV1JgdnhrRkpkUt5SGdSFxGf9XCrXDnCJxNuwC4bKeSK4AXNJR46XHXOfsUL8Xal/MFXdZI42nUeJpBkqGOwW48Ydu6k6tK2vZfjMAjj9n6Z3eSQBj97GvRItwGv8L6RId7Sc1V2YNYbtMnJhU9ky/e1M0EHN1Y7d1WpAZh+DV5Zj9H+ZPLw4anhmiO1AiTwjqSXXXRHK+WQ6TD+iqiBBuiMLjDSISdEQWLkJYlGwHbNdB2hd+f12wE2Ls6BY7ywUl8hT+MtKmRM81AjlyLs1kOSTztBkfEOsFvbvaiarvArFF8isuJ96IlX8XpnZaQ0lxhDn/ExnXurbRKimFrSTLJ2G3CvZ8/tZf9I3prpmSRa3nqxCtU7DfSCvbEPTqGow3V9vNIZKOfdAoUn
X-Exchange-RoutingPolicyChecked:
	IKQZ1j9YZ+xcwXbTcgsq4keBrfYlr3JhwaUl7qBVYfAPEAZCMPYIlk/RViWLvjtHM/O+1jwcc19gRJPCHZKQ9pkuA1SJKeFthEkdOs4rv0UIkeN6QlTMTpEVotHIkFyWdYVl2CZwYQmJw5uh8dvxTIYVRLVonN09nJf0PZYvv1yV7S8qbTeG9iwWiNv4ysdXt8mi1BZVjqeKcuA9XEp0yqAyMB7+Fh3IB602Kuu5X3Ot4cMaQ7eeYadxvv5dKU1pQ3P5Vw9tIMmXReVpB4bEyk1d/ezL6e8uJEqmg2uBELtyTg1/iAGUd1SqKxJsJNu1V0ZoSJPdc8t2wrWOLmGNlw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:26:08.3746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fdc145-7a2a-40a2-6b26-08df3e868ad9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BC7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7589
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af20239 cx=c_pps
 a=BGK54fkyo7uEM8ETl7wc1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=P9r7sxRW47Isc9G4scAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfXxowjr1PoPWUZ
 WfB6v9+5FsJ0/ydoPm1/bir23aC423DwzLihLU61C/3lp6osne2yLBljbBuniaIS5Q2f1vxbjFT
 RuYs519lUKyx1hzScB8nTPRomqc6Wus=
X-Proofpoint-GUID: Sh7GsREknCQw16UnL-giPVUgpNWr8GgS
X-Proofpoint-ORIG-GUID: Sh7GsREknCQw16UnL-giPVUgpNWr8GgS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfXyok9w8LThMFT
 Ulv48t6mZM5/TZzIrZOjWWhCsTmtIGBGzx2yJW9zVQxwKWHpf1t95x5HbDWmQrjJDq30mWq9Ckz
 qrIv9p1+4Lg3woJwzGX1sL1Ofr++OhWj5cJ5dTSnR1gpljLMKmBGvd5xmnEGYXNbucm97mt7oDr
 TA7uThD3xp886+WA1/YODKcM/7l9th0OjzCYNm03mFWizzxhlH70Rfg9vQDArB+sD55jAynTTpZ
 2gDAxmiwyfNL8QJxEeh0TW2zNnOD6OqmuHSumYrH5aOFEU5rJVYlMn7xDhENHsl2tBEVen6Ws/g
 2V8SooKpH/agxPXaKyecELuEMGfYm1C2o4t4zy+2iwWuBcfPVhgpOrGnSy89Ew/ZL3/chKy+c7x
 wZx2ROeJ1cMrCFIKkhoIDR5gBUo0UfSZBi999quvNgTuHM6DolZFB360sjENg/3f/ejb++mk+is
 /Ionys6bKXkWg5rjykg==
X-Proofpoint-Spam-Reason: safe

It isn't necessary to allocate memory for constraints every time a DAI
link is opened. It is faster to allocate them once when the DAI link
is probed, update the SDCA code to do so.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 include/sound/sdca_asoc.h            |  5 +-
 sound/soc/sdca/sdca_asoc.c           | 75 +++++++++++++++++-----------
 sound/soc/sdca/sdca_class_function.c |  3 +-
 3 files changed, 52 insertions(+), 31 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 599a72f335153..236a441ec9d89 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -89,12 +89,13 @@ int sdca_asoc_populate_rate_format(struct device *dev,
 				struct sdca_entity *entity,
 				struct snd_soc_pcm_stream *stream);
 
+int sdca_asoc_alloc_constraints(struct snd_soc_dai *dai);
+int sdca_asoc_free_constraints(struct snd_soc_dai *dai);
 int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai);
-void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai);
+
 int sdca_asoc_get_port(struct device *dev, struct regmap *regmap,
 		       struct sdca_function_data *function,
 		       struct snd_soc_dai *dai);
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index ccc579f878ff1..b8bde56298706 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1434,6 +1434,48 @@ int sdca_asoc_populate_component(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
 
+struct sdca_asoc_constraints {
+	struct snd_pcm_hw_constraint_list channels;
+};
+
+/**
+ * sdca_asoc_alloc_constraints - allocate a constraint structure on the DAI
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Typically called from DAI probe().
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_alloc_constraints(struct snd_soc_dai *dai)
+{
+	struct sdca_asoc_constraints *constraints;
+
+	constraints = kzalloc_obj(*constraints);
+	if (!constraints)
+		return -ENOMEM;
+
+	snd_soc_dai_set_priv(dai, constraints);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_alloc_constraints, "SND_SOC_SDCA");
+
+/**
+ * sdca_asoc_free_constraints - free constraint allocations
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Typically called from DAI remove().
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_free_constraints(struct snd_soc_dai *dai)
+{
+	kfree(snd_soc_dai_to_priv(dai));
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
@@ -1455,8 +1497,8 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 		 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
 		17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
 	};
+	struct sdca_asoc_constraints *constraints = snd_soc_dai_to_priv(dai);
 	struct sdca_entity *entity = &function->entities[dai->id];
-	struct snd_pcm_hw_constraint_list *constraint;
 	struct sdca_control_range *range;
 	struct sdca_control *control;
 	unsigned int channel_mask = 0;
@@ -1490,45 +1532,22 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
 		entity->label, channel_mask);
 
-	constraint = kzalloc_obj(*constraint);
-	if (!constraint)
-		return -ENOMEM;
-
-	constraint->count = ARRAY_SIZE(channel_list);
-	constraint->list = channel_list;
-	constraint->mask = channel_mask;
+	constraints->channels.count = ARRAY_SIZE(channel_list);
+	constraints->channels.list = channel_list;
+	constraints->channels.mask = channel_mask;
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 constraint);
+					 &constraints->channels);
 	if (ret) {
 		dev_err(dev, "%s: failed to add constraint: %d\n", entity->label, ret);
-		kfree(constraint);
 		return ret;
 	}
 
-	snd_soc_dai_set_priv(dai, constraint);
-
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_set_constraints, "SND_SOC_SDCA");
 
-/**
- * sdca_asoc_free_constraints - free constraint allocations
- * @substream: Pointer to the PCM substream.
- * @dai: Pointer to the ASoC DAI.
- *
- * Typically called from shutdown().
- */
-void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai)
-{
-	struct snd_pcm_hw_constraint_list *constraint = snd_soc_dai_to_priv(dai);
-
-	kfree(constraint);
-}
-EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
-
 /**
  * sdca_asoc_get_port - return SoundWire port for a DAI
  * @dev: Pointer to the device, used for error messages.
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 13b70f0f0dbf7..6406c9d0f6119 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -184,8 +184,9 @@ static int class_function_sdw_set_stream(struct snd_soc_dai *dai, void *sdw_stre
 }
 
 static const struct snd_soc_dai_ops class_function_sdw_ops = {
+	.probe		= sdca_asoc_alloc_constraints,
+	.remove		= sdca_asoc_free_constraints,
 	.startup	= class_function_startup,
-	.shutdown	= sdca_asoc_free_constraints,
 	.set_stream	= class_function_sdw_set_stream,
 	.hw_params	= class_function_sdw_add_peripheral,
 	.hw_free	= class_function_sdw_remove_peripheral,
-- 
2.47.3

