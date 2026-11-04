Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818476;
	b=ZerwvZYge4lxd5Pcymd3pTuJiDpV7jj0Nnhq6nb6ohkyPFnScrEELBJ/BDllXAQUXoPV
	 p8ZHuxAZRVzhGAFFxpLA086SCZkeSV63vxLiHtabj4OeHRmjOTBnpq6h6YgfSpuqlOIFu
	 1d/D448JTwcVGxFM7qz0d12PJyNFHFMFeugAyTHSaxWQ9by0ic3s/8Clxy82slhpOZIDW
	 w6azaCrKdV8IS+E0DsP6VsQ6aQJlcTg2zciO3rzO4GR52E19FhYztAu8plgvsCXj8bFKc
	 GpCN8cmbXeSNU1oKypEVfpaQixI4EfqoOqB/SlgchDkeGzfeMA4HKXI545KeFYYXR4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818476;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=as3D3aYhSIPQsb3CvkJTVuYWCDas5wXhOyjIY9yo5yo=;
	b=vaZNttMFb4px2dsf52vunntkGwDPQhCyEFUUD7QU/MIjT6R5mfEuquBOrOxhh7aOI+kY
	 VQyWDjvNhl/+lbXTgkF8owShJeRJPEUkJmsz1JiRQBtUQh5Ph4u1TWqxp9ARInWBdZQgJ
	 DswFOAh8a5Tb9IPc1INckWdBtCTAvMQs3LLXJblxQdo7jrUBPH/9gTOvCr8+tsAKH3jDy
	 X/lCHKtPsJvB6McJ/Q5dnxLPATfSqzm4wq/qI2T7MHk63Br0Vis0wH4ChTpfv/Q9M0+A4
	 vyVxFLk7lVuNZWBo7apkE+Dg5iuftFrcAdRIHId+sH23yoPS4sGWajWkhmFf4YF+xIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hojbtNFU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301656082BD4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hojbtNFU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EFB1F00A1B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793818475;
	bh=as3D3aYhSIPQsb3CvkJTVuYWCDas5wXhOyjIY9yo5yo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hojbtNFUNbZv0kS5EeBrObTOGokkNfm2N6Q2ZdsgIOeOXCdrPsCundlUuAI7/tKzK
	 aga13OWLvO0S7S5Mqo5M9plnI/UArcDnUD0Z53jdxVkDl16Ejpcgwqsb9sYw7/4G3k
	 doFIlofDbaa0tFp2MbMSDEz4NNlgwe4vKVFn2r29dRM2Ffm+17NajDLl1mu1ngjoev
	 nZnKFdEiv/NvAY0+Kx2p33+6pqdeRC8FhU4glkQEbIKerfFpQeNpbaP5vZS2F2oLUP
	 5//RqsaVM0btC/C78V8VmiwG6llv54oVhpaZm7mjD8Zw/OXgYdvh9+zoizf8H75S8Q
	 3K9sW3Www9Wdw==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4a75a5fa32dso337354fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:54:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzhEo5JkyOngFz+iRyS/14aLGzqvememE6AzopUCcqoElxcJvJW1Wegm7D7TXUUm7i133g2XozAGE7LFJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PnUYgdEmiKpx8J0H1ZvMwByeSoDUDHBApjgJs66Dk1QErTOaX
	s3UfZlbtaOpG9vdqcmAJ5lGGCs2CD62S5wjQLDpUKTkmoQKqmaW3CDtsu6lV2a4uzlIbV8aihDP
	ITHpkdyrovqAmFc2SOZmyeN60iDsi1MU=
X-Received: by 2002:a05:6870:3313:b0:49e:43e7:1187 with SMTP id
 586e51a60fabf-4a9076395dfmr10797327fac.21.1793818474246; Wed, 04 Nov 2026
 10:54:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104182058.2673882-1-me@chasehil.tz>
In-Reply-To: <20261104182058.2673882-1-me@chasehil.tz>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 4 Nov 2026 19:54:23 +0100
X-Gmail-Original-Message-ID: <CAL4Wiir-KjBF-rdqH3_KcjbBruVAC2JN_B_S4dYHph=bpZkbKg@mail.gmail.com>
X-Gm-Features: AclHuK_RW9JPnwbOHE7QkebXPrqe_xwfOF_lfHvATslXaa0OuUjc1Q9Es0Uo7mA
Message-ID: <CAL4Wiir-KjBF-rdqH3_KcjbBruVAC2JN_B_S4dYHph=bpZkbKg@mail.gmail.com>
Subject: Re: [PATCH net] ipv4: route: don't blackhole in-use routes when
 retiring fnhe routes
To: Chase Hiltz <me@chasehil.tz>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	weiwan@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 4 nov. 2026 =C3=A0 19:21, Chase Hiltz <me@chasehil.tz> a =C3=A9crit=
 :
>
> When a route cached in a nexthop exception (fnhe) is replaced or
> flushed, rt_bind_exception() and fnhe_flush_routes() call
> dst_dev_put() on it. That sets dst->dev to blackhole_netdev and
> dst->input/output to dst_discard*(), but other CPUs can still be
> using the route, e.g. as a noref dst taken from the fnhe under RCU.
> Packets that reach dst_input() or dst_output() after that are dropped.
>
> If dst_dev_put() runs after a forwarded packet has entered ip_output(),
> ip_skb_dst_mtu() in __ip_finish_output() can return the MTU of
> blackhole_netdev (68), and ip_fragment() can then drop a DF packet and
> send ICMP_FRAG_NEEDED with mtu 68 to its source.
>
> This was hit on a 6.12 router that sent ICMP_FRAG_NEEDED with mtu 68
> for packets it forwarded. A kprobe on __icmp_send() showed that the
> skb's dst had dev =3D=3D blackhole_netdev and still had the PMTU from its
> fnhe.
>
> Commit 5018c59607a5 ("ipv4: fix race condition between route lookup and
> invalidation") fixed the same race in rt_cache_route() by putting the
> old route on the uncached list instead of calling dst_dev_put(). Do the
> same for routes retired from an fnhe. rt_flush_dev() still moves them
> to blackhole_netdev when their device is unregistered.
>
> fnhe routes are also retired on fnhe expiry (ip_del_fnhe()) and
> eviction (fnhe_remove_oldest()). Those paths don't bump rt_genid, so
> without the obsolete marking ipv4_dst_check() could still accept the
> route. Keep marking retired routes DST_OBSOLETE_DEAD, as dst_dev_put()
> did, so that users that cached them, such as sockets, look up again.
>
> Tested on v7.4-rc1 with network namespaces: a router forwards IPv4 TCP
> (iperf3 -P 8) over an ip6tnl device whose PMTU update creates an fnhe
> for the destination, while a loop adds and deletes an IPv4 route. The
> sender drops incoming ICMP_FRAG_NEEDED, so it keeps setting DF.
>
> Over 60s without this patch, the sender received 505,291
> ICMP_FRAG_NEEDED with mtu 68, and the router dropped 67,024 packets in
> dst_discard_out() and 599 in dst_discard(). With this patch there were
> none. Neither kernel sent any without the route churn, or without an
> fnhe (ip6tnl with encaplimit none).
>
> When the sender accepted the ICMPs, its route to the destination ended
> up with "mtu lock 552" without this patch. With it, the route had no
> PMTU.
>
> Deleting the tunnel, its underlay or the peer netns under the same load
> (12 runs) completed without unregister hangs or warnings, with and
> without this patch.
>
> The same tests on a kernel with PROVE_LOCKING, KASAN, DEBUG_LIST,
> DEBUG_ATOMIC_SLEEP and the netdev/netns refcount trackers produced no
> reports. Lockdep recorded the new fnhe_lock -> uncached list lock
> dependency, and in a separate 20s run 109,305 routes were retired
> from an fnhe through the new path.
>
> Fixes: 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly")
> Signed-off-by: Chase Hiltz <me@chasehil.tz>
> Co-authored-by: Claude Opus 5.5 <noreply@anthropic.com>
> ---

Co-authored-by: is not a tag we use (checkpatch complains about it),
please use Assisted-by: instead.

The changelog is also quite long, you could move some of the testing
details below the --- line.

Otherwise this looks good to me, thanks.

fnhe routes are never on the uncached list while they are cached,
and the fnhe slot is cleared under fnhe_lock before
fnhe_retire_route() is called, so there is no risk of a double
list_add(). rt_flush_dev() takes care of the device reference.

Note that IPv6 has a similar issue in rt6_remove_exception().

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
