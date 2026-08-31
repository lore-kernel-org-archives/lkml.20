Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A094248CE;
	Mon, 31 Aug 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188687; cv=none; b=LOMrDtNubg0dwi7R4meUDAeLTdR+/L+YMzfAl2eBJdC5vG59k0DhaxROHSaW59zZSjVrgbhqH7iqnA2418+QYVTMRjGz4XU/U0xelVKyDFXk4l8EBcWdEVc04CXimHTCcFQ58wMNhN8YIFpomO7Rd5jvfdfXAFlnEoRZKcdCmeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188687; c=relaxed/simple;
	bh=Px5OnhEPH4u9m174LfN1X9dhwlp1lqkV1oJEZe0A7WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZqe/gOE9AoFtC8UxpqF56rTLO9dXE71DGqfVMAYb5mKAzNNSWHiX6TmkvNXUxB/WNQd5ZyXdRMGgGUymKL5lFqjWCkWg+ILW/kRLQ2SWwrkqN/1H4haXfig2C8K4oIlMhMjA3JAlsPxYYPe3WAgov5KRH370iZNfh5ZbpOS1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpI4OyX2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpI4OyX2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FA01F00A3D;
	Mon, 31 Aug 2026 15:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188686;
	bh=RPyUwW1CQd8vInWpMnkEtoPGh3xxCFkavStmBuMIPA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UpI4OyX2b3cKFsaLVoyhFzFwQYV91/zjr6HWXwTP59FkbLSlgSyZBTT+2xUfZFRRQ
	 VT48BaSxhl3sJg9e1P5GfFiXfXwyK0LvpyPOsc+u8WYP60X2Q1Zro3XwcC0RKgPCfS
	 JMl7+rUE3YL/Ud/MFRHRVXW835hdxHHWu1fs7SS0vy4JoRqGgCgpQeyTGAUekrdD2h
	 e9rxMfsM0ZRmYfylYY1Rj9Vs5Y5S1tA3EVoa635J3LP5zTF6zKBETTJVjLy9iet718
	 czWfwyaKdoVxd73pOmp/8iPawmZZSqDnubkk6hUw27Jiu5hK5wTlNs08GARr4PGjGl
	 nBI32XVqU1Nrg==
Date: Mon, 31 Aug 2026 10:04:41 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Konstantin Shabanov <mail@etehtsea.me>, 
	Srinivas Kandagatla <srini@kernel.org>, Georg Gottleuber <ggo@tuxedocomputers.com>, 
	Ettore Chimenti <ettore.chimenti@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/9] arm64: dts: qcom: hamoa: Mark the EC reset gpio as
 reserved on all boards
Message-ID: <apWXm0imLullON9E@baldur>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
 <izyaid2v5jpp3m4ope5lpk7j77bq2jlzneusfztawhnrc3ydub@mww3imhbgv7r>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <izyaid2v5jpp3m4ope5lpk7j77bq2jlzneusfztawhnrc3ydub@mww3imhbgv7r>

On Mon, Aug 31, 2026 at 01:12:38PM +0300, Abel Vesa wrote:
> On 26-08-31 12:54:40, Abel Vesa wrote:
> > GPIO 65 from TLMM is used by the embedded controller as its reset line on
> > these boards. Reserve it to prevent Linux from requesting or reconfiguring it.
> > 
> > I was only able to confirm that this GPIO is actually connected to the
> > EC reset on the CRD, QCP, xps13 and t14s. But it seems like it is
> > recurring them shared between all Hamoa based devices, so I reserved it
> > on all.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Abel Vesa (9):
> >       arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
> >       arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
> >       arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
> >       arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
> >       arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
> >       arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
> >       arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
> >       arm64: dts: qcom: microsoft-romulus: Mark the EC reset gpio as reserved
> >       arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
> > 
> >  arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
> >  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
> >  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
> >  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
> >  arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
> >  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
> >  arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
> >  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 1 +
> >  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
> >  9 files changed, 11 insertions(+), 2 deletions(-)
> 
> Urgh, just realized that there way more that need to be addressed.
> 

I'm not able to guess what you're referring to here. More devices or
more problems to fix? If more devices, why would that warrant a v2?

> Will do that in v2, after I get some reviews.

Regards,
Bjorn
