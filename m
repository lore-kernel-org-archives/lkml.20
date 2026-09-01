Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CF53AEF4E;
	Tue,  1 Sep 2026 01:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226913; cv=none; b=ZUWHhEypgDnhNmzwQPv7Vw6dssYc/K5Jq69ToNunojAzH0RpZv+rtV8eWS6XO8GdFci8mbwMFLwdMkiBK6QVeISiKcnHi1jwDAKMO5SOpm+Lcg453kco6yZLBreuCf4a6DQOay8MYu3pA5uK55nwxEVJ18dCMKXMRrvCj6i8V7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226913; c=relaxed/simple;
	bh=LrCiT++5mOcKya2DAeDChXnaTBQgsAMo7COwSF6jtc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvfptSia0GWvD55iU+3xVm60d/AJkQD/PZfLh8ba76dwOj5jRTg3B4pcDMh6O6hAPg9L/oi6vxfFz+ibQ06o5EaH4WTfzuhtfAVTSzmFQjO2YY8k1i3tY3sG2gyMoGAnjhp7XFTdPUkWuahq8XnAgGxKtXyY+/cErxeUNiW/G7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMsEtGDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMsEtGDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71621F000E9;
	Tue,  1 Sep 2026 01:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788226910;
	bh=4tccQKCY16goyGLzWPSUt/pWN4uDuOLuqyh4DGb8V+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DMsEtGDCZ9yp0FwxeMPBf68ttCxiQ84jZ3GrvQ9CEo6Wa7QlnchLpitCpQPi/evLb
	 ekUtzpIcEoqLFDd8FG9WCXoNzt9+XnqxCOsTZNt3NSNLZh4aCNGz1CGITPD/NEY5qA
	 UCQULaqBEpsi0TL5KIue5IIGf2wk11bnKCyAuprLgYWl/PRWoawkEX+RdgMfiEdUI7
	 PdcawhKQ6PC23Q3OE9RIeHy7xDxh6eQosnzIuu/mIxVlVOdrGZPkdVqwfUni/cIGL3
	 SbWK+FX1VnaavdjaptJyjB8uct6ojXqsExApTmKjRVW0KT5JPDhe5InPuyWYTSpYd8
	 hefBWWDnMmylQ==
Date: Mon, 31 Aug 2026 20:41:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: david@ixit.cz, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Message-ID: <apYtQQkrZB5gHqJy@baldur>
References: <20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz>
 <20260721-pixel3-camera-v7-1-82d323c6c5d2@ixit.cz>
 <a5d6f840-3849-464d-a540-634dc3ec81b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5d6f840-3849-464d-a540-634dc3ec81b7@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 02:36:49PM +0200, Konrad Dybcio wrote:
> On 7/21/26 2:33 PM, David Heidelberg via B4 Relay wrote:
> > From: David Heidelberg <david@ixit.cz>
> > 
> > The Pixel 3 features two front-facing Sony IMX355 sensors with
> > different focal lengths (standard and wide-angle).
> > 
> > Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> > I2C1, using MCLK2 as the clock source.
> > 
> > This enables support for the dual front camera configuration.
> > 
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 172 ++++++++++++++++++++-
> >  1 file changed, 171 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> > index 9368fd6b87515..c8a28133fb38d 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> > @@ -1,16 +1,18 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  
> >  /dts-v1/;
> >  
> >  #include <dt-bindings/arm/qcom,ids.h>
> >  #include <dt-bindings/dma/qcom-gpi.h>
> >  #include <dt-bindings/input/linux-event-codes.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/media/video-interfaces.h>
> > +#include <dt-bindings/media/video-interface-devices.h>
> 
> These should be flipped to be sorted.. if you smile very nicely,
> Bjorn could prob fix it up
> 

Sure can do, but I don't have dt-bindings/media/video-interface-devices.h :(

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
