Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FD549BD77
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149611; cv=pass; b=BLAb5Gfe0hRyjgpgIN0OFZdqr5htFxff6FT77xQpK3vaDJzLI9aXAV0SfLLCHGV+p/lUlouRRiQIoTh0/hq667nxILDqmqstfdYA3aLWolBeYgwRGJWcdI2wzajzp7XLAmnhaAYZKBpK/gND7dVhk79LEVoMqojebuTFA2Ywf4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149611; c=relaxed/simple;
	bh=75B6zdKCfHIJgushz+4ScUK9jZ/KjqUsttYbzMJwht8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ui0TgRDN5559YFbs8nmzJOrAu8iPbk6p+VKDPtO6AYxSouVZ3R2/GBats5MQ5JswiDJM28Qgy3Qjry2aA3JoYFu59WxlcmQnJZ91gh2tyczWp6j8P1IVOcsLfvvzmUwEvjWB2CkOKMI6pWVQF8Mun+FA//xYeZ7q8s3YR8ceqJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W5xQ4yOc; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W5xQ4yOc"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d88so2889a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789149608; cv=none;
        d=google.com; s=arc-20260327;
        b=HkipTMPzPPgWH8qAKKNhVB9Ki7LJJ52FtDAJN2gJfqXFE0/+s6QwbaTnsBop98h1b8
         x1GxkIg4WnK/8ThapQbe68aJlz11uQUPkvAIQdouq8Inre7e624LHy/IgCrSSLdPosW9
         WY7cnyp7UY7WxKpwbsdGGPfE6ZBG4WVgWbca1C1M9ld9RjRRbXtN/P1XHjODNqOxm2YH
         I3A/uOmN1Z09fI4GjcGtr7RR6kJCI8e/oq3DaXFiI0wxHpph3a5+mt+p6COLERJXRtig
         /CLzLZRtjXzzanzKn95VXR1PJ+NdmYblmx/s1h0w9v+rcc2byInVNnlzxmQ3BjQbAwUY
         3oKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EPuBfl5vK2ggyAXvAEaHgEtOqAJU0sZXA/862mNKi+A=;
        fh=/dusfuwKDESB3YdMuFC6eSrHSCh/LlktfShoeg0j4Ns=;
        b=k7rtDqQXuz6/9mj6Q4mDFKi+Tb9z4JfcR/h+lXhTjuE7aLp8xDdiZxdJA3YTaWmHWr
         jdiT063F6UAbA8hiLzTdK53ogf9U+xuzCggq0r36euJRz+qQowOnB4cJK3fQ9p+kRA0r
         qKwEJ9pLd3geSlGxJSDzAV294/Ai9C4ht/EVHu8Vosql4cGSw0LfgzL65ahXKq/WRev8
         js6w245d32dAEOGc8qRjnUK4IDRBYV6oFDvRQOE8Ak7dmYi1oYBkP79rI8BCk0d8eFia
         qhUEKRehgnsTVSx7ri+t1oJc0HJOkq0zaTbjtpaROmUZTEO69X09yzJK9+crJFZS4Tkg
         vWdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789149608; x=1789754408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EPuBfl5vK2ggyAXvAEaHgEtOqAJU0sZXA/862mNKi+A=;
        b=W5xQ4yOcI2ba7kEPjjFVpiDYDWsePTb35OMen34pxhsRcj/EsVJa8jBN9D0+G8kjEb
         p6phj4M9okxjfsWQCt9Q1yO3I+Afop71+pnBCtRw3scve8CdKKxhbULBlbnoFGt3AjbS
         XFKqC0Q1S/m5qF9fRBvrpkwzQ8jQXCIx5T6C1Muyn2sCaAnFWEKKIYRxRFK+K+nsSsqC
         lhOLD68Zed9fm7EWIF03GX7KTqKtYOcd9GuuNymYR95GxC/mXAXHpPSSQxKHCf+1YBIH
         38/tjaid5qRrK5Q5lCOQ6OHD+q9CcfpRdSMl4uVSv8CjjLf86aiBnRQPWV89sL7854NL
         deqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149608; x=1789754408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPuBfl5vK2ggyAXvAEaHgEtOqAJU0sZXA/862mNKi+A=;
        b=fjJ10J5pf5bRxCZG46AjsLHcshJ7/I/NSzJ9Ui8nhtYoLS7u4B/W874XFES6qjhxVc
         aJPJncL0ZmjEa+cTcGAQJcffki5pSfllIZa25pW0RvjWFCI3w4LraL9uQ8BQ4kds9LZL
         K/egXxIWmGYSZ3zR71a9l0BvNAR4jRD6SIAAEn/95/DggXHGztTmVMbLddw9ok5/MV/3
         48dmSWPZed8NbtxmOxEESiHpU5u2p/g5zvmzfHYaixqqRYNLRWzvEp1VLIku1r4GidmE
         RFjKRzIhehNnazLjlEMjMsQAw/n/I4/bCWr0unxguT7Yw7RLkuDoFw3hSeGodM6LhxZ1
         TdQA==
X-Forwarded-Encrypted: i=1; AKwUvBx2OhF7PVGCheyBXB8r25+UvRezEb5SaAbiTRVwHwSxeuacE0NaCZ7T1dfBZo/ZZ3k8JbtJgYO+l5rPJys=@vger.kernel.org
X-Gm-Message-State: AFuF++mEnC+GxeLtifF0Irxt6xNvcP2nOiPGg2vvM369H04l9yZy4CUo
	Q4SZV2wHTPrqkKEAWsZSft1JbYUMdkXPYmf13oFnfmN3kgudFv0WY5jvuC235WcrxIdjlKxpuWH
	edps+Fkr90OxdVfduvM7zvxlsx702IjaJx24dL1ia
X-Gm-Gg: AYBFou36nIQV17EiO0g2R6nlVbKquOTwqvg4c1QzpUdZUCT24+tLmhzTHRkpaqkRXz/
	pAKrF0cd8znwOhcgE9g7KolbNV8fzIqPcuXgNDrBLSVqeCLR79GiOgctLyezhwEDdytVNtc5alA
	lryt379G7+kx4yNgaFllT4+WNLwM5xO+zU9b762J+mq/6Vm4GI6gruATshfMVq0reb8Y0Yb/UVb
	2/QqV2SLOEj30S2uYNnhxofD2S1YBayTlzsQ5tBo0QGhHiK3+TUK/1p0Fvov25s1WEDvL8i4NOb
	r19cvbqicuH6EByAnb7/EiJOl96EghQ20oiYSrYwRVGCadtd03mYxu3AdgEQvBQOFCzIj2bFD6V
	s3AmlWmlJig==
X-Received: by 2002:aa7:ccd9:0:b0:6a6:6ded:b4b6 with SMTP id
 4fb4d7f45d1cf-6a9cae90c46mr922a12.13.1789149607454; Fri, 11 Sep 2026 11:00:07
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910143652.166683-1-f3lix.dev@gmx.de>
In-Reply-To: <20260910143652.166683-1-f3lix.dev@gmx.de>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 11 Sep 2026 10:59:56 -0700
X-Gm-Features: AcwNN1UFTPO9vNySiDMkdtVBGNXMPcgymzAD6eUPPtQ0NvEiLfkuP4abad7ttbk
Message-ID: <CAHS8izOJfCCistkyZfMpfvf8jGEgtZ5gB5qROC59qnW43PPC=A@mail.gmail.com>
Subject: Re: [PATCH net] net: devmem: fix TX binding UAF on netdevice unregister
To: Felix Hoffmann <f3lix.dev@gmx.de>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:37=E2=80=AFAM Felix Hoffmann <f3lix.dev@gmx.de> w=
rote:
>
> RX dma-buf bindings are invalidated by their memory provider when a
> netdevice is unregistered. TX bindings have no bound RX queues and no
> equivalent uninstall callback, so their physical and virtual netdevice
> pointers remain live after the devices are freed.
>
> Closing the owning netlink socket after device removal then makes
> netdev_nl_sock_priv_destroy() dereference the freed physical netdevice to
> hold and lock it. KASAN reports a slab-use-after-free and the kernel can
> panic.
>
> The binding can also outlive the device used for its dma-buf attachment.
> Since dma_buf_attach() does not hold a reference to that device, deferred
> binding cleanup can pass a freed device to dma_buf_unmap_attachment().
>
> Invalidate TX bindings that refer to either the physical or virtual
> netdevice during unregister. Keep a reference on the exact DMA device
> until the attachment is unmapped. The netlink socket destructor then uses
> the existing device-gone path, while delayed dma-buf cleanup retains a
> valid DMA device.
>
> NETDEV_CMD_BIND_TX does not require GENL_ADMIN_PERM. The failure was
> reproduced with the binding owned by UID 65534 across module removal.
>
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5
> Signed-off-by: Felix Hoffmann <f3lix.dev@gmx.de>
> ---
> The reproducer is available privately on request.
>
> Testing:
> - Full x86-64 kernel build with generic KASAN enabled
> - Unpatched kernel: UID 65534 bind, netdevice removal, and socket close
>   produced the reported KASAN use-after-free and panic
> - Patched kernel: the identical sequence completed without a KASAN report
> - Patched kernel: 10 additional bind, removal, and close iterations passe=
d
>
>  net/core/dev.c    |  2 ++
>  net/core/devmem.c | 47 +++++++++++++++++++++++++++++++++++++++++++++--
>  net/core/devmem.h |  7 +++++++
>  3 files changed, 54 insertions(+), 2 deletions(-)
>
> diff --git a/net/core/dev.c b/net/core/dev.c
> index ecfbd72d5d1a..c325fa7e0d6f 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -12401,6 +12401,8 @@ static void dev_memory_provider_uninstall(struct =
net_device *dev)
>
>                 __netif_mp_uninstall_rxq(rxq, &rxq->mp_params);
>         }
> +
> +       net_devmem_uninstall_tx_bindings(dev);
>  }
>
>  /* devices must be UP and netdev_lock()'d */
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index f4d60654ce7f..a21a8fe92f58 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -77,6 +77,7 @@ void __net_devmem_dmabuf_binding_free(struct work_struc=
t *wq)
>         dma_buf_unmap_attachment_unlocked(binding->attachment, binding->s=
gt,
>                                           binding->direction);
>         dma_buf_detach(binding->dmabuf, binding->attachment);
> +       put_device(binding->dma_dev);
>         dma_buf_put(binding->dmabuf);
>         xa_destroy(&binding->bound_rxqs);
>         percpu_ref_exit(&binding->ref);
> @@ -153,6 +154,46 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmab=
uf_binding *binding)
>         percpu_ref_kill(&binding->ref);
>  }
>
> +void net_devmem_uninstall_tx_bindings(struct net_device *dev)
> +{
> +       struct net_devmem_dmabuf_binding *binding;
> +       struct net_devmem_dmabuf_binding *found;
> +       unsigned long xa_idx;
> +
> +       /* Unlike RX bindings, TX bindings have no memory provider whose
> +        * uninstall callback can invalidate their net_device pointers.
> +        */

Please remove these LLM generated comments that make no sense. The
comment is correct but no one reading this code is wondering if the TX
binding have a memory provider.

> +again:
> +       found =3D NULL;
> +       rcu_read_lock();
> +       xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> +               if (binding->direction !=3D DMA_TO_DEVICE ||
> +                   (READ_ONCE(binding->dev) !=3D dev &&
> +                    READ_ONCE(binding->vdev) !=3D dev))
> +                       continue;
> +

Can you do a deeper investigation on what to do here or explain why
this is correct. I'm not sure we should do anything on the vdev
unregestiring? hmm...

FWIW I think probably an in-tree test would not go to net, but would
be a separate patch that goes to net-next? Maybe? IDK. Up to stan.

--
Thanks,
Mina
