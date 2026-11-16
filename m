Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794816882;
	b=XQaMU13saF2ZH34/3CFiDD1G0kFi2w8ne9tgIQ7qXjoXShggZF3yVbMZbtBWaQu6FOJk
	 30KerOOjrK6prtJZPCPZStuihjOL7ny5n/+mjwXvXnW/6LLtBak7mbZsbIe/umB12GZ5Y
	 qltLOH6H/BWBXMKg8d396Go2EodzMp+yKW4Il14Ek2Oxr3qsyRGtVJhs29oGfEVavEtO4
	 tI+RpS/ipIN6CEC7M1wpqtqN+YwCkd9HeCcMHYdABkdaVaFonLsFYmgu84EM4pToVY6D9
	 3iuHPmYHtrfhukXZcTBYYnntae6WDDNwzn7+c4slZTobHi8K9VhJSpLAfS1SDYbG8rA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816882;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
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
	bh=P5RnJEzxjgbVSjCZbVjyRQi+ntikfVmu6Qex9xqi/RE=;
	b=xWKtn/Hmy01ZpUGMNOHToRh+Zs1A8/E6LG0yh2qxVV4DMylpwlPiy9sJyYLUVz07Pd6s
	 rXUkXa+q3748mQgoEb4AJPY4QWZkKuaL9K5rEdkMtxfGEhSDEvvF717NMBrRDdt6vEAGe
	 O7ge+74XsLdkdSJwBkvS9iLjpAd0o35Jq7UIE8Wwyx8BERziIxa3jYghjGwkzhm/RUJjc
	 T+2f6xy//MMq4X1a1tKDtqfQa7TpG0rmpQFsX81DMsQvZbByQSodcnqtLBonQsxWvyDzb
	 JYSHCo0YG9r6xvTaL70XWRwWspLh4eJ5RJhTcsTanb3hP+vag4pvaoOPgRHfRrRN1Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YxMx4sIR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.22
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75941606A323;
	Mon, 16 Nov 2026 08:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75941606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YxMx4sIR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqtqlC8un6Qc5cheeImUrTs0TfQYfhAymcOE3uAuCOcOsklCJl/CSvwnRfiQJMH/f3oz1MCPIc1E3KUwXF7sLzZyEOlk20QTxPL298cxPdDixg3Hf4H7/P4nAmjMwB3Mn+3/qg6qwrvugqjE+rQEf3Bg/av0Fm24iNvqr2GYKkZi2aj9nErq+jZ+UJMRPlWiBAqTuHSEOO0nRWSQ5Ec5j3yF7Rb87GgZQb88pY3l6h5SKW29Gvx1oS6nw7DAVH6y47b+LSqs9KWgebWPW6+gH8Gi54vHKLnJkfmcEM3wWeZAAQhR/0s7FyH4PZ+VhgSo14c518d21G5N7P5T+8H42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5RnJEzxjgbVSjCZbVjyRQi+ntikfVmu6Qex9xqi/RE=;
 b=coghYJ4OCPRnXhtFLW7kuUgGqtEiydsI4f+bx/IY4ZJl8VLVrWwuMB1m8ctNfafkDrOhZ/Bxy7kFYIWsQ73qI11TCeMtYcQSasVhJUmREHuv3xe5ih9iyKUK4RwxMKSd3Mwf17aAgRUecwzyK+Baki6is7vqPm9Y28pf3JBy9XYFpXvYFDycaEHKgYYbtBcxP+wrXiYhwY6nECHjLMebCCcNXQy2ZpDA3P/y6coo3/DFkUmxOm7UUfIAeiriCjNITA72fMTUxctxRn4/XD9CriHsDShM/NNS1vdEJjxBlyn5zPvH17KUw/6IixUK41HLiB4pb3xSPr9BfwC/dxVTdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5RnJEzxjgbVSjCZbVjyRQi+ntikfVmu6Qex9xqi/RE=;
 b=YxMx4sIR1iFnjT5kvzFO++euifoqadH4UHpnb4vAOamVtiQDRwHA2vQLlzjzHXoZHXWk+JAmJYOclaAwWBua7/T5pTzg6OXFV9uQYN7ZtaPz/yVCHSV0G3REDL5WSV2EdRFBIqMfqlW1k0c50fl4OfXxGmBPszSZHSyjFN/tbqOavKswXtEiPp//KdWzwJH9wkkSo+zeZPhPbGAwxJXUxuKR/KLFjhiXaZtvJ1rpzGtS6eVrb7hSCWSxGFGqzdD2VNf6I0UgzoR2QRABs7yH0ZIRPaBN/uYY+frDEx+KE6zRCTVT9hLNXH9fAlcrD6IzMBHx6LcWwkvmxFDHwPMgNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AM0PR04MB11878.eurprd04.prod.outlook.com (2603:10a6:20b:6fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:14:37 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:14:37 +0000
Message-ID: <dd68ae61-9dfd-4138-acf5-b77c63ba0fa3@oss.nxp.com>
Date: Mon, 16 Nov 2026 16:14:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
 <20261105064117.277495-2-chancel.liu@oss.nxp.com>
 <20261112225328.GA1784283-robh@kernel.org>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <20261112225328.GA1784283-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AM0PR04MB11878:EE_
X-MS-Office365-Filtering-Correlation-Id: 701f4089-acdb-4321-01bf-08df43b9a7a1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|5023799004|11063799006|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	I2+SbuqrsHMtbHYqaxrD2dCSD+46789loXvzabUKXcmVBRc5xaVHvc0Zq7fYi06Syfl43kcCbgcNUi6BjJVlur2b0vJ4qSW9rHr6WUBmfm3qZFlPYuFIjmCEo3yyAWFPhejIMTbSIDJkxR1+09YsEnlTPyo31eU8OeRNcWfGLeWIbAQDKBAWxeDUQpeWQ9PcigjXJkZ1Gu6ZIT9hHV33n27dF1RJc/gRxwPYlk6eoSmMu6XAiFGWo1z7dpdDSTMYK7G04JuAII2umurgPyiLlrjFePheNZOM5arFKlGfLEMfYs3U/SFrNAbO07q5ELRSGbM1ah98MIZz5VywtndE7H/Cjx7EuI+1xDc1FhIh5zKguRKMWzH60vRi2itJos5Jb8aKH61i7Tc9TPwLC4y2MQkq9dhvhpIqHn4QXNyFMghWAnU9JhHELnaFLqoBWgfZG+Azjr3xawKCbivwGFVOwIPhapewXn0pY0BzMxeRTRRdwshOEtktE66S9l5txVslULf2cvJK9l7f8dRfS7eV8yPRKaEnggtYsJeJ6vidkEFECVpEwtw9GqExIEwK8OwBHDzux9czzqu/f50uWVx0v3zYrjBbbfXJUfIS9vNcKzJReiFR+b3ZR1hN7Rzcn2GRAl2xnox85yFe7GD5FTqtB7GNIK778cQgwPlZKxsR1MU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHZCeGpVQjJqRFBrdnZER3ZWSUh4STR6blZJRTNZNndoWXlmZDBFVnhVUGIx?=
 =?utf-8?B?L3BRS0YwTUR0SUE4aWMrQmVUeGVwVFpiSUtwbmx3OXc5VVMwUmU5WGxXemJB?=
 =?utf-8?B?UnczRHpvNFNyRS9kcWJMVFVoaytESW1SNXhzMTRkMU1CaU9OMUFjSkZrbk0y?=
 =?utf-8?B?N3A1OHV1MHpzM2tlallXMXlDbEpETzlSWDBMSjl3OEg5Z01yenNGcmlwQWhs?=
 =?utf-8?B?czRqdmxINitqNTQrQk5TV000MGw3bFdpdllPRVlqU0hkbWxibU9oRW9EQnRj?=
 =?utf-8?B?UHQyTFBQMEttVVliQmJlSm1UOTNMbEIzZm9hWmw4cUM2MnhMdURQNGZTOFRV?=
 =?utf-8?B?amMwQms1dUlXbnNwL3BaSHRSelFSdWgzK1BzNlIrNEJoeXlLUGthWE90Z1Jt?=
 =?utf-8?B?T2RRTFZ3eTlNeE1Da3BZeENUZDFLZ1JaNldudXM0ZjJIejlvQUwyOFpKYjRG?=
 =?utf-8?B?d3NrbkY3MlltQ3NhR3lkSURXVEUrazhmVXpIRmN4MlZncFJvRU0yUkQ2T1BR?=
 =?utf-8?B?OERVUDQ2Z2Q3ZlBXVndERTU4T0RaeUhmMHQ4UjA4ajhSMjBQcGNsMDJUVUto?=
 =?utf-8?B?RE1qY1RLN0NDdnQzcVBrcEd3eWxTTjNOamxXZC92MnpPS2hDWm9jMWFiUE83?=
 =?utf-8?B?S3lMYTc2S2RkcnIvU0g3bjFKS2xzUlhVVHE3UmxUa21qcU1qRmJXQXI4emdY?=
 =?utf-8?B?eGpIazhYVXFZc2VSUk5RbG1VUlMvWjV4L1hwdGVYSXg0Y2NsSm1qKzVUTXli?=
 =?utf-8?B?SHJBdUJ3S1cvQkV3UkhIYlpHemd3d1lhaWREQnd2U1I0cmJqQ1dVU016SG9j?=
 =?utf-8?B?cVEzWExwMHMxMkdBMW5pbE0yWWdmU2UwOHdvcFhCS1dDOS8zamQ1cHA3Uzln?=
 =?utf-8?B?YTNpbUtuTVJXMXVJQ1h4Z3Rxd2ROZnVMQldtNFR5K2RmdVlmb3l0SDdmbitY?=
 =?utf-8?B?WUpqTkMxdElEeng3dFdpRDk3WWVNSFBzaVM0dHJUSE5Ta1FGSEhhbEF6K1Np?=
 =?utf-8?B?Nkl6ZGZjbGdHUS83RDlWYkZjNmphYWkwcEpLa2VlV0dIN0VPRE1LYjN0ZW1u?=
 =?utf-8?B?MkJBNVFFalNDTzlmWUY0MCswWWV3dThUVHgxSjNzWXFZMG4wU0NNdzJ6YXgv?=
 =?utf-8?B?TUVsOE1XRVBvbkIwckM2aUQ3d2gvWmRKSkRyQzlNVnBBZk1BWmpXUmpWdmRm?=
 =?utf-8?B?bTNrS1NwYjhzUXprK2tLU0tMSkVTODJndHdNWkdzcVBpd2Q5SUZzUDEyd0Zr?=
 =?utf-8?B?Ry9GZVVaZHVNNzZVcW51K3ZuSkg2UjRyTVdOMmx5eFovSjFBclREUlFxa2ZG?=
 =?utf-8?B?cm43Q0ZwUzZuRFRYZmNqYW9Kb1AwanZzaE43V2xJZEg3L0ZVazE3ZEtuR1Bw?=
 =?utf-8?B?RzBpRnRUR1RmVEJqVzFEK1pKamV1NFg1cGdSWkNXanZQSHBvRTdwMnMxMVlY?=
 =?utf-8?B?Q3BicmduVVdzY1djOVowaTZGMWNDcHQ2cnRoR2cvV2RZTU4yT296OFVzVW9U?=
 =?utf-8?B?NkdNVDFhS0VlM1JtQWU1UTVyWUNmNTcrNHRDTXl1NEhUZnRTclNJOExwNHNl?=
 =?utf-8?B?WFZpU0c0VFNhZ3hSTlhTd0hERFEreDdGZXpPYnRzb2tZaUZnNWpzK0xvSlhx?=
 =?utf-8?B?eVNaV0M1eDFqVkt6YitYS3JyOWJCNWs0QWFsemdxL0w1Nm95NWswOXQ5M1NS?=
 =?utf-8?B?K0JLbFV5MWVFeWpKbEcwVGhJSUMvNUtQQlRQZm55Q1d4TTkzWVM1emtvY1FU?=
 =?utf-8?B?RDBHSmN3MENiNEprUTlOc1p3UXVyeitoZHlhM0FvcWlUbCtHQ2k3Szdmd0Nm?=
 =?utf-8?B?RzFtOVV2YnlMeTNXeUNDdkxEQWsralJvaFE5Uk1kSS9TTVl0OTlyUzZ0TTFO?=
 =?utf-8?B?MUFCdEx1aHl4cndtaHBLcmwzc3VvbUtCRzh0UENGTEd6WVoraUR3TVVqSlBI?=
 =?utf-8?B?VkQwVzZnbTg3aWFwS3k5ZE5XWGZodDIrb1hiV3MzWEx4R3haNk0xVXM0bnlh?=
 =?utf-8?B?ZnNKQlp5b2QvaTErVkNzLys0WE8vcVNSZ25KdzJkKzg3MmhtcG5xR2RvdkVT?=
 =?utf-8?B?TGVuaWM1b1NwL1g0cDZZWlVuYWk1N015T2dFVkpkQzdiLys1S2ZJUzQ0NXlG?=
 =?utf-8?B?R2pZQ0pCbHdBWE4yRXhoYWRZdk9VUCtXZ1l4VFMwYUxEdEh4TGY3N2wwV28v?=
 =?utf-8?B?ZWZqRnpVaVIrQWVGRm5ocEtPYlRyNzJFaVpMN1IzbEdTMzRKUjYwUWpuVW5G?=
 =?utf-8?B?MWNRMFZmTG8zcmtPeXp2OEt0M1pVd0JEcUVVUGtYVExQdkFEUGU0T3MzbjRC?=
 =?utf-8?B?bDJoQ0cwdkhXaUxLbnFuNVI2ODFjRmdYaEpGUHZ2OVovSTY4eWlIUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701f4089-acdb-4321-01bf-08df43b9a7a1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:14:37.6998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7f8s3v9kLjpPGAvaC4i+0txRP+LVnqk1VfCHNkC/f1/Nl9jzSrTHOcEtO7//fDvWMyhSUBkxijwVL73OpEW6pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11878

On 11/13/2026 6:53 AM, Rob Herring wrote:
> On Thu, Nov 05, 2026 at 03:41:14PM +0900, Chancel Liu wrote:
>> From: Chancel Liu <chancel.liu@nxp.com>
>>
>> The NXP AUD-IO slot represents a physically present I/O connector on
>> the base board. It acts as a nexus that exposes a constrained set of
>> I/O resources, such as GPIOs, clocks and interrupts, through fixed
>> electrical wiring. All actual hardware providers reside on the base
>> board. The connector node only defines index-based mappings to those
>> providers.
>>
>> This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
>> where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
>> same add-on board can be reused across different base boards that carry
>> this connector.
>>
>> [1]https://www.nxp.com/part/IMX-AUD-IO
> 
> That link is pretty much useless. Is there a pinout definition 
> somewhere?
> 

The detailed user manual (UM12022) is listed as official documentation:
https://docs.nxp.com/bundle/UM12022/page/topics/pcie_interface1.html
But it is behind an NXP login.

The brief pinout table looks like this:

Pin    Signal               Dir
----   ------------------   ---
A11    PCI_AUD_RST_B        In   (GPIO)
A12    AUD_CARD_DET         Out  (INT)
A21    AUD_SPI7_SCLK        In
A22    AUD_SPI7_SS0         In
A25    AUD_SPI7_MOSI        In
A26    AUD_SPI7_MISO        Out
A29    AUD_SPI7_SCLK        In
A30    AUD_SPI7_SS0         In
A32    AUD_SPI7_MISO        Out
A33    AUD_SPI7_MOSI        In
B5     I2C6_SCL_1V8         In
B6     I2C6_SDA_1V8         I/O
B10    AUD_SLOT_PWR_SYNC    In   (GPIO)
B11    AUD_SLOT_PWRDN       In   (GPIO)
B12    AUD_SLOT_MCLK        In   (CLK)
B14    AUD_SLOT_INT_B       Out  (INT)
B15    AUD_SLOT_INT_B       Out
B17    AUD_SLOT_INT_B       Out
B23    SAI2_RXFS            Out
B24    SAI2_RXC             Out
B27    SAI2_TXD1            In
B28    SAI2_TXD2            In
B30    SAI2_TXD3            In
B31    SAI2_RXD1            Out
A2, A3, B1, B2, B3      VCC_EXT_12V0
B8, A9, A10             VCC_EXT_3V3

> Looking at the overlay, this looks incomplete. It looks like there's I2C 
> thru the connector for example. There's also power rails.
>
> The idea with connectors is that overlays apply to the connector node 
> and nothing else.

For this patch set, I2C, I2S and regulators are
provided by the base boards using a common set of labels:

  aud_io_i2c
  aud_io_cpu
  aud_io_reg_1v8
  aud_io_reg_3v3
  aud_io_reg_5v

The common add-on board overlay references these labels directly. This
allows the same overlay to be used with both base boards. But the
overlay still depends on nodes outside the connector.

> I2C we've kind of figured out with something like this:
> 
> connector {
>   i2c-parent = <&i2c>;
>   i2c {
>     ...
>   };
> };
>

I will rework the I2C part using this model.

> Regulators is still open issue though.
> 
> Rob

Good to know this is being discussed. Is there a mailing-list thread or
patch series I can follow?

Regards,
Chancel Liu

