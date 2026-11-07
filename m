Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794080050;
	b=Z+pq9MSDb698meNdODk4esHvsQ4nMDedwYYmOD1xGq0+esjcONf5JrTdaxP+gVt/nk9n
	 wEGHaPW8tLcZah9SHe1vuNPBLEHb7hTx0CdQv3sXnaaPu2/DveF2U4iZCQc2BlGZHwtFX
	 7XDoazHhDnMO7YFHNk5eMypM+lPeccT/UZcTbjZFSUNI4sIPl1b6Rvtl9QaAmXawZq8o5
	 8+R9OO482vm6UJ7AE6ZxbphlXP/TuqcSj9iXEhtjtK338+uVRtIgeapx6uOeeyX0VX4Hw
	 wNBWZVdfgRL4jxAwnqNvkhpyujpTxVkAaWgme1J6w1XNY43yMhAmLvZ5R4rGcphxYPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tTMbY5wDu0Q9kyyP5WALVTT8c1BJMdKWv4LGJnBFjhc=;
	b=Amv8+MiHIR2Rm1hKlfF+5kLRiijFHwJPqMApnqUHOTaBBVYGFTzCyIIE9JxX9GL63fC4
	 Id1TXz3wW7P/4DvFsz1z5LkWluuiJzXq7SpUivX9kka1VPrEv2y6fCfIzCnp5a4mjuvm0
	 6aY8hrkU0T4Xxlle5/fI+bsqtldM2rypHBDU19W8LSNAoeLYypp27myoY2hJKTgwU61kQ
	 ZS/mwOxYEHTZAFml/91p02CLCxfXqTcKu4jmx4g0jaxIvjD3Jw3OqKC/lJXcH20/d7cMj
	 6F/BAE6uEWv63iw+gckB/lvO5UJAwTCGr4dqk5LKMhYqB9Bs1Ng4PBDg2gmWj9e8Syw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KLxrqfM7;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D933606A338
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D933606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KLxrqfM7
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed00709df0so15869275ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794080049; x=1794684849; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTMbY5wDu0Q9kyyP5WALVTT8c1BJMdKWv4LGJnBFjhc=;
        b=KLxrqfM7u7uxgIMHAjsKmhtRJzAp+RwNzVoYEu9m3l2q/VEQBRvxR1azMIMowRWtPU
         Ybh3pdXyLOYMy1vxHG0BXAtbMhHhuIxUO3+VoL+GnSeEH3Esy/WeYhTkcPWiy3EpVsh7
         gehZbvSgUJi/5SNvluEmcUyx5I6iEdvs+cbgyuh+WtIoSqrUhQS0kzQ7cr7SHEXbBIV1
         a7Z26cEUJQTt2eiUv3xLTJu6Z8Ya+TUVV4okI/1exFuGUWd+dHdXCxnUg2YIz8ELkThA
         B9ymKTEVZOYuApXh1SHPhckbNuw5P68jP0PYlcLW4PAzcMSss6BUnIm3JSDZmbAWLZVT
         V5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794080049; x=1794684849;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTMbY5wDu0Q9kyyP5WALVTT8c1BJMdKWv4LGJnBFjhc=;
        b=0DdB32tAO7ZkJJZIFV4pSQi8kZagwP0Z50JNC0bnI/0XtNGif0p+y5x2q2iBN8DqWZ
         h51p4hj9zuF4aVipCdefS8i238Gc7wDoOlxye5JrtwMvlnJEBF6qQ2ZoMoTu7s5BO7hW
         UhI8E4bBBOutNobWv1EXN3bLpBamc/wpuoy7rkUIMKTa39qHT0G0f/3Ls9gKHlfj1tun
         zbtpKxRdaoSAAlgCRf2UBpeo7HI++DyvwuT019XGDa3ybD5TzAOrnMWEiIgoDcEdOAvB
         uKInJusIw1lZe+u3rDcqgpTvuf70SYRewgeDn9Yq3wwL3r6VD+zOEr1yvX7nrNSGl6w4
         iP3Q==
X-Forwarded-Encrypted: i=1; AL+hErE2mOGfasrOOdSDkRkkp/Dx0PTbi/l029uBkJqkJj99b0lvLOY7Bda0a3eau84wZ4Ak4MdHpuntNar7pPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aHoBjxlx45HZOmSc7MX3CFKSPZWFeaXEtobT4UttbP3k5TjYO
	k3ljevPY5jPJOo8Ehgpze7AZg5B3Gpdi4YDa3Ym1me8POC4Y1DXavm5G8tePjvKjYEAfccrNhjx
	GQDdJgQ==
X-Received: from plon11.prod.google.com ([2002:a17:903:1a8b:b0:2ea:ce88:ff88])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88e:b0:2e9:9a19:c4f
 with SMTP id d9443c01a7336-2ed40e89b01mr67905115ad.61.1794080048300; Sat, 07
 Nov 2026 11:34:08 -0800 (PST)
Date: Sat, 7 Nov 2026 19:34:07 +0000
In-Reply-To: <a951af6957fe4890d3eaaf5a661754fc259a4b79@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261009091941.5837-1-qiang.zhang@linux.dev> <CAAVpQUAeHP7M07uMweRePtuzPPUo-99dL6jOYUiVf7CSVUxNDQ@mail.gmail.com>
 <a951af6957fe4890d3eaaf5a661754fc259a4b79@linux.dev>
Message-ID: <au99DNHQEsaaDqpJ@google.com>
Subject: Re: [PATCH] neighbour: Move the netdev_put() out of RCU callback
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Zqiang <qiang.zhang@linux.dev>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, 07 Nov 2026 11:47:45 +0000, Zqiang wrote:
> > 
> > On Fri, Oct 9, 2026 at 2:19 AM Zqiang <qiang.zhang@linux.dev> wrote:
> > 
> > > 
> > > For builts with CONFIG_NET_DEV_REFCNT_TRACKER=y kernels, netdev_put()
> > >  records the caller's stack trace via ref_tracker_free() for debugging
> > >  reference leaks. however, the netdev_put() is within pneigh_destroy()
> > >  RCU callback, this recorded stack is uninformative, it does not reveal
> > >  which code path initiated the deletion.
> > > 
> > Have you seen pneigh double-free ? What motivates this change ?
> 
> Firstly, Apologies for delayed reply.
> 
> 
> 
> Actually, I didn't see any double-free happening,  just wanted it to
> record a meaningful callstack which on release path.  After all, if double-free
> really occurs, the callstack of the RCU callback execution path will not be helpful.
> 
> 
> > 
> > > 
> > > This commit therefore move netdev_put() from the RCU callback into the
> > >  caller's process context, and replace call_rcu() with kfree_rcu().
> > > 
> > >  Fixes: d539d8fbd8fc ("neighbour: Free pneigh_entry after RCU grace period.")
> > > 
> > Please elaborate why your change is safe in the commit message
> > and remove the tag.
> 
> Does it refer to using kfree_rcu instead of call_rcu ensures safely ?

I mean why dropping netdev refcnt waiting RCU gp is safe.


> 
> Thanks
> Zqiang
> 
> > 
> > > 
> > > Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> > > 
> > nit: full name
> > 
> > > 
> > > ---
> > >  net/core/neighbour.c | 14 ++++----------
> > >  1 file changed, 4 insertions(+), 10 deletions(-)
> > > 
> > >  diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> > >  index 6ed8eb075146..4263689fc415 100644
> > >  --- a/net/core/neighbour.c
> > >  +++ b/net/core/neighbour.c
> > >  @@ -818,14 +818,6 @@ int pneigh_create(struct neigh_table *tbl,
> > >  return err;
> > >  }
> > > 
> > >  -static void pneigh_destroy(struct rcu_head *rcu)
> > >  -{
> > >  - struct pneigh_entry *n = container_of(rcu, struct pneigh_entry, rcu);
> > >  -
> > >  - netdev_put(n->dev, &n->dev_tracker);
> > >  - kfree(n);
> > >  -}
> > >  -
> > >  int pneigh_delete(struct neigh_table *tbl, const void *pkey,
> > >  struct net_device *dev)
> > >  {
> > >  @@ -849,7 +841,8 @@ int pneigh_delete(struct neigh_table *tbl, const void *pkey,
> > >  if (tbl->pdestructor)
> > >  tbl->pdestructor(n);
> > > 
> > >  - call_rcu(&n->rcu, pneigh_destroy);
> > >  + netdev_put(n->dev, &n->dev_tracker);
> > >  + kfree_rcu(n, rcu);
> > >  return 0;
> > >  }
> > >  }
> > >  @@ -891,7 +884,8 @@ static void pneigh_ifdown(struct neigh_table *tbl, struct net_device *dev,
> > >  if (tbl->pdestructor)
> > >  tbl->pdestructor(n);
> > > 
> > >  - call_rcu(&n->rcu, pneigh_destroy);
> > >  + netdev_put(n->dev, &n->dev_tracker);
> > >  + kfree_rcu(n, rcu);
> > >  }
> > >  }
> > > 
> > >  --
> > >  2.17.1
> > >
> >
