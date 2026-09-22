Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4901CAAC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790039391; cv=pass; b=PlhV8/loEKClBNIEGV/zKS3vGat48T47PlPkDq2j6FcqOZZ3ej9PqH2dX78s/85f8IhrTPex/1uFl/AU/Dmb4aYtCIM/zKMVZcBcEzFh+F2aHdYqAKwxZtCNy8Sni0O0pJZbbLjDk+UALrHV+tuf7JcfQ9EqSGAhelfjSZ5W7SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790039391; c=relaxed/simple;
	bh=ezXLVRbb+zxHqJCqPHjFaHsQnF2TTsc2hryxULy4MnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZpNdwFT1ijbot9qoIu+0bgX6dcFA4ImwgzAD+l2zS5vhI92Op6KKnar/ho0wCfzBelD0RWAatni3ADTR+G7hXU7GEVPrv/ie87x7NO7WNh/I7omSKMZn7+M9OHx1jTk4NVEnYZZLoCDRsEMVHIHNJk/pf6h7nIhrqRD5d3Ydek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UJzR/CSk; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UJzR/CSk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so3136992a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790039390; cv=none;
        d=google.com; s=arc-20260327;
        b=G+yz7ShQ+xvvx3bN338kY2rvN6ID2sfhGSlRwf+peMkrHDcA3LlrxkM8kSJxBJhiz9
         Bffg3tkrDJYgvwR3vN4wPoUzEidFOkhPMOpW7cWGfUdCI5YxI1TFjO7pXyK4hpsHLRvE
         vhUSMG7qAWD29XrmHr5jntzygAkEQKrYvaaPPbetG/hffynzteKPyWz5AKHngpewcZhd
         8X8oPCLOElJbb83Z1Zlm8bwUv9sh1W1nb6QNXaHUzTNRi7X8or59VQIUZ32VZw7DChcc
         MZ4nwu1ggBD2tRZQhXJb9/LXeS3h7r8x4qgmurLG/yiwncupz0YrAGEygV80BNvs6sKJ
         F78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UUDOXujiqW1xrz8MTucaL1Wl15NF7Mgdmm64Na8Rt60=;
        fh=ZNF5A8LIp4167h8Qhrzjc3SUfffoVq6c0CvHTgcDwpw=;
        b=jfuskFtYL/ogVVwyxUKxM++eRjIO+oQpZuYX1ZwcyFdUYquSog6sYh4oWy2cyrSIV8
         ECgs4L5Z6cmEOgJd2ZLtRwGpw17QOiPNXvL63Bl4f0Z9GXxE6VsyXl2O3/UEbvFA4S34
         zOLbS0cDnL4/1FsPty8sRAoW8jSnhpv0hC30zs6SjMznOjnnnOokIKm+pbjcJpyjj5GP
         dxXI7kfni8Ja/ZlPa5H+frcRL9iyUJ+RPeudHT7Ma4cLMkBxydYeKTQindWEar/foMu1
         ZejXJizILBB8Zir/6FF7c9Usxn+4ZpB19NoPk1SjfNsLYZsAwCShvqQdoHZ4FkGoCSS2
         SfPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790039390; x=1790644190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UUDOXujiqW1xrz8MTucaL1Wl15NF7Mgdmm64Na8Rt60=;
        b=UJzR/CSk+/f95mo33UQeMKx0O3Z1fL9eBoUL9lszGvJNtPJQGnFsof6zlROGOtUe1m
         Eqy8jBMz3RjLLj+8Ebty3XQitghXOisu15C9tQQsGu+HwDjXLFDrWOkk0lu6xWcXB6xC
         QouKMfKF8WHdwqwXCpltebRfJTq0AcAUNPl4yvOmjbzyqiK1kzp0qXhrggRKYBve4gnd
         1hrzezPtzEkgzFSwAolTZNWuI5DzGoxLh8Ej3q2tOGdYU9XQ9OiIqOJ+lUwDFTaOZsVu
         SkDkcB/h2GRZapQEJ3sB/vs0JWoew/FpfMFTgtvcOWziDVWaNh+PAIr4k4S+LRj8ncRs
         Cr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790039390; x=1790644190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUDOXujiqW1xrz8MTucaL1Wl15NF7Mgdmm64Na8Rt60=;
        b=Skyq/UkUAWg4Eu9KhXfGS0poUZO8c+QvNlWa+26JDJj3HYrg3EsMa7q8vDHkRP5gdz
         Ba+JrKSEMFY5P/efOraRiSEtbL295QiXeh0yQCC09xZO2IFjDtFoHjjnjIneRBSYJOxt
         /de4Y5Mu7slA/KFveW3YiLu+I0cOabfY/doN1jwdGsvu1tc/6eEH6Q6priotjWxcItV5
         xpgHsYTutnwd9syUMCrFDbMThI/P2icNUgsiPdVrKc7JwoCG6U628DlYvQJeZpLpuTwz
         o3zQsUHwKcoUTJrzfEV1z8E61S1GhPz5ZQzqHWzbGaG3rk05nBW2xkFhdQx8xcTVkPGp
         4BaA==
X-Forwarded-Encrypted: i=1; AKwUvBzyBTThJVp6en4SnCMALwVm1YGeGzWPJy+WfkWZ//8nOEma5ZHO5hDjtHTPRXWh3vHJ8146QzMG/Xrll0M=@vger.kernel.org
X-Gm-Message-State: AFuF++kHtB7tomGsKtExHXNy42rgRwXIpiibZzWB3DaJBYFWlMYOh0we
	l4FJ9e642jJcXIaF9ZybPYl5fEHTxNqa+PcgyYJYkLlaLdRJyGCHIaUA0Y97cZM3V8O1YdolGFy
	gKhZdQLKmHiEN7iZbW5B9xEKhbUmV6etLAEeKChin
X-Gm-Gg: AYBFou1czerFp/IQ64qHWpOTmhIPU7tt7lq6TNNR9d4htyS67CYITIc2WWBz8Yefr7f
	j7pOwm3s1JTsc+zkvvysMxwlPzeC1GIDeUdXWWzghYpW/8WJA8+En36D5MymHj3Pa8I9BOm5PF1
	aZfCp+xYJdY/e5yhAckoGp7bFiX9UbFnB/9CU6+rtdbHbKq0dYu7ONeCQkTnXsA88SpQgVBSc7n
	VnitmGNyw2Yeh2l2fVHd1hgqK2hD34wqDkjKAbaEfLNMi0/v6rxXegz36vuYvUivKMs6PAgPepT
	BX2g4Z560bTLwfVWtCEdJRqpaao3R9/FHj0dOxikBA081hWsQk+ZgnGvSYVQOU9/K4gwad3Yy93
	T6SSpnQLyu1HbXjSpwKeKF4KOWZOg7dfn6tMJot7/lzs/2liRHvdumeytzqR+0kV/sxP4
X-Received: by 2002:a17:90b:2681:b0:39e:6c6a:657d with SMTP id
 98e67ed59e1d1-39e6c6a67c0mr12045871a91.64.1790039389045; Mon, 21 Sep 2026
 18:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-udp_hash4_fix_v1-v1-0-718891af0d7a@mpiricsoftware.com> <20260917-udp_hash4_fix_v1-v1-1-718891af0d7a@mpiricsoftware.com>
In-Reply-To: <20260917-udp_hash4_fix_v1-v1-1-718891af0d7a@mpiricsoftware.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 21 Sep 2026 18:09:36 -0700
X-Gm-Features: AcwNN1W4zo0lF11_EKGR56RyaFTOenFLfq5u9TmQaHIyrpW_Y2TQj8_ayHXa_fw
Message-ID: <CAAVpQUAi6mP4D3ZHZcWksfcuWx25i=2-qBzg6wakvZSDLLxS1g@mail.gmail.com>
Subject: Re: [PATCH net 1/2] udp: relocate a connected socket in the 4-tuple
 hash table on re-connect
To: Shardul Bankar <shardul.b@mpiricsoftware.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Philo Lu <lulie@linux.alibaba.com>, Fred Chen <fred.cc@alibaba-inc.com>, 
	Yubing Qiu <yubing.qiuyubing@alibaba-inc.com>, Willem de Bruijn <willemb@google.com>, 
	Cambda Zhu <cambda@linux.alibaba.com>, Janak Bhatt <janak@mpiric.us>, 
	Kalpan Jani <kalpan.jani@mpiricsoftware.com>, Shardul Bankar <shardulsb08@gmail.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:26=E2=80=AFAM Shardul Bankar
<shardul.b@mpiricsoftware.com> wrote:
>
> A connected UDP socket that connects again to a different peer is not
> re-filed in the 4-tuple hash table:
>
>     sk binds to 127.0.0.1:21001
>     sk connects to 127.0.0.2:20001      // filed under hash(sk, peer1)
>     sk connects to 127.0.0.3:20002      // still filed under hash(sk, pee=
r1)
>     packet from 127.0.0.3:20002         // hash(sk, peer2) misses, so the
>                                         // lookup falls back to scoring t=
he
>                                         // hash2 chain for this address
>                                         // and port
>
> udp_lib_hash4() returns early when the socket is already hashed, assuming
> ->rehash() relocates it. ->rehash() runs from __ip{4,6}_datagram_connect(=
)
> only while the receive address is unset, which a second connect never is:
> the first connect assigns it, whether the socket was bound to a specific
> address or to the wildcard. commit 644f9108f3a5 ("udp: Make rehash4
> independent in udp_lib_rehash()") added that early return and named
> connect(AF_UNSPEC) as the way around it. That workaround does not help a
> socket with both SOCK_BINDADDR_LOCK and SOCK_BINDPORT_LOCK set, because
> __udp_disconnect() skips ->rehash() for the first and ->unhash() for the
> second.
>
> Delivery is correct either way.
>
> Relocate the socket when the hash it is filed under differs from the one
> requested, which is what commit 78c91ae2c6de ("ipv4/udp: Add 4-tuple hash
> for connected socket") did before the early return became unconditional. =
It
> is done here under hslot->lock, which that version did not take, to match
> udp_lib_rehash() and udp_lib_unhash(). hslot2 is unchanged, so hash4_cnt
> needs no adjustment, as in udp_lib_rehash(). A first connect is unaffecte=
d,
> and IPv6 shares the code.
>
> With 500 sockets on the port, a re-connected socket measured 522,553 pps
> without this change and 2,055,078 with it. The UDP side was noted as
> remaining work in [1].
>
> Link: https://lore.kernel.org/netdev/apnHqmYZQ4yzOP4N@v4bel/ [1]

This link looks random to me.

> Fixes: 644f9108f3a5 ("udp: Make rehash4 independent in udp_lib_rehash()")
> Assisted-by: LLM
> Signed-off-by: Shardul Bankar <shardul.b@mpiricsoftware.com>

The change itself looks good.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
