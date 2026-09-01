Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010010.outbound.protection.outlook.com [52.101.56.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC16647DD7F;
	Tue,  1 Sep 2026 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255437; cv=fail; b=HSVVJ/lBBz7uRHMvGQFbbCUiCDRIGfDzqkVtGKW86rsTyfTdOtEEhbbjwpod7JI2q/lkyRZWFAiv4lh5/nT79mvLT1EqPALnFG1GjKMwx42cZy52rWH7RRcSUrBMrhjTjnkRo8CGWuH46KJV1rrh8IUtDCuKNHhvdoqw5vfn+Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255437; c=relaxed/simple;
	bh=oePkRNZHX22UwfRMiGo138KGUcyKSeOn6algr+0pDVU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AazqAjIN+i/c1xU2asjf1D2Y7VVDa5QQmQXEoI/OemvoKrNG4kx7Kb1RlkaC6vYckrUlxgMnN+gw8tRZFEDWx0pVxv/3Ym+OuGrTwnLP1RW/knU5KwiKaQAPlvDqy8dE/RCZ9Rnc0WGS+OL67jq0Mmi68jf4eY3dJJVmfuTe2/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X6SOa7ZU; arc=fail smtp.client-ip=52.101.56.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X6SOa7ZU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ST+qwmXRZ2q3ZyzpKt8HctZalQj+eMkK8Dv00/uihxrnNKr/bUT4McAegZ5lcjq+lfK8VFL7dnP9kXAjUlfCbHPqGulWvWvr7hae2rWDNeqLZfFwTadwRGikpxEh21F+PIpt+/rtv/oFAT0eZ2aHHl/nbE7kE17sCOvLyLQpm0MuFAmWwkWlron1Oo9ERnyQp+HwRQGlJaf7Quct089zkrtr5ySQ/7Ayr/ZnFTo2V1U5CFQkWkO9o+ChsAbtfgoCzqrlz/bU3QgUsMEIi54NEQnsiiiNAN0TJKbaYDhe7vMtQIsCWVQIlYyYFr8I0D3Z2XDztuoF2p/U8BrOSg5Dww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KASJb1SJXMUIxzOtn9fyDS7a/qHcMh2Tc+Qayw4FQtI=;
 b=Ap3V5EMzvO8mBmp2P0cMupsmFT0OZ7EgH8rem7T4z/e4t68I+TAFx3M9YIaF9tZYA/rMg7fhqj7BIRSXoNNoUqe+0+9DhcwWEee+z3aEmRAs5FkmZwCiDBo6KpOWVOTBTQpkh7N6hhTSElmTbnYu2eCLab2ScsUu2uirI2WQkKjBVfO1KXwpoWzQaDvcMDLGqPZ0UfL8tOwCthoDhsyEYBnUeqmoG/MDNpazqLGAZbrbY0cn2tgLhDlQKwFfGZo7/MgXNQdi9tRkMghYd8mEiWPmNh2lY5zHUQBBIcOmg24nFYj0ythhrrOj8wffIXe6Vfw3yzj2DrVpmHPWVTsfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KASJb1SJXMUIxzOtn9fyDS7a/qHcMh2Tc+Qayw4FQtI=;
 b=X6SOa7ZUbYtI5vewPPZOyiVGE2nlQd4udXM6KclTOdfphOHcqQhp36N8IliMtAEtoFNeAuMqoQNxflGEN4SwvXtkqP0//Y8po4Ri1UE7jR0MesaS/5+OWV93nuPDDCaGxqWBvkeOhDUNA0bmAWfgxoakqda7fzZAVgR74AiXlNE=
Received: from CYYPR12MB9014.namprd12.prod.outlook.com (2603:10b6:930:bf::16)
 by BL1PR12MB5900.namprd12.prod.outlook.com (2603:10b6:208:398::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 09:36:59 +0000
Received: from CYYPR12MB9014.namprd12.prod.outlook.com
 ([fe80::159b:340e:ebac:8599]) by CYYPR12MB9014.namprd12.prod.outlook.com
 ([fe80::159b:340e:ebac:8599%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 09:36:58 +0000
From: "Gugulothu, Rajesh" <rajesh.gugulothu@amd.com>
To: "Gugulothu, Rajesh" <rajesh.gugulothu@amd.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
Thread-Topic: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
Thread-Index: AQHdH0OSFrXTBNFhrkCuWmeIWyiRC7a5rCbA
Date: Tue, 1 Sep 2026 09:36:58 +0000
Message-ID:
 <CYYPR12MB9014BAFA4808A112F3C270659EA82@CYYPR12MB9014.namprd12.prod.outlook.com>
References: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
In-Reply-To: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-09-01T09:36:17.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR12MB9014:EE_|BL1PR12MB5900:EE_
x-ms-office365-filtering-correlation-id: e151ce08-b2b1-43c7-4be0-08df080c91ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003|38070700021|6133799003;
x-microsoft-antispam-message-info:
 hchLse7wSDhLgHBkXDJyK5v5GcCdmJS7s4uj90t38nCNP/6bVJqR6aqFf4dLSwzSF+O0+5nK1xhqWQxQF4gSdmUHKOAoGMaW5O/4EzTiwN2oDnc0asBwE6PQtXG4dKngdvmGLjF+NqCH8tydsBP1nUqmOE02I5jMlwUc5h2cCFOTPZKJnk2XG3XNqUsRIKipfvuSIfK7/Evflefj4P1mgFijy/yOMotu8dsJ59Q0eHm4i9BBrN417daPm01mLyR+7wsk2O9nYAVOq1WyO/1CZ4IbNIuEBE4gDCd4PQ4Z9/ZVw73nzQ8xx37V8h/PwTxEmL506JZn31RHwJFX5MRshPIybRSz1DtZ5RAWbIq9BMSzFIXgBoIDy9k43/zT+2T4KGinvqWf+devCjOylfv/RPMJRe55mvgslmJpXp1yJvGEmLg9u4znj1XcR24CPlIRzPnjt3YUE0QZWWwvqmAbBij1LP7e+UU6Uk5OJifQqGqFJeN2r8lAEXVhUTdgN0oP9bn4Fh2pLqG9mPLlUzqaLvhB/mM9UQpwwrhyJzR/R7XqCkvy9EDkJCbngTfgj4sauw5wfRm4QWnEa+lNFkOYsBMv3i1PFgAoKY9TjcAPmWGY3DJMorms4v4hPFOTZZH/PxMCm9eWXUcs3zcLwG324F/BDVJ2tCBIW28bL/Dknq+dPiBW1SfWgu6YMTPHd9a8WpkcTv91a5/fMGq1dFZgccJzRD2697s6Mw4a7Lffs/s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR12MB9014.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003)(38070700021)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/1klydkMhCnAt/40gcs65e/Ue4EqukGGvK3RJyZvCG1XJGfMD/fQWd3uq8ko?=
 =?us-ascii?Q?6X0Xva+j09MDraLNT0HDf3IdRm83fcpfRDbIIC+Zlzv7z8xeGRDQq9vHSgBG?=
 =?us-ascii?Q?BmYDmcgavYbv+QgIS/2zHSAtKulq3/7WkYrQIoK4l8GsDjV66jT5ndcv20Sn?=
 =?us-ascii?Q?v0t77qJcJ5zyW2eyKI6Msx3GsHbFg+qMK4J1AnjXP86kF2Ek+VAF02XvlW8G?=
 =?us-ascii?Q?86GupadED6JrxXXEwqpfVBh0QiOMt9ZMcTv21sW5myXObWWrsJWBeFqBvvyH?=
 =?us-ascii?Q?DsBqPCC1L6LyY51ZpKByserQUiC0wUgWT/zyfB1KSMxs9LWjiMusxH+Dk2IM?=
 =?us-ascii?Q?w9yHaKdxDfDH0AKksz507XHxmqX5uhhjFrLw8XXfFT5/C4kJzHKoKoCeua37?=
 =?us-ascii?Q?HPWLBEfVdwR7fsA3Pn2k1MyjaVDcc2QzHkMEKmEbVhF0yNg146qZ75wz2haI?=
 =?us-ascii?Q?BokWSB2Q30UOtEyTuJKkUW5DJersB1W7Mjzay9emI9zkRCmK4yCoeeya0RkU?=
 =?us-ascii?Q?HT1JYpCjZsBNMBIhn3K/R82UVuWhcJnZoxOXavHBJuZEV0fliZEkv/WB3gng?=
 =?us-ascii?Q?NhYdxz5hrgBSh+qUppOCPrphhRWKaScLRWLYV7kPwngXwfMMsC7iH05Tl30X?=
 =?us-ascii?Q?+ezcVgM/JE/1RNKxUDTMmJ7W1DdkpkCkvuF6hXs+DozyzOOld/OvCfYDp9NR?=
 =?us-ascii?Q?qCghh4RZzFBkpZLEeZa/cg+JtDefdMaYR0EGPbN+ZFvvDNaVVk2g1V75ooHq?=
 =?us-ascii?Q?xeET737nRDCr3pe3nxA5Qf2wVAzFYHdd7JosYajPTC62eid9sFTdYquVbWFB?=
 =?us-ascii?Q?xCNalkwnuZZVseYzjEwEgoFpqQbCvQadpQCoObrg2fr+9Bi1CxI7TU6s4MA6?=
 =?us-ascii?Q?YitR4NvacVbgr9TeWDx/uyzj0F6QpxiENKgld68ZTPbSVrrZ+yG+HfIcfmUG?=
 =?us-ascii?Q?Tbdy9V58S3DVejbqxdH39n9R+46bUDmIQW2pZihFXiU/yDEp9z6LAcUojKfa?=
 =?us-ascii?Q?UJuLVIdanTczeFCuVd6VCAsazuP1GVjWrIrLZb1t5bKPUTYqtRth8IeqeF5c?=
 =?us-ascii?Q?O0USxG5FCwxJ/B9OS7NTjVc5Hiij74PXJWwJEL2nDxIlJGQh+N67Iex13F2L?=
 =?us-ascii?Q?geA3V3nys/y1zyXzmW+2pAdhR5wZCsfrrAWq0mFW+5Bnz+0rVKQzBEKefCZk?=
 =?us-ascii?Q?ehl05f9jRokIE61iYM5XEPbc4xHqqfFzBvxcFO8N3WlP9R6IEt+E/ZbGUUyW?=
 =?us-ascii?Q?SIL6xcc5Ju+gWS9tymrxErBfFvzUGeE5xL7zusumbMQy1Tvlh1s/VMgsql2W?=
 =?us-ascii?Q?m97Vwlrny0fYNzDYZgmMChoi597wTC/NcAQhNeqSfG47b1nsSnzvl9kdL+6Z?=
 =?us-ascii?Q?i81iuERLisRHY/IdEn9i1l7Wlnt8bUESGAb7H5eWRH74qkJRL9B0OCJA2Wjo?=
 =?us-ascii?Q?uVQbroiF/I6cMweyvx+0Nxi0uNCP7wvysRHdS9yZANXZQy5wzbdhVLIGE+y3?=
 =?us-ascii?Q?YD9B6KiE2b1KFEOzXJHin6H0GoAXu80kD0TnXJc75bmk2UwqlVu18tqe/Pzz?=
 =?us-ascii?Q?3KTLBN/fxhNiN7+0yyOyfKoZ8bEPpx0hz2GLenhAeVecQncBaW9fMqC2qZEj?=
 =?us-ascii?Q?9AP0Ys3awW7jvyCN1ln3MXL/cGf4SAvcm0Fb1HkMLYc48gEU1XUOiP3fIkpi?=
 =?us-ascii?Q?MThSuS5ITl1Z2wtrxBSuLB6ZmgqmT0h/q+NDTt/mfkzbf4ti?=
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
X-MS-Exchange-CrossTenant-AuthSource: CYYPR12MB9014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e151ce08-b2b1-43c7-4be0-08df080c91ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 09:36:58.8298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alW9bax5nCmKCUml8a9JvVIOh01z/ae1ulCcDGIxqEu7dNSRjVAUOBw3dBH6bedH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5900

AMD General

Hi All,

A gentle reminder on this patch. When you have a chance, could you please r=
eview it and let me know if any changes are needed?

Thanks,
Rajesh G

>-----Original Message-----
>From: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
>Sent: Wednesday, July 29, 2026 3:48 PM
>To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Mauro Carvalho
>Chehab <mchehab@kernel.org>; Simek, Michal <michal.simek@amd.com>
>Cc: Gugulothu, Rajesh <rajesh.gugulothu@amd.com>; linux-media@vger.kernel.=
org;
>linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>Subject: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
>
>This update enables the vtc to set the pixel clock based on the specified =
timing
>parameters. A new fps field is added to struct xvtc_config and the pixel r=
ate is
>computed as fps * hsize * vsize.
>After setting the rate, the actual clock rate is read back and a warning i=
s emitted if it
>deviates beyond a small tolerance.
>
>The pixel rate is computed in unsigned long arithmetic to avoid a 32-bit o=
verflow in
>the fps * hsize * vsize product.
>
>Signed-off-by: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
>---
> drivers/media/platform/xilinx/xilinx-vtc.c | 19 +++++++++++++++++++
>drivers/media/platform/xilinx/xilinx-vtc.h |  1 +
> 2 files changed, 20 insertions(+)
>
>diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c
>b/drivers/media/platform/xilinx/xilinx-vtc.c
>index 92fec7bb4..695eb2a46 100644
>--- a/drivers/media/platform/xilinx/xilinx-vtc.c
>+++ b/drivers/media/platform/xilinx/xilinx-vtc.c
>@@ -141,6 +141,9 @@
>
> #define XVTC_GENERATOR_GLOBAL_DELAY           0x0104
>
>+/* Value of 1 =3D .01% */
>+#define XVTC_CLK_MAX_PCT_ERR                  1
>+
> /**
>  * struct xvtc_device - Xilinx Video Timing Controller device structure
>  * @xvip: Xilinx Video IP device
>@@ -175,10 +178,26 @@ int xvtc_generator_start(struct xvtc_device *xvtc,
>                        const struct xvtc_config *config)
> {
>       int ret;
>+      unsigned long s_rate;
>+      unsigned long g_rate;
>+      unsigned long clk_err;
>
>       if (!xvtc->has_generator)
>               return -ENXIO;
>
>+      s_rate =3D (unsigned long)config->fps * config->hsize * config->vsi=
ze;
>+      ret =3D clk_set_rate(xvtc->xvip.clk, s_rate);
>+      if (ret < 0)
>+              return ret;
>+
>+      /* Verify that the clock is within a reasonable tolerance. */
>+      g_rate =3D clk_get_rate(xvtc->xvip.clk);
>+      clk_err =3D (abs(g_rate - s_rate) * 10000) / (s_rate);
>+      if (clk_err > XVTC_CLK_MAX_PCT_ERR)
>+              dev_warn(xvtc->xvip.dev,
>+                       "Failed to set clk rate: %lu, actual rate: %lu\n",
>+                       s_rate, g_rate);
>+
>       ret =3D clk_prepare_enable(xvtc->xvip.clk);
>       if (ret < 0)
>               return ret;
>diff --git a/drivers/media/platform/xilinx/xilinx-vtc.h
>b/drivers/media/platform/xilinx/xilinx-vtc.h
>index 855845911..0f360ed55 100644
>--- a/drivers/media/platform/xilinx/xilinx-vtc.h
>+++ b/drivers/media/platform/xilinx/xilinx-vtc.h
>@@ -27,6 +27,7 @@ struct xvtc_config {
>       unsigned int vsync_start;
>       unsigned int vsync_end;
>       unsigned int vsize;
>+      unsigned int fps;
> };
>
> struct xvtc_device *xvtc_of_get(struct device_node *np);
>--
>2.34.1

