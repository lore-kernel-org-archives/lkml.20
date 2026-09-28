Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896F8296BB5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612379; cv=pass; b=IAdnuRu0Qc3UZuRljikAYt/SBLdc+kse6pNMTpa1qI5x2UWeWJUaIr0gQ97CpY1Nb4GP/tRpca1z8Y4uMnRS0aXoq2bhsV8NOqfERy58Favx67nBhz3kdShcmNkabH5XQS70VOW8X2Po5hJeUGj9dcZRnxJ7Q+J6duREy4QipeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612379; c=relaxed/simple;
	bh=3A9g2ap1KJjmKy6RC23Gem9WM7kWz38YTsj8k6bVAuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPlk8X0O3VhyroXVJn6mRkpNldmfZR/otDXWHU9HPNj/ti7HHB8U6ww7tUflsfpOLY5nA3CqfzILAyH2fxv2KXo92hfaC9/YpwENrpjIuv0zyZKHcf3QnthcJzF4xET0EAmMpSKRjTaEdaqkRp1T+Y/wy8HcUu9WogVWwbOGyiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnMXcp3M; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnMXcp3M"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaebf04d43so397548a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612376; cv=none;
        d=google.com; s=arc-20260327;
        b=awRGHmehJiDSkJ5kw//JPqyNORseTiMRlp7UpjJyyQqs8eaIMTvZyFGZxrgQyxXoRB
         ZDHffFRlBbYcmFvpZJ32yqQwGWvO4UubeCLsBdPWjvFv/QvtzmTjzsmLPwGE7JrAZh3D
         OmXkWxO+stqduS0o1p8pf4MLZH/aJTVhLacEHbhA+7FLVK+ytNvf8BQMw+TgoY7ght4J
         wbyXnWU4mv3iXj4Zxn9WkwI+mkC68uy1xGy7PPjezTD+ZbfGj/w6eBsgr7hk5wtjBR/b
         gneF5psmUIvQr7rFu6ZKqy9d2K+9nwML09XJwnhT9rnBQYK7ugGvQ3gRYxSapK5N2XTE
         SLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jQvG4bGgPbdzu06KIy/TUBHX3mHhGBFPCHJQeqk8Ip4=;
        fh=6/bj5VKVk6vn7CXQ2Bej234p6e8zEi3eXFzqXg3uOQs=;
        b=chDVRb1pcwBUm3pOlnmsgT2NpLGN1kCgLU1CVvIYqpyPUeUNDIW1X5NyllKx1sTnh6
         hFozWWbdeT8tbyB05g7QrJPlVfaS9cRLa9HINvUW3n5lD3nna1PI9Cc3ds3r4fEant4R
         MX1xkE080V8iT0RpnUi0NR7GMCm4AOs1EtfeMXFlL0MQZOWKM2mwLQyLjZwLlGMIfSWA
         sgIr0ycxz6GZ1UAHikGkBUNXw3kfXr3nIy5tvrOBMBk1WBlOaJXcCE/jLfstXz9u8vYK
         Lh5+rikJDMgUs51FIMSiLygUvGnrSUsvoVtfbz5oL1udsPRJTMjwzuYyJLMAg8HufVeq
         5yNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612376; x=1791217176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jQvG4bGgPbdzu06KIy/TUBHX3mHhGBFPCHJQeqk8Ip4=;
        b=DnMXcp3MhI/3b4oLTbsXNyifDzuvrkD2UCHcUitFvZ0x3VCS8IUhqQs8BmKj7OuG7O
         mFo6HnmYbslgTFt2C/QbNGFXL3lZlbmTwE310Q0Druz7SaoRlkFQCyoQj6q/wYiTRJWC
         za1X/II2V4etC9no0oA/j4bwozoI31ZxkbPsCuREgXC1taREHZfpbHUsEE0Ozhn0xdRY
         xbM8culW/8p72mA0oGODK3tumoW9O07c8zzk/ECIMlXEm3YDwvOhiBx+3OXSrYkb1k69
         aCKQ5TuO4PyVtHfI2Byb+lHNMwP3MAqThJxjDUCZ6KSmCAo/1ISvZu5JL2NV6daXFo5w
         NZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612376; x=1791217176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQvG4bGgPbdzu06KIy/TUBHX3mHhGBFPCHJQeqk8Ip4=;
        b=Frl16OJtj0vyNsyXGGaaDI7wiT6lvDQMnJWbS8s9XtZn4GzlfoK269aMp7vHEuDo32
         5bjUbrxtjR4ayPrsjclA4uPFOKWOCnJs9+QyTuZRnd4qEv5a+E92EC0SM3FjH+Nyo5no
         XosU70PFuGyuJf4E1yYvJp53T/C/UoeGDOwhver2gsjLiwytT6WDlMgvg4ak0+hVhfu4
         5+AsFty4ntVfWWVG8pCjcqhhXTAYHhNuP5qMUCIxsYmRzMyrbSmc60fDMAt6DLe5W66b
         eg8HKYnoAni/bJFdA3rSAC0MCj6/brqaFogZ3RaNVBVl7DoGp1/fH2iuzfOpsaTZkmUH
         wU1w==
X-Forwarded-Encrypted: i=1; AKwUvBzqy+GDoOUKsE2BUHVG78lmA9HWbk7yKMjxvnhCVzQAn3/qlvvMQMcj1v9Heq99VzVnorcBhv3g6nn4WUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZKfmCK1Lib5lOtVm2i2de0zSXnS6GvdPpaXVpIoLhyibyUAoc
	rjfYI/S87rqe7dpcoyRYKNj//Azc4EmdJ1iji26yTQnJE5ASzpH/YUwSEWyfaoCRsPg4AlQAIjQ
	m99o3SVsfsKOk6kceJSNuom2HERbZswU=
X-Gm-Gg: AYBFou3JE/MDuxE6PIirvukbmSNPkY6BTs/u6Su063xf8RUTlfh6L2DImaWGgKf+zv8
	GGx/W8faoB/uWxF/JJ1yt+KzjmWJCjAjis3QwT7uqylYz630dr5rciA4EoFYhoaI5pH65CWDGc4
	TEyAKHLb83aIeywERHzGYVlSskN/mySHqN3Jt9b8HkUdwW8/2tfP8INIwoIE4r9AFXdGbxp1ZiD
	9Vu6TEPpSfCFbs/jT5F4fMNFzVhthXzTwANHIf/mvaM0VN5gkNvEAcMKOq7482A3MaKPGNEX2X7
	DQpYIDFH9X1eQHoWLD2Le7lAoYklpRSm9AYNfZ0DvMB2NJbY/zR8u1yhpohBvOVgL7w9lloXVEz
	bT2MiZN/bAA9WI1VJmQOysg==
X-Received: by 2002:a05:6402:2499:b0:6aa:e107:6110 with SMTP id
 4fb4d7f45d1cf-6aae1f1ed13mr8401975a12.1.1790612375470; Mon, 28 Sep 2026
 09:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927064036.3691962-1-nicoyip.dev@gmail.com> <DU4P189MB3750B9BEFE0E00F5D4A4D548C68D2@DU4P189MB3750.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DU4P189MB3750B9BEFE0E00F5D4A4D548C68D2@DU4P189MB3750.EURP189.PROD.OUTLOOK.COM>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Tue, 29 Sep 2026 00:19:24 +0800
X-Gm-Features: AclHuK-KsexhlYTzoGQ75pENZEy3A6R0mlRGjyq0G_Ek_LXGPOJndAF3IdORBo8
Message-ID: <CAAo+4rUEQGd0kJgMCXeJC3OorCYv120iJ0GyjaKgzKpyzNweBQ@mail.gmail.com>
Subject: Re: [PATCH net] tipc: hold a reference to nodes found by link name
To: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"tipc-discussion@lists.sourceforge.net" <tipc-discussion@lists.sourceforge.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Jon Maloy <jmaloy@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:17=E2=80=AFPM Tung Quang Nguyen
<tung.quang.nguyen@est.tech> wrote:
>
> >Subject: [PATCH net] tipc: hold a reference to nodes found by link name
> >
> >tipc_node_find_by_name() returns a node after dropping its RCU read lock
> >without taking a reference. The LINK_SET, LINK_GET and LINK_RESET_STATS
> >handlers then lock and access the node, racing with timer-driven cleanup=
 of a
> >down peer. Generic netlink serialization does not exclude the node timer=
.
> >
> >The following interleaving can leave a handler using a freed node:
> >
> >  CPU 0: find the node under RCU and release the node read lock
> >  CPU 1: tipc_node_timeout() clears the links and unlinks the down node
> >  CPU 1: drop the list and timer references, queuing tipc_node_free()
> >  CPU 0: leave the RCU read-side critical section
> >  CPU 1: complete the grace period and free the node
> >  CPU 0: acquire the node lock through the stale pointer
> >
> >LINK_SET also uses the node's media address after releasing the node loc=
k,
> >when passing queued packets to tipc_bearer_xmit().
> >
> >KASAN reported:
> >
> >  BUG: KASAN: slab-use-after-free in _raw_read_lock_bh+0x1d/0x40
> >  Write of size 4 at addr ffff888112723808 by task poc/87
> >  Call Trace:
> >   _raw_read_lock_bh+0x1d/0x40
> >   tipc_nl_node_set_link+0x30e/0x680
> >   genl_family_rcv_msg_doit+0x1e0/0x2c0
> >   genl_rcv_msg+0x419/0x6d0
> >   netlink_rcv_skb+0x11f/0x350
> >  Allocated by task 28:
> >   tipc_node_create+0x9c1/0x1fa0
> >   tipc_node_check_dest+0x121/0x11e0
> >   tipc_disc_rcv+0xdbf/0x1430
> >  Freed by task 87:
> >   kfree+0x149/0x330
> >   rcu_core+0x50a/0x1850
> >  Last potentially related work creation:
> >   __call_rcu_common.constprop.0+0x71/0xa10
> >   tipc_node_timeout+0xb1b/0xe70
> >
>
> Can you update your changelog with decoded stack trace ?
> With decoded stack trace, It helps me understand how your reproducer trig=
gers the issue.

The partial decoded stack trace is attached on the changelog on v2.
https://lore.kernel.org/netdev/179061216640.31693.424352671155791136@kernel=
.org/T/#t
I will send you the full KASAN report as well as the reproduction
method in a separate private email.

> >Acquire a reference to the selected node with kref_get_unless_zero() bef=
ore
> >leaving RCU, returning NULL if the node has already been released.
> >Release that reference on every caller exit after the last node access, =
including
> >transmission in LINK_SET. Keep the existing link lookup order and lockin=
g so
> >concurrent link removal still takes the existing error paths.
> >
> >Fixes: 6a939f365bdb ("tipc: Auto removal of peer down node instance")
> >Cc: stable@vger.kernel.org
> >Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> >---
> > net/tipc/node.c | 7 +++++++
> > 1 file changed, 7 insertions(+)
> >
> >diff --git a/net/tipc/node.c b/net/tipc/node.c index
> >bd91378b7540..2726bee3bb40 100644
> >--- a/net/tipc/node.c
> >+++ b/net/tipc/node.c
> >@@ -2424,6 +2424,8 @@ static struct tipc_node
> >*tipc_node_find_by_name(struct net *net,
> >               if (found_node)
> >                       break;
> >       }
> >+      if (found_node && !kref_get_unless_zero(&found_node->kref))
> >+              found_node =3D NULL;
>

> This checking is not optimal.
> Try this:
>
> diff --git a/net/tipc/node.c b/net/tipc/node.c
> index bd91378b7540..3e61e9106dd7 100644
> --- a/net/tipc/node.c
> +++ b/net/tipc/node.c
> @@ -2421,8 +2421,11 @@ static struct tipc_node *tipc_node_find_by_name(st=
ruct net *net,
>                         }
>                 }
>                 tipc_node_read_unlock(n);
> -               if (found_node)
> +               if (found_node) {
> +                       if (!kref_get_unless_zero(&found_node->kref))
> +                               found_node =3D NULL;
>                         break;
> +               }
>         }
>         rcu_read_unlock();
>
> >       rcu_read_unlock();
> >
> >       return found_node;
> >@@ -2507,6 +2509,7 @@ int tipc_nl_node_set_link(struct sk_buff *skb, str=
uct
> >genl_info *info)
> >       tipc_node_read_unlock(node);
> >       tipc_bearer_xmit(net, bearer_id, &xmitq, &node-
> >>links[bearer_id].maddr,
> >                        NULL);
> >+      tipc_node_put(node);
> >       return res;
> > }
> >
> >@@ -2558,12 +2561,14 @@ int tipc_nl_node_get_link(struct sk_buff *skb,
> >struct genl_info *info)
> >               link =3D node->links[bearer_id].link;
> >               if (!link) {
> >                       tipc_node_read_unlock(node);
> >+                      tipc_node_put(node);
> >                       err =3D -EINVAL;
> >                       goto err_free;
> >               }
> >
> >               err =3D __tipc_nl_add_link(net, &msg, link, 0);
> >               tipc_node_read_unlock(node);
> >+              tipc_node_put(node);
> >               if (err)
> >                       goto err_free;
> >       }
> >@@ -2634,11 +2639,13 @@ int tipc_nl_node_reset_link_stats(struct sk_buff
> >*skb, struct genl_info *info)
> >       if (!link) {
> >               spin_unlock_bh(&le->lock);
> >               tipc_node_read_unlock(node);
> >+              tipc_node_put(node);
> >               return -EINVAL;
> >       }
> >       tipc_link_reset_stats(link);
> >       spin_unlock_bh(&le->lock);
> >       tipc_node_read_unlock(node);
> >+      tipc_node_put(node);
> >       return 0;
> > }
> >
> >--
> >2.43.0
>

The adjustment has been adapted in v2.
