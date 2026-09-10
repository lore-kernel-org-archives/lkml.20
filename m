Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C348C8D2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046514; cv=pass; b=LMCiw9s2uBdf9qfeuLOBimGZqitzHoPMEXrQ9ZxP7KCSqxzONhGFzDtAlh5jo7vVn+VaZmBYDqkTn7sMtXJj1QtsX7ogGRZzGkI3+VSdyFigf2nFwSN8Y72THlbgdwv7QNeK8RGUz4XFcn+fEz5pMDpcj1tzu4toLzzVupzmPuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046514; c=relaxed/simple;
	bh=c57HOSjkdRqhnHukNqC+HW9ZrUYHj7MI+zFHOAlpFJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8qra0KYBK8ugVS+cd6xjEDZ+cje7wKNI3FNSahhcgnYtohPWlgyCW+Z26WdT2GXeclN+hg1d9NMs8Rtrn+5ewNO6Qux0UKqd+oravNUmVT8SXeHW9emBQgU17n8ijV8Do2V0CImaEQHz1wOcNtGqZcx0p1sxC06Sk2yt1t2ztA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s31GrGnw; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s31GrGnw"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-79046478449so118354137.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789046507; cv=none;
        d=google.com; s=arc-20260327;
        b=eaC8kgqLNPm2fG4/RpZ+61Hac/TDGuwaHWu1AB3K+VUi45okrT0pG9aBCNdXikv+e+
         Djj8RJMGxPC6a3HZtKMp8/1nDPC8ohc6kRLOX2OPF+XnMDbRB6Cwa5sndCjQ3ZaDQyth
         PjrtApWB1LinxPwvCdS2WL5eBZwsj5zts0C6f3A7oQ1xa1QPGzmsT0ULXFkiqDPSyUHi
         +qv2f1/nNvfTmgaXJdcFRKwoZr+MWsc3/gSlHU6bBEgLld3j2Ii3CormORd3U4toUVIp
         w96PJPusQQlpaewvaPJKKkFNWy7W4ZH9Eax3kgOya11TFn4MTaJj5rXBPB7Z44ohsoI/
         7A9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4PtIkSiFzV3sIf3d9NLRzTCK6vH+MbAiKicnmJs6k5U=;
        fh=syZG6e0m+YN7lK4uQtMZ7s57kup9T1k2zzsMorvB+QU=;
        b=HVdg/GHxjLlChf2mkeCfqLEUCfWzdykkjJcAmgNCKShz3++3GOpcGU9csi5OLADkv3
         SgbrKqtqBtkJwUEorsRtP1FANgw8nzY0mAMmRIxOP83aHAdxdgqr04T8Ns8kkBNgsAFU
         3Gv5ftwzXbQyrxw3ARgcatWlOk9K5IzuhxECU27wuCX9z333gOCG/FP3rhu0FT0osGnK
         Qr+hdmxd+cHlb9MnJ8Q2voqvL1UMDbgx7uDEW7RjIiHfdjvWaSz7I00MqRC/uNvxkX1+
         KZalsgYC1hF/BPpbTKZfe0u6a4zuZ71GIR1RVF73MGyhHaYiVzllmt/smSGchnpZ09Q5
         GbBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789046507; x=1789651307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4PtIkSiFzV3sIf3d9NLRzTCK6vH+MbAiKicnmJs6k5U=;
        b=s31GrGnwevPNYdbe6fJsT2Ht3J1vq6tHd2g/a1uiRgzeROEVNetqMT1cJZU8rgrFw1
         CsE5zTsGI53iaep6x9/jMtwWbSwJ10YPN9etpniwyPMWe+E+gkxWF2BCwKPoNMkB821V
         IV7B8hsYhGkMaQA2JnQOky2YX4Q8jZM9DExrnUTqDJOMb57taXcad1iOjRFvAtNkdE0K
         XeEyeT0+VWGE9Tkoeygs9p+0wsYquwdW+xcP8OzrvGHqdqsXDx7xJBgZmFkTRfO8tz1+
         ffmGBxjqFk3sAMgRFEpY1Jg/OPZM2Y12R1U0MreHmJ9lchH4s/1d9Wd1bXvHhWvnG6qG
         UW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046507; x=1789651307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PtIkSiFzV3sIf3d9NLRzTCK6vH+MbAiKicnmJs6k5U=;
        b=qF8WEcnh3PHWre89fpDfHX2r1k800PUbb9a/HIjQ/qNO2nXrcBGinW9SJLoWq7cngB
         GGw0bsvYCSYfUg+N0hSirOPnFYL/bZ1hIZr2/O+gP1KpdmfW/KFdHyC6enSdp1pCB+oI
         +568NnXz3g2vcFcT0tSD+FzqKP1+4FsrgAmKFxmdp8b0PwzGEeYT2ZTmWE3Csjfda3Bc
         YITPcHLAinQui/NXFcwVdP9DK48VfT9HmIVu/mdFcZCMGoo4G6jWukjF0yiEHrnYMfih
         YlMwZDUW59LwKn2EGU0Pge3nl08VUFj7yN5C0+pyMwje7F4GBjRnB/+usjIcAmSlkztz
         j12A==
X-Forwarded-Encrypted: i=1; AKwUvBwgxsgpvoVI6/uuGGd2z0l10B5S2UtVa1CHdjSB78/2RqZCZmilNilyutGLBLud6TXAVivXOsL7jA11meE=@vger.kernel.org
X-Gm-Message-State: AFuF++kXCXqCp/3kWlPINtbCypejQp5rntkM2442c8uf7YnF1s17Acn1
	TR0JYsWdXyuHXVM4Fw9kJUZjn53cKH3VuZL3UPHFMLAG52WmInuSBGnNyiLjhKv0nWEtm+Imk0T
	fSskcdHHrykqeZO6q/9zWUAC/tl0HcNU=
X-Gm-Gg: AYBFou3BCP/yyB8iRQts4ZFjJtS6fkiKR9wq+ajhajAvNukc5saM7WQOlPETGp7AZVl
	MrWcLh8LVdyFf4xby3Dv0Y024wnzXrUzXy2Y/2fYTEg0YVDX8TOHDgHtT08H/+giQcwRknPDFy9
	p6vixJ3u+ETX/R39gSPNGgeOMSkOeBOeuDeT7hfjckts8V+WHNFwsAGAosdIvXoFXLg5p0vu+go
	V0knX7jexZoHoU1C61B4Ud2DZG9YSMdNWIG9CuvkGKJgw6d9to7qCmZOCXxXRzKHji2iUSOErXK
	cmsV9Y3XsdYVid2sI9f0iyfjW8HZxjfiwjjNXX0MtLv9h0lJt9/kA4PxCx9iCTkHJKjGZJRoc4v
	zRO6rkOzEm39qTeRq+n+WPSppbROj9oyN5HYzgkZbSA==
X-Received: by 2002:a67:cd93:0:b0:791:33c:9d1 with SMTP id ada2fe7eead31-791033c0c0amr737086137.1.1789046501887;
 Thu, 10 Sep 2026 06:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <MW4PR12MB6803F4CF9FA37FAE2FB0C5778EB02@MW4PR12MB6803.namprd12.prod.outlook.com>
 <20260909123443.88228-1-ed@aicharmers.com> <MW4PR12MB6803AED9EAA4A98576CC3F428EBF2@MW4PR12MB6803.namprd12.prod.outlook.com>
In-Reply-To: <MW4PR12MB6803AED9EAA4A98576CC3F428EBF2@MW4PR12MB6803.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Sep 2026 09:21:28 -0400
X-Gm-Features: AcwNN1UTe8M1-odt2iCgqossMzi7ldu5z1-OWpaSUlQIWuMy4BqVW8_dndwx5H8
Message-ID: <CADnq5_PNt5Huo-bk=tqdCLorUp3BDCtdGmaFJDxfVbcKx-CPoQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/pm: defer UCLK DPM enablement on Apple Navi 14
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Cc: Ed Schofield <ed@aicharmers.com>, 
	"atharvatiwarilinuxdev@gmail.com" <atharvatiwarilinuxdev@gmail.com>, 
	"062bel313@gmail.com" <062bel313@gmail.com>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Thu, Sep 10, 2026 at 6:40=E2=80=AFAM Feng, Kenneth <Kenneth.Feng@amd.com=
> wrote:
>
> AMD General
>
> Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
>
> -----Original Message-----
> From: Ed Schofield <ed@aicharmers.com>
> Sent: Wednesday, September 9, 2026 8:35 PM
> To: Feng, Kenneth <Kenneth.Feng@amd.com>
> Cc: atharvatiwarilinuxdev@gmail.com; 062bel313@gmail.com; amd-gfx@lists.f=
reedesktop.org; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Chr=
istian <Christian.Koenig@amd.com>; airlied@gmail.com; simona@ffwll.ch; dri-=
devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v2] drm/amd/pm: defer UCLK DPM enablement on Apple Navi 1=
4
>
> Apple Navi 14 boards 1002:7340/106b:0218 (revision 0x41) and
> 1002:7340/106b:0219 can time out when EnableAllSmuFeatures includes UCLK =
DPM, leaving amdgpu without a DRM device.
>
> Exclude only UCLK DPM from the initial allowed features and enable it sep=
arately in the Navi post-init callback. On 0218, enabling UCLK just after E=
nableAllSmuFeatures or at the start of default DPM table setup still timed =
out. The earlier 0218-only patch passed ten warm boots with UCLK enabled in=
 post-init. The earliest safe point remains unknown.
>
> Check the enabled firmware bit, update the supported-feature bit and rebu=
ild the memory DPM table and sustainable clock limits before the UMC workar=
ound and UMD clock setup. Validate the PPT memory states that
> DCN20 consumes before post-init. Preserve both memory-voltage features an=
d honor PP_MCLK_DPM_MASK.
>
> Combine Atharva Tiwari's delayed-UCLK proposal for 0219 with the Navi pos=
t-init implementation for 0218. Retain the revision restriction for
> 0218 and the revision-independent 0219 match from Atharva's proposal.
>
> The combined patch passed ten warm boots on 0218, with rendering and
> H.264 video decoding checks on every boot. Testing on 0219 is still pendi=
ng.
>
> Link: https://www.mail-archive.com/amd-gfx@lists.freedesktop.org/msg14977=
0.html
> Link: https://github.com/t2linux/kernel/issues/19#issuecomment-5537823876
> Assisted-by: Codex:GPT-6
> Signed-off-by: Ed Schofield <ed@aicharmers.com>
> ---
> Changes since the 0218-only RFC:
> - Add the 0219 board match from Atharva's proposal, without a revision
>   restriction. Keep the 0218 match limited to revision 0x41.
> - Keep the Navi post-init implementation and clock-state updates from
>   the RFC. Atharva's proposal enabled UCLK at the end of smu_late_init().
> - Record the failed tests at the start of default DPM table setup and
>   ten successful warm boots of the combined patch on 0218.
>
>  .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gp=
u/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index f8ca5eb9a..d7cc41a5d 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -60,6 +60,19 @@
>
>  static int navi10_init_ppt_limits(struct smu_context *smu);
>
> +static bool navi14_needs_late_uclk(struct amdgpu_device *adev) {
> +       struct pci_dev *pdev =3D adev->pdev;
> +
> +       return pdev->vendor =3D=3D PCI_VENDOR_ID_ATI &&
> +               pdev->device =3D=3D 0x7340 &&
> +               pdev->subsystem_vendor =3D=3D PCI_VENDOR_ID_APPLE &&
> +               ((pdev->subsystem_device =3D=3D 0x0218 &&
> +                 pdev->revision =3D=3D 0x41) ||
> +                pdev->subsystem_device =3D=3D 0x0219) &&
> +               (adev->pm.pp_feature & PP_MCLK_DPM_MASK); }
> +
>  static const struct smu_feature_bits navi10_dpm_features =3D {
>         .bits =3D {
>                 SMU_FEATURE_BIT_INIT(FEATURE_DPM_PREFETCHER_BIT),
> @@ -356,6 +369,11 @@ navi10_init_allowed_features(struct smu_context *smu=
)
>                 smu_feature_list_set_bit(smu, SMU_FEATURE_LIST_ALLOWED, F=
EATURE_MEM_MVDD_SCALING_BIT);
>         }
>
> +       /* These boards time out if EnableAllSmuFeatures includes UCLK DP=
M. */
> +       if (navi14_needs_late_uclk(adev))
> +               smu_feature_list_clear_bit(smu, SMU_FEATURE_LIST_ALLOWED,
> +                                          FEATURE_DPM_UCLK_BIT);
> +
>         if (is_asic_secure(smu) &&
>             (amdgpu_ip_version(adev, MP1_HWIP, 0) =3D=3D IP_VERSION(11, 0=
, 0)) &&
>             (adev->rev_id =3D=3D 0))
> @@ -470,6 +488,25 @@ static int navi10_store_powerplay_table(struct smu_c=
ontext *smu)
>         return 0;
>  }
>
> +/* DCN20 consumes these PPT states before the post-init UCLK enable. */
> +static int navi14_imac_check_uclk_states(struct smu_context *smu) {
> +       PPTable_t *ppt =3D smu->smu_table.driver_pptable;
> +       unsigned int count, i;
> +
> +       if (!navi14_needs_late_uclk(smu->adev))
> +               return 0;
> +
> +       count =3D ppt->DpmDescriptor[PPCLK_UCLK].NumDiscreteLevels;
> +       if (!count || count > ARRAY_SIZE(ppt->FreqTableUclk))
> +               return -EINVAL;
> +       for (i =3D 0; i < count; i++) {
> +               if (!ppt->FreqTableUclk[i])
> +                       return -EINVAL;
> +       }
> +       return 0;
> +}
> +
>  static int navi10_setup_pptable(struct smu_context *smu)  {
>         int ret =3D 0;
> @@ -490,6 +527,10 @@ static int navi10_setup_pptable(struct smu_context *=
smu)
>         if (ret)
>                 return ret;
>
> +       ret =3D navi14_imac_check_uclk_states(smu);
> +       if (ret)
> +               return ret;
> +
>         return navi10_init_ppt_limits(smu);
>  }
>
> @@ -3219,6 +3260,41 @@ static int navi10_enable_mgpu_fan_boost(struct smu=
_context *smu)
>                                                NULL);
>  }
>
> +/* Rebuild memory clocks before the UMC workaround and UMD clock setup.
> +*/ static int navi14_imac_late_uclk_enable(struct smu_context *smu) {
> +       struct smu_11_0_dpm_context *dpm =3D smu->smu_dpm.dpm_context;
> +       struct smu_dpm_table *table =3D &dpm->dpm_tables.uclk_table;
> +       PPTable_t *ppt =3D smu->smu_table.driver_pptable;
> +       struct smu_feature_bits enabled;
> +       int ret;
> +
> +       if (!navi14_needs_late_uclk(smu->adev))
> +               return 0;
> +
> +       ret =3D smu_cmn_feature_set_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT=
, true);
> +       if (ret)
> +               return ret;
> +       ret =3D smu_cmn_get_enabled_mask(smu, &enabled);
> +       if (ret)
> +               return ret;
> +       if (!smu_feature_bits_is_set(&enabled, FEATURE_DPM_UCLK_BIT))
> +               return -EIO;
> +
> +       smu_feature_list_set_bit(smu, SMU_FEATURE_LIST_SUPPORTED,
> +                                FEATURE_DPM_UCLK_BIT);
> +       table->clk_type =3D SMU_UCLK;
> +       ret =3D smu_v11_0_set_single_dpm_table(smu, SMU_UCLK, table);
> +       if (ret)
> +               return ret;
> +       if (!table->count)
> +               return -EINVAL;
> +       if (!ppt->DpmDescriptor[PPCLK_UCLK].SnapToDiscrete)
> +               table->flags |=3D SMU_DPM_TABLE_FINE_GRAINED;
> +
> +       return smu_v11_0_init_max_sustainable_clocks(smu);
> +}
> +
>  static int navi10_post_smu_init(struct smu_context *smu)  {
>         struct amdgpu_device *adev =3D smu->adev; @@ -3227,6 +3303,12 @@ =
static int navi10_post_smu_init(struct smu_context *smu)
>         if (amdgpu_sriov_vf(adev))
>                 return 0;
>
> +       ret =3D navi14_imac_late_uclk_enable(smu);
> +       if (ret) {
> +               dev_err(adev->dev, "Failed to enable late UCLK DPM: %d\n"=
, ret);
> +               return ret;
> +       }
> +
>         ret =3D navi10_run_umc_cdr_workaround(smu);
>         if (ret)
>                 dev_err(adev->dev, "Failed to apply umc cdr workaround!\n=
");
>
> base-commit: c22f9a61e288580824edbbc3ae5a29c9a338594f
> --
> 2.55.0
