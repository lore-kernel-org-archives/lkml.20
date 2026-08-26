Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013041.outbound.protection.outlook.com [52.101.83.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2EA449999;
	Wed, 26 Aug 2026 15:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756759; cv=fail; b=PpTGrdF8Hv0MR1Zf1KyATTJWLZXkF2OiXPcTeamKPZF50i+Ke+TnTyyZcqNxARQDjSJmO1eP7HcvCG7+A23gjJliLCOT6YXEKNUhaGP1N+Yxt/7uMAfimh1ewwXFi/HB/jQ+zLOIqNV0U/LK9YEzMZ6aaMisu87Fhc8BopljnYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756759; c=relaxed/simple;
	bh=NOLsCLu5FUxgiQZeJr0s/CNqic6Z9nsP78nxdTJrYMM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XZiYnbWelMfZpA0pZAGY1N7J53cNIRYq5ZuHUGiiV3H5vN7JjaqftUKFvU14foXWzKLpLR0XOgxvHX4gv2NbKMk1FRG7xAB4frfYDX/Dx/ZfuvLY+aThOdxSM/MHd0wPvFkuxKIXQ9U24/oXm3cI2TWblrCOBiOl44ZGXTZU9/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XIoBWhcz; arc=fail smtp.client-ip=52.101.83.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XIoBWhcz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBON5LEWUduVEiSiJNuZdDIIZ5gOfbNPXAt8RAZ5ttzbvUJFDBoePrcWmUjwWAga2bQFBnEVO+3CxjQay7ZjNtJmTp14l+7GU60b9q60Zw+Q4aJ/FVb1nAulENWJ13JQMwuafkOMDgQVq7uor8uReq+QwmD9k173HPNK6k78IMAyIEqSEGMErzscPMtspQ5EwrniUyu3/svC+jygT3tsG7KoIqKyM4udClRA/fBu7/W9f5E+Zns+CbwzSHWsiGSwrmSIC8++iCXt6cWueUNWJ1+yxfIh7RWhwwywAM6cKRN7IF/DNAVUuh2ynBaaTNcRVTrf8MfALCpn2f2qburHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoGGUo7wTH3KIpwMyS06AA2qj67GRd9RL/w+jb8OaWQ=;
 b=nlXBjDsm6KlG1VD38LfXeZSOMbYAgfSL6mfpohxsBaZkMPJLJppucYrRiuDkDk5naCcAbNkmifd/dTHQo4daFKxVcokttqCki0InltmZhP57KAHKtJz4Zmh4tN9w5CbxASL0Ui3gro/MrrMshF58VnZ05QmszBEns3DfM30Js8j4H81NC7s9O0iBWh8Gz69NgeinLH+R1TKpE5IdqY+Skaqy6XdNzZnv1CbDXkWSUsQdLg3gFuHBdsbvMrHRl3IKzx+uaw1HWzYSuYT+n96QttBxY2lnsGAUVa3wFkxk9FAU1I0OMIarkiDFTrKnPOSVHiWb2/LZA+TDI0BEcMUeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoGGUo7wTH3KIpwMyS06AA2qj67GRd9RL/w+jb8OaWQ=;
 b=XIoBWhcz1BCAeV9z9Hq2ozSFz6ygqgwh9wjTMqv2nKjOHheSgLxYtIpYJB3EeotojD0ZeB2CmdNVGMXFFhHhbUrg1RO8Gn6pYG2uCsJjhfF7p2IaM0h0GhXlcm9dZMFGoIQP5c5xEzE54dtRE8b5CeRMtO4kMGUR5BXXFw7kzROYfQ9mLkaPDNwa1C8qLeaeC7PuTPZ7okqcPYpn9k7uH7aVlsGFnWIKuxzN3gOXBX/3Kx6Eeo3fNf3XbiWGFY+k7rOE1I4vK5taoPomqqox8RvHPyjHoAbuHpNnNb8W5y20FcywUYNlU2iNd1uIVktPl3l/Kl3mjpWEv6XIphhqkA==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by DU4PR04MB12348.eurprd04.prod.outlook.com (2603:10a6:10:62c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 15:05:53 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 15:05:53 +0000
From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Pankaj Gupta (OSS)"
	<pankaj.gupta@oss.nxp.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v42 5/7] firmware: imx: adds miscdev
Thread-Topic: [PATCH v42 5/7] firmware: imx: adds miscdev
Thread-Index: AQHdM+62vM6+B38BAEOIJdyhzzlrGLau5O0AgAGL98A=
Date: Wed, 26 Aug 2026 15:05:52 +0000
Message-ID:
 <GV2PR04MB122714DC690728C3D7827DD5E95AE2@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
 <20260825-imx-se-if-v42-5-2e8efac0bb16@nxp.com> <ao20pJG7gJp6mAgz@SMW015318>
In-Reply-To: <ao20pJG7gJp6mAgz@SMW015318>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-26T14:46:11.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|DU4PR04MB12348:EE_
x-ms-office365-filtering-correlation-id: c0f4624d-a8cb-40d3-95e0-08df038385d5
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|23010399003|366016|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 29Da63Jqx4u+TquKq86S6j4qMZruMk56B4NwLqzDUgdru7kGwFNUhWljKSsW3CgMO3iQx5alAv+9t1zyoLgy4aJ5GRo74Ft7zorzzuy0mW0YcN/Eh5iy0Cm17mv1lAEyug7qQTq6huCn2Yb/m91vKPStNVTQ7wYl5SoBkJWEwiB46d2Ze63+xHZmefrYuiknIrsu+bFC7OFJI3EdpARFHaLW4e9A13HvoIiiwQXSRq+K8uJxaHMsgvBq3ePT8+a4irZb9uPgLfcojqJtRad/COFpbXO1saWxIJmOMUMpVdToQgc/MCBzWikSsDzcOEKNdlVhd6pnQ78JgYIYyam3Z6SwReOgJmMmcOSpFHAUb6yPgMCiT5u/kWP8JmPS7pAxfzwXsFz2wCZTzNCOMtk7R5jsyUtZuCxvtpuomu7tQmfa79km6BnhwqFG/B8bNUH+AiZm2zS2KvYgQCPJ1Sz2PbPp8oszdhKIBVhNUiNE5LDTwBDNEsybwxeqwqKLVGpYO8eHlPDNY9HmnRD5Dqk2tb4pLjGdugnIGqo04BHngDrhrxboNn8AanTZ3eDVyTiPSGZVU70Tw2KBoIL1AB/DgHZUR1Bl8oAzWggA7th3nVUr4CLNkH9ExdY+GX/F18D08eKmx3x31BdaTRo0Ar3HyMKA9fOEDLyl+k50Y3x2WznXHoNjf7L4WsPZZEq0OXK3R82aH5X8xWyW8pNEVxsnISVwRG6HbSREPDVi7nzc/cQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?INXekkjhjR+0GJnKwR4g2qTLqY2qeQBK+Xez5uiEEQ0lhxdv8KCiq7smkoYP?=
 =?us-ascii?Q?Y7OoUaTFoEjLzWeg+B3u0o36ndFIormmC7ImwTW2iBovSLaqyARb+275LBVK?=
 =?us-ascii?Q?3nElwm08riMJu9gLzk4mZPZEFRTcVc+p/lnZcQ6mRgk7/Fn75UPe1sNNbAt6?=
 =?us-ascii?Q?Lpb2O7Lml/i3AWQsjG4Pa1zUeh+F5X/q2Y0mJqn73teAPb/PuxAUH2hw6+wd?=
 =?us-ascii?Q?EbOHirRLHRwqFXoQE0R0MhxdBueJfiVo7qjiT9YTB7ZK08GYnLmeevovJAiv?=
 =?us-ascii?Q?w1BTCArDLc7zwOVV0y5vEBua2odjNNLi/rCOS2nmWWGluaBF5wqR71kV6yVr?=
 =?us-ascii?Q?HgtBHix9g9/X46OkQP75am3jzzcfWNTSFFhjc/HPa+aMABl7b16jIFwmWgqz?=
 =?us-ascii?Q?6Y5YCPmk+VcVMvve8WdR9ttntT4CwRH4FAVHoITSd3oM96PsFjedDehfCBa/?=
 =?us-ascii?Q?PuAAHQb9z+KBPeCz4aR9zetnUYSi+5fmh7YL4nXuOuX2D4eLZLd68vWE6EYe?=
 =?us-ascii?Q?s6KUIpk9gE7zqgAyKFkGNodRT7X88y6e/3twTGmAASOrGTCMpdcLJSuU46Q3?=
 =?us-ascii?Q?9Ln0DEpJx7+hPSbNK3IGwJUaMbi1p+VP7gYQTDtO2rmKiyhEQN/nsHbipkh9?=
 =?us-ascii?Q?0CkhpCb2BGyNglrWvvHXtKAy5dGb2t/MyHjSVKh+jWaPoLW/dciK3nmopHD2?=
 =?us-ascii?Q?Kw7Y+Nu2cSW8Pdrnpqz24YeojHVoxK9mY+EOWDks0sGiwUQE71machKl18+I?=
 =?us-ascii?Q?BRk5RUXriBN/fqs6LYU7szVzqeU52Fn8bx0ac/5+GZDknWJDzT/hlQAxnhnB?=
 =?us-ascii?Q?iQVfNNTFooqhg7q0INGgHMokXyp55poZiFIdEL7IUrR1lslhtI5533ElqVA8?=
 =?us-ascii?Q?gvSy1iijNfkWzghxuu6yXTyMz0L2K2E4NJZIpdCC3HGjK+v94j1o6zI9JRsG?=
 =?us-ascii?Q?BM6rWRo0Rj1VfxjQgFHKxKPZwQeLribr7y2BweECwXnoFp+gB9E8nhUBqOku?=
 =?us-ascii?Q?uzgmG4P9Wk3E1BjvIo9Rh/GHcx0CJbWz5H4MZJ8tjC/j4qlmUtiVEX9yNmzr?=
 =?us-ascii?Q?Mkg85v/28KWwpzSJra8K+FwE+BFfp7Idfg5+oWCIAWwUn5HYBQAIanuICjN6?=
 =?us-ascii?Q?IjRuME8WS0dryvT7nvP/+Z5foe+WIP1mvINpfl2Is3RigSea70lb6LcApm/y?=
 =?us-ascii?Q?PeR7vwHtoFye7U0CgwCZkpD+bfJ0tPfNNu0J3p6xWqT5sexUinvn9eQPfeey?=
 =?us-ascii?Q?pw+ixkrkn7ghbbv2Nx3iZebnB5XzwjQkQ5REhaTOzMvLGug2XZbYCtCN4v24?=
 =?us-ascii?Q?McsL9QWr705VQaUyZt1zNJT3dmG8HD3YmuTYWOwPJJQjupjKbn+A66pXLLw5?=
 =?us-ascii?Q?UxSwp27m02i+IuxUvwzkSm9vVdUfxb1E4FZtJ4fm0H8cYAR05Sx58e7ijzsy?=
 =?us-ascii?Q?fjjAwmmNaOH2NXOHDrbaLogiGnGOfDkBdW+8pe5bfz3WLXeS2oez6vRWrW6v?=
 =?us-ascii?Q?p6+P+Xrztwt1zGYoOx833cvfi+oJSLYgWowTPlMebElehVuTnaHi5RSxuFmR?=
 =?us-ascii?Q?TxQfKLpZteKtHbZExoEL1xJ1OtBo1hYeyO8OAO7m6i8vftSmePlB6plsq+Cx?=
 =?us-ascii?Q?f8JglZyohSM8jYHdMREiTYCw9bF9Q7eMGNfZAhZ4hPZxCGqxNCf8Y4VTWqMz?=
 =?us-ascii?Q?9yHicc72E//5AuNgOueq1FSH5hC7ND8qASZNO5GmePzBL3Jt2tGCkAJx5VmM?=
 =?us-ascii?Q?xbxQFEZ9jQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f4624d-a8cb-40d3-95e0-08df038385d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 15:05:53.0301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pXPfY9COpzawfa7JWz+HQ3wI4+VtedQ9heUz/OLaDPJcFvRZsx14LWeeVwyWs+5HvykediofQ8mk5PDoreuoAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12348

> se_msg_hdr *header,
> > +                       u32 tx_msg_sz)
> > +{
> > +   struct se_api_msg *msg =3D container_of(header, struct se_api_msg,
> header);
> > +   struct se_if_priv *priv =3D dev_ctx->priv;
> > +   bool is_cmd_receiver =3D false;
> > +
> > +   scoped_guard(mutex, &priv->modify_lock)
> > +           if (dev_ctx =3D=3D priv->cmd_receiver_clbk_hdl.dev_ctx)
> > +                   is_cmd_receiver =3D true;
> > +
> > +   if (!is_cmd_receiver)
> > +           return -EINVAL;
>
> is_cmd_receiver only use once
>
>       if (dev_ctx !=3D priv->cmd_receiver_clbk_hdl.dev_ctx)
>               return -EINVAL;
>
> so is_cmd_receiver can be removed.
Accepted will be removed in v43.

>
> > +
> > +   return se_cmd_receiver_allowed_rsp(dev_ctx, msg, tx_msg_sz); }
> > +
> ...
> > +int se_close_session(struct se_if_device_ctx *dev_ctx, u32
> > +session_hdl) {
> > +   struct se_api_msg *tx_msg __free(kfree) =3D NULL;
> > +   struct se_api_msg *rx_msg __free(kfree) =3D NULL;
> > +   struct se_if_priv *priv;
> > +   int ret;
> > +
> > +   if (!dev_ctx || !dev_ctx->priv)
> > +           return -EINVAL;
> > +
> > +   priv =3D dev_ctx->priv;
> > +
> > +   tx_msg =3D kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);
>
> cleanup prefer declear varible here
>
>       struct se_api_msg *tx_msg __free(kfree)  =3D
>               kzalloc(ELE_SESSION_CLOSE_REQ_SZ, GFP_KERNEL);
>
> > +   if (!tx_msg)
> > +           return -ENOMEM;
> > +
> > +   rx_msg =3D kzalloc(ELE_SESSION_CLOSE_RSP_SZ, GFP_KERNEL);
> > +   if (!rx_msg)
> > +           return -ENOMEM;
>
> the same here. Check other place.
>
Accepted will be removed in v43.

> > +
> > +   /*
> > +    * Session close is a FW-API command; format it with the FW API
> version
> > +    * so se_val_rsp_hdr_n_status() below (called with is_base_api =3D
> false,
> > +    * i.e. expecting fw_api_ver) does not reject the matching response
> and
> > +    * wrongly report the close as failed, which would leak the handle.
> > +    */
> > +   se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> > +                       ELE_SESSION_CLOSE_REQ,
> ELE_SESSION_CLOSE_REQ_SZ, false);
> > +
> > +   tx_msg->data[0] =3D session_hdl;
> > +
> > +   /*
> > +    * Transmit on the caller's own context. Using dev_ctx (rather than
> > +    * hardcoding priv->priv_dev_ctx) keeps a userspace close() subject
> to
> > +    * the going_away check in ele_msg_send_rcv(): if unbind has begun
> and
> > +    * freed priv->tx_chan, the send is rejected with -ENODEV instead o=
f
> > +    * touching the freed mailbox channel. The teardown path passes
> > +    * priv_dev_ctx so its resync closes are still let through.
> > +    */
> > +   ret =3D ele_msg_send_rcv(dev_ctx,
> > +                          tx_msg,
> > +                          ELE_SESSION_CLOSE_REQ_SZ,
> > +                          rx_msg,
> > +                          ELE_SESSION_CLOSE_RSP_SZ);
> > +   if (ret < 0)
> > +           return ret;
> > +
> > +   ret =3D se_val_rsp_hdr_n_status(priv,
> > +                                 rx_msg,
> > +                                 ELE_SESSION_CLOSE_REQ,
> > +                                 ELE_SESSION_CLOSE_RSP_SZ,
> > +                                 false);
> > +   return ret;
> > +}
> > +
> ...
> > +int se_get_mem_pool_buf(struct se_if_device_ctx *dev_ctx, void **buf,
> > +                   dma_addr_t *daddr, u32 len)
> > +{
> > +   struct se_shared_mem_mgmt_info *se_shared_mem_mgmt =3D
> &dev_ctx->se_shared_mem_mgmt;
> > +   struct se_if_priv *priv =3D dev_ctx->priv;
> > +   struct se_buf_desc *b_desc =3D NULL;
> > +
> > +   lockdep_assert_held(&dev_ctx->fops_lock);
> > +
> > +   if (se_is_fw_busy_ctx(dev_ctx))
> > +           return -EBUSY;
> > +
> > +   b_desc =3D kzalloc_obj(*b_desc, GFP_KERNEL);
>
> GPF_KERNEL is default for *_obj alloc macro. Needn't set it
>
> kzalloc_obj(*b_desc), check others.
>
Accepted will be removed in v43.
> Frank


NXP Confidential
