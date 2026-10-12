Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B83AAF5C;
	Mon, 12 Oct 2026 09:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798234; cv=none; b=Zo02MiRMKSDKo2whvicsj9fWDCo6Y7Au1dADiaF2DZaclA004lCdTumhg4wpRP1HeA3a0oqq+dml+V703Co6eSTJrj3msbEUGtTFBwGKPXk9b9213xiYE7cjrdYBlU6x/bicTep66u6A3ZafvwKgyWqVfSv8j8gHTaCIyQ7uuy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798234; c=relaxed/simple;
	bh=VIMNNJNGn25Dr7GqLIZip7ZIs8se4jphDPs2Kc9ADf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DadcOd+OJtTmrEI+vTXOm165DB5eaT9CaY7/RewOdoqI2zS39blH7MGYFpDkEtGGgEsu5ynSkTVJb5Qg8Vhze1xQVMio4Eo2BB83sNn+fAuOX+Ot/XZbGGwuWiQHaFTw109f0BsC3pDD6/Z/3RRfGH0JCkCyFlLsm0HUnf+RHf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvQ3uqex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvQ3uqex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A101F0089B;
	Mon, 12 Oct 2026 09:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798233;
	bh=n8g3m07kswQUB2aEv58Z2fxCH8Bc2AGaIzxQdV0JnjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VvQ3uqexE/Ntit4Uo3Vnyg1hfJ5wxdiRHSmkrQz2UynJivsnVns11WZvmUtdFQ+Np
	 vUZms2MpfqdwiihALNylI7gBnQTtYqomf0s4nk9GNPPpWxLzNEQ+uKoX1kmdD/Wz7x
	 HW8OL9GhTXSMosGLbjUQjO6ff1Iu6loj56wKj8lyybKhGOjVzh4+yPQ7WDkAdhPhtP
	 sm8dS4tSZL8Zhe3PsLI2/i0H1mwr359RzrwTlwKwOc2+L+C1lMAnEfDi9xCKMejdGP
	 oEAJKfI9cm3VlT2tfIBYBOEx5BbO1LIdLTiTEarIzuNRfYTBxEVGLXJJbArYMhF5Ts
	 PjH/vNLgk6Hlg==
Date: Mon, 12 Oct 2026 15:13:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: ivaylo <ivo.ivanov.ivanov1@gmail.com>, vkoul@kernel.org, 
	neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] phy: phy-snps-eusb2: fix FSEL_48_MHZ_VAL definition
Message-ID: <asyrexEOKzZkoD23@debian>
References: <20260908085953.3315953-1-xu.yang_2@oss.nxp.com>
 <aaf8a5ef-2abe-4269-804e-4d2dd1bc4d3e@gmail.com>
 <ogfpkqixf3xkyvh4bbpvui5ybfaro6g35g6u5kb56k2jsyrsmt@jm67at6cpksf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ogfpkqixf3xkyvh4bbpvui5ybfaro6g35g6u5kb56k2jsyrsmt@jm67at6cpksf>

On Wed, Sep 09, 2026 at 10:49:41AM +0800, Xu Yang wrote:
> On Tue, Sep 08, 2026 at 04:17:57PM +0400, ivaylo wrote:
> > On 8.09.26 12:59, Xu Yang wrote:
> > > From: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > According to Synopsys eUSB2 PHY Databook, FSEL_48_MHZ_VAL should be 0x6
> > > for supported 48 MHz reference clock.
> > 
> > I don't see this as a justified change. Samsung's implementation of eUSB2
> > differs from the generic Synopsys interface, as is visible from the
> > differences
> > between QCOM's implementation and Samsung's.
> > 
> > From what I see for exynos2200, the FSEL value is 0x2 for both 24 MHz and
> > 48 MHz. The differentiating part is that the upper PLL divider is 0x0 for 24
> > MHz
> > and 0x1 for 48 MHz. The current programming was taken from the samsung\
> 
> For Product Code H483-0, it's 0x2 for 24 MHz and 0x6 for 48 MHz. The PLL divider
> is 0x0 for 24 MHz and 0x1 for 48 MHz too. So it does seem like something mismatch
> in your side. Because the FSEL_*_MHZ_VAL is common definition in the driver, this
> means FSEL_48_MHZ_VAL is not common anymore. But if you have confirmed it's simply
> like that, it's fine. Others need to add their specific definition in the future.
> 

If the values differ between vendor implementations, then please deal with it
using compatible check or drvdata.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
