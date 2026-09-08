Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1453806D0;
	Tue,  8 Sep 2026 06:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849979; cv=none; b=FiGRnSLGJZ+1aizAI/Pc+aLBIPhmQu6K2D9eH8U+JQV+MsoHVxlwRoVwdkDLgbapG7pzn3h0LUIvXl+4UD9vn7SpAcVApa/HtA5n48ppOoVkakkonjZIZGlH06Plts8wcLv5rm5ipuivMtXH7p6xTlpngCxE17PTRYT/PPuYYBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849979; c=relaxed/simple;
	bh=vLBJa8OpqAzl8Z+H2v0Qb2ryq7i9jQgv4S04n319TIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7iZsY1cP1Y61yKAL39RyDTmsB1bLdsBWxVPAK6UUeteDuG6nOpPmtb4QmA152s03ZNXU/kXjAwOseWIXPrCwF1sevsNlCckT5opaXy+pg9cmRqXqhKUo1zufHAILCIQMHsU2aomMJwRQWuDvV2vlSxXjsox0WICGRV39WNeZYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3qZ0WHz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3qZ0WHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A8F1F00A3A;
	Tue,  8 Sep 2026 06:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788849978;
	bh=SpRLoEjwfJIto8OqiNLUyzfu/DuCb0af7mLXDRonxgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k3qZ0WHzCWeNiqDW4zaymVchSRHamgu/y7Ve+1VwMlNDcIyyK8EFKzk5gDpXG/u1s
	 OrRYEQNVqNSyyN2mYILmWxDOOzuzPPDexpUlU4Zgt+fRsThMwPnOx2+FpT/ZvC6+fj
	 k00FuwNgZfCKagyGnbDoBijoONKtG29W88jK8UyoOZR8AJLBa2Vp3OP3r9OvP9bC9g
	 3pcVedP+hKWLQtizVq8UCg/5ojuTE/bIdUzgsGWfoVmTsQ75t0jrw4x7FVc/Xbr1S0
	 Z0MNUWj3JCh7J9F06Ix2urs/Cd76QYM7xqxZdgWb/gVPRwP9+f7ZRu6o6dadwLe9KM
	 W33ejNARS+OfA==
Date: Tue, 8 Sep 2026 08:46:09 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Use SYSTEM_SLEEP_PM_OPS
 instead of NOIRQ
Message-ID: <hpjrkv3bpbx4rfz2v6bumntiw5k36etktnv4bvxs2dhuv5wr3x@m4estpjcreo3>
References: <20260527082052.117289-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527082052.117289-1-ovidiu.panait.rb@renesas.com>

On Wed, May 27, 2026 at 08:20:52AM +0000, Ovidiu Panait wrote:
> On the Renesas RZ/V2H platform, if the xhci driver is unbound and the
> system is suspended afterwards, a PM underflow error will occur:
> 
>  # echo 15850000.usb > /sys/bus/platform/drivers/xhci-renesas-hcd/unbind
>  # systemctl suspend
>  15870000.usb-phy: PM: dpm_run_callback(): genpd_resume_noirq returns -13
>  15870000.usb-phy: PM: failed to resume noirq: error -13
>  15870000.usb-phy: Runtime PM usage count underflow!
> 
> When the xhci driver is unbound, the runtime PM usage count of the PHY
> drops to 0. Since the suspend/resume callbacks are in the noirq phase,
> the pm_runtime_resume_and_get() on resume errors out with -EACCES and
> the usage count stays at 0. The subsequent put in device_complete()
> then underflows the counter.
> 
> To fix this, move the suspend/resume callbacks out of the noirq phase by
> switching from NOIRQ_SYSTEM_SLEEP_PM_OPS to SYSTEM_SLEEP_PM_OPS.
> 

While this patch fixes the runtime PM underflow, it does not necessarily fix the
underlying issue. The issue here is that the PHY was already suspended due to
xhci driver unbound and the pm_runtime_resume_and_get() in
rzg3e_phy_usb3_resume() unnecessarily tries to wakes up the PHY.

I think what you need is pm_runtime_force_{suspend/resume} to conditionally
resume the PHY in its rzg3e_phy_usb3_resume() callback.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
