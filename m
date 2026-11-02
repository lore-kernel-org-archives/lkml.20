Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634894;
	b=2KKJIwEzCh1R80bpu2l/kk5k2KMYdWnNAzHzF4hSBMCboVv7ei/7uJ5nzraQ51/RKy7q
	 LaWGIIxuhYBr4J5wWyHh77bRZ07UjrOllXF9Rb5zHDKtwBLb4pwa5fvbGbZ4mknr7a7uv
	 Xpro5Sbn8z2PFtdoduPQveRIbdtoXLerFJv21k6xRJXnIVjdGBasKh0L7u+kvd6y4I/ah
	 SXwo30Bj3dmxRSuuC880F+9dh1EVTkvl6ZLcIYqT5p2QXyyh7RsJrYk90QGvhT8hCTyux
	 WR05ogEtlCIxayuj65quAcOfNb3XXyZfI6l9Ov6ewFsHcVOHn887uJrGQR5GOl8a90w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634894;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=AMGeIWe2YdhLODcV4Q3jBNR1FSGXpYqhw6KgVztwML0=;
	b=T4qAGMrCweDVjVOLGa/KbqUUH9NVxsDjA9jEWp9bkP0c+dpnhGnbPPbeNV4s/++sS1Rz
	 xis3lVUr7/7/HDuoLeUBj2CsHOzXVYpaPFBxhHNvXMWOkfgw/8F0tH8C36mHv4GsOZV0d
	 r0Zj6UWYBg5GfotJGbfuhBM2xUiv1st5uBXjxgdWOP4E1UEujqW1HZZJQ93Zi7JQsjOsm
	 8J644iJDNNbIOAAUZTd2tWt/aDyb6mTt1d5ctxc83T/kTHY1pmzwfW3seY/bSyFu5de+u
	 XLlPjlbegOrq4Wojz9DBo5ZjR736Z3GDC3WucpnI3JyPhY4AX1MAMwZA0lOfMDsIZGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fcbVrPgN;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ywB3z7+a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CA160AAB5A;
	Mon,  2 Nov 2026 15:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6CA160AAB5A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fcbVrPgN;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ywB3z7+a
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DPBkK2776587;
	Mon, 2 Nov 2026 09:54:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AMGeIWe2YdhLODcV4Q3jBNR1FSGXpYqhw6KgVztwML0=; b=
	fcbVrPgNVNcumAjabgVIzQC/6TPRuG43jrviCxsiD8X4xk8+qZOjrWUNLBG3xRTY
	fzmj6VN0CtD3/DVmWixyGCO0QC2fDm4iYqJMyijvGh00vbUkH434xsrJqEQhDp2N
	q1Cb+W9YbZ6dHTjuwXqTdjIOyiUQrQuzkglErBlOfRGuL6Is5ql1+/pBVt7m8TuO
	VruoT84KOda+zK/wAgGL7HTge+f8fPnCFcBhU5Sdldurm0HaB28n5+i0rci29po/
	kQVy8lrQBgAOzSDy4TRtT4KfF0wOLXGjojm2cKzts+nqHk0E9+iuIqttCL4uQJP5
	PNHxRsunaL+xOv1M1VBftw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020125.outbound.protection.outlook.com [52.101.56.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrft6e0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 09:54:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGQixK/iVqF6V62ZmHQt6fXyz36rJTyR4Hvj1dZtnTWDEObmHxdmp+6LNoa27bJruCkuAOk3DtGNbiPVj8SYsEL6/ouJUIk0LBqhi1K4ETL8JkGdkKjxHc0lzgV+WhoOWZZ/uHe+qKQr72dzNxYzx3UuJM69aD+f2z+nIB8eRsr56VXd2No9+FyN3HY0EHZwfXIjM3mMHlIsObRWSxs2yL52r1Fehu9Zx53v3CvggObnb0MSWj+YFjStDukVRFgzjx9VTLh9m4/g/wJMzhHZZ+GMbEKj2lNXfbb75ZsegVkNwHVWW2FNoLYsbPx2uhJ6AiJfc2jSIX8EpB45YVvRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMGeIWe2YdhLODcV4Q3jBNR1FSGXpYqhw6KgVztwML0=;
 b=r96zq9r7KzOS8BJcywR9uLtb4OFZnnv/KtSsKZXIgC2pN7mxTJ9cpXTRZQqLpDZILJP9NxFj3JIPi7WDseM7neUxU+oMRxWE9HHhcfS/5LEH9Gq36aB3eUkkGlx19yPeWAFJHJVmlLQ0OX2t9/US+pW94KDJlAo1UC57YtWDuBqXUmO+Wndm/ikMcUvqAHgsusfwNmgmadPzQZWiLvJUk4Rd9VISfT53Kn2MDCJ/Eklb5JnwxvPm+597prCLrWvfHnA6Jxgat2rO27kb6eW6vk4IvrdWBRkWOGAnXbS7Xq2h1R0lzenaiSO9m4w8sdZVEEnNw7EkJCTLwa9hyeksDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMGeIWe2YdhLODcV4Q3jBNR1FSGXpYqhw6KgVztwML0=;
 b=ywB3z7+aQr9BHSDi7ze89+G/t8XxiMXjnDvFHLVrMJjJkw6+ub9Ra+jXRdTTimQK/MfPWqj4l8tpXUkglNBY1gr3yKhl7WaRSgJUTdGpey7i5oqDd8fCaUF9Ioxi7m9B9IGL+9iTYpQyn0WVIVNEmy8yJjZjuzzFWOIX3CWyMaU=
Received: from MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::29)
 by MN7PR19MB543400.namprd19.prod.outlook.com (2603:10b6:208:5ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 15:54:47 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::4a) by MW4P222CA0024.outlook.office365.com
 (2603:10b6:303:114::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 15:54:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Mon, 2 Nov 2026 15:54:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 63A41406552;
	Mon,  2 Nov 2026 15:54:44 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3D7F7822563;
	Mon,  2 Nov 2026 15:54:44 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 3/3] ASoC: cs42l43: Improve pop performance of the input power up
Date: Mon,  2 Nov 2026 15:54:40 +0000
Message-ID: <20261102155440.3995136-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
References: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|MN7PR19MB543400:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5d798544-09da-48f1-cdc8-08df38f99e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|10067099003|16102099003|22082099003|18002099003|261102123227099003|56012099006|261009223027099003|11063799006|261022075727099003|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	1dx5pWbb1Jxno7dy9hpHje4JaIUd8upznU/h3q/oC4bWuL+QaZmVDPVwmALCBr977O0xT0MMdYYQ2bgWHAHqojTkm4n0U4VNtkr4KFMA+gs9Dj6gfSBTbw/SisO+GbeNlCCuSG8yHV9STt6yr0sXuLnY2hyMcDBS6RqkUZj/H9VitTgI9OwR78qaqSJ6ROmpPG+Htlrv7V7z0BCGW9oxAjEsZ6vOsyp2+9RWpfPy4gPiamlNfXxJ1WNaS9e2UGcbYRU8ncrGsdgGoCAFDVEEgpst+8dZFgyW862RD0FiBrahcRDPF1F8+0tm3m+J7j4QOYNBYWdPF2XmAzAMnXCmIEVTVDNPytZEIK9HTb4MFCkGSDkH2TmoYgCYXHfMiaJ9AZqGp8u3n+xhvD4iZLKrFV0HeRgJ81Tz1vjhqAi34sjmwIuCpITbRemu+mG3Gl9cam32/MAo7WYJxjguI/a7RV5YxP1y7xedcGOSXKkWpJ3NKonTzGWEIK0HDGqw5zfeAsw6D1O2U12sSzXLgJ8+B6a+ynlI50AWOQxWVE6epoPkaKlMtRujS+Oe891xz2Ll0c+209c45UaGU5eE2+ZDRDMip8648yZyUzjk8zsCMxElKqkbWN+qilpd1JLzctVh/EMEZYsJ/xtc+k35/ESU9wxAXVppvBx/dHQqQhQzY8O9NGg1/P/Wu/WxYIHB1TpyuCgMjjJxZdlFMp49AJbwxg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(10067099003)(16102099003)(22082099003)(18002099003)(261102123227099003)(56012099006)(261009223027099003)(11063799006)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+ISMKEtSrCrDoSdeB+ldz+KPqbFD9u9OzGoX3YfjsUthU/TJVM+gQ6P3fAhnnkvvUZiX7NgjclSxgjvDADIg24tTQQQ9zueCKCgHXAefW6IAlo1rR4MozDIwpWCzUuq45/Pflo/9ARadNumJFjj3xx1vnMTxh36AQLb3ekN2E9uma3sSW1v+vZCVx1KpuKhESml9tKHAa9fEEWciVrIHboqq5Nr7gq/B9/+uCkUQMieNHqshLKVvj3CHUs8buirBb7RuJkuaY8dXKZGe84MPT3/VaUOhG2aH1kfKcQMkb+7VfRgNBONcT/WMkqs5Ad8P1Cb1DNVc5VEsqU99MGbswBadfTpimr6H/kjQ0pAUAZxsXO8EiOvCNIotjlmPAbzQQLTEv6fbOJKdeLuDL7R7ROdFd38vl4ZG0BUtMONYkzuL7w1YpT4fwjnJz6WQ+IYg
X-Exchange-RoutingPolicyChecked:
	ttr4Xi59qnSTqyJnm9hTFfsPL/CJil3ve3SeZykug72vkZ5fsM+8c5mF6UNcC9fwHbQ/BKrBabeiCruRMP394n+UhgcRkcw7h4qJ1j3HoZU2H203LggTFigggDktVidTGN6dTSt3jjdqBXA7jeTVZtwjTzb+uMtfXO/aZp/if3UKJxByOgapFs88G0bUJxecjUxWPv4YKaE96DCd0p0L5JZQ5A5YNtBfrMbuKpJNWX/GE4UjBbCvoAdI2kPY0ptrKwVuLbX/+QTbxUbJmxJ0T/UpTtdYOJ25O4bd+NmxnifwcaHzZEUU6gJVu5Po3ehfup+FWDC+zNmedGAWHJ8sjA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 15:54:45.7344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d798544-09da-48f1-cdc8-08df38f99e1c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR19MB543400
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX/qKcCZY6xSRB
 WczZ4M6MyZSaVmt6k1DfSQpxtIDITMKSNzRhC2SbxIKapK+mFcjMWvchrnktvX475rnQey+Wg/2
 Ka2GdiAHnukuWRLS4uwdt92lsR8xZWwXtIPjxcLLQrTlOLeVPLSSFBDJlT96jMZieWC+6x7y4hY
 48cvs5hq26VcBZE1YYB+EN9ox/oKBdpCRT1WwPdD7XP7ebhns5ALtT5Hlst8A/79xzMkCulBerg
 swrHL8ggucr12zQyJcEexFRdvN0Y/B0IO8xhPNTeyLOhDFmNRi0ZozU5g4g1f6WM0qG8sj0GjxP
 DxcrTZkTqIZkBCIOlGH7NurCu88i0wu0cadZxyCGkWLy1m39a/L4N4Pu+5PiotiF8itGSZ3ctvX
 xLQoWz6tgHIEQPR0yh4AM3rPSyG8WXD3poU57dtcK0m04LRn/6XZHmiuX+IIsEbYvNtxnYDarZz
 hxzHnPgrMejxCuz1lcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXz1HcqVzkMqP3
 9gKjS/8oG+Qi3PrsyXrSCXnzUZ+AYxaH+oxJ599y3RyQkG2PxWsdu/LLXjldqXC/LfMpH7sTNSj
 BwNlA23segt6TOzl9lbl56kI5xwyscQ=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6ae8b24a cx=c_pps
 a=qoAvcrxUHY3FHMzwJxUv3w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=dbI9QKhqGoZ0TsNctXUA:9
X-Proofpoint-GUID: rAPe3FJwdEEpMwhZg7nz-Zq1-LMkHj5Y
X-Proofpoint-ORIG-GUID: rAPe3FJwdEEpMwhZg7nz-Zq1-LMkHj5Y
X-Proofpoint-Spam-Reason: safe

cs42l43's decimator is particularly susceptible to discontinuities
during startup. To help reduce the pop noises adjust the high
pass filter settings whilst powering up the microphones and add
a sizable delay to let that filter settle, then restore the user
settings.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 37 +++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/cs42l43.h |  3 ++-
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 17d55a3de9de3..9576f7abba97f 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1737,32 +1737,39 @@ static int cs42l43_hp_ev(struct snd_soc_dapm_widget *w,
 }
 
 struct decim_info {
+	unsigned int freg;
 	unsigned int vreg;
 	unsigned int vmask;
 };
 
 struct decim_info cs42l43_decim_info[] = {
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL3,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL4,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
 	}
@@ -1770,26 +1777,32 @@ struct decim_info cs42l43_decim_info[] = {
 
 struct decim_info cs42l43b_decim_info[] = {
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL3,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL4,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43B_DECIM_HPF_WNF_CTRL5,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
 		.vmask = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM5_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43B_DECIM_HPF_WNF_CTRL6,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
 		.vmask = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM6_MUTE_MASK,
 	}
@@ -1802,6 +1815,8 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct decim_info *info = &cs42l43_decim_info[w->shift];
 	struct cs42l43 *cs42l43 = priv->core;
+	unsigned int fmask = CS42L43_DECIM_HPF_EN_MASK | CS42L43_DECIM_HPF_CF_MASK;
+	unsigned int fval = CS42L43_DECIM_HPF_EN_MASK | 3 << CS42L43_DECIM_HPF_CF_SHIFT;
 	unsigned int vval = CS42L43_DECIM1_MUTE_MASK | CS42L43_DECIM2_MUTE_MASK;
 	int ret;
 
@@ -1810,8 +1825,10 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		priv->decim_pre_pmu = true;
+
 		ret = regmap_read(cs42l43->regmap, info->vreg,
-				  &priv->decim_cache[w->shift]);
+				  &priv->decim_cache[w->shift][0]);
 		if (ret) {
 			dev_err(priv->dev,
 				"Failed to cache decimator settings: %d\n",
@@ -1819,11 +1836,27 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 
+		ret = regmap_read(cs42l43->regmap, info->freg,
+				  &priv->decim_cache[w->shift][1]);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to cache decimator filter settings: %d\n", ret);
+			return ret;
+		}
+
 		regmap_update_bits(cs42l43->regmap, info->vreg,  info->vmask, vval);
+		regmap_update_bits(cs42l43->regmap, info->freg, fmask, fval);
 		break;
 	case SND_SOC_DAPM_POST_PMU:
+		if (priv->decim_pre_pmu) {
+			msleep(150);
+			priv->decim_pre_pmu = false;
+		}
+
+		regmap_update_bits(cs42l43->regmap, info->freg, fmask,
+				   priv->decim_cache[w->shift][1]);
 		regmap_update_bits(cs42l43->regmap, info->vreg, info->vmask,
-				   priv->decim_cache[w->shift]);
+				   priv->decim_cache[w->shift][0]);
 		break;
 	default:
 		break;
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index fd50feb26ae99..2dc8d530a1fc0 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -61,7 +61,8 @@ struct cs42l43_codec {
 	unsigned int refclk_freq;
 	struct completion pll_ready;
 
-	unsigned int decim_cache[6];
+	bool decim_pre_pmu;
+	unsigned int decim_cache[6][2];
 	unsigned int adc_ena;
 	unsigned int hp_ena;
 
-- 
2.47.3

