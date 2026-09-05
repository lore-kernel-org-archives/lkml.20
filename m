Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066482AEE1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788584617; cv=pass; b=QhHR7DTnHuGAd4Houax4kQClGZX6TLbXXgFxToL1d0AD5XuvlePQKXce/7Sg52pZc2GQYiWPnwke7ZYt/8ELKyCpCGPBr9C+DbkUE8TBCMYqHiERbmAXH2EufFW1yuDycMcP8TXDibE51o7UsUOFn6IpOi7MAJbNRJnMoqI6PlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788584617; c=relaxed/simple;
	bh=/21RzNPQD7xrfTM96+h1WAecDdpRBWhDl0owEilHAAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDTU1k++NJ+hnbeAlLS2RU9AyM02W2q3AzTUm1NiTbNN2hN/NqBTFg7Q63OzERIzqVe9+elR1LA6xkbdhnd6PjRaop5UzxXdQ6g/Fc1MGCfWqyGWFGHXm7v3YrR0SjpXhdkaYwKZGM3nUuyVNtZ0kSLoAmfvIJilq7O4kArSQrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P0MEWBeX; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P0MEWBeX"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1700418a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788584612; cv=none;
        d=google.com; s=arc-20260327;
        b=f0DqEuBUj+YIeqvNZNcLg7U1vfK7K0b6u8hvyGhNsblkj+ruWt4H4Iy4wTGLPIeIcb
         91ZsuPQEsCm9Y29SUCarCfWM6V76rLmvZHyRL2PuWsNc2VWqP67cgQtAjLOwOIy3enSO
         BaMTK9dTz7ZwjZAW0DDdrlPDoFzrhEQkSLCeKDzVXa2L9rm2KY2P8C60nAYTMn6MHnM5
         5puVIAGeKDHfG+gm/AbC8lXOQp22qU1ScjfISHZ6TQ15ZqE3jh3yE0aE86x8CSNESMQe
         9ZpmSzegOqZTm+qQaOJiZr9CHUKU2DV9ZL94z7GoU3j8YFo5vnRDoEzJrlfuJZgUOI16
         K72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dGA2Mcq21FlK5ZYfe6/lNBf/DykvEi95f+iz3baYnsU=;
        fh=ivPK83FoE8DQumAbGOz/qy/4oM9zz77wQeYkKp3u+6o=;
        b=qIqmjpOiZMWWylQ5mtEOlFX61GJua9H5gkxkdt87QirPeWrBl7JKi4htdx9ZwDieZn
         MM+toYm67WwbZ8Hl36sD/zfQPxyIIoewlY/T58jMbO3gwJXitissbt0NCdKAn5G3+pXO
         f3gifYFs5WB9Ql5RBK7zOuefVR7n9xcyrVBmvSIeA1VLh/7GZglfGS991nULBoEdL8MZ
         /VntW/E4bdm3+jhY769E6a/qpCWBFGQ/8b6WGSgmYwP/sQs7i6z9lgprWFaecGzAQgIC
         jF51zKn6fcHFo/sG+X5WEZxQc6dS2Qk4zJfPRT2nmGReIROUq31sh2Zus3u3iAFuWbI5
         j3NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788584612; x=1789189412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGA2Mcq21FlK5ZYfe6/lNBf/DykvEi95f+iz3baYnsU=;
        b=P0MEWBeXBEvHAgPRLTxnRMQro8Wg3zzYLfTKiH4le+Wb2MNJUtApzKqwmvT6tksk8H
         JBT5SWa8OgjbIKrDZfIqGwcVPMnL5snuqoADBr+7ZLoef+VBfFVqYWETprQsdG8goESO
         WwidGxjtXC1YSO1XI22toeOo682r1gbwV2WKfj6V4tcDM90AXNQ8XAAq9wJdRX5VBmdJ
         rNGZ3fQBebkrDliONbQjAPJED12lSFZqp9c5tOKXvyvMENoYovv9jir6jbE/J+KojR4h
         dUKjHcxjgdmxgKfplIGvvRcfiprhLSFkGe+ybzocmg+SKaFLb7gTw4lvpOkH2vhz8jtL
         LZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788584612; x=1789189412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGA2Mcq21FlK5ZYfe6/lNBf/DykvEi95f+iz3baYnsU=;
        b=epI78O/HCLn/Kf1bNCiahd9kSCZNUXSWfGOkAKe+0q4BoYGu0kQ/ab02HTuSmIkojF
         9SPrsvC6uMYOn9aeajljM1pDxH+ZtjO4hJDoEwWQi7klFqubABYxEjaJfUaft/ypIhgb
         Sc3d5ORU4mYGxIlZwnHk6LuVfgVwvtI+3RIU4Js+/JYec8mo9IS+gjDMJ+WdFDC7ZQIE
         R8VW6vfQdXQzcpaR/dddTCryulP3YV8//ZGrMbOuIkCZKaOK6B0MgczdiGfrFQw3y8mK
         T/cbFqLcLmE67mYN48lLK4NM0RMj9OXpQ2L+WtxgxP/ljB77g2E37MLQEZ2jJBlDvlb4
         G8Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwmqa70bjqYmJrZQMLlufGEsVwsiKhDaEmjaVKsB5Y0LDj2KktenhVwtuyxHi4bNX61TZAe7TF99FZ3fjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lPNadqIez/tOU+I86tAl0j85YHeD6Oyo8aDHirNB4v+RKPczQ2
	l91Eejm3gq5lTo5CpRG5L58kvdUqsPz2/xYPzwEtv1SS1J+4wkxXn+quMiHJ6SLbivjYrBSWXDL
	gbWk5Xq0QiyRLeXIBmcfTeFLDtRIV9NY/j2GDz10m
X-Gm-Gg: AYBFou2dHMfHpEmJqIHM0VlXf62YBurVrwSYPUyqfXpg2a65tqTgkfOAtL3n8KGSyMG
	0pMQXpmHiy7ZZqMQPI3jJRUyPIJq8Ay9qBOaTv036sarEKHBqmD182LaFyyWW0Ce+S2BM8mx9FX
	vTOW8yM8W+lcsif/pB0536K4OZ+EIl090HftqVgC9xy4X7BEZv1gVPtyt+klBo7QZp2Ok+0cuuZ
	ef8vEUK7EZpYHbuBh9Gi6qcHi/h7Yj4DD0+IQ70sQXo34m1BB/RDb02rbmlPB+k+hvKZslCZo8K
	IsE1KLTd2c7U0B0JpeQAW4bhtpTwsfJ+Ja8kgqe0rAoLDwNymFeIQG2J5f5bKzlcaSKOTHkNnjh
	d63KfN0U/vishJoKBdg0+ddoIrKWZNMh5l7K4mu0q3ZtaP9u2L4uy6bwI/UaqgCcjKok7J7Nqt8
	V7v3yMf9lyJvsXJVUzFBTMuTc=
X-Received: by 2002:a17:90b:3d48:b0:396:5f7f:52f5 with SMTP id
 98e67ed59e1d1-39b260e13e0mr15346017a91.3.1788584611809; Fri, 04 Sep 2026
 22:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902073334.397685-1-ruanjinjie@huawei.com> <20260902073334.397685-2-ruanjinjie@huawei.com>
In-Reply-To: <20260902073334.397685-2-ruanjinjie@huawei.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 4 Sep 2026 22:03:20 -0700
X-Gm-Features: AcwNN1UJ7xwWxxQ81tPyjPpyE-hF9bqjWtpFyW1Lxujb4Xxpx3uiU1MQORH7rPg
Message-ID: <CAAVpQUAw4ybYXUuosJ2esyhjW2q-o73-i+sAB2bJyPjE6ZaOUQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/2] 8021q: Fix data race when publishing vlan
 net_device pointers
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, nb@tipi-net.de, sdf@fomichev.me, 
	liuhangbin@gmail.com, da-x@monatomic.org, jeff@garzik.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 12:32=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> A plain C read and assignment of the net_device pointer
> in the vlan_devices_arrays leaf entries lack proper atomicity
> and ordering barriers. A concurrent lockless reader on the packet
> receive fast-path could observe a torn or partially initialized
> net_device pointer, leading to a potential out-of-bounds read or kernel
> panic.
>
> The data race occurs between the netlink/ioctl configuration paths
> (holding the per-netns rtnl_nets_lock or RTNL lock) and the softirq
> receive fast-path (holding rcu_read_lock()):
>
>   CPU 0 (Writer, rtnl_nets_lock/RTNL)      CPU 1 (Reader, rcu_read_lock()=
)
>   -----------------------------------      ------------------------------=
-
>    rtnetlink_rcv_msg()
>      // RTM_NEWLINK handler with RTNL_FLAG_DOIT_PERNET
>      rtnl_newlink()
>        ops->newlink() =3D=3D vlan_newlink()
>    OR
>    vlan_ioctl_handler()
>      [ADD_VLAN_CMD] -> register_vlan_device()
>
>      register_vlan_dev()
>        vlan_group_set_device()
>                                       netif_receive_skb_core()
>                                           vlan_do_receive()
>                                               vlan_find_dev()
>                                                  __vlan_group_get_device(=
)
>                                                   // Speculative / torn r=
ead
>                                                   [Loads bad net_device *=
]
>            [Plain C store]
>            array[vlan_id] =3D dev;
>                                                   // Dereferences bad poi=
nter
>                                                   // during device status=
 check
>                                                   vlan_dev->flags (PANIC!=
)
>
> Fix this by using rcu_assign_pointer() in vlan_group_set_device()
> and rcu_dereference_raw() in __vlan_group_get_device() to enforce
> proper ordering and memory atomicity for the leaf entry traversal.
>
> Cc: stable@vger.kernel.org
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Nicolai Buchwitz <nb@tipi-net.de>
> Cc: Dan Aloni <da-x@monatomic.org>
> Cc: Jeff Garzik <jeff@garzik.org>
> Fixes: 5c15bdec5c38 ("[VLAN]: Avoid a 4-order allocation.")
> Link: https://sashiko.dev/#/patchset/20260825095422.3166067-1-ruanjinjie%=
40huawei.com
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
