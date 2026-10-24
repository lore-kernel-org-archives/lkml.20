Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792825567;
	b=I5AslFFFhsmP2GUTUsYNxcs4GiYbY+McVbD15+6Dm5y1wJM7krBKkwtn+OirepUmnMbI
	 y6hKyySdL+l7HVAv0wNWLQxQhBnxQm9ur04dt0LzTShh0OOitZ8A7wTOWwbO9ifRmQQ0o
	 Ob0SbhfpQcjoy34klXKtO2SEjtP81kWnozprQf6K/B1Yng3ogAnPcDzY9qeH7F5+tBf5c
	 AEWc/gsvHE++JHlUXs/bbZ9f3btR55s+KSfawJVK7FX9uia8pJGgQm1haTYI5CDSTeH6W
	 TVWiC/RggWjt4gJ5OPpgizEaYc3AUrdnIK6rFAVDudySUXXbYhehON2bTADqjfGHP4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792825567;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=oqxBdCmRUh/o3pj/13O6zevxwBIO3ke0ZjDeWjPvwqM=;
	b=JPrKA3+bbBrxZyAltpGs5qgSGmUF4g0//M9n9wnDQsPdyb6vhq/bRpm9W9kPM21u1NbE
	 6nwpxp+5czozUDm0eT3VxjSuAbJCdF4lqM+jvpVykJQmWTrcH4rgbGXptojh2ceER6ns7
	 GL0ybXxEuaibqp7aL4JfghtpVYI+8wmLX0cA6KeTTTg3roAvLEo3eViGhAuiUG03EddYy
	 ViStCmO0Z75/0BJFWvmw7vU51i+fIyo4nwsqVTKGh4IAg3cERe7LpfPnUacXdy2wOT+OX
	 V92JCMCctlGkxfdV2HiDN9imxU1CijLBhWxfAaedbVGl+rnkvjChemRRS3fqguFMIGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OaqPuphi;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VI0sC5Pk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993E2606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 993E2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OaqPuphi;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VI0sC5Pk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792825565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqxBdCmRUh/o3pj/13O6zevxwBIO3ke0ZjDeWjPvwqM=;
	b=OaqPuphihpLfN48K3vWNcW8UOlMCZkrFPbu8LOy8udoIizo9OT5pG5SUGTwspgjklL9ADO
	AisnaJMlPjo8BEalctxFYREEQSZUXqVxunUk1ZkjtHPU7u4Kjw6WDOF4avkwbxVzMRv2fV
	Xwvg7ruXWqXB1ds/cdMSeRfrXfRWbIM=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-O4WBS8_uMd-P9iS8O5AbjA-1; Sat, 24 Oct 2026 03:06:02 -0400
X-MC-Unique: O4WBS8_uMd-P9iS8O5AbjA-1
X-Mimecast-MFC-AGG-ID: O4WBS8_uMd-P9iS8O5AbjA_1792825561
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso4544136eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792825561; cv=none;
        d=google.com; s=arc-20260327;
        b=oOwuPnOrwsp2PHLypn+OOT/lUzhFBZCqw+V3W4+OhE/o4ziIFeciapJE/EzcTvJ/0a
         fwpYIChCFv2LLAJZLo5s53FSogfY/kogKy64i7ZiKzI6ogURAAUw/TjefoyiOgv0+UQI
         jYxD6MG6fkV9NLi7vtj7q+DYT+XkrVmdLSzqGDwmIaDUMuG5W2ZjVMgXt2RcOJQBQR9H
         TQrpXrVxi3kSn3cJJWh/zMPWp5/O+ndduXA9/neFEz226lz+cvMHhAgGCo2uRiEwv5gE
         YYJjfp6BB+C+ueEQObS1kngPLl6VLTJpVLPByMJuUXaE/UrELkknmMnJtEG+NyD9wGUJ
         7Wzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oqxBdCmRUh/o3pj/13O6zevxwBIO3ke0ZjDeWjPvwqM=;
        fh=sp0Kcm5DIG8ePkLIgYun87kXE7wZPgVAPTb+cWnhnoM=;
        b=HoSZJSX9JXCBEIxdLi5DIORlh+vME7+t4aNwT+k2uo6TRvvvSm5UK8BKP9a76Y8N5p
         nCN4VgPgOGw9/E+9tCdSpEiU/H+Px9H+qlqxYcs+X3zFmksTKfyB6r13GI+lLPKypQuR
         nlzdBJoeuoMZkWnIKhPYpaio8EcbFruf8G8Vri5R5xvgrgLwQxF/M1xBjlqF7Fu31FuY
         S8temuK9QvqlB0+/+YdiW+k4r8E4EZvddAvqlcghFh37ZXKl0qDVhBcRkbJ4vKalwvNa
         ixN0kfPDlEe2Y54wpaD5xqivKLjVfegIJhCWwbWlltPWXOYqPoAMVXEPGOPXnB1YOLmB
         hj5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792825561; x=1793430361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqxBdCmRUh/o3pj/13O6zevxwBIO3ke0ZjDeWjPvwqM=;
        b=VI0sC5PkHr6yKoBsfWvmw1q15lUhtPLbRjHBiuIHOHMQnk8XgipowikfYIDZcLeA++
         RiNRGn9WF52/jBJyaBFin/D1ZsiS/EYIKMznxoMBs0jxxMdSngruoWmdJT8ylcobANK9
         p8bVbuMe9lugVXkcy8+p94b0hYmbH0FKyg89A2u/HHzElHqiNT/4bQVt7Yx22HFbMxW9
         yGNoRgf5SaU95Ubydzm7ZLDplv8hZBg0tp+eF4qqIdqH/Ols6XAlly+WM83Ndzu9GydX
         MVf/CCM7fcF8FDsfcgWcg4S1IvcrJ8YV2X9Ra0xbYNM1zx62VGHM/btZAnlD23eOJG+o
         Ui9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792825561; x=1793430361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqxBdCmRUh/o3pj/13O6zevxwBIO3ke0ZjDeWjPvwqM=;
        b=0eyB+Iv9STzEy5A9czn2A3C2WLVHGMyhH0+cwPMImGDrfGPVWwo9gabj1bW0W1fgWL
         ztrGOo5EANn7I+07ovfObisNMo1p4lv/skRkxgdhHMq+i351vJwAnSkA0VHoaYyw2sYZ
         mIcLlhXF+Tx7HqKGjqI1xlfcgaw/GTKjddDo+1iGS6ssm3XEbDar0TR4KbNMGjTflUca
         C25JYhC4t88X7Q2FKYCcVgx3Qmw7AGt4AMr65ZBGJQroSnZqMQLoDIBT63taby19YkEb
         MXnFJfCIbr4eH58b1KnK/A/UUK5JYoLsPvENb77pnAcAvSud0iljnOOVtjSwsEX9z5Q6
         kFOA==
X-Forwarded-Encrypted: i=1; AKwUvByWqm2RTfMUwzCiwZFiKEPrwqRNO8etfK0JZGjNN7WGGVmOWHMWcaP8MOXoNIhLk5BCq1JaXrt0jv7qLFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDHz58GsZs8iWqKq8CfLUveq3SG7CbHIimw7KK4L2yCN9khcX5
	RW9op50FQMxgvWuuW/xWZhsKrknLegxZ0PgkMoZRgOOLywO1Hc+wssJVz1yKv7165gGzrfITaKA
	4qqHFtUc2Pm8T1HY2b4/7Cg9wdlfz5UMI/1LMqqlFEQhsWrwPSDXkNQv86ATJZ+D511HcJhlNqA
	xOGZo1Gbr5EJslRVo689wFpsjY3zNLd4V9SGHPUCu4
X-Gm-Gg: AYBFou0fINaoDrAjuVPJ+9xphTorkYIPIJqwDl7D2HlNGMqQlRl7FbZ9UeKUZL9Ak/q
	ZKT6jKDyzZIrcFo8FgC+nfMZx0h1h/D3piTCaLnQAeXPqreQjK25eMb8ne7PcYlPbjDlTHfg8Wv
	MQ01ZJm/jARw6q2XIcIOE4Jl4ymWBjMKHMKWJzo+y4YibmhMcj13b8lMemW2/r3KJIm9fwtY1sM
	iRyE5UR/fkaHgPV
X-Received: by 2002:a05:7022:f90e:b0:165:aced:1fde with SMTP id a92af1059eb24-1991b421e8dmr1507376c88.0.1792825560697;
        Sat, 24 Oct 2026 00:06:00 -0700 (PDT)
X-Received: by 2002:a05:7022:f90e:b0:165:aced:1fde with SMTP id
 a92af1059eb24-1991b421e8dmr1507363c88.0.1792825560145; Sat, 24 Oct 2026
 00:06:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-nouveau-gsp-irqdest-v1-1-5dd6131faa14@sudmix.de>
In-Reply-To: <20261023-nouveau-gsp-irqdest-v1-1-5dd6131faa14@sudmix.de>
From: David Airlie <airlied@redhat.com>
Date: Sat, 24 Oct 2026 17:05:48 +1000
X-Gm-Features: AclHuK-0XItFovw3G1bBVKRVCBplwABReOzmq7h2Qp7p5fFLlK5pknGM07AUT98
Message-ID: <CAMwc25pyuJxHJnziCvorWvFb5awsgn9RZeYQ8GXpQ3Vzs7ro6A@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/gsp: only handle GSP interrupts routed to the host
To: joe@sudmix.de
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:38=E2=80=AFPM Joe Finzel via B4 Relay
<devnull+joe.sudmix.de@kernel.org> wrote:
>
> From: Joe Finzel <joe@sudmix.de>
>
> The GSP's interrupt handler takes every pending interrupt the RISC-V
> IRQMASK enables as its own, without looking at IRQDEST, which says
> whether an interrupt goes to the host or to the GSP itself. One that
> belongs to GSP-RM, pending when the host's handler runs for the message
> queue, is reported as unknown, cleared and masked off with IRQMCLR,
> taking it away from the firmware:
>
>   nouveau 0000:01:00.0: gsp: intr 00040000
>
> NVIDIA's driver reads the interrupts routed to the host as
> IRQSTAT & IRQMASK & IRQDEST (kflcnRiscvReadIntrStatus_TU102() and
> _GA102()). Do the same, with IRQDEST from NVIDIA's register headers
> next to IRQMASK on each falcon.
>
> Seen once in a few boots on an RTX 3070 Ti (GA104, GSP-RM 570.144),
> before the login prompt. There IRQMASK reads 0x01049042 and IRQDEST
> 0x01000040: 0x00040000 is enabled but routed to the GSP.
>
> Fixes: 830531e94712 ("drm/nouveau/gsp/r535: add interrupt handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joe Finzel <joe@sudmix.de>

This seems very reasonable.


Reviewed-by: Dave Airlie <airlied@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h  | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c       | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c       | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 4 +++-
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c       | 1 +
>  5 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h b/drive=
rs/gpu/drm/nouveau/include/nvkm/engine/falcon.h
> index 341f133dc38..eb8adaf07fe 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
> @@ -63,6 +63,7 @@ struct nvkm_falcon_func {
>         int (*select)(struct nvkm_falcon *);
>         u32 addr2;
>         u32 riscv_irqmask;
> +       u32 riscv_irqdest;
>         bool reset_pmc;
>         int (*reset_eng)(struct nvkm_falcon *);
>         int (*reset_prep)(struct nvkm_falcon *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ga100.c
> index d5126fe39d2..10e2813a016 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> @@ -27,6 +27,7 @@ ga100_gsp_flcn =3D {
>         .enable =3D gm200_flcn_enable,
>         .addr2 =3D 0x1000,
>         .riscv_irqmask =3D 0x2b4,
> +       .riscv_irqdest =3D 0x2b8,
>         .reset_eng =3D gp102_flcn_reset_eng,
>         .reset_wait_mem_scrubbing =3D gm200_flcn_reset_wait_mem_scrubbing=
,
>         .bind_inst =3D gm200_flcn_bind_inst,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ga102.c
> index b6b3eb6f4c0..96fa26fa612 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> @@ -140,6 +140,7 @@ ga102_gsp_flcn =3D {
>         .select =3D ga102_flcn_select,
>         .addr2 =3D 0x1000,
>         .riscv_irqmask =3D 0x528,
> +       .riscv_irqdest =3D 0x52c,
>         .reset_eng =3D gp102_flcn_reset_eng,
>         .reset_prep =3D ga102_flcn_reset_prep,
>         .reset_wait_mem_scrubbing =3D ga102_flcn_reset_wait_mem_scrubbing=
,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driv=
ers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> index 94925f1590e..463e463db24 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> @@ -64,7 +64,9 @@ r535_gsp_intr(struct nvkm_inth *inth)
>         u32 intr =3D nvkm_falcon_rd32(&gsp->falcon, 0x0008);
>         u32 inte =3D nvkm_falcon_rd32(&gsp->falcon, gsp->falcon.func->add=
r2 +
>                                                   gsp->falcon.func->riscv=
_irqmask);
> -       u32 stat =3D intr & inte;
> +       u32 dest =3D nvkm_falcon_rd32(&gsp->falcon, gsp->falcon.func->add=
r2 +
> +                                                 gsp->falcon.func->riscv=
_irqdest);
> +       u32 stat =3D intr & inte & dest;
>
>         if (!stat) {
>                 nvkm_debug(subdev, "inte %08x %08x\n", intr, inte);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/tu102.c
> index 11a37963bd4..823532758af 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> @@ -420,6 +420,7 @@ tu102_gsp_flcn =3D {
>         .enable =3D gm200_flcn_enable,
>         .addr2 =3D 0x1000,
>         .riscv_irqmask =3D 0x2b4,
> +       .riscv_irqdest =3D 0x2b8,
>         .reset_eng =3D gp102_flcn_reset_eng,
>         .reset_wait_mem_scrubbing =3D gm200_flcn_reset_wait_mem_scrubbing=
,
>         .bind_inst =3D gm200_flcn_bind_inst,
>
> ---
> base-commit: fb26cf4f1df40a462ea65552a3fbcc8cfafab523
> change-id: 20261023-nouveau-gsp-irqdest-a0819d1eda96
>
> Best regards,
> --
> Joe Finzel <joe@sudmix.de>
>
>

