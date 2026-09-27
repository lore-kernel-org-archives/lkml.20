Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553353BBFBF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512093; cv=pass; b=RWrQ0Psnaxcv+OzpFxnx3a/KYmHeiwDlNYTaflAnaEqcZihavy2Ab13zA5AUuvcsIz8Whiu7olO6xoy4xUE8ZX6K9X1nQ6UjaDCNkZ4yz99UnFlwftIfkRjSN5ZhQJjVpH/VTP+HQpcuE9nEc93JQge3OM5tnC/OSLInGDiuE0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512093; c=relaxed/simple;
	bh=aZ8d2LKjoUbC3Vb82drSDlRzbG1SJVf7W9U8iAuF1kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7TN8hy0nvi0Vt8mT6XbmKwSGMhEQmhAr+OJ7AISJWcHcAILjk36zeDzEMMaHY0Mc5sSyat5WYE9Z3qf763pzmMP8DgDt5oroQlF0+1eMu4DioIr16NBdayV2V+oCN6JwvNb9FX2syV0HIC9xSYXxVrnVDu41/tnHKsClvykEPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbYbyO4z; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbYbyO4z"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaf2ab41bbso194382a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790512090; cv=none;
        d=google.com; s=arc-20260327;
        b=Zq8cNsK2vjP6NePlnNAW8lq/xOpRLGsQzk322Wz843HCXGj/KIzCdqNDNth4nbNk9H
         f3jM9BGG8SRioRx6i2UOZH7eU+gfmEcxGwGBF40DYYsaK7V8K5uVib5ge+iK2Y4NoBEp
         BGj9JjkhcTuN4IV6G/VrB+FqUd8dMfs63KuYb7QlS/tiuTOPmccSNX7nb5jkjXMKZAJk
         VKEDi/qypEH7je45n7Hi/krMzwUtyPgBS+vp1eQkxqgzUOcRcrZQnyjPUMCXRyCg1qc2
         5eLdEDcBXxIpx2UF+GEcWqf1bJq8/vjh5U5uRvAWufCIYZdlHur+TOrlsDeKgXpnp7Ff
         CaFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DcickMSZi9tlx6KRNzjylAz8LM/Bp4ZoL8EqqOqvY5M=;
        fh=pbs+9wOsvL8ZtGt7g4vewwV7Wxd6YtTxjN9JE7MT1d8=;
        b=p1d/SZTe1hL6fURBf7tZrD7Mr+c4eODy+jePbYsUCV4TxR35km8sZK+TNM4tx4/SAK
         X8sA0mKWb35p+KSkejj2rjeNCkyPUTQgPHO2OkcWVBTt0/veZs7j4HSH/IefdUHDQJB9
         KgioKR7ntRJNITUQfwcrytdXqRrDbRL4iSc7bPibmFYCCLeZRnzi/O+mT4zfR4+iYXfY
         kWd/xKXg105GtOAIgZhph6k/oZBum1RYa4moVwyw2JPpZxikYVwWNBRg0OQ3HwU5zAin
         M3ydlNvbwSmLCdKN7DOjpBC6JRhAoHZ/qYZKZSbKBfC6SsqFry2Q3RYH3SxAQ+Bt8eHN
         O0bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790512090; x=1791116890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcickMSZi9tlx6KRNzjylAz8LM/Bp4ZoL8EqqOqvY5M=;
        b=BbYbyO4zlw/+BTGHKQQEDaUnBXdhSKiFufGWhPQGalR09kCBhBbY3TriGkr0pmOPrK
         jpGVWj64dFgd6IeyioCjgoYlt4oiyO/Ssndsll9WXCAlvbDhXMBI8vdgbFBqJovO7WCA
         +KZODJN05DMQo10vbauLBRol7+r5GNHXNest5rdg2R0F4A2AwRJCcHryUJj+He8lO+IU
         g8QdEeWWXP0hE0M3dChuXjzTD/A8KgqXgkWjwaISNGFF4vVrtnHi3/w2Tmr2bHAYdohw
         teHxsEa0D9jkXnrOrApMXadeMUhIxJkyu+OIsIZybxFmKfnuPvkdIE5BjOWqggfLJdhu
         a8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790512090; x=1791116890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcickMSZi9tlx6KRNzjylAz8LM/Bp4ZoL8EqqOqvY5M=;
        b=Yq6w6+zBiBGJEnU1tLSp/cMkqgqHTUnF4FHK+CTlu9mbX9eW5Vq5UiKQ+BoZgHvLWb
         Lamhdl4/40FFkb1WrVG3qOWFILBV4OMmcDsFYidYfeXlO+kZBlAmITz7LFM2om9I9BOX
         LV3OX7S/Bz6+7Q0MClDM958Yzg3wnCr/Zq8zLGGirZp0EqYHOIAvDElSko5RtHplH+1g
         zMqLfuL+bjz+lkZQerCsFXiT8aa+03HCxCUXM/t5xEXZ1tIIEt8Fd7cImWpudrZq9dSJ
         ciQihMfxOQELZAoy6HvtyOK0Na8uaU8IMbDFvVntEwGtDoj8iuT5vIYlE1iPNMoq8aT7
         KOnw==
X-Forwarded-Encrypted: i=1; AKwUvByJoiqFVFm/829cBNUCxZsHMgnDZwglvdQ9zBMbHswEjZ+4G+CK0X3se105UpngTLBplQq9Bxka/swG/dI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4abB0MEL1Bjxa3XMLi36o7ZuQMw2uKUQ13JpemCYTJBk+vVPy
	V3C3WA+yMRJefiWb9W+ixfaL0gnxU/0wrKQxq6aO56xhmy1xu06xpZz/1xVz+llLF1bJtuSMyfs
	TKWCz+VF87ZnqVTjKOCEls1HD5Nudp+M=
X-Gm-Gg: AYBFou0HdK0HBh3Amf3Y0xdPAO0janpq5/8346rCs73+7YQg+7vDdHDAdcDMlszKK0b
	U64ZV8Vcxjkt92aayEuPM6Plfy65yLqkNow4TiPVK72RT6vS/i3+c2KMyJfLe1FHRn9ufQfcN2H
	TZbYkR81uiQCZUg49ts9LrUCm0WUnG9OIsVHFaiQH7iSBGrjlx6E0yknba2am+T67fY1+b6kMgd
	AbEmGsNs13aE7M9MVlJEGoN8g1YWb2IdYPGTUa7BYjzElDh6kC5w6e87kt83iJeTIp/wDuo8EZ1
	1UJ7PsIE7ITNTizjvm+AjCkJkqV8mxT8dyaTU2W9YCqveUaplCravajtyGdgjAu51hYca9J5ytP
	YS+mhJ44kAQM=
X-Received: by 2002:a05:6402:84c:b0:6aa:a78a:6a05 with SMTP id
 4fb4d7f45d1cf-6aae1a75d8amr6810931a12.0.1790512090262; Sun, 27 Sep 2026
 05:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731151426.3194039-1-nicoyip.dev@gmail.com>
In-Reply-To: <20260731151426.3194039-1-nicoyip.dev@gmail.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Sun, 27 Sep 2026 20:27:59 +0800
X-Gm-Features: AclHuK_N5TNcjl4ycZyFw4hCS9apkoJ8loGQgOYKm-VCZRyzq2zwxDrXoe9gA5U
Message-ID: <CAAo+4rWo3Ok=7Qu__Hfc9JsFHNNy7vCU8KL7QX8nMbkAt20Nng@mail.gmail.com>
Subject: Re: [PATCH net] rxrpc: Prevent poking connections after final put
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-afs@lists.infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 11:14=E2=80=AFPM Chengfeng Ye <nicoyip.dev@gmail.co=
m> wrote:
>
> rxrpc_poke_conn() unconditionally gets a reference before adding a
> connection to conn_attend_q.  This is unsafe for the connection timer
> because timer deletion cannot stop a callback that has already started.
>
> The following interleaving can occur:
>
>   I/O thread                         Timer softirq
>   rxrpc_put_connection()
>     refcount reaches zero
>                                      rxrpc_connection_timer()
>                                        rxrpc_poke_conn()
>                                          rxrpc_get_connection()
>                                            increment from zero
>                                          list_add_tail()
>     timer_delete()
>     rxrpc_clean_up_connection()
>       timer_delete_sync()
>       call_rcu()
>
> The refcount increment saturates instead of resurrecting the connection,
> so cleanup continues after the timer callback exits.  The RCU callback ca=
n
> then free the connection while attend_link remains queued, and the I/O
> thread later accesses the stale queue entry.
>
> The kernel reported:
>
>   refcount_t: addition on 0; use-after-free.
>   WARNING: lib/refcount.c:25 at refcount_warn_saturate+0xc0/0xe0
>   Call Trace:
>    <IRQ>
>    rxrpc_get_connection+0x185/0x1d0
>    rxrpc_poke_conn+0x12e/0x2b0
>    call_timer_fn+0x2b/0x220
>    __run_timers+0x561/0x8d0
>    run_timer_softirq+0x144/0x250
>    handle_softirqs+0x18d/0x5b0
>    </IRQ>
>    <TASK>
>    rxrpc_put_connection+0x2fe/0x3f0
>    rxrpc_discard_expired_client_conns+0x396/0x670
>    rxrpc_io_thread+0xbfc/0x1640
>    </TASK>
>
> Use rxrpc_get_connection_maybe() while holding the attend queue lock and
> only enqueue the connection if a live reference was acquired.  The normal
> path for a live connection is unchanged.
>
> Fixes: 4241a702e0d0 ("rxrpc: Fix the rxrpc_connection attend queue handli=
ng")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> ---
>  net/rxrpc/conn_object.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/net/rxrpc/conn_object.c b/net/rxrpc/conn_object.c
> index 0ece717db0f8..3f4516115d37 100644
> --- a/net/rxrpc/conn_object.c
> +++ b/net/rxrpc/conn_object.c
> @@ -33,10 +33,8 @@ void rxrpc_poke_conn(struct rxrpc_connection *conn, en=
um rxrpc_conn_trace why)
>
>         spin_lock_irq(&local->lock);
>         busy =3D !list_empty(&conn->attend_link);
> -       if (!busy) {
> -               rxrpc_get_connection(conn, why);
> +       if (!busy && rxrpc_get_connection_maybe(conn, why))
>                 list_add_tail(&conn->attend_link, &local->conn_attend_q);
> -       }
>         spin_unlock_irq(&local->lock);
>         rxrpc_wake_up_io_thread(local);
>  }
> --
> 2.43.0
>

Hi David,

I noticed that an equivalent patch from Seungwon Bae, =E2=80=9Crxrpc: fix
use-after-free in rxrpc_poke_conn()=E2=80=9D, was included in your fixes
series:

https://lore.kernel.org/r/20260923133706.1496540-18-dhowells@redhat.com/

It appears to address the same race using
rxrpc_get_connection_maybe(). Since I reported this race and submitted
an equivalent fix on July 31, I would appreciate it if there could be
a Reported-by tag, or Co-developed-by tag for me.

Thanks.
Chengfeng
