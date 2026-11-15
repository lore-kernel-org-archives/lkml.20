Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731194;
	b=zaFSmr3e2R2o6vZerMJPMk0YlAKx4Xcs4EU6hSxGZbp77mbh8FVGoFIWSFdk/av8e/6K
	 /ti4uxhV0hO2BNIILcaPqkcMpoNEqN+VwOoyyDYrNLuKy/eCyUMAvTUr2H+/csahPyiyg
	 ETLeQzds1veVgUTdNxKAbXVYQNST4LWH9ziXiqPzHn+J1QZ8G6OGgdMUDmd0zIzUtSpvK
	 jxNAIIDYohpURpqT0ZYdv9MPwX/mJAMQgxYfK+gzpKJEH8MZ+rdQ5HbN+ySh/EO+/Qr/P
	 KlD2BIBmHhmG0Wyarb4y0fsTOBBS+FQvi8lNJJY66EMMwYkEyS31RfiuiJ54bOM3tCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=AEWA9iOD08SFA/zlaE7wGAZjLwI2QLYLqoPd1RCuPRs=;
	b=B+HGqXLlgMI6FkqxKPu278RRB+IqgLM/JUEJfnZjHNstdrzqRJ8bxvcRBCZGVaC5uo6t
	 6NEKapHRbCGHy47YAit3SJZa+uqafj0F0vrwmgY5k3eoEeI/rLtExQfEQ4Q/rk06U8BV2
	 Ss/F4druYXXH8RdTCRa1FA5R/ZxhHlMBvsBWDBulOLLpSlXRRM7wu/H8GvV5MyYGF/lou
	 TkVML7NgwHCce/zXDdfgWuPGY9v2iE6a5teKJn5DgnSnEjI3N+PmXJDx1XQlgUWiuoigF
	 UtuiLNojcY56DvWvsqgruEz6oSzgUjP43/0w7l9qkLeS2dbRB+CZvMoZgxaTlzMnaiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tbmZxUl/";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383F9606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbmZxUl/
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso319261a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731194; x=1795335994; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEWA9iOD08SFA/zlaE7wGAZjLwI2QLYLqoPd1RCuPRs=;
        b=tbmZxUl/qesdX5+Syl6V7aTnMIAu2eBkAVoROlQBr8b5UmewMMSHNpwUV9XlVDvJ+b
         g+ppXiGL+7qosPUNsyJ/TE4nDKtdK0v5hM8fkk425cEFVFF6648Exbb5xS6NgkcgHBa3
         P9clhMz2FmXEYJpFe2asRWs6JlSXYT7tuumGMQnWnqpF+s7u8NpJQlo0gxCp0D6hbsar
         +bjG3AHdNFvwcxC4ZHNE7m5IiC9REkzUdnz42HaKEkJvM5clJAgBDuh+WlLKlU1AwPVr
         RcFX2iBSak1NAAIrH+7fZ5C+MD0wlnMuopRADpYvditm0jx7ZrV/ZjXoe9hG/LB7fpRA
         JYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731194; x=1795335994;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEWA9iOD08SFA/zlaE7wGAZjLwI2QLYLqoPd1RCuPRs=;
        b=ZRafvXpvdFSQOryGafhSHIzBW7ikyQBTTlN31Jq10O92/cg3GUSnJONERrxoDxr/OB
         tM087I81DQQxR9NmbSosQ/rmYeamD9Ws5uvJc03ZSUZ31ze2WuSWMUzIygMx8CUycJ3r
         Ltqk+rsBUttYiMk3woj2xgVPPJCgMN9npYrmrDmXWYKTrYRiVe0gRT9B/GadrGigvrPM
         kAfkWATfx2VO9H/OnCSdpnYtxDKbNOtaO7bTCk1GGEJn15w6jKgS4BwpZQyr8zzLaNdw
         m60BdsbtQLU/Fl+Q75hP5oHs5tq18DO8s0F16KKI5IeNoLaWkrBgtALjNKcs+1me54cg
         XWmg==
X-Forwarded-Encrypted: i=1; AL+hErGJe9OgqOG4o2aaY0N1kF8bH9jfL9Lv9quAuRTpgzO6gGY7cLKUBDO260Y47hFy9BFbc7O7dK3k/57SJs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y9C+E2diiE6gIfAX31ZQfyjGd750IhzP7EZtwl7e3KzcaK0K/
	mReZcjEv8yg59djW6CHNKzeXfPNxZRqwP9ZdjN2scTcUH1mWwQHUdPMk
X-Gm-Gg: AYBFou24QrX1j2DnAjLAmBSiWINfXtIXI5BTg4dDN/ycUEMM/QRdJHz2g7Yoe0HKMYM
	ICG7bZMno5fGF6hXBB7cj2qY6Y9oc/CtRRKxfR89JVxuLp7vsJivTUOeouHDyHJdSWeIC/jTXP3
	02nMK4yztfWQsXn3uWLPXAlUVDnTjAAxAVIKB2Txvq83b/VF56h6GoGUDB0Fl75NpQozw2nbrqR
	LjBTd9wSdjjcqk2vxVUY6TAdfrzON6UNcv/VX1uZ0aT8liozXRRCIYkcObNeHnKAwSTG85tpe1Y
	r+Tq4zsfxHyO2JIDYSh3osBuFeVm7vxXksvqrVhOBjL1+1wzWKu+aRLX4IdMot7q+C/B0KQXLid
	+loZhGP7Ed4a5CEfuNpg1XvvTAGY1O4kDkFiWYJcdC6162TVTV5ZfLO+82LlUxsJheRCHuYndUz
	O3Z/Ys/kP2vQikpy8xy3RYOLSvk3CpHj2OgnAT2Fr4jumAo8bRZPHzGZeJU1HeG23yZintkIHdh
	NqtjY28+b/MRIwrIza2sJtq5dgwkF0NhioJXzCF+LaEalU1pP3RbgnnZUsK9pRzhsxeMYoTdLop
	Fbff1iOCEFg7p26bNIRZ8Qz4IM2pTCE7krxcan/ht9GMnNIvxpo5YlFEhijJdE7Dq9T7NEkDUnN
	HT9Y7kQ==
X-Received: by 2002:a17:90b:568b:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b1b0815b27mr11488600a91.1.1794731193623;
        Sun, 15 Nov 2026 00:26:33 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm12961779a91.11.2026.11.15.00.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:26:33 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Alex Kazinsky <a.kazinsky@ideco.ru>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject:
 Re: [PATCH v3] media: rkvdec: Handle interrupts without a current context
In-Reply-To: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
References: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
Date: Sun, 15 Nov 2026 08:26:32 -0000
Message-ID: <179473119253.4041300.13173694154528880101@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Tested on an Orange Pi 5 (RK3588S, VDPU381): 7.3-based kernel with media
next's rkvdec, this patch and my watchdog fix [1], KASAN on, 4K HEVC and
H.264 decode with the watchdog cut to a few ms: 5955 timeouts, no NULL
dereference or KASAN report. I did not check that a timeout actually
raced the IRQ handler.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

[1] https://lore.kernel.org/r/20261115-rkvdec-wdt-stop-v1-0-59e687c6cc63@gmai=
l.com
