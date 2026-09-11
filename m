Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892E3E1D16;
	Fri, 11 Sep 2026 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120973; cv=none; b=hX/H/ID8yNR/P9sc5ik/D9vtdgKpnfqyLry+fykAIzTa2TJQV+JeulS4TXiPdiven9mW1dHBbyL+FZuBVhN6z6qv4xe5SVmoeHTvPdJGUDvVhI9L5ksmO0iNj8vyAfDVH4Y9VjU9RMc8sXIz/Zartlxx1Cm5PApvmhNZTr2qAoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120973; c=relaxed/simple;
	bh=XP+0UXVuy3HThgLWo73ftT3+J8AGmg19bL4ATCVxuzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tU5EWr+vnsbMdXy7+lmgaaI8JxpkpfcdDgqZcUyGeyy/dIDH3AjWd2ketC1qTzbD6G5GDewGb1LvGNvaUWo8yty+7xMcDbfM57ETqy6ZDUtjaxCK1eeVdI2rIsd/2LkQPWdDz7yPs074FPqyVygsxw+VYNx0zeSfVnXzS9O8Aa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7ZtyQqC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7ZtyQqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45E41F000FF;
	Fri, 11 Sep 2026 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789120971;
	bh=oUW3aoZgzM6Dx1leS9dg3EYEA4oyuYwJ4wHKO/d+t18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G7ZtyQqCAoVvOOu/aN3dBQeaeM9cJeVsd7p92mrX52PBEV6UM09fnMxnVbMCAWfey
	 Bu+4/nRgxXCB6gwGlkr0wqhyL/O2xc7qbeiK7PYriLz9yGW1R1bv9IJlYZyLB8fK5t
	 K4A0qCu0KRh760vgo10FL+t8VjACcVm3MRnWJrPg9DjrsJze8T8cX0ZfklEUWMgR8I
	 23bpvawdy2uesOyl4KpaDlK+2BRqzQtyABYa4JfxwmTcOrtLsHfqbIsmRux1GEb+3c
	 8CaLXAAP3A+CoZFigGlbcYWN8iEupbBqXHWYcmfijaEGg7Oydpj30Gc7xzKa2W/ASs
	 E5E5qTzJfERRg==
Date: Fri, 11 Sep 2026 12:02:44 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Use SYSTEM_SLEEP_PM_OPS
 instead of NOIRQ
Message-ID: <imzegouvv6rc4qsu6lku6jpiqjo7gterwervbchgux4bc7hwm4@mihjrryhaps7>
References: <20260527082052.117289-1-ovidiu.panait.rb@renesas.com>
 <hpjrkv3bpbx4rfz2v6bumntiw5k36etktnv4bvxs2dhuv5wr3x@m4estpjcreo3>
 <OSCPR01MB1276930A2DEB5BB5B5EE29932D3BE2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSCPR01MB1276930A2DEB5BB5B5EE29932D3BE2@OSCPR01MB12769.jpnprd01.prod.outlook.com>

On Fri, Sep 11, 2026 at 08:53:29AM +0000, Ovidiu Panait wrote:
> Hi Manivannan,
> 
> > 
> > On Wed, May 27, 2026 at 08:20:52AM +0000, Ovidiu Panait wrote:
> > > On the Renesas RZ/V2H platform, if the xhci driver is unbound and the
> > > system is suspended afterwards, a PM underflow error will occur:
> > >
> > >  # echo 15850000.usb > /sys/bus/platform/drivers/xhci-renesas-hcd/unbind
> > >  # systemctl suspend
> > >  15870000.usb-phy: PM: dpm_run_callback(): genpd_resume_noirq returns -
> > 13
> > >  15870000.usb-phy: PM: failed to resume noirq: error -13
> > >  15870000.usb-phy: Runtime PM usage count underflow!
> > >
> > > When the xhci driver is unbound, the runtime PM usage count of the PHY
> > > drops to 0. Since the suspend/resume callbacks are in the noirq phase,
> > > the pm_runtime_resume_and_get() on resume errors out with -EACCES and
> > > the usage count stays at 0. The subsequent put in device_complete()
> > > then underflows the counter.
> > >
> > > To fix this, move the suspend/resume callbacks out of the noirq phase by
> > > switching from NOIRQ_SYSTEM_SLEEP_PM_OPS to SYSTEM_SLEEP_PM_OPS.
> > >
> > 
> > While this patch fixes the runtime PM underflow, it does not necessarily
> > fix the
> > underlying issue. The issue here is that the PHY was already suspended due
> > to
> > xhci driver unbound and the pm_runtime_resume_and_get() in
> > rzg3e_phy_usb3_resume() unnecessarily tries to wakes up the PHY.
> > 
> > I think what you need is pm_runtime_force_{suspend/resume} to
> > conditionally
> > resume the PHY in its rzg3e_phy_usb3_resume() callback.
> > 
> 
> I agree, the PHY should not be resumed if there is no consumer.                            
> 
> However, the suspend callback asserts the PHY reset, so its state is
> always lost across system suspend. Resuming the PHY with
> pm_runtime_force_resume() in rzg3e_phy_usb3_resume() might leave it
> uninitialized if it was runtime suspended, and relies on the consumer
> always calling phy_init() again before using it. I am not sure that is
> always the case.
> 
> The cleanest solution I see is to move the reset assert/deassert and
> the PHY initialization to runtime PM callbacks, and implement the
> system sleep as:
> 
> NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> 
> This should ensure the PHY is reinitialized whenever it is used and
> that it stays suspended when it is not used.
> 

Sounds good to me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
