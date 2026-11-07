Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052070;
	b=xNu2E8fpLYrHqM+GMRPDdbZYLdcJyJqGm3MgkdIACjdqdNgegfzdEIMeVxTX+rrCwC2n
	 CmlC9V2Fp9O3B48FDq8e2uJoHmWRV9ACZHwrq8AdnuNOZAwQz0kzG5XUAfHPUTO5NiMMM
	 APPvujxoubES7+zE7RqtjOBFVYa94QCl43UglzBhoFbyMBNOVt0D5g9FNG02yQRBFmCvm
	 6WBU9nBzx0wa/eUp1pKtndqjvS5BuCALNnw8dcTfhqJmKgUpJjasLB7DzhKGnhtp5RHdb
	 yWInyVPQZl3uNM+TVPzb7iRy4WR1k/9+W7BtzZwSCsoLu8MqUl8y34XJ3c76jxd5jbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052070;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=GnHezEpsy7TwQxHl7QCtA4TWsPZS/fezs0Pa1IH2a4Q=;
	b=ADZ8SXqtXlQGUzvpD9qc+Het4CCZW2mZiTFddUnJpUCznm7YVdV3eBZcNmbPnWujl5Zl
	 XQ3g2lQ5xRfYMKx45CHLM/y5grIXbmPl/8ryUACk/TbpFBEdTbUupCvMm1jAIPOy76w27
	 8IYLa+WMeyrs16whspTNzzr56pSSxTydYW0nH0ORkmxJaQfQaI+Ub9xiOPzICMVfdlDTq
	 D5LSco74jOYgQpszYHyzOqNVSI5HVs542/9Zcy1JW3LlHXvwpsYar0n+hZ8RfOH5WqHhP
	 rHUtA/fMSwqXkW06hH5gZqIsU/cpkoQ6ty138xw8IvhoAGM1HAuI2DVOvRs9E4sN/lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p35pArLu;
	arc=none smtp.remote-ip=95.215.58.83
Received: from mta1.migadu.com (out-83.mta1.migadu.com [95.215.58.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C98606A331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C98606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p35pArLu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xagw4uV/cJ7unFmTqNMB0IDgo84IicTToPr/WXewfaI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794052066; v=1; x=1794656866;
 b=p35pArLuJ3P4B8gSCE7O0EMkeuGZkNORiT5GAkNt0vagOrGUXSVmb7QrboQIh4ZJtqs2Ggx/
 /58ab1+yO73qJtqSeqO/wUR01zAl71tx964nL3IIBPRJZ3/f6J3fUfRbLXKUo13gz8XDNUMU+sH
 pJ9l5E6Wu71julLJeNPhs+WU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 86d04180e8eba885;
	Sat, 07 Nov 2026 11:47:45 +0000
X-Mizu-Trace-ID: 86d04180e8eba885
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 11:47:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Zqiang" <qiang.zhang@linux.dev>
Message-ID: <a951af6957fe4890d3eaaf5a661754fc259a4b79@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] neighbour: Move the netdev_put() out of RCU callback
To: "Kuniyuki Iwashima" <kuniyu@google.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <CAAVpQUAeHP7M07uMweRePtuzPPUo-99dL6jOYUiVf7CSVUxNDQ@mail.gmail.com>
References: <20261009091941.5837-1-qiang.zhang@linux.dev>
 <CAAVpQUAeHP7M07uMweRePtuzPPUo-99dL6jOYUiVf7CSVUxNDQ@mail.gmail.com>

>=20
>=20On Fri, Oct 9, 2026 at 2:19 AM Zqiang <qiang.zhang@linux.dev> wrote:
>=20
>=20>=20
>=20> For builts with CONFIG_NET_DEV_REFCNT_TRACKER=3Dy kernels, netdev_p=
ut()
> >  records the caller's stack trace via ref_tracker_free() for debuggin=
g
> >  reference leaks. however, the netdev_put() is within pneigh_destroy(=
)
> >  RCU callback, this recorded stack is uninformative, it does not reve=
al
> >  which code path initiated the deletion.
> >=20
>=20Have you seen pneigh double-free ? What motivates this change ?

Firstly, Apologies for delayed reply.



Actually, I didn't see any double-free happening,  just wanted it to
record a meaningful callstack which on release path.  After all, if doubl=
e-free
really occurs, the callstack of the RCU callback execution path will not =
be helpful.


>=20
>=20>=20
>=20> This commit therefore move netdev_put() from the RCU callback into =
the
> >  caller's process context, and replace call_rcu() with kfree_rcu().
> >=20
>=20>  Fixes: d539d8fbd8fc ("neighbour: Free pneigh_entry after RCU grace=
 period.")
> >=20
>=20Please elaborate why your change is safe in the commit message
> and remove the tag.

Does it refer to using kfree_rcu instead of call_rcu ensures safely ?

Thanks
Zqiang

>=20
>=20>=20
>=20> Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> >=20
>=20nit: full name
>=20
>=20>=20
>=20> ---
> >  net/core/neighbour.c | 14 ++++----------
> >  1 file changed, 4 insertions(+), 10 deletions(-)
> >=20
>=20>  diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> >  index 6ed8eb075146..4263689fc415 100644
> >  --- a/net/core/neighbour.c
> >  +++ b/net/core/neighbour.c
> >  @@ -818,14 +818,6 @@ int pneigh_create(struct neigh_table *tbl,
> >  return err;
> >  }
> >=20
>=20>  -static void pneigh_destroy(struct rcu_head *rcu)
> >  -{
> >  - struct pneigh_entry *n =3D container_of(rcu, struct pneigh_entry, =
rcu);
> >  -
> >  - netdev_put(n->dev, &n->dev_tracker);
> >  - kfree(n);
> >  -}
> >  -
> >  int pneigh_delete(struct neigh_table *tbl, const void *pkey,
> >  struct net_device *dev)
> >  {
> >  @@ -849,7 +841,8 @@ int pneigh_delete(struct neigh_table *tbl, const=
 void *pkey,
> >  if (tbl->pdestructor)
> >  tbl->pdestructor(n);
> >=20
>=20>  - call_rcu(&n->rcu, pneigh_destroy);
> >  + netdev_put(n->dev, &n->dev_tracker);
> >  + kfree_rcu(n, rcu);
> >  return 0;
> >  }
> >  }
> >  @@ -891,7 +884,8 @@ static void pneigh_ifdown(struct neigh_table *tb=
l, struct net_device *dev,
> >  if (tbl->pdestructor)
> >  tbl->pdestructor(n);
> >=20
>=20>  - call_rcu(&n->rcu, pneigh_destroy);
> >  + netdev_put(n->dev, &n->dev_tracker);
> >  + kfree_rcu(n, rcu);
> >  }
> >  }
> >=20
>=20>  --
> >  2.17.1
> >
>
