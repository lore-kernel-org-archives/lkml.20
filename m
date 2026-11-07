Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070488;
	b=V8zabH2z8iRdVpAOCMFTmEJYkya4sg9txJ1hUyOHd0I6bVWal6NgzXHV3e3bof707q9I
	 cPn937O7uqqEpC1wGPN/LxoB8T/E0Xih6TOSmwLty3XGjb/N5V6xfyjIwTeoOCYIasWaj
	 jN48qdFEhZfCmhYeX6wol6P0zlpfRkSMZrrL8zfZK1Ow6nJy3n+Uj5iYvYFodw7vs/0hf
	 BuCcrQR5Iwh71TwJ+WZPP1jnscu/j66O27U/1EYoX1RRq2Ch3RDh7BBWCKwBsPX2QCvn1
	 e697TuetWb80LUrggwk0HqKWtB7b3U76CSmE8hAFsf/ul1jB7l4tGuPXTY+YI088ZOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=9crvf8Iw5xDhgykteC/ydKrbY+Caq7Bxsz2VEq620k8=;
	b=37dXe5XgH5/QsF1Ld1KBtX19xEuH8QZi/ZxEwutaeXU7wDcd433LP+wWVGtL0SHB076h
	 r5oF6DNHBwhQvnH8pyBmxoZR24B2m1z5bbSabjuwO5K2hBSRZaMdZULq8hf5Box8X43Aq
	 +xvaTHcAonAkt9XH/DnKSSE5N0Q0uPOFiafajY0w6Nt3Qa6bx1QZa2X8UqEdQl/BRJ4cF
	 lcLF1EOziibmal8EXn1GrF+1F0BPvZBrbRUmDjM4KOSucCRQapqtbq5VuAhh73xWpFSPk
	 OCuPmhxmEoa4QRiwEjhXWvARd5du6XVrRGtBbghXG1eIQx+SEJQ922O6A/5/UMb/aEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ9xwmCX;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFCD606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFCD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ9xwmCX
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9d7791b00so13322425ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070488; x=1794675288; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9crvf8Iw5xDhgykteC/ydKrbY+Caq7Bxsz2VEq620k8=;
        b=EJ9xwmCXuRLVDRzge33hcKr2+q/R5m/0hsPPquNGhCKVcmsug8bFHuIiz3T1CovAX9
         VZukWJM+7/ZGGa+72Pujv/cE2agl6ecl2tcwmK+t6+zjfQrSLoUEXmKjCVIW4WkoRoPB
         n8TqckVGUqrmobnfTWeOETlbfobjxZesd+MaQh2f7uVmdVqXtyuCHHPGIRXEjhdGSRLO
         MI6SCmFLLYOwf47nWgJ+Jsl547qKwvFSsfR6TVCF7jdCbZdG3mdWreqMiryOJZFxXzWV
         muRrCXsv/Y+XK4jFLG+U+L785zpCws/1fCPfo41Y0g13tCmbNSuS+KdZ5BoPK1AhYcQ6
         i1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070488; x=1794675288;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9crvf8Iw5xDhgykteC/ydKrbY+Caq7Bxsz2VEq620k8=;
        b=Ahxz/QTZAHjxYHZ1Z2HoyHqc8krn4fIY29yY23c67ib1GcFezSlYZ3lkhbIe/ilrYy
         WPhJEJX68V8FBqgB/mJxDGZ9uzHsIjZ+VtO4zcz70M0KiWMd9KqmEQ45uxkuT5/5av5P
         BXO8OmXfc1dCT7yXlMoicTHYesy/pP1TbgYB9fT8iDcWvyH1Nuti7l3TqpoIwy9t/nUx
         0SXoHCtDd5B8wVLliUvdGIFetD7m9BaaEU6RGOVityZZEjSWCfgIBa2AYkDOzIvowFxE
         jJuZcsrybyhUq7GbXvDEEijDPodMDHtQfTAN15wzfZZhi5xP9HSp1A+rWCNj7PbHB1S6
         wtsw==
X-Forwarded-Encrypted: i=1; AL+hErGPKS5dvRkkDY8qOfhZIaU/W+UvRoU7eQI7ekEKjLfI9EGxcCSOlWaH+05iHitjkLzOGwPEByIxig144Yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cegdhL+aLjkHRPYR9DfE0tKai6E5cc2HnlRs+QnNGjiWtd44j
	10HcFHNaAHzhLKMe7/b8OgeNV28p6qZgg0u3hT/iEQjxGAWzFjLQSmptaEA+VQ==
X-Gm-Gg: AYBFou0z0/xxxIj+aTeKoD+mz5s1Q61W3mBV0KfQaxWpR5gZQ3/ZCpI/K4h1YZ8dR1d
	u6yYtHaZAw/b7DMJ4C9M1eBHpxYmdj/e3gK2eVayNQnwVBmqdX7m42ml9QobfxzgHItVYQWMoLh
	W59Xajk2MKSsCrx0ctyYb51z9LmUUm234qTz16qND9fQtdVmrJFg7ZsK5DKcllPUA8wUsYvtEE0
	2adEplgW9KfOJdk+b4Ez/7Nkfk5+Pc/vsZmNeeEq4Hg1tJKvfe4MYX+GLas4q+yR8lZylPLdE8X
	ELeNM8TXxR76nozynVBkYRYayNDt1YZpDGxo0tFb4yZHAFqzv3Hcy3jNRVsnvob/VZpjJ5hR2ZS
	yo+KjsusfBU1kF7VYnWC/RsoIAFJuE3DhAwD3Q0pou5yZi0fIx9yan01ciMEBYjyHuyw54evFlt
	lRl6ulMvFsKfuCZeCWMa2Ryg7iDNHsabDooL5eKF7UHcJbx7LmOZSSHADn56MjJTiS+xa19Wvyt
	TwISJz27sV28u1eqvuD923+F+5mipFjTTdRv+7qj+Pwz3nf6F3ArV/wKGUUU5Qs0FU4fU24mCeM
	Q9+kS5oNsOE7M0t31OjcoqhCavT1p/xraX4Y8VsTJaonze+GIml2MAOkkACLP1a/GM88K6fShMJ
	5YapTTSdbhZvw3RbjYxTe0+SyZ5ZDI/tcVXBVSjaRPPr0Qux3cLotZkc=
X-Received: by 2002:a17:90a:d60c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b0db72c4d0mr5096080a91.52.1794070487771;
        Sat, 07 Nov 2026 08:54:47 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b11b04458csm828387a91.13.2026.11.07.08.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 08:54:47 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Nov 2026 16:54:46 +0000
Message-Id: <DMP4WRIOGMBX.3VW2KNLBGDZ0K@gmail.com>
To: "Yingjie Wang" <1075151112@qq.com>, <netdev@vger.kernel.org>
Cc: "David Ahern" <dsahern@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Thomas Graf"
 <tgraf@suug.ch>, "Daniel Borkmann" <daniel@iogearbox.net>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: ipv6: reject collect_md tunnel route without
 inet6_dev
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <tencent_CB9E1044AC97882719FF3A9F5B410A562408@qq.com>
References: <tencent_CB9E1044AC97882719FF3A9F5B410A562408@qq.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 07, 2026 at 07:29 AM Yingjie Wang <1075151112@qq.com> wrote:
> A route using a nexthop object can remain after its output device loses
> its inet6_dev when its MTU is lowered below IPV6_MIN_MTU. The route still
> has no error, so ip6_route_output() returns it with rt6i_idev == NULL.

since so, should it be fixed in there?

This is the fifth check of the same pointer:

  commit        function
  ------------  --------------------------
  d101291b2681  __fib6_rule_action()
  4db783d68b9b  ip6_output()
  d46401052c2d  xfrm6_get_saddr()
  1b9b5323725e  rpfilter_lookup_reverse6()
  this patch    ip6_tnl_xmit()

Three more callers still dereference it without a check:
__ip_vs_route_output_v6(), validate_ipv6_net_dev(), cxgb_find_route6().
When the same mistake is made in N places the interface is the problem.

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 616b86f..e4834e1 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1151,6 +1151,12 @@ static void ip6_rt_init_dst(struct rt6_info *rt, const struct fib6_result *res)
 		return;
 	}

+	/* addrconf_ifdown() removed inet6_dev. The device can't do IPv6. */
+	if (!rt->rt6i_idev) {
+		ip6_rt_init_dst_reject(rt, RTN_UNREACHABLE);
+		return;
+	}
+
 	rt->dst.error = 0;
 	rt->dst.output = ip6_output;

@@ -1186,10 +1192,10 @@ static void ip6_rt_copy_init(struct rt6_info *rt, const struct fib6_result *res)
 	const struct net_device *dev = nh->fib_nh_dev;
 	struct fib6_info *f6i = res->f6i;

+	rt->rt6i_idev = dev ? in6_dev_get(dev) : NULL;
 	ip6_rt_init_dst(rt, res);

 	rt->rt6i_dst = f6i->fib6_dst;
-	rt->rt6i_idev = dev ? in6_dev_get(dev) : NULL;
 	rt->rt6i_flags = res->fib6_flags;
 	if (nh->fib_nh_gw_family) {
 		rt->rt6i_gateway = nh->fib_nh_gw6;
