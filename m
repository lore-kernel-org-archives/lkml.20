Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0926337882B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519394; cv=pass; b=W5irUmuA0JdlgaFZt8Pz8DUcMk62iBA/tZY4iJjGM4s572vUGONa7PRDN5HQrvzQ6qMbFqSuOPawshTQgw0VWy+tpMhPn6yyzMlSTW/n9jSezLzWIwpCtnpdhmGoKblCN8rGWM8P24/S00Livi81LlS/sDNa8MDXG8lvqpZO1F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519394; c=relaxed/simple;
	bh=LkcxVkAx4bo8LrMRL29RTAmzpx1sb03jAqHsumFpiT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtG0w5E/FA71tvVNkK0npCQ85AbqaXnxMoDy/UZEL0VLUJyGEhQaLFBjSFaCv7HsNtiPXxl+dC64X67qhgd30whfYB9fXmrYWz0NmKgRsKgosM/tyrAK3GYWAofMOEOjdQwOFxl1C4OguDhxGr/gQ2JKIbxvhnuhyAAhlniPAC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b4jRgCuo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iisafST8; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b4jRgCuo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iisafST8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789519376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGse0lGtGHSILpOr5QMAUERvmnhcCgoXhrGdKRPvFPo=;
	b=b4jRgCuom9XsjlQvWCzdOJJfsHBtv2U3qHesmFaRLVeCbAmNUSOPMCCFXja7qRvL7aGA68
	zJoYhbSuG1dwyVkeB/yXd2vDWWItQi0E9gWw7AsA8cAZHaPW9LaVMp9S2bSlbvaSE9GScT
	4I+kC4qozCXdsxvzt3WfGBHWYRwfpyQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-ayIAfJEFO7auLqH351Oo4w-1; Tue, 15 Sep 2026 20:42:54 -0400
X-MC-Unique: ayIAfJEFO7auLqH351Oo4w-1
X-Mimecast-MFC-AGG-ID: ayIAfJEFO7auLqH351Oo4w_1789519374
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so3667505a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789519374; cv=none;
        d=google.com; s=arc-20260327;
        b=hh5aeC0i5alU1vWqCOGUMUsrvwX8nn3mMfqV2BSJ4FN/ZSxmzqK1OxltAD4a55e8WG
         pbGi99CN6CxzJJUuAQKLLXkmzhYrrs4Qi43JkPbAN3ZNlhZ+cP+ahiQ0l07mSqaA62yF
         9by3ufJgalM3mzn0jI2ZoqOjbWPxnGMv0rjD1iSX3O6k/RGjtnJVFG5/dQn0zDd80vhJ
         AjOkQXtNmP5eWWQNIVFo3x7NhB6NADfjj70RGwq3H1ih7Hv3J0rXQVfwy6jWCBAbPC+k
         yLC94zIgpn0LzA+V9+bRr4g3rxPjbSKuu59jjIcYdN58C5mErMVeRpYfZKvA0ELf9BFE
         HQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mGse0lGtGHSILpOr5QMAUERvmnhcCgoXhrGdKRPvFPo=;
        fh=dmh9+t/pXS3pt60USUFrqOgGJmdZor6vV6cKJH1SO30=;
        b=n5bLyFSQtc/cc17pCyFdMN/JrImFtOvW+F2xO6edV4pPqD+YmwZAVozv2ALIgxDCFb
         OllA2ttOqZawf3e+iHLDHEjroCvTnAcoFYe79LynotEeL9wTC6r3LYp0J4P9knawC7B/
         5lpdqP5WSNQ1LOZf0MBqGoGT0y5iowaexExNVmREGiP/riHOiJxbBD3+RMursaybSG23
         pRH8pNj55YjfMBYbEilLA1mBHa6kIP3lYbrdSMtQuyc0kbna8Qzd/OndPLyj00ucA9Rw
         +1S30nagmtHGNcYfy0DGcFkT77DTnB6gfSAsln+y95R7pt+UJ2tGBr7UElM6/tk5zTeN
         ocVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789519374; x=1790124174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGse0lGtGHSILpOr5QMAUERvmnhcCgoXhrGdKRPvFPo=;
        b=iisafST8Wz/6Z0Jj6iaVTQoMcD56a5CVM+l/dMwrjC/6AtLRBk5eh+4sN8sbJrMyId
         rf4GFRCzmDArz7NxfWuzo1wCKxFjzl/Vc2/P5KTG71IcgKc5T5xCCM7PXpITvmPfGeaG
         aFXj4Iogp8jGEeu04c+Ak4J+yXxV8LZkevFcoEuOUMPuEKCBSKCy+wHPiCjIwrYVp/AI
         FDz5FEEoRmaqqOla7V4czdI5eSUGm99eaAtRlHT6jUwPE2hV7zIeWCyaiA6l9XvfjemS
         pomxTAvGFS+UDGIxJHreZheEb1CEerYczAi3OuFjkTIpbyqT1TEaKpTxlI1iFNVpttOg
         c3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519374; x=1790124174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGse0lGtGHSILpOr5QMAUERvmnhcCgoXhrGdKRPvFPo=;
        b=UXdpNfw6s6yg9xyXdjdM8Najr/A7rkbnq0kRahB3cf3fCpH6c/P102NsP5HZ3MfXHl
         g6JU2ntEyDH/pCvLpK/4IyknIUa6qm+rXqsXwNyPgt/i2SE8SDRYy38h5FkYPoNtKJJv
         BqNexBISb6aaeuJV0iywR6g3M/QSvpod/0V6cr16ph7TCzrltArro5+O1HvGnaCuThHc
         eQJqr8m+Nr2ejJWPLXPFeAwS9k58EvXWd5cleby81qNLoQRQIzQE3qYQfK8hTgE9oID3
         GEpMHMxXakIbxLBjvRHS7l73Jt9ObDxGxkvSL4TtfH2liddPb4fqG7J7mY1C2WFEaUqo
         hcoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmFaeCpuFamr+z1/rH4LSxi6Rop3fWK8UtAbxdw3C7N8GODBXckAfEHtkIiII3oBMHAc+9xpQ7fp47YZM=@vger.kernel.org
X-Gm-Message-State: AFuF++lpAT1etfcUf6QyhAgnqo+HKDFsiExO7scdKP0HxzEgQ8p23UlW
	H8jPh2TXGPKuXyAIujoxpaKNMQUoUgEvrF7CHfWDzhpX0z0+IB19rCMLWmpDXb6/z9C+moR9Mx6
	oAOn2OEBjXJBQL/HYVZiuLzjdvId0ulOLmgYaNnSkazxtk810HXffbbeyIHpQM3Ytm23FB3VQso
	EMg0XGF0/vuaNuuAcoqJbHdjPAiee0aNz4xsk0X7f1
X-Gm-Gg: AYBFou2YxRRCPh0XTIRISZW/enO28UThoya/c/GCTcOxSneeUOjUBiKA6Mdg7rt1WAO
	1vdfasLIDHXDUji3hZKuy40jgs2A9cU7NmbG8ebWCUIWBxtFP72nohYFITBUsdyR+nl1Gep/9Lt
	xQAQarj5x2vLbOQMzBBSEkkHGizlLX9k8dARZ5adCLWqmx22G1B+1sKQqLH4cJuT3d9Di9qDEwc
	91pg0PY8UMlKocA
X-Received: by 2002:a17:90b:5281:b0:39d:f050:a010 with SMTP id 98e67ed59e1d1-39e1e263d08mr1734213a91.1.1789519373691;
        Tue, 15 Sep 2026 17:42:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5281:b0:39d:f050:a010 with SMTP id
 98e67ed59e1d1-39e1e263d08mr1734159a91.1.1789519373138; Tue, 15 Sep 2026
 17:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916001603.22394-1-lyude@redhat.com> <20260916001603.22394-2-lyude@redhat.com>
In-Reply-To: <20260916001603.22394-2-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Wed, 16 Sep 2026 10:42:41 +1000
X-Gm-Features: AcwNN1Vs8ufolmqLJX-ytdf5rJExuz1QFL1qUEVtr1TxWyGYdEA5LkZ7nRPeWL0
Message-ID: <CAMwc25rP6u9=0PxN_OpYUs33cNqoiYYEFpwN4FKPQyHvNb+=Cg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] drm/nouveau/gsp/r535: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE
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

>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/=
gpu/drm/nouveau/nvkm/engine/device/user.c
> index 23d11d8221cb6..c47d6daa9e5aa 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> @@ -27,6 +27,8 @@
>
>  #include <core/client.h>
>  #include <subdev/fb.h>
> +#include <subdev/gsp.h>
> +#include <subdev/gsp/priv.h>

Including a priv.h seems like a layering violation.

I think you should define a nvkm_gsp_gcx_ready and then call the r535
via a function pointer in nvkm_gsp_func.


>  #include <subdev/instmem.h>
>  #include <subdev/timer.h>
>
> @@ -189,6 +191,41 @@ nvkm_udevice_time(struct nvkm_udevice *udev, void *d=
ata, u32 size)
>         return ret;
>  }
>
> +static int
> +nvkm_udevice_gcx_ready(struct nvkm_udevice *udev, void *data, u32 size)
> +{
> +       struct nvkm_object *object =3D &udev->object;
> +       struct nvkm_device *device =3D udev->device;
> +       struct nvkm_gsp *gsp =3D device->gsp;
> +       union {
> +               struct nv_device_gcx_ready_v0 v0;
> +       } *args =3D data;
> +       int ret =3D -ENOSYS;
> +
> +       /* XXX: We don't know any way of performing this check outside of=
 GSP, so just assume
> +        * things are ready for non-GSP clients.
> +        */
> +       if (!gsp) {
> +               args->v0.ready =3D NV_DEVICE_GC6_READY | NV_DEVICE_GCOFF_=
READY;
> +               return 0;
> +       }
> +
> +       nvif_ioctl(object, "device gcx ready size %d\n", size);
> +       ret =3D nvif_unpack(ret, &data, &size, args->v0, 0, 0, false);
> +       if (!ret) {
> +               nvif_ioctl(object, "device gcx ready vers %d\n", args->v0=
.version);
> +
> +               ret =3D r535_gsp_gcx_ready(gsp);
> +               if (ret < 0)
> +                       return ret;
> +
> +               args->v0.ready =3D ret;
> +               ret =3D 0;
> +       }
> +
> +       return ret;
> +}
> +
>  static int
>  nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 =
size)
>  {
> @@ -199,6 +236,8 @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mth=
d, void *data, u32 size)
>                 return nvkm_udevice_info(udev, data, size);
>         case NV_DEVICE_V0_TIME:
>                 return nvkm_udevice_time(udev, data, size);
> +       case NV_DEVICE_V0_GCX_READY:
> +               return nvkm_udevice_gcx_ready(udev, data, size);
>         default:
>                 break;
>         }
> +       return ret;
> +}
> +
>  int
>  r535_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_suspend_state suspend)
>  {
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

Have you confirmed this struct didn't change in r570,

Thanks,
Dave.

