Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCD521A42D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468873; cv=pass; b=cl8MdSZt02YC03bnbuok3lruT8ME4SPBBHypS3gPieOvygX8YOpJHOl69sKEz7SRAR55dvtaJ4r3eOt+eWORKCgv3P6XFqjCa6kywFTNC2YFU2mHBbtzj+2yVkyUypGmyllKqgwdSLI/NkSIvKQ4RSuiQMMrYga4LAY6DjwR5O4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468873; c=relaxed/simple;
	bh=n08CimJMEJ5UEVPtxtHuCEJMrXvySiB8v3n8L518G0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gh5tYAFQTM7sv+V7Ud82CZ1Lo9aclD3eB8S9r4gl3FrRg35kyedquEQ0kHbLBM2BIOTNw0SGisJqhe0YfT7yZK4EOo8okASAePaWP3ZwbyDGqS1zYDueAV8uIWbFlU2jJm1MGhW2xV55VVrfHa33lpehVBTjJ77pbWViMeMLoTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CeuPWxYs; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CeuPWxYs"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso10319a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791468870; cv=none;
        d=google.com; s=arc-20260327;
        b=nia/2d3XF0qx5OKR8pvxgmyXSeZO6FRMW4TLFKpGR8RvA4DPFhAVHwwLk0ogEOuREF
         vYOtm5fxfcuDJrrrok7Qqk2MH+e5g3OXg1DGBK1p4s830xm9T771bKjkYXaNmx4wSfyl
         /P21dzM/EYg0+L1vonQ+lQlExOVYCBVi7rjS4p3c9xUshcPDm2BlO8kJvnXAAk8fMZdR
         kCV9j+SXzly6S7ZkfFg33AVsZpmwzwCy6ya9V0C9A3FBfujZ3zJZ8akCZ8XMLMHjb/QW
         Pib6Ih3Kg43WRCqxnhqpWyy7UJ4cFtMNYwICnpRfwKX17FvtmFUevKextkKKJt0iej1R
         qHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3LbNNkCXf2kCL8DlF2FAyZ08jK056pSr7lNZgoiWIQU=;
        fh=fVDdXHnZKwPp9KWl3c6f3UX9HWIBUSR9pfCjQu5r738=;
        b=X+kHinUIvBgS4wJLgNeLQncX5bNk2D2Xw0P2jcMR3FvlikqRazyxk5RL+NLkjWQaT8
         I59WHQeA1MHeUnonA+X08V9klyfpryfUQ852tRpkeLPgFT5TmLgZpnIyW+sRTOuJVNzo
         LOsEngnwZm+n2vI5smGZp8pxIZZUUuk91/icqg/vORc+HggkZCKXgTe0vmEgI7DQ9psQ
         DYhVMffZhTiEQ4mutpQxzJk+oHHxComBgNVpDbHJJ6ai2+2/tZ3KoEanDXD19DG5n1kE
         khw9BVdyzFjGR9a695LU0bLooH1AfYjUrm+cgnaXC2itXgVweZdxgoCWmXi1auJJaSjK
         IDBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791468870; x=1792073670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3LbNNkCXf2kCL8DlF2FAyZ08jK056pSr7lNZgoiWIQU=;
        b=CeuPWxYsp+eRMj68AFUXEgm8Na5s4Yi/Go+/iN46h2mCXMiKusMG3M7kg81zUOWojz
         D8Rkt2m+IGWZyUJZ0UZaQSShV8f58Upd2xXlLra8414MCcK7IHXSYnqsKl6x0Lwicubb
         jDva2v57T81Mb838RmHtj1/FJC8k9+xt9797AyH/ZDaOrfNdByIKGq6V7Yhc+NMZ/Dw9
         sy6O7bYLQ5Xg6CUGc+XyX/zJVl0LcLekN7su4WUhD5faG6+pOfYGm3S00msuzYzDoKtX
         80qe9PD8ulCTapBzMwcnjDA9OFd34S595fxi5T/JFKnd3FUXlgWU28iHm5TjyBYg+ogU
         hK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468870; x=1792073670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LbNNkCXf2kCL8DlF2FAyZ08jK056pSr7lNZgoiWIQU=;
        b=Zo+E6/Gg8CyN+/SYvM0p3NFtbqBmlkiBsO/jwqldn8pYkGQNgo7gusEHvB0kUv8yne
         hfUOCn7zgk+Q/8SeGwquZhntqjmp5GmaT6eFkG1Kb+wPYsYkdWn0gMJPEk+BjTvqoAjq
         jNn4dFuld9a7bzFdvwqlPtIgxDd+O3fkUB1hhnLQzdJi1zy7GZOcgrMAe+9k9sXtlxjX
         cdhtkjENL+Bq8AIK9ehvEfTi5b0TxUZWuAIHuPm4C3aIxy9VqFdKRQMNBh8jfc+oWwdr
         LHlOyEAJMNXA/fMHBFrb0Rz3ByHOKxzJLWDJpdnlhwdjMnaz9XgGtRqTqWjTwOoMvcBL
         1d0w==
X-Forwarded-Encrypted: i=1; AKwUvBxT+O0BGAWJswptkhMys1ZDkRSlK85N1X+zeMFGMynsPue63FLEzcf2egfPQFOL54T+ucWAu1c/LRea/Ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCkCsxhSLdAUsPPdaZ2bOhVwK16AF4ooOv9v4THCthCbD2VLaX
	q2HFJ0VaiDuXzMa2xy/ymWPLqFFUMeYh+NeM1hK+x6webPx9WSIAiMyW/mVFvoDbK9qFbs0Ikx4
	qsNNxbUdutmKGmK2yY54tPGfxUGU9fyVDYZVX8mwo
X-Gm-Gg: AYBFou2JBN0fMrotj/bI0eES0ue/gmB+HmT/wjqoGZ2kkqeVeCWEc4JtR3iWsU/kBrs
	RVgb1OK5hTK8h9B2QdRLUWeGu8kYLlTFEpsrdpRKbdLCqLtYGVbJKA0i+I1+vkaOSHoL2GEsYrr
	eKC/j9DBWPGp25QgLbMoKGfwZPHs0Z/YNjNI3MRte4TI5hVwsVotJsofa+b2j0KWduLCuiLcNRR
	DBnxeHPKPCCpSfgfgBnqd02+bBpLKL7iFDHs9dyRFne1mBCsUVu26LbzF7vrt0QJfxD5CthauDN
	1kGfvoGN5ScnHwPgCl7kTYTmc98I9725M11ocoDJjsoZax6uz4DQaDBsOCPLu8IHP7CqGSw4x3+
	vTEotm8xDE2UB+NlgNCPyWADZYNd9Sp+2mjQQagzPSU955g==
X-Received: by 2002:a05:6402:148e:b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b061630034mr48613a12.9.1791468869959; Thu, 08 Oct 2026
 07:14:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008133252.3750-1-nashuiliang@gmail.com>
In-Reply-To: <20261008133252.3750-1-nashuiliang@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 8 Oct 2026 10:14:07 -0400
X-Gm-Features: AclHuK_MTOq8kFi1WHmb1La130Qi1Si9uyUpIl2JmODzfEJEsh3lw3UrvyZQQhU
Message-ID: <CADVnQy==0Vor90buiY8U+DNYKjxyWRQ94zAq9=aKhyAezsB9Vw@mail.gmail.com>
Subject: Re: [PATCH net-next v10] net: reduce ARFS flow updates by checking
 LLC affinity
To: Chuang Wang <nashuiliang@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Hangbin Liu <liuhangbin@gmail.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:33=E2=80=AFAM Chuang Wang <nashuiliang@gmail.com> =
wrote:
>
...
> --- a/net/core/sysctl_net_core.c
> +++ b/net/core/sysctl_net_core.c
> @@ -560,6 +560,13 @@ static struct ctl_table net_core_table[] =3D {
>                 .mode           =3D 0644,
>                 .proc_handler   =3D rps_sock_flow_sysctl
>         },
> +       {
> +               .procname       =3D "rps_feat_llc_affinity",
> +               .data           =3D &rps_feat_llc_affinity.key,
> +               .maxlen         =3D sizeof(rps_feat_llc_affinity.key),
> +               .mode           =3D 0644,
> +               .proc_handler   =3D proc_do_static_key
> +       },

Having "feat_" in the name of a sysctl seems redundant, since most
sysctls are features.

Also, the name seems overly broad, as it could also apply to other
RPS/RFS mechanisms leveraging LLC affinity, for which we might want
separate sysctl control knobs. I'd suggest perhaps something more
specific, like "rps_llc_affinity_for_set_cpu".

neal
