Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595305;
	b=NPW6RUnMEHnXHJEaogKBgSbYQRYOW/P1oL86oV58bhXeostx003CqHuVz0ZvNRX9cmsl
	 d158I92vp3KSJ84dxoaif1hIapjO41RC9ivOwxBLfVbFS2GCOGqKVirlllyG8SIEdyGzB
	 hFYU0vkUuvhyDcMCkw+glMjiDlWulecnBviQwjcLpcv4PjL0YrXDjv+ZNOs3cs0dBnBpA
	 g8E2jYcRcSxZts7+4maMbwXp/fcPMmv/uKKhuwIVAvbDjuYdYgDKZcRYvNfbPlOloIJTm
	 mgcHYpclEsO9iQYyQg/Z5XAHii0MlN1nX3e8agK5LFf611TKkcmwMOwa+lGl/hjwOqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
	b=KJaejd3QnADgNqkRzP4rTadac3YI5KdWr+7AogknkQmt/NbZBYIcCfduIo7rWLFnVDOM
	 vZsRgIYTH9S/gXff9GnkBZBYD7Zr3zrrJWHq9A+kAqV3yaN5i6xbF/zfZqLrcKasaE1ac
	 wJWafYWCKVZJ8xJ346xYiNu+WcORmlbqa1svctVDrsMGBEiynoSktD3KspGr9j3zDOj/t
	 W7ksaJ6CfBW90AUA5n/Pl18eM8bzerGhP/3cfNFRC63PgqpbdCvZxbPcA6p3UoeD4XhCi
	 rTt5WJcvBX8NaAYyEh2rjfIF5OBj28I8MQVF3mIzsQyvFyBU220LE+7NvGScgQQvSaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=piUDd26S;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485AE60A2628
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 485AE60A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=piUDd26S
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e00eee27dso657020f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595303; x=1793200103; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=piUDd26SiHJsttMQlpJF2RFcZTqVsNgoVjeOxs6QUlmSk2QvOxsnQe8Ezy6yQxygv9
         bp3/hR8JIyALcdkS6SSpS2AHB4HdBi7PdgvYLqbsQRIf17orPMnj4ifgCQk5cHr+sPPm
         tXiTnTTlcltLlPAu+s4rrXOfdiXteziwQdPn8dZSiCLWnzoztKR/MGbNflI0MIE8+Tyd
         Htj0ZF4Jh9LkCr0Cx8FB5KGXm3CipfZl3kU2Ovndgb+u3Vd06mfWkbeZpNEJ/O/06DFM
         e1m8vcZdExPaf4EvuTH9Uuw7fw7NVZXJUGQdVpYUNMMz1bcEHVskDrelamoQClz0Gbjb
         /eFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595303; x=1793200103;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OE6HZ58afzSrCKfxYeVUqdKEpFKAmKlQXDzm52PrLw=;
        b=QmkxZ64z6U6LRMEyEOGp+GxIXn3WIkB2w4pMuz6eBjfqOqzn/U1jtcwGl2CQtbAjGG
         YWai/5fqkIOS7ZYv1nveH5m4jcJtzGZw9wGRATlAItdNmqTJ5DUrN+mjpE21Han1ZoNm
         /btjGIsDGHsr3dlXkcP4OHFzy7qLwSk8IiXiTjZMmnEnDxbfS012zsZiU5isWmQ8iy2b
         5rhFEJ7CIkKFzM759qi/PkOHL5hcFW19bNpba38C4yrZ2f4T7G11TA5qYtEcSLemvZ2K
         aK10B3IEJsUGP049sW1wPPrGlSl8hF5FEwNsYKwZtSBY9g1mgw3XuLnutVWQWzz//LPn
         ooFg==
X-Forwarded-Encrypted: i=1; AKwUvBx8REKgOm8+mb+iO8o/7yiCZGF35JpwtbxOrS11MwWMSCKV3zV/Z7UgWZJ7aFIyS0hhG5t7qocJrGnFWOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt5yYkhNlW3XQFJrEg5CZ+UJbqnceYXAfr++mdjywh+1jAL5mE
	GPvLNznxBiUUJfo57wJmYx/N3P6c4XHcjhedqgplypZ/hRNYUbgioCxh3RHinwNUOyc=
X-Gm-Gg: AYBFou0z3bhHKRP0IwvY249K6q2WLSdhTy9Kbx8EWycEpDvQ1KtSqvBGgj6jaFRZ0NA
	8zwe9gJ6D1yz5Na4yVRLYVKCduxTpwYk4DtRnIPgtQ7suTRtWGKu3eVufx4sSjnjla5XP75yF9y
	L1e+l/SmF59Q1s1d40T2QMjAo4vfd1JlO12P+9KZT1mWGSwc7Kbt3X90zw/azX/ArE9Fd+oaAP3
	MyykZ03oD/8xfXnAuz5WUPEzITod8o+2FTpYu4JsMm1QU9/yr+gauBNbwRZhI4k/EjqYhvXvoND
	SLid5eRRKgNaD1UfGc2/fiqDNe3GZ88tx5W3zWJWAimPp/SHQtkaUtUY8JWkHCbTlxVnH55iDCR
	1Bl89AU3bGEcAL19DdEn1N8QcoYclZgcuGxOA7ohK7cSb1jgCRjkD/Rvp9eALBhHusguoEkR6zS
	Tndd31t7Vj9PSEfodWqsEn2Xwop5p3FVjlgTt1eddtPt3J6Nbf1nkbwzgbLZtkua55U+hCNaSfI
	xXAqzyF51dNuIJLcTxuobb+cSbYE8nCxTJx5Hb3vjo5BPWyX5smMsIDXkVhkHQ84N0AQEhnHHs=
X-Received: by 2002:a05:6000:2301:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-48e264ab2a1mr4944600f8f.20.1792595299491;
        Wed, 21 Oct 2026 08:08:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm6652761f8f.42.2026.10.21.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:18 -0700 (PDT)
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
Subject: Re: [PATCH v7 4/5] clk: meson: axg_audio: add S4 support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-4-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 17:08:09 +0200
Message-Id: <179259528986.4070168.1199000664504589178.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=437; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=YqvMrgag+SS1YYwbYaYO3LQNDj+WNIZgZH/cwchSYXY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk3rsar1wWxnVjfVDGxa747u6jg0rYvk7MLdt3qiLDcW
 xS2IKGyo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOJUGX4H71gnX/nHxExLkv7
 tJyUPv9053drfe9zHuE8eLKWy4RpN8P/osR9DJwFEsw8Ljx5/LkOB3vFmap3fj1ptnpub2r9YQM
 GAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Wed, 21 Oct 2026 15:08:31 +0800, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
> Add S4 support the axg audio clock controllers, Compared with the
> previous version, the selection of the audio's clock and data pad
> will be designed in the form of pinmux control. The purpose of doing
> this is to distinguish between clock control and pin control selection.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

