Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794903414;
	b=lTPmnmmr80mG4cCcAxH3BpPhiOc5cIhJ2CukWGLOF+csa7jUGSXXh11du00W9woyTuXW
	 tPXJgwP40t0xKLodl7Sm+QiptlqObociiGjW/5ZhXP9TWR2ypvRR2pHzeehgi+1dNZK8L
	 IwnFoWfxJLPiBZRzgmgV2XVKpx3qPnB7/9fD3TbccondoFkh/RqDCTFiCewfQzYr4+5Lk
	 di8bNvo256JH9KkIT566FXnf9vwJb0970h5dRBLzoElZEf/EwfXjHk15DfMGBLIcxJEGt
	 G7dqB4fcvD0eJTvwphEvKJWuZe/P56fCtlGEEe7kVs+xaioLGR3LAZFjYsPI97BXRWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903414;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=3XJmTMYUz16JNiSAMEHddAj4414anMwgEM5quAuGPSg=;
	b=Nh4TPyLwBDthMCE/bYmQv2Kcs4wt3v/dNMF4GtMixb7oQfq0g0wpMJ00QyTL4GkQ8WFG
	 O3E/J2EtGWktFHi70UNe/E6iOto/Zs8X2G3FSA+0ezu4BwnD/VyQnni9voiQQIqGRGn0b
	 xE5ht1btXepRVhcM/WHaq35MDusJmWdTfgBa6oKADya1XMMop+z+gzzFi+RJOPP9OzIOV
	 s/sWESaxTsD96auPe/fJ1x9rgXnyYaFcuLSv33ZOdmw9+e/BMzhuYeEmRMF/dAHQxUzwt
	 bO9XAurRzGwfGbdpAm2jrQtRYoM+1VuYcT2ppygZ1D/qkG+fdBpasrp7uBnGSWazORA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=XibOEBQh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2AB606A31C;
	Tue, 17 Nov 2026 08:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C2AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=XibOEBQh
ARC-Seal: i=1; a=rsa-sha256; t=1794903392; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nVi1itKM2VEMnfTFsm/6uPeY1mwe6+SgpzO1nnkwknXBj1m0bcDW5rwKJDrOhfY6+fGn0p7xMO36NH045ZEg5UDIusqHNU8OMuPV8633d+TIyiXbFHj8mjrbnHGU/MzBcY0qfadmsWeJiz8Gg0hxhuxyo9DwV5/erhdRNMp6Fmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794903392; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3XJmTMYUz16JNiSAMEHddAj4414anMwgEM5quAuGPSg=; 
	b=SDg0jEKjhSzX29+MrdRkaNEHTk90tOx7qyosAeD+xyTx3YUga255xDZ1QCzNvhUtmtbkZI/3bVrE3AwyUUxR/5Kf2eppIE/1oKD8bF2h1GCW/UP/m7L+5aPH4qJ7Paioxo6c4GE+K3ZnNxIj656wbwH6PStc+rcP56oHbXF+XLU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=XibOEBQhIAomoBWVCSW4lGsxqc8bKaXJLXreKl1su0qOdrtW7br+Oi+0p4NR8/U4EU6vSOKHo/JTbF2bJNMwKcdXfm8Uaea4TXs1bTp2aP2XRZpWHyqHkKvI2pFyqjHU0srAWiQkJE8DNMMN+2UvejdwRF55ZX15e47+KpASH1Q=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=3XJmTMYUz16JNiSAMEHddAj4414anMwgEM5quAuGPSg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179490338955423.03246426210353;
	Tue, 17 Nov 2026 00:16:29 -0800 (PST)
Message-ID: <d3e91164-9da9-4f20-9165-5a586d9aa55b@collabora.com>
Date: Tue, 17 Nov 2026 09:16:24 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com>
 <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
 <CAPwA33JHxsd=nr9F9_KFKWPx+HGaR8P3ee7hxMc8XCS6QY46gw@mail.gmail.com>
 <0d837fe2-e192-4fc6-a2e5-c23df40684ab@collabora.com>
 <CAPwA33LgQqQSnn3vUOQF2wTUiqP2QROKfUpsASJZqjJP6WDi7A@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <CAPwA33LgQqQSnn3vUOQF2wTUiqP2QROKfUpsASJZqjJP6WDi7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Jason,

On 11/17/26 07:41, 楊智成 wrote:
> Hi Michael,
> 
> On 11/16/26 11:00, Michael Riesch wrote:
>> Still what we discussed makes sense, so let us do some refactoring in a
>> later series.
> 
> As discussed, I plan to add the tx_ prefix to the PLL helpers in 6/9.

Oh, seems I missed that. OK, carry on :-)

> I also noticed that struct samsung_mipi_phy holds phy and lanes, which
> TX and RX both use, but also the RX-only hs* fields added in 8/9, while
> the TX-only PLL state stays in struct samsung_mipi_dcphy.
> 
> I am thinking about the following:
> 
> 1) One struct per direction:
> 
> struct samsung_mipi_phy_tx {
>   struct phy *phy;
>   unsigned int lanes;
>   struct reset_control *m_phy_rst;
>   bool legacy_mismatch;
>   struct { ... } pll;
> };
> 
> struct samsung_mipi_phy_rx {
>   struct phy *phy;
>   unsigned int lanes;
>   struct reset_control *s_phy_rst;
>   unsigned long long hs_clk_rate;
>   u16 hsfreq_cfg;
> };
> 
> 2) Keep only phy and lanes in struct samsung_mipi_phy, and move the hs*
> fields to struct samsung_mipi_dcphy, next to the PLL state:
> 
> struct samsung_mipi_dcphy {
>   ...
>   struct samsung_mipi_phy tx;
>   struct samsung_mipi_phy rx;
>   ...
>   struct { ... } pll;
>   unsigned long long rx_hs_clk_rate;
>   u16 rx_hsfreq_cfg;
> };
> 
> Option 1 changes 6/9 to 8/9, option 2 only 8/9. Which one would be more
> convenient for your future work?

Thank you for asking. Option 1 seems a tad cleaner to me.

Please note that there could be a variation of option 1, something like

struct samsung_mipi_dcphy {
  ...
  struct samsung_mipi_phy tx;
  struct samsung_mipi_phy rx;
  ....
};

where

struct samsung_mipi_phy {
  struct phy *phy;
  unsigned int lanes;
  struct reset_control *phy_rst;
  union {
     struct {
       unsigned long long hs_clk_rate;
       u16 hsfreq_cfg;
     } rx_stuff;
     struct {
       bool legacy_mismatch;
       struct { ... } pll;
     } tx_stuff;
  };
};

Maybe this is an acceptable approach for you?

Best regards,
Michael

