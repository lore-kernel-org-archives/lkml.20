Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281041A919;
	Thu, 24 Sep 2026 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243734; cv=fail; b=aYin1H+AYwl14xhoN24BfjMkJBZ3Z1ESCxljnbuJJxrA18LsBsYQYGhcc7D6Vfr2FkYviO9Hv9XIHse2r3wkycpjxn86jDPnDA/hNwQszx6YhhFxxLknlfDTtQTucLZewQTEn6kZLWyTziVQZbHeGmgHes28LBKApK9mbEioXFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243734; c=relaxed/simple;
	bh=bHqIiIllMc6JSF3weonwT0l4gq665Sn4iFezFEeA+m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFsBuRIuGuL/RS4JoC6oPtbmopcEOCNLEAz9l1y0bbeJWvbrRezgDA9IOsUk9QnZIenDWTLCJ3Ex7cd5uDVGdtwda4bSQQ0/jyH0l+NDJCpCn1XujE+5vZ19BhqHSYb6ddA63C2vm6dNbyXxiNJndlTjSzRqQ81F0gitlM6+e2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mtkZHBMb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pwc0FTOF; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mtkZHBMb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pwc0FTOF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O4knPh3655094;
	Thu, 24 Sep 2026 04:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=HdLv6DvMB0XcCsYLiJap8cdvObzDwx5qW7vKxKglgyI=; b=
	mtkZHBMbyO8GGnQB5AKGacvPiSk4MIZb23iH4PyfCxGgiwwrF4H0YLwwY8vmuNMY
	gKq5pZ7Gcdvv5KgsXm87Sx+aID7EhIRxbSEXkX2TIDCGLNDTWuLGkc35GpzhGgiN
	xnTOq7fLX7eiBTMQ+Bta7iJKOjsvGz08ORV/0bt9VU06MMtGB40K0BsOTi7qzPI/
	bRnD4BFUtF93g4HyzOpLGiwNmPiYyH81RIc8ha33K0zGOtvk7rHxl20+GLfkYsyv
	f5LdGFTab7pqN3dZ8GP022PISL1Dk6unTDvHg9FGnt/sw7SIMpWBwLr9VE7ImKKN
	9KuG+KI/vd63yGfQykNU5Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020094.outbound.protection.outlook.com [52.101.193.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gsptj731d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 04:55:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPSz9DfenIAvq+RtRnDmPwl1uusIezO+PA3z9RaaQIAhDK0yEke6o7DWJjvdcpsWVHkeiI/8CQ1Z4xLuIZNZIQo13dtmr5tIdaawHKhEE5FbJ2e8n/cmdk3pM82kgsKaLXRSmnForzK9aLAV5urogdipbq8XxANTrCa4WZG1KBRwsmwm6+ADlLLZ5X91xAmcdnHk4IhfjRSa4yxbHFu8vdVzmHlkF0VjtKeQHv3hTy2YISY6TKiZmU71JQKUecjV7dOrxHQ4Nq4tYMV0FcZynMz+gWfwgUBX57T8B7vrYicGncxbl4BV7DXGEqdQ8PU5o+e6bncdrniOvCrLiIqKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdLv6DvMB0XcCsYLiJap8cdvObzDwx5qW7vKxKglgyI=;
 b=V12pH17pFvKfGCIJUrax6I1A2w5JTJMzyMWXkqcnkjS3qhupeEyjoFZQYRiq8O4KRomXmMqeV5LaspdfOA3BRKWENBRQ36Vk//j/b6IwugohoTPw/RCmMFMJwvq1h095cD2ridsHh+TxcjVKPB9VgQv4WJXb/H0NQaGztLQP5yhj590h49kw2JLT1T9bXNDx+nOA/otByU4W8W8iKjzceSHXl9Ded188K5z17MaFOXHx0gm0DiTKpaTwaVDQiBbxnVC8Fxc1FRyvzFTY3cXTzkdf5gbLGcln3bVQM7/+csLfr2tfl8x89z416ePFvndfB3wL4/3GaAF8rfi0dD5TXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdLv6DvMB0XcCsYLiJap8cdvObzDwx5qW7vKxKglgyI=;
 b=pwc0FTOF6/aKtMm4ZCZoJTe/8lhkEQW2Vo03OiJ66O7qBnNFG8CZN7MXuKrQq2fvGYNJMLMIouyli1k8mw3nTOE6E3q9m+bHWd1a6j2xEOEYRNDBrRuLeAy9Np7x50jiouzU0MZhrBjLbkrKlv5QGNB148p11M+3bsUu8jtKi1g=
Received: from SJ0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:a03:333::15)
 by SA1PR19MB997178.namprd19.prod.outlook.com (2603:10b6:806:4bd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 09:55:08 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::83) by SJ0PR03CA0100.outlook.office365.com
 (2603:10b6:a03:333::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 24 Sep 2026 09:55:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 24 Sep 2026 09:55:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3EC3E406541;
	Thu, 24 Sep 2026 09:55:06 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.35])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1B0BE82024B;
	Thu, 24 Sep 2026 09:55:06 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH 1/2] ASoC: SDCA: Set suspended flag after resuming within system suspend
Date: Thu, 24 Sep 2026 10:54:57 +0100
Message-ID: <20260924095458.2683755-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924095458.2683755-1-mstrozek@opensource.cirrus.com>
References: <20260924095458.2683755-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|SA1PR19MB997178:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2375342e-b02b-4eb8-8735-08df1a21ea71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|23010399003|10067099003|56012099006|6133799003|16102099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ic0qi91CchDxgWtbkbOURUFUcGgp9jqRI5DHACf95L4WRhQJXXxq5YVYYenwTEfjjzNiEg4oLVszXMl2tbcq/PUFjitkbq2GqxuMPMpLiNhxjT0r2k8uvZ5c8ItZkBjnRo2hkcejROvDgYVN48lxY4JGwMeKMBeilwJkX0NTPau04seJWNclhwjzB46w7yMu6unVbS84N2E+5B67UgEWnQf/Gd1WlO0twDEsUI+GXaR59Ub7JhcNAvfK5E7JnvT2oWLCc/xBwzsUVyG9Nm1iDCmnMs0nBgZZTD+rTxb80dsE6UccWjRuqiLN6+kNhTy6uvchV/bauQK3YyO8tNw27xSo2FC9P5kziSzmEJwYB8NCh8n9ericEH4rG7BrnjMvKrf4ZAkNzW1QFKje3PLZ3nS/6Hxf6wg++h50zAXeNyI9dSL/r4TqMSiOj7cBaE6973a/tAN4p59Tyu/0WJqQIiPC73L71inT3WAGjn4RT6L+l/R2Rmgq67L+ZA/OGCn64Zdkb07fqLqPuK2pby++Y6xCUrPL3XRzJnG9gCgVziMI0emIY71BxmBcv3pWP2gaXNikk7c4K60IWWVgr3w0YbIdMI9iEVHDezFvyed/+KBzo/KSn2Jp7ZL/hbZP7pqLpPsmTMwPLi2cxDTmFlKSka4EfNVJU9KIj3ets01l/i+bqRt3Uf9f+ixMxu+0jfMufRFfT1XclGIgGK0a74cyMg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(16102099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cKYSo4OI4Y77odBemnr42b5UE13tRv0hY68aALknZrAzjQ/l4O0fKv90hRvVzHGb00M/GkcVLzuG7UXOOdnT80wsvNK02ynJkDHJAW9nPx9GxdrfupiK93kW6fu4QafhS65By1p9iDKIqdcWLATvXqsYBhv4p5ct0AjiwDLPhaFtZpbY3VOabw93bY/lP2YGTJ4ZBu2nEtFfa8S4l6w69aYc679ir1AbDgiU7E3gG1EqShewswRp0NWJ2divrzIAkkPGOnp9XjqGmgGWtN6gepO+7i00+KIujs9+BXwWMsfd2shPbvOelENeZVeb42qjJkMTUU/Fv9amzA3a2f51aj4nuoFw0iLoJRMhkry23YcMrrSDwCe7EjcUeygYi9OOzWOSRk41OZfvhMeW/3i6dP9ejBmrMNtPAoQwz6FOhPyP9ErmhgQJTbmTANpDSp/0
X-Exchange-RoutingPolicyChecked:
	Wl3wJDratpjHArEQVP52Ce3o3gmZLImI9din9ZALhk9d1zN+s0E37qNijIFz9PA9+DJnfD7k4iA9Vh/k0SEgYxvNqA+Rav5VCL71zzMgIzfX9SJxsR3yessQX5k53XFl/JBy6kBk22WrTznFSW9Q2jA0TmSzho3Ccpz39eh//QzuUeNw4/5EMYjurjlnhosfc/NHgxUqwPldy6QgEVQwqKE99Tr9yy7/bsvyL33RZPctyAVQoALl1d8SyW2/FeQG2dVbQ6rX9a7UkDnUtNJkBDPGXpMFhlA+CgsiAa0qQGrpU6V3rmhbHje1pwXUmSJaHxfF2Tr0qxPa+GoeTg7wSg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:55:07.6206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2375342e-b02b-4eb8-8735-08df1a21ea71
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB997178
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfX6nSCE1yNyyec
 lToYtOlb7inSzhg5e7E5U4bRccBtzIPsKXcLJ24J0CnaMco1QmVDelR1Npq/up3s2wmAWkTHTzc
 1j32GPXd+Qaqmdsc+9zae/j2R873KqY=
X-Authority-Analysis: v=2.4 cv=fuZJ914f c=1 sm=1 tr=0 ts=6ab4f380 cx=c_pps
 a=R0VBx4CaF46Y8RBs4q2Lkw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=EaMPpArYTIE7QqFvX3sA:9
X-Proofpoint-GUID: bhQPtWq1HN4FUzGuHQ7LXy4sMQEEID3N
X-Proofpoint-ORIG-GUID: bhQPtWq1HN4FUzGuHQ7LXy4sMQEEID3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MSBTYWx0ZWRfXzt/8UO2iVNyC
 0oguSgnC87ouGht/kunAA0+slQBEQvZ5dfLNKCIUpvgRFp4FycigCHkaz2cfm5NnZJtoSdbjJFY
 nQ132I9mCn0YEj95aoSDFHaf8aOWkmKR9u0KJKjfTQ+Q4OmBzFiMRWSKkhkIptr1VBIVRHAiosJ
 qTTP99aVqRlBVLwgFb/3yW4iMGupqY1/9W2fWszntQwUDVh9ypAY59m/kEx3oMWRwyKbbpvktzO
 mP+wlsWqnr7G7XqosW1RPAKdLZxgxfNt4balNOOWAIFI3kd6YanV6fjWYMZ4Tlz2zwNwQs+fAKe
 okJ4xW48VTlDt0J0rLTpyqeH8WzKeNqdWY2cZ91xfZupJvzY/w715ijCcrL/rU0scFVeJtVvvzY
 SZKhW6m+IGFDWB9xJkzer/vNCqU/xDrKXzL3h6iUbx/BhmEbVf8qVIw8ihtYeHDS32NNMP1sGQu
 5nSv2RZ47CTTTTVastA==
X-Proofpoint-Spam-Reason: safe

drv->suspended path was executed before system suspension instead of
after, move it lower to correct it.

Fixes: 7a5214f769c7 ("ASoC: SDCA: Add basic system suspend support")
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class_function.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 1d7fd66038829..1a7167aafa910 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -491,8 +491,6 @@ static int class_function_suspend(struct device *dev)
 	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
 	int ret;
 
-	drv->suspended = true;
-
 	/* Ensure runtime resume runs on resume */
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
@@ -500,6 +498,8 @@ static int class_function_suspend(struct device *dev)
 		return ret;
 	}
 
+	drv->suspended = true;
+
 	sdca_irq_disable(drv->function, drv->core->irq_info);
 
 	ret = pm_runtime_force_suspend(dev);
-- 
2.47.3

