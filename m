Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0511B33DEF7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306601; cv=pass; b=dMEBx6WVWfECN9JY0pSXydyjYHHdB15Ur6HhgRWuiMh7JxuCEXoGcAlEwrMoM8LsERreolQJQK8yRvHXxt9lFCZJjxcceTPmKiB/lzw3XutFvTg0fpnFuXPD/aDKh6+ZIUBExxjO5F3aLU/l57OIqaTOTjSe285w9UqPH6zt+XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306601; c=relaxed/simple;
	bh=dPJzEanQqyrmBG/zbi+dCASFIgPH8fUESOEkGB/bC1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVwvZjfgdiciImB1A481Jy4WAVqrHO7Yryl9gejxZUKCya1/bwK+sjIKqy7795ZVX2S1T3otdt+MHTwGwI288viXtxHOExeFChljpCItIGTe3BlGGa14DfQPIGZT4YQWfnkqpNjQqgZzWMoaBHFWDFuKPPm64qamKOcGr2OlP3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IGJQI6YR; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IGJQI6YR"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso462059a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788306599; cv=none;
        d=google.com; s=arc-20260327;
        b=EXfMdjZsLrsEIgraDaHcgdiCgtLgGnTiPHxToq/jsTubTyLLPrHbSjWjDG1ZmarLVD
         d8hlK+MHjWrgIRU00hq/Gs7IQHmQiIraOUX6fiEnaEJzZJvUBR4i9KBrGZx2PJ998ODB
         y/NrIwXqpae8DQE+eqi/yLgTt1EQl+RPf7t2YpO8L32cTBEjZSzTxz+YrxaIV6coZuwf
         V3aEsN4PAmon/s8tQAj4hKliF4qirulh8TYmZEzsLJrqHdAse8ZoGRjg484BQjD4Esdt
         gVUqt3kmJDmqKC1cIPuUxItktoClZThTey92xvTgX2RWVxkmXmM+lGSzk+gOcBaQwiZ6
         VFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGL0K+rHEhP7FLLFplrMez/ZNMi42ddY2XdwsA06r4Q=;
        fh=KHZgvgjCQVzRqgpUpuX9e2GZ0ixgrV4eF7QXPCWGnDc=;
        b=llPF+BKMVIYbJ4OLVZuNAtURWjnp4iUpgrVLGvV5oTRLg1/XuXUUaxgC35axDaBXcE
         CiarMNW53KhetE/xBAceBgtTXriaaaFKcDuDXtDsyhGKDnmV9plXhIpRMZ5TBnwcCCm+
         K4hJhZSg7W5yMw9uEo4yIowwaM0+ZBx6x6BPL42CFI1hx0fGf5759ko8CDs83GRTqntE
         kkcraNlCsLosUYB6U1MadyivbLJmXQ0h1vhavNuQoHJx7jHLP/jN1/G/WJcmSd/CMKkb
         3xjRKJqYhW2JM9nQiRYCFZdcTC4Hzq0vs139sGPABmiuVVXZM6KWT6pGVQs451tOgD8J
         FAJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788306599; x=1788911399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGL0K+rHEhP7FLLFplrMez/ZNMi42ddY2XdwsA06r4Q=;
        b=IGJQI6YRlQy/pKXfvM/g+PUGBxuhUPekFm45GWo1CqsfcWqPF6g9zvqPh172D7S2IE
         ke2C+9H06aISVT5w5F9Q6HoOLwZNPQEMmTon2Oj87wBkmoOr2qyMMomAXBuqZek6WC+l
         onDLXhscb0CU+QmDUifq/dJQu7m4LRCn9aFb7qgzYSIhR5m3akfTO1Zo1Mpi/RlC10dS
         /6I5Hf92tAEh8G5oTMS//Q7xPvOBIRAbszV7GLudJBCoigIpbD2yodX+V3y0/x6vdgcR
         S+Vkl1ljW+lVaADe7yF6RJui5UGECs6W5S4IfrQiHoXPGO8mRMk8X96zfxlG50hng7Qb
         3utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788306599; x=1788911399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGL0K+rHEhP7FLLFplrMez/ZNMi42ddY2XdwsA06r4Q=;
        b=bzN/Ny+77+txEU2nVpKAjFLzVTrNXuY1DnM4g8ivNV1yvP46rSJdRqCuR4LqNbxY3n
         57HOGZKpb7e4AW0o3o1RiE9phSCuX4NGvj+axbl3519XtB9dsukJRD142HP1J/pHyUKZ
         9uKdc30edopbAfY9WZ0g2DjYlBusDjKaIYKc1zZ451jT2IWtLyJmrWdLacJaVsKD7WGu
         pPthg1Ed/qDYiZK2VhkIftt7WTVIGFxITHgwX/ZJuMlZg7/wYPWh6nDMvA579jGcfn2W
         Btkz3JEpaUalZBCuJ18U0CQu/m+R106B26imzFzqLTK7WpDiEqAKd4XV1hHUxXYLJNVW
         kP4w==
X-Forwarded-Encrypted: i=1; AKwUvBwa42q66Nh9snXP3wT2HKMCz+zjSdFtywA5tpvEGp0DeiVjggnBsmpk2lYlGVJI5C1exa1HyiNDR3ikWy4=@vger.kernel.org
X-Gm-Message-State: AFuF++myX1swXYr/dDpRWTGc42rX9LVwT6xqNid6Vkx/ZlJfdo6t0E75
	m+piXb+JpSbbKZLxO/qXaO3GUKKnTtqHEqr22C87gE+S3EVLACryhmcgZc2v4FV2Q2YfC/9Q5zB
	UkVYfHHuceLTMbCHgg5yutd2aa+m6CbklpakeBkw0
X-Gm-Gg: AYBFou14UmPtCWsKLWbnBFf/DKVxdwBOUiGrc8NEGRaMOdxalwk50u/wwPpWtNBLxLo
	GA9vEVIrI4Z1kQsgkS6ZvylxTuxjg05SUMbxAUelYhoyCsHpnSmicm6LSSexrXv4OlYVSmawIBa
	EfjPONzcSR+/ZONC258P4iCm0l7TUHxkkvem4rrkZzviYBryvkuHxvl3YRZcMtfV1DZ5d4nUSRU
	+xCUW+k43P2AeKiVH7EadmPtuvzdr9+ygPd+7GRpkRucD2502VNv3C6sgkHyt4zBUpmt2UA1MSv
	16tK7CL+99zpRecM7t65z1m3DXeQyjWtcLAR2VYYlMU/LUqPbX8ErqlPIK0OJah9voBhMgZHOGb
	coqyrolL3h2Xd8r/tS5TknlWO+k52yP/E1czUEIeUUSqtyppcuIRDs+2vDHLpPWNNfQQWM9uDYB
	TfkOpT4pC4fwBqCZSF7wbX3Q==
X-Received: by 2002:a17:90a:d887:b0:398:e1f4:bda1 with SMTP id
 98e67ed59e1d1-39aee260bb4mr810754a91.21.1788306598706; Tue, 01 Sep 2026
 16:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901071353.3302900-1-nagachaithanya9911@gmail.com>
In-Reply-To: <20260901071353.3302900-1-nagachaithanya9911@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 1 Sep 2026 16:49:46 -0700
X-Gm-Features: AcwNN1V39DVBrPlGQ8m1cLB-dsHFTxG9CBDxkaJp2jJkfWx9OsqVRWRq9rtEpp8
Message-ID: <CAAVpQUDd-HeM4XTufJsBchZq_Lb0in188aawzZUYPjRAGEzZjQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: net: ipmr: Avoid memcpy() from NULL in nl_add_rtattr()
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:14=E2=80=AFAM Chaithanya Lagisetty
<nagachaithanya9911@gmail.com> wrote:
>
> nl_add_rtattr() unconditionally does memcpy(RTA_DATA(rta), data, len).
> For zero-length attributes the callers pass data =3D=3D NULL and len =3D=
=3D 0,
> for example the RTA_PREFSRC attribute added for proxy MFC entries:
>
>         if (mfc_attr->proxy)
>                 rta =3D nl_add_rtattr(nlmsg, rta, RTA_PREFSRC, NULL, 0);
>
> Passing a NULL pointer to memcpy() is undefined behaviour even when the
> length is zero, because its source parameter is marked
> __attribute__((nonnull)); it is flagged by fortify/-Wnonnull.

It's not flagged since NULL is passed via nl_add_rtattr(), not directly
to memcpy().

Also, the behaviour will be well-defined with N3322 in C2y.

Given there is no real harm and we do not bother revisiting this,
there is no need to change that.
