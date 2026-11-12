Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794522649;
	b=wre9ZAB17bIQ2NOH7DYPEGYYQr1HzTefv8RkpmO9lnKIXFKaPt+uRPMtfWbTpQzzRT7E
	 moyQH93XAzT/VvZkoIxzqA2tjyflwYmY1eMuikgKKwEI2/hfJI6DUiOmqs1aRsfyYA/nt
	 u7kWCP0lD0aiSFcH/hXUSN7n5r0rPS/idobyrojcf8UA5S96h7Tw7RaEvAp5I0CRKd4Cx
	 UG0ebyeFuZdEnkk1CcqJ+znl+V90Wen0fsuzUu63XXgMwpxP9TU02TeR36iyygvPkpBR+
	 dX0cwWltECMKQ0EVtrGHvOvJsUVTg2FvG8PR8XYWiYiM4/ioEF35lQxUABe1Ic8CQGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N84XYHzw7Esp327MYHF7QLXLFVZd1ok0Gm+vNi9+pP4=;
	b=0QZ5h4kotYPZ2E4XRDPwq4p5Q/hdCM+U16BskxkDcIhjpOYAHBP5UrH8UsPJLI7kivSq
	 WndjmTKeyLz0LIzSOZgCQ+77RHACkn8I7sLxZPA+bQjfObtNrlT0/9ofE47Pcoqv5tSap
	 Onauz2zPAYQvUXN8FlyBeAnyguq8iXCA2BdrOoctSSF4BQ79K2KBDPDlUtZUNqb7/fkzM
	 p+09TJYeB/5IntP+B9MWndoIHoUdq81JXHXZjtERFi8uRme4PrP9kgph/rA/Bw8r/vB+V
	 zoD9ULeGTwD/AuEtUp3dQ4DJxi+6k6OCPgY7RMBlPqai+iiFFU8U4MUAFAo88E36NpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DunIrGgy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE54C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DunIrGgy
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so136250b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794522648; cv=none;
        d=google.com; s=arc-20260327;
        b=Wl08OXvH9TPHTP6Wl389A5FgzibL+589/E4X4NY30aZeUlMUEoTCgxeq6KG7uc6SB8
         7ACG08LfEeVQPNDzAnbiQwyzaiUC563CyMqmD/gxZLw/lJ0sxLeWvoDdwHxpFZA2e8tQ
         V989PtiAkLYqyLowU1ERh9FpkjbfOv0FzPhYgCo8f4EujAS3btrAeJ8EMYt7Z5Uo+qGE
         3dL4Qv49oN94I/AgwCKXbefgtaMbBiePQUGI8zSGqbeRM/jvf7NtSpAe14xh2o6R9nvG
         4UrY5GBa352fjbG+JO0Sy7fHBP9Tb4MTs7fzEkSEp0jKSDVqMderVuyyQeArSO0baZOT
         iMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N84XYHzw7Esp327MYHF7QLXLFVZd1ok0Gm+vNi9+pP4=;
        fh=3/Yn51ePihUvXDFvB6GbvODHutg6FqZuXw2knzXrC8A=;
        b=rSogImzeW6an86I+CKEz6ktU+c8VKS180L4Y8PNt2jO3GUzqnvIVCY+ZqGC5FhKKvb
         Ky9L2vDz+56bV4GM6lqo4SmhDxlsJHXuriyXoZOvRVmZ4jvhNazGLO7BwkIyEUdqawAT
         8pcwgaC9gvXwayo0AeRMd1256+5SSPdVp2SIbDdiVag3gNud+sihoQzmo2EKNIrecWyw
         sE8qfjYXHTWGFCPDsbKNsbAuEqZSpjv10vNYFAm9NNG8DOrBHgn7IYXUAMxp/lkFXDec
         iQZRMrOkdfSw1siyCDdom5EpOuGp2E8B7BmfY6Zq6RVBjP3w/4BtI6RDT/9Lzw9y/mJz
         rKdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794522648; x=1795127448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N84XYHzw7Esp327MYHF7QLXLFVZd1ok0Gm+vNi9+pP4=;
        b=DunIrGgywXQ1a63BXE8e47oXawquHNDt1Xa0QoXzi1dP2Nz0XwH+GHWK/dSn3+rfP4
         Hj531DF9PhsHE0nHGqCtmoYgEq9tCawE0ynICeMQvQmud9ygaL4OySCv1FkYqR6+jQqh
         Z+W0fnn3mtRdJsSmVrTUg+BLdMS2Xh2sBg7UGn7Pxr7D3ad6Dm2Ufj2gXa8BoyPYA5I/
         Crs9bdBVNO/isge0mMsSiF/bs3MFJ2yOjpeY+GsWrFzH/DfZkmfZa+eJetNgeTeed/uq
         iClXTw/skoagGTq7kvGTfROWAB5zJaxkdfOCIVyvlP3KeyBfLteeE3APYgQAiva/vNBg
         VPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794522648; x=1795127448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N84XYHzw7Esp327MYHF7QLXLFVZd1ok0Gm+vNi9+pP4=;
        b=wZt3F8CMa9MYnKgt2sj/iekHTuXlNo2vzwxFNSneVkPAedY6X6PeHbZQP85vAuypXe
         lMKsNKIg0fnAik7fic0obl7Pph5xq/4jVf7KtXTULh0I4QPdarPbwP+P+wfTJw+m2OrN
         Fmh1nTVhaEdTeRSBTYDJd+oTZnYttzMAjjUcMw2X92BSw4JOExvY1Y3y9iTUQ3H8iBfp
         vEOZNNEllxwD1TOMipG3p74Y0ug9Rfn295QLOQYwx+lhBrm1OgESqfXussyJUOgxffO2
         SHtLMoxuUnz2j/LDi1yeGDDrkEXTHd+DxoTW2GrxiNuZBsN+JKVbCZywmEl0HGrtCwf8
         YB/Q==
X-Forwarded-Encrypted: i=1; AL+hErFKNLuSvhkmzlFlbk6ap9rkRtRKj3wogU60Ri3PNrxEpHwTTZyIruXb3lEgTtEYr4HTSm7uc3i2tulHURA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zJlrrZoVVIAXfZirFesA64SHX7s1GmJbVXLeWgnDu58OyOkof
	WA28t87ljylKxU1iICC1kFcYx/Z+FWUANTXH5kCpF2UOkHy/Lyb5irTS1TRH2hLZb0R+IhH3zad
	8IidCMrImYX0/n5qc824NZ33d4FT97kg=
X-Gm-Gg: AYBFou2kAVLh2NhXGZqdDfKOzgyydYAWl2yBtpKDlm+H7jsYF2crAKQi6wJRuOVCVnw
	mTxFKga1IA1W7QJmrgQvnK7p4KCd6W1NN23QsEZNVvzOYILh2YwpCmcb0IadvSDldoIRLi/uKcH
	uHwpoX4BSWhCMSjSiRYE40e8dZqQVJqs7B2kqur7oMKRZB7mWHfUDrdzUhuHHkkL4Hvm95gCLmi
	Xr/WHM1gnmSqCfyrodhgIvqSI8lUrNccTjK3NT/YRVpfnkRVKhIibnM1zzW21MGuC0TmRrzrfcj
	uGCAmvYjgswwkia6oPyRbiItLPnISp7shmBuGICP6rHGUzuOoux847MYnOhfVSBPopovgzoTeuj
	4HfmA0BU8fH9Gvo1ZcoLWtRd21ZhkrUbhHgP3IYHcNwdz7yxvQh8wPE7ONBUV9alCPUUz2CILa7
	SFpsxSnzINXXmOaR/eqSbvLH8OM2waXky++aZnYhNkVjZ7SquuudHj3pVc+LkfHsgHi/lPzw==
X-Received: by 2002:a05:6a00:8f01:b0:899:465d:c8ff with SMTP id
 d2e1a72fcca58-8beb53d9e97mr856084b3a.13.1794522647925; Thu, 12 Nov 2026
 14:30:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109024219.347985-1-18983559317@163.com> <179438669316.2199510.365044781249431849@kernel.org>
In-Reply-To: <179438669316.2199510.365044781249431849@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 12 Nov 2026 17:30:36 -0500
X-Gm-Features: AclHuK8t8kqlu_92gb4zO32V1NyjmqbFjeNzohpibZDZktCfypmqIQtbOyoxZls
Message-ID: <CADvbK_fQBb2FTBOFiQ_4nmSGG7aQspD4X03bhENKb74prxorCw@mail.gmail.com>
Subject: Re: [PATCH v2] sctp: fix race between addr_wq timer handler and
 backlog draining
To: netdev-bot+sashiko@kernel.org
Cc: 18983559317@163.com, marcelo.leitner@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 3:44=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 3 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Kernel memory can grow without limit through repeated DEL_IP
>   ASCONF chunks.
> - [Medium] The new early exit breaks an invariant that
>   sctp_addr_wq_mgmt() depends on.
> - [Medium] One socket can now stall address-event processing for the
>   whole netns.
> - [Medium] The commit message says that sockets processed earlier 'will
>   see a duplicate ASCONF on retry; the peer reports that in an ASCONF-=E2=
=80=A6
> - [Low] The new sock_owned_by_user() deferral branch in
>   sctp_addr_wq_timeout_handler() (net/sctp/protocol.c) sets retry=3Dtrue=
=E2=80=A6
>
> --
>
> sctp: fix race between addr_wq timer handler and backlog draining
>
> This patch makes sctp_addr_wq_timeout_handler() check sock_owned_by_user(=
)
> on each auto-asconf socket before it calls sctp_asconf_mgmt(). If the
> socket is owned, processing stops and the addr_waitq entry stays queued.
> The addr_wq_timer is then re-armed to retry after SCTP_ADDRESS_TICK_DELAY=
,
> in a single mod_timer() shared with the existing IPv6 DAD retry.
>
> > Sockets processed earlier for the same
> > address event will see a duplicate ASCONF on retry; the peer reports
> > that in an ASCONF-ACK error indication, which the association
> > tolerates.
>
> [Severity: Medium]
> Is this description accurate for both event types?
>
> For an SCTP_ADDR_NEW entry, the first pass through
> sctp_send_asconf_add_ip() has already added the address with
> sctp_add_bind_addr(..., SCTP_ADDR_NEW). On retry the lookup finds it and
> skips the association, so no duplicate is sent:
>
> net/sctp/socket.c:sctp_send_asconf_add_ip() {
>     ...
>                         if (sctp_assoc_lookup_laddr(asoc, addr))
>                                 break;
>     ...
>                 if (i < addrcnt)
>                         continue;
>     ...
> }
>
> For an SCTP_ADDR_DEL entry, the first pass in sctp_send_asconf_del_ip()
> only marks the bind address:
>
>                                 if (sctp_cmp_addr_exact(&saddr->a, laddr)=
)
>                                         saddr->state =3D SCTP_ADDR_DEL;
>
> The entry stays valid until the ASCONF-ACK arrives. sctp_bind_addr_match(=
)
> only tests ->valid, so the !sctp_assoc_lookup_laddr() check still passes.
> Each retry builds another DEL_IP chunk and queues it on addip_chunk_list
> behind the outstanding ASCONF. That is one new chunk per retry, not a
> single duplicate.
>
> Could the commit message describe what actually happens on retry?
>
> > diff --git a/net/sctp/protocol.c b/net/sctp/protocol.c
> > index 27c26e12f95d8..267dc9b7a0e73 100644
> > --- a/net/sctp/protocol.c
> > +++ b/net/sctp/protocol.c
>
> [ ... ]
>
> > @@ -645,16 +643,27 @@ static void sctp_addr_wq_timeout_handler(struct t=
imer_list *t)
> >                       if (!sctp_is_ep_boundall(sk))
> >                               continue;
> >                       bh_lock_sock(sk);
> > +                     if (sock_owned_by_user(sk)) {
> > +                             bh_unlock_sock(sk);
> > +                             retry =3D true;
> > +                             break;
> > +                     }
>
> [Severity: Medium]
> Can a single owned socket stall address event processing for the whole
> netns here?
>
> The first user-owned boundall socket in net->sctp.auto_asconf_splist
> breaks out of both loops. No later socket gets processed, and neither doe=
s
> any later addr_waitq entry, including events for unrelated addresses.
>
> Each retry starts again at the head of both lists. Every socket ahead of
> the owned one therefore gets sctp_asconf_mgmt() again on every tick.
>
> User context can hold the socket lock for an unbounded time. For example,
> sctp_recvmsg() holds lock_sock() across skb_copy_datagram_msg(). A copy
> that faults on a FUSE or userfaultfd backed page keeps sk_lock.owned set
> for as long as the user wants.
>
> The other async entry points defer per socket or per association: the
> sctp_rcv() backlog queueing and the timer handlers in sm_sideeffect.c. On=
e
> busy socket does not block the others there.
>
> Would it make sense to skip only this socket and track which sockets
> still need the event, instead of halting all processing?
>
> [Severity: Low]
> This isn't a bug, but the sibling deferral sites in
> net/sctp/sm_sideeffect.c log before they reschedule. One example is
> sctp_generate_heartbeat_event():
>
>         if (sock_owned_by_user(sk)) {
>                 pr_debug("%s: sock is busy\n", __func__);
>
> The DAD retry in this same handler also logs. Should this branch have a
> similar pr_debug() so repeated deferrals show up in dynamic debug?
>
> >                       if (sctp_asconf_mgmt(sp, addrw) < 0)
> >                               pr_debug("%s: sctp_asconf_mgmt failed\n",=
 __func__);
> >                       bh_unlock_sock(sk);
> >               }
> > +             if (retry)
> > +                     break;
>
> [Severity: Medium]
> Does leaving a partly delivered addrw on addr_waitq break the offset logi=
c
> in sctp_addr_wq_mgmt()?
>
> By this point sctp_asconf_mgmt() has run for every boundall socket ahead
> of the owned one, but the entry stays queued after addr_wq_lock is
> dropped. sctp_addr_wq_mgmt() assumes no socket has seen a queued entry
> yet:
>
> net/sctp/protocol.c:sctp_addr_wq_mgmt() {
>     ...
>         /* Offsets existing events in addr_wq */
>         addrw =3D sctp_addr_wq_lookup(net, addr);
>         if (addrw) {
>                 if (addrw->state !=3D cmd) {
>                         ...
>                         list_del(&addrw->list);
>                         kfree(addrw);
>                 }
>                 spin_unlock_bh(&net->sctp.addr_wq_lock);
>                 return;
>         }
>     ...
> }
>
> Take a partly delivered SCTP_ADDR_NEW entry, and suppose RTM_DELADDR or
> NETDEV_DOWN for the same address arrives before the retry. Both events ar=
e
> dropped. The earlier sockets' associations have already sent ADD_IP for
> the address. They keep it in asoc->base.bind_addr after it is gone, and n=
o
> DEL_IP is ever sent.
>
> The reverse happens with a partly delivered SCTP_ADDR_DEL entry if the
> address comes back before the retry. The earlier sockets' associations
> remove the address when the ASCONF-ACK arrives and never re-add it.
>
> Before this patch, the only path that left an entry queued was the IPv6
> DAD break. That break runs before the socket loop, so no socket had seen
> the entry yet.
>
> >  #if IS_ENABLED(CONFIG_IPV6)
> >  free_next:
> >  #endif
> >               list_del(&addrw->list);
> >               kfree(addrw);
> >       }
> > +
> > +     if (retry)
> > +             mod_timer(&net->sctp.addr_wq_timer,
> > +                     jiffies + msecs_to_jiffies(SCTP_ADDRESS_TICK_DELA=
Y));
>
> [Severity: High]
> Can this retry grow kernel memory without bound for an SCTP_ADDR_DEL
> entry?
>
> The retry has no limit and keeps no record of which sockets were already
> handled. Every SCTP_ADDRESS_TICK_DELAY (500 ms), the timer replays the
> same DEL addrw on every boundall socket ahead of the owned one:
>
> sctp_addr_wq_timeout_handler()
>   sctp_asconf_mgmt()
>     sctp_send_asconf_del_ip()
>       sctp_assoc_lookup_laddr()     <- still matches, ->valid is 1
>       sctp_find_unmatch_addr()      <- still returns another address
>       sctp_make_asconf_update_ip()  <- new skb and chunk, GFP_ATOMIC
>       sctp_send_asconf()
>
> While asoc->addip_last_asconf is set, sctp_send_asconf() appends the new
> chunk with no length limit:
>
>         if (asoc->addip_last_asconf) {
>                 list_add_tail(&chunk->list, &asoc->addip_chunk_list);
>                 goto out;
>         }
>
> Each retry also calls sctp_transport_route() on every transport of each
> association. These allocations happen in timer softirq context and are
> not charged to any memcg.
>
> The growth only stops when the owned socket is released or the ASCONF-ACK
> arrives. A peer that drops only ASCONF-ACKs keeps the association alive,
> because heartbeat ACKs and data SACKs reset overall_error_count. So
> sctp_sf_t4_timer_expire() never reaches max_retrans.
>
> A local unprivileged user with user and net namespaces can set this up:
>
>   - enable net.sctp.addip_enable in their own netns
>   - flap an address on a dummy interface
>   - filter ASCONF-ACKs
>   - keep a socket owned through a stalled user copy
>
> Before this patch, one address event produced exactly one DEL ASCONF per
> association.
>
> >       spin_unlock_bh(&net->sctp.addr_wq_lock);
> >  }
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261109024219.347985-1-18983559317%40163.com

Looks like we can't re-arm the timer in this case.

Can you try adding a list to struct sctp_sock to store the addr
entries and continue the loop when it occurs, and implement
sctp_release_cb() to handle them?

Thanks.
