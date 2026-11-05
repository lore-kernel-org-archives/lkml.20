Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793873305;
	b=gEmg6+ZVGUm89lMgb6UT0pu3o8LGbWtUXdo0Nio5F+oDFlCSkBPT2pXcJ1/34csoKvy9
	 MaDjzLpu32xGGlTPpVhsy2xBK4GsiI7iBGmy960Ym0/YwTYTOGaFL1StUQ+b1TjElvMLJ
	 oUk24C7+LsDkXOePBVzGH9D7BYOgBzexMNReqYNGjyMItw2ynodiZOh/OiKIMQHvb+ImV
	 aWPOsieB0d9jBwtZwUpvAWlq2Nb+so5ndW7jEMCL/kgRLv0jORATSzAsvGhPeMeJF2VS/
	 T67rcV7fnINHUL+TDp0SApjtu90Wn5acEugrDmPbZrMN+kcc/WZ+aBL3B3qQII/vnGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873305;
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
	bh=UI9A4wcfyrDfcpbNF9l7zPrLSDY1xum7VFopjbOtyQE=;
	b=o9cGLVGhu5XHFuha4sclEGjDJSKbIr0BgK2pGtjPwJ2J7EC8pp6VwtKbQWhdTCQp1Cpv
	 Zqk0FLvOpe1YTWOUzqu2ANU76IxwEvSyZ+JAQ/m4EBNAhVVfyG2TnMzxvy+fTcX+TKknC
	 C+ILqM8iD+2bSWHU8rymZ0cvVxTdat0elnpYs0T6VzlTwH9FFHepQh7Z9/BtxQbX+ZzFr
	 lGy7ydzm1FeSsxhwDIL98OjOq0aQRpDpkABIiSXCvM6K/GKCAgig/1ePSTB2Jh2M872rr
	 lXyTfgRUIoUQHQ/KlDL+jZhbfLC2o/ADZ0T4yjpEBq/+OOXd8dSY+KcdXkpZlWBA8Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=lEhipjAU;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ie5M0xce;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB21606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB21606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=lEhipjAU;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ie5M0xce
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A58rJFI1128131;
	Thu, 5 Nov 2026 04:08:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=UI9A4wcfyrDfcpbNF9
	l7zPrLSDY1xum7VFopjbOtyQE=; b=lEhipjAUjIqpxn0wR30sy3H9x0VGThucz9
	58dBi0YZKgim0I4AC7CNwckREhqZDDiifwtnbPXrfemIb2uJktxN0Zdf/hSvKxXJ
	xZZyMRpCEo17o8gM6iSLo49fjk8WzKqfSHugmq0JxowYFNj6Zv3smFkKVgob88Mj
	rhRyYARozc9GboRACLKMLF8RLggtqESkJEiS3kzp5S3tc3ltjGQLBfb849ZnJfL1
	9vm9Hu6gXn7DhYp0K51xAayPDSXrHZaCVhbfUsN6LdXgjcg+xSHeJmFeEbDTfd6h
	ugVzyJOH+6AwtyWXFbV6pQHdcY510kpmns4ImO1PKFm1LPQI66eA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023125.outbound.protection.outlook.com [40.93.196.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hr7c79dfc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 04:08:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJOGFO09Av7sODV9Hl361ijPMO3rmWmZavggzgsVDGKFCJ9TfYnJ2HLwVSWlfySFsoQxRk3SdRhAaYVGTDNKQQNQdV0k1yXVWuGFXNoF+KcJT/+GkpFB5EprtTmY4oz4fjl6MkOViV2TqjKqr9cEQDGXEd/HYjZfwMHiC44lxkGFjnYqTZZg+laP3jfMukySNBLyiDl35fG6zrAH7Q6/oX0o06NpZrRcHAECi5USXyhIHwUSzlIsL2XR6tBn7zmltadN9bEzsyJC1Dc785TKOPGferwWIBcVFXjeiNfx/cc11da54/z1tcJulYYQ2QK9cCDyPMBcJO34QMA/Rlnvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI9A4wcfyrDfcpbNF9l7zPrLSDY1xum7VFopjbOtyQE=;
 b=cK4jQovqsYQ0TeBkZSmrJ9ccqVnS0Sin+Xu9Xpr9PIVJbrd+5jc699/flw6ytGm8PAhI7xf5v4g1tuibVi/2NJhk7WMI7bm2FEnNjhMjdt4QNcqeIjjI8h1o24m3MYJDmXRy9IZXKVzoT9h4tPBnU/Kc8zfK5yRFgwNrC6mlXQCmeYFChBGgqi46b7Acceeogtp1HrruztHx4Qcmex/3IaILOAWOLKtqv5/zZqMZYgT75y04B2NyeoMJ2OjW/Ozl35qxIQfYWRnfT5N5fPr0aVzyYJtKiE353jp9wxF2p3Q/VxFWjjXhm1xuwqQfBqGDNhEtpuKK8VkXqzxZ0LRbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UI9A4wcfyrDfcpbNF9l7zPrLSDY1xum7VFopjbOtyQE=;
 b=ie5M0xcerCGLtxzIUXR3dnSRCRMxgZIyt/wN+wFjTGOWrhPVsQXL0/s+Ak3wXJDPLo6AZp2m/vz/r90s2sTCy9tpVHd9/DeRtO+lZX1o582oBH+UMQDLUJ0dc7OOGqf8pB0gohyIBYTyblth1KZgv49UqX2lKaIu8ppsAlHj9TA=
Received: from SJ0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:33b::22)
 by LV8PR19MB8624.namprd19.prod.outlook.com (2603:10b6:408:260::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 10:08:17 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::6b) by SJ0PR05CA0017.outlook.office365.com
 (2603:10b6:a03:33b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Thu, 5
 Nov 2026 10:08:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 10:08:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D5C7240654B;
	Thu,  5 Nov 2026 10:08:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BDC59820273;
	Thu,  5 Nov 2026 10:08:09 +0000 (UTC)
Date: Thu, 5 Nov 2026 10:08:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] regulator: arizona-ldo1: Fix double gpiod_put() on
 enable GPIO
Message-ID: <auxViNgjGPRdpfa2@opensource.cirrus.com>
References: <20261104-arizona-ldo1-gpiod-fix-v1-1-5b3c02d8a4d0@gmail.com>
 <auxUGE+zPcnAR49k@opensource.cirrus.com>
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
In-Reply-To: <auxUGE+zPcnAR49k@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|LV8PR19MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: bc30005c-e740-484b-ac74-08df3b24b5c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|61400799027|16102099003|22082099003|18002099003|13003099007|10067099003|11063799006|261022075727099003|261028144727099003|261026121527099003|4143699003|261026140227099003|56012099006|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	O1oLDBWE0ls0HqMhNgNvQzRLhO2UFDR10L2z1tu+jmG5UpoOuX8f/qXO00WfaCvYnwuO7/EHW+WSxl1Tk87UqscKcjrjt3iujHMY/Oa5tJggiUUpJ1q2ENkBGB3/tO+EmJ4ps/89Ejfz3lco5QcN9tXXAlX8bJ6iTNEwkjnM7GVfyHhthRq8g54qpaL7UnxpvU5RSI+zAAO6/MCMfty9tyKgr71I/lqyIms97AaNKFRQPNO2XNnNWM/MmzMbjvp4nT3/QfPWgntHgM7oTT0Cf7Uxw1IN9TgranOG8m7oGmhdGTC15X60YwUuaSal4v4cwFwsbKEYHqLVWlbjAPv7nuqQsCYNLipIq/qeFCqrxyE7/IxIyxrrr93gMssqeJcdIglxmRP81zMdAHkHE0SwgAkbU6l1ZVVXtRgElgAgTiDW+mZwPB189Uea+3ib4Zdb3LiDPUv4ZhRR0/kXAJ0HXlW6Hwn+oWsmyDZXhnNSrbZzg+LOUCzHqEdmpE64QaK7DdERIVqRKYdL8SbBHVyQNV5XZ33G4Tr7H+dXWDUGmNTyWABJ7JtEEFr9VejHrOZ/al4yHpj5a97YnZfTvhIte4+gyBSrDEBwzpuKZ7VHW0cNy3sOhdoTn+3fM4svAmQ+eHyOnRDZ43wY4cWmYfR1nA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(61400799027)(16102099003)(22082099003)(18002099003)(13003099007)(10067099003)(11063799006)(261022075727099003)(261028144727099003)(261026121527099003)(4143699003)(261026140227099003)(56012099006)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	37w/BGTVQbuW7I/XhICNbL0RLvhWdPrPXHJCgx2SflcfdbodxRjSbQtdHsH7Zx0hiY2LFXxb1JT8lUvk756smrDFEZIZfw+I90I9No9PbsjaDhwTs3PS1xxXd8xFUO0jfKC+mi/Q/gPMkQP+8IH3TG5zQ2OFJG/gI9D4aM9A5eCQu2Z7EYGrrTOayTUGAA4imn62v4siNiEIU0IfeRk/Mv/IczXVc20fse6yvN5vwG7odFX0BakwC3kBxv2ZIpaaE80VmKZwo+Ghw29voJAzgrRAhRasU87cRMW1hn5X3HJjwex4DBbfvArpgTMcR361ttLQtRpKYZ29Uhj1FDZnuWFyiA487tlX5vOPglL03G+SY//pA3mda+xT8YiI2IzAVwGsVENClb6SKqZ2R1/7BAcRhymQu5pu7l+KK9G2tEVc1Vfalrv7QxDKFSZHFFgd
X-Exchange-RoutingPolicyChecked:
	o5a/uCLCblGLWDybgieU8VC4RtpXsx5WxYf6K3kHpI4ZEno6NRor8bw1Z2ukENuZg2XGuMPPLs9JQu6DRqLmRLqPuJibfipwpA8Ij1iQrxqF4g3z385//A1Sl9YY7l7WPPDcOo+GmFlHjV+jftoNsVCuGCcTJ50rHl5x0tjE+xxSxnGmRprDqW3pQaQtdWspEuukp9ICxDiQZ4gDfVwUsQ/afgA8KLZkWqRJ/vQGB4OZIhmqWAYT6RSSr2DJd5Xnz8JomXZM26jUJbOUFL6daZ258mlH1S2r/41MF9Ofx7MtKDYX4bdnnBTXJGlrykeTvA6Q8UW3+DRjgg1LW7POsQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:08:16.1215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc30005c-e740-484b-ac74-08df3b24b5c5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8624
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX2RbTEf+O0+DS
 56U3kvpDipPDY3YVlTYmqQHRbW0ttIpVTvg1nRD8sg3OVc8S9CbuuOX6snAUJlp8wjrf/tUznOp
 vNLON5B+6xgzeT93kxE3PPYHmBOU57npy20E/cGSNBxbS/0I3DxsCkfSpt2+IPEh8c7XVjlzULd
 E5H6tz+55qiqPIq8dGtVjyaw4IUtGaiSYdkB8kWGDx1hAxrm6kB1hg5a0jiFR326vaIn/McKxfM
 lDwjcaTLISNBoJ4g2oFvuN86Fm2elRty8G/20mSdJ0HtftMlYi/EkWv1muAo8OZ/qNbC9KrKGu2
 Ar8Mw+6/Bwh/gOUHmsumTtZTlyCaJ1g4Vhq0w1UH33DaW+czG9mC1VQHH6wA8gfPnOFnyy/WM3L
 5gwpVb6rnFax5j9B0r6pboreHbtPtm2CaqnMGwXbh9B4vF/5kV9GWMB6te9uMrIULF62jCXx4hj
 lVoALf401rKR+fx1MWg==
X-Authority-Analysis: v=2.4 cv=Vr62kO2n c=1 sm=1 tr=0 ts=6aec5596 cx=c_pps
 a=1s/5voz6niG9zwz3v8KCAg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=12WpCELYSaaRIVtT3coA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: j4iY49oy4Og7S_yN-UkKaCux_PsXgdHt
X-Proofpoint-GUID: j4iY49oy4Og7S_yN-UkKaCux_PsXgdHt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzOSBTYWx0ZWRfX2K2fyJYqkuZZ
 9OVwP/8N5aG6xgBVcRgJq/C7XFQXsKVUr2tRZeeTA+Wt8PscauOd1FVi1IYoUzWWuz23p/SS8LL
 hNOGgtjbviKsHmIUPj2HQ3rznRHNeNE=
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 05, 2026 at 10:02:00AM +0000, Charles Keepax wrote:
> On Wed, Nov 04, 2026 at 10:38:32PM -0800, Dmitry Torokhov wrote:
> > When arizona-ldo1 registers the regulator, the regulator core takes
> > ownership of the GPIO descriptor passed in regulator_config.ena_gpiod.
> > The core frees this enable GPIO descriptor both on registration error
> > and when the regulator device is unregistered.
> > 
> > Because the driver also tracked the descriptor and called gpiod_put()
> > in its driver remove callback, unbinding the driver causes a duplicate
> > gpiod_put(). Remove the driver remove callback and stop storing the
> > enable GPIO descriptor in driver private data to avoid the double
> > free.
> > 
> > Fixes: a9191579ba10 ("regulator: arizona-ldo1: Use correct device to get enable GPIO")
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Seems Lee has sent an almost identical patch:

https://lore.kernel.org/lkml/20261104182148.1176116-3-lee@kernel.org/

Perhaps we should go with that version as it also removes the
now redundant platform_set_drvdata.

Thanks,
Charles
