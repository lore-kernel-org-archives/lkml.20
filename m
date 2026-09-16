Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D459948CD7C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602520; cv=pass; b=iB8gyNe1Kg+gA0iAgKMC3k4kUu5MTOCN294AxTQcngohibTlw4MXIZEuDvVJW2b0lOF/o/90dPq4CtOdwtnRnDYutxoLYeCi3GPGzoLGNqNL0yE87v3p/CNFzBJyX1NCi5VruQmFe/UwrBLH/W800k/9pmWOKq0cPckKLV3R06Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602520; c=relaxed/simple;
	bh=H7hphv5jcteUbc1/afHUjHW8Z9pzMhDPXauN4g6BTeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZw/NeJ+HQK7K/4Ll3jjoaMVtKTFRFE8Z+lTnXaaIptuyERMzb39AkEERE33DBIeEAJQPsyD48o4ZFtJpiKe8WJEFbdVVMKAdxBGrcTTiyt9Zcg+B/vmg8TWD3Sq2e2u76Jtuf7xSaw71JqSLboPx2Pj/udO4b1ppdtwDWJHV4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JUun7hBa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uBYIMLLl; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JUun7hBa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uBYIMLLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789602517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnxlhPopZDA9jrGnXRXH2XzZuWhm3/u3li0L+5ojL0Y=;
	b=JUun7hBaw09j2WH54JtKiMqxDFRR/rr7tL8FTJuQMx6ZT6YSXGrPp7LQPeBhrsVBmn9MFi
	NmG2LieMrHCJFSeZDyQaKMq542+8ai8W1d3AW+ND7KYCaOvACaai75MbFZBtw1VIjn+E61
	YLDMZKqq5o94OOp7PzQtLbwwiledNZQ=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-dSz9-y0OPya_KGf4Okl4UQ-1; Wed, 16 Sep 2026 19:48:36 -0400
X-MC-Unique: dSz9-y0OPya_KGf4Okl4UQ-1
X-Mimecast-MFC-AGG-ID: dSz9-y0OPya_KGf4Okl4UQ_1789602515
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so275251a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602515; cv=none;
        d=google.com; s=arc-20260327;
        b=CJM/AlW9W63xOJOlu8AoTtGoMiALGUa5tpjOkrwrbl1cfw1kWHZeU7mqOxDsZlQftN
         BeOhd310jdqR+SEXad6xLxAVsBxDlemoHs4aZci9m/dijgBYbR1nPAJwi+q/xIdRoS/c
         0h29UX8l6hZhPVVBV/abfNL3SrGBjXFELHiF1B8wmUyr/kT617HrQ3WzE5sBaVzNj/bP
         45BT8OHojf5lUiTG8pQ7qYsNSj2ChCEhHbtxbvWICl+ASFF5H23+B+JR80iNt29gGoLx
         Kz9MiIqQdoVpZnCJoXn19pldsvpX5IizP2ZrRlwZce29OAzPyshB8fxXzfearIdjVqwN
         rBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xnxlhPopZDA9jrGnXRXH2XzZuWhm3/u3li0L+5ojL0Y=;
        fh=UwWX8PeqhEgsNSv78GEWq3LSE7y6jN4jMYD/D+lBSec=;
        b=jX1PpwNIO9q8pmAFVsqNly/NGSVoZN/Y/lA9QDxqFS7dW5mK3xQL08BxbAET1FRcLr
         QNoRJdYC2AlngddRMvFFFyIJzt5Gx7RBDdO64WO8XqVIPX0eQj7Ytb5rtvNJiTxDADDV
         m2ZuKnvKdf2gcpTgzTVKSdfThFQT7wC0HlMg6w9821v0Ig/lbbv7UfZ5cwBqWAynwebB
         z3QPgzcOLbM3WtuUFZ/NAHSzd7TNZQWdj303yu/h2p1d/5N73M3zMMoyRaG3wxxHRLmp
         uTnsZ4CNjQAfWZzl4enWS+ldbokr4OJqSEJRSjfZuSzKlXzp9NYL3Y0eZNaZR+3lFkNm
         FKtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789602515; x=1790207315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xnxlhPopZDA9jrGnXRXH2XzZuWhm3/u3li0L+5ojL0Y=;
        b=uBYIMLLlxWiA/GJnxGIaClAI/Rurc+uPupKiw4Itl2KTuoXFE2bU7z30/anl8nbp7X
         pUo8G4ECpjqjLepKhLtZFzImFYLODcA98hcXrUNN28LCHbgpwLcsKoJxOITNbM9FpLTP
         358/K1gOESoEK5WtYDyx613EUlUeFV+zquHLSsmdf4pT4TbVx5TS6p+05f51L850tPLG
         BzT4LNJbnSzZMk/EbTi28lbS/76y6h2XdB3ILSBLBT+Aalhb/Sdy6cmUsnQKyl8PMAJk
         5/Bd08wDRG62BQE7cSGyKMwSNKdbndak1oSQMU0RO4YUWvH2q15WKoDdsa2zhENqPlLT
         o9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602515; x=1790207315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnxlhPopZDA9jrGnXRXH2XzZuWhm3/u3li0L+5ojL0Y=;
        b=BZMVkpMevGmt2UZDX+vg51HPG6cYLCaopGcOFS+XorHPV46HJAuyn5clV/RcufoHjF
         V/yAmdK6PdjhpQ3NQCWDV1FxFFMhae7gc9TMSCdbJlfT5fsGD+omiqqPXaDI93VRpoMf
         P6cqViug690jDFcTeij17JUhevi7oJONKyaf7dQZ1pq6ckB4//Ra47WlFTfUaDjmHwUP
         IJNoPr6YCN926F+rsbgweck0nUwiXYLVd1ZDf1goiF9CdX+GBuUwXQW6Xsp77+4KXuui
         4YfbGJb3PXTgWLxzCN/gYhN/xLszbAEe4+hTE7mbew1xy5pPbd5h19VVityXlV1KsimM
         HXEg==
X-Forwarded-Encrypted: i=1; AKwUvBy+R872q363ZzdZFehOYbtFkUyHiNvRH6QmZOjAiwDgDICbrGHDUejzGRo4/BrrKwFtTu4z8x4gpAjXjxc=@vger.kernel.org
X-Gm-Message-State: AFuF++mBdaUpgi5MWhtZhBUOMFveSFtpxcWrnHPHKLjMHejHr0xWVa0W
	UXkZgv9EC+ZlBhvn+KeO8aaHH54hlJWmT1yf8l2958Xk4rWqclHwPoJHwMY34uSubSV1Y9BEXg6
	YdcC9gCUN9IsBHiPj4qjh5NOOiMCXFyAg8DTViwK5XUAuaSrJ/0H6HKb+iduBBjqS2C3KYgFTfQ
	Vw5n66nTkHjnTho6Zxyl/57i7tZqsUIax8jqFuHX4V
X-Gm-Gg: AYBFou2MfTGesG98g8aNG0RhPnOdbnhHY2r8huYdsCqQNSiBTxbjIPjPCeuwLrE1KxT
	mXcTDOmojLKLb8E44X8qWUfdoza1hSZkmsjX0iV39+XpzgrYPbqZzUBK+88h6pFTv6//2YqqdCB
	fqgpXOY1dHdiNs2Mn372pXF6PpP9LofsJRn8JbaB7y39emnWtfEHWwsZn1VNh8ty07PbDQwBYG2
	AdNobEHKQdRaKX1
X-Received: by 2002:a05:6a21:6b10:b0:3da:1e7b:ea27 with SMTP id adf61e73a8af0-3dd5f6fcf23mr11578374637.21.1789602515345;
        Wed, 16 Sep 2026 16:48:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b10:b0:3da:1e7b:ea27 with SMTP id
 adf61e73a8af0-3dd5f6fcf23mr11578329637.21.1789602514925; Wed, 16 Sep 2026
 16:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916223358.507351-1-lyude@redhat.com> <20260916223358.507351-2-lyude@redhat.com>
In-Reply-To: <20260916223358.507351-2-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 17 Sep 2026 09:48:22 +1000
X-Gm-Features: AcwNN1V8GFuFBGj8sz9eOODt6sJo4wkIs0f7lYVi3FbrfgfAjEUxRByMOdrQ3Zo
Message-ID: <CAMwc25pFFJ5vL4QajybiYrvyS+Dd_iohvQNEHTFZVTLjzJe0VA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/nouveau/gsp/r535: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Timur Tabi <ttabi@nvidia.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	Mel Henning <mhenning@darkrefraction.com>, Hongling Zeng <zenghongling@kylinos.cn>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 8:35=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> OpenRM's runtime PM handling looks a bit different then nouveau's, one pa=
rt
> in particular that differs from us: OpenRM actually consults GSP to ask
> whether the GPU should be allowed to enter Gc6 and/or GcOff before runtim=
e
> suspending the GPU. In the event the card isn't ready, runtime suspend is
> simply delayed for a few seconds before retrying.
>
> Implement the command used for querying GSP about this,
> NV2080_CTRL_CMD_INTERNAL_GCX_ENTRY_PREREQUISITE, and check to ensure that
> the GPU is ready for runtime suspend in nouveau_pmops_runtime_suspend()
> using this query. If the GPU can't be runtime suspended, update the last
> busy counter of the device and then return -EBUSY from
> nouveau_pmops_runtime_suspend() - essentially delaying the runtime suspen=
d
> process by whatever autosuspend_delay_ms is set to.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---

>  static int
>  nvkm_gsp_fini(struct nvkm_subdev *subdev, enum nvkm_suspend_state suspen=
d)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/priv.h
> index 71b7203bef507..b07797813b049 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> @@ -93,6 +93,7 @@ void r535_gsp_dtor(struct nvkm_gsp *);
>  int r535_gsp_oneinit(struct nvkm_gsp *);
>  int r535_gsp_init(struct nvkm_gsp *);
>  int r535_gsp_fini(struct nvkm_gsp *, enum nvkm_suspend_state suspend);
> +int r535_gsp_gcx_ready(struct nvkm_gsp *gsp);
>
>  int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, en=
um nvkm_subdev_type, int,
>                   struct nvkm_gsp **);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h b=
/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> index b6683a5bf870c..fd1170037c030 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
> @@ -782,6 +782,13 @@ typedef struct NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_=
TABLE_PARAMS {
>
>  #define GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE      ((48 << 10) * 2048)   /=
/ Support 2048 channels
>
> +#define NV2080_CTRL_CMD_INTERNAL_GCX_ENTRY_PREREQUISITE (0x2080a7d7)
> +
> +typedef struct NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS {
> +    NvBool bIsGC6Satisfied;
> +    NvBool bIsGCOFFSatisfied;
> +} NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS;
> +
>  typedef union rpc_message_rpc_union_field_v03_00

you can drop this hunk if r535 doesn't have it.

Dave.

