Received: from mail-dy2-f34.google.com (mail-dy2-f34.google.com [74.125.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB7B2E2663
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790451922; cv=pass; b=XEe/lcSB59h3kaX/VnbmJDjbfOgEPrqxgexrqDMpRWigCS4FPyN4ZWyTWsjkfLTxoITEupZ2KpoxykkYBFNKdMh2pHPK2FwrmUc5UAFppLQpVFnXW8Ct8OvYogbi+rNDPlIg40JuBfWlpdjmM37URavVKmeEvjT9Ez99yzPXRFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790451922; c=relaxed/simple;
	bh=vMd8GsMuD4jao3NXUeEIte2A3dKlC3qeBL4JoUhox8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCi2CpcjaFVqwgLGPJ2ICKGRLaV8Yd6MRJ0zoUArPHUEyiGgyW+lxu4yJYieFuIqMmdYsXabzMLhyBbqc42DWjlMi8dovGP/s6la/aEb2jVG6IUSOk0xapoaauuBOZGHghIOaZTprDHvL2uz+an9bThYZD1iLTYCZM8Sr+WWVU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T+72jxSd; arc=pass smtp.client-ip=74.125.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T+72jxSd"
Received: by mail-dy2-f34.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so2639486eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790451920; cv=none;
        d=google.com; s=arc-20260327;
        b=L4m1NiBNDOoAfAhjWEIl9F/PlJDrwgSYoOnj8ByX8AgMq8vVX/9nWnYYkChK9Vv48i
         TvIbWwg9OAtzQxNZREIoWP829uRsjrJMr290qBCKKdTuVti6BIYXns7KXdTFD2wnlwtY
         74N+V1mUYmcvPA0lkvM6VmPDn/P6eX9iiAqyoz9RDQ9yv6VTP2DVKxe4B0Lqt87gjr8e
         prnL4+SPKJTQ3/jHk4YfatGZWFKTgOIEd5kw2vIYY2t0xDfXckpXVon5VlRHIsDtk7h0
         8isc4L+Hm4i5bjrY10S7pMTqPKILfvuDpLi2sjDVP3MeZify4J5x6g8q1IZqVyWjB7E8
         17Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FjUFItVCb1OtbIiUyem3FlQubgeY67gIEO28FIlSwkw=;
        fh=TepKN94NiVxGpBAosuvk+ylj8pXWoolghMLZtOkj+Eo=;
        b=qnLgTS+rXB1jziNT4lXe+lwR+kscT121QiGjadnaFnS52mftHift7e2jAkvRs5pMwv
         wSjudsYFjfItdEHSKhyTqaWfKWr9pBZhkeO9Qb5xWhBU+yiEvhunAKTTNTht0C7zOTfN
         B3xN+PKw8V2B37BVDPUvfHgkcZut54WhM9fh9VhMzDlWS0yn5/i/i3lOEe1f7ZJNSVcp
         4CgmlJq7yJhHIeB/nskW0LYWCT4MAtORqJR+Gy50xhqjOm+jgKU+5T7U0owyXhHTiOy3
         9b6vJezBryRGmOedIDFakPWeixwmjXUQxvItWpKBoldbNCn4ws7EyQnjrteceNHzrBSf
         GE3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790451920; x=1791056720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FjUFItVCb1OtbIiUyem3FlQubgeY67gIEO28FIlSwkw=;
        b=T+72jxSdYnzhu0OZc276KDW9uUU2j8AnPe8rBA09unUGaCRrSQ6g35bNIJ4QzvRJp6
         b6Ugn6XNAvRZllsgvduocBNJAVCZLvF3ONAl6rJM4936C0BemhTacXjp1gDh5xFtjSE/
         vtyTUCrkrX9ENuFAeSzOqsYvEwsaD2zK8aheyy581rlFy6xlf00Eq6yiANm2QqiuP6co
         MXmy/vaKP4xWhOgAG+kwZ41McVr264/IgcK9LECW1f1XagS29WJX05xGTZbzzDCOBqcz
         k/MmtS0dZGsb0oWQgugT6pnVanQ/z83NrLg+g3pUipTuJ0JHVm5jJikrm2pOBUTk7I4E
         KvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790451920; x=1791056720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FjUFItVCb1OtbIiUyem3FlQubgeY67gIEO28FIlSwkw=;
        b=xOqUiSEY15bzxBGc7mpgNY+57WhUD50cwln2AUbsuO+vpYvz0ro0+mDsxx9gg5iD+i
         r6AkgFZ1DiZYxELP5SNedzLWCFqtOQ35YbWyDmcRL5tBiRYcR8Bnk+euZVIVvtU2xvpU
         KjUufZJSt7MlySJdetm8uAOR1u2lxCatMwFmQVp8SCdHxQGBhe8fvw/7OoSYeojWN4OL
         S4wVv+jo5+D6HTPDsLKETfrNbuaD3NF1k5CXkLgOe7NOIrXPOPzJCPwZePSBmfoFWpyV
         6lAJSuuQxprU2V9OEGNiyNAemPMpg0VJiav2aej1BSteERQkhsY/QhoAJ4LTJCgkBUtf
         9/Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzIA72zP/myY1or1brPdFX20iFplsYmFiYk/v8VonqLBwGY4zwTGpXwhqOobupE7uLwGEwTmzDbwY9Peag=@vger.kernel.org
X-Gm-Message-State: AFuF++nZaN2JsU1w+Jf7Qk0+wfJmg4LTkyx/ViT/lHqX/UlBgNmBn8kr
	yzluk0BaJeCz8UZtEyiRbzkurzd45fML7mbJ2I0hayx1MBQB5C+6aIe6bd5fQ3hE+jOUW64l57r
	oQyRLi4bTLP+OzdUVihfB4kzlDX9POvbBEvNThmod
X-Gm-Gg: AYBFou03JuWUT6IWHJPM6wxW6/IlkQaXFjRKxUkp5MiAGG38CBj55NlyonKsGRbMfIW
	UL8UJWJ4Km18Y0WsNniUFmj0ebT+fj6C4gcW7wfnWv8bxq794iOFjPP6EH1sLweShHMyvk6S8H6
	ZjIZzhTXENCSZbuD0ubtFZ2/lJ5KLs/YyR4koaHpHiSwBlGRFRi7HnEL7YS0s/pZQ6rP1zF7NvG
	TXSyfT2GiqVBivMy4nbZO1V8zY66FO7XgqnzXO9ejB04xA5xOWadaCqd35PL0cNxFdsH1G8pRs2
	TaiPvDUMDwEcpwHHhrkqvJJR1EPI5UkqNuT+t0JpZnEpueHKTBVo7+z/7Yl9uWDEauchlemp40J
	7TmaMEBUSClrweGZFrYMOj5q5pnA5rIaVS9WVBgvNbV8a0GjPLQ0WnYm1YjPfklx7EJ+U11ntSG
	U9iaH5fb8QiuFwvPqZXhO2XCwe
X-Received: by 2002:a05:7022:4a2:b0:144:c112:5f23 with SMTP id
 a92af1059eb24-146cfbdd14cmr5618707c88.24.1790451919152; Sat, 26 Sep 2026
 12:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926173737.2491492-1-nicoyip.dev@gmail.com>
In-Reply-To: <20260926173737.2491492-1-nicoyip.dev@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 26 Sep 2026 12:45:07 -0700
X-Gm-Features: AclHuK9P_0dSGn5n-LDOR3sJu9ffCR9nk1E1SlEYJe1HOrSar7Bqo3Defgr5xaw
Message-ID: <CAAVpQUDhSUO1bhXgmM=dafUYyThmc2k+pb8EtWwvD+ZLZ3AKmw@mail.gmail.com>
Subject: Re: [PATCH net] net: neighbour: Serialize proxy queue admission
To: Chengfeng Ye <nicoyip.dev@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Florian Westphal <fw@strlen.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 10:37=E2=80=AFAM Chengfeng Ye <nicoyip.dev@gmail.co=
m> wrote:
>
> pneigh_enqueue() checks p->qlen before taking proxy_queue.lock, although
> both enqueueing and the timer and purge paths update it under that lock.
> The unlocked read races with those updates and allows concurrent proxy
> ARP or NDP requests to bypass the queue's admission limit.
>
> For example, CPU0 and CPU1 can both observe p->qlen =3D=3D PROXY_QLEN bef=
ore
> either takes the lock. CPU0 then locks and enqueues, raising the count to
> PROXY_QLEN + 1. CPU1 subsequently locks and enqueues using its stale
> admission decision, raising the count to PROXY_QLEN + 2. The extra queued
> packets consume memory until the timer or purge path removes them.
>
> With a temporary 20 ms delay before locking and a queue-length assertion,
> the kernel reported qlen=3D6 with PROXY_QLEN=3D4:
>
>   WARNING: net/core/neighbour.c:1757 at pneigh_enqueue+0x4ee/0x650

Please do not include a local-only stack trace in the commit message.

A transient overshoot is not a problem.

You can already set PROXY_QLEN below the actual qlen anyway.



>   Call Trace:
>    <IRQ>
>    arp_process+0x1846/0x2060
>    __netif_receive_skb_core.constprop.0+0x1524/0x2bd0
>    __netif_receive_skb_one_core+0xa9/0x1b0
>    process_backlog+0x1e5/0x5e0
>    __napi_poll+0x9c/0x540
>    net_rx_action+0x988/0xfb0
>    handle_softirqs+0x18d/0x5b0
>    do_softirq+0x3b/0x60
>    </IRQ>
>
> Move the existing lock acquisition before the admission check so that the
> check and increment are serialized with all queue-length updates. Unlock
> before freeing a rejected packet. Keep the existing > comparison so that
> serial admission behavior is unchanged.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> ---
>  net/core/neighbour.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> index 7448320f7ad5..e35ce26b4f8a 100644
> --- a/net/core/neighbour.c
> +++ b/net/core/neighbour.c
> @@ -1721,7 +1721,9 @@ void pneigh_enqueue(struct neigh_table *tbl, struct=
 neigh_parms *p,
>  {
>         unsigned long sched_next =3D neigh_proxy_delay(p);
>
> +       spin_lock(&tbl->proxy_queue.lock);
>         if (p->qlen > NEIGH_VAR(p, PROXY_QLEN)) {
> +               spin_unlock(&tbl->proxy_queue.lock);
>                 kfree_skb(skb);
>                 return;
>         }
> @@ -1729,7 +1731,6 @@ void pneigh_enqueue(struct neigh_table *tbl, struct=
 neigh_parms *p,
>         NEIGH_CB(skb)->sched_next =3D sched_next;
>         NEIGH_CB(skb)->flags |=3D LOCALLY_ENQUEUED;
>
> -       spin_lock(&tbl->proxy_queue.lock);
>         if (timer_delete(&tbl->proxy_timer)) {
>                 if (time_before(tbl->proxy_timer.expires, sched_next))
>                         sched_next =3D tbl->proxy_timer.expires;
> --
> 2.43.0
>
