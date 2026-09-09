Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F617581240
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963859; cv=fail; b=f1DeufJmciJf5qUGackWxh3qf/uPCPwsYFWhnR8b4GgTKwlaDZJrUtgNPya3cqfHWfNXKuZwkzrG0sNliErLW3/MQNkIgJmOMal7tFxOaGdpKaxIHGOKuApog8kuSSZYWQQm63xGL9qmDYnrVonZMZzhNd6yhXlVgWbTrE0LC7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963859; c=relaxed/simple;
	bh=Ci3GKprIWH5AOr53YDuMaMPIrJGlS1DyCiowOPA/g28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NHoX2zCzhdRr6NHvcDl2CK7D5thIQgIQT000YILFwBd04pdzatul8a4Vh/FheuzeFgFAEusnoxCHklxXKT4axDuHZVUKgIi75vfiEcqeimpSsp7j11BVaNNHrwzFzZzsNrY+5Ge0NqMOVWL76tw3bp1Y5I7bk5IfGuOPsqOZsO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IvQPgZvA; arc=fail smtp.client-ip=52.101.84.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IvQPgZvA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQt8cT32yyyTiPGIyxMWfm9vWFJG1EM85ry2XulG1Zfi0zTaObHyl35svxQTE1AfuYhB/vHCXfiM1JLp7uL9mMu13HU8O2tM5wDLtrxwuRwLH3eVNnqP6laNUQfCYhFPvgR0gXd1iCP7XZUtda3HtBrxwNZA5fVe7mlCFLO8s+zP59UrD1gzamIB/grSBAYVlH6GZ4+eC238ff7Ozx/MefIuum9nLQ9TMava5v9bS8qFEE74H1VdrCr5/jhK9Y06FfSlcxweiC59lYvS27zSx1Q4fabaltdtaTSZSLzS9psGjoO32f5OVVbllUYr19MLedArgucWHeJteWXBIyTVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hu9fOG/yrfiJVqs7Kh29FwLtJrDItl8vuUSGTm01uzU=;
 b=T61Zye3X4PEH/8Zq56q6tOfKflsppGrWFukP0qHc7i4/przIlyjY0e5W/cTjPqyfL7BFZAQfCBUAP6o7K7MJDL+FonJJXC4R6M72bU1h0xiBGuTx4AHwU/iMEG52vvPW7EkpAUyusPW7N+5juN6l96+uRCufuIepEmVx2QFR4+JM8oVNZK/KWhustWKAyRfBny3HZR9glEB9ouv/iIgnr1Dk2Fwe3CaZO7UMMlcy2faHRn4zFWslZAFExt0dak7V/TUTD8iEDPJ/UO/9iueyjqXhF2omqPzQeqBx1gWrwEPISvohSptKuwbZxA9eukgEhsfYvZ+deIMhXZc9H8C9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hu9fOG/yrfiJVqs7Kh29FwLtJrDItl8vuUSGTm01uzU=;
 b=IvQPgZvA3rhut4U5MonAvNaxiS4stIR9vpSpwi62BoNkeyt6kckakRkV0KNdxpd0ee0YW9cSE6e05MbijMtTgMbiGyikOPp9FOw9+DhiVmrwak3r+FcsgcESeXsY99M5XAIjiO8gUcD6ga5TTrwzLchKeFcz4OcVlbOdmzqXvoWBLmtGotKWGSFkOK8bUhcos2Z+Oo1ARnQc6CI2yWeoO+RqYDRpwXzdaodTlDA1Rs/JIiK3afI7VRgRYxtO2bq00P7j+yBFf0CLA5pewLTXbYZ1t1EofocPKcynuEXvC3crLoomkdqc70XxkGMhskLcranVUHqK43C5Uw66A5kBEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by VI0PR04MB11698.eurprd04.prod.outlook.com
 (2603:10a6:800:2fa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 14:24:14 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%3]) with mapi id 15.21.0382.012; Wed, 9 Sep 2026
 14:24:14 +0000
Date: Wed, 9 Sep 2026 17:24:10 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: vjardin@free.fr
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable+noautosel@kernel.org
Subject: Re: [PATCH] bus: fsl-mc: register the object drivers after
 misc_class exists
Message-ID: <shq6kbyd25wipwuegvhu2okwhrpafxhhkcdjxwftah7jvhzdcj@zqdruedbkiyq>
References: <20260901-for-upstream-fsl-mc-initcall-order-v1-1-36ffe48f767d@free.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-for-upstream-fsl-mc-initcall-order-v1-1-36ffe48f767d@free.fr>
X-ClientProxiedBy: AM8P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::28) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|VI0PR04MB11698:EE_
X-MS-Office365-Filtering-Correlation-Id: 0818a81d-8aa4-47aa-481a-08df0e7e064f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003|27256017|15866825006|41080700001;
X-Microsoft-Antispam-Message-Info:
	2A1XNSd42tFAfY95GriMHOHBynKVV1Dm4qk0P8u9aiCEO9aM8k+bTqKV6P6nex6WRcvDWZJGrVUq6iDAc+faFMnr9iOppzFo1lMh/Ju71NPkPb4eSfxFGaBMaSncixvOCrlNMUxImKe1LjWqa/kE+FGJIY+V74mIvKAiu1SadFSTk/qMCQFuhXkCzkTq7VrCsABUBBirPuACxlvvBjNsZQIdAlWiXls3Q3LSqp8OfLSX2NdKpc+7+yMu3TGut+r50P/nr8VuBUaaq8PuxXXB3KvnisJpi4YWbWxOcjCAT4bWwZqsc+9Rn3sBmNzGAenD4efgW7NT8CIM0K4YewpT9VE+iT2dCrmxSNMHJTm/35860/XWvqogvp6o36/QhqCjakbGCB5NE5KMmVpqEeM7NvtUe0u4R8Nyj7o8kG9+RBGjRcCITUCM1F/2P4xGt79SC452k4Z+ZBrYYsPd2mzIASfjm+5kduzkb1IHX/2KhpU/cMdCGGyRsMxbC6kR6poKR6ayxoQWb2f57ia8cq1BOtq53NMaMzEAlYWWGRamzAK7uk308U/b808dxaEE2EfU9pQJUWt+y70qf20Ssk/84GmIYO5a4wi1zn5msUYVIIA+RJVRAk/up6hvmZfRIVMDAVds5wyCCy3/jQyC2UsjS1QYcjGE+qQI5zZeIwrVvdYKGWp+JNCIwlbjWgHBGQIF9I0xJ8WTKiQV5nwX+cJwmF/iGOoAqVm5h4ufS2dvaZQAxkGMPuSlXIRX9xjNKhmaQB8Wn1invyte0ADnkeEJWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(27256017)(15866825006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V85KjkcY0TjlORVkW8KM3i09bRobUdX9/da9doYXjT+bdxAT38G4FJtfqVgZ?=
 =?us-ascii?Q?wypeP/QY3VPfjM/nGHf+WqCcPALLsUwTxPIPYnjIZth749ghzDpvbHx5QWlR?=
 =?us-ascii?Q?OGrxQfxpkoN0lbxbb6KAwrjn0ZttPdGnyMMBGRY4pKe8uTl9vMQvfMZP/lhj?=
 =?us-ascii?Q?TVO8VjIWSVuiYEce47Tt0YwoHOs86WnepOL10fXcynrV39hwBh+mu+rDU2D1?=
 =?us-ascii?Q?R1qDO5GnZ1Nt8og0A/HqUIalLkM11HMg7i0yn3vRVJ1ZtsSB7i0fRebYIddY?=
 =?us-ascii?Q?Uyedalhylfz42qIB4G9wL3t3a4TpBe8rvuUQmjYUfq/pPKJwTxL2+kSTFwdI?=
 =?us-ascii?Q?gy38tTTGX86G0diU8rJE+1bZZur62d7BBV+kJEa4RjNfXpnRmJP+HlZs4XDL?=
 =?us-ascii?Q?CPXFASZiEcwB/qlXfNAodLGXQrrEWAwUKjpnsjoaLRt8Gdv9WBVXX0e87a4z?=
 =?us-ascii?Q?NpTGikl2IlXhF7MulqmSnvDj/T2KEpgq/fI+6/QJqY9PaSVXozmgdB3cBMCs?=
 =?us-ascii?Q?6/D/CmzuwGIPnMSmMovQoue1Z7h/UYaMSQq5tNbWyE0tqYPWYbvdP9gJyWI2?=
 =?us-ascii?Q?7BxZCDVWUKZV1v0lnwMjpkLJwhHT8avVZUWZ86V+IasqgBi7SeihKjihC0BC?=
 =?us-ascii?Q?y8KJDxElj+cUEKHXJpZLDKrgWLYjtCitxpvPePf1rxe0zWJm7aTadodBZJmN?=
 =?us-ascii?Q?29Mo/Is3FDh179Oo37zIfeswKdUZQROZCYessT7UwPTkt4Gj6TvaVr3c7NWP?=
 =?us-ascii?Q?O5Htw4hTpRPr9uFkRogUsLKyzuwI67JVsoToFEpPQD7fDmxeIiWlXcpN2Ocn?=
 =?us-ascii?Q?zh5i5bCjX4cTYKnXCGTbA2YzzRjvy77D/GU/y4sXvV09xZG3aNjmBFcKsvWe?=
 =?us-ascii?Q?VdPLeFMjYX99EBs9mEIvG+DdTaFkO7kRxrETQ88kEX02e5Q115mcNam4o8XC?=
 =?us-ascii?Q?tQPxDVJx0IieV0IWsBax235HZY77OXycvfY8NGBor4/q77ldc84jxhJq2ynp?=
 =?us-ascii?Q?J/nGOeEJCMGiGE/xmtnRjo5GTqzBUP1BF9/8gfX47YO3GRKxQ5EB+6dXiQyj?=
 =?us-ascii?Q?khziFKYCLLrDKvCdbBqiydsbMcGoyezbbDmSoRXADKg+0+InSRXoiiFLym97?=
 =?us-ascii?Q?l0i3PoOCkZ52b/bfyoTFeaFDYaB4MjysQ+RTLLoI+Z6dAF2SYDlvauqrIC0D?=
 =?us-ascii?Q?dBE7W3zpDwrxlDDxYUni8cguSK990+Kd241+efa7BzIloHp/mCyvj+XaN7Ap?=
 =?us-ascii?Q?TCohNlgfO77ZJaA4MdsXwahuBEmO46+uYWRYq2qKhk3riUIXxs1T6zEMkCYp?=
 =?us-ascii?Q?kRHCKNWPE/+eYqR4qPrjhqw1WbCUhGRdM3SDGHzRXoTKuHrzhAdjB6byTciS?=
 =?us-ascii?Q?a6zjgsGFH/IHogWN90D7Br/W4bkjW8DQAurNfjgoKXJVcz5bFDoSwZWUgGTj?=
 =?us-ascii?Q?bSnx80nlyGvhXh4kMnVQzLSOBKNZDcDb2bltwJvVcQ9jDmQ65abveTp2tgd0?=
 =?us-ascii?Q?GX7NBfSutsVBiM/UUChAWOQCtMHKiO6u8TPw8Ar7T9U2NzuB2XNZ2x8Inpzb?=
 =?us-ascii?Q?sKgUqndTPqUtxyIm3gLt2uOk1Ngo0i+Fhr4OK6+RKvpbtxqFrFaI75VT3J+k?=
 =?us-ascii?Q?3Uq8/WcpPrdA98sewrvGYQXhFHqTXz38c8DH9E9NMKKzHcRHcTjRPn1MNZub?=
 =?us-ascii?Q?BCAdlWFHrZZBxlRRuQjchXvgilOnpHl1ZKxCaNXzSYO7JEAMwKYKRDFU98oc?=
 =?us-ascii?Q?RQUPJTvxsQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0818a81d-8aa4-47aa-481a-08df0e7e064f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:24:14.5642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1xWYrMCjeuBgoGZzDEOaaxfg5qNZPMK6O9HF3fZIrhd85LwAr7CdsiB+tKKeBW4AD60sklFAzPdCg3syfO3ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11698

On Tue, Sep 01, 2026 at 10:04:37PM +0200, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Unbinding and re-binding the root DPRC fails with:
> 
>   sysfs: cannot create duplicate filename '/dev/char/10:256'
>     misc_register / fsl_mc_uapi_create_device_file /
>     dprc_setup / dprc_probe
> 

I have no comments on the actual code changes, only that the patch would
benefit from a more complete message.

Please explain a bit when the issue happens (only when the fsl-mc bus
probe is not defered - meaning no smmu). Also mention in the commit
message as well that you are moving the dprc and allocator drivers
registration at the subsys_initcall_sync stage while the misc_init() is
called at subsys_initcall.

Ioana
