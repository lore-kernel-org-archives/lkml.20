Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637545;
	b=ScGuh8bRwfxEkmkW+XQLwnXR6WPZCUMjk7AotSHBPstdFy+yhah/8u0lQSJY3/1uu7eB
	 wuGBWAX5H4bRImt3+NZQCA13a103AulYD4uDMRozeDqaWjFyN8S0drHd3Etpi5jHnMAoU
	 UKg1fRoWmanLRWKdXkMJOe3uDEXQ03OCrNJB0KzHpmx6TmV0J9uD9OhuXjcRwtDRUZj3i
	 8fd2keBqaoBi76S8pJVStdXxoO4mftvpoi6ewxu2MppK2k91LeUfmKSRFWDIq54HJWgAd
	 nPQx/4STnlAF2yvFWO+R1gUwErUdA4DiGU4XVQLqG3QAe84lwoIeqlniDv4+KXI9tIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=f1uKAHfLkKAcTOJ7We/ICrLc1X5GLK9RGzsgIrAvm2Y=;
	b=qN2fshGOUz/YwzOjVGtuEl6hY6AwF83MFJ8jmv1KTIVsxuQuGU77X9uAbnEmRedipUdp
	 w/HdNb557kFljo9xL1LJDlVOxcmm7LyXGiDYaRweChNwBcF8+aTm59p580IiwvO5ETG/x
	 z48/1S8M5jQLl+n+Yz1uKiOoR5kaWSM8S8VDtyJwHHI9GLWobLq0CSrM4OTVPu/tSYqPQ
	 dM6mdRkFoEehDjl8JWR4rmwEqD6rCWiMOoQjZkO4YeQHfT0B5GY9gE9yMGaJHsv+U6/a6
	 1vZOrV42iE0NuvqLEMDKg0HRrcPaTbYaT4EAmbHlS2a9obXhjZgEylDdW0WoddjMZAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nwhc0MCz;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC8A606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC8A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nwhc0MCz
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so1317856a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794637544; x=1795242344; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1uKAHfLkKAcTOJ7We/ICrLc1X5GLK9RGzsgIrAvm2Y=;
        b=Nwhc0MCzbSYPuNNbwR8XSTcIxOAE4l4DwXd6OJGo6xMpTAlIQroUO2R1yHY4R/qnqb
         LAN0sZ3NBD4WUdGraiMf29yNuNGFcAk3ZQdAFg1sAFFnMSRBk2/tRUv9TAGT7S2YJcAU
         praLP6mgHYhXVBhT50NKmDSe3LhdpYquqg3cAluCZ6rCACmsAkOP26wbar3y5uKtrxZH
         NWramTRZVChFKcjuc9uP5zdXO48JcXBMCS2ASH53JOk93dizCTnDyZjS0k0DYRncUpb8
         Zg5kr6U9mQBKivVNnyfBll6OJNHsJckKZNGfsW0eW3TmcPDAHoeQ2FP1lNxkKu4ecjGO
         mDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637544; x=1795242344;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1uKAHfLkKAcTOJ7We/ICrLc1X5GLK9RGzsgIrAvm2Y=;
        b=H7KB2c08ueo2fPIpGIi2jbtopL8x8z21PBNTIwF2K7SgUnPy//jS05f6TYEw4yYrdp
         u5/NkLzSnvbAmkjmjXg7/ItvSX5hdtZmEvV5fpey+C5ELOMyncWfkIhJcQKVsJZijNGL
         E/zZyR4CAOHZMe64gU/Y6+2MClKT8lEuG3kaq8edpXv/yD3NaXonCzyS1sC8kR0rBCuH
         Pucv9yCOL+Pp5nQBGoktib8LZcNWlrllb0jvF0N50ymgADK9Af0I0elUSWupGX9OApy5
         LwuSVK16m8loZTWXx/TGBDy1oJfwB/lnuTLboUg4eoD2piMMGFKuRgxNRwiEmCYrrs0N
         yCcw==
X-Forwarded-Encrypted: i=1; AL+hErGHyrABrzpyj8CAjJ6A5CAQnvZ9/IAlC8gcLiUyLWMJ9UNDwRHvW5QzJVLRp1R2a7VNBz8lUOJr1xEx3bI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jmTopJGydkHkl3Wo4NCLsKdUTuJt6ScJ0/t1XVm0fbbLY5mjA
	AGrsIkdQj8MD2e6aytl95b9MtwniL30j5G1zuX6n+3vixAO/nuKWWvxkdqBdMI8GiNpDVf9s+A6
	AUuQLiQ==
X-Received: from pjuz16.prod.google.com ([2002:a17:90a:d790:b0:3b0:7a3d:ca4b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5703:b0:3ab:de4:7fa5
 with SMTP id 98e67ed59e1d1-3b1b0b659b2mr5001372a91.56.1794637543782; Fri, 13
 Nov 2026 22:25:43 -0800 (PST)
Date: Sat, 14 Nov 2026 06:25:43 +0000
In-Reply-To: <20261110204524.82341-1-ethanf108@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110204524.82341-1-ethanf108@gmail.com>
Message-ID: <avf-PdwTjpqN7d0D@google.com>
Subject: Re: [PATCH] net: remove CONFIG_NETDEVICES requirement for
 SO_BINDTODEVICE and SO_BINDTOIFINDEX
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Ethan Ferguson <ethanf108@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, 10 Nov 2026 15:45:24 -0500, Ethan Ferguson wrote:
> The SO_BINDTODEVICE and SO_BINDTOIFINDEX sockopts return -ENOPROTOOPT
> if CONFIG_NETDEVICES is disabled, even if the lo interface exists. I
> believe it would be prudent to allow for valid bindings even if
> CONFIG_NETDEVICES were disabled, as an error here would be inconsistent.
> 
> Signed-off-by: Ethan Ferguson <ethanf108@gmail.com>
> 
> ---
>  net/core/sock.c | 56 +++++++++++++------------------------------------
>  1 file changed, 15 insertions(+), 41 deletions(-)
> 
> diff --git a/net/core/sock.c b/net/core/sock.c
> index e8551df8330f..d2da59700ecf 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -634,18 +634,14 @@ EXPORT_SYMBOL(sk_dst_check);
>  
>  static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
>  {
> -	int ret = -ENOPROTOOPT;
> -#ifdef CONFIG_NETDEVICES
>  	struct net *net = sock_net(sk);
>  
>  	/* Sorry... */
> -	ret = -EPERM;
>  	if (sk->sk_bound_dev_if && !ns_capable(net->user_ns, CAP_NET_RAW))
> -		goto out;
> +		return -EPERM;
>  
> -	ret = -EINVAL;
>  	if (ifindex < 0)
> -		goto out;
> +		return -EINVAL;
>  
>  	/* Paired with all READ_ONCE() done locklessly. */
>  	WRITE_ONCE(sk->sk_bound_dev_if, ifindex);
> @@ -654,12 +650,7 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
>  		sk->sk_prot->rehash(sk);
>  	sk_dst_reset(sk);
>  
> -	ret = 0;
> -
> -out:
> -#endif
> -
> -	return ret;
> +	return 0;
>  }
>  
>  int sock_bindtoindex(struct sock *sk, int ifindex, bool lock_sk)
> @@ -678,15 +669,12 @@ EXPORT_SYMBOL(sock_bindtoindex);
>  
>  static int sock_setbindtodevice(struct sock *sk, sockptr_t optval, int optlen)
>  {
> -	int ret = -ENOPROTOOPT;
> -#ifdef CONFIG_NETDEVICES
> +	int ret, index;
>  	struct net *net = sock_net(sk);
>  	char devname[IFNAMSIZ];
> -	int index;

nit: keep the reverse xmas tree order.

Also, please specify the target tree in the Subject.

  [PATCH net-next v2] ....

See Documentation/process/maintainer-netdev.rst

---
pw-bot: cr
