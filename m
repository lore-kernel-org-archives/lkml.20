Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B803F4108
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910554; cv=pass; b=RhndZ4qBW6p3/MZaujg1tJN1/qN3TGIxiH0WuPfzgReZLnOvrAbDFoGuOjyuqcQ+ySVSRQgYCIPmggVbtGQ6obOKxIHc+dDEGqSm5QuTNphOlRvcMbq3Y9mYlUupcUHcEGZ6NuJmYqzlDV/ndqKf11p0Wm26RspvqWwmdVcAj08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910554; c=relaxed/simple;
	bh=7Cxy+dQ+EI6qV8/HB1WWPtDGMv2x7/tWAIuc4/K/IoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzmX1S7t1itBoxS9UlXG9OJoKoL6TYjDvhrh1yQ0Z0T3ajbPimvreRGeqopo4J3Ik40ZVzdxxUqz0ctow0Wqwb4DG6gTErP9LZSGN4rbFmFRGnvx8Ld2v8TehIXS76xJU8b9wark8+lXLuOxA/j/fzvBbnFu060JUlOvaQZSLkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8jqrIH+; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8jqrIH+"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c0cea8883so12690711cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787910548; cv=none;
        d=google.com; s=arc-20260327;
        b=swIsuQTd0edURn5PIL6WN91KRbr7zPhrJ7ap8mNDdf1en81Mu+Uph1/xCgIFto6dvD
         eRw9b2y3csmhyadWNVeikY2tHcAZATmWptkEspOoUIu6Hfzg0rE6kX/wPbB2eqbf7/f1
         O9POuYqDzer1LVVMmScd2MZjZ0pnSG6yxX1mPvj9JJKf4GmfyYUVve3NsP5rRauXGK6S
         bOaQQFOtOs8UiMJqUfzWWIGbY3MJ/aSFq/71pz6XOd4QUxHbX3q3jcybZEslFi3y82ZN
         OENTNw8CVcuE966SBpWCEM7QAbPWA4ubj798uIRThBCd8Eta2zxiD1IS4a8BNEYTWBYA
         xn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z7+GEY3r36gO9sYtigtzYIP+u8ELV4NYrOFl9bdxXfw=;
        fh=lRpiUkzJwdbRvXgkl+WpH9GiG1Pi4SVgfu0f4NS9dCc=;
        b=S9YdLTkhlZiOxmHd/s4jKj+cXR+3kgk6XLEmNFxVv5h9lteZ1nXzxBuhMI0u+dnxOO
         jOcxM8P3jStoXmrQQwC7B+6pY/uk1OphF7fsSjaUT45c/3bUJDngsrCPBm2DmHjX5Gzh
         IHukN+vuF4G0OL7pyDRCUR2z5su6S7OKsd4XF4GVdXejIoghzvTxSSBZetlWD+VW2ZdX
         eZ75hToWl6GG3ucyrdzkBr0vJX3GQZ98yuQ4kXbq5T1sJL457J5nu3vAT+De1FcMTM45
         6AeoAlFnIFow7dmCz8zR8vfFun1MPFIkFMtkYxxQSYhlvrRN+p/ybDH1Qn4nmKYc/sM2
         3YJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787910548; x=1788515348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z7+GEY3r36gO9sYtigtzYIP+u8ELV4NYrOFl9bdxXfw=;
        b=X8jqrIH+LfnVI+/cN4uYz+fzkfrYuCECEE3PvqRzv6yujrQm9TR9md/AVXgrBE3/eo
         /u1RVDuIp+r1J9SAtudZR8F6z3M/wpUhOflGrwKBAc5RGjC871I5CJnXeXgaca4deAz8
         2DOGABfplh/AZXGbKpWKhjdYXCcR/xjh1L4j7T7Uf5y31k82eoHGzNB5ulKpqj2YnytU
         5ThkE8ooSeEE6QaeoyrKltUFwJPn40cPx9IJI/P9C6XlOqIZhtrLh8kykiXMe4q55H8N
         n2xGHa+17PMumI8OWyI82d/Hu30vkDH9dony5IRQPcyk7VuGOjaACdAmd4597+acK/PM
         jIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910548; x=1788515348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7+GEY3r36gO9sYtigtzYIP+u8ELV4NYrOFl9bdxXfw=;
        b=UggPZRsR4UGRcVsahgWXBa7WvVMshEJN3X8qv9vx2o49+7v2ZaaKjQkC/vpJ/tG3QO
         kddmprVRV9Dki3fc1h7thywbprSNKsBlDfSBYsjBELOhcRT4Sfo8yKRp+k3ZfxzwQQtM
         RMS0zpeASR4b9302A3y7vCiy2ANYFrvYAQM7PWKuXyTjHjkJhY1I0/gBasdXtU3uMbyL
         d8tXyceqkg8d/+qXE0mfnufgsxnvtQth4haEnPAEEQGLJkmxOOYAjh5yjxF8W3vCzP4h
         i4aDXnDNAhHS0pibqifyVzrifnsVFrfcTCUNNWTw0oVhQT3p73TjVR2SvbkZyAleqUmI
         +sNg==
X-Forwarded-Encrypted: i=1; AHgh+RrGC6LLXGsg/Lp+2AOg82EDNsZx3aynghSC4hsmLEM59JiuHb++a5OwuT7w1utbXTZnn+kYR/8hxfO3G6k=@vger.kernel.org
X-Gm-Message-State: AFuF++mLOdHCoSrxfxbp1vSpLKkJjZomLPV8FqWIfS2y/GlJF+QN2arr
	h/5YZcS9Kf434oo/UYfEXLoCP+ExA4VsDj+rOrnBG/U8Em+7ow6WpfwXEYsGXOvaqfrTH+1g6WQ
	+8mlx46rTY7FJVxS3fdbxsBifBhYfTX4=
X-Gm-Gg: AR+sD10BypAsXcPDmEKO4iihuXfAPL/9W71CqN8GR0npZN7DkYN7f3tYLRwXsV4PrpV
	+PtZtys2Ww4XLXriZBMPYJbk+BM+yuwC/aHda8szLoV05rauCjjBY70W0ZgrirIbX+Q1J5f7y8r
	LSJ2ejMLNBvDos+f+Vma3iPUVJwg50n/91MGDZBV1gV4xacyCQEQDpo6HspP963uah0xQDxrsDw
	pAFVPOlsgMm976FAsv/lVidXYVmaty0cjDNOQd5ADNGK3Lzcm4oUTz1+6NhBOy2+bt/QKPQqVTF
	Xu9T2+8m6JxJLlX4iwZmnoolBub2QTaHLqAL6hH4JKbm4k2kyUQ1e/05d1AKKeJ6LSoQqrvE6ya
	gDzyR597CDQURZ6jmFa9RU6yXJ3TSPJp72NA=
X-Received: by 2002:a05:622a:3ca:b0:51b:9873:e37b with SMTP id
 d75a77b69052e-52fb8ef9bc4mr55620421cf.9.1787910547272; Fri, 28 Aug 2026
 02:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727092258.1121-1-liujiazi@amazon.com> <20260812082127.79610-1-liujiazi@amazon.com>
 <apDmBeD8UQIvtfR4@vbox>
In-Reply-To: <apDmBeD8UQIvtfR4@vbox>
From: Liu Jiazi <jiazi.liu1984@gmail.com>
Date: Fri, 28 Aug 2026 17:48:55 +0800
X-Gm-Features: AcwNN1Wxk02VycXFR6FzqMc0tphW6zYgmo6hQyd1Yvdiu2jarMguczM5cc_XdZg
Message-ID: <CAAcjFgh-f2=cK09BLGN-kPVu2usjN7pWOxCWb31hSePB2nLVEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] usb: dwc3: gadget: fix IRQ storm on invalid event
 buffer count
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "lkp@intel.com" <lkp@intel.com>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Jiazi Liu <liujiazi@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi @Thinh.Nguyen@synopsys.com , Krishna,

Thanks for the detailed review.
For the gadget ops protection, I propose adding the check only in
dwc3_gadget_ep_queue.
This covers two scenarios:
1. The window between error detection and soft_disconnect completing.
2. After soft_disconnect, existing checks on
connected/pullups_connected/endpoint.desc naturally block all ops.
This is also consistent with how other gadget handles it.

Brs
Jiazi


Thinh Nguyen <Thinh.Nguyen@synopsys.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=8828=
=E6=97=A5=E5=91=A8=E4=BA=94 10:36=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> Sorry for the delay response.
>
> On Wed, Aug 12, 2026, Jiazi Liu wrote:
> > From: Jiazi Liu <jiazi.liu1984@gmail.com>
> >
> > When dwc3_check_event_buf() reads a GEVNTCOUNT value exceeding the
> > event buffer length, commit 63ccd26cd1f6 ("usb: dwc3: gadget: check
> > that event count does not exceed event buffer length") returns IRQ_NONE
> > without writing back GEVNTCOUNT. Since the DWC3 interrupt is
> > level-triggered, the uncleared IRQ source keeps the line asserted,
> > causing a tight IRQ storm that accumulates 99,900 unhandled interrupts
> > and triggers spurious.c:184 BUG -> kernel panic.
> >
> > The resulting call stack:
> >   __report_bad_irq+0xac/0xc8
> >   note_interrupt+0x340/0x468
> >   handle_irq_event+0xac/0xc0
> >   handle_fasteoi_irq+0x120/0x228
> >   gic_handle_irq+0x68/0x108
> >   ...
> >   kernel BUG at kernel/irq/spurious.c:184
> >
> > To reproduce, write a bogus value exceeding the event buffer length
> > directly to the GEVNTCOUNT register:
> >
> >   devmem <DWC3_BASE + 0xc40c> 4 0x1004
> >
> > Write the bogus count back to GEVNTCOUNT to clear the IRQ source,
> > consistent with the stale event clearing pattern in
> > dwc3_event_buffers_setup(), and schedule error recovery to
> > reinitialize the controller.
> >
> > Fixes: 63ccd26cd1f6 ("usb: dwc3: gadget: check that event count does no=
t
> > exceed event buffer length")
>
> Fixes tag should be single line.
>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jiazi Liu <liujiazi@amazon.com>
>
> Your email from Signed-off-by is mismatching your From: line above.
>
> > ---
> > Changes in v2:
> >   - Rename softcon_work to err_recovery_work
> >   - Use dev_err instead of dev_err_ratelimited
> >   - Update comment to document driver/controller out-of-sync fatal erro=
r
> >     condition rather than describing IRQ storm behavior
> >   - Remove dev_err from work handler; error message belongs at the call
> >     site where the specific failure is known
> >   - Follow dwc3_gadget_suspend/resume logic in recovery work handler
> >   - Add err_dying state to reject gadget driver requests during recover=
y
> >   - Add err_recovery_count counter and stop scheduling recovery after
> >     DWC3_ERR_RECOVERY_MAX attempts to prevent infinite retry loops
> >   - Add synchronize_irq() before soft_disconnect to ensure IRQ handler
> >     has completed before reinitializing the controller
> >   - Define DWC3_ERR_RECOVERY_MAX in core.h alongside other global const=
ants
> >   - Fix sparse warning: use dwc as first argument to dwc3_writel, not d=
wc->regs
> > ---
> >  drivers/usb/dwc3/core.h   |  7 +++++++
> >  drivers/usb/dwc3/gadget.c | 41 +++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 46 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > index 608daeb7ef10..b1cd888eca77 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -49,6 +49,7 @@
> >  #define DWC3_ENDPOINTS_NUM   32
> >  #define DWC3_XHCI_RESOURCES_NUM      2
> >  #define DWC3_ISOC_MAX_RETRIES        5
> > +#define DWC3_ERR_RECOVERY_MAX        3
> >
> >  #define DWC3_SCRATCHBUF_SIZE 4096    /* each buffer is assumed to be 4=
KiB */
> >  #define DWC3_EVENT_BUFFERS_SIZE      4096
> > @@ -1004,6 +1005,7 @@ struct dwc3_glue_ops {
> >  /**
> >   * struct dwc3 - representation of our controller
> >   * @drd_work: workqueue used for role swapping
> > + * @err_recovery_work: workqueue used for controller error recovery
> >   * @ep0_trb: trb which is used for the ctrl_req
> >   * @bounce: address of bounce buffer
> >   * @setup_buf: used while precessing STD USB requests
> > @@ -1171,6 +1173,7 @@ struct dwc3_glue_ops {
> >   * @wakeup_configured: set if the device is configured for remote wake=
up.
> >   * @suspended: set to track suspend event due to U3/L2.
> >   * @susphy_state: state of DWC3_GUSB2PHYCFG_SUSPHY + DWC3_GUSB3PIPECTL=
_SUSPHY
> > + * @err_dying: true when controller is in error recovery, reject all r=
equests
> >   *             before PM suspend.
> >   * @imod_interval: set the interrupt moderation interval in 250ns
> >   *                   increments or 0 to disable.
> > @@ -1186,9 +1189,11 @@ struct dwc3_glue_ops {
> >   * @wakeup_pending_funcs: Indicates whether any interface has requeste=
d for
> >   *                    function wakeup in bitmap format where bit posit=
ion
> >   *                    represents interface_id.
> > + * @err_recovery_count: number of consecutive error recovery attempts
> >   */
> >  struct dwc3 {
> >       struct work_struct      drd_work;
> > +     struct work_struct      err_recovery_work;
> >       struct dwc3_trb         *ep0_trb;
> >       void                    *bounce;
> >       u8                      *setup_buf;
> > @@ -1420,6 +1425,7 @@ struct dwc3 {
> >       unsigned                wakeup_configured:1;
> >       unsigned                suspended:1;
> >       unsigned                susphy_state:1;
> > +     unsigned                err_dying:1;
>
> Can we change this to enum dwc3_err_state err_state where
>
> enum dwc3_err_state {
>         DWC3_ERR_NONE =3D 0,
>         DWC3_ERR_RECOVERY,
>         DWC3_ERR_UNRECOVERABLE,
> };
>
> Then we can set err_state to DWC3_ERR_RECOVERY before scheduling the
> recovery work, and set it to DWC3_ERR_NONE when the recovery work is
> done. If we hit the max number of retries, we can set it to
> DWC3_ERR_UNRECOVERABLE. This will make it clearer what state the
> controller is in.
>
> >
> >       u16                     imod_interval;
> >
> > @@ -1429,6 +1435,7 @@ struct dwc3 {
> >       struct dentry           *debug_root;
> >       u32                     gsbuscfg0_reqinfo;
> >       u32                     wakeup_pending_funcs;
> > +     u32                     err_recovery_count;
> >  };
> >
> >  #define INCRX_BURST_MODE 0
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index fa0f16ffafef..05f3ffab6e47 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -2054,6 +2054,9 @@ static int dwc3_gadget_ep_queue(struct usb_ep *ep=
, struct usb_request *request,
> >
> >       int                             ret;
> >
> > +     if (dwc->err_dying)
> > +             return -ESHUTDOWN;
> > +
>
> As Krishna brought up, may need to double check, but I think all the
> gadget and ep ops need to be guarded.
>
> >       spin_lock_irqsave(&dwc->lock, flags);
> >       ret =3D __dwc3_gadget_ep_queue(dep, req);
> >       spin_unlock_irqrestore(&dwc->lock, flags);
> > @@ -4667,9 +4670,22 @@ static irqreturn_t dwc3_check_event_buf(struct d=
wc3_event_buffer *evt)
> >               return IRQ_NONE;
> >
> >       if (count > evt->length) {
> > -             dev_err_ratelimited(dwc->dev, "invalid count(%u) > evt->l=
ength(%u)\n",
> > +             dev_err(dwc->dev, "invalid count(%u) > evt->length(%u)\n"=
,
> >                       count, evt->length);
> > -             return IRQ_NONE;
> > +             /*
> > +              * This is a fatal error - the driver and controller are =
out of
> > +              * sync on which event has been consumed. Reinitializing =
the
> > +              * controller is required to recover. Write the bogus cou=
nt back
> > +              * to GEVNTCOUNT to clear the IRQ source, consistent with=
 the
> > +              * stale event clearing in dwc3_event_buffers_setup(), th=
en
> > +              * schedule error recovery.
> > +              */
> > +             dwc3_writel(dwc, DWC3_GEVNTCOUNT(0), count);
> > +             dwc->err_dying =3D true;
> > +             dwc->err_recovery_count++;
>
> This increment should be done in dwc3_err_recovery_work(). Reset the
> count to 0 after err_state transition to DWC3_ERR_NONE and on reset
> event interrupt.
>
> > +             if (dwc->err_recovery_count <=3D DWC3_ERR_RECOVERY_MAX)
>
> The dwc->err_recovery_count check here should be checked in the
> dwc3_err_recovery_work, to check whether to perform soft connect or not.
> Set the err_state to unrecoverable and print a dev_err() if soft_connect
> or soft_disconnect fails or if recovery count exceeds the max.
>
> > +                     schedule_work(&dwc->err_recovery_work);
> > +             return IRQ_HANDLED;
> >       }
> >
> >       evt->count =3D count;
> > @@ -4729,6 +4745,25 @@ static void dwc_gadget_release(struct device *de=
v)
> >       kfree(gadget);
> >  }
> >
> > +static void dwc3_err_recovery_work(struct work_struct *work)
> > +{
> > +     struct dwc3 *dwc =3D container_of(work, struct dwc3, err_recovery=
_work);
> > +     int ret;
> > +
> > +     synchronize_irq(dwc->irq_gadget);
>
> I think we should use disable_irq_nosync() before soft_disconnect and
> re-enabling it after soft_connect succeeds. Leave it disabled if
> DWC3_ERR_RECOVERY_MAX is reached or soft_connect fails or is skipped.
>
> > +
> > +     ret =3D dwc3_gadget_soft_disconnect(dwc);
> > +     if (ret)
> > +             return;
> > +
> > +     dwc3_disconnect_gadget_sleepable(dwc);
> > +
> > +     dwc->err_dying =3D false;
> > +
> > +     if (dwc->softconnect)
> > +             dwc3_gadget_soft_connect(dwc);
> > +}
> > +
> >  /**
> >   * dwc3_gadget_init - initializes gadget related registers
> >   * @dwc: pointer to our controller context structure
> > @@ -4772,6 +4807,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
> >       }
> >
> >       init_completion(&dwc->ep0_in_setup);
> > +     INIT_WORK(&dwc->err_recovery_work, dwc3_err_recovery_work);
> >       dwc->gadget =3D kzalloc_obj(struct usb_gadget);
> >       if (!dwc->gadget) {
> >               ret =3D -ENOMEM;
> > @@ -4868,6 +4904,7 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
> >       if (!dwc->gadget)
> >               return;
> >
> > +     cancel_work_sync(&dwc->err_recovery_work);
> >       dwc3_enable_susphy(dwc, true);
> >       usb_del_gadget(dwc->gadget);
> >       dwc3_gadget_free_endpoints(dwc);
> > --
> > 2.50.1 (Apple Git-155)
> >
>
> Thanks,
> Thinh
