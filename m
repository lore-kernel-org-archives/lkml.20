Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792573381;
	b=O4ONKIZAoD9CMlFUHiichCoJhUpR8vrNWg/gVO8j44ZNN1Sml9zd9OaVbJ2HuESV2ax4
	 U8JSM7eeLHt6Xb5pLvTBmlRXAEQe2GtLfAsj5H7TRNc7R5SzLPhKgsX1WCYJHUtGF5oYz
	 AwQuSZcoQqFuULaDN4AFQdsqJODsThR3ZuMCEx7mO4wabX1kWbOxnzjcFJ6dORXXF0JHf
	 qyfifYABWxne18NjUUAxSNwMtY89aKn+nUfSVW/vI+epvfm1zmjdwGvAg/hnwU7nXdaKV
	 qBwy4TLvbPwCmsdSMzD0YO1jBXIZAy7P7RuMQp3h8d2v06oCQTC4zbLsWTiK4h563SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573381;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=J8bcPaEFm5e4ASiecNpJy3Y/YJUtKdXeSy44ewzOPVI=;
	b=xwFLgmW+Z9JI5kRMt1OSfdl4CrQ7M5eetVou+DH0gQ5yQw5X9LUsgVs7wMSSaKC8LaPi
	 RH78M2IAu9qj1RJ3JG+hkKgCF5Z1V68bXrJtmEWb5/hBsTsSHN+U+9cqvFO6qwHShaYQs
	 MSNfaNSo/Su55Sy9PNEXbnCGuHrCjv4lJzYC9Ss49u90/9C6F9Ydxrj9M3JS7+MqlVTvn
	 yLj0/lGlYBdi/yiM3G7g2DhPQlGIHSxwYJPiHbSIDQvWGE5+bgFqfDzVLx/IqKIUFAwCU
	 LbiFE6NdG3PdcenIs75OXjpVGbPzeMD6IhFeppeeJc+xjh6T1r2/++3g8/CFP2qSPkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aOz98SNj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.47
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DC7606A319;
	Wed, 21 Oct 2026 09:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55DC7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aOz98SNj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PliQ2at63n9QdNCRXe9BXvs86bcCSI/42z8oXHKaezFtadNSmt/3IF0SSnEH8ChdMxmaN6cTvxCjJ2DHEd6UkWQj86FY2ErPynKi97LxCZoUG8pnifkNQfZMBq+/qiwFuvldNyqR1lhpMCl74D954BLs3d8OJQqGtUk08J3ApmFQL/ffJx8WE9g+Eo9nJzkk5XDD1t7iipsOnr18znAzVgignc4/iRVe3rIc6qFh3x3yVAKt2wXO2LISyhjHBKFaJSWQWYMjWJE0i2gcj/1QOzN1bo3zj82TMuwTEVJ0qspP9g42yL1Ggmr7eXjtDZSWd+GN49hpm3WAJ25egV2XcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8bcPaEFm5e4ASiecNpJy3Y/YJUtKdXeSy44ewzOPVI=;
 b=b6QUwKQghmAfDt+9+a/qGWE3SLcSPpVMbNL3iSdkoH6OTj+ePWReatZw8rV4Tzvp5S+QHX92z/OuSSRsJC4rAfgCE3SGn0jSbi7wKhyHOXwmG7SUDh3WMuZWXpgsQ0xQ9evipK05o6EecrPL1JPSqIMxez2sIOIreHk1rmH7tzDCFenIjI+PKrsSipOxzMnyafLlja98cJZiXRPYMz2xxhfOPebtHv0mh2VwvD7SQo6FyIIXDlh0cIuvkq1khOsiX99Ukvkor6oYnneENPWM0PPkezOzYCp3rdR0Wd61WdJCfhOgZWM9VHFUDQuRjblqSjJQkEHCtzfKD1AAd7mzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8bcPaEFm5e4ASiecNpJy3Y/YJUtKdXeSy44ewzOPVI=;
 b=aOz98SNjVXJhYOq+2p6zqher/GkoCJ1gsYEqCuE4DyEYXsQDDEAULakkEMo0mEiiAB2ABrC0eZ7GMRkusavLh3MPDuiasX6G4IoLoKMN+zQOKOUBf/MuCAvWh4wNl7I67SAIqO+GJmuEMbv6UEm1Ksx+IpKl/GKi5ySFm0zTDF3AgjDlyvCauxxbV+qW4O/tqFonniIkqC1BRUSNn4IyT83TJkMR11kllXiJ0KgH6NEmouM34zrZpIFeKxVFKX783B5FXOvgFPaSv5vpalN/9z7uJ2QvWUZIuut6RLxZiNV+fEpPmlDRri78fUcH4W8TWf7CiM3X0dAcFiwbpp/9Og==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AS8PR04MB7960.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 09:02:51 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 09:02:51 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Date: Wed, 21 Oct 2026 17:04:22 +0800
Subject: [PATCH 1/3] ARM: dts: imx6qdl: Move board Root Port children under
 &pcie_port0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-imx-pcie-rp-stale-nodes-v1-1-db6590e972b6@nxp.com>
References: <20261021-imx-pcie-rp-stale-nodes-v1-0-db6590e972b6@nxp.com>
In-Reply-To: <20261021-imx-pcie-rp-stale-nodes-v1-0-db6590e972b6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sherry.sun@nxp.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573508; l=4470;
 i=sherry.sun@nxp.com; s=20260723; h=from:subject:message-id;
 bh=BmD1mdTVfS+ReHhZwpDYJ7rzKsaAFObtegUGcXVXyGE=;
 b=jDWy1I8fzF9HNlK8QIBR8nfLpDGdppQ8EEDhTe7WnBSLSFHhxRgGxsFTgBVNcfaQdWNUMNoCj
 hvuWcXyTdgzBZRxfyFV/IDnfOnLuvUMmsh5y3YSDIvYd7+cVdBm/c32
X-Developer-Key: i=sherry.sun@nxp.com; a=ed25519;
 pk=YnYnIFJ2l+5v951x9shBVfHhminNi+3LTfFa3PxSdnI=
X-ClientProxiedBy: MA5PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::10) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
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
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AS8PR04MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5cc62a-9dfc-45b5-2654-08df2f521637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|19092799006|366016|261009223027099003|56012099006|260925022911599003|260925021911599003|260925021311599003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	H2pgrSKd+OVN9Tj4GM2jiharJiao3uY5ua0hZcy3bv0IfML0WSHT/IwYJIahxNkkCioamKNSzZrqUatueAuDsJobGigya+/bkQHnFN9sIjT+Qq4UFjBbTMLPQgnodI7qDN88JvN9NM4cofKiOheZ3psjK4BRbfwS/XtZNgs81lXKtj4hU4lYejngIr4j65OFyNOo1Lg57hV3Nn2lpHfpumrEFFwNHnm4la/XChJlW+t+R3q8BmuP1ob3R5Tkty6i26Jc5KM1t8WTmYueDwF+XyEz++fYyB9IS757fbIPbOAH5UuH5v/hc57lGxvCU5zQj9DOoxIR4DjmkdOxFSQjUs/Yl6c2iLD/pNMIRyg5o/fo/28h3LfGj8NRP3SNai2yBDHC9sUQ9kpFxRrOr5nD+dSlFdJ8IENb6ZqckXu8plR6y4pnTblBpeIAqY5BxuEAMeMNbTHu0MddfFiJhnHNxhdS3M7mJfj6P7Bfa48bgXqISFkXD32hMPrKJUXRGsMRXX//sPD9HfE9X7bjT/FujO8D0BWFpVKfapa+u3vrI1AXT5u7WWdr03G/9P/W9pgTwdekH2GODA+71cAN+KZcqQ6EtOlKmuDmNBiXtAYCjiVQNwaaM+2QV2yRIFffBMwx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(19092799006)(366016)(261009223027099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDFwbzdpdHZ3Ym4zT05CYWNYVjVTbWRYZnBhZFBncmt1RS93R0FmRXcwVFht?=
 =?utf-8?B?SWlnaGgxbVJFQzlNS1hJWTNSNzIvZHhCcktYV1Y3RnlxSVNPWW82aHJzQTRj?=
 =?utf-8?B?dXd6NUlRMWczQjlQY0NBdHNzMDZSVjdjVEgybEdEMlpTeEk1akRNa3BiZlRB?=
 =?utf-8?B?SHlRK3M5WHlxNE4vWHM3UVAwc1I5V3AwM0JvUFQxOERYTU9JenZUdHA1ZENW?=
 =?utf-8?B?REdYNXhwSExtb2hJN3ZaR09meHZHRFpqdmxxTFM0S1VsOFdHOVRoN0dQSFlN?=
 =?utf-8?B?OU9RVEZEbXVEMGk5Ukx6Ri9oazdvZ1Yzd01KMi9iaGJNSGErajZLejE1Vktj?=
 =?utf-8?B?ZFBxWitEazhZQURxRDNlNzVXcGNCK3RJVHN4K2JpVDY3c0d3akZzdTFBampE?=
 =?utf-8?B?VUtndWJ4TkJBU2xkQ2xaMkdUamFVNWNURHpuVUJiVnE0TXc5SGdRWWFXSWRS?=
 =?utf-8?B?TjN3S3M0aEpJN2FwVWlxYWUraFpnOWtCbUxPVVdSczFLNW1JaFpYcWo5K25S?=
 =?utf-8?B?UHRvNFQ1Z1NCczVGM1AwT2JaTzRlanozSXMzdGk1SS9WdVdUREZFOUZMZ3lQ?=
 =?utf-8?B?a1ZGVDB4VTBScHJTUTBocW1FZ0xuN1RVOW5WK3pXRjliMzRpZElra3UvOFdt?=
 =?utf-8?B?Rk9rbVBIeHBqb3QrU0tvTFhBZWdTdUZ5YUF1VnFIWG5LNHI2LzVvNHpwTmR1?=
 =?utf-8?B?VEkwdERoQ0M5bzJyczVyai9KU3RtM2pQdVRDaURwYWRpWlFScEgwQm9XdmxB?=
 =?utf-8?B?SFoxOGF4UmkwaVZHVEFxM0dTcUJORTduRTdIVDNYdHQyNVR2b3BCSnpoUUhX?=
 =?utf-8?B?bFV1UWF2RDJMY3ZZMVJvUjVDeCtKOTV3aURQUlVZZUh6aFE3eFRUUFJsOFRV?=
 =?utf-8?B?bTZHb1F3a0plNjF1K0xad2RtSEZ1OVNvNHZEdkpUcVhrVG03ZHVYTSs1V2E2?=
 =?utf-8?B?eHgwaWdSNWljZVNZYk1PeG9TVmkzdEJYS2hyY3NLd0xPeXVGZE5WWXNlNGtt?=
 =?utf-8?B?MXpjSkx4ZXRWaXdIc1dIZnZ1Q2tLR29HVUNLV0RESnBPUlgwV3c5WHkxWHVL?=
 =?utf-8?B?WTlYSW1oUmxlbVBDalIyb0V6anNjYWJtZE9uRmRSdkwyeGVVdk9QdGxzclFH?=
 =?utf-8?B?dU43dGVCL3BGSVhtcENnRk9ONlhYYW5kVEdKZ3YyekRObmUvTE9IRGg1Tmoy?=
 =?utf-8?B?SEZzYzFYTHJKS3pZK0pndTBGV1QzR01uMmZzNHdKY1o4YnRJMW9LQ1FPbG4z?=
 =?utf-8?B?ZmtGL0N5SlB6eWhQRUtMMzBQZlQ5M2d6a2FyZGp2bllDRVZZOFNaRHRyWTZ5?=
 =?utf-8?B?Mm13MjhGNlZzSDZwSW43ZU9VNDJpWVpHc2FIR0VVR0VENkhCZVBtczlwL0k3?=
 =?utf-8?B?dWtwZ2taNlg1Mi9GelcrOU1LS2NscUY0aUdXVXlmVEVlMWNTK2FubnNxVlBG?=
 =?utf-8?B?eGRXRFpoRTZLemNtMGxPSEpzYkgwYktESU8weE0vN3BFSjFwT28yM3oxVmFQ?=
 =?utf-8?B?RFBkRldvWEtPd015cEpmK0xHdXVlbm03OHdnWXp6Y0ZlcHpPTG92Y1pFVk9M?=
 =?utf-8?B?TmxkOXlyYkFyMEJpeGtGNEZsMmxPZEdSSkdRRzdNV2VnZ2h6bWd4enhMS0JW?=
 =?utf-8?B?SWo4ZnE2MHR2eExjbllaamJDMis3bWdSVnlxY20rcHRHN1dHTVBIR1NkWTFa?=
 =?utf-8?B?QndKTDFNOTJhdHpjZWpKejVHL09OMGJCT3BtVVNKYVBUTnh1SW5teEZ6TFor?=
 =?utf-8?B?L1BvV3BqMk1vaUdTK0FCN0k1K09GRVZLbHpyKzduM1dFVFl5TWl2UXdrYjFi?=
 =?utf-8?B?ZnhlNnFtOHkza1BOWVVWbVNmVzVNY3E2cjRrbGNNandZajZ0Mm1qNk1ZSWlv?=
 =?utf-8?B?NlcyRGlLOVF3VXI5Mkp4VmU5STZLK0cyc3BTcDlEa08rbzJCODlzRlhKVWtQ?=
 =?utf-8?B?MDlkQmplbUs1TnNwZEhWSUYwd1h6UGFHem9rYjhoc3ZVR2UzdlRrTzcxSzNV?=
 =?utf-8?B?U2JiaHNpbXNGRzV0OFYwRHY4R2p3Znc4a2RwWDJDekY2UUNiajlydmNWaFBX?=
 =?utf-8?B?V09IRHBOZTVzbU9HMFRXQ0ppUWlJVDEvUFhadVZsOGdDcTllWWdSNXB4azZC?=
 =?utf-8?B?WDZOTDlHKzh6clV0clhOcEFRMVo3RFF3R1RCanNuUmFJc3poZXhUb3FteFQ5?=
 =?utf-8?B?OE5meFQ2bmhGOVB3NFg0Y3lkdVdvMnpYNHpvZUtmY1hCU2hET1A1aWVVTHlq?=
 =?utf-8?B?T0F0WFFRSUJZS0d6ZS9DUjU2V04yVW1GUi9pOHU4WlJHMm5sRVFKS2MvY2JG?=
 =?utf-8?B?RHdPQkc5Q1VNZjVIbGJRUUwrNm1wSVg5TFJOVGxPTnY2eEdLT3FZWUxLdzhj?=
 =?utf-8?Q?iTBxlzCpbxZ5U8XArDYv28UXwv52WazHcdxW8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5cc62a-9dfc-45b5-2654-08df2f521637
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:02:51.7889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AswFZ3hAM8nZP8A4ttzyh98Jp0mjN/Y+Hj6eiVEEuMEnQ8WtrtmMqDM+aQaubvEi28EPklOC6YFiKkg1Jim+fYJgmq1TMcd65Xmw1srFKDuPMz2Wd9saEAaqUzGiA698
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7960

From: Sherry Sun <sherry.sun@nxp.com>

Commit 9dc39532172c ("ARM: dts: imx6qdl: Add Root Port node and PERST
property") added a Root Port node pcie@0 to the SoC level host bridge.
However, some boards already described the Root Port with a different
node name:
  imx6qdl-zii-rdu2.dtsi: host@0
  imx6q-bx50v3.dtsi:     root@0,0 (labeled pci_root, extended by the
                         b450v3/b650v3/b850v3 board files)

Both nodes now share devfn 0 under the same host bridge.
of_pci_find_child_device() returns the first match, which is the SoC
pcie@0 node, so the board level Root Port node and all of its children
become stale.

Fix this by moving the children of the board level Root Port nodes
under &pcie_port0 and dropping the duplicated board level Root Port
nodes.

The moved nodes are now located on the secondary bus of the Root Port
(bus 1), so update their reg bus number and unit addresses accordingly
to keep dtc pci_device_reg/pci_device_bus_num checks happy. Only the
devfn is used to match the PCI device to its DT node, so this does not
change the matching.

Fixes: 9dc39532172c ("ARM: dts: imx6qdl: Add Root Port node and PERST property")
Reported-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Closes: https://lore.kernel.org/all/171421fb-d0a6-4e3f-b2dc-226e9c548972@pengutronix.de/
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts      |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts      |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts      |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi     | 11 -----------
 arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi | 13 ++++---------
 5 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
index 7326b8ad08cb..efddf3ce0df2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
@@ -104,9 +104,9 @@ P07-hog {
 	};
 };
 
-&pci_root {
+&pcie_port0 {
 	/* Intel Corporation I210 Gigabit Network Connection */
-	switch_nic: ethernet@3,0 {
+	switch_nic: ethernet@0,0 {
 		compatible = "pci8086,1533";
 		reg = <0x00010000 0 0 0 0>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
index 9a43935be11c..d60a8b8f1f6f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
@@ -103,9 +103,9 @@ &usbphy1 {
 	fsl,tx-d-cal = <100>;
 };
 
-&pci_root {
+&pcie_port0 {
 	/* Intel Corporation I210 Gigabit Network Connection */
-	switch_nic: ethernet@3,0 {
+	switch_nic: ethernet@0,0 {
 		compatible = "pci8086,1533";
 		reg = <0x00010000 0 0 0 0>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index d00236a07dc4..922a257d44b4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -231,9 +231,9 @@ P11-hog {
 	};
 };
 
-&pci_root {
+&pcie_port0 {
 	/* PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch */
-	bridge@1,0 {
+	bridge@0,0 {
 		compatible = "pci10b5,8605";
 		reg = <0x00010000 0 0 0 0>;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index 2c8d2ab8cda1..2002002052d2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -391,17 +391,6 @@ wlcore: wlcore@2 {
 	};
 };
 
-&pcie {
-	/* Synopsys, Inc. Device */
-	pci_root: root@0,0 {
-		compatible = "pci16c3,abcd";
-		reg = <0x00000000 0 0 0 0>;
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-	};
-};
-
 &clks {
 	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
 			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
index 601733c3c2a9..b8006e364732 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
@@ -653,16 +653,11 @@ &pcie {
 	pinctrl-0 = <&pinctrl_pcie>;
 	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	status = "okay";
+};
 
-	host@0 {
-		reg = <0 0 0 0 0>;
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		i210: i210@0 {
-			reg = <0 0 0 0 0>;
-		};
+&pcie_port0 {
+	i210: i210@0 {
+		reg = <0x10000 0 0 0 0>;
 	};
 };
 

-- 
2.50.1

