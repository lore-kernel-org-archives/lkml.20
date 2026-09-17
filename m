Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F58318EC7;
	Thu, 17 Sep 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664438; cv=none; b=NWXyado3a7SnTHYBnQmGdiBxehTYQ8YfVvM1H4mw4dpdkbE56I6oc+yZdgo0no6lzrZ9+nRGqLmT5IkG0Yq5daIyku4ekOKS62cyu2KMwFN7OBREzhmwHIE6F6cISpyMZEgK4+cq8OPfpAQpjGAqqTAuV5B6SlO0jIP1OoYF+3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664438; c=relaxed/simple;
	bh=mNvMcqpI1Z7+mxUvi5cAUusbvx+X+P5nbmchktaqRAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdyg7VvN4mjgOyxV4LvEprJqml+YkFwpTbMZNUxKiQ/j9uttRehzHFEapCaZrLmmiVDCeF5iwhkqEOoLaAIEGwVrtF0A7VlYuSwJNwIds1qVzPFbXa4EvweY71vdKqSnr3NfsaoCnUGPyk4sG44YXUVPr/u65xXYTzHpcP6cmX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=0C8myMUz; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="0C8myMUz"
Received: from francesco-nb (unknown [178.197.222.34])
	by mail11.truemail.it (Postfix) with ESMTPA id D37761F81F;
	Thu, 17 Sep 2026 19:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789664432;
	bh=WJB4/M6PcBSGQIQbVbWuwScsUxZylXwtKq33s3tug4I=; h=From:To:Subject;
	b=0C8myMUzp0uN4t4xtVEJhAB+zL2aVucmlEetjYJl7CCFZ/EWhET5kRM0tRRNKzXGa
	 bWZ+527oiSifcyt85FaXsTo36iWpEFWBTX6begY0z3ll6RuEnBifhZiisgHfycEE7w
	 gZ69oZPMUIIRSPTWTBtbD36rGvdXgCdcEEuONY/g5/yCLNvsaFc9lqK4Ne5rq448xS
	 sF9V0qnJsaNIm+iqkqQooeVhrLW2PJjcy8IjnzJPqsu+tO2izztcriCAg/Ilobx30x
	 4BTkYula8k3H3r749g4TXSeLoYOPXTYVr+HPQgS/8/7e04kcOZ1CVnRY0MncqOLMe1
	 rIbLCoMfojxAg==
Date: Thu, 17 Sep 2026 19:00:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <20260917170027.GA6655@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <aqQQjCW1xaGfPdss@SMW015318>
 <20260914054214.GA19835@francesco-nb>
 <aqgEfRl9INLZ-DWM@SMW015318>
 <aqgGgxzqiIbF66DX@francesco-nb>
 <20260917140836.GA119572@francesco-nb>
 <aqwMib54h5ys5HZL@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqwMib54h5ys5HZL@SMW015318>

Hello Frank,

On Thu, Sep 17, 2026 at 10:51:37AM -0500, Frank Li wrote:
> On Thu, Sep 17, 2026 at 04:08:36PM +0200, Francesco Dolcini wrote:
> > On Mon, Sep 14, 2026 at 04:36:51PM +0200, Francesco Dolcini wrote:
> > > On Mon, Sep 14, 2026 at 09:28:13AM -0500, Frank Li wrote:
> > > > On Mon, Sep 14, 2026 at 07:42:14AM +0200, Francesco Dolcini wrote:
> > > > > On Fri, Sep 11, 2026 at 09:30:36AM -0500, Frank Li wrote:
> > > > > > On Fri, Sep 11, 2026 at 11:19:46AM +0200, Francesco Dolcini wrote:
> > > > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > > >
> > > > > > > Add support for the Lino iMX93 SoM, its Verdin adapter and development
> > > > > > > carrier board.
> > > > > > >
> > > > > > > The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
> > > > > > > the same PCB (the two chips are pin to pin compatible), to avoid
> > > > > > > duplication create a common dtsi to share commonalities.

[...]

> > > > > Is this blocking this from being picked up?
> > > > > Is there any other concern on this series?
> > >
> > > Can you answer these two questions?
> >
> > Please let me know if it is a requirement to have the gpio line names
> > wrapped with 4 elements per row or not. I am waiting on your answer on
> > this.
> 
> Although it is not "must" requirement, I think it is easy to read by
> packed 4 elements.

Thanks for the reply. Given this comment and the disagreement we have on
the read-ability I do not plan to change anything in this patch series.

Let me know if any other issue is present or if anything changes on this
specific regard.

Thanks,
Francesco


