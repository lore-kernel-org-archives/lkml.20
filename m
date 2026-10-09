Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828363546DF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558952; cv=none; b=Rb+TVNSVOIWpxO+666mpwR8OMW0Zhl2VXOqfgXTTk6mHmve2VzXD4VwQsyT+2yqp65Xc40h06H3BKCQ8Rgm6Q3efoEUuyhpfZJuewSA3xCpd4H0f66KsjW+ccrL+gbOSrp4TDA3UEl5u6Cn1eZawUtwcIo0dmFq7wbHLeveASk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558952; c=relaxed/simple;
	bh=r/WHkbVyybyZQ1LlyN5FyLuD1RrUb1aDMYV1OPx3h0Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qd0P/HnyJqgCi6mhqX5MUlnqrnJMwxImtwn+Vb73d+Kp2qTMXhvc4gHwcfNMntrEB/2L4SzbfRkwXCs9hPNe9AyAJKUsNeez41VqTigizo3QmLxYUyRBXbOIyNFXdGeQ14YwGw8IlH3A9uWbFgQp0b4Ss0lg6SXd+pJc20LTaaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsOaLSQh; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsOaLSQh"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-49e1dbfe15eso1903184fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791558950; x=1792163750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cd/NKQgH/SPcEVf62kJ3YHPeBmhuQBl0/uewYv3guOw=;
        b=WsOaLSQhFrwp0YPNpdanGuzm77Lu6TlstY/x61/RibDkGJJRrkdZ8VsdvxbvFSYzWe
         bNEWYoSaEEOdUdY8PFKwoYUZAxTzI0YZ75ffMV4Wju200XaE7He/YFqnOzbC8AbOGaHQ
         jpqgqZOM26cx2UrSw3mlnoW5qod3wTQoh5hHdFMyepU2CiaBXdcJyOesKa07fGHylK+3
         RGHq6AyRyn/NWdK/fCBTN85HJ8n50CL0yDvNgeo4pidhfskKekMcxH55fijJVLr4D0q6
         dnN1MxsSRgXNOenfjxWIrUG8a6/6JS5d/VWE3Wzho3uZgM9cB6T/Wzkkt+kqaaHlwgjF
         zr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558950; x=1792163750;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd/NKQgH/SPcEVf62kJ3YHPeBmhuQBl0/uewYv3guOw=;
        b=fH9lNW/EmZc5q97+AYJggLdVDUT93cmvEwE+2wXMgP5pFQdKiBxb+QGE36dzsP4T4E
         bpTBgkJ+ovm6AdNrVvo8EIkczZCPBhq43tK49D68xsmG3EbSSJbN1kX5jwcQe7sTO83E
         gMJFSBUZ/UTw88ykseeWDRxMUCr1Qcoxlxp/tZhaSmIWGLg+ZJSjMyXAgbbDa6QAYrs6
         /dO6xbGXlKDScw7fhw/J1ot+53lAmE7dHxk2CoL1RdA+W+9inI1GJEyUPEPG6TTjZuVV
         dDrcRaVutCBX426w0WO4iH8oSojgmFWYvuyueH6ssCXyjClEmJ5HKvTd2nrCJu/fQW0K
         wtbw==
X-Forwarded-Encrypted: i=1; AKwUvBxIAU8vQ5o8ajAMwsbQCBWW9LBRM5g5eX+ssuodSg2KTmIIiqL9o1AZUGCquigkoDWJyxW4HbjiLUQjO2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTQDnFyAmBpIWNSY/hFaTHNEQw8nPl8K57MmndqLIvvhtv4ZNw
	15Rb4jwYg5vfIFwCaFLfCmNXNZKRSIF3viLfmxG88S2lQ60M+FPnO9sc
X-Gm-Gg: AYBFou3hs12Ex2QeIK+SblM3gzkJOihAwpBAgwaoHFOBF91JPLX3mwY70vixlxHF1A2
	HLnwVMvVics0bGEAQTQ+o1TmNN88MHPil//weIti7CYIApFfZDCGgf6EfJPZW4k/rlBlyO2jn/e
	NU2/dvGYn+ZQ9CBMR6pWoSRyJs8RqrFO+69j48zuGqb3lJktYzpzaxl4GrKR+cmXVBwgb2d3wxs
	Neb9XYQi1aB6adzksaqRGWXbjG6GT8h9J/UlhP9VDNkUy2eM1H6QdUhe+SZJQcKhcOaYKtWpQaA
	o5nrWfrN81peezceNt46OVjjCJTALoJd9Ted9zoq+C5geDiRcRUWeF1iEcwNVVprKiMwTbwpyPb
	KZUX8/VviFRze4SCVhwOX3wBu1iq5Fd3spIPdu3zWpZWKJiKb+V/mclw+DPiisp3n77GFKMk6m0
	+ExVx/MPOJmCqVPfcvrbZBDaV0dZf8C4G4fgyrlZNwlUNETudoVQarWIXhfl1oEE2Z3ADaAb+ri
	1duanaMQM4O42P8+tZO1BnCHvCPniX7vm20ZHs6OAWKOLd9V9TcbQZAWmTFbNqR0/q6iosDAun8
	JhQ=
X-Received: by 2002:a05:6870:f213:b0:48f:e107:8e48 with SMTP id 586e51a60fabf-4a2a8911601mr1832630fac.41.1791558950273;
        Fri, 09 Oct 2026 08:15:50 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a86317a5sm1904867fac.17.2026.10.09.08.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 08:15:49 -0700 (PDT)
Date: Fri, 09 Oct 2026 08:15:46 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>
CC: Charles <hanker007@gmail.com>, Navon John Lukose <navonjohnlukose@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_03/12=5D_platform/x86=3A_lenovo-wmi-cap?=
 =?US-ASCII?Q?data=3A_Only_allocate_sub-master_info_when_necessary?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-3-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe> <20261009-lwmi-wmi-new-api-v2-3-402828382679@rong.moe>
Message-ID: <807F11B7-33B6-454F-B550-F516E974703B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 9, 2026 5:53:45 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>When capdata00 declares no fan test support, there is no need to
>allocate sub-master info as it's basically unused except for the
>priv->sub_master->sub_component_list =3D=3D ERR_PTR(-ENODEV) placeholder=
=2E
>
>Therefore, only allocate priv->sub_master when necessary, otherwise its
>absence implies the absence of sub-component=2E With that,
>PTR_ERR(sub_component_list) =3D=3D -ENODEV is repurposed for the followin=
g
>changes to represent stubbed sub-component=2E
>
>Signed-off-by: Rong Zhang <i@rong=2Emoe>
>---
> drivers/platform/x86/lenovo/wmi-capdata=2Ec | 36 ++++++++++++++++++-----=
--------
> 1 file changed, 21 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-capdata=2Ec
>index 58787da959b4=2E=2E3a823aee608a 100644
>--- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>+++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>@@ -101,9 +101,11 @@ struct lwmi_cd_priv {
> 	struct lwmi_cd_sub_master_priv {
> 		struct device *master_dev;
> 		cd_list_cb_t master_cb;
>-		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies no sub=
-component=2E */
>+		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies stubbe=
d
>+						     * sub-component=2E
>+						     */

Hi Rong,

Hitting the column limit here looks ugly and harms readability IMO=2E Perh=
aps we could rename the variable (sc_list?) or be less explicit about the f=
ull error signature?
- Derek

> 		bool registered;                    /* Has the sub-master been registe=
red? */
>-	} *sub_master;
>+	} *sub_master;                              /* NULL impLnlies no sub-co=
mponent=2E */
> };
>=20
> struct cd_list {
>@@ -258,6 +260,12 @@ static int lwmi_cd_component_bind(struct device *cd_=
dev,
> 	case LENOVO_CAPABILITY_DATA_00:
> 		binder->cd00_list =3D priv->list;
>=20
>+		/* Missing sub-master info implies missing sub-component=2E */
>+		if (!priv->sub_master) {
>+			binder->cd_fan_list_cb(om_dev, NULL);
>+			break;
>+		}
>+
> 		priv->sub_master->master_dev =3D om_dev;
> 		priv->sub_master->master_cb =3D binder->cd_fan_list_cb;
> 		lwmi_cd_call_master_cb(priv);
>@@ -288,13 +296,9 @@ static void lwmi_cd_component_unbind(struct device *=
cd_dev,
> {
> 	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
>=20
>-	switch (priv->list->type) {
>-	case LENOVO_CAPABILITY_DATA_00:
>+	if (priv->sub_master) {
> 		priv->sub_master->master_dev =3D NULL;
> 		priv->sub_master->master_cb =3D NULL;
>-		return;
>-	default:
>-		return;
> 	}
> }
>=20
>@@ -369,17 +373,19 @@ static int lwmi_cd_sub_master_add(struct lwmi_cd_pr=
iv *priv,
> 	struct component_match *master_match =3D NULL;
> 	int ret;
>=20
>+	/*
>+	 * If the sub-master has no sub-component, there is no need to allocate
>+	 * or register the sub-master=2E The master callback will be called wit=
h
>+	 * NULL on master <-> sub-master bind to inform the master about the
>+	 * absence of sub-component=2E
>+	 */
>+	if (sub_component_type =3D=3D CD_TYPE_NONE)
>+		return 0;
>+
> 	priv->sub_master =3D devm_kzalloc(&priv->wdev->dev, sizeof(*priv->sub_m=
aster), GFP_KERNEL);
> 	if (!priv->sub_master)
> 		return -ENOMEM;
>=20
>-	if (sub_component_type =3D=3D CD_TYPE_NONE) {
>-		/* The master callback will be called with NULL on bind=2E */
>-		priv->sub_master->sub_component_list =3D ERR_PTR(-ENODEV);
>-		priv->sub_master->registered =3D false;
>-		return 0;
>-	}
>-
> 	/*
> 	 * lwmi_cd_match() needs a pointer to enum lwmi_cd_type, but on-stack
> 	 * data cannot be used here=2E Steal one from lwmi_cd_table=2E
>@@ -404,7 +410,7 @@ static int lwmi_cd_sub_master_add(struct lwmi_cd_priv=
 *priv,
>  */
> static void lwmi_cd_sub_master_del(struct lwmi_cd_priv *priv)
> {
>-	if (!priv->sub_master->registered)
>+	if (!priv->sub_master || !priv->sub_master->registered)
> 		return;
>=20
> 	component_master_del(&priv->wdev->dev, &lwmi_cd_sub_master_ops);
>

