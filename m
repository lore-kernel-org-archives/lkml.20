Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794176801;
	b=mMMbow7l2FCDszEz95xuf+Z+NfiVKB/j0DL3ZRtvfZb0DNMdV8DJqqbknRN7M8uMm87u
	 ZTVT+9vjA/pKZmldYn8b/pSO4rAU2R0irbojPJV71woyWU4lLG7NXx8FA7QS+0ljOxFc4
	 1IJoPKwaCE+oeHz3Jx43/XJWc9j5Is0KxsLv2xfgsIy3ps0zClPVYa7yRBB0oIbMQ/C7B
	 m2hYzo5Fm3e4yaUsOwhmJci9HhWKUdsbBsVeLxq95BoYi2W4nKFsC9d842IEw+47RfCNf
	 jplMbh2Jr5yuOzej1DqKd9zCdcBnTLs9cYNNEzPElTQdgq50o/9B7mlPeUOcLb3/AKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794176801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VE+63/5S1dGMKKpaNJJmZOgCWbbEa3XkXO0EUSmDMwQ=;
	b=JXZtKT39XWaamZd91Q6HMPwhnhJWCKgN7CWDOh9qBlmtA0lpD7jIzp+qGjWHzbTUyjOh
	 59kC6PXHBDKU6Sk2vFKBvE/gcw+rxCi6Y6N5gS8KLCIIMGbbaeKQbrLzX9zXIrwapHmJQ
	 T7JBWCTRnY++asA04wFikHU1ayXHQwxxphpYhh/7dBsvYk4/J9T//Lx4dl+nuJniUckVp
	 kUN21o2CNbaOyL9HnfIDJS2MNsLP19snkjtN8QARISEhtL1HfMPbic2agOSIfErG41Ys5
	 xv9lhYUomMkNqKn48/TnzwS14bMKfJ3dpbLykdeMpRtOVRhAW/NadzCClFSHcsaYh0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m2sxuaQy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EC8606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m2sxuaQy
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so531000eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:26:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794176800; cv=none;
        d=google.com; s=arc-20260327;
        b=HpDKlfvNp7NUE+0P4tp9yIL1ArD9zLhS9DlEACJrg5Pzx5Vf2pMBbzIlzM9TeNBJB5
         hNlPq2BwMT5X0nidUUXG9pExmw63JqUBD6l8y1l3ggMgMG37L3U6s1ifOPWO0sy1KyNn
         Cv8q/XGbIPxLNhL0qoi9GUWMcg42gWNQM1BZPHzYsUmR44gY2a1eYSnoYzWBlvoY1OMK
         3rYAtH91z6Yl1bMZhBBpfplFvVi6u+6sDXcPAR+hW07q9PBtDhkA9eKzh1sF251VuJun
         yvWAHVhIDvEYgXfpOweSaIsGw7JRIpWYZOCzX2Cb11CZI5TTx89/vUwL4XI64jprd7zt
         XZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VE+63/5S1dGMKKpaNJJmZOgCWbbEa3XkXO0EUSmDMwQ=;
        fh=pQ0QfjdkyZAIW28HRzGQry3kW6Osq07B9rGvio4+VvI=;
        b=EZ/4NGDFOFV5Fc9cw7+NzmCmdpuebdavTXEZWKQcNsOL29RmYNKWRjBLrHXiBcfMhi
         FiTfYqIo74JMKF8AkdfzZfDOXZzkm55LZPGg/3/h1fDPIz/CS9cxRVPX9PRq0+oSsp2q
         iOqGke2nuqd7TiF8z0/JrDA/r2zpB8q0zG7DfTT4PCeraRohN0qt8FzSjz9niNnLl6QG
         U1//VhEVNFHHX9NPYLimSfYPq0XVLCNU/lMMHlvI/qz6Oow8CU3mLGyg5hTydcZ7tBwl
         IHlCDCCLzBNMQ9OhwM0bdBzqpGKsbtI7so8LDHUJr+idytlD/HpIH4nl/51uz1o6cHIY
         dg2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794176800; x=1794781600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VE+63/5S1dGMKKpaNJJmZOgCWbbEa3XkXO0EUSmDMwQ=;
        b=m2sxuaQybH6P44YJ4ev4tpnAwA4jHFbnX9oMNj5668OgWBc3gGAq1vzri4q7p2Xj4Q
         ecQNwxmEj+hrSUoceI/4kchQ2LBNBUl4kNO91z9H5WGQN7cvyNWyA9JoTzNXj5x+6fXd
         e34jIBsW6Oab2k2elVh5SaUtdCiCPXaDbGld3M9wcni34a9cLEac7vbil4djAFm1MfdG
         yZUAJkE2IKgmVlSv7G70VtL6QdkP+yuw2Qom2ShCS67qmdBcwQEBLt81cbqCgkMcz18J
         KdhUZ8RC6jurbCj2fSFKYBlLL8cEycFokR1r3IsU4iYevYkBXpN5FrgPcF+u4EoluDj1
         EwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794176800; x=1794781600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VE+63/5S1dGMKKpaNJJmZOgCWbbEa3XkXO0EUSmDMwQ=;
        b=YGT7dmittoApwbYOcj7S9i5w8plvYhrYPpbLYtXd7ULSIA5B29xYeN7KRhbnBlxaur
         E7zwmjGgVo+xFmlhsiNZ4hSE6ezWaGvWwAyxkDNp43OKOVbP94w7riO6pKTZ8SePQaTp
         Q0P+gKh29XdESPx0grdERA2RCbeJt2ftZfduYZHyiN2sUAYhKXJboDFrIm73pNgXMza1
         eSnifCA5NJNErNIlogi/A1VV9dl5a+Jx100Bb7aaRrpkQass4zCrRE8iHjvzHOWyHgAc
         GW7nrp9qeIcyH1bZVEePpFadTwEZLltPdE3W3zwodvwgIteXuIKlm7dazPHfx8PApRun
         OM+Q==
X-Forwarded-Encrypted: i=1; AL+hErG2PU08VZHTwiAt4agMNcMCKNCkhfntg8VY7usRN34M5QLj/GIZ+0a4ZJ5tYVgQ2FjCuaI1SD+Plu/PflI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pa/dVLVts+2arE5ofLIAkRheVbRxPkxdvdcwBQ5wPUaAWrnAr
	w7jEs1hPVjuLgtiznmieIzZhkZ64Hqy2QKj6GD5GgKJ582CMIWxlwvlolFmVucgoPCvpZ0YCmdj
	+TItPoQIOE9Y/GMPL3gjzPXAr421YZDRfPfYTlmxJ
X-Gm-Gg: AYBFou2Ef1NKZnDHbGKXRYgcdzJJUKl1OKMfol4YHRi9D/jxjPMygiTWw+J45sCDOQh
	xWEzUrHCmk95IQnLaboZfvaw/GzR4LOegL9hjHwuqeWmqFqerB22BW4ehK7lisd7rMThrGVOkAQ
	B07zuNWpEqzCDRxbxjr84VGbP6TkBqjeomT92aYjwH7Hz2oArdWh54yIjdsi5dVdDcEDHpV8TUn
	WBF0nmxGJRtFVZDZHTpDtjV1Ea2KkbOXaXJHph0y8M5y6p3r1qe82GS7AgYrwVF8Tj/cFrPyy3u
	vX4Q6w1jrDyAZrHOvfAEwErbHWt9v8ZW4SQ2cDtAdaassWmzE+7NiPt7LD0BWrpjrC4dcZOSx7G
	XzgfjrOsz+HD0nguDbpvisLQK3sMcvkcvvVxeQMljvb1+ZnIwG88Uf/cB+re5LGzhjzv/urLoGf
	aR7qGVTwSufoCAC10l
X-Received: by 2002:a05:693c:87d5:10b0:36e:a9ce:f1a with SMTP id
 5a478bee46e88-372542bec14mr4545729eec.4.1794176798825; Sun, 08 Nov 2026
 14:26:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104045534.79783-1-bcochrane@google.com> <179411441563.994134.1253063049402486704@kernel.org>
In-Reply-To: <179411441563.994134.1253063049402486704@kernel.org>
From: Bryan Cochrane <bcochrane@google.com>
Date: Sun, 8 Nov 2026 14:26:27 -0800
X-Gm-Features: AclHuK_yThPQKjLu1cOv83kTvnqvD4g9kOuUo9qLmgKEyzNSc34jvrTH9xVW-DY
Message-ID: <CALuKKxH-q4hb-Orc4MwwKE+bf5AcjOzW8k0JRpjLTPYOzjVA8A@mail.gmail.com>
Subject: Re: [PATCH net v3] bnxt_en: Take RTNL before netif_close() when
 aborting FW reset
To: netdev-bot+sashiko@kernel.org
Cc: michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, sdf@fomichev.me, 
	joe@dama.to, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: [PATCH net v3] bnxt_en: Take RTNL before netif_close()
when aborting FW reset

On Sun, Nov 8, 2026 at 5:06 AM <netdev-bot+sashiko@kernel.org> wrote:
> - [High] Permanent hang while holding RTNL and the netdev instance lock.
> - [Medium] The patch defers the bnxt_get_registered_vfs() failure in
>   bnxt_fw_reset() to bnxt_fw_reset_task().
> - [Medium] The patch turns a synchronous abort into an asynchronous
>   request carried only in bp->fw_reset_state.

Thanks, all three findings are valid consequences of deferring the
bnxt_get_registered_vfs() failure in bnxt_fw_reset() to
bnxt_fw_reset_task() in v3:

1. [High] When bnxt_fw_reset() is entered from devlink process context
   via bnxt_fw_recover(), bnxt_unlock_sp() still sets
   BNXT_STATE_IN_SP_TASK with no sp_task running to clear it, so the
   deferred netif_close() in bnxt_fw_reset_task() hangs in
   __bnxt_close_nic() waiting on bnxt_drv_busy().

2. [Medium] Deferring the close via bp->fw_reset_state =3D
   BNXT_FW_RESET_STATE_ABORT lets a concurrent bnxt_close() ->
   bnxt_hwrm_if_change() zero bp->fw_reset_state before
   bnxt_fw_reset_task() runs, leaving BNXT_STATE_IN_FW_RESET stuck set.

3. [Medium] Routing that pre-reset func_qcfg failure through
   bnxt_fw_reset_abort() with fw_reset_state !=3D BNXT_FW_RESET_STATE_POLL_=
VF
   unintentionally marks the firmware reporter SEVERITY_FATAL via
   bnxt_dl_health_fw_status_update(bp, false).

For v4 I will go back to the synchronous close in bnxt_fw_reset() from
v2 (using netdev_unlock() + bnxt_rtnl_lock_sp() as Michael suggested on
v2), which avoids both Medium issues, and guard the
BNXT_STATE_IN_SP_TASK bit operations in bnxt_[rtnl_]lock_sp() and
bnxt_[rtnl_]unlock_sp() with current_work() =3D=3D &bp->sp_task so non-sp_t=
ask
callers (bnxt_fw_recover()) do not touch BNXT_STATE_IN_SP_TASK.

pw-bot: cr

On Sat, 7 Nov 2026 at 21:06, <netdev-bot+sashiko@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Permanent hang while holding RTNL and the netdev instance lock.
> - [Medium] The patch defers the bnxt_get_registered_vfs() failure in
>   bnxt_fw_reset() to bnxt_fw_reset_task().
> - [Medium] The patch turns a synchronous abort into an asynchronous
>   request carried only in bp->fw_reset_state.
>
> --
>
> bnxt_en: Take RTNL before netif_close() when aborting FW reset
>
> This patch takes RTNL around bnxt_fw_reset_abort() in bnxt_fw_reset_task(=
)
> and sends the POLL_VF ABORT_ERR case through that same path. It also
> changes the bnxt_get_registered_vfs() failure path in bnxt_fw_reset(): th=
at
> path now sets fw_reset_state to BNXT_FW_RESET_STATE_ABORT and leaves the
> netif_close() to bnxt_fw_reset_task().
>
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/et=
hernet/broadcom/bnxt/bnxt.c
> > index 33c4cacc8ffe3..f48e67670ccfb 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -14860,8 +14860,8 @@ void bnxt_fw_reset(struct bnxt *bp)
> >               if (n < 0) {
> >                       netdev_err(bp->dev, "Firmware reset aborted, rc =
=3D %d\n",
> >                                  n);
> > -                     clear_bit(BNXT_STATE_IN_FW_RESET, &bp->state);
> > -                     netif_close(bp->dev);
> > +                     bp->fw_reset_state =3D BNXT_FW_RESET_STATE_ABORT;
> > +                     bnxt_queue_fw_reset_work(bp, 0);
> >                       goto fw_reset_exit;
>
> [Severity: High]
> Can this hang forever, holding rtnl_mutex and the instance lock, when
> bnxt_fw_reset() is entered from devlink health recover?
>
> bnxt_fw_recover() runs in devlink netlink process context, not from
> bnxt_sp_task(). With BNXT_STATE_FW_NON_FATAL_COND set, the path is:
>
> bnxt_fw_recover()
>   __bnxt_fw_recover()
>     bnxt_fw_reset()
>       bnxt_lock_sp()              /* clears BNXT_STATE_IN_SP_TASK */
>       bnxt_get_registered_vfs()   /* returns < 0 */
>       bnxt_queue_fw_reset_work(bp, 0)
>       bnxt_unlock_sp()            /* set_bit(BNXT_STATE_IN_SP_TASK) */
>
> No sp_task is running, so nothing clears BNXT_STATE_IN_SP_TASK after this=
.
>
> fw_reset_task then runs on bnxt_pf_wq:
>
> bnxt_fw_reset_task()
>   rtnl_lock(); netdev_lock(bp->dev);
>   bnxt_fw_reset_abort()
>     netif_close()
>       bnxt_close()
>         bnxt_close_nic()
>           __bnxt_close_nic()
>             while (bnxt_drv_busy(bp))
>                 msleep(20);
>
> bnxt_drv_busy() checks BNXT_STATE_IN_SP_TASK, and this loop has no
> timeout. For a PF, bnxt_sp_task() goes on the same ordered bnxt_pf_wq, so
> it can't run behind the blocked fw_reset_task and clear the bit.
>
> A second devlink health recover can't break the loop either.
> bnxt_fw_reset_abort() has already set SEVERITY_FATAL before calling
> netif_close(), so bnxt_fw_recover() returns -ENODEV.
>
> Before this patch, the same branch called netif_close() inline. At that
> point bnxt_lock_sp() had cleared BNXT_STATE_IN_SP_TASK, so the busy loop
> exited.
>
> The commit message says that dropping the lock would let "a concurrent
> devlink health recover enter bnxt_fw_reset() and set BNXT_STATE_IN_SP_TAS=
K
> through bnxt_unlock_sp(), which the subsequent close would then wait on
> forever".
>
> Can the same hang still happen when the devlink health recover caller is
> itself the bnxt_fw_reset() call that defers the close?
>
> [Severity: Medium]
> Is the deferred abort safe against a concurrent bnxt_close()?
>
> After this change, bnxt_fw_reset() drops the instance lock while the
> netdev is still open and BNXT_STATE_IN_FW_RESET is set. The pending abort
> is recorded only in bp->fw_reset_state.
>
> bnxt_hwrm_if_change(), called from bnxt_close(), always reads and resets
> that state:
>
> bnxt_hwrm_if_change() {
>     ...
>         fw_reset =3D (bp->fw_reset_state =3D=3D BNXT_FW_RESET_STATE_ABORT=
);
>         bp->fw_reset_state =3D 0;
>     ...
> }
>
> A user close (ip link set down) can run before fw_reset_task reads
> fw_reset_state. For example, work for other PFs may be queued ahead of it
> on the single-threaded bnxt_pf_wq. The close path then sets
> BNXT_STATE_ABORT_ERR and resets fw_reset_state to 0.
>
> When bnxt_fw_reset_task() runs, it sees BNXT_STATE_IN_FW_RESET set and
> fw_reset_state =3D=3D 0. No case in the switch matches, and there is no
> default, so it returns. bnxt_fw_reset_abort() never runs, and
> BNXT_STATE_IN_FW_RESET is never cleared.
>
> After that, bnxt_open() -> bnxt_reinit_after_abort() fails with:
>
>         if (test_bit(BNXT_STATE_IN_FW_RESET, &bp->state))
>                 return -EBUSY;
>
> As a result, the port can't be opened, and later firmware resets and
> health checks skip it. The stopped ULP is also never restarted, until the
> driver is reloaded.
>
> The other in-progress reset states such as POLL_VF have a similar
> exposure. This path, however, used to be fully synchronous.
>
> >               } else if (n > 0) {
>
> [ ... ]
>
> > @@ -15524,6 +15524,8 @@ static void bnxt_fw_reset_task(struct work_stru=
ct *work)
> >       }
> >
> >       switch (bp->fw_reset_state) {
> > +     case BNXT_FW_RESET_STATE_ABORT:
> > +             goto fw_reset_abort;
>
> [Severity: Medium]
> With bnxt_fw_reset() now setting fw_reset_state to
> BNXT_FW_RESET_STATE_ABORT before this runs, will bnxt_fw_reset_abort()
> report a fatal firmware error for a func_qcfg failure?
>
> bnxt_fw_reset_abort() {
>         clear_bit(BNXT_STATE_IN_FW_RESET, &bp->state);
>         if (bp->fw_reset_state !=3D BNXT_FW_RESET_STATE_POLL_VF)
>                 bnxt_dl_health_fw_status_update(bp, false);
>     ...
> }
>
> The POLL_VF exemption no longer applies on this path. As a result,
> bnxt_dl_health_fw_status_update(bp, false) sets SEVERITY_FATAL and
> REMEDY_POWER_CYCLE_DEVICE, and moves the devlink fw reporter to
> DEVLINK_HEALTH_REPORTER_STATE_ERROR.
>
> This is the same kind of failure as the POLL_VF n < 0 abort in
> bnxt_fw_reset_task(): a bnxt_hwrm_func_qcfg() failure before any reset
> step has run. That path skips the health update, and so did the old
> inline abort in bnxt_fw_reset().
>
> Once severity is SEVERITY_FATAL, bnxt_fw_recover() refuses manual
> recovery until a new firmware event resets the severity:
>
>         if (bp->fw_health->severity =3D=3D SEVERITY_FATAL)
>                 return -ENODEV;
>
> There is also a secondary effect. bnxt_dl_health_fw_status_update() calls
> devlink_health_reporter_state_update(fw_health->fw_reporter, state)
> without checking fw_reporter for NULL.
>
> __bnxt_dl_reporter_create() can leave fw_reporter NULL, and
> __bnxt_fw_recover() can still reach bnxt_fw_reset() in that case. The
> other abort paths already carry this NULL dereference risk, and this
> patch adds another way to reach it.
>
> The commit message doesn't mention this behavior change. Was it intended?
>
> >       case BNXT_FW_RESET_STATE_POLL_VF: {
> >               int n =3D bnxt_get_registered_vfs(bp);
> >               int tmo;
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261104045534.79783-1-bcochrane%40google.com
