Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C32E736A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751755; cv=pass; b=R3I0sM6pbtRUrFCHAPRjuqhmxkrlxE7HsPCyVab2i65CkuxEvkrRG30/Pi2770E5kbEx54cjG+VSZ6Ik+SnoPofqqJhRTeVP9VH7mcTJnVcAOJrFKYHdbC2aIgyFUOi3ziZAIB6aRZWxCLBHj89YXmunRU+BJcbvLXMrJedF9sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751755; c=relaxed/simple;
	bh=GSAAlThqfE8mUuSgAVPRXZIyOsidSPdBFMqj2RYB3UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYAsIqeLAdhCw1CnfBCRtaNOtY6u375IEmk/Rrq5Vc6eNsmlHOi6ewe/Qby9/qVNaTla1ffWOgEAqE5IomfJ2cwZ0jeAhGhYQALtVyh5L4bKpGQ9P9ATGzqSTo2dBylwCaAOeI0IGhuSrWTVyTN/cKX+q0B6+5szo8zU/U3dp2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=k1Jq6bFz; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="k1Jq6bFz"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b6031cbc6bso2595063e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788751750; cv=none;
        d=google.com; s=arc-20260327;
        b=XdE1sOMONSEBrJttrAu4nVrHdXItMf1vaLTHpuYA9QpDiiBBglBjzWPVeRFN1VTE2r
         acPz3E5bRIguyqx48Olucw6sGezxLpPMBeWZA9i1Cjr8DwLo55rzNzWemWbCiZDF1PYn
         0qWN+3rjpAsLu1GI5Kx3wTrekm/BDLoeeE9pBK7I16KgyFkX5vJU+S4IAUQWz3sfN0Pk
         S4kegCaonbEKbllZRN5M/iDf4MZbjzxcS+aIpysJQH+p9njkBXb5ZSMuFpRcGLcVRRNN
         xsFBWip5OHXb1EgEfQVGoA9qs+de4woN8i5rzAZf5vUwWxiIorpsUkRKsX3QtPfcbQIY
         lY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uw7bun+2UCN5MoW38axYgFXx6bpXxJj3jRNtGXiPoTo=;
        fh=BsJXBRz0bLxYzAKWb4sY1yZ76UiG0VZ8lgjIRHLbp1I=;
        b=sPmqp5ScRqdavrE+RJZmN3LozZDajhv1HzuyfCKtCc+goSACPhBiLVsKNnzQtLYDC2
         iv/g3MDASf07RAJ/Zd4w6LVMkLFRG895PkrljrMICR8065mGyHnzE/j0FpjfB47798YY
         Hk4yFfkherKrpWEWTcS0wCJJYxQy1UPLvywmFbtMGZxap1Rs5sLf+pfaVfhkbPbKQms4
         A8kd76FGzF8QXJKJbMlK2+zSFLfCvRj42QIqjWjPPJiixWJWVOl4xfdBx1pFr9pVRmqe
         VGin2QugXzmW5IoZULbScEh+R1/4h59/frztaZYz2GtAYL8OJN+tXHpGUbgungqNsE+X
         WqeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788751750; x=1789356550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uw7bun+2UCN5MoW38axYgFXx6bpXxJj3jRNtGXiPoTo=;
        b=k1Jq6bFzpt6yZigC9BWXTCg/ragq0H7SEQBUp/NcUNobqw1NFp0af6lWR8ThZ4lM1R
         m5PZZvsnVyps/pOuezHF3EUc0waTGgJs6JNDG1vefH3qP61zQahKXXrnc+fgDVvry4Lm
         hdmxDOKqjxnp91bvz4aR04Kki3VOe3oDo/+CC2FxnGhBquc9pXi2umy8H25jIN+FNcRP
         XuYFX1OKdpmRH8+g0M2BXoTwNGEOB8Fh/D071eemYgclyUOEXsKWSSbG6zgGyAobNkTZ
         AlKom8pbQnwn8sAvv7x2sQFN3bSH+1F1peCfWsL1V3R4C2Fv1mPPEHZMiPOY9gTf+Nxa
         e/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788751750; x=1789356550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uw7bun+2UCN5MoW38axYgFXx6bpXxJj3jRNtGXiPoTo=;
        b=rI7P0mJabBJm/NVJSwVL+LAKCJnUz8c2cJ4EbgXSiQkX9qt2lHKs5fKSE9y44Qn7yt
         eJOzfxlFMD5I0IJjTEtxxgrFrfHNLozWBJQWKi+mgh60mK6pPMtsgw18SnGmwNDk30re
         i8WV4VmeL17jamm2ismoOLkFLdySB/lv6wnyhor9X+Euch+8qxSUMmzyHsOxYU0GB6m1
         0eXuuDenfJOs5l09H7CLZe3PjS5Ihf+DSAtrJ06d/MTmbQrIniqou9jpUiBOipX4nAH+
         0u838VomZruEbltxEMdfc7DCkwTWK5OKcSg36dPfGve1z2wMGmKRlE9b+L1hmL9MujX7
         Od5w==
X-Forwarded-Encrypted: i=1; AKwUvBwB6mFIjSgEzoKXezwsLbDEAvn8avpY600UUlHH/O1tFayJDIxFzvqSwWWLKMlwNTjq9WsB08URKu7AmZI=@vger.kernel.org
X-Gm-Message-State: AFuF++nJTu44yzb8hj9v6Rxl1eP79rF2dy+T/HUqiGEZDhM7X9NsJibn
	RleHgrhgDm+NZGSNnAdETmqFcqYaXWpeywGk5cMBSr/lX9uPo6/sfCfYprX9Q58NhVvJRrZPasn
	t1jyjvThSi1+rsulcigSMkFuJATqI9IjW4vp/yDz0w+s=
X-Gm-Gg: AYBFou1TzktIN0C60D7ijFBk/EZLF9R9VbC8hxICWGgTnR8kL0T+cXkwpW5WefVi92h
	66hNwSGWSUG7JjwTaaB9oVo1IGMz0YTuiUgoqrkageLsfeTNjXS/UKt2ytlCYR1UnDgEAnK+qdv
	wl5nXxaVHjkkYZyQTUKled4tBbydjSeXnhXy3opjf7xe/HmH1Q6TF2ZfB2gJ+Lmxb2g5aRi+W3z
	l38ExZmV96sc5gPsqkoaN1S9I2BEAJjNM8WcM8ZqrVmDJ3RJ/uULuiHnXRoJAgazZIMeCq9djNu
	st2hYHmMcdkOXOYeBNr7EJstjraMHJ1wF7WoUxPScHJy1FsEoXLvPi2jOBY2rtoHgnxdB+R+EVw
	=
X-Received: by 2002:a05:6512:1325:b0:5b1:4caa:4b43 with SMTP id
 2adb3069b0e04-5b616e53bfemr3832223e87.0.1788751750243; Sun, 06 Sep 2026
 20:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788622674.git.zihanx@nebusec.ai> <5fc14a8ba754126b6897939e11154167281d4c5f.1788622674.git.zihanx@nebusec.ai>
 <20260906181910.GA455897@shredder>
In-Reply-To: <20260906181910.GA455897@shredder>
From: zihan xi <zihanx@nebusec.ai>
Date: Mon, 7 Sep 2026 11:28:57 +0800
X-Gm-Features: AcwNN1Vs7jM1fB-2aADxommDInJ89MOY2aFrDlu6fxu3INigQ3uPZpKfJT-CguI
Message-ID: <CAANe3eTObpyHno0X+aAgRBeWVSNgdQm4y4E5GAAUVevDf0sKGw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/1] ipv6: ip6mr: fix mr_table leak from MRT6_TABLE
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Patrick McHardy <kaber@trash.net>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 2:19=E2=80=AFAM Ido Schimmel <idosch@nvidia.com> wro=
te:
>
> On Sat, Sep 05, 2026 at 04:30:07PM +0000, Zihan Xi wrote:
> > MRT6_TABLE is supposed to select a multicast routing table id, but
> > ip6_mroute_setsockopt() currently calls ip6mr_new_table() for every
> > unseen id. The new mr_table is linked into mr6_tables and is only
> > destroyed when the net namespace goes away.
> >
> > A raw ICMPv6 socket with CAP_NET_ADMIN can therefore loop
> > MRT6_TABLE(fresh id) without MRT6_INIT, close the socket, and still
> > leave the tables allocated. Repeating this grows unreclaimable slab
> > until the machine OOMs.
>
> Isn't the established way to deal with this sort of issue to simply
> account for the memory and assume that the admin put some kind of a
> memory limit on the container?

Yes, that is the right approach. v2 tried to reclaim empty tables and
that was the wrong direction.

I will send v3 based on your diff: GFP_KERNEL_ACCOUNT for mr_table and
SLAB_ACCOUNT for the IPv4/IPv6 MFC caches.

Thanks,
Zihan
>
> See for example commit 6126891c6d4f ("memcg: enable accounting for IP
> address and routing-related objects") and commit 5d26cff5bdbe ("net:
> account alternate interface name memory").
>
> This diff [1] accounts for the memory of both the multicast tables
> and the multicast routes.
>
> With your C reproducer and this diff I get:
>
> # echo +memory > /sys/fs/cgroup/cgroup.subtree_control
> # mkdir /sys/fs/cgroup/mrtest
> # echo 64M > /sys/fs/cgroup/mrtest/memory.max
> # echo $$ > /sys/fs/cgroup/mrtest/cgroup.procs
> # unshare -Urn ./mrt_poc
> allocated=3D1 current_table=3D1 maxrss_kb=3D1788
> allocated=3D10001 current_table=3D10001 maxrss_kb=3D1788
> Killed                     bash
> # dmesg | tail -1
> [   63.360047] Memory cgroup out of memory: Killed process 297 (mrt_poc) =
total-vm:2424kB, anon-rss:92kB, file-rss:1448kB, shmem-rss:0kB, UID:0 pgtab=
les:44kB oom_score_adj:0
>
> [1]
> diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
> index e5f2b1c6150d..b9c544d48c45 100644
> --- a/net/ipv4/ipmr.c
> +++ b/net/ipv4/ipmr.c
> @@ -3376,7 +3376,8 @@ int __init ip_mr_init(void)
>  {
>         int err;
>
> -       mrt_cachep =3D KMEM_CACHE(mfc_cache, SLAB_HWCACHE_ALIGN | SLAB_PA=
NIC);
> +       mrt_cachep =3D KMEM_CACHE(mfc_cache,
> +                               SLAB_HWCACHE_ALIGN | SLAB_PANIC | SLAB_AC=
COUNT);
>
>         err =3D register_pernet_subsys(&ipmr_net_ops);
>         if (err)
> diff --git a/net/ipv4/ipmr_base.c b/net/ipv4/ipmr_base.c
> index 867b24beded1..a0ec6d19a237 100644
> --- a/net/ipv4/ipmr_base.c
> +++ b/net/ipv4/ipmr_base.c
> @@ -52,7 +52,7 @@ mr_table_alloc(struct net *net, u32 id,
>         struct mr_table *mrt;
>         int err;
>
> -       mrt =3D kzalloc_obj(*mrt);
> +       mrt =3D kzalloc_obj(*mrt, GFP_KERNEL_ACCOUNT);
>         if (!mrt)
>                 return ERR_PTR(-ENOMEM);
>         mrt->id =3D id;
> diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
> index 3f2ed9b77deb..9d8116b5edb1 100644
> --- a/net/ipv6/ip6mr.c
> +++ b/net/ipv6/ip6mr.c
> @@ -1427,7 +1427,7 @@ int __init ip6_mr_init(void)
>  {
>         int err;
>
> -       mrt_cachep =3D KMEM_CACHE(mfc6_cache, SLAB_HWCACHE_ALIGN);
> +       mrt_cachep =3D KMEM_CACHE(mfc6_cache, SLAB_HWCACHE_ALIGN | SLAB_A=
CCOUNT);
>         if (!mrt_cachep)
>                 return -ENOMEM;
