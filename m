Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2B34A2A53
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475187; cv=pass; b=JTQm51xXQ+lZBJy+ASO4+/R4Wff7h1S0FL+d553WCQmj8IEd+Zi7hg7c8OujUkNQAyTIlLFszQ11xetsCB1CJ5n2mbG0xf6BAnvpDNQnLWoBWC8w4GTfAsnfZ1bRIcOSnxr0bTRfEuSXD//Su87c5IRVnT5fPzjGa0AkcKBDNaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475187; c=relaxed/simple;
	bh=GVPTKUBJIvk1l4BuAnmPBBzuEjUGC3oVeb97GO7vzC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8kq0vi487k3SRX2wKkizkcYOJFtwiapOMJEKTBAMNMRuYdupZW16tB03kQrZ+zVBWl3Om6mNOIKJtfQ0utCVmTqj+8DpSO/Wb/BX2Z3s4m+eiGtXflKAUpm3J0pI0xeR7zkp+y1/RcmFy5j2Hv1R1G16X0zEDax79jyVJvJono=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s3JTceF+; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s3JTceF+"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb769ca02so46565431cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789475184; cv=none;
        d=google.com; s=arc-20260327;
        b=cS+Oq0e2UsRNV5hxhs6zxNonTpcC94Ba+bScKSuckYjDKg+sLQC+IBlJZyNx4Uqmu1
         R/8MxtGCg5kboK/ZAtC1rJStCfBjgS4qGO1meY+p7RXrlc3w45P/Dv+T3qQIL/QgaBNa
         Cpju7i6IBC7UKlkOrSdjxjaeQ9h5ofRA9mU2w3Hx8v3Dg5PChx282LH+jSIHOrwCf7e7
         HmsPQ9+0uy2iC+C0+HBmKK9v288W/wR6q97qj5VMSbw/acA0DMU+RiBsv56lM9rm870K
         KSv4TszbrJbXanam1v6playpWL7JXuBL9uOtVj7dpax6WxD8/9Agj76YDH+37AqFnL/+
         0Tlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iHxIsPyYHVnJ9HCD3Bii8M95ATqaLQRBGYMsVz3U6ZY=;
        fh=nULTfJUDmZPSYypqeRM7NaFbv9ZTG9pGCBHf7VYOBHI=;
        b=Jce7qRsrGb8Y6tgQ11QO70/oJMsOEVQN0VAAyznVSx/6ZYkhEGpOYGpvj2H52eL4t+
         ztq2K+WRnPIgfchNa+bF3uVxGw9HIhS3NKJqVL92IyKGbHY+0JP6DPO6At9whUvEBDte
         k1pK559hbQ5vyCZ0fddTv1pYgbh/wZ0T64PhJKK4D/kdnEnLjMbkNHL/kbo60x/1CiJg
         WEBefgZil6wqtRpBm1ALIF1/FHRXTYqiCiozFLQ9RPqrW+LglTCNGF50t3zGo0SqXsLk
         Qi2wMR+qtd7Np+R8/Mj5zOM172Pm/j3ryQU1uImlBVrOdbUQaWk85Kv2l/pKL3CxKBhb
         rBtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789475184; x=1790079984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHxIsPyYHVnJ9HCD3Bii8M95ATqaLQRBGYMsVz3U6ZY=;
        b=s3JTceF+dOTxmzSjFeIxQIe2NPjGeq6X6eHaya5kGTT8YbyfcK094cdOgyG7C7t7O2
         b5CpQ3bvpegD+VMq6lOHMf1DvyucFFpMLEIMIYAQyskdfKMcVyO6ll/ZlyYLb7HFLlMw
         7kKUYnPEBpdLpFrXYUqonij0UKQZytG0X+wVa/QQLdxOSY3CCAK3jk/AvxK0+Sv5HQaJ
         cNhO2B8cCrP1z3MyDpjxm3jGtVyDFhf/buAGKtsFADg+42q4afxR870sXWnebr7dgekc
         20IoP/kQdqgtTHDb9zdbffHTpwKmY7XHtLwxHvEVDtQqVz6lqmhUX26RM643ErDSQJ0d
         z8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475184; x=1790079984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHxIsPyYHVnJ9HCD3Bii8M95ATqaLQRBGYMsVz3U6ZY=;
        b=WwCBc9dsZEHPTYg/AYHWWQ4dImcRy8e6CLLrQ6oMXUB/bPvvzAtZqwoIF/QheQEGDj
         MkovbOgee6jin5cebyjwSgcRFtHZTxPlL9g73MXBMqecZP15HTunw0FNXYydZQCMfOVo
         J20n05nc9dZ4CpknYftNEzyYXpulV2QbirJ555vCJ9AcA36n6sbz7iNCIjYM0ZRfr7im
         fxlyiyA2GZAlJ6OLoeYc3Y3wlb2gr6Nx1zK2uXG4OMB4lxEEYBBQR/NpVnyAKHFFtESj
         htCdtwTatZ3JTBdnhNyKQvc6nWpaByvMSmA74WyCYysQBMxjYg9WaS4D1Qxfi24Z2OIn
         L1+g==
X-Forwarded-Encrypted: i=1; AKwUvBxONGUuXSoQpk1dVlrWdZj6bHCLRdzVmsFqoAeYthATzUuYGvZPM8flO5Bc2HxstdczTQSEogL3+VRbfT4=@vger.kernel.org
X-Gm-Message-State: AFuF++mVCgVuwWfkSs/ecd/hGPkZYNREqPA8vxCrKnecFJjFIz5LVtuB
	hwy9SnpIcgWGAl6smz/E7AEIb3PzKw99tvoFWdOzSOZuf1XsNX+I0OaCz4ERncf3NvWHRqoEDjl
	q6IWTI6qID8gGe77++9HHmZcjxOWz5rsm3Ue0ZVzb
X-Gm-Gg: AYBFou2+SmGmp8xIZQUTnGs+MFho/+Ren6+Fm3p/ajjJW9xkXhysn1Sjio1RjtWGP15
	91fJhFyu9fk/apPsPmKSK1+LGXBHeRqYhQmg2KQDQveMqKNsiYLlSuHfe3PULHjR/1sryKQm1Ga
	P5edJeYYb/9X3h9reaTVgCUYQOPrdwDQgLk2Lw6gRl3p05/PWK6GUu2vurlcvVNvwmY7UDvMvCI
	Y0ughX3qmnuR8bFCUBDEf2NsV/AgnuBtEbwBPg+7ut6jrhHpyv6n9XkvdFc33jkaMw6asT2xbUp
	qxzl+z40K8LJS6YBp76ZcAhvY4cS5fjw58TXLAQYBJpbz7TZRN11Vcov98j1wAtsT0+12m+5gjv
	vm41J+eZFyk62ao8PKzDTTumj3Qofas058Vt+2T4JEQ6nH+oj/4KeyVCeTjjH2F0P1hg=
X-Received: by 2002:ac8:5a51:0:b0:52d:28f8:578c with SMTP id
 d75a77b69052e-5310d03eba0mr104692391cf.31.1789475183228; Tue, 15 Sep 2026
 05:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915121458.214961-1-xuanqiang.luo@linux.dev>
In-Reply-To: <20260915121458.214961-1-xuanqiang.luo@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 15 Sep 2026 05:26:12 -0700
X-Gm-Features: AcwNN1UvGbNDZe7GoZMDuocIgqX9hSG9J6UJaEzJ1N3_vwf-LgVG-0jfBCbXNEw
Message-ID: <CANn89i+d4ny7K0QV-v+ZY6Kj735tPVrrzd0AzwRqe4vvu5r=aw@mail.gmail.com>
Subject: Re: [PATCH net-next v1] net: gro_cells: move backlog drop handling
 outside the local lock
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dong Chenchen <dongchenchen2@huawei.com>, 
	David Ahern <dsahern@kernel.org>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 5:16=E2=80=AFAM Xuanqiang Luo <xuanqiang.luo@linux.=
dev> wrote:
>
> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
>
> When the GRO cell queue length exceeds max_backlog, gro_cells_receive()
> holds bh_lock while updating the RX drop counter and freeing the rejected
> skb. The skb has not been queued, and the counter is updated with
> this_cpu_inc(), so neither operation requires the queue lock.
>
> Release bh_lock before accounting for and freeing the dropped skb to
> shorten the critical section.

local_lock_nested_bh() is only a real lock on PREEMPT_RT. On other
kernels it is a lockdep assertion, so this patch generates the same
code. And this is the backlog overflow path: by definition we are
already dropping packets there. Shortening this "critical section"
buys nothing measurable, and there is no benchmark in the changelog.

Also, the result is harder to read than what it replaces: a label
named "unlock" that actually drops the skb, falling through into
"drop:", and a backward goto past the return. Three labels for a
20-line function.

If you want to improve gro_cells_receive(), please add drop reasons
instead: SKB_DROP_REASON_DEV_READY for the !IFF_UP case and
SKB_DROP_REASON_CPU_BACKLOG for the overflow one. That actually helps
people tracking down drops.

Thanks.

pw-bot: cr

>
> Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
> ---
>  net/core/gro_cells.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/net/core/gro_cells.c b/net/core/gro_cells.c
> index d8c0a28671201..f46cecd246aab 100644
> --- a/net/core/gro_cells.c
> +++ b/net/core/gro_cells.c
> @@ -14,7 +14,6 @@ struct gro_cell {
>  int gro_cells_receive(struct gro_cells *gcells, struct sk_buff *skb)
>  {
>         struct net_device *dev =3D skb->dev;
> -       bool have_bh_lock =3D false;
>         struct gro_cell *cell;
>         int res;
>
> @@ -26,32 +25,33 @@ int gro_cells_receive(struct gro_cells *gcells, struc=
t sk_buff *skb)
>
>         if (!gcells->cells || skb_cloned(skb) || netif_elide_gro(dev)) {
>                 res =3D netif_rx(skb);
> -               goto unlock;
> +               goto out_rcu;
>         }
>
>         local_lock_nested_bh(&gcells->cells->bh_lock);
> -       have_bh_lock =3D true;
>         cell =3D this_cpu_ptr(gcells->cells);
>
> -       if (skb_queue_len(&cell->napi_skbs) > READ_ONCE(net_hotdata.max_b=
acklog)) {
> -drop:
> -               dev_core_stats_rx_dropped_inc(dev);
> -               kfree_skb(skb);
> -               res =3D NET_RX_DROP;
> +       if (skb_queue_len(&cell->napi_skbs) > READ_ONCE(net_hotdata.max_b=
acklog))
>                 goto unlock;
> -       }
>
>         __skb_queue_tail(&cell->napi_skbs, skb);
>         if (skb_queue_len(&cell->napi_skbs) =3D=3D 1)
>                 napi_schedule(&cell->napi);
>
> +       local_unlock_nested_bh(&gcells->cells->bh_lock);
>         res =3D NET_RX_SUCCESS;
>
> -unlock:
> -       if (have_bh_lock)
> -               local_unlock_nested_bh(&gcells->cells->bh_lock);
> +out_rcu:
>         rcu_read_unlock();
>         return res;
> +
> +unlock:
> +       local_unlock_nested_bh(&gcells->cells->bh_lock);
> +drop:
> +       dev_core_stats_rx_dropped_inc(dev);
> +       kfree_skb(skb);
> +       res =3D NET_RX_DROP;
> +       goto out_rcu;
>  }
>  EXPORT_SYMBOL(gro_cells_receive);
>
>
> base-commit: 1142eb185b05db61a78130890fc4ed268f4cb4e6
> --
> 2.43.0
>
