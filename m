Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010022.outbound.protection.outlook.com [52.101.193.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792AE222599;
	Thu, 27 Aug 2026 03:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787800403; cv=fail; b=PVEDmnXVcRpfZtXcEcs7mnYT/3zjdfrGbIELT2Y59NCvka4G02d76yRbu1StYVnjj4TlZzD7wbJHRyG8V0T7bYTK0+ZJv2zsBPk8KVVCC2P+bJQyAi/U0ulbwAMfRsUVOANasLEU5LZbwpmfd9M6bowAhKylFCJNbSPR2cloTcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787800403; c=relaxed/simple;
	bh=KSyl0wL73k7R+0E36vgyA2Pwi4npQkQqWkGCk3d3aLg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RQPyYpIggpnBldihSU7Zy+QTQFGeF5qW7T0UT1EByO7t9gf1u58WSA0AdK2clBojn3FwYQiQydKowiU8ve9Am5mr5gyAThXbtHF9oQTBTFNMFGheNsCg/7Y23oQP2OSHmtzEkJax1+YRDDhmngTcsvBTlkoTvTHyEu1sltHZzD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WW/5phSn; arc=fail smtp.client-ip=52.101.193.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WW/5phSn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnEe3SGWDkIn9yrrnh/jmIofc0fnvoR4rsIaxkO/2RIuLLp5mHBtWq16kongrNECdOCrqI9u8ohvA7OtTDkzwrHdY3o6QNtEPSNELT3beNJokY2ZpIdG/co1JCYPrWJb+PEj9guoUG9WrnEkGfW2KDbW6yOF/5JhvvZGVr5WldTB9VqY2M6fTxV8WaKj4MK0Sa+CGhW6pEGAefKwepVNTVK3J8rwfpDErJZujurmaqjnyf5TsPHnA0Rihhlj/E2Buk10yZaJTXM2vsiyzGU36hi4ms4VECFaKEJ7Z5bvRb7KAGjx9WlRhsMllowQ/nLYl4ZIXc5d4SSufqiPE2UtOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUPFHg8Y5T5XOaLJZQmFC6n7jKOLAllFcIjTmqqNGuo=;
 b=Ymd5+IVouuHzsG9m/2PHYjYW+ZvZ+gIFU8ja+uF5CaS2VLobQa7bWBxGULSBPJGMa4/Vr6OghfRsHMTavyQGoWwpCuL6waZbLidD775IahPsPeWFd5YRtg7imnP4SuPVwGvNRRZWyTWSmPOvtvpy5Njh/FRrs5rEYIOAToSREW+hwfQC0AVBgMZ11rQ8tekxmy37tvZlKAJImU1YJx+irA6DRI8rhVIh9ASjSxusBMH0qI3ny19BtVul/kenUGt0hr2zLF3dOqspTpcvuSjILOCK86fIFA+xZW0/eLrGXw2G9V4zePDppLXIAdGr2ZlIfhGbBsyJQQvRVNlUogLBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUPFHg8Y5T5XOaLJZQmFC6n7jKOLAllFcIjTmqqNGuo=;
 b=WW/5phSnsBacyRTzf9OUnq4m+Kbli5pImG2qxCE4+ckXQtS11O+LFcAtL1N6dXNC8sFu4OI8RcnetldkOdnpbL0cSK/LMSiZ8Os9awnHQt28cmlopKLOm2Ca+UI3t3nXkaWht0UQ+QfZbQBr/TFyJjntz2fPnrLjQfm4dTQ6NJc=
Received: from BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9)
 by LV5PR12MB9826.namprd12.prod.outlook.com (2603:10b6:408:2fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 03:13:19 +0000
Received: from BN3PR12MB9569.namprd12.prod.outlook.com
 ([fe80::2aa1:eed7:b03f:5020]) by BN3PR12MB9569.namprd12.prod.outlook.com
 ([fe80::2aa1:eed7:b03f:5020%5]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 03:13:18 +0000
From: "Cao, Bingbu" <Bingbu.Cao@amd.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jose Maria Martin <jmmartinf@hotmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 6/8] media: ov2740: add manual white balance controls
Thread-Topic: [PATCH 6/8] media: ov2740: add manual white balance controls
Thread-Index: AQHdNV4VBTIiaLL2KUOmgAqbo9F5ZbaxN9Cw
Date: Thu, 27 Aug 2026 03:13:18 +0000
Message-ID:
 <BN3PR12MB95696150D1DC736824104D2D8BAD2@BN3PR12MB9569.namprd12.prod.outlook.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-7-mauriziocasciano7@gmail.com>
In-Reply-To: <20260826132256.3343451-7-mauriziocasciano7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-27T03:08:03.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN3PR12MB9569:EE_|LV5PR12MB9826:EE_
x-ms-office365-filtering-correlation-id: d91cedd4-1c37-444a-7250-08df03e924c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|38070700021|4143699003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 UxDWWw0ocBbQLscWNRTV2I3Ppdub55KBc7wii9Zy6SZVJ0jKST78Gamoth72bSnqtW1i3p2m0XJ9x96uEG5bjVyoJZBYVq5qwc06ulnrX38QBeAKjHvEi8+9LR0wOoX/eIzFCjJFbHISzU90G1JyLGzwY/amS7wwTkKT2rA8IB05jPkzvz/FJ4GE0GozXWQ02AUakx+8SBsNO1v5v6rtk+Kbn/Xh8Bj+qAr4RP2WIdoKuNanKlbx5vs47aqfC/G5L+H4FNCwfPeWhll/g6+FRVEZdHGui1BinTfq6OO84pjokUG3GcjTtHurBzwA0NB7wwCTreP4GETZ5X8zKqfRqFw+ghOdtSXD40ctTzUHOrBQoVtSPwmmeWJglBqHI1icd3QansEhXz2xW3GFFoBR4Wgomo+q/TD+GQcJDD0a8X2EgprKT8l/01xeJ9khL/cWBmqdPDzuLZzleIoiaDUvD7s2uw0LARcwZdnHO/taGCvPLXd7UzFFpPBba4wvS/MS2VPhu0yha8hn/AUMrFM5dgIfFd3GEE+Dm+wBNavHL+nQGP90u5MVMTzmokZHoA6yXGqKKzaDCxmRrN5AZ+jhp6BQdEFSZKQCPPwPcBu44hxQX1NzT1s9TsA61i87fLy+KeUkzDZMfWPXEvEOg0P0U1lxuUwKNOc+B+HXhx4IuR696JmbjGxNeYaLjP1eCO5VsUjcDSNUlm9lWSlQwqXntPmqYVzLjOwziuwfXwuiPsY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR12MB9569.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JTH8LtAjDq0GVt+JrgPTr8JGZYGFDarNZuiVlrVRy7xmr7AzpT2DkJbFjfbZ?=
 =?us-ascii?Q?aykgeX1bsxlzSq7JqrfsubwB1SM26bnjpAtcWEjULQsCrnWjqRTPSwMlDIXs?=
 =?us-ascii?Q?iEtGxGFiuuuvxcgOzEcVAPWIGg5suzylvVBNWss5L4LD83oWPuEDpFAxzmEL?=
 =?us-ascii?Q?ItRK7O3HnT+OTuO2KEKsyvq1jfxofCkZZjWDRSQvyYHADRrZolYocQNFj6u8?=
 =?us-ascii?Q?1Zrik0JB+WjYBtun1TOG3PA8gtWDV0cl3exuyakft4xSjfGANEaSDyUxzP2x?=
 =?us-ascii?Q?wNQ/j4sv7RAKLDXeK93OcnR2ybP+pnyYO1xntzzT7zfv7wHRZkv9++c2vWj2?=
 =?us-ascii?Q?Me9OHOoWHczqZukmOuior8IiSUny134gnOU5OxJE7vPHhBQn2RcuMGjdoyj2?=
 =?us-ascii?Q?wdeSCt/lFQv0Oz7jBAwXbETZ6yQF/bOEE+xjFsd4KpJjGUWEqY5UxSESiHxp?=
 =?us-ascii?Q?XDKqQHUQTveXomVMO4KZOqbAE6p/+ePRhDV9im3DAJ1CmqJrA2WYFizlSqu+?=
 =?us-ascii?Q?6HQK7Akm997b4t/UMni5rjO1RwKI5nvHYhBWdg7tfxk9JoNYaem2bzLE5odN?=
 =?us-ascii?Q?9Pnm751rIYB0VoMnPg4+YWMJsQ7836DO9hPHg+K4OpnWq/9ovJAIC7oqoC8V?=
 =?us-ascii?Q?oQ5Ijs3NAuOiJmiYneHK4ReuZmSrU5gOl+Csi36U5ArIChjaTFzTdHBz8Wce?=
 =?us-ascii?Q?ydzoOuzvaNMHnHU70TmKOJHbr50Ul2EXDVuBWKfslXUK6udH3T8a3NkGbdQg?=
 =?us-ascii?Q?LugSRQwuAb/97dLWPjK8B3orv5ZBrVs1JJe6SA3SPZWZQh2G7ku0fCb3dcjU?=
 =?us-ascii?Q?3SGXIelRUHSei6tTfE817JsihqbfGRW9E2i/MQDlx+VH06iS8az2JwpfUes6?=
 =?us-ascii?Q?u80zh/208ramQ+Azq+xlo69ofoJhBy9qnR3sukitbzFHhKFws4WN7bvxqxNU?=
 =?us-ascii?Q?TXV53DbWu4g8o231Xf/sHhs+EtmJqDlxOzC6kFws4AgvukkE3jqS3qxb7HPr?=
 =?us-ascii?Q?qab64BQzjir/YOq/FQXnJWRU2qm+J1jkeWnCHhwVdPRJ3aigON9yZ26ZhfYA?=
 =?us-ascii?Q?ZpHi51UDrl9ud4MOj41qoM2ook5nc8A/yk1Sx9/Wn6iO0Z7d1e8e9DhSRqPo?=
 =?us-ascii?Q?mDDDrKxDF8e9MBFigNdkAwqD0JnWLWoSFmtp8ivfF+MR4mUFSdiQgjtTNETY?=
 =?us-ascii?Q?heMr3LLJbjlBLAkENv/Zf/uHSKTeRrAEX/Y6Y7arHGQbJ8fpMJCM/WjziWrl?=
 =?us-ascii?Q?MzOLHxVFRMDlhiiWacOjox6dIh53CiXjDhL+AquTKZrGl6ZSeYK1mvdXvhBo?=
 =?us-ascii?Q?+UtTXj5fIwxe8/04DGvdr6mKLlK9Y9VlcWwLbfg65GlZ7LZVtkcwBZAYV4On?=
 =?us-ascii?Q?Bp/XijFODTbKzLOB3Bh8WQG1TSfRxogQAwb+lWzt3Sdct8V5tTVYpavPWy90?=
 =?us-ascii?Q?GGb8petWStKtFoM3UvRuSFcrtwlOZ4amF47FplY/MhXcGqIyH2JhEG9vQtS3?=
 =?us-ascii?Q?AHEJUsIPxA91jCAg9pkohEATnGV62hVKXv7T+9RjWUfugxHIMmHEyGShlxEz?=
 =?us-ascii?Q?yx2dZxZVicRtIh3ItgGPo2a2Fzczo+92RPDXbM6BrWbaZ0oCMzEUWHK63AU8?=
 =?us-ascii?Q?LHHLltvipfor8bz3WPViZUkwfZWfq0w6kbZRbJ8P1mZiFBrIK1J7O/8hWPxC?=
 =?us-ascii?Q?mwbuqGd7ML+C2s+jnGI0mxrjYR0bOjiit0fizezTgBHVpuk6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN3PR12MB9569.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91cedd4-1c37-444a-7250-08df03e924c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 03:13:18.8589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZgnjSvhDM4Mh3yhIYeYRLAhH+oKpsLmxLfNUlx37q0LpwfyJcatIUfAKRL9xvJuA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9826

AMD General

Hi, Maurizio,

Thanks for the patch.

> -----Original Message-----
> From: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Sent: Wednesday, August 26, 2026 9:23 PM
> To: linux-media@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Sakari Ailus
> <sakari.ailus@linux.intel.com>; Cao, Bingbu <Bingbu.Cao@amd.com>; Jacopo
> Mondi <jacopo.mondi@ideasonboard.com>; Nicholas Roth
> <nicholas@rothemail.net>; Andy Shevchenko <andy@kernel.org>; Hans de Goed=
e
> <hansg@kernel.org>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jose
> Maria Martin <jmmartinf@hotmail.com>; linux-staging@lists.linux.dev; linu=
x-
> kernel@vger.kernel.org; Maurizio Casciano <mauriziocasciano7@gmail.com>
> Subject: [PATCH 6/8] media: ov2740: add manual white balance controls
>
> [You don't often get email from mauriziocasciano7@gmail.com. Learn why th=
is
> is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Caution: This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
>
>
> The sensor has separate red, green and blue manual white-balance gain
> registers, but the driver currently writes the same digital-gain value
> to all three channels. This prevents userspace from correcting the
> strong color cast of raw Bayer capture.
>
> Expose red- and blue-balance controls relative to the digital gain,
> update all three channels under group hold, and always release and
> launch the group even when a channel write fails.
>
> Tested on the Yoga Book OV2740 with live gain changes and continuous raw
> capture.
>
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: Codex:gpt-5.6-sol sparse
> ---
>  drivers/media/i2c/ov2740.c | 71 +++++++++++++++++++++++++++-----------
>  1 file changed, 50 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index b760d4dc0e68..7651443b28c1 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c

--snip--

> @@ -881,9 +897,22 @@ static int ov2740_init_controls(struct ov2740 *ov274=
0)
>         v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
> V4L2_CID_ANALOGUE_GAIN,
>                           OV2740_ANAL_GAIN_MIN, OV2740_ANAL_GAIN_MAX,
>                           OV2740_ANAL_GAIN_STEP, OV2740_ANAL_GAIN_MIN);
> -       v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
> V4L2_CID_DIGITAL_GAIN,
> -                         OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
> -                         OV2740_DGTL_GAIN_STEP, OV2740_DGTL_GAIN_DEFAULT=
);
> +       ov2740->digital_gain =3D
> +               v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
> +                                 V4L2_CID_DIGITAL_GAIN,
> +                                 OV2740_DGTL_GAIN_MIN,
> OV2740_DGTL_GAIN_MAX,
> +                                 OV2740_DGTL_GAIN_STEP,
> +                                 OV2740_DGTL_GAIN_DEFAULT);
> +       ov2740->red_balance =3D
> +               v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
> +                                 V4L2_CID_RED_BALANCE,
> +                                 1, OV2740_DGTL_GAIN_MAX, 1,
> +                                 OV2740_DGTL_GAIN_DEFAULT);
> +       ov2740->blue_balance =3D
> +               v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
> +                                 V4L2_CID_BLUE_BALANCE,
> +                                 1, OV2740_DGTL_GAIN_MAX, 1,
> +                                 OV2740_DGTL_GAIN_DEFAULT);

Do we need a v4l2_ctrl_cluster() here?

>         exposure_max =3D ov2740->cur_mode->vts_def -
> OV2740_EXPOSURE_MAX_MARGIN;
>         ov2740->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_op=
s,
>                                              V4L2_CID_EXPOSURE,
> --
> 2.53.0

