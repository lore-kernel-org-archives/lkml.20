Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661290;
	b=KCuTQ4FZPR6feJmeFClw+fpvhfu3E61JmNBGwkr66xXLk5M0n+YmKHf7354AQ+JNs/cB
	 8E4+ukJDt3eRxaocCjHr6AnstDKIx+J9jJse+NeGXmLJZf3qV39ktkp8FIbcZ4/AhMwh6
	 Yfr726zCKtvjIJXJOQLN9dcBPLjCPOyhwr1F6fNCX3ndJ2KrU5lbKt3dySV+b3bsvRspk
	 NDgURyViW3RCQFR601Mc5AS8v92CzhO7inVIFpXxwh8aGGHtsZHFg5EKmI3j2oJzMNWYU
	 IQSyZEAKWPQoRZTYMziqpmSf8TceDMWiyqoJ3TT9wOLQe5FNF8XpXaMyCNFPGL1dvCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661290;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b16AqzWrmx6PCjjmVkdtVIc26QQOCuhEY/Lbc4sfw0A=;
	b=v7FCEkC7+Vf1czkBpZ2DWyUF81c6Z1jpvuhT9dhXO0HuO4cif24QSMiWRg4LCvXHEnnh
	 Zd21/3TYqIt6UOs6xNpA0UKWqpd/u72HOIw1a58ghqWi4BGWx1qlQKxgeBC1TvmLH4n86
	 sX+Hm0S8JjrXUgnhJGW9Z4n7savx4aXEYzNX3r1Is5CvAhE9f6qGDYzYKhUqTCMTIctss
	 rVkKveBwTRltlIM48JQnblwCw+KHTiAlRZWxyo8KXYP8Lt1HXZOSOTQz6uPrFxqKFa1n6
	 gBJad+/qGLfbsKHtC5dFhYYeglYXm+V4eitjz6ZvacsY86Tz/01v18Q3VcVDrtuCFiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOqbMHwP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B253606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOqbMHwP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1F31F000C6
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792661289;
	bh=b16AqzWrmx6PCjjmVkdtVIc26QQOCuhEY/Lbc4sfw0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SOqbMHwPQWFi2YRT3gLRpyy8kS0AYPzz7YKl/yzqATxW9ta/dm6RhhDSfjkwA4amX
	 g/tTTeX5NXjQnfQXtbIdL97EgeJq8IXdqtOOa5JnfqBigVr6pNhdGOuuWPwSbz63k/
	 tzAI3vIllHt2tYqlzyshzMJqPwtb+J2xw3KrFEZukUufJA4RMwksRmiIuhvWeJiZ7n
	 dJEb0T+pg13rQbtKwNBIYyy6lJ+Y5zmiHhjAy6iq19ZsOI4Wu2NfzwyeiIXICAF/at
	 we1+CP0j/Mm1Rb3ASiPxyWArpqwlgckHqGZ6ES2hB/uQhc5NakCOEyEzwHSN5RIoxb
	 wni9+cctFAlYg==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8490a7d6696so1023057a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:28:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhh+otRgOn5o/Gegcqr459QKP9iGZeLd+Jm6qhzl3iRo1f2/nOC5sk2SZtBVu6pQU4Ni9bg/lmJF/zUGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIORImtAV7QUiFsdBNVRGsW76yUxvg9ZI5hs6NZxATamkubqv6
	rxaM0coqP9I5EJsvqSvUI8DNxO/7iBs6EMgj2CZu0MBKFiu6ky6gHSKq7LYjsAFyAmiN8JPp5Jx
	gIVqXqUo3SGkehjRuWaZZSMGUgUS2Hrg=
X-Received: by 2002:a05:6871:6681:b0:49d:c3f6:4191 with SMTP id
 586e51a60fabf-4a7dc15cb9emr2583880fac.18.1792661289186; Thu, 22 Oct 2026
 02:28:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022090431.3641707-1-teel4res@gmail.com>
In-Reply-To: <20261022090431.3641707-1-teel4res@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 22 Oct 2026 11:27:57 +0200
X-Gmail-Original-Message-ID: <CAL4Wiip9-oGNjrgQV-VSkDR_hfq35d_+ymX_itYk29u9scY=Mg@mail.gmail.com>
X-Gm-Features: AclHuK-mJUESD7RYwjo_wmXzNyLsWvwMRTYfXqXRI4IDUC_o01XXw1PdqN8O9Bg
Message-ID: <CAL4Wiip9-oGNjrgQV-VSkDR_hfq35d_+ymX_itYk29u9scY=Mg@mail.gmail.com>
Subject: Re: [BUG] net: bridge: late FDB learning can outlive an MRP port
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, bridge@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 22 oct. 2026 =C3=A0 11:04, Cheng Yongkang <teel4res@gmail.com> a =
=C3=A9crit :
>
> Hi all,
>
> An MRP-aware bridge port can remain in BR_STATE_FORWARDING during
> del_nbp().  The terminal br_fdb_delete_by_port() runs before
> netdev_rx_handler_unregister(), so a frame received in that window can
> learn a new FDB entry whose dst is the port being deleted.  No second
> FDB sweep follows.  The port is then RCU-freed, leaving the FDB entry
> with a stale net_bridge_port pointer.
>
> Observed on Linux v7.3, commit
> 08ab31164c55f20c7a2653de3186ae333470e2c1, with KASAN+UBSAN:
>
>   BUG: KASAN: slab-use-after-free in br_forward+0x55/0x3c0
>   Read of size 8
>     br_forward
>     br_handle_frame_finish
>     br_handle_frame
>   Allocated by:
>     new_nbp
>     br_add_if
>   Freed by:
>     kfree
>     kobject_put
>     rcu_core
>
> The failing sequence is:
>
>   br_stp_disable_port() leaves the MRP-aware port forwarding
>   br_mrp_del_impl() restores BR_STATE_FORWARDING
>   br_fdb_delete_by_port()
>   ... late ingress frame learns fdb->dst =3D=3D p ...
>   netdev_rx_handler_unregister()
>   call_rcu(&p->rcu, destroy_nbp_rcu)
>   later frame -> br_forward(stale dst)
>
> This reproduced in three independent VM boots.  The target bridge code
> was unchanged.  Because the test VM has no driver that accepts
> SWITCHDEV_OBJ_ID_MRP, a small diagnostic switchdev endpoint claimed the
> MRP object and widened the already-existing post-FDB-flush/pre-unregister
> window.  It did not replace bridge logic, modify FDB entries, or alter
> net_bridge_port lifetime.
>
> The deletion path should stop new RX processing before the final FDB
> sweep, or drain the deferred/FDB state after the RX handler is
> unregistered and before queueing the port for RCU free.
>
> I found no matching upstream fix.  Candidate BR-007, BR-040 and BR-058
> are consequences of this same root cause.  BR-040 gives the forwarding
> window; BR-058 independently describes the stale-FDB lifetime.
>
> The reproducer, module source, and complete serial logs are available
> on request.
>
> This was found with AI-assisted source analysis and fuzzing; the kernel
> behavior above was reproduced under KASAN.
>
> Thanks,
> Cheng Yongkang

I suggest you stop sending these emails, we all have LLM you know.

What is the point, if you do not send patches?
