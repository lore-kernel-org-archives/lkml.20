Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566736;
	b=y7XcO3nXE+BBFgDFKghfU91jVFwd4lc70H0+m2dyz+3Ng0eXhwTgrK6PDz7rhumbKkOn
	 F7MPw1Hlf8X9GAiWCxlyL3QEeKNMLJSaIM4sVHJlgyb3Or5eZHORpDq6GOCbzSzrlqRVc
	 vto4SmlAhMl3DVXxb9Rmr80ka+GIpNMk2KjQmBLcIgVAR/1sWzY8FMetTAmdM7k8hl9tR
	 S4JluZ7fEKaCRHVIAKMxHDuVHOVIhg3g3jVnboKugYOfcFD8x9ZBLVhI9PpLeHOi96o1V
	 0oarn7V0ylw+t8rhpD3wtPMRcp8inpR049sKuFdaCyZlys0QrQOLRrIt02SdrYFIlew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566736;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/lmJpY+0emLtc/FMs83OpIAUz2pOnrJhQvermvaeEng=;
	b=cItWoGr1fCvk1lfHM6pQCs4yh6JSBoNBrEGyDE5uLJ/C8Ht+XWnVCcqWSrTyiI+6cBP2
	 JjGw+cVlRyWo3Gwen9XAmqZqlZN9zBsHxR5nmqqq3kiJ8Bk1ELtAvk26FS6iaVdFMikcd
	 gIvhetYUKR48B7Tu8Ni8oeuAedTX1hPH+07MkhaW7zRXNbJnRfEpfnFBYJEODTJ+8c8G6
	 okDoc6kTZfkDINzmP/q65Hdj9m0aSxOCLKkfk8LZit5camWCRdKTMFfxmkYQtA12lh59g
	 6ASvW4gF5rts3umLHv6vUKlPnJepKSgw/u1lizNronpbFmsGUjyR/8Bz3dba/gYfS2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=inTfj1+G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id A22F9606A31C;
	Fri, 13 Nov 2026 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=inTfj1+G
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 728041F000C4;
	Fri, 13 Nov 2026 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794566736;
	bh=/lmJpY+0emLtc/FMs83OpIAUz2pOnrJhQvermvaeEng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=inTfj1+G4YceWRniGOmdTI+A4byhwQyzmkCyVqklp9H3HZL7udVWTB/0jl4shpfJm
	 a7xoRddKBH9PN/7VEcE48mkGxZRqZeKlh1bFl9NKxp04ThHWdaJrs0vftnksSBTJwc
	 0XDBVFrD2zE5ztHKIqBaAlZdXBbjAl0B70MeU9GAawdxi3vtoYEmpductuScmpX/ha
	 E+RvTin9OLADrxrm3IRW85W003jKPfDiQlQSHsxAcqvMjI4sD6bwDckOtaUyg+u5J5
	 MyVUFAGTwB0VlniMcMWQReUlXEdSkGN15dnGwcbVmxud1fTMnuzdcTt8VWAD5+zu1e
	 YH6cD1BXseTUw==
Date: Fri, 13 Nov 2026 11:45:32 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add the cfg_ahb clock for Nord
Message-ID: <zo5qopdc6gxeoonqxohmnrzwmmrwa3wnim72op5zq2cjtn4pjs@kdjl3hwgxph3>
References: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
 <20261112-qcom-nord-ahb2phy-clk-v2-1-30ad3d947217@oss.qualcomm.com>
 <20261113-influential-lumpy-goose-68ec0f@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-influential-lumpy-goose-68ec0f@quoll>

On Fri, Nov 13, 2026 at 11:07:38AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 12, 2026 at 04:36:38PM +0100, Bartosz Golaszewski wrote:
> >  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > index 13e64fe510b8f..8d09e6937fef0 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> > @@ -209,11 +209,13 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - qcom,nord-qmp-usb3-dp-phy
> >                - qcom,sc7180-qmp-usb3-dp-phy
> >                - qcom,sdm845-qmp-usb3-dp-phy
> >      then:
> >        properties:
> >          clocks:
> > +          minItems: 5
> >            maxItems: 5
> >          clock-names:
> >            items:
> > @@ -229,6 +231,7 @@ allOf:
> >            compatible:
> >              contains:
> >                enum:
> > +                - qcom,nord-qmp-usb3-dp-phy
> 
> I don't understand why it is added to two blocks constraining clocks.
> Does it even pass checks?
>

Yes, it passes dtbs_check in my WiP branch for USB nodes that will be
sent as v4 and takes the binding changes into account.

First we add the "qcom,nord-qmp-usb3-dp-phy" to the if block that sets
minItems to 5. Then we exclude that compatible in the block that does an
if not and sets minItems: 4 for all non-matching compatibles. This is in
line with what's being done for existing "qcom,sc7180-qmp-usb3-dp-phy"
and "qcom,sdm845-qmp-usb3-dp-phy" compatibles.

Bart
