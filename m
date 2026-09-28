Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6773A6F09;
	Mon, 28 Sep 2026 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624631; cv=fail; b=stVO+JqMrsAeSwr1mZROhvyQwhuJa5bafDr7ljkYD3/d/CUA4OojeiaiCp+XySKAsFhJyucyOh0gx02dKxOKABDsm1Zmd0kQOqkSbMa+P3Q3g62mmp5hko/MvpcK990ToyE8RaXZolexQbgO4qx0njed9zxWW25hWnjpKpOV8f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624631; c=relaxed/simple;
	bh=rmLjAc0I5+QJCXCtYMHbexKwzu1R+TunQPPfmzhh8uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D/Rt0CIS8aHyqZ0cbyqwRZfuc5/iw2gTuYEeJfi7IB9XUUbYpw98czT4wk3zQVJEGELCl/5uaN66EMFWeUlinM+IiV5fh3o7Xkb5rER5PXCh219ZPzFKUTYHMpHc6q2tFTPc78uzyhpT/XmCEEpLbovrDNuU/RFp5t9aVJvKhOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wkH3B84A; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wkH3B84A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLLxgj16oUD/wBmjW1MhLfZ/rmoxhFQOnHhAhXCOk8dVRGcG9hLKQBAev7WyHERb6/xNN9kNOGSlBlYf2EIVkI9GREtnmUz5/VJ3Ebd7VZ95Js5UUpm27MdxXESZSkgOkq1JC6ht1vGxVDlEhS+oJPKFHUYS8lXw5Nl09cv6xo20hC7A5uChEcSa2mGx0rnmrXs6KTeWY7T+lbbLxFNkG4RIuXtEma11yYkgZ3r2by7VFi/hdhfrIFKHEQzv8eGLrAdeohVXsqrJMMWvt+D7aEqYe1K/1QQV9WcDY0iMmnejZf4zASyECXcUylbgyftdaEeSMNXXpgUdQ+O6Qs+cNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNgpOYbCEvDcgOVM+N32Y+n+ko9oeFUdHPvx3/IXc9g=;
 b=KR5NEVCNd1hfNI9jlhrZWUHtJSDYT2o6wyGuriAPmeuVnHySlCwp2K1yHl3E4Ak+hcz+Q70I8l91EsmX8GwyBOrxiAz1U5gfconrKXOLku6ibM+Ja/XTca7SXqsvBvgFeLZKw+PqsGYtVEK09Q/5VIGRy/U2Iw8H0/Wtw8pKzf2djE5ObQLdxL878GqDbRpN04yb3irh/1l5wj4e4z4DgSSd29Ry4hBK/zfLMacSdrN4mBFc8NhrLyrU9kFgqDL5WpTeyjzNHnZmVcXEFa7h8Q1Pikz3MQNXpsElsH6MIiFDyGywF/bTVfAVWN4aQCBTY1GFbSxe3pieh8NnQNWt9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNgpOYbCEvDcgOVM+N32Y+n+ko9oeFUdHPvx3/IXc9g=;
 b=wkH3B84AVsZg7YCj8zdnwHRstaGFcicRSXoOnyZpqyETry2n6rf+AbJmLM7kL+3mvh1NJCiH8srlGkkNSpL7nHvE624nfFkFAUuCtTYEHDw60LWfI6pAdyPBIEjovnbGNUm4mB8BBrHJe9GBHT9ZiVZ/Kh8IbvGSgOudd8aSA1RX83mQDdNWMBQ2Lh7KU+C3994eMA0mEE8ZnAM5MlGY9utB3DTKw8RNRAfSJSsrf6JKe8Rlo5V2EKc8dJ3b99VsQe8phZKxEDgK1B4ZXMWWc8BYIN1Tg5cAZvxKiMgnMYuJH37Lu8WsWrIrWubxrOLVft4RYDx9c7hv46AnYH58AA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by MRWPR04MB12332.eurprd04.prod.outlook.com (2603:10a6:501:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:43:45 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:43:45 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Mon, 28 Sep 2026 15:43:37 -0400
Message-ID: <179062460571.2055968.6279023947911572402.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789683864.git.stefano.r@variscite.com>
References: <cover.1789683864.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|MRWPR04MB12332:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c96602-10bf-44c7-56e6-08df1d98ce41
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|7416014|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 P85Cq5NT9Czj5pEf3b7itMm87xX+t8HBwqvX5eU9YQ+gk/AGTS5k0jkw2nr7tBiyNRqL9EhPkSoepNxbkCQGlFi5BqQM+2eZpZDweyfBz+qzM3kE4ZsVP1kEu+lTD3U4ntxxE+ssUcJRFm1vDiLL6GUzEtlkHC8dBqLevItxgfl18oRv8KAk1kvADzIpsK3D+yXIZkhOnP+Zq/gwTQ/2kBiX+uiZObwB/uHphA3FOx3226BP5phesHwRbgaRuJe9HWFtGyDDqnFQMbSIgVZBaC0QxPA2K3JUux7tW413SejzYefAbZ7M1Iy5l2Vll5xvGyKAW0SvqIDPhRQsdAWHZSi2nIn/0hzAYkfjMQzKxN46DybwPjuGUPlywOvK/JizKPSTl+PYPTFDFbkUiOPwG68S6XIJoBAreboV/mYTGMg7gqMV2e6OH8MOHP5Rq4r3gATATpPWoNSre7Pohdx+GfquaaRGrt3KyTinTpRavoBPKnzIMSMmAQABzf4uFmwqf7cltEWGmkfOChJk7o1HBfZMdmDfzoFihYMSRh6xLCWc8RGuw0kPDhwV6aHS6WMsMdmoRiQii8UafOpTkslPZYpVUtK/o10QsYzP5HxwklFgMKgxvCEtSCNWytFII7vkydUA/6HvCzUSHyPRG6IyVM3pBuz5AR6K9hY7hYm/+TI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(7416014)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cEFtYlhtQm5sc1JlSjIzWVhIK2trRDFxREZNTXVWTXR5WWJYcFhhVE9oaFNm?=
 =?utf-8?B?ckEzRTFQTWZBek42TGgzM3pmL2JnZHA4STVKRVpka3VvaFhvSGxieFNVTnMw?=
 =?utf-8?B?SVJMTG4rQm0raFF0VXZnRnBMWENRTTc1VkZJMzQza05kTGhNT3pkMVE2SDlB?=
 =?utf-8?B?YjBNMkNNOVVFdWd5R2srSTlQeE94S2xPT3JYM2RhYXRENTRna3k1UGo3Ym1D?=
 =?utf-8?B?SXh5NUFLckdrdkJzbzRHQ2ZLbHVjQjl3bzk2MFRYZjZYSzJnZXkvWVBoV3ho?=
 =?utf-8?B?ekNrNllCYmdCMjE5YlNaSDRpdGV1WFArS29kVTRXYzZISlpKQzdyQlNwM0xk?=
 =?utf-8?B?UTgwNUFEa2N3RFR3WVRXOTFJQ2RSRGI1S0JFQ0x2K3MzdjBWRW5hL1FLQ211?=
 =?utf-8?B?cjNOa1N1NDc3VUhaUnliRVgyRUZpYVlkRXU4Z21DZnIrdlRERC9NY1N2UTE1?=
 =?utf-8?B?UHlUa0toUHhxUlFjbG9DL0U5Qi9wNlFxYm0zMTRZV1NLU0I5aG93QnAwS1Ez?=
 =?utf-8?B?RVBUT1FnS05VYkNNb2dnRjgzbFpvNVEySzBuUjlPa0o5UStVMi8yY2hScFRG?=
 =?utf-8?B?RmkvVkJWTVd3K0FIVDZnMmtheU9TM1Y5ZWhzbHdIOHdUK3I2ZUFKWkUrdEU1?=
 =?utf-8?B?SEhXTlRBbEtmNkhZWitxMUhpQ1ZzZkVmSk8zYXp2THR1SW9Qdk9jWWRKS0dM?=
 =?utf-8?B?RWY5d0hnY3ZpZG1Pd1dwbnNROUVDdXF1ZlFiVFcxQUFwYnlWUndzQk91aE9J?=
 =?utf-8?B?akhJQTRMY1VlUHBzcnVRZDFvSlZXdDRUdml0QllUOW1oTXd6M0dpR0k1WThp?=
 =?utf-8?B?S3ZUSnlxMDFOb1Myd1RQb2ppRW1EZ3VEUW1Cc1cyOWxtb2NNTzFGQTkxQVda?=
 =?utf-8?B?U2NObGt5eXc4TVRRYzRLZjkvall0ek12L0VSMlkxTUpkK3NvQ2swRjZmVllx?=
 =?utf-8?B?a0E4L2NiNkt6TUcyS091L1ZkWjRGMkJ3SUtKUjdjbElpcmhKc2tINDRnMnhE?=
 =?utf-8?B?bjM2cS9ZYnk5TGgvTkEwUWlTampDdnRLdkd6ZUtEYmVCbVNyZk11N3RoTlhT?=
 =?utf-8?B?dXFJS3hYclc1dGpmWDRnc29SUWU4VW4vZHVMR3VTUTBOa29nNDArYi9HNlAr?=
 =?utf-8?B?d0R0d1lHYWhERkVzZEtlR1NPd2FSWkRVakc5ckJQWUVKRTZJZVM4ak5xWUwv?=
 =?utf-8?B?b1hjc01vU3F6bnlSRWkxc29wbWhWN1pJeHJUMUNEa2F3emhQZ2R6MzdLTWRs?=
 =?utf-8?B?TEVXSVVSeWV6M2dNNlFteGZBL1Njem4yaWdHYytadW9sbi8zQjVTd1VuZk5N?=
 =?utf-8?B?YTNhenJzV0dPY0VxTjQ2bVJROCs2bUhOdjN1Sm9qb3dNTzYxNUVPYU1iWWNm?=
 =?utf-8?B?Z3dEN3AvQ1hCUmpNaHBxczdsZFVub25EMFluZEFjb01WOXRQRmJNTGZVYzND?=
 =?utf-8?B?RFJpWjlaRnltMExrSkNtbi9WS1RZMGhpTXZQaW1pQUMzZmxzLzhOTncyeHFE?=
 =?utf-8?B?cGFMTGNMSDFiTmZiRTFyUW9mVjd3eDhaSnRtODlxY3o1SDRHMnc3MGZOSDFj?=
 =?utf-8?B?bWVLUUlJa0pScnNHVGhKUGlTR1JHVmpxQTlmdTBlUUNTbzF4aUVtaEZ4em9q?=
 =?utf-8?B?NzljTHROcXNMc1A1NE1yanArRmNYRU9zS3JVY1FzR1RPQmUwbHhRcUJiUUkw?=
 =?utf-8?B?RmJQVlYyUnZsYWZ0L2VMT3MyaUdLSDlhNUlJbHU4ekN0QWZFc1dMQkpJS1RE?=
 =?utf-8?B?TExFTFMzcUhRQkNhUWVTZm1jVnlqczZGa2lZcVpqcnhQSUtDbGpRRmZnMjFS?=
 =?utf-8?B?UHhVN3hqRkViY3F2TURkQ3grVFhxdU5KZkxWRTVFeHFRWDVKQmVQQTRhZTlQ?=
 =?utf-8?B?VzM2ZXZ2aUxMTVJtZEJlSklIRUlNVVdXN2JwODg1bk9BUHpSMGVKclRDZDRo?=
 =?utf-8?B?TmtuR25Fb2pMbXhYc001TWhGUXN5dWZtbFY1WHE3bEgzZk5MT0w5b25CWlFQ?=
 =?utf-8?B?Y2dUaXlLc1NtZ2h5U21NdkRCd096bG5LQ3RLNVhnbU1Rb1dqc0krYjdkanM2?=
 =?utf-8?B?MDg3T2NOdlU4bDZsayt1eHJDYWdpTm1lUm1zZndHbkEzUm1zZ090OVg1bEx3?=
 =?utf-8?B?QldmdnY4dmNrMHh1UWVtUUZFUVEvNjlhKzdJMDh2bU9SVVZQbnVaNk9PL0JX?=
 =?utf-8?B?NS80NzdITTZzcHNKa1ZyTzNMSHdOUnQ5Ymt3ME9Gckx3QXg3M2xReTkrWDFy?=
 =?utf-8?B?allKK0hJeEVTU3NnL2ZaU2U2bk5SdzdKR3VoRXJzTkc3anp2NHY5N010VmhX?=
 =?utf-8?B?WDJSemcyZUgwdXdTNTZDR1B6VGRVYkl3cHA0R2wvKzF2UHBsb3F1VmZxSno2?=
 =?utf-8?Q?k6VJb9pRAIXAQEE2B+MTTBkDjR7Po1V1auGAd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c96602-10bf-44c7-56e6-08df1d98ce41
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:43:45.1761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceoeVHEznS96ruaADpcto3sYyqFYDnz+4GyBJ/t9/SvpoHye/VFDvL0rI0cKB3bn8rrl3LcvC+ytBc/edcnT9zFBU3i1wIDPEMcYmpYCCzRSu751bsqzMkJRk7HikyhM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12332

From: Frank Li <Frank.Li@nxp.com>


On Fri, 18 Sep 2026 00:25:42 +0200, Stefano Radaelli wrote:
> This series updates the Variscite DART-MX8M-MINI SoM device tree to
> better reflect the currently supported hardware configuration.
> 
> The changes configure SAI3 in synchronous RX mode, add TPM support,
> and increase the Ethernet PHY reset deassert delay to improve PHY
> detection reliability.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
      commit: 6bccdc6afffa4345331d46adc880bef56537421e
[2/3] arm64: dts: imx8mm-var-dart: add TPM support
      commit: 395280622de0c67814d8b5f06366217b3a9f70c0
[3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
      commit: 8c40f32361d566c0882e9d92abab36256b268291

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
