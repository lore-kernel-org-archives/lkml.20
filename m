Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793931566;
	b=BrfWCaKGm1K6vQMUbCMc1H/Ap4arkUXxJ+SCyw0olI51mpA20jp7K/TRsIAzKDQWxbPI
	 Py9XaesOj8ve7GOI0oGnNl5wD3Lp3lkEILYMN/WdDl6It70ef5D79+en8c5H3YmHVM48V
	 hl7m8fL7hjAFl2dmKVFkWyaz8AtzStdcWOkqUxkCcm7QZPNwI8ceom5RhaBI3J2/iymLZ
	 tBPiK0t8GDsfOAR3qhlUFs/S5/V/tzQtV79ljrNkALHfFTqEzq9J/+owVGPpbveklLuqG
	 F9BkJ1rdhVa74hrWHKcDagCi0xbSbXrl35DGGc2PsApPtEGQ8qo04jJV+GS1Gw9JSsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931566;
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
	bh=JA/YyBuiNpyNvdrfjh7ooRPl4VQYNT4706tLbHw6hYg=;
	b=F1jiUM5RxmQSLjnZiZLh1UhIn1hsRAD3ZUc+Y9FrFK51edtq4wFFpHmIIs8yljojTExn
	 u6Zg6ojPoDOkSPK4DQSQhIK8wgeR9BqL43/sHn1D1vpgJ5VJ5/SR5XguWUbtlxD5ms5Dq
	 pFmkJRtWXUGnmWpp+PV5g9WakQUiLIRerF3PCQiYL/nUh/BLmfao4roycnmZxHp1tsOqj
	 oHjRDDA8dG8zgTVNovWHB9WWivYRPqkVHYv/0034v7YK76dCII8/Bh0/2l41znAahn/Z+
	 OgNokrFLVklwGv5APWbgwFoy/PBpIu0EcgBEFVRie57dfKE+45WWI8hKUOf0TxLnw0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iwJqvovk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.3
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D860D606A326;
	Fri,  6 Nov 2026 02:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D860D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iwJqvovk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJkd1iOAyXWOf2VtnMJ+AX3cL4tHQFLPkKN+pqn6XKk74JIix21gxlUvRTExZHIZyuBpbaVJ3JfDsRPNB232WELyirSJqtlxDPXDB5XfzSbvVGqy+nAW8E2yq3leCeNoPs4JqnvEPF4kPJkCBDv25Onf5XS5F00XbLMa84DdHyxYkierdVLzDcssER4RZxJ0Ik//RaU4MSSc0hQip1txNpn9yV8yGWKIsohafiFkTDmfkX1aApI7ePRlEtcY/bQ6ZACNvwqCglfCyEEucSLA9xB9tMdJAtp+IKvPsHr+wzp41QXRHki0eJS6uYs2X4Izdka9sgvKF/9yRh3sy/cFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JA/YyBuiNpyNvdrfjh7ooRPl4VQYNT4706tLbHw6hYg=;
 b=fo0kUkGrT98bOlvbLF6Nqf95OVQUgzbK9RYECjsU84DR14i7Yl+XAz0nCUXA9rVOsIsfmupSCQk2s2o9LaGSZ1Y9MtmNA5NvDtPOOGZr+bgAKAFCMwSZSwraMgjeEYFYp29w776wOPntBKtZmqZ3I5w3In2XVCuFVpZyUIXRmfrgJUNXhhTRWFbCMzmlZdy68fyA6CfEUiCzN2ed2nTswlo+l1qWPxIE+8aWPSM6hk+8Vij6iLM/awsRnX8gguscAuzPeyOSxP40MItFL4Fu2vrRDBgtVksRWhj/mZWihpvrM3l2Rw57demzZsO/5HbJWWOJq5wraoCTetrmkkf0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JA/YyBuiNpyNvdrfjh7ooRPl4VQYNT4706tLbHw6hYg=;
 b=iwJqvovk/T29ptE6S5b5j+v+E/jOV+nwHIB3uZZ2KbXCFOFNZsKBwzgOQtu7xTyrHST2wFKCjEKYB68hdF0LMQD+ncYCWXK+xjdkhofEfaxFP0G2cb59F7tKrnMcKrZdSn4NRh2QC31my9KalV3DYmYOs7d4cJoDSmLfGzKpNHZ5We+lkwPjhEYkcJK4/r0kucWK5t8X8XsrMoIp0a5X5+WtR6h5vz4aFzofesGSYnkl4rkn6dUgV8yUvbKD3c/A1lAO5gkT3OATunfD7feAGm4QRji9e6zQY867PM7t507wEqR83/Y6nBzqmHIAxsn73893CiMfM3rUY8uXNCBlkg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8548.eurprd04.prod.outlook.com (2603:10a6:20b:423::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 02:19:23 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 02:19:23 +0000
Date: Fri, 6 Nov 2026 10:16:24 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux@roeck-us.net, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpci: free IRQ before unregistering TCPM
 port
Message-ID: <bklsnrvgleshngfc6vpc5kzb3feaxbl4qmaoti7swky2yqpnse@eyboedx6duxf>
References: <179378589227.74015.8259496684787732118@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179378589227.74015.8259496684787732118@gmail.com>
X-ClientProxiedBy: FR4P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: 25bb1387-bdd0-4de5-8499-08df3bac5f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|261102123227099003|261022105027099003|261022075727099003|261009223027099003|261021121427099003|10067099003|261026121527099003|261026140227099003|11063799006|261028144727099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/ckJVh3LaINjKbdeFh2wLGMwOzMWioINih5X02DdNRk/kew31ZFT7f4kZk5eympb7CnWBakUCTAOr4uDBs1JXmMXBxkL6Q2yzxHYaJORiNJ7RZo5+3qrcHK+jP2CC3z65XgSGRp8OU6QoBqgTMWsbmopOEQqHBFIUovNosE0zJu9MaFGLuFzeBHIdeA0GPjdRZgzOvf/U7MWGgAOMGNu7dN+AcsmKRbUKNVh51BwcQlM4pCyNJu5ObE6FY2ER4U5XddHEelZhfDVUmG9M1hfx8THP9PCqxcHwyzwZE1il0/xdKg3tni7TaT248DSzxBskt5yRAMjaUKcjCAExX6QyBc5kY5HdybpoiwKUUtujW0JdqtJgQESrAdgCf8Epj0I6fJhFKI0KMLrLnvlNdR0UoJTokiNyvJfnC1RWWDfmqwWGntnlBSasK3nE8onSQ88z89jiXRxdeMzjNQV0UJMfWb6zmQH/tIcMNV5Vx60KGVUf0CDhYLPx04X8gqVmQWzAB16IH4LLAJfB7Yb+5sbH/gpq7Ui9BJQTNTJjiCamqMs1EfPYv5NbulRFE7KLuHrTKlbrWFQh3zmWfcU7urbzG5W6Ku8pfEUxkbpGowp2CrXPOvxt1v7gwJUn0BJ5uppnnJhgfNfH2KH1PeN4TPRk/ErssRr7T5lVcJE6H5FdLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(261102123227099003)(261022105027099003)(261022075727099003)(261009223027099003)(261021121427099003)(10067099003)(261026121527099003)(261026140227099003)(11063799006)(261028144727099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OQIP4YyTaJ3pXo8dppKzy8AdA88VWp/9h1267ZNo3q+HhmdBxpWmJB6RLwC8?=
 =?us-ascii?Q?X1Odeuq+5tJV2tVQ3vq2Wf5tkPO7UZPDf9Fo+Y05PlONnp8UWOVpAAJdnIRD?=
 =?us-ascii?Q?ZfwzkIpcFtjfGckdXyCo89cLfdCn3x2rC0+yC6NEN/sKBtnJBLj+rJ3uzHPX?=
 =?us-ascii?Q?Fp9BemDK2k/P7qoyvZ5623/CCO/QcRudnK/2z7E52+zNSmXW0StAkesc06i+?=
 =?us-ascii?Q?GIxzXdOQR/UcHzpP8zOlbjYr2Cxt2+kqBoOUw+0gNPinv8KIijC0z854T5Cm?=
 =?us-ascii?Q?62K24U1XwLUt3nUP7IDHvKaSm78mb7pgUelLGDpi15HN38dIAaK/xgFtywsZ?=
 =?us-ascii?Q?RlKrYvkSr1J6XOCtDCTfQRmVNzvP5mTA9FxP7yf2TmTKF0HkRFVRJc9QGmC7?=
 =?us-ascii?Q?w9OI6fS0ZHm841PaRwBolZD9bab0MNKtc90b22Sabd3aDLo88IMATh5bqzJP?=
 =?us-ascii?Q?zzEn4oiEMYxUq95MKG4B8KnT7bISj/qzkTwAP2kTjeDFrOfhpjHAlcM2Nnyk?=
 =?us-ascii?Q?UREroLhRpMIk2XKMbubdyFZHYOwl2Gk8OYoOIiD5VRoPFVrfEl0P9O1aMa0M?=
 =?us-ascii?Q?gSqVXz5JBJiySxK0LB7aFu2GbPdRIzZr2seRbNg0euQ27tE7T9m/sjsXbh/h?=
 =?us-ascii?Q?7nB+KdrLkR2g6pjcFuCB2r4dhQgTfMpXUMYmfcPr8S8MGb5jJm2CGgRxMKKw?=
 =?us-ascii?Q?MZeFc7XSzno/PR+pNu80EztFxmcwck9amWgjmU19Q6mAhjJqY3LSfJEprwO5?=
 =?us-ascii?Q?x0kqZ38Le+q08wcrqAfG3cIKdOvRVA0aPmsoPIxDm160ycdpWm2LsLhq7xuq?=
 =?us-ascii?Q?bXucUEOrJtz1s34Eb6iy3c17SnlNXZi1nRSvR0WEDN7Auu9mB4K3zaeKU/AX?=
 =?us-ascii?Q?ppcsua6o7vnAw6rpVh2L9n3zRbstXycn/Zw79HdGk+nuxCvt2f6MOkklN+ut?=
 =?us-ascii?Q?ZNjAzG+RBw8ZzSv93jFUYuV3GNKBgRTZzvVxpkPSFUmfobWsewIOW6fGPd1q?=
 =?us-ascii?Q?uduS+x3kDWaTjJXLhybdpGQdWoX+90v9yZVdEKGFV3uIQmPdjwXVWZfv84KU?=
 =?us-ascii?Q?SRNEYemstUMKZ4XAlTpMIZqNs32LlSGwz52yNSj7LTcirtEoCYtMxs4LwqO1?=
 =?us-ascii?Q?XJqeELtrwWZz1hInLc2SXjRJ2Dp0NRByzPXL2gureqZdFahl8gMGETQ8XLR4?=
 =?us-ascii?Q?X9n4MVTcQ6aCd3+A5DVWX5jJYjXNu6Gy7+ROaoTInEshWjU+Xg9UxeydNcm0?=
 =?us-ascii?Q?xGbPhcQuhUb/Eg4PVeAf5p/b8nLRPUJsGlX12jn9jiOqOje0sr+Egebi4a5X?=
 =?us-ascii?Q?171POj36mYr4T0Pdla/lTbAt+oouMwQddGuA3kjZmiTwCAyz8U+yeg8Bd0Od?=
 =?us-ascii?Q?iiInZiCGTsL7MFa6vvUlgKRDqgm0ZVQ38fZyjSmfDbdivYIsmg6EIEgp9oSa?=
 =?us-ascii?Q?Wl7rrmw9L74GERwARaVkh5j1Dr484Tzko8cQdgDaQzUfcKj04ldAbbADLVjE?=
 =?us-ascii?Q?UNZBCmU92F1Hdb8dD3SQtszzHElMnOQVaQrHMmFwq53MwzRScjsNPHaZTqk4?=
 =?us-ascii?Q?B/hmE4jB7uJSavaS9svci1EvrdNkmJqa+9vMJOTWy9Cvlm9rbiRkp9Yk+gth?=
 =?us-ascii?Q?cPT0uPgx2mzrDHHQ5voL/LjcjmusmTYwIs+X0ZQKaPcqovkNjAGajAhp8a+Z?=
 =?us-ascii?Q?cMz/lqfP6pqEjCIrgKxLif1wal7hoF0KgeZBQ+RNyCogHHrRLw89xoOVPK2p?=
 =?us-ascii?Q?67D/ToVzRehEY8XOPV74X5tRgB/mo145Ubdy2TLFk3v5royslU3s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bb1387-bdd0-4de5-8499-08df3bac5f4b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 02:19:23.2837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDU/F2AlUm+3I7okjypJicbeT5rLqDTkz8Tf2/v7/MQTCYTK2fZ1jsJ/JM4npz5sAg2bJ0duoW+rh7NyIX3gJ2QvFLKfvo20ZyGbLK5NV7t+2vlUvONSlVGAuw07GlAM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8548

On Wed, Nov 04, 2026 at 05:51:32PM +0800, Yaohan Li wrote:
> tcpci_remove() unregisters the TCPM port before the managed threaded
> IRQ has been released. The IRQ handler can still queue work on the
> TCPM port worker after unregister has destroyed that worker, causing
> a use-after-free.

The ALERT_MASK is set to 0 and chip interrupts are masked before unregister
the port. I assume no IRQ should be fired again after port is unregisterd.

> 
> Free and synchronize the managed IRQ before calling
> tcpci_unregister_port(). This ensures no new alert callback can
> queue work after the TCPM worker has been torn down.
> 
> A KASAN test using a simulated I2C TCPCI device reproduced the
> race while unregistering the port. The corresponding teardown
> sequence produced no report after the change.

Can you describe how the race happens?

Thanks,
Xu Yang

> 
> Fixes: ae8a2ca8a2215 ("usb: typec: Group all TCPCI/TCPM code together")
> Assisted-by: ZCode:GLM-4
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 6717ac914c6a6..580dd5256d0a3 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -993,6 +993,15 @@ static void tcpci_remove(struct i2c_client *client)
>  	if (err < 0)
>  		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
>  
> +	/*
> +	 * The port's kthread worker is freed by tcpci_unregister_port()
> +	 * below, and the threaded IRQ handler queues work on it without
> +	 * any port-registered check. Free the IRQ (which also waits for
> +	 * an in-flight handler) before the port is unregistered: the devm
> +	 * cleanup would only run after .remove() has returned.
> +	 */
> +	devm_free_irq(&client->dev, client->irq, chip);
> +
>  	tcpci_unregister_port(chip->tcpci);
>  }
>  
> -- 
> 2.34.1
> 
