Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634708;
	b=bQ4oiqfI7UEx01gnyn3JH0yF0HnGpllrWTHbttL/M8XcR3OQ9aQv+zzneBfRY8LGgZot
	 1jU7ACgPu4D4uMHkp7P9m0LZhyg66NRBemg/HNqi5fCa8Hf9E9emTsCZUngt0lCh6ZMVr
	 +QToW5+QDOsfeWFgwTidOV7fVpFqvccZm0gNVMOytDZe7Dsa3RoSxzxkVW+qWHSmGXFmd
	 hoWnb/sK2X5KCSrrb9sEolRh4QsCNCu47Nhf3+gMzUlcUJviSJnN4faM/pJtuwZg1Raq3
	 5NyWLtbFjMQRkwnkAnY428loZOOoWnLssU0QCYrj3F9gDUanm646dfwk6X9uSII71yQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nOCgKoJdIhSObbuGxZ7xKscGyZkjtDdaeTHB5AW5EkM=;
	b=CofU4VIk51bTgtyPmaoXzGzzGXFJADtoMi4HOxG912UzM0uAXa5xclLW6DnJsqJ/L8y9
	 S1BZdRmG15K2k1MPGyGhl6hY74TGSAUWWMlDQ/uPXiGnSAry876UpPOb7X7Ck0P/gGEfR
	 L2iK31vUHwLMsQ+Q8eY8sgq7yqH61r/X/1FWSbzI+33+Qf9FDrlSQ8rsmbrjt2vrf9pC8
	 BRYeDY3NTlQBt7AKZKHJ6IGynBF2iOcXAq/mmGsRVinvsHhh5i+dCMhkpOAM5RC2IR48l
	 f56D7oYt+GWwX8XXscx3rnfhEEBMJNBiDCMHetGYy8SwsV9uFCocXYWaG84dhevfSMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AFkgrfP3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCE06079906
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDCE06079906
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AFkgrfP3
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb0c80318cso139361a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:51:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793634707; cv=none;
        d=google.com; s=arc-20260327;
        b=qllf/k4KTxahzEUuLIDGQMIdaHBpl/RXWtoumctpJSamglsMi0k1QlF1YE5Q8EkdYd
         raR0DtPA9WnGXAoy7y7qwFkA/jQrLgHirThyz9WK0fzwrEOM53lBG6wXhrM2hOqG88S9
         Z9w5g11ihBktq5ReHwM1Pewv0Q+gpKRuTnpSGnt3g2i8imeDP0pFRaTE3ulKQhHBnT3k
         zPCPzToiKZqTiserKqEkabrt3xRQ/tV4WKNlE5TGlYVM/CDcvhAuSq4WQP9PJ8+/b9In
         YSRcu2LZAdq6aOSEnkKzPuEtd4njGxwhFpS2Al+IH33eKswIBCtkJS1dujVsmqnVWUp+
         P1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nOCgKoJdIhSObbuGxZ7xKscGyZkjtDdaeTHB5AW5EkM=;
        fh=ijz6HIutAlGQwgibPjf31qErJahQM8tKjQdP6l3Qcis=;
        b=aWVvlR494iT0HiOOpL0D5Dzs0NZ3CCRT0782+EuQiTzyQ8oYBKkudQS0CoAsurymQ4
         f/vUg14aHmpk0z6idD0jK+gN/r7cE2oPNJnlTeBx7UnwBvbhssq6CNYQucFeu5KnbXhm
         +28zzTRsmxYfiU7X3ltORew9YM0mNUd6LkJolo0rJJd4Kii3DZChL8x5OL96HUPx+GBZ
         EJSAHRdtYfZJ08wuT2zuGcjftZ28dcgsPO3ryoM2nxEjiJN84IBkzSiUVpA0+MGsqZrf
         6Dx3fbNbh9SDgQJLXauTZG9pVdi9kNX36DIHkhvYBiySONvVPpQioWd88T1YDyg/ov33
         bslA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634707; x=1794239507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOCgKoJdIhSObbuGxZ7xKscGyZkjtDdaeTHB5AW5EkM=;
        b=AFkgrfP3eZEkNC4h3hExBJwzEDLfBpcht8jrC/teFI3b5R0fXev9o5F7PSBMXPq54G
         nYoZdNAMvUScbMc9HbGLZZ8uWZqnV3aVBV97iuf2tmGDZieU5m2dv1Ztf/LirZFx6Leh
         0bYGxMPumyPBrGDj4bL/5VGAt2GRPPL0U3yC/i5zTXO+doqn7EN5MhGuYnkzM0KBj9fe
         S/z2UilVXNGsI5GMCiatWgGKD6/aRl+r9JZucDW/I0egaYFvd5H5eLvg4g4AMhadIlna
         FqAMJZ6XxZoorGKzcup5ghbTWrlk6MwKPMeBHTeJBkGsMRMNrcXrbea3mLLklDTXBX3N
         O2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634707; x=1794239507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOCgKoJdIhSObbuGxZ7xKscGyZkjtDdaeTHB5AW5EkM=;
        b=B9JZIn1EpnATW/2HvfDNWpMf9cXgwvZPHR7DfoqO3WTDOZ6fe9YGBtt38s5E7Xs9V5
         pB6/EbxyqVtbWzFJtL8In14ZVPGrqiSBhifywWdpctSvjSCFtUB5dUQ1EeuUcQSEdY2/
         ZI0XMbgEPD1Heg4d8myTWrOa03kMVIv8qqa8KudfBWI4eUQ4aQWiJS74lD8AJscYzXuC
         Bo+NCQpPS+gx9y+9iQuEztrNRj+k20u+D/ewmorBSrDN8YHgWLUsJUb486FC1Ln/z3b7
         cwJXd/ZfGsXGchyGSdCXOi2mE4tpKqUE3w+hVBQPKgPwSLxxpMCfvCKB8ASgwZ+ManCu
         cX6g==
X-Forwarded-Encrypted: i=1; AKwUvBzchfVE4/rZ0LSs/n4hDwTArRrgsU64ZqSM6jJrgAqAxHwXn3l3CIMsKs7wprc8WloflDKUwFzh/IHGn3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LlYA3fL5g+uQoQVx5UhCGSORp5sZs3XbqGobUgn+dDTfxVOjA
	/tpCN/BSAiiKssSD7fjkYnQoTmBCT5Llphg2XCf6Hxvi5eIeUTUX2GeidQrS16qgG7IYF6NRGBG
	NUisNz1K044EWunnKkPNzWGngUqGYxyM=
X-Gm-Gg: AYBFou3pDVZHrtjSSR+wmQnjhrVfMM3b+TJyuOjGORxX6hsbcshNTappOheaf5UMc8t
	3S5zsQtxj6cI6EqDn5HOFbmdz1PAwO7ZIROzG0vIKLDC4BXpSN47ia4JZ0lrUMRolHcJihy1j0Z
	f8m9hIWPOEQ0vCQu46cj9HG2oU/q+hOtwUb4FpgkfaV3ke+ypat+E2L1t9kAIFcme51rS3Lk0wB
	aGtODnVrYYIz43CvDTLZdbq2i49LKH07CH4VU0T5hmPie/Ov/bV7BTOUHKeNXRz6X0cHap2HDj5
	IGO1m2d8rv/sRZrR9wSTdZJaMPCo+eOE2pRJkyaM8+ZOq+Dpg51tSObu6ihzccqaiCijlVMbN9C
	QM5iN4S+8gg+JE/xjNkBKKxnyAGM7zpqqDgykAHX9qlOt3CzkqMXfZ0K8h9dfN0Tr7IeJMmhrFL
	sOHDJL8XCx70DbfN4BaQV0ZtiO
X-Received: by 2002:a17:903:37cf:b0:2e9:6468:2005 with SMTP id
 d9443c01a7336-2eb3648cd80mr155350785ad.2.1793634707021; Mon, 02 Nov 2026
 07:51:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260114163807.2525868-1-ingyujang25@korea.ac.kr> <20261101132405.1387745-1-ingyujang25@korea.ac.kr>
In-Reply-To: <20261101132405.1387745-1-ingyujang25@korea.ac.kr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2026 10:51:35 -0500
X-Gm-Features: AclHuK_dNc-WbpSUdvsrzWpZry_6vBxHfWOCNfPxLRPLLxJ6Y7fVPrrrC1rt0jw
Message-ID: <CADnq5_MU1M1_7gsQFv_+B4r-YNa6yQ0WTCiO1_DAahwmshDWUg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/pm: remove dead code in smu7_patch_dependency_tables_with_leakage()
To: Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: Alex Deucher <alexander.deucher@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 8:31=E2=80=AFAM Ingyu Jang <ingyujang25@korea.ac.kr>=
 wrote:
>
> The smu7_patch_*() helpers called in this function only call the void
> smu7_patch_ppt_v0_with_vdd_leakage() and always return 0, so the error
> checks on their return values can never be true.
>
> Make the helpers and smu7_patch_dependency_tables_with_leakage() return
> void, and remove the dead checks.
>
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>

Reviewed and applied.  Thanks!

Alex

> ---
> Changes in v2:
> - Make the smu7_patch_*() helpers and
>   smu7_patch_dependency_tables_with_leakage() return void, as suggested
>   by Alex Deucher.
> - Rebase onto current mainline.
>
> Link to v1: https://lore.kernel.org/all/20260114163807.2525868-1-ingyujan=
g25@korea.ac.kr/
>
>  .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 117 +++++-------------
>  1 file changed, 30 insertions(+), 87 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> index bdf1e489369e6..dafe25b1efb65 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> @@ -2672,8 +2672,8 @@ static void smu7_patch_ppt_v0_with_vdd_leakage(stru=
ct pp_hwmgr *hwmgr,
>  }
>
>
> -static int smu7_patch_vddc(struct pp_hwmgr *hwmgr,
> -                             struct phm_clock_voltage_dependency_table *=
tab)
> +static void smu7_patch_vddc(struct pp_hwmgr *hwmgr,
> +                           struct phm_clock_voltage_dependency_table *ta=
b)
>  {
>         uint16_t i;
>         struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend)=
;
> @@ -2682,12 +2682,10 @@ static int smu7_patch_vddc(struct pp_hwmgr *hwmgr=
,
>                 for (i =3D 0; i < tab->count; i++)
>                         smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->e=
ntries[i].v,
>                                                 &data->vddc_leakage);
> -
> -       return 0;
>  }
>
> -static int smu7_patch_vddci(struct pp_hwmgr *hwmgr,
> -                              struct phm_clock_voltage_dependency_table =
*tab)
> +static void smu7_patch_vddci(struct pp_hwmgr *hwmgr,
> +                            struct phm_clock_voltage_dependency_table *t=
ab)
>  {
>         uint16_t i;
>         struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend)=
;
> @@ -2696,12 +2694,10 @@ static int smu7_patch_vddci(struct pp_hwmgr *hwmg=
r,
>                 for (i =3D 0; i < tab->count; i++)
>                         smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->e=
ntries[i].v,
>                                                         &data->vddci_leak=
age);
> -
> -       return 0;
>  }
>
> -static int smu7_patch_vce_vddc(struct pp_hwmgr *hwmgr,
> -                                 struct phm_vce_clock_voltage_dependency=
_table *tab)
> +static void smu7_patch_vce_vddc(struct pp_hwmgr *hwmgr,
> +                               struct phm_vce_clock_voltage_dependency_t=
able *tab)
>  {
>         uint16_t i;
>         struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend)=
;
> @@ -2710,13 +2706,11 @@ static int smu7_patch_vce_vddc(struct pp_hwmgr *h=
wmgr,
>                 for (i =3D 0; i < tab->count; i++)
>                         smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->e=
ntries[i].v,
>                                                         &data->vddc_leaka=
ge);
> -
> -       return 0;
>  }
>
>
> -static int smu7_patch_uvd_vddc(struct pp_hwmgr *hwmgr,
> -                                 struct phm_uvd_clock_voltage_dependency=
_table *tab)
> +static void smu7_patch_uvd_vddc(struct pp_hwmgr *hwmgr,
> +                               struct phm_uvd_clock_voltage_dependency_t=
able *tab)
>  {
>         uint16_t i;
>         struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend)=
;
> @@ -2725,12 +2719,10 @@ static int smu7_patch_uvd_vddc(struct pp_hwmgr *h=
wmgr,
>                 for (i =3D 0; i < tab->count; i++)
>                         smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->e=
ntries[i].v,
>                                                         &data->vddc_leaka=
ge);
> -
> -       return 0;
>  }
>
> -static int smu7_patch_vddc_shed_limit(struct pp_hwmgr *hwmgr,
> -                                        struct phm_phase_shedding_limits=
_table *tab)
> +static void smu7_patch_vddc_shed_limit(struct pp_hwmgr *hwmgr,
> +                                      struct phm_phase_shedding_limits_t=
able *tab)
>  {
>         uint16_t i;
>         struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend)=
;
> @@ -2739,12 +2731,10 @@ static int smu7_patch_vddc_shed_limit(struct pp_h=
wmgr *hwmgr,
>                 for (i =3D 0; i < tab->count; i++)
>                         smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->e=
ntries[i].Voltage,
>                                                         &data->vddc_leaka=
ge);
> -
> -       return 0;
>  }
>
> -static int smu7_patch_samu_vddc(struct pp_hwmgr *hwmgr,
> -                                  struct phm_samu_clock_voltage_dependen=
cy_table *tab)
> +static void smu7_patch_samu_vddc(struct pp_hwmgr *hwmgr,
> +                                struct phm_samu_clock_voltage_dependency=
_table *tab)
>  {
>         uint16_t i;
>         struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend)=
;
> @@ -2753,12 +2743,10 @@ static int smu7_patch_samu_vddc(struct pp_hwmgr *=
hwmgr,
>                 for (i =3D 0; i < tab->count; i++)
>                         smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->e=
ntries[i].v,
>                                                         &data->vddc_leaka=
ge);
> -
> -       return 0;
>  }
>
> -static int smu7_patch_acp_vddc(struct pp_hwmgr *hwmgr,
> -                                 struct phm_acp_clock_voltage_dependency=
_table *tab)
> +static void smu7_patch_acp_vddc(struct pp_hwmgr *hwmgr,
> +                               struct phm_acp_clock_voltage_dependency_t=
able *tab)
>  {
>         uint16_t i;
>         struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend)=
;
> @@ -2767,12 +2755,10 @@ static int smu7_patch_acp_vddc(struct pp_hwmgr *h=
wmgr,
>                 for (i =3D 0; i < tab->count; i++)
>                         smu7_patch_ppt_v0_with_vdd_leakage(hwmgr, &tab->e=
ntries[i].v,
>                                         &data->vddc_leakage);
> -
> -       return 0;
>  }
>
> -static int smu7_patch_limits_vddc(struct pp_hwmgr *hwmgr,
> -                                 struct phm_clock_and_voltage_limits *ta=
b)
> +static void smu7_patch_limits_vddc(struct pp_hwmgr *hwmgr,
> +                                  struct phm_clock_and_voltage_limits *t=
ab)
>  {
>         uint32_t vddc, vddci;
>         struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend)=
;
> @@ -2787,11 +2773,9 @@ static int smu7_patch_limits_vddc(struct pp_hwmgr =
*hwmgr,
>                                                    &data->vddci_leakage);
>                 tab->vddci =3D vddci;
>         }
> -
> -       return 0;
>  }
>
> -static int smu7_patch_cac_vddc(struct pp_hwmgr *hwmgr, struct phm_cac_le=
akage_table *tab)
> +static void smu7_patch_cac_vddc(struct pp_hwmgr *hwmgr, struct phm_cac_l=
eakage_table *tab)
>  {
>         uint32_t i;
>         uint32_t vddc;
> @@ -2804,63 +2788,22 @@ static int smu7_patch_cac_vddc(struct pp_hwmgr *h=
wmgr, struct phm_cac_leakage_ta
>                         tab->entries[i].Vddc =3D (uint16_t)vddc;
>                 }
>         }
> -
> -       return 0;
>  }
>
> -static int smu7_patch_dependency_tables_with_leakage(struct pp_hwmgr *hw=
mgr)
> +static void smu7_patch_dependency_tables_with_leakage(struct pp_hwmgr *h=
wmgr)
>  {
> -       int tmp;
> -
> -       tmp =3D smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_o=
n_sclk);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_o=
n_mclk);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_vddci(hwmgr, hwmgr->dyn_state.vddci_dependency=
_on_mclk);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_o=
n_display_clock);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_vce_vddc(hwmgr, hwmgr->dyn_state.vce_clock_vol=
tage_dependency_table);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_uvd_vddc(hwmgr, hwmgr->dyn_state.uvd_clock_vol=
tage_dependency_table);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_samu_vddc(hwmgr, hwmgr->dyn_state.samu_clock_v=
oltage_dependency_table);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_acp_vddc(hwmgr, hwmgr->dyn_state.acp_clock_vol=
tage_dependency_table);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_vddc_shed_limit(hwmgr, hwmgr->dyn_state.vddc_p=
hase_shed_limits_table);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_limits_vddc(hwmgr, &hwmgr->dyn_state.max_clock=
_voltage_on_ac);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_limits_vddc(hwmgr, &hwmgr->dyn_state.max_clock=
_voltage_on_dc);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       tmp =3D smu7_patch_cac_vddc(hwmgr, hwmgr->dyn_state.cac_leakage_t=
able);
> -       if (tmp)
> -               return -EINVAL;
> -
> -       return 0;
> +       smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_on_sclk);
> +       smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_on_mclk);
> +       smu7_patch_vddci(hwmgr, hwmgr->dyn_state.vddci_dependency_on_mclk=
);
> +       smu7_patch_vddc(hwmgr, hwmgr->dyn_state.vddc_dependency_on_displa=
y_clock);
> +       smu7_patch_vce_vddc(hwmgr, hwmgr->dyn_state.vce_clock_voltage_dep=
endency_table);
> +       smu7_patch_uvd_vddc(hwmgr, hwmgr->dyn_state.uvd_clock_voltage_dep=
endency_table);
> +       smu7_patch_samu_vddc(hwmgr, hwmgr->dyn_state.samu_clock_voltage_d=
ependency_table);
> +       smu7_patch_acp_vddc(hwmgr, hwmgr->dyn_state.acp_clock_voltage_dep=
endency_table);
> +       smu7_patch_vddc_shed_limit(hwmgr, hwmgr->dyn_state.vddc_phase_she=
d_limits_table);
> +       smu7_patch_limits_vddc(hwmgr, &hwmgr->dyn_state.max_clock_voltage=
_on_ac);
> +       smu7_patch_limits_vddc(hwmgr, &hwmgr->dyn_state.max_clock_voltage=
_on_dc);
> +       smu7_patch_cac_vddc(hwmgr, hwmgr->dyn_state.cac_leakage_table);
>  }
>
>
> --
> 2.34.1
>
