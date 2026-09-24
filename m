Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EA83E3D92
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240045; cv=none; b=uKj7fuv7Z6QRUuI4r44wS7g1yKXs6WBNu6709kDpyTQhpHtyHQWMObcjQZ6yZEJFVFuc7GkOVkTUd+flr/ZxFR/PdYTFY7N+NfGunJ3XdgzMiVnrphbdoABf+BAG/LhTtleM4W/ngAcKChjSyAZ8+/a5GJmxbQgBQiGRxGzkscA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240045; c=relaxed/simple;
	bh=vXsA8onEphTPMBeepzop7491JLND9beylCZQUYRa/9s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tyHFW22R0T2VdF+idnAch14Q1vGVF/z7AZPZWeMarjvqVydKOotkNEwwcY+LCe1/NGhWEHv/GjwJVmDgUOrDIYWLC9O4MH9iPiM31DdPXRwXAJhNkiTiwbnqSGDSoXeOLicS4K6I51b12EgzKx/Z9V5Im5eGAuuNrwDs2kGd3lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LqbjLpMK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LqbjLpMK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so20314365e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790240041; x=1790844841; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLnZwUG2MBgLZpqGTzUMzHxGyh6dXv6V+NePiVAKHBk=;
        b=LqbjLpMKvROjquwB9jxrXy2kExvY2imvTRcDnTuHsenhBVfltERJWno289v+iKmBJ0
         yUqkWFM+EFSFkDhphVs6tMb1P9AWqlMdUS/5QOyQM9/h7C+yCLOJZ7lCjjbQe+RHTCMA
         r/UI+7MgH45kl88MOtfb8JtOXg8eB4ONJMqxo32cayOKyu/UkHG87iGnwScfJVP691mX
         vOloPmc5qF53eBOKxUSJjqEumbi5ZfQcrMUaOaypXmtXdPklzDOPfmBXXVEFkITPNP49
         OK6K3F+y4PcdWOsVTPW7EuxflHrHUrB/SnW9+UwP9e4GDh13UiccwX5gI6sLw2MNo8km
         zU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240041; x=1790844841;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLnZwUG2MBgLZpqGTzUMzHxGyh6dXv6V+NePiVAKHBk=;
        b=jAAtZtE1ayBEh5t4My1mkRebzyikWwkrzLVeZ+dAZHC5BiewriyW382WjmrDNr54rv
         6hzDWF73TFricoTXxNC0GoSTrt8r2jt7aEFul1qjjZjEy68XD1ZKSobUW54yh2JSZZ/F
         nPiIDrje0Pf0OeI48dw+ZiE2z9lMqRzlQcJQEO3KhCVtHeyRovtMaTLgm5XTX/0kLoFG
         FhTM1MYcnWGVTqXD7dTzC6Bm2cqppihLvc7g4NV0zbKuVyDQCuJdMVq9h2JXfW3zhU11
         PcjeJeYLKximVavXHaf7GaXZFT5+yJqKsD480Gj53z5wjR8xK9UdkOrMJMXa2Z27HgxR
         VMMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxjwtmo5cC8g3zfdb+nC3oAm8kCn62g3FGkNVhzKSfBiDhrIIcC9hrPWAmnsZ5jISUnFFfS+Oz2G17uYw=@vger.kernel.org
X-Gm-Message-State: AFuF++krlhR9Zmy06BXJ+KDHjyRuoL8v0gt+R/PkX1390ThN/ZjGLcsG
	ySmsMJzdZkF1m4GYO0Y2Ps4G3hhpn2GUaFMlJXfHe5jB0X6G0uTTyzkxJG5NBy6wNjffdBDQIgy
	Uhd3g
X-Gm-Gg: AYBFou0HLDAjAnwxvQbdR1VAoXe+HPIo3zn9wypIgrsBnGUVCcbYNoSHY06m6abSW9N
	ir+D5mG8YrOaCRMgHlXFPJ0+llwBDhhkEsmI0I73pGV94gUC5ZrrdETUgbMhKd3SdLlndkcwC5C
	D2LQJyP1bzXWhQd95jxmBGLvCd08p6QkVuCcAW28eBRqHeXy1Z7ECHjIL28NfWftPAbeuGk7Gaz
	FckzdGxg8dGYzvhiSBNIUX9mW8mFDOXHAiN632+ZA4Ji2ZbT7JpjRyu6wx3o0xROf7ERr9km2Jd
	8kz78C7tAGrdgwfBcvy3B0zgs059NTPbnadPDNqyGqzFTsa8D1Vgf366OKV1ZIFzP8esKFVg8t/
	O8y/Si4RtUY54FxBWJijVA96rEeYUDfvwLH4c/aVE+4FCn/vDeh9QZGgH9k1givap6p6/QYoK0e
	FsmnBVc+L0/hkGwfT2ha9sApo7ITY56Pcn9GQ3AA7tGTbxIugWleb/I1OPBAvb3W3+N/qqXdYMJ
	rnZ7LMNjbyWodwgxw==
X-Received: by 2002:a05:600c:8b22:b0:49e:6fd2:a45 with SMTP id 5b1f17b1804b1-49fe66d81fbmr28966805e9.16.1790240040664;
        Thu, 24 Sep 2026 01:54:00 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm64643045e9.3.2026.09.24.01.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:54:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andre Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 3/5] net: stmmac: sun55i: Make the delay
 step configurable
In-Reply-To: <26334006-a2af-49d3-8f26-18cd44118c6b@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-3-15735155a789@baylibre.com>
 <26334006-a2af-49d3-8f26-18cd44118c6b@lunn.ch>
Date: Thu, 24 Sep 2026 10:53:59 +0200
Message-ID: <1j4iff9gig.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 24 sept. 2026 at 04:30, Andrew Lunn <andrew@lunn.ch> wrote:

>> +	 * Correcting them would break the DT ABI of the published DTs.
>> +	 */
>> +	.txdly_step_ps = 100,
>> +	.rxdly_step_ps = 100,
>
> Could you be a bit more specific about what published means?

DTs like those ones:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts?h=v7.3-rc4#n88
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts?h=v7.3-rc4#n87
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts?h=v7.3-rc4#n106

On A523/T527, only gmac1 is supported by the driver addressed in this
series. gmac0 is another (dwmac) driver.

If I take the 1st example

&gmac1 {
	phy-mode = "rgmii-id";
	phy-handle = <&ext_rgmii1_phy>;
	phy-supply = <&reg_cldo4>;

	tx-internal-delay-ps = <300>;
	rx-internal-delay-ps = <400>;

	status = "okay";
};

If the information we've got about the A523 delay steps are correct, the
actual values would be:
* tx: 540ps
* rx: 2120ps

So I suppose in this case, the phy-mode is more likely to be rgmii-txid,
isn't it ?

>
>       Andrew

-- 
Jerome
