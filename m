Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897693;
	b=YaiG0VtRW4p3U9Rscizm834FBmy7HzjJpm7qOP+GETTiSIbLsbM1BsBJGbaKvq39pO++
	 QEN84A1lMw45Ata2t9kmaQ8oqHLiM2o/MZ8DQkrPQ1CX/7f7koAMtLAv1xP3UHt6msEz7
	 zin2Nu0JufwWO4lXhH+rzQA9rreP1SNgAB1q8mXz7TFAe+UMFN0/CBf9yyE8BFDq2jYng
	 TbvrxQhjo1XHd+XU2TeHWPifcohJ5qQNwPiQAY5mJ/fBncZec/ubpfRryX5tNMyf7VvmV
	 Oo3nlVCrMKHi2ipfHQqjm2VHCHYrvRq6gH16qTVMCV2abM1U3sgZvygkxoXTdh7PqWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
	b=WSA1wMj5kpfSQyQhdjH7P2Psj0c2YTGr4EMcdq6s+/hJF6/SNfl7Swa7p2VQFMVU/ext
	 iS7dBqq+49X2bTPqgC5eVholFtZOmfARVyeqXJKhiVnt9Lh/ZF/Ji1z06QY/3p96yYaJ0
	 Hy6TFKMuQyQ5hwSyARdE9V/YYQs7OQxiV0PdlzD9iXXJ2U9IVipx+H1PZr7JHsLsywqXS
	 /n3d0X5Tmp704c1ZSTanwI6wGuPK7DXkETbRRaKC6I5ut5CcKphNsSeBTmfH6pdHmcpMd
	 WTRgyZauha1Cidwch88wL2L6bBUid6Eq1eh6bPIRictb+BkYFFG6Yp+p/jIoNA/NIhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwtH6Nvl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE42606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE42606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwtH6Nvl
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b5869223e9so737132a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897692; cv=none;
        d=google.com; s=arc-20260327;
        b=MwLaaWSBXFh+MamHj70e9EuX1mKOEd7yK0vd1gt560wVsHYJMVBEjtm5ZyEInNWMTB
         al/hg4rIADo0hHWkiBM8BJxgK2GzGI1UpuhkGuFqF0fEqsdyU3LYL+MnjESDVc+PNb0w
         NunjGdR5fBPpssaUiuGyHE5Kfnwro3maqSc6790e56dHZZmQ3vSRb8b7jBOiz6AfXxcz
         PGrvaFo0bdkSWOF1g69e2r8YCJ9/xfAU2+8nPSd8lRZ27cJlmz2rBC6gSsUB7AD9cr9+
         9UiVJllHAHmWXwp0Z0/LtJOc8N0Yz+rNAK/++vuN0K5aHu5IrX5h7zCtbo8NodSXWjcs
         cZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
        fh=V4r1Wf6J6Y2EG9KM7OS5HOBJr829JEVw2zkwggpsu+I=;
        b=mlhPYHdhCuLw1ZQDN+5P6G9/ROqV1kOMCDF+X1v/n9grt8NpglVpokC9KBiCmJ7o+5
         h+IBro+GS46Pv2tWeO9UNx9bTWNfeqs8FoLwVKT9sYqeJJzJfEe9pFE94v9PWGqTE3gA
         2rzLgTNblHicANO+7fbDwWPR0Y5j1sOZT1SGmum+ISxOrTZzQpJdGJW/Y0smae5Cek8u
         1Z3CoZQIQTwd6A6KnhxQQhp6OTDP1mxHhg4x7+rjKw6S+KnpNEPdQdRqqrELslpnH0Yv
         MgEBIt0x5kNLdt+702ZYrvEM9c9J8Ao73UFYrIJFvd30gRE9Af4oOIsVkhcPkplI0PwO
         sKYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897692; x=1795502492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
        b=ZwtH6NvlFH+reQeUwmv7ZyE7ux3rBWYYiAbBw5fHJ20jIql00C5yxzh3slRgi+5t5j
         BYnivMmvhtboJ+FCyCvz0rMFpj0YtCPchM/G1bpXQ7reRYowOjVeNTUqgN4SjT+WX7Pb
         qnIB9RB0wdD7ZMq/OcM5oZDb2m1y6ZD4SlFah+bZ+a31T6wTJmhwA7sfhtmyeRnPKSaz
         C6/kSNCvxslOvPsMfSCHkIB3FRjnZPFxljRy/E2/GFk/Li1zZeEyI7eQFTsPHR1Bl+mD
         +2Ny3VDtFOOa8dEd2KhBW/f+RVpJAm/fvKNBd4PmMqZN3HpOnOSdn8rMF0fUcOd5O24C
         83VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897692; x=1795502492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPZhpWtYo4NPJA/y8/DpauPYh9eE6q0SsStIMNvIRZg=;
        b=jv5XErBNEpJb4QMOmcuAYojOHAWxcrMQGqoPYsf2gbJtLtHMzHXJeZddrULZjas4/z
         hfkK55reGrvzSEPcEaEbIJbRKG1wYLKOq4E8BvO+o59qrQDWZeYKVUZzXZRN/hZLDwH6
         yFvGo2oSJwwLi3oOH/F/3FwxYolaThEYRut+We5+ZBFP0hY7ApsQ2jX3tYEU0CP0nnNG
         vS79iYIK3vwvPk9zi5RrfbqCEeqqOg2Hia+fYqX4plICPdIUeqJTZafUkr6iVuTx3/OU
         0YuupHCTQgfk2pWqA0oE5wNQ8w+4O8MTLoIYsVehgXw0r0nmg3kc3c9f0JA38NZchxS+
         yfCA==
X-Forwarded-Encrypted: i=1; AL+hErHF8XM50aGJn3ul0uKwUQ3xnY5LzlhJXprBx7EFzVdODBZtLApxRu25+jKNg7fmO6/qFUmSutbmj9PxomM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mXFDEI+y7+t8yXCNVCxDLEbOit/OfyYfqVTN6KY9luC5FBPi8
	W/KX/pvOBWpleqPB00PpJz6Nhbk5U+X4CHX05nDakRFJYIPDYUJ9GuI3gIgHglfsoAAyxPDkIne
	8hZe53KirtGB4YlwQ0QcfyWAJybY3VWs=
X-Gm-Gg: AYBFou2VhycS/pWPGybckxuNJYZtkdi6/fqQXThB4/FS2CjEK1ykEe/J2VvPwCB+sBi
	+ml8vWrUAszuy09rcp/H9+AeRfYDJE7u1qzKcLZ2P+MNXmytZpKpbr3C8IEFJJi1cUNGAsg5elU
	05fEY/hwuh6nZMj24kk2LEPKDrADLkOGU4McH5lv/VCc8C7xy+R/11fMGnzZtfRNB+9juT9rNN/
	d2H/9sm+VxzeOoFcOPcN81ZFLUfgRpjNfBmRNM35AzsjMssFX2uaznaIe+rCHjpx9jTdhHSF3ij
	21+uF+hSfRR/NmVM616tnSMCa/iKoDIjoUz1mE9Yfa1ighf8r+IGTl1mVt/CxJ2vHNBofqh6hPT
	eK+2THYZAg404dAa0Wx+Wut6GVZR0dar1KkxT1uIgNYBBquCZmqjXTbwkvs0ONHwEr/hs1LI=
X-Received: by 2002:aa7:dcc8:0:b0:6b1:b5b8:b695 with SMTP id
 4fb4d7f45d1cf-6b7c05c2ab6mr10001732a12.0.1794897691319; Mon, 16 Nov 2026
 22:41:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com> <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
 <CAPwA33JHxsd=nr9F9_KFKWPx+HGaR8P3ee7hxMc8XCS6QY46gw@mail.gmail.com> <0d837fe2-e192-4fc6-a2e5-c23df40684ab@collabora.com>
In-Reply-To: <0d837fe2-e192-4fc6-a2e5-c23df40684ab@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Tue, 17 Nov 2026 14:41:19 +0800
X-Gm-Features: AclHuK9K0tynceSVuGQK7zRApbKLpPj305E_NQui8VbqIokOScWH3FFiT-Y5p9Q
Message-ID: <CAPwA33LgQqQSnn3vUOQF2wTUiqP2QROKfUpsASJZqjJP6WDi7A@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On 11/16/26 11:00, Michael Riesch wrote:
> Still what we discussed makes sense, so let us do some refactoring in a
> later series.

As discussed, I plan to add the tx_ prefix to the PLL helpers in 6/9.

I also noticed that struct samsung_mipi_phy holds phy and lanes, which
TX and RX both use, but also the RX-only hs* fields added in 8/9, while
the TX-only PLL state stays in struct samsung_mipi_dcphy.

I am thinking about the following:

1) One struct per direction:

struct samsung_mipi_phy_tx {
  struct phy *phy;
  unsigned int lanes;
  struct reset_control *m_phy_rst;
  bool legacy_mismatch;
  struct { ... } pll;
};

struct samsung_mipi_phy_rx {
  struct phy *phy;
  unsigned int lanes;
  struct reset_control *s_phy_rst;
  unsigned long long hs_clk_rate;
  u16 hsfreq_cfg;
};

2) Keep only phy and lanes in struct samsung_mipi_phy, and move the hs*
fields to struct samsung_mipi_dcphy, next to the PLL state:

struct samsung_mipi_dcphy {
  ...
  struct samsung_mipi_phy tx;
  struct samsung_mipi_phy rx;
  ...
  struct { ... } pll;
  unsigned long long rx_hs_clk_rate;
  u16 rx_hsfreq_cfg;
};

Option 1 changes 6/9 to 8/9, option 2 only 8/9. Which one would be more
convenient for your future work?

Thanks,
Jason
