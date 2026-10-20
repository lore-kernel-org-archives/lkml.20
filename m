Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460451;
	b=fMToRdN7S8FWzxh9t0g/UZCOpTEMxjQdjU0yb12Z9W2nxHDezqVLvROlkqnNsEWbNvK6
	 w323YecNFEchxuYeAKBj6rS8BhXWuZqjErJqqho56UzgEu/P77nwNbjQRqgX1KSdAq9iW
	 r3Mxz/Y3Pv8auI3j+iZp5M0w/DN6zWcWNskK/3oWpTYYYJxQAVYJBh1RWlsCWzK1LdX5s
	 6Te75h/UHcpMXRowS7MSMcoDzXZU1Ti/tmCVmEAz3X1tgi04YxUEUMeeJLbajUmeK9rTx
	 Wck7N25ht80fJxPP8klFzzzQQCYXCrJARMRQ/OYWGAnkRlrl5277LkP32S3vCuolSuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=;
	b=oI+G7Fk2hGpYK2uWLws/4vB+VOAb6HBKvX298Yrv3aqtjwVI7iQ4tExwpVS2sYcvf+CZ
	 grXjN60El8ovVupkUUoCLP8+XkktO0V/1yHF3LUQ7J1Dt+i2eLRkwlrkQiKLotFE1+cGG
	 fvSJwIEBkacsm9z58v1RByEFkb2tOkbwzacXFketDsxkLXDMZBLLnh15bTphb0OlYh2Lo
	 9DPNL3n/YFX82ZSlHrbaXQIx9cDuLRhOJyh2wLj1lLv0mkr0/nv2ynrSLswU9At6ljqki
	 oUdX1rR/WIZkR6AhW+MNlOWMd/SBjqXHCp1KIONpEcsvwYOoGctLjJjceKreNI4j9Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yw62Pw4s;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02DA606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C02DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yw62Pw4s
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5821138eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460449; x=1793065249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=;
        b=Yw62Pw4sArCsnM4IdWA5utZbwB57JnrIB/2ksf13OnirkbBAHxX5H6BkW38Rzv38V9
         Jin482MenoCD03jbOZlXql3n0wYe8AzMAabGsmL3kspaZexEQrB1Z/FIIjVVaOLNSFMV
         REXeQKHygLmkr1iDNCPmH/vWXmy40RIxqgHqjWwBfnqAJ+tVBjH2Cza0VX9bb6OubqNu
         J+VoR4I5sGLm1KHMh8iKnS+aFN3TOnDt7AkFQRiqD9Uc5+gRF0fKtaaTiVl2T8hQycA/
         EkdF6tf9SBJreYCotdl8RwOB+iUxY01relrAtgBZBt8B21DI3/sXa9ZG4QOUg6yiKNDS
         E0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460449; x=1793065249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=;
        b=XMFokT+Y+xU+83sD04nHzXfc0YjgSsP21WRi4SpTEx6ZbJseED1AafzH6n8X/J6vnx
         uWz9W2mrdkd+QQNhKdHoSSPPyMPKQqKBqiQ3z+w2Ac5z8ScJq89yw1HgEs8R54eO08nJ
         +pAreSSMpjGN+vMr8jMXgesNn5kgZuzXbrDZX5eKKqxunKJ3TNCeZPEn0dfNscTENy+E
         u3CIVkxdZpK5CDoNf4/BPnb2ynh59+rUjaZTMMIvnCSKf23L+zWYY4dl4C66Xsq07ZXb
         zTSvIGvZ29tla7OVIBQJFwgVQ8RRX1ynMM8Zs14vozri+MT8607b52lcdinfuFj+7ugY
         7pQg==
X-Forwarded-Encrypted: i=1; AKwUvBwTP0SgBN7CnqvEjqa2HPTAIbLTxYtlxBnOS8q1YHPijPyaCQu4qECBZOHR8qxcg6Sa20BjVeWPrSkQL/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhp+bTDgQd++1nkKy4zSGTEf2VdAw5dwrvSKxtG/dhF+pggGbo
	3qMIShuQ4yUlhwtCNEFQpSMzjWmxRL/JwmSXQ+hO/wFK+Gz3ntoPpSRy
X-Gm-Gg: AYBFou2GdIIuI8n641GqwPeN2x3Au0ejcpTTTpN5KNfrsj7k/4bls9B+7G6Gm7qlsxY
	xQjW91tNtJ17XuvYWQfWxD2wjUtr74gSjuYzycLSX3dd809fJZSf3q2/v0vJHjpmX5ces2FJCms
	MKXgoo93ZoQGbZZ3Pp5XBNuCmr8Gs8buzuLtk75CHK4gXuDW+AyB2Ctnd04poljDmkShwAfrs2w
	QItlTgBsRl+jLrVPIrkV9TMB0Sv25WoXPD6L+gFOeFMmEwRMSEOKBS1dayIzBy0yugcZst8bvjx
	rBV/Lx39Y95l7axVJ8joLx+wQaOeqaBuW+toDkO2m7Rd6PZH+hRstth5Ltg/Xe4bOyvXbGcDqM1
	0+FzI2xe9hGRYSv+d+aTo8dr9YiGAGWKexRnG+qwtxcY5QXEkPr5Kfqvk96ZHQEaD+Udocs7gmu
	0ONUhj3p/uSTcJVcTZQLiHT1/BONZ/uAVF33gHzEnnl5MfsBL3hSPPUSEuQVEcslyJ+ZafaHKKw
	BKQemm8CJE7
X-Received: by 2002:a05:693c:810f:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-361a2549c60mr14463175eec.26.1792460449367;
        Mon, 19 Oct 2026 18:40:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608219f838sm36078733eec.19.2026.10.19.18.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:40:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:40:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: watchdog: mediatek,mtk-wdt: Add MT8163
Message-ID: <efbbf24a-59ec-44c7-8738-13242c7cd90c@roeck-us.net>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-5-f2462b2d2437@protonmail.ch>
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
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-5-f2462b2d2437@protonmail.ch>

On Mon, Oct 19, 2026 at 01:40:01AM +0100, Ben Grisdale wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add a compatible string for the Top Reset Generation Unit (TOPRGU) and
> watchdog timer on the MediaTek MT8163 SoC, along with a header defining
> the reset IDs it provides.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
