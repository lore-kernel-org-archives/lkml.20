Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793311082;
	b=BInc6vbGnwpsifll7udTHxdnrRAnZoSCPMCZ5WG21tWa7z/eV4JbebVHmSbtR8l1zwpj
	 VdpDrG7QwhCODpJZJ6bR8XaERAlcTZIieiQi7aaozrsQVIxX/WyPZjjlJmGL9B49jUrtU
	 4UGh7I241uPKat0Walv+PdBaF6DwDk8rgM0ZtuI9bSO72TqddmzUEjx7rF0JQedSemlia
	 GPX/iy1NBUprZrwlxywmYW5lt7CAK6UpXcA+OFj8J+SHLpkPozUkW9zUD/r9Sf2H8LMBs
	 d9hUqwKLBGsDluVRiLJiqvxGDMGIKhHAlo7BM/D9nkcPjzRSIOC6LdyoSeSuuFqHmpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vVmdWIfDqgQ57zGphQvuVSmIneDtL7GjZgKyHckL4FM=;
	b=OXIJ/ChB4/K/myaWzl/AL78X9Yp1jgD60Qj+NswtYT1SCW0Q9I4lggRLA92avv3/x44j
	 CcibmOsgI4WZ5Qre7Xj1BfRdNyph5yTYvG15yfK2Tqw7FwBKo50POa5318afznXrOJdgU
	 R956vjoxKLIHkPfvoi3hWAzyzNaRzv0Zu83v9AfyiNQFTBUdj9AdL4p4Y5MlmVyl8mNYu
	 4lXQl6h7rws8NaSR7N0T0kpJkjtsSUVM2+NRVksxUNJ6YR/fLJRwPQuEpuc9sWZyVIixR
	 e5UbjzG5apnVZYybEtXlR3M/T8qPVDuiSQnv+GnNH2Ui/6zAcu551Snr3rqCO1Z4RyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcABkNTH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6C4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F6C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcABkNTH
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1430eec0070so1192c88.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793311081; cv=none;
        d=google.com; s=arc-20260327;
        b=qoh4VA50A5E5b7yJZX2nTOPCrK4tobuMcy9WdupPacLuMKLSLFYLGSZUrBnaCDv8zF
         om6C1JFiW436Sdb4R4Ku/jmSamoTfD+thIPw+CP03suKUO3X5BnLmEVEwTcvS4rnkfhK
         ikREFWL0iGXTB5rPCLOuGjKFqeOQjMwxLxx4wHMG940Vv0Jjs6bE7Sz7hp1/EdSNJF/q
         50nr+mdnPeFW08qZ2IkzU2fDM3+14EH9ySV567ixKF9S2WEpjn9LlFK5VeOJCd2AFx2M
         yCPx7o+G5W3ko270JfAJ3CFEh6YfsPw9iDRwlu+qJEQTKLbnUnXgDGom9kwEKh1DoFDT
         I4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vVmdWIfDqgQ57zGphQvuVSmIneDtL7GjZgKyHckL4FM=;
        fh=sKg4abTYRRXlayRNpmeWPaRZN2tuP9FQnQpRgyAEbjw=;
        b=K1CRGX2Xe2d2OlZsdKNGSygusuf7YBPSIbVDWWOaDCmUY5viYrjQYMEIxM8ELsQV2m
         MmpRWJQ+vmJUkL3pKp5MtejRmHcA2gFq6DV8vcamJTl25lUcj04OZ+FJTfK6Zezo1cOX
         XNCdp4+hslNZ5qO6sm+XOlzj5npEjol3SM4/rR7fyU8svwCDp5D/l6IKR1OukAVKErLq
         m9uGrSbnhmde3TwOaclA7Fe0oNLVHnm3x4p70RHkDFX8i2cXqEsnkyTmfsoI3orpFVT3
         wNTnb17dttqWluevSp8Ii5JFdqCNTW8XwO4Hpc6IXdlNN5zJH2ba1SVxsZuQynTuIWmq
         wkTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311081; x=1793915881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVmdWIfDqgQ57zGphQvuVSmIneDtL7GjZgKyHckL4FM=;
        b=PcABkNTHlHzUgqh9sPJ00L86DKPfF+hLxdxvlRj8qZ4keol4UDakew9Rwff5j4gnt5
         OqWOQ+6JP3xJqinP3faD7NjVIWXY5KWpKFcb7o0m1JF6CzMgcGeXIgDWpd6MxS2ZgV3r
         4PAGf5K6lMJBJWLPnr3ASWZmT7MVYEFX05rdIzOUU0eYJta6J5E+AHdH9mj+4+2Z9Fm6
         Nn2rlI2aTWbIL19Q0u+X+GMpqxAwlop+6cRPYFQRmpSfrD8n7efjJvSCHK3Vgren2oBF
         /5AAczjG7uuQRAiH+jmShFu/Qg1RV3IMnvZuE56sB00P5EvsVA4oKIhTOJY05W5WgS7v
         U4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311081; x=1793915881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVmdWIfDqgQ57zGphQvuVSmIneDtL7GjZgKyHckL4FM=;
        b=snaVL+QEn+DDtwdvs3US0oxkqVLZOKplzh6963V1zgLJbSruBTeWVvrZYTKEYBL6kf
         51mbGOv1t4tPo6NK1vNIZe1mKc/uei8AxkNeTEGjLRDjGVV5/Ix/z8ocFBXVwx0qYR4x
         YunbqmBF3YD50neprux/3hi8iCFZy5v+OcmS3WMRXd4LeUlYbu4FL+N5YEzBYJ6L410y
         yYgJBOOf71lOPKgYhv3CWD9vnFhblJSO+iguhwkOdmNtDUuur6KVO0xjTC/oi5VClmBJ
         wPgMIQkF3DSOraC3+ohvPHWd8hSXA5IaNtg9ssR8K1PX1/zY5LZt89vWYPktapUCRPp2
         vDVw==
X-Forwarded-Encrypted: i=1; AKwUvByc1rMCMGNDaStx3+m0B5aUAQaf/hFI/CPRsIrMChXdWC2jjwFDTvvJuN9sGJJJ9NIkblg1vpgd7Z8pPh0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQeNkkOOO6Xt50FS7tgBHsaydftU00C6JPMUyY3JPqV8Ye3NIi
	HcWJO1K05hszhnBsB/Lw31s8MfZgQaXYs4mMPbKvI31lGfdHXJaU0Cdz1GmKTzEJlv+w6PnEO/h
	qhdiEFwlPqdhWkjBMV6PC0Xr2Jy5nQJs=
X-Gm-Gg: AYBFou2vWgJFD4qFFDGlWri9UzGKenoKSSD54qxztZds9/4RTIoRmcGu3Q6VwRG6cT+
	uA1jjxEsejEeXtmULjBfMSbk0rvGtvBIbd4onaCAYz0Gg8ddFe9wXbFMe3G776+FOsrPBREYFLr
	DXeqrXyHogFcn6vCBOAwNWL2obIN9pDZPyROEpU/4ZWDgmp95f5TWRXbihwcjCVX+qujgcqO/YA
	0pgE0vzCqIJ8vxtX+pkgQptYzTSyfhUiKpMg1KQRAdjNtWVmxK8sQbRdW6LA96OIQ/f2NwFyVtY
	4FhswuzIPMMuDZykidYueMf79kMH9RsJoLxBRQvjULPe1gCUTDypAH4v4toiX05WnfdHrXF+xed
	yx0jSatpb/6Sl0+l8b2zZRHxN93pqqhFY9AXtnCAlZKAa6ZitvrJw6aZSQF9uDtIStnf3Z3qp8h
	vrENAxWH2eIhKYjcM6sXigVuY=
X-Received: by 2002:a05:7022:c46:b0:1a1:9106:cfff with SMTP id
 a92af1059eb24-1ac5c45fd28mr645027c88.2.1793311081015; Thu, 29 Oct 2026
 14:58:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260916144014.879355-1-ed@aicharmers.com>
In-Reply-To: <20260916144014.879355-1-ed@aicharmers.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2026 17:57:49 -0400
X-Gm-Features: AclHuK9xVl7f8hieJPy2X3wLzEpfApxWnh2cKeKmKYYgIZ_iAsxEqlD0F7kalKA
Message-ID: <CADnq5_MsaUDm8rcxr3_0wuEAXywxziAofOO9w-dUxYS9PUoasw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
To: Ed Schofield <ed@aicharmers.com>, Andre Eikmeyer <dev@deq.rocks>
Cc: amd-gfx@lists.freedesktop.org, Kenneth Feng <kenneth.feng@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Andre

On Wed, Sep 16, 2026 at 10:51=E2=80=AFAM Ed Schofield <ed@aicharmers.com> w=
rote:
>
> From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
>
> Some Apple Navi GPUs intermittently time out during SMU initialization
> when EnableAllSmuFeatures includes UCLK DPM. Leave UCLK out of that early
> request and enable it from Navi post-init, after display hardware init
> and before the UMC workaround and UMD clock setup.
>
> Read back the enabled features before rebuilding the memory clock table
> and sustainable clock limits. Also check the PPT memory states used by
> display initialization before late enablement. Keep memory-voltage DPM
> and respect the user's memory-DPM setting and the secure Navi 10 exclusio=
n.
>
> Limit this workaround to Apple 7340/0218 revision 41, 7340/0219, and
> 731b/021a revision 40. Revisions and PCI IDs here are hexadecimal. The
> underlying initialization dependency behind the timing sensitivity is
> still unknown.

@Andre Eikmeyer I think this patch should fix your system as well.
@Atharva Tiwari are you ok with this patch?

Thanks,

Alex

>
> This builds on Atharva Tiwari's submitted 0219 delayed-UCLK patch
> and Guna's diagnosis. Ed Schofield moved the enable point into the
> Navi callback, added state validation and clock-table refresh, and
> extended the board matching.
> Independent tests of the related T2 implementation support improved boot
> reliability on 0219 and 021a; those are not tests of this exact AMD patch=
.
>
> Link: https://lore.kernel.org/amd-gfx/20260824190409.1724-1-atharvatiwari=
linuxdev@gmail.com/
> Link: https://github.com/t2linux/linux-t2-patches/pull/61#issuecomment-56=
37976466
> Link: https://github.com/t2linux/linux-t2-patches/pull/61#issuecomment-56=
45652752
> Assisted-by: Codex:GPT-6
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> Co-developed-by: Ed Schofield <ed@aicharmers.com>
> Signed-off-by: Ed Schofield <ed@aicharmers.com>
> ---
> Hi Alex, hi Atharva,
>
> Here is v4 of the delayed-UCLK workaround. Atharva is credited as the
> author in `From:`, with my rework credited through `Co-developed-by:`.
> The local development history starts from Atharva's original 0219
> submission [1], followed by my move to the Navi post-init callback,
> state validation, clock-table refresh and additional board support. This
> export is a single replacement patch against AMD staging at `8a4e96cf2`;
> it is not an incremental patch to apply on top of v2 or Atharva's
> original patch. (V3 was a local revision that I didn't submit to this
> list.)
>
> Atharva, I agree that display initialization may explain the timing
> dependency. This patch already enables UCLK after display hardware
> initialization on the normal probe path. It is intended as a targeted
> workaround for the reported boot failures; it does not establish the
> underlying cause or address native 5K support. Could you share the exact
> initialization-ordering diff, kernel version and GPU IDs from your
> experiment? In the AMD staging tree used for this patch,
> `dce_v10_0_early_init()` handles Tonga/Fiji, while these Navi boards use
> the DCN path.
>
> My goal is to stop the intermittent boot failures on my iMac (0218) and
> other affected machines. Testing of my related T2 candidate in PR 61
> [2], which was based on my local v3, is encouraging:
>
> - Matt Olney's report on 021a [3] records internal-display boot success
>   improving from 2/10 to 10/10, with mixed restart types.
>   External-display results were 4/10 versus 4/5, with uncertain kernel
>   selection on the failed candidate attempt.
> - Vivek Chauhan's report on 0219 [4] records boot success improving from
>   1/5 to 3/3.
>
> These results are from the T2 implementation, not this exact AMD v4
> export. The T2 patch stack also includes a separate correction to its
> existing fixed allowed-feature mask on 0219, which clean AMD does not
> need and this patch does not contain. The results support improved boot
> reliability on these machines, but do not establish full performance or
> reliability across all display configurations.
>
> Compared with public v2, v4 adds 731b/021a revision 40, preserves the
> existing secure-Navi-10 exclusion and generalizes the helper names. It
> retains 7340/0218 revision 41 and 7340/0219. All IDs and revisions here
> are hexadecimal.
>
> Compared with my local v3 / T2 Linux PR #61, v4 excludes 020f: 3v3nFloW
> reported that initialization completed but the machine subsequently hung
> under load [5]. Their follow-up testing with a fixed memory-clock level
> [6] suggests that memory-clock changes cause the hang, but doesn't
> establish whether GPU load or display activity triggers it. I've also
> excluded 021b from this version, which we don't yet have testing results
> for.
>
> Local build and host checks pass. I am currently travelling without my
> iMac and have no new v4 hardware results, but I am submitting this
> version for merging, with the workaround limited to the three board
> matches supported by the existing evidence from the volunteer testers
> mentioned above.
>
> Alex, this patch replaces v2 and applies directly to the AMD staging
> commit identified above.
>
> Thanks,
> Ed
>
> [1] https://lore.kernel.org/amd-gfx/20260824190409.1724-1-atharvatiwarili=
nuxdev@gmail.com/
> [2] https://github.com/t2linux/linux-t2-patches/pull/61
> [3] https://github.com/t2linux/linux-t2-patches/pull/61#issuecomment-5637=
976466
> [4] https://github.com/t2linux/linux-t2-patches/pull/61#issuecomment-5645=
652752
> [5] https://github.com/t2linux/linux-t2-patches/pull/61#issuecomment-5646=
139127
> [6] https://github.com/t2linux/linux-t2-patches/pull/61#issuecomment-5646=
438512
>
> v3 was local, not submitted. Since public v2: add the tested 021a/40
> match, retain the secure-Navi-10 exclusion, and generalize helper names.
> Since local v3: remove 020f (load hangs) and 021b (no testing evidence).
> Base: 8a4e96cf2acd1e0340581df100b559f77ad7d855 (AMD staging).
> This is a full replacement, not a patch to apply on top of v2.
>
>  .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gp=
u/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index f8ca5eb9a..3ac2a074c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -60,6 +60,37 @@
>
>  static int navi10_init_ppt_limits(struct smu_context *smu);
>
> +static bool is_asic_secure(struct smu_context *smu);
> +
> +static bool navi10_apple_needs_late_uclk(struct smu_context *smu)
> +{
> +       struct amdgpu_device *adev =3D smu->adev;
> +       struct pci_dev *pdev =3D adev->pdev;
> +
> +       if (pdev->vendor !=3D PCI_VENDOR_ID_ATI ||
> +           pdev->subsystem_vendor !=3D PCI_VENDOR_ID_APPLE ||
> +           !(adev->pm.pp_feature & PP_MCLK_DPM_MASK))
> +               return false;
> +
> +       /* Preserve the existing secure Navi 10 memory-DPM exclusion. */
> +       if (is_asic_secure(smu) &&
> +           amdgpu_ip_version(adev, MP1_HWIP, 0) =3D=3D IP_VERSION(11, 0,=
 0) &&
> +           adev->rev_id =3D=3D 0)
> +               return false;
> +
> +       switch (pdev->device) {
> +       case 0x7340:
> +               return (pdev->subsystem_device =3D=3D 0x0218 &&
> +                       pdev->revision =3D=3D 0x41) ||
> +                      pdev->subsystem_device =3D=3D 0x0219;
> +       case 0x731b:
> +               return pdev->subsystem_device =3D=3D 0x021a &&
> +                      pdev->revision =3D=3D 0x40;
> +       default:
> +               return false;
> +       }
> +}
> +
>  static const struct smu_feature_bits navi10_dpm_features =3D {
>         .bits =3D {
>                 SMU_FEATURE_BIT_INIT(FEATURE_DPM_PREFETCHER_BIT),
> @@ -356,6 +387,11 @@ navi10_init_allowed_features(struct smu_context *smu=
)
>                 smu_feature_list_set_bit(smu, SMU_FEATURE_LIST_ALLOWED, F=
EATURE_MEM_MVDD_SCALING_BIT);
>         }
>
> +       /* Defer UCLK on the selected Apple boards until IP late init. */
> +       if (navi10_apple_needs_late_uclk(smu))
> +               smu_feature_list_clear_bit(smu, SMU_FEATURE_LIST_ALLOWED,
> +                                          FEATURE_DPM_UCLK_BIT);
> +
>         if (is_asic_secure(smu) &&
>             (amdgpu_ip_version(adev, MP1_HWIP, 0) =3D=3D IP_VERSION(11, 0=
, 0)) &&
>             (adev->rev_id =3D=3D 0))
> @@ -470,6 +506,25 @@ static int navi10_store_powerplay_table(struct smu_c=
ontext *smu)
>         return 0;
>  }
>
> +/* DCN20 consumes these PPT states before the post-init UCLK enable. */
> +static int navi10_apple_check_uclk_states(struct smu_context *smu)
> +{
> +       PPTable_t *ppt =3D smu->smu_table.driver_pptable;
> +       unsigned int count, i;
> +
> +       if (!navi10_apple_needs_late_uclk(smu))
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
>  static int navi10_setup_pptable(struct smu_context *smu)
>  {
>         int ret =3D 0;
> @@ -490,6 +545,10 @@ static int navi10_setup_pptable(struct smu_context *=
smu)
>         if (ret)
>                 return ret;
>
> +       ret =3D navi10_apple_check_uclk_states(smu);
> +       if (ret)
> +               return ret;
> +
>         return navi10_init_ppt_limits(smu);
>  }
>
> @@ -3219,6 +3278,41 @@ static int navi10_enable_mgpu_fan_boost(struct smu=
_context *smu)
>                                                NULL);
>  }
>
> +/* IP late init follows display hw_init; refresh clocks before UMC/UMD s=
etup. */
> +static int navi10_apple_late_uclk_enable(struct smu_context *smu)
> +{
> +       struct smu_11_0_dpm_context *dpm =3D smu->smu_dpm.dpm_context;
> +       struct smu_dpm_table *table =3D &dpm->dpm_tables.uclk_table;
> +       PPTable_t *ppt =3D smu->smu_table.driver_pptable;
> +       struct smu_feature_bits enabled;
> +       int ret;
> +
> +       if (!navi10_apple_needs_late_uclk(smu))
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
>  static int navi10_post_smu_init(struct smu_context *smu)
>  {
>         struct amdgpu_device *adev =3D smu->adev;
> @@ -3227,6 +3321,12 @@ static int navi10_post_smu_init(struct smu_context=
 *smu)
>         if (amdgpu_sriov_vf(adev))
>                 return 0;
>
> +       ret =3D navi10_apple_late_uclk_enable(smu);
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
> --
> 2.43.0
