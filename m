Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6747D460;
	Mon,  5 Oct 2026 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205483; cv=none; b=ICFNrQRHtA8fNjaZXlErhsjl9cZGVTyliQkVrEaVSRi1OAd6Cfh/eqtsIS6mQaaRr9SL9D1cGW5CJfVttIR7aFAoccqBP1fmptpEEwvViRJGaJWnRGnwGubQ2wBq9TdZergTJgrzO4vlUNpENKkBENEArPRMNdqNlgBsErGa5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205483; c=relaxed/simple;
	bh=yWUXsgCjz+XF2N2qt5x2pO41EUFImv3SDJpW7U+9ZkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Os049W/NZxZ6ErEbaIQR6Xh0ijGp2AUIhg5K4sx4gNlACHmyZGW3luhpY28hjBnyB6O2tzlVq4wi4Iu0bxxiXoFfIaY7X4emdZqq4Ldd93gqrwPTtrSAKuxIfCOGjLYhlIMZOyaCipEKxh8dKbPIYNwe54QFfCCI8XpTCCbh32M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJCvdyCU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJCvdyCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8827F1F000FF;
	Mon,  5 Oct 2026 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791205482;
	bh=SvZ50MTxf86/y2/B3yqMvVurhcL2GyUlrbK2UslfeeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LJCvdyCUPjlrmlwV0tjAkLQ5qLBUHdhaSyfE0ePObjEFGIDCzqWttFxs1AwA9jnsP
	 aHPe3nss8BfwJOmE2xIgnrtGjO5bYPE1ioqPA2ad8IGsbJVpKKByfRtW2kkrpp/tyw
	 21qWP7C6H4sfLeNa9VTTXjhfqbQubT7y8uz/JETMXgcldRgiyNwRji7X5EpqteVW5q
	 nETriVMheB9tLBUMqhtq+PWzaLB6Aq7uHxUzHmYhg2UGNtdxvTxxwV0EBqXJJc4HpY
	 EOp4Y2Xyfe/7FgLfnSug7TYOxlC8+NUTZmOBSySRtwwg9G8DlyAweR0vEkJAl40H3Z
	 bVYeRdVdd9mJg==
Date: Mon, 5 Oct 2026 15:04:38 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Manu Gautam <mgautam@codeaurora.org>,
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <pza@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Message-ID: <asOgZrVX7ANq2h3W@parshuram>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
 <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
 <asN/uLBfYARYXlhb@hu-varada-blr.qualcomm.com>
 <lfs76pvsdpkkle3b75m2ez75x25xjqjkgbw6kkaf7rxqrc2plz@7sekrxlnqcus>
 <asONJKiT8pbIulWj@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asONJKiT8pbIulWj@hu-varada-blr.qualcomm.com>

On 05-10-26, 17:12, Varadarajan Narayanan wrote:
> On Mon, Oct 05, 2026 at 02:01:48PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Oct 05, 2026 at 04:15:12PM +0530, Varadarajan Narayanan wrote:
> > > On Mon, Oct 05, 2026 at 10:17:32AM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> > > > > Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> > > > > on this SoC require a dedicated init sequence and override parameters
> > > > > before they can be enabled.
> > > > >
> > > > > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
> > > > >  1 file changed, 62 insertions(+)
> > > > >
> > > > > diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > > index b6bbf2b570c7..8957f208bc51 100644
> > > > > --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > > +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> > > > > @@ -29,12 +29,15 @@
> > > > >
> > > > >  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
> > > > >  #define POR					BIT(1)
> > > > > +#define ATERESET				BIT(0)
> > > > >
> > > > >  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> > > > >  #define SIDDQ					BIT(2)
> > > > >  #define RETENABLEN				BIT(3)
> > > > >  #define FSEL_MASK				GENMASK(6, 4)
> > > > >  #define FSEL_DEFAULT				(0x3 << 4)
> > > > > +#define FSEL_24MHZ				(0x2 << 4)
> > > >
> > > > Use FIELD_PREP, please.
> > >
> > > Not able to use FIELD_PREP, getting this compilation error.
> >
> > Sorry. Does FIELD_PREP_CONST work?
> 
> Yes. Will post a new version...

Yes we have const version, there is also GENMASK and friends..

-- 
~Vinod
