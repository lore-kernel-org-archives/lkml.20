Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B93CB55C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581231; cv=pass; b=eDGZVPd4y7QW9XiRK9jVj2c+blvTy92t4pjwzQJlfppdqFAhEJx5GP+9g1/CZfNLSB66GdCRUSZ22Uu8zFDS5XpzgiusccgGRAQ6wCJ357ddR8gtSPeAXsrxYYcXOCjPuo5mxkAeROf53Gc+azqBO1o+VeYdddzOA1MWI+ITkR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581231; c=relaxed/simple;
	bh=QvfOev/kNjrTzZlcRux0/BJPGnCOibnkboeSn0C8BYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jho1jtM6NMK8aoYlWQA1JbxgSYIZoQDsJyu0S0lNAtZ1V8FHnco+G5rPi4bVLoS4awNLftvIZm75JS7wzmo5nuIM9mtZKh0ZsiSLz3JimwLRLWChWihW+IZ77LMuVFWny3ROTPg5nnBLnf50g/KSgb93+APVNPyFYzTao9P+3Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ohPkeVS6; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ohPkeVS6"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1438d9363fbso101547c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791581228; cv=none;
        d=google.com; s=arc-20260327;
        b=K2A3G4YpXoprx+PuJgIk3cr95jqpTPBBdpK9QotZiUkvyOoLJ6JezB8e9XXD1YHQJk
         9yHL1ZdsVMc4V5vNI2igtzBRs2Qy1DWVI8mytDC84MvkrpgH5dExCrZte7DBioJWItMg
         wuvj90TCmLL4U4L0FEejHA9SILEH5s0A9lQK9pxJXjKrxrYyf7+3pN57Sw9XKVpVn6L8
         /PkgabkHV0oQrSY+mb0WwIwfSVrtXOgsTkTal2csNvQTdvsyQmeQMoueAAdrlIfz9LGr
         k5yyPiKniBhAQwU7zBf6ms8BaQKKl6Vp050qIB+fvyWuT0ApMeGY2RJZ6OJg5a4uuo/K
         NkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K9rEvNwhZL8B/Lev+DyJhGgCFb2qdLa9TXCpr4AiRWM=;
        fh=WqKKl9OqlSBdzOG8jYhZ26g94kdThXZd1qIiJlB8clM=;
        b=Af7eeBXcg1Y3Ab/NlBhoousR+5WGAsXIxTee2o6Pjq/agXQ814tJ+JjyONdcx2h6Oq
         P/9UgX/64LmsYlKtS1aZJP3KV9l66786dOpr+W7OikJo1kxTu0tZB3geZ5Y5FE8Bl5Vt
         zklRJKQAx/IzR+q2HG0MUw8xqKhaZRohVP8+gdDxU+C9NpcLWLu1VUNS825ahVdmwfOQ
         AKjT7TPQoKYq/4qTLefN0rc6KYbasbF0JBR7bZP57R1uQ9G1UbSFSzeKWGTmwN9Ag/uV
         wKHvojFI5osxXTARZm5Fh28gDN1z1EQTMeBWNymyiqQg+K7HkND0uHrruiRkvm8rMw92
         KP2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791581228; x=1792186028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K9rEvNwhZL8B/Lev+DyJhGgCFb2qdLa9TXCpr4AiRWM=;
        b=ohPkeVS6nHqSHXwvmMp2FW3zabkBY+YXhBguoYsb6H5SB/kzOCFpkDxQZqG7V7s38N
         5WU5fna9s4mUsH4rSsTPlefeoKYW12Pv7PGQgkZ61eOtl0/so56R3b4U/Sfn6SSKue6K
         g5759USyTc6oa0lqigiT/OywMNItd94b+6H8ds6TR1E3XBpTW1FWghpE84wFxqgsl6tR
         viyN5hfb6TUe+ZIEG9D1b/wZL2FhsNpSlaW3AUXnNsAC2lAr8nW36sx8GdLT9ehZOAlU
         dVD8sk54WLjMgXMmVV+K11zPpSo97us29df3BxDxQ/YyPltLFEZu3FLZfs/l8fugOrHY
         sATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581228; x=1792186028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9rEvNwhZL8B/Lev+DyJhGgCFb2qdLa9TXCpr4AiRWM=;
        b=l90ZKLwEFIUnygQ7aPej/Zotdep05wc9fqsyYJ50sV7GjVLkHokyIPJSmFMu2KanQV
         0ark5wafkPNd7MAG2JNiDFsdHAtW2bkA6cqWEip7+/l1YmTIbX35JG3OvMgkUBDzQ1Bo
         LpWqB2pY0j3tuQgwzNagOFfXtF/bafoygmQSjDt9YBKVOa9TXWhdNVmfZgsFMJKwQb8V
         0dWCKrYvQRWHQRHaMZKuXAFr0QHQ8+Dtk6LI/Gv8JH7YIdUv16O75RlyFtCXsrr93h6g
         L08nINMbfFKOyIDDecixGhYX9WhI2WTVip+2VcSf/9sndumu36ihVQ7y0gNr8AU0yhNt
         IZmw==
X-Forwarded-Encrypted: i=1; AKwUvBxl/SC0/jNvRd4sbOuTbUA1nLaNzzUNe2y1fKKaJajVtW+wGhKlh3CjwhT6FGSY2HwzIssGhioE2NmczsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrIybvm8lzEd7I2+OY8ZybidqLTjAMxYIdfE8YmZbnwFSn+uce
	kyZdxXSZH9MY8qTg7GAcT+89Ab5T4nky1O40dYIsGhtZ8d9uQvwbTzo6XWlb7fQM+KTpcvfeyNB
	avEfME8O9VgRv8S1BKJa7IC4SQmTRIPxHOCFv3mJ6
X-Gm-Gg: AYBFou2+Zq/83pOy0IlHSjMUa3agKzoBZ3gdj6/V67GCX97eyeE1SaWyOJw4a1hlGMz
	JuKOzKQQC+6TRbt8G6a2p9tYVHTMr+u6N18l75YcSBioscVG2XCwgTBnglKuUE/+OwetaZH39Rs
	KXQfhlg/ghlxxqm3a3lFU/RMBW3Uvi3cc8prebVn3kfu8MAukyw9PAH19LVMnhZOMhaE2AVxzjU
	mL30G96qp3q467UOEisat5w/RP0y0lcwOGulFhSfR8IAfZCyxPjzECXuTF/kiLrr2AjDT2KyBg0
	1q2N34hUE+zhPY5mTgAmmrZqxoQh8DAoDKvW/tcXeeVwoh7Fp9z23rywtB7bvp9hULLChsSvnli
	YuCMmLmaXBzhQSdz6tJUyFeojTCGJHOoyP2bHvcvBpEA62GAtzL7PLKx+eZB8nTLBhp/vKWWsM5
	bu9jJKnvhsRNQOOBDiXteY7RMS7QRETsb2rL0=
X-Received: by 2002:a05:7022:6ba1:b0:143:f79:f679 with SMTP id
 a92af1059eb24-16a550ac0d8mr5397500c88.1.1791581226784; Fri, 09 Oct 2026
 14:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009091941.5837-1-qiang.zhang@linux.dev>
In-Reply-To: <20261009091941.5837-1-qiang.zhang@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 9 Oct 2026 14:26:55 -0700
X-Gm-Features: AclHuK_J95wJd0bWuoFvKLXCYzd1NhAAgTupAiZXo-_Ua7w7PO5ZgOC0Fqxyfzk
Message-ID: <CAAVpQUAeHP7M07uMweRePtuzPPUo-99dL6jOYUiVf7CSVUxNDQ@mail.gmail.com>
Subject: Re: [PATCH] neighbour: Move the netdev_put() out of RCU callback
To: Zqiang <qiang.zhang@linux.dev>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 2:19=E2=80=AFAM Zqiang <qiang.zhang@linux.dev> wrote=
:
>
> For builts with CONFIG_NET_DEV_REFCNT_TRACKER=3Dy kernels, netdev_put()
> records the caller's stack trace via ref_tracker_free() for debugging
> reference leaks. however, the netdev_put() is within pneigh_destroy()
> RCU callback, this recorded stack is uninformative, it does not reveal
> which code path initiated the deletion.

Have you seen pneigh double-free ?  What motivates this change ?


>
> This commit therefore move netdev_put() from the RCU callback into the
> caller's process context, and replace call_rcu() with kfree_rcu().
>
> Fixes: d539d8fbd8fc ("neighbour: Free pneigh_entry after RCU grace period=
.")

Please elaborate why your change is safe in the commit message
and remove the tag.


> Signed-off-by: Zqiang <qiang.zhang@linux.dev>

nit: full name

> ---
>  net/core/neighbour.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> index 6ed8eb075146..4263689fc415 100644
> --- a/net/core/neighbour.c
> +++ b/net/core/neighbour.c
> @@ -818,14 +818,6 @@ int pneigh_create(struct neigh_table *tbl,
>         return err;
>  }
>
> -static void pneigh_destroy(struct rcu_head *rcu)
> -{
> -       struct pneigh_entry *n =3D container_of(rcu, struct pneigh_entry,=
 rcu);
> -
> -       netdev_put(n->dev, &n->dev_tracker);
> -       kfree(n);
> -}
> -
>  int pneigh_delete(struct neigh_table *tbl, const void *pkey,
>                   struct net_device *dev)
>  {
> @@ -849,7 +841,8 @@ int pneigh_delete(struct neigh_table *tbl, const void=
 *pkey,
>                         if (tbl->pdestructor)
>                                 tbl->pdestructor(n);
>
> -                       call_rcu(&n->rcu, pneigh_destroy);
> +                       netdev_put(n->dev, &n->dev_tracker);
> +                       kfree_rcu(n, rcu);
>                         return 0;
>                 }
>         }
> @@ -891,7 +884,8 @@ static void pneigh_ifdown(struct neigh_table *tbl, st=
ruct net_device *dev,
>                 if (tbl->pdestructor)
>                         tbl->pdestructor(n);
>
> -               call_rcu(&n->rcu, pneigh_destroy);
> +               netdev_put(n->dev, &n->dev_tracker);
> +               kfree_rcu(n, rcu);
>         }
>  }
>
> --
> 2.17.1
>
