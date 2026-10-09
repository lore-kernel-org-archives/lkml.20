Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78265013B4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570597; cv=none; b=BcxU4wdWOp7UaUdLEea9erye2Q4p/Ci/6kqFKj3iwPjGRgXHeYBdAJSIaYuPuJODX/OBcg4QBbYgL8JjuuwDMRtYRPpZz3yOWbIgYMIM2LUbn+KACHsfT9zXEpueIZolgTZuO64suuoAbSNNJWtNNfQLNcHlaQvVJ/PU2qPI+tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570597; c=relaxed/simple;
	bh=I/1PyQTs9JiOymPOiuzFhvwhZ7XqmQsZMTD56HnUL+U=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=iOmXdLT7ddL4+ZfmvC/qyHGyDI+Rl3oddkRn/VolukCS+VydcO3uo8g4VZWllc6BLInCjfmV27qCZufisRX1a2id6ClPvYsQbhFch5mgV+waJ0ZIdXeN7QwpNWB4TiO7ObHCj5dhgo5Vp9GYqzO8ZJaiehwhVy2tbzbzaHgIRtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fq+rJ0PU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fq+rJ0PU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso2237395e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570588; x=1792175388; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6eTdAycFKzyoelmWzAqDQwOHsmx7MWbf93DwQ7V1xow=;
        b=fq+rJ0PUlWlOWB4iC0dwXZptaajulIkFu6QKtycdSqqlImipv3M8/wFuulbWaruG7A
         PU5fhjqIm7VfsuJVNXP4D88exrObvRvyuiu6dQIjR8uRJCyuw5sPOfjAL+e0rCJ4181H
         T6jy3+04ar7xE5YnW3NATjif5BaGRzwpEwEXvAo32JjTlwZY6eHY0YqS2XVbzDCQC6p4
         W1KaDwYw66fhpSUU7xvvgzraiQ+gO6rYTgOyROu0x54+ZYIAyRtxS2eGOttlJPe+mxE4
         chYr5ZRolaLR9tZHTnj775qztB4WiOQ8wDsu2g/XiIkd81PQjKENIps8yT4I2aqc5BAO
         /Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570588; x=1792175388;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eTdAycFKzyoelmWzAqDQwOHsmx7MWbf93DwQ7V1xow=;
        b=0jmEzOHg7d02OIc+dQr8ckPgPrRGFEKrdThkm39++6LGDtgjIvRJjWxGZCImITzhUR
         gwagKf5XCyLv7jXZ27HwEV/75DUMtwFa4rZoMnVa6YKIae/fENbt5yX7SF86VBUfwfhq
         DVlbEmmdciDoIHrSSCDo4eQLJMUxoFG7ocAc0YJpH4K4W3s9G/kU4BsnR9Es+QAhztNP
         Ql3iY07TLO7UfL+m6qTkDz3IFgmGctn2Ndadg5AvFH7Yo46kgXia7okdCjlBCP9y8IvE
         YZenzSQ1vhHr0KDlJ9FNPFfdrafMlnw7Ghfeu9vLLsTHrfrLsJ0D4lBuXAjq8S2gs2HL
         h6hA==
X-Forwarded-Encrypted: i=1; AKwUvBwtvFTwgN5gpYCEHzT9Ott8Uh6NKmm0/51YfeUoMlMDzqarmiXh6XhpaFdVNwLwb46mqSGS7HIGmGVWDmA=@vger.kernel.org
X-Gm-Message-State: AFuF++m7k50Wj6Xacp0JcW5qvFk2zLEGBffbD7Vy44VOrK/JKOZ0Q2ex
	wSSANYShLR48KNRvz22xR9UnpBeUK2PXuMlU4C36ISI68sokj+UkParDfyjwDIeIo70=
X-Gm-Gg: AYBFou3cwRn3P0Vqumv18Cn35Eb/6Hrub8lnPQqSxn9X9D/zD1yr34wS6h1t8UlQXyv
	68DLSe07L5xAz+uykDu35OBgBFl0gy7P9Ga+L2Bdyd35ppRCIF3z3g2S0pTI7MR8kjsScW1QCSu
	QZyMb0ymUHsVrzkWE9JojeJCsus9aFHNQ9scHERMKKOAgTYppMb7NENwm/OC4fTQXiDMUpwR2BY
	PDTp46HdjNRFhDNsjGciJ5iYea7LIOaVc8lRO6VSsbNFm6ffeiBA8VCzxMeacG2cw/+dsB1ItTM
	f3Z16Xj830tKSO6k74vlSuASGIY5bMiMYTXDqYuRq8G1FAFItoas/Wi9Ds71rqooM2GBfGLcyEm
	2nQpJkT+eq6m5XFHevUkLTX+QrWeSMZYRDpgAqACuUBhqYyWVLd1ON5+3vggKpCQ49C1GZZq/C5
	Qe3uL4YMa4SAs51jbzct0Bs//vWXsru0JpS7SeoaF/HYr+n0DdnWQEHjISBfWDTOAG+IADqRvm0
	3otn/OGYH4cMz9XoQ==
X-Received: by 2002:a05:600c:3146:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a18e4a7cb9mr54978795e9.14.1791570588129;
        Fri, 09 Oct 2026 11:29:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm111362245e9.8.2026.10.09.11.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 09/11] clk: realtek: Add RTD1625-CRT clock
 controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-10-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-10-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057524.266328.2343186062671086748.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=I/1PyQTs9JiOymPOiuzFhvwhZ7XqmQsZMTD56HnUL+U=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaY+v5c248QzibkLb21kunR8D1/LituXzsQ2tD9P/
 iV/+gZPXEcpC4MYF4OsmCJLDXe1+DtJrS+zpuvchpnDygQyhIGLUwAm4m/M8N83YEvPuYu5lRa9
 ehNe/CzZ+37h77KfreL6/8P4p29eEnaHkeEn7y8J9Q2/r2i8u3L2os2d9b8eB5n3+86QuZjLJtM
 +fycfAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> +static const char * const clk_gpu_parents[] = {"pll_gpu", "clk_sys"};
> +static RTK_CLK_REGMAP_MUX(clk_gpu, clk_gpu_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x28, 12, 0x1);
> +static const char * const clk_ve_parents[] = {"pll_vodma", "clk_sysh", "pll_ve1", "pll_ve2"};
> +static RTK_CLK_REGMAP_MUX(clk_ve1, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 0, 0x3);
> +static RTK_CLK_REGMAP_MUX(clk_ve2, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 3, 0x3);
> +static RTK_CLK_REGMAP_MUX(clk_ve4, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 6, 0x3);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc, "clk_sys", CLK_IS_CRITICAL, 0x50, 0, 1);

You are using the using the old global names but there does not seem
to be a good reason for this. Your driver is entirely static so the hw are known at compile time
and you can use them. Use .parent_hws or parent_data when appropriate. Not parent_names please.

-- 
Jerome

