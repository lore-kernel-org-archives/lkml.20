Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC103C9896;
	Tue, 29 Sep 2026 03:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651136; cv=none; b=X2rmtvS8SZeoEctjOn50Vqp2nDCbB7+OOW1ebl5lIl70+LtzGOQ2c49z/BjuZ6uZUknS+hwJRmCO5a3RCU5uhx4tX9FZ5ITUynwmw0U5BHcLhStO06+4tdQZUe44ETAWEE+HKeNL0SCtkWFfNgTz5XEWGliWkfikKQ29aQKpoas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651136; c=relaxed/simple;
	bh=UTyaWHrrtgUu29EL2bxdQPs3r+p8tFUZWrk6ieq8R+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Be29gxXD4oDyApWRL2Mr29L63gRH/Cog54ioPMFZxWaFEdcm6eRXzvfq7rfJxveZ4Nt+AfQb8fKJHIB4Si7WXVC/zAZBaUdtzn4ul+RtZM4JwHaGn//AIp2NkKYBgfX8dnI9wbumvQunjulcwIAqTubqyO10v/Ahxaqpv8J/3Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jst1H8Fl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jst1H8Fl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02801F000FF;
	Tue, 29 Sep 2026 03:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651124;
	bh=wN+dPoLvjUdzOubg5yOWipnDclWmGuYXl68rAIhKrs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jst1H8Flgrq1+3nX9cUs/Aj2g5l1buTMNHfcFzX475/4uSQnhnpl8JYBuVziWVXE2
	 THMV0ldE2MRJM/kyCwxqk+V/YJTo8ezuL2Rh9tmTwE1e49+r+/8ufM5VC2ZNhBxLEG
	 Iev6mnmci3c4XW0dcsJLjkcPWRChoKLM4NO0Lo/ixQaGBHsro9ias5+eqTmHd4FlqF
	 ejV0c5IJ4WMae+jxu/Z7leYRqEmNA0ewtlXfux6XcwX1Rou6PPhdvx+ilXmjXYK2o+
	 4QEDHHScBOP0F94JGS5Tcnyb3TqhTRSTLgAGHWhCoMDwEDbHwby3oKnO/tkKI8GyR+
	 rJ8zuNiPgPSDg==
Date: Mon, 28 Sep 2026 22:05:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel
 overlays for Monaco/Lemans EVK
Message-ID: <arsp-8KPqD_skD5D@zenbook>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <aqLGFfQ20mCGFkfl@baldur>
 <aqt72zoSNVGrcY9t@hu-ssmaurya-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqt72zoSNVGrcY9t@hu-ssmaurya-hyd.qualcomm.com>

On Thu, Sep 17, 2026 at 11:04:19AM +0530, Shashank Maurya wrote:
> On Thu, Sep 10, 2026 at 02:35:41PM -0500, Bjorn Andersson wrote:
> > On Mon, Sep 07, 2026 at 12:03:52PM +0530, Shashank Maurya wrote:
> > > Add device tree overlays to enable support for the Raspberry Pi 7-inch
> > > DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.
> > > 
> > > The overlays configure the panel on the primary DSI interface using
> > > a 2-lane DSI connection and instantiate the panel MCU on the
> > > corresponding touchscreen I2C bus for each platform. The changes
> > > allow the Raspberry Pi 7-inch display to be used as an external
> > > display option on both EVKs without affecting the default platform
> > > configuration.
> > > 
> > > ---
> > > To: Bjorn Andersson <andersson@kernel.org>
> > > To: Konrad Dybcio <konradybcio@kernel.org>
> > > To: Rob Herring <robh@kernel.org>
> > > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > To: Conor Dooley <conor+dt@kernel.org>
> > > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: linux-rpi-kernel@lists.infradead.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > 
> > > ---
> > > Shashank Maurya (2):
> > >       arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > >       arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > > 
> > >  arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
> > >  .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
> > >  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
> > >  3 files changed, 169 insertions(+)
> > > ---
> > > base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
> > > change-id: 20260907-rpi_dts_overlay-58088ffce047
> > > prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
> > 
> > The two dts patches in this series clearly relates to those two
> > regulator patches, which has received change requests.
> > 
> > I would have sent the 4 patches together in a series, but as you didn't
> > you sent this series with unmet dependencies.
> > 
> > All I can do now is reject this series as well. Please send v2 once the
> > driver changes has been merged and you have validated this again.
> > 
> > Regards,
> > Bjorn
> > 
> > > prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
> > > prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9
> > > 
> > > Best regards,
> > > --  
> > > Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > > 
> 
> Hi Bjorn,
> 
> Thanks for the review.
> 
> The regulator patches and DTS patches are targeting different maintainer trees 
> and therefore were developed and submitted from separate workspaces. While the
> DTS changes depend on the regulator updates, the two sets of patches cannot 
> realistically be carried in a single series because they are reviewed and 
> merged through different paths.
> 

In reality, Mark has shown many times that he's able to pick individual
patches from a series and the 4 patches are better reviewed together.

> I submitted the DTS series separately to start the review process in parallel,
> but I understand your concern about the unresolved dependency.
> 

Please send patches that are ready to be merged, and when you do make
sure you send them in a way and at a time where they can be merged.

Thanks,
Bjorn

> Regards,
> Shashank
