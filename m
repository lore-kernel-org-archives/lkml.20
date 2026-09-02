Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEE94AA57C;
	Wed,  2 Sep 2026 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368008; cv=none; b=cgduXVIq2TlwYHpNrcZSC4cpdkuWRTJJwPf6weiMm6XqJrJCDuFUVn8gvBRrdOeLlicM0Q48ztZTaqK3a0dB5KxT0YUcM4ZlG8MLjw2c1Vh2DYAQ/OfxrYyFjsoxx7mJvGkyMtqqxF/YxnXxvjrRbi2TwNDHPkxQlPAigHW/PWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368008; c=relaxed/simple;
	bh=FXkZjsJhuvfGXBfa9R30mQd/k9rDt2tsr32CYL2l64A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G336QbR0gw9Ix8ay4nkjxyvzZoPdVAQQj3NH+HfaOZR6444P2A6fWYm9Xvtv5GlprJajETCWWdobV8ZHtjEihW5dro6FCYDMZGawHH11IEpMLorEtzqxB7DFnPmXLTuCmgR/yKO+y9Qeb4fSOY/8wcqGvAs4gd/yh6b8EBkPjiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsY5WB9E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsY5WB9E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4541F000E9;
	Wed,  2 Sep 2026 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788368006;
	bh=64+KUYqu36wvmy3WR4R0FjJSpd47FyPOdY1dF3w2Yho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NsY5WB9EKQyvyik+bLrvu6FXRYRR+DThdtHC/Y2amTOH3ipSG73QmWOh+QkARCmPT
	 GeS1ZzsawmrfbrgXQXdpngnHeOD1X70hPEQ6akf7GKoHOiL3wsFDsrZ/Lqelg0i7lG
	 +aj9Xsw5nbJWZ+B2hQL/7bOEqNzoE72g4GSrd/EqgseE42I19U2HjAAhdPa1CvtLSM
	 ovsirqfSq5l7TE8Mp+coZ//W1cIfoYFE8a/TCE+etkDZkOqSbpYqM1ZvXO+gnMeYjR
	 y+nculeo18NrDaMfTN6tdbQj/6VssFJ5bRNIZA6fvkdR+ohOqAFqua0Z8E6AvnVJkd
	 CdchACUWbmbMg==
Date: Wed, 2 Sep 2026 11:53:25 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qcs6490-rb3gen2: use pci for
 device nodes
Message-ID: <20260902165325.GA1440252-robh@kernel.org>
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-2-elder@riscstar.com>
 <CAL_JsqJJPdrYArNhbRPTM=scDghLAWe5=0a2+ACNaHe07h6-tw@mail.gmail.com>
 <d9071ec7-371f-4896-a023-77a07f01f65e@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9071ec7-371f-4896-a023-77a07f01f65e@riscstar.com>

On Wed, Sep 02, 2026 at 07:51:54AM -0500, Alex Elder wrote:
> On 9/1/26 3:05 PM, Rob Herring wrote:
> > On Tue, Sep 1, 2026 at 12:21 PM Alex Elder <elder@riscstar.com> wrote:
> > > 
> > > A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
> > > be treated by the devicetree code as PCI buses, which is incorrect.
> > > 
> > > An RB3gen2 system has an "interposer board" that contains a TC9564
> > > SoC.  The TC9564 includes a PCIe switch with one upstream port and
> > > two downstream (external) ports, plus a third downstream port.  The
> > > third port has an embedded PCIe endpoint with two functions, each
> > > providing access to a 10 Gbps capable Ethernet interface.
> > > 
> > > The devicetree nodes representing these functions were previously
> > > named "pci@" but were renamed in the interest of consistency in
> > > commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").
> > > 
> > > Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
> > > treated as PCI bridges, which PCI endpoints are not.  The previous
> > > name "pci" matched such nodes as "default-flags" bus type, defined
> > > in the of_busses[] array.
> > > 
> > > Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
> > > bridge nodes by the devicetree parsing code.  This restores the
> > > previous behavior, and allows them to be used for PCI endpoint bus.
> > > 
> > > Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > index a13315bf0fb07..99a985a177a61 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > @@ -954,7 +954,7 @@ pcie@3,0 {
> > >                          ranges;
> > >                          bus-range = <0x5 0xff>;
> > > 
> > > -                       pcie@0,0 {
> > > +                       pci@0,0 {
> > 
> > The kernel should treat either name the same. There may have been some
> > reason 'pci' was not included in checks. It could have been that only
> > old things are (parallel, plain) 'pci' and anything new is 'pcie'.
> 
> OK.  Does this mean "pci@" and "pcie@" should only represent bridge
> devices?  (These devices are all endpoints and erroneously had
> device_type = "pci" properties, among other things, so I'm already
> fixing that.)

Yes.

> Do you want me to make a (separate) change to treat "pci" the
> same as "pcie"?

Only if it fixes something besides consistency.

> > These are ethernet devices, right? Then the right name is
> > 'ethernet@0,0'. If not, then pick something that matches what the node
> > is. Both pci and pcie mean the node implements a PCI bus.
> 
> They implement Ethernet devices, yes.  But they are used for
> pci-ep-bus (and the Ethernet devices bind to a sub-node), and
> that's what's important about these nodes.  What's the right
> name?  The dynamically-generated node uses "dev@".

I don't love 'dev', but don't have a better suggestion for it.

> 
> Is "ethernet@" still right, if it's also used to access a
> clock and a reset and ... via pci-ep-bus?

"ethernet@" belongs on the node that has ethernet-controller.yaml schema 
applied.

> 
> I want to use the right name, I'm just unsure about what that
> is, given its use for access via pci-ep-bus.

I don't know if there's a right name here. You just can't use a standard 
name if the node doesn't implement what the standard name defines. 
Granted we just have a list in the spec and some names (e.g. pci) imply 
more that other names.

Rob
