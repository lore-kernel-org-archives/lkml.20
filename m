Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011011.outbound.protection.outlook.com [52.101.70.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8F363C5E;
	Fri,  2 Oct 2026 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924946; cv=fail; b=CcVluRWrEezf0pT7GPZ9tzHIJ1U2QRrMAVeGto/ljrZH4UGeTshqXtA2rbwo3GdFuKqP6YvJS3WrySZ2UoZUPRNcPUpfa2VeYMNLvXuNrKUMx2cPC76ow2gqHR1EqRaUGBjvplw3v7ZAvFZy+ejR3pm9CwtfJmwDyAabGdhXIy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924946; c=relaxed/simple;
	bh=rtyZOrIDOLbz4ovvOiLN7ehqxCAwLuLQtMLolqZrwZs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o+dxFDtdwdv02YJu1FBncuLMJg11jaPgfmIqGLoI6DGAvblabp2aUca7RMGuZs3kWQNJK60CCfLRcWYKebMEdjECaqSgP3OQbYr0uPhK7qnr8uUNSUTFSjxpOtWF0u7yfnq4S9OWEyVTiBupcEcJA//6Z2M6Y31manYuESTN244=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qlkO2km4; arc=fail smtp.client-ip=52.101.70.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qlkO2km4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGq0Xt/z/cXajd19RrlZlJtgJgQf8Ab4yJ+T46EZWOy6/Mr/UTwPShYuCZMerc1qLXXzbf9h7kMeUvL3zMq4xqZ/5wFE55TLTOQzW0e6BSlFrmYQuuHdpl919wEb80yfHZgVtZOTFLY6Z7A/w6uF2FxpTcn3Z0akWWgjmrqpFwRWqeK6eh7n9mgObJuK456dThHYO8+K6MlSUr5yocX+gSBXfU2r2X+ySt8zkzM25kPU4BX2ZM9Xt4uc2VUQbZNsu/kbhU8jfS0OrWZWseDHMuovusLtE5lAkHVc7sRCmMFUuhwcl3Ng/2PUIpziJZk93hPS9DuvpVEpLanDjGpp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWLQl2OqmdsMu4IkLaiJMbh+edPB4CXQAu1j03h4Oy0=;
 b=qK6H+Lla9+8VgLZxFKi217dj//mEn2VjU2Vo1sNT0r7TmCfbNPXUMHXJwDgBtuvhj7nP5DPfVOxCzHEFe0S7qBBTTQ7reb40UpX8RijPB4w8hdvQ7eRKC8GtA++bEobPGomAyVmXpskyhZ0GO6931/maLWTRvJarAXh3GD9lkzMSIrXmp/nAI9xRnIm2wY6bFIaiCV5LGfm38+v3Rr2E+vZrmEifoUYrC9iriNmYouGSyDHRA42jFhafdcNNxVPMsKlWr2+7rsWCMOOzoauXkDOfWQXhQ2ZM4wJtrAV46Vt8PaIct+FbQTvo7rH1HJSmFdpMBCk7as+QBFjkJp23dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWLQl2OqmdsMu4IkLaiJMbh+edPB4CXQAu1j03h4Oy0=;
 b=qlkO2km4sSzXWq86d/9zRX7Fo9IdcpO/w25mM2SMQds4NzDkEnLiYviLG4eTHkaaMRkLySGMtVqvHVeZOY7yXaWo4qa14tLW+EYTFN4ZX9B5Cc1eEk22kS/HEElL1wBAvUEWLLUUg4/pb3tFKtBFOGg06v6h0OOjeDN+QpZQUuoNTkoPDmlDIYRxZQ8S0aVKN4hBtAavSs7+rJaV4MtFX5bZPlAidnBshq2C88N5cR/YrtM5ZN8KztqMItoLITonvdT4Az12KCDiBQ0yHFjcpcEPZeEKLbQ/lFlPa22dbIVcWQsu0ZGB+2BzQbNxJbtKiSnf8che6ZgAwfIvp5xY/A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV1PR04MB9216.eurprd04.prod.outlook.com (2603:10a6:150:2b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 07:09:01 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 07:09:01 +0000
Message-ID: <217ee778-2515-4e66-93c4-7c1d8f0dd0c1@oss.nxp.com>
Date: Fri, 2 Oct 2026 10:12:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ARM: dts: imx6q-apalis: enable SPI1 and SPI2
To: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261001155401.2584935-1-francesco@dolcini.it>
 <20261001155401.2584935-2-francesco@dolcini.it>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261001155401.2584935-2-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0031.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::11) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV1PR04MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a571294-09d1-4cab-215a-08df205408fd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|19092799006|1800799024|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gjI5K2IPghy6RSkM+SPGcQAEKMAAyogjQVtVR8/ge/CXzj5/rN0qfCX5DJfEWWZ18LjXl/I2M/KMJAjlgHfIfP+aCwh4L+rT0Lmr34AJ1Iu44XxOLwN/TiJvYbgmlJmU9E/IJgcrbPHukW8sCujLRh/M5h216iuWK1ZgmbI6w12MQoKr8q/RoDI3/N1nzs/Ca5Q134py+sxE/YJsvKQkb21U4yqRwsheEIDfZraI+PxJlXHRuphmC1Dep8j04B8o7JB90yo/o2qR9sKHeUcy1v2NOMxaX0AuCT/Axk36m4EkNSQA9u44RC1XUkTvqjSiWmCtcvheuApJlGt+ulwCgENodvtHk//h1qDZ9Mk9H3NLx0AbK84yAInp90cZym5bbs1GWe3OBT5UX7/tdOpWTv5DYOHsK6UILpu1qqi6krHCf+U3vIenqrB8pB0iTldw3mxr0jZTKUCono0oHJRJzDWi+Qu0fFzvntwUiIlE8sSqaudRczcgQ6QbCHPuDGE21VmzIndm7pd0kJWkEioyDbcaGjd8nAfgY5LpWhI5KHxaZhPpXQPThn+mmyugUyWP2mg+5mXkHDbe70A0eijy7LYDFRND2n2hO5AwnFYuoWKcx+HN2L2VsY841rPONXa6nv+05iUIybOhQEyFmD62YdP+vQergu8nYZZVXsDp/sI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGVhcjFUcW1kMXlRNWxvbC82b0cwa1MzYTlnNnBlVUJqWEZndHRuTXd6MmNk?=
 =?utf-8?B?WWVRUUk5OTBBRkczNGpHMU4wUHJLL0VvY0JxU09qamxVWk55bXVBOXZnaElG?=
 =?utf-8?B?MG1TL1hUZGw5R0pORlJmclh4aXg2V0I4bk0zZGZOUkJCRFhUN05Yck0xVmdt?=
 =?utf-8?B?eXJ1QUxhdmMzc0xqZjM0b3p1M3U5amk4ZURvV0JrejNTMkFwQktkelB0aGVi?=
 =?utf-8?B?cFM1cUdIa3FFYysvd0oyZG9jVk1UY21leG16ZVRUbzh2QmlHcGkxTEFGakpD?=
 =?utf-8?B?UUtqb1hITGV4NldtYVVlMVM5TWFqOTY1WkRsaFU5QXl1QUswaXN4RHZNODZV?=
 =?utf-8?B?aUx4YzQwNHdyRVgveWNtUGIxR3QwMHZ5YVByUFJMTmhaY05KcW53UWVmaEdl?=
 =?utf-8?B?SUFpQTNqREtnZS9mWS9jMDIzNER6VXQ1czlIQjd5SFo2L053RWJqcW92eXhr?=
 =?utf-8?B?ZVBreVhwVkg2VzBWL2Fpc2RaQUx3TGVTZ3FCWk1wM25TU1B5OFFUOEtWVm5V?=
 =?utf-8?B?ZThXa09rSkg2Nm5SOFVVNnVUSWMvTVYxdkxFNTRNMTNqd3B0T3dRZ1NSVEcz?=
 =?utf-8?B?eVhXZk9sblRUWThPY0hUeDVnclFqN2o3bWZvUXJMRnVHSzdyUUtnMHp2N0lG?=
 =?utf-8?B?RW91bnljV01ScWUzbjJJWXIrcFBHMHpqQmNGNjFUMDZFeVNrNFZRTlV1ZWFh?=
 =?utf-8?B?cG9PK0g5ZGtTYjdlYWpqVkRoTjk5QTBSaXVxbVdLT29RT1kxdzMxYk1iNmlM?=
 =?utf-8?B?S2FNY2FSTDAvd1lLaTZSaDAyMDJNMFM0aHdLODQ5RS9oTjRjUEc2bzZEcHo0?=
 =?utf-8?B?OUtPNVhCSzZvRyt2M1cxQkRGWTF1WlRGWWhpRmhsVmsxaUlKVWlvZnVRWjlL?=
 =?utf-8?B?MEFaLytLQlVhQTVJdkJEa1VqNjhmcW9mSnVIaDRaWTh4SEVOVHhZZ1FjN21X?=
 =?utf-8?B?VXdEQWkrdkpJbUFYM2ZsS3duTkhDN0tkck92OTZoMHZsSEo5VnhzUW4ySEli?=
 =?utf-8?B?cGxJWUhJazVCSVpQYlpUcTJ0ZFd5cXdYQTBUV2Q5ZHYvSmpzNVdlMm5iMktW?=
 =?utf-8?B?R1JwRTJobU01VENGWmp5OEo0RnNTUkttWStaZzA5UUNNeUZMWHZXN1g2MHNG?=
 =?utf-8?B?VmYrR3FFZFdIMVdKTmU0My9RdFE4MjRmaThqbmJyS2NSbXo5N1h2cDBrOXdk?=
 =?utf-8?B?YXVqNlpzZHp1UmxQK2lmUVA0R2JZZGdaZXdLK3NJZE5oYmJLdlc2anN2TmdF?=
 =?utf-8?B?TWVJaVdtK3hXaGx2WC9pN3VRc3NvZE5xdm1yYmJ2TWo1dk1TUVBONzZJN0pC?=
 =?utf-8?B?M3l5VHBHVU5Gb3RrYXVVS0Y5RVhEbTJNVDdJcFZ4ZzkwZWZBQlBlbWRzYXB3?=
 =?utf-8?B?WE9wRHpWN05jdWlNUDZDMUNLb2o5UGlIMFZkeFgzWXFRejY3WHV2eHlka3NR?=
 =?utf-8?B?aC8zUXdXMGRNbG04cnZTZmhzaXVmakdveFMyYmc4NW5hOUlvc0tVWHpodjVE?=
 =?utf-8?B?eUlQeU1hVzlPYVZrWmxySTVDcnU5T0luQlFTb3hYclFUODJCTFdFdVR2ZmZl?=
 =?utf-8?B?RHdvVnpMc1NoZXJsRFQ5dmNiekZrSHluRWRiNUVmbkM3MFZzUVBMZ2pSMmxB?=
 =?utf-8?B?a0lKWlpTQ1VHQk50QTFwSFI2bjN2blg4MFBmdHk5USs3WmtyT1piYlM2OXFy?=
 =?utf-8?B?ZlBqV1FmWHRLMXZpY2JVS3JKdXpyUm42Zy9xZXh1WmpIcC84YVJPeUFRTGdH?=
 =?utf-8?B?c1lNS2RHbnRsMFlDTHZXYUIxSHpRR211UkNvTUZ5ZGNoR2sxQktBMlUrS1dm?=
 =?utf-8?B?YkgveXdVOHJmLy94bXlFL3RCbVlOb252Z3VvZmpIa29KVTBUeTZJd3luK0Zi?=
 =?utf-8?B?eHRQODNJdllMcmdJWWhab2JJem43M21nSkR0N0FuV0FiUDF5RER3OHMyQjB4?=
 =?utf-8?B?dDNEbmtmMEx6alc0TGNjUUVRVXN6L2lkQVUxMHB2VmtSYytESk04YWlsWitZ?=
 =?utf-8?B?VHhrY3gxRG1vMjNGNnM0N3dHVHVzRGV1S3did3BZdlkxVzNoNGVNVmsvVGw1?=
 =?utf-8?B?K0ZURk14VEUxYnRrSWh3eEkxY2tXUWpHemV0NEZTdHlqaEhZMlF3aURkbzN3?=
 =?utf-8?B?ZC9vZmNmWjQxYkJhVjhpbnBqQXVKRDBMZ1ptbG5RakZuTTFhczhZTDlvU1Z6?=
 =?utf-8?B?VmJ0WkRXQUU3ZUJxcFhYU0hDNE5ZaVNld3NFbzltYjdHdi9WbHFIc2VjTUx0?=
 =?utf-8?B?UUhWK0Z1eVEwMEJsSElXaldoRkhwWmRLaWlwWWorL2xla3R1a2ltQ3V0RHE1?=
 =?utf-8?B?N21IeEpTN3J3Qi9tU25vWWRLTDVoL3o4UjNya2kxZGJFVmR6T2c5UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a571294-09d1-4cab-215a-08df205408fd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:09:01.1485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETq4tzFtBoXybGvQoc+svwnvW5dRMYd3Khod7l+x9qfW1j5h931NGLlYkqu7uT6RRdA+fZJI4KQzWeJkmpt8Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9216

On 10/1/26 18:53, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Apalis SPI1 and SPI2 are routed to user accessible connectors on both
> boards, X27 and X24 on Ixora and X38 on the Evaluation Board, and a
> device can be instantiated from user space through the spi_master
> new_device sysfs interface, so enable the controllers here too, as the
> Apalis iMX8 boards already do.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


