Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626841;
	b=u/C8LvIEFH7K/7b27OvhO5kbuZi0Hj5oQbnj1mFV36MeNOi2OLhqp+IqR06K9HMWjhai
	 S8tvKFi/Frjp6WV98XwyIvnv2mKD5OkJpHSTbbmAemUnM3YBUilSJk33hQvKN0wAaky3r
	 Xdv3zQHHOSzztGuFJfmto7NjRKdxIeKpMYQsAKOZRXWJHUFJ3OWSLnNG9qMvk5n0WvME6
	 MerSSCkiFSIwKzeb1GE1ZcYL6Lq9Y4xNhpcT6Riv3rXVVmPWB71j0DdWq93J4dDDnsF0t
	 vguTSekIHIDXj5DGXwykaoLeF1bsLMfrsid7MV8QqC/hFNfrV3rFRR8gq84V00gLKIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
	b=UEfC3/XUFyiHAUy0yERMPVKO9wco9Pq7sJIF6Ccm+cqNnkItQ2fjHFySnx7l9j5S6o8i
	 K4QPguQFxpYfypTDZJ8uKZrs9q1lkvHMr7V2j/jXJ3e3C1A8RlIoexZl1RCrtqPNuGTSX
	 DGJnTbVvvGQrTCw8aNYHotGoLV4J1VLcEpwbx7u1WsggbL282xwWartw9Sw/I5zZmKttd
	 8ZmrAFUeWh/gSyTHHWYr1bnnC8eyYafTlpc2C2FI6foWB3ptDz5eDr+p1KgrOWG9InJNX
	 ZF1JGyOzPQd3pgoEWa8sENN2BNfdMhh4wH0WZfEbA3xb0XGxbG8Z+Wu++OKajLSU47w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eKDDCBxr;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E460A2624
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D4E460A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eKDDCBxr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so32286075e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626839; x=1794231639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
        b=eKDDCBxr1jifs3GGoiY3wlWPbfIy6T3C39vvqLApgT8wdkVycBRSvTs2Au1rJTAGOA
         zlQjjRHUw/Cm5dvI23hf/BrF6Ls2q4vaGIi5d4/pL7Nb94L6s30Z6Tb8td+AnMtjJLmq
         9+dHHWPjFfryCAQSssvR2Oqa9Yeh2xiuptA1eheOo7bCWPo0O41DPJrXV6WooeUMORRV
         4CJAuxJOCvlDhmWkPCSr9ANhNjpq4Mw6EQ/FQweoKqMSuDpOXmJrIs23TE/hmIcM/FY0
         Y3S5b5AxF0CI64+HLKQ+PlAf7O5rlbje6WafaHonEOPB7Q/ulotWI1jaKBMjQ0xDsCT1
         oEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626839; x=1794231639;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
        b=v1qa+qVlZq1BONjmTkDbnknbBIoDwH/+umBRibQAFcC/U9i3qzy+UNFF8GHPO/WR0q
         WL2LSh+ZY26uSZOvbDi95jOTjrEMhH20rBKO/MM2FYn0hLP6iM0W4NHRsOZua5Rtg8G2
         8jDcbSUGSOhVY5VUROYqIUTtk0TytuvL7FhLHDCLLodV5Mg52h+TKixc5fef7CF3/SgW
         DWfUkqFv2QtlriJgKhV3fLQciAr3GSnZwNINBnueXiSfKgJ8L5x7UrNK9IyMjCRIIT5I
         TqTzKrcQG4zZ7Xqj2x21iC6I08JWVET9jA6CHe3am3nVk2G+baSTrMTriHiuk5VRyrDb
         9XRg==
X-Forwarded-Encrypted: i=1; AKwUvBzxmz0lbtLOed5O1rww/2tJ4Dw2aiMNHMzMtcgm7teNdZh3HAnP7blxxwe2g3v9rOjN3kdYzmDQUin+GLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc9XFc42vNzbxWTBE+SlGd1XRkLdRJD7TknqjIbTJ/uXQNM20j
	aCltFbvtne0H8jcLixR5V8wVnCLS31C9/tzeUOJV8x/gOzXb/7sCMj/0eRoWryXNFEQ=
X-Gm-Gg: AYBFou329NIM7QfwPYSCHUCRlrwSO0L7ECrUuBEiG8+SR/dEsHvcgChCXXsewh+OPda
	GXdiwkfGUK1NiDjpvl4KoKYpi6FiwMwr2hqXqyrft3Likth4XKTeE549RCdwToADBGea6CyF5BY
	jZeO1Oh0DS6yK4jV+ogISr91eWcsk8few4WIEMVT3ucGgEghoDR9L8xET3cl2w0TaBb96Bur+Kh
	k+qWXorPL+KVArB3qU1HZn2ATOQgqJQ2gAS6+bp09xnVGx4FoCQe7sBpExj3diwbMOGjcvYfWgY
	UTL6jpyXEvdwHq/9Hepn9p4SYeGwEKwDbDneOromXWYQXFQTufsxPU4wof4RnHSKi0x0VZZ2/lN
	k4PZQepOAkIECfXSgD6jj1b8TEL9P0oZ6qXZFWY55sM7e0BDQkr+gke8SrH+KLVE9gaZFiFLOfh
	6z1HL8moOqy9+tfhA5zfnhbC0mL3uir15WCeoDVvsDC4QmpCRjed+pcxYJbBaBTPwGYjJ8NAjrF
	ET3bm1PHWyJ3Ir2+LGD7/b5VqcwDc6PwvHt13UHa3lXVYBuAcIWbeQNLIrqIMy30Jv0bkafxuPA
	/ezfmAEwqbUg6G11gxDdFr+Sgmv3QQNfdCWfZjfC9R2Z5q2pag==
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr237869415e9.10.1793626838793;
        Mon, 02 Nov 2026 05:40:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Primoz Fiser <primoz.fiser@norik.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
In-Reply-To: <20261008053850.2941955-1-primoz.fiser@norik.com>
References: <20261008053850.2941955-1-primoz.fiser@norik.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: panel-simple: Allow
 "data-mapping" for "auo,g104sn02"
Message-Id: <179362683780.3310106.8889373164273856192.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:37 +0100
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
X-Mailer: b4 0.15.2

Hi,

On Thu, 08 Oct 2026 07:38:49 +0200, Primoz Fiser wrote:
> As per the AUO G104SN02 datasheet, section 6.4.1 "SEL68", this panel's
> SEL68 pin selects between 6 bits (SEL68 low/NC) and 8 bits (SEL68 high)
> per color over LVDS, i.e. an 18-bit or a 24-bit input format.
> 
> Currently, the auo_g104sn02 panel_desc only allows for the 24-bit
> configuration by default. Boards wired for the 18-bit configuration need
> the override introduced by commit 1cd3ea3e4b12 ("drm/panel-simple: allow
> LVDS format override")) to describe that instead.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel-simple: Allow "data-mapping" for "auo,g104sn02"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/47459027812c73d4826f5f78bc8291cb59a5de3e

-- 
Neil

