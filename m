Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793977794;
	b=qP4xj3s9ITVUfybpPkYynKh7L5QeZIjDY+Epk6WKtWE0cy4EtYsZNJvfyYQ2V0P02mZ0
	 0BdEhXJGZs529rSy7W6SmyetBiiugPMwevYP9rzQqlCDknIdDSMCtMZC0+aIRegJjvf9i
	 s/GRhNWtREp1LasQWQmHPeXhTcpAGiysPKb3F4FNLGD3xKn9mOoeIQGHp17iu5lhTieTn
	 qq1mA/C6UaTl+tfBbJEj3EN+Xd+G8lspAfMkV3mm9+kgDo0x22aW8pmk+jBF9znjU97xI
	 kAQd94IZOx28elnkNeJvR4U+62UEepnvAVQtVFK9CkDkjSvVTUwT43WfmljQuFnObWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977794;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=+xCHdi7/B/EXfJCr6k0B3J44OXMdYeabQCpkO1RR6Rg=;
	b=FqbY22xAokvCVk6kFX9gBfwUXB3AJuw0n2xEI8UfJcdMNQ+V4KL3nPFLsyGCJ6qXzhVo
	 dgCoSvLifq/fn2p0aKPEPj0Fjc5v0eXu1Umh5tzEXEFCIkHEL/f34Pww5Qi9PglNdmoLl
	 x4QfTILyaJvUjVvZHZx4iY7uIUD+AGxlL2BAE47FtYBn7U+xq7qT35ccc2LkciZdVJnIL
	 rQlLlkUHzklpbotAb+b8TgSmhFXKPDXBUbFgJYRzs/4+5rcwgaR84d7vBFnYLcrF/QHiq
	 /StyL1jYc6UpvvS3tuXTnh+17OoqGk0MV3iA71LLUhleHMAEJJRLrSnbbbnORfiRllg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=m0GRp+WE;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=K1UaBWjD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD05C606A334;
	Fri,  6 Nov 2026 15:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD05C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=m0GRp+WE;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=K1UaBWjD
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EtoJu2830046;
	Fri, 6 Nov 2026 09:09:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=+xCHdi7/B/EXfJCr
	6k0B3J44OXMdYeabQCpkO1RR6Rg=; b=m0GRp+WEpgqB6qBPRO1D9+mYGWe+Kjn8
	fTr6Gu3h0TRJGlhcFRgH8p5SDFIsngkuZSudAPXkw+y++PCdoehnk8CxpC0feaHR
	LQ5uk/peUJCSS2JrB+iST9lvAAHcSGsz7u+BDlh03sYi5pvr+IDYK2Pz9pyhRnem
	NnTrTWW0/81quV6Rfc+E4/p/aCcnB7F1LsNsbjJmq9eV8yzIPw80FAvxGFz6+lUe
	zG+uMsyrYbM7EhF19BiTfBzu1egAk8D+tNOjBBy9pHmuguluxiUj+fO8Kf35o/9z
	unGVoyH7dr467hYVKNYJYbRasiicXG6qvu1jSbgYo0XUJPVJ/viL5A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020122.outbound.protection.outlook.com [52.101.201.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hs3qwh21k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 09:09:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyVLbnk215sGVq+2IMIUZRLe0H0gmc8E14H9PvTaKxYMLrsZmw4AEC84VDS29x1+4dXS6QdezsNxmrS7hMhr6NmjUncQvnXAUib56udXpVKWgcd0xLXsGN5kGAKKn9oEehlP933+evoKldnZiVv2WZWZur8detv+OnnTIdoAbIkusIIfjdQKEgfcyrlMJqSXZqBnLVSGkvnGTX3mOCw4tI5N7Uj4o569pFYE1hxdjvMT8puzpQa+sFqYUqUAUApiAuC9SIrjYwoHrSduKkkS2U8ngjxy87Xgftxw+2UYCAfpbokBJE3zQhBSiPcRh4zxWdSFdTLy4YL8Rum5wG9ABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xCHdi7/B/EXfJCr6k0B3J44OXMdYeabQCpkO1RR6Rg=;
 b=P/oekdSEyyZTHov+ty3J+s5dZ2KA4wSDuH476QtdAsCtZUv9ul5U7E+59QaweLXxwySf/MX2XIImiNY7Hco84o0nPrJRR7WMPczQHE6DZjzwEnZhlC7DNRoW0r1y6vHnS9icZP8zpwxc4pdDZAXR9+GQzlz7OX4PWMWsTcRUHFqFeQCCH9pBVuy2u9ALOSrtYSzxE7lXV5tB8lC1CmcVpW/9W+Fpbj5OXWCRFoBt9YKsJimtKxFm2wrpuIsYtNagWKxB/vOD7hmc/v0jcq5UTVLcvLNJKrPrTV2qBB91H5iREkv0cRNxFbqG/CKrCLk2Qo5AykUo5mlKoyE0ZDXXow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xCHdi7/B/EXfJCr6k0B3J44OXMdYeabQCpkO1RR6Rg=;
 b=K1UaBWjDdSRoP96K3XO+zDZSsxLGnSUoZTxe5W5UxjmBPJACydHCPlYC/BgiTRHFoGVtEgCbgy8xSI7VCW9ylJRH+GppapVV3ogDFqlJQyBo0OQT6g1FVRE75qc+jIl4ZBZXZTFSuFIwUd/2XlkxLxnmmK2+yS2Ert0/0ONGFX4=
Received: from BLAPR03CA0091.namprd03.prod.outlook.com (2603:10b6:208:32a::6)
 by IA4PR19MB380127.namprd19.prod.outlook.com (2603:10b6:207:12c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 15:09:33 +0000
Received: from BN2PEPF0000A88F.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::d) by BLAPR03CA0091.outlook.office365.com
 (2603:10b6:208:32a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:09:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A88F.mail.protection.outlook.com (10.167.248.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 15:09:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A719E40654E;
	Fri,  6 Nov 2026 15:09:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 860AA820273;
	Fri,  6 Nov 2026 15:09:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 0/3] Add SoundWire port constraints into SDCA stream
Date: Fri,  6 Nov 2026 15:09:23 +0000
Message-ID: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88F:EE_|IA4PR19MB380127:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3bd5fe6e-2ba5-4171-7a8f-08df3c17f5a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|61400799027|16102099003|18002099003|10067099003|3023799007|11063799006|261102123227099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	d4oYW+Y/xz7kY5LvDUfwR2ZOP44JKxi0fzX3+qPg1izH/kYX9E0fSqwDDw/PCw6HtfEgjpm5xsEq5v4+NVbNHt4BEtUHcxvOyMH5tc0XEJYf9EnkRGb6KurOSQKW+LUwZOluWpDuR30h6gE3F9JhvvYF6JnhliFwVFr9alOiT4FhauAay+cNaRcfl7Bb3+CUFIB7UH3Pu9WG1ar4tCXr1Q0sKY9nO8klbIqrIB6rz3qbZayLNaTyHK1T8WxsMtspXrkrds+VpHbtmr2k14baSucqvgijtzH4uldX+Nea3UorsR9O56d8QFGlWslUNm+fRQz12d33CTi0o9jIQGP1+td7xS7I7ORmQMiLaHIXMj7/iJeLajUWPR9K/thnqJgIoniRugH0gNf1k2+lGaoMTtraDxGChKEU3GnOlM5dNcrVYeDcCcADT0pyaG/GxdQjsR321ft5zWDQHmZnd1RR0qikWxYAImfuwpODOL/5SQeLwpRxl4MrWwLqjjYE2KRvd95l6zRi6xsknbiGoFW4n4VJNlsJ/hb1HCg6PlEqOLf2S/G/XHaGhZWkzhYzWFF2ZyM1YzuQgHjIW6j0N+2YFfa3zZ7tAB+Zlo+QADHG8ziMiY5y60+T2WjnapRc/T3+sIwWp9rr8gr+MUWuaIdlNyM9sXHTXHAEVxzLQYfgoXwthhva1J7FvL2fAS1NqN2l82K1ZF8cR3wkvUmlfMp1dA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(61400799027)(16102099003)(18002099003)(10067099003)(3023799007)(11063799006)(261102123227099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fe6LUYxGa0AGobDMTlfcm/1IqvvB2mZSaGo5Z3gMu3HvKrtlwdORyR37kbsC5sGbDsGeSPmdOglrGXCI+BtOXBC5Mol5dvu8EThLlWcHsUmAkPd4eCRK4YbKzH7VegibbyahqFHJO+am/blDk2rV8wuLfKPYkhehPiJCoyRa+l5VvaofvR4FgcRkVEQbj95jlT9oqzWmpl5MmTKTJOdFRxfLN/gOQ+MtlmxKIVchWMzhk7RBDoNWnQAVlMCbP2ZPv+iT9iBhfRLyxi0zzvgso0YhOK6UAnqKcyX4pXVaCVILZl44flWSUJ0MCEVqzm/YJauQdTEvEXRyKoGGT8JXpHpUCB8MHxTCMmOZEV8MMiNxRF5IDmy/AO4Oy5OZhXYO8QXrhgmP3YqXt5un0tmY5SgNteO7rfryMvGkkKTRJarzJ1L5zGKShbGHMpjYQqpm
X-Exchange-RoutingPolicyChecked:
	MG2ldDg9yQyYWoElhbiFccZSM/YeO6ZbGGHiIOPF413Sp1HOWFaYDg90Fff554N2/0uXJByMgyTAUMng4GbvSMC9h8BbIgplbOuQNTqTU9boeif7Eyn/wOWWijfYMAJejoIcopnTvdykXj4BKyiurSiQD3C65Fr5Hn3/BLO8rVxk8wT0UkWAHzsU7zBqQErzoEM5x63oc0SN9LVqiCgSNhjY7MShGtz15yDiAv5iuGmRoPYM1QowhJWOdCO+x4gHUMgyfrOwvtPt1Omf+3gCUEbuaR5RcKcqFTtSmm8WtK0UoFBAGf94TeggFab9Te8rUdoERE6jPjieg6+nD4aCyg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:09:31.0682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd5fe6e-2ba5-4171-7a8f-08df3c17f5a1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A88F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR19MB380127
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MCBTYWx0ZWRfX0AGGwrTVFmeb
 7QLUlfIrC0dA8hS7yDT8u0ZoGdeiOtY8UE8NTCgPgoRJZv81YhXgbSW2zuvtS6xm3S8cN6wwFbL
 BN8xQSjArGKdI1siBBGDJ+S6ZnN4lyE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MCBTYWx0ZWRfXzF7C2mqe6B2d
 TxY0sq9x9R3kl4zY1pcqx9t5F57n8BCuibM78DIxsz6X7wUL3AfR3WocreVoZNHEAHmaB0pHBL4
 hPB/uOA6SeVt9GrEGjatGiX0SSk45tWkvZrY02Q55/nikChZOr6IiLnmx8K10AsIxd3pDVXcTvh
 BbdkhNYe/CDn/NJp0e/+ZbYuAWLu/jSHBNZFvDcySrCFbdPQsWMr05Dn7sSEyDpNmxjQBa1TwEV
 ZL0VeNK5ZPhVYoNRUZMfX6i28JMnAfQ7C/i/51IqXQso2WWInJTHqIvXsycUhDsBs5le07yGeV9
 I9iEdvjb9iW36tdD7+b/gscV6DFO4okbFTy/a31+yRs4V8DSh2k2gGlKIKZEimkCVZtV7rbGdtN
 eAZ9bCUOjgEmRzX7zuwsi5co/VJe8j13bqau5K7hvNNnje7TgapbXwtCdtNW72Cb7bBNDidTeeF
 A+2IBrNesuvb9/wpmDw==
X-Authority-Analysis: v=2.4 cv=K5K3jCWI c=1 sm=1 tr=0 ts=6aededb0 cx=c_pps
 a=sTZbCbQesDggSpYbwUb/cw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=T3sSgvYPHZmSsOrUso4A:9
X-Proofpoint-ORIG-GUID: TFFTbMliu39aD6tIYppQsiLYhdisJ3rq
X-Proofpoint-GUID: TFFTbMliu39aD6tIYppQsiLYhdisJ3rq
X-Proofpoint-Spam-Reason: safe

SDCA adds constraints onto the DAI based on the DisCo properties for the
Input/Output Terminal. As the SoundWire port for a Terminal can be
selected it is possible for the SoundWire port to support fewer options
than the Terminal. These patches add the SoundWire port properties into
the constraints for the DAI startup to cover these situations.

Changes since v1:
 - Move constraint allocation to DAI probe/remove
 - Use BIT macro where appropriate
 - Correct GENMASK usage
 - Add missing array indexing
 - Correct channel masking
 - Reorder the priority of SDCA properties
 - Handle the case of the word length not being specified
 - Add a static_assert to check the constraint array is large enough for
   the word length mask

Charles Keepax (3):
  ASoC: SDCA: Move DAI constraint allocation
  ASoC: SDCA: Factor out helper for creating mask of Cluster channels
  ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()

 include/sound/sdca_asoc.h            |   9 +-
 sound/soc/sdca/sdca_asoc.c           | 217 ++++++++++++++++++++-------
 sound/soc/sdca/sdca_class_function.c |   6 +-
 3 files changed, 176 insertions(+), 56 deletions(-)

-- 
2.47.3

