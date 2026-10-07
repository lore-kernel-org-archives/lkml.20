Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF838E126
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408254; cv=pass; b=KT/YDsplwwd3dlIeCV237ZIIvv8QZujdkMR7O7RVwbF5ner052lDqGAauFp8SMlZqICW6ajZnRfaQcfWIRUbN3px8kfGHB+70Cm3qT6F8Ni/VWoIIhTU39xbreCteM4WoLW6RlufYIeVPZ9oIyOW389IRscnpVkV4P0uuZrZ55w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408254; c=relaxed/simple;
	bh=/lNFX67BceVjk6Q9VCnmwWo5BV1LSykqG/p5LMy4K3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZapIYoAVHUdpbpA3R4FpQWFNa+mA619orPYjdy1f60a3j3qALO/4DmXVgjVtKWV6TjSA3vcPCe7YyRixJM09CD0X7INuF0VIq6wh8C4tBC7nq0Wv+1A6lawOGR4jYUknJIGGlBwsGXz7G6X1coqNa0Wr1h1he+9Cs11HwWh83a8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai; spf=pass smtp.mailfrom=nuro.ai; dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b=Gf2VHHje; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b="Gf2VHHje"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34ceab2900eso4033712eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791408250; cv=none;
        d=google.com; s=arc-20260327;
        b=HvlDj3PpNEgKqtmY/3pKd73iALOA67xkGCEUFYJTu8pPzE6PzIiuQdkngnWn5j1vGw
         rKW1gt+9bIjarn7QvLTgkHvUrYNcZadGidbAvURQwnfjQpv/2DQq2qRkJttPhqx3E6X/
         GfPs+UF439l5FGQjk6n1+RIuEFF0fvYeInNN71CXzo45zjyE2X+Stv5nuA8Q4uPHeYD7
         d/RdfZX/QpbGaskD+9qcDVrEIw4mfoNredUU5PCNT31Jd9v6cyac3FqIKz9hahh7o/b1
         aALbRpVJavDiTmUbch6qrY/0Et+udSsh6V9fCzjrwevQ5Ll412mN+9POLNyLFvpOO5kh
         Yz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LO61wYACHd+oids/QJ96f5oOR04UNVlFvX9IYm4n0vY=;
        fh=lBmP4Z3ilks1INUKBXQ+oB8Ww/6ukiia09SzIYsctW4=;
        b=MPpIhNFpPiC0fyDdyMsiFbieW9FNRY0i8cQqHRiqk8YUsG6Gk95YFRZRPzrHTG8ldI
         M1yOOSGjRifPCoKlwYoqU7fLVye2tiM7DXzrzX8x6i1uSdx9t+xVdY+HxhHADhDhDI9S
         CU9zopTH3bMoLbLip/pSaHpEKNzXZ27PRw79dK5fWTxwenPlb81vKKhy1SlHikhtyEW2
         lO5zp2++gEC4ZrsZbQQNUkLwUiC25/8I0XvhVWdDJIEzLq3h85jk6wBX1op2g8fmFWRH
         +vZy2YKi4283WYNxdLE8AQDx9nPQ1ZsFuYIWkD9LcAICHAUE3UDEQqJuLKQ09FloJG1Y
         3nwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1791408250; x=1792013050; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LO61wYACHd+oids/QJ96f5oOR04UNVlFvX9IYm4n0vY=;
        b=Gf2VHHjerMb2KfUdUG2VUBgLaxfGsToPvV2dEEqzRgqQma227beFjIMnzg16xQ+amV
         w81EuZQbrg6BSfusm+vYcJlI69mStrqRPyW7rdNfQ3VIILO1YRfAZ/+G6EddO0KZypUN
         2RHsZwy7MmPe2sIsZyDMirNfvtlcq9zY/RN3sLCVJCv2p/AvhhhzVPCKNko0jsicQ+BP
         6cdM6lQ5G6eZECRS8Ykfa8Orthupmqaf99dSojM0qKhmdieIQKrTVFxaqlTdvOlpn60X
         izcLzkqc7lVv3UWAg1A2uloCB+mf2KNcreiH6VdquTRi/PzkVM8T4whveqlPVTEAhkR6
         qSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791408250; x=1792013050;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LO61wYACHd+oids/QJ96f5oOR04UNVlFvX9IYm4n0vY=;
        b=flfEY3bPzTjNF42WOwNhZ+dAPESs85wcxyv+g+5QyqPpk8hLM7N4b6kytlFDlJnOU6
         fPeHvwkbc8ADdFLGX7rgHuyOj0AnSCmH7uvEhkwF59XNZtzNAVjraiMYVevFU7iWo6JA
         cfNAE5NYZHewRdvq584KrtnQxHhrQONGGufvv3ZNkZmb0krB22S/Pu0mKiX2LzxsU4Eb
         o9L9AprYcvMCh4HuwMqbhP4oqiCNh+ZWp50lUm0B890CZBYQzctVxohuLCDpRM5AGAHH
         Dl0pUCb4s4ITv5UxjPuaxiHt6H0ophUBMAng/ryxgf7IknBkqxh8IHj+o1jtDSlLhfG1
         ZnTw==
X-Forwarded-Encrypted: i=1; AKwUvBwYO7UZygtHuAeCp2NabosPY6rni7donefjT9cBN7iHbM9ts1CsLlJSFWFR52R8D3irR013L1Seu7bO36o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEPZph6JSia3qDNFhIJdTuJBywQZNRstJMkL17iicOfWLAuQFD
	0H00vGdyvcW+m6/C6xWFg7Mozv7e1zWQOSOvM72yd30QE62YFawrEg2a6n/TgLOgXmaHWpoHZxK
	ANGxcru19shY3tvnMc3T3DC7fmIQc7z9YworhOAdJCQ==
X-Gm-Gg: AYBFou3OJJmpcA3IRpIMmT7bOrqzz6pKW6ZIdiUGKCBgIWHAMx9LeFcs6KCGtxN+iZn
	w2pGIf5JvarNgiVWeJ+lMxbULOwMOR3m7CENR+lNksNgaSBEQyd3m/VZ51eok2Vsn8uElPovru8
	Lp7puSh1KWx0qVWUsD+03JHmvPp8W900BP0Jv4hOKsgvw2HeTbvsEPSLSdQAdddEWG9k/i62EKR
	aVTHT8Og+7sSzEuaY0ZYu56lkpV3zfUpJlRu5TOa9SmeU4QPsgOtInn2hb8HY2oMbgBkwklR807
	4YQcF59EhxEqo3jZeA31xmVSoDg7kdIiACNsSg1DNGcaQTD6B+I354KHnxT0R7l4qq7v0wHoOrz
	HggDE2Qu1afKH0mA=
X-Received: by 2002:a05:7301:825:b0:351:70ec:1071 with SMTP id
 5a478bee46e88-35170ec1462mr1592185eec.16.1791408249737; Wed, 07 Oct 2026
 14:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007180056.1394868-1-jkain@nuro.ai> <CAL4WiipPRh_=aWcHF1+JuKQno8AR-V1bf=yDfgaPQbTDvsOWSw@mail.gmail.com>
In-Reply-To: <CAL4WiipPRh_=aWcHF1+JuKQno8AR-V1bf=yDfgaPQbTDvsOWSw@mail.gmail.com>
From: Joseph Kain <jkain@nuro.ai>
Date: Wed, 7 Oct 2026 14:23:58 -0700
X-Gm-Features: AclHuK882S8MLKyOoObkKSwwFJpQZhgLXUqMlLQkMDw9-UQJoFKKgmpAA0agWZ8
Message-ID: <CA+Y90PgXVxo0=4D-v7Nuj5Qh9TFbu2WG=r_dk4zB0tD3ZHWpNQ@mail.gmail.com>
Subject: Re: [PATCH net] net: do not let defer_count outlive an empty defer_list
To: Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(resending with the list cc'd.  My previous reply went to Eric only)

On Wed, Oct 7, 2026 at 1:23=E2=80=AFPM Eric Dumazet <edumazet@kernel.org> w=
rote:
>
> Le mer. 7 oct. 2026 =C3=A0 20:03, Joseph Kain <jkain@nuro.ai> a =C3=A9cri=
t :
> >
> > __skb_defer_free_flush() can leave defer_count at or above skb_defer_ma=
x
> > with an empty defer_list. That state is absorbing: every producer then
> > takes the nodefer path without queueing, so the list never refills, and
> > the flush keeps returning early without clearing. Deferred freeing stay=
s
> > off for that (cpu, node) until reboot, and cross-CPU frees fall back to
> > the page allocator, which is the contention deferral exists to avoid.
> >
> > Two changes from commit 844c9db7f7f5 ("net: use llist for sd->defer_lis=
t")
> > combine to produce it.
> >
> > skb_attempt_defer_free() now increments before testing the limit and do=
es
> > not undo the increment when it rejects, so a rejected free leaves the
> > counter raised with nothing queued.
> >
> > The flush clears defer_count before llist_del_all() rather than togethe=
r
> > with it under defer_lock as it did before. A remote producer that queue=
s
> > between the two has its skb drained by that same llist_del_all() but it=
s
> > increment retained, so the counter drifts upward until it reaches the
> > limit.
>
> This is not cumulative: the next flush finding a non-empty list resets
> the counter. To get stuck, (skb_defer_max - 1) increments must land
> between the clear and the drain of a single flush. With small limits this
> needs nothing special, but with the default of 128 the flusher has to be
> interrupted or preempted at that point. Please reword this part and the
> "needs no preemption at all" paragraph.

Thanks, you are right; any later flush finding a non-empty list clears the
counter.  I will rewrite this portion in the upcoming v2.

>
> >
> > Neither needs PREEMPT_RT. The drift needs no preemption at all: the
> > flush normally runs in NAPI poll on the CPU that owns the list, while
> > skb_attempt_defer_free() only ever defers to a remote CPU, so producers
> > cannot be excluded by disabling preemption on the flusher. PREEMPT_RT
> > only widens the window, because local_bh_disable() does not disable
> > preemption, so the flusher can be scheduled out between the clear and
> > the drain.
> >
> > The latch is also reachable with no race at all:
> >
> >   sysctl -w net.core.skb_defer_max=3D1    # frees increment, then rejec=
t
> >   sysctl -w net.core.skb_defer_max=3D128  # does not recover
> >
> > skb_defer_max has .extra1 =3D SYSCTL_ZERO and no .extra2, so 1 is setta=
ble.
> > 0 is safe, because proc_do_skb_defer_max() flips skb_defer_disable_key
> > and the producer returns before incrementing, but that guard covers 0
> > only. Recovering from the latched state needs a skb_defer_max above the
> > accumulated count, which an operator has no way to determine.
> >
> > Drain before clearing, so the error can only under-read, is bounded by
> > the producers in flight, and self-heals on the next flush. Clear the
> > counter on the empty-list path as well, so no count can outlive an empt=
y
> > list and an already-stranded counter recovers.
> >
> > llist_empty() has already loaded that cache line, so the added read is
> > free; the unlikely() keeps the store off the hot path, where it would
> > otherwise bounce the line against remote producers.
> >
> > Found on an arm64 PREEMPT_RT system running the two commits backported =
to
> > 6.1. With skb_defer_max lowered, defer_count reached 788,888 on one hos=
t
> > and 122,399 on another with the list empty throughout, and restoring th=
e
> > default did not re-enable deferral.
>
> Not sure if this paragraph is needed?
>
> Lowered to which value? Have you seen this with the default?
>
> If the value was 0, note that kernels without commit 08dc30de1a40
> ("net: add skb_defer_disable_key static key"), i.e. 6.18 to 7.0, have the
> same issue as your skb_defer_max=3D1 example: setting 0 and restoring the
> previous value leaves deferral disabled. This is worth mentioning, since
> 0 is the documented way to turn the feature off.

Thanks, I will add that. The backport I reproduced on also predates the
 static key, so this is the case I hit.

>
> Please send a v2 with these changes (but please wait ~24 hours before V2)
>
> >
> > Fixes: 844c9db7f7f5 ("net: use llist for sd->defer_list")
> > Signed-off-by: Joseph Kain <jkain@nuro.ai>
>
> This is your first linux contribution, are you sure you have not used an =
LLM?
>
> ( See Assisted-by: LLM) tag in Documentation/process/coding-assistants.rs=
t

Oh, I certainly have used an LLM but missed the documentation.  I
will include the Assisted-tag in v2.


>
> pw-bot: cr
