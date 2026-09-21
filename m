Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8751C049
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029025; cv=pass; b=bVkiL3KnK7YvWfjL8yrKyylQSIielDTGVw/ppRz2q4tfs5lRCBOTmEXMn2pKqjcB8c+dAiWulmxan7qfQ1FVMqv8LOsFmD00+O80slAqKbp/Lrl3Sy1BiPtPCl9BwkOs4nHejwJy8xH5rEB4nWCMZ4+WF1wNOHuGrPwlj6DyJPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029025; c=relaxed/simple;
	bh=ygxQGrVULTuQLXHw/7/JdMV/ZQLiV+IGlcOGZt/F2D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhCNWY/9jddqqoC2TBUKQNeLIqMUwPUJSMnc1FjrX+u+K2kJB1VohCtyjr0Ie90l91r5+S1eLZsYJ6gLaxto88YIWBtLtPAMO6FPKrirxg9ZrqgNac6F+svtBn2QpkXrT44EjSGIHdUhwVeL/8AMerG7e0A80QYhGmBlBBRQzh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o16dsyQu; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o16dsyQu"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60590a85cso6610453a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790029022; cv=none;
        d=google.com; s=arc-20260327;
        b=rxkBD4R63katMjijdFYaWoxls7OO5PZIja6I1mJwWfTxTmqDFg7aeUl483sw7Tld9L
         jpvQTRuh6p2xLriHKOjPSR+HegYDHbQhwJdmCEnvk46JMCsdVZDW0Fddw91Rc4sC/chJ
         VCJBcZjl0cJR0vkO6x6uaTmJL4aOVW4pn+OPr5dN8J6LJ3FKGLPlZpVGe85LfXv1zw0m
         97NXcFx3fMbR249iWpc/xcFCsAE0ngCgXDyOxYQ69+qol4869wL8n0MlVcREUCIyB2bn
         ouWyNUyu5V//sgE/0m4iLBc7TARw/25Qs4mNzz67w1IVJ0dYH4du7j08A7IVIrGngf+Z
         USyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ck2dQ4iiA8x8tPtfYLzBLk9ACmAdSjWMpZnAG67iB4E=;
        fh=uEqyyXCjdjdNKaD5k6540XrmqY+L++y1bWecIlfM7LU=;
        b=JFIKXUN8omkZtiVip4yiC9coY6T3WFI71WU/wzlSUUqGpro/65oj1kSTqU3pCoOKF2
         0blQPdrN3vdtqqf2UDSHPwLzDTuHeN1jGqcs56owCuAZlBnzuUEYmLwttdzEKFr3BFBw
         oYy0GIPjiB73SIlhK32/cS/1TXlmLl5TEQOvpIXs6EZETL0WzbOurdbhCTy/XcAkFvfs
         sd77f+9wIvO6qTlTnd03AYRQHXaz3I9PtkLmIkVZjbzQ7/gvQhe/GIXLsL49k+c6JuxP
         gnvGvtIxdyhuA0R6AqoTUtPOtHEO2K3/3cfPbZSwH+nKs366Lc+ouX0ZTe4xBie3SwsJ
         ZbXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790029022; x=1790633822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ck2dQ4iiA8x8tPtfYLzBLk9ACmAdSjWMpZnAG67iB4E=;
        b=o16dsyQumVzJ6ZQD9CBPZDz7YOyTg+pWyJM4BZxRIEkzasViSj7ryKk/YSR5KboqyD
         N83aI3rJno/AkfjPuoFBp8G0qX7X6KV8DXy75N9/Ih4AQ+dOPnVxxOVz/SFmwSdi8rXo
         PAckqX5bPQv6k1wOv0NO8MWWG4mlhF3YLJaPpnWql8Bro/IbTaTziifDN9OIeCQwtXn5
         eZKC//FrR3NTUiMsi+gtr6DnbmWadYllc02tNhue6HVursRuuwxEscIkUO0jujJxEQ5C
         Ge6Y5UMpXO0bjYGlDGZtvETsUXLC2BzMDi9cU38TvWYHuFAPaM4NgEoNeFH3zVB+ed0w
         vKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029022; x=1790633822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ck2dQ4iiA8x8tPtfYLzBLk9ACmAdSjWMpZnAG67iB4E=;
        b=cN1vuxG7n5N7CmZbUzA8nVKLefWYrNSq/oFxR+G3YJDY8C98ldX5sna1NPuUr/13q9
         a/GuMBDbAMA743w5IXp2wYjltbnVomWBtKAnRuU7+Zx5IihQaHxti+mQ7g76XxOfJwE0
         V99OokCWMpK6igBrqKQbQYBRE04AGqvu9VUUVPfFVIFj/6i1Qto2sO7Q7vZHDnm4OKI8
         B6wusiSp2w1V4yZ4h28ujm2+P74LVlBnW9ZX05Ym0cDKQUVfGVFbEKtRNKEaDD/3ZGG3
         rR0jZXyRrNXD9kzNFKlhuJ4gfrXCzRx1MXWWTgoVlrjfmpxHU90i4KNQOZC6UXTKmZ6C
         la5w==
X-Forwarded-Encrypted: i=1; AKwUvBwyUXQlblzvNXmf7jq60jB5gI2+R2D6BumJcWa1ktkIkcgU9WTaFvDjOgrwjYpQ9I1coZQsBYSQVK0rcPU=@vger.kernel.org
X-Gm-Message-State: AFuF++nBOltqJoljl74PkFab7WJ5DhccSSbQTBRWWBRJkVKcB7jpfwQq
	7B8lX9ZZx9y217uSQ4KUxMTYenSXpbfLik/3LfIv12VC9JlFdyeqxyYIpKxt5LFKuLBEEs2LqT5
	iKnA7D7qK7BmU0amXHvbw/2NSXKh9JA==
X-Gm-Gg: AYBFou1URKgRBT+dpqCGIjHVQxdDsFAU30mZpe1iTFDUUqOO1Sok0O621PgI4dIDSQT
	yEcJ0vRHM33P6WZTlhvYfAykn7kfxAobx05ad8yiPld5Gn3A5mWeu7eOX9hLGkXqIhn6Dz+nwnB
	0N3JG0O8NOqzS+qRpBSCblGIcOfZnNg5hRvYjA+kZOHmg0meLOfJjnPxYmkkv3TCp5vdjLjOnHR
	XEi6/MS4AVuFcSxzyRO5sZB29EZQ82PMehGvOimT7yUeirEx+V0FE3Lc/j/qSEFvFywbl5NJAFx
	7yLrMNoJLGv/IQkJLdm9U4a9s911099yC6/rcYyZJMNd6FD4ARpoZpAAEC+ujsD44lR8NzcNTBv
	oK1IUnYiZnsVPpHIuaPRaNDxlHY76S8Ug3VpkNpVv/UCsQgFH846jZU99X4wludTni93p
X-Received: by 2002:a05:6402:2790:b0:6a7:ee56:8158 with SMTP id
 4fb4d7f45d1cf-6aa579b0382mr9106641a12.38.1790029021870; Mon, 21 Sep 2026
 15:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGEsz8F2eKsmV_tymO+9UD5xkS_tWhZo-b9Xom1_SiKuc-BCqg@mail.gmail.com>
 <arETYSjwaHytxyBu@orome>
In-Reply-To: <arETYSjwaHytxyBu@orome>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 21 Sep 2026 18:16:49 -0400
X-Gm-Features: AcwNN1ULiGgKpQwlzJhSBbDWZG7BlTQmkG_ouL-IXAT-QUCIcQoVWsAgftcR8FU
Message-ID: <CAGEsz8EpXPPD=S8uM4fex1_c5eV6byzOcYgVyqmJMKBLUAm67Q@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: tegra-xudc: Disable port reset work on removal
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. v2 keeps the Fixes tag on one line and switches
plc_reset_work to disable_delayed_work_sync() as well, since the
port-status IRQ can queue it after cancel_delayed_work_sync() returns.
usb_role_sw_work stays on cancel_work_sync(). Its producer is the USB
PHY notifier, which v2 unregisters first. The two bugs are split so
the notifier fix can be backported below v6.10.

2026=EB=85=84 9=EC=9B=94 21=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 7:28, T=
hierry Reding <thierry.reding@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> On Thu, Sep 17, 2026 at 07:20:58PM +0000, Myeonghun Pak wrote:
> > The port status interrupt can schedule port_reset_war_work to handle th=
e
> > Tegra210 port reset workaround. The remove path does not cancel this
> > work, so it can run after the PHYs and controller resources have been
> > released and access freed memory.
> >
> > Disable and drain port_reset_war_work before tearing down the controlle=
r.
> > Use disable_delayed_work_sync() so that the interrupt handler cannot
> > queue the work again while the managed IRQ is still registered.
> >
> > This issue was identified during our ongoing static-analysis research
> > while reviewing kernel code.
> >
> > Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB
> > device mode controller")
>
> Please don't wrap lines like this.
>
> > Cc: stable@vger.kernel.org # 6.10+
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/usb/gadget/udc/tegra-xudc.c |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > --- a/drivers/usb/gadget/udc/tegra-xudc.c
> > +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> > @@ -3926,6 +3926,7 @@
> >
> >       pm_runtime_get_sync(xudc->dev);
> >
> > +     disable_delayed_work_sync(&xudc->port_reset_war_work);
> >       cancel_delayed_work_sync(&xudc->plc_reset_work);
> >       cancel_work_sync(&xudc->usb_role_sw_work);
>
> This is a preexisting problem, but given that we only delete the gadget
> below this cleanup, shouldn't the other two cancel_*() calls be
> disable_*() as well? Otherwise there's potentially a race condition
> between this and the interrupt handler (which is only unregistered after
> .remove() completes).
>
> Either that or the existing cancel_*() calls are enough in which case
> your patch probably should be using that variant as well.
>
> Thierry
