Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BED332B135
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519511; cv=pass; b=sAy0XzE9JoccgaSq+F+OTfUFk6PKrB3kV5InWip7XvbLPqbbLcFqv8TEv8LmpJIj3NAA4hLQFTfADQYaqzfD8Kr9u/jbzaCW3B5iMCWjLlDimU9cERCNfgFCuNKUEwJexgwjCDkP84ffjUqyXaL3e6HDZ0C4Utaj13qT1ojIgIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519511; c=relaxed/simple;
	bh=i1tUyEeA6p82DByo+ukwOxFAJE10BxMR3eO3sNdDtBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLYemF7FruBH8LrgXY71EdWWzHlHObEBxXJ5WYXx95O8cHPGVq7Kfnk69vQvLBp00de1hY0tOkR5xnxwFyID2VvslGW3w/rikCy5aY//PpDpGJXHtaMUmm7Vgo1OICbDdRAv5X0Z2Q4w+Tp1Fw8Ay4sIA87Ypa/lcPImxiNIA5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aMll39V1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fX26sRmO; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aMll39V1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fX26sRmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789519508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfPUYzlcgmsFLjqRxvjtuvi+F6kyqT67ipaEXy3hQRw=;
	b=aMll39V17B/cXZAaa+OXB+lOBy7aBLqhzfS6zToqXyb6jgKRCkJJvWUzs0BnotbLjQGHAX
	QLVrGcdi8wJbY29lhtiq8XeIyBOWMgvdrnDfQquU/z50E0IiBfpYkRcvlY2iDBM9h1TmCp
	4zuKUQJ4kMlChrfQ8x1hTrT0YtAOTck=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-A5MT5zY2PiGWpmHFd-wKOw-1; Tue, 15 Sep 2026 20:45:04 -0400
X-MC-Unique: A5MT5zY2PiGWpmHFd-wKOw-1
X-Mimecast-MFC-AGG-ID: A5MT5zY2PiGWpmHFd-wKOw_1789519503
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so8670329a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789519503; cv=none;
        d=google.com; s=arc-20260327;
        b=TRcIELeVXm+UnX3Lww/GdC/dL5mH6B7F1xa8MZ37ADsSM86HTnrTXD5DwSX97j6uNc
         rHfvXDRzm3yjQJYG5BF7A3Hpmkt84c1PQh9cS2ggfGwJWr4Rj2Igyyca3I+nZhShmtEV
         cYtx+VolGUkNoLP3ta+5eBDQnmiQDfYsGyk2dWt1xmiEAMgS2+A3ZtKqz2SSgrwUqvjL
         7fKQ9+7HQ3KnX6pqh+ndnmbUzdE5QyvBlXE/YSEgBBJE1splCz+7qgl+6pyA1I6P3yIV
         VcyGv2373DQtlH8iQMinQDflrrfEgnMvBbP6vowjLqf5V9z1+xo5/WH2/3hP/e9bD7t9
         vG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HfPUYzlcgmsFLjqRxvjtuvi+F6kyqT67ipaEXy3hQRw=;
        fh=np/hnEOvj7KEvdF8gyIv3Vj6kl8pxlDIZNn6adcKhQo=;
        b=h5vFSLVhXx4MXUhKxQ19f0qXlwD3n3hj8AiqGC/llXSfUvqxqpPp4xGVGqAzRLAlPL
         XM2IguC2e1U9W0s/ChOVCGfFg+BnMS1unewCW14wRirSaOChStbZM7XhPv+nnj9bBdeE
         R4Q6AAc3Xhtw5Q8pF9s+fNKZWa7aVU/EHq1Y/XR6pn4NO0wwxtX8QNxciLJ3XAwysjKb
         sxLGEg36gVlajYR14lcS4wfNKfP4E3mMCjEcelVqx0g9Axc9kthNkMDKotFkMj0vUNWm
         6RQl5Dr0NAPAy/JY63IGKrxsTRpwajo1uxwPuXCy225npbrFfwYC43OXqDFLtVZXjwhI
         AOnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789519503; x=1790124303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HfPUYzlcgmsFLjqRxvjtuvi+F6kyqT67ipaEXy3hQRw=;
        b=fX26sRmO6PqrwCskNNd4OYfvINfezooI7xpp5Fcuy5LfIZGm3ixE9MSbe4s+JRl/aN
         vL8aCT7FEB+ldX3RNLoauk4Khpb7llNF2s7lyDTlWRoIYQBD57DFLcJI2/SzJInj/Vdm
         vpwORl7/DVfLntbwfd6xQzFcXFugZtGO1fkBKSYZZ4M0ky9R0lMme7lU7Rm7Dgve+riA
         ns+pEbZTT3e5IR3UJ7sl+0CLsm0p/LPtTldgg2tsGx4+CwUrms3fpiAr4KYr0EeysJu6
         3MdZ4ftd5xOT0SZF8LH3J+3q/bsoHRemTIxBwbIcZpBHEZuoNnLRyRfvtx+ZK9bETjZv
         qJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519503; x=1790124303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfPUYzlcgmsFLjqRxvjtuvi+F6kyqT67ipaEXy3hQRw=;
        b=Iz9by9sAVf0o0Gp3hs6+kHqrLWZG8wygKOvccudw1JESOTaug9jLCmezW5G2Eb+Mpb
         bcsHPyfhGLMWgNaFUpjpr/3xFqKoOqwxNVM3j4I8pBHYlGrfp3O6eKt+TVTlSEF1yoIW
         zavjHIbg0CIxJG4bsOR3p0AD8hvK+kdoErsaydrHxDfMFuFHKSk50QDz6SE2Qd7tzsOf
         Q1Y68SnQYqg7hW/E8CPwvlhqL8dMTpciNt+Oznls9JxkHTVKeis7pabJXyawljqjQswR
         FmX3HhPJE6LDaP+w3rpbdM65bMb7salgXW/Nf5eshwq0VIVzXOgYYFV/MVcXGFXIZITX
         vixQ==
X-Forwarded-Encrypted: i=1; AKwUvByZXwA2H6gp1Jf9fRX90SdIBPVNLRs4pJl5h4sEmLNbR01gJrigzehW7ok/ULTyssp89iK9bK1F3CJtv/g=@vger.kernel.org
X-Gm-Message-State: AFuF++numAZrq/qorAosPuz0T/DzHUj72bpynl9utHHPf3paAmN3wp/X
	dUe+JG/BNvK67PnkYSbMiIQprvbHDjLVhv410ROw7Ps8F794jIkKS42gWG0zo5C3TNZAK3bcKWa
	/NdpG7eqH4nF0czRNfOpqjvypg2dQ2X155qFlASEPOujsLEEB27V4nvr5vNiubh1uP+PtrSN7yg
	DvGcOaom72klOGoKDh4pqP1bMwZ7X9kok1ZIPJOUND
X-Gm-Gg: AYBFou3D0rS9WdEymjpby2tLE/tml3ViJamco5AUV24Dz7m8VuZ13d0ZLMwFeeNiAPx
	5sNvWMWs87ZpBN42cb4YwjhcgWhS8X7VGkVr0KcqqMSsHsdHwqLLRtx9RqhnG3gk/8LTRejVf7+
	k9C+zJRR3cshIpXISa1GZHLeJdJoKgTpE8LV3G/Fp0IAWGkfs7KMWwhGeXudi7iOjPs9GPWzD9c
	Cq0ar+W0d1tSyr9
X-Received: by 2002:a17:90b:5386:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39e1e4aa012mr1554327a91.19.1789519503242;
        Tue, 15 Sep 2026 17:45:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5386:b0:398:dcef:c040 with SMTP id
 98e67ed59e1d1-39e1e4aa012mr1554271a91.19.1789519502710; Tue, 15 Sep 2026
 17:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916001603.22394-1-lyude@redhat.com> <20260916001603.22394-3-lyude@redhat.com>
In-Reply-To: <20260916001603.22394-3-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Wed, 16 Sep 2026 10:44:50 +1000
X-Gm-Features: AcwNN1U2rMYqd8tDZTEqUV094CLCyp-28AzSPzCe3dT76HzOjLGKJxyGK8p2h-Q
Message-ID: <CAMwc25pBOU62TV77ZSSyH6DP=K4FMCpd9i98L4H+QWQ0=--FOg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] drm/nouveau/gsp/r535: Add support for MEMSYS_GET_STATIC_CONFIG
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>, 
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	Hongling Zeng <zenghongling@kylinos.cn>, Mel Henning <mhenning@darkrefraction.com>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 10:22=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> This is a GSP structure describing various characteristics of the memory
> management system that GSP provides. Start by fetching it during driver
> load, but don't do anything with the information we get from it just yet.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V3
> * s/nvkm_gsp_rm_ctrl_get()/nvkm_gsp_rm_ctrl_rd()/
>
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 ++
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 17 +++++++
>  .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 45 +++++++++++++++++
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  8 +++
>  .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        | 50 +++++++++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
>  6 files changed, 125 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/=
gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 64fed208e4cf8..0e193baaf9bbb 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -156,6 +156,10 @@ struct nvkm_gsp {
>                 struct sg_table fbsr;
>         } sr;
>
> +       struct {
> +               bool use_raw_mode_comptagline_alloc;
> +       } memsys;
> +
>         struct {
>                 struct nvkm_gsp_mem mem;
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driv=
ers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> index 09b17b85dc1ac..5df5365e744f5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> @@ -1808,6 +1808,23 @@ r535_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_susp=
end_state suspend)
>         return 0;
>  }
>
> +int
> +r535_gsp_get_static_memsys_info(struct nvkm_gsp *gsp)
> +{
> +       NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS *ctrl;
> +
> +       ctrl =3D nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
> +                                   NV2080_CTRL_CMD_INTERNAL_MEMSYS_GET_S=
TATIC_CONFIG,
> +                                   sizeof(*ctrl));
> +       if (IS_ERR(ctrl))
> +               return PTR_ERR(ctrl);
> +
> +       gsp->memsys.use_raw_mode_comptagline_alloc =3D ctrl->bUseRawModeC=
omptaglineAllocation;
> +
> +       nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
> +       return 0;
> +}
> +
>  int
>  r535_gsp_init(struct nvkm_gsp *gsp)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h b=
/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> index fd1170037c030..fee5418a72a68 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> @@ -789,6 +789,51 @@ typedef struct NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQ=
UISITE_PARAMS {
>      NvBool bIsGCOFFSatisfied;
>  } NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS;
>
> +typedef struct NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS {
> +    /*! Determines if RM should use 1 to 1 Comptagline allocation policy=
 */
> +    NvBool bOneToOneComptagLineAllocation;
> +
> +    /*! Determines if RM should use 1 to 4 Comptagline allocation policy=
 */
> +    NvBool bUseOneToFourComptagLineAllocation;
> +
> +    /*! Determines if RM should use raw Comptagline allocation policy */
> +    NvBool bUseRawModeComptaglineAllocation;
> +
> +    /*! Has COMPBIT_BACKING_SIZE been overridden to zero (i.e. disabled)=
? */
> +    NvBool bDisableCompbitBacking;
> +
> +    /*! Determine if we need to disable post L2 compression */
> +    NvBool bDisablePostL2Compression;
> +
> +    /*! Is ECC DRAM feature supported? */
> +    NvBool bEnabledEccFBPA;
> +
> +    NvBool bL2PreFill;
> +
> +    /*! L2 cache size */
> +    NV_DECLARE_ALIGNED(NvU64 l2CacheSize, 8);
> +
> +    /*! Indicate whether fpba is present or not */
> +    NvBool bFbpaPresent;
> +
> +    /*! Size covered by one comptag */
> +    NvU32  comprPageSize;
> +
> +    /*! log32(comprPageSize) */
> +    NvU32  comprPageShift;
> +
> +    /*! RAM type */
> +    NvU32  ramType;
> +
> +    /*! LTC count */
> +    NvU32  ltcCount;
> +
> +    /*! LTS per LTC count */
> +    NvU32  ltsPerLtcCount;
> +} NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS;
> +
> +#define NV2080_CTRL_CMD_INTERNAL_MEMSYS_GET_STATIC_CONFIG        (0x2080=
0a1c) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID=
 << 8) | NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS_MESSAGE_ID" *=
/
> +
>  typedef union rpc_message_rpc_union_field_v03_00
>  {
>      NvU32      spare;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/driv=
ers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> index b45781cd0dfdc..5a51fe7e5ab98 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
> @@ -137,6 +137,14 @@ r570_gsp_get_static_info(struct nvkm_gsp *gsp)
>                 }
>         }
>
> +       ret =3D r535_gsp_get_static_memsys_info(gsp);
> +       if (ret) {
> +               nvkm_error(&gsp->subdev, "Retrieving static memsys info f=
ailed\n");
> +               return ret;
> +       }
> +       nvkm_debug(&gsp->subdev, "memsys: Use raw mode for comptag alloca=
tions? %s\n",
> +                  str_yes_no(gsp->memsys.use_raw_mode_comptagline_alloc)=
);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h b=
/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
> index c458569af9d72..e2d9d1949e4e1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
> @@ -494,6 +494,56 @@ typedef struct
>
>  #define GSP_FW_WPR_META_REVISION  1
>
> +#define NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS_MESSAGE_ID =
(0x1CU)
> +
> +typedef struct NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS {
> +    /*! Determines if RM should use 1 to 1 Comptagline allocation policy=
 */
> +    NvBool bOneToOneComptagLineAllocation;
> +
> +    /*! Determines if RM should use 1 to 4 Comptagline allocation policy=
 */
> +    NvBool bUseOneToFourComptagLineAllocation;
> +
> +    /*! Determines if RM should use raw Comptagline allocation policy */
> +    NvBool bUseRawModeComptaglineAllocation;
> +
> +    /*! Has COMPBIT_BACKING_SIZE been overridden to zero (i.e. disabled)=
? */
> +    NvBool bDisableCompbitBacking;
> +
> +    /*! Determine if we need to disable post L2 compression */
> +    NvBool bDisablePostL2Compression;
> +
> +    /*! Is ECC DRAM feature supported? */
> +    NvBool bEnabledEccFBPA;
> +
> +    NvBool bL2PreFill;
> +
> +    /*! L2 cache size */
> +    NV_DECLARE_ALIGNED(NvU64 l2CacheSize, 8);
> +
> +    /*! Indicate whether fpba is present or not */
> +    NvBool bFbpaPresent;
> +
> +    /*! Size covered by one comptag */
> +    NvU32  comprPageSize;
> +
> +    /*! log32(comprPageSize) */
> +    NvU32  comprPageShift;
> +
> +    /*! RAM type */
> +    NvU32  ramType;
> +
> +    /*! LTC count */
> +    NvU32  ltcCount;
> +
> +    /*! LTS per LTC count */
> +    NvU32  ltsPerLtcCount;
> +} NV2080_CTRL_INTERNAL_MEMSYS_GET_STATIC_CONFIG_PARAMS;
> +

Is this used anywhere? if the 535 and 570 structs match then don't include =
it.

Dave.

