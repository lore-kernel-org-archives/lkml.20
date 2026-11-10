Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794323325;
	b=Zj0A2NTFcJnU4TKxZ1pdPoknq4FMJKXqGemk7bNRK2jgroY2BjplF3RyRQRXaDe3O+FM
	 G+HCJHr3gSBYw62KinweVKURe7OB9FNnUvuTqHfbd8gkBkfUFnnl+kGe1lJBuHFMnU3vi
	 S9WXLnG99ocrHaFAUeuS0VnRtUzaLmkIAsfq4schE6EqfRqmetmCBsRbCVSZPdZ9YC61Y
	 ydl0YOoiqzJ/a0yFmbX6wdqgNj9yPSldclY+ExyWd8KnZ3RmhryUCEDGv7SkSMZAshdgI
	 +dAPKd+DJp4m15z0hiAb7wBmDVGE8SvOnb6C7NxWHGlHsMCqs865yVye2dretVQYHcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c1nbMdS2/wACnz7+n6RyuA+wAdoXXvtuh3t/Ui9Sz3A=;
	b=hE0sZikgo1ShZGil+mKeSUdGixgF3BCZVUiUSnQsCC4XKX0uXAvcPwwt/7wpPsJoXCyz
	 TLGOkyvJhqTKBWCjaPRsNix9qT5nCsmYi6v1+POI7qlS4J96SGiYpEoApzOcLHiosb6yl
	 Xed3UDy6UvpX4LLFE1Argmn3mEQ+1gy51O+JP4hZViuXOhy+gGQ/l2/Jg4nfgOZ/wK+1s
	 WmYYm4p0AtAJKDnr28uW/uze82JBaT1whMSRMVQ0EZnBbB3SUHAH3kBcN3hwHezKPjNhi
	 xia9Hk4JNc61zgeCxEzqSAud9vSxN5I+Dkk+z0PAFx3nfJUCxeeI7thlHUqCMDRiSug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFJvOvW6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C34F606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C34F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFJvOvW6
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so8884315ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794323325; cv=none;
        d=google.com; s=arc-20260327;
        b=gdhyk1LL7Im0dD759Iqm8s/J/bOLx0fvvuHiOn10U7/qGEvMYRIk/QHkpRsHloryLR
         sshQvgWmJD8rfSDEekv0RTX3fosQRkyY57tOUacnHxB49usy4MNSnyACOSunrGqKKq2C
         Rs+TYV04NnFfJMWu2DcgqJEX/SMnU44bt3h7UcwL+c2m8HfaOBxlo81XWQgIW9H41Omh
         fkBAFXL838ddli9EOjHmqqFsXMFdDFRSiMIyNS/OQeResdRhCiBHUIdaRo2wtmCoyCY/
         UPsimy7ZmQkz7BWiIIt7xUSU+EHIpNxCwkLBq2Rrm39x6vBDO7qYCdha7DnBD46h2KdN
         EflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c1nbMdS2/wACnz7+n6RyuA+wAdoXXvtuh3t/Ui9Sz3A=;
        fh=XE8Q+CVxfUZlKE1yHz8v0zewW0vquP/8qPuv7RSGTuY=;
        b=EQn8kBxjUbFZVPIRTT40dBcH0NpD8CsuXelN6j474z4cnbc1sbB0wLsNI9Pos0QhHX
         BiwMYbZBOqM6Rgt1xnpMwNM7ZfiHh42f4W3foONekou/5M4VQqN8lIp6sHSxWcVC6dxD
         wRCvwfyuN8x34ToNppHvNjV8juh9oC7tMhEYuP5NfMcTZWsr66ojNXTEyfVzMUIcHVw9
         Fh4bjw5646Qt6/yWg2CjYXKLqvkQ9PZ468ln1XnkVYYGmIea5iJNhWR+ymdyC3HhpkV0
         sKtWGOscWCGt3HvY2j6DDPf5khjgcPDRCABPJ6X8Z5XTHE3IfIm2+2DIEnt1+oA39dTw
         htSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323325; x=1794928125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c1nbMdS2/wACnz7+n6RyuA+wAdoXXvtuh3t/Ui9Sz3A=;
        b=CFJvOvW6jk27IyasqE7tgYN8mkBBsQ0gyKXftzU/SGayTPf5b9yiXujRNHgwuPxNKr
         kU1R4YfpEa7oQ+xNbKT6eGcyTRCfWwMh/ELCAOC7fhMqpizV9k+f/8o9DY1LGNdgkecH
         VNKViEw++ZKjHT/3owob37cMu+P29+gUI7K9Di9sB6SdH38oMrXAYizUfDF1birdN4YO
         nge4tFm1ywqVh67GmI4kQhM/7oZNLwyAnkt78X3uDGRGxQeJ4rhv2dZh2uOX4veNrc1P
         omClfrAfH2DqoMwrMBqv488JV79Kty5ozzzmgDwUg5ZiBWvPOfKCqXJRnyhtL6Iolc02
         aJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323325; x=1794928125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1nbMdS2/wACnz7+n6RyuA+wAdoXXvtuh3t/Ui9Sz3A=;
        b=otYKHoGhncuPSnCM0WH3q0f6H5UN/27jQnC6IM3jgOoRRpD3iFr04prcUVkWpkBTSC
         N6tgk4tfdsdf2fIZqpsz+1UksDAf6aoQBcgRghujybvOtKhA5dm2kznPVaDgHQohtDWA
         kWSq1S1SIQrEWL8DFIDvIP01tKNt8+KOlGgj4L8WStDQOnBlHTccF0hQ3mADfYU//5NT
         rDXWxmnAiaFZYim/hlAzh5WTQMnG/pjNOZRGV3Y3oN744+onwp5KXPwBCWA/mhSLQli2
         pRAeBpmvMVUKqThYzogbh4Fq/p4Yo1p68juzQi9J9X3b1u630IVF6Qj+fT5rS/zGqdpK
         Ua+Q==
X-Forwarded-Encrypted: i=1; AL+hErGwkMwHM8Sv0KX0LYBrK8NiVOoy+RTDIAtxYIt3p/tMQrjwZXOdsY9SmnARfPLEwSLPu5JMEKhr5hem7LQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+koU7PwB/qDWhMiUonNUe9RO5MbwWv5QxrJgecJxj+0FSUFpk9
	OH8Z4XDBR4rtgMtNC/NJPcfSf2qdcX0U8d4sJMSvMeIDRXaEi5YoCmzE0FyZYok4YjHyVX4kVeu
	3yP+CmSoQBx78jr/iDWuzLVj58eRJXlE=
X-Gm-Gg: AYBFou1XxQfZ0zwSrBA8HVJjn1ao10uxRNsGyNzoTJ/ZlIgkyzQK+fV9iGUsk1HXD8r
	jUqAlqS9k5t6iNCi6OmE1SYIUabG9D6FbVShIG++cTJMDijKJKnyl3DhTmYOsdKvJX+RZnt93Vc
	odU8QT1ViKQ6OgUzz/oqf39q8n2nPT2e3t3aZe2fIYtFolnumn6ggI7m+S51su+MrPjeIidDbp4
	F6wa+HDXHTwJZbwWcHmxcZ9jS5+hpFiCrvmsXEAylnrhOB568/OnVJaaYZp1WlQRtlFDvNn7sEq
	eftBPfXJgYvY3ITrS3qwyKJscz9pcms3fo/oJSGvfVX/5DwCo92pQlCUg1JVAPaexlZLwDTtPSg
	FxSnqsp7K/vcrXyaqVXUQ5gdZPJIW5FFXa+4vHXY=
X-Received: by 2002:a17:903:1aef:b0:2e8:4040:792b with SMTP id
 d9443c01a7336-2edb9120edemr28852925ad.22.1794323324501; Tue, 10 Nov 2026
 07:08:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-5-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-5-bjorn@kernel.org>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Tue, 10 Nov 2026 16:08:32 +0100
X-Gm-Features: AclHuK8pcGlhvdthobLOqB0JgP37exZok7OAn9iLvLH8hYIBz6_niNrIr15aryU
Message-ID: <CAJ8uoz0gcQmqTPGBmNF6+WvWZHPOVRsPoEmTwG6WeOaq1vPxcg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/11] xsk: Allocate UMEM chunks through page_pool
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Nov 2026 at 12:26, Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wrot=
e:
>
> AF_XDP zero copy needs a second RX allocator in every driver. A
> page_pool driver can take UMEM chunks from a memory provider instead,
> and keep its refill, recycling and DMA sync code.
>
> Each aligned chunk becomes a net_iov, whose address netmem_address()
> finds without calling the provider. Userspace may post a chunk that
> the kernel still owns, so the provider tracks the owner of each chunk
> and drops such FILL entries. Chunks that a page pool releases stay in
> the kernel for reuse. Nothing installs the provider yet.
>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> ---
>  include/net/netmem.h |  25 ++++-
>  include/net/xdp.h    |   2 +-
>  net/xdp/Kconfig      |   1 +
>  net/xdp/Makefile     |   2 +-
>  net/xdp/xsk.h        |   6 ++
>  net/xdp/xsk_pp.c     | 246 +++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 279 insertions(+), 3 deletions(-)
>  create mode 100644 net/xdp/xsk_pp.c
>
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index b986ad616334..a3b67ef32b21 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -69,6 +69,7 @@ DECLARE_STATIC_KEY_FALSE(page_pool_restricted);
>  enum net_iov_type {
>         NET_IOV_DMABUF,
>         NET_IOV_IOURING,
> +       NET_IOV_XSK,
>  };
>
>  /* A memory descriptor representing abstract networking I/O vectors.
> @@ -107,6 +108,10 @@ struct net_iov_area {
>         size_t num_niovs;
>         /* Each net_iov covers 1 << niov_shift bytes. */
>         unsigned int niov_shift;
> +       /* CPU address of the first net_iov, or NULL if the CPU cannot re=
ad
> +        * the area.
> +        */
> +       void *vaddr;
>  };
>
>  static inline struct net_iov_area *net_iov_owner(const struct net_iov *n=
iov)
> @@ -119,6 +124,18 @@ static inline unsigned int net_iov_idx(const struct =
net_iov *niov)
>         return niov - net_iov_owner(niov)->niovs;
>  }
>
> +static inline void *net_iov_address(const struct net_iov *niov)
> +{
> +       const struct net_iov_area *area =3D net_iov_owner(niov);
> +       unsigned long off;
> +
> +       if (!area->vaddr)
> +               return NULL;
> +
> +       off =3D (unsigned long)net_iov_idx(niov) << area->niov_shift;
> +       return area->vaddr + off;
> +}
> +
>  /* Initialize a niov: stamp the owning area, the memory provider type.
>   */
>  static inline void net_iov_init(struct net_iov *niov,
> @@ -345,10 +362,16 @@ static inline void *__netmem_address(netmem_ref net=
mem)
>         return page_address(__netmem_to_page(netmem));
>  }
>
> +/**
> + * netmem_address - get the CPU address of the memory behind @netmem
> + * @netmem: netmem to get the address of
> + *
> + * Return: the address, or NULL if the CPU cannot read @netmem.
> + */
>  static inline void *netmem_address(netmem_ref netmem)
>  {
>         if (netmem_is_net_iov(netmem))
> -               return NULL;
> +               return net_iov_address(netmem_to_net_iov(netmem));
>
>         return __netmem_address(netmem);
>  }
> diff --git a/include/net/xdp.h b/include/net/xdp.h
> index 1105bb9e3292..5ab7802ac4e1 100644
> --- a/include/net/xdp.h
> +++ b/include/net/xdp.h
> @@ -368,7 +368,7 @@ static inline bool xdp_buff_add_frag(struct xdp_buff =
*xdp, netmem_ref netmem,
>
>         if (unlikely(netmem_is_pfmemalloc(netmem)))
>                 xdp_buff_set_frag_pfmemalloc(xdp);
> -       if (unlikely(netmem_is_net_iov(netmem)))
> +       if (unlikely(netmem_is_net_iov(netmem) && !netmem_address(netmem)=
))
>                 xdp_buff_set_frag_unreadable(xdp);
>
>         return true;
> diff --git a/net/xdp/Kconfig b/net/xdp/Kconfig
> index 71af2febe72a..c9c68d3b3712 100644
> --- a/net/xdp/Kconfig
> +++ b/net/xdp/Kconfig
> @@ -2,6 +2,7 @@
>  config XDP_SOCKETS
>         bool "XDP sockets"
>         depends on BPF_SYSCALL
> +       select PAGE_POOL
>         default n
>         help
>           XDP sockets allows a channel between XDP programs and
> diff --git a/net/xdp/Makefile b/net/xdp/Makefile
> index 30cdc4315f42..6e9d60f9f7f1 100644
> --- a/net/xdp/Makefile
> +++ b/net/xdp/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_XDP_SOCKETS) +=3D xsk.o xdp_umem.o xsk_queue.o xskmap.o
> -obj-$(CONFIG_XDP_SOCKETS) +=3D xsk_buff_pool.o
> +obj-$(CONFIG_XDP_SOCKETS) +=3D xsk_buff_pool.o xsk_pp.o
>  obj-$(CONFIG_XDP_SOCKETS_DIAG) +=3D xsk_diag.o
> diff --git a/net/xdp/xsk.h b/net/xdp/xsk.h
> index 7c811b5cce76..4dab7b9a1487 100644
> --- a/net/xdp/xsk.h
> +++ b/net/xdp/xsk.h
> @@ -34,6 +34,12 @@ static inline struct xdp_sock *xdp_sk(struct sock *sk)
>
>  void xsk_map_try_sock_delete(struct xsk_map *map, struct xdp_sock *xs,
>                              struct xdp_sock __rcu **map_entry);
> +struct xsk_pp;

How about a header file instead of a forward declaration?

> +extern const struct memory_provider_ops xsk_pp_ops;
> +
> +struct xsk_pp *xsk_pp_create(struct xsk_buff_pool *pool);
> +void xsk_pp_put(struct xsk_pp *pp);
>  void xsk_clear_pool_at_qid(struct net_device *dev, u16 queue_id);
>  int xsk_reg_pool_at_qid(struct net_device *dev, struct xsk_buff_pool *po=
ol,
>                         u16 queue_id);
> diff --git a/net/xdp/xsk_pp.c b/net/xdp/xsk_pp.c
> new file mode 100644
> index 000000000000..fdd55265a6cd
> --- /dev/null
> +++ b/net/xdp/xsk_pp.c
> @@ -0,0 +1,246 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* AF_XDP UMEM as a page pool memory provider
> + *
> + * Each aligned UMEM chunk is a readable net_iov with one owner at a tim=
e:
> + *
> + *   userspace --FILL--> page pool --release--> reuse --alloc--> page po=
ol
> + *       ^                   |
> + *       +-----RX ring-------+
> + */
> +
> +#include <net/page_pool/helpers.h>
> +#include <net/page_pool/memory_provider.h>
> +#include <net/xdp_sock_drv.h>
> +
> +#include "xsk.h"
> +#include "xsk_queue.h"
> +
> +enum xsk_pp_chunk {
> +       XSK_PP_USER,    /* owned by userspace */
> +       XSK_PP_POOL,    /* owned by a page pool */
> +       XSK_PP_REUSE,   /* on the reuse stack */
> +};
> +
> +struct xsk_pp {
> +       struct net_iov_area area;
> +       struct xsk_buff_pool *pool;
> +       /* Protects fq, state and reuse */
> +       spinlock_t lock;
> +       struct xsk_queue *fq;
> +       refcount_t refs;
> +       u32 nr_pools;
> +       bool dma_need_sync;
> +       u8 *state;
> +       u32 reuse_cnt;
> +       u32 reuse[];

Is the reason that you have a reuse stack here and not use the one in
xsk_buff_pool that it only exists in unaligned mode, which you are not
supporting? Could you still use the "pre-calculated" heads in aligned
mode and link them up? There is already a xskb_list and free_list in
there that is used for that purpose. Just an idea that could cut down
the state and maybe the amount of code.

> +};
> +
> +static void xsk_pp_free(struct xsk_pp *pp)
> +{
> +       kvfree(pp->state);
> +       kvfree(pp->area.niovs);
> +       kvfree(pp);
> +}
> +
> +void xsk_pp_put(struct xsk_pp *pp)
> +{
> +       if (refcount_dec_and_test(&pp->refs))
> +               xsk_pp_free(pp);
> +}
> +
> +/* @pool must be DMA mapped and have aligned chunks. The provider must b=
e
> + * the only consumer of its FILL ring.
> + */
> +struct xsk_pp *xsk_pp_create(struct xsk_buff_pool *pool)
> +{
> +       struct net_iov *niov;
> +       struct xsk_pp *pp;
> +       dma_addr_t dma;
> +       u32 i;
> +
> +       pp =3D kvzalloc_flex(*pp, reuse, pool->heads_cnt, GFP_KERNEL_ACCO=
UNT);
> +       if (!pp)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pp->area.niovs =3D kvzalloc_objs(*pp->area.niovs, pool->heads_cnt=
,
> +                                      GFP_KERNEL_ACCOUNT);
> +       pp->state =3D kvzalloc(pool->heads_cnt, GFP_KERNEL_ACCOUNT);
> +       if (!pp->area.niovs || !pp->state) {
> +               xsk_pp_free(pp);
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       pp->area.num_niovs =3D pool->heads_cnt;
> +       pp->area.niov_shift =3D pool->chunk_shift;
> +       pp->area.vaddr =3D pool->addrs;
> +       pp->pool =3D pool;
> +       pp->fq =3D pool->fq;
> +       pp->dma_need_sync =3D dma_dev_need_sync(pool->dev);

Are you copying these for performance reasons, i.e. no extra pointer
dereference in the fast path? In the same manner as the pool copies
some information from the umem?

> +       spin_lock_init(&pp->lock);
> +       refcount_set(&pp->refs, 1);
> +
> +       for (i =3D 0; i < pp->area.num_niovs; i++) {
> +               niov =3D &pp->area.niovs[i];
> +               dma =3D xp_raw_get_dma(pool, (u64)i << pool->chunk_shift)=
;
> +               net_iov_init(niov, &pp->area, NET_IOV_XSK);
> +               if (net_mp_niov_set_dma_addr(niov, dma)) {
> +                       xsk_pp_free(pp);
> +                       return ERR_PTR(-ERANGE);
> +               }
> +       }
> +
> +       return pp;
> +}
> +
> +static int xsk_pp_init(struct page_pool *pool)
> +{
> +       struct xsk_pp *pp =3D pool->mp_priv;
> +
> +       if (pool->p.order || pool->p.dma_dir !=3D DMA_BIDIRECTIONAL ||
> +           pool->p.dev !=3D pp->pool->dev)
> +               return -EINVAL;
> +       if (pool->p.max_len > pp->pool->chunk_size ||
> +           pool->p.offset > pp->pool->chunk_size - pool->p.max_len)
> +               return -EINVAL;
> +
> +       refcount_inc(&pp->refs);
> +       spin_lock_bh(&pp->lock);
> +       pp->nr_pools++;

What is the difference between this counter and the refcount?

> +       spin_unlock_bh(&pp->lock);
> +       return 0;
> +}
> +
> +static void xsk_pp_destroy(struct page_pool *pool)
> +{
> +       struct xsk_pp *pp =3D pool->mp_priv;
> +
> +       spin_lock_bh(&pp->lock);
> +       pp->nr_pools--;
> +       spin_unlock_bh(&pp->lock);
> +       xsk_pp_put(pp);
> +}
> +
> +static bool xsk_pp_claim(struct xsk_pp *pp, u32 idx, enum xsk_pp_chunk f=
rom)
> +{
> +       lockdep_assert_held(&pp->lock);
> +
> +       if (pp->state[idx] !=3D from)
> +               return false;
> +
> +       pp->state[idx] =3D XSK_PP_POOL;
> +       return true;
> +}
> +
> +static u32 xsk_pp_alloc_reuse(struct xsk_pp *pp, netmem_ref *netmems, u3=
2 max)
> +{
> +       u32 idx, n =3D 0;
> +
> +       while (n < max && pp->reuse_cnt) {
> +               idx =3D pp->reuse[--pp->reuse_cnt];
> +               if (WARN_ON_ONCE(!xsk_pp_claim(pp, idx, XSK_PP_REUSE)))
> +                       continue;
> +               netmems[n++] =3D net_iov_to_netmem(&pp->area.niovs[idx]);
> +       }
> +
> +       return n;
> +}
> +
> +static u32 xsk_pp_alloc_fill(struct xsk_pp *pp, netmem_ref *netmems, u32=
 max)
> +{
> +       struct xsk_buff_pool *pool =3D pp->pool;
> +       struct xsk_queue *fq =3D pp->fq;
> +       u32 i, entries, cons, idx, n =3D 0;
> +       u64 addr;
> +
> +       if (!fq || !max)
> +               return 0;
> +
> +       entries =3D xskq_cons_nb_entries(fq, max);
> +       if (!entries) {
> +               fq->queue_empty_descs++;
> +               return 0;
> +       }
> +
> +       cons =3D fq->cached_cons;
> +       for (i =3D 0; i < entries; i++) {
> +               __xskq_cons_read_addr_unchecked(fq, cons++, &addr);
> +               addr &=3D pool->chunk_mask;
> +               idx =3D addr >> pp->area.niov_shift;
> +               if (unlikely(addr >=3D pool->addrs_cnt ||
> +                            !xsk_pp_claim(pp, idx, XSK_PP_USER))) {
> +                       fq->invalid_descs++;
> +                       continue;
> +               }
> +               netmems[n++] =3D net_iov_to_netmem(&pp->area.niovs[idx]);
> +       }
> +
> +       xskq_cons_release_n(fq, entries);
> +       __xskq_cons_release(fq);
> +       return n;
> +}
> +
> +static netmem_ref xsk_pp_alloc_netmems(struct page_pool *pool, gfp_t gfp=
)
> +{
> +       netmem_ref *netmems =3D pool->alloc.cache;
> +       struct xsk_pp *pp =3D pool->mp_priv;
> +       struct net_iov *niov;
> +       dma_addr_t dma;
> +       u32 i, n;
> +
> +       if (WARN_ON_ONCE(pool->alloc.count))

What has the driver writer or system done if this ever happens?

> +               return 0;
> +
> +       spin_lock_bh(&pp->lock);

For my understanding, what entities can call this function at the same
time? With the xsk_buff_pool we were protected by NAPI.


> +       n =3D xsk_pp_alloc_reuse(pp, netmems, PP_ALLOC_CACHE_REFILL);
> +       n +=3D xsk_pp_alloc_fill(pp, netmems + n, PP_ALLOC_CACHE_REFILL -=
 n);
> +       spin_unlock_bh(&pp->lock);
> +       if (!n)
> +               return 0;
> +
> +       for (i =3D 0; i < n; i++) {
> +               niov =3D netmem_to_net_iov(netmems[i]);
> +               dma =3D page_pool_get_dma_addr_netmem(netmems[i]);
> +               if (pp->dma_need_sync)
> +                       dma_sync_single_range_for_device(pool->p.dev, dma=
,
> +                                                        pool->p.offset,
> +                                                        pool->p.max_len,
> +                                                        pool->p.dma_dir)=
;
> +               net_mp_niov_set_page_pool(pool, niov);
> +       }
> +
> +       pool->alloc.count =3D n - 1;
> +       return netmems[n - 1];
> +}
> +
> +static bool xsk_pp_release_netmem(struct page_pool *pool, netmem_ref net=
mem)
> +{
> +       struct net_iov *niov =3D netmem_to_net_iov(netmem);
> +       struct xsk_pp *pp =3D pool->mp_priv;
> +       u32 idx =3D net_iov_idx(niov);
> +
> +       spin_lock_bh(&pp->lock);
> +       net_mp_niov_clear_page_pool(niov);
> +       if (!WARN_ON_ONCE(pp->state[idx] !=3D XSK_PP_POOL ||
> +                         pp->reuse_cnt =3D=3D pp->area.num_niovs)) {
> +               pp->state[idx] =3D XSK_PP_REUSE;
> +               pp->reuse[pp->reuse_cnt++] =3D idx;
> +       }
> +       spin_unlock_bh(&pp->lock);
> +
> +       return false;
> +}
> +
> +static int xsk_pp_nl_fill(void *mp_priv, struct sk_buff *rsp,
> +                         struct netdev_rx_queue *rxq)
> +{
> +       return 0;
> +}
> +
> +const struct memory_provider_ops xsk_pp_ops =3D {
> +       .init           =3D xsk_pp_init,
> +       .destroy        =3D xsk_pp_destroy,
> +       .alloc_netmems  =3D xsk_pp_alloc_netmems,
> +       .release_netmem =3D xsk_pp_release_netmem,
> +       .nl_fill        =3D xsk_pp_nl_fill,
> +       .caps           =3D MP_CAP_READABLE,
> +};
> --
> 2.56.0
>
>
