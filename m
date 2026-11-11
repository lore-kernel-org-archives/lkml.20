Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794425479;
	b=TB0Rg6lxFAEcmFyW2Gb3ReRARquKcY05GPwmDewI+ExZDgiBuFVrlaLcsN9ZFIXKkAkO
	 zEgQOd72QC8yUORu0Mn+cFt+JtSd5yiysVX+z4kC/H+j4XXrsnE52Fd7ah/Rqub6AKzQV
	 6KaRHu8cMNERTFWpghS0o+r2LG0iTQW2rrCzhucssvO8zzbB0Y8nq6IDeArxMu5Ze5mip
	 w6ciAs828ezJW0Nm6MsJHTNQUU9JfF4sMipFYhXsuMIySvO21Y9B1/PafIHekrUvKv+MX
	 0hdphD6YSncm9SV+Xdpt7v50epLAPbW+MeADO/N9RvrJTGpwqmcOr+eZP6YhVzsN7GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425479;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=z2nIEDK1cz4fspVcqEmCho3hRVDKFyX7BykmpsqZ7vc=;
	b=IGMbb3hojm0dHOsZ0jredOZV8VXiGhajUXrqQmRtLZdRjsLsHszCaj0sIbFlWecJsc8Y
	 2i7IjB2dTfd/52vq28U1fI+7hkDgJvmEXsllyr/vVv8MgHlEHyhI4JlHkYIbf42cKUe+p
	 Ht6+StVy8v5mNy3XKZEYx3oIqazlDZoWyvEUct7I9uzoO5vzTpFHywOmzdGaHi3U0yeTb
	 x3Pp/gTnOzbpigg8KarYfun95j9NflrQeO+QVu8SCzLWv1WKOSMLidqLtjXxlKtW9v8o7
	 +mpkDb6C5IRdT7MlePoCUPd0ZaoE0pQouibQibAmmv835qvveFICg25DfFcAiQCTtzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hRhYQ2Oa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.57
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBE3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hRhYQ2Oa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jx73jd0vf9l0E+S4OJ9Q38jVm4XXj9GNj0lpYJek8nXMTfA/2Pg+ICILDmhtHtiP04iNau5e1Hg9HcJgAkpaEJOfiYo5iurS1JzsXIl9wETv6BiYX0ySEIIvJmagdjA+tZIFzky767YWIjEfpsGLtcViuufHOxAB5193UPUaRS1y6+HNKDs3Hx+eY1DOfwsLctZlemXpI46vvVcJ0pMrmsS1rlSoksn3n2NzEuRH0RuhJuTuGKwjyOAb4kg6VOY22YZK5hNDYkiL6iRE1e3Q9opFW/gz0KXbvuhTclpxsSLmRW4Oc3oKcXKf1L+YFkT/kjjUAi9T7nhSvYyysnMn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2nIEDK1cz4fspVcqEmCho3hRVDKFyX7BykmpsqZ7vc=;
 b=J4sFXEiz5rKkkkRTjX3D6kV9sPftN0mbIid/qGRi29dMazPsM9MrtU+OBNf2xTg5Ew/uao1+tzDkB6GXYIfZ9tLq/rosIT2SsVHZddzWOhEVC+q7pBcoP5HxPijFDIheReiBkFXp/nZFNU5+e9zlRW/BisOj6F4N5fL5D4lmzzT5MNhl5TsLsfboiMu+g0Qp8fI0iNUm/K8JByTes83m5Hbik+J2vGvmbhaQGwO1cw1dd0WUrWGwC1Ggd4KfRIhbZT/9zuWlRkBX5JW1mAOihz2oq5YVPQzM/m//815OCSTCEhtqCTw+mg6Ow6LNF7ZNByPDMQV7i/QCSZ8VzpjEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2nIEDK1cz4fspVcqEmCho3hRVDKFyX7BykmpsqZ7vc=;
 b=hRhYQ2OaqmuiwkSFCCqkLV30Ho2YT2dlEkfOV0uaDgUvTWFBhXYivfu5nj+lBv/06r+E1hvPNv/Yrc9EAKhQ0Qt7zsbOg4l0/y+vkX1ARKyj66NMo5BhAjLx4lrSQQQlFeHuY0+ES8iWM7zuxb57qSERx89kICg3hNoYizeUHtP0gXVq7MoxKIl5L8Zg8iXyUmwZoHeKE43aPSohIjtzhV0irHtTMDMDC+zFJYugcVk5wE3++ZOU8C2GBkWPnIAD10H0B2mSaTBLZlm3ZS2Kyj25Yf6A3T4pzgmCUpQWU78Y7Srh3EKnnShZZUB0IOnZU4JZipVoHKDJXgwkh/MqHQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB4PR04MB11279.eurprd04.prod.outlook.com (2603:10a6:10:5e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:31:16 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 19:31:15 +0000
Date: Wed, 11 Nov 2026 14:31:08 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH v2] i3c: master: Fix fwnode reference leak in
 i3c_master_register_fwnode()
Message-ID: <avTCfKlPM15hvmRw@lizhi-Precision-Tower-5810>
References: <20261108092920.314161-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108092920.314161-1-vulab@iscas.ac.cn>
X-ClientProxiedBy: PH8PR15CA0013.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB4PR04MB11279:EE_
X-MS-Office365-Filtering-Correlation-Id: 62122014-c49a-4be1-7edf-08df402a5a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|18002099003|22082099003|6133799003|261009223027099003|56012099006|11063799006|261028144727099003|261102123227099003|261026140227099003|261022075727099003|261021121427099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	IxM/dqlnetUa4bvtrYYwaCehSvuQCUwO2B8lVnUp045/kBLj7bC4vcFhUeAj+z5+eBEl6dR30tL7pfrWZ06tGuw4zKOnS9hkVJaL9tukE+/cK7sLjgDeBi24nbuQHrL5M/DzIpAm3a0lKJPpA2YGauFD2p4GZ43qGNmy389+JaRu0zHh1Pr8iFkJrgMIk8ECpySu4n5QRCD5nXc50qeDLWkke+H4YTYbMw0su/uZ69pNpJtmpPlPzEbBr74f6IFmF1fvSU3DFwrfzCGsRhJr18Ppv4fBCfuRXWCuwr0MxVJAC/OCqc64aI0YjAnN2qmqVVYc1vCIzFDJ4SnsN2oPQZmMgBM9k7lQSOhmL0b/5PtWi7u43O/7f6K43TPbL9dAxIxEi8qLWyeUKxtujiu95NyfCNW+sC4LH8ax+tXpns8BQqkXnLrnYn1PgxN70mVa2qYKhcy/sAS0F7EJBbJlYWShto14FOD59h4myOtGgSHGu/B6OHtA4Hxka2PLb0vfEvX5alT2CxoOPQyorFC5qdM/tM5qwiTRPA+zZoQHvXxkL724wK4VWdS+sRzJfaqkOp1g0kODmTYebdem0mmjMnRgJEVI0w4+20ggujBN/EU5cRUIvoTLynYvGVoJGd7k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261022075727099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ty7vkAo6ycxWdMG6ipUgyVnCcYtCDTJqVkHWy1RxRC7oH89kf59KbH2RIAnT?=
 =?us-ascii?Q?hE+vPw7+t2GThQ3e0bzBhTgh4R4phMF0HBSzee+lNjzPV/O028taPrNLr4ny?=
 =?us-ascii?Q?Hd1LzIU0xuDPpdHJj8S8kmrVXIZ2yMqZzsX8n99i4j1CrXmJ8VFCk4Lxh/9X?=
 =?us-ascii?Q?1oHuYIBa8soFBbeJQG/nXe+HaGCBaZ/hXqC8EIHgEBPkvMoQLog35LcJWqw9?=
 =?us-ascii?Q?eMw4NX8QrlkWqjK1l0BqcGFJ1bdJcxRctbhXUswoQfL3s8hFOjow0A677CX5?=
 =?us-ascii?Q?/jJlYrfuu4YegoCpdqayARYDgCWZp/ZxuO0BD5sjSlXt56eZoNNIXfLZrDay?=
 =?us-ascii?Q?8NmmO3B8zYhxNyP3gFlF/focMk0SgEeZG6v4IbC0cSfcJCIw1CajxFSSSLWi?=
 =?us-ascii?Q?j7c8Hx6j8hSbr8jvz45xEjMkjC8PEzE4a/icSd/FGWtSlzDm72rmsYrr2Tju?=
 =?us-ascii?Q?4CQESW3ANAPtq/kr8ckIKNnEgXNwbOZtDzhrxmUwJEnsrhc9FWeoWlIVE7uh?=
 =?us-ascii?Q?SWoU5/TfVkb56EguxjloewpbBsxpBphoK5gtI0A/T6NMEO8pYKba/HalW0Nq?=
 =?us-ascii?Q?Nl7FVndPqBaMzahEbeX8g+qXpmiJYLwlFyJMKdyzOhTxl0FpVyHb/t4cqfor?=
 =?us-ascii?Q?I5khw+PrDhe9KND4FcqPaDThKJQzdtEROK+JJZPTf0ymn+OIrx2miilpjV2m?=
 =?us-ascii?Q?mrLwq8BWGkZ7kt1ea6Wsw7tCtSas4NW7j+ZSoFU0OJQDQeYN+Lz2E9R1bUmk?=
 =?us-ascii?Q?qgIe5xfXdgbNuS66L6SvI+QigI+g+s7kw+eBZ6cMdjrw0pK2JOEX0TjpKrNO?=
 =?us-ascii?Q?0c4fjGOUplmgWFNNTSLjbxbtMJHekVSOhVjdvRfeeqp8FCw6Unit6E0IDbFT?=
 =?us-ascii?Q?aRiD9jUEo+b4muoz7X/yEAgbGmOf6TcufnVH9QnqTEBjWDYVvi3WxT4NBGpr?=
 =?us-ascii?Q?KHk3vsv/kmxsx4APW9V2eQeVrH/30BTQIcNtjPMuHS2ay+cTioiS8OnzmAKl?=
 =?us-ascii?Q?9qZ8e3rp1BZLtoxG4BN4Yu9sUqISPP5bkG0mqrR2qGRF+jCE6Sw5f9IlFJOJ?=
 =?us-ascii?Q?tO0HQ2hfw2jvfE92RyoouKRZKJiFSZZDE0u/5iPTQqGrrUsb+E1mZHsR1wZ/?=
 =?us-ascii?Q?uemWl5VLmfJ1aFU65UHbNy/ruL3TlLBQRoaskVEl3XMZUk843rG1xwm1TscD?=
 =?us-ascii?Q?g993c8jVoYUFk0A7NA618SGChmWDX4S+vrJWa6tDx86JshAloZyPwyGz2uVn?=
 =?us-ascii?Q?TSmF7hG5S0B9Mbmk8tIoWPCU7vYPypFpA2tYoClNwrPWAC9p05+EAYl1OhTz?=
 =?us-ascii?Q?FxmJ/wS25g2ZrDOJiotdeIRAif/zaKAD9eRqjaOpVOn/H1mzrHS4Kn7HqOC8?=
 =?us-ascii?Q?M1glOaV8/hjK1qAfSaLEAueXu8s782zGJ6IDmuH4hemHliEyJl1MnI2+woI4?=
 =?us-ascii?Q?eUElhPV7ssds7giBZJMHQQOY7aL9Y0sabUe5afzezguJuSHayjqF0DR6gnX/?=
 =?us-ascii?Q?/2y2bKN6D7icICviv0Tu3I0fG/xGoXAeVmzwzg2AfVnppDC1qE0h8SlZLiK6?=
 =?us-ascii?Q?lQ28KpXwwhJkhB30hXBZJzACtgf9RAGE6Tri+zH7GRXb7swJ/AUJ2G958AQh?=
 =?us-ascii?Q?admEoE8OGWGYZxR3FV+DhO/PTZ79F5196pTpbCEqQ5GKu0B3t4nD98u0A7DL?=
 =?us-ascii?Q?sAxNdvDultA2nCJ/eC9vbgNmuq8Ztx6iNlOndPZW2ePWVff2un43sdhLcRxV?=
 =?us-ascii?Q?C2sjBQibAYwv0AJSIfBtgchwm9lIGmFh5vAlXt0auq2EbYcAloC2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62122014-c49a-4be1-7edf-08df402a5a53
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:31:15.9061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiuBCoHmYXSStqQe+//5SsSTGaoK8xCn/UL7jMyCgSdcfNGt1m66QdNV3edSfcZxR8P0G2EashH2o0trFLFhiiWHgMSaT2TPWD7ksgfTlpj2nH1MxL2eUzIoQC4NeBbJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB11279

On Sun, Nov 08, 2026 at 09:29:20AM +0000, Wentao Liang wrote:
> i3c_master_register_fwnode() takes a reference on the bus firmware node
> with fwnode_handle_get() and stores it in master->dev. That reference is
> normally dropped by i3c_masterdev_release(), which runs when the last
> reference on the master device is put.
>
> If i3c_master_rpm_get() fails, the function returns before
> device_initialize(), so put_device() is never called, the release
> callback never runs, and the reference is leaked.
>
> Release the reference explicitly on that path. of_node_put() is not
> enough here: it only acts on Open Firmware nodes, so the reference would
> still leak on ACPI and software node systems.
>
> The candidate was found with static analysis tools; DeepSeek and GPT-6.1
> Sol were used to audit it and to help prepare this fix.
>
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> Changes in v2:
> - Sorry for the delay. v1 used of_node_put() on a reference taken with
>   fwnode_handle_get(), which Frank pointed out.
> - Use fwnode_handle_put(dev_fwnode(&master->dev)) instead.
> - Rebased on current mainline (fa4ad798f6f6), where this code lives in
>   i3c_master_register_fwnode().
> - Dropped Cc: stable@vger.kernel.org. This only leaks when the runtime PM
>   resume fails during registration, so I leave the backport decision to
>   you.
> - Build-tested with an x86_64 defconfig, including W=1: drivers/i3c/
>   compiles without warnings and checkpatch.pl is clean. I could not make
>   i3c_master_rpm_get() fail at runtime, so the failing path itself was not
>   exercised on hardware.
> - Link to v1: https://lore.kernel.org/all/20260916160358.2081087-1-vulab@iscas.ac.cn/
>
>  drivers/i3c/master.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 01e05bad8661..c532693f8463 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -3897,8 +3897,10 @@ int i3c_master_register_fwnode(struct i3c_master_controller *master,
>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
>
>  	ret = i3c_master_rpm_get(master);
> -	if (ret)
> +	if (ret) {
> +		fwnode_handle_put(dev_fwnode(&master->dev));

direct use parameter fwnode

Frank
>  		return ret;
> +	}
>
>  	device_initialize(&master->dev);
>
> --
> 2.34.1
>
