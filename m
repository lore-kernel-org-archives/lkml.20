Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205445;
	b=rc72iH4/drBejTKU0N4yOUSQvlpuFRhjQTgnmBpnweP1C9FlKWI38JUa+uePQ8Y4y/2M
	 x+tus2nHtpK0jubjtPEW7FAxiTHQ72NNQTO8X6NyyZH5+oOb0ffqlHgGYeG9OdlZ4U1k2
	 RO9o9lT2VoYc36+im35SX/2q5JQoyaPoAD666mMvYq1V8Vye5JjVMxP/4+K8v1sHiZ7jL
	 g+FfpZECKBXnKFBE4a1inyF1A4iEAVwDiMGCq+lu/4tqKQQvSQbnr++jluGMyTQZ9Gmmf
	 LXyxB1N42E8p2MF92sQaP5iSKeczL6iMlnKr6OLCuynZl8Uh9B6vrfF6ZksYy/ttHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=l+8ehmPAo6inV+YH732cihXHH/Y9Bk9COvdt/G9UfJY=;
	b=D3brWhsfvJRlXj+f3MdQxj7Y1dGOUpnyr3xwncGo7NkqKH48hCE866eAS17bS4uzy7hM
	 /bVZle0TCl7ufFArV9NKaVK8QIhEbQBq6JOJpjM6z5JhZgIbKirWB38TaiZklxpMzZe9X
	 e/tiuTseHg33pfESINtiSfqMf9WF9Xq8db+zR1zpi8exoBIbmMjkdTgaWW5CFsSQNYr7R
	 5GIpL+OuTM+yM8QA/GOP44vIAW2/CwPqz6iQPRUsnvtG5xw2fOvHgSq95cqEZx7bydePe
	 Z6mh3Sstv2x93BKwMfqOZhbjD8H6wGi4IZE0BD+eZACznvhKThJx5KnbgYDNDhDb4ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjieG5eT;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73CD60A3802
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B73CD60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjieG5eT
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a24f47293so479740eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793205444; x=1793810244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+8ehmPAo6inV+YH732cihXHH/Y9Bk9COvdt/G9UfJY=;
        b=yjieG5eTsxf2hNickEyx4oaFBkQeyXAr7t4GUk0Bq82KubByGt9kiMmNFKBzZRPnNA
         Oac51001wrooxkjqnfUmFoxmXb7gISVTvCnIoAgJkqixiqChuXzIWN6I//CsSEHkfn+G
         31MhqGnd4YivrCKyPeP8gdDF2KOz4sU4uMbqRVT7nja94oTEij+1Lu08slxLLAbv63AT
         WhVn1YDBR2MaCr46SnsB5DuKIegKMmrWlHT0WkFq1Nchnn8seRO6pn5+Q8wIu38knrp1
         ZvQ9sZqBhmD3WdB7452IkMLC4N1Lf++dPL6Fe9hoQVxGCekD0iijf6y5Xc59I8wzB1kM
         1KXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205444; x=1793810244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+8ehmPAo6inV+YH732cihXHH/Y9Bk9COvdt/G9UfJY=;
        b=KNYRxJ7NXgCwLHkiiaKLtfR0ifFa49niVimb010OsC5M20NMbhxsfV7RPed55ZuVWK
         V7i0xKPFHhrczn4uCmaGBYsbbhWGwhAo4T/QGYZSx6xrOUk59S1GPvpUm5xM6ugUiJE4
         pudJP0j583upSPit3P/fsyROef9ncRN43cUWOpWb+/5u6O2n95iR8ebQbyIfasvNKvOS
         3gmU2UxHnPLJTYEsboQUc2PsLiKkDNol3zp0/Q+blBdzyaG2J6mA00eKH9I4CDRsE+x9
         DKm4Ipoyr+NWQPBVIN6z3Dr1K28EvhrcEkgDXMTgJQTUTZOmRKWObBb0LD2LcboXt9Xb
         ospA==
X-Forwarded-Encrypted: i=1; AKwUvBxYby++CLg8RB/BcAVpX3YYKBa31aXVbI2FbSdma1kRLqdpaRoUfqTrZXrEBBeFUeLYYGdvZwJY/AH88+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/57grzqjRnlQGEkzFDQy3ZDy/UM4M7dYOVCAKwGQP+z2g13zm
	5HWqolV/06qxdCc3IfrpeeCnlF/h2BBLx6CKshMAVKVB2RTXEKym9DqI
X-Gm-Gg: AYBFou0Tu6pdeP25m72WCeqwm5u4NE4rEReJYx5/oH3Z/DyQmI3V1LrEdsSFOE1bjRj
	9V7r9NyNyg0vfmwQfM+HMXQK4jY0hzmIisJAzYfbbzb4Mq/OK82OjbrG4PKWf4At3q6k+6aTKw4
	ahYr8G2ILJB1KjMHu/XDocnitk0iqSGZGmqStSNGztJvveJ38iNSToBP8Adls083JpqucaKWIUd
	CiIlX2AOYkFvhQImjCTBMoj7VFS4zuCPKoN33NWUUfGLXt6rPi1WFuIE92B8ymcuEO6YRM0KTfz
	kyOGjBO84yTKy/TR0wwP4PND5GBYC7p0q2HDuGuttcLvObmQ8YjUd4ivZwg3EZsnf3nAk2c1ltD
	dMe0YbKN/rCGTjozlEabD9f2kBU3OezXIs1KHFC4UM7dyvoOPgZxsSflw/TVShUShAwyBv3Y6aQ
	LcJW/MpOEokOJiuP4/bVYrXPdfQSiccn4ac01HIkKISDXdAdlAG8OPnbUaumge3emYMof3RNcvE
	DDuAfJPNh7WPASQX0gSAfFg4cpK00bZqftFaeN0Tp3VvJH04dQ9T27W0/PsIudblnRg97sXhC0Q
	yqkptV5N62ihXCBBpXRiiJw=
X-Received: by 2002:a05:693c:88c7:20b0:35a:22a4:12a with SMTP id 5a478bee46e88-36a203af6e9mr4489164eec.18.1793205443455;
        Wed, 28 Oct 2026 09:37:23 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:61::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2390929asm9638344eec.12.2026.10.28.09.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:37:22 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:37:17 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Naman Gulati <namangulati@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+1269fe6cc2016008124e@syzkaller.appspotmail.com
Subject: Re: [PATCH net] netdev-genl: ignore NETDEV_UNREGISTER rebroadcasts
Message-ID: <auIiFnAf-mlGkfDc@devvm16445.scu0.facebook.com>
References: <20261026221306.3151025-1-namangulati@google.com>
 <at_TlVBS-5KVZAkg@devvm16445.scu0.facebook.com>
 <auABpyzeuUl2S3_W@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <auABpyzeuUl2S3_W@google.com>

On 10/27, Kuniyuki Iwashima wrote:
> On Mon, 26 Oct 2026 15:28:44 -0700, Stanislav Fomichev wrote:
> > On 10/26, Naman Gulati wrote:
> > > netdev_wait_allrefs_any() re-sends NETDEV_UNREGISTER every second while
> > > it waits for the last references on a device to be dropped. By then
> > > netdev_run_todo() has already marked the device NETREG_UNREGISTERED and
> > > RTNL has been dropped at least once since the initial notification sent
> > > by unregister_netdevice_many_notify().
> > > 
> > > netdev_genl_netdevice_event() does not tell these rebroadcasts apart
> > > from the initial notification and sends a NETDEV_CMD_DEV_DEL_NTF
> > > multicast for each of them. At best this spams NETDEV_NLGRP_MGMT
> > > listeners with duplicate notifications; at worst the pernet state of
> > > the netns the device belongs to is already gone and the handler
> > > dereferences a NULL pointer.
> > > 
> > > default_device_exit_batch() only unregisters the devices still listed
> > > in the exiting netns; it does not wait for in-flight unregistrations of
> > > devices that were already unlisted (the barrier doing that was removed
> > > by commit 8a4fc54b07d7 ("net: get rid of rtnl_lock_unregistering()")).
> > > So when a device is unregistered by something other than the
> > > cleanup_net() of its own netns while references on it are still held,
> > > e.g. a veth whose peer in another netns gets deleted, and that netns
> > > exits while the device is stuck in netdev_wait_allrefs_any(), the
> > > remaining pernet exit handlers run and genl_pernet_exit() sets
> > > net->genl_sock to NULL. The next rebroadcast then crashes in
> > > genl_has_listeners():
> > > 
> > >   BUG: KASAN: null-ptr-deref in netlink_has_listeners+0x3d/0x3f0 net/netlink/af_netlink.c:1388
> > >   Read of size 8 at addr 0000000000000578 by task syz.0.0/5325
> > >   Call Trace:
> > >    <TASK>
> > >    netlink_has_listeners+0x3d/0x3f0 net/netlink/af_netlink.c:1388
> > >    genl_has_listeners include/net/genetlink.h:644 [inline]
> > >    netdev_genl_dev_notify+0x161/0x450 net/core/netdev-genl.c:93
> > >    netdev_genl_netdevice_event+0x98/0x3c0 net/core/netdev-genl.c:1491
> > >    notifier_call_chain+0x1a5/0x3d0 kernel/notifier.c:85
> > >    netdev_wait_allrefs_any net/core/dev.c:11690 [inline]
> > >    netdev_run_todo+0x731/0x1060 net/core/dev.c:11808
> > >    rtnl_unlock net/core/rtnetlink.c:157 [inline]
> > >    rtnl_dellink+0x68f/0x810 net/core/rtnetlink.c:3707
> > > 
> > > syzbot hit this by moving one end of a veth pair into a short-lived
> > > netns while netdevsim's deferred FIB event processing still held a
> > > reference on it, and then deleting the other end (repro [1]). While the
> > > source of this bug is netdevsim deferring FIB processing for and holding
> > > onto the device reference for O(seconds) which is being fixed
> > > separately [2], any driver may introduce such a delay and trigger the
> > > null-ptr-deref.
> > > 
> > > Skip the rebroadcasts, which are the only NETDEV_UNREGISTER events
> > > delivered with reg_state == NETREG_UNREGISTERED. The notifications sent
> > > by unregister_netdevice_many_notify() and, for a device leaving a netns,
> > > by __dev_change_net_namespace() are issued under RTNL in the same
> > > critical section that unlists the device, before its netns can be torn
> > > down, and keep being handled. This mirrors what ip6_route_dev_notify()
> > > already does to cope with the rebroadcasts.
> > > 
> > > This change should not break the UAPI spec as it defines dev-del-ntf as
> > > a "Notification about device disappearing." which is a single event. The
> > > rebroadcast in netdev_wait_allrefs_any() exists to re-kick in-kernel
> > > subsystems holding references; netdev-genl happens to be on the notifier
> > > chain and forwards it.
> > > 
> > > [1] https://gist.github.com/NamanGulati/2d1b49b8757f9a88b0bd6e55018c02ae
> > > [2] https://lore.kernel.org/r/20261023191517.607834-1-kuniyu@google.com
> > > 
> > > Fixes: d3d854fd6a1d ("netdev-genl: create a simple family for netdev stuff")
> > > Reported-by: syzbot+1269fe6cc2016008124e@syzkaller.appspotmail.com
> > > Closes: https://lore.kernel.org/netdev/6adf9f64.6200f071.51519.0ed1.GAE@google.com/
> > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > Signed-off-by: Naman Gulati <namangulati@google.com>
> > > ---
> > > Note that the reproducer attached to the syzbot bug targets a different
> > > bug (via devlink_port_notify() on netns teardown) that happens to share
> > > the same crash title, not the one in the original reported crash report.
> > > ---
> > >  net/core/netdev-genl.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> > > index 33b9f4eb9565a..2032ab9a864c2 100644
> > > --- a/net/core/netdev-genl.c
> > > +++ b/net/core/netdev-genl.c
> > > @@ -1487,6 +1487,12 @@ static int netdev_genl_netdevice_event(struct notifier_block *nb,
> > >  		netdev_unlock_full_to_ops(netdev);
> > >  		break;
> > >  	case NETDEV_UNREGISTER:
> > > +		/* netdev_wait_allrefs_any() rebroadcasts NETDEV_UNREGISTER
> > > +		 * while waiting for the last references to be dropped; the
> > > +		 * netns may already be torn down by then. Notify only once.
> > > +		 */
> > 
> > [..]
> > 
> > > +		if (READ_ONCE(netdev->reg_state) == NETREG_UNREGISTERED)
> > > +			break;
> > 
> > Same as
> > https://lore.kernel.org/netdev/20261026063743.1797-1-lege.wang@jaguarmicro.com/
> > ?
> > 
> > reg_state is protected by netdev, why not do this under netdev_lock?
> > Also seems like we are fixing a symptom, not the problem?
> 
> fwiw, I suggested not to take the lock since we are only interested
> in NETREG_UNREGISTERED here and there is a clear ordering in the case.
>
> The root cause is netdevsim this time, and I have a fix,
> 
> https://syzkaller.appspot.com/text?tag=Patch&x=15923c21580000
> 
> but rebroadcast itself is not-ideal-but-valid behaviour, so each
> NETDEV_UNREGISTER must be idempotent unless we can completley remove
> the rebroadcast mechanism itself in the future.

(to both you and Naman)

Idk, I haven't looked deep into that, it just reads a bit weird that we
call the notifiers only then to filter (some of?) them out later. While
this patch might fix a narrow race I wonder if we are missing a bigger
picture (for example, why not get back to pre commit 8a4fc54b07d7
state?).
