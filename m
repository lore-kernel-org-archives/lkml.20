Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA0E39280A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789422798; cv=pass; b=I3git+jmLx76SCnJILoh3+a9LJUNPw3dcju+QcXu+i+oFpJKOqYyDd+nNnMY0cNpbjvTEq1a/grNbTuKlP67K6TEosqH4b5NwpF/UDAaC+VCbfmMjHEle0IHNu7BM9Sc/g95Iyh507cf/6Gz9Pcdal+5d6OjJG6bAbSkKXwZIjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789422798; c=relaxed/simple;
	bh=WdYeo/A++v8hz7OALiWg9OfWNSUhh732rHgb4MtJ78M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaC0YQDQpr/gmRxBxgGYYko7ghcBVnahHuVr4FEdjVklq1Nx45bQRYT5/2ZroQUUHyJFie7mhiYuCsdOO7/cmZIZTKq1rICOvD9RM2MqQ3YZXQWPureE3yTf5I1j10F5RoWRlRRx/cz0btFm31Ngk3ZAXQjw9hiZtLYeXde7mb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ut3GxbW/; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ut3GxbW/"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9a26ce21aso365a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789422795; cv=none;
        d=google.com; s=arc-20260327;
        b=USX/uyoECFZkDLoSlnr9xem6SALfdVW90iE1bVShKhFp6uOYkECQjVYciji/l4Cqw1
         mTh6W7LEtBOSqcRH8WGtatQ7FICdZXokEi4lNLlxkzooB+DiWZAFqIXVG/INhPmxVxCb
         EDcecNcE9UZpjjLexlDFu6f5RAzyYcDP3SVkxrCWjSEAuLLrihIr0wK/okaTUHqmKzGb
         /fM/eOR4cMQsgvUJHu84rYQxWq12eF6K0e/TZu599lMr2MO5yVrMMSCPZDuvzzpgTH1v
         9By3WtfSP+Z/oYG4g/Ajlkq3P+bwCRBfL86kWjfRRHLkklGhZLv9lDkxXFfVzzeSM+1H
         2Z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IJKoGxgqFqyG8e+2qXBXfJ5LyuJyUQMK4iZh37ivfIs=;
        fh=BMCON7uhmtrmNa+B2dmW5VWN7CgaQ2DbKjOHacrKq/4=;
        b=UeLNxXvyfduC9uZwruM/cPNF/tsGAJGVbU5buq3vRVUHMc3lLWgTH3eICvuOPwvt5w
         qjnOj6ZPND5Zf3ankIGWx7F4vT4+K9xi5O4489+pOqrTJqMhe1t0two6hplJNFWTZ8nH
         BcMQw/Aylmj5CYCbHaUVCgYpTQY0OMuHpb6Wti5yXMl9A/5bVbma3D7B4dCIudL7GPWS
         S5HL6fUbLnyAbOEU7FKG8hJ24TVKj2iF2rKtugYn6lYdZVaPCsDIFR0hRwc9K3OqxyJh
         MY00zg3qWcdfzNE1bMReRNoEBtn/nA5SW6VQbYOzzy9Ff+Pgp7ZFVDWjmp3REufrRqlR
         zNEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789422795; x=1790027595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJKoGxgqFqyG8e+2qXBXfJ5LyuJyUQMK4iZh37ivfIs=;
        b=Ut3GxbW/+3nfwQh4UtYUUxcUQ3Sli9RLI2QiKFeBwNdInn/QcjEBnNPXJ/liSdG6yv
         40a1VCVzXyG5BrWuIrJ2z6SHGH9GbgW0bEyDEGtVHfWoslyuuWbhwjhXMZtGTyAPBDuD
         LmvlEtwmJbLefFS7gyIAVFAI1DOymES1tZsrN57cVnNz/74qls2C04LN+g1XFCHEq7Oq
         ttUrrD/Dbhi+pnwqWRpGU4jQMPbP2hunwUl5BXRVWNqjrhoTZ1dkyEavRvidYGpIS+Gb
         /UQJTyz2YS7N+FbziWW5+FVqeov5U+z7rEwUpLRXbclvT6fpbFQOB2BRkDrFk2ZTjlmB
         rQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789422795; x=1790027595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJKoGxgqFqyG8e+2qXBXfJ5LyuJyUQMK4iZh37ivfIs=;
        b=lVOFgEejXw6uqvq7yrdoG1cLGHhyENViOhwlCtO6auUJhOnMLUHG1j9yAy4BTHHVQO
         BFANHh92uQR/LKpTJHxnc8MplN/NkVET1wJ4DppTfHwJUS45Pfqd0MFW+4ZwaY+xlPxi
         j+6zCJtchN0wvcn82DUTSLGV1bBWr63Jc91iEBSb2gjqRPGEbIlF8VsYJ3qOKb7el7+e
         Uim81a6r1Kzf/WmpzK00x3APznqe17KX5YhsZztMjmyrjnaiLRJ8nVadO1IXKPQ4r5QY
         W30OprklTSgrtR27v99fJMBwR/PFAtCtozSGQqDzFktMMqpakwXpoTLcAw8bIN1pX0eT
         EQyA==
X-Forwarded-Encrypted: i=1; AKwUvByC08bRq/We3SN/k6SPyiR14s6w5ki+qkekBptMjeq2+xUvIxYKrRWr5ULevD0SoPKMyUNO1hAhyameZYY=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ0Huxbgibw7H7iXV4JXoq5XKUHHJvXz8QikQRvXG+bXWj0iMP
	3xOMv5GmWhlAcKHnEkGG+avFvmV2tXkdSf9/yE4+B2UWjMqnMy7AuJvXBr+JpDP1lsoEidYQ+g6
	QYB6hPazZIyEtFN/5qEC21CdYRY5vWJoQey0RDIrL
X-Gm-Gg: AYBFou1je6xAPnU7tZjsyIZG2VFG7nnAiOGXr14/xycoem1l4ulcUk55cLE7kjEmgEm
	ktAMKiKU77rdTpB6D4uTqbYL38WuOWzYTwcvKwDspFM1x2R2foYupiUIWnGeHX6KgQnhllHOSLa
	3UVjxAnaHv6dTrsJtBFNd7D8prf9/+AsA+/PYnxVY11aMBLSXKjr5W5mncisIMXEAsOKBPYR034
	XxGvtmiYF0eDuIV4QQm15LnKx3nFeznAzdzKEMqtqfsNrBsvA64cOOhUFJLyzDmlTslzamt+aAW
	VrvxB4OU59P+miFLBdWwNZfds5PF4Xw/Ork9inciVMd96OLdTaqP+ml1mTKKNbbrka1vmVz+sWk
	XodPG1FPqhg==
X-Received: by 2002:a05:6402:1859:b0:6a9:f353:ef65 with SMTP id
 4fb4d7f45d1cf-6aa07ba920dmr10659a12.5.1789422794140; Mon, 14 Sep 2026
 14:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911154555.739041-1-sdf@fomichev.me> <20260911154555.739041-3-sdf@fomichev.me>
In-Reply-To: <20260911154555.739041-3-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 14 Sep 2026 14:53:02 -0700
X-Gm-Features: AcwNN1Xa08Ra1JDiWW_xCBaLD3wB1JuONlTZQ244Zs_Z2Oc7Jf8FpbUJw44m4wc
Message-ID: <CAHS8izP-gdUcgn2OewUVSWYFWKXrkWxhavPT3=4GwoziekHi7w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] net: devmem: embed net_iov_area in binding
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me, 
	bobbyeshleman@meta.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 8:45=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> After replacing the gen_pool with a binding-level freelist, devmem no
> longer needs a separate chunk owner object. There is only one
> net_iov_area for the binding, so store it directly in struct
> net_devmem_dmabuf_binding.
>
> Derive the binding from net_iov_owner() with container_of(), matching the
> pattern used by io_uring zcrx. This removes the leftover
> dmabuf_genpool_chunk_owner wrapper and its allocation/free path.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  net/core/devmem.c | 41 ++++++++++-------------------------------
>  net/core/devmem.h | 26 +++++++-------------------
>  2 files changed, 17 insertions(+), 50 deletions(-)
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 4883eb7f3a95..7949f8425bcd 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -29,15 +29,6 @@ static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings,=
 XA_FLAGS_ALLOC1);
>
>  static const struct memory_provider_ops dmabuf_devmem_ops;
>
> -static void
> -net_devmem_dmabuf_free_chunk_owner(struct dmabuf_genpool_chunk_owner *ow=
ner)
> -{
> -       if (owner) {
> -               kvfree(owner->area.niovs);
> -               kfree(owner);
> -       }
> -}
> -
>  static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
>  {
>         struct net_devmem_dmabuf_binding *binding =3D
> @@ -55,7 +46,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struc=
t *wq)
>              "can't destroy dmabuf binding. total=3D%zu, free=3D%zu",
>              binding->total_niovs, binding->free_count);
>
> -       net_devmem_dmabuf_free_chunk_owner(binding->chunk_owner);
> +       kvfree(binding->area.niovs);
>         dma_buf_unmap_attachment_unlocked(binding->attachment, binding->s=
gt,
>                                           binding->direction);
>         dma_buf_detach(binding->dmabuf, binding->attachment);
> @@ -271,23 +262,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void=
 *vdev,
>         }
>         binding->total_niovs =3D total_niovs;
>
> -       owner =3D kzalloc_node(sizeof(*owner), GFP_KERNEL,
> -                            dev_to_node(&dev->dev));
> -       if (!owner) {
> +       binding->area.num_niovs =3D total_niovs;
> +       binding->area.niovs =3D kvmalloc_objs(*binding->area.niovs,
> +                                           binding->area.num_niovs);
> +       if (!binding->area.niovs) {
>                 err =3D -ENOMEM;
>                 goto err_free_freelist;
>         }
>
> -       owner->area.num_niovs =3D total_niovs;
> -       owner->binding =3D binding;
> -       owner->area.niovs =3D kvmalloc_objs(*owner->area.niovs,
> -                                         owner->area.num_niovs);
> -       if (!owner->area.niovs) {
> -               err =3D -ENOMEM;
> -               goto err_free_owner;
> -       }
> -       binding->chunk_owner =3D owner;
> -
>         niov_idx =3D 0;
>         for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
>                 dma_addr_t dma_addr =3D sg_dma_address(sg);
> @@ -296,8 +278,8 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *=
vdev,
>                 size_t nr_niovs =3D len >> niov_shift;
>
>                 for (i =3D 0; i < nr_niovs; i++, niov_idx++) {
> -                       niov =3D &owner->area.niovs[niov_idx];
> -                       net_iov_init(niov, &owner->area, NET_IOV_DMABUF);
> +                       niov =3D &binding->area.niovs[niov_idx];
> +                       net_iov_init(niov, &binding->area, NET_IOV_DMABUF=
);
>                         page_pool_set_dma_addr_netmem(net_iov_to_netmem(n=
iov),
>                                                       dma_addr);
>                         if (direction =3D=3D DMA_TO_DEVICE)
> @@ -311,17 +293,14 @@ net_devmem_bind_dmabuf(struct net_device *dev, void=
 *vdev,
>                               binding, xa_limit_32b, &id_alloc_next,
>                               GFP_KERNEL);
>         if (err < 0)
> -               goto err_free_chunk_owner;
> +               goto err_free_niovs;
>
>         list_add(&binding->list, &priv->bindings);
>
>         return binding;
>
> -err_free_chunk_owner:
> -       net_devmem_dmabuf_free_chunk_owner(binding->chunk_owner);
> -       goto err_free_freelist;
> -err_free_owner:
> -       kfree(owner);
> +err_free_niovs:
> +       kvfree(binding->area.niovs);
>  err_free_freelist:
>         kvfree(binding->freelist);
>  err_tx_vec:
> diff --git a/net/core/devmem.h b/net/core/devmem.h
> index a5ee2d8d9169..20a3eb90ea7f 100644
> --- a/net/core/devmem.h
> +++ b/net/core/devmem.h
> @@ -14,9 +14,9 @@
>  #include <net/netdev_netlink.h>
>
>  struct netlink_ext_ack;
> -struct dmabuf_genpool_chunk_owner;
>
>  struct net_devmem_dmabuf_binding {
> +       struct net_iov_area area;
>         struct dma_buf *dmabuf;
>         struct dma_buf_attachment *attachment;
>         struct sg_table *sgt;
> @@ -27,7 +27,6 @@ struct net_devmem_dmabuf_binding {
>          * dereferenced.
>          */
>         void *vdev;
> -       struct dmabuf_genpool_chunk_owner *chunk_owner;
>         /* Protect dev */
>         struct mutex lock;
>
> @@ -83,11 +82,6 @@ struct net_devmem_dmabuf_binding {
>  };
>
>  #if defined(CONFIG_NET_DEVMEM)
> -struct dmabuf_genpool_chunk_owner {
> -       struct net_iov_area area;
> -       struct net_devmem_dmabuf_binding *binding;
> -};
> -
>  void __net_devmem_dmabuf_binding_free(struct work_struct *wq);
>  struct net_devmem_dmabuf_binding *
>  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> @@ -102,18 +96,12 @@ int net_devmem_bind_dmabuf_to_queue(struct net_devic=
e *dev, u32 rxq_idx,
>                                     struct net_devmem_dmabuf_binding *bin=
ding,
>                                     struct netlink_ext_ack *extack);
>
> -static inline struct dmabuf_genpool_chunk_owner *
> -net_devmem_iov_to_chunk_owner(const struct net_iov *niov)
> -{
> -       struct net_iov_area *owner =3D net_iov_owner(niov);
> -
> -       return container_of(owner, struct dmabuf_genpool_chunk_owner, are=
a);
> -}
> -
>  static inline struct net_devmem_dmabuf_binding *
>  net_devmem_iov_binding(const struct net_iov *niov)
>  {
> -       return net_devmem_iov_to_chunk_owner(niov)->binding;
> +       struct net_iov_area *owner =3D net_iov_owner(niov);
> +

Not worth a local var anymore tbh.

Reviewed-by: Mina Almasry <almasrymina@google.com>



--=20
Thanks,
Mina
