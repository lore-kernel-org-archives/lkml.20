Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4FC2E736F;
	Thu, 27 Aug 2026 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814135; cv=fail; b=qGXHSbipkDLPmArmGKJkw3oqwjEo2b67XBYsY5BmO7WmOvGreh9SCqN0KKqUk+DIYykNyg8BOBxSUxULdNPON0G3Bd0e21e6c511TiKsu2r4vCYTJstk2PVXQDogOKKK0TiuFDmthAntqTV0A4cx5EqMrCuKCIQibxgMCbHuK0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814135; c=relaxed/simple;
	bh=fOBBLW8DUJy9wMWqvaHlsSK4iZpwhc0fvoLi1VotnB4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hbWoRws/cMNO/hfgN7G5wEl4Sok8JPEkA4UAnncFUChsFm0KTTGWM6CNdvELNH145/JWvCNYPHGdCjqrUTBEykuaWk6xha1tjGEcSGQPrX5T8kzUkNIZPPnYIHbhrJe0cFd8I1b3/3sqL2kqkQGg62XYTzSPyHd1x+NtXi+wGng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UnO2jZg4; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UnO2jZg4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLdBrp0wNLjFIug2FXRYtsCsq4Y99w2TmW/dYJmFwkRt8BxFgHMbvLa3ZXncviqpOQxEjAw/boUe/1YyCojNTGlwVcLCbCRkaahdZqEkdJ2TVB/aXs9BEwPPe4+azHjOyrtT1VY6HdAq0rhowlP/LQPJKcenbOcmk+AMG+eyVTL4r2jyl2RdEJmJP371sVcHurP9jLTF7875TgI1n/Tv3MTkFGHsj6KUBYS5nkGcQm8EusTp5C+23/pPdwDP87Rnan7aNu97yLs2SEI6py6N+8B5TuF8S/G5oppSCRChI+Yn9cf1J2Zfvx1UX3RtJh+9tg7RdZ0IOo5enQuxbCaU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ8nqO2jb0FUxVeezvzmEySjIixnggCU8/+kvRM86ME=;
 b=PYAPubzLSK9wYVTkUCEQF3rBqXbW3paKr/8o5j1EbM3+H5aZpiBLi+gBwa1bKB3TZJPIp9mPzJ/3ajBrf84s7LMHkvHmcAVd3Kj+xGEQW+TfXdNhT3gMWAuVijQyxiRG/Z4JJuVT16iLYGS/KHrbpQn8aPmSl+cZSk3cMAS2iRrni4l8+GJOLR6ykOMxCtucS7B4c5RMZuMJVnXtChsscHP+LUs4Vw/bW8jfUBF/u3ytQZLyKf3JFMWChzpbH/TSQV7MNFdlMTGsyd0r0pbn/p/hM/62Zshw2Fk+aK2K4ou2D5lJ73wPSYsyhETaukPSBIKPsjJbhM1jUC1kfnAPiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ8nqO2jb0FUxVeezvzmEySjIixnggCU8/+kvRM86ME=;
 b=UnO2jZg4Vpkc/nx6DrjsItVThsfXOwYV9T38M1fSSr5JCdi8oCAcecwfqA4HFYYZkOsvRQcnQAR/0SOAgnF+XFkY7BETJITi9zNQT5OpfKgBga1kiiUT/kSDjmIB/11ztGQKyqa/BlyI+2fuF3YOS1r+8Vyce1Kq8Px2pxc5hahG+iMQaM113nGZq+pCrttN/dbXu8twl/ursHYFTcT2VEdW6/PyF7iOBtdYPeYaTZ+YhcXMK9zNgAKeG+SvVJLWceM/UAVHcCWNh/BfVix7wv3FOr0yyV+vQYQJQhx3wTQ3awO7FOpxwcL8f1KtL5DXgKb4BNrWq3eyk66r//V0dQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AS8PR04MB9111.eurprd04.prod.outlook.com (2603:10a6:20b:44a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 07:02:09 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 07:02:09 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	Frank Li <frank.li@nxp.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [PATCH v16 2/8] i3c: master: Add controller-only device operation
 helpers
Thread-Topic: [PATCH v16 2/8] i3c: master: Add controller-only device
 operation helpers
Thread-Index: AQHdNUcP3TjGiB9Bnk+X0ioOoWtULbawiRmAgADvlNA=
Date: Thu, 27 Aug 2026 07:02:08 +0000
Message-ID:
 <AS4PR04MB9362C41BA3DB8DEFEFDAFEA2FBAD2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-3-lakshay.piplani@nxp.com>
 <ao8XXagBAhl6zANu@lizhi-Precision-Tower-5810>
In-Reply-To: <ao8XXagBAhl6zANu@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-27T06:59:34.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AS8PR04MB9111:EE_
x-ms-office365-filtering-correlation-id: 8da8fecf-731b-4973-aed9-08df04091c8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|23010399003|22082099003|18002099003|38070700021|10067099003|11063799006|4143699003|56012099006|5023799004|6133799003;
x-microsoft-antispam-message-info:
 8BCZQLFq4BO8e7yCBsTiwnO2A+CNUq31R1fioyR4wjnRxnRqWXkB7+fEp2SXLdpqmR9LLeJhpgj45938Ckk18DGHXGtHa2lvxxQgz8iH9wnL6FMSlL4INUB8E1Fi7NRPhyogh4HhX+DTXUrfuj3RdCP4d20pPVaBBwbAAewwOPyBJf1qA6vE5CUrEEnwiY7GM+cZsgs/Kab2BvxY/9eZT01l9Mxa0lu12Lv0NEcgyvZ1bs+S/s+PcZZAPYx81yaI7FER84iDISbZi1pH7KiW1DzwE/gYrDpuJA972Pa1kjJpFqC6xXJaix7Mt/53eDW8D1lh6qZ0dzcpT/fIXpLdQwveGI2saG0ehvEr6hO1vKTLwTy/aUmn0iCmoqoPEIHuWqSkpGwGQ3vUODESgX11VOScRdRsBD6SM69RCI2QbV3hrje+XKp5cdMnZfDM5TW4NtZFXfWqoa41n1nFrnwij28pQjYOtwLOqfXLNKuApBqdiUzJyfW4C8h2qjYzUhe7U77cUfNKk0ZPJLGbzRLVpVfsSE8qEGRAroCuCMIlQc0y5NVNuCaTAcjq7wsN9qM0S4aiOwobIGAG5XK16x1h7rlRL8SXAL640kE5U1jpJlUYhaOwnirvWRvgj0BN2v20ItcX+Ex5waH92B8bUIKPZVzg1ycG/wE+X95uDk3c9kKq2bVRW4lsOJLm4nfZAZWa3F3ALcDjUjw6Jj+uGRsNTg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3TBKHU2khane2dHIvgIqHtijcrAWg0G7bxO2UT6GpXwNDBdVresUXkWdPGb7?=
 =?us-ascii?Q?gCNyjuwV9Q8Fvvn76FIF60pEoY5LD987J+aqDQQ8n47IglxPXGfHlkz0RG1k?=
 =?us-ascii?Q?/K9DC/3Jb65sLEmBLOX5itwj6tWHscWhQ6x6stRf6p81jpimb/9wn/sIGFbr?=
 =?us-ascii?Q?qfqKO5x2+stXAynj00XTmqHwihX1FBkymuObetBmobIXDUwdu3JVhUVUjJFO?=
 =?us-ascii?Q?WHCx9Yx3TK4nNDmvOmvklAkYmsrQx/oO11L5/nSyukyxzXzDlY4NqEVkhTJF?=
 =?us-ascii?Q?rGxN7sshjoip3Ue787XafAhPIvxHgmuEwcVJ38V2+8mNeNelH3O+6jMPxFb8?=
 =?us-ascii?Q?v8tWGPzdwL8Jmwk/Fzuxv6IaJVG043bAyNBD+m/XQ62/lgNKRP0HSJWLOWRp?=
 =?us-ascii?Q?2VRAQAYTf+fwWZiQO52WXQmv5C4J7TCxKHrnbugNMHB/ABJoa6uQ3Qycl8fH?=
 =?us-ascii?Q?IWj4yu+97Vsc6BSL/w2UVTNg5S62E4VVgVMU0jKr+3V8Pg+tr93NL+jYGY3f?=
 =?us-ascii?Q?3LZyl1xuqBvHIz6LQnCFoYXkOF7qQmTZpGL+4rAlRnfCHWGrrUy31SNZ7k47?=
 =?us-ascii?Q?JZmd0YBocuposIJQ2U+UUGzsjGj92tqs99DIgO7ILL9PfgY2D9zIwaDu+E4y?=
 =?us-ascii?Q?0PvD4g1bx0AFYUEU0igDIPdDSM1kNynfM3d2wkgV0ULwqsQP9mAI/5eTLydz?=
 =?us-ascii?Q?1lGfhD8wfmQwhRbUcq5Nm5YEhzGlJAzNlhF7AoXcTMK9NJRaRNLDQbqme1hQ?=
 =?us-ascii?Q?rvbSnheecye287yvANt6CUXhlbmy6mtuWgAQcxST64nl8Z5mRRe8XaTcmth0?=
 =?us-ascii?Q?WwAJ4CwCrjSrKsCSmpF9EZvCXyaLkK8iMvziS4QDHTjMFhpSitDbOBhk4Lz0?=
 =?us-ascii?Q?3afA76rZeUuj5E/KVhcH1b7mh5dy7IdJrq2AeLIxNKo3+0s60l7d3cEMnabR?=
 =?us-ascii?Q?VlDy8/Vqn4e9tuoWH6qjPpG7hLZQTOdVJUWpiU9hqAR3xlZiOwOO0EmRzB+2?=
 =?us-ascii?Q?tFEIC+XQFukFrDhHy5Xn4rNViEHUA9XJZLS7PtmUD0unSMBNdIw4fD7OP0IN?=
 =?us-ascii?Q?ow/1pjtEsA+e8JBblMPwK/3pk0ltIN+jCUm9xche44wgUCk34DRJcoPTbs3d?=
 =?us-ascii?Q?NQSneqMoHA/cYMNjeY8ApmHQ+xBp+ESd2Qvv/L1SrjDGpQzajvBnRVXjVCJh?=
 =?us-ascii?Q?NedPo2WC0qsLI+40DLyXe6vvzA0TGYhAZuzzuRD3zCI9hDwU7PZJVw4tMnVP?=
 =?us-ascii?Q?oszwVK/QAyg59U4qOUXdoOeTBgMdhRwfopmdga3fK7EvJ8Ldt2kk7WXyErjZ?=
 =?us-ascii?Q?vKJVDjgmdsEP/V9P3X9ZlRTr7VIvSx61i7QbtLL6m1rAEuB0SFtq5pXavJBt?=
 =?us-ascii?Q?+ngNuceJ4SbfVm4fkFuXIRwfreo3Yaz98pZqUG6Vhz0tr5DC87IbNvQFRi8S?=
 =?us-ascii?Q?dssDRhZ1ybZthdzFJaHTMFmQSigdsL1wt1ONgiMF8O4S7+HjZgtRsWOpLurI?=
 =?us-ascii?Q?YgPC193kkn/f1F9fRFiqYKtXB3427wiqVa7XJFM+K8GqrII4Jgb52VG4aa9j?=
 =?us-ascii?Q?e07SChljXG44vWa75wlovr+hvxCrs1l5R9gdUfvLmPk68wv44dyc8xaBV/mH?=
 =?us-ascii?Q?5TxUq0qWGyBfGk4MPeceYJxOkk6fbwr5w88FBqYRiSZFi3KiABfgS3Msf2vB?=
 =?us-ascii?Q?E7Q086h+gV+5CmQ5DC4CDKgFpCT1tp2VLaFPTYfBKXbWA3P5VEulJPsDlOrm?=
 =?us-ascii?Q?9h9/fH3u7g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da8fecf-731b-4973-aed9-08df04091c8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 07:02:08.9542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kDDwJfZFXrMTe+H6pDxTnPUlpCXKkbkGk5SklR+8yjtlPK7jYTAgPPIC97LVMkdxi35U2HH5jAMHueFe/A1YEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9111

Hi Frank,

Thanks for the review.

> > +/**
> > + * i3c_dev_recycle_ibi_slot_controller() - Recycle an IBI slot through
> > + *                                    the current controller
> > + * @dev: I3C device descriptor
> > + * @slot: IBI slot to recycle
> > + *
> > + * Invoke the current controller's IBI slot recycling callback.
> > + *
> > + * The controller is responsible for synchronizing access to its IBI p=
ool.
> > + */
> > +void i3c_dev_recycle_ibi_slot_controller(struct i3c_dev_desc *dev,
> > +                                    struct i3c_ibi_slot *slot)
>
> does this one need hold lock?
>
> Frank

No. It's called from i3c_master_handle_ibi() in workqueue context and just =
forwards to ops->recycle_ibi_slot(); the controller synchronizes its own po=
ol (generic pool uses its own spinlock).  I'll document the calling context=
.

Thanks
Lakshay




NXP Confidential
