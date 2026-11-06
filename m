Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793996055;
	b=LYgok+PaSCy/Pn8l4KLbdba6MxOqJq3RZKKzvNjX0wpCQzbZBWyzg4eQQZHMJRvuDJui
	 vJKezx764EpHqWhjzBVdnq1d70ao1wLKPR7qHb37PaK0k20ldslXtESzZfmM4ZleyHHl3
	 eLSLTtdx2uoWBTSgWjZRzmTxAOz4m4QyL0AIZfV8Rg7QT7e4nbKXsDpLhUzSKkTNem3lU
	 OgmoDiQ/9JtHL42IZbQYf27jut7GXpbcUOANehmPEfcgdqKAyYZFs0g34EyEZJXhxj8nM
	 nn0ALJybFJSFhcpBbp5u6mGykjjL9Pi3ONyndjcVE1/q7twVojClf2d0ZRSDoZEp9CQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996055;
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
	bh=sd4D4UjwRo3Xi7AEqy8INdbhlX80k+aghf4SRs1GYqE=;
	b=tNOhJw3JKSNGOvh/1sJJAYUZ4sjVsVAMtke4AFOJumjWrOmzF/nlUM9d3QynzlRNfIbv
	 E+20C05ShcNvB2hjg2f/6JoqW9hAxziKwuYp3SRsI8PA96tRV+HAuBXoplH88gS091DHW
	 Ov4Qz+2nB+iV8ek/AhXrfu62asmtpMmEirKcXrvb5Y4y6DfS91ZTrOGAKbebjQKR348b0
	 LtBblNIIUdxX+SqLnt4zupUnhqu8ajpoRMey31stcr1Zh2julYuazBedr1AtkgqHIVekZ
	 9q9vjlsqee1nWYe7CKo0FYEj7a6IL6muqckvrn6FI64DrTJ2HS0Gz6zOV/VDCnlwqAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hqD5Oeql;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.34
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E438E606A32E;
	Fri,  6 Nov 2026 20:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E438E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hqD5Oeql
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtaSf+BMxRCo4d4qj362G21QUq8EjXi0ckMBj9zDdaLvoE4kX/+75XX6KVEU/1wb1Ha167brOn+sptstyW8Ynz41rzvI0c6cqrJbvjm8Vmbz4BPq/HZ/7rHX7zyJBQ807oJVNuP3XIweE12KpZcRNJ0ifc339AlLoAN4BGKyL4IR78oBtJ64xJQnm7iU/AqfXFbGGI6iMov8n0fzEh2CVRkSeCMsRl6MIFZ2hfbUrRh0N07YLl0/zozZwJE+gdJbtXRVtv1vWQ18bbfI2m1X44PUELB/4aIA7JVGvERbKtRBAv8+Yv7hMEOViycMabWU+w2XlbkbzeAC2Yl2Te5D3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sd4D4UjwRo3Xi7AEqy8INdbhlX80k+aghf4SRs1GYqE=;
 b=R0f6wp+iO0RVqwf3TuTp3fHBxpbYfDDZ+JjTWzv9KqOwHUkW8XeqBxFNCOkXI6SbbTuonbD51WoI6JWbS2TexEcgycCh8aXcgC7Nq2InuEnVmbnBmfcHl7b6h429tpKScOgOUf7olHjzG6XxBGqSp259tm1aZXJ8ISPUGyKAyOvyyohg1Fn8eZLXwd3gN96qS+US7qUlI8U6Qe6LBOLoY5xDcxvm1dL/+99BK0i7kKRnlfUrhWQgg0Za4sdLraFxJLv+uIMwpYNXo3GZ/v2q5E4iU6HaSPk+IvrgdCYsLkw5I64JW5dQQZPPHYJgRFvDb7OQe5DFYAJQkVNjtILWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd4D4UjwRo3Xi7AEqy8INdbhlX80k+aghf4SRs1GYqE=;
 b=hqD5OeqlV82BXix4FyIbfpPnNP/rB0eBynw88WvakITQNn7AUOnh/glnne5jeK6VmMqo/WlAdvxyAbIRA+w5AVxbGw4G9+5Ebb5o8/mPT5l9LI+2bYWvmohi/fdEVBSP4G8pjl3wpn5N33AoH7FfSH2Yb+n1q6K9Any+CPRQXoPvpCWOFhpflUrTV/pcdUE4rW6+OtSryp1YnyVocc0RmeVoeNUTxwnSLRcNbKmLc08DIEWJOZQye6MoRpGGBYzB9NkFuoqk+VdSPym0txxXeNk2mpZucFqAYynezgfqW/TrTJ5ml7wWGl42h6Ud8nOabCvrIvKMkJ/t8PYNt0gU9g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8580.eurprd04.prod.outlook.com (2603:10a6:20b:427::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 20:14:12 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 20:14:12 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 06 Nov 2026 15:13:46 -0500
Subject: [PATCH 2/4] ASoC: fsl: asrc: Use dmaengine API instead of
 chan->device->dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-dma_sound_cleanup-v1-2-5eb8a7b81e87@nxp.com>
References: <20261106-dma_sound_cleanup-v1-0-5eb8a7b81e87@nxp.com>
In-Reply-To: <20261106-dma_sound_cleanup-v1-0-5eb8a7b81e87@nxp.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Sen Wang <sen@ti.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-renesas-soc@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793996035; l=1536;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=RtND+5faad2fQt6GOJY0be16mDXO6VABLNYEwDn5xBw=;
 b=NJDBs0kCTf3/K3enIApU9Dl899sRXFhcLdO5kOIxGK7gyfrY/OQ1QfYXdOxbN7zWp5/wRahw6
 NPYOXt/HDL9AnP7Tw0LjpJqEae6WIApTfetWZHBGL1IV8hIxPvvT302
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P220CA0046.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 32979fec-230a-48c5-3d7f-08df3c4285c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|23010399003|22082099003|18002099003|10067099003|921020|11063799006|261009223027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0cTNlKwyaACW/gu6ST3V0bqmXIWiTFtS9h7j97IOuOWuVzwXfuFscJVMIS9prZqBRu97hwJX5KkA2yAn6Zed3gLNySWV2W64iDXWCPBzkhd8Kwm0w+7OSZiIoGva2Dfps1Ml3FljRVORzS+L9SVDqYIDK7kyA4/p+n+Qd/rLmTJumj2yoTNZn+UR3LRkqt+mrGUZ6Ne64zbS6xf6e9oETDdPdWwxu+Nmnc3jkuyRQJDw3aqemVKQ7BVOeEeo9ZS7+WYL7topq+bxXWTtCcgjfHGvmKj+CipkOH98ctfGJPlexngmRT6xM4bCfVXliGpDju3yaPrLmeCROnfzsfXviqPiNkdSf1VfaXNYdbiFeZiga1hZrDRRolOtGbF2Ym4RO2AldQN09Q8zVPb7ckMz2fsLYJVb0I1FY0afPPNyGW62QgDx3VvAYtj7k+XjNaK+9ZlICqdOoiRamdsjY1wgrrVHNQbBdMEThqcGdV1j9HwwbAjkYts5BiyRhrOZbFgvzOW0VVrfkQk3E5c39heoWSBkMCBjRPb9uHFFn8uLBBescWsGK+uUvrfCUXjwuH8YKQ8IgsdID1DO6lXUFUT4xzHU6S0m69cFcKl7be7HzMJChP7GEwm8FGg0EEmn6IgdqACbSaDMcwmLHuaajSESGbUh2PQ/HGp3c5OPEAG5nx69F8P07XNwS++Mjs3wwzEIB86MQvm0z4LED1beqEHUfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(921020)(11063799006)(261009223027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG9GZFB4aGVXT3JvaVk5TXZTMkVwdE1reUFzdnZzTURzNmpiQTZsR2labFZO?=
 =?utf-8?B?Mkc3aTlhSExmZEMyNGhWVFE1YlZvYzcvRmJJREVjRVh3SlFvQ3ovYlpLUm1J?=
 =?utf-8?B?WTVScjRHOUR3NG5tNU9sUDlNVWNrQnBqcHhWNWVZczR6WnFCMm90YmplTGZM?=
 =?utf-8?B?QzgzM2gvRERORzBCSFhzbGl1WFA0RmduNHFIN0d1cVl1Y3pjN25ZTUdKQk9O?=
 =?utf-8?B?dmhLbmFIL2Fwb3FHNlpQOG1rZDIyZVB5N0hWMEtESGxqZk5aNVZEdThIWWF4?=
 =?utf-8?B?N1ZuU2FaZEJVekJ0akpFdGFOcWtFNGd5dEN0VlhUeVM0Yzk5UmxjVzNraCty?=
 =?utf-8?B?ZkRKMTJjanR2L1NUbmJVdmFuNFl6TzB4OC9nOUFGOU9vZmNYK2d1cUVhUXNK?=
 =?utf-8?B?ekh5TEVVSFhISlNxOW12bmM1eGV4bm9VWko4WlpxNDFTRnByMXdHekszdmpW?=
 =?utf-8?B?bkVOVnRwMDZCekZUQzgwdzd5b0hKVjFucFRKMTA5ZnJTQkhlMXRaajVCUGZQ?=
 =?utf-8?B?VmFIYzRNWnc1R1B5NUp3SE5ZN2ZGR1lQN3NHcXpBRFJDZHZ0dkx2Vit3TGYz?=
 =?utf-8?B?Z2JTaFYxUHVlelNtMXlvQjRwNVl4bmc3Wmh2STlIN2ZZa2JydzUvNjBaTkJ1?=
 =?utf-8?B?ZWEzaWpWRUkrNnh6N3dSbStnNDJ3NFltbCtOOHhDbm0xcUQ2RGQzc1pDbTNr?=
 =?utf-8?B?TndITEZ3eEJnd3BsS1BvTm5KdUJIbEpHN29nMllJTGxyczJ6VlNoZWRZVEJP?=
 =?utf-8?B?ZVFlZGNkSW11eUwrU1N1M1I5VXF6d0dQMGg0VllLUVNMckZGYUJCZ1VTZXJH?=
 =?utf-8?B?RWk1MFNJa2ZqNURNcjRzSjhPV2RIVndmQVdjcVdBaVhyWllkY0N1YVRFQS93?=
 =?utf-8?B?aXhobS9kZ2VEOG9hU1krOUxsMUZxWlJ2Y3FYZHVScGwzVkhxVGlVSE8yNmp0?=
 =?utf-8?B?dGVwNmhNMlBtdDgyMTcwT3pJQXdmNFFmeVkwelBNRUxqdnlBZ1VxUDF0QUk3?=
 =?utf-8?B?dG5wUXMwNkFjSHB6L3NWMm82VGZGdmRLRFZVV3dFWUwrczNPMGxDVk5sSFNt?=
 =?utf-8?B?QnYvNzk2cno2UnF1ZHZQWHdhSHlNVStsa1VwNlR1YUZGUkpUMTFXd3NobjBp?=
 =?utf-8?B?eWpwOUhTeFVIbVRaU1EvL1pnVVZOdUI5NlJlbmhKcmdkVXhIU2NhUWxjTlpr?=
 =?utf-8?B?WXhQbHlpYXRkUnpja1A2dTBPRGQ0NjlUMVQycFBQb2lsc2RQNmZSWStuak9n?=
 =?utf-8?B?MGlWUm1weDFSQ2IrRTM5eVdkMHhMU3B6a3lIKzdGd2o2VEhIUXlhZkNlWlJM?=
 =?utf-8?B?MjJzUmllWGhYSmcvZmZueWx4NlBYdnBlRDh1c2hxcDVaYWxxbDBjclBiZTB5?=
 =?utf-8?B?WXQxVTJOelJpemU0djdxVk16Z3RORDV6NjdES3V6cjRJMkVzNUpsakdueDkv?=
 =?utf-8?B?dzhpZzkzc2JuUW1LL1ZVcmZ3Y2xjdXM1bmg2dUl3WlNLdlNEcG1zdllnTVpS?=
 =?utf-8?B?ME5va3pmRG1CY2hmUWozZ0k3S0ZYb0ZVMFl3amR4NzdvTlk1K3drV3FLMS9C?=
 =?utf-8?B?cW9McEJMS3lEVEFtcGxXZy90U3l2bEYzUUVFMnU5Rm9MNmpNN0hsMENHR3dW?=
 =?utf-8?B?VVliTEVrZ0hqVGZwNGVQWTVjOXhLVEZIM0laUGR3ZVIwZS9pSFhHUVIvVElW?=
 =?utf-8?B?VnI2LzA2YUpYanhvYnFJUnBkaCtoTldrNWxFMG5jM0xUM2xQV0RDV0tPZHk0?=
 =?utf-8?B?aGlrekFyTG4rbFNUai9oZmxVcVBLTXYyR3NETFVLdzFnbEtJK3lySUIvbG8v?=
 =?utf-8?B?Snc2d20wT2ZWOWZSRDY1YXV2MGhZR2ZaaUNzWi8zTzNIZG9ZSklEWnhLUXI0?=
 =?utf-8?B?VFQrRWR5cTVtWXVGcWJRbEt5Y3pLL045WjNJWVBqV2NDZ1h6bXBRaTNOa0Z5?=
 =?utf-8?B?Q3RqK1FlQTFPNGFVMitMdDRlM2luMWZIaFNWMjcrVU93TWVIaVpEa2RCQloz?=
 =?utf-8?B?dW9FRlFYYnAzMzVRa05jcFp6MzRWVnpqSVIzNFBxS3NGMWtYQkxWNmo3RFQ0?=
 =?utf-8?B?R21LQTB0Tmt1RS80MEw1Q1Vxc2ZhSUU3ODZicndKc3RZa1JkYkVvbW51ZitK?=
 =?utf-8?B?azFvcEhsYW9HU1ZHaHVFbHF3NlYrZkRHY2xlanFjY3ZrcmRtYStnZy9qQ0NG?=
 =?utf-8?B?bDV4RG42WDBXVUQxMWI4dytsN3hZQWFNR3NzYWNrSWlTV0FnclNZMDA1blJY?=
 =?utf-8?B?S2hKeW80U0lYTWJSQ2tkQkJHUy9BVU9ZQTQwNE92UmQrcjlIMmR4UFJsT083?=
 =?utf-8?B?T3p4enJTNXRUTzdsVjVDVEs3TzFXcHBIVXZKRFFkN0FPMVhlUzdZNWRseWJT?=
 =?utf-8?Q?cWpJMDNcmq8YQwLXk/GKp6YcaWCivgbieSt9I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32979fec-230a-48c5-3d7f-08df3c4285c2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 20:14:12.0157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPOtf5/7+mFcKj7FyzD98hF4ZvMJkS7y+YTKiLih0gp9ArClZ6G4th59stgC1/JBdNwVHvqzsOcu6t3EqNqENZMPqlCi16vLRJvRhYLDQCeebM7/JUbNqhhsX+Zmo0Mu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8580

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded chan->device->dev with dmaengine_get_dma_device()
and chan->device->dev->of_node with
dmaengine_get_provider_device()->of_node to avoid direct access to
DMA engine internals.

dmaengine_get_dma_device(): for dma map device, may return pre chan device
if dmaengine support per chan iommu mapping.
dmaengine_get_provider_device(): for dmaengine device filter, which have
of_node.

Prepare to make struct dma_device private.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index cd3bf6340b650..71f84359df3af 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -261,7 +261,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		pair->dma_data.priority = tmp_data->priority;
 		dma_release_channel(tmp_chan);
 
-		of_dma_node = pair->dma_chan[!dir]->device->dev->of_node;
+		of_dma_node = dmaengine_get_provider_device(pair->dma_chan[!dir])->of_node;
 		pair->dma_chan[dir] =
 			__dma_request_channel(&mask, filter, &pair->dma_data,
 					      of_dma_node);
@@ -526,7 +526,7 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
 
 	ret = snd_pcm_set_fixed_buffer_all(pcm,
 					   SNDRV_DMA_TYPE_DEV,
-					   chan->device->dev,
+					   dmaengine_get_dma_device(chan),
 					   FSL_ASRC_DMABUF_SIZE);
 
 	dma_release_channel(chan);

-- 
2.43.0

