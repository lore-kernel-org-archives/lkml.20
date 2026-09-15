Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012026.outbound.protection.outlook.com [40.107.75.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D062EEE7C;
	Tue, 15 Sep 2026 01:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436996; cv=fail; b=ZjlaOV08BqSpFBf4+1jFZ0cjWHrRFnEZUV1s8cRMq/dZcN07ZW9R+hzqYNwvHFIOK/TPPBxuWqFMEoMaVzh8isbOwpxpHijlS5OcZIatmGbhXstxwXV+vC9XzAhMrUBSlAVTak9cchcLaBhyetTDfDzNL0XLsBOQFrJ6vx67KCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436996; c=relaxed/simple;
	bh=+RQIbKVsrqCIMOzKvAlrA8pe40NvtkjW/HFi2CXHuQY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MuZ/rZurk4fvnLqHasuJsVvijl+SGXsJJgm1MB47k/8Qo2eGsUbmv9JodkthKgnpnQEmk/4XmBo1rGKg5CDf1WJWAF6KT1K2HHsbAxtnRbOzd3pBOwShRG89new8dSa360rldmpSIb1ta0utNle3WzYjsEiyh2P2Z4IkoF6Hn4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=cFSQkLR+; arc=fail smtp.client-ip=40.107.75.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="cFSQkLR+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfGaa3WDU2eJ6A952y+bqwW3ERTy7VOe0dYQuGY7hr6rxFyn97cHebxvHJOgxXkucF1bj66qygEUoyLnLZZMlpIj+thebJCmQW3Gda4mFuButtTE15UNQf7NiYK/tQ1d4+UeTsLGGNdPHsk8DN1i5q4sr6JD6sXtTXAUk6ILdQFoyCrGDU94U8Xt07qjRw+I1yr7bRtZ5cQO9fksVpqiV6mAoa/aLDQ/IXSxVSCTsV6pfUeOTczHRzySEZbAvhJ3P6Q4xu+DqSowqp5+sbfyMecFkie80ZNCwkhKbV/KzG00lrzM6vJDQx1v3UKmP/Sv10LiyFkk2Vjdk+K4dG9Tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw6X/AXi717HwZnGg0/86xf1nXOmhQRT/GdgTfhGpe0=;
 b=I1x1J0WjNfZlMmfEPeJehHIReFVTJ4WJGjm7lnmVoMJ+0aQXlQuGnvIbwQQ1aoCnm+h3aCbVm39xMoH1XyHz42OcRQDGUaib+qHBrmr/qkHvyJCDOydWI8aZgov5aXSrgKhXezkc5RNLXlKtbWE7/MRcQmgmcC4flyHwhEGOipJvM/Vhp6TuNK569OUv9ybLoPC22mZrb2h0Ll0J5imttt3rQrxzs1GbuZs8wj5wmrta2XUPKezgf1th/9Sg/9606xieepSrs+NEMc0OvIWK66rws00Z6toc4SZapyWSLXNO9Ppep2rEB6afBKRovO3yyJ5xlRCyz6Cg8iCC3HxgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw6X/AXi717HwZnGg0/86xf1nXOmhQRT/GdgTfhGpe0=;
 b=cFSQkLR+ncWy9goRwQnkdl+30hRfPb+ZqgKxQEQxe0Skr2VILRD25nvRE2Y1hFqdZclroCwrzgfaWgAHjRjIPRy3Gr6ATHjyFI9SFWmEtBuv0hC8M5kNKng2pLWPJ0r8n5nFMyflOsmTgukob71Qkc05WSZVlTe/VcF0K3OSVKej6qDQIikNQuZrGqWTv6reRrpI7Cbh3FgljfPtFjdWCzNYrJFM1YMsKoJyR9gleOQ8vWzqUXhcKm4cYXZUkEo7q2Xu/f222KYlc8HXqza2gByRmczF/4ckgorK4RlgeFLimi+XTPcVglVw+DxgoI0v7onvo4Kmu2PwWfATW80b5A==
Received: from JH0PR06CA0023.apcprd06.prod.outlook.com (2603:1096:990:77::12)
 by KU4PR03MB9832.apcprd03.prod.outlook.com (2603:1096:d10:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 01:49:45 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:990:77:cafe::41) by JH0PR06CA0023.outlook.office365.com
 (2603:1096:990:77::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 01:49:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 01:49:45 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Tue, 15 Sep
 2026 09:49:43 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Tue, 15 Sep
 2026 09:49:43 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Tue, 15 Sep 2026 09:49:43 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>
CC: <error27@gmail.com>, <lkp@intel.com>, <perex@perex.cz>,
	<krzysztof.kozlowski@oss.qualcomm.com>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <neo.chang70@gmail.com>, <kchsu0@nuvoton.com>,
	Neo Chang <YLCHANG2@nuvoton.com>
Subject: [PATCH] ASoC: codecs: nau8360: Fix misleading return in nau8360_message_to_dsp()
Date: Tue, 15 Sep 2026 09:49:40 +0800
Message-ID: <20260915014940.317403-1-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|KU4PR03MB9832:EE_
X-MS-Office365-Filtering-Correlation-Id: 950b1472-1d10-4644-b8ab-08df12cb9e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|376014|23010399003|18002099003|13003099007|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	D0SQx7GJKFgaYcVsx/9BWDL9tkBQ7eOuPqyCFwDSX1hab4enD9PgRffJowhWbAbUAccSuOhxF8kVi2sM12kaF1GixdSypWYjqp1KOW5pBVDgKBWXkf0hW/nGvKqnJgwH/x3Y48O52MF0sktgL+h1hRdPl7ASAdcvIQkXobpENIhgkrwOvWzWn8CIXVgRgDRM0pX/5G+aAZJDXEaPMGydEKuLgNDEO3Sun+te3jgj5snxjjWqh1ms/VyWStpQcp7WCH4T8dST9VJP3GXF/5R6Q6mgQAI4cU37v8vIlfylU3rjiB/eYDQDEeg4HKdh1tZWpL1IjRBu7BjsnTOqbKCvMEi6880ZZ6Y7ZHnRx6gnTcl7ygnYW6O0qp6oR6K00KzuaKh3lg5+LHCmK2l8lvABt1d7+8dXPT5kdJJOgVsaw34FdV1LQXDyNGIG5efgs9eJ6mvx0kPz7GLHD6fRu+0UCUhO7XMrf2ndxiwizfkpTTPacgKqh2x01QhZe88TIoArURKhFMHNjRvr2zy38ANYbYLRj24CSXrqOlBkXjza+uYnCpXdZjDTxs5d28nBsesFY9eXhcgA1ALZ+1oaWWkkTHecTxcK5Pb9n3JP1AXJO5pMX9yzC0i5G6YaWjkwwKMmzjItZt80UFGxzKTIyDy27IplV6URVVh5GdY4SNf97co=
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(376014)(23010399003)(18002099003)(13003099007)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HbgyU7b5UX+tlN5Wh0EzcCYvI9v9nxFEqORpABgJmHBjKLt+YgjCGSl+TkI7zyCentAklz2I0zwoR3qHlpRsw7bYrNvB/0H62XuhdptPV7BCvzxMrSDu4mQAng6y423uasTPHYVPDg+AnRhvwLN8zSF+YMOMB9wK8w5P7/1LQ4thWa4Az2cILxynxQ6umAvpeqkiqKMBTCn+v1GU10EQUEoFA1Qpe8uTgvWBmHpsjyY04sYom9zwAoZMZzvH2Tor1VUYBnUmkc4S5lFNZJVhuxuC2DderfJcW4EeoyWsv08MtHsapVcRZW+GHtPhlcuULilBtRa+DRbuj9KlCyLW/yQ2GfjBiNoXzOKNACrQlj8JL+HaugJqV6fY+UuOgCDutshI34sLZx49jqbMzqu9z5inaf71Afd5GB7pSZuZv/jaVdmW3kLbU3vWNdq30SFe
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 01:49:45.0461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 950b1472-1d10-4644-b8ab-08df12cb9e2f
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU4PR03MB9832

Fix a smatch static analysis warning: "missing error code? 'ret'".

When there are no message parameters (!cmd_info->msg_param), 'ret' is
guaranteed to be 0. Return 0 directly.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202609081933.K4tVJnyh-lkp@intel.com/
Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
 sound/soc/codecs/nau8360-dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8360-dsp.c b/sound/soc/codecs/nau8360-dsp.c
index 2e5b61bfc303..65ffec8b3a39 100644
--- a/sound/soc/codecs/nau8360-dsp.c
+++ b/sound/soc/codecs/nau8360-dsp.c
@@ -211,7 +211,7 @@ static int nau8360_message_to_dsp(struct snd_soc_component *cp,
 	snd_soc_component_write(cp, dsp_addr, payload);
 
 	if (!cmd_info->msg_param)
-		return ret;
+		return 0;
 
 	/* sending payload + padding */
 	payload = nau8360_pack_param(param_offset, param_size);
-- 
2.25.1

