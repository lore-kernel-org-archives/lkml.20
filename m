Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E5495500
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056794; cv=pass; b=DfHbO7ITaLcwdONXkFsmXQTgSWililce+Vb4LCZtksRqku3zHSPSqQtCMAyaObybSj4cG/Hh/UfnQwKSHky9ErsEILL/oEoCK4mGdrgZ7Jaenm/EaugnG1SKdUe7D7Uc+Tmt3+uzkdtBoq9N+wxpuc0NSDmYqKqVD2o3juTYFIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056794; c=relaxed/simple;
	bh=gyCEr85muo1IcZ8BEDAQBdXVw7XlrGoIbyEzokUqs70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaGmtSGKYb+4aX9yHLnqizojVa0hELaRH9dZpm4F7AMjD0HO81ASCO3GLIy94oFJ0j06QrbpY0NZ2V4bszCKgwFy+8ITEvOfI3TUjYCAwzDOdCeZGCuzezBWy5Y3dv47Yk0rAIq6+hxRoK3DS7BZLOxpAHOssV59oEjYj61wnyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYxMr7/y; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYxMr7/y"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25bf832368so7693466b.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 12:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791056782; cv=none;
        d=google.com; s=arc-20260327;
        b=YBHvXCbnx0IEQ6OpOesYB+NNQUrMDj/bAU3X29kvV5HUkYigkI4PUX39Lzi193Appb
         7TGxLm3F1QHyHur5evTY08hMBhZ8M1kWpcDFoe2wFxD93xTpSr5L4e2mG6C/qOFPslvI
         HB+cmjy98YjUNL6MFLqACUCQxnSocBV+DVxS2jSTGBwnm8e2/PJwDrZG3YRVrlhlaU/c
         i2GtmjOszfcs6hZfF8rz4k4aLjzEa4d99QpiP7DolwJn5y6kEikkI8f3Q/1Fic7mEedf
         chTBQc8tIVv2n0qUAogtQYJpGaAaWTYXWFfvqUJ0x8v7l0MhP/2XPF29Kz7ZHBGnWYnH
         FBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+qV/L/2fUM1iBr4IKUcgQQzX7MgqliA4Mcl4KozKTq0=;
        fh=rlQTlN1uG3e66tu/7WIsk0UrJSkCy+M29GBV182eruI=;
        b=dqGWIVmqUioo17Sd+DDaO5ATsoqzDUc4XdasXZvZO61CjAE9fT7jVBfUWQD1hBVf4g
         Pqxa2UH/LcxH63d02MFN8QrM6vsXSeMhei1af9vnFVJBMPZAsp2bVdz0o8uJ2pQSDPvx
         Cd2EKzbX0YASibsLeOmYFUTlGbHH2woeun+kz4V65BUMFYSgYBQ0qvKIjOXJ2gc+yZVi
         yfdTu51ucFPrhcoxeMz4yeai/SoVJalmiCL35c6iW40m+DVBqD3cInal+Zjpc8SwBmtI
         XzSKBoZr1vSyitwWZ7p+p/RBVCNSFYIPtnxlcrCk/IHipNKXoTF0RJ2JxSOFS20/7Dok
         s12A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791056782; x=1791661582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+qV/L/2fUM1iBr4IKUcgQQzX7MgqliA4Mcl4KozKTq0=;
        b=LYxMr7/ymNj1BR0ht8qIimJZnsbLQQP1Nk9mOENyVHcjG4BdZVLoNzdQNz/JuQetMr
         2IG4zg63Xtq59te5U5Rp9nzv0hNFJ2rcf0OFYig97G8OErEa3SR5+vEEwl2lpLLZT+Xz
         8ZBQ4AX8jG7yFByHVFuDD9rcNs9wGlQPGgchjKLe09cabajiK84LROgNagC7q15Lbb69
         nMIw75VgB2lLyVU3T2f7X52bUXo4/narmp7h/aMkDDsiyLDs3n25w+EB4BgLLWQDJa2H
         xiWFAZIcz9v9d+pUM0rpEaH/gslZicUDfbq9pvDR2UU1nhFg9HgZ+LDzCW+K8+pUBdwL
         oscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791056782; x=1791661582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+qV/L/2fUM1iBr4IKUcgQQzX7MgqliA4Mcl4KozKTq0=;
        b=mPHMg965i2k2bJMxD+GUgRjAvUi92p0TJoMZpqCocWQOnZMhRGdece2qVG0yX7Ijes
         PVZmAkuLUIuG/f/4Y/KWvUwuj1rP5k7OS/7oWXayhlOeufurwkPikytXfTdqPOKHS0uQ
         5zv1YXn1Wrlj7WqGXZHDngVtsR4SSdL5zR3aEWCCeGh5kBS+CzuopBJZXkvDdbqFGQh/
         r2l+oAuLJrO3BEK+xsUyt+74+ZGRsCx6b7pnu6JijxBDmj5CDfTmFtMec0jtTw2BdwHq
         UrMnn98JJHvRBRzHaLF+ISE+nbOHgLsMAT5JSUfpegJwtsM3w4ZkFTdz00Dgqi0PNp01
         ua0A==
X-Forwarded-Encrypted: i=1; AKwUvBxasngBXoNnZzhJZVHTEq2m3tl6hoxr0uCA3TZduBnF0HLWA1zk/lRCRLjNVCbWgP7KtrYOoVabLil5Yz8=@vger.kernel.org
X-Gm-Message-State: AFuF++lXGlsIrdK6L7Re7m4F3/H+FZUwOLk/UKzzW3qSlioDC2LUlBca
	EOGCpJSBwmIO4D4gauEKfRsd/gp71w9YOQds67hIhDEKTuM6UdysQJkaMgMJDDv0Hc40rOqJNQA
	xcaBbZhKQZNS3R5tCjb+xowaCqWEIjz4=
X-Gm-Gg: AYBFou07VKH4i3IuQ+jl1rxlfHwXtuHWq1r8+P6Fs0f34wjXlGIzKb85naHuo6ijWS8
	fKMcYSjsHWW22WOrYMEWn1xa1J38fjF4LaussPKWRmpEg1IO/KihF381jHH+Pm5DR/EP59JBTx/
	B7O3ExaGXe4nNtA9p/7ufHRyC1MFdOjvtgYvHsham8FaEuk1wmoPGT1MoUY8tTNwsZueR5K2u/a
	lJ/U8m9MXnJchJKc8faDDJHVAtB3vDngfbnx9KkOgtqPHK95xH+YZ8LDJIfViWXYIAC4vzPuqlZ
	annGAJLOUaL+ptu8ahemYmPkInnlK/ZCqbc66vv7ZFhAXp4KdcmXMowKYMpvKSLSSLR23Jad+4v
	NMIwgwe9KSewp
X-Received: by 2002:a17:907:6d1f:b0:c24:908b:4e2e with SMTP id
 a640c23a62f3a-c2e4adb6f57mr571051766b.4.1791056781598; Sat, 03 Oct 2026
 12:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927074520.3694663-1-nicoyip.dev@gmail.com> <179072912501.434549.7831981029772644673@kernel.org>
In-Reply-To: <179072912501.434549.7831981029772644673@kernel.org>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Sun, 4 Oct 2026 03:46:10 +0800
X-Gm-Features: AclHuK_L2GLX9bAEDsQkTzc7iq6mfzr6SnUv5Tc6X-n5RJVXG2AqpX2JSIzLkgw
Message-ID: <CAAo+4rUezKDNgd8Fwjs7_YaBCBS-Kj26wZRzDcF+6nNkpYNxDQ@mail.gmail.com>
Subject: Re: [PATCH net] net/smc: serialize link group free work scheduling
To: netdev-bot+sashiko@kernel.org
Cc: alibuda@linux.alibaba.com, dust.li@linux.alibaba.com, 
	sidraya@linux.ibm.com, mjambigi@linux.ibm.com, tonylu@linux.alibaba.com, 
	guwen@linux.alibaba.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kgraul@linux.ibm.com, 
	ubraun@linux.ibm.com, linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 8:45=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 (1) =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix is incomplete.
> - [Medium] The patch treats lgr_lock as the lock for lgr->freeing (the
>   new comment reads 'protects lgr->freeing').
>
> Pre-existing issues:
> - [High] Separately from the pending-timer rearm this patch fixes, a
>   free_work callback that has already started can race with lgr teardown=
=E2=80=A6
>
> --
>
> net/smc: serialize link group free work scheduling
>
> This patch takes the link group list lock in smc_lgr_schedule_free_work()
> around the lgr->freeing check and the mod_delayed_work() call. The goal i=
s
> to stop a concurrent smc_lgr_free_work() from setting freeing and cancell=
ing
> the work between the check and the rearm, which would leave a timer pendi=
ng
> on a freed link group.
>
> > diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
> > index 9974149659c2f..8feb486ada562 100644
> > --- a/net/smc/smc_core.c
> > +++ b/net/smc/smc_core.c
> > @@ -80,6 +80,10 @@ static void smc_ibdev_cnt_dec(struct smc_link *lnk)
> >
> >  static void smc_lgr_schedule_free_work(struct smc_link_group *lgr)
> >  {
> > +     spinlock_t *lgr_lock; /* protects lgr->freeing */
>
> [Severity: Medium]
> Is lgr_lock enough to protect lgr->freeing? freeing is a 1-bit bitfield,
> and it shares a u8 with sync_err and terminating:
>
> net/smc/smc_core.h:struct smc_link_group {
>         ...
>         u8                      sync_err : 1;   /* lgr no longer fits to =
peer */
>         u8                      terminating : 1;/* lgr is terminating */
>         u8                      freeing : 1;    /* lgr is being freed */
>         ...
> }
>
> Both neighbouring bits are written without lgr_lock. One example is
> smc_clc_wait_msg():
>
>         smc->conn.lgr->sync_err =3D 1;
>         smc_lgr_terminate_sched(smc->conn.lgr);
>
> Another is __smc_lgr_terminate():
>
>         lgr->terminating =3D 1;
>
> Each of these stores is a read-modify-write of the whole byte.
> smc_smcd_terminate() and smc_lgr_free_work() set freeing =3D 1 under
> lgr_lock. Can a concurrent sync_err or terminating store write back a sta=
le
> byte and lose that freeing =3D 1?
>
> In the sync_err case, smc_lgr_terminate_sched() then returns early becaus=
e
> the lgr is already unlinked, so freeing is never set again.
>
> Consider a later smc_conn_free() that passed its unlocked list_empty()
> check before the unlink. Once __smc_lgr_terminate() has cancelled
> free_work, that call could reach smc_lgr_schedule_free_work() with
> conns_num =3D=3D 0. It would read freeing =3D=3D 0 under the new lock and=
 rearm the
> timer on an lgr that is about to be freed.
>
> Would it work better to give freeing its own storage (for example a bool)=
,
> or to make every writer of that byte hold lgr_lock?
>
> > +
> > +     smc_lgr_list_head(lgr, &lgr_lock);
> > +     spin_lock_bh(lgr_lock);
> >       /* client link group creation always follows the server link grou=
p
> >        * creation. For client use a somewhat higher removal delay time,
> >        * otherwise there is a risk of out-of-sync link groups.
> > @@ -90,6 +94,7 @@ static void smc_lgr_schedule_free_work(struct smc_lin=
k_group *lgr)
> >                                               SMC_LGR_FREE_DELAY_CLNT :
> >                                               SMC_LGR_FREE_DELAY_SERV);
> >       }
> > +     spin_unlock_bh(lgr_lock);
> >  }
>
> [Severity: High]
> Does this fully close the rearm race? The commit message says a rearm
> "either precedes the freeing transition and is caught by the subsequent
> cancellation, or sees freeing set and is skipped". That only holds if eve=
ry
> teardown path sets lgr->freeing under lgr_lock before it cancels free_wor=
k.
>
> smc_lgr_cleanup_early() unlinks the lgr under lgr_lock but never sets
> freeing:
>
> net/smc/smc_core.c:smc_lgr_cleanup_early() {
>         ...
>         spin_lock_bh(lgr_lock);
>         /* do not use this link group for new connections */
>         if (!list_empty(&lgr->list))
>                 list_del_init(&lgr->list);
>         spin_unlock_bh(lgr_lock);
>         __smc_lgr_terminate(lgr, true);
> }
>
> __smc_lgr_terminate() then cancels only once, outside the lock. It sets
> terminating, not freeing:
>
> net/smc/smc_core.c:__smc_lgr_terminate() {
>         if (lgr->terminating)
>                 return; /* lgr already terminating */
>         /* cancel free_work sync, will terminate when lgr->freeing is set=
 */
>         cancel_delayed_work(&lgr->free_work);
>         lgr->terminating =3D 1;
>         ...
>         smc_lgr_cleanup(lgr);
>         smc_lgr_free(lgr);
> }
>
> On an SMC-D server, smc_listen_work() drops smc_server_lgr_pending after
> it sends the ACCEPT. A second connection (conn2) from the same peer can
> then join the first-contact lgr.
>
> If the first connection then fails (no CONFIRM, or a DECLINE), teardown
> goes through:
>
> smc_listen_work()->smc_listen_decline()->smc_conn_abort()->
>     smc_lgr_cleanup_early()->__smc_lgr_terminate()
>
> Meanwhile conn2 can be freed on another CPU:
>
> CPU0 (conn1 abort)                CPU1 (smc_conn_free(conn2))
>                                   !list_empty(&lgr->list) is true
>                                   smc_lgr_unregister_conn(conn2)
> smc_lgr_cleanup_early()
>   list_del_init(&lgr->list)
>   __smc_lgr_terminate()
>     cancel_delayed_work()
>     lgr->terminating =3D 1
>                                   lgr->conns_num =3D=3D 0
>                                   smc_lgr_schedule_free_work()
>                                     spin_lock_bh(lgr_lock)
>                                     lgr->freeing =3D=3D 0
>                                     mod_delayed_work()
>     smc_lgr_free()
>                                   smc_lgr_put() drops last reference
>
> This would leave free_work's timer pending on a kfree'd lgr, which is the
> same __run_timers use-after-free as in the KASAN report.
>
> Should smc_lgr_cleanup_early() set lgr->freeing under lgr_lock? Or should
> smc_lgr_schedule_free_work() also skip the rearm when the lgr is unlinked
> or terminating?
>
> [Severity: High]
> This is a pre-existing issue and was not introduced by this patch. Can a
> smc_lgr_free_work() callback that has already started running race with
> lgr teardown?
>
> smc_lgr_free_work() holds no reference on the lgr and dereferences it
> straight away:
>
> net/smc/smc_core.c:smc_lgr_free_work() {
>         ...
>         smc_lgr_list_head(lgr, &lgr_lock);
>         spin_lock_bh(lgr_lock);
>         if (lgr->freeing) {
>         ...
> }
>
> Suppose the idle timer fires and the worker starts, but is delayed before
> this point (by preemption, or on PREEMPT_RT). A teardown can then set
> freeing and reach __smc_lgr_terminate(). Examples are smc_smcd_terminate(=
)
> from an ISM peer shutdown event in smcd_handle_sw_event(),
> smc_lgr_terminate_sched(), and smc_smcd_terminate_all() or
> smc_smcr_terminate_all(). The only cancellation there is:
>
>         cancel_delayed_work(&lgr->free_work);
>
> That call neither cancels nor waits for a callback that is already
> running.
>
> With no connections left, smc_lgr_free() destroys lgr->tx_wq. free_work i=
s
> on system_percpu_wq, so this does not drain it. smc_lgr_put() then calls
> __smc_lgr_free(), which frees the lgr.
>
> When the worker resumes, it takes spin_lock_bh() on a lock pointer loaded
> from freed memory. If the stale freeing bit reads 0, it also calls
> list_del_init() and smc_lgr_free() a second time.
>
> Should teardown use cancel_delayed_work_sync() where the context allows,
> or should the queued work hold its own lgr reference?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260927074520.3694663-1-nicoyip.dev%40gmail.com

v2 (in a patch series 1/2, fixed together with another issue net/smc:
Serialize early link group cleanup with termination) has just been
sent to address the issues reported by sashiko.
https://lore.kernel.org/netdev/179105277608.1402591.16173087244761956438@ke=
rnel.org/T/#m30bd40e302bc951b76e8507324f6457502e4512c.

Best regards,
Chengfeng
