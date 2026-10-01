Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D22B443C10
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834443; cv=pass; b=IbwtJeTUutWByFbi+NOnltqXC8JcfyQnCrt+PCxOqj5XAWwSvUIDB1hQo1T1DgbgUO6FVt5aGCEosYFeI4crVABgQJPWef4bYIwvdUqg+qLh44zBSb8kuoFx/CdCUNSYJFKQaigH1nDX2n4lQr+tl4F5SzC1w8sY8GojAkoT8Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834443; c=relaxed/simple;
	bh=/FJGoO1fk95hxs0DHBp/xd6arTYff4kea7u7+4sr1TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3FSylvfIGBZbQmugHhD3qN4E8slijuIowk1isWDKRQxXz2l9qiRjiZIRxO4ln1SnNU4Ai+3SkBwAxkiD6cOROCnAkzuQF+zicfF3T7bfajVTT+Dcd2uj7skMsot7XLkfsvO2C5+jhTZn6YMd+SyeGwtOdjUY6q5nFH/A3irl9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6crsQ+l; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6crsQ+l"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e50968489so5331626d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790834440; cv=none;
        d=google.com; s=arc-20260327;
        b=AFsT1JIA5fbhhdtManmjgC3WxdVED74o3OJsU6M3U+W+yALeWfY6Plmerv1wa9jLZE
         ylIq/TkvWZAGMK8GNhKST7D/I1bBFYipH33+rUgPf41pst/gj7XfQ4aToszcu/st1X0s
         b2NFI6g0l/cyp68Qv3pc2tDyp4nCxYbzlmWNNcvAH+bPXU/x7kOHnr5t/EuncwAYWHtV
         v2WmhCEUnVk8HJbFulBq0EbA4JTTggFgXp0p/Km8R6XqvNxxENGbOB4WkNZofstlrz+n
         z3RfvBs6fnurcNalkcSMGrSK4zJk5U0daCUL7NPS1W7bs1QJpGUiG38lnd6Nk27328+0
         x6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xN7BcKnsbu8UTgMaoDBZRZB/C6V11nckFkUqzqAfWz0=;
        fh=McCU+2YieDtQNzaQ62xkRCgQp7xIlVoWPXqZyVN1y4I=;
        b=KsxQVnXctheMM5b2WklPwWTAEoaKKFIVEUcFXeDN1dBjlMKQIs5XA5/1FBwSNT5sq2
         hM6lNbxdGvA/WRxmon2oo2sHnS0JGi2b4x6u44u9zrs/HsSq8nktyxMfaq9hBa5whJ9o
         wY9w7BgFEAeVLIG0GwFg5gukgyTZ92zzaqhcop2oSq22//DfCJPOwg11mgWsz1/O66KF
         gtwKOVbBcRJj32SDjwIi2N6GmvJyaN3NyF8Oe9qwgU3QWSjSifgJXibueYhtSba54ZJf
         MFvVeb03DrO37l9F7P5Y9IHCyxw2UxSA68Jftks4NtqsxRk3wsx3bKf748VtPNVNY/Wv
         LB1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790834440; x=1791439240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xN7BcKnsbu8UTgMaoDBZRZB/C6V11nckFkUqzqAfWz0=;
        b=h6crsQ+laozd5ozh5eXNPHsuu2Avz2QzU96eavpdYWv3CnivZkWw5iq/hE16ktQC0t
         KevV/a68pcBYoC6EBHAhZ2Cj3TI6aZ1oMLXExcdUcaheLPyEH79jOAVzLa1BXMc7ZMHY
         xNcTMD8otixWVzFjqGJ3vcrq4XDXdGMyiTY04ERSl3+07/EBTgd2P8Ost6wvvBD68aHP
         +i7gRBbHLQ9dfSxFGEJWhdoRL8aTBy8WxvMEKLxFAgI/EE/syvevDA5IlK6HI1fZdEE1
         kdEhxo1t2XPN2+GXKoBrDa9ULO+NUhu7nmsbaJFm6Jh2K+XTIE+jORG747YAljg31hDo
         Nasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834440; x=1791439240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xN7BcKnsbu8UTgMaoDBZRZB/C6V11nckFkUqzqAfWz0=;
        b=z02DgkVZDf83pKy20/i9XHOBxMECGWbV43NJUAVHDI7JmvAKVFrLJ1KVIQxpgGgUf5
         43YOtukXMmdXYRiE4FRfSPl1nYF6JAx4HmBOydD8qlVMMhGjVq++R5otrdekTOiSUncf
         tTG0x8qRF16mLKFzAWoNYtmHiQuC56SkOyPQpFS0lY9vGn4aQ+gx+RmRycSLb1cd+t8g
         5w5wHPQDugGrN8T0Kw24VCb1IV12XhRlZkrjDaghkW/jks01HQAzXNSt3VxYWXhJMxGc
         qhntglXiQkqZr/haTFZTTwXZ0oI/5MT0fh6g9+qtJB1503JfyL2MA4UUdcDR/oZ6AZ55
         wyGw==
X-Forwarded-Encrypted: i=1; AKwUvBzo6XZTfsR82xyHrY/Yyq+cSuWaubhffEypCKY/MCh3bogCinLxrlrEBg4uhKHk8eFyu/7feQZD2thIceo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDWZ+E8/BraOLGiDb44QndBHnCFtMZ5nJDMeOvI+frLfYxIDBH
	S1h2sIaPllZ07eSuYd6ueUvVETLqz7if23bVlBxrf1YMB9d5FbGLLIs5wsDJdQ9af/f2Q7r7uKC
	FikhmwwyMgNfCz8ocIxSNqCa6psiU1F4=
X-Gm-Gg: AYBFou0QtVv3kfwDip3VUSdgSJAEU4XQiPCxVOSMQjLgD10SuwHqWDt8AjjUSG4nk59
	shpD286f0iUtmU7vnIiSsc9pO9aoXRapmkZSSPwNVXRxSrVmx3XXwsAZqucK8VLT3R6pZ+hOxw/
	HEeP6ntKlmQcDZmnfTBGeJw5rFjyJJZndztb1l/KNRlyyJ1lkbODkvPks/jJnJNHR2OkKKmFmby
	Dpl+W8ZZJLzUwMNJoXI7W3JWFaoV9xpC78gAdf9A4rFJ5Q6Nd4NaxC/KNMh03j0P86JAKy38WdS
	m2eVirDHRWGxUtc4e7UqWKWyAzZ6Ep3zSfEXzRa9OYNVwUWcoOV1OAfGJbVPjWJN6cY=
X-Received: by 2002:a05:690e:4419:b0:675:5fea:d08d with SMTP id
 956f58d0204a3-67683540c18mr1462188d50.95.1790834439646; Wed, 30 Sep 2026
 23:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927-pvr-fixes-a-v1-0-7f5b18ab989a@gmail.com>
 <20260927-pvr-fixes-a-v1-3-7f5b18ab989a@gmail.com> <26a436bd27cc66407d776947c5f91ea7ae518600.camel@imgtec.com>
 <b15cab8d1c5074d702f8acc1924911e06076e25f.camel@imgtec.com>
In-Reply-To: <b15cab8d1c5074d702f8acc1924911e06076e25f.camel@imgtec.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Thu, 1 Oct 2026 15:00:28 +0900
X-Gm-Features: AclHuK-fQjrBk_jWbe2V4mvWX0gdKe-JZOGe_2GT2zX42Yv18CEwrrb6vROL82c
Message-ID: <CAKbEznsX8y_KAtEuk2Rp9VrcRbTO7Cn0B373ke5pGKvTq5GQOw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/imagination: Size page table preallocation by
 device address
To: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
Cc: Luigi Santivetti <Luigi.Santivetti@imgtec.com>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"airlied@gmail.com" <airlied@gmail.com>, Alessio Belle <Alessio.Belle@imgtec.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"imagination@lists.freedesktop.org" <imagination@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure!

On Thu, Oct 1, 2026 at 1:47=E2=80=AFPM Brajesh Gupta <Brajesh.Gupta@imgtec.=
com> wrote:
>
> On Mon, 2026-09-28 at 09:03 +0000, Brajesh Gupta wrote:
> > On Sun, 2026-09-27 at 17:25 +0900, Gyeyoung Baek wrote:
> Hi Gyeyoung,
> > Hi Gyeyoung,
> > > pvr_mmu_op_context_create() preallocates the page tables a mapping
> > > needs. How many is set by the device-virtual address being mapped, no=
t
> > > by the offset into the object's pages, which it used instead.
> > >
> > > Size the preallocation from the device address instead.
> > >
> > This issue is recently fixed under
> > https://patchwork.freedesktop.org/patch/755274/. Please have a look.
> >
> > Thanks,
> > Brajesh
> > > Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
> > > Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
> > > ---
> > >  drivers/gpu/drm/imagination/pvr_mmu.c | 27 ++++++++++++++-----------=
--
> > >  drivers/gpu/drm/imagination/pvr_mmu.h |  3 ++-
> > >  drivers/gpu/drm/imagination/pvr_vm.c  |  5 +++--
> > >  3 files changed, 19 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/=
imagination/pvr_mmu.c
> > > index 3e494bfa936..dd5f6d32864 100644
> > > --- a/drivers/gpu/drm/imagination/pvr_mmu.c
> > > +++ b/drivers/gpu/drm/imagination/pvr_mmu.c
> > > @@ -2335,7 +2335,8 @@ void pvr_mmu_op_context_destroy(struct pvr_mmu_=
op_context *op_ctx)
> > >   * pvr_mmu_op_context_create() - Create an MMU op context.
> > >   * @ctx: MMU context associated with owning VM context.
> > >   * @sgt: Scatter gather table containing pages pinned for use by thi=
s context.
> > > - * @sgt_offset: Start offset of the requested device-virtual memory =
mapping.
> > > + * @sgt_offset: Offset into @sgt of the start of the requested mappi=
ng.
> > > + * @device_addr: Device-virtual address at the start of the requeste=
d mapping.
> > >   * @size: Size in bytes of the requested device-virtual memory mappi=
ng. For an
> > >   * unmapping, this should be zero so that no page tables are allocat=
ed.
> > >   *
> > > @@ -2346,7 +2347,7 @@ void pvr_mmu_op_context_destroy(struct pvr_mmu_=
op_context *op_ctx)
> > >   */
> > >  struct pvr_mmu_op_context *
> > >  pvr_mmu_op_context_create(struct pvr_mmu_context *ctx, struct sg_tab=
le *sgt,
> > > -                     u64 sgt_offset, u64 size)
> > > +                     u64 sgt_offset, u64 device_addr, u64 size)
> > >  {
> > >     int err;
> > >
> > > @@ -2362,18 +2363,18 @@ pvr_mmu_op_context_create(struct pvr_mmu_cont=
ext *ctx, struct sg_table *sgt,
> > >
> > >     if (size) {
> > >             /*
> > > -            * The number of page table objects we need to prealloc i=
s
> > > -            * indicated by the mapping size, start offset and the si=
zes
> > > -            * of the areas mapped per PT or PD. The range calculatio=
n is
> > > -            * identical to that for the index into a table for a dev=
ice
> > > -            * address, so we reuse those functions here.
> > > +            * The page tables needed are set by the device-virtual r=
ange
> > > +            * being mapped: one level 1 table per 1GiB region and on=
e
> > > +            * level 0 table per 2MiB region the range touches. Table=
s that
> > > +            * already exist are not consumed, so this is an upper bo=
und.
> > >              */
> > > -           const u32 l1_start_idx =3D pvr_page_table_l2_idx(sgt_offs=
et);
> > > -           const u32 l1_end_idx =3D pvr_page_table_l2_idx(sgt_offset=
 + size);
> > > -           const u32 l1_count =3D l1_end_idx - l1_start_idx + 1;
> > > -           const u32 l0_start_idx =3D pvr_page_table_l1_idx(sgt_offs=
et);
> > > -           const u32 l0_end_idx =3D pvr_page_table_l1_idx(sgt_offset=
 + size);
> > > -           const u32 l0_count =3D l0_end_idx - l0_start_idx + 1;
> > > +           const u64 last_addr =3D device_addr + size - 1;
> > > +           const u64 l1_count =3D
> > > +                   (last_addr >> ROGUE_MMUCTRL_VADDR_PC_INDEX_SHIFT)=
 -
> > > +                   (device_addr >> ROGUE_MMUCTRL_VADDR_PC_INDEX_SHIF=
T) + 1;
> > > +           const u64 l0_count =3D
> > > +                   (last_addr >> ROGUE_MMUCTRL_VADDR_PD_INDEX_SHIFT)=
 -
> > > +                   (device_addr >> ROGUE_MMUCTRL_VADDR_PD_INDEX_SHIF=
T) + 1;
> > >
> We identified over allocation of page tables due to incorrect calculation=
 of end
> offset. And your change is correctly takes that into account.
> Can you please update your patch on top
> https://patchwork.freedesktop.org/patch/755274?
>
> Also update fixes tag to include https://patchwork.freedesktop.org/patch/=
755274?
>
> Thanks,
> Brajesh
>
> > >             /*
> > >              * Alloc and push page table entries until we have enough=
 of
> > > diff --git a/drivers/gpu/drm/imagination/pvr_mmu.h b/drivers/gpu/drm/=
imagination/pvr_mmu.h
> > > index a8ecd460168..7088f80805e 100644
> > > --- a/drivers/gpu/drm/imagination/pvr_mmu.h
> > > +++ b/drivers/gpu/drm/imagination/pvr_mmu.h
> > > @@ -99,7 +99,8 @@ dma_addr_t pvr_mmu_get_root_table_dma_addr(struct p=
vr_mmu_context *ctx);
> > >  void pvr_mmu_op_context_destroy(struct pvr_mmu_op_context *op_ctx);
> > >  struct pvr_mmu_op_context *
> > >  pvr_mmu_op_context_create(struct pvr_mmu_context *ctx,
> > > -                     struct sg_table *sgt, u64 sgt_offset, u64 size)=
;
> > > +                     struct sg_table *sgt, u64 sgt_offset,
> > > +                     u64 device_addr, u64 size);
> > >
> > >  int pvr_mmu_map(struct pvr_mmu_op_context *op_ctx, u64 size, u64 fla=
gs,
> > >             u64 device_addr);
> > > diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/i=
magination/pvr_vm.c
> > > index c5ae0b79fe6..7bb58ca14e4 100644
> > > --- a/drivers/gpu/drm/imagination/pvr_vm.c
> > > +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> > > @@ -276,7 +276,8 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bi=
nd_op,
> > >             goto err_bind_op_fini;
> > >
> > >     bind_op->mmu_op_ctx =3D
> > > -           pvr_mmu_op_context_create(vm_ctx->mmu_ctx, sgt, offset, s=
ize);
> > > +           pvr_mmu_op_context_create(vm_ctx->mmu_ctx, sgt, offset,
> > > +                                     device_addr, size);
> > >     err =3D PTR_ERR_OR_ZERO(bind_op->mmu_op_ctx);
> > >     if (err) {
> > >             bind_op->mmu_op_ctx =3D NULL;
> > > @@ -318,7 +319,7 @@ pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *=
bind_op,
> > >     }
> > >
> > >     bind_op->mmu_op_ctx =3D
> > > -           pvr_mmu_op_context_create(vm_ctx->mmu_ctx, NULL, 0, 0);
> > > +           pvr_mmu_op_context_create(vm_ctx->mmu_ctx, NULL, 0, 0, 0)=
;
> > >     err =3D PTR_ERR_OR_ZERO(bind_op->mmu_op_ctx);
> > >     if (err) {
> > >             bind_op->mmu_op_ctx =3D NULL;
> > >
> >
>


--=20
Thanks,
Gyeyoung
