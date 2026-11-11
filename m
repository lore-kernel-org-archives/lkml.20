Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794414315;
	b=456Higp07VDolwEmKdgDX0lchpG+v1DZBFpKUddUJUEUxuOSnO+sQ5+glSmNGdlRbwre
	 s6YhpLNfKDCdvJEfPTmLSu+/kwPSbHpfoWFHOmY3xjPWdOWAxWaNhg9XJM5roIb0NDAWy
	 zBGCmZd5/nXp6eRRFPjZWZiBffEyb1SgAyPWoZM016r86pWdcUZk7qsdunaiEVXf1BBxh
	 TeMbAkVaa4QYBeZvckT3cwIpe5SVxn+k8Neq48MtO5QaLA3kWK3SN19vdtO1YBAyh8HMH
	 v76ZBgWha5fmjvAGven9VAHoLy499yHL57s07NlEgMJsuxJxOyB0MaYBRwNKiwomtmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414315;
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
	bh=xzkXu9RvGKpDchHfGH44nC6Abriey235cVggRLOORwU=;
	b=4jZdno/Ah+DGHSQZMonXuyU9+6wQaNc9iZ01Zye4BgXQm5ybQHR0Apbkow1NrD6TbZ5W
	 J51Mrxa4QGiNLP+fqDIxVlec+Vf1ywWi2p2XDTzAFXRFc+nbXrgpwKGGlhlsfDJMvxLAl
	 1409iGa/OolHHE4x6fc9CxZu1PMT3dD/byG80pQ6PhkGxZAAarWULCr5vd/p0eVwPPciy
	 GQM5pfTWhX1PggPXaEbR/9gSpS+Hz0SsqSiMIcMpRQrtLTX8HUOuuOBbz+CJn0o6u58bw
	 iB+wsp0bAQFbXIvipV+U3hyMRfXR74vQesiAbzG8vH77suXkiAoqv9QUJWN6qNo/MHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=SnLjk6Y3;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=UVMf0u98;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B9D606A330;
	Wed, 11 Nov 2026 16:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B9D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=SnLjk6Y3;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=UVMf0u98
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABG6ES94091068;
	Wed, 11 Nov 2026 10:24:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xzkXu9RvGKpDchHfGH44nC6Abriey235cVggRLOORwU=; b=
	SnLjk6Y3AdlChLgGbZJBdMzxPy+sAIE4WpFqHeatscguH4tB9tvuUl7VTWHgZkI7
	ClViQHdumeK8gmg/2e4qAf0FKRfwYlYoqhVDvnEvrYbqCUXAovxq7wZEebMXzouU
	RVdqE9l9HxQBNQidGrFYx72b7n2p23DmFKTiEjonI90jkcRqogbgAURi5r+xUq1x
	1jgj1aeyaOgjzGo9giZpM6xsmo9oABzS7QoABh/r2aOQZ/UwpOP0Dym3KO7MqXfN
	kCEorGh4TmSPYAINSer2WTeDR1XdvDksJW6NvK1yNvhe6ym4vrC0vyf9qB8o3Aus
	szfhBD3uDnz+JSjvQHWhqQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020119.outbound.protection.outlook.com [52.101.46.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7ursu2r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:24:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9w93PLND5oIJQI4hyon7w3yR4baiI5hdEtkWj455dZXj8Yakk0qCPJvr7ddURfD0m/sT0mdTo7RZ5vjtPwneiKl9kXeUfRxEPO/Hn1FsX1mj5ndlHnb0LkYIyzr4vXzzzf4eGagewqMBNY/TcHi43Vky1I57IM47k9Y22bGWYUBz9oFxfdwm4qT41VANCSF267W7BP7EmTa48mb8XtNmyu3LQwX9kMgmQKN56uURcwnWWf46NqbwGBEyqXZUuyB0Lps6GUZAdsyApRl5ooQL87qK3zAER+IooIqzPTenpJnNFhADwydytlbHNbx2Y6jYY2cqm8GIXaqVT5MQQRjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzkXu9RvGKpDchHfGH44nC6Abriey235cVggRLOORwU=;
 b=qqYms1gZkIQ3CVFw1S/PUaOnwqvyJp0oHxLpJspPnZj2vfWwu+okPPhNqm2rugp87GzhQ18MXebDiockZXKsEviU33Zp34NRZ11MhzRjA+esced3hn2JdDTPeiNoZJvGYPBemDjaAd0ilkLH62zlPqIGpoQ437Fcux6IPOQISP/Fav2wgHnM3FeOdPUCFK0w6YyXtc1IEsz1Sdl4cVyQm9aZ6+XOPYHWfIHotKSj08RiLseyNVJIh5YDPLZBBghroo6EGq3b/rhl4Gp5nZH8bm+dajqlMaAOkke4KueZIlY4yecn+v5aTzsdfTPzFXogtid0l0AiZXlMrON5GCjkUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzkXu9RvGKpDchHfGH44nC6Abriey235cVggRLOORwU=;
 b=UVMf0u98RBlaG4QWYzoWHa1ulvDTq31PGtDCiYA1bC3FzXxEaFbxIuw/dtiL6nmo86ySbM0uTtFbpTVgM8Q2xVN/YP6eAH76w4VwRFL7WsoDJCuzJfJmpeUpEHPmjgtHSEXQLQEL8gcwgYz9+Ca9HdlSYPzrPVo+IbMYkM3PA9M=
Received: from SJ0PR13CA0018.namprd13.prod.outlook.com (2603:10b6:a03:2c0::23)
 by IA1PR19MB7616.namprd19.prod.outlook.com (2603:10b6:208:3f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 16:24:52 +0000
Received: from MWH0EPF000DD30E.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::65) by SJ0PR13CA0018.outlook.office365.com
 (2603:10b6:a03:2c0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 16:24:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000DD30E.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 16:24:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 90E5A40655D;
	Wed, 11 Nov 2026 16:24:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7E3B0822561;
	Wed, 11 Nov 2026 16:24:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 2/2] soundwire: Assume default maximum valid channel if not specified
Date: Wed, 11 Nov 2026 16:24:45 +0000
Message-ID: <20261111162445.1371853-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
References: <20261111162445.1371853-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000DD30E:EE_|IA1PR19MB7616:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a5101af-fff2-46bf-5086-08df40104f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|23010399003|36860700016|261009223027099003|10067099003|261021121427099003|261021123027099003|261102123227099003|11063799006|56012099006|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7+er/2OQqdQGb8x0a6yvyUjqTj1/+19lMWkxC9tsHVkqJYCApe+LgsqbFC20FXcffkjfH3HA3aeJhbSb/XUB6SsrxL1nlXS62M2mDdJavGuG2ehfov1M3j9oPwkAe7Z+EYEaEvJ2NFvIt5firdCIed46dvEAqd9nfkhGRWRAiP6+/kWEvXtbuyA6fdzhZyvPQ/1kstEgM4xuWb1zozKDseyHfMndNZrrNDJKMtqcVyrUt9umk7A4K9pSIbAt27/Z8t4hhVS/XnElLpdOFqs3i+NoOL0H+3h/NUHcaChr6Y8POVUiNQKa9qDu9Zld9GtVq/yKOEycamLQ+KARoNWOagoPiO0bAq6mwBGuOZJ+rvdhMQCHHnS9yVNf7hQx3MY/e0np8QUaJcDUDEvodSl0mEs+TO16u03bpFzAXWINcpx+ggsl3LJaWUsLmfNIT3Yop0jpIVBGNxkOjpBJ5o5KaEEQjy7K5LFYyUYRG/zBfaLVjJQytRLsIjQ/5nZm451FITpF2Syy6X+LDVlDQR65W6I9bouaDehTjk2b7wnLfO5KLUYto+zVDj7OtJJWRf12M9CWgKMJlESRu5owlcmQlPlQ1lblOjNS08ZEkW+IRwbwGi25xNFCzkvalb3Lnszr4ndWe7VfDedj+5fXCqXouBbCAUzMUX7meyNPHZNQUZtrTV8K+6gM7EfiSXDqBOZ8wNBnVvPhnBjqdi+Yb7JLtg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(23010399003)(36860700016)(261009223027099003)(10067099003)(261021121427099003)(261021123027099003)(261102123227099003)(11063799006)(56012099006)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZcbAlBs24LCr3ckbqLEjZHAsrwKP/7AKXjCyvaeVhJgPM214Jmwxku+curR3rHkx2P8StxTobreyWmQYJB99IiP6APB7fo4s9QPzzO+f+SkMAZN76ccA59SyEEnxvpUpU55/ijh/2HiJ253aDDW4QLtlQrlbAY0WUCzBBjTNRqJtcFi7B9CDHTk4za3HpuWAKvnhhBQI371TTMIxVLwBkGIDfWevIf9V3Ru8eIjzTUgkuraMjRl/Pp2n0T2fAHMTPqPDL8A5IuSPFN7ssLT6FoewGy2pUSZqxbTCFdz29wSgAhdGvFP6kTauKW2Z+xvG9BtWsCih9xhr3xVJK8lvHvdvIpRrYVzkWmwobHvkzSkUp97ujUwtWehZRxKRHb6hjoTchmrqJzBGR0mluu673kK8lZ279Th3JLpV9nd4NxITI3lo4I4/expiRo/o7Z8p
X-Exchange-RoutingPolicyChecked:
	XK7LiQLrjHX6yrQMoccPcmx8s/R/mNssQVOJZ7jdQ4PRtjBjHtyVyHk0+1Kd8UOC+VIQz6Ltm17hHh3SsNBuqOKFfssD55BMVDqpCIqaHHxzqFi9vmvfwdvV8hucIZV756A+Kc5stWBXmIjonOYx8xMy4GAvGqKaT+8oAKDh/Zjvz7YX1qhJOkKgEHh3AepvscAP3HR661DA2xER7hmX39nQv15TrWHBQpARtCVxnL58fo+SMFICfqzOaPtOeUm1oyLCYx+48kPcTyjorx6oRjqOE+Bu9CcPv2TolnnYkklelo/QBVezXmPRxrRuV14r+9QOZV2QHlQ0Hqz1EOi3VQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:24:49.9302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5101af-fff2-46bf-5086-08df40104f35
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000DD30E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7616
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfXwJAlTYCxmUuE
 fROU6QCuFhHZtz4pmazcOgUm/ftRtXynJutccWT7CpiJYoJTH1Vf4Tv8bzLUkong2je3uy1yN3D
 bAUMXKLEorjv8sk9eZ+ZZcGz0YExuTxN+JgU+B8DN1Zf3S3JSrwEKIyqAX7SeiO3smlLieUV6rG
 FqJZVrqkSTAbEQAJeHZnyh9l8lvWNOEkywht5tzkt6gc7rXeb/FGmTSQZ/pOxA9dVhrvCTIBOxo
 xaQ6chZqHG7i3+vk5h7EcurUIzuaoGrdbxnjiPHEea4UxDoNh4yBSKfUs28HgKcb31MQK4S6OjV
 E5mwrPXs/M1Ns2OKC5tmGt0fD4LFO7d5XuRCb4Pq8HO+g6Fj2+2d2Vi4ta4iRYywj+xuLhryWW+
 wUkIt6f0XQUhSgVoFD7g5zYhrkwkVgqAuMsl/YgZV1S9949sumZyMVb2wTcBezC2cxhKEQIITu2
 n0/GRxRU16bDq3UI1Ow==
X-Proofpoint-ORIG-GUID: ayUm9oaJ2Xb4D3WiusnAuHAJ1_1V4pVk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX9hnNa0wiQcz9
 K7G4V41Ww9q60qq8QpQ3MvWZ5ZJ4j162K6BFcfLAx783RwwHNYlYETmAhiqZJtJnbHYkS4g0aH7
 XA+3LprWG/GGQp+JYzkjv5ZEfG3frCY=
X-Proofpoint-GUID: ayUm9oaJ2Xb4D3WiusnAuHAJ1_1V4pVk
X-Authority-Analysis: v=2.4 cv=JagpPkKV c=1 sm=1 tr=0 ts=6af496d9 cx=c_pps
 a=dV5UnTNaioTBtvBhj0ZdMg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=hYcZH12gkUgBvSV9ZRoA:9
X-Proofpoint-Spam-Reason: safe

The SoundWire/DisCo specification defines all the supported channel
properties as optional and states that in the case none are specified
defaults of min_ch=0 and max_ch=7 should be used. If both properties
are not present in the DisCo the current code results in min_ch=0
and max_ch=0. As min_ch and max_ch are both channel indexes, users
can't discern if they should interpret this as the default case
(1-8 channels supported) or the DisCo specified a single valid
channel of 0 (1 channel supported).

In the case there are no valid supported channel properties populate
max_ch with 7 as the specification suggests, to avoid the ambiguity.
Also as the specification says only parse the channel number properties
if there is no channel number list.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Moved the parsing of min/max channels to only be processed if
   num_channels is missing

 drivers/soundwire/mipi_disco.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 259ad98b5b7a9..2dad95f8e1ab2 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -284,12 +284,6 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 				"mipi-sdw-imp-def-dpn-interrupts-supported",
 				&dpn[i].imp_def_interrupts);
 
-		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
-					 &dpn[i].min_ch);
-
-		fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
-					 &dpn[i].max_ch);
-
 		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-number-list");
 		if (nval > 0) {
 			dpn[i].num_channels = nval;
@@ -307,6 +301,14 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 					dpn[i].channels, dpn[i].num_channels);
 			if (ret < 0)
 				return ret;
+		} else {
+			fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
+						 &dpn[i].min_ch);
+
+			ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
+						       &dpn[i].max_ch);
+			if (ret)
+				dpn[i].max_ch = 7;
 		}
 
 		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-combination-list");
-- 
2.47.3

