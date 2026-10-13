Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACB94BEE30
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791935272; cv=pass; b=Fjk1ocoycRYbGYaTvuDNIIZcEWqVqYLDm/YfwBAFQfOMfFUVd3YEV7qlkGkgl9kqgWPWTmOS2nXpFhWW+vkiLdCvYLlok+vlCXJ9chK4rSK0fc1QJLCU5crm2DXT5RoTe6TcaGtIzIk+C6Gmp/sz+X7OBbv/OuKSV4M/8UZHSvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791935272; c=relaxed/simple;
	bh=RpVj60Np2QeJsiDicQft4LScnare6AIB8StmTWAUalo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlV99McFtUElO/CP+/1b2dJmlTfnH4NqASIfN88QIMNVGeq7/DH6TWXBQ7+ItHVbEq8+I/tRtBcHa2109f8vkYDE/FYlu954EFTAjt0S721Vg43oP1Gsm8HlabOqk32MnZywr/G8rBYQSDxcplgJoWiix9b+TS6DSrOzDNcWbp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gme4XrJW; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gme4XrJW"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcf03d95b8so23817e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791935268; cv=none;
        d=google.com; s=arc-20260327;
        b=GE4ypO1PFTV4d/EPwChgjXT/kizS+D9F5G6zPiBILov/4exTqUnYl1yoXnh+O9/x7j
         yfYZyI/7ScJrvKQ5hKQ/QyILwqkCFcLVLAGf/b1oAtlnCx+NSYgUPZZov3CSxONQsCAk
         YFkBnleyUMGAlJ5GwfBt/Zs6SY0sI/+7F1q/xLmXD1HGYOzDEqbpzQtpzaxBkA0dHUs0
         NIizmV5DRlUwMr6x4N30KG71W/aRJscrA3hywKnsqpAx1nLM7feUk6yYBmtOgQOiXmjm
         SlV2HqGmVKOY3+pA+XkXtmbhI7kOP2obhmryR9qfxmRJnD3WIzmlhW0/jMY7/N3/lo2W
         KnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gWlBab7B3jJux3vwKeZxIpLl3dDCHc4QEgeA5gXUrZ8=;
        fh=FbEjYzkxFteb5W9Ojn7fIGz5p5Z6pg8RdwCTnhBALqU=;
        b=bg52lnJKXZ+U1pCBLR57X4oSMmZTH8QUtIYiNBODK5wmUlOX2XQIlsgNYTpaqdKwqo
         Rbi6QobYgn6f+pMdEBI95GTY71BgSiPNm08QSXp3Z/0xO6DGywywnj/a4XD9Rv8r8uT/
         xmZTyzFtauCwGRTDtw2LTmaxCrN7JWQHiJUDWKS5vmNFglVduyRrSY6VEwzqvoyNbJVO
         C1lgEpnQ95xo+g+OVi212j3mCn2HQcBTUKlEfnTMfW+Tnch66+qB1v68/W6hTkYBs4OC
         6tw+cM9v7ts6RqvPCNyH8SG/OF5g3rn0OlfI2eLNtl2NjJcqayoRvaodi9JwZfQN+4Qn
         ldAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791935268; x=1792540068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWlBab7B3jJux3vwKeZxIpLl3dDCHc4QEgeA5gXUrZ8=;
        b=Gme4XrJWfSPCRvMteZMCfU+qvW9QMA5XjDeOA4Y0NFJtBr3sbJyn87aQPy/oW30/SU
         zXtWbpIr/6dj5WHV9JSj02tRGcPESFuUdDPgUvfTOy2JGpJywn/J0apar/mDfHoDXk1/
         3ufHcYZS6vWI/mVZZ8lhaKgfSGX6tGPLozt/1Qz4dKtwKu2MOEaULrgEtzUJNA5kNIlo
         yiPkbQuLH0nSjJ9Aud+XnjLL0YTVeje/IVG2BRMgRFHXcBnqAVu2e9mU0yXydgWK6lG3
         mtGyVOA+g3++UvG827eo2sKMG3YW9/BRmzf2PHC2ksgAp9Kobre2igdnamFCIkla5DTC
         /r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791935268; x=1792540068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWlBab7B3jJux3vwKeZxIpLl3dDCHc4QEgeA5gXUrZ8=;
        b=lMHGVLKlRhoCwyy+6teqUzJETDZbf+87Nr/FCh/yCrAwGSjYFRdBvWbl65mxtgl+Ku
         Q+VZSC6gfL7eUGv6of6IescOCiUdBNvT5IMytWgqn8VuheEamWkdrgCmtt1r5as05RZv
         rxHUseDwBzNh+/vEQHfDwebmKJsM9cus9VKsIV/3AhrUzC8NsReIG6b8wf4FzMuxOf5s
         2Hprw3voYX7+boLSx3Q7EI2UVQXf8ztmwj6my8o0L7DYI8MyE3qhv921cbxN9CZFMtUx
         aEHHsC+Km8vY7AlSnoFwlbSLDx9gQb7lqN3U7wjXUG1snEhP8ygG5fegMRFsXDa818Qb
         WBjg==
X-Forwarded-Encrypted: i=1; AKwUvBz1hjVGGIU56aE/VHtOxD1iX+kF41VDqXe8dsYjRReVyGK2yZLq0D3GrXa5wV84XY4fsCV1rJVybAHUaf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5TGC5c3l/45WRMd6fb0LqpApmIgp16kBqIlvOjrGxASpjRSM1
	Dm9b2wuq7x+vqNx/U4YWojpzoZ5zqxT/Ov+cIP8SZEhgyQg2lSfdRHF19To4lNxStfoF17YaHpq
	NyhHzMmVvCYypNJvMtGmLghseHOskiPJt2zQIiUdE
X-Gm-Gg: AYBFou2/mH/eMx6/hrUh4WcNqSqP7mN0mGLSi/7CNfADwX8W7BfM2ANsn3wwCqJd4TT
	joB/svC5r2OPs2acpZKCAEhpNq9Xm0z1URUxl8b4KOToDwKJ7BjUIArjlBr47VgWwQpYYiBnkdQ
	mYUs29cg6DtFfjtKnvNoshUnwprK2kwB69qcQC7fBvYhg5H45r46Z+Lk4+wG/FeGwu8fQs2rqMx
	DHEvYU+ynLE3BYGCBMacaKBIvzvf4cGpoYVBicilI4xnn0pa58Sorzpew1MNTAxaX0Ion5BSwZ7
	bzJgaCQXo60+j+gq6ax2hfTT4w7910I+NQ4avKeKincYzrTr47rV/26lm4ja3D+xIltUULlmjTC
	TCOmjM3xOWWOW8Q==
X-Received: by 2002:a05:6512:3513:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5be35cbee5emr1117e87.12.1791935267421; Tue, 13 Oct 2026
 16:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013194005.96615-1-zide.chen@intel.com>
In-Reply-To: <20261013194005.96615-1-zide.chen@intel.com>
From: Stephane Eranian <eranian@google.com>
Date: Tue, 13 Oct 2026 16:47:35 -0700
X-Gm-Features: AclHuK8uZdYqRb8wR6f2pJnkv0TIuw0zO4fvvfTQZQwDMYoL43cTs3jEd7Uem24
Message-ID: <CABPqkBSn57PLhdZj1syvMTF_LG7NgitKC3xbLMF7vqyK-vyA4w@mail.gmail.com>
Subject: Re: [PATCH] perf/x86/intel/uncore: Add Granite Rapids CMS PMU support
To: Zide Chen <zide.chen@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	stable@vger.kernel.org, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:50=E2=80=AFPM Zide Chen <zide.chen@intel.com> wr=
ote:
>
> Add support for the CMS (Common Mesh Stop) uncore PMON unit, shared by
> GNR, SRF, GRR, and CWF. One CMS box exists per CHA box, at a fixed MSR
> address: 0x3400 + 0x10 * unit_no + <reg offset>.
>
> CMS is not enumerated in the discovery table, so it is added as an
> extra MSR uncore type instead of going through the normal gnr_uncores[]
> array. Since the CMS unit numbering matches the CHA unit numbering,
> build the CMS box rb-tree by mirroring the discovered CHA (die, id)
> pairs, ensuring CMS boxes only appear where a corresponding CHA exists.
>
> Make generic_uncore_msr_ops global so the CMS type can reuse it.
> Opportunistically add the intel_ prefix to match the naming convention.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> ---
>  arch/x86/events/intel/uncore_discovery.c |  4 +-
>  arch/x86/events/intel/uncore_discovery.h |  1 +
>  arch/x86/events/intel/uncore_snbep.c     | 81 +++++++++++++++++++++++-
>  3 files changed, 82 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/events/intel/uncore_discovery.c b/arch/x86/events/i=
ntel/uncore_discovery.c
> index 0a22edf4d509..170f299385a0 100644
> --- a/arch/x86/events/intel/uncore_discovery.c
> +++ b/arch/x86/events/intel/uncore_discovery.c
> @@ -532,7 +532,7 @@ static void intel_generic_uncore_msr_disable_event(st=
ruct intel_uncore_box *box,
>         wrmsrq(hwc->config_base, 0);
>  }
>
> -static struct intel_uncore_ops generic_uncore_msr_ops =3D {
> +struct intel_uncore_ops intel_generic_uncore_msr_ops =3D {
>         .init_box               =3D intel_generic_uncore_msr_init_box,
>         .disable_box            =3D intel_generic_uncore_msr_disable_box,
>         .enable_box             =3D intel_generic_uncore_msr_enable_box,
> @@ -743,7 +743,7 @@ static bool uncore_update_uncore_type(enum uncore_acc=
ess_type type_id,
>
>         switch (type_id) {
>         case UNCORE_ACCESS_MSR:
> -               uncore->ops =3D &generic_uncore_msr_ops;
> +               uncore->ops =3D &intel_generic_uncore_msr_ops;
>                 break;
>         case UNCORE_ACCESS_PCI:
>                 uncore->ops =3D &generic_uncore_pci_ops;
> diff --git a/arch/x86/events/intel/uncore_discovery.h b/arch/x86/events/i=
ntel/uncore_discovery.h
> index 142e1b56cfc2..cececf6ecdc5 100644
> --- a/arch/x86/events/intel/uncore_discovery.h
> +++ b/arch/x86/events/intel/uncore_discovery.h
> @@ -151,6 +151,7 @@ void intel_uncore_generic_uncore_mmio_init(void);
>  int intel_generic_uncore_msr_init_box(struct intel_uncore_box *box);
>  void intel_generic_uncore_msr_disable_box(struct intel_uncore_box *box);
>  void intel_generic_uncore_msr_enable_box(struct intel_uncore_box *box);
> +extern struct intel_uncore_ops intel_generic_uncore_msr_ops;
>
>  int intel_generic_uncore_mmio_init_box(struct intel_uncore_box *box);
>  void intel_generic_uncore_mmio_disable_box(struct intel_uncore_box *box)=
;
> diff --git a/arch/x86/events/intel/uncore_snbep.c b/arch/x86/events/intel=
/uncore_snbep.c
> index a97cd029db36..3abbc1bbf577 100644
> --- a/arch/x86/events/intel/uncore_snbep.c
> +++ b/arch/x86/events/intel/uncore_snbep.c
> @@ -6492,6 +6492,32 @@ int gnr_uncore_units_ignore[] =3D {
>         UNCORE_IGNORE_END
>  };
>
> +/*
> + * One CMS box exists per CHA box, at a fixed MSR address:
> + * 0x3400 + 0x10 * unit_no + <reg offset>.
> + */
> +#define GNR_CMS_MSR_PMON_BOX_CTL       0x3400
> +#define GNR_CMS_MSR_PMON_CTL0          0x02
> +#define GNR_CMS_MSR_PMON_CTR0          0x08
> +#define GNR_CMS_MSR_OFFSET             0x10
> +/* Type ID for CMS */
> +#define UNCORE_GNR_CMS                 50
> +
> +static struct intel_uncore_type gnr_uncore_cms =3D {
> +       /* Keep the PMU name aligned with the published CHACMS event list=
. */
> +       .name                   =3D "chacms",
> +       .type_id                =3D UNCORE_GNR_CMS,
> +       .event_mask             =3D SNBEP_PMON_RAW_EVENT_MASK,
> +       .num_counters           =3D 4,
> +       .perf_ctr_bits          =3D 48,
> +       .event_ctl              =3D GNR_CMS_MSR_PMON_CTL0,
> +       .perf_ctr               =3D GNR_CMS_MSR_PMON_CTR0,
> +       .ops                    =3D &intel_generic_uncore_msr_ops,
> +       .format_group           =3D &snbep_uncore_format_group,
> +       .attr_update            =3D uncore_alias_groups,
> +       .cleanup_extra_boxes    =3D spr_extra_boxes_cleanup,
> +};
> +
>  static struct intel_uncore_type gnr_uncore_ubox =3D {
>         .name                   =3D "ubox",
>         .attr_update            =3D uncore_alias_groups,
> @@ -6595,15 +6621,66 @@ static struct freerunning_counters gnr_iio_freeru=
nning[] =3D {
>         [SPR_IIO_MSR_BW_OUT]    =3D { 0x2e0e, 0x10, 0x80, 8, 48 },
>  };
>
> +/*
> + * Neither the free-running IIO counters nor CMS are covered by the
> + * discovery table, so both are added as "extra" MSR uncore types, in
> + * addition to the ones enumerated in gnr_uncores[].
> + */
> +#define UNCORE_GNR_MSR_EXTRA_UNCORES   2
> +
> +static struct intel_uncore_type *gnr_msr_uncores[UNCORE_GNR_MSR_EXTRA_UN=
CORES] =3D {
> +       &spr_uncore_iio_free_running,

I think this SPR uncore IIO is not relvalent to the patch here. It
should be split.
Thanks.

>
> +       &gnr_uncore_cms,
> +};
> +
> +/* Build the CMS boxes rb-tree by mirroring CHA's discovered boxes. */
> +static void gnr_uncore_cms_init_boxes(struct intel_uncore_type **uncores=
)
> +{
> +       struct intel_uncore_discovery_unit *cha_unit, *cms_unit;
> +       struct intel_uncore_type *cha;
> +       struct rb_root *root;
> +       struct rb_node *node;
> +       u16 num_units =3D 0;
> +
> +       cha =3D uncore_find_type_by_id(uncores, UNCORE_SPR_CHA);
> +       if (!cha || !cha->boxes)
> +               return;
> +
> +       root =3D kzalloc_obj(*root);
> +       if (!root)
> +               return;
> +       *root =3D RB_ROOT;
> +
> +       for (node =3D rb_first(cha->boxes); node; node =3D rb_next(node))=
 {
> +               cha_unit =3D rb_entry(node, struct intel_uncore_discovery=
_unit, node);
> +
> +               cms_unit =3D kzalloc_obj(*cms_unit);
> +               if (!cms_unit)
> +                       break;
> +
> +               cms_unit->id   =3D cha_unit->id;
> +               cms_unit->die  =3D cha_unit->die;
> +               cms_unit->addr =3D GNR_CMS_MSR_PMON_BOX_CTL +
> +                                cha_unit->id * GNR_CMS_MSR_OFFSET;
> +
> +               uncore_find_add_unit(cms_unit, root, &num_units);
> +       }
> +
> +       gnr_uncore_cms.boxes =3D root;
> +       gnr_uncore_cms.num_boxes =3D num_units;
> +}
> +
>  void gnr_uncore_cpu_init(void)
>  {
>         uncore_msr_uncores =3D uncore_get_uncores(UNCORE_ACCESS_MSR,
> -                                               UNCORE_SPR_MSR_EXTRA_UNCO=
RES,
> -                                               spr_msr_uncores,
> +                                               UNCORE_GNR_MSR_EXTRA_UNCO=
RES,
> +                                               gnr_msr_uncores,
>                                                 UNCORE_GNR_NUM_UNCORE_TYP=
ES,
>                                                 gnr_uncores);
>         spr_uncore_iio_free_running.num_boxes =3D uncore_type_max_boxes(u=
ncore_msr_uncores, UNCORE_SPR_IIO);
>         spr_uncore_iio_free_running.freerunning =3D gnr_iio_freerunning;
> +
> +       gnr_uncore_cms_init_boxes(uncore_msr_uncores);
>  }
>
>  int gnr_uncore_pci_init(void)
> --
> 2.55.0
>
