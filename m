Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA8C3EC820
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288912; cv=pass; b=YIidv4+zlhYq/RGnhYS+lXG/7dTi3RPJCDUwuBrX1IhBWlnFtKXn0/lY1HXyfupnuzUuuD9bBRQpnwbQNohD54GvkeEOYrGueUguaAQsFzTLGL7jI4HZaCQt2WmHaHVLB9x7gvMdbgFKgX3C0NxFguq94SXFv7dOOJJU9yY+Hqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288912; c=relaxed/simple;
	bh=20SoLCTlUosZH3gg7t5ypYAOftvZZuBui2tmg5aXxP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIlaG6vmDq//fHX2eu6RDT54terHNj03tutel5Hk3TSWH/O7gVseZ3YYYN+H4wi3oa/nry/hrL3huS2EbnP1XFUGLnHGQ/MKSWZ+I06OmvnUG84NQZmoGSQRGANFNhCl37Zq1DPA1/O6ubh69yj9gJVNQFsiq+17TeGjzmHrFBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Gd+rM08t; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Gd+rM08t"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8897e83332fso325888b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791288906; cv=none;
        d=google.com; s=arc-20260327;
        b=MCkuNSnH3yTOovIMpiYWTPpuC5SDPyg6dOrus+eRcyjNXV4jxXBJFjlhgg+mzW+6mE
         aSGzVG1Gcyz3ehRwGV8FrL3y7uKCPT6+yCk+d5ApQAO3Y/BGbhyz2sOE6x4QGP3SqQd6
         ZuG7tzKomGt9qE7rPT+4fIiqLye93IesSDVLXkJqUu9p60X+wIiGuXDP0i+51n9RwFhU
         k0zAgv5im2iGJPSUCZYGgETM5bk5fSYBu+L67l8g9RC0slKVx61W3oWRRxBtMMt7DJLx
         T5JlxJ998QyE7Ie/B01VTllpg/n2kIRL1XacERbewkb5MbiNAMBnOh/HxPesBmTVwRDn
         ceUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hhU5kMp1rxGMciu/YZ1tuWYg/j9SOf7ZmdFtxjzJ6YM=;
        fh=Tmp+HppvPNv2C+Q9xOna80kiMoCMtX+Gta7Htum/usA=;
        b=ETdoWfR+ofNPRAa/SCfa4ZGHJV6YcPFVQ4DwnZNAK2rWG3faBFJWz4NHWtrIOGl95w
         0VWLoRC1Ty/1h5lbjfhEziAHTFloRLJd+NixS5mzD5Ron7Kp7QRJpEsa0CQxZoqF24ey
         65lfSCJyVMtqWljwf4QZJ1p8FBJPv3qz35iTxcJ/NTOU8OCSMrKDpP5ImImjbmGDQNAd
         s9H/0qV7+iYJlCaqoLnrIDcKpnQOozQHmJfRR1o5tl8cjvj3EGdk1hqprYtZgywmHkfh
         yjnnvLCNSu0z1/wl1tTwMMXNAn8FXWknapjbOYj2ccBmX5MvT3f76SdnY4QBKPn8QhzG
         Fj3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1791288906; x=1791893706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhU5kMp1rxGMciu/YZ1tuWYg/j9SOf7ZmdFtxjzJ6YM=;
        b=Gd+rM08thoFmZVQsnxAwprenjbH0SYu18KM8fEyZ0sBh0rXCK7d7SiBMrE19MMoOsh
         hpz9SL3g1RbTJoXWYKTQXwhCY/gVs9xzpEt//LL9ObB5XLlLEg+govE7cZHs3b1iVL23
         f4SRZvH3Uq0pdAyZr6JxtvY9wS4lEQ19ofVanydHry/DcVrCMop0Xyrhvze7cQw1d4f7
         qbpU+wQk3L3Patl7MKlBTbPCmKWYzVWo3V29JWDQZV/l0o6BGjiTrKc/8nrns1bzHsBT
         +91vXgEIytdN87qyxJSm/HMb8fn6fuAKh6oGPG8GpRXxMdxNWFUT9X9SM2CkbPBmB0/k
         P1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791288906; x=1791893706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhU5kMp1rxGMciu/YZ1tuWYg/j9SOf7ZmdFtxjzJ6YM=;
        b=JwDp+CusMt3mVOciTPq2TXxUnn/WPj3fxecjP61r8aDTMtmFNjfuqAZXeMom0FzXHI
         p3x9kWjPOTXRN5j4nAOgyQGJDZiD+jYX0jKMqAP1NXuu8bNI1hCO3wG1wCj+2AUhTibo
         cA2iZ+dmx6aEY8rawhNbzZIABDNia9DQjUg2Arc1rKUpzgO5zjyUA1BaJR/9dt+LXlN5
         PtcMMdyfn31iAdUkzYKUNhFEwKEIstIGv4Ay3slwyncgYqNW6HAdTo1kNdKcUVTH/atU
         e4z01xvUUapvPPQe9HmV0Tim1yPqhnMrOljipm0MLcrNn4+OO7KoHg4PNfghrzGpn26h
         X81A==
X-Forwarded-Encrypted: i=1; AKwUvBwnoYX/2fW8Rd/RjobJFSZxI6QOJ2bufzoga9AI404XwXFegqY/vXlhSKF9IzyeyIl+7Go/00HBY/HJbX4=@vger.kernel.org
X-Gm-Message-State: AFuF++lGiaphNsh1s/s3TFHdnYC0eok3C9/uTagRycu4gxlUM5rBjX4r
	gmAx67jhGYCk7G5fiZ5XtjOEhLm1rgqAJ9hIvwFb/nRZPRrcLm465Fr2K0CZItIdnkmQfipG1r+
	066OLcTxXQcsjpqsDMWZKSx1UsbyXtxr3son9/6Om
X-Gm-Gg: AYBFou12pS6mTf3NVfdyWECoDQPabLxJoQmA6NWmTxQfMn917XlEW1RVaoyyaylhYOu
	zILpLxuFXJD8+I6ow1kurEcpErw4VAn8FXCkjKxqiikWjgCeCQhGq4qPWxbsKISt5X0Ah4y1unr
	Dtc0sMUlABb7OTCnn7Bwzhy3wm/9nDBR30Q94/NubaFxom1CCY5d/rzjWGi6IcKzBGWT4fEp162
	7yflAmRG6T8aJ1rmU4xjUNY4yJrt7BYC4r4++O4z5S7aA1H2ya4Ix84DPIdlSRijdNWnPKy40hD
	i8x2vjTgGUr6iL+7Dl3j8xv47ukTZrVkx4M+SpXGhi6WAqR600YPDQNllhk8k0m4TbdK+nPWKpa
	YdCBham75
X-Received: by 2002:a05:6a21:8284:b0:3e1:2422:1d4b with SMTP id
 adf61e73a8af0-3e124221e5cmr890709637.36.1791288906570; Tue, 06 Oct 2026
 05:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006035108.3101440-1-4ncienth@gmail.com>
In-Reply-To: <20261006035108.3101440-1-4ncienth@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 6 Oct 2026 08:14:53 -0400
X-Gm-Features: AclHuK-0rgBX0Rc-BZAEtLzd-Bv2KqLRMjK2L8kmkoDKLlRupZOtGrn3yq5-x8I
Message-ID: <CAHC9VhT1upbG7_0pB6KTZyBEbycbdkaWCw=-rYARmkmBF519ZA@mail.gmail.com>
Subject: Re: [PATCH net v2] cipso: adjust cached option offsets when removing CIPSO
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 11:51=E2=80=AFPM Daehyeon Ko <4ncienth@gmail.com> wr=
ote:
>
> cipso_v4_skbuff_delattr() removes the CIPSO bytes but does not adjust
> cached offsets for options that follow them.
>
> For example, with a valid 10-byte CIPSO option followed by a seven-byte
> RR option, parsing records rr at offset 30.  Removing CIPSO moves RR to
> offset 20, while the cached offset remains 30.  Consumers such as
> ip_forward_options() and __ip_options_echo() then access the wrong bytes;
> the latter may interpret packet data as the option length and copy it int=
o
> fixed-size option storage.
>
> Mirror cipso_v4_delopt() and subtract cipso_len from the srr, rr, ts and
> router_alert offsets when they follow CIPSO.  cipso_len is the distance
> the first memmove() shifts those options.  The later header move and
> network-header reset relocate the bytes and their offset base together.
>
> Fixes: 89aa3619d141 ("cipso: make cipso_v4_skbuff_delattr() fully remove =
the CIPSO options")
> Cc: stable@vger.kernel.org
> Reviewed-by: Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> ---
> Changes in v2:
> - Replace the parser-invalid 8-byte example with a valid 10-byte one.
> - Move the offset updates beside the other option metadata updates.
>
> Link: https://lore.kernel.org/netdev/20260930140400.2955466-1-4ncienth@gm=
ail.com/
>
>  net/ipv4/cipso_ipv4.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
