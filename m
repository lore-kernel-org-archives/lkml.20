Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F363D0934
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032057; cv=fail; b=kcskG18HuJLpUavFa/Jcl3U/sGN7xTcKt+KMwGpnR/RvxNKUJX8G1anU53Gj9zywBilxA5gbUm8JFwjmdHvyDpja2YWMcSes9gqJxiZc8PYBwKR3TvH5t4mTl6OTbxEr7eSelfelx6pXu302PJWUIIoErR2eJEUQCK7tD24rQ3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032057; c=relaxed/simple;
	bh=AUjGh+QEp4AOOCsxCVICl9w1ehNL/gOeCcv6gEuF1+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JEvd8ZII+pzxt/zTvMLp0wVZPYUuwqv/KOCv5ZOFN+3V8IfCjYDarfHCTo+d70/CjNFILF2VrFqIhCumaVcIQ/iRLWFyRACciBTUuLew3gwkyQ6VCuR5bnfPsCaUUfUyyv0ksMfRioV0yxkLHTajUkfXGO35CDFQbzuXiaNZNQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bln6Av7i; arc=fail smtp.client-ip=40.107.159.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bln6Av7i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJkOkN8MN2Oyswatn/XXy0H3ASymnvj2Uvaor1EClueTNGIaKbmkOiEc9bGedMrfKmbrbMFWb+rCjY6/0W5tAg4amj346FPIWibli0APz4X/LJ+jzg4sljAZ4iXMCPQkJ8F95BZkoMG2IBB4a4yep6t0Kpq+xjesVWeI4kyKNGeoQVrWNPItRVNtfe8iFIJ0GFU/L7wAheScszXtB1COFO91nYr1wpzBjEARPGRecbdnDyEjEd4hayyNIwJOl9jhtXSsBVjre1Sq56d5zFpdlBqUjilv+c51udWq/WepTwDw3HfZwgqaYsVaCd8s95820qxcF6lnDPPZzzVRNd/esg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlyD+mTZhC0GzDECfykCTljwxFY9z/CnuCliirlHC5s=;
 b=jCY2CmStsXDrnH6yshbMvoCFmPhonjO0RkM1SfvTZbJFkVk6S0+XN5m0pyaOhLJ2pbrnY7mDbqGf+eOU0q8I7XVFjBbGLQDtNIsTdKTrOkDL70ibOHTMpSZJhQR+yVwf3xpqwhUCwuFr2BG/0SLM7vdLK9d5k1RnjLsimrzJ5l1/37gcnoQp8aFInZuxHs4atVMFJNavttyAOfxDjGAHFjnNthbGDKKTBCEWJadwrhcCPiPvMmRJt81GGxZ0xtdxdwwpsQ/QUn5UYmLA0AfaL/ICur64/ytDZNfE65dSgv47OGeUcBzrZdFXrjnZnKa6G36RashoKH+gULur0mWwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlyD+mTZhC0GzDECfykCTljwxFY9z/CnuCliirlHC5s=;
 b=bln6Av7iWlHu/QzEsMXY8q7d/guNlwVveJ4S8iPQvIErLzwyfZrDTlI1JM6/L0o+AuvMK6gsVNBrP2iaXY0ypIl0bwY2qjTbkVSzhvdzQsTLWtENO4GpCak1Ej42pNybnypergjRJT3Uip5yiG/u8brh+REbyvBaZPR57GET9Bh1JHHRTkuuY9dRznDUNULMWpUItt00ylx3MawPuvcNX+alig61GsGb9BmaIh3zhAJ5EgPN5hI9fZBpDimoc2laiMIAVc1f+qjSzprhvNbl1eHXp5eTK2Y6xBQ7v8u0OEWFmh8t43TqfrxCh7cyyjHidxIK3LRVbp/s4ryHSMeyfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DB8PR04MB7098.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 09:20:50 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%3]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 09:20:49 +0000
Date: Thu, 10 Sep 2026 12:20:46 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: vjardin@free.fr
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable+noautosel@kernel.org
Subject: Re: [PATCH v2] bus: fsl-mc: register the object drivers after
 misc_class exists
Message-ID: <biinxck5pqrk7yyypw5vxwdz2qwluipkinssfg4m4ld3izismo@jjpune5ww555>
References: <20260909-for-upstream-fsl-mc-initcall-order-v2-1-b7a04634fcf1@free.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-for-upstream-fsl-mc-initcall-order-v2-1-b7a04634fcf1@free.fr>
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DB8PR04MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ededeb2-fde6-48ce-bd4f-08df0f1ccdd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|376014|366016|22082099003|18002099003|10067099003|11063799006|56012099006|6133799003|15866825006|41080700001;
X-Microsoft-Antispam-Message-Info:
	dWW1SNleEdfkhHLU7zQxMWcznP2ODCiHHUXRu4GWd9KcKHFOAYss5GdbJeRo+pwDrV/+M43p/3r02E1u/eV/mRPfawLDuq79cuEghgir5lG3vNuIoeiKDVh/SJEEPr4lbib8QhQAUgWZ6xLtJfJO4fq0gx/In77l9cvj1OYQx+wpWJNFA3FU76ar6tSouVZCpeQJqznOpm2sAhr1O5JOBMxKIaC/vNlVjcEgzavmLWd82KGdSit5/lZyjMip0xLHhA8Tj/Nl4BKt30F6ZKKVNNRIqA2p6ic6X3+qAy9l8DiQkCStNOxv3RNT9pmxYvkLS1SIOzsAQYACepcB9E1WdzdiE/PXFfN+Ew4Qdnvn+WRlnLdWytNtCcIY8kbHUuthmBHEsJ+996nh7KHxjS4QG+QEUw1F05FxuBT664I+dJnRksdDBAv6aOyjRnW2R/mSjIKddQ1Kw7RvWX0b3/Ni0x8bIVK02+PJYmPnq0ro+1oSX2CEAtejzFKNElJNBUxPCZiKy/oJwk/L2VVx+ooh82QZ7MlUU5CtV+LbeCOtkMi+mXZbSWJVnZ+piErvRPqH7THTUycK4b1NKa0phb/vyuGTZTrv/Jvu07ti6q8ZPJO0mR4iumwaA+Pqz0GoMwGMqe4dqFmmucyiD/BxwgwalFa153DBcLC/3DSrewsKDoPbGv4FDYhm+6yOeyFhUPGJo1lImwHI2/3h5HOv6SD1tigJr6SYVtXyVk4aCaBh5VuI9X747ISXAajLVCjysyUP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(376014)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(6133799003)(15866825006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?caJmtbap1njoS15zVu4uDxp60SUmfbPjrcMQTjwJDkClmLd8tFF3eEbwljqm?=
 =?us-ascii?Q?YErEcjuv4KhAmhoRurrdd3BKlI85oTljnJ6/rxKb5TYR+ExbaxmJ4w30sBgD?=
 =?us-ascii?Q?dZgwV2Bdcqg9bSPT6Oww67qV1c/zFM5VtHxxlR9k2rmQzQD9ykax4J6Hepvq?=
 =?us-ascii?Q?+F7yAoLBrhmBGYc2d79haDAVyeqp81rSFpYP9n2WEB43f5gX8yKIhyKRVh03?=
 =?us-ascii?Q?XCVL6Dv4o5pdRgVMN1Bo4UU9tQRLBg4iX9OPp+q8utwsYY8tnA4tTbsLeM25?=
 =?us-ascii?Q?6Tw1Umajl5dgoSY/NbPR+vJl96Qvmup3jmCVSmltO9qeYpp6jaXT8AgqRx7j?=
 =?us-ascii?Q?8Q4/Gnm0PXh/CCVhoRkvC8waSzsBInmE4vMqoSSnypFgSJqLWwYgXycm3Jty?=
 =?us-ascii?Q?gGlipgq1IWRaUSyxiR3ZCo/xyu7OxMvdJVjVW/86Zw164qS8zQFlT17CnIXs?=
 =?us-ascii?Q?Eafj8mlbFIgiinq/uO+LnOnyuY+ojxtdfZrkxDx9dr+VQWnvzMcU0CigJ1tW?=
 =?us-ascii?Q?UHyi0SdxbdcK59kAPNi7+IOTqOUVxduVgy+8TnTVjkS0YvZNTh7qFF7LGOZj?=
 =?us-ascii?Q?q3pXchIob7P/RZcKXO8JLDJ5fvJQkgHzfUvLa/RIiEMgKutZtm5C7LdwwpD9?=
 =?us-ascii?Q?4h/+8WcP9LHlb3pkot0DBjBVem/k3o1g1r9Wyv+hUA9sorgC/JVvdEyNtb34?=
 =?us-ascii?Q?vOqfuWrj7VlYKF8vttzYiY9JVjHymiS7ImvL3NMmI0KWgU7JZXWrL/kL2aBs?=
 =?us-ascii?Q?Bx694jAfRdSbq1EHBbGwQ7qCWIhKvdYieaB25U14rEn0OOeoyny+VjRBZeBp?=
 =?us-ascii?Q?EDUeqrs13BcKjUHC2X9m7vqKWF8ETNxAty+TLlQx2rLPas7Bt7UxkzqNtBQd?=
 =?us-ascii?Q?wDKie4pahlsI6CW8GLFk+rQ3vQtD/+U8T2JGavyTq0a4utx/pN69TvVHodaG?=
 =?us-ascii?Q?g1dd+LU/ImEMCwKfPsUBZs0uzmo8hIhru9HrvonsW9KGCuMETvP2jiNIJRYb?=
 =?us-ascii?Q?WhxfIXj25fXOnyrK7UTzdw4XcR7MhPn3gJH83FXkE3A6H6q2UM0L6xZky9MW?=
 =?us-ascii?Q?mis65i3YdAWjUcvPMqHfnR7zs/pF24Aw85iL4xCDGhTyY5vMtWo8QOoko89+?=
 =?us-ascii?Q?k3IySBvDWt4oqVF2cdh+To9FL0++OdvQLu1asQ3iavJcNnxFZonRa+ucOeo+?=
 =?us-ascii?Q?kBsJX5NsbBwGru3dCQL4LDMsRb3+dt5vPy/SIfWxLFwD947Mf6Ru1e/td8ut?=
 =?us-ascii?Q?pXB6wrg7p4UAoAvU/os81eyaa4uGapxo4Gn0fNB8Y2KRPKBfzlV1vixkp/DA?=
 =?us-ascii?Q?4jlZJappFk3QyybbhTbI4ljBXsyOkYZwwSie2xiyAYukK4l8fhs9T5kK6Noa?=
 =?us-ascii?Q?AWp+EezQkQR6uPVnbXj/hhKXEz3Ihfy5Cdy+wh/LjyqtcIQkDfPeDf8qzr+H?=
 =?us-ascii?Q?FkfGg/Z4GF3bJPW1hRdxTMpONAblAojwQFVKZWiNh+aA80sZ1fC1iM4VgtU3?=
 =?us-ascii?Q?KA84cgxwTgvqviH+g0MZP/oNgTByAAJ1tnN2rQGziCMUe01SkVMGcHvopbz/?=
 =?us-ascii?Q?Rn3GE0eoFeJXqZ04UMMSGFL/TJ2wValoMbpA/AEG5bH8Yc3/HX0CaKwqe3EG?=
 =?us-ascii?Q?5M5s6JZULSjx1Ir1jVZmnANyIMqf/u9iLrEIaqLnefq5O2HlRC8arV14L2Xy?=
 =?us-ascii?Q?J2XgaQAM3xzpJsMpl8V2kIXRlxm4NiVEGmTLgra8S0MaD3LPVkmALzN8VWod?=
 =?us-ascii?Q?gWuVy1vc/Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ededeb2-fde6-48ce-bd4f-08df0f1ccdd9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 09:20:49.8133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdnulP5hVaTf0RhOW03DsR4E0txOy7RlBdJaQ4XIjh2z4dtAvhjIX9Vc1E9V6jLNILWlThLDvwqLvVaV/VZ+Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7098

On Wed, Sep 09, 2026 at 07:04:40PM +0200, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Unbinding and re-binding the root DPRC fails with:
> 
>   sysfs: cannot create duplicate filename '/dev/char/10:256'
>     misc_register / fsl_mc_uapi_create_device_file /
>     dprc_setup / dprc_probe
> 
> It happens when the fsl-mc bus probe is not deferred, without SMMU:
> - the dprc driver is registered at postcore_initcall,
> - the DT node is populated at arch_initcall_sync,
> - the root DPRC probes right there, before misc_init() has
>   registered misc_class at subsys_initcall.
> 
> misc_register() still succeeds but the device gets
> no class, so misc_deregister() at unbind cannot find it:
> the minor is freed while the device and its /sys/dev/char/ link leak,
> and then the next bind collides on the same minor.
> 
> Let's move the dprc and allocator drivers registration, and
> platform_driver_register(), to subsys_initcall_sync, after misc_init()
> at subsys_initcall.
> bus_register() and the platform-bus notifier stay at postcore_initcall
> so that fsl_mc_bus_notifier() still pauses the MC before the SMMU is probed.
> 

Thank you for the updated commit message.

> Cc: stable+noautosel@kernel.org # niche: root DPRC unbind/rebind only
> Fixes: 2cf1e703f066 ("bus: fsl-mc: add fsl-mc userspace support")
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
