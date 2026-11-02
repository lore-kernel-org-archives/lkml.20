Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652052;
	b=4C/7OkgmqAdJb0SvIwuR9+Ny0jeFABOzFNB+2FJDzrb/aZPvfpzPQv7oSnv3uZfCPqcP
	 slSQFEHDP8+Um8vF4mm2oymsJU/m9Efn0InqXDkU5cHGQjAmILmX2YUMtmwv/ydnxp0zo
	 0aPrXb/MmRsrWmPBdxOL830yDEYVQq1vHAVqwaIYnhkKXSzFFPOR2MwgSwkKnRAYT1u3V
	 CUPo9BBGfU8lxMfXMoVWq/00CQNZ1PDaBn+nhQyH3rConueAZumtaFh2rPa/A95jhOsns
	 JtAExTq5lI1zeYK4caW7sEdryd99XqaY4B8CP414RLI9yYGCSSX2OoxXlJY/SgseR8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
	b=S4c7ZxVrzeJU4IY+Xbx/PZZnI7K42bSuhSDbT0qJfrJHaP119VUsfxR6SC8FtkbrfJTt
	 +NI2LAZojfIsiG89Q8XhyZcGdpY314RRNmSVUQTgzPww5J3duvX6iHFrqQGCoXTs492YH
	 1J4rrhVbuo0H298ozK/llXgsb50umgIO6LCLPxisLEctozqkdVJvFMVNFPM7DfPbLxz8B
	 EVQ8YgXkDBpfpiW2uKe7GgmvMBdjmc+NFIeKP2XSy7BPuC/fQEhJOx213KI71xitZOM3+
	 o3NxKK6UsOUOkl6Dz8xOBi2Eej6Q/GU1kqPCCwYVBspDVWaG3trFN/pjOvGAkiIUDfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eHNNvP4g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323A1606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 323A1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eHNNvP4g
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so2185a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:40:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652049; cv=none;
        d=google.com; s=arc-20260327;
        b=ZcdbgUi+Uej8mCHhqkuF1/K7t/KoHjcn1ZegBCblFnBJqRENE/unJN5fNVy6tEdC05
         ds2s8w4ejqhIOZ7pKbQ6gbRD0JqNqqdrW88afCxoJBdwAhauuJdfUfj2YOza6GI7tlLe
         7k8veYBapX/2Z4dEEgWOQNXXEnX8v+5ySWLFXOU47WajSzoC4K7wAau+BdfN1OpPCEk/
         P22KntOD97ZYm1cTojQXC8GXdtCeO8gEhib3i5OEO3CrFHm/VaeFxLOKvJygW0K6ZiM8
         ItI28WCAwUYsHu7NTG8W77NO0OEDJtu5x2C26prGAA4eG5Sp5cGT1sGLYxTX75g4jxYk
         p1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
        fh=89wDnwQ0bPkAtuF7ygRasQew3ywDQSFEEueGzDxeCXM=;
        b=QpyTepVJ7hE6PjEdgjVurQQ6QjhwSzkfdDqVAZJKDLXJpZ4O4Lmikz8ASWxo1gAJgE
         FCWXdxhoyJ7+9tLxQE9JoxXKqQScY7wp7Sdco0WPL2ttDSIaen2Ryfqekt6eBVjjD8P5
         OZbl6opjW5juGxZWnXVhcGE560DkCh9JT1rvHAyT+/+VdfQsr74yw9OXw7nkgtGTf4D6
         LkSVvggxh9vz8ZFuJu/BDK96uopEvC5T2GmYS5+d77oSBpFaM3npqdFwUJR1XZgwCMEG
         Vyvgj2oLyJlC0B4YMyIwRHxE4etsU2Wo/mbp+IvI7aV7A701GNKLBgL+grkfpSobMdtH
         phIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652049; x=1794256849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
        b=eHNNvP4gkD3jFrnE5uUMmnf91GgojEokCRr1Bj8d750eNexMgmZ8rGFlp4Hy8j4QU2
         xzu+6K68aQBmEtnDWqzd2xBxnjfoqOQ8PH0wixFaMipd+67kkunJQyI6z3wo0lQZU2dF
         vEBKFm1epjhZioAbdqRyYFTxMrL2WVzTSB+oUws9P3VLC66DjXIVql5kKhWMRhk0VQ7i
         V35M8A8pUeQhtTRXE+rpgK0B2hzGSr305ImakHHS7UF7KMWlRVgXzGQhqJnXZBzKrPC5
         8JhoSOur9ZOawQyQJJieWAXSotbOjJ39U4r9M+6lnW/94pEbAlntuJC12wSYGCi4e0vp
         hAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652049; x=1794256849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
        b=NuoqKdOj+toSjXTco3yg3UGrfuj7GKDlYfXwGBceWLcH5K3EwDV4lSmiUmHhtdycNv
         HMcKNUY3WGMWGHBu0Ug2HaDZ1biCEiw4TMGj8nxfMp2JZQq8S+VQsxibOJfWHq1+7xN5
         Lw9leTRnk36MCEes0EqXGJcFOEDWxAOJh+kIos9Ii9oxug8TSPEGBiZAKuA0mQsjKWv4
         MN1tD11//9L7SZ4nR7Ktdw8tXuTfqyC076vSFWU5LeDzt02LlZnSpvMBlHRW0P39lNi5
         mNWjziqiSvOc70sZ/1Q3J5KxW85ye/1z6KspAUbAClZ1pv7nt3sZZo6dSo9XoKXsjXX2
         hA/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwu92SSDi9ZxrtuHK+NE7YggMXJRYEM2id78n4ri6u5tZrrfDOhUYi2QKjIP+wMA0lrv0cfPvLyJ9RJYsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mCehr26mt5X2gFC7Yg93sxGhtNypAwdx6EDts0gg8rFnOE+S4
	Nf/iGuohWgM0KbxxwKacoP0WkXKZwriDrwwC/AuCtBL2B3wH8B8yrv7r7xdNSY7qfW9TCrX9gqZ
	jDoS+nHTZyF+gs+WptoRizD3U9FXZftY0B/nFOej7
X-Gm-Gg: AYBFou1yNKQ+5Z+9egBn5yc+jrysQZo6o7FTeru3aFsu0VbHrq6AjDKoqeONSnMn5iu
	Av3iFYlgA4YfHpGAaNuvQJ2jh+tIE61oR8xc6Mff5R5qfSE64Xsf2UiP/j4LaSIluQu7xnKAH7z
	SlzXS8S9HsmiT25GXiLh47+Ji81Kmpqcnzx3P5whS786tj2jxZpPpxmdN+tAn4NTwDJEt5CeKFn
	t+jNWOZ/knmjfrY1jT0bVh9kLkjqQlcsG79duZ4EiO4746bbcR5TjjtRaecuPshUYWs4ieAD9Mp
	bwiMwme36CQYYEaYjexyna369RfHX9Sk0pXYMrLVsIvpcfb7gXoA4Ory/StQhfWgaxow47UJ2dL
	yjz0knwjOFZkAFVXodFn/H9mBPE22VanQjs/anVkPRCOCRl8ftNAQ+nY8bCoVkZw17m4=
X-Received: by 2002:aa7:d794:0:b0:6b4:2188:97d0 with SMTP id
 4fb4d7f45d1cf-6b539d22220mr5870a12.6.1793652049063; Mon, 02 Nov 2026 12:40:49
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-7-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-7-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:40:37 -0800
X-Gm-Features: AclHuK-QHSUFwb7InxS-A8g0MGgfg1Hp3eU1afIQI3kknV9M7EMlKPAHYQ2ow5c
Message-ID: <CAHS8izMRtaL=kZaM29XQBodT8e+srppnK_DjNSTJnxFfNgG9aw@mail.gmail.com>
Subject: Re: [PATCH net-next 6/7] net: devmem: size TX net_iovs from the
 dmabuf sg table
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
> which makes BIG TCP ineffective.
>
> TX net_iovs only need to be DMA contiguous. Use the largest power of 2,
> up to 2MB, which aligns every DMA segment of the dmabuf:
> - 2MB hugepage-backed udmabufs get 2MB net_iovs
> - no UAPI change, TX addresses are dmabuf offsets
> - skbs are still bounded by TCP's size_goal, only frags get larger
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
>  net/core/netdev-genl.c |  2 +-
>  2 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 19c039ed2cb2..98c9594dbf99 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_devic=
e *dev, u32 rxq_idx,
>         return err;
>  }
>
> +static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size)
> +{
> +       struct scatterlist *sg;
> +       unsigned int i;
> +
> +       for_each_sgtable_dma_sg(sgt, sg, i) {
> +               if (!IS_ALIGNED(sg_dma_address(sg), size) ||
> +                   !IS_ALIGNED(sg_dma_len(sg), size))
> +                       return false;
> +       }
> +       return true;
> +}
> +
> +/* niov_shift =3D=3D 0 picks the net_iov size from the dmabuf, TX only *=
/
>  struct net_devmem_dmabuf_binding *
>  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>                        struct device *dma_dev,
> @@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void=
 *vdev,
>                        struct netlink_ext_ack *extack)
>  {
>         struct net_devmem_dmabuf_binding *binding;
> -       size_t niov_size =3D 1UL << niov_shift;
>         static u32 id_alloc_next;
>         struct scatterlist *sg;
>         struct dma_buf *dmabuf;
>         unsigned int sg_idx;
> +       size_t niov_size;
>         size_t niov_idx;
>         size_t i;
>         long err;
> @@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *=
vdev,
>         binding->tx_max_frag_size =3D dev->netmem_tx_max_frag_size;
>         write_pnet(&binding->net, sock_net(nl_sk));
>         binding->uid =3D sk_uid(nl_sk);
> -       binding->niov_shift =3D niov_shift;
>         xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
>
>         err =3D percpu_ref_init(&binding->ref,
> @@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void =
*vdev,
>                 goto err_unmap;
>         }
>
> +       if (!niov_shift) {
> +               niov_size =3D SZ_2M;
> +               while (niov_size > PAGE_SIZE &&
> +                      (!IS_ALIGNED(dmabuf->size, niov_size) ||
> +                       !net_devmem_sgt_aligned(binding->sgt, niov_size))=
)
> +                       niov_size /=3D 2;
> +               niov_shift =3D ilog2(niov_size);
> +       }
> +       binding->niov_shift =3D niov_shift;
> +       niov_size =3D 1UL << niov_shift;
> +

How come we're not checknig the largest supported size of the netdev here?

Also, maybe should clarify in the cl with the largest supported size,
is it actually only powers of 2 up to that power of 2? Or all sizes up
to that (not-necassirly) power of 2 size?

--=20
Thanks,
Mina
