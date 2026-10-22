Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705988;
	b=nMoQ3g4JnkEhrxFScltZZMNcJxEJ/w/fn7xtmeFdRYC+sdn+Ia4BJC8N2FBE2N+PJAAm
	 HkrfRphzWQusz69ywK3bgRpwPeA5AS4f7pVJhNKqVOFCkEtCL5+zjj+F70tVS151aS+ZP
	 kQe8NNiP94o8E9K1X2RHgXFQ3Gv73m1Q1UjigLFwGGKTsd/6naNodwaMSj/yLAATQjTPv
	 ZxJmzO9WnyE2ySM8H6Z4X5XEbtzoRpvztR8zMnDiXK4BlBFtjeDSrEBGoNp3snseYHrDE
	 r8QUm+9vZMHUxMO6cZL9/jgQULs3iPB/+yMv0yfWwfgJgT7+rnYsj+w01viR2Boi6Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=zCyGpCK8kN6f96iOvStyBKJ/lQOoQDHMwFOCI8a8INU=;
	b=TRtpW23anBCu1cPBXvdD9NwD+xTXxms6oYMcg27Dzd9Kth38wPsw3xZag1BxW11uJ/EL
	 IVcZDJPohzRhK/c245RY+c03XQtQALVSasIzzl066kzMctkOZHPrk9318D+EPIba2k8JK
	 uRktvB4+QZHS24O+sAyy8NwmOfo77ALP3AW7jthK/hSHYpMTSS8dk5MGILwrcpei+JDjG
	 rckIaDA1Yawy0BGmX6JmD+KJpA+CdK/6+kNySU8ScjETcR14fGf3rv+ct6VIbQEbKFag6
	 vv837+UZnjGUi9BdtiSwUMQxF8Ct7b9e0KWHpG+GGy4BAtS6Wscz5x38KR7sEVaAgew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DbjrJBn0;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91336606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91336606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DbjrJBn0
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so295428c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705988; x=1793310788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zCyGpCK8kN6f96iOvStyBKJ/lQOoQDHMwFOCI8a8INU=;
        b=DbjrJBn055ujr+ytdPPsMq0PSUKlC8KPCUMRatG+nCmbQPtmLo2BrpmdP5b45cJilF
         2NGLGrAzRP34KddUhP2Zi/TLomjoaBto7g3lDjrY5hc3OPOmV+L40O7Tym127Id+OgUd
         +JKQat3+pJssQg2Ycj9ILsJoJtwyReJDw2OP2Yl8D3smOqnpUB+GAfVK03KMN18euQMr
         eVPyLFxoApm7x15y7tLrqSG4BncCkkqVV0MCol3nsKUEd5+p/9dbjni6Wg2D987QZ7gx
         8UchbLZ9MHEeeOuTjg1/VgWgVqvjDUDyjSxqvlifEpnZBbmSCBEvfZVKS5NvuXIWVPiz
         VxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705988; x=1793310788;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zCyGpCK8kN6f96iOvStyBKJ/lQOoQDHMwFOCI8a8INU=;
        b=vul2IStcGY5WEWKt/2eoc1jnJFUuAFO5ak4dV9sdqy2Bq17WZB0AFIBfwxks6XMtyC
         6/1SIJkOjDQI5Fxkgjz9VshWB7K80kRWZrn56fdAimAPC2Wy9tXHNMxQdg46hmD5Wui3
         eCJSZF0dWITQ07LsyIASRdy3EIv7Wn/nwp46JZcYVVT2p8SS4aE2i5XMRqpo4ujC0DhK
         lJmJeNFG3xBat/JU94yZWWQofjpc5Gf+F9PX9R0pQXn2fjX9KEv2jW6kM+GJmOeQqbn3
         0aBokxF1PHXiHogB6ZO4cXgZAVf5yMqPNx9qTpTxkqoZSDEMbcPBECB4GWiQrVM76wug
         XOnA==
X-Forwarded-Encrypted: i=1; AKwUvBwQNinYmGEJSV6ghSzaiQYAv6q9n2Oy0qWgb2DrlZIbBcoRlzIfVqkygXTMY6P55HHpyTxIxrjLRPfa3Ik=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2YPVAusjt5e66uUfdFZbmV8oS0XOnXqLAuNa6lk4iC2TRlvQK
	SGY7Nedx2yF64mdBED72adjXxKWajTXqCcXZaKHXzNGySoCtvs1QZilKoA+aTA==
X-Gm-Gg: AYBFou34P+A+dN6yecSZ79fKOaycmahzptOTcPvzvSix/ZhqFfdnCyU/LqHhOO49iWh
	CIeEerO9B4Ej5K6ylgqxOxfPx7NZ3Uy+NV1mUYFM7OuggD8bYCju4mpAJfU0TrF3npqcNSY+mmx
	vLVMH+TGniXkWCaJNRZmAZHEfkiVHYGvao6/SR9R0FwrP478RuGpRuz9A1yw+i66HRLW8zxA1B4
	V9VxAGXBuVnRvsaNItswyQuB/XUPFAFe6bx7/1J9Zad0huwGd0txv2IJn5jP9Fuj/0MeHhlvL6X
	vvx9FpEcn4s8Wst4hFsc4Bc8vey69LO6Pvtjv4EFyzqmOCC7Z/wLzc4hmy6SvV8SokUtqmaKQxs
	rRYPWLrB6f1HYYV71k4ByJspK/XPIzm9UKjHEMud4so70euVWUm9zDaINZPdz2ysLrWO6vnk47z
	QKRAEJ0XThfdCwYehleSUr0cvNQ1p3VFQud8hs9OpiOvIM5dWapSPChYzW0WRSqAHXNLT5C8qCL
	7Qd/ZR2Z8U6/tpRVhWqP82rVkO4TfAYcJagQRy/+P4scombFHHcTXq4Slx9DgdVo5yOa9LDp/1/
	wg4wEQP2i5dJD8qgUXfpedPxI8rVe5etEnBfDiVaflYQ8Q==
X-Received: by 2002:a05:701b:458d:b0:143:26cf:8617 with SMTP id a92af1059eb24-195c5510045mr454058c88.25.1792705987321;
        Thu, 22 Oct 2026 14:53:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 0/5] gpiolib: of: quirk cleanups and TWL4030 external
 mute quirk
Date: Thu, 22 Oct 2026 14:52:44 -0700
Message-Id: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAK2F2moC/5WPzQ6CMBAGX8X0bEm3LYKefA/jgZ9CVyklLRIJ4
 d1tMTHejMdJvpnNLsQrh8qT024hTk3o0fYBxH5HKl30raJYByac8QMwDrQd0HZYUttQWUmRSVn
 LYwYkCINTDT632OX6Zv8ob6oaYyEuNPrRunm7NkHcbWGWQc4kCIAkQAoZp0Brg6Obk7C3d22nc
 2sK7JLKGhLbE/+yuQxSznkiUpmm4oe9Br1x1tBRO1V8vvszs64vYLbdDjwBAAA=
X-Change-ID: 20261021-gpiolib-of-4c43744d4971
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

This series contains minor cleanups to drivers/gpio/gpiolib-of.c and
adds a legacy property quirk for TWL4030.

Specifically, it removes a redundant IS_ENABLED() check in
of_find_mt2701_gpio(), compiles of_find_trigger_gpio() conditionally on
CONFIG_LEDS_TRIGGER_GPIO, adds a legacy property name quirk for the
TWL4030 codec external mute GPIO ("ti,hs_extmute_gpio"), cleans up
formatting in drivers/gpio/gpiolib-of.c to pass checkpatch, and uses
__free(device_node) in of_get_named_gpiod_flags().

Note that the companion fix for the TWL4030 codec driver itself (which
fixes looking up the GPIO on the "codec" child node) has been posted
separately [1] and has no build-time dependency on this series.

[1] https://lore.kernel.org/r/20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v3:
- Rebased onto latest linux-next.
- Pass idx instead of 0 to of_get_named_gpiod_flags() in
  of_find_twl4030_gpio().
- Fix typos and clarify commit message in patch 3/5 and 4/5.
- Add patch 5/5 using __free(device_node) in
  of_get_named_gpiod_flags().
- Link to v2: https://patch.msgid.link/20260724051822.3545532-1-dmitry.torokhov@gmail.com

Changes in v2:
- Fix ti,twl4030-audio compatible string in patch 3/5 (Bartosz).
- Link to v1: https://patch.msgid.link/20260718041311.2605172-1-dmitry.torokhov@gmail.com

To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Torokhov (5):
      gpiolib: of: remove redundant IS_ENABLED check in of_find_mt2701_gpio()
      gpiolib: of: compile of_find_trigger_gpio() conditionally
      gpiolib: of: add a quirk for legacy name for TWL4030 external mute GPIO
      gpiolib: of: clean up formatting to pass checkpatch
      gpiolib: of: use __free(device_node) in of_get_named_gpiod_flags()

 drivers/gpio/gpiolib-of.c | 101 ++++++++++++++++++++++++++++------------------
 1 file changed, 61 insertions(+), 40 deletions(-)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261021-gpiolib-of-4c43744d4971

Thanks.

-- 
Dmitry

