Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3890F4DE721;
	Fri, 25 Sep 2026 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351768; cv=none; b=XZTkhn6GtY0yGX5ONwkGOsyJkYu7TRqWkZ4uTGKVAQwHHNK4MbMKSSU+n+T2k28IPnZRKidzMKrJ4Dps+zA6lR1AOkQn+O2j+hDOjkwtUpiLre/8JxGUtyhOA7ZlQa7/Ui6uVnLZG8ks0kbAX4kTjU36MyRClUkDHMSTmEm8h5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351768; c=relaxed/simple;
	bh=CsXRsIZic4pNpF0j9peAbSeEySGzWxMNC10eQxU1L/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNDYndejn1r3/imLUZSZqcIApaf4i9ahCR531pDP/N/PL4Zmgzo7nk5i/h28fFdk4Dd4rwo/LCaEro2NvC6YMJfYjFJ5SUwGjwvijB5odqBogAMlyUYcwDPMR0LjwdxQBpjqI1X+VF79pYFGn2T37Yj33JVttVrdZwF7RqRDVFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTcp6flG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTcp6flG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2F31F000FF;
	Fri, 25 Sep 2026 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790351766;
	bh=wLzqrKrylWwaZoKuIZ7pN6lIcao69TTCOJBgl31p/F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PTcp6flGCb+DgBIjmq0yvxvHpwIZg3iv+NqbNfQ/nQg3ZM1933WNw6NbovYQ45Xzo
	 frTIr/f92xe/+PureQtvu6LoS9VDS2n2+jc3KOQ/a2vupwtuUzDBbhYBlOsHsYx1ae
	 igl7r2NQ6z4g1iS06AeR2vZdOrhoCueUl6PuSP+LVRwrfhIjJ6Y5u2upZrnZ0Rg1a9
	 qMPgcgr3qzVPja/eb3exQDS2XpRWgzdFbPadOLcA8Y9fGUXEg31GMAQ/oC6S/7wkBT
	 m67w5PHs9Ft0NUw6ZR/1PnpyKCe10UUcMZajz02nkVXnWKw0wTroaxUxYgh8fp03rh
	 A/ZCIXq3eQnGw==
Date: Fri, 25 Sep 2026 17:55:46 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] phy: qcom: Add USB PHY support for Nord SoC
Message-ID: <pakxkriepxobwla7wb3l25xr7b7zcx77n5ydl3wigs2jrxwoou@s7os4rdqtufc>
References: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>

On Mon, Sep 21, 2026 at 01:47:04PM +0200, Bartosz Golaszewski wrote:
> The series documents Nord in qcom,snps-eusb2-phy and
> qcom,sc8280xp-qmp-usb43dp-phy bindings, updates qmp-combo PHY driver for
> Nord SoC support.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
