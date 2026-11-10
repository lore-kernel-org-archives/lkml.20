Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794320570;
	b=zpHkIwCDa+j1vIVw/aLwUUEoSVtZ6MqYvH/JxRBg5uhNuxAcnw5S5zGnMXhmT6b3iBYu
	 ChVusGnRQAfOMfpQJY4m/sJzNamIy1uBjr2AkFX0h+mO7rkcySUweUgcj5iA/zgZtWaDk
	 hyyTDsRfBm6MzqCtVuGGO2J81iqufXbSfr9PZ3PsM5X42+bGgv/IfjJfpkT2RItgXKKVz
	 +KHEUbI0F/1jDIb6Y68+FSaeTAgEKcst3IbYoJ8n1jIPuTGt1u6fhDao0p3KHzDNAp/2Z
	 XTlYnJbhTMYHdxS1kX9zpNwN8lY0wRXiASO2pYNTodbgKuC2s0Tuc1VJ5wvJ/+A8aJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320570;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5EhNNJRQagrl0Ol37+A9kVJKitxI7PEUG3mgTC9WpBA=;
	b=zH/RAt9gq7YBv6Qqio/wI+am+EX5BdVLBUb+qx7oIgAJ48UVEwCPiBNh70R+fqYViioz
	 V5b787YUwWsefyII0PSp84plXDsk+FDtOuauhHMf/0MTPiKuvpSSxvHTCNysPT02nf8KP
	 /BribaFlu5NGltXFeT6hF8OfXvkA/WNwq+V3M9tsoZy+bsNlc6qPVk5Swp5yDgwl6rM4n
	 p0kIKtOvj37ZimuUZhKw6hFkDN3pU66gfj1vy5FvCpdr3zMaZts+sAI6bYTKfm6cNid8u
	 ZJsm4FHxs9SLO+P/kVYIE5FymDQXpZTiYbL2uiXMWL5EpuH2JgBd+xlrl/+/tsRlTeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=PkZPwU+K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.55
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2057606A325;
	Tue, 10 Nov 2026 14:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2057606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=PkZPwU+K
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feBDugpEmoladH2+EfqF+no5X8A+CL04vcEDDiubWOiZbgDX7GVnhezeybqo0hotfpUhFrPOcVG0VWr7QPeOG20gvqCRq0xHfeSuAptKTgNe0DyqtbyuDHa+XNWysPGmWLx4lISvDbXntikGWsPx/RFZcBSsMwzwhesycGWkL3syqeN7C2Uh+JCKhvljvCuwJQmMG41UNWzq7iHl+b3Jv07Pc1X2kehpwyp9rhAHEdrRCM9oqkGFz/L+XuNHXJCxpytAcqxpwqFTvKaoiPdHJgvRkgJVvb4+lG1M4rvLvQ4x1NQEOgm0yyOLJ+IhgRUOQxkHsJdng6dww5BKTePlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EhNNJRQagrl0Ol37+A9kVJKitxI7PEUG3mgTC9WpBA=;
 b=tZMwnQABf2ctCgvR6HGF2b17FM0M6HcuLIN0+vpJ4DplbOpeUuiDRXad9hHqv37TLDhTkKAl9tWXmpzK+QY3akNoTPaX6RlJjx5qP+pzMZAoJf/kFanMZNhyZy/dqtuN/nW84FeSonyM3otdjTTNnCcRMhra07CgM1JOAWfofYhmcByJTiVutqkIoN+iv8/Pd8rAG30Mgl0S1e1iWwq6tmhUwdFq1Iu3b/aQ99RrxCqfD1tYIcy0vo7nKSyuKWypf9djoutsZoRRCV+KhnoCqnr0t04AA1H5YcwD0gIqCK36F0UnNSBdsKeGCYMpYGg9OIsXix4wcSLjL0kvUs7CMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EhNNJRQagrl0Ol37+A9kVJKitxI7PEUG3mgTC9WpBA=;
 b=PkZPwU+KCIU9wv6Bdm0ijR5mJzuYrOpQcF6MafLskZ+Gyba1sFNyGyPQkhr7ZWjezbzKFazi+2lVOjAGewFCu/sGJ75HxRE0gPE61/UaZwwOjYA6nChppjhYZ2xkYQnfFs9+WLtcftgMeOx3ay1clElMMfeDfVX/9DTmPAHsv9vT00bjRwXB93yxsol43xd2t4sq2J7iF4Faz7tyop0wrLwPaj4LryPxyXBAQ31XU+ogoeOUbTrRtpQV1DYrnYIXhbHrDuFqbuZrIi++cMz0Ky7Y5K5cJ1T2wJ5BBdOHGbgEfiobRBzMnvQulb/mbGO1rmFlb71LPyFWD0yd0PDkAw==
Received: from DUZP191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::9) by
 AS1PR10MB5652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 14:22:44 +0000
Received: from MAD0EPF000008AA.eurprd04.prod.outlook.com
 (2603:10a6:10:4f9:cafe::29) by DUZP191CA0011.outlook.office365.com
 (2603:10a6:10:4f9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 14:22:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008AA.mail.protection.outlook.com (10.167.241.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 14:22:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 15:21:03 +0100
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 15:20:21 +0100
Message-ID: <7f911e02-fbed-4423-bb57-1b442c38c512@foss.st.com>
Date: Tue, 10 Nov 2026 15:20:42 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: i2c: vd56g3: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Joshua Crofts <crofts@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, David Heidelberg <david@ixit.cz>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
 <20261110-media-remove-dont-use-autosuspend-v1-4-cc07e71b30f9@kernel.org>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20261110-media-remove-dont-use-autosuspend-v1-4-cc07e71b30f9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AA:EE_|AS1PR10MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: 84877d1e-33a2-4fbd-42ce-08df3f3615b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|22082099003|10067099003|4143699003|11063799006|261026121527099003|261009221227099003|261022075727099003|261021123027099003|261009223327099003|261009223027099003|261009220027099003|56012099006|261009221727099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	YVNcyUxKmlTQKt/MQ1PYWW+ljZqo6pZWlrKib84ZcZFPJc1LaV1QNMf7UunXNjyPrCoR6xX50EPKy7ikXPLW3xTR4FNNjce3K/X1InrKJu55d05Z01mytSfySxgJAcCABNAOkoZAH/MgkWrsC7F6sXM2Px68xnR2po8SffkofnK1PDIVpvgX6qt8no2E/OU9iI2jpq65zAZezKfqWCWdZGPz49PwlOVq+/EL3WgSCffB8xoMgV4UDr2o5SBmwHEaNs7z0XD4rkodXIFp8Ijtz+0M9sDKwBeveFaGorqkot7GnVymu3WxUyxzkmMAN4LQweYYEnwKNSpjVBcz5LjIZseC1Kz2mndLWo4834vtinYJ64Qw3bTjwljb7N4JPiXeTyGKG01ujXDXo76OalFot1W1G/Mv6HjGMIpf+kX1f1GNnTwbs+s/2mRIFmYt3XZsSrGzWroxOnjQVK/u4ez31jxsWE1Odh92AcEDdL/RusGaN108EZzdXrCcWqTaVu5MtnF/TUqkbpJGEGYjqDlPS7LTYUQMpZNan8j8MXx0L43jqlfc5wkGggavdCMSy2U8Jc5c3W0Hafo8lsze430hBlS3IAF74AiXzRoJxsyZZa1rXRBNDHxsNY/VxTIC7g2LKZfaGXZr/QLquXNAxaf8KHb5artJVKTWXDsupawODojOd2oHqtd00rtxU49rqQdUo6XXVHJyour1I9MZ2QyZoA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261026121527099003)(261009221227099003)(261022075727099003)(261021123027099003)(261009223327099003)(261009223027099003)(261009220027099003)(56012099006)(261009221727099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aNS7ErUFMxg1JwHTvnhOf7kXCCuPQChxrUDvtFoONgFL+P8LpvTdSoZuzkClS18Kl7tKfUxJP0FzkDjPZgLUHsX1XSdjpch4N6Fvrg8eM1KDDsEBVSTl2/oyFTUd/QdgSpt/lvlVf97ahbOTWtCr9QQ9/r0z8L+BHkVzolOhB19gAun1g19nJyItsxXqKtd82dIAJ0WUafzYJlp8guNAn/dZdHJn2cK5IAGi7zzearnI6oWrWnDY6YV2LI5T8dPXKZDu8sdTOnPPzW224vf6u1H7rPJivBhcSxocGCjigyuzcdJhFnpl9SLJ2CHTFLV5Yz/5/NPFVz5EL5xbV/U6FYX7wxXmS0QZUqpffo5Tf0MFRMN73fDCAN0IiQlRYd8qcqWYmWmMPAj7GBhFpUMzE+vhu/HHL0t+ljsgK5Ug5yreSZN0ILk+R3S4cJFDPACM
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:22:43.3648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84877d1e-33a2-4fbd-42ce-08df3f3615b4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5652

Le 10/11/2026 à 15:03, Joshua Crofts a écrit :
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
> 
> Remove the redundant function calls.
> 
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
>  drivers/media/i2c/vd56g3.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
> index a42210d0ab8d54a9132a5077875138c2440152bb..e4ad01973a24201a20dd43c86ac6de9817889049 100644
> --- a/drivers/media/i2c/vd56g3.c
> +++ b/drivers/media/i2c/vd56g3.c
> @@ -1538,7 +1538,6 @@ static int vd56g3_probe(struct i2c_client *client)
>  err_power_off:
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
> -	pm_runtime_dont_use_autosuspend(dev);
>  	vd56g3_power_off(dev);
>  
>  	return ret;
> @@ -1555,7 +1554,6 @@ static void vd56g3_remove(struct i2c_client *client)
>  	if (!pm_runtime_status_suspended(sensor->dev))
>  		vd56g3_power_off(sensor->dev);
>  	pm_runtime_set_suspended(sensor->dev);
> -	pm_runtime_dont_use_autosuspend(sensor->dev);
>  }
>  
>  static const struct of_device_id vd56g3_dt_ids[] = {
> 

-- 
Regards,
Benjamin

