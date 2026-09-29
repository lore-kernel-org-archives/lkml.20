Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8BC5349B8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702137; cv=none; b=aGEMNeHm5F0Bk2b9sZav2ns0jOXIkHbCFGnpgSJXgKRE6g4+pEQ2CSMB0vlKw5w1IY/4MWBfljJ7i2vO/AWyVJv4vQ44BuUQmgilOCT8MEK4dShLnrXZPXof7wwxW21gXQMLYCfD+MM2qSNZbedSaf55qiHwK9QkqwOW4wVz1/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702137; c=relaxed/simple;
	bh=zIe0KG3lCKETMKNwyZ7USTtDkAG4C6Fy+0s+JFPdz80=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jnHVu6nj3KYeobDSO5FuHO7kSd4ObwAQP5nhBB6HegWSPmH/YdD4+ZYy2axBWq8UhQUWM3yf/imN9pHLWJqbVJ7G8BguDDaQYRmzDrCUVEsU/bDbRkQL3mQl77A1xREh2lIGZTMkPmbaoBmgSE9zx62Pn0yfX4u7f4Sy+RzbHes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DBvONZab; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DBvONZab"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so27762615e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790702134; x=1791306934; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gliMXdJJkSbMhSXEgRAl5Ekvovgp6Cfw/QE4Z+KNG5E=;
        b=DBvONZabvKnsYyZDaFRrdDX4ywN2QKh0WQdGkCg4VuZAb8tWIBBXVgo69ctSNkC6iG
         R8Mb/fU3w1uQTatU4IMBRVI58LNV5eayLGJcEwEssU03d5eazY6TfsRi87hEhjgVXEgS
         KGD7qVj17lj4yPJwHCnA/zASIMl6qORzMoEMbWmaP3GWmyx4X9lVqBU2i8/GqD2MLR4v
         GjQQ2Qj3/SYPifWUoPyuGIefuLsSIQMeo8SxIHZOu6yIH4DapD4w2TzWbabU/ELl+A7f
         HZ+tH32EGR30KD/IGk6m25cjweaD5rmx+vUarLvuhpVA1EfjVSkVI09zvU2Olba2CmG2
         CgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702134; x=1791306934;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gliMXdJJkSbMhSXEgRAl5Ekvovgp6Cfw/QE4Z+KNG5E=;
        b=0DKrbAGFuvdoxAh4dbmjEkLi2lSH7B1HTmX/Uq2IaUJ9DM+fIGopcwXo2pNzsIXHq7
         rpxnppb0y/NSYHAhQ2/WZQoKTT/U3p96cmXIjRtQ0+sC2N4l94miQys8GG4SRojAt3St
         PKKPNY5S9ArpGPS7vRYUW48Yc1cSfMjcCzB5ifP0BjhjCgMx05WmazakzUkN8ye18kCD
         fzorkFfh15Q8F8hRhVAHadYwPgwCYuzYLoBrfIPpSXINfeiI5NqLpuu/yh9eQ3FB1on+
         8kzPb8kLoOr0Ch6JJnBDm6I7MujtBLGywOUjvFxZc1e0ooAAOw6AbP0v7RnfXmxIuV71
         19Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxZSghvaqUaplI9F8HZk8LbyBYpvbUOuKyYHGPAhnk28VsAu28hNBoApOL28AhXhUPV8Jyuw7k83fvZeds=@vger.kernel.org
X-Gm-Message-State: AFuF++kMoW34IdGSFo7wvEuSvMrB89IRL+bDWkTRR23Br7qLVyKLDURC
	CRhTTYG7mEj2ZCohvynkqzFtlgQY5OSfB8fTvQ9iF/zOsoFDifYqmogZ6v/Jwe8a/jw=
X-Gm-Gg: AYBFou3Q4LwqBbEoiDvnJ0TuJ11S7i4tORT8R63Ywxo7cRYbpsW2I+MhL8+f8hhqsGL
	PzYVoGidQMWxI6W30OOwUswVApDIMKRXuw9BFQuCHbBxSeTjqTToMNM/OYTlwZgFT1A92tc/cl2
	Vmi+tcqJnRGVR/5ubAmsWzR0EcWlZylReVXIRKN2agq3QfAeI/bF1hxPyf0/nZZyylH/Grvv0v2
	3t23zqvHviFqsuaMPUaVM8YaSjzrna3G2rH9WNifIY45WItzT3g1HuEMeZrVTHf+SbwiBSPoLhp
	viG+eZoMXUAjCvd8EYm/l7UNGHqJwqIE9om8BSiKtSvF2fBOXX2PXaGvFr0pV0F11Tab5S6Yiyx
	PJRGqMy8UdrE1XMyMa/tyyAIBM+xTaSuXDldNEm56Omp7536zsSfPLtqXdyGnXJWw2HAAN0AMbV
	zbmZoFeQMUmkl6KJ4BlWi5WQbOlCwLd7ziQd6CMoDcGqbCR7AnB4KPRRz26+87+J/HHnBm1AHqM
	Nj2oZI1FuJRh2LtWQ==
X-Received: by 2002:a05:600c:530f:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-49fffdc9a4amr125086635e9.9.1790702133757;
        Tue, 29 Sep 2026 10:15:33 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm101113665e9.13.2026.09.29.10.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:15:33 -0700 (PDT)
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
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
In-Reply-To: <93870bce-b18e-4eed-a9ca-1d01313c61a7@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
 <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
 <491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch>
 <1jse2x91oh.fsf@starbuckisacylon.baylibre.com>
 <b41e7fe4-2ec8-428e-81ff-47e1c75003b1@lunn.ch>
 <1jecec3xnd.fsf@starbuckisacylon.baylibre.com>
 <93870bce-b18e-4eed-a9ca-1d01313c61a7@lunn.ch>
Date: Tue, 29 Sep 2026 19:15:32 +0200
Message-ID: <1ja4p03rnv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 29 sept. 2026 at 18:10, Andrew Lunn <andrew@lunn.ch> wrote:

>> Thanks for the heads up. So if I'm reading the doc correctly the PHY
>> adds 2ns
>>  * on RX if there a 4.7k pull-up on RXD0
>>  * on TX if there a 4.7k pull-up on RXD1
>> 
>> The schematics for the board are available here [1]
>> 
>> * 4.7k pull-up on RXD0: so we should have 2ns Rx from the PHY
>> * 4.7k pull-down on RXD1: no idea what this does. Presumably no delay ?
>> 
>> I've cross-checked the HW, the resistors are actually fitted as the
>> schematic says they are.
>> 
>> With the HW setup, the MAC setup that works for me remains
>> 
>> 	tx-internal-delay-ps = <1620>;
>> 	rx-internal-delay-ps = <1800>;
>
> These values suggests there are delays on both Rx an Tx.

I did not mean to suggest :)

To be clear, we have no control over the PHY delay.
The strapping/doc says the PHY provide 2ns on Rx, none on Tx (presumably)

But I must add 1.62ns on Tx and 1.8ns on Rx through the MAC for the link
to work properly (the values above).

I don't have an explanation for this. I assume the PHY actually adds no
delay, maybe the strapping implementation is broken. Maybe the PCB the
already adds a little delay which is why the MAC just need to add a
little less than 2ns.

>
>> 
>> I know it is not aligned with what it expected but still.
>
> I'm flexible, if in the end this is what is required, that is fine. It
> will need a comment explaining why it is needed, why the guidelines
> are not being followed.
>
> Where i have real problems is with developers who don't respect what
> the guidelines say, even when their hardware could do what is
> asked. They just do the minimum to make it work, and call it done.
>
> The comment is then important, because i don't want developers using
> this as an excuse not to do the correct thing.

Sure, no problem. I'll add a comment in DT when I'll submit it,
explaining what we have found regarding the PHY strapping and effects.

>
>      Andrew

-- 
Jerome
