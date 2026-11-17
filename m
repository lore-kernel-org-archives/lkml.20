Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.76
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897782;
	b=CK2hs9v0cjPXWwXI63yEZv+B5S5tau0A+JyTXQ2MTBFMMJPkK3hu8ZruqnkLa2bcguPk
	 FRrb0o3QrAqQIrRoiLBoltMeOLI2HdTQYVwWhadkOdPYz+Fmz9bFNTYMxurAgCWn5UROf
	 t9Z4mk3CbDwvQKV3ihwdOJgp0O7rEmqGDzIUA3NUknsEuGIjfj7wTTV1w3PoPhuO+ro+B
	 fRrL93HnvMZAeI346Zi+Et6HMORi3QRaULTWxQP0QNb1zk5Rr4M9Wds4DP4ZTBD90AMju
	 bcB3OGo/UC4GpQcGKHkAnx8zw0517kNXZowfMcK4sIU3QMr4C0B3HPV025YsTne6ZOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897782;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GzD2rTdF/Ab+5p2lZ90KS7PzdunsaFcU6Gnmi5fplSg=;
	b=ntMqiKB6obLTvKBrZQd8Kavs0hCshcTdphHkczs9skj7Wzrb4wjgaseRrkh1fAQF+/c0
	 P+0h2PfEQVfFNxc36gYfsJFtOC+Kr+wgwdY4JjCsDyasbWOoBl1RbHqciGo9Ci7anh2e2
	 d41RqQFzs15pAoQyMhnvIxkgpggH/8GAdyk6wvIFdKNKDJakiR3U+AlOkrWoUgxd2vwWB
	 Ou9SLBddI4ffZ6WnLdfzS0Yah8JyiYyDrGVZZdRMFsc6f5UCwACbfksgN8v1CJw6cgeeZ
	 f4iYtANPDSmF9Jcp7HO8JQSB3cWt/GxD5WkVaDITdN7ga8IUvMB9EeTDdDlDtasKdbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=UydagVMA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.76
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023076.outbound.protection.outlook.com [52.101.127.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A50F606A880;
	Tue, 17 Nov 2026 06:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A50F606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=UydagVMA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eP1esgTTIdbePz+l/x7sOJA6M7lA3t+kltz/o9H840DlEfkhP2AwEODwCLCHDtIz2sZLUHrEHqkpWZ12oXkOC628ekxs6IWzb39UOqizaIe4s/b4xAhUbCmDAt6DCa9Yc9WKVGi7CRt7yywrdz2aVoH3QEWMJI0FffT8ZjvQaElJ62MXmNZ6zynvxX/raAAzBrYkDDnyViUEimdp3L5/ktmdu4+YL6NCevKIBuWBtd9PxjmjmPUANqZvyr8/sAvoErMj5M5I0LMei7oGf76MIlJhvr2/S9YLrcrEsNTIDsokqOyt4NSDrxUhXnu0liJiuQpUId3pH0YjtarcBfat7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzD2rTdF/Ab+5p2lZ90KS7PzdunsaFcU6Gnmi5fplSg=;
 b=unxmvTZjphdxKcf9UyVSFqMD+Fc5PqbJrduQeTSjFiYbzanc/OWgFh7esp6cfKmmDN+hO7ztAsb2ErOkuynZcuhnTOyoyb8bl+CvmMYrp6nFC0DlfQ38O6MS/A3dw3IDEVzjvbNnLeT4+dCdBBsSPVHX2Ay7ZzDDpE9GADZpm9DOtItNzTu7B7yLrDXGqi4HPJTTu7bqntYuNr7m5aUjqCJHFBKGNNU2qwuRhT+IL9deoUxHEwEbOBAyHAo5rmv6+TWwGwMp8E74fQ0NhSe7uWUHfgpn6wnwXxokg069anYL7K0THl+jrbQbuznqesVQOi/VWy71vE4LSdUOKcPDDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzD2rTdF/Ab+5p2lZ90KS7PzdunsaFcU6Gnmi5fplSg=;
 b=UydagVMA42TYb9J2geTpNGAfb6UUTJ1APIcyCaUq0UN4M6wu6iloKsw7o7147OLjXh4bnJJ1RulQ56p75vTuQBPvUjgH7e6t7rCqyY9361h2PfIfKElQHIpTXxecihjxfR8x8yqBCDlfhiRA4j5+V2mkXRmpcEFsf3LbcN4ICE7z+FT1m9G/EcD5RoEkZLX13EQdvkkTE770+u7Uc8TZCNI/E9QuHMbjOMYI6pajIr692v2JxmFUlSqWElBFQfDBb1O6MnTVl2u4htSYp6jhNkEAn4CFXrnA9d8/HksorI7JhvtZCIvlRBqjjvGjtYD7kKbDExA7O611HpwsmjSCtg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by OSNPR03MB9798.apcprd03.prod.outlook.com (2603:1096:604:46f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 06:42:51 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 06:42:50 +0000
Message-ID: <01bd407a-46a2-47f9-98fa-1255845103ab@amlogic.com>
Date: Tue, 17 Nov 2026 14:42:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] decoder: Add V4L2 stateless H.264 decoder driver
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-4-616240978792@amlogic.com>
 <efdc99694c36ed26c8475e31c4e90773c8b0f53f.camel@collabora.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <efdc99694c36ed26c8475e31c4e90773c8b0f53f.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|OSNPR03MB9798:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfc3234-0365-409b-6610-08df4475ffcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|4022899009|366016|23010399003|261022105027099003|261021121427099003|4143699003|5023799004|11063799006|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261022075727099003|261022115727099003|261102123227099003|261021123027099003|261009221727099003|261009223327099003|261009221227099003|261009223027099003|18002099003|6133799003|22082099003|261009220027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ppe8S9xLU27YAbNIlgGnLLPvhxyIJq3DlxRAoGkiejpr12EDFTGI7I9mPHr6B5lDJXBzbbeW37oiW0Lw/4ZfmWUzQVFrlzIBpUJPo84Qti1lt3xenFlzrb+TtyXnlIC02ZIfrp5ySjXTw3tRbjKnb/0WFtMT4r1x7fqAr2oTT7Uj6xOlmlP3Zk0GpfK1Gz7Ov6StfJj35+q6zU8KIfmUI6OlP86LQq6whcUXMpW2vQU+XPVongXUI7s2cWWUHDiAyexxWGSvCvRLSMBOz84+PqXx89NS2S54Rgvl5xOstKpeScWGdaLnL06PZUWq9CoRAQ5/7YA79iJqW82da+8a5rdjK3Un6cNw05MFPuRy/CYAEcTpwRVfdbYAcDRHPDHyBN89Wjhknk1wfBlzOO7G/bjLnygpXaxKiS5N+qxzdK7LJ4m5raoZ/bHXHeKQzRuelfepc7paLRtIVmnpmjSG9bEF27cUXgA3/OjcX9QlxPrkrWilZEudc9/vTxUzymMpfBZ4KIKKGXTE/VF7u9O3IoBgcHj+v7N7a4C3U+9ArvmpXKDC0UYmFMbB3iPUFO5Y3AYquHlgKvUVZkVG/pmNqSrq1TiozXYVBjx6M9lKQ8kVuWRqjxdyYiBqlaIZwh362Ug5ohhZ+0yjJz1H8N/kp34bWA5JJ+PqLxoyAcGq04w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(4022899009)(366016)(23010399003)(261022105027099003)(261021121427099003)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261022075727099003)(261022115727099003)(261102123227099003)(261021123027099003)(261009221727099003)(261009223327099003)(261009221227099003)(261009223027099003)(18002099003)(6133799003)(22082099003)(261009220027099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnFjTTJzQVVuTTZGc2wrOTkxMUlaMGRsbVdpaThiNWFQS3V4VnBXTUJ4M2or?=
 =?utf-8?B?LzREdk5sM0l5SXExell2RFp2NUsvT2dGd0tjK08waWFrKy9NN3dPdHVEaG4z?=
 =?utf-8?B?ZkRlREdub0xsVVdBcHJ3WlpiWmJCRk5peGl3RXlKTlM3YklJWFRUb1ltdHhF?=
 =?utf-8?B?NjhjWGR3V213NlFvSmFEWjBRb1lkbDFOQ1QzamVzR1pWc3BVZVUwUFQ3RXZk?=
 =?utf-8?B?cTluZXRlUmFsWHUwY1dBcUJTSEU4RFBpUkZ6eUxJdjdvUC9QVkJsV2JlN1Vo?=
 =?utf-8?B?L3RJRjE3MGF3dGRFbTdRcHM1b3dSNVl1TFR0SjBjcDBiNTFoN1VpN2pYWDRr?=
 =?utf-8?B?WkNyVG1EK1RCeUNPbms0cWFrM01OT25Odnh3dTJxTzZMUm5oN1BxZndVZVI0?=
 =?utf-8?B?QUVXQmthS1dZUFlGTm5EV1VXNU92Mnd2V1ZiNG1BTFI0bGJwSHpzbmdXV2VE?=
 =?utf-8?B?S2NMVkxCTldKL0tOSGNmM01hck0vemZ3dUJqMkRlaysvejE2M3dIcGNvT3g4?=
 =?utf-8?B?a1AwVDdXMFlKUkdYV0hzemtxbTdPS2xmY20zLyswTzM2VGg1Y3hObVg0cTZn?=
 =?utf-8?B?Um53SlZkS2MyN1lwdW1scmlYeVplY0dMWGFsejdpUFFzLzR4aDUyUFJCN0xl?=
 =?utf-8?B?a21zTUVMRlJReHNWeVRVMTU5UTZjRFFHV3VxVGFoMjM0OGdzcUxCUkFTN2Fs?=
 =?utf-8?B?V3FTNmwxc0NjeldUaElidnI3WHd4RFlaeDVtNlVTRmdGRnFvSmV3eS9GWUJD?=
 =?utf-8?B?UXNBSzNtbGJ5YzY0SU9UUFB1cmt5Z0pQVUpnRVN4NFJ2TXdZL0tWek5nYjF4?=
 =?utf-8?B?a3JDNVdoN2lWTTAxRWJlTDhRNWZIeDNsUnd6cE40WFh3UUNTUThZQktTdWY5?=
 =?utf-8?B?Z05oVkpQR2JOUkJEdGhkZ0JwV3p4aGxEZnNXUFJGQmRCTGM3NTR6amlmTHQ5?=
 =?utf-8?B?R0hlN01YSmpzRGh5Y1YzejUvSUNDSkZoOUlIdTBxU1VqZVlmU0dDV2JIVmdz?=
 =?utf-8?B?R2tCT2FmMWlScXQydy8rN1FHY3o1cUQzcGE3RkxGUUdFVnEwUzNQUXVNWm1l?=
 =?utf-8?B?U0FxTUxrRzNpK045aUgrNURiVVVFUndGVGZsZEF4eTZmZU95bTc5dzJHZ3Va?=
 =?utf-8?B?aEl6MkFjM1llK0NPdEM4d0paZGc5ZlYwSERNbW1hbDNna1ZRSWtMamFtckIv?=
 =?utf-8?B?QllIRXVod3VmeGE3NlZPQzBuMFBReHhGUERqa3Fab04zZjRhMHNZc243NlJY?=
 =?utf-8?B?ZnlxTFcwVW1GRmVWQWNNOHh6UjZIRkFWVHdYc3I1Qm9ubWhwSXRMOG1GNlhZ?=
 =?utf-8?B?b1JEcGM3MHRmYkZPbHV0c2g5WlhlUEM1bC8vblNrNTM1MXR3aUZiK1lIRTN0?=
 =?utf-8?B?bmJvVUJnbDJCVUNncXJTbk9CS2VqWmp6czZZRDhDc0ttOGo3TURUdG9aYk8v?=
 =?utf-8?B?VGNzcVFoOWxMdzcyMkZpL1VCZi8rcHhmZXN3YmQ5elB6RndPMUZpbk8yVko2?=
 =?utf-8?B?WXBob05oNmoyN0U0WnErZTQyY1lyUzJGbENpM2loelBKYzlaT1BYOWVpanhn?=
 =?utf-8?B?TmMvOGh2aFZLZENyaDVSQVRGWG9peUJVK2tjTHU5S3FBdmdVOG4zd0wzQ1RG?=
 =?utf-8?B?NGkxNTZPY1YxdnhGa0tualFORE54ZWRNTFlLWnZVaVR6S3llWEpNS1hkWVcx?=
 =?utf-8?B?ekVaQkpVQXZvVEMwRW94TTZodGY2Q2E2ankxRHhaK0pFUnJuU3NJM3RVdDFv?=
 =?utf-8?B?N3c5NlNOYW9kREtrdmhYbnFzMC96VWwzY2hMYlhWQlU3d1hWRE1LMWFCdkp1?=
 =?utf-8?B?VGo3dDAxdjA4K1VCR2QrbVVTY3N5bFgyY0NuRENuQWdudk0rMCtMMGphUHBv?=
 =?utf-8?B?WFo4MjFZcCtRczBlSjgxZkNCSFk1clZWMVlCN2owaXQrc056dWlSUytlSStr?=
 =?utf-8?B?azZQVjRjLzhGZVJDUzFwc083VkhJMy95eGpmNnJUYVdHMEY0WGxSTDVsSW9o?=
 =?utf-8?B?K3V2QUJGamlQVGVZc2d4dnlPQjhKZ0NkQjVnUWZyM3p2OUdiZWlTYWcvWDR5?=
 =?utf-8?B?bGs3QVZKbWFENExmWU9oWWZJaTBUMGlxUHhUQ1FpcnQ5VEsyVWJzdlVBQnNY?=
 =?utf-8?B?eXUxN1RZanNXOUQ2eXVyZTBmM3JLVUZYcDlLckFTb3ovRGJ2L0Fqdmhyd2JV?=
 =?utf-8?B?c042TWwxVnFDSVJJNUQ3K3NZZ3BjUE1hYUg5VzJDNUE1YzZ0bFVMYW9HUFZF?=
 =?utf-8?B?ditDbFFTMnd5OEVtSWNrL3N4a1BMeUpPTzROYm0wbkszWGxyblp5UHM1cGRm?=
 =?utf-8?B?WFo0SjZXeFY3clFVUUt3M1dxNGNRcVBKV2pRbnI4bjF0dXhDekpiQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfc3234-0365-409b-6610-08df4475ffcf
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 06:42:50.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxX2hsGeab5S3OGkKw6DH2TFDot4iH3xr35cFV7XHSHS5UaEDILUoEfy2rdqjdqVFp5kAXXsasKkdvKiXDuK2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB9798

Hi Nicolas,

> Hi,
>
> Le jeudi 22 octobre 2026 à 13:27 +0800, Zhentao Guo via B4 Relay a écrit :
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Add initial support for V4L2 stateless video decoder
>> driver on Amlogic S4(S805X2) platform. In phase 1,
>> it supports 8bit H.264 bitstreams decoding. Currently
>> only progressive streams are supported.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   MAINTAINERS                                        |    7 +
>>   drivers/media/platform/amlogic/Kconfig             |    1 +
>>   drivers/media/platform/amlogic/Makefile            |    1 +
>>   drivers/media/platform/amlogic/vdec/Kconfig        |   18 +
>>   drivers/media/platform/amlogic/vdec/Makefile       |    4 +
>>   drivers/media/platform/amlogic/vdec/TODO           |    7 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec.c     |  846 ++++++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec.h     |   33 +
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.c |  260 +++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_drv.h |  168 ++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c  |  570 +++++
>>   drivers/media/platform/amlogic/vdec/aml_vdec_hw.h  |  161 ++
>>   .../platform/amlogic/vdec/aml_vdec_platform.c      |   81 +
>>   .../platform/amlogic/vdec/aml_vdec_platform.h      |   46 +
>>   .../media/platform/amlogic/vdec/aml_vdec_tee_fw.c  |  249 +++
>>   .../media/platform/amlogic/vdec/aml_vdec_tee_fw.h  |   27 +
>>   drivers/media/platform/amlogic/vdec/h264.c         | 2209 ++++++++++++++++++++
>>   drivers/media/platform/amlogic/vdec/h264.h         |  299 +++
>>   drivers/media/platform/amlogic/vdec/reg_defines.h  |  177 ++
>>   19 files changed, 5164 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 149bc44003bd..58df555ae864 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1458,6 +1458,13 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
>>   F:	drivers/spi/spi-amlogic-spisg.c
>>   
>> +AMLOGIC VDEC DRIVER
>> +M:	Zhentao Guo <zhentao.guo@amlogic.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>> +F:	drivers/media/platform/amlogic/vdec/
>> +
>>   AMPHENOL CHIPCAP 2 DRIVER
>>   M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>   L:	linux-hwmon@vger.kernel.org
>> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
>> index 458acf3d5fa8..7c541ac0d0c3 100644
>> --- a/drivers/media/platform/amlogic/Kconfig
>> +++ b/drivers/media/platform/amlogic/Kconfig
>> @@ -4,3 +4,4 @@ comment "Amlogic media platform drivers"
>>   
>>   source "drivers/media/platform/amlogic/c3/Kconfig"
>>   source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
>> +source "drivers/media/platform/amlogic/vdec/Kconfig"
>> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
>> index c744afcd1b9e..7409de674c0b 100644
>> --- a/drivers/media/platform/amlogic/Makefile
>> +++ b/drivers/media/platform/amlogic/Makefile
>> @@ -2,3 +2,4 @@
>>   
>>   obj-y += c3/
>>   obj-y += meson-ge2d/
>> +obj-y += vdec/
>> diff --git a/drivers/media/platform/amlogic/vdec/Kconfig b/drivers/media/platform/amlogic/vdec/Kconfig
>> new file mode 100644
>> index 000000000000..2c5dd8452962
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/Kconfig
>> @@ -0,0 +1,18 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +
>> +config VIDEO_AMLOGIC_VDEC
>> +    tristate "Amlogic Video Decoder Driver"
>> +    depends on ARCH_MESON || COMPILE_TEST
>> +    depends on VIDEO_DEV
>> +    depends on V4L_MEM2MEM_DRIVERS
>> +    depends on TEE
>> +    depends on MESON_SM
>> +    select VIDEOBUF2_DMA_CONTIG
>> +    select V4L2_H264
>> +    select V4L2_MEM2MEM_DEV
>> +    select MESON_CANVAS
>> +    help
>> +      This is a v4l2 driver for Amlogic video decoder driver.
>> +      This driver is designed to support V4L2 M2M STATELESS
>> +      interface.
>> +      To compile this driver as a module choose m here.
>> diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media/platform/amlogic/vdec/Makefile
>> new file mode 100644
>> index 000000000000..f752716cbf9e
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/Makefile
>> @@ -0,0 +1,4 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o aml_vdec_tee_fw.o\
>> +
>> +obj-$(CONFIG_VIDEO_AMLOGIC_VDEC) += aml-vdec-drv.o
>> diff --git a/drivers/media/platform/amlogic/vdec/TODO b/drivers/media/platform/amlogic/vdec/TODO
>> new file mode 100644
>> index 000000000000..54c60145770e
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/TODO
>> @@ -0,0 +1,7 @@
>> +TODO list for Amlogic V4L2 stateless decoder driver:
>> +
>> +1. Support decoding for HEVC, VP9, AV1, and MPEG-2.
>> +2. Support more SoCs, including the new T7/S7 series and legacy SoCs (e.g., GXL, SM1, G12B).
>> +3. Support 10-bit decoding and P010 output.
>> +   Note: P010 output requires hardware support.
>> +4. Support interlaced stream decoding for H.264, HEVC, and MPEG-2.
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/media/platform/amlogic/vdec/aml_vdec.c
>> new file mode 100644
>> index 000000000000..e65ebb2ce311
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
>> @@ -0,0 +1,846 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/videobuf2-v4l2.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include "aml_vdec.h"
>> +#include "aml_vdec_hw.h"
>> +#include "aml_vdec_platform.h"
>> +#include "aml_vdec_tee_fw.h"
>> +
>> +#define VCODEC_DRV_NAME "aml-vdec-drv"
>> +
>> +static const struct aml_vdec_v4l2_ctrl controls[] = {
>> +	{
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_SPS,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_PPS,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
>> +			.min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
>> +			.def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
>> +			.max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_STATELESS_H264_START_CODE,
>> +			.min = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
>> +			.def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
>> +			.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
>> +		},
>> +	}, {
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.cfg = {
>> +			.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
>> +			.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
>> +			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>> +			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
>> +		},
>> +	}
>> +};
>> +
>> +static const struct aml_dec_type dec_type_name[] = {
>> +	{
>> +		.codec_type = CODEC_TYPE_H264,
>> +		.name = "H264",
>> +	},
>> +};
>> +
>> +static const char *dec_type_to_name(unsigned int type)
>> +{
>> +	int i;
>> +	int size = ARRAY_SIZE(dec_type_name);
>> +
>> +	for (i = 0; i < size; i++) {
>> +		if (dec_type_name[i].codec_type == type)
>> +			return dec_type_name[i].name;
>> +	}
>> +
>> +	return "ERR";
>> +}
>> +
>> +int aml_vdec_ctrls_setup(struct aml_vdec_ctx *ctx)
>> +{
>> +	int i;
>> +	int ret;
>> +	int ctrls_size = ARRAY_SIZE(controls);
>> +
>> +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, ctrls_size);
>> +	for (i = 0; i < ctrls_size; i++) {
>> +		v4l2_ctrl_new_custom(&ctx->ctrl_handler, &controls[i].cfg, NULL);
>> +		if (ctx->ctrl_handler.error) {
>> +			dev_info(&ctx->dev->plat_dev->dev, "add ctrl for (%d) failed%d\n",
>> +				 controls[i].cfg.id, ctx->ctrl_handler.error);
>> +			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>> +			return ctx->ctrl_handler.error;
>> +		}
>> +	}
>> +	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
>> +
>> +	ret = v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
>> +	if (ret)
>> +		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>> +
>> +	return ret;
>> +}
>> +
>> +static void m2mops_vdec_device_run(void *m2m_priv)
> Namespaces are inconsistant since the start of this patch.
Ok, I'll rename this and check elsewhere.
>> +{
>> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)m2m_priv;
>> +	struct aml_vdec_dev *dev = ctx->dev;
>> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>> +	struct media_request *src_req;
>> +	int ret = 0;
>> +
>> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>> +	dev_dbg(&dev->plat_dev->dev, "device run : src buf : %d dst buf %d\n",
>> +		src_buf->vb2_buf.index, dst_buf->vb2_buf.index);
>> +	if (WARN_ON_ONCE(!ctx->codec_ops->run))
> It looks like a BUG_ON to me, any reason they may happen and would require fail-
> safety ?
In theory this should basically never happen (there's no hardware or 
firmware anomaly that could lead into this case). If it ever does 
trigger, it means something has gone seriously wrong, so you're right 
that BUG_ON is appropriate.
>
>> +		goto err_cancel_job;
>> +
>> +	src_req = src_buf->vb2_buf.req_obj.req;
>> +	if (src_req)
>> +		v4l2_ctrl_request_setup(src_req, &ctx->ctrl_handler);
>> +
>> +	/*
>> +	 * Claim the hardware initialization window: curr_ctx has a
>> +	 * strictly per-frame lifecycle (set by the codec run callback,
>> +	 * cleared when the frame completes) and cannot cover the
>> +	 * bring-up below. The claim tells a concurrent aml_h264_exit()
>> +	 * from another instance to leave the hardware alone; it is
>> +	 * handed over to curr_ctx when the frame starts.
>> +	 */
>> +	mutex_lock(&dev->dec_hw->ctx_mutex);
>> +	dev->dec_hw->init_ctx = ctx->codec_priv;
>> +	mutex_unlock(&dev->dec_hw->ctx_mutex);
> Sounds like "the claim" refer to some sashiko report ? Might be nice to
> reference it, but also, I don't understand a thing here. How is init_ctx pointer
> safer because you copied codec_priv under a mutex? Normally, to fix such a
> lifetime issue, we'd opt for kref.

Yes, here is the reference of sashiko's review :

 >>>[High] media: amlogic: unprotected dos_enable in device_run races 
with aml_h264_exit

 >>>Does this execute hardware setup before curr_ctx is assigned and 
without cross-instance locking?

 >>>If another decoding instance is concurrently stopped via 
VIDIOC_STREAMOFF, its aml_h264_exit() could see (!dec_hw->curr_ctx || 
dec_hw->curr_ctx == h264_ctx) evaluate to true, locking ctx_mutex and 
shutting down the hardware while this instance is >>>simultaneously 
trying to initialize it.

device_run() powers up the hardware before the codec run callback sets 
curr_ctx, so a concurrent aml_h264_exit() can stop the hardware in that 
window.  One way to fix this would be to assign curr_ctx earlier in 
device_run(), but I think it would be better
to let the lifetime of curr_ctx is strictly tied to a single frame. So, 
instead, I added a separate init_ctx to prevent the power from being 
shutted down after powered on and before the curr_ctx is set. I'll look 
into using kref to protect these resources as you proposed.


>> +
>> +	dos_enable(dev->dec_hw);
>> +	/* incase of bus hang in stop_streaming */
>> +	ctx->dos_clk_en = 1;
> The code in aml_h264_exit() uses mutex, which hint that it is maybe running in a
> concurrent thread and so dos_enable() + setting dos_clk_en should be serialized
> under the ctx_mutex. The race might not exist in practice, but the locking seems
> to be an after thought, make it safe by design, you always pay the cost.
Yes, it makes sense, I'll add the lock.
>
>> +	ctx->curr_frm_err_flag = 0;
>> +
>> +	if (ctx->curr_dec_type == CODEC_TYPE_H264)
>> +		aml_vdec_reset_core(dev->dec_hw);
>> +
>> +	if (load_firmware(dev->dec_hw, ctx->curr_dec_type) < 0)
>> +		goto err_load_fw;
>> +
>> +	ret = ctx->codec_ops->run(ctx);
> We encourage not doing this synchronously, as this introduce an extra context
> switch from the threaded IRQ to here. Only handle synchronous failures (like bad
> parameters) in the lower part, finish the job in the threaded IRQ. Its not
> invalid, just not optimal.
Yes, this is currently handled synchronously, device_run() blocks until 
the hardware has completely finished processing before returning. I'll 
try to rework this way: device_run() returns immediately after the 
hardware is started, the ctrl and m2m resources will be cleaned up there 
in threaded irq and a watchdog will be used to handle hardware exceptions.

>> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
>> +	if (src_req)
>> +		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
>> +	if (ret < 0 || ctx->curr_frm_err_flag)
>> +		goto err_cancel_job;
>> +	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
>> +					 VB2_BUF_STATE_DONE);
>> +	return;
>> +
>> +err_load_fw:
>> +	mutex_lock(&dev->dec_hw->ctx_mutex);
>> +	dev->dec_hw->init_ctx = NULL;
>> +	mutex_unlock(&dev->dec_hw->ctx_mutex);
>> +	if (src_req)
>> +		v4l2_ctrl_request_complete(src_req, &ctx->ctrl_handler);
>> +err_cancel_job:
>> +	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
>> +					 VB2_BUF_STATE_ERROR);
> There is clear cases, like err_load_fw where nothing has been written in the
> CAPTURE buffer. And ret < 0 might be another one ? In these cases, which are
> unlike missing slices or missing references, set the payload size to 0. This
> will tell userspace this is a frame to be discarded. I'm working on GStreamer
> fix for failed frame discard, and corrupted frame marking, other implementation
> such as chromium have it.
I wasn't aware that setting the payload size to 0 could be used to 
signal userspace to discard the frame. I will make the change accordingly.
>
>> +}
>> +
>> +const struct v4l2_m2m_ops aml_vdec_m2m_ops = {
>> +	.device_run = m2mops_vdec_device_run,
>> +};
>> +
>> +static int vidioc_vdec_querycap(struct file *file, void *priv,
>> +				struct v4l2_capability *cap)
>> +{
>> +	strscpy(cap->driver, VCODEC_DRV_NAME, sizeof(cap->driver));
>> +	strscpy(cap->card, "platform:" VCODEC_DRV_NAME, sizeof(cap->card));
>> +
>> +	return 0;
>> +}
>> +
>> +static int vidioc_vdec_enum_fmt(struct aml_vdec_ctx *ctx,
>> +				struct v4l2_fmtdesc *f, bool is_output)
>> +{
>> +	struct aml_vdec_dev *dev = ctx->dev;
>> +	const struct aml_video_fmt *fmt;
>> +	int i = 0, j = 0;
>> +
>> +	for (; i < dev->pvdec_data->num_fmts; i++) {
>> +		fmt = &dev->pvdec_data->dec_fmt[i];
>> +		if (is_output && fmt->type != AML_FMT_DEC)
>> +			continue;
>> +		if (!is_output && fmt->type != AML_FMT_FRAME)
>> +			continue;
>> +
>> +		if (j == f->index) {
>> +			f->pixelformat = fmt->fourcc;
>> +			strscpy(f->description, fmt->name,
>> +				sizeof(f->description));
>> +			return 0;
>> +		}
>> +		++j;
>> +	}
>> +	return -EINVAL;
>> +}
>> +
>> +static const struct aml_video_fmt *aml_vdec_get_video_fmt(struct aml_vdec_dev
>> +							  *dev, u32 format)
>> +{
>> +	const struct aml_video_fmt *fmt;
>> +	unsigned int k;
>> +
>> +	for (k = 0; k < dev->pvdec_data->num_fmts; k++) {
>> +		fmt = &dev->pvdec_data->dec_fmt[k];
>> +		if (fmt->fourcc == format)
>> +			return fmt;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int aml_vdec_init_dec_inst(struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_vdec_dev *dev = ctx->dev;
>> +	struct aml_video_fmt *fmt_out = &ctx->dec_fmt[AML_FMT_SRC];
>> +	int ret = -1;
>> +
>> +	ctx->codec_ops = &dev->pvdec_data->codec_ops[fmt_out->codec_type];
>> +	/*
>> +	 * The codec instance is only released when both queues are
>> +	 * streamed off: do not allocate a new one (leaking the previous
>> +	 * instance) when the output queue is restarted while the
>> +	 * capture queue is still streaming.
>> +	 */
>> +	if (ctx->codec_ops->init && !ctx->codec_priv) {
>> +		ret = ctx->codec_ops->init(ctx);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +	ctx->curr_dec_type = fmt_out->codec_type;
> That's not much symmetrical. My worry now is that maybe we endup with
> curr_dec_type not matching the codec_priv, which will lead to memory corruption.
Yes, the two should be assigned more consistently, or at least have a 
check to make sure they stay in sync. I will rework this.
>> +	dev_info(&dev->plat_dev->dev, "%s set curr_dec_type %s\n",
>> +		 __func__, dec_type_to_name(ctx->curr_dec_type));
>> +
>> +	return ret;
>> +}
>> +
>> +static void set_pic_info(struct aml_vdec_ctx *ctx,
>> +			 struct v4l2_pix_format_mplane *pix_mp,
>> +			 enum v4l2_buf_type type)
> This is used once, either fold or move next to its users which is not
> vidioc_vdec_enum_framesizes().
Ok, got that.
>
>> +{
>> +	if (V4L2_TYPE_IS_OUTPUT(type)) {
>> +		ctx->pic_info.output_pix_fmt = pix_mp->pixelformat;
>> +		ctx->pic_info.coded_width = ALIGN(pix_mp->width, 64);
>> +		ctx->pic_info.coded_height = ALIGN(pix_mp->height, 64);
> The coded size alignment in H.264 is 16 steps, this isn't a coded width/height
> you store here, but a padded_width/height.
Ok, they are used by the HW, I will rename them.
>
>> +		ctx->pic_info.fb_size[0] =
>> +		    ctx->pic_info.coded_width * ctx->pic_info.coded_height;
>> +		ctx->pic_info.fb_size[1] = ctx->pic_info.fb_size[0] / 2;
> All this is duplication of the dst_fmt. Size should be pixel format dependent,
> not hard coded to NV12 (which is not even commented here). Check other driver,
> but basically, s_fmt should fait if the capture queue is busy, and reset the
> dst_fmt to a valid value otherwise. The calculation of NV12 stride and sizes
> should not be open coded but use v4l2_common. This means using
> v4l2_apply_frmsize_constraints() and v4l2_fill_pixfmt_mp().
Ok, since the HW only support NV12/21 output, so I hard coded here. I 
will use the helpers to calculate, and will check other drivers.
>
>> +	}
>> +}
>> +
>> +static int vidioc_vdec_enum_framesizes(struct file *file, void *priv,
>> +				       struct v4l2_frmsizeenum *fsize)
>> +{
>> +	const struct aml_video_fmt *fmt;
>> +	struct aml_vdec_dev *dev = video_drvdata(file);
>> +
>> +	if (fsize->index != 0)
>> +		return -EINVAL;
>> +
>> +	fmt = aml_vdec_get_video_fmt(dev, fsize->pixel_format);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>> +	fsize->stepwise = fmt->stepwise;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vdec_try_fmt_mp(struct aml_vdec_ctx *ctx, enum v4l2_buf_type type,
>> +			   struct v4l2_pix_format_mplane *pix_mp,
>> +			   const struct aml_video_fmt *dec_fmt)
>> +{
>> +	int i, align;
>> +
>> +	pix_mp->field = V4L2_FIELD_NONE;
>> +	align = dec_fmt->align;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(type)) {
>> +		pix_mp->num_planes = dec_fmt->num_planes;
>> +		pix_mp->pixelformat = dec_fmt->fourcc;
>> +		if (!pix_mp->plane_fmt[0].sizeimage)
>> +			pix_mp->plane_fmt[0].sizeimage =
>> +			    (pix_mp->height * pix_mp->width * 3) / 2;
> Comment that this is bitstream default size.
OK
>
>> +		pix_mp->height = ALIGN(pix_mp->height, align);
>> +		pix_mp->width = ALIGN(pix_mp->width, align);
> Why do you need this, you call v4l2_apply_frmsize_constraints() right below. If
> you configured the stepwise properly, it would just work.
Yes, this should be removed, it is superfluous here.
>> +	} else {
>> +		pix_mp->height = ctx->pix_fmt[AML_FMT_SRC].height;
>> +		pix_mp->width = ctx->pix_fmt[AML_FMT_SRC].width;
>> +	}
>> +
>> +	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
>> +				       &dec_fmt->stepwise);
>> +	dev_dbg(&ctx->dev->plat_dev->dev,
>> +		"%s type %d four_cc %d pix_mp->width %d pix_mp->height %d\n",
>> +		__func__, type, dec_fmt->fourcc, pix_mp->width, pix_mp->height);
>> +
>> +	v4l2_fill_pixfmt_mp(pix_mp, dec_fmt->fourcc, pix_mp->width,
>> +			    pix_mp->height);
>> +
>> +	for (i = 0; i < pix_mp->num_planes; i++)
>> +		memset(&pix_mp->plane_fmt[i].reserved[0], 0x0,
>> +		       sizeof(pix_mp->plane_fmt[0].reserved));
>> +
>> +	memset(pix_mp->reserved, 0x0, sizeof(pix_mp->reserved));
>> +	pix_mp->flags = 0;
> Drop this, should be filled by the core already.
>
>> +
>> +	dev_dbg(&ctx->dev->plat_dev->dev,
>> +		"%s type %d fmt %d num_plane %d sizeimage0 %d sizeimage1 %d\n",
>> +		__func__, type, pix_mp->pixelformat, pix_mp->num_planes,
>> +		pix_mp->plane_fmt[0].sizeimage, pix_mp->plane_fmt[1].sizeimage);
> This is all traced by the code and application can enable/disable this, please
> drop.
Got it, for both two up here.
>
>> +
>> +	return 0;
>> +}
>> +
>> +static int vdec_s_fmt_output(struct aml_vdec_ctx *ctx, struct v4l2_format *f)
>> +{
>> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +	struct v4l2_pix_format_mplane *cap_fmt = &ctx->pix_fmt[AML_FMT_DST];
>> +	const struct aml_video_fmt *out_fmt;
>> +	struct vb2_queue *vq, *peer_vq;
>> +	int ret;
>> +
>> +	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	if (vb2_is_busy(vq) &&
>> +	    pix_mp->pixelformat != ctx->pix_fmt[AML_FMT_SRC].pixelformat)
>> +		return -EBUSY;
>> +
>> +	/*
>> +	 * Since s_fmt output will reset the width and height in the capture queue,
>> +	 * s_fmt_output with resolution change should not take effect when capture
>> +	 * queue is busy.
>> +	 */
>> +	peer_vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +	if (vb2_is_busy(peer_vq) &&
>> +	    (pix_mp->width != cap_fmt->width ||
>> +	    pix_mp->height != cap_fmt->height))
> As a future precaution, add fmt compare too.
Yes, fmt comparison should be added here.
>
>> +		return -EBUSY;
>> +
>> +	out_fmt = aml_vdec_get_video_fmt(ctx->dev, pix_mp->pixelformat);
>> +	if (out_fmt && out_fmt->type != AML_FMT_DEC)
>> +		out_fmt = NULL;
>> +	if (out_fmt) {
>> +		ctx->dec_fmt[AML_FMT_SRC] = *out_fmt;
>> +	} else {
>> +		out_fmt = &ctx->dec_fmt[AML_FMT_SRC];
>> +		dev_dbg(&ctx->dev->plat_dev->dev,
>> +			"%s fmt %d not supported, use default\n", __func__,
>> +			pix_mp->pixelformat);
>> +	}
>> +
>> +	ret = vdec_try_fmt_mp(ctx, f->type, pix_mp, out_fmt);
>> +	set_pic_info(ctx, pix_mp, f->type);
> Check other driver, what I'm trying to suggest it to store the src/dst_fmt, and
> reset the dst_fmt instead of duplicating things with the pic info.
Ok, I'll check other drivers carefully about this.
>
>> +
>> +	ctx->pix_fmt[AML_FMT_SRC] = *pix_mp;
>> +	cap_fmt->width = pix_mp->width;
>> +	cap_fmt->height = pix_mp->height;
>> +	v4l2_fill_pixfmt_mp(cap_fmt, ctx->dec_fmt[AML_FMT_DST].fourcc,
>> +			    cap_fmt->width, cap_fmt->height);
>> +	cap_fmt->colorspace = pix_mp->colorspace;
>> +	cap_fmt->quantization = pix_mp->quantization;
>> +	cap_fmt->ycbcr_enc = pix_mp->ycbcr_enc;
>> +	cap_fmt->xfer_func = pix_mp->xfer_func;
>> +
>> +	return ret;
>> +}
>> +
>> +static int vdec_s_fmt_capture(struct aml_vdec_ctx *ctx, struct v4l2_format *f)
>> +{
>> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +	const struct aml_video_fmt *cap_fmt;
>> +	struct vb2_queue *vq;
>> +	int ret;
>> +
>> +	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +	if (vb2_is_busy(vq))
>> +		return -EBUSY;
>> +
>> +	cap_fmt = aml_vdec_get_video_fmt(ctx->dev, pix_mp->pixelformat);
>> +	if (cap_fmt && cap_fmt->type != AML_FMT_FRAME)
>> +		cap_fmt = NULL;
>> +	if (cap_fmt) {
>> +		ctx->dec_fmt[AML_FMT_DST] = *cap_fmt;
>> +	} else {
>> +		cap_fmt = &ctx->dec_fmt[AML_FMT_DST];
>> +		dev_dbg(&ctx->dev->plat_dev->dev,
>> +			"%s fmt %d not supported, use default\n", __func__,
>> +			pix_mp->pixelformat);
>> +	}
>> +
>> +	ret = vdec_try_fmt_mp(ctx, f->type, pix_mp, cap_fmt);
>> +
>> +	ctx->pix_fmt[AML_FMT_DST] = *pix_mp;
>> +
>> +	return ret;
>> +}
>> +
>> +static int vdec_try_fmt_output(struct aml_vdec_ctx *ctx, struct v4l2_format *f)
>> +{
>> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +	const struct aml_video_fmt *out_fmt;
>> +	int ret;
>> +
>> +	out_fmt = aml_vdec_get_video_fmt(ctx->dev, pix_mp->pixelformat);
>> +	if (out_fmt && out_fmt->type != AML_FMT_DEC)
>> +		out_fmt = NULL;
>> +	if (!out_fmt) {
>> +		out_fmt = &ctx->dec_fmt[AML_FMT_SRC];
>> +		dev_dbg(&ctx->dev->plat_dev->dev,
>> +			"%s fmt %d not supported, use default\n", __func__,
>> +			pix_mp->pixelformat);
>> +	}
>> +
>> +	ret = vdec_try_fmt_mp(ctx, f->type, pix_mp, out_fmt);
>> +
>> +	return ret;
>> +}
>> +
>> +static int vdec_try_fmt_capture(struct aml_vdec_ctx *ctx, struct v4l2_format *f)
>> +{
>> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +	const struct aml_video_fmt *cap_fmt;
>> +	int ret;
>> +
>> +	cap_fmt = aml_vdec_get_video_fmt(ctx->dev, pix_mp->pixelformat);
>> +	if (cap_fmt && cap_fmt->type != AML_FMT_FRAME)
>> +		cap_fmt = NULL;
>> +	if (!cap_fmt) {
>> +		cap_fmt = &ctx->dec_fmt[AML_FMT_DST];
>> +		dev_dbg(&ctx->dev->plat_dev->dev,
>> +			"%s fmt %d not supported, use default\n", __func__,
>> +			pix_mp->pixelformat);
>> +	}
>> +
>> +	ret = vdec_try_fmt_mp(ctx, f->type, pix_mp, cap_fmt);
>> +
>> +	return ret;
>> +}
>> +
>> +static void reset_output_fmts(struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_vdec_dev *dev = ctx->dev;
>> +	const struct aml_video_fmt *out_fmt;
>> +	struct v4l2_pix_format_mplane fmt;
>> +
>> +	/* reset default output fmt to V4L2_PIX_FMT_H264_SLICE */
>> +	out_fmt = aml_vdec_get_video_fmt(dev, V4L2_PIX_FMT_H264_SLICE);
>> +	if (!out_fmt)
>> +		return;
>> +
>> +	ctx->dec_fmt[AML_FMT_SRC] = *out_fmt;
>> +
>> +	memset(&fmt, 0, sizeof(struct v4l2_pix_format_mplane));
>> +
>> +	fmt.height = out_fmt->stepwise.min_height;
>> +	fmt.width = out_fmt->stepwise.min_width;
>> +	/* reset bytesperline to 0 for output fmts */
>> +	fmt.plane_fmt[0].bytesperline = 0;
>> +	fmt.colorspace = V4L2_COLORSPACE_DEFAULT;
>> +	fmt.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	fmt.quantization = V4L2_QUANTIZATION_DEFAULT;
>> +	fmt.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +	vdec_try_fmt_mp(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, &fmt,
>> +			out_fmt);
>> +
>> +	ctx->pix_fmt[AML_FMT_SRC] = fmt;
>> +}
>> +
>> +static void reset_capture_fmts(struct aml_vdec_ctx *ctx)
>> +{
>> +	struct aml_vdec_dev *dev = ctx->dev;
>> +	const struct aml_video_fmt *cap_fmt;
>> +	struct v4l2_pix_format_mplane fmt;
>> +
>> +	/* reset default output fmt to V4L2_PIX_FMT_NV12 */
>> +	cap_fmt = aml_vdec_get_video_fmt(dev, V4L2_PIX_FMT_NV12);
>> +	if (!cap_fmt)
>> +		return;
>> +
>> +	ctx->dec_fmt[AML_FMT_DST] = *cap_fmt;
>> +
>> +	memset(&fmt, 0, sizeof(struct v4l2_pix_format_mplane));
>> +
>> +	fmt.height = cap_fmt->stepwise.min_height;
>> +	fmt.width = cap_fmt->stepwise.min_width;
> Don't hardcode this, derive from the coded src_fmt (OUTPUT format). This way you
> can properly implement reset on s_fmt(OUTPUT).
Ok, maybe another helper might need here to derive the fmt here.
>
>> +	fmt.colorspace = V4L2_COLORSPACE_DEFAULT;
>> +	fmt.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	fmt.quantization = V4L2_QUANTIZATION_DEFAULT;
>> +	fmt.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +	vdec_try_fmt_mp(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, &fmt,
>> +			cap_fmt);
>> +
>> +	ctx->pix_fmt[AML_FMT_DST] = fmt;
>> +}
>> +
>> +void aml_vdec_reset_fmts(struct aml_vdec_ctx *ctx)
>> +{
>> +	ctx->m2m_ctx->q_lock = &ctx->v4l2_intf_lock;
>> +	reset_output_fmts(ctx);
>> +	reset_capture_fmts(ctx);
> Resetting output imply resetting capture, you can embed them.
OK, they can be combined.
>
>> +}
>> +
>> +static int vdec_g_fmt(struct aml_vdec_ctx *ctx, struct v4l2_format *f)
>> +{
>> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(f->type))
>> +		*pix_mp = ctx->pix_fmt[AML_FMT_SRC];
>> +	else
>> +		*pix_mp = ctx->pix_fmt[AML_FMT_DST];
> I personally prefer to not use an array, and have src_fmt and dst_dmt. It will
> also make other code path easier to read.
Do you mean seprate them into to fileds? Like pix_fmt_src and pix_fmt_dst.
>> +
>> +	dev_dbg(&ctx->dev->plat_dev->dev,
>> +		"%s fmt %d num planes %d\n", __func__, pix_mp->pixelformat,
>> +		pix_mp->num_planes);
>> +
>> +	return 0;
>> +}
>> +
>> +static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
>> +				     struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vdec_try_fmt_capture(ctx, f);
>> +}
>> +
>> +static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
>> +				     struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vdec_try_fmt_output(ctx, f);
>> +}
>> +
>> +static int vidioc_vdec_s_fmt_out_mplane(struct file *file, void *priv,
>> +					struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vdec_s_fmt_output(ctx, f);
>> +}
>> +
>> +static int vidioc_vdec_s_fmt_cap_mplane(struct file *file, void *priv,
>> +					struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vdec_s_fmt_capture(ctx, f);
>> +}
>> +
>> +static int vidioc_vdec_g_fmt_out_mplane(struct file *file, void *priv,
>> +					struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vdec_g_fmt(ctx, f);
>> +}
>> +
>> +static int vidioc_vdec_g_fmt_cap_mplane(struct file *file, void *priv,
>> +					struct v4l2_format *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vdec_g_fmt(ctx, f);
>> +}
>> +
>> +static int vidioc_vdec_enum_fmt_out_mplane(struct file *file,
>> +					   void *priv, struct v4l2_fmtdesc *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vidioc_vdec_enum_fmt(ctx, f, 1);
>> +}
>> +
>> +static int vidioc_vdec_enum_fmt_cap_mplane(struct file *file,
>> +					   void *priv, struct v4l2_fmtdesc *f)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	return vidioc_vdec_enum_fmt(ctx, f, 0);
>> +}
>> +
>> +const struct v4l2_ioctl_ops aml_vdec_ioctl_ops = {
>> +	.vidioc_querycap = vidioc_vdec_querycap,
>> +	.vidioc_enum_framesizes = vidioc_vdec_enum_framesizes,
>> +
>> +	.vidioc_enum_fmt_vid_cap = vidioc_vdec_enum_fmt_cap_mplane,
>> +	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_fmt_cap_mplane,
>> +	.vidioc_s_fmt_vid_cap_mplane = vidioc_vdec_s_fmt_cap_mplane,
>> +	.vidioc_g_fmt_vid_cap_mplane = vidioc_vdec_g_fmt_cap_mplane,
>> +
>> +	.vidioc_enum_fmt_vid_out = vidioc_vdec_enum_fmt_out_mplane,
>> +	.vidioc_try_fmt_vid_out_mplane = vidioc_try_fmt_out_mplane,
>> +	.vidioc_s_fmt_vid_out_mplane = vidioc_vdec_s_fmt_out_mplane,
>> +	.vidioc_g_fmt_vid_out_mplane = vidioc_vdec_g_fmt_out_mplane,
>> +
>> +	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
>> +	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
>> +	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
>> +	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
>> +	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
>> +	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
>> +
>> +	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
>> +
>> +	.vidioc_decoder_cmd = v4l2_m2m_ioctl_stateless_decoder_cmd,
>> +	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_stateless_try_decoder_cmd,
>> +
>> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>> +
>> +	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
>> +	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
>> +};
>> +
>> +static void aml_vdec_release_instance(struct aml_vdec_ctx *ctx)
>> +{
>> +	if (ctx->codec_ops && ctx->codec_ops->exit)
>> +		ctx->codec_ops->exit(ctx);
>> +}
>> +
>> +static int vb2ops_vdec_queue_setup(struct vb2_queue *vq,
>> +				   unsigned int *nbuffers,
>> +				   unsigned int *nplanes,
>> +				   unsigned int sizes[],
>> +				   struct device *alloc_devs[])
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(vq);
>> +	struct v4l2_pix_format_mplane *pix_fmt;
>> +	unsigned int i;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
>> +		pix_fmt = &ctx->pix_fmt[AML_FMT_SRC];
>> +	else
>> +		pix_fmt = &ctx->pix_fmt[AML_FMT_DST];
>> +
>> +	if (*nplanes) {
>> +		if (*nplanes != pix_fmt->num_planes)
>> +			return -EINVAL;
>> +
>> +		for (i = 0; i < *nplanes; i++) {
>> +			if (sizes[i] < pix_fmt->plane_fmt[i].sizeimage) {
>> +				dev_err(&ctx->dev->plat_dev->dev,
>> +					"not supported sizeimage\n");
>> +				return -EINVAL;
>> +			}
>> +			alloc_devs[i] = &ctx->dev->plat_dev->dev;
>> +		}
>> +	} else {
>> +		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>> +			*nplanes = pix_fmt->num_planes;
>> +		else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +			*nplanes = 1;
>> +
>> +		for (i = 0; i < *nplanes; i++) {
>> +			alloc_devs[i] = &ctx->dev->plat_dev->dev;
>> +			sizes[i] = pix_fmt->plane_fmt[i].sizeimage;
>> +		}
>> +	}
>> +
>> +	if (*nplanes) {
>> +		dev_dbg(&ctx->dev->plat_dev->dev,
>> +			"type: %d, plane: %d, buf cnt: %d, size: [Y: %u, C: %u]\n",
>> +			vq->type, *nplanes, *nbuffers, sizes[0], sizes[1]);
>> +		return 0;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct v4l2_pix_format_mplane *pix_fmt;
>> +	unsigned int sizeimage = 0;
>> +	int i;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
>> +		pix_fmt = &ctx->pix_fmt[AML_FMT_SRC];
>> +	else
>> +		pix_fmt = &ctx->pix_fmt[AML_FMT_DST];
>> +
>> +	for (i = 0; i < pix_fmt->num_planes; i++) {
>> +		sizeimage = pix_fmt->plane_fmt[i].sizeimage;
>> +		if (vb2_plane_size(vb, i) < sizeimage)
>> +			return -EINVAL;
>> +
>> +		if (V4L2_TYPE_IS_CAPTURE(vb->type)) {
>> +			vb2_set_plane_payload(vb, i,
>> +					      pix_fmt->plane_fmt[i].sizeimage);
>> +			dev_dbg(&ctx->dev->plat_dev->dev,
>> +				"%s type: %d set plane: %d, sizeimage: %d\n",
>> +				__func__, vb->vb2_queue->type, i,
>> +				pix_fmt->plane_fmt[i].sizeimage);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vb2_ops_vdec_buf_init(struct vb2_buffer *vb)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void vb2_ops_vdec_buf_queue(struct vb2_buffer *vb)
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct vb2_v4l2_buffer *vb2_v4l2 = to_vb2_v4l2_buffer(vb);
>> +
>> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vb2_v4l2);
>> +}
>> +
>> +static void vb2_ops_vdec_buf_finish(struct vb2_buffer *vb)
>> +{
>> +}
>> +
>> +static int vb2ops_vdec_start_streaming(struct vb2_queue *q, unsigned int count)
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(q);
> You seem to be missing:
> 	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
Yes, it's missing. Thanks for reminding me.
>
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>> +		struct vb2_v4l2_buffer *src_buf;
>> +
>> +		if (aml_vdec_init_dec_inst(ctx) < 0) {
>> +			while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
>> +				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_QUEUED);
>> +			return -EINVAL;
>> +		}
>> +		ctx->is_output_streamon = 1;
> Are these state really needed ? Looks like vb2_is_streaming() will do the same.
Ok, I'll use the helper instead.
>
>> +	} else {
>> +		ctx->is_cap_streamon = 1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(q);
>> +	struct vb2_v4l2_buffer *src_buf = NULL, *dst_buf = NULL;
>> +	
>> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>> +		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
>> +			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> P.s. once your driver is async, you'll also have to call
> v4l2_ctrl_request_complete().
Noted, if I use asynchronous instead, I'll call 
v4l2_ctrl_request_complete here.
>
>> +		ctx->is_output_streamon = 0;
> This seems redundant with vb2.
I'll get rid of them and used the vb2 helper to check the queue status 
instead.
>
>> +	} else {
>> +		while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx)))
>> +			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>> +		ctx->is_cap_streamon = 0;
>> +	}
>> +
>> +	if (!ctx->is_output_streamon && !ctx->is_cap_streamon)
>> +		aml_vdec_release_instance(ctx);
> You seem to be missing something like this (picked from Hantro as an example):
>
>      20   │       v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, q);
>      21   │
>      22   │       if (V4L2_TYPE_IS_OUTPUT(q->type) &&
>      23   │           v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
>      24   │       │       v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
Yes, the EOS process is lack here, thanks for the reminder.
>
>> +}
>> +
>> +static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
>> +{
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +
>> +	vbuf->field = V4L2_FIELD_NONE;
>> +	return 0;
>> +}
> Add a fixme comment, or just implement interlace.
Interlaced will be implemented in the next version.
>
>> +
>> +static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
>> +{
>> +	struct aml_vdec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +
>> +	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_handler);
>> +}
>> +
>> +static const struct vb2_ops aml_vdec_vb2_ops = {
>> +	.queue_setup = vb2ops_vdec_queue_setup,
>> +	.start_streaming = vb2ops_vdec_start_streaming,
>> +	.stop_streaming = vb2ops_vdec_stop_streaming,
>> +
>> +	.buf_init = vb2_ops_vdec_buf_init,
>> +	.buf_prepare = vb2ops_vdec_buf_prepare,
>> +	.buf_out_validate = vb2ops_vdec_out_buf_validate,
>> +	.buf_queue = vb2_ops_vdec_buf_queue,
>> +	.buf_finish = vb2_ops_vdec_buf_finish,
>> +	.buf_request_complete = vb2ops_vdec_buf_request_complete,
>> +};
>> +
>> +int aml_vdec_queue_init(void *priv, struct vb2_queue *src_vq,
>> +			struct vb2_queue *dst_vq)
>> +{
>> +	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)priv;
>> +	struct aml_vdec_dev *dev = ctx->dev;
>> +	int ret = 0;
>> +
>> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	src_vq->mem_ops = &vb2_dma_contig_memops;
>> +	src_vq->drv_priv = ctx;
>> +	src_vq->ops = &aml_vdec_vb2_ops;
>> +	src_vq->lock = &ctx->v4l2_intf_lock;
>> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>> +	src_vq->supports_requests = true;
>> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +	ret = vb2_queue_init(src_vq);
>> +	if (ret) {
>> +		v4l2_info(&dev->v4l2_dev,
>> +			  "Failed to initialize videobuf2 queue(output)");
>> +		return ret;
>> +	}
>> +
>> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	dst_vq->drv_priv = ctx;
>> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
>> +	dst_vq->ops = &aml_vdec_vb2_ops;
>> +	dst_vq->lock = &ctx->v4l2_intf_lock;
>> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +	ret = vb2_queue_init(dst_vq);
>> +	if (ret) {
>> +		v4l2_info(&dev->v4l2_dev,
>> +			  "Failed to initialize videobuf2 queue(capture)");
>> +		vb2_queue_release(src_vq);
>> +	}
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.h b/drivers/media/platform/amlogic/vdec/aml_vdec.h
>> new file mode 100644
>> index 000000000000..32f7fa245f7e
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#ifndef _AML_VDEC_H_
>> +#define _AML_VDEC_H_
>> +
>> +#include "aml_vdec_drv.h"
>> +
>> +/**
>> + * struct aml_vdec_v4l2_ctrl - helper type to declare supported ctrls
>> + * @codec_type: codec id this control belong to (CODEC_TYPE_H264, etc.)
>> + * @cfg: control configuration
>> + */
>> +struct aml_vdec_v4l2_ctrl {
>> +	unsigned int codec_type;
>> +	struct v4l2_ctrl_config cfg;
>> +};
>> +
>> +struct aml_dec_type {
>> +	unsigned int codec_type;
>> +	const char *name;
>> +};
>> +
>> +extern const struct v4l2_m2m_ops aml_vdec_m2m_ops;
>> +extern const struct v4l2_ioctl_ops aml_vdec_ioctl_ops;
>> +
>> +int aml_vdec_ctrls_setup(struct aml_vdec_ctx *ctx);
>> +int aml_vdec_queue_init(void *priv, struct vb2_queue *src_vq,
>> +			struct vb2_queue *dst_vq);
>> +void aml_vdec_reset_fmts(struct aml_vdec_ctx *ctx);
>> +#endif
>> diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
>> new file mode 100644
>> index 000000000000..1870d56659cf
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/vdec/aml_vdec_drv.c
>> @@ -0,0 +1,260 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <linux/dma-mapping.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-ioctl.h>
>> +
>> +#include "aml_vdec.h"
>> +#include "aml_vdec_hw.h"
>> +#include "aml_vdec_platform.h"
>> +
>> +#define AML_VDEC_DRV_NAME "aml-vdec-drv"
>> +
>> +static int fops_vcodec_open(struct file *file)
>> +{
>> +	struct aml_vdec_dev *dec_dev = video_drvdata(file);
>> +	struct aml_vdec_ctx *ctx = NULL;
>> +	int ret = 0;
>> +
>> +	ctx = kzalloc_obj(*ctx, GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	mutex_lock(&dec_dev->dev_mutex);
> Why?
The lock is redundant, there is no concurrent access here. I'll remove it.
>
>> +	ctx->dev = dec_dev;
>> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> hmm.
> 	v4l2_fh_init(&ctx->fh, dec_dev);
>
>> +	file->private_data = &ctx->fh;
> Why ?
Ah, thes are also redundant. Only v4l2_fh_init(&ctx->fh, 
video_devdata(file)) is needed.
>
>> +	v4l2_fh_add(&ctx->fh, file);
>> +	mutex_init(&ctx->v4l2_intf_lock);
>> +	init_waitqueue_head(&ctx->queue);
> I believe this goes away once device_run() is asynchronous.
Yes, a asynchronous device_run doesn't need a waitqueue.
>
>> +	ctx->int_cond = 0;
>> +
>> +	ctx->m2m_ctx = v4l2_m2m_ctx_init(dec_dev->m2m_dev_dec, ctx,
>> +					 &aml_vdec_queue_init);
>> +	if (IS_ERR(ctx->m2m_ctx)) {
>> +		ret = PTR_ERR((__force void *)ctx->m2m_ctx);
>> +		v4l2_err(&dec_dev->v4l2_dev, "Failed to v4l2_m2m_ctx_init() (%d)", ret);
>> +		goto err_m2m_ctx_init;
>> +	}
>> +
>> +	ctx->fh.m2m_ctx = ctx->m2m_ctx;
>> +	ret = aml_vdec_ctrls_setup(ctx);
>> +	if (ret) {
>> +		v4l2_err(&dec_dev->v4l2_dev, "Failed to init all ctrls (%d)", ret);
>> +		goto err_ctrls_setup;
>> +	}
>> +
>> +	aml_vdec_reset_fmts(ctx);
>> +	mutex_unlock(&dec_dev->dev_mutex);
> Everything in this function is modifying ctx only, dev_dec have to have a
> lifetime guarantied by the caller (holding on dev and its private data until the
> open call have complete). I don't see a reason, from a driver point of view why
> we'd need that mutex here. If there is a real issue here, it would need fixing
> elsewhere.
Yes, only ctx would be modified here and it's tied to every file. 
dec_dev is about the hardware resources, it's lifetime is very close to 
the plarform device. A mutex is no need here, I'll remove it in the next 
version
>
>> +
>> +	return ret;
>> +
>> +err_ctrls_setup:
>> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
>> +err_m2m_ctx_init:
>> +	v4l2_fh_del(&ctx->fh, file);
>> +	v4l2_fh_exit(&ctx->fh);
>> +	kfree(ctx);
>> +	mutex_unlock(&dec_dev->dev_mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +static int fops_vcodec_release(struct file *file)
>> +{
>> +	struct aml_vdec_ctx *ctx = fh_to_dec_ctx(file);
>> +
>> +	v4l2_m2m_ctx_release(ctx->m2m_ctx);
>> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>> +	v4l2_fh_del(&ctx->fh, file);
>> +	v4l2_fh_exit(&ctx->fh);
>> +	kfree(ctx);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_file_operations aml_vdec_fops = {
>> +	.owner        = THIS_MODULE,
>> +	.open        = fops_vcodec_open,
>> +	.release    = fops_vcodec_release,
>> +	.poll        = v4l2_m2m_fop_poll,
>> +	.unlocked_ioctl    = video_ioctl2,
>> +	.mmap        = v4l2_m2m_fop_mmap,
>> +};
>> +
>> +static const struct video_device dec_dev = {
>> +	.name = "aml_dev_drv",
>> +	.fops = &aml_vdec_fops,
>> +	.ioctl_ops = &aml_vdec_ioctl_ops,
>> +	.release = video_device_release,
>> +	.vfl_dir = VFL_DIR_M2M,
>> +	.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
>> +};
>> +
>> +static const struct media_device_ops aml_m2m_media_ops = {
>> +	.req_validate = vb2_request_validate,
>> +	.req_queue = v4l2_m2m_request_queue,
>> +};
>> +
>> +static int aml_vdec_drv_probe(struct platform_device *pdev)
>> +{
>> +	struct aml_vdec_dev *dev;
>> +	struct video_device *vfd_dec;
>> +	struct aml_vdec_hw *hw;
>> +	int ret = 0;
>> +
>> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>> +	if (!dev)
>> +		return -ENOMEM;
>> +
>> +	dev->plat_dev = pdev;
>> +	mutex_init(&dev->dev_mutex);
>> +
>> +	/*
>> +	 * The decoder hardware registers take 32-bit addresses only;
>> +	 * make sure DMA allocations (bitstream buffers, frame buffers
>> +	 * and firmware workspaces) stay below 4GB.
>> +	 */
>> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret,
>> +				     "Failed to set 32-bit DMA mask\n");
>> +
>> +	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret, "v4l2_device_register err\n");
>> +
>> +	vfd_dec = video_device_alloc();
>> +	if (!vfd_dec) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to allocate video device\n");
>> +		ret = -ENOMEM;
>> +		goto err_device_alloc;
>> +	}
>> +	*vfd_dec = dec_dev;
>> +	vfd_dec->v4l2_dev = &dev->v4l2_dev;
>> +	vfd_dec->lock = &dev->dev_mutex;
>> +	video_set_drvdata(vfd_dec, dev);
>> +	dev->vfd = vfd_dec;
>> +	platform_set_drvdata(pdev, dev);
>> +
>> +	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
>> +	if (!hw) {
>> +		ret = -ENOMEM;
>> +		goto err_dec_mem_init;
>> +	}
>> +	dev->dec_hw = hw;
>> +
>> +	dev->pvdec_data = of_device_get_match_data(&pdev->dev);
>> +	if (!dev->pvdec_data) {
>> +		dev_err(&pdev->dev, "no match data for this device\n");
>> +		ret = -ENODEV;
>> +		goto err_hw_init;
>> +	}
>> +
>> +	ret = dev->pvdec_data->req_hw_resource(dev);
>> +	if (ret < 0)
>> +		goto err_hw_init;
>> +
>> +	dev->m2m_dev_dec = v4l2_m2m_init(&aml_vdec_m2m_ops);
>> +	if (IS_ERR(dev->m2m_dev_dec)) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem dec device\n");
>> +		ret = PTR_ERR((__force void *)dev->m2m_dev_dec);
>> +		goto err_m2m_dev_init;
>> +	}
>> +
>> +	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
>> +	if (ret) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device");
>> +		goto err_vid_dev_register;
>> +	}
>> +
>> +	dev->mdev.dev = &pdev->dev;
>> +	strscpy(dev->mdev.model, AML_VDEC_DRV_NAME, sizeof(dev->mdev.model));
>> +	media_device_init(&dev->mdev);
>> +	dev->mdev.ops = &aml_m2m_media_ops;
>> +	dev->v4l2_dev.mdev = &dev->mdev;
>> +
>> +	ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, vfd_dec,
>> +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
>> +	if (ret) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
>> +		goto error_m2m_mc_register;
>> +	}
>> +
>> +	ret = media_device_register(&dev->mdev);
>> +	if (ret) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to register media device");
>> +		goto err_media_dev_register;
>> +	}
>> +	vdec_enable(dev->dec_hw);
>> +	return 0;
>> +
>> +err_media_dev_register:
>> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
>> +error_m2m_mc_register:
>> +	media_device_cleanup(&dev->mdev);
>> +	video_unregister_device(dev->vfd);
>> +	/* video_unregister_device() has released the video_device,
>> +	 * set the vfd_dec to NULL to avoid double free in err_dec_mem_init
>> +	 */
>> +	vfd_dec = NULL;
>> +err_vid_dev_register:
>> +	v4l2_m2m_release(dev->m2m_dev_dec);
>> +err_m2m_dev_init:
>> +	dev->pvdec_data->destroy_hw_resource(dev);
>> +err_hw_init:
>> +	dev->dec_hw = NULL;
>> +err_dec_mem_init:
>> +	/* In case of double-freeing the video_device from error_m2m_mc_register */
>> +	if (vfd_dec)
>> +		video_device_release(vfd_dec);
>> +err_device_alloc:
>> +	v4l2_device_unregister(&dev->v4l2_dev);
>> +	return ret;
>> +}
>> +
>> +static void aml_vdec_drv_remove(struct platform_device *pdev)
>> +{
>> +	struct aml_vdec_dev *dev = platform_get_drvdata(pdev);
>> +
>> +	/*
>> +	 * The IRQ is devm-managed and only released after remove()
>> +	 * returns: mask it and wait for any in-flight threaded handler
>> +	 * before powering off the VDEC domain, otherwise the handler
>> +	 * could access powered-down registers.
>> +	 */
>> +	disable_irq(dev->dec_hw->dec_irq);
>> +	vdec_disable(dev->dec_hw);
>> +	media_device_unregister(&dev->mdev);
>> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
>> +	video_unregister_device(dev->vfd);
>> +	media_device_cleanup(&dev->mdev);
>> +
>> +	v4l2_m2m_release(dev->m2m_dev_dec);
>> +	dev->pvdec_data->destroy_hw_resource(dev);
>> +	v4l2_device_unregister(&dev->v4l2_dev);
>> +}
>> +
>> +static const struct of_device_id aml_vdec_match[] = {
>> +	{ .compatible = "amlogic,s4-vdec", .data = &aml_vdec_s4_pdata },
>> +	{ }
>> +};
>> +
>> +static struct platform_driver aml_vcodec_dec_driver = {
>> +	.probe    = aml_vdec_drv_probe,
>> +	.remove   = aml_vdec_drv_remove,
>> +	.driver   = {
>> +		.name    = AML_VDEC_DRV_NAME,
>> +		.of_match_table = aml_vdec_match,
>> +	},
>> +};
> Breaking my review here. Note on the best way to be reviewer friendly is to
> split the low level driver helpers in its own patch. This way we can sort out
> the HW access and give you an RB on it, and focus on the v4l2 part. It makes
> respinning patch set and reviewing revision a lot faster. An example of patchset
> for you could have been:
>
> 1. Core loadable driver, resource allocation, IRQ registration, PM, etc.
> 2. Low level common helpers (non codec specifics)
> 3. V4L2 implementation and codec specific ops interface
> 4. H.264 implementation
>
> Patches must build, it does not have to fully work until the full set is
> applied. But it is very good habit to use the split to cover error handling
> testing.
>
> You may notice not getting a lot of human review, you spun a lot of revision,
> and each time you endup at the bottom of the maintainer human review queue, as
> you patch is seen like in active development. I think its explain how you ended
> in v12 so quickly with so much work left to do.

Thank you so much for all your comments for this part. In the next 
version, I'll address the review comments you raised above, add the 
interlaced feature, and split this large decoder patch as you suggested.

I think the constant stream of Sashiko review comments may have 
distracted me. I initially assumed that we needed to clear all of the 
Sashiko comments, or at least keep the amount at a fairly low level 
before the maintainers would review the driver. Thanks for pointing this 
out; I'll adjust the pace of my patch submissions going forward.

>
> I have a lot of comments coming on the H.264 implementation, including bug
> report I have received from individual. I will come back tomorrow with these.
> Meanwhile I wanted to highlight this big one, which imply a large amount of
> unrorted conformance failure (you forget about JVT-FR-EXT existance it seems).
>
>> +
>> +	ctrls->scaling =
>> +		(struct v4l2_ctrl_h264_scaling_matrix *)aml_h264_get_ctrl(&ctx->ctrl_handler,
>> +			V4L2_CID_STATELESS_H264_SCALING_MATRIX);
>> +	if (WARN_ON(!ctrls->scaling))
>> +		return -EINVAL;
Yes, also thanks for pointing out this. Currently only streams using the 
default scaling list are supported, the custom scaling matrix obtained 
through the ctrl is not actually used. This will also be fixed in v13.
> This is being set but not used. Its not covered by JVT-AVC_V1, but JVT-FR-EXT
> do. The following test (420 only) are likely failing for you due to this bug.
> Please address in v13.
>
>        brcm_freh3
>        brcm_freh4
>        brcm_freh5
>        brcm_freh6
>        brcm_freh8
>        brcm_freh9
>        brcm_freh10
>        brcm_freh11
>        freh1_b
>        freh2_b
>        freh7_b
>        freh12_b
>        FREXT01_JVC_D
>        FREXT02_JVC_C
>        FRExt1_Panasonic_D
>        FRExt2_Panasonic_C
>        FRExt3_Panasonic_E
>        FRExt4_Panasonic_B
>        FRExt_MMCO4_Sony_B
>        HCAFF1_HHI_B
>        HCAFR1_HHI_C
>        HCAFR2_HHI_A
>        HCAFR3_HHI_A
>        HCAFR4_HHI_A
>        HCAMFF1_HHI_B
>        HPCADQ_BRCM_B
>        HPCALQ_BRCM_B
>        HPCAMAPALQ_BRCM_B
>        HPCAMOLQ_BRCM_B
>        HPCAQ2LQ_BRCM_B
>        HPCVMOLQ_BRCM_B
>        HVLCFI0_Sony_B
>        HVLCMFF0_Sony_B
>        HVLCPFF0_Sony_B
>
> I would also like to mention that I notice the presence of per-slice reference
> list calculation. This tells me you might have implemented the wrong decoding
> mode. All this driver code is not required if you implement:
>
> - V4L2_CID_STATELESS_H264_SLICE_PARAMS
> - V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED
>
> As an alternative, we have that for HEVC but not yet for H264, is to require
> V4L2_CID_STATELESS_H264_SLICE_PARAMS in MODE_FRAME_BASED, though you'll endup
> with a bit more friction with existing userspace implementation. For that
> reason, I would not recommend, and suggest to follow the cedrus driver.
Currently, only V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED is 
supported. Some h264 streams have the 
ref_pic_list_modification_flag_l0/l1 equal to 1 in the slice header 
(such as CABA2_SVA_B). In such scenario, we can only get the reference 
list before modification from the ctrl, as a result of which, we need to 
do the reodrer ourself. I think the userspace (like gstreamer) won't 
parse the slice header in framebased mode. I'll check the cedrus driver.
>
> Nicolas

Best regards,

Zhentao

