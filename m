Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A599E53C3CC;
	Thu, 15 Oct 2026 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077371; cv=none; b=Dw+/WIWzfMFhqxSjzZO9YJVHkRAbLO+iSnrbWzRXyc8ZjrFpSBY1ojvtNd7RkIScEMiIda23UKob7MkjNMXSN1p3aZSdX5JVjWo8+O3SoVoO166sZpJwd52C2vbp74goTQjiOQzUBUCVEdZpeCXxolEwnIc7JeOpWfC9aMyQuxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077371; c=relaxed/simple;
	bh=IitW1J50xjyOQk+GWL1J+H0HpyvM7v+/tdOc4/dqUa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrpmXoNB/hyAqGRUxtykhh1dfmdy6jLpLJWhPphjXvYGfnk+/gzeebIb+OTmDZf1j0hQQmZ9dWzeDSpH57AVGRdW89wqoCVQK+nBM+6LAxO6+8g/nhyxlRnTAEYCUITAPkHyt51cNagZpxMOJ+ylahVfy6N626RcChwJe0RCP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j45sdhR0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j45sdhR0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C831F000C5;
	Thu, 15 Oct 2026 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792077369;
	bh=UqjSvLMacYdEM0FJSnnMucxWgLBPYNwo5CBuXCaVChA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j45sdhR0JKHhaOrubKWmkVd+Km86fFPdWI699u0REHbB0iWYr0hhxexIz8Ewn4825
	 Io1zyZIWtI8bz0Ry/SlCmu/rZ3WjWLxBQHvv5MuDLEg2xo3ctUcr4dSRMlpjbyy7gS
	 crOztC2lra9V7jFbo+U9dZcrYTUqC2y7UAQMFVOqtCna0lytJynlUXUzh6JWVQBoW3
	 WP5lT05NUakRMmMfzqgBHQRxRRx8+f8fsQfa2MuUxxMhEDsvAte1Zcyo32iUgrqw7j
	 yiNUVX5TQiNyAEIW5y+vhsnVMEdFPdrICZc2hrfFwAlD2rvEkiuuYIhLJZHfFR42x/
	 bAxRNStUhWbHQ==
Date: Thu, 15 Oct 2026 20:45:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sriram Dash <quic_sriramd@quicinc.com>
Subject: Re: [PATCH v3 0/2] Add support for SA8255P in the
 phy-qcom-snps-femto-v2 phy driver
Message-ID: <atDuBepNc7gwqYz_@debian>
References: <20261002-phy-qcom-snps-femto-v2-8255-v3-0-342542bd9bc6@kernel.org>
 <xhkdbwlrj59fg.fsf@mkorpers-koolstof.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhkdbwlrj59fg.fsf@mkorpers-koolstof.csb>

On Thu, Oct 15, 2026 at 04:24:03PM +0200, Mattijs Korpershoek wrote:
> Hi Mani,
> 
> On Fri, Oct 02, 2026 at 11:41, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:
> 
> > The Qualcomm automotive SA8255p SoC relies on firmware to configure
> > platform resources, including clocks, interconnects and TLMM.
> > The driver requests resources operations over SCMI using power protocols.
> >
> > The SCMI power protocol enables or disables resources like clocks,
> > interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> > such as resume/suspend, to control power on/off.
> >
> > Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
> > whereas power domain "transfer" controls clocks and interconnects.
> >
> > Patch 1 adds the binding for sa8255p. Similarly to what has been done
> > for I2C [1], this is a separate binding.
> >
> > Patch 2 adds the driver change, which is based on a public vendor
> > patch from qualcomm [2].
> > I did the following changes on top of that:
> > * Use devm_add_action_or_reset() for dev_pm_domain_detach_list() instead
> >   of implementing a driver .remove()
> > * Changed power domain names to drop 'usb_' prefix
> > * Fixed various error handling paths
> > * Added suspend/resume support
> >
> > This has been tested on next-20260728 with a Ride4 SA8775P board that
> > has SCMI firmware (which is compatible).
> >
> > [1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
> > [2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0014-PENDING-phy-qcom-snps-femto-v2-Add-support-for-SA825.patch
> >
> > Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> 
> I don't know what happened but somehow I did not add you in To/Cc using
> "b4 prep -c"
>

No worries.
 
> I've talked to Vinod at plumbers and he told me that I should request
> some review on these phy patches.
> 
> Could you have a look whenever you have some time?
> 

Sure thing. This series is on my queue. Will get to it very soon.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
