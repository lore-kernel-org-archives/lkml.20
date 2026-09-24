Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB16485518
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263660; cv=none; b=H7GhWS0lNa+GLb59rqicWq7l0dBjlNuV2E9sZCVlBRLpk5cC5kWXeEe/mhtX7GTotfgJxe1o8g6KNFkcUBDrKnb/wlLofiXbjkn91HvM3lCvEKr8aAR0+OMbuYdBHDWyO9ojnEYJIDKlFiZQfvczNf5622XaMbUVgtlqzgbZFdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263660; c=relaxed/simple;
	bh=cyaiCXoXZGoECX+KF+a09pG3FdGWCh+dGbVZ3Xuigsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fDCJAPr2exadbZSliyAeENdCcBnd/YFrKwp1fbAQWnoFj9oKXPjC1Oj8xk9G3eqILHV1XZMfKyHP6550cy+1nBpmriL7Ei0eLNsKcc3G9mkbePxVTj6Pl7m2kfTCfvl0VNbBpWg2Oeed9iCgE1GlM0XkSwd41IextYt4E+ZN6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lwUg61YC; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lwUg61YC"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48434392b02so1698572f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790263656; x=1790868456; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRG6Vx+KfGB0F8iXypxpZOtK+1xBSwz+daslPav1QJE=;
        b=lwUg61YCnPbWPTNR+ceR/SH8BXDTu4hQND29qsQWkJuB1uP8erKDlq1FkD6Ns91l1M
         P+fQARvMZ9DZyw3a8UfqX+kD9csamCJzhq5LEoXhMzOTxZgUWiMmrVrLVAKtOdnx9m4g
         o2eVASspo33Omous6O8BU6mYA2hQD6NKG2+sYJG3pcCjcOoZ/woID3mzfq5PO89YLzKH
         +OHKd5uWXxREG/u4R9PSE75v9bO7RK8iXKTkyI++6OsrCRn6a8YkLSdTOn9I7GzvJ/+3
         OicEDVljp9b6ZjuNorxxiUxmZAXzEnJ6oGIZar9nM8DLlNj4eNK/n5lITYjeIoleY0So
         w50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263656; x=1790868456;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRG6Vx+KfGB0F8iXypxpZOtK+1xBSwz+daslPav1QJE=;
        b=eFqGZgg7ZvKNU4PHGFvmCvAigsPV8axbO7D4bk35N0Trb6k1PIYVJoX60zfB3Q0YIQ
         chqerOE8ozklRDP3vc7LbOnMOfQIZejmYFizN7BxOr08xvx+nTNBkMxZJtZUNQgg/V8o
         zlvKxwjPa2AUaktEB4VYbqkqHq+Jl9BWxMXW6evg+WQ8ttwbaRBbgx6F5dKc4y2klUQe
         ciUtmlxz6XxKeHrGYgt2A2Dd0+edL8/3/Cbr8MwXWLLUkzgiZPdYX2SG5OC6EQ9EljDo
         OV6Lu9GvJTQj6hNNznTJOvxeSQnrX7pDeJyiuaEAX3zrFZURiqZtMUm1iLS0LX/fke/g
         VsLw==
X-Forwarded-Encrypted: i=1; AKwUvBzPA6jqM0puoAx8lwxjChh6nI+oMBT65s2f3X+GsL0bEJwXqtf5I6Io8IS/Qy/so3VktUAYKqFpAbPmUwY=@vger.kernel.org
X-Gm-Message-State: AFuF++n7q6jG58AzhYy6H+ud0pxxNNDWGSppjWlPib01Gtc1QnsGuBuv
	5Nd4OYOsqsLl3OK+0xbtizT5xQn3cMXeqNNTrQsxWEr6UdhOaFFcBQFc8abKWWXIsJo=
X-Gm-Gg: AYBFou3TJv8NhsQXfko/Knchsy+eief4/FwKz9SRENPOUBeO5+cWmal6/lTropl8P2u
	hGZpxcBIUuCbn4Zlhv7K/arH+zw1LBTd1lZHBYw60IXmaKUYFAXVYc3RAGQWAdi+5Clpaem0LSf
	fPWHIHrncy40NaMMqG8ukviwUrQfaMrlEAj0rXuqvzC9kx90lLazSqXDryExXVkXS77J6ky09Cv
	QUFs7mxa1mJaUxAQZNq9ahIPPlxsgf7NFYnZemj3P6140Oo/bZQJmjnqVdFiCMJBObvSQ55qEKO
	6NqzS3TVY0DV8Q35F5mdXW9XFu+/5mHyrIx1tJ5aNoukItqHnrC8ejo3/r9ubb6YxShF2xe+/Il
	g5YcwDgWX/sUOvQupKSwyUPBNmOeNCrEZ5iQBOjJDC9rzsgK3DlLmAAeYdY9ZXhkmGfECM9ygyn
	UphW7XDAIDApX0X6ovb4Qcnu2GT2TbAkxMzQhZH+dOilKo9GHeLiprZ13ibni41d5C00W7CG6Yv
	gaPLABqDJBNzUdZ4g==
X-Received: by 2002:a05:6000:1886:b0:486:e8fa:f9b7 with SMTP id ffacd0b85a97d-488716c12f0mr5112120f8f.13.1790263656324;
        Thu, 24 Sep 2026 08:27:36 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668dcsm16823010f8f.1.2026.09.24.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:27:35 -0700 (PDT)
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
In-Reply-To: <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
Date: Thu, 24 Sep 2026 17:27:31 +0200
Message-ID: <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 24 sept. 2026 at 14:54, Andrew Lunn <andrew@lunn.ch> wrote:

>> I've changed the phy-mode to plain rgmii which seems more in line with
>> what the PHY actually does.
>
> No, it is much messier than that.
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
>
> rgmii-id is very likely to be correct, if you were using a sane PHY.

It is not the PCB doing the delays so rgmii-id it is (in DT) - got it.

I dunno what is sane or not, but the allwinner dwmac drivers do set some
delays. sun8i-dwmac and sun55i-dwmac do so, even before this change.

If I understand correctly :

"""
When the MAC implements the delay, it must ensure that the PHY does not
also implement the same delay. So it must modify the phy-mode it passes
to the PHY, removing the delay it has added. Failure to remove the delay
will result in a non-functioning link
"""

IOW when the gmac has *-internal-delay-ps set and honors them, it should
also amend phymode seen by PHY to make sure it does not add its own
delays, should it ever be fixed ?

>
> But this PHY is going to cause you lots of problems.

We don't get to choose I'm afraid :)

>
>     Andrew
>

-- 
Jerome
