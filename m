Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378658;
	b=EF2G4WvKJWuTMX1R0f051FOpV9H98OcDXgPvROVQwUBOKzI6Uooe8taTrj/BhT3T3zMP
	 3qRxeITR64n6LkwgaonrXDtg2gbfGqDdSzplSqGj7jarCLHID904rxb4QBGlCFHQDZZQ4
	 eouQkWFS60pBjHr2Ugxwy1avh/E9H+oWa2/MRXInUiQMi+ouYWJhKX1RRCwH6N5U4o8SB
	 UvXLVXcPlqLo0ehe63PT3NaZ2Br7HJxmTeOQXZGWP05y1tkxNcCvZBuPst3AMjzNbHH/+
	 fQTUVJmp0mnuSj1OKi1JUhFSdbSF69WDmbkv/85+VPsF9LPTb1I+4teWDNtAYYSE1Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
	b=U/HixuVuNutLqafYO6vN7xHWUTpGfo23EZh/Oc74fIgzNA0+RYOlxIrryvodYyLS3pLf
	 M9LjRLzviZiC+qzD8BZiineNAvYmbu3ceZ6NS0ZoFpteKxKSjlH2FUCls1/M8oG4VGq0B
	 QvhAZNn7Bj4IvtuxYrqcPhxtAIoCO99Q19MUa2zC6L+2p98OGTmAEMuo7qph4XxkybZak
	 5A0Fqi0YsYqp42XraqaIdMYAqsytS5TFnyO8NnosldTpypTHNacg+agWbyyngYfGnJ2TF
	 DUlM0GZLeiXLTI2ovtcgINLpBipuWFwKo0gOW6Mvqxm/Mn/zLM8uUJKFo0e4Ur3rvZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8MfenWJ;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06FD606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06FD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8MfenWJ
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso2661159e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378656; x=1794983456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=q8MfenWJx5XY+TGwTQqOMA9IioS/+jQFrJaSOqEj2B2Nw0EST+CsNCV/0H0YPfNEL9
         nHqE3QYt1KORTKw1S86eT58Z4jXoa6fAXerpgL7M43F/OOJwDBM3pGqrF83epX2NtvOj
         /cghsAKcKAg75f47lM8eZWkNHCzqBzn8OusFM26vIo8157GDB336VSbC3kqoOOx21AG6
         65Hkl3s/ajLT/mG1GuuyfqGwlxPeqbPCPKN3Q9u+Biz5EinXSwBWEdeBuzsmiYfa0juK
         SiwD/4+l1X+DWBP5foJhYz73lqI0X0pkWnNvgjIe9fM5na0OecKldRa7exDPBQvTZr0d
         GswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378656; x=1794983456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=lRAN+nbc01alEjVaknNUfjhGIaIem+Zf6yMtQ71IM5jzUXShv7eTbp1sts2JJJSVeb
         ++7pD+wQ7L3WOy8uO78M9BC/UL9EGkZKRB1zvW2mxp6/yBfs5boXztReOg4y2G1emycu
         NU2Mfwyk3KumauRs/6hW8dcgsxz+4XBYe42MIwoALp+1W5OOskC1LgycO37dwj5Epwlf
         Fe227keLA3r+JEcGVABB7sltOJgOIHSYCy4RuYsOBGn+xJbuWnf7sJqmmJWgvBKnfmV3
         S5qiiaABo6/7zrom1a2cZGYS47y/h6lHiYmf/EAYZwgKkolCkStl0XdDjh8Yn/qJN5LB
         Vzog==
X-Forwarded-Encrypted: i=1; AL+hErHOU3FbJZuHmRN03+8BD1g7+oqyvdbmgN+H01wucdf8wEnS6ZKH91GEaiuQLByyOG3Nnoy6+/6uuyrTsMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H/ndFod+w3DbtS957QoGdPdZlIbcbz34zZ3IPXYj+4T0FK61H
	WvW38aAc7F8rLAOVblJQHSPQlMRgM/7aTZZcElGbuswuNJWELV2CLXWR
X-Gm-Gg: AYBFou38rr44vCqRjHFOv7DMzBSqR7en6GyAz09XP0Avjqiuqylj7EYdBb5Ue4axmQV
	W4wvj5a/s3leRiI407XYm+gqZxlvVj5+PwF7mLtFbS1JGM+oW0yCLqAP8sIo8K7ZdUndRpjzC95
	k1mDleW5kt3s/YQ/CY1vOgpApmKRw7A+/UgYMbH9qB9XxQItfl1VYnJfvBaD9qK4GQiq0hKIxO3
	ofDpBx4NoWmfssxpg+xMSWm+oHQeJDqZbRVfdrton0dXOCRTw12wTwjZLkkrTPaeW1Z4VVJ6j4a
	mHhKIB02HtfrEB2EWa1GW5U8uMWM4qhf+jUZh5c0QxGKWiyxiku1oNCZQdEr0TP+dxbBRV3pDhk
	kIwZ2lBnDn8YZxylROPQD6LDxo30WRQTXmHEhld3NKj5FSBGukqz7LfO4+aBZ4yz+O0KWPob0fr
	nATAGPRV68gMFSpt8g98iKj/J2HBDoyX9/x9rFWUsNzYggXgi32j5F/cmscv9GHjp6F6lbbB+Ik
	DbzusC1OBqMuKUSpxW+Hn70UzrGntLOvay4wjRhhBNkYvrQ/EotNPwIIRCW4NpEGac1QTVsfdo6
	bCJW7MppsAuipurcoX4pd3CioZyRQLsw6/NytcV6UL60+3EEt+Y1Ycsw9D+ejBMLiwJjjwrkvZF
	mc5ZSR7ARkg==
X-Received: by 2002:ac2:51ce:0:b0:5c1:5974:8a54 with SMTP id 2adb3069b0e04-5c15d545536mr529421e87.5.1794378655623;
        Tue, 10 Nov 2026 22:30:55 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb7529sm811767e87.66.2026.11.10.22.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:30:54 -0800 (PST)
Message-ID: <0a520efd-ac3a-47bc-b37b-11df8263fb5f@gmail.com>
Date: Wed, 11 Nov 2026 08:30:51 +0200
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
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/2026 23:54, Uwe Kleine-König (The Capable Hub) wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
> 
>   - no comma after the list terminator;
>   - a comma after an initializer if (and only if) the closing } is not
>     directly following;
>   - no explicit zeros in the list terminator;
>   - a space after an opening { and before a closing }, a single space in
>     the list terminator;
> 
> Adapt the offenders accordingly.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org> # for Maxim MAX77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # max7360
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
