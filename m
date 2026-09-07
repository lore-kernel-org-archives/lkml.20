Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013055.outbound.protection.outlook.com [40.107.159.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25154348C67
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788750035; cv=fail; b=Yd4J0PWrv64y+UJZpCXxO1/tbUuVoFJTDett9zZZfEqjKkliPrqL/rfM/DkUrBqNi73zM0ys2ZbDFFo4WjyMY135ru6atIzwnMi7l4zXv4MJtHjCDFSXqNIS9M+4+Xz5l5z+VYx0O7B//SQMocQbVKBiHLFORu4SxEZbY2vJImY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788750035; c=relaxed/simple;
	bh=NoX8kyFTJE3lGs2VNDiTWFDNgLU+Kj+EyBITOd2i3GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pUalXsBdlTcWBChTRWVdtHJQmyAky1x64CkB0BtbxMrVavH2HgDWyyb4COOa8MxubK3Z1bnazXt80HJt6omXZVpEUoTw7wBx3S2LJnIbk0m4WfNWAD9B4XCFvE7ntw7RWqMVKMBJRHMHESEEJBUlD5o99zcP97S3N2zWcsB0ck4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=THdh2oTW; arc=fail smtp.client-ip=40.107.159.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="THdh2oTW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMpA0P4lIdBkyC4fW8BQyvz8mN0cMm3XYv4/LX7fpaQMoZxoLef7gwdUix/EIj0a/VPzsWAQDfbcBw9gZGDleZs8Z30nZN9eh8j4ixkVNrrsoTtZVw2fAyWMkYH5AGiUcvQCnS8pSssRJdwiAYkRBEwl4lQZzVqQOCG7KJk3OreMmLNoo2CO18/ltjIJp4owCRlFHUpzCjo62ssAgxDHIWaCQxcqrHFMgiO0/KXq5t1g5sU+vIxWWYKEtb4jDipXBC5ZX3ra5L/MBhJaRM8Gnm0eYb7hrP+azIZYxQ1a/5Tmhb/FbhASTB9PBdsZ4SWv3ugRmkkt0g4Ad3gSFcd8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbNb+Qzr3PK1C5ohgw1Hui4kiO3cBoNesZsZG7+HoOk=;
 b=G7//vNY8sTYfX8nO4ePkkDXKCFFeyqUKHCK6gg+FC3utnCZodyIeO35bKs/CGmQE7pGQspCOHd0c2bgdgrCuSU5Jk72MoRc+13cutJAhxRdFJ91lBudjEWImuw8HtDNZk6UQcEvZC79CNhZqGc20tPRFasNN91ybtTxu/p5H7NvuBXoHSE6by/GgR2ioVXd8U2JRb/Tn6kLUuEkgfH3VH3IQ4LR4MSuNoItjAukaULqlACSbEZnazVZH2FA1jHsaIZKVxLZG2n8FPdRtM3Rv3DWyrvGvKXlYD/fQMtmjYb5ToqSYOlzMMEWu+OxMhzcoPhCNJbvLrblWiUsEnhBX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbNb+Qzr3PK1C5ohgw1Hui4kiO3cBoNesZsZG7+HoOk=;
 b=THdh2oTWPusoPQdI7vCplAlaVtMThtU4uRuA8vsWWKlhGO1c/rLNMlL8UN45CZQMCOrJT2/rK+sQ8ayo2nJIUin066xAQcvfyIXKzS1og1/c85hHdz85B9lb3HKEJMuytjmxX0i46wbSWBqh8090dSGqkOY6+/qo1njBjCpm4qVT8Ivq5dM/GtsLBeHqNSzvZc72YmlQgYMH7Sr+Y14OFXWWqE61OEQth+C2axUen+Ui3lYLzKMDuTN+Vv+kXrU9/mbC/wntYsSntFBt5qY87jUOO4Lkmg9TGIN18ObiwaoooFselboCQQthqFIHHbrJAygNtlYz+grq0k7FE9AXEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GVXPR04MB11689.eurprd04.prod.outlook.com (2603:10a6:150:2e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:00:31 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 03:00:31 +0000
Date: Mon, 7 Sep 2026 10:58:11 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Miles Krause <mileskrause5200@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] extcon: ptn5150: fix fwnode reference leak in
 ptn5150_i2c_probe()
Message-ID: <mz2meaneigtxxyvun4qqsh5vwpemndxoi6k5pipdsf3tnmmocj@yodu3uz4yedr>
References: <20260906-extcon-ptn5150-fwnode-leak-v1-1-42c2ff731138@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-extcon-ptn5150-fwnode-leak-v1-1-42c2ff731138@gmail.com>
X-ClientProxiedBy: SI3PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:295::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GVXPR04MB11689:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f70cd3b-7b39-4d15-10de-08df0c8c2d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|376014|10067099003|22082099003|18002099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	PNGK7FWtunCdsN/lubCAzU5th33t1gtVhGcOocvMCVbfqvquWY6esRAdWOKvdhmFkrXQeRVAbX0IQQteK+5s6r7wV0vBtDKixgpPwIlxOXslPVulkWf0JnM67LMp/sitwSEFLRTr7AguyNySsOW0V2EsoM4OZ0+MZNeOzHdV8dJIIeSJARL1ZCPuR2zniZrAEoQrw478ge1uOEjNnnF+epBWUd6yWqu7OCKTP/Yz/EcOoXtCLfOF+1bBw0ZUbMhwsi21hhdHficXr/3mVkhPgPD82VHFksVYSaxjgJwB8g6Nn5kMsddwKAQYRnnJ1zNtUv04rIFYK/uQkoezth20GyLdjix36IRecNa1B0RdgHYLciAHHAU3laN43tplPSjEjKBDnWT2bzNkGzQMe6Y3+MAuH9eVYTOyCezYjaMXn5hEdxjVDaE6PssxvM7+QPz3ArEl2jA/N06pcFafTDu1vApNt/rafGnJZa9DyvyZbB6+Yeqga8RZ2cm+FzVnVfLpzVs3hYyYLHb47JdPBpScJgeQrUIbaK2n58OXT5bX9Bfv54buKDSGQvI+u/gfVtrkmlKR6PAGxI3vR24Z+g4pKSCFWuwGU9gDq93bhZUt0BkBK3gXxtrfKe/t1iUfioIjA5/+8s59+y49JJ421c+19WoMhYgLwHE6rE+ZSJLUczA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mHSQwVdpHhWAQhqlXVEFqx5/6xlQR/CGiF5duDN0SGxZSoxn0MWnQW9q0Gxy?=
 =?us-ascii?Q?lOQyGstw4utqe7N/7lv+EmwFaLd+R4aRXO8+22hXntPQ+gYRxOH3H4XLMPZN?=
 =?us-ascii?Q?UWfxUb4Aq9476Kv3Cyyp0mCo9Ixvj9boSR2uJvsop7677ysJK+ne9Fo5d7zD?=
 =?us-ascii?Q?sunkBzZcwGJVt8I6tvscc+HL2SdBp51RFp5cz8NowH1fkTLsiJ3JF6sOVOFY?=
 =?us-ascii?Q?j6KJ6iNQ9VkMfzNJGtZTiQfT1cWYvyvhR4kAleF1jUkREzdE1tdaViNTXEtR?=
 =?us-ascii?Q?odYKo/wYZb7zK+JZjCPa0InZG9/TNB8vfuIkl5zDNLwz1glxNCW3wmhxF9Cn?=
 =?us-ascii?Q?URhpDXy6Q6ZnXIV+6+VXPh2Xl7WoKK5bvVLAmHdcCkMUQ3lyJBe481/vvP+c?=
 =?us-ascii?Q?pIkp8tzY8qAyT01n4IUfV3F47v9fcEDSsmD1LDNXIC52V39KGDQnrSnQ7f+z?=
 =?us-ascii?Q?t3ozvDOGnmvnfaBjd/DUu0EEmJNkdFuC4kRw6+E4Q4IxwhyyNyEbZic3LiXK?=
 =?us-ascii?Q?EKjTVQPkF+ELB32U8Tz1rx3dEGrF3VMXqze4gC0FDPorlVOJLAP+H9K8UjVK?=
 =?us-ascii?Q?De/cvYOOwUhc0p37YTSqhckr0GgiPQPkxnj96OdUqHX7SlAXWL7rlpT2C7oN?=
 =?us-ascii?Q?NX7YB87pmNTAUxGutEUAR12r/eAMcOqjfk9XCAb2pCfGOoHNG5CtMqA+Q2lE?=
 =?us-ascii?Q?YhzTWUCesQlz8EAcY9wlSNE1aJJbO/JoPeWv3zMeEsOWarH8RBxq8Rs2mhkA?=
 =?us-ascii?Q?thTU4hzeJKMUYcuZ13jF3kW6rNoAbbMsO0qcJ3kFGEIi9uyEUQb4kM+OteEL?=
 =?us-ascii?Q?GCb+7++BbS5sMul0rHkyuPFy8AOmcI8Ni5pHDRjSjtCnvb71fOIP8laAbp+P?=
 =?us-ascii?Q?Imr5AnkYBzNCqIPZqF4SvWSBWj3MB3gBDpuxoVjkU1PaBiQNNd+jnWhh6+iw?=
 =?us-ascii?Q?iWvYMh1gIHBHP4yxmeWE1I96as+jFXjyzZIG0Hpvgzr/iBuRoMNHJTqjbco7?=
 =?us-ascii?Q?8u2Yjtj99h0AGES6IVlx2kuCiB9TLHPiENuzHJ+daE3G6tsbycVLlhWwWe7Y?=
 =?us-ascii?Q?Ru8USOGEDZJ76Q+6UF5KWIpf+yx4c+Oa9Pk1eE080wzOnbr/FFNe0zHZzE9G?=
 =?us-ascii?Q?RXIwO2fc3K0W8GBiNrwBxBcWfOjFAa0EzQUJFH/Re2l6cbW4JUDObGdsDcIf?=
 =?us-ascii?Q?gywy/zbKK6hNmcwlHxkpmNlt8cxfIGXknhKMiN3ALxPbUibZlqG4Ks3LXfDN?=
 =?us-ascii?Q?FHw6dguWjs3k+co2Bq5Nu0qbND1srSojo3mBUitMDrd5y+0Avuh0xxNUt4cr?=
 =?us-ascii?Q?MtbVmVTRawGD83On7TZMA4m8XbwseQH+tXLp8B6fr/4HPaAjqX2vj5GYPSFL?=
 =?us-ascii?Q?baIfKZw4WeNy7s3N6EL6hiODHUDMWpHtITJYq90vh6ZlxcE+M/YFFzhGm0CH?=
 =?us-ascii?Q?Wj5Z2NLLguSgZzI02bf9jszMOoy5WPQuUyrazLYJ0MDV/b0mf0HBkIDeEgNT?=
 =?us-ascii?Q?B40e5F9Ikn924CSaY5igJ0nK9NSJoQvZpbh6JxV0N60GoEQVBu01CFMt3vUS?=
 =?us-ascii?Q?9Bbx57ztN7HCDSI0eSwco3VaNG2I/zFGNZaSUxFTDPvO0OH7kCIn4DXKztOG?=
 =?us-ascii?Q?TW2H1fy97hVd6fC7eP6zJpNRwyBYA2bG0WH+nhv8chL8+dvQbS9FhGN5grpq?=
 =?us-ascii?Q?liYg4qi6QTVWQVtQT0cx8IuEPKeiTOntzEgRQIHFGPEMCanRj2yc6+06iNMu?=
 =?us-ascii?Q?+D+M0qAtr++gzRQvAm4zHuum0y/uxBWlbY6iphPFv6wV839/8L1j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f70cd3b-7b39-4d15-10de-08df0c8c2d58
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:00:31.0354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjBR4RZfkZO8cYGM1plmt1y/QZ0Rz6o02DwkiOJy3+ImtNqDdlgkkDvNBNtNXYtisONQeSD2M2yph3sjyLQvHeL02YvbOklzAYvlYrbFcJ4FiUhVOsTAi22AQcKpQ7+T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11689

On Sun, Sep 06, 2026 at 03:49:24PM -0400, Miles Krause wrote:
> ptn5150_i2c_probe() looks up the "connector" child node with
> device_get_named_child_node(), but never releases the reference that
> the lookup returns.
> 
> fwnode_typec_switch_get() and fwnode_usb_role_switch_get() each take
> their own reference on the switch they hand back, so the caller still
> owns the fwnode reference.  Nothing in the driver drops it: the devm
> cleanup handler ptn5150_work_sync_and_put() releases info->role_sw and
> info->orient_sw only.  The node is therefore leaked on both error
> returns that follow the lookup, and on a fully successful probe.
> 
> Declare 'connector' with __free(fwnode_handle) so that the reference is
> released on every path out of the function.
> 
> Fixes: 842546c56345 ("extcon: ptn5150: Add Type-C orientation switch support")
> Signed-off-by: Miles Krause <mileskrause5200@gmail.com>

Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

> ---
>  drivers/extcon/extcon-ptn5150.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
> index eca1b140aeb0..ede38eec2466 100644
> --- a/drivers/extcon/extcon-ptn5150.c
> +++ b/drivers/extcon/extcon-ptn5150.c
> @@ -256,7 +256,6 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
>  {
>  	struct device *dev = &i2c->dev;
>  	struct device_node *np = i2c->dev.of_node;
> -	struct fwnode_handle *connector;
>  	struct ptn5150_info *info;
>  	int ret;
>  
> @@ -343,7 +342,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
>  	if (ret)
>  		return -EINVAL;
>  
> -	connector = device_get_named_child_node(dev, "connector");
> +	struct fwnode_handle *connector __free(fwnode_handle) =
> +		device_get_named_child_node(dev, "connector");
>  	if (connector) {
>  		info->orient_sw = fwnode_typec_switch_get(connector);
>  		if (IS_ERR(info->orient_sw))
> 
> ---
> base-commit: 88405f0ad1d5c680afe3ea0ce9345fa9e1deaac8
> change-id: 20260906-extcon-ptn5150-fwnode-leak-81c395149a9d
> 
> Best regards,
> -- 
> Miles Krause <mileskrause5200@gmail.com>
> 
