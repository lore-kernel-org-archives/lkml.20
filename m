Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84803B2FF8;
	Tue,  1 Sep 2026 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271475; cv=none; b=vD25xuzf/f+nPrYQs75l9SrrIR2af4jjm/84RWLl18kSsnoHyltopHFN+afAC4YANqgscsxkp83PJdeHFHhStzHqur6Zf2uP3Qgpvfg8NePoG44pt+tQtfPhGcZZRAQe0J0kW7yFagUCGw4Rm03gF0hP6rQuQM5Cc2f712qWK7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271475; c=relaxed/simple;
	bh=rlF8ojePEJrleRDwWfsbUwubkFGuPtMA+qj/EFa5RXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0W1Q7YUay4XRGAS781vnhvipVr7gGX2xCvohXCCCjTMjq0R7DMwAFh34iwxPfPmRMk8dCf40seamrXk0ES+m7bRgXKNCUXGc8btkdzvr4DDnjA4FPiFfnVA5rKtgKqxP+F5YHtId6bF9Zpch3zeBbKE0oy3P5UTe1q/7hWK2+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS7Vdfn+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS7Vdfn+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB571F01559;
	Tue,  1 Sep 2026 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271474;
	bh=PKWhKoY3dsr3R8e8ZzeesufclzbVL0D+O9N4G30TkCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cS7Vdfn+Z+Dl8XQDollKPQuL1NWlUhxY/7OkqWhP7SdRFeCis/8eGeLnbUBB8KH/N
	 0xvFeeEdb4d/NQLMUIUKVu38CTZAJAAMRds73fshrQFhrm+cljGrB+LuKwI4AXFioC
	 f/k6PdZ0atmHPQP0ClTTTNRFBNDU1UzsoyrJiEX1BTuY9fVUDJ4dJF0la4dvcAqi6B
	 dI4N/tmoaJvOrQmXOHQlJU0llXC2iILRH3AbEbKlUWqvvoR4uFL0OEokXxUh+aFXNu
	 hB2191TKrbJbel0R+fTHWGr+aPQmBd+vAmuRX2mmHCNy7B8p4YZO1cjerubB6JriRN
	 8zgS3Y6W6YwMg==
Date: Tue, 1 Sep 2026 09:04:33 -0500
From: Rob Herring <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	=?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] arm64: dts: imx8mp-skov: add new 7" variant
Message-ID: <20260901140433.GC1244140-robh@kernel.org>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
 <20260831182243.GA955466-robh@kernel.org>
 <87o6ehjth8.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6ehjth8.fsf@pengutronix.de>

On Tue, Sep 01, 2026 at 09:55:47AM +0200, Steffen Trumtrar wrote:
> On 2026-08-31 at 13:22 -05, Rob Herring <robh@kernel.org> wrote:
> 
> > On Mon, Aug 31, 2026 at 10:17:37AM +0200, Steffen Trumtrar wrote:
> > > Add a new board variant for the Skov i.MX8MP based family of boards.
> > > > This variant uses a different 7" panel than the existing ones.
> > 
> > The sashiko issue needs to be addressed.
> 
> I'm not 100% sure what would be the correct solution for this case.
> 
> Would it be valid when the *.dtso just drop the "skov,imx8mp-skov-revc-touch"?
> The generic compatible is not really needed, but the base DTS wouldn't have a compatible otherwise.
> 
> Or do I have to change the binding, so that 3 entries are valid for the skov,imx8mp-skov-recv-* and keep the hierarchy (although unused)?

You have to pass schema validation on the base DT and base+overlay(s) 
DT.

Rob
