Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476227;
	b=xrU2H6Hq3cG49mbW6tOsGMZTjXe1DWDZB/bnHOBCJfD6EUoFSeLEV72Z64jqal1n8GU0
	 TISW78BbSVNFqjYTQfDp4ZWUl2MT8hairhTcTLqbNzfr6jQ3my7tTDoOCVqnxRh1vlOnk
	 Jx8GnSeQ0YOo4Z77CcO2XgDm34pMEvYtLOcyUlQpcxM/j9ZUnyYRPAaTeQFSGaDSq3TDU
	 fUV/Yx7bBbePQpv1wzG3RdUJ8Hzae/N59H562zwttnJb2LAmNGrrImZH7hzkglblnvFqw
	 ZNfXiHJy16Q1/DUO0lzGKKbClu/oNPa0KApqVv7bIk+shAM0e/qvSgU25jBm8Fa89YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ESiachlockZrnvqU0XnUvarapEpxdf04nuLSeirX8gs=;
	b=j3d6U97ZV3yRO+CUOOh754XJHe+FhHF9vF8I497JCh8sK42pmQ6IFuLvpaBekpaDHxWb
	 1ZzyZEgTsL2XBfKQBGs5tD8xPokk1tL67Zh52WJPDO476SSxIg1STuYEMoXAERIHiRNxP
	 wSjVN1AQepnFrQ8x7z2+Yxlb6aLv5jtbA6zzqiVWjob7H+7zQNylBDoVu90+LIJjDmq90
	 67F39VQvUuXN9uBSX2uDZTZofRAxyyxgLTvuT/sdvE6ccGW2Z3YnhUPrJSBtFZl3MfG8C
	 mAVsqrWZX0pzmIGNIaBjYzIZcKvIJjAJtRt4nJch8o0UmvhwFS5u3ooxJ4rXSNweUOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="lB86/Wbj";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1C2606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1C2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lB86/Wbj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso39492185e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794476225; x=1795081025; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ESiachlockZrnvqU0XnUvarapEpxdf04nuLSeirX8gs=;
        b=lB86/WbjKtgtbsETxD+/ofiI9T3VWhFU9RSIse8Tx6nM/BvLOP4yKp/ntcYCuLfEqI
         +ItXvRatjhgrqHbzlWivmQnGJpiV+jeSvN96gtoD+F+y6cgJQKaWjWgaDCoHl+xBPnqA
         G9HJ8vNLkonGr6EDAYeawNetj7/6cJwyUejaiosnGMp8QoQOeZU6iTk0uk8zIfci+5M+
         jY3s1TqmhRHmEYOzum4eZNcjpEF+7itzDRRB6e5uzCYam3hYBSLs8tz00j8KyVE5PVZc
         FSd1xNmR6ziDIIocNuiTTQYeoH8/IIZcZVhjCwH3fEqeI6ify1SNMBDRIJaCd7FOwg6m
         4BEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476225; x=1795081025;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ESiachlockZrnvqU0XnUvarapEpxdf04nuLSeirX8gs=;
        b=QPpdnn8BYBe7kNxbFPVw724YDNys9R1MxVrnIt8SVmnGrNOPBk3UsEkRE8E0cDE7I2
         5uinkyHs/aB+6BX+2GvG82XtPvxKKBJWtbsBkYf24mW1pHtlNtrG01AWDVnBTTld3aLL
         VLE4RBLa7Zauv3f1HqgJRttexP59cBn64dY8WE6hUUlcmydduA6HhwmN9tKONzFCRXo9
         zGv0zY50sCFDzu9BwaC2EwYLH3EcKBj7jGNNPSBudy2G/yaBC25W9jmGbrGzDDH1pI0W
         8ltYn7fqkeWIbofsqUH1zOt7Dfibsca0dEmuLtRY8SSjVQi5U9XqpYFG7lnyBcCKOozZ
         AEaA==
X-Forwarded-Encrypted: i=1; AL+hErEx82ce3Wt8rQ1kxoPzFKTHa2aQSIRSqtMSu+Fkilybx24kWUxqhDOIXQPW0phYd20gtPXzR4OOSCUzDdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z806UwiNmxqw+WSnR6gPaDgy+9i7C3iV/sx+7M9soX3I9XkblwT
	65OUkwEF43qs/diHo/nJ3y6Syrjjg98JqLHEXsLX90o+rbeaTwJcBc4cxlnKeRw3FNQ=
X-Gm-Gg: AYBFou2ELgNkbUBbMsm+ELG3D43gDQm2MP1LPPC61VJTVOHFfyAxZS7aY72kYf6Rjrx
	owm9lfsBoDee05OCB5a2sm6tqG4lDxNORoZwFi4krj3t2StCnokLfmZdyykgw/NlGY6Uc6YLEDh
	Y/Ov63LPdCAHyxcJyT+9d9IcmfrqI7iuSSOvFBSQPDuudlk3D+5Kw9CbSY2afJEIvB7hrMGtwDg
	RF2pPnI/LhEqAwVOxzHICV/Q70VAHmgzLGCBI1it5xWxz9g5SCBvIIukX0x1/sVkjmILJuXlnFe
	NmofaUFb7rGfhy/hhm78+LokRcWde6mauf4YbiHW9+XBRAL8xHswUTj1aypy7t+bt7NJXT3KA9B
	XNaDZ+h7KEPqT1YOVG9Bxfjf92lDE8XBMcnKL0Iae6HqjOJKv2sH8GvFl2kueSlTfHu6RYgHm0H
	d0YbVmVGpscGCmltbThqwIiJYrEUt3LCG5cTrLDA+xAgzq3bdOcE0FBU04qq6lBwmxXtra41aXw
	MxU9u8nk39k7S9G8bAqjfCxvkorUgRWRgbMkM2Ei2jmFEV6zeeKHYizgLgulgiIkSuxJGWs20lv
	ixjdHYo3rKx0KKADnLsOnhyHfyjkxWeufTMBo7zPjo2VdQdNI/zNN1oxFGekN5STIvJN4egEtkj
	wYuGycTT4/4p+BCXhISGbIDoeT+vldnW66Ri6Tu8FmvEAlQ==
X-Received: by 2002:a05:600c:1914:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4ba0937ad15mr93644665e9.19.1794476225131;
        Thu, 12 Nov 2026 01:37:05 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm85413905e9.0.2026.11.12.01.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:37:04 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/3] Fix clk-divider rates above 4.29 GHz on 64-bit
Date: Thu, 12 Nov 2026 10:36:58 +0100
Message-Id: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5WOSw6CMBRFt0I6toYWBHTkPgyDfh7ylF9eSyMh7
 N2CK3B4kpN77socEIJjt2RlBAEdjkMEeUqYadXwBI42MpOpLIRIJZ8n5wlUz0335hYDWiDeKYo
 mKQ+OV6XMi7IqcsiuLM5MBA1+jsSj/rGb9QuM33d3o0XnR1qOD0Hs3h+5IHjKQYsyzS66UVbet
 Vo61ARnM/as3rbtC8wmwD7lAAAA
X-Change-ID: 20261102-upstream-clk-divider-large-rates-872467864e39
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On 64-bit platforms, the clk-divider truncates requested rates above
4.29 GHz when computing a divisor. Fix it and add KUnit tests.

Sebastian Reichel fixed this in 2023 [1], but later versions moved to a
new generic macro and were never applied. Patch 1 builds on his v1 and
rounds up with (parent_rate - 1) / rate + 1, which does not overflow
with clk_round_rate(clk, ULONG_MAX). Patch 2 fixes a division by zero
found by the new tests.

[1] https://lore.kernel.org/linux-clk/20230519190522.194729-3-sebastian.reichel@collabora.com/

---
Changes in v2:
- Patch 1: round up with (parent_rate - 1) / rate + 1, as
  DIV64_U64_ROUND_UP() overflows with clk_round_rate(clk, ULONG_MAX)
  (Jerome, David)
- New patch 2: fix a division by zero in round-closest dividers
- Patch 3: also test the maximum rate (Brian) and rates above the parent
- Link to v1: https://patch.msgid.link/20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com

---
Carlo Caione (3):
      clk: divider: Fix the divisor for rates above 4.29 GHz
      clk: divider: Fix round-closest for rates above the parent rate
      clk: divider: test: Add tests for rates above 4.29 GHz

 drivers/clk/clk-divider.c      |  21 +++-
 drivers/clk/clk-divider_test.c | 244 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 260 insertions(+), 5 deletions(-)
---
base-commit: ab94dbf302331eed3679e262e1d8d1a73f308640
change-id: 20261102-upstream-clk-divider-large-rates-872467864e39

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

