Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791031;
	b=2lJHA4fD7ILcjOPs1Lm5xvF5vvJ9OnbsoUozWx3G1PP06IRWfPCKIOzKWpE01CSNs8SG
	 qmf4NcN7ThObZ8Sdh795YwWmTA51ydgayUpWW0xRRUiffAKyugaX/pstSJcUvhq7jvxyV
	 lACiiRd8UEccmjnhtNgHnyCVmMyaE4evg98WaOfyq11w1Adh4/cY3amZ0MzWizeJO6bK+
	 JzvEcGCFnCb1u8dMYhKVepQuaAztl5GABfWQqWqLtBuop6URTkIsZbRoCQjHk0Lw5sWPJ
	 +perZwElX/10Bv43k0ajsllj8bCsG0dnqVtvwf/s0IbMgrrtq8KpikCpljQ5HM8hInQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791031;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=GcSDM8M0MI3ZsY42MS/lfe41JK8OxIT3xjqgbF0RDLE=;
	b=myRgifefwz3RaMnjL4PgxhGGpDbV5wLnQF3scTgFdQf0BMJWFodM5j5OztsDCmKQ3mYp
	 OrxVyMd4zR9bA8QQ6Su5Cc6w1NazCLMO6Og152zjxpnmHnlrzljxJrim8jTp5qXwAXFQD
	 Yj/0R6ge0R/xWTGn/zRr5GxXDO4nSbKJEJSiYTgDzpRQ/PHrZSq4XpYj5WSjBJm4Wmm8x
	 jalT/MDg/0q3EQ/9quT3OjtLqtZ0Vrnw5+GGDjPkVNk8H6y9Nl3oeLhh6/ml9fj4TW5u+
	 KVnVKDD3iZu+IPUGt7U0guA2WPo8FI/An+SKbsncEeTdLrVqMyhzqi5BdRoIOTMITjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FmuaMRPO;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=e05t3U3O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A36D606D804;
	Wed,  4 Nov 2026 11:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A36D606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FmuaMRPO;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=e05t3U3O
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A49wojw3106919;
	Wed, 4 Nov 2026 05:17:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GcSDM8M0MI3ZsY42MS/lfe41JK8OxIT3xjqgbF0RDLE=; b=
	FmuaMRPO46C4k9viTmI9URu3Wy1AOn/mL724FplIJ7bCUAgubK/780a+ErTdldtE
	wAUTugQOwwJInFCwNn2DojfOTFfNcbd6gR4LJp3yaD8GbgyxeQuedFjRNWluewgh
	73TinrMhZcq1mm7yZShjidwqIEtg9ul+2End+K50GSy/AbOiw+RNfEvMTVlUEuaV
	cnKHXA6jvMbeuhpVPpINzD+/kDgCcIu/cW9G4Z9V6JVvoGHKHnB+J3t7Y5lqX9SC
	nGj2LC3w7hN4uE7IpubuEWffmOQUdoYA7cVp//tibUA+3gBk8/bcShXN7yxCHcXt
	bBnFTRpJp8l3t83GQL7qbg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022077.outbound.protection.outlook.com [52.101.53.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfd2pb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 05:17:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hx4QVSyedkmnMS0Z+UqwpZxtJgzB3bovsXX1y3dovrF2w/7oRhsaQX7FvYQpXXR7NcCOlFIFazHEZ3xr2ofN1XLN2EjBCBT1XPXW+Du/Lb7CdFG2hnk53GrylZD6UWjf3DWMbJyxNu9+gNEhrU3kUJmxD4a8HJdiCbTQeHYIPJenKMgiL2X+Zd6hIUfbdFnl99XAwFnawe7/4w43YMzCJDNTFBsePd7oqOOCNGMAYurOb7OSsO+DZ7XprijgAy0cvU8RzS0SVtMIXSrD8ap/RWIs6lBug1WSjNphx5KiPt7iXeCNkiGzq+h7Davs0DPdNt9U6VNpQwqUo/C98S5DIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcSDM8M0MI3ZsY42MS/lfe41JK8OxIT3xjqgbF0RDLE=;
 b=fd/9TsFDR/vrPAsxeKvKtN7sKtZLznbM709Q8RxhJea+1NLOg5jEYgT/20s6pbVCnMs/d9vWUCHFtIUJzLEgDO5vRRfmsctEmYv26k8aH+4N0us4ncxyUOlOpRG3cnR8SdTFLIXGDWoWpUfQq1CdGVHuqv80y/59xmU/qGe0jD6k1A+JCBfyVr3j83U21hJP3pP1xNXVyUaOfLEDf4/8Yd6jgx/HUn7en0E7ZTCPQYi7UsUoNHSjRi3yEkaUpABF0bmMSjGW1sUyrPRkYOLlZSolD713L5XTn7KBZ6SL5puviLAxHon28lkeaO8L62qbWbIVl6a17seNbIw7roEmbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcSDM8M0MI3ZsY42MS/lfe41JK8OxIT3xjqgbF0RDLE=;
 b=e05t3U3OAMw0fkQo/PGTmjqU6L44f7fIXQd3cJkVYdYLZkrFTO2obXg/gv4Bco12mHOphxxZElq10JrnyZ7KfSH+nQgIcMTRDENEHPF1o1/3socFBpQkDcZbhMCdhmUmXWtAXNKXBM3gg7lktjOFs3p1A0MxIPsKZ8Km7fqZI9o=
Received: from PH7PR17CA0033.namprd17.prod.outlook.com (2603:10b6:510:323::7)
 by CO1PR19MB5175.namprd19.prod.outlook.com (2603:10b6:303:d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Wed, 4 Nov
 2026 11:16:57 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:510:323:cafe::49) by PH7PR17CA0033.outlook.office365.com
 (2603:10b6:510:323::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:16:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Wed, 4 Nov 2026 11:16:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 16D5C40654B;
	Wed,  4 Nov 2026 11:16:54 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 00521822561;
	Wed,  4 Nov 2026 11:16:54 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 2/3] ASoC: cs42l43: Factor out decimator startup data to an array
Date: Wed,  4 Nov 2026 11:16:49 +0000
Message-ID: <20261104111650.1079215-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104111650.1079215-1-ckeepax@opensource.cirrus.com>
References: <20261104111650.1079215-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|CO1PR19MB5175:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 12d1c2a6-fbac-47cf-0e1e-08df3a6522e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|36860700016|376014|82310400026|261026140227099003|11063799006|261021123027099003|261022105027099003|261009223027099003|261028144727099003|56012099006|261021121427099003|18002099003|16102099003|261102123227099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	NCOB+e1k6gAnkdjBFNGxW3V1PykoUwOr7gloLogH9kUqQLYmRvyhY8hUiVMp29WrBYNOCFM7zPHDrbu/k9m7FwqXHAnJHGvN2VcpDlN/ksnK2VAZ93jJiu8PGcfYH/oNIpfD2l8dws96RTDPoK6s88abVEyV5BqjSevShK5atw/+EBYStMYtA8AFD2O6qQELBe3FLqYoGoDzhwCJd75QGBnjbApPV8GUllGMsg89hDkHbluxq1tJwqUsEiyf3+NGL4wThE7Ugk2gUDPR2AX3Ci+xCBBrwerDrqWA+qphX5l78oPJtEhUMKgE4aBsM9eGDsAnbSWhsv5z0tsgq4JqBcOmL+ze6VkSBlSttNBOj3+LatwBwPKdgSZWNfjn6Qn572obFqOH2LauvPT1kzgwdeX8UxHMeLHZvhn6K46xQXA1NTQ7cWMMGMU1vitmwCaSncLuYE+oTVWzgomWvTcJCp0EqHQndleUUAonsBkzJq7G3+PTolxat4jJEdrTOiPLaztNQjJiQkPrJtrxh50xDXxvox+4fXKqSTTZEq/T3afJI8P8LrUekxfb8TSullG9MSq77KozHvuNAho7IN0jWkqTPhxiaifs1uUktq8M9fmBSEiG5DJqGAIVt2NJXTIPRwEaoGqTTL77hayouhjAnzOn3a1EKoD0YMsGF4OHME3CfcQU20BFSqYls3pyB88E1rqQ2rYkbWzHKDm/cLNtJg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(36860700016)(376014)(82310400026)(261026140227099003)(11063799006)(261021123027099003)(261022105027099003)(261009223027099003)(261028144727099003)(56012099006)(261021121427099003)(18002099003)(16102099003)(261102123227099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gtjUAvrpUPOKKOTXY8axutyb9sxDXeTZ90WDyuJZth2PB8lY+ztK52isyZJWrbqrKWddEmullCbaS95qHPhc0DJM55789igR8JpW3UmcbsaZiRMrhZscd5QCzFawHsAgnwwAz6uH0ABR/HqFtEZn/NHaObO3MJ/D3i3vBlf3W7drPU0hsqLTiBr2ne3UsW4NHj4U0KoAKLHjqNtcODH0BkMerotkqqCOkmi6Hf4J8+3ETg7OjDI0sFDgHnMUytHIVoZVT5b2g5+D2BiXiZZKJB3AJJsBQgybNn0fp1i9ioa9AxtC+4AqIxcLCJ21YC6BJ08lJ97lvQSdSz8gLApbo/ZnUhOPOHtsRD6dmhirI4N6rBq1qNxVFwJPbSCF3LizF+19fINZ/Ec207UXrtMV69b1MiZDDq6e4qzh/SHfKGzLzt71A7fqZFHIVwrKMo/l
X-Exchange-RoutingPolicyChecked:
	WJHKfXFX5w+cWE41H8MnjsBC33YRPLfbnb2pvXwjRn187cBqIdy9UeigWsjgHA9UnbGQkoJzJ+i5eROvgv2FW8tF8Vvdg3m8euylK1mY4PBahJD8GLpxed6yA54GxtiN+zcVLM870k0L3htHbQEp7anJJIQ6x2CZ7HyscJfhRWXQdEvOpJYMX9FdgWz3MD5lKsZFo/sLa2PQXxfaDvHqdCKUtPRPX0kdDtaEl7JLxoAr03nHwDyMjJhtKc4Wearw3Zv8BSWw9UnvFBljiLod5lRtVknNHwaM3kcVLS7VgogN6GO947Lmtmnoelhh1JJ1PJQw5/pQ3RnaWoWXPgDBKg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:16:55.8087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d1c2a6-fbac-47cf-0e1e-08df3a6522e2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5175
X-Proofpoint-GUID: uFGSCP9Wlk8UZ40ZmR0nKT7U1xtJQlb0
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6aeb1433 cx=c_pps
 a=xYKeb6kGun7gsC6lRUWGfA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=OYnTXKH6LEPfpXWJz2MA:9
X-Proofpoint-ORIG-GUID: uFGSCP9Wlk8UZ40ZmR0nKT7U1xtJQlb0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX66uMIYPlEKpI
 30nN027wq0BSopNa2nA111ZTIj19KJU2jmB7QxO2Y3NrjZfZNZ6hnJ76x0mq8bhCFEcSuCBAy/c
 JZLVVfcndfo+Szq2doX/ZKvcHrKb4fzVCmMQqqx1ATQzw4Ut+ABpIr0TkQW2Q4MI7I+Yw7FAQD+
 qX+cnGB67nNVe8vozEJGf72x9OcF8fh/X5s6dzijFh2y2v0NO9rrmZr+5RoBczm0qvAzFJJ8yGO
 VQXPN7vIL5MZH+0OJIP7zZusAkplMNBYHrFYUSy50jbHuUvqNOkJiZY9J7JGeaVqXImmOX/mJUQ
 dePEe2pjjz/RmYgq/dNNGpzFCgJl9HpiN/jVfdzNeg9saSneS8deeFd+lrmAutU6gEg5N+wRC1U
 ON1lF4R1zdKBhoPKB28TqSbPERpO72etJaosz8NtrtS8F5iNI7QVb1adMhNdACSWUWRzPETsRwl
 VdKO5kQ+QdB903SBtFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfXxoZiXgB9++0l
 S3P2/iBfjci4VjmFL+nda0L2p267LdJx0Uxf5ic1C1U9uDVOQiAOeuZIizPxtc+SUyuxTLax7Jb
 A42zIYcQ8TTxht2D2KA0gr//TgXtUvo=
X-Proofpoint-Spam-Reason: safe

Rather than large switches factor out an array with all the data
necessary for the decimator startup. This makes the code slightly more
readable and prepares for some incoming improvements.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/cs42l43.c | 150 +++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 82 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 90c83bb33d69b..8fccddf7a1b22 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1736,97 +1736,82 @@ static int cs42l43_hp_ev(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+struct decim_info {
+	unsigned int vreg;
+	unsigned int vmask;
+};
+
+static const struct decim_info cs42l43_decim_info[] = {
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
+	}
+};
+
+static const struct decim_info cs42l43b_decim_info[] = {
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		.vmask = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM5_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		.vmask = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM6_MUTE_MASK,
+	}
+};
+
 static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
+	const struct decim_info *info = &cs42l43_decim_info[w->shift];
 	struct cs42l43 *cs42l43 = priv->core;
-	unsigned int reg, ramp, mute;
-	unsigned int *val;
+	unsigned int vval = CS42L43_DECIM1_MUTE_MASK | CS42L43_DECIM2_MUTE_MASK;
 	int ret;
 
-	if (cs42l43->variant_id == CS42L43_DEVID_VAL) {
-		switch (w->shift) {
-		case CS42L43_ADC1_EN_SHIFT:
-		case CS42L43_PDM1_DIN_L_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
-			mute = CS42L43_DECIM1_MUTE_MASK;
-			val = &priv->decim_cache[0];
-			break;
-		case CS42L43_ADC2_EN_SHIFT:
-		case CS42L43_PDM1_DIN_R_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
-			mute = CS42L43_DECIM2_MUTE_MASK;
-			val = &priv->decim_cache[1];
-			break;
-		case CS42L43_PDM2_DIN_L_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
-			mute = CS42L43_DECIM3_MUTE_MASK;
-			val = &priv->decim_cache[2];
-			break;
-		case CS42L43_PDM2_DIN_R_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
-			mute = CS42L43_DECIM4_MUTE_MASK;
-			val = &priv->decim_cache[3];
-			break;
-		default:
-			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
-			return -EINVAL;
-		}
-	} else if (cs42l43->variant_id == CS42L43B_DEVID_VAL) {
-		switch (w->shift) {
-		case CS42L43_ADC1_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
-			mute = CS42L43_DECIM1_MUTE_MASK;
-			val = &priv->decim_cache[0];
-			break;
-		case CS42L43_ADC2_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
-			mute = CS42L43_DECIM2_MUTE_MASK;
-			val = &priv->decim_cache[1];
-			break;
-		case CS42L43_PDM1_DIN_L_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
-			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
-			mute = CS42L43_DECIM3_MUTE_MASK;
-			val = &priv->decim_cache[2];
-			break;
-		case CS42L43_PDM1_DIN_R_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
-			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
-			mute = CS42L43_DECIM4_MUTE_MASK;
-			val = &priv->decim_cache[3];
-			break;
-		case CS42L43_PDM2_DIN_L_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
-			ramp  = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK;
-			mute = CS42L43B_DECIM5_MUTE_MASK;
-			val = &priv->decim_cache[4];
-			break;
-		case CS42L43_PDM2_DIN_R_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
-			ramp = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK;
-			mute = CS42L43B_DECIM6_MUTE_MASK;
-			val = &priv->decim_cache[5];
-			break;
-		default:
-			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
-			return -EINVAL;
-		}
-	} else {
-		return -EINVAL;
-	}
+	if (cs42l43->variant_id == CS42L43B_DEVID_VAL)
+		info = &cs42l43b_decim_info[w->shift];
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		ret = regmap_read(cs42l43->regmap, reg, val);
+		ret = regmap_read(cs42l43->regmap, info->vreg,
+				  &priv->decim_cache[w->shift]);
 		if (ret) {
 			dev_err(priv->dev,
 				"Failed to cache decimator settings: %d\n",
@@ -1834,10 +1819,11 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 
-		regmap_update_bits(cs42l43->regmap, reg, mute | ramp, mute);
+		regmap_update_bits(cs42l43->regmap, info->vreg,  info->vmask, vval);
 		break;
 	case SND_SOC_DAPM_POST_PMU:
-		regmap_update_bits(cs42l43->regmap, reg, mute | ramp, *val);
+		regmap_update_bits(cs42l43->regmap, info->vreg, info->vmask,
+				   priv->decim_cache[w->shift]);
 		break;
 	default:
 		break;
-- 
2.47.3

