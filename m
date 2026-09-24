Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6613BB69B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262142; cv=pass; b=hCWgPYwR/Kc7E5nuN5uDEdlrtT0kiF8bT87SeFti8f+KUCG6V0JEeirPeeo/lus40hmvqlsRrdrIc8fmw7SgKWPKhRYy53QwrhIPosgRONecWeob1Aog628t/j5RqjfTcW8uI2TitjJQ/dcubdUxCVgqBYx32/4OMp9x8pv9ZF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262142; c=relaxed/simple;
	bh=ShNN69DhaJyHp2DOgt/K2M0XTHi/ubdDgTbCqzMNj2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1kzcWjcM+14WzwyPkFsDwhrP4NZXXwIOTyrzeR2yilATO+8o1pYNqnUv+ILuIyf2RMyDr+Jotx/Xp6qKHNbAzG2kZZQtasvw18Mqtaas2HPmsG0nmNa3lG/CPE11NjK5sLIvX5vHJx/w0TiciwkOF+FLqQnTRlVijWSdVwEN+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=swY0Uudc; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="swY0Uudc"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso539a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262137; cv=none;
        d=google.com; s=arc-20260327;
        b=WfFGIMnubZhHPoZ/qREVPdJEn+VKPqJp+PfRxoh97W5OmiMWf7eRbNX3EHGJZziU/F
         ZDm40UwGcb73o1Jik5CP50H+7cwnrojXQVnrzm/mIohKIlCsXWTHP5TqEtR77RYaLVvk
         lK8Rzhu6VESzgL70QdLyTJgvusAOUMCLGkh/8s4kW++1uFPC2q3G1ZlABefgc1CrEGVE
         AeJPOWAq07je4cEB6tqPF89aSweKIR+x0kFyL3Itz/SJOo7HpG9r5Bf45uq+3wqVzfIw
         EkRXV2NMWvpYZEi5I0+q1M+JDEtn67M+y6ls0UTCzvWKiNc1uNmgHZ1BFYlACRE7THDK
         Aw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ZR1ILn9TYPBwHk6m2pP3jOeJW2/wKuJF/ueaZTjeaY=;
        fh=/fOOBVAGWi7zGeSuSvujkZVAeZoVNpT2yU3gKQ0Qbp8=;
        b=i/sbBnW7KPKLro7xtry1R9ZeEeP0IUC7jlOjN7eiFrdjVw6Zx6Md7In2JXhJEWvLi0
         gWWiuXtBmsvWHGbWRhvcZmyt817DGpFdk+oDcseautetPapWaCrla2JevD6werzKk/2c
         Va/QGVwFrGQlUp542cFG4qqpxy0ikqwEbxRsmZ6JryGnccLFT5uk8QBn3axu8PS2BcGA
         MbWlt+txwZfMG90lfvGigW7C7u8dwaxsDYlZ+xwfr1ExUM/P85Y/j/y7PdKcPZLw2r8z
         MSP3yCaFCrG2ZF2JyX7ZYB7EWA9kdp1eUitOuCeVVEulEKP9HmAfma0G/r+724jZc53E
         mRVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790262137; x=1790866937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ZR1ILn9TYPBwHk6m2pP3jOeJW2/wKuJF/ueaZTjeaY=;
        b=swY0UudchTjMjFvUJEUAnLhsD33oGR5GcHVFO0mWV/y+oonypULFpLDmPI/xpsskGn
         9z6ktE24X//J4XcgGq8sHd/6deJJgWKKr5bILzPlBVpmgYLF0rhHIoDmebr9zn1d4FrO
         g7r5WDo4v7vecal0w/7hwbxDlSMvPKSsOWgsr2jYUapu6b3IOWuJMEx/OTD/CkGz1ueH
         uamD8Q38u1IngoQbBFMS7QcpFpGVh8NDOQPdQc/1KptFYRA9cjwOuandNrdvIbaYetJz
         AJqPG2WSHCJohbdq9p02L1C6Ix26ztKmAvAGzhWibGsliKVWxa4cRXVCFG0FmYZAJtFt
         NMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262137; x=1790866937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZR1ILn9TYPBwHk6m2pP3jOeJW2/wKuJF/ueaZTjeaY=;
        b=oX98CB3fbAy9p5wO0EcZPRNXMTFXB3t0F+WpbtADdC1Hm7wrKj9vfTO/+VV98qeH19
         YDGO8cA9TX3zIcoNYebpbmy7Ut/4Xn97dwz0kkH9URY9rzQjNkCgL+rOkwcZ8VkLfXlG
         Zl3kJnSDUTucnD9gMkvb+tzJiLJ+Ncu4QmFIvBt2q9sC0SuDpFNupHiomHZNcocutJh8
         QGJYAXjgYcrkdBXqc+KWmJ0q0bkvu5oMCbXWgWtiGFihHdNQtMavw4926LuGpFZVzvMB
         O3QGMVRDa09vtZo9q0v2XdPy4+tyYYt4KllLmLqQE44+ZsJocjsNluJvzF80Bsw63HBw
         Ny3g==
X-Forwarded-Encrypted: i=1; AKwUvBw39GTzrYG38U8zWPEJEA4zFSdMGebHRSDQQXJFfXiWGSsjFw0/TuHhr7TXQYjeb4hp5t04kab1RGMRd/M=@vger.kernel.org
X-Gm-Message-State: AFuF++kO6lpb28bS7JOrVApVu42XlpTQkeMnsXRkaNPnAVNcZaDqyY20
	73dD+eZKzktg1mhoNXO7/F0WzBWYkPEum5cqre6QBqt2DRqjuE9MPg7yZCacJQW2F28fMCJPjla
	qf1LSsOwfA2VQJa4/FQc/eNpvXHa/Pb4bUzJzbSHX
X-Gm-Gg: AYBFou21Mqvn+R5vSCkiVXUu7WUw4fan8YHMfPGWu+AZQdzkMRxTEaI2fZr8LH7k/Cf
	N94kz1u/yEBBxlOkYLFMJ/XvQGeiDHMuIHHZbqZVCM2oQMpZZxMP2VrtGW0qC4n0BfdunUB0ABp
	kAs8sTinxKEweBZUrjl1ts/mZXDuNcwBk3HBs4zDU4RnpNSQbeEPTDAI6KXpCQbiyZn9+0P3hHf
	wbNtWv/KMgbkMwAZr9iUrYm5hcMEDHyUtmVIQq/r+GjOkDROArO3LpXR/tHvpILilS1Fp7kteU4
	M2Mk6JRqTeIgw8MM8AABTcABaFD+iVpKsrV0J515f9DzuEwtJ7rce9pYZFrMeLlNQ22SCYUFk1e
	pavL2LQ==
X-Received: by 2002:aa7:df03:0:b0:6a6:32f6:2841 with SMTP id
 4fb4d7f45d1cf-6aac7cd8562mr60719a12.14.1790262136510; Thu, 24 Sep 2026
 08:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922204348.717198-1-sdf@fomichev.me> <20260922204348.717198-2-sdf@fomichev.me>
In-Reply-To: <20260922204348.717198-2-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 24 Sep 2026 08:02:04 -0700
X-Gm-Features: AclHuK-Rw22mmYVrW2dkDQdq_DFu4D5I5rl1QgSsMEN2Zfe2L0z7rCIa7BiKQQE
Message-ID: <CAHS8izPwLBCJXM_0Df8P6S-FVwAq+TaRKn3uTh1h=33Ffj8VmQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: netmem: add net_iov_area freelist helpers
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, asml.silence@gmail.com, axboe@kernel.dk, 
	sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:43=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> io_uring zero-copy receive and devmem both maintain a bounded LIFO for
> net_iovs in a contiguous area. Store the freelist in struct net_iov_area
> and provide common push and pop helpers.
>
> Leave synchronization to area owners. Keep devmem's area adjacent to its

This could be a follow up change, but I think synchronization should
be provided by the netmem/niov infra, rather than the area owners. TBH
the infra providing an unsynchronized data structure and letting the
area owner use it and shoot themselves in the foot feels error prone.
For now we could use a comment.

I also think we should not provide _push and_pop functions, rather we
should provide _push_bulk() and _pop_bulk(), and the caller can decide
to only push and pop 1 at a time if they need to. The reason is that
in allocation paths, we almost always want to alloc in bulk. If the
infra had the lock it could lock once and alloc a bulk.

The free path is more nuanced. I think _push_bulk() is actually not
currently that useful, because page_pool_put_netmem_bulk() ends up
internally looping over individual calls to __page_pool_put_page(). It
seems like there is a very low hanging fruit optimization possible
here where we change things such that page_pool_put_netmem_bulk()
actually does free the entire bulk at once, and if the pp is using a
memory provider, it uses push _push_bulk() to free the entire stack of
netmems with 1 lock acquire.

But these can be future optimizations, so,

Reviewed-by: Mina Almasry <almasrymina@google.com>

> lock. Use u32 indices and counts, which halves devmem's freelist storage
> on 64-bit systems. Reject devmem areas with more than U32_MAX entries
> before narrowing the count. With 4 KiB chunks, the limit is almost 16 TiB=
.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  include/net/netmem.h | 28 ++++++++++++++++++++++++++-
>  io_uring/zcrx.c      | 25 +++++++++---------------
>  io_uring/zcrx.h      |  4 ----
>  net/core/devmem.c    | 46 ++++++++++++++++++++++----------------------
>  net/core/devmem.h    |  7 +++----
>  5 files changed, 62 insertions(+), 48 deletions(-)
>
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index bccacd21b6c3..da885d95ea63 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -101,10 +101,15 @@ struct net_iov {
>  struct net_iov_area {
>         /* Array of net_iovs for this area. */
>         struct net_iov *niovs;
> -       size_t num_niovs;
> +
> +       /* Stack of free net_iov indices. */
> +       u32 *freelist;
>
>         /* Offset into the dma-buf where this chunk starts.  */
>         unsigned long base_virtual;
> +
> +       u32 num_niovs;
> +       u32 free_count;

Why not keep num_niovs a size_t and make free_count a size_t as well
(so that essentially we can support anything up to SIZE_T_MAX - if
that exists - num entries)? Do we gain anything by converting these to
u32? I know in practice in really doens't make a difference, but since
struct dma_buf->size is a size_t and that's usually the type we use
for memory sizes we should use it unless we see a reason not to. Tbh I
don't think the size of the freelist array is a big deal?


--=20
Thanks,
Mina
