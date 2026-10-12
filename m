Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E154B1B26
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824281; cv=none; b=JNAsPTW4JrMShxOt5bf8PfkXnBWwMONFr4I5LVLLS3VkqLxCA0LoZLtbPl2QRasTfng2imwXMQtNnU1iymL94LDvFTKJaSPvitKPGfAmd2WGk/giPK56A/AndB5zNb+DNEvRH2GgZnjaKcj8yev6PvZBE351Z3kjzB0AN4o7kGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824281; c=relaxed/simple;
	bh=jCrJHhg9LmoI7hpxLeknAoCWjFflwD4GcffxqEOx+x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tP7wzj793lkwGX9TvKJYnPd/kk02qXzo4q7TfGXKTFIFoBGKVqi/qn2MuOVtyc5gkJf2jzKUnYWzIJ2CqCHpqls7+UKGzUAjM6aw2paHx3HB2IevY2QwlCDYQNvhHRDh//yhJgOfTI7+vDfO228YLvZpgym6hgw8Sz2DaziSd8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n7nzLGjr; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n7nzLGjr"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d561173f9fso15171205ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791824276; x=1792429076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lk3jyk+L25op/gK9ZsPi7IfvbejvW+IuaDGcTZaRnIE=;
        b=n7nzLGjr0vi3iGJrn3PYjtRXP1XDVcaHTCsmZ78sppuyb0NJxCIh6daMJ07t8bPUSc
         wVTr1p6r19yo6LrzbFaiMu5uP+P11/zoW7ldVBNCzspn0Yy4rrVWuS6qg95JnUBxDA6u
         bQUiTt/BiOAKLzChwveHcWtvMox8QCJ23WUApozwGSMrZoC72VwAU/QQVCt4t1luncho
         Ku8y2mNq0ZQyzZVZZOAXIAsaPq7HGXVzLhanZU5HdBNPQ3WNv69WjAfobctAWRTJrJjk
         0UdL5RhO706ecw8NBJ40noo48dCZFL8PdgMN7Q0JUjmsWXfwd9vuLhnBcIDlitYFD9CS
         LZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824276; x=1792429076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lk3jyk+L25op/gK9ZsPi7IfvbejvW+IuaDGcTZaRnIE=;
        b=PZzUEBmmYcrQHpn5ps8PgkwOaH27AsRKu5JtkfMlEGVPMeVcpBOb1ju0grR+Dv3kOs
         IwbzFytbARJYJYqmH1nJuhQenTmUG9XHJcnIGEOcQslvTCrFAm9S74IGqh1juR64Bghy
         mZDPMYSViY+3MaBzhDIADJtpGTE98CNyVRKKAuWW3Z/2lcovXdp97nhtFCXQ1cMFOm8c
         Ev66NjMpQ8jVK+OqqMyVCA0NrbAs3lcIfXEEq/QMVqxMYH9rJjjRlAjmCpQSvW831jOK
         KZZxMrPJjG7WW2xCNuTCmnS1OLe/qukrhfCqugmyKR2Du4die/rSBsNUJgC2U8bSy8Nj
         PTig==
X-Forwarded-Encrypted: i=1; AKwUvBybOiJnKMVydLTUtfOHsmxVM2KQXoTjyf9CN0K1v0vu2dVTd7SLULeBbhQ4xpzfGbYrhqN6phRkp3GzuZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv9E0zSvh4Ge6w1aLIW1iY1fmCMfq58jM1RHR8sjd1F85KiypZ
	UU1qBwuxuivlv/sWeJ6Nm3W/rC9NwtLvc0g5yAcTHtOkzJadU5F95vmr
X-Gm-Gg: AYBFou2LmELFiuIck2h4ShfwGKvjvGECANnC2336bdidxGiEA8nSblFx6yEUSSPKR02
	7AhRoXePL9db22lk+odJ3kCZLMyeE+ylj1hfCV7tszhAQcFbIqlO6xVHSdBzpboGwFPe89sj2i9
	Hyzb8DlV+pNt+kChKA9v+iMhoiFag8j1sv1J0dxG21P+JO7BRgNQSWgXwHP4qL0TtxHyVAEqFWp
	FbTQk38kmYnypKtjcDWd2DN/jH2Oe83xuhOZt70vSUmf8aesoNLK0AuqOZRLnpkPZ4R8MOo8bkv
	QZpXH2KZY9Ph4jcztE4nBJDI5hHKHnnoVCSQy52Jyqmyu8iHj9rsmYbem+SxcnJ/UsArpXV9LPv
	pa6ciWWcqmme4X8ORMOFaw68qyUIUQubrfEbCqb/n+Hg/SHEBoZ5Wh915gVJeQD1aZZoWTsFrhX
	mMy3ir+QIbNSGPvvNCUPGkXq7/whjrj/XFJWGmYzhs5mpWkNo57L1NPniaaTlsshCT
X-Received: by 2002:a17:903:1b6d:b0:2db:39da:90f2 with SMTP id d9443c01a7336-2e84280aed6mr90426765ad.8.1791824276254;
        Mon, 12 Oct 2026 09:57:56 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8dd5sm46996085ad.55.2026.10.12.09.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:57:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:57:50 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Taehee Yoo <ap420073@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v1 2/4] net: devmem: detach TX bindings on
 NETDEV_UNREGISTER
Message-ID: <as0LL7IcZas6IPY2@devvm7509.cco0.facebook.com>
References: <20261010025532.839559-1-almasrymina@google.com>
 <20261010025532.839559-3-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010025532.839559-3-almasrymina@google.com>

On 10/10, Mina Almasry wrote:
> TX devmem bindings (NETDEV_CMD_BIND_TX) have no bound RX queues, so
> mp_dmabuf_devmem_uninstall() never runs when binding->dev or
> binding->vdev unregisters. As a result, binding->dev and binding->vdev
> dangle pointing to freed struct net_device memory, and the dma_buf
> remains attached and mapped after device removal.
> 
> Closing the netlink socket after netdev unregistration dereferences the
> freed struct net_device in netdev_nl_sock_priv_destroy():
> 
>   BUG: unable to handle page fault for address: ffff88824ca9b000
>   Oops: Oops: 0000 [#1] SMP KASAN NOPTI
>   RIP: 0010:netdev_nl_sock_priv_destroy+0xbd/0x1e0
>   Call Trace:
>    genl_release+0xf5/0x190
>    netlink_release+0xd01/0x18d0
>    __sock_release+0xb0/0x270
>    sock_close+0x18/0x20
> 
> Add net_devmem_dev_unregister() called on NETDEV_UNREGISTER:
> - When binding->dev (the physical DMA-capable device) unregisters,
>   erase the binding ID, clear both binding->dev and binding->vdev, wait
>   for in-flight RCU/TX readers via synchronize_net(), and unmap the
>   dma_buf under binding->lock.
> - When only binding->vdev (virtual device) unregisters while
>   binding->dev lives, only clear binding->vdev so no new TX sends match
>   the virtual device while allowing in-flight TX packets on binding->dev
>   to finish DMA safely.
> 
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Fixes: 1abe839b34ae ("net: devmem: support TX over NETMEM_TX_NO_DMA devices")
> Cc: Kaiyuan Zhang <kaiyuanz@google.com>
> Cc: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Bobby Eshleman <bobbyeshleman@meta.com>
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: Kaifeng Wang <kaifengw@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  net/core/devmem.c      | 45 ++++++++++++++++++++++++++++++++++++++++++
>  net/core/devmem.h      |  5 +++++
>  net/core/netdev-genl.c |  1 +
>  3 files changed, 51 insertions(+)
> 
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 5e4070b82df44..da7b3e8abaa13 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -169,6 +169,51 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
>  	percpu_ref_kill(&binding->ref);
>  }
>  
> +void net_devmem_dev_unregister(struct net_device *dev)
> +{
> +	struct net_devmem_dmabuf_binding *binding;
> +	unsigned long xa_idx;
> +

[..]

> +	rcu_read_lock();
> +	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> +		if (!percpu_ref_tryget(&binding->ref))
> +			continue;
> +		rcu_read_unlock();

You use net_devmem_dmabuf_binding_put below but do not use
net_devmem_dmabuf_binding_get here.

Also, I feel like rcu_read_lock/rcu_read_unlock dance is confusing. bindings
are not following rcu lifetimes. Can we race with __net_devmem_dmabuf_binding_free
here? (xa_for_each returns a valid binding, then before we do try_get it
gets kfree'd)
