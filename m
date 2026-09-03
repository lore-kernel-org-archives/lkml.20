Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22515364052
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430920; cv=pass; b=YwQ+qXaTZXgyl3qxdVO66A299+p4GWjLlbXee+vJTyLQjXrx8XLzxuVaQ1G6nKW8l5q7h2dLm72ok5/Ss0ARr7qwno5sZBS2MVLEvhmGEskHJBK2jZEygThPwPCNOgVDZfoOGhAhAUIXrEuklPjC9843MLTHqgsqm3OygQlA1OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430920; c=relaxed/simple;
	bh=P4+9tq4vAAjVPRHdvKBfHH7h2AESuICOL0EhPXygHGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kulMTlkpI3ubGKd6aJmbu+/biAlw+tkoBLemNBfTqz1ge+j8DX+i8N3K9+L8L3FTi1368c8sq045c/PQFCksClHNX8a5iN8uvpSlruIhCOWR9kdjYJSnn1aBRY+0IgjBzVj2qFiLKDo1dpOS1kIA8RzrEOns9PZsMCN5G+YxSCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ulyfsPV3; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ulyfsPV3"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-530187593e0so12467761cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788430918; cv=none;
        d=google.com; s=arc-20260327;
        b=eSg3yIWgtN13Np/SP1Mle72YjZgnY9lQtLqa5uiFD6hi0xpsAUd3KB4HYoXZmSAu0a
         aTL7YdhuNCRNsPIUy3DfVajRyjFy60vx8TFQr1JXi0rgx6JKBc9OmotcBegy1FiypMxZ
         nqlluOnpMBXTpx2byr1GQrSFOndx52bNCJWu2F7FTLmdf1QsO7MGYTVlXQRwMQIZc+H6
         j5R63tStP2SWAF9YW+6x+aisCfhc21qMvNEs1IrfmY1+PqcharZx/f0BoG2tljrlm86g
         Mz+MOJHsa5DnPKj3JnFqk80QX5hQSZzqotIZ4cqAiymkc6JVIPdJBrSTI9CBUCEi/Set
         6RTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P4+9tq4vAAjVPRHdvKBfHH7h2AESuICOL0EhPXygHGE=;
        fh=duCsuO8njpMI0nTCr8rpSZ3HQzcb7L9th8ifFDaZNp8=;
        b=sAaJpA/a5AoedHSnb3vS5RsHa8hGsqZ+iKdf5FGnX4QrjeQGANavEWw63CkYpWmpW3
         W9tzRJMqLmLwDXJKOj+2TuPleARxOFqRgnwUEy6gL8DN+IPj7qwcQqDhoUhF9+qWztkN
         gS0k1NAEfztTj+dJ1duy+SNUOWKOMZnKAdsq1IHRJozc/1tW75xuFGLvxzDiGX9vYHGy
         7eRZBZ4VPwuP7m7UA/SkGwmwBnx33/OvPrCYVXCLahauK9ehq3my12unbYFdL3AfpqTY
         Pibq8IE6flDFZKORndsQhW0suH5ndvpD6UY/Za6uUTUIltnOlbqkZIEixJB5Q1VUYbEO
         dAbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788430918; x=1789035718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P4+9tq4vAAjVPRHdvKBfHH7h2AESuICOL0EhPXygHGE=;
        b=ulyfsPV3w1UNrdg0uBAfp5j1RJMh3ZmWDgpfBF1v3h+Nd/jRwefVdGOWPt4oEYmdxM
         EwpKZ5W31aBHdncElFkMuDxp+7K8jiPW7def32iIiM4a7w/3Rlj+/xFj329rQ9OaHcfG
         HM+pGFuVMegaF7GrbnANXoSkiAvKF9uX9+hK2Soc8MxMyZWRQZloFfPRj+uZqtUvO9bE
         p3HT7KSppMxr6MXOk3KWReTS2g0WYOLJ8a/LrIkwZyIhF1Q+eo9QL2mrUySoRwjkb12Z
         niTg7FGcBXNAvcD4mww9UDevR6sg+lGhQm/pI74ZNUj5FUNvufyHe2UJ6lnqTKI+EEZY
         g9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430918; x=1789035718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4+9tq4vAAjVPRHdvKBfHH7h2AESuICOL0EhPXygHGE=;
        b=Oqy9wMfS67hitycRJu8R8yso8WdP9tOz2WYYgb5oXfT288t+lXPLuj/S42F4UcEf57
         1TTTGjO8LjPjEEzDY+E2p1/Ly3VZNdzPccKf1qsEgpI9g+tjWZPxR4qFlYIDG2UoMsF+
         uDNaFyY3TmMrqx5hLJrMpICHevU/zS0BimkuABTURZSVYfoLlCyPT17F3lYlYlQdOGU4
         uWC1lnN8Md0r6qvWvTVOiasAHYvtnZ7pnNrvCU+jw75Bh2CQDipS/KgOE6XGtGTxEMcM
         g9iNvDv8FlHn58riIuBJGkxkCi4oGX6i/qURdssNdUloR1D93qCfdGLtVY1HokJpvdGN
         iiUg==
X-Forwarded-Encrypted: i=1; AKwUvByMBBbzO7MWrf0QdWjgMoWJLnqh7Q38OjJaxm6XwbZTT4iqTMfjOV+JxzhKJl4Lu+jAtQGRO0H0XK8BfR4=@vger.kernel.org
X-Gm-Message-State: AFuF++nkQcjSYlz/H6TgFw/qdg5e8tPhdwyAM2jOilOgG8IsJvzyqVxr
	IVeclQAozbN1GisH8o0fgD9LLV90NP+PSepJy5AHUj9cNDgAcCzAoH+v3YvuSadPRd/qCyZbg2D
	xfJTaZHcuKs2WhIhnJgd5gPHNYmnapuFC/qNPotba
X-Gm-Gg: AYBFou3SMzzR2cOhKr6XE4kQXIOCFNO9gFSBlAdiRkZEbbp8RyFMXi2T+/3ZEE1unaK
	Im1bvMTMykIaCqXMhqQgdlAOV56JPINw7RoHqetAEK15lNIr6LZ009n1am5nFQxOE2gLFoke4dS
	CwZqoMOYj4NTSCVROPFJ3ZUF6h6xk9OW6zIEd2mnlak9vqZaaWsf4VnJ/pBT4GLe4j+wdTr7n9S
	rE20kcsmOFfMryyE27gGyACQPC2dJNN8QZh0TAAF08YJDkO/3Cx2a8UGvHu7lyaQP7TZSxNdz1o
	HCGxgzZHEfIx5tUp8KknZjeZT4Yun1/Uva8Iez01zdWOpu1/r7/lnbRa+sFBgzEz9Yc8m9OWdWj
	fbsBERKs9KBatLRcCdNH0zX1XkRFGhIdN6LjVSyHOARxv/8WADyEs/xKfeg==
X-Received: by 2002:a05:622a:50a:b0:530:42e5:f39d with SMTP id
 d75a77b69052e-530480b1408mr19378771cf.25.1788430917133; Thu, 03 Sep 2026
 03:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903101256.8879-1-zhangcoder@yeah.net>
In-Reply-To: <20260903101256.8879-1-zhangcoder@yeah.net>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 3 Sep 2026 12:21:45 +0200
X-Gm-Features: AcwNN1UaxWHjBGorfpe-qoeZHxV6U5nAMpcdRNcRwFemhMVTs0uB5zgu4XYySUY
Message-ID: <CANn89i+LS8aefxHe7MvV7DZ7kSWrLPQpfB-OHa76O_jm8_fbYA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] tcp: fix mdev comment in tcp_rtt_estimator()
To: Ziran Zhang <zhangcoder@yeah.net>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:13=E2=80=AFPM Ziran Zhang <zhangcoder@yeah.net> w=
rote:
>
> The old comment "mdev =3D 3/4 mdev + 1/4 new" only describes the
> common case. However, when RTT decreases and |rtt - srtt| > mdev/4,
> the code applies a finer gain of 1/32 instead of 1/4, resulting in:
> mdev =3D 31/32 mdev + 1/32 * new.
>
> Express both cases with a unified formula using variable
> gain g.
>
> Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>

We asked you to leave this comment as it is. Thank you.

pw-bot: rejected
