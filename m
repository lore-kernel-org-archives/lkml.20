Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6656483BD2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963358; cv=pass; b=BQIjcfcP2rFbiqlwBrPAz1B4oh7FDUCeaUBRJWBgI6bIo1hH3iHF0bfGT2VJy9H9fc87jc9/hlLB24omA5zr0LPMmTf4Z0AZK6ZXTftMir1d41XOCc7b2n0YumwWs9hiVFWPWPtEtXsKRYrNJZ97YF4RTxJRgjMoL8sJ5V9plj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963358; c=relaxed/simple;
	bh=V3BhjzuK4CBfJUEsxQG8Rb0+bdqLXuKWjYZAbdnCgCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8Oy5zHE+1whHfeSf1xFLZT96EPUVMWO+X2OyersqyyYgq/McZ3/9bCDiltSWz5aP+Vm7lDXupw2LpnjQBtuIIIH3NuqnlQOdak0+O7PqUVbbU6UO2i8AcxLMakujpcu+WCaqKEz6z1DYDbcOngWsgggELvDb3dabm7E45SRsZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=DAKXyx/3; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="DAKXyx/3"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a98fc80925so27652801fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791963354; cv=none;
        d=google.com; s=arc-20260327;
        b=qTJCeGzYmhba6PmWbks0OqCwDurM/AHx81D7MIo7yDI6h4OUxatcPL+827CJBbD6dB
         SlLnFCBEj3mG89rvYsLPpsXvRfkkcJCKKdiccgfKuAoZoHd+NWqOMF+DMFlpeZj73f+N
         KZDWG7O8vG0zMdXxX+qSMlL1zXOXdQOxNMG70iMIfDBd9IaUhjy2oo3rzPuAKCDqM6zT
         5X5swXeZd5nOXoMNkokpkAaWXXi9CjW5u7OgYFaPhSPNBFEXENe1ZR25bEj4DFSiXkpa
         J4i3OYQHYdyh4rStj8m0vsdqBrAFCqIX5qfw1Oz00zpCXk09NQKuaVpP/MB32wPEMdZy
         kKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HSNUxD6DfBLOIEWmg+DU/XNxPWCHawo+r3/1wsdCuis=;
        fh=tb1ZsAT7yidgoteMIPewYGOnPxfYCnC+qC4iugCbg7Y=;
        b=hsxDTzS6yiHINC89Pg4j1gdSPcMPo9J3tHgzfr3y75cIO56YrYx4VBJIHlNqLaWFxX
         s5dA4J1NMRRpZdPfeLQtAJiN5vGR1aCkCWUHJOgIGccoKmhQOLPUjmnUBq7AHcTHx4Ib
         o1W4qN1Az6qPe/Esbe6NLLHgSyesMXoFhTjdWH/ohcuG9LYGsuI7wWTBXS0uE+8JTMSx
         fRowdSsE9AZZCDjCpQrkBi4a2WnaHkgEh62BBTM3yl+DiMzfu/8c99F+oOkvsx9lmvvd
         dHEupXr383nzRQb205IiyzXdVCD4BajNRjqejwEPZMJMfnfnJB+OOh4v2CNnDXVj9sSX
         Nm3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1791963354; x=1792568154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HSNUxD6DfBLOIEWmg+DU/XNxPWCHawo+r3/1wsdCuis=;
        b=DAKXyx/30blsPtDeRusWmkqsl3PsL/LTAWLChCq8U2gWvd9OVVEkHsazPIr65x0C/6
         ZfxV990IIpwjIwsLY0UaoymbPnh2EGnhNXOd+jS0vsQaMCPLYDm8I95DYdizanRNIsQP
         Kwd4RhwUx8ErEAlcl5tu0Ib7A3hYbsg3K3sBwZTyU/AQaNi89MM0/zoF29SkuVYHIAO0
         AnPmDhEstYdV0zdmHGvBMVe9iTdvK24WLIbLX3HTkXChhT9ol04HY0M6yDEBfJOM5+tP
         QEmm6lbe4faM48NVakKHR4gqwbHvVw4Dkw5KPdhdawD1620rWyA1F4/Ok3ZLcwGU7rFB
         vZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963354; x=1792568154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSNUxD6DfBLOIEWmg+DU/XNxPWCHawo+r3/1wsdCuis=;
        b=N4JFs/9KkGRb0evX9SFS6+YmIw4yeBWG8d+x9ZMqfb2yAk8C5NlNgOperXoGUy0PSC
         YA7nW80/iyeMDPlwZVyrAuNQfxcDaYkJePtyMTbArncHHWmF9P5zpkz5A9twDIjpElzV
         9KEa4rtQ4kFDExlUFvEPDXgT/+TMNOBbvF12fOwxLshr4WR/GyeS6FmwHLaD8T3D0Cj2
         UIEXKsuDOovB1MePhBOcuU05f3V+kzSI7bkDtkWQN+iWtct2ludFjmUx+ho6kXJQ4/ZG
         29yWCx2bu9xyekO6vaXH1KYMXFIVrtKbf7nEH/MycOum4Cl8ePkZpYcz9fTYJj5QLN5C
         DfZQ==
X-Gm-Message-State: AFq9FYI+4fnAssWSfpwm/aV/CjBi/mkULvap2HGQAr9OJoP17qU038Wy
	Y0pnLmkTot+2eLRBClM9Xxv+NEPo8p04da7z5M8EGYOUC7tYa9uw4IobgeQnkJULJdVUe5irywa
	D48bsIuABX3wBxWwCIIhPoKm2XgTzafr41HjZTOCLg18=
X-Gm-Gg: AYBFou1ird48H0MENEPswMW6lWFHxzJoLrxMI9gzMRXLzAnosgd4ZPKahsUhcViR3Lw
	wvbc35dVSO19xWrxIJXqrpMn10tuitg9Yie6I1ZvYKBfmXvJBztO5LfSWDfZj7rUgwV2jUqylQc
	8qQGp2whdXpcCAqlSmdLmvNfP+/xWNA45CR+W4q1aYXWkPLNezxsrxHjOr7ZmsrCIQznKZJ5kc+
	TXLbke0mwPmiUdMXb+xeHcc2PZc8pVpemKF305i2KbgFwi0TwDBClyBlzgi2hDSIFm9c6c5u6yU
	9YZAnMty543zVyw6jnqi8BJxjUuR+R4dmXmzXSVyQ7qK+0bYZefby1ql5L0uhCntVZMwjD5UYwu
	chZ8A5lRzY89jDMh1HWme
X-Received: by 2002:a2e:b888:0:b0:3a9:740d:51cb with SMTP id
 38308e7fff4ca-3a9c55c35bamr29858741fa.14.1791963353472; Wed, 14 Oct 2026
 00:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791688819.git.zihanx@nebusec.ai> <9c51ddfce3069d585b6c9b87e7e1bf3a3b0a2761.1791688819.git.zihanx@nebusec.ai>
 <asukIMajFpbzx3PH@strlen.de>
In-Reply-To: <asukIMajFpbzx3PH@strlen.de>
From: zihan xi <zihanx@nebusec.ai>
Date: Wed, 14 Oct 2026 15:35:39 +0800
X-Gm-Features: AclHuK8ty6mivB5FIuw80TCTFj2wHhuugNEb7CI7PsW7bvDOZiUh7UalF7d3aMw
Message-ID: <CAANe3eQSU06GJAaaj8Fd=S+THSJn0Eu+1Bt_E=VNZ0=rAQXnBQ@mail.gmail.com>
Subject: Re: [PATCH nf v7 1/1] netfilter: nf_dup: preserve duplication guard
 across NFQUEUE
To: Florian Westphal <fw@strlen.de>
Cc: linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, pablo@netfilter.org, phil@nwl.cc, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, kaber@trash.net, 
	jengelh@medozas.de, lukas@wunner.de, vega@nebusec.ai, root@tr0jan.top
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 10:58=E2=80=AFPM Florian Westphal <fw@strlen.de> wr=
ote:
>
> Zihan Xi <zihanx@nebusec.ai> wrote:
> > nf_dup_ipv4() and nf_dup_ipv6() set current->in_nf_duplicate while the
> > cloned skb traverses output hooks. NFQUEUE can retain the clone and ret=
urn
> > NF_STOLEN while that traversal is in progress. Once ip_local_out() or
> > ip6_local_out() returns, the task-local guard is cleared. NF_ACCEPT the=
n
> > resumes hook traversal after the queued hook in the verdict task, where
> > the guard is no longer set. A later dup rule can clone the packet again=
,
> > causing repeated packet processing and resource consumption.
>
> I find this waaaaay too complex.
>
> >  include/linux/sched.h            |  2 ++
> >  include/net/netfilter/nf_queue.h |  1 +
> >  net/ipv4/netfilter/ip_tables.c   |  5 ++++-
> >  net/ipv4/netfilter/nf_dup_ipv4.c |  5 ++++-
> >  net/ipv6/netfilter/ip6_tables.c  |  5 ++++-
> >  net/ipv6/netfilter/nf_dup_ipv6.c |  6 +++++-
> >  net/netfilter/nf_dup_netdev.c    | 13 ++++++++++++-
> >  net/netfilter/nf_queue.c         |  4 ++++
> >  net/netfilter/nfnetlink_queue.c  |  8 +++++++-
> >  9 files changed, 43 insertions(+), 6 deletions(-)
>
> Holy cow...  This is waaaay to large/complex, sorry.
>
> >       unsigned                        in_nf_duplicate:1;
> > +     unsigned                        in_nf_dup_netdev:1;     /* netdev=
 dup output is active */
> > +     unsigned                        in_nf_duplicate_reinject:1;     /=
* NFQUEUE resume */
>
> I don't understand this.
>
> >       struct nf_hook_state    state;
> > +     bool                    in_nf_duplicate;        /* skb is on a du=
plication path */
>
> OK.
>
> > diff --git a/net/ipv4/netfilter/ip_tables.c b/net/ipv4/netfilter/ip_tab=
les.c
> > index 809441ced..7c2027ef8 100644
> > --- a/net/ipv4/netfilter/ip_tables.c
> > +++ b/net/ipv4/netfilter/ip_tables.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/vmalloc.h>
> >  #include <linux/netdevice.h>
> >  #include <linux/module.h>
> > +#include <linux/preempt.h>
> >  #include <net/ip.h>
> >  #include <net/compat.h>
> >  #include <linux/uaccess.h>
> > @@ -270,7 +271,9 @@ ipt_do_table(void *priv,
> >        * but it is no problem since absolute verdict is issued by these=
.
> >        */
> >       if (static_key_false(&xt_tee_enabled))
> > -             jumpstack +=3D private->stacksize * current->in_nf_duplic=
ate;
> > +             jumpstack +=3D private->stacksize *
> > +                          (current->in_nf_duplicate ||
> > +                           (in_task() && current->in_nf_duplicate_rein=
ject));
>
> ?  Aside from me not getting the need for in_nf_duplicate_reinject, why
> is the in_task() needed but for in_nf_duplicate its not needed...?
>
> As those are bits they even reside on same address...
>
> >  {
> >       struct iphdr *iph;
> > +     bool in_nf_duplicate_reinject =3D in_task() &&
> > +                                     current->in_nf_duplicate_reinject=
;
>
> Same question.
>
> >  #include <linux/slab.h>
> >  #include <linux/init.h>
> >  #include <linux/module.h>
> > @@ -219,6 +220,9 @@ static int __nf_queue(struct sk_buff *skb, const st=
ruct nf_hook_state *state,
> >       *entry =3D (struct nf_queue_entry) {
> >               .skb    =3D skb,
> >               .skb_dev =3D skb->dev,
> > +             .in_nf_duplicate =3D current->in_nf_duplicate ||
> > +                               (in_task() && current->in_nf_duplicate_=
reinject) ||
> > +                               current->in_nf_dup_netdev,
>
> Why not simply
>
>         .in_nf_dup_netdev =3D current->in_nf_duplicate ?
>
>
> > +     bool old_in_nf_duplicate_reinject;
> >
> >       net =3D entry->state.net;
> >       pf =3D entry->state.pf;
> > +     old_in_nf_duplicate_reinject =3D current->in_nf_duplicate_reinjec=
t;
> > +     current->in_nf_duplicate_reinject |=3D entry->in_nf_duplicate;
>
> Don't understand the need to store the old current state here.
> Nor the "|=3D".
>
> > @@ -378,7 +382,7 @@ static void nf_reinject(struct nf_queue_entry *entr=
y, unsigned int verdict)
> >       if (!hooks || i >=3D hooks->num_hook_entries) {
> >               kfree_skb_reason(skb, SKB_DROP_REASON_NETFILTER_DROP);
> >               nf_queue_entry_free(entry);
> > -             return;
> > +             goto out;
> >       }
> >
> >       hook_entry =3D &hooks->hooks[i];
> > @@ -417,6 +421,8 @@ static void nf_reinject(struct nf_queue_entry *entr=
y, unsigned int verdict)
> >       }
> >
> >       nf_queue_entry_free(entry);
> > +out:
> > +     current->in_nf_duplicate_reinject =3D old_in_nf_duplicate_reinjec=
t;
>
> ... nor this.  AFAICS the only change we really need is to move the
> local_bh_disable/enable pair to cover the hook iteration is well in
> nf_reinject() to avoid BH interference clearing current->in_nf_duplicate
> resp. acting on wron rect "current" task state.
>
> I think we either need to find a way to make this patch way simpler or
> go back to the "no duplication/TEE in userns".  As I already wrote
> earlier, I see no use case for dup/TEE is namespaces, except for CI
> maybe.
>
> Also, I think there are many many other ways to make kernel eat lots of
> RAM, so I don't think there is any need to ftarget nf tree either.
>
> Sorry, I know you've been spinning on this for a while, but this is too
> hard for me to comprehend.

Hi Florian,

Thanks again for the review. I tested the simpler approach you suggested:
extending the local_bh_disable() / local_bh_enable() scope in
nf_reinject() to cover hook lookup, hook traversal, and okfn execution.
The experiment changed only nfnetlink_queue.c and built successfully
against nf.git main at ab699d296e06.

I ran the IPv6 TEE/NFQUEUE reproducer in a 2-vCPU, 2-GiB QEMU guest
in a network namespace owned by a non-initial user namespace, with:

QUEUE_COUNT=3D1
PAYLOAD=3D1
TEE_CLONES=3D1
panic_on_oom=3D0

The bounded run reached 68,881 callback iterations in 6.700 seconds and
exited normally. No OOM, panic, Oops, BUG, or soft lockup was observed.
This was a bounded resource-consumption run, not an OOM or crash test.

The reproducer continued executing the callback loop throughout the
bounded run, so extending the BH-disabled region alone does not address
this case. It protects against BH interference during nf_reinject(), but
it does not preserve current->in_nf_duplicate across the asynchronous
NFQUEUE verdict path: the original ip_local_out() or ip6_local_out()
call has already returned and cleared the task-local guard before
reinjection starts.

I have also prepared an unsubmitted two-patch v8 candidate that moves the
duplication state into the skb, keeping the IP and netdev states separate.
It requires additional skb metadata handling, GRO compatibility checks,
and bounded asynchronous netdev duplication using NF_RECURSION_LIMIT.
Although this avoids the task-local and queue-entry state propagation in
v7, it introduces its own complexity.

The simpler alternative is the user-namespace restriction you suggested.
It would reject installation with -EPERM at these four entry points:

xt_TEE.c: tee_tg_check()
nft_dup_ipv4.c: nft_dup_ipv4_init()
nft_dup_ipv6.c: nft_dup_ipv6_init()
nft_dup_netdev.c: nft_dup_netdev_init()

The checks would reject installation of TEE targets and nft dup
expressions in network
namespaces whose net->user_ns is not init_user_ns. They would leave the
packet-processing fast paths and init_user_ns-owned network namespaces
unchanged, while making the restriction explicit at setup time.

This would be a policy mitigation rather than a general fix for
asynchronous duplication. It would disable these features in network
namespaces owned by non-initial user namespaces, including potential CI
and container use cases, and existing userspace configurations would
need to handle -EPERM. Any future duplication frontend would also need
equivalent coverage.

Given your concerns about complexity, I am inclined to pursue the
user-namespace restriction rather than send the skb-state v8 candidate
as-is. Would you agree that this is the more appropriate direction, or
do you think the skb-state approach is worth reviewing further?

Best regards,
Zihan
