Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32EA39E18E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789422434; cv=pass; b=NK9/6lWbulsoGKuq83oRoE8MN4yb3mktGw5h6BNJM0/Ehx5s/8VJw9ni/k3EvdstIsP0plh1J+HEEnydvD+C6k0Iv3A+yf3NNOx6LiIrq1JOyuwmsY8uEQSH+8PWU1oBMimDh5c/JZd7cMPqxyIGzbluXuEcgZ9nXvAikl9svx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789422434; c=relaxed/simple;
	bh=sS8xy6VVEofOwsP3ubz8gS44MDdMM1wyyqRXEIL1M6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4TDOZWts0UMi+ySvdysMuAmE9Qi/7zuwzKHO2LOWoO2BOcNXnAH4nqBN/xF6a6rIAPTRHKsZ7pX1sphaQF+Jku8MjJFcL3peZouVCp2dtflGx38N4nALZjgtr+63IoQymWW+TWSIKVdyQEtKuc4YYdjBugkVGjQ5KiPIagFZjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qLIZcJEV; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qLIZcJEV"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d88so567a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789422431; cv=none;
        d=google.com; s=arc-20260327;
        b=WCi283Z9imDQ2yOpm38lvHMIWYy25+3sb3zgMuAFtIBg7qiaIcVgf1mssNqqDRPA55
         z30pD+VgaGr1v37Kvfe1rzaX0k9RZt18gPU0psEs+xjCOy/ok5H40QQfvNa82yzchKKS
         eqDv43nkhmkVn5w/Sxk+L1IAL11064PeOsl8JXlRP5j29UzAc3hNat+3+txPHRhmbIgT
         TnwN8GgwRknlhaXyrZqd3YzFue2Bt15VxiIy4BoRF/CATnxPgsjeMKQFZhtIr7N8SFFZ
         2SK5JfKWBY4W/ThZ4Fh8ZsS/1WkdDzIhZYb0N7O4xvPJDuMy0oSTIy7w2ZiKVHXq/AB3
         bQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CAl3nGJA6fHc5gSVtiOEEZJtd1Qf/VXqSoJQaLtKfXA=;
        fh=nXYgc6vbUosp1SIrGLjHTqwkixTpBLyfIMqgdup2jLI=;
        b=XCY0Uryq0Km7t266wZ6TL3dcNXAORuyfLvP4b0o2AMMNPbIGHaYD+wNuNV4W1iaiIs
         jEJyYuIoQZGnk8EG49sf5SryUzSWu6zQYjD8lb0abYq9rPcx1aqeohKlqo98wXzWd5Vv
         9fXUZUyEHLvpVR7bkN3iSLL+JfSjsaLsOyB8Qk3Y2/P1JXEU0gl8Ybrc6WMOkokv6H77
         6Ypys3iHlurh1xg6iY2u3bXagIRqW6yYZPO5lDv6NNMtdwqAPKvYXJDtuNmYU0aWCtKA
         19gJEdCqqIw4VDJuskrLkGfQwEwkeLc9JwbDAMB730DoKdxt5mIC0/F/lbO/m0K5k4OU
         NF6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789422431; x=1790027231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAl3nGJA6fHc5gSVtiOEEZJtd1Qf/VXqSoJQaLtKfXA=;
        b=qLIZcJEVGlEmwdpn1uwadCSrX/lG4uzZ2YFHSyHroTtBNPkTTieLEbXCA1rM4CshcJ
         +a8RfH8JvpKHfzlkhaAbJ7tqhiUFf8mdSLWJo9l2aiSp4iMqYoqss7XAlMLpyAao2l2i
         dPpnsRV7yUrwa4/oI4EIXJUEwQUFeefvkPo/3Vx0zKxhWevwtd/6JgKfrLM3eiHWZlDx
         ybspFqNlvBqUNO042SVTjv7Z8ypS8dXRpgr/VbFBi35UY6Tr+lBl49fSDAGIaKMRDx5T
         8vT4F2b79RLds6sZKHxn0avf6N6Np3EUBw72tiPhaAXmq/myBBJ8UOEvnHwuw/qPWR6p
         kv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789422431; x=1790027231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAl3nGJA6fHc5gSVtiOEEZJtd1Qf/VXqSoJQaLtKfXA=;
        b=MxRIs3YlL1SMS+K8Nvuk0n9cYmPCUgrEPr4fojQ6S3JMGapW+1BtAyM5r+8IYcDm/K
         SCBrzP12cWpqwlLrSN9hluwQkvvb4hwfdTrl46kP1ssiN0miAYuYpHRJ8i6/7h9wAU/o
         d5UNZdO7h0k58O8XWpy4Y/igU3vrB0fz56F7CMoqG2JhWG6C2XetUTn9egG7Ml2aPjkM
         Yul3Vw0N+qrVKQUOjjPw1JJbTTOGHCRaelYKk2u+WIMz+/w6kYJnZhpZaNyANG6Kxk0n
         SwMYB6Zyz8+fHhPmlp1lmzftXUueTuajbzZUqqGX3nuA8KuVVM9YHOZJoIxs8U14vXZu
         LDFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSaDHLNrbrmeAQlzNUTHCI6MEo1b4HBTE4URbP0FsfKrNR80PncA2USnyoEv3NgQ9LF61r+t+mmZ+UjSE=@vger.kernel.org
X-Gm-Message-State: AFuF++mx/GGN9if10a2OtK1sUQvy41iNJS9k3LuUTl8Wp7+nDEuL3HHA
	bZVglrWZ19vfP26GtxBylcuJw6EEjoMW654w86ynIJKWnL5EcVz1CWTt01zd3VTLG6aKqMY4r6j
	CjJE+1LIAxsJT+VH3BpNtKsw4nr5auYR9YwlNTnQI
X-Gm-Gg: AYBFou0KgQLW1yIeo4fopiCKfUkycDyzdVz5i+oPi2kHy6s7U2M0RyHaqtiKcf9qpzF
	GLWYMbdkMmymgK0wVfW1MHr0i3A67Q0mF+/4m6rnxTDAP2WHnqnQf4BRGQIDnIFGrkjGWqsS+gD
	mQmMk7WkVW/8JpAQCL3OW/1NFfipCFVqwZYAEZWyyU0puFDzeaim4XmotkxlajEyrfCdqS+wITM
	Qs/jq4fy4C/hjQ5K7We0UBge56wPqYM1bWweecnJGLME520hV6mz8M9BXoSZx/OWqTk0sGyaYrw
	fgn0JZpTOpIyN+x1JGcrwwI0TMwUMHkpMzditXUBPTdN3DIzoyIeBltZX9+AZYPO1jY2rn90K19
	+XyEi1Fbekw==
X-Received: by 2002:a05:6402:21d7:b0:6a6:75b4:9bd2 with SMTP id
 4fb4d7f45d1cf-6aa043cae44mr22084a12.6.1789422430129; Mon, 14 Sep 2026
 14:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911154555.739041-1-sdf@fomichev.me> <20260911154555.739041-2-sdf@fomichev.me>
In-Reply-To: <20260911154555.739041-2-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 14 Sep 2026 14:46:58 -0700
X-Gm-Features: AcwNN1Urud3XwsnhifcT6F5d8X58sOV4uRvxFqaQrn2sZ7ZEWnGmxW8g9NHMuJc
Message-ID: <CAHS8izPWsTh=XYvMfdGy1P+RS2p-nzA0cvNXU81awys4OJTW8g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] net: devmem: replace gen_pool with freelist
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me, 
	bobbyeshleman@meta.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 8:45=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> devmem only needs fixed-size net_iov allocations for each dma-buf binding=
.
> The gen_pool tracks the same free set indirectly through DMA addresses,
> which makes devmem depend on the generic allocator even though the users
> are fixed-size net_iov chunks.
>
> Mirror the io_uring zcrx model more closely by keeping a binding-level
> freelist protected by spin_lock_bh(). Use a single net_iov_area owner for
> the binding, populate each net_iov's DMA address while walking the SG
> table, and check at teardown that all net_iovs have returned to the
> freelist.
>
> Drop the NET_DEVMEM select of GENERIC_ALLOCATOR now that devmem no longer
> calls gen_pool APIs.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Approach is great, some suggested improvements.

> ---
>  net/Kconfig       |   1 -
>  net/core/devmem.c | 172 +++++++++++++++++++++-------------------------
>  net/core/devmem.h |  16 ++---
>  3 files changed, 85 insertions(+), 104 deletions(-)
>
> diff --git a/net/Kconfig b/net/Kconfig
> index e38477393551..76ab44aa439a 100644
> --- a/net/Kconfig
> +++ b/net/Kconfig
> @@ -68,7 +68,6 @@ config SKB_EXTENSIONS
>
>  config NET_DEVMEM
>         def_bool y
> -       select GENERIC_ALLOCATOR
>         depends on DMA_SHARED_BUFFER
>         depends on PAGE_POOL
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index f4d60654ce7f..4883eb7f3a95 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -8,7 +8,6 @@
>   */
>
>  #include <linux/dma-buf.h>
> -#include <linux/genalloc.h>
>  #include <linux/mm.h>
>  #include <linux/netdevice.h>
>  #include <linux/types.h>
> @@ -30,23 +29,13 @@ static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings=
, XA_FLAGS_ALLOC1);
>
>  static const struct memory_provider_ops dmabuf_devmem_ops;
>
> -static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
> -                                              struct gen_pool_chunk *chu=
nk,
> -                                              void *not_used)
> +static void
> +net_devmem_dmabuf_free_chunk_owner(struct dmabuf_genpool_chunk_owner *ow=
ner)
>  {
> -       struct dmabuf_genpool_chunk_owner *owner =3D chunk->owner;
> -
> -       kvfree(owner->area.niovs);
> -       kfree(owner);
> -}
> -
> -static dma_addr_t net_devmem_get_dma_addr(const struct net_iov *niov)
> -{
> -       struct dmabuf_genpool_chunk_owner *owner;
> -
> -       owner =3D net_devmem_iov_to_chunk_owner(niov);
> -       return owner->base_dma_addr +
> -              ((dma_addr_t)net_iov_idx(niov) << owner->binding->niov_shi=
ft);
> +       if (owner) {
> +               kvfree(owner->area.niovs);
> +               kfree(owner);
> +       }
>  }
>
>  static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
> @@ -62,24 +51,18 @@ void __net_devmem_dmabuf_binding_free(struct work_str=
uct *wq)
>  {
>         struct net_devmem_dmabuf_binding *binding =3D container_of(wq, ty=
peof(*binding), unbind_w);
>
> -       size_t size, avail;
> -
> -       gen_pool_for_each_chunk(binding->chunk_pool,
> -                               net_devmem_dmabuf_free_chunk_owner, NULL)=
;
> -
> -       size =3D gen_pool_size(binding->chunk_pool);
> -       avail =3D gen_pool_avail(binding->chunk_pool);
> -
> -       if (!WARN(size !=3D avail, "can't destroy genpool. size=3D%zu, av=
ail=3D%zu",
> -                 size, avail))
> -               gen_pool_destroy(binding->chunk_pool);
> +       WARN(binding->free_count !=3D binding->total_niovs,
> +            "can't destroy dmabuf binding. total=3D%zu, free=3D%zu",
> +            binding->total_niovs, binding->free_count);
>

You're warning here that you can't destroy the dmabuf binding but
you're destroying it anyway. Something is off here. Do we want an
early return or something else?

> +       net_devmem_dmabuf_free_chunk_owner(binding->chunk_owner);
>         dma_buf_unmap_attachment_unlocked(binding->attachment, binding->s=
gt,
>                                           binding->direction);
>         dma_buf_detach(binding->dmabuf, binding->attachment);
>         dma_buf_put(binding->dmabuf);
>         xa_destroy(&binding->bound_rxqs);
>         percpu_ref_exit(&binding->ref);
> +       kvfree(binding->freelist);
>         kvfree(binding->tx_vec);
>         kfree(binding);
>  }
> @@ -87,21 +70,16 @@ void __net_devmem_dmabuf_binding_free(struct work_str=
uct *wq)
>  struct net_iov *
>  net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
>  {
> -       struct dmabuf_genpool_chunk_owner *owner;
> -       unsigned long dma_addr;
>         struct net_iov *niov;
> -       ssize_t offset;
> -       ssize_t index;
> -
> -       dma_addr =3D gen_pool_alloc_owner(binding->chunk_pool,
> -                                       1UL << binding->niov_shift,
> -                                       (void **)&owner);
> -       if (!dma_addr)
> +       spin_lock_bh(&binding->freelist_lock);
> +       if (unlikely(!binding->free_count)) {
> +               spin_unlock_bh(&binding->freelist_lock);
>                 return NULL;
> +       }
>
> -       offset =3D dma_addr - owner->base_dma_addr;
> -       index =3D offset >> binding->niov_shift;
> -       niov =3D &owner->area.niovs[index];
> +       niov =3D binding->freelist[--binding->free_count];
> +       binding->freelist[binding->free_count] =3D NULL;

The LLM thinks this NULL store in unnecassary. IDK if it will help
anything in practice to remove it :-)

> +       spin_unlock_bh(&binding->freelist_lock);
>
>         niov->desc.pp_magic =3D 0;
>         niov->desc.pp =3D NULL;
> @@ -113,14 +91,15 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_bin=
ding *binding)
>  void net_devmem_free_dmabuf(struct net_iov *niov)
>  {
>         struct net_devmem_dmabuf_binding *binding =3D net_devmem_iov_bind=
ing(niov);
> -       unsigned long dma_addr =3D net_devmem_get_dma_addr(niov);
> -       size_t niov_size =3D 1UL << binding->niov_shift;
>
> -       if (WARN_ON(!gen_pool_has_addr(binding->chunk_pool, dma_addr,
> -                                      niov_size)))
> +       spin_lock_bh(&binding->freelist_lock);
> +       if (WARN_ON_ONCE(binding->free_count >=3D binding->total_niovs)) =
{
> +               spin_unlock_bh(&binding->freelist_lock);
>                 return;
> +       }
>
> -       gen_pool_free(binding->chunk_pool, dma_addr, niov_size);
> +       binding->freelist[binding->free_count++] =3D niov;
> +       spin_unlock_bh(&binding->freelist_lock);
>  }
>
>  void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
> @@ -194,12 +173,15 @@ net_devmem_bind_dmabuf(struct net_device *dev, void=
 *vdev,
>                        struct netlink_ext_ack *extack)
>  {
>         struct net_devmem_dmabuf_binding *binding;
> +       struct dmabuf_genpool_chunk_owner *owner;
>         size_t niov_size =3D 1UL << niov_shift;
>         static u32 id_alloc_next;
>         struct scatterlist *sg;
>         struct dma_buf *dmabuf;
> -       unsigned int sg_idx, i;
> -       unsigned long virtual;
> +       unsigned int sg_idx;
> +       size_t total_niovs;
> +       size_t niov_idx;
> +       size_t i;
>         int err;
>
>         if (!dma_dev) {
> @@ -230,6 +212,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *=
vdev,
>                 goto err_free_binding;
>
>         mutex_init(&binding->lock);
> +       spin_lock_init(&binding->freelist_lock);

We don't need freelists on tx right? We should probably not allocate them t=
hen?

>
>         binding->dmabuf =3D dmabuf;
>         binding->direction =3D direction;
> @@ -262,20 +245,10 @@ net_devmem_bind_dmabuf(struct net_device *dev, void=
 *vdev,
>                         goto err_unmap;
>                 }
>         }
> -
> -       binding->chunk_pool =3D gen_pool_create(niov_shift,
> -                                             dev_to_node(&dev->dev));
> -       if (!binding->chunk_pool) {
> -               err =3D -ENOMEM;
> -               goto err_tx_vec;
> -       }
> -
> -       virtual =3D 0;
> +       total_niovs =3D 0;

Do we really need a secondary for_each_sgtable_dma_sg loop just to
calculate the total_niovs? In what edge case is the total_niovs not
just dmabuf_len / niov_len? We do a bunch of alignment checks to make
sure it all works out to that no?

>         for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
>                 dma_addr_t dma_addr =3D sg_dma_address(sg);
> -               struct dmabuf_genpool_chunk_owner *owner;
>                 size_t len =3D sg_dma_len(sg);
> -               struct net_iov *niov;
>
>                 if (!IS_ALIGNED(dma_addr, niov_size) ||
>                     !IS_ALIGNED(len, niov_size)) {
> @@ -283,63 +256,74 @@ net_devmem_bind_dmabuf(struct net_device *dev, void=
 *vdev,
>                         NL_SET_ERR_MSG_FMT(extack,
>                                            "dmabuf sg entry (addr=3D%pad,=
 len=3D%zu) not aligned to niov size %zu",
>                                            &dma_addr, len, niov_size);
> -                       goto err_free_chunks;
> +                       goto err_tx_vec;
>                 }
>
> -               owner =3D kzalloc_node(sizeof(*owner), GFP_KERNEL,
> -                                    dev_to_node(&dev->dev));
> -               if (!owner) {
> -                       err =3D -ENOMEM;
> -                       goto err_free_chunks;
> -               }
> +               total_niovs +=3D len >> niov_shift;
> +       }
>
> -               owner->area.base_virtual =3D virtual;
> -               owner->base_dma_addr =3D dma_addr;
> -               owner->area.num_niovs =3D len >> niov_shift;
> -               owner->binding =3D binding;
> +       binding->freelist =3D kvmalloc_array(total_niovs,
> +                                          sizeof(binding->freelist[0]),
> +                                          GFP_KERNEL);
> +       if (!binding->freelist) {
> +               err =3D -ENOMEM;
> +               goto err_tx_vec;
> +       }
> +       binding->total_niovs =3D total_niovs;

binding->total_niovs and binding->area.num_niovs seem the same thing
always. please get rid of one, probably binding->total_niovs.

I wonder if now that both zcrx and devmem use a freelist if the
freelist should be part of the net_iov_area. The point of that field
was to hold the common stuff actually, but I'm guessing there are
micro-implementation differences that will make converging annoying.
I'm fine either way. :shrug:

>
> -               err =3D gen_pool_add_owner(binding->chunk_pool, dma_addr,
> -                                        dma_addr, len, dev_to_node(&dev-=
>dev),
> -                                        owner);
> -               if (err) {
> -                       kfree(owner);
> -                       err =3D -EINVAL;
> -                       goto err_free_chunks;
> -               }
> +       owner =3D kzalloc_node(sizeof(*owner), GFP_KERNEL,
> +                            dev_to_node(&dev->dev));
> +       if (!owner) {
> +               err =3D -ENOMEM;
> +               goto err_free_freelist;
> +       }
>
> -               owner->area.niovs =3D kvmalloc_objs(*owner->area.niovs,
> -                                                 owner->area.num_niovs);
> -               if (!owner->area.niovs) {
> -                       err =3D -ENOMEM;
> -                       goto err_free_chunks;
> -               }
> +       owner->area.num_niovs =3D total_niovs;
> +       owner->binding =3D binding;
> +       owner->area.niovs =3D kvmalloc_objs(*owner->area.niovs,
> +                                         owner->area.num_niovs);
> +       if (!owner->area.niovs) {
> +               err =3D -ENOMEM;
> +               goto err_free_owner;
> +       }
> +       binding->chunk_owner =3D owner;
> +
> +       niov_idx =3D 0;
> +       for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
> +               dma_addr_t dma_addr =3D sg_dma_address(sg);
> +               size_t len =3D sg_dma_len(sg);

len is referenced once now; not worth a local var.

> +               struct net_iov *niov;
> +               size_t nr_niovs =3D len >> niov_shift;
>
> -               for (i =3D 0; i < owner->area.num_niovs; i++) {
> -                       niov =3D &owner->area.niovs[i];
> +               for (i =3D 0; i < nr_niovs; i++, niov_idx++) {
> +                       niov =3D &owner->area.niovs[niov_idx];
>                         net_iov_init(niov, &owner->area, NET_IOV_DMABUF);
>                         page_pool_set_dma_addr_netmem(net_iov_to_netmem(n=
iov),
> -                                                     net_devmem_get_dma_=
addr(niov));
> +                                                     dma_addr);
>                         if (direction =3D=3D DMA_TO_DEVICE)
> -                               binding->tx_vec[owner->area.base_virtual =
/ PAGE_SIZE + i] =3D niov;
> +                               binding->tx_vec[niov_idx] =3D niov;
> +                       binding->freelist[binding->free_count++] =3D niov=
;

if feels somewhat simple to exclude freelist from TX. Something like:

if (direction =3D=3D dma_to_device)
  <store into tx_vec>
else
  <store in freelist>



--=20
Thanks,
Mina
