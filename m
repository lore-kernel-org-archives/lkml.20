Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799406;
	b=rYIk+q823vJPNu6MT9DI2CSHEkJYxJgYLIEzOsKdgGQb1+YBdgddyM5iNTUSNgwG5Rq3
	 3Qnrrn9ezuFeCUErM7n2bPOZyddxyTuEq7saXZ4SLYRcq7br3BvnXY9GBzdGLgcMq/iaj
	 NGRjp9ZEY4tgZSu/5tUROl2pKNpewBj4EahqFOYJFECdndj6qxGafi0yKPP2r9Zmnjiu/
	 Cg+TEInQYY1Tk6NGpSXpm4BHOKnX1eoZXZXl9UDFq1SYw7IiT9aEAkyyvwOPgeBKxMNl/
	 Ky9zQ4daZphD2r+/ZnlNw9Mu1S6CS3Vc0aDoe63S+tOQfjvztQFVB02UESgiE4Osucg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799406;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=e2dexuUZjcNgKbmhQHjpNgIskBmPxgnkUJ0kBkqROSo=;
	b=XLtS3F+zsRVgxGW6cHfnXdMOyY47yNcCXIf8/t5daBI9H1eVIg0yslY7HN5FIWttW+I6
	 9lU/XSPH9sveufjxME3hK/H99m0SUUp53w7PQdG9UvnMdoahzix421S1+GObAiXE1zpiF
	 VUgxja+YbPw5jKoDxvs1Z3kawI2HuRFV320ve+lSd8Fs2DhaE0KzMYhLame68+hwnVxli
	 Tx/uXItSkg02KXmjUzS9rThrtHUmnydFeKOpnFDnbyQ5yMu3oYCmN8I290tx73OcoTjbU
	 gwVvT4/YF+Vnb8NJBOidt1Hbyh+xemscO+Vba+x+I4VgXg217OGkrrpvJ9YBddYCBwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yF59gtNV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.9
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F9D606A31F;
	Mon, 16 Nov 2026 03:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3F9D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yF59gtNV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W41ZOfQltH4Ur01SYu3FJi5Qw9Qz72ZwKz3jTletoaCHHH31+IVQmA7Q/xm1SyXjQCo8IJOTBQw8dRHNujCvrRvO+LP4PtQwqunLrY/fR0oFqmHBJLe6mPF6lqt71KUiSb33CgxFvkVUmFTi6OTbOnCgLyhT2jcuDrf3Q3HdrTbjoCHhqLS2vNga75UaXUNMDFM51aFpM99rh3aYm10nmJn2z385aU32pzDgKxbGHe6e0C+Ko1qPFWi6HeqKpuoorGOe4URBqNx2SqGBh/k0PIvyIj6VsOjTeYKvZB2zSbovqkxZd0F3jRVcYqrmdhrgspPZ3btrfdufH3GzHbYXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2dexuUZjcNgKbmhQHjpNgIskBmPxgnkUJ0kBkqROSo=;
 b=J3zaGFvR0AGAKXZAOVoxsx1KE3gT9Za/PfC01+X6TUUKXEoSLtVZb+OTxuZJ8f2wxBJqQegpPKKTsR4Z98uoErfkj+HXq4LFOO18Kd5LzhhEMVFlCkyEXYFTwt4AK9t3qJhgci4LxGiisrca9MBoZHyT7r5XXog9KCTA9yqJgjsm3jk0epHk8ZjDPhdtxJPg8r0Qwf4yu6Gb1p7bTi+5kJcS5lETmg+0Np9gPY3oL0zdzQJXt4WK0kdiewC9IJOw7D9K6dO1s7vj6d+eEE0WnrWSB6DhWAcI7UBvHLpRqO+fFed0T87Q6CEZmiqoD1+1wtt/wQZHJbaqlD2/h7rADw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2dexuUZjcNgKbmhQHjpNgIskBmPxgnkUJ0kBkqROSo=;
 b=yF59gtNV3ZGT0aUVLHtU0lHWZWcaqdvcKw8ECf0iU5F242CAxWwtVq0csPQK94ozQArhJKUQQ4dCLDqHxT4YycfWB87JUzL3jA6r1yhcXYrqJjdpDQJG/+xhXyhjSBhXJtGk4+No9Inqr3bvTZ6udSTB13NUKnE4Eq5LZCwjHcDsfetGoUlN/1Vnn6PLUKX2ic06gK3chPRfudEJR9XpVh65A4vDTVXAAUONBszHTd5PjdeO+AP9DxVKekpifa7LCHUXwURuFp9QzVum2A4EhsMRgZ9OH+5Q0WS+FToo9wk6tVkugCJeJ36jv7HU6UYKyvmsmHlvAxjWdipgDMrNKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BESPR04MB035703.eurprd04.prod.outlook.com (2603:10a6:b10:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:23:22 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:23:22 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v5 00/11] media: imx8-isi: Add i.MX952 ISI support
Date: Mon, 16 Nov 2026 11:28:18 +0800
Message-Id: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJ4+moC/2XMTQrCMBCG4auUrI00f9PGlfcQkTTJaBY20kipS
 O/uKIItZveFed4nK3FIsbBd9WRDHFNJuadhNhXzF9efI0+BNpO1hLoVDaeLU7pO1kgO4B0YtB2
 olhG4DRHT9IkdjrQvqdzz8Pi0R/H+/WYkLDOj4DX3HTrnFNb09rmUbT/dtj5f2Ts0ygVWYoUlY
 XQYOt1pDUH/Y/XDVpgVVoRVaBGFAhWC+8d6gaVdYU04gsXW+saDEWs8z/ML464rzV0BAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=6193;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=14ZRdXQNj4GW0WTJ0qTDP4W0NDMpJ+ArO/W7sdek8v0=;
 b=qsJ54lyr19xLxEXnFv3hKpNd91rxqjNXV1zXS5LqnLcdK0NMVBFlIODmA0Z5ibpdgTs2+UUbQ
 CoNQ2bpMkPsCNqnwY7SGEL8ZcEGXlrZ/txVz6v9YwlQI9nqFsQmOV5m
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: JH0PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:990:77::27) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
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
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BESPR04MB035703:EE_
X-MS-Office365-Filtering-Correlation-Id: 202b3d4f-56a1-4ac8-6944-08df4390f7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|921020|10067099003|11063799006|56012099006|261022115727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mY0RlD+tVSlnmyU5Ya+9LiCYFg4ruPL/vDusQu7sL8oq23x+NrRDUdIFDOseGWJDNV/2lFBOF/uP8W34aY015wYZ7jiMBjPHmvds93qJ4esmzWzHCPnXD3I9bi0LRZRTko9s0H+KPppInVVVQP7XGl5/f7XDWwZ+e+/yLKnEv1z2yzNusJfP2ykKi2dcBR7JQwW1MbG3wGDLJ0eJF4Nkd30yw0MPLZqimu3Nss5jGp/GC2q0f7sNaWmSlvyxX2zKHDLCGjNgKr5bTha0P46jYwJFa4rNj9lgGIDQTNJJspOM9Frg/eYgKkMpGbz5gzgQA0o+y/PdLD/E7wiFr/dc+XxH0QykSf25r3LTCuocAH5SJiPRCM2aUhEKiQNU5Ad7mhlemkwKRJo6/Gi8m6/sWhr1Ut/EwrUgZn7c1IYDO5EmamMD3wY3rI8d1wY6ftRTzR6LT45AxfxwMbBoTCbFDiq6LTgliU69v06ySme7w5ovAKeVXdVK0t1BTXXeEz1+iGC+nqntJyvGorg8KNQdPGmnaXhUdaProVShxa4WKw3tGayQnARsU86iQiGlvySN2yPQlGpYv5Ur4VZwkiXdg2JgG7tuUrPt9LSgOZfM8jBT0sLhEzkUZ2ngaO5ERcSl07E5c4fil7e2r52X/UlQ7S7kCAPhqn2SKE4unYETcN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261022115727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVdjeHdqc09xa3BubFlUUXhld2ZnSEhteWZ3eWpFWVlCa0Y0YzE5Qy9JTjRH?=
 =?utf-8?B?TkZSZkx6SmZWbW92SUFxaXBnNUtta2FRQTcyWGRTOFhnN0VqQ3k4THZqaVJk?=
 =?utf-8?B?ZGJPVU9WSFBoOEQzSVNOdVBZdTFYNXZrZXJaZ0g5MTRYand2QmR6N0xkZlYx?=
 =?utf-8?B?dGpjd0M0U3lKZzVVMEt6VG9McWprTlBLeFp6YWl2SlVRWSsvRXl0MFJ2M1BT?=
 =?utf-8?B?cHNGd0NXY241aGl3Zm4vNFpjRTNBNnBEVkdXTU1Bd2Y5RnY0VENDa3BkZUxa?=
 =?utf-8?B?Mk1CRUx4M3F2cHE5WXMwSC9NMXNBaU1MaEg3TndINm93NUFBQ29TYW9KSGk3?=
 =?utf-8?B?Z2YyQWExYjZ5WHRhbXIxREhadFJTckZzbkkzS2hmSmtPZ2x6TFdpVHFiZk51?=
 =?utf-8?B?aG9JeXZZYVVTaVIzbGRXSXkxT0NjZll0MHMzYyt2OTY3dmRCN1JsWXQvbk40?=
 =?utf-8?B?UmFDUHlBR3VjL1dMbjh3RUw3RHRJTGU3bE05R0VnN2tzMlhBNzVEcXlJR1VU?=
 =?utf-8?B?bXVXTkVWQlhMYS95VUQwak5xRUtnV0ZMREJvMmRrZWZoT3ZCK2RmZm9jMHg4?=
 =?utf-8?B?dlVSL0haaEE5cHJ2eDVNK1JKSzllc3gzN3Z4MnNzRCthL3lYN3NiMFkwc3Bt?=
 =?utf-8?B?VEt4U1hLQ2NVZWFqQUZvdnhNWTFTS29IS0xXcmcreXIvTjIvenZybnVNb3Vo?=
 =?utf-8?B?OS9MaVFScjNjbDQxRDRFSWxtSUoxMHVZSjltdmQwdTFhcStTYjBTUlB3ZmQ1?=
 =?utf-8?B?QU9JelJVcXpHbGJtM21IVjErdTNEVXZXQTFEUGEvUjJsY2tpVUR1SU1GLzds?=
 =?utf-8?B?WHZlTEhyOU42aVFvVDNPejd1c3VOZWs5ekJjeW1TZ2JaMDFQdExIUENVNXhS?=
 =?utf-8?B?bXBWY3VsRVpzOW56MzdYTnV3ZDZrQ2FqUlhmY0kxaEdIVGdwVGpvZWErdC9Q?=
 =?utf-8?B?QWxtQWJmeHlCUkpVZUdpcVIzUWVsNWFrdEpQR1VCam9VM09BUSsreVRicWFG?=
 =?utf-8?B?STczYzNUZ3B0TXAzVzk4ZmFPbDZGOEd5VkVhYWM2UlQyQW9CbkV6RVZmQmVL?=
 =?utf-8?B?bE4wUE4zclpjQ3Q1MkRTTUxjcHM3dU82RFFaWXBWejdnY2x4RkJwRGpyZTFP?=
 =?utf-8?B?OXg2NndqeVNWbDQzOUNtRWZiUjZ0RDUvaHNxbWFPZmVkR21hb3l6aHkzTzJT?=
 =?utf-8?B?SFc3dExSM3lhWlE0QXlnSHBNU2FyTzRKTGRwT0xuRjFZWTJ3L1JLSmllb1hv?=
 =?utf-8?B?b0ZJOGhrTEVoVm1SY0taOEF4TVVrOGU2T2ZCaCtCSFdwdEdVREJ3Zmppd3ZC?=
 =?utf-8?B?RW8ycCtnaGZLc0tkZmE3dlVDTU5IYjF5dituUXIrV1hZR2J3UE0xc3ZBaity?=
 =?utf-8?B?c0x1Ri8yS0dhZUNLSXprUEU4VXVITzZ4L3ZDV0J5UXM4anErbnNJSDRzUjBL?=
 =?utf-8?B?eTl0RTUzQXV2UDREbDRuK2VYYVBhTmVRSnlqZE5MTkhuSHdDZVRjaVVZVFor?=
 =?utf-8?B?bG9rbk1uWWRnTVZFdFVnYnNOdFBBNG4xd21uOThld1BoVXN5V2JKOXVmWGI1?=
 =?utf-8?B?ZnI1NmQwcVowNTQrTXZuNDZ0ZWxtb3lnS1lGUXZrVnRVdEYwYmFiRFh4UTVS?=
 =?utf-8?B?a1YzYnNlVTBsUTZGVTV2Q0l6eUl2VnJtMG52WGJ3c3JoTitSU2g3QlJnRkJ4?=
 =?utf-8?B?VXZIQ2RqSFh0NTlJMTJaSkxFWkpndHE5ZjAzV0Vhc2YyV0UxNGsvY2J5YTVq?=
 =?utf-8?B?TWJ6eHVGbzBGYW5DSHFtTDlxWS9VczN1TDB2Y3NISEsyOUdCQTZtU3JadElx?=
 =?utf-8?B?bUhrRUd5bG5nTmFBZWs0eGt0LzFCTWVhOG9YRU9XQ3I5Unc1UllMWFBhQ3JK?=
 =?utf-8?B?bTNUR3Y0WE4vQ0tKQmdsSzhvOG81eEl2ZjA4bWNYYS9xdTE2VGVBSlhTZ05B?=
 =?utf-8?B?aGhxQ3ZlTnF4dWNIMFBJRUFkZ3Y3Q1AreThYTWRybUF2WHJXd0MxSnhhbjVy?=
 =?utf-8?B?S2YzQXRyRkJkWXpSeVQ4M0haRXkyeU1PMCtNZ21QdS9KeGIyRzdMRVpyVkp4?=
 =?utf-8?B?MkdGUTkxQzJUN3RKSHo0bkxLbGlFMXZOVVdvdlZUTSt0a1ZGd3hDb3dFZkIy?=
 =?utf-8?B?UndTS1NkMTRCL3R2dUx3Ulg0ZnBxRDhoWk5JeVVMZXJvZjhoOHhDNy9lTXhS?=
 =?utf-8?B?ZytpNGd3eGQ4RzFwQThpWm84SUVFSXdPUWJKUGdBNUhuRjZwY241bTJPSXVH?=
 =?utf-8?B?aDMvSi9OUHNjdnQyb213bm53VXJ1bGFwV1pBZXNzZWsyVGNIbGdvd3RmR1Vi?=
 =?utf-8?B?S2lCRmYrM0o2MWdtRE1WOEdTQVZLRHVXdTRVMWxvSVZXSmQ0aklJaHlybkNM?=
 =?utf-8?Q?kgBeVOQwP6Av8ALcck/Rxi/Ln/dTh21LiGpZ/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202b3d4f-56a1-4ac8-6944-08df4390f7b5
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:23:22.2806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3HIRlY3L/5nt7m2AyroHHlgHXn/v/uSaao8iq5XYG/IUbaUF7VTYMJpfNYO110wxTdhFEJ7uwQsB8IGAr8WXdAs//4FfYbuDY6jTbfNaCEIJrR6ddcRLc6ODZXNw6Hx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB035703

The series adds support for the i.MX952 Image Sensing Interface (ISI),
which is a minor silicon revision of the i.MX95 ISI.

The i.MX952 ISI reuses the i.MX95 ISI core with the same 8-channel
pipeline and 4 pixel link inputs. The key hardware improvement is the
addition of RAW10/12/14 output LSB alignment, which allows the ISI to
output right-aligned RAW data directly, matching the V4L2 format
requirement without the RAW16 workaround needed on earlier platforms.

The series is organized as follows:

   1. Reorder mxc_imx95_data definition to follow mxc_imx93_data,
      matching the order in the of_match array.
   2. Extend output format mask to 7 bits unconditionally since
      bit 30 is unused on older platforms.
   3. Support mbus_code filtering in mxc_isi_format_enum().
   4. Reuse mxc_isi_format_enum() in capture format enumeration.
   5. Apply RAW output format workaround at runtime, storing the
      actual hardware format in the format table.
   6. Add RAW14 output format support (available from i.MX8ULP).
   7. Select MSB-aligned RAW input from pixel link on i.MX95.
   8. Exclude RAW10/12/14 output formats on i.MX95.
   9. Add the i.MX952 compatible string to the DT binding.
  10. Add the i.MX952 platform data and of_match entry.
  11. Enable RAW10/12/14 output LSB alignment on i.MX952.

Review status
==============

Most review comments received on previous revisions have been addressed
and several patches have already collected Reviewed-by/Acked-by tags.

The only remaining open topic in this series is the RAW alignment
handling discussed at:

https://lore.kernel.org/all/ar028ZyZg56Mk60M@lizhi-Precision-Tower-5810/
https://lore.kernel.org/all/ar00qevdwDHYAEy9@SMW015318/

The discussion affects the final patch:

  media: imx8-isi: Enable RAW10/12/14 output LSB alignment on i.MX952
  media: imx8-isi: Select MSB-aligned RAW input from pixel link on i.MX95

I would especially appreciate Laurent Pinchart's feedback on the
proposed approach, as this is the last unresolved topic before the
series is ready for merging.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v5:
- Rebase to latest media/next(7969a6f407cf)
- [3/11] Clarify that this preparatory patch introduces no functional change (Laurent)
- Collect Reviewed-by tags
- Link to v4: https://lore.kernel.org/r/20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com

Changes in v4:
- Rebase to latest media/next(2dcdfb625c3b)
- Split the original patch 5/5 into multiple focused patches:
  patches 3-8 are new, each addressing a specific aspect
- [3/11] New: Support mbus_code filtering in mxc_isi_format_enum()
- [4/11] New: Reuse mxc_isi_format_enum() in capture format enumeration
- [5/11] New: Apply RAW output format workaround at runtime
- [6/11] New: Add RAW14 output format support
- [7/11] New: Select MSB-aligned RAW input from pixel link on i.MX95
- [8/11] New: Exclude RAW10/12/14 output formats on i.MX95
- [11/11] Split RAW_IN_MSB_ALIGN into a separate preceding patch
- [11/11] Split RAW format table and RAW14 changes into separate preceding patches
- [11/11] Move isi_out_raw_shifted() to regs.h in the preceding workaround patch
- [11/11] Rewrite commit message
- Link to v3: https://lore.kernel.org/r/20260915-isi_imx952-v3-0-3d8ff1363dda@oss.nxp.com

Changes in v3:
- [1/5] Add Reviewed-by tag from Laurent
- [2/5] Use unconditional 7-bit mask instead of per-platform approach (Laurent)
- [2/5] Drop Reviewed-by from Frank Li due to significant change and request to review again
- [3/5] Add Reviewed-by/Acked-by tag from Frank, Laurent and Dooley
- [4/5] Extend mask globally instead of per-platform (Laurent)
- [4/5] Add Reviewed-by tag from Frank
- [5/5] Use CHNL_IMG_CTRL_FORMAT_MASK instead of the removed per-platform format_mask (Laurent)
- [5/5] Derive raw_out_lsb from the model field instead of dedicated platform data (Laurent)
- [5/5] Clarify the CHNL_IMG_CTRL_FORMAT_RAW14 comment: the format is documented
  on i.MX{8ULP,91,93,95,952} but only used on i.MX952
- [5/5] Rewrite commit message to explain why the RAW16 workaround fails on i.MX95+ (Laurent)
- [5/5] Add Reviewed-by tag from Frank
- Drop "Remove unused model field" patch; model field is now used to derive
  raw_out_lsb capability (Laurent)
- Link to v2: https://lore.kernel.org/r/20260831-isi_imx952-v2-0-fafdb4b446d4@oss.nxp.com

Changes in v2:
- Use fallback compatible fsl,imx95-isi for imx952 (Frank)
- Remove unused model field from platform data (Frank)
- Add Reviewed-by tag from Frank Li for patch 1/6 and 2/6
- Link to v1: https://lore.kernel.org/r/20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com

---
Guoniu Zhou (11):
      media: imx8-isi: Reorder mxc_imx95_data to follow mxc_imx93_data
      media: imx8-isi: Extend output format mask to 7 bits
      media: imx8-isi: Support mbus_code filtering in format enumeration
      media: imx8-isi: Reuse mxc_isi_format_enum() in capture format enumeration
      media: imx8-isi: Apply RAW output format workaround at runtime
      media: imx8-isi: Add RAW14 output format support
      media: imx8-isi: Select MSB-aligned RAW input from pixel link on i.MX95
      media: imx8-isi: Exclude RAW10/12/14 output formats on i.MX95
      media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI compatible string
      media: imx8-isi: Add i.MX952 ISI support
      media: imx8-isi: Enable RAW10/12/14 output LSB alignment on i.MX952

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  18 ++--
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  37 ++++---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   7 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  56 ++++++++++-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |   2 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  22 ++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 110 ++++++++++-----------
 7 files changed, 171 insertions(+), 81 deletions(-)
---
base-commit: 7969a6f407cf55b5254c824c87875452655ef11e
change-id: 20260817-isi_imx952-66ca65f9b638

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

