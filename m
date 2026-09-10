Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7675379C39
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011113; cv=pass; b=Xif5ef3pnh0QMfsqi6CuZQzcVmo/bKqSn3UM6+ZaZI8AFA53MiO4E4Qo82LCjm1W2S40n1rvVvNIU8Rz/jnrk0HpSFJcb9fEsH2VYvZBr6Tz8Vmj3Ea2hUBgvSZpF6NKRfnDRjTzLS2mkYm/fj6tiF/647FxoEZT1f0dNe4dS+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011113; c=relaxed/simple;
	bh=0qt2KD45sI21gJA6Y8we2ZoaTqnK0eJ/2/8zs7rPg2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmnphERyT/pVg+PPYMH2YVt4ciXxfsqURELWCwAuCX61MXg5RxVtsvfkmM6/+Y+5r+Z7MsJLn/KCGaPOgLMwZdPwi1J9yO1eKsr2LHGyVPLsXw0SZSyRjoWZAuf5p4LLGIMFygPb8XIu9P6aDcZP0AlJEiHBpIia+juktC7O/NI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms/EPLff; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms/EPLff"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso7288991e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789011107; cv=none;
        d=google.com; s=arc-20260327;
        b=q1qSc7v97mFqLhy/guDpsfjm1iNXZw989wNm9x9QDavAFk45UxoKc6xxBS9lyseK93
         kL6PR4XRzMgEZlw5Ev5GUlVPdtWAoq/mg6kmUbVibpVZUnKkqU/NQxcFAynuargw1Ys9
         eX1Ez8bcRDBPWNJtDRf73tkkDYNaHVTE+7uZZBu5+clxJMgw3wsVSO0ID+rQCi48UhYi
         QNJa1mxnuwKzzHvT+33Uqzr5veyCmM4f2enztXobhrWq2vwYLS/S8GvQqMUt+z+FAyky
         /BrRN8SZvbzOtjWcgODUq0NwszUuz4UrwCjTLeGlfaK735MnSPXCD0+czUSI51Yxr9Re
         WGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hgbYbe2QCz7HfqnzJM/CyQ0tUDugBwRoT9qoRJLbqws=;
        fh=ZvH77kiRScNhJgSXQOe3WBj9IlRXWZOJgkMDrabwnao=;
        b=HFyq0pLgSphrFP6rh65Y5+thQxSAMko4TT7s941vUZAC7b56l3LCrij/GRzNPZhl6C
         X6yVMElB63/0ZcoSx5Qq1u/WDYdv3FpHDzwQuJ1jY4pcfhjMv6v2xbHRLJXvIe5Kp6eu
         7YxnIuYNIun8zFwIYu7aut2fWuuL23QO31wI4U9Iw/VNn0It4I7/RLGC88/Vqm1jBp4x
         Hia48+aPOh4KkrJew9Mjje1ZPYueFswvaKn9WGLpVwrjc92Fe5uQXogd1BPrvrEbL6Bu
         2VVF8uI4+HJ1cDh34uEcjn4DcH5doYQMms0KHu6q7VpYGtT1LTGt4Nftp9LajI6BDYh2
         6HAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789011107; x=1789615907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hgbYbe2QCz7HfqnzJM/CyQ0tUDugBwRoT9qoRJLbqws=;
        b=ms/EPLffD8msIzR/FUmEaJnrQRF9hnxnPWGpwvvs31pd6RlZ+LSWy1IFRMoA15N/QL
         jTkyQp2K+dZcrjSDFzuWkB8b1sKcc89/skNv/4ttjdWhYE9AdX7CsUYlaH1MpE49VN7E
         0wZntLhmZJQyol95sc79m02KvRwXEW1gkzCMJ7ir9kx/kLUEKwy7D+sVSgNdKTV3kV/i
         GmIh9uomugkXyVar4NrPq3em1NFO87+HrFLFYb8Xcq4DEaIYt007ykC5Mv3tfla7oWQK
         f+BlykiyoVI9DpnrfR6o5cUUhRGvawNjTG8EvKG4I99PtQFPXHRH5DpX5YRH9bD0L633
         SIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011107; x=1789615907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgbYbe2QCz7HfqnzJM/CyQ0tUDugBwRoT9qoRJLbqws=;
        b=YO8V729IMN95+DsbR3BjgV0OQwoqg4AUFkIsgQlq+rTyaCXlPp7cmEUqnM6U4zXcjP
         G/fzhddGEMRc53gj5idNfRu0sEa5lvS+Xxs1akIWDzQQPEGR/FTtDcd0fid54cSdZjnV
         0oQPniwk1lt3tr3iibxMC1htrb2x42kj0dRVVPVuc3j2Tb/GoSVEKqgLvMd9klzzDQgN
         0iLyWW2mCtLcnw01G9T1e7Jz1h2qBboiXwwz9fi8L/k3ntm19CGik0En+X0V4XT9xViW
         Bf6LGojiBMskpzohU47QQJ5dR5+GKCQuYWbypbEWpNa33qo90KDqV3f2gGMZoMk+trv4
         dLNg==
X-Forwarded-Encrypted: i=1; AKwUvBy2liXrWybgMzdiWGDYklQeXtWELr4SMzEeDuvuLTX6yUpJImxE+8KmGO+C8NQa9YoYx9gERp13ipEKqCk=@vger.kernel.org
X-Gm-Message-State: AFuF++lSQ7fT0RDGT4CE135MPkgaapyDgPkKnO1kijHH+3Mb3n0mnC2w
	Vdv+c8o8/QWLw347AyFDhGXnd7pHokJcwn0AtWdU47KqMOpubZAVVdaKsy6s1SMqO6RcQHG3U8s
	eyqGz0G4PvE/C6zAuMG+Y+MScnv+68AQ=
X-Gm-Gg: AYBFou3ZJxj3DkkUkpnxQEbXdMQdc2rZ1opbaeNhIWiEfppcC/eVDWhklm+UFKYTR7T
	94LoFKbN9jPLE8zcTkhFt3BdLGkEr3SrWAjarYvFJjcrb41QY30vWOM8t8RbGel62YUU09gXZyp
	6gPl9tSwCZA49zk6z3xUKcQyXZUf4MkaYT/dx/BO3EnvV8FFo5Ke29xoRtAK4QY8IchKKg4PDgM
	FbooVnTX5LpNJnCPUGkbtamuXULJZMeCrfbD40BSXCmdUQdI/9hrTTlYRSGBxKpClXdXXPwm50C
	7HtBNOVFUEBc1DlNWj1zwpawBVasZ5Ouy0AzttVARUkn5+e89aHaayV8344Bw3NqJGlAZthFvdQ
	Cu61aDRc6jT9Gn5O+M38GDvYUgXKBplgkcWYaxUnVow==
X-Received: by 2002:a05:6512:31cc:b0:5b0:eda:de1c with SMTP id
 2adb3069b0e04-5b616f01f40mr7098978e87.5.1789011106564; Wed, 09 Sep 2026
 20:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909013401.14408-4-sigefriedhyy@gmail.com> <178900489529.219967.8506896899151263500@kernel.org>
In-Reply-To: <178900489529.219967.8506896899151263500@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 12:31:34 +0900
X-Gm-Features: AcwNN1WCpzOJ3A2y6-ht_UAZZ89UGnGJrkAmcH1fBbpeWT9y7b43gmj6FiS8apU
Message-ID: <CA+7S2vJuhbghvtYi7T+rpDgkXKG0Ls+kzxYnprZWHMVbYHsejg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] selftests: net: test AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:48=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> - [Medium] In the new `dump_mcaddr_l2_check()`
>   (tools/testing/selftests/net/rtnetlink.py) the non-fatal presence=E2=80=
=A6
> - [Low] dump_mcaddr_l2_check() creates a netlink socket via `rtnl =3D
>   RtnlAddrFamily()` (rtnetlink.py:125) inside the temporary netns and=E2=
=80=A6
>

Good suggestion for the test case improvement, will fixed in patchset v4.
