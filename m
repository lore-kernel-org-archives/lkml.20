Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415964F7979
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188409; cv=pass; b=r7JPUd1+NpMEvo0xwWuGWjfyxmGCCcYO18CfGMeEjORjX4a2MXwto780hquOhgAQDwMDjdDEpisoivAe21CjRvleFox/fqnLmBXdl2g4+PgoXCOUqgfs1rosSVYkwPOWA3VkMSRIhVlTzRESgYxWjYdQCXo0PvzQ0/CWezN9mJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188409; c=relaxed/simple;
	bh=wJfBEfLv+Rwg7Tjw7PXm4/IPo+26W/5qnu3XOen5aCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1UqCJ3Q+PvfkZIPXDEP5gRaryST4dtPrjmOeJOdAGXQ0fFpemUCJMiMR0jXVrr4DTEIMOw64atKvnc5il35TWsJNHpY07qM1vDilJ9WBQGs++fnvHi5HvD+b3rmkRznQhjZ7pmyJmQCUSPTdBKALm/sTcKCa5DkHEB3WnkeFdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P79wDAX5; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P79wDAX5"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5276d598b96so27887381cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788188406; cv=none;
        d=google.com; s=arc-20260327;
        b=bFmUCnwdg7AFFdsNKwtN8HcEJQBuqfyRevQvMWXenb3QzYuqHElBaBjbT0jvmpZ/Tl
         tc8vUP4uKP2ZPYaEWnfxJUTWv/l4YZkhY2Qd7MPOhUKWfiEVjX5L/qU119n+hk2pluYe
         gncW9NGuugPzyqMOJX5sYW2P8S/eKOQfuO/C/frol32ijqnWFDGy8OQUk9bSqtioK/Ib
         AIYwOvsYnKnyQdUNbZUZBegJQ0M4aXcx8iM/q+Gti4TIxf0Jf2qZ86lnt5eYrke7xerI
         ZzLUIrXP5l4KkJv5SLxlUpWwPpmrnjjOjsD8Q4FqqVqX5JbDLarPJTFAXCXv7ojsAT9E
         PTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieLlYx0vyeXO3RjHlzi38YD4dkPfW6u9uvQpCQ5tCDY=;
        fh=m7XO3xzyafwm/RrM4/iiXfbaBW/vBqVX2/iTG7JDk6I=;
        b=lCB45WxRn2m7qEa5wcGrpoU1xdH4JqqMKW1VjD0ZB/Vdea6u7LJh2JNu0grAH5+fNP
         PxA5RA0/I0aQgjU5E4981IDfSziU38UKocYntvPD9+X/QGHOVqDBJHxLwWs1++RZtZaF
         x7+nf9Nc1+ZXVUAogsPFuV9oiZ3HsGgQIYwpDqN3Tf6ZK79jUnY+0MYEPGNDpAl3kHYQ
         aYRL1rWpRqgkeQ+IUT0xjOEqXavpjDzZNhyU+AbOPs8OwLbTdH9KIsyce6SXV6UxAzCf
         HVvcJM82ly6wJkaGn2Zc2nWNc3c9MNWvelLSmLi/Rh5XJzBlt3WeG6isH5Q2TmSnLL7d
         sxkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788188406; x=1788793206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieLlYx0vyeXO3RjHlzi38YD4dkPfW6u9uvQpCQ5tCDY=;
        b=P79wDAX53bYBYWUXDZ2VsNAg102RCtC0qfkqJcxkXHMHfl/MlUW3MaUlp5GQSRgI7O
         AQRITMc6tCwwAzaT/gAX1pXOQV01XuPESk0Y6n/o1AlI+BgC4QD5+5QcTxvaP9YqaOh5
         87F+5fiBTcMzma5MyguEOYxdIjzGpfpCyce7sAI3EpyfNYk8787vd+S5btzW2Av3sO51
         FVkNMZiS4TqKXqMa6E+/ecy8R/wCBZKvlX1iXI0crAY0YpCXbjkQSic6rq6Fx9L2q1kY
         /P9jG/Qt5uLaFMRa4w+ANb4jTd26ncW7/GQzDClxU/B2Y5vAMILdRqWNsZTokl5PA27c
         wBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188406; x=1788793206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieLlYx0vyeXO3RjHlzi38YD4dkPfW6u9uvQpCQ5tCDY=;
        b=RMnSPUH5JUQyibI/4Wnc5ptWkaVczKKS3i77DAykNzL3BR9kazOH122wwW/ulEw70L
         MutGJ4FsQ4K9Oe8icRGaESRa/yYyFKoPgGGUjF6JSBQ2uenOuWnWsKbANlDu1SV+Y3kj
         Uxp2DOVJNKYyL4BxoygrKw0saVoQ/5cwKHHJtJZI90EbuW+xSxXhDxqvPPnwjB1+VF9X
         k5PB+LFRTaVScuqGEommIJBykSJk8IoBa9RmzqQK7NZSvFnutmLC+jK75pB67Zdw7DUG
         FLiQG67rSj/P+IpCRbPogcDHfdfz/Oy+51MamO0VVG6RfNsA0WvZPhP5AYfXr/2Tg78r
         0m3g==
X-Forwarded-Encrypted: i=1; AHgh+RqJt+joacOJDKLoeqhoLR+VuoSRgwuXdtpoQl5ZvlkZi5EXWb7ew0cUK9UVKe+bllCP91EQKueeyMtgQ6o=@vger.kernel.org
X-Gm-Message-State: AFuF++l49q1oFIA4SISJr4GcTiaDy6Npej8WaUl75HIGrQn8QW9BDTzY
	Xkoi3zA8/3tOkuatXdRg6cUFui1spo00A5tykIHbBd34r5BRamJ7I/hlCt2DtiTi8MBNhoG3Yjf
	OS+lWaaUv0NJA5H8lHT/IlLDzbj4U8zKmwmS5yTDD
X-Gm-Gg: AR+sD12kbmZJngl5VAKSEAi7JLanHGtfQQndAqyCncjGjW82wQbucqI4djT5ohulHZm
	FbgEkUFEtSvHkP6SwiQq5i5oIS/M+0qa9xPk7MK0vzlm0GX5SKf+DEEzG5DzEpPJJ80vpil9mmg
	kQn9lxYOZrll7QUFdgBPOBBrM6MR2lHshxj5ig/3vPyohSLvTaNg6KuPFA1WQgBQHO+v4m4uUV4
	AMu4/N9Hrr5XGaTU90Qld19KHaNzocYbjBYzT1z0mTGphNCiMZyrADG45Ox3ECHFCD5gXx1bT0m
	k3vn50q4Ig69MebVoDtDoCKpf4GvNCPQT/3CGMP6c+xdaraKuK1KgyGhQeqrPf1a1/xNWF7QSgk
	88qQnehF1uW4W49o7FG+1ppckcB4PSa+PZFj3nRzuXBcwn8NRg7p4tq8e2A==
X-Received: by 2002:a05:622a:2512:b0:530:4ed:c251 with SMTP id
 d75a77b69052e-53021b9e3b4mr18674631cf.12.1788188404846; Mon, 31 Aug 2026
 08:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5a786da9-f9cb-4957-938d-51000793a4a8@mail.kernel.org>
In-Reply-To: <5a786da9-f9cb-4957-938d-51000793a4a8@mail.kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 31 Aug 2026 16:59:51 +0200
X-Gm-Features: AcwNN1Vj061KqWNnfn0-xipzLG7ZbvfYcBi0Wps-v1a38_YeDBMpkiOsYiD2FwY
Message-ID: <CANn89i+FVuGcPv=uBhYMrHfmMpkEnPTcLX=joWbZtBiqLSN-gg@mail.gmail.com>
Subject: Re: [PATCH] rxrpc: Fix use-after-free in rxrpc_destroy_all_peers()
To: syzbot <syzbot@kernel.org>
Cc: syzkaller-bugs@googlegroups.com, Marco Elver <elver@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Howells <dhowells@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-afs@lists.infradead.org, 
	Marc Dionne <marc.dionne@auristor.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, horms@kernel.org, linux-kernel@vger.kernel.org, 
	syzbot@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 4:41=E2=80=AFPM syzbot <syzbot@kernel.org> wrote:
>
> From: Marco Elver <elver@google.com>
>
> During network namespace teardown, rxrpc_destroy_all_peers() iterates ove=
r
> the rxnet->peer_hash table to print leaked peers. However, it does so
> without holding rxnet->peer_hash_lock. This allows a race condition with
> asynchronous peer destruction, where RCU callbacks concurrently remove
> peers from the hash table and free them. When rxrpc_destroy_all_peers()
> accesses the freed peer, it results in a KASAN slab-use-after-free.
>
> BUG: KASAN: slab-use-after-free in rxrpc_destroy_all_peers+0xcc/0x150
> net/rxrpc/peer_object.c:461
> Read of size 8 at addr ffff88811089e420 by task kworker/u8:1/13
> Call Trace:
>  <TASK>
>  rxrpc_destroy_all_peers+0xcc/0x150 net/rxrpc/peer_object.c:461
>  rxrpc_exit_net+0x7f/0xc0 net/rxrpc/net_ns.c:114
>  ops_exit_list net/core/net_namespace.c:199 [inline]
>  ops_undo_list+0x43d/0x8d0 net/core/net_namespace.c:252
>  cleanup_net+0x572/0x810 net/core/net_namespace.c:702
>  process_one_work kernel/workqueue.c:3322 [inline]
>  process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
>  worker_thread+0x92d/0xe10 kernel/workqueue.c:3486
>  kthread+0x388/0x470 kernel/kthread.c:436
>  ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
>
> To fix the slab-use-after-free, acquire rxnet->peer_hash_lock with
> spin_lock_bh() while iterating over rxnet->peer_hash in
> rxrpc_destroy_all_peers().
>
> Additionally, insert rcu_barrier() in rxrpc_exit_net() prior to destroyin=
g
> peers and local endpoints. Without rcu_barrier(), rxrpc_destroy_all_peers=
()
> races with pending RCU callbacks that drop peer and local references,
> logging spurious leak warnings. Furthermore, this missing synchronization
> causes a downstream panic hazard in rxrpc_destroy_all_locals() because
> in-flight peer releases leave rxnet->local_endpoints populated. Calling
> rcu_barrier() ensures all pending RCU callbacks that drop peer and local
> references complete prior to leak checks and local endpoint destruction.
>
> Fixes: 17226f124038 ("rxrpc: Fix leak of rxrpc_peer objects")
> Assisted-by: Gemini:gemini-3.6-flash Gemini:gemini-3.1-pro-preview syzbot
> Reported-by: syzbot+c876adfab6362679008c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dc876adfab6362679008c
> Link: https://syzkaller.appspot.com/ai_job?id=3D7fecbeb2-cd9b-4ca2-8149-4=
8663e20b153
> Signed-off-by: Marco Elver <elver@google.com>
>
> ---
> diff --git a/net/rxrpc/net_ns.c b/net/rxrpc/net_ns.c
> index 9a9834145..c00cddfd3 100644
> --- a/net/rxrpc/net_ns.c
> +++ b/net/rxrpc/net_ns.c
> @@ -111,6 +111,11 @@ static __net_exit void rxrpc_exit_net(struct net *ne=
t)
>         timer_delete_sync(&rxnet->peer_keepalive_timer);
>         rxrpc_destroy_all_calls(rxnet);
>         rxrpc_destroy_all_connections(rxnet);
> +       /*
> +        * Wait for pending RCU callbacks that drop peer and local
> +        * references to avoid spurious leak warnings and panics.
> +        */
> +       rcu_barrier();

Hi Marco.

This rcu_barrier() is a pretty big hammer as you might guess.

Please ask your LLM to use pre_exit method in truct pernet_operations
rxrpc_net_ops
(split existing rxrpc_exit_net(struct net *net) in two parts)

pw-bot: cr
