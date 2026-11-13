Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794570223;
	b=vfbEEuRGdVUgG9vOmldZlV1/mXbvvMlNOUkL4sNCoMAsRFxTa8+EmVS5VCs8LaVcs0FY
	 BVvobaQl4/CDUvRsnkFg0CzG2/K4uk5Yi/Rh3aURvUK0nbIuvOT6P93iEN/dFz5JtfH2t
	 c5JqExKyVwOUifFvaWqzexj2L60HkltAIxg8Kpco/oPVXBTe++CNLFxBhFSG0Hm5uNsC7
	 Eesd7RVn3EvmSJ2BvBKprb1aPn2DLGx006MHAkfNuEb/RuL5wQsvrOasXXiRzyC9Yb1mV
	 RqmFz/USTlpByPbllqnPyjMGimu7DoB44ejLa3t5ux/APePBdqlUrTHKrzz+RvZIHxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=UzQNyJvyQABEsPVYlXwY6Gfnu0jNcBJdhsmMgoAmxAo=;
	b=H+U2PqJsN7t0ThMxnMkgSdb059Jva9yE+Db8VqpmzM5J6K7DeGIin+LM/DwQCJ0xPgXe
	 nrRPMAuqU70Y3InlCsratqNr42TtuHszz89tiIqF095of5KN51d8CgYzRjLy87tNBNPFN
	 0ddv0XCf2h3amrbaBQKeyQNJ0iLQS9HMWz0FKslrPZSrO0GZa9vfBtlXietfMi/JlOpBR
	 0SA42AWnfWBDjcN7YWCswO346HAm/B7kVfxaOkClCDEYpgnnF1cJnyDwKn5ye3sFDRNmT
	 Xw2Ij3jWmKSYlvr/1WWFAE8ODDJzBLk21biFN1yAhOg9FfZn9bpTlQQl4fEdUNEPjBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=VpSbEa2R;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=vMWEDw0Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5A606A321;
	Fri, 13 Nov 2026 11:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B5A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=VpSbEa2R;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=vMWEDw0Z
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAgPw7055774;
	Fri, 13 Nov 2026 05:43:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=UzQNyJvyQABEsPVY
	lXwY6Gfnu0jNcBJdhsmMgoAmxAo=; b=VpSbEa2R8xGVk1ejMgJbBXzV1ohIDtlV
	tPsu6M8PNOlVM8AvtzrOfaYsIoQxMai1NIMupNgRUvZGXVsPS7I7CIozcZfEL+ka
	uQmI4FanAiUwkVRfUOFKNeLHg1aB0aV1bF8stKc8l7EpPj8QgTN8kPM/R0VH+MHd
	CFCV/5F9rDJhImEYLR825OrrHmOE0nKCHDuekLqFuvpH8jLBEWEvv5CrlV7vnEqy
	uxAEBBo84IYfUxbG75Vb3j5KzHdH1Db3OniHduySavZLAP12MStjPiGeT7U5io2N
	Ct+Tcao9worOvhIlXt1BPNWzsJCLp5jB01Z/Hp3LdnuBZW5+IgbtNA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021100.outbound.protection.outlook.com [52.101.52.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfphnsp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 05:43:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoYMBxwIq8mYaa684LzUNvIRS0Dz3xuOB619xSJNUWClzFXnlkxbhCHHEkLppCEEj2lR0hVooep0rEcSPabyutNN+hVAINkgBPw/obwrDyGEDaWeYqgNGilWl845CDD6guQgkCjYxQuBqDKteswslgjbIpbxlMt6MXx4uiwIyioe3pfi0CYpeGR4lpOtoKmFZ+YdCBWD9sndZmwqS6rx1OfhDCDfzHAOMkBdmLe6euYzmFaDEy9CqG5NoCuQKyy2lThqno2/vLNuiGROCv5ccIRyat5dR0uQIcFcbulebhtUXOtjYw5yGkXW+ZyPp3AxaCuMDMb9Hj0rykKzKYfggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzQNyJvyQABEsPVYlXwY6Gfnu0jNcBJdhsmMgoAmxAo=;
 b=mmtW2s8xk4GmO9o0y1nfWOltjj3+rfuU2WDkqt8+aMChuSJZiu3FdDEQ/TelJxrxneWW04jBIlJEC4R6Zv7WHfyBHlu7nDMB4mivWh9wib6o1ky6zdUhVxQEwBX4P4n7EMMhvY7v/Ewu7WaBkcwWkRau6mSTF/AbCVOph37WvtuwDpUzFMyIZ83XKfMofsegiaHsxgmoRR8djpLIonoggzjgqepWv1ncjINzdbWkOR/lC1J096hVtmWWhCSKV5VT/+NY4Keb9rXa8Jodtvwlm3zHjbERmU23ZbRG+bUoBryq3aE23Y4Q212vO2PoEI+a0rsKQs5bDiHuKrc+fixVOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzQNyJvyQABEsPVYlXwY6Gfnu0jNcBJdhsmMgoAmxAo=;
 b=vMWEDw0ZSsPCpo+cCBOHOPca09Svv8QOsVmQmPObG0NHiBw/oo2YEPCS9zv9HgZ1Cw/d1zrlblSczemqxmbPhiy9xMSCRGbe2Y9OyDMGLxR5WXBLFymAcZLz3glNp4MadklGMPnl9JVHvXD+M/+gfMdHMpeIrWLbnFDVHriIgKc=
Received: from DU2PR04CA0281.eurprd04.prod.outlook.com (2603:10a6:10:28c::16)
 by SN7PR19MB7763.namprd19.prod.outlook.com (2603:10b6:806:2eb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 11:40:32 +0000
Received: from CY5PEPF00000E87.namprd05.prod.outlook.com
 (2603:10a6:10:28c:cafe::64) by DU2PR04CA0281.outlook.office365.com
 (2603:10a6:10:28c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 11:40:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY5PEPF00000E87.mail.protection.outlook.com (10.167.247.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 13 Nov 2026 11:39:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0AE59406A1B;
	Fri, 13 Nov 2026 11:29:36 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DBB4B820273;
	Fri, 13 Nov 2026 11:29:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: cs35l56: Series to stop writing ASP registers the driver doesn't own
Date: Fri, 13 Nov 2026 11:29:33 +0000
Message-ID: <20261113112935.2926431-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E87:EE_|SN7PR19MB7763:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5e402d66-5913-453b-ee83-08df417ad5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|23010399003|376014|18002099003|16102099003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261022105027099003|261028144727099003|261021121427099003|261026140227099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	Zc4WmPf/s5WSCvEYDKXlPhUnY/DRpc9FgotWG0godjBR0iurm18xgGECHkFeHPBlheQGe2n9HpRkOinE+rbFY9wB6vXBMNHvwF4EY+s8C4nOl+ODU5HUJkxFs+YbiZo5LonCIopyxt9V9psoFlp3ViA9eTkiOwPRIcDLyltsLX430Qqc63GUxVMUcserfUmXlP/Vk4xtikUhZChLnW1LP5UsDm7v7/G6LMpEFJ5eQ73qwcBOwG6FX1QkZK1Oh83Oz7nSMFyvBfo4NnidAClWawzWUMYH++Lgx1ZfIsJuf7Ge7bmb7YGHfT7wPyee4bZL2wfcNbcd1DIJhebc/ZVQoEsWke/ydZ6jRjCznf4aHfxJ0Yx1mDI/Z9Ck7zTtGp8RHZOK5qm2w3R9CmWk8XI4ML0YFMgYYAUcsJy9I/lyvr6HBPuJpspDpVzzQYTPX0IGfq8bvTlv0qQslEHlC5QowI9satvRseoQi3M0EqyLdw7DY28fGLFuEUkRp0wQKmphMbWM0oxikQqxvCLu3T/r2LUbPSX2GlwIFuyeseqNF86kFjSexV+6Bgh6ZQL0eNxPj6I3QUqoMr7znUB+fo6G95Wq46nBz73u6HnCJqM2ZD9yMoH/XAgJy6PJvioq1LkWtMcGy4BfLRWgneblQzchUmkBppORrs+AtK4G+KtsEoO6E411vz0p9FBS+9IXAWGz
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(23010399003)(376014)(18002099003)(16102099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261026140227099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w0OYgE6eK3bJQAftm35cEuXJGa+BCotrH+l4RVjFqnh6CMXNgubNnx2iMWipAczgtJ4Ht0axxNbMq1m+2tUhM1DaYfc111dBM60Orj3yMWKSI11NXjMhkxN00aYPu2/H/KvhcamF1vPOy+bYwpslN6m56xpt3mhmMnPx0M+J3oxLQ3k0aafnxt6NuqDtABi8L/REoTSket98tE74jyf4ab8LsJa2vU0H4JAOFfHzjzVVznfEwDGecfjRFPx0P99VhmcyNTtpZU41ArB7XBQR3RBRccXvAXneXGnnSHfWY4/vhU7kBLXCCffSAVb1xAr+8lgZ0eknwOUFPJq6olbvQ2BDJl9/tUfe7YtDE8zTxC1JUcGNscHFROoy4ltG4lj2JYgZDgCU4/9TnFZWMeopGm0ZrLzfD+WNpWLqxT1d3xqfQbm25zjwYQmtnvlSYREW
X-Exchange-RoutingPolicyChecked:
	VvjbTJXt5QfxKpqEEhHKIF34n8RjLUje0sml7S+68zoFVkhTMJAIYEJjbWodejgn3lQBhTyM4H9ltQJVEo56anzq3WfL2h4RRpa1zeiSiGkYdoJZBOIjVb0V1m3Qxc0ROyRUGysr5cSHk3t/malZL5s4gisLXhIS9dMWmc9eqSR0dBc0pgBIw3tAHvxLzVamIbFqAhhgNmOmGQ09PgWeNUhaxkMggkz5e9w0opsBoGXEk8jmrfG2MBFbB6kRLSokzAaadAewzEO1qppfO0V6x4eH+m0mCvhUIHbQr9e3wl5ShAYh5U9lkw9GwdHot35S7s17cgOq9Kc4qtKsaihr7Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 11:39:53.3835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e402d66-5913-453b-ee83-08df417ad5ae
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY5PEPF00000E87.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7763
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NiBTYWx0ZWRfX6SLrYdrdElTl
 KGN4UlznvxFEOl2MGJ9hpjAcgHMGUkro5cFBth8Mtf6iMzInwmoytluPzeq1YJQ2R+Ki245GADE
 CNs5CCIhb+Ry6ZRPpJNuJr+3+mRhtB/j0RSFBMLyKcLqJZOB12Pi4GuIwIe6Uu4pMvMcU641k/x
 frze2ipflE+g6hBjDqTVqfAtTPxOJXmZQsz2ymkgY99XnRLoxiriRBGvdBgRcLml8mKK/fsZm51
 DBYX2LQvlDwrk+p05PuE+XwZKkLFZRJrkq0sAGvXovA72dOUPHqtEiclvf3Ey4Q4bpENA6z4pRZ
 Zwp0DU829RWS8SAyGSWYJoLg5dZ75p8RZSC1Czqsq8+CXANCYgXbBdtQhG22S/5xGAu/747qjE3
 YOt4DEAWeYdvqDINmujITz1Ps+XtdG4LspSLToEyJzS2KJmfjl/YMV9IQR61hQnq1AkqsnTIthR
 PHLmIsP29Hr4vDwd7kA==
X-Proofpoint-GUID: EmMhSpMd_DEwkaziYwPavLO0nQXfHpF5
X-Proofpoint-ORIG-GUID: EmMhSpMd_DEwkaziYwPavLO0nQXfHpF5
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af6f7ec cx=c_pps
 a=oHVU4+OBm0glsEb2BXLEfQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=89hvE5a6wKUJoSs17SIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NiBTYWx0ZWRfX2a3pRq+Wyb/3
 wSsqDVU5q/BDpmz/xMnin35s6UqK7r4x8XMm/WD2ZEoacEBGhOGyLeseeXVjxbDomReLA6jtBD3
 iXovSrQwakIiGRXcW39FHmbKsf+Yrtw=
X-Proofpoint-Spam-Reason: safe

The driver was writing to the ASP registers on systems where it didn't own
control of those registers. These two patches prevent that.

There is more detail in the commit messages of why this problem exists, but
the summary is that these registers are usually owned by the firmware
and/or a secondary (or tertiary) host using the I2C/SPI control interfaces.

Richard Fitzgerald (2):
  ASoC: cs35l56: Only write ASP1TXn registers when widget is powered-up
  ASoC: cs35l56: Fix unwanted writes to ASP config registers

 include/sound/cs35l56.h           |   2 +-
 sound/soc/codecs/cs35l56-shared.c |  38 +-------
 sound/soc/codecs/cs35l56.c        | 147 ++++++++++++++++++++++++------
 sound/soc/codecs/cs35l56.h        |   1 +
 4 files changed, 124 insertions(+), 64 deletions(-)

-- 
2.47.3

