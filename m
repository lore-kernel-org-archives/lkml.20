Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF713A6B8E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520610; cv=pass; b=l60HsHKDfyluMiE2t+M5UW5DJRauIKoM6pMw6i73LgE+c5xDuvnrB+K2Ai5tsR4LlLuDmEid/AUWenikWCQ7Qpf61Iq/2d06dGup9sHgIruKCVZcqZT5gKHWWKHyMOTvHHqCTkfhD9r1UbYjEOWU/Mg80qgTzGzQ+9hidkYIq70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520610; c=relaxed/simple;
	bh=GlELz1T0laEM2UP4PdR8l9IlbnpjSa6WpjTjjQvZ4yQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWUcqR29Yxx6lXLtAg37l340K6UN6PypzO913yAF2b9Z5Y3t7AU7mGfEWL1Lao2k6/8lTEMZzwEHoxVxQJMNZ4//UNSzSpc0jE3aWY+d7x4fKk/IbUKKhVBZzhspKCSwjpomtFdt26PJNbhaaMCiYKFF3U/OVT/967E16vKgWG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEu0EkTY; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEu0EkTY"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a6142b49aeso125801a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788520607; cv=none;
        d=google.com; s=arc-20260327;
        b=NXMvdNLi+UanyfrA3PTkc27hRNV0/6cb25PrPlxCeVWmNhO+4vXZQ2DxuxE7QEwJOm
         p6MG+KgfMN3lBXMyJGZT3KLy6Oos7FadyU3n0AV1kN3ZND/xeeTdj8q/ZfqskMPVA/ep
         rLXTuWxNbj+pgUOPd+s8c/kG1neyEyqF1voO94nXPD3KN1TNU34g9BBEvA0BLAMooJmy
         14dLXFaC6yrHVSngI2/yXcgKYkw0Vvu0DykH7dBkEIqt8vkA9i7zubt/71H2PrItzWr7
         JVHGotjJ+Ky2vbRVsDfrEXpD73FdySZ9YVsOB5qdUNQomZJfxVXvaJho8J9b9JVFA4NC
         rhbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bb6pYk3J7dZNtV3i+q1lQ3BM7UOiq2BxPAGRui36oR8=;
        fh=qheI7l/HtYRAedh2y0rZUOOWZMSXUIaUy1GJ0bL52Dw=;
        b=IsbBbkRU9b7/p51qdTrU0Ud8xQ+msYmjTjoHKMjtwIKT20qt54pxZmj76SJF40b5I9
         ERuEVyTGwqdorS81yI1/5FSPIXfB0Mi+HL3n6HMg1C6SAc+xK23q9/WhRLCCgAsGB9B6
         ICJ+pOp6AhnZp/nPPGpXXxnXhgorlLuVuMYevDOzeOZqszd6PTZ7Nz6BiKl5UtgMKKWV
         neF8biToUWxYOdKPlONCVnja7sVmwZ0zmRC8pC6JxPPQHP1rNv3I7/T2YnKKu4tOuPJh
         awqA9Peop4JgxnPjZs6FcVVonej98LgE5LjAY79/2kIDiA0RngnI3TXxLSnmD2PYh+AT
         ynVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520607; x=1789125407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bb6pYk3J7dZNtV3i+q1lQ3BM7UOiq2BxPAGRui36oR8=;
        b=DEu0EkTYoPGQpCD4Njcx/a22p4AkIfWZgbqa7aNUhr8tvE2P2fVBZPh4nTQrjFmaZd
         HLGA7WyjjqCljnpnshU4zXB1xlxRzXDvInjNeAclKF84M3GCTkxedaYnVc8BeAXwzdwb
         r5AcedBQ0Pv7CqmENIAzjQXFDPB6fNHP6EN6vvA4CifIjElFdxdkG031303VLRQ27EL1
         azsKCV9qHmgjmT25uirh5T9vSRBeTTnExwLw5DtNqaL46fI6FnBWmTATTrkCawSRSpQE
         lvajMPxUzAfMVkY9mZv+7ANIPQhvAsS98z0475wC3patWhM1iePEeXzrPVz6+OY2oB/M
         BKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520607; x=1789125407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bb6pYk3J7dZNtV3i+q1lQ3BM7UOiq2BxPAGRui36oR8=;
        b=qwc5zmqne5kjPv8VAnX0dV2c03Hdiw8xRdCVV3Q6hYo4L1o0Uokr85oy8yT5PL7tkV
         CHWnchohqhB8eb9sviJffgrWk0TQDjaRlVNYTTTv+Sc1wwB6j80QFdPGYQpID2vGYtSX
         S4yPCbuF0iBfFZwekx1eZV5d19qzVKk+iBFLCyOSDDGOhd8ZnXPFot9AWXsr6bhcbrn6
         4OVPYwjrzNX47FquIsGuT/TcGk0Q26xXlWVxaJqre/FjPArNZ3Z7VK9qBXbGKXzA7wr/
         oYdTghpak57gsfuQWsKAVGorVDdEt09nctN7tNUzOl77mXpjyYu/LK8rzHlbTZnULDr1
         qT7w==
X-Forwarded-Encrypted: i=1; AKwUvByuJ+yECKoCA7dHqnOKLiM//sOa5Tf2f6ArA5vrEiJ2hO9O/qFo5JNyxNNzTrIl06QNtnaHM/KMgQ8NekU=@vger.kernel.org
X-Gm-Message-State: AFuF++mAUPGHIVS0oCFx+jBRZILqxnfYuz9O+Nf2s17xVG+gVokkChkW
	P34bx0BvG8UWXIAu7nBX/CYrnock+gwmjgpWZUJeNTd2gLQE0qIqMKsjOUbBVwdu0OnRjSqZLPR
	ANiJA/CtRMn1O7DYuPIIChKiOsG85wcAvKiQssQzlqg==
X-Gm-Gg: AYBFou39C7ZHbSAV1llluIH6LZQAjHjEyY6QD4qm7+1HPdHAEgq6jMJ9UaQHZjCDGi/
	m7uVGpzcKU0jIznQnuxFXmp7/7IN5YCbS952AwUi2tygu2vSQXwhXp3XCzzswMUYFctz6XpoVxp
	vFKXXSg5YTLYjMtQv2y2giSWI6Mjag17Xs7MxSeEekPifKtgVDP32WjCsi4a3Ah/XC/ehOwBWgm
	LTlp6Z6RNdhyBoE4tlDrlE1Y/NSixo5QP6cFK7n0vvIGFVNQh+SaoNCEpNYG1OHmo7fWvb48mX9
	wP2hCPaskcy+VuDyOlBgqlENF8b01htJ9nQXpbkSTEtPyoZdnzIxSENsgUh34lyfJ3WScAmiupf
	7ueUhDj7L7g==
X-Received: by 2002:a05:6402:2b93:b0:6a6:6500:1530 with SMTP id
 4fb4d7f45d1cf-6a7e8d97088mr1522492a12.2.1788520606519; Fri, 04 Sep 2026
 04:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825172349.232794-1-nicoyip.dev@gmail.com> <20260830235706.746689-1-kuba@kernel.org>
In-Reply-To: <20260830235706.746689-1-kuba@kernel.org>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Fri, 4 Sep 2026 19:16:34 +0800
X-Gm-Features: AcwNN1WuxFT_PFRJpA_TW09qtlpO3VJuFjW9iPQKb07AghOxEPzl1Ws0nhyCgxo
Message-ID: <CAAo+4rWgdyOfm665U=7oSvpNeJV3jhC3cRstb5g9Yt_KEzCNYA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: pin protocol module before inet socket allocation
To: Jakub Kicinski <kuba@kernel.org>
Cc: edumazet@google.com, kuniyu@google.com, pabeni@redhat.com, 
	willemb@google.com, davem@davemloft.net, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 7:57=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: pin protocol module before inet socket allocation
>
> inet_create() and inet6_create() look up the inet_protosw under RCU and t=
hen
> drop RCU before using answer_prot across the sleeping sk_alloc().  The pa=
tch
> takes try_module_get(answer_prot->owner) while still under RCU and drops =
the
> reference on every path after sk_alloc().
>
> > diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
> > index 32d006c1a8eed..88a18ac0e6e42 100644
> > --- a/net/ipv4/af_inet.c
> > +++ b/net/ipv4/af_inet.c
> > @@ -325,6 +325,10 @@ static int inet_create(struct net *net, struct soc=
ket *sock, int protocol,
> >       sock->ops =3D answer->ops;
> >       answer_prot =3D answer->prot;
> >       answer_flags =3D answer->flags;
> > +     if (!try_module_get(answer_prot->owner)) {
> > +             err =3D -EPROTONOSUPPORT;
> > +             goto out_rcu_unlock;
> > +     }
> >       rcu_read_unlock();
> >
> >       WARN_ON(!answer_prot->slab);
>
> [Severity: High]
> Does a plain try_module_get() here cover the case where the protocol modu=
le
> is still inside its own init and then rolls back?
>
> try_module_get() only gates on module_is_live():
>
> kernel/module/main.c:try_module_get() {
>         ...
>                 if (likely(module_is_live(module) &&
>                            atomic_inc_not_zero(&module->refcnt) !=3D 0))
>         ...
> }
>
> include/linux/module.h:
> /* FIXME: It'd be nice to isolate modules during init, too, so they
>    aren't used before they (may) fail. */
> static inline bool module_is_live(struct module *mod)
> {
>         return mod->state !=3D MODULE_STATE_GOING;
> }
>
> So the pin succeeds for a module in MODULE_STATE_COMING, i.e. while
> do_one_initcall(mod->init) is still running with module_mutex dropped.
>
> Some protocol modules publish the protosw early in init and then destroy =
the
> slab from their init-failure unwind, which does not consult the module
> refcount:
>
> net/sctp/protocol.c:sctp_v4_protosw_exit() {
>         inet_unregister_protosw(&sctp_stream_protosw);
>         inet_unregister_protosw(&sctp_seqpacket_protosw);
>         proto_unregister(&sctp_prot);
> }
>
> reached from the err_protosw_init label in sctp_init() after
> sctp_v4_protosw_init() has already registered the protosw.  net/smc has t=
he
> same shape:
>
> net/smc/smc_inet.c:smc_inet_init() {
>         ...
> out_inet6_protosw:
>         proto_unregister(&smc_inet6_prot);
> out_inet6_prot:
>         inet_unregister_protosw(&smc_inet_protosw);
>         proto_unregister(&smc_inet_prot);
>         ...
> }
>
> Can the sequence the commit message describes still happen with that?
>
> CPU 0 inet_create                  CPU 1 modprobe sctp (mod->init)
> rcu_read_lock()                    sctp_v4_protosw_init()  /* published *=
/
> answer_prot =3D answer->prot
> try_module_get()  /* COMING -> ok */
> rcu_read_unlock()                  /* later init step fails */
>                                    sctp_v4_protosw_exit()
>                                      inet_unregister_protosw()
>                                        synchronize_net() /* returns at on=
ce */
>                                      proto_unregister()
>                                        kmem_cache_destroy(slab)
> WARN_ON(!answer_prot->slab)
> sk_alloc() -> kmem_cache_alloc(stale)
>
> The kernel's own helper rejects exactly this state, which suggests a plai=
n
> reference is not a lifetime guarantee during init:
>
> kernel/module/main.c:
> /*
>  * We require a truly strong try_module_get(): 0 means success.
>  * Otherwise an error is returned due to ongoing or failed
>  * initialization etc.
>  */
> static inline int strong_try_module_get(struct module *mod)
> {
>         BUG_ON(mod && mod->state =3D=3D MODULE_STATE_UNFORMED);
>         if (mod && mod->state =3D=3D MODULE_STATE_COMING)
>                 return -EBUSY;
>
> Would rejecting owners in MODULE_STATE_COMING (or taking a reference tied=
 to
> the protosw/proto lifetime instead of the module refcount) close the resi=
dual
> window?
>
> > @@ -398,6 +402,8 @@ static int inet_create(struct net *net, struct sock=
et *sock, int protocol,
> >               if (err)
> >                       goto out_sk_release;
> >       }
> > +out_module_put:
> > +     module_put(answer_prot->owner);
> >  out:
> >       return err;
> >  out_rcu_unlock:
>
> [Severity: High]
> On the same init-failure path, can module_put(answer_prot->owner) here re=
ad
> freed memory?
>
> answer_prot lives in the module's .data, and do_init_module() frees the m=
odule
> image without waiting for foreign references:
>
> kernel/module/main.c:do_init_module() {
>         ...
> fail:
>         /* Try to protect us from buggy refcounters. */
>         mod->state =3D MODULE_STATE_GOING;
>         synchronize_rcu();
>         module_put(mod);
>         ...
>         free_module(mod);
> }
>
> That is unlike the delete_module() path, which does the refcount handshak=
e in
> try_stop_module()/try_release_module_ref().  So after free_module() runs,
> both answer_prot->owner and the sock->ops pointer already stored above re=
fer
> to freed module memory.
>
> [ ... ]
>
> > diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
> > index 282912a119999..82b390ce3e0cd 100644
> > --- a/net/ipv6/af_inet6.c
> > +++ b/net/ipv6/af_inet6.c
> > @@ -170,6 +170,10 @@ static int inet6_create(struct net *net, struct so=
cket *sock, int protocol,
> >       sock->ops =3D answer->ops;
> >       answer_prot =3D answer->prot;
> >       answer_flags =3D answer->flags;
> > +     if (!try_module_get(answer_prot->owner)) {
> > +             err =3D -EPROTONOSUPPORT;
> > +             goto out_rcu_unlock;
> > +     }
> >       rcu_read_unlock();
> >
> >       WARN_ON(!answer_prot->slab);
>
> [Severity: High]
> inet6_create() has the same exclusion, and it also dereferences the proto=
sw
> after RCU is dropped:
>
>         sk->sk_backlog_rcv      =3D answer->prot->backlog_rcv;
>
> Does the COMING-module case above apply here too, given that sctp and smc
> register their IPv6 protosw during init and unwind through
> inet_unregister_protosw() + proto_unregister() on failure?
>
> [ ... ]
> --
> pw-bot: cr


Thanks, a v3 is sent to address both the problems.

Best regards,
Chengfeng
