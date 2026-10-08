Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763D03B2FF7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484648; cv=none; b=AFYpHpp4ki7y11rOJ3XqZGPCxQYHVkPJF50YHXlj8BKLr88s6B20XuLNl/Qoc8O/jcLPVCGsrbLGqMrdsZpCbAGv17q7Qnuum4lZVuKaHAxLPz8upWmHr9XmxLeNanAg18OevSuQg7zG3/B/eky080ixrOhTgPm47mK9jao5RIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484648; c=relaxed/simple;
	bh=r24BLMT/AXZeJc/3ihPOte4d7uyHmH1m249fwkrlx7Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mIlaD6GjsxkjTZfX2+PKjXwNjh8f6blSSHNqLD6gC2HM2hXnrXnoiPcG5i5z3QrU+q7AljGOvewQofuCy1cH3pYvQqC09BoBq/U0je2kYrQP6mpWFA78Bf5hzskzZUG85e1mAoxlJ6dlOVyI9TEllxwA75WouFUGG0G+CcQR7E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kd3HTTqn; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kd3HTTqn"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67718201466so3163198d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791484645; x=1792089445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TzkxNQgy8ThJfs6qel04DqfDgpOkTC3bFiwmq4clDIs=;
        b=kd3HTTqnGgUX7+yssMQPbwNm4iawVOtyIsxrjcpPJ+xUd7ukTA0RDlEZXqH79HPRQG
         CDLGFUXWg7BXnuSPGYO4RiPHVhhllRQh3lwULnL32aNaoJrz2MvD4fo3wuD2tSLKwVdW
         tOHaeeNyTYgCGELqGKIqc/ZyXUPhQ0K6/FtZPzE+tnS3Zzr+cSShcsCrv5FgxTIUC0UE
         WwM6RcPWmwRpP03eGWvlw/P67TDUKa+N8fKndJEcLujM9M+KgAAE2uEtMdKeVnLop7r7
         5xCiOowvBWjTB01cEQYQasagV3r9hbHlTg9UWtMnq+0Is0kUtOq5UKbI7dcbGwbqsNMB
         FUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484645; x=1792089445;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzkxNQgy8ThJfs6qel04DqfDgpOkTC3bFiwmq4clDIs=;
        b=CsmKKEYNjU4PhF1dlXZe7ko+rgZSTfxOiqt89oG+kpM/ecli0o2Ap31w8wCNCsLbin
         LnBGbvttHm/1XqbGttx5HSEkHGIr255l1MhNTXv0I5w8y4dDtIM24PenGyeVF+jtf07s
         9XVSYoTABpHNHc1g5+NkKSh7Oi9+HgNaydAEt0tOJVKbNfPBM6bvLc06EDiahJprzrzb
         bKrq7pTMPcmxZl0NMQoLeTWPSuKwaQelSREHhcX2BUPli3xey6sjtpqHxRIGTG+Ofq+9
         HyRNoU8ZbEyIx8WuG+y2x2Xar5ClCMNoRjjkm5kHoI/uWnSX7GuZ7I7kgL4o2qlrrsyi
         Duwg==
X-Forwarded-Encrypted: i=1; AKwUvBxNmyuP+goe4WZ3iL7ZA21kJn29CPb/xJ5Z3xTyNyyNwsuYqHrxVcNUknLW+SdpGP8fjQBlWYFJrzubZzY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYgnOs2PCg0PkHUZmygJoCVBsg70IgkB/b6cMJ2vG6+98CAZbx
	vNgoNYXYA9Qye0tKY2oPY5VUyDxSjFjTto7Fp//ofNguTnY1LdJ2LZSG
X-Gm-Gg: AYBFou3543NuKQ0BOzLc7fAYG1yW8b5NwO3edHWEPVQDHhpQxYrLhyLf0hLCUco0YAD
	SDRCSar7WJJbcFw/wZk7bVn6yL228Nnw5Ph1Yr7jC5gTcux6G11idzOMdw4avVtmmYe1s05zlSy
	ttASKQyPosmEGz34KfgQKJUup6p65iLujINt33QUrUhfZa6KwAIYeqfcKbkAW+BLTA82qiK/zcN
	3WdUFIQXU1QsWXBwWZA9mn71HjfILoJ1g1o2nXTPnpdoPG01JDSkvYFTGB4wCw/WBlC3NjW0xuV
	wiD34019JMjmfQPbC0qS9qCXTA6CzpuHJEOnYNmNZKnqYjIJQZHLfXy9/YGm4ktI6G3iRBgxX/A
	2d4fh5AvEkwPR7JHb6BHPmu2+pCYXJ0YBDpQFSvOoYH5fULBjNGso5LAk6VNZmfs25nQUeOZIB/
	V7ZyombAxnmfldplcfasZB6VkjemHO88ZPc7IySeJ/hS1aS0L59O30k2gvrSoM6++xfjTZ+Wuph
	45cCsuAZBxAK3DY9ODh8plqeZYDDU3OBV1HhjR0eAwbKQn1Myh2Kno6jIVH5WdcUidw9m41FmzR
	Zc0IALYXIKYgjjeztveohDoX8JYZQocVtRA6GA==
X-Received: by 2002:a05:690e:134c:b0:677:d849:d9a3 with SMTP id 956f58d0204a3-67909f0bef9mr3735096d50.1.1791484645322;
        Thu, 08 Oct 2026 11:37:25 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07d69a4f0sm10907b3.41.2026.10.08.11.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:37:24 -0700 (PDT)
Date: Thu, 08 Oct 2026 14:37:24 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 rafael@kernel.org, 
 lenb@kernel.org, 
 pavel@kernel.org, 
 willemdebruijn.kernel@gmail.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 linux-pm@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 stable@vger.kernel.org, 
 =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <jeremy.jean@oss.cyber.gouv.fr>
Message-ID: <willemdebruijn.kernel.cf8fec88827c@gmail.com>
In-Reply-To: <20261008124106.665014-1-Jason@zx2c4.com>
References: <20261008124106.665014-1-Jason@zx2c4.com>
Subject: Re: [PATCH net] udp_tunnel: drop packets when hibernating
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jason A. Donenfeld wrote:
> The kernel's various networking applications keep churning away after
> userspace is frozen during hibernation, even as a memory snapshot is
> being made. This can lead many network applications to an inconsistent
> state, replaying packets and cryptographic state changes. For example,
> on wireguard, there's the possibility of this sequence:
> =

> 1) hibernating begins
> 2) handshake state cleared
> 3) keypairs cleared
> 4) new handshake round trip completes
> 5) machine memory is snapshotted
> 6) packet is sent using new keypair
> 7) machine is restored to state (5)
> 8) packet is sent using new keypair
> =

> The idea is to prevent (6) from happening, especially if (6) and (8)
> contain different data, but the same key and nonce. Presumably the same=

> issue applies to other users of udp_tunnel too.
> =

> Fix this by just dropping sending and receiving packets during the
> hibernation sequence.

A few high level questions:

If the issue is reuse of key + nonce during send, why include receive
side functions? Specifically tunnel (encap_rcv) functions.

Is this a problem specific to UDP tunnels?
 =

> Cc: stable@vger.kernel.org
> Reported-by: J=C3=A9r=C3=A9my Jean <jeremy.jean@oss.cyber.gouv.fr>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> I wrote this patch in response to the issue J=C3=A9r=C3=A9my raised, bu=
t I'm not
> actually super familiar with all of the hibernation mechanics. If
> somebody working on PM would think about this matter too, I'd be much
> obliged.
> =

>  include/linux/freezer.h    | 1 +
>  net/ipv4/udp.c             | 5 +++++
>  net/ipv4/udp_tunnel_core.c | 5 +++++
>  net/ipv6/ip6_udp_tunnel.c  | 5 +++++
>  net/ipv6/udp.c             | 5 +++++
>  5 files changed, 21 insertions(+)
> =

> diff --git a/include/linux/freezer.h b/include/linux/freezer.h
> index 0a8c6c4d1a82..21d708dc4092 100644
> --- a/include/linux/freezer.h
> +++ b/include/linux/freezer.h
> @@ -76,6 +76,7 @@ static inline bool cgroup1_freezing(struct task_struc=
t *task)
>  #endif /* !CONFIG_CGROUP_FREEZER */
>  =

>  #else /* !CONFIG_FREEZER */
> +#define pm_freezing (false)
>  static inline bool frozen(struct task_struct *p) { return false; }
>  static inline bool freezing(struct task_struct *p) { return false; }
>  static inline void __thaw_task(struct task_struct *t) {}
> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index b090bd1f59e8..5021932ad9f1 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -95,6 +95,7 @@
>  #include <linux/netdevice.h>
>  #include <linux/slab.h>
>  #include <linux/sock_diag.h>
> +#include <linux/freezer.h>
>  #include <net/tcp_states.h>
>  #include <linux/skbuff.h>
>  #include <linux/proc_fs.h>
> @@ -2425,6 +2426,10 @@ static int udp_queue_rcv_one_skb(struct sock *sk=
, struct sk_buff *skb)
>  		if (encap_rcv) {
>  			int ret;
>  =

> +			/* Drop if we're hibernating */
> +			if (unlikely(pm_freezing))
> +				goto drop;
> +
>  			/* Verify checksum before giving to encap */
>  			if (udp_lib_checksum_complete(skb))
>  				goto csum_error;
> diff --git a/net/ipv4/udp_tunnel_core.c b/net/ipv4/udp_tunnel_core.c
> index a128fe85620d..e3666ed96af7 100644
> --- a/net/ipv4/udp_tunnel_core.c
> +++ b/net/ipv4/udp_tunnel_core.c
> @@ -3,6 +3,7 @@
>  #include <linux/errno.h>
>  #include <linux/socket.h>
>  #include <linux/kernel.h>
> +#include <linux/freezer.h>
>  #include <net/dst_metadata.h>
>  #include <net/flow.h>
>  #include <net/udp.h>
> @@ -172,6 +173,10 @@ void udp_tunnel_xmit_skb(struct rtable *rt, struct=
 sock *sk, struct sk_buff *skb
>  {
>  	struct udphdr *uh;
>  =

> +	/* Drop if we're hibernating */
> +	if (unlikely(pm_freezing))
> +		return;
> +
>  	__skb_push(skb, sizeof(*uh));
>  	skb_reset_transport_header(skb);
>  	uh =3D udp_hdr(skb);
> diff --git a/net/ipv6/ip6_udp_tunnel.c b/net/ipv6/ip6_udp_tunnel.c
> index 32525a051a6f..4a31e8cc8887 100644
> --- a/net/ipv6/ip6_udp_tunnel.c
> +++ b/net/ipv6/ip6_udp_tunnel.c
> @@ -7,6 +7,7 @@
>  #include <linux/types.h>
>  #include <linux/kernel.h>
>  #include <linux/in6.h>
> +#include <linux/freezer.h>
>  #include <net/udp.h>
>  #include <net/udp_tunnel.h>
>  #include <net/net_namespace.h>
> @@ -86,6 +87,10 @@ void udp_tunnel6_xmit_skb(struct dst_entry *dst, str=
uct sock *sk,
>  	struct udphdr *uh;
>  	struct ipv6hdr *ip6h;
>  =

> +	/* Drop if we're hibernating */
> +	if (unlikely(pm_freezing))
> +		return;
> +
>  	__skb_push(skb, sizeof(*uh));
>  	skb_reset_transport_header(skb);
>  	uh =3D udp_hdr(skb);
> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
> index 93478d1ad576..db9c2050887d 100644
> --- a/net/ipv6/udp.c
> +++ b/net/ipv6/udp.c
> @@ -34,6 +34,7 @@
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/indirect_call_wrapper.h>
> +#include <linux/freezer.h>
>  #include <trace/events/udp.h>
>  =

>  #include <net/addrconf.h>
> @@ -848,6 +849,10 @@ static int udpv6_queue_rcv_one_skb(struct sock *sk=
, struct sk_buff *skb)
>  		if (encap_rcv) {
>  			int ret;
>  =

> +			/* Drop if we're hibernating */
> +			if (unlikely(pm_freezing))
> +				goto drop;
> +
>  			/* Verify checksum before giving to encap */
>  			if (udp_lib_checksum_complete(skb))
>  				goto csum_error;
> -- =

> 2.56.0
> =



