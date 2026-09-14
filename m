Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1098420888
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378734; cv=fail; b=DDSZ5uAfKrrNQpbo8Y4EL+DEDiRXa95nzhlX9DbO+gcXBDzwi68IpOrN1uJIfs3DX3xNnQgheUagFtsF3F+6feztabZIKPQht8fYxjisMu9CM8/0nAGNA6FDaapeRHl/FgSXDyjztQp9YU0vpLSvjhj3R6Zy87utmpKbwjX+Bn4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378734; c=relaxed/simple;
	bh=xrJq1B+HfkSD1tfALXfVH36CdMhEqzYSN6ZHTK9ucQg=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EPU32E0ZxXcg4PZbTBpo+HOw479WKwz9LelrXfbDgk3Xb94HHdX9ZyIfS08Rt0DjamVIg7TY06jGKvr052ahfcytwLMuXuLOhubth2FhSBpShrchHWyhUTtVw4NuTMrPm8E3+QUXWY9dH8CoACXD/4GIACPK/MR619ojwK71+cc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gjt6oXO/; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gjt6oXO/; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gjt6oXO/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gjt6oXO/"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Pk5lUm8/Tlj2dI/kUDj71x2SmEGff8yOLjYEWqQzBoITUZOCQzmGdSD9ieM7RQ4LFgymuTxQc9kZxDIMCIUXfl6AQvI/TW0y2CGMb3nBREZGWtCyS0Pj62nFigZpEp7GZxo3RRTpEFC3ju4++eIWZIBeGGSZXNQzfRACejVM9PVt80KJxTI5prqqUu2dVyLlOylQ8c/rGwT1r0DlxgyU6y/jHUVq4ied/HCyI5v9f5o3ABcTabOIYGmOA2XWlrDCVOcoiMIeVleA19K6Gzat6jHmeIwhS4VUzaAgPq32b/Kv5wIlHv/3wWIHry4WAMs2Wp5SNZF+aEM2IDy10Nu+Ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO8EXsjmVYBqmNTE15vi2x+FEzJP/H/UCSMrfHYOkD8=;
 b=n1hEDK3MvypH+/0nvLjd7xEcjMvxfMUc8lCT1JlB/sEUISkso5tFwvoyvCS5ln87eF7mclel3ReXtDrDUViSBihowncmSS/3StBqHDdMyo8kEX5nbybRXGmaMms2TOJAi8/WMKrGjC1nsHjpaKSyhx8LRrjRQ9yInhYoKaRT91H3wAr1P54I3LmtBdzslCUq0/5xBgV9eVFDoSIMwiBRuEuHyQLJ0iOXsq/KhXaW+G/MaBZeaKAdYPALmoqMqoFrbsIQV2LqwzcTh6Up2dNZBxubhn3jWUCC/CLU98dDIf4GVus3HUj04Gt+tb8Ds14GTFR9BcyzaU4sazBeKDuRzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=google.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO8EXsjmVYBqmNTE15vi2x+FEzJP/H/UCSMrfHYOkD8=;
 b=gjt6oXO/3EkZvymdQ4D6etMBnTtrKQpvjQdopWtR0gqnN+fMZAl7Ri/PssI/5WXIgLK9X+fkjgPDUDj+/GpsS9GE21n7sUId/TyhNGPkFVWP20jJqBoW+jyl8owv8mJ1C/YC9UKRX7Dj/JliixcCJ4nFqcoEeuDtZG5n6tOKFp4=
Received: from DUZPR01CA0350.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::22) by GV2PR08MB8123.eurprd08.prod.outlook.com
 (2603:10a6:150:78::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Mon, 14 Sep
 2026 09:38:39 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::8d) by DUZPR01CA0350.outlook.office365.com
 (2603:10a6:10:4b8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 09:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 09:38:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqdbmAY+o5Qnuih9CQbc6GaPuZ/CIS3hkFe/TEYjdjqivDhX0X1pidNFOlXcLmCNoClHmjvv6Wg5UhOl3nrrWIiUURWtKiwtGqLUDHajCyLIvMzGy+F79HhXvpjGoeJtp0tr4ObVC60hH3V2DUb7q0M2ztsJ7EBbkuk5c894eZIvWJvGyJismy6seQ10pRKMe31NBAg2HQs8bTo5S2HZ6UbQB82GrAvKBPyOGdrBVCBwMWAy+zUNzLRLUEoll+xA6X52a78oIxex0oxDws+4MeTxf+yuvOZAw5gTsVyClKGf0CMoSurWFZuKBbUl3b2QSwa/yyJE9sato+qMdEhQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO8EXsjmVYBqmNTE15vi2x+FEzJP/H/UCSMrfHYOkD8=;
 b=V7lJFfNAIVmaPEBCn7CfmToiUGmx0vIeiMSkiOrfIiJnKLfR2A2FB1qm/s9PhZh5b89zzpymkLe+0v1QV1H8MHLM9BhWyb/6RzWuvPYx+7y5kdC/2RAFaKdR4fUsHHhxRMzl5rwnLg6T5O3tAGs3OK/jIvTyPBrXuqBmtqXqKgidddFPTCyYsUCFuKkSeR2Cg6fBCvwWEtOzt9mW3QkAoLOevvj9V9D/s9zQA8d6tMsTDjQxh/XgfXDW7UTZ08MHmuLI+4RE2JLmQDoMzn5GHWrKmbvDbw/ilH2bKrxD5zo6oK/yMyycrnVTEO+DHMS5h5Wik5IHOP6MFFFur4UYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO8EXsjmVYBqmNTE15vi2x+FEzJP/H/UCSMrfHYOkD8=;
 b=gjt6oXO/3EkZvymdQ4D6etMBnTtrKQpvjQdopWtR0gqnN+fMZAl7Ri/PssI/5WXIgLK9X+fkjgPDUDj+/GpsS9GE21n7sUId/TyhNGPkFVWP20jJqBoW+jyl8owv8mJ1C/YC9UKRX7Dj/JliixcCJ4nFqcoEeuDtZG5n6tOKFp4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by PR3PR08MB5658.eurprd08.prod.outlook.com (2603:10a6:102:88::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Mon, 14 Sep
 2026 09:38:06 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0428.004; Mon, 14 Sep 2026
 09:38:05 +0000
Message-ID: <83ba071d-047a-4c7a-8de4-bfe25742ce93@arm.com>
Date: Mon, 14 Sep 2026 10:38:04 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [patch 0/3] lib: add synthetic MM benchmarks
To: David Rientjes <rientjes@google.com>
References: <d6787a7f-3213-2b2c-2de5-af3b02daa21f@google.com>
 <cec6f48d-8857-49d6-a24d-b072482bf0c8@kernel.org>
 <c76621a4-cc8c-b6a7-732f-633d372477ff@google.com>
 <707b26ac-7f73-430a-a473-cd3409c4505c@kernel.org>
 <8936784e-9ccb-4c33-9b30-f99552e10f87@arm.com>
 <1af513dc-a33b-9c7c-2827-097e16eac077@google.com>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <1af513dc-a33b-9c7c-2827-097e16eac077@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0449.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:398::8) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3421:EE_|PR3PR08MB5658:EE_|DB1PEPF000509F8:EE_|GV2PR08MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 145467e7-f791-4355-be6c-08df1243f520
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|4143699003|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 8UbKpn+sLy7Hsoac7ERIw2kelGPvAOsWBWoL2mLwpMcXYjPYRVNoOXqHUoZPuXGDWhBPEqyzTzwhv4sLrtKlaGIULlb8EOJEmkqIbmWrumXH5f40dsL1+HQuxRUp6bzqiDzTe0bLd6Au3QiTFaRpEP8ztWJBoPKtAp2JCLsAzLW+O70SKllv/0zrOJtA9pXijJDlku0zCDs7okOQ4fmvNh2i9zrdFWVWh422wJeH9wttjRO4SmL7RajQXveiBHSi8dQYnnnHk+jU/m59XBw9u4RlXCeswQ5lfSJlmwCmiex/BNlsraArDs0yal+aDr8fOtGvkN6HcUspY1SKct+lcFtdUQas/Iq7Ic/OKFrMBIEdcCa2yw/3TLA6VjwCKq+tC7c+gePoGj7WBvJFjlorATB1X+E79WNIuPKR8WV7hAHOQDbnXvrXhYtzH10ZLrz9OZ3P0zv7z2lnYQycb2I2+0FKs1Lhb498CfTp3vDAG1Zt46MprYIDjmHSsvPYvBGQWl+KXs43THufp+JtvAHUitQT/dUDnOOdJL245bEpVXkY+Ky/a84O/3rgdwIwt5qQcT0lyu74L3NLi1cMT/mshsrl8i7v6E4Zy3fn4xP7oYQFW5wMtKcimpwX8H4y3U3N++vD1lQ164+/Ms650p7TsQnkgCL5R3HZ4t85nduoOu8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 0xp1DIFDNLWdG2SOKpHoIVkGXinD+iVmuPqCGhRqQ9auMSNlTkwizu9pe2vVZUv9CMwpQp/WwyP7HWJ56X1CHdQST4dtQIRdJtZs/B573Fxy4zF/jcgd7Pq/oWFeeRPCdMbfEMaWQDHOJ1sh6MyJHfO3IXxgGztzpX2eritnGaJitduf+/aGbAL5doUmWvuQJ0BCtBW4CaFo430Lcf4eeHfwDZRN7gYXpdAVsHfF+2BkkNrihCmJ8MVA7flYzPPW0WRYRS32W8RE+mutjf0Exjsfd13uwmjcpkOUeOqDXngreLuc4elPgWUFbWumuydJXz7RH51Gi8afe6Ekgqc8MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5658
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6367c28-e1ee-4f48-a64e-08df1243e0bb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|14060799003|35042699022|82310400026|23010399003|1800799024|4143699003|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	wB2LQimBp5ecpAyH5zRfIpyyN1unoPwbSm2KFJXzPVoyGb83iP8B3NIoYmNNTVe+x9a9KzYT67PAiqEo1EiCgQn3HXHZo/4MlcJtXCHd2+yvdijvbL2Qehr5uowBf4qctRmc+jjlDxkZBWQZvpOTA+n3OIoyvlX4RzQ/p6ZMPXtZAvXJOEBib+bT/EuEOK0m42dA5zhWo3j2HxIS/JwZzSwyVsWlRFsJpr/1awn2hkWdZ1mwE4tG2MbwY8tUITH7ki4IbyWqkVOQHA/UfHRBfzwLXHEouGo/65fRksrvnsfkrLiJ96/CsWnN870jJs30QUmuXDoCoeWIiSZX0laih/bwchwaIsVYNttcHvJ7/qRPi+DMJ5W2wYDDJq4XGZ/NQIkbq3wtw2ZhuQkp4DDWnlD6m4kfSb5XnOR0B2AN0R12jEVbUDXINFekj5rHRCnvxIfjJXoa22RdCCxeXsA7lColnR7rRSIZEAaREAtkO4S7PWHUnHu7cNCZoCaPTqxz2p/06wnDDTnyJKqcguT6u6MRhN2zNB+TNvqA8gPqUi7KS0B1zIY5xenIEh4SrcykDM7a6TAMtvHiADg3ZwTub/TovTqOaWj/MgKF5eq8+JesckksURxv7/w2/7R/1o1G3n3gdpuKh9JMoWGVjrO2Ufqyb4ohDhZrK1nVfPyluHd8gb7wE2ymhKo70aF8S0CB3XrYJpPG91lSQd/B4xGfxg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(14060799003)(35042699022)(82310400026)(23010399003)(1800799024)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HwqtqTQJXkZz7XotjUYUVDqltMnVV0FDMx98/8VAZD8GISLdjVTe9wGcaobRT+AnfB8Ejr2NEmPkcLQhOsqGkIkhEtme1/sQIojNwgjQv2HxcISln25c1Q6azbvn4Df9CSvYWzlLLl4f2hVte7voGDugnTN9kk0qkBazPVjdjx7WnfR9oZ7vYtYObv0y51ODvWoiCZvq+BEo9Spwf6L3cEwp1xFXA4VD3NzfKbV3yNuGUQ9BOTjJDU9eYUpbEFtHZN5Us/zzu6V7LBMKS+skMGdwT1kuqZrWqRI+gbFBzmiNPNq7JS1GfD2alosjHLN6HYRYv/SQDY3qbyEnBJLyp9JM8B+3Mf2p+x84c/pATWDDhVvTRuLeh0Mlqw5svofnvFLszWUEMZwgyGFkvsSr6gJzeHumyUNZJcjD4MCsPfiHefaykfBRBIYBViKY9lKl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 09:38:39.3594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 145467e7-f791-4355-be6c-08df1243f520
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8123

On 12/09/2026 2:05 am, David Rientjes wrote:
> On Thu, 10 Sep 2026, Usama Anjum wrote:
> 
>>>> I thought about the same and just followed what appears to be the standard 
>>>> convention (like test_vmalloc above) for lib/ for now.  If they should all 
>>>> be moved under tools/ somewhere, perhaps we handle that in a separate 
>>>> series?
>>>
>>> Yes. lib/ is just absolutely the wrong place for that.
>>>
>>> Maybe lib/tests/mm
>>>
>>> But then, I wonder if they could just be somewhere in tests/ directly ...
>>>
>>> Anyhow, it was also raised whether some of these could be written as kunit
>>> tests. It's been a long time since I worked on these, so just mentioning it.
>>
>> I also think it would be best to try to add them as kunit. I'm not exactly sure if
>> kunit would accept such benchmark kind of code. Some research is required there.
>>
> 
> Sounds good, I'll transition these to kunit tests, move to mm/tests/ 
> alongside the other MM kunit test, and send a v3 for just the vmstat test 
> as a separate thread.  If all looks good, I can do this for slab and 
> pgalloc as well as a follow-up step.

Yeah, sounds like a plan. Thank you for working on these. These would help
everyone.

-- 
Thanks,
Usama
