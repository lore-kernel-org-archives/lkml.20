Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B563C108A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790880795; cv=pass; b=H5C3wnofyTkW93YS7TyniTS/I+BLK387KS/NVesmrTOUvvdoSR94+0QCGcVP5V7IHHFALlt3LFRZQbi2sDfkCt3FKa8+dEJhJ6t/+nWqLBo5YA2ABEW4DSFfWycGvGzsFudpa97TK1d0czwPNhaPD/YUbmtw8eZVURPvUg4MOxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790880795; c=relaxed/simple;
	bh=Y+2Ni7PMqrXeJ+Ib9G+7B54AUw9Jq7EWt/AyyHD6kBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7yGZro2pJUyfc+EIVGuH2jxaRL+zyQ+WHHjopuksRH9UQK1UcKA7Uhu0gc2HsIGo24Y3ihTV2PvTjU1jtS3ZKhKihAsJ62rFEhGnPCwWruBaTc8/mo7/brEvwl46N+VY1rmP3IAs3RWq0QwRRRXo4pl7ZT/tTz3Ruom1ifNej4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaHrE+hC; arc=pass smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaHrE+hC"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d7111700so1095372a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790880794; cv=none;
        d=google.com; s=arc-20260327;
        b=mhJT4D5hi5T+vECRE70uKJwLmGPWDL/f6rm81Ik7isFtS6oTe+RUhjPnT8fvCkxyOW
         TT+69Mt7NzG2V3F8b+r6/KHc7rcpjR6RAdLn0+vMcP1Zraag410SJwIWEeB8AsoONJuj
         hr2pxZy0i2fcBY+AacaOBA+JUiP3wD1C30BScyy/LbN0RJPcVwpjPMEiNphsrkOdbW32
         HDLHGpV/4Gg6jJgRgAZSzmgvCnKGwnxdQq2gbK81XDNpM4XBwZPhv2VBnuQCW9RJTONf
         3CQ7PYqYOAv5OnDgh6FWJgfb7fIhzzQK/z8cLhEC98ay2xoJhJUMI+SFKSkdvo0rMa0G
         oylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y+2Ni7PMqrXeJ+Ib9G+7B54AUw9Jq7EWt/AyyHD6kBU=;
        fh=i4Mrs4beY8tUh5DRV5uZvh6/WGeoY2uuEDfSIJS/VG8=;
        b=hDQ/SFpRvd9RHQVcsbiiCPzK2HdftMTVcesxFb3rj2OfrzWX/bTRVVrpq3IFeE/yuF
         ejq/P2HMaF4P7+kBBFmHyeoo2+DY3b698kLhn5b/QwPJSQvt+m5G769nFYzdcxPXDppw
         p2AsC4wOE3au0EyqcWrg9EUURDbY99EsGeoM1WtMhkmA9tMmAyZH23oprunJEXOQv1ZD
         lmdSqu//9f8mVQ5ecmmMlNgBIjV3162eXyC5vrnqNzuewIbemVFSiXM8fZxQO8f7nxuH
         QgVt4/X3ptoksTM4AihrVeLWyEf30xSdNsxUMKcxaVmE0V0Ht0goKYI3JKOPKKaJP37z
         AWtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790880794; x=1791485594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y+2Ni7PMqrXeJ+Ib9G+7B54AUw9Jq7EWt/AyyHD6kBU=;
        b=QaHrE+hCNs8GieY6eP5AQgY/PyRFHQ780LwDdjfXqNcIG4Z/WD9011G9Vl3+sk7UgR
         qc5vstTNGaTFMYvm0bzKAkJb6Xr4+SF6gJsP1gyJH5GbwchYAA7+HuqbwqBnlUI/NBX5
         mCb/R2mNEPrqiTubYL4A6e19MS0lmlQ16GU2X0E142W81oJipUKhSIvoly4YOyXJB6LD
         gfDT+g+XNpMENzsv3QR3R7Yu0Lsd7tUkUMHAYNriZpDQt9KeLE55AvyaklTIp7QXfJAD
         GbhN6rhsnYXTx7AfS78BNXfbXCrvWuZ3B78UrsT9iey+glF2ANw2rZynvzsN45pIvM45
         vuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790880794; x=1791485594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+2Ni7PMqrXeJ+Ib9G+7B54AUw9Jq7EWt/AyyHD6kBU=;
        b=v35koZUZXBKFppDlp283jSCXCgApKf6b+H65FRtd+s6uG7EYkbq1hArUzntGgu4rtE
         Jn27RRFj5Y2BXiVdRNZOK1serkBjfh3HNHuVmBcrgTdvkEfcq3Ah21K+mu0X6VlkLACL
         L/MXvefef8GeiIOJllEI8iVv0tv6sxhAn9dQG1Wf9NZEZJyWxspVpz+KfvthUYcpHkwY
         owu574ag/FCgBz/7VOwnbKOLbxL9rpXm5GFzKiLN8Lcb6+tCGZThFmt4yntafGIku+P3
         oABMBlfG8zpl6j+OXVKjf3Kc2DmQMg8jl2SqB7YogeRkn8cKtOh9WWG53p8riXZyxkDY
         uk3A==
X-Forwarded-Encrypted: i=1; AKwUvBwEnvH4ZlphYUMof09OLmOl+0rgQvHetvwjbWQtvwll5NUT0+qcTe/wGzyRuKRTZxowuF2U2Dsa3ktTZAE=@vger.kernel.org
X-Gm-Message-State: AFuF++kOZfT4x6eM3kjDrEiXJDVLro2dtBpn+DYh3Cm4j47NvuBFJiIN
	Oc3McjxM7idJI3T+Xp1PhPCZejrc0pFgOTQaJlYIcJJ2kzh9/EUL6nhNEMWXqYtWVEHqM8/xYb3
	kh/90EriFwQF1nRSoGfOc33lbiK3RuxI=
X-Gm-Gg: AYBFou0UOKy2c5ObKiYh6gXT3A7KHZHB8y2uHw/01Ljx1rWMwuftiSy3QGmSPr+V74m
	j3jdnsYANPyQLRnBVcvuZOAmdZ/4ZKrZrM0yfMmGDZMT5v8BhV/1t+Bb2K3V5BPfUZf4CHEqEQt
	ZZ8e4XezrshoIxfDP4GHgDMme2QGvArpNoJiWqbhOSuTUTvel/4Vvs/gjDns44H8svwRUFelcl/
	2/OaN9wCHm7BRRjB1+3JO9knzekbJGauckclDndaNoMdDxxzJwVpZERPnmEIzDoqD6hmRfAFL8Y
	MDFNU50YDTl/bYIHPQWp6s0DTninXlW3JJLC2URSpHlCBP2DyTcUWTmvxSaeoKX2aKFHLVxuCVp
	Z2Pvh5NOpEJGfNH4Nzc3ni6ICwCGQ0H7Q3OaYEe58rjUo8JQgwdpC+5sgqA==
X-Received: by 2002:a05:6a21:8289:b0:3dd:a197:736e with SMTP id
 adf61e73a8af0-3e0bd24822amr308001637.71.1790880793837; Thu, 01 Oct 2026
 11:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928152132.3705137-1-guncraft2000@naver.com>
In-Reply-To: <20260928152132.3705137-1-guncraft2000@naver.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 1 Oct 2026 14:53:02 -0400
X-Gm-Features: AclHuK8d7NtbaPQb6Cfc9lQW_joRcJ6ZbSCH6q966PeL3ZPj33mszk9mvkCU-9o
Message-ID: <CADvbK_eJTrNFyPRSwCtUXqQRe7=_KnbDjsNEK97J4sYp+YpSxw@mail.gmail.com>
Subject: Re: [PATCH] sctp: hold transport reference across connect wait
To: Seung Min Shin <guncraft2000@naver.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:21=E2=80=AFAM Seung Min Shin <guncraft2000@naver=
.com> wrote:
>
> sctp_sendmsg_to_asoc() selects a transport before waiting for a new
> interleaved association to become established. sctp_wait_for_connect()
> drops the socket lock while sleeping.
>
> While the lock is dropped, backlog processing can handle a COOKIE ACK and
> an ASCONF DEL-IP that removes the selected transport. sctp_assoc_rm_peer(=
)
> then marks the transport dead and drops its association-owned reference.
> The transport can be freed through RCU before the send path resumes.
>
> After the wait, the stale pointer is assigned to newly created DATA or
> I-DATA chunks and later dereferenced by sctp_outq_select_transport().
>
> Hold a reference to the selected transport across
> sctp_wait_for_connect(). After the socket lock is reacquired, abort the
> send if the transport was marked dead. Callers without a selected
> transport pass NULL and retain their existing behavior.
>
> Cc: stable@kernel.org
> Fixes: 668c9beb9020 ("sctp: implement assign_number for sctp_stream_inter=
leave")
> Assisted-by: LLM
> Signed-off-by: Seung Min Shin <guncraft2000@naver.com>
Acked-by: Xin Long <lucien.xin@gmail.com>
