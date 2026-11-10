Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285494;
	b=US6dH+HXRCR2FZGlVzYOLAAngH9QMMzwC2VqvhA8tPNCdJG5v3cGQ0SufRBnawW94QWm
	 nnyTOOHVWzyIG3/Gd7mpiCmPuC+u9c4/o9D5+SY/TJVBf4JNBeMuQDPMF6SFNpl5YUW6W
	 nm0SvetQPH1z9VmO9zXhTqlViKuxeTH5ZDTCvpZNX4O+aJasdAe/DmIrM26XzHMOiZEaw
	 tAohVOlLS0KYnXNxDUyzaCETAzZ8GddBIdJgtPzjzq2pJeFXiEyclrBKDSZXitpjO6oQg
	 WHaiTrvLultiNoJUwkP92B5d2OfECDRd/g+pJm5PDfpmAuh0xRhwoyGv3d4r6JTouyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aMoGyzxQDNxoR3vnhnVQh4w6G5DIvEj8YzOLFLQTrdw=;
	b=2umwCtm1kzrFMO71XRtycZoKoH9qOylnplOKK0F/Jm84K2S/9KZYZzNqDyybkWrFRVqs
	 Tgacb8dg897bQvZ2M4YgqQpVbnbnL2MXA4f3tyRAu1gQUisr53CaRTa4Xye5DXLbe0v4G
	 nPUnq+rQWplR4d/hZr6fpi7HV9CglWdjPXIuih7fG7xZ30Ig6RnJUGm/Letliqfjs6E25
	 z8Hshd65KaUWrQ1Es8pmouVf8w0MIG6OxQU113DQPh8tqoGyqhjwY4cQPsuBIyb3niE1N
	 eMai80sh9So6k1DMoy1W8hujCjGvLABncm+t3YeOv+kTy/mVqH6zxAXGgizFWpZfzDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a5rn7jLi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0552606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0552606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a5rn7jLi
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3720addb068so2745515eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794285493; cv=none;
        d=google.com; s=arc-20260327;
        b=LLqSPwHTePIeW8f8GnGRmokriKTrfXa2ukTqssTQjhe7atgg4uD0mBH3Dc+s4dOiXA
         ytYQuyoUdXUum01HtQAdpwEsjLPHWYJhtn1685Tjjyan2IwYtVibDLa9zAuYVtKdi2kN
         moYliuEiec20hKKWZpBL1X9WmOfOAdLrrYZGrQ6Su3lhkpaFF7x7CtvNsnxmBZQrAR0v
         8Fy8ArKexVrbEzCuiDjL9ZogGCgab7BzDz+lbDxGFWnL2eWPrThK1CFjr11atdIBFhin
         ng/qjyWJEvfLS7RJfA79l1Xpzu572j7/1KI5ccfv8rT0Ptd8ZB/LSwh6QiOr5LptNb0I
         xhgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aMoGyzxQDNxoR3vnhnVQh4w6G5DIvEj8YzOLFLQTrdw=;
        fh=FRzrltjq089qiV+qjltNuS7Jt7rqden6MnQPKfpUxyg=;
        b=kUOYCywvwTSjszMAnFUy7udxiE25RD+UaNZddD2tNorU8IYhSH7Z0d7p3YQlGv8TJ8
         8KugNTXpCs5nFnKMNqTa7qxCRXIfR55XVSIWudKGSazpdZ7UfPRq6VnCDSIVQZV3HP0A
         XVCGcGGPv+GDaTHk+Fu9MdUTw1wB0NoJBTAuqcLLadcLIXgRIVEoBF6N8gawth9Cve17
         C2v7uhNAMBcCe02H6G6MobPprol70iWkU3x6iqq3raGM4qAN+WHOX3UoifadOitVQzwA
         jUW5Ickbd8anXbJcgCp/v4PcXfETtzOOq9EuJ1NMF2eJtjnRFScKFUJT7/6yEmRQBD67
         RzMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794285493; x=1794890293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aMoGyzxQDNxoR3vnhnVQh4w6G5DIvEj8YzOLFLQTrdw=;
        b=a5rn7jLinA75P4FiQck8v74e62/Wk+RwRUDI6YGuOEhngJ6+JURDjRmjbB2Y1kONRD
         IHknvBwWH4d+zqekHUwT8mFTHqvproC0pIdH6/QarJA55rcuH/Dug8XPLWbBIZsG16kW
         SC3aAM/CbR2n+HP9RBraRiEm1/lVe/iVadSOdHoo12BpQBfyM8Henu4QVDX2WHfuOBQA
         +1L8Owj2RPMyomCJLzKm/n8V7YTfXrOV9ADB8EBlLTTyOb0zhuP3U1oXo6ZzDAAMqvGP
         qgmYvRME/kmNIXBPpaF+xHIWaq/bkkSgjnJ4853DMiMLReHBN0dfCVBvmxWHszDekMci
         5tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285493; x=1794890293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMoGyzxQDNxoR3vnhnVQh4w6G5DIvEj8YzOLFLQTrdw=;
        b=mGVrhYO8tp7DioOq56bL8C+KMPaQreSLlnjL3rh08M4sX2vfkCoq/T4Ni2pEExRaTS
         PovWk/0U8wC6fYpTKgi1ujMuQaiRqd/DJTisc36d/i30u7uodWbC66CvJVaUjSb7eD1m
         S14X3StCnYsfvdKZ6Y4gFgdO2EN97ZDwLaIcQWx/iq2fNlL68SBw94/i0qP/t/o4kKQ1
         axNdB8ypriXya8z1ylErmQ+fxlUq1c4HdzhNf8wMx340BoWXOEMxM2BMJTGJczzKHNIa
         8VihmS5YxA7zSUEJdMZ/4vomXZZAjNX8ejP8TmXWbAt8phToMU20d+jqf1V2jmUS0TZP
         L29A==
X-Forwarded-Encrypted: i=1; AL+hErESfP4kk7+othQh5GaarG7JA8E1rbDhprIpKEzn4b1tYvmDhS+g5NYyi1GNBso+8MjDujHMfvwrOHlhJcs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j6Mb8xw4O300LjXeXkMivDPIVI6jr2rMTr27mSBLSKqZ8R5xX
	Y8hSE7sLyOtRG1E2LvGT6AkoW36datk6rRMj4LBz2+CzhvSIOQ89eIJrlhp1V4meSEhnDo5R/p3
	ecnZt7RZ1WtoJ6Hukx0VzD5cq+Qn8Zz8vDnNUPSmr
X-Gm-Gg: AYBFou3NgwEH94dqCT26aKDaMPx+uuWq6dmTAy244bWM/r2l10yO+0Qc4AEuNJPwOTx
	edL6oCY7AvzMu54xkhf46sTL/nZO42ct55zt7CnT4NlSHe22bRiXBju5NbMZYIC+gsubzC/sa0V
	atc0dy+95EvDMw1hmMiumv5y5i86i1iTLlBCEbllsUys/cl84BRZZAa4Hdk4c7n8DHtwsKxsMUG
	Y7AwSQVKO2Mnslc3JCCTTu09HwOZvlfz/l6QDYBZ9wvfgpCOu91q6FLIKddO9AGPpvtzR352qRD
	tGc5creHHWdLO32nOtkYvDGXRSd4pUJyHLaOEApKtGzTH9tdF7uJrwIEYP33nBzLkF0fgcWSDrP
	dsKi0x3TvIEXB/0kwROyyGreG+QQ9m+YjBHzQnPyUFtOXk9Bo5Xcub9Dj+H1x4kO4FecHBjg=
X-Received: by 2002:a05:7301:1704:b0:34e:9923:e372 with SMTP id
 5a478bee46e88-37520d040e2mr2052899eec.29.1794285492127; Mon, 09 Nov 2026
 20:38:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108222942.1233295-1-bcochrane@google.com> <179426648001.994134.4996838291599710549@kernel.org>
In-Reply-To: <179426648001.994134.4996838291599710549@kernel.org>
From: Bryan Cochrane <bcochrane@google.com>
Date: Mon, 9 Nov 2026 20:37:59 -0800
X-Gm-Features: AclHuK_9HpQUol8PJg9bejJof_47-bIJWnekmqm2Llf5Zh3qgAVATW39KBmnssY
Message-ID: <CALuKKxFtk6CQ4Rr9FzkgnDOZpJU=8KP_XTsV-+pCaDhq-EuBGw@mail.gmail.com>
Subject: Re: [PATCH net v4] bnxt_en: Take RTNL before netif_close() when
 aborting FW reset
To: netdev-bot+sashiko@kernel.org
Cc: michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, sdf@fomichev.me, 
	joe@dama.to, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: [PATCH net v4] bnxt_en: Take RTNL before netif_close()
when aborting FW reset

On Mon, Nov 9, 2026 <netdev-bot+sashiko@kernel.org> wrote:
> - [High] The patch adds a bnxt_in_sp_task() guard to
>   bnxt_lock_sp()/bnxt_rtnl_lock_sp().
> - [Medium] bnxt_en: transient BNXT_STATE_IN_FW_RESET exposed in
>   bnxt_fw_reset() unlock window
> - [Low] The commit message understates what the bnxt_in_sp_task() guard
>   fixes, and the Fixes: tag scope does not match it.

Thanks, all three points are valid:

1. [High] Guarding clear_bit(BNXT_STATE_IN_SP_TASK) in
   bnxt_[rtnl_]lock_sp() creates an ABBA deadlock when devlink health
   recover runs with devl_lock held (auto_recover=3Dfalse, auto_dump=3Dtrue=
):
   a concurrent bnxt_sp_task entering bnxt_devlink_health_fw_report() ->
   devlink_health_report() blocks on devl_lock with BNXT_STATE_IN_SP_TASK
   set, while __bnxt_close_nic() in the recover path spins on
   bnxt_drv_busy().

2. [Medium] Dropping netdev_lock(bp->dev) before bnxt_rtnl_lock_sp() on
   the bnxt_get_registered_vfs() < 0 path exposes BNXT_STATE_IN_FW_RESET
   even though no fw_reset_task will run, which can leave
   BNXT_STATE_ABORT_ERR set on a concurrent close/reconfig, cause a
   concurrent bnxt_force_fw_reset() to bail out, or make
   bnxt_io_error_detected() return PCI_ERS_RESULT_DISCONNECT.

   Taking RTNL up front in bnxt_fw_reset() avoids dropping the instance
   lock altogether. Rather than testing bp->pf.active_vfs before locking
   (which could race with bnxt_sriov_configure(), since it drops RTNL
   and netdev_lock before bnxt_cfg_hw_sriov() increments active_vfs), v5
   takes bnxt_rtnl_lock_sp() when BNXT_PF(bp) is true and keeps
   bnxt_lock_sp() on VFs. VFs never reach the netif_close() error path
   and never contend on RTNL during recovery, while PFs already run on
   the single-threaded bnxt_pf_wq.

3. [Low] With RTNL taken up front on PFs in bnxt_fw_reset(), there is no
   unlock/relock window, so v5 drops the bnxt_in_sp_task() change
   entirely and keeps this patch scoped to the 004b5008016a RTNL
   regression. The pre-existing BNXT_STATE_IN_SP_TASK behavior when
   bnxt_fw_recover() calls bnxt_unlock_sp() predates 004b5008016a and
   can be addressed separately.

I will send v5 shortly.

pw-bot: cr

On Mon, 9 Nov 2026 at 15:21, <netdev-bot+sashiko@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The patch adds a bnxt_in_sp_task() guard to
>   bnxt_lock_sp()/bnxt_rtnl_lock_sp().
> - [Medium] bnxt_en: transient BNXT_STATE_IN_FW_RESET exposed in
>   bnxt_fw_reset() unlock window
> - [Low] The commit message understates what the bnxt_in_sp_task() guard
>   fixes, and the Fixes: tag scope does not match it.
>
> --
>
> bnxt_en: Take RTNL before netif_close() when aborting FW reset
>
> This patch takes RTNL before netif_close() in two places: the firmware
> reset abort paths of bnxt_fw_reset_task(), and the
> bnxt_get_registered_vfs() error path of bnxt_fw_reset(). It also adds a
> current_work() =3D=3D &bp->sp_task check around the BNXT_STATE_IN_SP_TASK
> updates in bnxt_[rtnl_]lock_sp() and bnxt_[rtnl_]unlock_sp(), so callers
> running in devlink context leave the bit alone.
>
> > Because bnxt_fw_reset() and bnxt_fw_exception() can also be entered
> > from devlink process context via bnxt_fw_recover(), guard the
> > BNXT_STATE_IN_SP_TASK bit manipulation in bnxt_[rtnl_]lock_sp() and
> > bnxt_[rtnl_]unlock_sp() with current_work() =3D=3D &bp->sp_task. Otherw=
ise
> > a concurrent devlink health recover backing off during the unlock
> > window would set BNXT_STATE_IN_SP_TASK with no sp_task running to clear
> > it, causing the subsequent __bnxt_close_nic() busy-wait to hang.
>
> [Severity: Low]
> Does this paragraph describe everything the guard fixes? Before this
> patch, every devlink health recover went through:
>
> bnxt_fw_recover()->__bnxt_fw_recover()->bnxt_fw_reset()->bnxt_unlock_sp()
>
> bnxt_unlock_sp() did an unconditional set_bit(BNXT_STATE_IN_SP_TASK),
> and no sp_task was left to clear it. No unlock window was needed for
> this.
>
> If the reset was then aborted, the following chain would spin forever
> in the bnxt_drv_busy() loop:
>
> bnxt_fw_reset_abort()->netif_close()->bnxt_close()->__bnxt_close_nic()
>
> Before 004b5008016a, bnxt_rtnl_lock_sp() and bnxt_rtnl_unlock_sp()
> already did the same unconditional clear_bit()/set_bit(). So this hang
> looks older than the commit named in the Fixes: tag.
>
> Could this part be described separately, or split out with its own
> Fixes: tag so that older stable trees get it too?
>
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/et=
hernet/broadcom/bnxt/bnxt.c
> > index 33c4cacc8ffe3..7a2b96f564647 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -14575,35 +14575,44 @@ static void bnxt_timer(struct timer_list *t)
> >       mod_timer(&bp->timer, jiffies + bp->current_interval);
> >  }
> >
> > +static bool bnxt_in_sp_task(struct bnxt *bp)
> > +{
> > +     return current_work() =3D=3D &bp->sp_task;
> > +}
> > +
> >  static void bnxt_lock_sp(struct bnxt *bp)
> >  {
> > -     /* We are called from bnxt_sp_task which has BNXT_STATE_IN_SP_TAS=
K
> > -      * set.  If the device is being closed, bnxt_close() may be holdi=
ng
> > +     /* If we are called from bnxt_sp_task, BNXT_STATE_IN_SP_TASK is s=
et.
> > +      * If the device is being closed, bnxt_close() may be holding
> >        * netdev instance lock and waiting for BNXT_STATE_IN_SP_TASK to =
clear.
> >        * So we must clear BNXT_STATE_IN_SP_TASK before holding netdev
> >        * instance lock.
> >        */
> > -     clear_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
> > +     if (bnxt_in_sp_task(bp))
> > +             clear_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
> >       netdev_lock(bp->dev);
> >  }
>
> [Severity: High]
> Can this guard cause a deadlock between devl_lock and the
> BNXT_STATE_IN_SP_TASK busy-wait in __bnxt_close_nic()?
>
> Before this patch, a devlink-initiated recover always cleared
> BNXT_STATE_IN_SP_TASK in bnxt_lock_sp(), so it never waited on a running
> sp_task. With the guard, a caller in devlink process context leaves the
> bit set and does wait for a concurrent sp_task. The same applies to
> bnxt_rtnl_lock_sp().
>
> Thread A runs devlink health recover. The HEALTH_REPORTER_RECOVER doit
> already holds devl_lock:
>
> devlink_health_reporter_recover()
>   bnxt_fw_recover()
>     __bnxt_fw_recover()
>       bnxt_fw_reset() or bnxt_fw_exception()
>         bnxt_lock_sp()        <- BNXT_STATE_IN_SP_TASK left alone
>         ...
>         __bnxt_close_nic()
>             clear_bit(BNXT_STATE_OPEN, &bp->state);
>             smp_mb__after_atomic();
>             while (bnxt_drv_busy(bp))
>                 msleep(20);
>
> Thread A reaches __bnxt_close_nic() through bnxt_force_fw_reset() or
> bnxt_fw_reset() -> bnxt_fw_reset_close(). It can also get there through
> the new n < 0 path in bnxt_fw_reset():
> bnxt_rtnl_lock_sp() -> netif_close() -> bnxt_close().
>
> Thread B is bnxt_sp_task on the same bp. It set BNXT_STATE_IN_SP_TASK
> and passed the BNXT_STATE_OPEN check before thread A cleared
> BNXT_STATE_OPEN:
>
> bnxt_sp_task()
>     if (test_and_clear_bit(BNXT_FW_EXCEPTION_SP_EVENT, &bp->sp_event)) {
>         if (!is_bnxt_fw_ok(bp))
>             bnxt_devlink_health_fw_report(bp);
>     }
>
> bnxt_devlink_health_fw_report()->devlink_health_report()
>     if (reporter->auto_dump) {
>         devl_lock(devlink);   <- blocks, thread A holds it
>
> While the heartbeat is stale, bnxt_timer() -> bnxt_fw_health_check()
> queues BNXT_FW_EXCEPTION_SP_EVENT on every tick.
> BNXT_FW_RESET_NOTIFY_SP_EVENT can reach the same report call.
>
> auto_dump defaults to true for bnxt because it provides .dump. If the fw
> reporter has auto_recover=3Dfalse, devlink_health_report() goes on to the
> auto_dump devl_lock() and blocks there.
>
> Thread A waits for thread B to clear BNXT_STATE_IN_SP_TASK, and thread B
> waits for thread A to drop devl_lock. Wouldn't devl_lock and the netdev
> instance lock then stay held forever? On the new
> bnxt_get_registered_vfs() error path in bnxt_fw_reset(), RTNL would be
> stuck as well.
>
> The window looks fairly wide. bnxt_ulp_stop() and the netdev_lock()
> acquisition both run between thread A taking devl_lock and thread A
> clearing BNXT_STATE_OPEN.
>
> [ ... ]
>
> > @@ -14860,9 +14869,12 @@ void bnxt_fw_reset(struct bnxt *bp)
> >               if (n < 0) {
> >                       netdev_err(bp->dev, "Firmware reset aborted, rc =
=3D %d\n",
> >                                  n);
> > +                     netdev_unlock(bp->dev);
> > +                     bnxt_rtnl_lock_sp(bp);
> >                       clear_bit(BNXT_STATE_IN_FW_RESET, &bp->state);
> >                       netif_close(bp->dev);
> > -                     goto fw_reset_exit;
> > +                     bnxt_rtnl_unlock_sp(bp);
> > +                     return;
> >               } else if (n > 0) {
> >                       u16 vf_tmo_dsecs =3D n * 10;
> >
>
> [Severity: Medium]
> Does dropping the instance lock here expose a stale
> BNXT_STATE_IN_FW_RESET to other threads?
>
> By this point bnxt_fw_reset() has already decided to abort. But
> BNXT_STATE_IN_FW_RESET is still set, and no fw_reset_task has been
> queued for this reset.
>
> Between netdev_unlock(bp->dev) and the netdev_lock() inside
> bnxt_rtnl_lock_sp(), any waiter on the instance lock can get in and act
> on that bit. A waiter that already holds RTNL is guaranteed to win,
> because bnxt_rtnl_lock_sp() has to take RTNL first.
>
> Several users of the bit look affected.
>
> bnxt_close_nic() called by an RTNL holder, for example an ethtool
> reconfiguration or bnxt_close():
>
>     if (test_bit(BNXT_STATE_IN_FW_RESET, &bp->state)) {
>         netdev_warn(bp->dev, "FW reset in progress during close, ...");
>         set_bit(BNXT_STATE_ABORT_ERR, &bp->state);
>     }
>
> Normally the POLL_VF state of bnxt_fw_reset_task() consumes
> BNXT_STATE_ABORT_ERR, but no fw_reset_task will run for this reset.
> The bit is left set even though bnxt_fw_reset_close() never ran. A
> reconfiguration path that closes and then reopens would then see
> bnxt_open_nic() fail with -EIO.
>
> bnxt_fw_exception() -> bnxt_force_fw_reset() from another context:
>
>     if (!test_bit(BNXT_STATE_OPEN, &bp->state) ||
>         test_bit(BNXT_STATE_IN_FW_RESET, &bp->state))
>         return;
>
> A fatal reset requested inside the window is silently skipped.
>
> bnxt_io_error_detected():
>
>     if (test_and_set_bit(BNXT_STATE_IN_FW_RESET, &bp->state)) {
>         netdev_err(bp->dev, "Firmware reset already in progress\n");
>         abort =3D true;
>     }
>
> This returns PCI_ERS_RESULT_DISCONNECT. A PCIe error is a plausible
> reason for bnxt_hwrm_func_qcfg() to fail inside
> bnxt_get_registered_vfs() in the first place, so this race does not
> look far-fetched.
>
> Clearing BNXT_STATE_IN_FW_RESET before netdev_unlock() would close
> this window. However, it would also let a new reset start before
> netif_close() runs.
>
> Would it be acceptable to take RTNL up front in bnxt_fw_reset() when
> bp->pf.active_vfs is non-zero, so the instance lock never has to be
> dropped? VFs, and PFs without active VFs, never reach this path, so
> the RTNL contention concern from v2 should not apply to them.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261108222942.1233295-1-bcochrane%40google.com
