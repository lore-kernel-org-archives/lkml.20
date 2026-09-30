Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908154457B6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800973; cv=pass; b=Fx68EqU22lCYqZYKApRYkrJgmHdgFPfYWjFz7fyT+oy0AG3uyUSalI1KPatqTgulRYPUKJJ7IsvUfK+QS36h1CAd5fhlppU7IIsVc4zASCS2g+3HOm7BHLpARKRxLDRGcGsp/UI3jX/TgWRN6godMkjhODxt4t6LlY+JxANAmoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800973; c=relaxed/simple;
	bh=uoSw4m1UPRiR0DOrq838jEkWH25Iraqn/wCMuaX8AyU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0BOE+kaSH4i3Ldl1VFrtEu3mCg2002YG/Kd6KCBUoafLH0SWaWFUBH92N0AjTv9LGoGttHYWBRoHnWqtbln3C68rft9GN4iT4hM/9c9jltRIKMhsU8SxtHNE4WASCvxEsPzTabghBjABGtwxFYFITyt+SdBlvcEj27Bhjb/+rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CF5lsCQ+; arc=pass smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CF5lsCQ+"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532bd8c7f70so9332821cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790800970; cv=none;
        d=google.com; s=arc-20260327;
        b=W0QEnuscXLWMFFBfSRbk4iSMwp9CzQ+6sJMd9bL2bb0CvSQWrRSqFCO82tGgQuOjMm
         jDanVozqh+BOihkaeZl8ZAiapm7NuHO3x34kNxBKnFHP3MyVWhJSCodPF+kKx7uyBJl8
         xnRzPgAGLfMKCb7rvDIf8Dik8UQIjhxsmQFK7xQu7Z0C8jfEKEZVaOv+1gIEaKi2e8+E
         rRbV9m78hrmS+it/BitU3qbf8C9zRMzZUh3BqSEdBg2Advtey37uSA+btL7Rf6CABGqD
         fJG8yTgZNR4Q26eUlmMFqO6/R+TwvBNIZDSVyuVWTsMv3tFgHGbV+LUC71qtIRUabbRb
         MCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=SmRSsyzUrinvBTCrsW41XyKA0ylOMf9X8VUOjwXjI5U=;
        fh=eE6NlGgOLMLAmYYvNWpnIrcvvHnZko3zbbL12S7e6Q0=;
        b=p08vWLKhFdfZOWqhB8HDbM+CHFqnHD+dVwWdBQZ8Wxvvyn1Q/Sxt+kHDV5knjQpVET
         IAlhsvi0RGNuEQK3DhIjFsN9CKvqf73j5Wet+/JfZ97+xfmaIagdfltMqW517Bo5YLGm
         OYN5ng5fKd9vQGhjo1uMzdUtC4XJaCk0ErlZNVFnrXDusm2DZtg8SGenaA3jnYxquXry
         rr8TktYpTVbX+rPvcoJaBhvHnGt0jP5HKHcJn3L5S/LY6M1z6DFkCzphPrwmVuVwlrmU
         OrFKlc5/ESSbPoqVlbq5GknnA851JRsKAmgmicZCADSO8z/NlVyy4TkH0S8qioGLnp0/
         MiLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790800970; x=1791405770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmRSsyzUrinvBTCrsW41XyKA0ylOMf9X8VUOjwXjI5U=;
        b=CF5lsCQ+0i0QisY6urabMTAIQ9B7l+UVttAYJhhfR0pTKcyqjpx3jGWQbZMkWNUzp+
         i5oIUfXUiEViNwZ0Ve72gy4DXe9Sw4ZsY13CvZOeAh9WlWXW3kS4diJig2WaafhRQf1v
         mPmHgCufwnlWHEdlyJqLUjc36eVWxU6yC3EjceQ/RRIHxpJKfBHQ2wqUWwjMwH+6/EJE
         KiVYrEZNlb+4c02AhSTgPKcFVlwD+uJUz7JfV0iTd/bLdna33/LuSj29AP7O6VOF1AGc
         23GhAob7s/b9kMhmlmc0KRZdncJWC30LCDHEbpmk4gFcQod7kleT7VxVDHigaGzj5C9v
         58JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790800970; x=1791405770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmRSsyzUrinvBTCrsW41XyKA0ylOMf9X8VUOjwXjI5U=;
        b=nYkutgkcoKhQqKVCiWIKBYm+YcLcIGkvNIikroc850yXhjNn2L32qFxh+hhBmM1l53
         AChY5oYibrr3LBweL+xNDbgmqb59joehGk8VbXNvQ1IuWFBwz1Vuy2MHsj+IDKVDFA1R
         MLEQLeh56f16KTQnQsnQhUZvHIZPkPJXTbLMpyY4g02tM55mg8qLrsPdbHYEpRhIJddD
         dhhtT10OldHsk3KZ6X6aS+xi4OJ0Mi4OF76PJLWI6HABs5Iyau8xMe05deKJ95zBZ9eZ
         aTuqu+YdxEdD5E0VDFTohuX1cpIMfzwPhpoAzgxZOlZ030Zp3Wb0gvIx4FXd2cY4hrXi
         NNyg==
X-Forwarded-Encrypted: i=1; AKwUvBx2bQ/IdEfeczyY5yqo+toZhykm8lKtYIBVdtltooa2iH2wWtVTHbpBQ3PHX6aJX7dkNG34KISthAXmtcI=@vger.kernel.org
X-Gm-Message-State: AFuF++kallj/P36DePEBtQaLQAXX18/bWAnbG4keF5+zPH3coEvks369
	cVCFIJ6IfyEmjwV2G6eNkFJ1LPwMS2vnSogehUV3FGmVbPMscqx+62mC1XCMh+XZ/QCpQUxLoJk
	UOAUNNvoOmwJRJKm+3RaNz8wSDe6Y1Ns=
X-Gm-Gg: AYBFou1h0zp3O/aw5i3tADm+9u2RKdg+C6UGY7Rv4Khb+EI1VqaNO4tnZ6c3F9hzLZY
	qAuGIHWkgKY/Gy9Ngr0/qYjapAAFb038tPagvMH2M+QQ5rI9GuAH3kO3o2IA0eoafAXqJajooq+
	NBizkIKrytmr98nTTQlD3SkceJmUndklpw3mBlK26vis/cThoN3+NF+7xOl+vA/p3jT7Ksp9bml
	axIDLUGDcM4Sq9KrRm9PS+We8fJYvz95hCZjf4QWBVTqWtmZjk3tyYwv9mvS/bAFqP74mabs19w
	xuVlLynYvweDc6FCI0HLc6zKOcX+U1R53WkbOQ27SLLOxohSfAfvWR3RjYeYw7DNl/Zx/ykd3Sq
	D6O+bskot8SEe1JbNG3ZkGhuj1f+7odeSZX89mdE1
X-Received: by 2002:ac8:59d3:0:b0:531:2663:2cd with SMTP id
 d75a77b69052e-533742de4cfmr49345771cf.1.1790800970548; Wed, 30 Sep 2026
 13:42:50 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 13:42:49 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 13:42:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <178990319901.2160803.11700779813478787502@kernel.org>
References: <20260916104735.3565609-1-miguelgarciaroman8@gmail.com> <178990319901.2160803.11700779813478787502@kernel.org>
From: =?UTF-8?B?TWlndWVsIEdhcmPDrWEgUm9tw6Fu?= <miguelgarciaroman8@gmail.com>
Date: Wed, 30 Sep 2026 13:42:49 -0700
X-Gm-Features: AclHuK_aK0K1Qan_aoefqESDGs5MbzG4IEtBNztEJgV5DL3QlO79J2Ng2ii6_4g
Message-ID: <CABKbRo+CQh9WNFm8v6Y_Xgh2LM3+7aWEAxYfG9kU3BaqBio2xA@mail.gmail.com>
Subject: Re: [PATCH net v2] llc: stop connection timers before dropping sap
 ref on release
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. A single timer_delete_sync() pass does not
prevent rearming, so v2 is not a complete fix. The locking explanation
also needs correction.

Please hold this version. The teardown ordering and synchronization need
reworking before a respin; I don't have a validated replacement yet.

pw-bot: cr


On Sun, 20 Sep 2026 11:19:59 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Incomplete fix: the new `llc_sk_stop_all_timers(sk, true)` in
>   `llc_ui_release()` (net/llc/af_llc.c:225) does not establish the=E2=80=
=A6
> - [Low] The new comment in `llc_ui_release()` (net/llc/af_llc.c:218-224)
>   and the commit message both state that `timer_delete_sync()` "must not=
=E2=80=A6
> - [Low] `llc_sk_stop_all_timers()` ends with the plain stores
>   `llc->ack_must_be_send =3D 0; llc->ack_pf =3D 0;`=E2=80=A6
>
> --
>
> llc: stop connection timers before dropping sap ref on release
>
> This adds a synchronous cancellation of the four llc_sock connection time=
rs
> in llc_ui_release(), placed after release_sock() and before the extra sap
> reference is dropped, so that the timer callbacks cannot dereference an
> already RCU-freed llc_sap.  A few questions about the new window and the
> new comment below.
>
> Closes: https://syzkaller.appspot.com/bug?extid=3D44efda9647c52be29d9c
>
> > diff --git a/net/llc/af_llc.c b/net/llc/af_llc.c
> > index b0447c33dbf09..4fc397fad4d2e 100644
> > --- a/net/llc/af_llc.c
> > +++ b/net/llc/af_llc.c
> > @@ -215,6 +215,14 @@ static int llc_ui_release(struct socket *sock)
> >  		llc_sap_hold(sap);
> >  		llc_sap_remove_socket(llc->sap, sk);
> >  		release_sock(sk);
> > +		/*
> > +		 * Timers dereference llc->sap.  Cancel them while the sap is
> > +		 * still held; llc_sk_free() runs after the final sap put and
> > +		 * would otherwise race with kfree_rcu(sap).  Must run after
> > +		 * release_sock() to avoid deadlock with bh_lock_sock() in the
> > +		 * timer callbacks.
> > +		 */
>
> [Severity: Low]
> Is the deadlock rationale in this comment accurate?
>
> llc_conn_tmr_common_cb() in net/llc/llc_c_ac.c takes only bh_lock_sock():
>
> 	bh_lock_sock(sk);
> 	if (skb) {
> 		...
> 		llc_process_tmr_ev(sk, skb);
> 	}
> 	bh_unlock_sock(sk);
>
> and bh_lock_sock() is spin_lock(&sk->sk_lock.slock), while
> lock_sock_nested() releases slock before it returns and leaves only
> sk->sk_lock.owned set:
>
> 	spin_lock_bh(&sk->sk_lock.slock);
> 	if (unlikely(sock_owned_by_user_nocheck(sk)))
> 		__lock_sock(sk);
> 	sk->sk_lock.owned =3D 1;
> 	spin_unlock_bh(&sk->sk_lock.slock);
>
> Since a process-context owner of the socket does not hold slock, wouldn't=
 a
> timer_delete_sync() called under lock_sock() let the callback acquire slo=
ck,
> run to completion and return?
>
> What does change across release_sock() is sock_owned_by_user(): under
> lock_sock() llc_process_tmr_ev() queues the event via __sk_add_backlog()
> instead of running llc_conn_state_process() inline.
>
> Could this comment and the matching commit message sentence,
> "timer_delete_sync() must not run under lock_sock() (timer callbacks take
> bh_lock_sock()), so stopping after release_sock() is required", be reword=
ed
> to describe that difference instead?  As written they suggest that stoppi=
ng
> timers or marking state while still holding the socket lock is forbidden.
>
> > +		llc_sk_stop_all_timers(sk, true);
> >  		llc_sap_put(sap);
>
> [Severity: High]
> Does this establish the invariant that the following llc_sap_put() needs,
> namely that no timer can be pending any more?
>
> llc_sk_stop_all_timers() makes a single fixed-order pass:
>
> net/llc/llc_conn.c:llc_sk_stop_all_timers() {
> 	if (sync) {
> 		timer_delete_sync(&llc->pf_cycle_timer.timer);
> 		timer_delete_sync(&llc->ack_timer.timer);
> 		timer_delete_sync(&llc->rej_sent_timer.timer);
> 		timer_delete_sync(&llc->busy_state_timer.timer);
> 	...
> }
>
> timer_delete_sync() waits only for that one timer's callback and has no
> shutdown semantics.  Can a later-deleted timer's callback re-arm an
> earlier-deleted one?
>
> llc_conn_rej_tmr_cb() -> llc_conn_tmr_common_cb() -> llc_process_tmr_ev()
> -> llc_conn_state_process()
>
> and llc_common_actions_11c / llc_common_actions_11d in net/llc/llc_c_st.c
> contain:
>
> 	[1] =3D llc_conn_ac_start_ack_timer,
>
> which is an unconditional re-arm in net/llc/llc_c_ac.c:
>
> 	mod_timer(&llc->ack_timer.timer, jiffies + llc->ack_timer.expire);
>
> The same holds for llc_normal_actions_20a / llc_normal_actions_20b, whose
>
> 	[3] =3D llc_conn_ac_start_p_timer,
>
> re-arms pf_cycle_timer, the timer deleted first in the pass.
>
> There is a second way into the same window.  llc_conn_handler() takes the=
 sk
> reference under RCU, and its only re-validation is:
>
> 	if (llc_sk(rc)->sap !=3D sap)
> 		...
>
> llc->sap is never cleared during release, so a softirq whose lookup preda=
tes
> llc_sap_remove_socket() still passes that check.  release_sock() has alre=
ady
> run, so sock_owned_by_user(sk) is false and the frame goes straight into
> llc_conn_rcv() -> llc_conn_state_process(), whose actions mod_timer() as
> well.  Can that land after the last timer_delete_sync() returns and befor=
e
> llc_sap_put()?
>
> Is anything suppressing the state machine in this window?
> llc_process_tmr_ev() only discards events when the connection is already =
out
> of service:
>
> net/llc/llc_c_ac.c:llc_process_tmr_ev() {
> 	if (llc_sk(sk)->state =3D=3D LLC_CONN_OUT_OF_SVC) {
> 		...
> 		kfree_skb(skb);
> 	} else {
> 		if (!sock_owned_by_user(sk))
> 			llc_conn_state_process(sk, skb);
> 	...
> }
>
> and that state is set only later, after llc_sap_put() has run:
>
> net/llc/llc_conn.c:llc_sk_free() {
> 	llc->state =3D LLC_CONN_OUT_OF_SVC;
> 	/* Stop all (possibly) running timers */
> 	llc_sk_stop_all_timers(sk, true);
> 	...
> }
>
> If llc_sap_put() here drops the last reference, llc_sap_close() does
> list_del_rcu() + kfree_rcu(sap, rcu).  A pending timer holds no RCU
> read-side protection, so if the releasing task is delayed between
> llc_sap_put() and llc_sk_free(), can the re-armed timer still dereference
> the freed sap (sap->laddr.lsap in llc_conn_ac_send_sabme_cmd_p_set_x()),
> which is the reported signature?
>
> Reaching release with an armed state machine also looks easy:
> llc_send_disc() in net/llc/llc_if.c returns without any state transition
> when the atomic allocation fails:
>
> 	skb =3D alloc_skb(0, GFP_ATOMIC);
> 	if (!skb)
> 		goto out;
>
> Would using timer_shutdown_sync() for all four timers on this teardown pa=
th,
> setting llc->state =3D LLC_CONN_OUT_OF_SVC while the socket lock is still
> held, and/or keeping the extra sap reference until after llc_sk_free(sk)
> close the window instead of narrowing it?
>
> [Severity: Low]
> Can this call race on llc->ack_must_be_send and llc->ack_pf?
> llc_sk_stop_all_timers() ends with two plain stores:
>
> 	llc->ack_must_be_send =3D 0;
> 	llc->ack_pf =3D 0;
>
> The existing callers are serialized: llc_sk_reset() runs from state-machi=
ne
> actions with the socket owned or BH-locked, and llc_sk_free() runs after
> sock_orphan() and sock->sk =3D NULL, when nothing can be dispatched to th=
e
> socket.  This new call site holds neither lock_sock() nor bh_lock_sock().
>
> Meanwhile a softirq that took the sk reference in llc_conn_handler() befo=
re
> the unhash can run llc_conn_state_process() under bh_lock_sock() and
> read/write the same two fields, for example through
> llc_conn_ac_rst_sendack_flag() and llc_conn_ac_send_ack_if_needed().
>
> Would KCSAN flag this pair of accesses, and can the concurrent state mach=
ine
> set the flags again right after they are cleared here?
>
> >  	} else {
> >  		release_sock(sk);
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260916104735.3565609-1-miguelgarciaroman8%40gmail.com
