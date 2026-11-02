Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615372;
	b=mu2m962lg9ZydKl6Sph/BL8iT4avMxP+7MgJwCowHzALY3qk2dFFZeNgZqgeas+Vfi2V
	 CnCxJyNAbLTx8QRC8kJRHowWdCUkmBdZcC4HMa/GLE+5yed9ln5w+D9m0/QhOc6PnZJqa
	 Re05tnQrU0vGIHVednIf49pbamqUgPOox9hmAt50zBHcm3Ce6MlO9NSlUjlZ6Z/Gyeray
	 tu3rDmVqgjGcA5UX7P5QAU8QchzjvZqpnkCkosQI4DpTaW/Uyeq8nf3P6hRjpqd6bAdjT
	 zdZUT98dlxOUiN8pVVknmol/2rYtjmq4TKjcD3ja7P/m4cq7UIewnY7ooVdHmLnHM+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=i8KBMYyNBCwWIi7+NGwzqIYgUrviyf0xI1pG/U0fDXQ=;
	b=YoqWur9FhKFtJ8/FDPCv0yGd+O2Dw4J5X6BdBwysSvgYqMuxq7WQ7Nnknt8pOZv6jiHH
	 Owa3tF8rUMNIRcCzHM816vBFQAQsEVuCTleFB+Y+VA+kqql6pRC4AnTvqPFLNgKr4ZXNW
	 loYW+FGPzz4WViABpk959IVCVmH3rKUHq7AhBgEJj+aj6X+ILIR1OLTeZjauaCVLUKp/p
	 LyZHcFrIslYr9f5213Hkun+R3laBRZIWg8DV4+DyLWnwv9CDBn0Zq2t76HTnhg0hr97DB
	 1jCmz6iqeK225rcUL5/mHcsXFWgBTxFbVhjZeV/WKLPjwuwHQKXm/QxPCHpzhHueoTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=7un+O3F0;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA7F606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA7F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=7un+O3F0
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so22410195e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793615370; x=1794220170; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i8KBMYyNBCwWIi7+NGwzqIYgUrviyf0xI1pG/U0fDXQ=;
        b=7un+O3F0es28hoSKGdH2ZJjw4+DmPukXZCHGbnMozRLmhGTjytPWXp1TnAfeMZeTiJ
         PgFBUI74+A8DST/iHTMQdKxhUfvORfxydFkvFucw3g5IB7cFPsdL0kpnhPxU6l+/AjNY
         bo/PozeLSIazwxQQ8RIqaqTfLGirvRyppkSqcoVud6L6JEMyMQhBTGkAEVhD4bsYtxiH
         gXPgiz1qc9+nwPqU/n3bQxzazfpGdQt229bzMS+g8E44nIHG6ELrydLFtquoUgoLrD7w
         2bvxYYI/iOu4ab74H/zBBcysH7ghds5vCQB9FSUXgm7C2tmGwyizuDgJOhrdpK4hAIAW
         0Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615370; x=1794220170;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i8KBMYyNBCwWIi7+NGwzqIYgUrviyf0xI1pG/U0fDXQ=;
        b=xjsxorvg8yu09MQ9k6m8PeUwncGFIukYoAZQpBcDkTkwCJdLaQYLR0m8OyOAbb9fBD
         gwRuVpinJQN+XI8Cgrh+MNbokwyYwZvipSUEOoklHSg931/uAY8o8FX8acnofoW0APY+
         ynex5KZeXlgBdviTe5mgfuiHqZM5fItMLH5DfYwsj5KhlpFucfnBEwEXV+BsNzCENGM0
         B/tyO6wN9vfejXnp1CcI1pf4/3l6puObM8HI371cnMKZzRCr80j0OWQdtY3Xh6UsN/Zg
         4zMOCVSa50DYESF70aNKWZcOLIgxfE8/5c9lgJAddAIbCw6lu2+bcbwAzY7tmhKpGJhK
         9SzQ==
X-Gm-Message-State: AFq9FYJrycI5xcPGgN+gXpgyqT7XtNSun6p+P+OnYfjotZJKY5+Xv7m7
	l7KRw8sSLAcOfOEA1XHD49VlRtjMOTZq7WSjeGixL3J/2Z0Zn9SYjWYwIv5CCnzUcIk=
X-Gm-Gg: AYBFou3/kSnCcRy8iVnbNanV4P5qKawB4B9Yg+uwSdZif55WeCOXVeDbN6YOLp2crny
	i5cz1+J7nT7woOYrl4FyYEg6eZ78TKEPyIC3uMApEO3oo0w65yR3vc3SXYXP0tvNrBrcwHdENhc
	cOMj0c8IvR3kWW2EOgaWia0mKFjGs1aoqa6x2C0B57Ip0qNiyypDeEVDXzdttjZl8b+VQMEVAyf
	4wlwxEa5MHj2clqIjk1qKQ3N5Mq+Gz247XB19B6TBRa3sunt3dFkgnmNdIzT1eDhmwL++kPQ6Lz
	IIVuSRXkoxxXCGlvr3LI7Rme3V8eTxIWiIdtHO+mLtnHnjEkOMREkujExGzrprGNVU7+Yild83d
	Y+TAJKTiMvfH9aVZ0pjchvZS3ZVscVWdHOvfHdN1J2vAbidJLj3Fou+Nu9y3hiV8aRmYJ8aun0C
	4C5DhDw4JfyOj8oyOYUMXhl38l4qTkBUCS4RkLLH1XKMcZoukx8O8OUZ8T1p8yGt4df9PRFXq9N
	XjQJZHfZoi1dBfmXxgDay1TIr0ciax7KSLPiCMf8vswrWw2GY1UgruKB9oqRxQhCE+kvx7zHpML
	S3jcioXFuXIOqeUd+RsXzcSRpycNn/Szjczfj/UAv5VhPl7ciB7EyS2wG8YYEJP2FPFRZJ1XVDA
	UODh+jaatuA==
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr225442125e9.24.1793615370127;
        Mon, 02 Nov 2026 02:29:30 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm19341891f8f.42.2026.11.02.02.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:29:29 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v9 0/3] Add support for the TI BQ25792 battery charger
 (regulator part)
Date: Mon, 02 Nov 2026 14:29:03 +0400
Message-Id: <20261102-bq25792-v9-0-65f223e95fbc@flipper.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQQW7EIAwF0KuMWDcV2GBIV71H1UUAp4NUZTLJK
 Go1yt1LsoGK5Ue8b8tPsfKSeBVvl6dYeEtruk059C8XEa7D9MVdijkLkEASJXb+Dsb20EmFMAR
 HTlMU+fe88Jh+zqaPz5yvaX3clt+zeFPHa9uxqU52TGxYSkRt3Pv4neaZl9eJH+Jo2aCWVGReo
 CPTG9B9JKaxlVhJJYvELCWMjgEhEvpW6lqqInWWFhRqZWLPHFppKgm6SHPMHIC9cWFUKraSKon
 VTDq3tW70AyL7vpW2SKpva7OM2lnPESxF2UpXpAVbpMsyqGCltug92/9y3/c/1iLcdTYCAAA=
X-Change-ID: 20260303-bq25792-0132ac86846d
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3581; i=alchark@flipper.net;
 h=from:subject:message-id; bh=G4gxisndOHNG/G3WIvPCxIWVL57dyX0apgsJ9n0Lrz4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9SP397eEWk96T8n1OPUmCEQwfFdmSjiY8KVmZHLcvR
 y+xTuxfx0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO9N4qR4feT7kPzNn701ZO7tLWW/9O0aSa2N8XPixxUe6nTx1zJpc/IsNzrQnW
 qp9zh50tP/Nq1p6eI6xUbx50p084LlxsuuSd4gQUA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

This adds support for the TI BQ25792 battery charger, which is similar in
overall logic to the BQ25703A, but has a different register layout and
slightly different lower-level programming logic.

No cross-tree dependencies here, as the MFD part is already in master.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v9:
- Rebased onto recent -next
- Add a fix clamping the BQ25703 OTG current limit to its hardware maximum
- Clamp the BQ25792 OTG current limit and preserve PRECHG_TMR when programming it
- Only look up the OTG enable GPIO on BQ25703A
- Link to v8: https://patch.msgid.link/20260727-bq25792-v8-0-c1c70473bbe7@flipper.net

Changes in v8:
- Rebased onto recent -next and dropped patches already applied by Sebastian (thanks!)
- Link to v7: https://patch.msgid.link/20260603-bq25792-v7-0-d487bed276d0@flipper.net

Changes in v7:
- Rebase onto recent -next and dropped patches already applied by Mark and Lee
- Enable the Input Current Optimizer to improve reliability with unrecognized chargers
- Explicitly program the battery cell count at init time to alleviate transient glitches
  with the charger going into spurious battery overvoltage state due to misdetected
  battery cell count
- Handle return values of all regmap writes in the init function
- Link to v6: https://lore.kernel.org/r/20260331-bq25792-v6-0-0278fba33eb9@flipper.net

Changes in v6:
- Changed -EINVAL to -ENODEV for non-match cases in the MFD driver, to stay
  in line with what other drivers do in similar situations (Lee Jones)
- Link to v5: https://lore.kernel.org/r/20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net

Changes in v5:
- Added non-OF match data and switched to i2c_get_match_data() to support
  non-OF platforms (Lee Jones)
- Shifted the types in the enum to start at 1 to avoid confusion with
  zero-initialized data and non-match cases (Lee Jones)
- Reinstated the const qualifier on the MFD cell array (Lee Jones)
- Link to v4: https://lore.kernel.org/r/20260311-bq25792-v4-0-7213415d9eec@flipper.net

Changes in v4:
- Avoid additional data structures and pass 'type' within the existing
  struct bq257xx_device instead (Lee Jones)
- Move comments for new struct fields to the patches where those fields
  are added (Sebastian Reichel)
- Collect tags from Sebastian Reichel (thanks!)
- Link to v3: https://lore.kernel.org/r/20260310-bq25792-v3-0-02f8e232d63b@flipper.net

Changes in v3:
- Move MFD cell definitions back out of the probe function (Lee Jones)
- Collect tags from Mark Brown, Krzysztof Kozlowski and Chris Morgan (thanks!)
- Enable ship FET functionality at init for BQ25792
- Link to v2: https://lore.kernel.org/r/20260306-bq25792-v2-0-6595249d6e6f@flipper.net

Changes in v2:
- Fix an error in DT schema (thanks Rob's bot)
- Ensure the broadest constraints for all variants remain in the common
  part of the schema, per writing-schema doc (thanks Krzysztof)
- Link to v1: https://lore.kernel.org/r/20260303-bq25792-v1-0-e6e5e0033458@flipper.net

---
Alexey Charkov (3):
      regulator: bq257xx: Clamp the BQ25703 OTG current limit to the hardware maximum
      regulator: bq257xx: Drop the regulator_dev from the driver data
      regulator: bq257xx: Add support for BQ25792

 drivers/regulator/bq257xx-regulator.c | 112 +++++++++++++++++++++++++++++++---
 1 file changed, 105 insertions(+), 7 deletions(-)
---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20260303-bq25792-0132ac86846d

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

