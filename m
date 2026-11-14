Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794632250;
	b=u19cvVOvhkJkAPTjy585yWQQkprGp8JqCZFtaLkNPm4ZBixJ486qVR6zSbHQ87JNhUCi
	 AAP8FNu/yVJc/8hagart5odWkGdG5wSAD7elU0UzKMO9eFltiQUse4Q30qAqyy8UlJG9J
	 Hep4GznqNJAcV9B0b3SqhC5S94qxRD4DTUW+qh0UBwoFTlsbK3bbrbKMZHXsCaBwsCtSC
	 18vaiRmRd/W7kb09xix0bQpMTtT6qBXjz2plOzLJHio1eKjn9utzGeiaXitnnxM67b5oZ
	 a41WrFfXJiMaBFVTJ63IeZoLqNoUr/ngeLPjHpdUHvVcLHQ9W7XbF6vOkpHP0WoWv6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mAWpV1M0Nu9QZUQqIslKLnJ4FSbGHgAq0csTQNUImDg=;
	b=mOQ1caWRpg7yv5Oo9kfo8SUYQeNMMgh9zBBRlOWCxqHaoxzYO9ZqYClLnPtGdl1Nr5FX
	 L3upMOM0+82Tx7SQSvnxk+a/NTXq1wr+5aafgItyzjclWLECLg17OXNdUW7XpaeohBgTV
	 t6SBXluOt+knPyQMKSFQ0XJ04a6RtsuNOQJ0YPvp6KDRQ4v9yW+7NGzAxbvOjBd/Qw8ww
	 0ZGwetEZlGEEvl0QFlgEk2ozfqNabXj0yOcXhCYYxfrZQDlXmWFFINWWBtlGjxgUeMueu
	 6PkxOmOriBRv44R6k7THHI+fadwkgDEPAMvxTaIgrXgnl3w+ApAI4TbtaNU49Yl8xow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wDniHRqv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0857A606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0857A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wDniHRqv
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-571888655f1so275861b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:57:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794632248; cv=none;
        d=google.com; s=arc-20260327;
        b=cIFT5IQmloOytc9yUzPLBMZFSXuhdSM2xYIjZ5M2yZyfAF1wO9J2nE6dv051UhUYnd
         rJmtoSZbKafSEPmBe2vWY5E+GbfnveOqxoVnOo24Mw2XrSgQ+wjB9fTSaiFF+MMHZK7T
         2EM/qc4pcuCFBS0RwZGY0nOdJ+mOXYU3hyHng8ObHKiEyVh/1zB6mpyw0MmnksK1g/Ke
         Ie0AO7y6bNY1SIT5V7Zd3x625wv+yCjijqmoBTxvJizeGSvmS9CIA216EcHRopDrCePT
         h95vJUJY4UirrQ3ZeLlMRMHbQ7vwjOsg2J2QD2VekwCsXYkaUM9HU9L/hlS78jxt51Aq
         QPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mAWpV1M0Nu9QZUQqIslKLnJ4FSbGHgAq0csTQNUImDg=;
        fh=hPXwyRikmibFPpuEpWC0VuWxI782pFnjXwjGkJfM2tc=;
        b=SNGpMCtQY5LjWL6AmuPPsnPd8rISLJuGe7TjpAxC0vKvCkTKnuhVzEhQ7mOu9w+Slf
         1P8LDaNUBctqAtTzbikiujvJhb6aOgjJCZ83W9jJKTkjzjmtnEcMStT4fqRcZHgiv8qR
         ocHwUfEKzdCuvxb13iUbChkTjvLzkJybMzNfrZkt7ncgRXje8davduri5PTmTd68SnUG
         UEKCQneXaKvaQYm4eRxHOp5ha78j65z898fqzF3H4FJhjyH1ujYM9luTsvxGo7aWM37F
         TstAAo93RY0wJnG9ZI+fELDizs6Vi2P2gQ6FRYBMzoQP5bgP1BZxi5ob0BeGCtrxIaTa
         FpEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632248; x=1795237048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mAWpV1M0Nu9QZUQqIslKLnJ4FSbGHgAq0csTQNUImDg=;
        b=wDniHRqvqInTmMs5XREYzCcMfA+Zht7UInOa08L1cPTi6JGmRJ0HDX09HCQ5oyAJWb
         lfh7lHAiysWJ0zQWo02uYzPCe1zMkemAAWdaS7ghcTEY8ab9rvT7HoyH4KMzyyavvYSf
         BxUEEp4xRA5d5cmFr7q5aMn/KJv5wQ7fvpS2EAwtpfkgJWFTDVdhzpOZNixGPpP9FsGV
         SN49dRGAGqFX0liNYcWamL3PbxORIKQYUh8nchu0VosH/xaNEIXiQPcle81ioxaQsNRT
         468XlL8gQks/13TOPENBe1O57EwFst+ham+VKI/soCBRcacPN4TYkE6dSOAA9mavgs3S
         4OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632248; x=1795237048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAWpV1M0Nu9QZUQqIslKLnJ4FSbGHgAq0csTQNUImDg=;
        b=zw7fwJ/+ohlubGRBdKftHDKB6MRNgP81v3Hh/3y9QlXhbYwLdv8AqtL7mnuNgNED2z
         TnU66w6TKACSV1pbuyTtJ4gxAMBm71mDmoUNpOnKjNVa4Qcd2ZGgGtR7Zk/4hIv84x++
         F6/hFe3wv5dw4XNhykcyUSh5xFuIFQNs/dUT0FDPyhUKRPPH7FLwmvrkZLPz8uC9+XQ2
         Z0IFioiM/05jzWX27uDBUCtHBFpPEJFOsOGBooQfZcLihXi13r9uTdyN7WWdhJb7HzhV
         vCQXS7WTAYCEYCxOyc/609EcxwjA+op08Jlw7KT2nPy/69B7Cf13wXmsIz9y/uz88uVh
         GKKA==
X-Forwarded-Encrypted: i=1; AL+hErEpwNPMEIy4yCQ9I7hDCopyFCbm9p/Yvz4QwY0/whkpmF60y4WEWOaOqpD5hJvxINiEv2HqkQFj4KLtXWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wYxmydTM79BWBo3BoGb2RS6MVTE6bNYzUEn2QG/uO645C527I
	9vrjMEdQ2D4gcDwiQcTRSnZpUeR8KvgM498Axx2JznsXrOyk5nOFrfD6qYAIW0oks8oqq8MzxBb
	pZnV4bxppJcX2k7Oee6+aaD+cNjfcJBnrn6PzSIgTyQ+NhAs=
X-Gm-Gg: AYBFou2fqLj5q9vIFTw9zpchV1HaRSSET7ZE9/Hk5+QEYCyNqHQpeDsLUQwEd7SwYrP
	3UOkfJzWlE4IuKAzQUF89oTOL5hq/pzqAIr/JxwpVie1MVVFNRTQpbEwyuqz6BInYutFcO/tpHK
	6xOmC6eV+nYX9vsSSfvkF24PbLA7Ch9JMiwg5w4QgkWD1Ene1gOCU8LQNT0NVECa7AdNoQGGsW8
	3+TwuXSt6Ht0DV/YQGHNstotLuCKRdyesi12y3NYLijR7v6w6qR9DzpH6nuUjRcSAYBJYmTf/KZ
	9pr4A8/h3rve7OLWLnp9MDhtwIckTqC4amGDr2C93RPojj2yjK0+eWOsq8R1aKg7/0quTa2UF3/
	es2UPn4gvw92z49LscMnuci0WQljM0lQphBD+2LU4gPLBZVpgABhPd5g5HxMTgKIH05ySH6HFwi
	/1Vm5lbi8ZnPDY0YRE
X-Received: by 2002:a05:6808:831b:b0:572:6ee:8b6b with SMTP id
 5614622812f47-57206eeac9emr372158b6e.66.1794632247852; Fri, 13 Nov 2026
 20:57:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107174215.15818-1-swizzguy76@gmail.com> <f585562b-dbdc-415b-a493-475cf545a092@linux.intel.com>
In-Reply-To: <f585562b-dbdc-415b-a493-475cf545a092@linux.intel.com>
From: Toast <swizzguy76@gmail.com>
Date: Sat, 14 Nov 2026 10:27:17 +0530
X-Gm-Features: AclHuK8QlfT2uRLD1uAa8XnAGmCLr9nS6RezPS4g9Ri_LHUcmb3SIj8Cm9mcaUQ
Message-ID: <CAHBKUQYt-GjFnTNZRFbwo5DCf9hzN=sBW=XSwcGhEUKvCf-t9w@mail.gmail.com>
Subject: Re: [PATCH] accel/ivpu: Disable recovery work on probe failure
To: Karol Wachowski <karol.wachowski@linux.intel.com>
Cc: jacek.lawrynowicz@linux.intel.com, jeff.hugo@oss.qualcomm.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	ogabbay@kernel.org, andrzej.kacprowski@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested on Meteor Lake (Core Ultra 5 125H, vpu_37xx firmware 20260219)
on top of v7.4-rc1:

- kexec from a 7.0 kernel and from 7.4 with the NPU runtime-suspended:
  both runs hit ATS_ERR during probe, recovery_work was not queued,
  probe failed once with -ETIMEDOUT, and there was no oops
- FLR plus rebind brings the NPU back
- debugfs force_recovery after a successful probe recovers the NPU

I couldn't hit an error IRQ after ivpu_boot() succeeds, so the deferred
recovery in ivpu_pm_enable() isn't covered by this.

Tested-by: Daksh Sahni <swizzguy76@gmail.com>

On Tue, Nov 10, 2026 at 2:03=E2=80=AFPM Karol Wachowski
<karol.wachowski@linux.intel.com> wrote:
>
> On 07-Nov-26 18:42, Daksh Sahni wrote:
> > If the NPU raises an error interrupt while ivpu_dev_init() boots the
> > firmware, the Buttress, MMU or WDT IRQ handler calls
> > ivpu_pm_trigger_recovery(), which queues recovery_work. When ivpu_boot(=
)
> > then fails, the err_ipc_fini path tears the device down without
> > disabling recovery_work and probe returns an error. devres unmaps the
> > register BARs while the work is still queued or running, and the work
> > faults on the first register access:
> >
> >    BUG: unable to handle page fault for address: ffffcfc6680200f4
> >    Workqueue: events_unbound ivpu_pm_recovery_work [intel_vpu]
> >    RIP: 0010:ivpu_hw_ip_ipc_rx_addr_get+0xc/0xb0 [intel_vpu]
> >    Call Trace:
> >     ivpu_wait_for_ready+0x155/0x220 [intel_vpu]
> >     ivpu_boot+0x9e/0x270 [intel_vpu]
> >     ivpu_resume+0xa4/0xd0 [intel_vpu]
> >     ivpu_pm_reset_complete+0x2c/0x90 [intel_vpu]
> >     ivpu_pm_recovery_work+0xf6/0x140 [intel_vpu]
> >     process_one_work+0x1da/0x3c0
> >     worker_thread+0x1af/0x340
> >     kthread+0xfa/0x130
> >     ret_from_fork+0x2b9/0x380
> >     ret_from_fork_asm+0x1a/0x30
> >
> > The work dies between pm_runtime_disable() in ivpu_pm_reset_begin() and
> > pm_runtime_enable() in ivpu_pm_reset_complete(), so the PCI device is
> > also left with runtime PM disabled and never autosuspends after a later
> > rebind.
> >
> > Commit 5eaa49741119 ("accel/ivpu: Prevent recovery invocation during
> > probe and resume") stopped IPC failures during probe from triggering
> > recovery, but the IRQ handlers still can.
> >
> > Call ivpu_pm_disable_recovery() at the start of the err_ipc_fini path,
> > as ivpu_dev_fini() already does, so the work is flushed and cannot be
> > queued again before the device is torn down.
> >
> > Reproduced on Meteor Lake (Core Ultra 5 125H, vpu_37xx firmware
> > 20260219) by kexec'ing with the NPU runtime-suspended: probe in the new
> > kernel gets an ATS_ERR Buttress IRQ during firmware boot. With this
> > change probe still fails with -ECANCELED, there is no oops, and an FLR
> > followed by a rebind brings the NPU back.
> >
> > Fixes: 852be13f3bd3 ("accel/ivpu: Add PM support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Daksh Sahni <swizzguy76@gmail.com>
>
>   Hi Daksh,
>
>   Thanks for the report and the thorough analysis, it's correct. An error
>   IRQ that fires once ivpu_boot() has enabled interrupts can queue
>   recovery_work during probe, and nothing on the probe error path stops
>   it.
>
>   As Sashiko pointed out, disabling the work on err_ipc_fini comes too
>   late. By then recovery_work may already have run concurrently with
>   ivpu_boot(). It can also race with a probe that succeeds, which you saw
>   yourself in one of your runs.
>
>   I'll send a v2 that addresses this along the lines you offered and
>   Sashiko suggested. recovery_work stays disabled for the whole of probe
>   and is enabled in ivpu_pm_enable(). A recovery requested during probe
>   is not lost. If ivpu_boot() fails, probe unwinds with nothing pending.
>
>   If  probe succeeds, ivpu_pm_enable() runs the deferred recovery and
>   waits for it before issuing the initial autosuspend request. The NPU is
>   then reset before first use, and the autosuspend no longer lands while
>   runtime PM is disabled, which covers your second note too. The patch
>   will keep your Reported-by.
>
>   I'm running it through our internal CI first and will post it once that
>   passes. When it's out, could you test it on your Meteor Lake kexec
>   setup and reply with your Tested-by? Once I have it, I'll go ahead
>   and merge.
>
>   Thanks,
>   Karol
> > ---
> >
> > Notes:
> >      Tested on v7.4-rc1 (d48723711bae).
> >
> >      Two things this patch does not address:
> >
> >      The trigger is kexec with the NPU runtime-suspended in the old ker=
nel.
> >      The driver has no .shutdown hook, so the new kernel's probe sees s=
tale
> >      NPU state and gets ATS_ERR. A cold boot doesn't hit it. Whether th=
at
> >      wants a shutdown hook or a reset at probe seems like your call.
> >
> >      In one of four runs that hit ATS_ERR, probe succeeded while
> >      recovery_work was running concurrently. Probe returned 0, but the
> >      autosuspend request from ivpu_pm_enable() landed while recovery ha=
d
> >      runtime PM disabled, so the NPU stayed active until first use. Not
> >      allowing IRQ-triggered recovery until ivpu_pm_enable() would cover=
 both
> >      cases; I can send a v2 that does that if you prefer.
> >
> >   drivers/accel/ivpu/ivpu_drv.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_dr=
v.c
> > index 247ed6b2ff62..4fcccf78ec5d 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.c
> > +++ b/drivers/accel/ivpu/ivpu_drv.c
> > @@ -852,6 +852,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
> >       return 0;
> >
> >   err_ipc_fini:
> > +     ivpu_pm_disable_recovery(vdev);
> >       ivpu_ipc_fini(vdev);
> >   err_fw_fini:
> >       ivpu_fw_fini(vdev);
>
