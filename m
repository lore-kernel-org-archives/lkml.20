Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020074.outbound.protection.outlook.com [52.101.156.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD772C21DF;
	Wed,  9 Sep 2026 03:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788926252; cv=fail; b=BDufnRf1OnNtScZVG2scYKYJoTOotGZhbMIDpN7+Vj4Vp+dQyh1aLQ0p+Qu+nE+fOajxyA/f4CzM/kwk8sdDaLlGbekxgm/SMVK4Q/Fd/09hJKEg/PeozpI4qjAFNDg9lHyHol6BREKdNOIWHq3bc9Bm7J0a21+l7Jix0/bT5J8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788926252; c=relaxed/simple;
	bh=uQXwAwEnIGs/epvHyhsC7vgHHwrg0WwRWmEHyk7rjyk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=had+kdhAe9D9ln/ZuZfNwxq5VV744WN6b7xsZdyJYLCsUIeN0HtJmr6HiyEMb693VvID5A0q6U9SIMo+VyafhBlUc3EOdqqcKLWZbFrPqyMqVxJp0BcVAkgADKsPRM10j4cUkGDcMA7JBCpytO9IRjj+wXw0HkvaPhRPl9cp+4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Jf42n01M; arc=fail smtp.client-ip=52.101.156.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Jf42n01M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iht1X05pq1zJjeITSQ0lOMPuZ0zr5JAsETskPy9PGPM4/03GlYdD1eVnlyrH1zXC9AX+w7oY2jHSmETa4okElCoE3+PlDaPKHlWA1xbXEIHWSGTuxyb3uorexAasx776HDXQYLjKsNAdW1hqEAFxrfY6j1DDt4dB9qS1hez7kb03K+IEeeokL1B4muBeSHVTuBLU2ZqRXjsY50d0ZrYENoTf5zQ6y31zDznB+G39gPB/xj4RXmkmrVED3Rt511bw+uh61GRlukDsVg4NyvJ3i/btVQGL+oH3rkFxa/eaM1Sv4GEob/1Otbk+zmcDHXhb1e/G2eSIH24PsRwowri2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEhJqUNzhZEmTy912O8ic1yJeFHM+esxrEsNWG+wR94=;
 b=cTHtR4spUZeiBhOYFVfkaJ2VJWVv25UCNtxOWP7CjcNX72TKuiTN6EodXT2ouzwp57c8iMBYgB82mu5XHF0/ua43/Nmcu1TlNzC6qm4tGD0Jh+Zg/zGPYRobR8THxaFIDbM//ix4AwIm66X10ewyzUdo1jeR7++/HPpMC/eA9ykAEXPFA4yKt8xsJAvCCMuvHxwvUDbH3qmJ7rTkQPVfopiFhReHBcuNkasPJ4SuUI2wRO12z3VZZ6kBCDgfGFbBeslG1EZGI1yZbs+a+O+6oXtNchvNRB21Mqc7PN50yLoO0zxJX2+QMJVQRIXVvXZZ71MhFnOxCYWgvX+m/zodig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEhJqUNzhZEmTy912O8ic1yJeFHM+esxrEsNWG+wR94=;
 b=Jf42n01MR+fOS+lop4DkTprZKf7MhYmNLwteS4tUtqLXi/99psQWE6owqN9dubJ8NDRzikoOPeYb025qhBftcRMbfyXa/Hs1tXcE1fI0XqyCkDfFAa/bOGYVa1KOETUdrz+tJUDQegJw220O1E1UXTWq2jFmQP2KEN3GkJ6tYR4H/wlcYPNqDrq4YiLg29tu3kS//Lzj23YCS3lzkPITgifWuismt7Xr9W7QkRcM/VKsvSnPoot9+xwoM8aTNwmTGarFo0Azpymca7fvRD7XQyytBPErP+MUqKnTuasjWyMOIqirlFyGGSzGToX4NGaLMZwuL00NrQ2j03VJ23pJYw==
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB290365.KORP216.PROD.OUTLOOK.COM (2603:1096:101:30e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 03:57:24 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 03:57:24 +0000
From: "jackson.lee" <jackson.lee@chipsnmedia.com>
To: Thorsten Lannynd <t-lannynd@ti.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "b-brnich@ti.com" <b-brnich@ti.com>, "k-willis@ti.com" <k-willis@ti.com>,
	"detheridge@ti.com" <detheridge@ti.com>, Nas Chung
	<nas.chung@chipsnmedia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: chips-media: wave5: Add system suspend/resume
 support
Thread-Topic: [PATCH] media: chips-media: wave5: Add system suspend/resume
 support
Thread-Index: AQHdDk2WIrrge8fQ8kC9ywJzcknW57bGAcaA
Date: Wed, 9 Sep 2026 03:57:24 +0000
Message-ID:
 <SLXP216MB11485404EB8CB32CE88FAFEEEDB02@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20260707201655.781174-1-t-lannynd@ti.com>
In-Reply-To: <20260707201655.781174-1-t-lannynd@ti.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE2P216MB290365:EE_
x-ms-office365-filtering-correlation-id: 6627ec90-2593-4b22-8c21-08df0e267522
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 L3uYmVBtNIIFU5GCAIH5VLS6kmf+iQZzxOZRFIiFFUfS51vP3Twp0vI99zc8kkLSxiHwLCGHUhIfhN6ywr3RDzMaIFhpbX/OXkrEgXlMfmEOB5KtpdJV5+YuVwYcX+RulW5JGZPVCNnM6B7PXdflmhgNu8gYmSv/N1N3PhQK31k9y71rDWqjVsGt/mrNB+qDLKMlqpyLwTQkqgRzYOv9gCYtTCe5vrUQmnsZWEKknaKt2YxoHWAYcN6trWPFYiwhuCHAKh70TRHHZeyj8FUdTqx6z5sS9v8xEdXL1yIVGXQdwO+RBV3jQEJGEJ4QoiHGKw3Hz6Qt/ToamgrUNKusx7vDAnt1DKkgD0SxSNkIO8opat/eGf5HMQ1Wy+N/osIx337qv+fPtoJTgnIno2n3nUTNIYDIo7yKukCLhmZH/A3ThIE+WOmzmDk4ZGJiE123mtyDKqgSPT28qdQDnA59cf8YRR4blyRc7lYud3qKyGzac8EDobepudu0X3ckGrzE2JexoLkD41Yxt1YXeO/VHC0+m4V/wpHJLeYfKydr3++x7deU/u9FM10wHnN6j5qMBPvvk4QxOgk8GveZVnbgUIDwZwTO0m6tTB7UCJ6JSlrtl2rvUY+XuDpMy8iUAemFYgGQwVktuAsSnlt06a09+g7cHPpL2V8CS6RY7DNAOfLtfop9FeBMwtuDkmXajAvDt5txmE60aU/B4Cl7aNiiXQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?f8/Lc2Z/niJlYFHUZOU7F1vcclGHc/NC1/KLSA25r2NLVgR99ewAorJ64xT+?=
 =?us-ascii?Q?BXkjl/WYRLs5R/ujNiaKPxK2/KTYjxX2PPq7ynhARgEKHlrkmpIezXN/hZjc?=
 =?us-ascii?Q?YpCvMkTL0l7BHcuTKUYXcJXGMp7EfgqXo/pFUrFbgnH0r/RlPCtaIMDFtCPc?=
 =?us-ascii?Q?7T5tOkbH/KrlAHHlqsT9XrUM+EIsVH4xTlYcB88DG+jjayvGrA+rvk3k/sFz?=
 =?us-ascii?Q?5zGiyjXViTvTDjKWnfnRvVzLT37SrkbfoK4auDIoxCz94Y+0992ig5VjLt84?=
 =?us-ascii?Q?45/Qson8+4bPfUedPphp5xLkG5tHRqYD3nW7PLjXiIRyb9BvCmEFkK/dIeHz?=
 =?us-ascii?Q?Vme/IdCz6yG6op72dqEeL6W/dqqMRGyvsMWfYifTCsI61N7MM38OBJ7FvXlu?=
 =?us-ascii?Q?/0GEkUqSoQymXOgg1x+f+HAuZ2xUNP9oHYCGeT9Z8cQ/0KUFVBwtmRaanCpx?=
 =?us-ascii?Q?ChqKOSePus4G+LxxgeBcF8Lrk+H1/BFXGpyEdXj5TV88UXEuBG6uIqryb9HY?=
 =?us-ascii?Q?u2xPvZEbY9fI2GfWWjn0EEfqyXfTfWxwkcbhHSxmdduIAr34kNFBPotOe61V?=
 =?us-ascii?Q?d4wXrZ9o7dax5xTEkQPoiyvAbmZYps41SX71zJIN5WB1PVpLDBdLNTIQNOuz?=
 =?us-ascii?Q?lxeGFfRnZF8TEzQVCpM8hlNJrZ6AAYjEkhA+VLdVGjT/fTfO5zzBfY1HZY9T?=
 =?us-ascii?Q?hh5Q6A84PmX3O9KRFhH5D+acUQ9HuqS9PztopzjkvG7BRuqCJJiGYLN3dDJ2?=
 =?us-ascii?Q?D5IRzrhQBoiVWCBDaadsGP6HXh7eMsgFGGlPvgJW09kMuSO5HxSNDddhUpiz?=
 =?us-ascii?Q?T+ieliIXkMYAgqoNL4raQn7GGk0U2UcRcTE8PXeE92eyQJOs3U3V2b5GBvmM?=
 =?us-ascii?Q?DAe1HXJ2jVNK6RIO1/pfRDutv8qmwonUtUgaHfLJgRPc8Jybg+lBqiaHpJKX?=
 =?us-ascii?Q?J+S2tsZbiSkfuvL3smbjVbHzFtiGBvWOtBy/BFkpNIRlsh5FN/SphChfcztA?=
 =?us-ascii?Q?ObqkNFkx8JjAn4nV6AzckWuvr/h1x8eXAvlYePsplMiAC3Sv7WdZ5m/+3erf?=
 =?us-ascii?Q?K9xP/7x3HrT8miIhF5HgvaeJJHIewhhpj2x5Kww7ARAG8sb8tz0N0/dF2Z7d?=
 =?us-ascii?Q?EvlgPdMQlvDCs/7VyuKB07qqRJ/12zSVAMgoJq/0d2rE5eifn8m59pdNG3D5?=
 =?us-ascii?Q?jJ/IrtPM2O9ehhc/V95wm39MIsj6X3yD3FKXCMT8IXmj7m6j67xoMkYUW1+2?=
 =?us-ascii?Q?Syc/fOz3YvZnG0OwsLZEEid24y72Llm06J+70hwbb3ffMFif/6gax7H8tA+t?=
 =?us-ascii?Q?QK82zoqWHgguYkFsRkxoqbALn39bY3Y8zc+wcsrSFGGataLzQO2Cw+mIw7Sk?=
 =?us-ascii?Q?YFyWXyYakUyKaxl5AFHc/S+PKdF/+8URdltsmN57347d47HIkFVVOeVBOVux?=
 =?us-ascii?Q?oTA8jyHEpEMIZR5afGIBHYOf4Eyitl1z/5GzJ37cLB6o4xSWwwGdv6HpnjjC?=
 =?us-ascii?Q?YkB/D7zjbvVN1gLx52gxAqG1hbbyD9pmBrf54PIkjbgnishCFi235H1I0mLN?=
 =?us-ascii?Q?fRBHG4ui6xi2d4QWAI7rXnZppwmDyHfYw/GfzPEQoSeMoUhS7IJybxij3KaU?=
 =?us-ascii?Q?KBK/GQkiH3rawRBmThl9bMFhuwWm7t+jxMRqENLkwXbtR623TEsOHVTmTyu4?=
 =?us-ascii?Q?fuZsmoEHlXsNVdriNYAcP2rSSP31MeDjVZVA93s4BTZanimzxlAOtN3ytqNt?=
 =?us-ascii?Q?MkQciMLFKg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6627ec90-2593-4b22-8c21-08df0e267522
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 03:57:24.6413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Anf5227lFbJ4DLCPv5idMp9rYsCeQ88hIvSSZ3Ijq4ZLITt1Pa32B6W4ytqb/shAIzXxvFJIp+QL9BXpjymSnxHFAnkuv/Xder+fF+onRxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB290365



> -----Original Message-----
> From: Thorsten Lannynd <t-lannynd@ti.com>
> Sent: Wednesday, July 8, 2026 5:17 AM
> To: linux-media@vger.kernel.org
> Cc: b-brnich@ti.com; k-willis@ti.com; detheridge@ti.com; Nas Chung
> <nas.chung@chipsnmedia.com>; jackson.lee <jackson.lee@chipsnmedia.com>;
> Mauro Carvalho Chehab <mchehab@kernel.org>; linux-kernel@vger.kernel.org
> Subject: [PATCH] media: chips-media: wave5: Add system suspend/resume
> support
>=20
> Add SET_SYSTEM_SLEEP_PM_OPS with wave5_system_suspend() and
> wave5_system_resume() so the driver handles system suspend to RAM. When
> suspended, Wave5 should gracefully finish the job and shutdown. When
> resumed, Wave5 should resume the context and finish executing the
> suspended stream.
>=20
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>

Reviewed-by: Jackson.Lee <jackson.lee@chipsnmedia.com>

thanks


> ---
>  .../platform/chips-media/wave5/wave5-vpu.c    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> index 76d57c6b6..a83640751 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -254,7 +254,37 @@ static __maybe_unused int wave5_pm_resume(struct
> device *dev)
>  	return ret;
>  }
>=20
> +static __maybe_unused int wave5_system_suspend(struct device *dev) {
> +	struct vpu_device *vpu =3D dev_get_drvdata(dev);
> +
> +	if (vpu->v4l2_m2m_dec_dev)
> +		v4l2_m2m_suspend(vpu->v4l2_m2m_dec_dev);
> +	if (vpu->v4l2_m2m_enc_dev)
> +		v4l2_m2m_suspend(vpu->v4l2_m2m_enc_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static __maybe_unused int wave5_system_resume(struct device *dev) {
> +	struct vpu_device *vpu =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (vpu->v4l2_m2m_dec_dev)
> +		v4l2_m2m_resume(vpu->v4l2_m2m_dec_dev);
> +	if (vpu->v4l2_m2m_enc_dev)
> +		v4l2_m2m_resume(vpu->v4l2_m2m_enc_dev);
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops wave5_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(wave5_system_suspend, wave5_system_resume)
>  	SET_RUNTIME_PM_OPS(wave5_pm_suspend, wave5_pm_resume, NULL)  };
>=20
> --
> 2.34.1

