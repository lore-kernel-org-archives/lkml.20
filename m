Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BAC39280D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945454; cv=pass; b=mwKcOsxOGHIJtrYRh5uWu89HCfAd4+H4lA3opGvFQuvhkWWulmLJlxMmoJhHfBhD3QXQDUrKMnS5w+cq7kovYsFTBvGSCcFReutSZv4+9qZzy6J954Yq3nBhzH3/2l7tZ18itxqTI3TyRB4BaFWUtNenQdkIYFYLV6fcEOdCvvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945454; c=relaxed/simple;
	bh=/F5y0LLbo/rROmeDIaBjtkQ14p/OdkwBq6ce/vqcU1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4HbTzA7hPwHelwC3t98VPq+AkHR2OnpQB7RA802xB7YRu+/LvjDGEnOjqmc5/+xvuZzyTyej7+N7VbBhLCWbX+e6hDCk/gbk+iVE8WBaUt3cU2UtkAJVgk+i9NoZ594Vz+xL/u+DDovZhBG4x8DUdjeSRlFBG11SdyNS84kw4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCPD8kqY; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCPD8kqY"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-87ffa98d4a9so4343667b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788945452; cv=none;
        d=google.com; s=arc-20260327;
        b=ZO5lG+e0uZPKGFmHoMIudbc6L4hoV/6mT6pGQQU7+1QFzzsvMdSXeIufAD/HG9Wmtq
         QKXMDXANX46cFcRUTSGm5t1pSETXlAjyiij23mrr8dl1qOGGoijk1MVFPOWrlUrg+3HZ
         emAZabhQmFZto1qPaQw4zTAGJsQ/F8jFLUW/VPHeHAXfdeApP0bHc8tef5ExhUFi/Yt8
         cBR/YaBzMN8NfotyxDA6dnqfid/Xevt3Nd0+XdjU79OkIG6bJ8sb9Ycx0cdxLh+gAfhg
         lATQXyPonMc7RZdQC3XuP4oVhmT4aP3WMh0KX/+6LD3mesSU7DSZshTtYWP9rvJE+weq
         j0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r9wGTvuYE4vQRVTrjaHercWI+jZS31FFyBXWpLNHH7g=;
        fh=vNGqWBfSKTUaL6kxYTouXYqTyeHKytjPqwP7Y0Gbv5A=;
        b=NxUWTCmHwWkTC42VYoLl9JccDDKBaXW3icm9KHnqjCX+K6XyhQzsEb8TrEyDiG0Zq2
         8eTqwAgrf7MG9VbFi1/NU/J9vwjoHk6kIhYntI7lw/2k+IpTYfRUXO0hfJLsaKiamjB4
         W5w68c8UM13NkskRnWhNosespPhK07/vFEqp6n745u0WzfWT7BUJ0+KzCfZrSaa0XsKr
         wTeTtTraD8JZKtfLsUV5poMOBAXp7Fw5hyvrgYuuowk0qeV6drioLr9ng18s78mLTP2A
         k6u1PN7BR2dDDnHBL8NJvmQ8zfpL3TH080iAZ1kR1fI4zClj4wetQ14zQMdYxwP6NBTP
         gzrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788945452; x=1789550252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r9wGTvuYE4vQRVTrjaHercWI+jZS31FFyBXWpLNHH7g=;
        b=rCPD8kqYUHFQZfY1SWy2EPnw1o4ENFOhQVfi1/4tre0zkR+nyIjjiN2DQB7dTGNtMJ
         6YCNhAbRQ/cwaVkbgBGdQ6OZh3yi/mH+UhOGBYKTetXgFaxAyYe3rTliV1hRWR0HtBro
         TS/ODwraVQu/663zqmnsYg2qAamXbzs6Z4scWxPJTgGgIkMs/uOEImnrmv5dswaD7KJR
         dsfBPZ9/PO2QQjb+Bt9OE5XTroo6/c5qsHvblTn0igWGq9jhG6kjuxEiPKx9kE1bGWxJ
         J4nLo8c8S7+B8W6fPCS4aHPJ2KY0bMypoleRSBM9gTjyAo/9AvAj9dfcWypXINv5xEZW
         S0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945452; x=1789550252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9wGTvuYE4vQRVTrjaHercWI+jZS31FFyBXWpLNHH7g=;
        b=MQDjEaFHkvBcS7WCgwQ0D/q8Syx9MXpnG1TpGFnnXchPmRqDG5v3R8jwA53H/kdrAc
         WtdHs5uX/m9t8QQpRAqcfEky/XKqZG8WJI9PO/0W6txSf1M1PImFrDWvBilNZb+TCDnu
         MuF9zqlnvkwn5BnJb5VHFBSzRM9JiwOWkbIIp4pBBZWhdswKgeMbCAlJPVzNXfuGB7t1
         jWT50nIGhm7bykbJH34H49Tx2X7jEWR1k2Kgs1CgHlTWY2pt2IJecy3voxav00S5/gu5
         vllbZPAdecMMvTnE8o7XkeXNL29DUSu17O6nY7RdNuQrz+mlq8yqVbb0FFE32ry9PSr8
         Q4+g==
X-Forwarded-Encrypted: i=1; AKwUvBwrh8cBbMI8t6CWoGy0H4uL2c09bUtZRYMIrCT3NUpfAkQaoIvaSVEUMgqe94Rn4UIPdNYmLzLpDdxX3CM=@vger.kernel.org
X-Gm-Message-State: AFuF++ml2rPRMmMZMzpe4dKPh5mv9ki/nSc0JPXeRSQ8ZQTlNEv2XQFh
	O86BnpK5GkSkOTav3mwwzyIi4k+0z9iWHCaC7hNaFKl8MnoTDkf5stCmnJahwFh94aXQQEXAaSw
	VUo9BbVBCqJrsc8kOYZrg969mC62m7pU=
X-Gm-Gg: AYBFou0SHpx0D5vjIhElTcHpdzWDwvOT2Q6dJ5yHJpIzn2MWYpmANwBZg7TLJJAmkze
	Wsqfz2xqR+W8vjbAOSIWAuAzcr3tbiX6wZSlwFv+ILCf+C17nJre0lzF0Zlrue+St96ARwGikHt
	JE80dbahCaWACvRIQPvywZsvY7aqXYPBxGFoFOnwc1mn5KurAnYGY2h7J22dLOBiIAy9wJK6HUU
	3oX3Tfg9nTYtunCfcIUuY5BQAShn2bUCcdjwd7yu2ij+nSu8To8SNye9T6UxjctGg9UTlmY7LGQ
	ZVqhWD2qL3D+H//GqoVRBceXBWZ23oQfyvsDjEydhbAaPoo0d2/l/Ls=
X-Received: by 2002:a05:690e:1c1c:b0:669:586a:8673 with SMTP id
 956f58d0204a3-66fb59c3a99mr9579045d50.21.1788945451966; Wed, 09 Sep 2026
 02:17:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908165050.1930-1-yogeshgaur.83@gmail.com> <aqECZPhDe_elcG5P@hovoldconsulting.com>
In-Reply-To: <aqECZPhDe_elcG5P@hovoldconsulting.com>
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
Date: Wed, 9 Sep 2026 14:47:19 +0530
X-Gm-Features: AcwNN1UrL_UevZsQ87HP2uUJ-wroDAR-zlHUb94yZCqKoThFwwjaLsdUn3pBCg4
Message-ID: <CAG6enPw3DPtHR+VX=nE=oTUC08=feH7rgPnxkFu2s1k=CbCjcA@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: never tear the host down from the inactivity timer
To: Johan Hovold <johan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Guangshuo Li <lgs201920130244@gmail.com>, Tony Olech <tony.olech@elandigitalsystems.com>, 
	Chris Ball <cjb@laptop.org>, syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com, 
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:23=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Sep 08, 2026 at 10:20:50PM +0530, Yogesh Gaur wrote:
> > vub300_probe() takes a second kref reference on behalf of the inactivit=
y
> > timer and arms it:
> >
> >       kref_init(&vub300->kref);
> >       ...
> >       kref_get(&vub300->kref);
> >       timer_setup(&vub300->inactivity_timer,
> >                   vub300_inactivity_timer_expired, 0);
> >       vub300->inactivity_timer.expires =3D jiffies + HZ;
> >       add_timer(&vub300->inactivity_timer);
> >
> > and expects the timer to release that reference from its own expiry
> > function, once it observes that vub300->interface has been cleared:
> >
> >       if (!vub300->interface) {
> >               kref_put(&vub300->kref, vub300_delete);
> >       } else if (vub300->cmd) {
> >
> > That is wrong in both directions, because the expiry function runs in
> > softirq context.
> >
> > If the timer happens to hold the last reference, the kref_put() runs
> > vub300_delete() -> mmc_free_host() -> cancel_delayed_work_sync(), which
> > sleeps. The ->probe() error path arranges exactly that: it clears
> > ->interface and drops only its own reference, leaving the timer armed
> > and owning the last one.
> >
> >       BUG: sleeping function called from invalid context at kernel/work=
queue.c:4487
> >       in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 191, name:=
 kworker/0:2
> >       Call Trace:
> >        <IRQ>
> >        __might_resched.cold+0x1ec/0x232 kernel/sched/core.c:9197
> >        __cancel_work_sync kernel/workqueue.c:4487 [inline]
> >        cancel_delayed_work_sync+0xb8/0xf0 kernel/workqueue.c:4568
> >        mmc_free_host+0x19/0x30 drivers/mmc/core/host.c:700
> >        vub300_delete drivers/mmc/host/vub300.c:379 [inline]
> >        kref_put include/linux/kref.h:65 [inline]
> >        vub300_inactivity_timer_expired drivers/mmc/host/vub300.c:747
> >        call_timer_fn+0x11f/0x610 kernel/time/timer.c:1745
> >        </IRQ>
>
> > Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
> > Reported-by: syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Df4a0159ce6802a0a4774
> > Reported-by: syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D1ee4f3b9228e35f14677
> > Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
>
> You forgot to add an Assisted-by tag.
>
> Several people have already proposed (LLM generated) fixes for this.
> Please search the lists.
>
Thanks.

v2 adds the Assisted-by tag.

On the lists: the closest prior posting is syzbot's own AI RFC [1],
which fixes the sleeping report by deferring vub300_delete() to the
dead work queue.
v2 cites it and takes diff approach, because that one leaves the timer
inside the reference counting and so does not close the second report
(f4a0159c) - the mod_timer() calls in the command and
dead work threads can still rearm the timer. Shutting the timer down
closes both.

[1] https://lore.kernel.org/all/49982079-95f4-4e8c-bbbc-bcb127e2f378@mail.k=
ernel.org

Yogesh

>
> Johan
