Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183FD3C8705
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138352; cv=pass; b=fdxiDBshVa6nJodsN43MwjE4RdIxwfNXmOGGC/ZLWRbgD7BdNWkx06zYMPsijtbFr1gbCrOIHU+1F8a8B4luhUQiEJWLmCPafzELRfKGZqsSNdEYJEsE06tZrh6f5BiWJeW+Z/n+RYPE0PMG/J7fYdcaI42t1Z2jxME1OkOebG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138352; c=relaxed/simple;
	bh=WxuziSkYi5UPMb7ZUMtI9i1smM4fxMt4RUkXbggiHKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDj9gRyDkuKAASP0gl1bDLqEEw5EkYDxXLaEDivFOxQdj8dO3SYHRXgFJYihjxwKtUw8kRccqGD3FUtUjI+MkwKnOH0QnwlWtWFTJDD+ANLr4U3B6VQp0sDdc1ZzDWSNYtG9sD1E6H3de0tolJujPjM6xP5p65SpRTsgN/Hrki8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M59Pfafe; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M59Pfafe"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcc6094d7fso1333649e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792138349; cv=none;
        d=google.com; s=arc-20260327;
        b=VVeibeDq0Ht5ePXxUYc/Iy5BDMNXLYDpn8Ur0TYo0WXSgfvuU2qg1stt28zZ2qWVZU
         fo9NDmvP7lDO0uTxbxMf6kM2K7PmjKAyxBEUVdBIaf6gbNYeqzck2YQksiiFCxlGUGX7
         CxqnlKy193BXQ5w+EUcJdVZMZuPzFm7NBC8nifqYhiQI067Ixrg2U5z7kr2e8jvby83A
         rJPwdeja8wso+FSpM5Qj65lqRR6PBgGrUrhhZcuS3tzVCB9MSdUShjL0IBbK7DNbjV8R
         wRFl76QL0KBJhyu7w/AZfkQGM9ib90p1+CAM37zPlJhOEUOx8pEFqahQiw82j3CQHg2S
         eJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8sW/Cx8Xj7p1FXHUG1g9UmSn6q7zYA66/GXPT4c8TOs=;
        fh=qJqA+N/Cia92NLMZBDLpvG8e1tdBtDHuuTQhTezmtpM=;
        b=c+AGcJ3Xzu2YYsNwy51qsNnHpIWsF6bdGzywEJMwQImDZRkevJ/pDguXRbOl1tVkrL
         /Tt8BKYnjfyZJFjMaNjrSzCTF8MBfcs3i2YaFwFZtQBv63xOnJhzizUMzaHIZc4kW4aW
         e4bB7JdBvweEJOpVyxquPnqOFWM2wDhSJNCZQxxqdXFHCx/CZhyBYQpmRfzG5o8Q8lzg
         Sf14zYDiIQvzAw20/QkHr1NefKV7JqKa7McMtrmDL4hLLFskV++xF0hBgitH4fxl6EV8
         cq/zgaZPWWhInkuu9g+YZWFmvxIMGk96ozOhmWAA6rNc70Vv/6p3EmmPtjh0ww2OxiEM
         3WXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792138349; x=1792743149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8sW/Cx8Xj7p1FXHUG1g9UmSn6q7zYA66/GXPT4c8TOs=;
        b=M59PfafeePOQLpUUsBbiymQz3igE5/T3Yyfo0MKPCNdGhe1kMZn+Wg/dlIiL73AMtn
         2qOqaHaTVZZ7KrBUTIHKZbcBTAM8eFEt2+PprZOCU85h/DEF5V+HOcH8usBEl3ubIVAd
         /Mf8octdTHaJpYsL/xPGKklr5NTRgJHqI3WmhGExTH8laUYlkz1CMNmycALmtymqlpfE
         kRdOe13sw6N9E12kyPLuWktQiTNKJ5Aug+l14U0TJRKuf93B8UUfVGSaV7yjrEjnjWsA
         2ZVI2/rTQImuJqUR9XwKTpA/er3Ayqfd1WRVZ8Mdfn23wkiUZ0FMX5isr4D1Q8dwvYkN
         TXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138349; x=1792743149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sW/Cx8Xj7p1FXHUG1g9UmSn6q7zYA66/GXPT4c8TOs=;
        b=EOPXmK6I5qpw8S3JqMUdKuNe1Q8AAIAa8Z0ruJbA0lKQAju9hOYFwPtP5BwiM3yFU2
         8/MiqAyzRgHdRPtlYiwuK99azBE7fcZaHRWRMR7RGT8qFlegWvVYvGS0nFltuJqIuaCQ
         UgT4tC9W+NgQ9cF0ApMSHDernuxrnDJg4Sh/gsfdRLhjyve6+nwsgFnzjykVxpbsqd8m
         o4xkgOyUem7JVtyxvqkBQagwtOneCiseb2zs/lnEf4B9VMbvxe+eorngr25kabnKncdo
         JUt7npqU5G6y+15FJY9uAzKNJQ/SXZ64u6mRe6+5gLuSvqA25xsR+1ZOb91zn9kLFUJe
         jX8w==
X-Forwarded-Encrypted: i=1; AKwUvBwWOZBzL4ukahIdkUi+JyRMbPZrjZa/VlCgdfCKLzSVF/9ny7Xc4EkGxvcgSF40A6SnB3FHyPRMYHiUBrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW7JdpOti3EgbEI9a6Z4aOzb27svA3937VmgzbcRNa2Hh4jRAB
	t18bQ+t8++Jy+eK+iAzwP8RM71sJzGA7v6728hUFUeKACklE9qyqK+ny1yVpS7cc5ztUf4sQxH7
	RBkOPaNyWeVjKn928KHOFEnYkkhZ3WbY=
X-Gm-Gg: AYBFou0V0g/lzgeNw3c7bGdWhHcV2ThTMVx/w+2xKJ+87D66UojxEFgeyZfgeSmLXiP
	PO9kjNbvQw+oP5ALLAD4nW5c6J/TUk/+eb3em66IU3OScMwJ94+/aV7qj4lhTzQwayme0eBGlNa
	gJ//lOW8Vps39V7BeNbdAnu8x02sP9j4IgWuj4WfBlyi3/mLxv/0y9Lot+gxbO7XbS1wZUE3Bxk
	7jKd+V4ztOdliOzlOY/fOFqd5gqXapvFHKlkDvYL3+hTrK8DPI/JIw7K0XiCHpdAcdFZgr5IQ4d
	/jNvvbf8GzaigieA0IP+QF1OpVILPx4Z7FuI+nIBlpg092x6Vknb4UCzIsPWVElaEjY+ZXTiQa/
	AqxhWnqievvRtd54n4jBpaDu0CpZphawLM2sK0iCbqa2KjEk7CJ0k6Yp/GiMo90QYWgBdDg==
X-Received: by 2002:a05:6512:661b:b0:5bc:e75a:ad0e with SMTP id
 2adb3069b0e04-5bce75aaee3mr6847097e87.34.1792138344385; Fri, 16 Oct 2026
 01:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013155658.2196020-1-cjubran@nvidia.com>
In-Reply-To: <20261013155658.2196020-1-cjubran@nvidia.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Fri, 16 Oct 2026 16:11:47 +0800
X-Gm-Features: AclHuK_08bO7B8AupJ6RMIQbh6Nj3KnKYvBWqnQ0pvWBvdmWxJyLg91T1rBv4tk
Message-ID: <CAL+tcoDJx+suVKWjuHDMVMNThK1SS_a=0t1FkUninHnsAkraGg@mail.gmail.com>
Subject: Re: [PATCH v2 net] net: skbuff: don't copy alloc_cpu in skb header copies
To: Carolina Jubran <cjubran@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dragos Tatulea <dtatulea@nvidia.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:59=E2=80=AFPM Carolina Jubran <cjubran@nvidia.co=
m> wrote:
>
> Commit 68822bdf76f1 ("net: generalize skb freeing deferral to
> per-cpu lists") added alloc_cpu to struct sk_buff and placed it in the
> headers group copied by __copy_skb_header().
>
> This is wrong for newly allocated skbs. For example, skb_segment()
> allocates a new skb and records the current CPU in alloc_cpu, but
> __copy_skb_header() overwrites it with the value from the original skb.
>
> If the original skb was allocated on another CPU, the segment may later
> be treated as remotely allocated and unnecessarily deferred there when
> it is freed.
>
> Move alloc_cpu out of the headers group so it is preserved across
> header copies. Initialize it explicitly in skb_clone(), which allocates

nit: s/Initialize/Copying

> the skb object directly instead of going through __alloc_skb().
>
> This was discovered while investigating a throughput regression with
> software IPsec. The load used 512 IPsec tunnels carrying traffic over
> VXLAN, with 512 parallel iperf3 flows and an MTU of 4500.
>
> Before the fix:
>
>   16.09%  queued_spin_lock_slowpath
>              |
>              --15.90%--_raw_spin_lock_irqsave
>                        |
>                        --9.37%--__slab_free
>                                  kfree
>                                  skb_release_data
>                                  napi_consume_skb
>                                  mlx5e_poll_tx_cq
>
> After the fix:
>
>    6.84%  queued_spin_lock_slowpath
>              |
>              --6.57%--_raw_spin_lock_irqsave
>                       |
>                       --5.00%--__slab_free
>                                 kfree
>                                 skb_release_data
>                                 napi_consume_skb
>                                 mlx5e_poll_tx_cq
>
> Fixes: 68822bdf76f1 ("net: generalize skb freeing deferral to per-cpu lis=
ts")
> Signed-off-by: Carolina Jubran <cjubran@nvidia.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

Thanks. Overall it looks good to me:
Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>

> ---
>  include/linux/skbuff.h | 2 +-
>  net/core/skbuff.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> ---
> V2 log:
> - Move alloc_cpu after the headers group and fix the indentation. (Eric D=
umazet)
> ---
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index a3ff380d43f01..b3272d379409e 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -1036,7 +1036,6 @@ struct sk_buff {
>         __u16                   tc_index;       /* traffic control index =
*/
>  #endif
>
> -       u16                     alloc_cpu;
>

nit: no blank line here after you remove it

>         union {
>                 __wsum          csum;
> @@ -1088,6 +1087,7 @@ struct sk_buff {
>
>         ); /* end headers group */
>
> +       u16                     alloc_cpu;
>         /* These elements must be at the end, see alloc_skb() for details=
.  */
>         sk_buff_data_t          tail;
>         sk_buff_data_t          end;
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 41beaf625421a..3d82eb87f4582 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -1593,7 +1593,6 @@ static void __copy_skb_header(struct sk_buff *new, =
const struct sk_buff *old)
>  #ifdef CONFIG_NET_RX_BUSY_POLL
>         CHECK_SKB_FIELD(napi_id);
>  #endif
> -       CHECK_SKB_FIELD(alloc_cpu);
>  #ifdef CONFIG_XPS
>         CHECK_SKB_FIELD(sender_cpu);
>  #endif
> @@ -1618,6 +1617,7 @@ static struct sk_buff *__skb_clone(struct sk_buff *=
n, struct sk_buff *skb)
>         C(len);
>         C(data_len);
>         C(mac_len);
> +       C(alloc_cpu);

One minor question: does it affect the following two cases:
1) skb_morph()
2) else branch in skb_clone()

Looking at the above logic, I think as to #2 point it seems the impact
doesn't matter...

And I'm a bit confused reading the allocation process because there
are two possible split allocations for the skb structure itself and
the head/data area. They might run on different cpus, which means it's
hard for 'alloc_cpu" to choose appropriate one to free under this
condition.

Thanks,
Jason

>         n->hdr_len =3D skb->nohdr ? skb_headroom(skb) : skb->hdr_len;
>         n->cloned =3D 1;
>         n->nohdr =3D 0;
> --
> 2.38.1
>
