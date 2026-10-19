Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440848;
	b=0jRh1k1bRyLAOoz0RVS4lTxmBoddP48kdrh7HxPajKxfYBq3T0Xi/+PZin+3VQrqrOwk
	 GZG+22qFiesqjPTYozNz8m/T0y/y1FEMiUpUTwUR7xPUJeqJ6wY8PRlq68dDewC489JHy
	 Vb3ZiV83tNC5OG848kFujKaxDlZTXUdjCWLvsoY7OqI6FexUHUXPsMHW0hMqegcx2ZhUO
	 oJyfArhAF1TpopmDdyp7+hbzX6tBGb0iU6RnYD6m4eKE1TEr6/AK/obh+luGjXvU8fhFq
	 TuWQU+TID3CZqt+iB7EW65OsEf9G+3TSDaUTJO4i/v5Zm/gu/A+CPgMlOa6U9kCwncg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tQ/Eevs1qc0B1ETH+DkpySLtNug9OnFGZO2K4RbuMeA=;
	b=Q8ehA5ipjbDz2BU2Iau477bkQmcYY91hrp7zot19m0dctDEB4mQbZqKWkevvjYaPAHHU
	 0nxjrjdi2sUizOGw0EBNrswpgaRsjmt7l3BY39bNyscIi+X0beTcLkQAoRCF8MGdv1lPc
	 Zj7WorIvLixApEwOYqsfNsW4bX4ds3Inr6FlCT4WgvhtkXMcNvLVTWDpnzHFt/LSeNd5L
	 Ay3iPRU3DWUAKI11M3yon69iPPhHk+0hRLsnrxLKmA7MasdpXwZDyjeWZnsz5K6ZNIlZs
	 Y/G20EiWzOC6oWYzocN/5zwP7JrxRp70QDRlRTpGL9JPYWsKCTwfU2hE3E2XQzLbAwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OZYO12Yc;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AC0606A327
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8AC0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OZYO12Yc
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35943f55c06so78898eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440847; x=1793045647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQ/Eevs1qc0B1ETH+DkpySLtNug9OnFGZO2K4RbuMeA=;
        b=OZYO12Ycc3vPEovHCGXwJhPLH9PH1fd2AujveGshzfQ/Rw01uCafBZwim39ej9ASUV
         guuW5V3SZKVydXR3ZUZ3yc+h4hzTZnrhqEjXvUfAwTEVNzimmHXJ6YonKewbdT7NYMMI
         sCdoYjFsEZRpPhoWMm7NR7i3X5bSZBN4Jn7DddiWfMht8mDIlh++A3O/oWjzMnO69m6q
         akoA4GmY3x69dOsI4+Fj+SvP1If6MACbhHl5VntKUqx9Vc/4UR2+wG4w/CqMvYCq7QdP
         dTUayBZFnj9XoMar36s5CCfHb0JWa3u1lAmA/F1eQ7vtmdlVcj6lyOWCLJmEdAFisgUz
         Xi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440847; x=1793045647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQ/Eevs1qc0B1ETH+DkpySLtNug9OnFGZO2K4RbuMeA=;
        b=HBm5x6kfIHslq5ThXYy/J6wz/uuwcosR7foOpr1TqQDWHoBWLpKLht2dEx7O0Us4ib
         IHjtvaoMlxkt/aFQ4tO5mOkeRdPGpkEqnenxMH0TDV7UzKgVRC3+oD+2YWDq5ST4cgkc
         YJLlB5wgzWeCpgs6nUvEndTfHKqC8uh8bf4fqKhyIRceFbLjQY8g1xtIXc1AJ+LQThZg
         J7T3KbcWLltQbLWjbjxPcDHvkhHuRjlj25MTVY1E5ydnZ2i5ewQeUSNlNGCHJsSzQRBz
         HQiOSjhBXdsbUUgHlPMK7g46yUxLR1u9JFfhn6sOcTLDUan3CuxNdlkgyzLV0fd9ItMa
         QG5A==
X-Forwarded-Encrypted: i=1; AKwUvBzAhLnKvWNL6oJqRwmrRYC5t1eOiXEeX4c3qAyRMfihF2DydTaCPkuXvquOIA+0/DRKvF3928wCzQ0D9gQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqPAbkD1emwuKtUE75WV4VtTD0c03aRWLM5WLlDmsiPedJYNz1
	SpJGuKS/TH4iFMM3W6EgyClPxRTfudAanWRAg1/GGiYvcDkwd3VwInZt
X-Gm-Gg: AYBFou3gKFxahv6tcE3fA5qxIndeENMuEGxOCyVssPFD/wHJHcTLKtya+uHDt9k5Du0
	rE2zZWTJulZTnvmvLoxPYAQYtSs/wz9ZftaU5PQvrwwn8xtv1dB0vB7rvpJaxXeFmX581onaQGQ
	yxsAAyVWLjFTTgcBg6j2gOGcVQXnAZ6SJQPGhMit8EfF7p87zzxrXsRYRH4xzHBEEjvyFFQN6en
	Ilrl6xWqmGeXzaGOX75YcuXNAZkf3GAh7zchj6Orj3b0kHyCUcUG46sf3Bm2O5G6nLWnR/vq3yf
	aN0QR71OgJXb7SXAIUAO8j3a7BH8tYVwu++9kMwPwm+g7ZATC4xLybXvj+0QpB5WyOuPux0ieRg
	NWVXhUGvPqZTOJd8eotaNE9pmRTtlq+zFOd2o5oGkG3QA3tc8JkWhVOcD2V8uOqnVnOpHFLRxjK
	mNWzhqoAdT6HM3TBww1SVT3xj45nAf/m0tGymigaH9l/amxONeZ8dnZyfPhrPuwzmC8j2P0KpCB
	fdrUZeScpGlEQ==
X-Received: by 2002:a05:693c:20cf:20b0:363:a45d:10b1 with SMTP id 5a478bee46e88-365fa49061dmr230217eec.5.1792440846820;
        Mon, 19 Oct 2026 13:14:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm63348675eec.24.2026.10.19.13.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:14:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 13:14:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: victor.duicu@microchip.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (mcp9982) Update the interval cache only after
 successful writes
Message-ID: <1b0a818b-55ea-4f7a-92a7-721e1f78a0fe@roeck-us.net>
References: <20261018055750.1318723-1-pocj8ur4in@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018055750.1318723-1-pocj8ur4in@gmail.com>

On Sun, Oct 18, 2026 at 02:57:50PM +0900, Baek Kyu, Kim wrote:
> mcp9982_write() updates interval_idx before writing the conversion-rate
> register. If the write fails without changing the register, subsequent
> update_interval reads report the requested interval instead of the
> previous setting.
> 
> Update interval_idx only after regmap_write() succeeds, leaving the
> previous cached interval in place on error.
> 
> Fixes: e2fe950f34e5 ("hwmon: add support for MCP998X")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
> Acked-by: Duicu Victor <victor.duicu@microchip.com>

Applied.

Thanks,
Guenter
