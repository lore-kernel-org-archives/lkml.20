Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442A33D3339;
	Mon, 31 Aug 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169517; cv=fail; b=AA7zq64CYI8MxxDb3EJ6n/xl/mSoQFKz/4O2a8/Bc/wRdH9HxcN7qa9hWGPtQdQzMJTMLptsaR+CUfaSECXgNXMmHhH1lDtiYthdmTIwqV7wEkVksX7JoQv/raiUlxSnCcntaxXV8KbfaMOb+YVSjq8Ace5jTzDvbzHIzjPwyoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169517; c=relaxed/simple;
	bh=vdoYhuL5DlM+WkiZWPyNyasqLQbci+B9QM+oqwVsZIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HeA/buGeopxjkV6nvdV75K0nRR/x+uXgQheJ4boxfmtuEBx3zBWXiifzbkzPJaFqUcCdxChmTI57CpxTEVw00Om7isZPCPLIKOsKTsTcBfdGZyW3wx5ksCMcPOBF/NsZFgwfkL7ctZgAB4iGRPF6IL/5rUI+muSYw2XVGrDVYGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Be5xGmAA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KA1Z0COJ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Be5xGmAA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KA1Z0COJ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1r7cw3615628;
	Mon, 31 Aug 2026 04:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=o0j9PXMXhT2+yIl1
	6W5uApRJt6c/xBlohpWGwq+JPa0=; b=Be5xGmAAeijDvrCgMsQtVvLIS0l3hh0X
	Lv+OdA13ZHipgfD8hCBTPTG9bVgXgwUTY6kbuqZs8/wS1jjx5jAsdq1kd6yuTbzL
	EIXAhlQfbDA5AEMRpOfeb3/0pxC6nTv5jQnalHMU2HdM+R9VtnmuDjsV2/pyz/D/
	uNBWAFv/Ki63q/WI9u0VwngC6xzvhGl2kproVRdu1o5vcBIor01nFwSdx9jaYXSQ
	ZhweaO/dLhZFc+sAiKKd98uwC4Z1TJOGtFLV6VpTZAgmKyfBT47I61Bc7/dSQJQe
	4QybCW2r0Wqw59oBcGYslzCrLtCJQNzw+spQV9KuREE0kX/FqF9isA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020100.outbound.protection.outlook.com [52.101.56.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gbuuh1s92-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 04:45:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwEl7BTQnP3hDKoERV6IKrG9IHLcoNYJao26gQW/aE9BpjvsXKkl6NMRhE8lp0Ou8qJqL8UYkwzje7qjtSHeEr9QxWh1VIA1lBN4QpZ02LgMJ3qqinSiIkwYK9bJIbG0oTYvjEpA7liZ567GKyfD3+6PAoAmACnph/bYA2Qv/jWyTsULZGYtR0N1dtaKI15pyyKhufofSxGnIGYjh9xacKuUMBsIrMoWhXVKb9yC6UAktqSot3SMzpXapmFPFO6NGRPLYG6LosKF0U1IlUuOP+ASEVAOOPfSnpSKKzcjFLz3bnaVbg49jABOznJT/mGqBUAUPCJESxdzZ9ry18TNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0j9PXMXhT2+yIl16W5uApRJt6c/xBlohpWGwq+JPa0=;
 b=lfj7Z+i8vfpIFIp1qeMY/EBthfn8aGDkVghYx6UxUQj6HabsTtH+mTtKIaCnKC3tHgjcPrXQJFIiywdu2uTjuF9F+Gmmu4jn/9/VAk529iVYFGV3J/qJdgw9U7+VaQ9WvD2sOBdzF7SFrem1z9yGDx79/kMLlxWHtu/NTjEwlJTy4pnigm0mN6NmrJYN85Bh5yqzFfzf3uxOUBGJHmiDLBA1vEBOdj4eReBkXY5LbsBNHPp9syvYeopNUgzDTMdBMlh7895aFP4SyY5MI1M1kL6zaQb3uDR7InQUQzRQCxLUWGoK67RdcHtsz36vZLRIAOSDRM21LohmxJ6z0KfYgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0j9PXMXhT2+yIl16W5uApRJt6c/xBlohpWGwq+JPa0=;
 b=KA1Z0COJmZgRwpW4BxkGwLQu+bx7fyGgz+GF+Ev6GmGRgFV85xv8/Ocqs05UxZOFDjv6imvR3T3g+VFnofL/YTz5Hj7XbYoozXY2Iu8wTwtEL4a/pM8+jJ6pKtV8OeyVzvnsrTKIqdQQ4U1MHcPTiHW7SKunGlonbqOEkAJC5ec=
Received: from BN0PR02CA0058.namprd02.prod.outlook.com (2603:10b6:408:e5::33)
 by CH9PR19MB997443.namprd19.prod.outlook.com (2603:10b6:610:343::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:45:08 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::80) by BN0PR02CA0058.outlook.office365.com
 (2603:10b6:408:e5::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 09:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 09:45:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1DA69406542;
	Mon, 31 Aug 2026 09:45:07 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EC469820247;
	Mon, 31 Aug 2026 09:45:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix pm_runtime imbalance if suspending before first attach
Date: Mon, 31 Aug 2026 10:45:06 +0100
Message-ID: <20260831094506.57467-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|CH9PR19MB997443:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1c2d6489-8572-411d-9a85-08df07448b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|34020700016|61400799027|376014|10067099003|3023799007|11063799006|56012099006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	jyvgOQgjIeaFE6DEL8o54gROTasyrEjy1aL7VtO+kbzjj6JPAiwVopIBy9f+wgJv2cUGgLf3JwHYl41EFVouFPl5nU/PiXrnMbE3b79q846eBgnJUngEDvWvcC8Xcr/mRIvHeeF9sHzz6ROUTK6xgogmoYR8twgx0KZhZLyZv/ffE2iBzGhS4NZ97JdquiMzqEEhUimfE8s2CExQ+y6yH5ZGrH2c+pMUAsOLq5RhaWd3SFtrbXz1wv3nZ+2iSZHHtN1VXvpdjTSEyNJzfDPoGOZDO7d+XeMx4wwAby8YKvBlrLCy7k/1pcNuf3prbJjPWrhK4Xds1P5gTlMauSGIM8P5aA0gVQB47DLNwt1KkVKt0tArj9pY+TTRBCBuVB0g5kW0pITJBS+XiLSFEhgyHnICK9jNbs1/h+cM4BD9lOgKn7YW2yFi6onGBlJHrtXYn9Y1zyxrmYtRFD0oNUf+3fI4WY3QzuTYjnwNOOCfsjNHvVhYn+mECVNMo29NVUrffYdubqC8ECjfpu/gGPRcXkLhu850rBgdka3aZOXW0BSUZi5Y13TYh0ytZKcOJ8vpkxYgZTTmnJqDlg+NboDoWO2Wq1jNlNCGOdN8jzHFlvVNvymYI4N5C7FY8pDdunnB5csSiXczxhuYYXYiNyjYZ8KEX9gqwdPPE5eyS9y21OEjpT8/ObJDmQVgGlZWSOZC3KKTLHmmo0JiyJGRO2qFRA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(34020700016)(61400799027)(376014)(10067099003)(3023799007)(11063799006)(56012099006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IiZ3uWhnCvBNRC/1Zzzg5svBPy8CL+fLNF0py8vZL4boQP3iqFekewr3i/apSKzOr+LsW+YDKNDUVpCfeZcVO8UEYn6Q9GBrAIa1f6dgirmEdFuYweLUoWLrI4O5r/kG1g6AfEeDKk4S91CcHIs6g81vIPUdTqX6eMX570stG2ALYTSluzm3xlgqcLvBJdAo3YsGli4egc5uckch00VRjhccEFMBUPGjnCO0IRjvkrEmnpedgq5/AXkswbFUgtUlRPkctJtHMRZL2XibI3+JFdeBufWGieucVkI1PsbIVxibFAiPGEyJGBxxjbrOxl4UISoEy3nulgShGBXla0XEDRvwwsoyGxZ7Ej1o0CXD0Kp5bj6ewYA87PBzxrQIAEWJi09TVHUMz83kWyKiUUYk8nNjs1vck1hsF/xwWeGuxT326EEptoncsOzM/8EUeRBJ
X-Exchange-RoutingPolicyChecked:
	MpRukyOa70tpkPmL7X2Oozeb93X7gvfBxatCtRYUu5qx0tQtMO/KQ/sVr4lrojfaOO+r9D7l+QarPDASmM8qt+SIQfogri6hYcoecH0PsKIhxWOCsdNN1HEJSXnLyVsdJRWHEfxx6UADRSHygXQ45tEXceBI9kKLcR4x/GNcOj50Fp+cxZxEtLj5/0dodt4o/119S9XLb6XP9U1/sn4IYTCuBpLmW1PdlSiS1HtsrNoJ9YNzsZzdq1NVCBo3orIF/iKSM9LkbjWzUQhP4qbwcm0lSj6nMwIjib8H/lf5l+ke60Qj5Ypr4P4qZNLjj5fpMeeeqyyQWO3RB2RLV8mZ9A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 09:45:07.9382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2d6489-8572-411d-9a85-08df07448b06
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB997443
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4MyBTYWx0ZWRfXxiAOj2rhLehK
 QsW4UkUaUx4QLiQXH5e7w9lZSf0j9DwzxXzbLtb7+sLOfMHI5Uj5aKKpJDLT42q3le/kl4eKHVQ
 wwG78xupdQ4L7OB2qpvVstUKhjEugOzKgBobxplno6XclnAjtzevTmHOzKzPAohvoo6Nlo475mE
 VNPCyZHpBJ7i2iTuamiZO2h5/Ucuiy5WodgyL5nnbmcyh8ia4xzHi4MrKACBVmpUyuRL/P5dyL5
 VRnJz0IsDLAIg/2/2vLdQ4+oLcULhhkt6JGw2WSNROmzJ0GxEerzPErkQfSqJGqG1ZF1cHnSTYZ
 EeykvTn9u2fxYcHpjn9O4wOBDgAqrLAtlqt5F//5qwEPbHVOJcbyZbFbnxOlUX/lR6JGPM/En9z
 G3Lxxu26CTkzw+jkUIgF4E2DSOYHb9alo0AccnNh7OZqZRmbVPjyZNgSTPprHrZ7NVQu/xDGXqY
 hYqg+FE/SSIrUM9cokw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4MyBTYWx0ZWRfX+yJzhMQsAk9R
 rY2PUhThHoo7ngWF1oB+dItwT+UB6L4k54w1oArwRytGTs6iDlGiUcWwtvWlZ8ryjvGmUTqUuLl
 KiLWnm8F1uXg2MJs5jHNVY4qyo5Yeq0=
X-Proofpoint-GUID: 5pqKcNyCJIocbvxCQgfTmTz6a1aXN7Ha
X-Proofpoint-ORIG-GUID: 5pqKcNyCJIocbvxCQgfTmTz6a1aXN7Ha
X-Authority-Analysis: v=2.4 cv=d4nFDxjE c=1 sm=1 tr=0 ts=6a954d28 cx=c_pps
 a=lAmQlIcBCX1LX6OQrMS7ww==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=h-bZvT8r5d1pj1YWRAcA:9
X-Proofpoint-Spam-Reason: safe

Remove the check for init_done in cs35l56_sdw_system_suspend(). Instead,
protect the call to cs35l56_mask_soundwire_interrupts() to only be done
if the amp is currently enumerated.

This fixes a runtime imbalance if cs35l56_sdw_system_suspend() is called
before the first SoundWire attach. This would skip the call to
pm_runtime_force_suspend() in cs35l56_system_suspend(). But resume
unconditionally called pm_runtime_force_resume() leading to an imbalance.

cs35l56_system_suspend() doesn't have any dependency on completion of
cs35l56_init(), so there is no need for the skip on !init_done in
cs35l56_sdw_system_suspend().

Fixes: f9dc6b875ec0a ("ASoC: cs35l56: Add basic system suspend handling")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 4fba59e80c37e..98bb4542b9143 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -386,11 +386,8 @@ static int __maybe_unused cs35l56_sdw_system_suspend(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
 
-	if (!cs35l56->base.init_done)
-		return 0;
-
-	/* runtime_resume unmasks the interrupt */
-	cs35l56_mask_soundwire_interrupts(cs35l56);
+	if (cs35l56->sdw_attached)
+		cs35l56_mask_soundwire_interrupts(cs35l56);
 
 	return cs35l56_system_suspend(dev);
 }
-- 
2.47.3

