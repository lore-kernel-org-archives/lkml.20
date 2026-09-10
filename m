Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E5495028
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050792; cv=none; b=lTtcoacMdsaUdZJA+Rja0eCEoBWo8R4jxr/7iDKG1x1ibS6nCA99vyoHR9vnAjat+7FIGW/c300O+WrlG1LX2WgKPvSi2oHTGCb87seLK6Aa/cEmpcvvy7k4ZP1u7MRp0zcaIFGIKwlFl1HzlPuALX4pj/xmgkMxL4HmaC8bfbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050792; c=relaxed/simple;
	bh=6EjhR0+7L3WDUSaTLBXZV7F+O4y+6uTqZmySECy3+rE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z/bnQH6w6K1SRxioFq5Objb8modJlosm8Wv8GBx3hXiAwauNzad8T0uwv9WmS7ewvOiEy4uCazMYYTHS8Myx36F0fBnjJt8bJlsVeBPryMlHJrSKJWKHWlwkKt5sDhzexFykPsqj2oo3JMQWJtv8QIouhpXD7RLsvFaHW2+Tt5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=bYGQ4Cue; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="bYGQ4Cue"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso60572405e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789050788; x=1789655588; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6oM7pa4VlFfIqD2Tf1cRDvr1YX2oXxRTGcQXQykT3gw=;
        b=bYGQ4CueVXf/pR6z8GAbPvSK9PAhVV0UwmoP2jxbUVmIn2QwqOwqdw3EVlGTKGezDS
         +1gQKN7GcdPCTGSbMEX8N3DdNoE0I84CgxroBsfX+TeG5ah5f7uPTrb17MLbAdQAF5xK
         AGn36SfVv5sQLS5w2Z5dxce6mq3msIpeLmOT+eFjHDI7bQgHFTE7zisPPW7viPRBysCW
         vPJNMRKhExURc1YBEoYq6JtKka3PRsaMmDwNVfBqkDPtvyQ3lPVCW2OJbxsskYILTpLC
         L3WDDsUV/sOk5Gz5foc6BTbhVX/dDkEl0XaXyz2O0HPrkWjBvZzB/T0RLPW1V11LKsv/
         oTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050788; x=1789655588;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6oM7pa4VlFfIqD2Tf1cRDvr1YX2oXxRTGcQXQykT3gw=;
        b=r34g2pJtVcv36mZsgoXxEt2irycyZ1xHcEHVOPtaZhSyhxwQfS2/ayjnxhZZScPwqc
         tIl+uZYyH4p8mmHeShI5yukCM6/1knxuNnySB41N+ooLgeK7AGIckeYopBS/eVhkFw8s
         Za/JnV6PWMP5j3mUKCo0sfOSmR0GRWdiEzVTlth8AXxLapSclYpfCjoTsbH5Ys4qaPko
         g8uTWKh4cem3zttdWD4yjnMN+PKcDOUUX5SxsnX5gW5I3fS+V+JTkYTCBLqHzIWGvQ3X
         VSH0CtXqqQ2d8qoBvGfzm+SCBOmcCGL9Z8Iq31xKYdgKqStkhqN4sCYqlAHOvEjWrPsP
         BB/g==
X-Forwarded-Encrypted: i=1; AKwUvBxQJQChpUXpTLij7pzxsfd2UYZ5ktglAi+k0Hx/8ZffF3tmCV9saznOlNKEtaERYhFdsAZiABAn5bQdJ0E=@vger.kernel.org
X-Gm-Message-State: AFuF++lSclCpNn7yPIDx58YcH0N0HigG/E/IXqPXlDpFJOyNcD8+tfo2
	L4ooCom2uGLJxW4VvENyUHkKrMCEbQxkZa7PWV4ejii6rzeeel8m5WU5j/7UKd8t+UE=
X-Gm-Gg: AYBFou0NezPbRmxzYOiuaN18w6KmObZhXLpAD7AydrFpUi93Z2ndttCIe/3MMpe7q3I
	vkCF0rVH5b1fv7suwHfeo8GppaNoyMtgS3dNZFXGbpNWyNY8MVGYq8QYBhxAWZq2H0GqqWV7uyL
	v8bv7W04XJCEqsrr1ejGSWooqfVCp+zp2kjoDzQubhTWEjaccLuP1KM539pRSF/nx9gVLAkblQq
	ahejKWYXSEFaBTOPEVIO7Ls4vlOA3wwmNF+0YufDMImgaLvGNWw0V90FPPNaxNVJDR3Gu+R9kBt
	QLuZnb4En3bFPkzYBm71XV0GV1pXeCwFc9GiFsOwjDB3GT0S7H+637vHKqiyYuqa8cQwCwcA244
	D1MxfbODaN6td5tc9HyJaUwTxfldxUwEYe1wmCwVLFazEpbwnMKkGnvHMu8z3/2475ZhVavnR6G
	lfx2FefYOfgmeVs+0UHgoxLf6uaFvnt9oJwC39Rj7eTZIEtLqAKFT99tcoQkbTvh5K3E04kQyX0
	w+Zo/IdeRzmQQtg0FJQFGrzGOBdnvJGZYA8+PNJATfUz1xPQdGX
X-Received: by 2002:a05:600d:8445:10b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49cf825d77amr301185625e9.11.1789050788119;
        Thu, 10 Sep 2026 07:33:08 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e5fbda49asm12537135e9.3.2026.09.10.07.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:33:07 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v3 0/3] power: supply: bq257xx: Fix probe time race against
 driver teardown and battery parsing
Date: Thu, 10 Sep 2026 18:32:57 +0400
Message-Id: <20260910-bq257xx-init-v3-0-4e219a1a04a5@flipper.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBAFf4X0bM22aAFP/ofxQGErawxgWxsM4
 d9t8aImHid5M29mDi2hY4dsZhYDORr6CPkmY01X9xfk1EZmEqSCCgqu73JfTBOnnjw3BnKNGoo
 mVywqo0VD05o7nd/sHvqKjU+NtOjI+cE+178g0u5POggOXNRQalmhqFV5NDcaR7TbHj1L8SA/9
 epHl1FvUe+gUFoYkN/6siwvkdIIIPsAAAA=
X-Change-ID: 20260907-bq257xx-init-ff03beb07c36
To: Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3524; i=alchark@flipper.net;
 h=from:subject:message-id; bh=6EjhR0+7L3WDUSaTLBXZV7F+O4y+6uTqZmySECy3+rE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQt2j+ny+/dX6Wt1tKrn/5cI29jvXOm4zaF5KaCmHvqX
 DNuJb9g65jIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCq7yxl+MV08LQk08pOzjMx325dcviSfGHT9B1CG280b5/3/t1sYQUWRobZlbL
 XrzlHbV+/5sn6AoHjT/sdhOeXyCaFaxStfCXtJsMHAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

If a bus holding the battery-equipped power supply goes down right after
it registered, it leads to massive fireworks as the driver starts to tear
down its resources while callers from other contexts are already eager to
process events using this driver's callbacks (and their private data).

This was observed on a bq257xx device, which also uses the legacy parsing
of battery information from the probe routine, where it happens after the
power supply registration, adding yet another failure mode to callbacks
firing early (i.e. before the device is fully initialized).

This series therefore does the following:
 - Add a new semaphore in the core to prevent the unregistration of the
   psy device before its callbacks complete
 - Make bq257xx use the passed-in psy during external power change events
   instead of the one stored in its private data, as the latter is not
   guaranteed to be valid at that point (and was observed to produce a
   use after free during teardown)
 - Migrate the battery parsing and hw init into the newly available .init
   callback, which ensures that the device is fully programmed by the time
   external callbacks start firing

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v3:
- Use the new .init callback instead of adding a dev-based battery parsing
  helper (Sebastian)
- Link to v2: https://patch.msgid.link/20260909-bq257xx-init-v2-0-deb4076b1f02@flipper.net

Changes in v2:
- Use psy->removing as the predicate for detecting unregistration instead
  of use_cnt, because a leaking caller can leave use_cnt non-zero even
  after the device is being removed, and ->removing already exists and is
  used by the removal function anyway (Sashiko)
- Don't rearrange the existing short-circuit check for use_cnt and the
  availability of the callback in the psy struct to avoid breakage (Sashiko)
- Drop the patch making the bq257xx_external_power_changed() return early
  upon I2C read failures, otherwise a transient I2C failure in updating
  cached status fields could lead to missed updates to charging current or
  input current, which is worse (Sashiko). Those status fields are re-read
  upon every property update anyway
- Amend patch description of patch 3 (formerly 4) to explicitly state the
  potential use of unallocated memory, and add a Fixes: tag accordingly
- Link to v1: https://patch.msgid.link/20260907-bq257xx-init-v1-0-1a08b29e1a68@flipper.net

To: Sebastian Reichel <sre@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>

---
Alexey Charkov (3):
      power: supply: core: prevent unregistering a power supply while a callback runs
      power: supply: bq257xx: Use psy directly instead of driver data
      power: supply: bq257xx: Convert parameters setup to the new .init callback

 drivers/power/supply/bq257xx_charger.c   | 124 +++++++++++++++----------------
 drivers/power/supply/power_supply_core.c |  26 ++++++-
 include/linux/power_supply.h             |  10 +++
 3 files changed, 94 insertions(+), 66 deletions(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260907-bq257xx-init-ff03beb07c36

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

