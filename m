Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272077;
	b=fo+5+dw0rwO7L5OD4YJvL0cU0hYGmhhkwGlPe+iUW1oUWFQ4p3fn1OEdctBYcmtA6Q7g
	 OW0GhEVX9/2tu7tSvLnTQrdm5sevAon3h5ZGshIVoVXu5qCWt2vAlOUc2SSCjLTeg58G2
	 KvMJx5eCc/LmDZQMLHL/YyGeuKJw9Udgjh4Z6b48BhSaqzHxD17mUePnSsFcy4tYsxoCn
	 YRz7x+JremrgfoVdMfGeOXq4Jk7lCZ535qx5il43ROMsGevvuaGNS4P7rpjFoFppmHOgZ
	 BePZphwr5vdJ4p6ctkYbk5Kvjg9AJ2gez9Fdjiv2egtxlh4+yh5da6qEn6skJVUGkPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=;
	b=w0HblHMBdaMyAd+j6+oTEwzfWwYYs9BBqT0jeHb9WcFJBIFU5ck2iOtvVYLuasHL/wAB
	 IhzVFEJMOLpi9870WB/RDqvTxhgSnM/uRiif/lq7KTp6QRH+PVWiqfGFs0XU1Q8Peznvh
	 qKYV5dPybhgaqK2l/VrnRweUM3dC2d8+wfclefQYukVBu8HmMqgQz6LArwCcr5DWIgq3t
	 5hVpWR6I7LhAUx0jag5EwDrdvIl9fKbQv1KjROFh8U2V7n/n10y9NI+cqVfSPdEykTJAy
	 7sh2GlcEB79IsgjmLEz/dnBqfW1OcoSIQij9mE3ZcGvXFnzD9Js1PstEadf0oLj0zeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b26XpTLp;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1054606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1054606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b26XpTLp
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so9856505e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793272075; x=1793876875; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=;
        b=b26XpTLpKF6fBgd1SpM1HN3YP++sypJAEWKvuHcmC9SVClzkNN6Ro5HAoHq5Ih347h
         CSu13J5X6sy5xPVlTGXIM4EfkbKz5t3s8YA86w1Z78aQQVqr5w5JEg+opd/RJtaPH05d
         G9r9aEoqUR9M2UsEc6cRYBJSVno/2g9dSaf1gZEiTTZV99IWHJIqpmtK28yWeNodQWF6
         7lIkO7o7U6Hick4F0ypvW4rcDlLCGoqHFhpYAdQzg/6muM1BuV882NhJP979ywAYYcxi
         jRRaNTd1LLp8+jkfLjNLGeWDdW3RF/qxKEXAXInps/XspLHdp3iva/Z+J4yGr0oRBfiz
         BrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272075; x=1793876875;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=;
        b=g41EzMM9fLLxgWvtn9Bq6Qm5mgQagZ2hvk9XjXhP7RPbsiaFW1YHX/uzRpwicwpJUi
         F23V1tAF69KFtQs5jW5F8YTf/zZYGA5qXgsOVRKgWKJMsfuy+O36mzN9m/1gygqCqOZy
         tfsgKxoVkuJoJ0EC3veQFLoGoOBPg+83iH3xDUuGpJ6BJ5sW9c0O2W4KD5KPQK11bubv
         i8jCBHeyPqcALQkIlYza56TvYhaaS1nEZyLYinr2Ny/+jscIlduZ+vzhrNHQEBsAdbtm
         sFR59aKVL+6x4cOuM1oo9iAUwbsru6CWuWKyIUbzvgyR6zqwXvTxjLuD0l0u+tiopAf5
         /z7w==
X-Forwarded-Encrypted: i=1; AKwUvBy/W2uu4guOk+2Nb0RlSSWIySbwvUkwy4+5rvDuqGQ1yMPtwt+1o7kXLN5u70Ve/oPG9sjvyWoe0ye0wDw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt1c811hmohkkud7HLMFuKuMOuboJ/FRh9+DScxRvHwKOZiuZM
	F9Cj9L2H0BLKxvLp1nING07x/LVignuwBCC7+Qh+5YdLejmKu1zhde3T3LL4A8GclTc=
X-Gm-Gg: AYBFou0klqoKafhsX77nJ2VrEKKHbbsThR5SZVZY0BRYaLpxusRl2VmOdcmxZjYaOl4
	hkUpCymQoTC3LQlXTJWp1ws/MGbs4NNgn1lRAphjV7gdm2Pp6Cx4mwttHF0m/mI4F6RA4vVcsEB
	jDPklNOJAAMHSdXOPufeEXd1BkMolLuwu8heJfdP7dwTw7slc3VVQ+TJrXwUK2Y3cQJ6I4zCYr6
	S+JgPJgiFnarcjRtuyDoPEaV2MaWbKqnquxnJV+wswhsMrNdeUTU15z3q+zv/EOcj+P9KqbOMkE
	6hR9rEperoe0Worlc4s08IyAHP3a9n0UcB0DSCWWblPkCISG3/eR/UqGqYU3TfQuEez9lLmze1s
	5pT3R+AiKaK8neE0HJNLSaHNqudPFgGMgVqXnpW0u9egyjgWwViDuDeVNsBkj0lnkqFvRHKbxgL
	VdQ6bMDvrEuOb2QdHtO3JphWWJJvk0P4lub6g96Wd1mGx3jnXnNFJirrW3yaOCUfru57gxk/lwJ
	xEUab5C/2vrBHTFqw0EMReWgpEXBcvbaGjFuAK4DNyenKbzkreRbvfgD9FPPTCbdbotW7dGWzuu
	E3NV7SD/Su25doc+5c/s/M/bJ02cF80LA0Lk19mQpDV4e6/ZnO+qgLIEBUU6M/sJ8wO4vw==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a965dd3274mr123729855e9.11.1793272075153;
        Thu, 29 Oct 2026 04:07:55 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f41895fsm51035565e9.5.2026.10.29.04.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:07:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] clk: meson: regmap: use the current divisor for
 read-only clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
 <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
Date: Thu, 29 Oct 2026 12:07:46 +0100
Message-Id: <179327206664.1865333.6840169064466594528.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=586; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nrVNC7hHxSqNoUqQLRJq4FIPYelw+3Hubgb0s4fcz7E=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPNTmumOoztc4onjjRI3Jmxovpf2OeJ7SY5/xuKV3pv
 8fffgV3RykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbSJczwP03juURXa+0zXYU/
 u56nXgy9r/GN5TiH6OJfAmbdG2vuezIyXLtkpNMdHKzwRN1b7ofSgcQb547eWz7d+AjrkuO970/
 xsgIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> None of the Meson clocks using clk_regmap_divider_ro_ops set
> CLK_DIVIDER_READ_ONLY. Without that flag, the shared rounding callback
> can choose a new divisor even though these ops cannot program it. The
> clock core may then adjust child clocks using the wrong parent rate.
> 
> Make the read-only ops always round using the current hardware divisor.
> Parent rate changes remain allowed with CLK_SET_RATE_PARENT.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Fixes tag maybe ?

With this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

