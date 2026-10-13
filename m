Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA93A783F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791856116; cv=pass; b=nL51K8yQT7+FipKN6LregjVzL64Yx0Lw3n854iH9HEkdfWzN/U1cDIQUhrsaMuTpidaK5ydkKe3qkgR1BTnfi6P75xnR9ymvX3kWuT3lW3dhbHuq5JWYhzrptkK44/69QPOaFnSwuf2pYEqiy4Ib5CkhWfg3lF1KVDsodxa6fJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791856116; c=relaxed/simple;
	bh=4IHJ1f+F6bVSBaQKkLY11km9Ol9pfEn82bJjAdkF4dY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIEi+8JWJVKUdkdX7D1aM1/CHW16XHERMoMFgTt+I7gORXVJkW93wVAKF5m7DfzrMCxSTZ5VpYNZikQzSGz3JXj5vVrgSlXekWtvySeX8t+gMqy10gIOqvbAEz+JP6ssipuClIwj9lbJemmEgylM0RGR/Fp59PYrdTY5F6jg0pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MvM89sZJ; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MvM89sZJ"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-16079d54c17so2933923c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791856114; cv=none;
        d=google.com; s=arc-20260327;
        b=Mx2ktVLjB2hyy7UsrwRfqjRE0wFv3fnpeRZxz6o0z5lX0+RS5KsypoMaBNWau0ZHfI
         MCfMD1CnEyYn3zkJ7hIJVas3uHtDr28xTLK8mMAKvkkyWBrdaKpNGmysjHTQ49Ob+BSR
         GPyH9KdfbQGyywWUt2vB7b0kQe4xDO6MPAVQRtap1BFG9yw7LJOUNPTJgT8nyWh9KcT2
         LcYql5bAARBaqida9rUJnERZShx/DzS1EJ1rMwT9vH18vIYLAmTYElyrqsa0l4dhevtw
         adNh1aZ8Y3yep3EcgxjT/9ZBN61AASfIO5oLqUaPiPtbG/glWEQKa3hzP/ThFIbY+U+i
         5EiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WwlGR1wR036AjYZy2y39FgAVhGwuJlmWocX1B+EQ2FQ=;
        fh=7eHGmPw7pEep8GoSN6xjhtnXIhLF3yQIDDSJwJ32cag=;
        b=AX8fdy06lio1Cl8tG7eniOWOl8jR3Pkn5XbCSHIn60jPZxyrjDMp0l2DHLnJRFhAgw
         eCHCT7k8XmX/p0X2SKrLwTzFLemgP00bplffUdm1utn7jsUh+xGWhIAyvUCjI9P8dUGH
         nAc/MLcI0GcZ3qXyfpVhAYWRbeXmRd491AdlbDXqbo797hCYSRF22VyiOpJSmm+j2EtO
         FW4x0A0ToP7F+z5JguHAe39SNBMGlmulDhygZ2k9iGP8zCkd0EpnWV86Bmvh/+ODO34N
         WWipDk/rdFNpM7+n2nQueKFCg0Yez4Gs95QcJZs7K1/bnE4CLcz9of1VtUTQsKHLXU+U
         OLDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791856114; x=1792460914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WwlGR1wR036AjYZy2y39FgAVhGwuJlmWocX1B+EQ2FQ=;
        b=MvM89sZJa6BPwTI0BYetYfOTERIGMOEFZq5Xcx0Fz7tOOex+/ita6aS327I5mKXZtx
         jI7fmaGLy7oL341IW+cGbY4eeZkFCccdw+n6FJZByD/JZ7PJ2XCxu2IUAY3R7V+idBLS
         EOLWid+ZBgbovTR59jtrcnGyUyMVB02zZrJyk/mnveMPSoQtcfXYOK/WJmmmJfEpXZX4
         Sd0TbeK8qJB9oCQgwcQiXNwwuOAkvd/ukTpDl/Gy6Xz5I9GVU6zorUZxxU0l9L1ZZ7qN
         O39+DMFUD9jgtAoYCGB+4RGTeiODIw+17r9ZC2LlQt+/9b9bvjMvcFzGTB2mjShXNjAo
         503Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791856114; x=1792460914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwlGR1wR036AjYZy2y39FgAVhGwuJlmWocX1B+EQ2FQ=;
        b=OcSypd3s8e4IUiTyqCF4JA7T2U4i6oqsk2FDntYBaCFA37gIdJfUhrgnGWzqUJuZsG
         G9xtNkYlWeMlwFR84Hc7iXloAVxJ1y8H2fl06anjnzx61eu+jkgTy2kmVPUUbWrnZJJI
         rN/BaLJ7EViEngPno0lZe+BJLSggx/N6SMwgduSIPTiOSlxyA/tN4PHFZclLSJIKGSjK
         CC7HEY7qxp1rrp0UzqR8jGZUPWLJdULP3esQmdwiXIkwCyF/n8HEMPmocGGNZS0S08jX
         4yJJ27gIfZ2Aj5CuPvgNahBnI48s3JtLDrWKAYP8v+Xbq8sWHSH1W0F2b/Ph69Af/KMm
         eisA==
X-Forwarded-Encrypted: i=1; AKwUvBw4jmZIFrK8B4PtQDGXTYd3X4a9KdSA72Y8ULvUjJ+KVpcTErqD2ruxatHO8RRMcJgwpixRCD0gQ4/pLhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/GaMfvWEKYMKG4eGeqfyxa7+2f2awl9Z7/u52PWIBIXc5Ve5H
	H4yML6ymykkgII1tDEpuNQ2q/7pU6BGvYDKFXnf8Mrl0fvminrLRtgmLBOWZRbGoQ9H3+9OnVgX
	GWC84CKxvNZekebDB+trN9Flz+tWWE2Jz98SYegQN
X-Gm-Gg: AYBFou3bI1k1qML7ilb9fcjsOuu2I3Mt6XShXAsqD2+tx2uk+k6NG9mDLTK1OggO4gE
	0yNoU/cINZ3T6tRIV1nEaOpUJRGedwCJXbCNOyLt9FG4beVfcWQ+zoawL6ps0j0pkI9ppOdlBK7
	EyQ/jKFzcrPlTeCSsfwFbusIaShOb8mmuL1MXSaIV54AVhQf35iz+t40/SxyBysgu0RCtHqzKlI
	S+XQ1s0dQaB7fHHxSndAd03gCvxl8GwRd+pLmVIFfn6LRzzi5oFZ7jLsfjO+k8FiAoTj2xLa/bA
	qWWxzmKAyBOSw5y9dKKZIrVQGoFN6/zx7fJCYeTSOYiUunV93RorBP/F8dh4wzVeYdqii9SRKqz
	W7sSDZ7EwTg8ioEliZncT6aMc3CuFKXY+AJXF4bUH7YK03ev3npTnYRSkbFUFVLz5ZwR6LCaaqy
	ktpwRtCDXGmtHjDDSRH8t6RgyqTCr7Ss9A5Amx
X-Received: by 2002:a05:701b:2605:b0:13e:5a50:1e17 with SMTP id
 a92af1059eb24-16a55487e53mr17102214c88.3.1791856113584; Mon, 12 Oct 2026
 18:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008124423.11543-1-parri.andrea@gmail.com>
In-Reply-To: <20261008124423.11543-1-parri.andrea@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 12 Oct 2026 18:48:22 -0700
X-Gm-Features: AclHuK-7HoCf50g6EjGDuv8XPNEzQqvRnf7ogcg-czX0LK7BftACZiwFnu503kM
Message-ID: <CAAVpQUAd4QzUDK1wZYpuHJbMSg+PwAGCcaTzayR40DTNkXdwQA@mail.gmail.com>
Subject: Re: [PATCH net-next] rtnetlink: comment the RCU and SRCU waits in
 unregister paths
To: Andrea Parri <parri.andrea@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 5:44=E2=80=AFAM Andrea Parri <parri.andrea@gmail.com=
> wrote:
>
> rtnl_link_unregister(), rtnl_af_unregister() and rtnl_unregister_all()
> wait for readers before tearing down what those readers use, but most
> of these waits do not say which readers they are waiting for.
>
> A missing wait is then easy to overlook: rtnl_link_unregister() lacked
> its synchronize_rcu() until commit 3b70edea393d ("rtnetlink: wait for
> RCU readers in rtnl_link_unregister()"). Add a comment to each wait
> that lacks one, naming the readers it waits for.
>
> Suggested-by: Eric Dumazet <edumazet@kernel.org>
> Link: https://lore.kernel.org/CAL4WiioFMQN4troVjQjCmE6Z9kwwb95SnoEupjD=3D=
PPSK6Q5f6w@mail.gmail.com
> Assisted-by: LLM
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> ---
>  net/core/rtnetlink.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
> index 15bffafbf0a9c..80f8577816760 100644
> --- a/net/core/rtnetlink.c
> +++ b/net/core/rtnetlink.c
> @@ -526,6 +526,9 @@ void rtnl_unregister_all(int protocol)
>         }
>         rtnl_unlock();
>
> +       /* Wait for rtnl_get_link() callers under RCU that may still
> +        * dereference tab.
> +        */
>         synchronize_net();

More specifically, this only applies to callers before try_module_get().

>
>         kfree(tab);
> @@ -711,6 +714,7 @@ void rtnl_link_unregister(struct rtnl_link_ops *ops)
>          * not yet taken ops->srcu.
>          */
>         synchronize_rcu();
> +       /* Wait for rtnl_link_ops_get() callers to call rtnl_link_ops_put=
(). */
>         synchronize_srcu(&ops->srcu);

I think we don't need comment for srcu as the relation is
clear via the argument.

>         cleanup_srcu_struct(&ops->srcu);
>
> @@ -843,7 +847,11 @@ void rtnl_af_unregister(struct rtnl_af_ops *ops)
>         list_del_rcu(&ops->list);
>         spin_unlock(&rtnl_af_ops_lock);
>
> +       /* Wait for RCU walkers of rtnl_af_ops, including rtnl_af_lookup(=
)
> +        * readers that found ops but have not yet taken ops->srcu.
> +        */

this can be simply /* see rtnl_link_unregister() */ instead of duplicating
comments.

>         synchronize_rcu();
> +       /* Wait for rtnl_af_lookup() callers to call rtnl_af_put(). */

ditto.

>         synchronize_srcu(&ops->srcu);
>         cleanup_srcu_struct(&ops->srcu);
>  }
> --
> 2.53.0
>
