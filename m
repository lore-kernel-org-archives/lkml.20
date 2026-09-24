Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCB743F0AD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239212; cv=none; b=aSHliD2GEPVuuCcvo6yzVSVff8aSoAI08OV2RYH5fg3Dfn3ufqmNqvQuYW1wZCedCWKx0gpx7dK1Ln/v2BARZYu7nre+Pvff/04t1Q2QgGkU/XNeN42Z1TWnmJfAYIOhLv/1iyB9nPNIdR5nWaYkGqeesU1Ds7vCZce9z2eCui8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239212; c=relaxed/simple;
	bh=E7zgJygkJZQH6llsNGV5+YVVnlEnLIL/VfTweXUdbD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uVxDrsOcCqnutxrHnSjq31n/07k3W1Pq/Q7XhHUkiF3grTj5dpiEXbSRX/itlyISWT1eOyThr90NnrpXFyvEQlkMZItIQvNdldAB0XCrkEv6v0HgGnxVVWngyTYR+2NPAFvqxJl4M2FnAcZlPAPS6WhRuuDAbZFMTbH7o7+x3zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jVcbkY4y; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jVcbkY4y"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so1256591f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790239208; x=1790844008; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKhJx1wEyO1XAHiYD4ulqqEa2XMnW8boyqSFRDJ87jg=;
        b=jVcbkY4y2wqOpTDHBP/6MR6hdfx7sAqZNCRaqFfkg8ugmTJF3r7CYwDhDkY6QwhmWT
         JFnK9E8CG30ol324+iKcmwRvbounQA4ILZoEQWYGyav5w/rM++9uB86QRsbsOwvgNIis
         nXeMSmgjcimXQB4iOo6CW2w6lR2BZvu1hQ4MdeNf4FVu8JKwcss+lP+b5oV8K1dX3FpG
         zf5j6JcjJeISNnYQmfNmxyqiMW3jBzXXJw5ETG70E44z7PVfqCtBzzOeMB9cZoV39lKV
         1JyT+ROA30o/YrRs266b2KttqeIIZPHk0McGL93osCD0DaHDbNmUXMDr5ZlC7CiXofHw
         CbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239208; x=1790844008;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKhJx1wEyO1XAHiYD4ulqqEa2XMnW8boyqSFRDJ87jg=;
        b=KvBs+hieF7Eq8iw+riVmuqX1egs68WOjr+mxsvIc2lOSBA2/3u+XmNejcJwPqt9H2p
         dZOZVGvbi6Tl/MkONGhhhNQXOk7xnBcoP/LzdsOkYN6OKDGTwEjMpSZeAqyDaYkRlhRG
         xUr8etvoNo4jdkCWLgBXbYv7Brf3mbp8Orm83z8q7OJ8vZ0xY2Oqk5AzUGOfYtsAiq2i
         Y+ql7tS1X2OkjX31s3GXC/YOhglq0xR6sK/hG48LW2qAp3GfU8kXzC9M6eQhsYXgdD31
         ZsxEDW1bHNNwcNJw4sApFfSynAZsr/k1uR4pRLtMVvm+uxbm5Z0J3UBp+1T52clQPMTf
         lQGg==
X-Forwarded-Encrypted: i=1; AKwUvBwk7/KN8BmdMsYpHWjD8iWvNC/tKyfywraznAEk72e6yPnKHslCRoQevjYXVeFcGxCkgUwthhxIGMAj1KU=@vger.kernel.org
X-Gm-Message-State: AFuF++khRO5BYC9qCnUPLkE8htyx9xmSTDRoy6ZCPbLd3Dex63eMVGb1
	WoGNCSAOD8VI0VnxV9Hboj878/SEanghQf3JSU+XVrGLsoT9VumZunZrfhdreuG/pvw=
X-Gm-Gg: AYBFou1gnJsTjlnpbxiTR3v72PiIx4ZRePp48qqO4X6+dLy+adXU099t9u7gEC5JRfU
	86tnRx57RrbIOzyZKTmVAvzC+S2uH7dFS9f6dRH7eQCyacjHkkadzZX6iSpoIQmNpCS9W86e7dc
	1J8VcOoHaXmTOkvDgaggDqlIIDZAoEyP6d92bMu7xbVQ+pNaGD2wftLIHW+c4uCsZzL6uWQfX4H
	lpKSTZqes1dytL3pT3oEnrOf3ycwBG/4KORX9WY6g+Uv2tI71aEuJBEIl76S/9zAWD5Y942Z078
	B3+3mhxmcruakWRhfvejxW2r6OlcWbUZbErD8Cy3U4vGoQuZE0n9i5XnnkgHuSqPjYg/2GSL2QQ
	8wmAJAULk5zeyRCRaT3rAPkaRGAWLrAPosKqwiAssp0DtJpeks36iuPA70pCGznCg02m0t6hzEC
	V5wI5VhWPP/s99bnWstY+YIE2IN0sC2XqyUNQRoadneJkey3DJH5qKQbeHHMJGnbmbyLViCZN99
	Z7FsOirKbAngDv76w==
X-Received: by 2002:a05:600c:1c0d:b0:49f:ce73:7ac with SMTP id 5b1f17b1804b1-49fe67106d6mr32623215e9.35.1790239208416;
        Thu, 24 Sep 2026 01:40:08 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cca160sm47420325e9.12.2026.09.24.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:40:07 -0700 (PDT)
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
In-Reply-To: <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
Date: Thu, 24 Sep 2026 10:40:07 +0200
Message-ID: <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 24 sept. 2026 at 00:19, Andrew Lunn <andrew@lunn.ch> wrote:

>>  * Unstable EEE/LPI: If the device stays in LPI mode long enough, the
>>    link sometimes (but not always) goes down, coming back up when the
>>    device exits LPI mode. This is apparently due to the PHY; the vendor
>>    driver disables this feature. The solution is to use genphy with the
>>    eee-broken-* DT properties or wait for the upcoming mainline driver:
>>    https://lore.kernel.org/all/MN0PR19MB609154F210DF84DCB29D3696ACC62@MN0PR19MB6091.namprd19.prod.outlook.com
>
> Looking at this code, it totally ignores the interface mode. So you
> have no idea what RGMII delays it is adding. When this driver gets
> fixed before being merged, your DT fragment will likely break.

Thanks for pointing this out Andrew.

I've changed the phy-mode to plain rgmii which seems more in line with
what the PHY actually does.

>
>        Andrew

-- 
Jerome
