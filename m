Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793908238;
	b=HL5+Qny9v+vnJ/TPdMbQdYdDF63sdjFB1lOqMTaUXR5k+fIcNsCUQVPRsCdrt85hJCFR
	 On3TNOm/+qCW+kqNt61Zyp82ztL5WFbu6MjVxBSk9BWq5DpfzBnHbQ3+TDtvVnSLLHA7l
	 b63r83+xUEOtSinHaxwwr8q+V1pJb3tFMNP9eb0uqnmcrQ6uW5NJW5aNyk+r61YSsfLKx
	 gnV5BJIHt/IDQi30GFRtAr5lXlfbFQ8H4IXdk/Sls8hX8kfVcE+EiLFICZZaq0PTM8FgS
	 YII3SAtlfT1KYkvVpZSRE7uO1Usnz7+9jcZZWCNyg01gmV5ewEbUvgpQOwKRl/vtagQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908238;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=b/YdeIe3S04OQ4ZYTvPmBVIB4mwiU+hwwue6q+M2uuQ=;
	b=mmAsCke0HjaIo3j1MP9YgMsPLyObJ1fxc2efQo+IORQbQP0lbRph67+4DmSzi86ToHO5
	 SQO8ASrD9eZPNa8jVYfk7LtGZ40Hb3vZOqfOMme0dAJLLPiJPI3BZG5VdJUbKLd3qGpai
	 Ykm0LXcMWMHQMFUaxPX8Yb7ibAiAHpt5pKUnzTRLcrGoQj7cfaurDcO8mhTtP3A5QYc/4
	 Gdl/uAH7QS55OZMHm510KMOXS/m1NOQaXl3DzTbknKzAzxpR/SNUJxAsLrQdgiZKqC/kJ
	 RLYuDSRYkyzpDpVWaszCIwd3alss/4JirrsNn+dS40YKvKWKuY1775zCi9TLIGciPfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fvRQDk3K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.65
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39287606B9C5
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39287606B9C5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fvRQDk3K
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TO9qcs+Ry1BoLoTNmRULHuJZ9W7TC4DlgOvMgcUZT87z5kLdJeSI4zDk3NO+a4Z1cNPFjlGXyOMoqoRGnpwSwhbQjLlCB/aYj9MmxIK+YRXla5GZtwrHkv5h9J/HgY8zNQhtRI8Ssr8Fw9083eeg1OrrfIss8LilOrhx9BWPwCaA33U6IgIl4hV69tpJBtKjPoY5PGERZUyhDAyJ+nMDInhfmzspyV4DY+CrU1y48hVaae+l/w50Bk2yfMIPv+HS75NULpYKwhNvhJI48sQ7aYBgxkshPak/wXtFZ9yNC3mvuYw36f7K8GJ+3/DaNnJ93nlakvDT1MakEAKed4WMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/YdeIe3S04OQ4ZYTvPmBVIB4mwiU+hwwue6q+M2uuQ=;
 b=MOkf9kl5n6DGR1nuvnOstNuzWaNk6WD3jtXC8CxJITWkgSbUBn3Z/wAc1Alk//CO/Zzp+ZubJdAl2NeZ+IKAbiiHR7ZEkw18H0LjWR5AokdSHrLD+pAWGLyUeQ/lEZa3RITwEA350tqGAozB0vLy83vAHbCDCvhlzrntXxoCsF/qoe+2zHgpEbG414lg6thG9xcGr4yvIijzsSG6b985YF9PfzaRdGCstLxEeNCFknCaoc4/VP/Khb243ntzDvF0fvLsHkPd2k9XnNQ4LRQCelHUx5pGgHH7ep/tC4zmbVuBtqZmN1T+X8sw2TO3ui6+LpeoQtGhRUINXXPGWpCdZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/YdeIe3S04OQ4ZYTvPmBVIB4mwiU+hwwue6q+M2uuQ=;
 b=fvRQDk3K3IP44KX/xBOeEqm1+w/rY3fTQnua6Vjr95KmjcCWoefy8HJ1tJOCMzl3LLlUabnXbEpklGUOUmaaLAOYnsu3VvujYzrxS29T8Bk8sgJBK8Pn3gUDEVse0fTclzsUMAy0fnjRleBNZTAHUX7aXIjZzeB6uR3/dgBw+yPHRNd1ypa/0BMEewgdTQRMaDtTbTwt6w7TtAvrhY+RKhX/q0osVd03eebJequosUIJK5S6RCAaQcnT1ggN1a7tYgHg+MXDPBk/34XX3fJEPN8LdmEqU2ix/3GqZVMQNwpGEnZKuPtEjK6V1+33UFlXEPUjyoa60yvlvm2cxAP58Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by MMZPR04MB483805.eurprd04.prod.outlook.com
 (2603:10a6:190:45::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:50:35 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 19:50:35 +0000
From: Frank.Li@oss.nxp.com
To: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com
Subject: Re: [PATCH] MAINTAINERS: Add entry for Toradex boards
Date: Thu,  5 Nov 2026 14:50:05 -0500
Message-ID: <179390820286.1646920.14350309115622219689.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009064705.10116-1-francesco@dolcini.it>
References: <20261009064705.10116-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR02CA0114.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::16) To GV2PR04MB12436.eurprd04.prod.outlook.com
 (2603:10a6:150:343::11)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|MMZPR04MB483805:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b0fcbd-a6d3-4c8d-e52d-08df3b760eaf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|11063799006|56012099006|261022105027099003|261022075727099003|261009223027099003|261028144727099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	URygD+0avJxHQpU9Qli3Qwta2s8eoeCh2e1kqcm6m16bSsmV+oEjhWoWftpAWVs3/PoP1Ci7///EBo2xU3hh2VPpR/687RUcW8ly9uFZLgtZOIZJzR9DWwJx8oh1cYzPOJZ4nsxzAfvSwVkumjuaSBAf/01+y7ES08fbuGmqbuBJKjMnoTg2fCyKoFElc/Xry6MIyn1PKY4Oq9HAsrbpAIOhvZCXNOEzFLh9WZGx8oRh+GZCUo9o0X4PlehqAlPQ2S3Id4JW+DJcT8JXP5wp31VQbZ+NFFiL3v6Nocqy4B8oEvLr5tZkRlvZ3KAYIWlU+10nOWt/PfN89YssNGBFUS/ojWpmAYuHHArfcaXA4SzudQC+QPkNpmA4feP6k3aTMjDfgcO2rvv/EkAGhNg6MM3vhWL1M1277Ony25VowQi/weLH1DPkUFPKdNe8m/vY3mvrilw3ulJXFwMiSwI+76rP4XdJa87j4xpsf0iB3JbP2XmLbz7p5YvbGHj7C6Wh6WObnD32iYEcHrfTTIOL9awEepuGY9vtVXCMC1jhEh0UTsYqE5pfsLD9i/8rhlgR//tVwInTOeZVCU8oebjjLkg2pDmqxsWdsab8gsgnKOU2XE3eGGthdRE/bbLUu5ftIN8M04SzXhO55+H2sI3LuDASXvLHl2yt/7DGKDMqjGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjVHV0k5bE1pL2ovS0hUM3JQM2Jsay9ISTU4RlltVVpoWEs3SW9GRTBWc1Rm?=
 =?utf-8?B?R3VJNG1IcUR1UE1JU3ArMHl4a2U5ZkxSSmVZdWJjSDRzVlpPbkZZZ0ZoZ1lj?=
 =?utf-8?B?dkRJMS9Xc2NxQlFCZ2RrVm0vNkFFWnF2UU5VT3JKUDRWUGttVFJTRFp1T29q?=
 =?utf-8?B?R2tsNkVOM09lSXlwQ1RDajFSVkEyUTRHZXM3QVFJSVAvL1JoYnJnZGNENHRu?=
 =?utf-8?B?aTEyZ29Qa1BQcU1EQStxT0QvU1VybU9JSFNjRWp6NVNjSVdsTUtSNzZTbDRH?=
 =?utf-8?B?V29QVGhjMkljZ0w0cDZNVnNwYTNjeVZnUzFCdmI2bXhwWGFVTlhFakR1Sks0?=
 =?utf-8?B?dG1VVmh5MVhTTXViSGZHcXN4UUQ5ZFM2Z1V0R1Fka1RxaytTbGpadVB4aWhZ?=
 =?utf-8?B?UlFJbk5OU1cwMUV6c2o5OGxYWHkrbkNzalFZMDNjT1hZUGl2dGpCSU1lZFNU?=
 =?utf-8?B?Z0xoTHpxZjkzZzBiV0dod2kzVllud0VCSm9uZm54Vy9yWkVMVkZLaXRhU2xl?=
 =?utf-8?B?VUFqTFliU2FwK0MrcXdSYXdRNVdCRzVtdUR4dGNnUkk4VUVlK2pQWHVsYUdv?=
 =?utf-8?B?S3JmWlZCNVRqN1pLNzh2N3FabG4yYlI3OWp6WGZPYVA3YkZLaUFVWWx1M3NH?=
 =?utf-8?B?RmdRbFU3TVpJMTlYeWY1MU1kUFFuUGthQU9iZU5FUkw5bGVLVEFxVGxMVkJK?=
 =?utf-8?B?ZE1iTUFlTUxYS0t2ZlpaeCtydmpTNmR6eDltcXp0R2pQai9RcEw2TWZnYlFw?=
 =?utf-8?B?L0Z2MkN0eHc5MmJUcXl3L2RMcit6bUdQVHVaN29KcFUrYVVQMjhFaUl4N3Bs?=
 =?utf-8?B?d1kvQ2FRbG40aFNvclFUOXpqOTBCMEVWYXdYbVRRUTlGWDB2WnllakMvU05M?=
 =?utf-8?B?eDJGYWYzQXNZM00zakxWS0sycENteEhTMzUxOGJJS3FoSUdtK0hld0dRQUdF?=
 =?utf-8?B?eWtlSStxbDBGQ2JzbkNQQjZLOEwxby8zZ3BaOXBHWkFYWUNlK2Rrb3ExK04y?=
 =?utf-8?B?U21vS2prQW1WYm9mdDRKV09sbWkzTldIZERoUVhkS082YzlJK1FYaktpc01x?=
 =?utf-8?B?SWV3akxqTUJ3eUtDb29YcnBXanN2Zy9sbnNtSmgycmZqUVloQ2hkY0s1SWU4?=
 =?utf-8?B?d1ZoZE1weUR1d2htWXNiTEtpWUhIdDc3c0liZk8vNUZ3Y09lbTdmYUZVcENh?=
 =?utf-8?B?ZURIeGNuT0hLYzBxL29nVWFadVg1SmVYVVcxUjZaOXZSbllobW1CRzZZSkVt?=
 =?utf-8?B?UWNWNW5uN1NnNjlXbXZISmh0WHF6aVZDWUxCTXNIN0Y4dWJ4VTdpemVsai9h?=
 =?utf-8?B?YkZRUUZGYUpJQ0QzYTBNVE9ldkJFbnoxZ1dOaTd4NndMbG1JZlUrMmczZVF3?=
 =?utf-8?B?Qk5JT01uaDc0SUxxdERUV0xuaTJjR3ZLZjJRY2RQVVJvWnBEUjYwdHdHQUlq?=
 =?utf-8?B?Yng1R3Z6MGhCdENlVlZWcmY4MlpvbXBzMHhoQXFuL085bDNKemRHN0ZudmZO?=
 =?utf-8?B?eXZkTk04bURRQmhiZ0ZMQ1VvSmJ5QjJKN2w1eDNkOWxTa1VQNCt1QW02cnp5?=
 =?utf-8?B?QmZIbVdIbWVNMnJDcndZRERIM2lVWUNIc25qTityNkVnQmtYWkR2c0FiT05q?=
 =?utf-8?B?YUNmUHVPSzVKcTM4YSthU2w5RVFoUHJ0QldRNW83Qmh6Y2NCekJyOHN0Q1dQ?=
 =?utf-8?B?c0kxZWIwN3dleW1lOEd6b2hRTnZlTXloenlwS2VwTXpHeENMSndlWkFEV05X?=
 =?utf-8?B?MXc0WVlHQWd1eGIrcDlKR1J0T3NFa2d4WC9XYUprUTZFVzUvU3ZHWU4zVFJZ?=
 =?utf-8?B?M2gwQTJ6c1hGdEhnLzJiRU9ieVlwNDllNVJnYlFGcGdCRllFVys5clZCM2dz?=
 =?utf-8?B?RmZXTitxOHd6VGtWajVWNE5mcVVPQlh6T3B6NkpvM1JHS2V1RWszdVBERlpH?=
 =?utf-8?B?a2I2SEhCUTNZTUVSTWZLN1UwTTkxNXdqbFNZTldjZ2R2SlQrV0FxbzdUaG9O?=
 =?utf-8?B?OFNUS29ldUNTVHZkNkNMQ2lQbE9OclAveTYvQkd0ZUpWd2hUSU9GSk1sNUVv?=
 =?utf-8?B?SWpNTk1Xd2VCY00vMzVVd2xlZWRKQ0YvMDBJa2NmTGpkMGtjVHJ0YTdmeSsv?=
 =?utf-8?B?a0Q0aW8veWxCUHhTVkVEVUU1ZXMwMVlVeVlTbXIzZncvb1RuZUQvT2tsWEpX?=
 =?utf-8?B?d0V4dTk4Q3JOVTc0K2tDeE16N3BsZElYN2pKQjRnRE1VRkxHMjVFcXcxNWNB?=
 =?utf-8?B?Qno4Y3NnSjNJNE9QQTdYWXMwcHN0Nmk4ZEZ3Zzg3bnowcmNRZ2NCc2VrTFNl?=
 =?utf-8?B?d3JMT21GbzhnZHQvczVJT0J6MFQ5a01MTjlJYmZqbWpadXpOVlFuaXR5SURa?=
 =?utf-8?Q?yMtTACNuiNu6k9mftKydiW9Cahd3VQrI0c/Yc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b0fcbd-a6d3-4c8d-e52d-08df3b760eaf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12436.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:50:35.7013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhFzFF1/iFXQxxeH3G39c/SL35EIZkvTCg/ES1FAJu4ESL/OfbDQARAhRZiTEij5NseVgCjof17ZmLGobbIe51IaKq0Oh2NJu4ezkjJwqDlqGCwP4AQAnQG1XB8lvskl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB483805

From: Frank Li <Frank.Li@nxp.com>


On Fri, 09 Oct 2026 08:47:04 +0200, Francesco Dolcini wrote:
> Add a MAINTAINERS entry for Toradex board device trees to ensure
> that we are included in patch discussions and can provide reviews
> and feedback on proposed changes.
> 
> Toradex has been developing and supporting its System on Modules and
> carrier boards for many years, including their Linux mainline support.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Add entry for Toradex boards
      commit: eaff1feb58b6241c7a6ac4db441ca26fdcfe359d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
