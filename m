Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980888;
	b=wJtZU0fWqTXmWsO4SgnHe1L5FfGJiE0w/3SsQVt0t+JVJHUrClGB5OgIE9FTyjvg0Gc2
	 BejRtH25Y5H4rMj/Z7gayx9YOwKWPYTVeWfVQJuStoB5AxNDngs6R3MOE++DGsEMFEGAH
	 5lzpcJ7Oi/6jKx2SzfXBgaw1xwMcwhWbwUWEg5BUgz6qpNTzXHOgTHmdQgzhxo1bNubG7
	 z7za/QKdXk8s9DFehhJnFXZrzICIBq9DYGteBPHuZ7yQXefm4PW7fSn/kxuAOGd0xXyxC
	 ELFuHjqorO9oBvFxpHyyBNo6k4m+owKiMvp7J7jP6jUQNDxfG6pVndBdjg98+Q8j7Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=stncjCpIcaZGwyCzQ3Mf39ygwW1cfGfLhkLPVcA4MfQ=;
	b=t3u4qVdqxTmJhTXO4VEPzpkPNRykStWLuAXCic67sjW0SKkjmbo/3klr+MCjZdaQ99f8
	 in4KcxuMJoEneCnBfp/Yp5lqCfuv5IVjredi9OqB9Fid2s6J+D+NlD49EIf2JXNanp5O+
	 I4MsuprKhxMFRiNopdEVsimdIlmMM43+WRkbaVYYdY1pzZvT1uaFkleMcQqOgP/z/UjDa
	 ovCN3RvDyIJV7+U7NcTxK/+qAC5MaXatcrixMK/kCVXWOZcweRYNAAMB4H4o327XF6fSo
	 rI4g9lD2xUWEOvnX5krcBDF1dNDwCZj8Mb4fY5pLDNCasX3NKh3tNt2UfJ/qPY8lq4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JNYeCE/M";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F154606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F154606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNYeCE/M
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso596396b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793980887; x=1794585687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stncjCpIcaZGwyCzQ3Mf39ygwW1cfGfLhkLPVcA4MfQ=;
        b=JNYeCE/Mxw8oxc53cwlDWJ8UWIHSWiegfRoY9rC99+LORNBuj3X4QhcO5CeIwu48Cs
         evXEjuSzZDMu74Y7n8Z086sfdrOKXCg5g15EumVHbPxFeTdIBDIIXhXp1c5vhs1z+3I6
         ntc2rSc/6GKLOX7IrjD2bhstX3lVtbsHihsIAQIIZHCZEk4T+7qyH0axLZnuNmUoolG9
         AV22BUo5isZUbdgBLgGRH9TNyOse5tIa38uEyy/JA6CuGfCzBouJr0owSTdPGbioUVef
         q0HYDL5WD7VfHcFkmYKoBMeTWAzLFLgimWcKquPCCuI9E0SJgFx5TJGnyFtcxQZz8xT+
         RHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980887; x=1794585687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=stncjCpIcaZGwyCzQ3Mf39ygwW1cfGfLhkLPVcA4MfQ=;
        b=hYzDNTtZvuxlvPgyQizzKm9KZQFBuYHdcI8mT67qaZQow9NQPomTe/nWr+uK1hG8ty
         7LpAYW5HG893JI2XxuT7vaXSdhTY0JQk9euOls5KJLdjEIKt/u9p1KjwMaRKimc8kn6e
         xElfUO87vEuM0gi70YVKe06z6dmpnjwgVi42Pjljgk0Qqu1NuHuNWQQ+AG8au3wHA1gq
         EhAeu0HqyNqMLT0FnGH79nXxme2MjQWnGPlnNO3Bq8d4FHbghf9gal2aP8Uk8/GVHRNc
         YG4w7jgdJuME8mQxYqNRuoSlOlFNZ0Y5hYVL9oZxsgR9T2vOJpVMq7hMAPQzS23PC5Nf
         jjHg==
X-Forwarded-Encrypted: i=1; AKwUvByaKUBVNat8oe16L0eOccRjuzOZLOEL3bKgkSvuR3T6lW5rxVe6s5RuPl7DvtwXvalmpI424L5Hu1ZUvo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z98ECPwa8PafYmnTz+fxtqXZZW92qNhQ9cPHVyzNiXPXrGmmzLd
	4w282UtjRlj6jDCf8AeEg6JWQJIUAd8rJAhHEQsQre0vWu5feqmEYTI3
X-Gm-Gg: AYBFou22Z/Wsl1ZbLIWDVAC6I6Qphz7ym41OWaq7czN1IXuWekn5qsnHpGyCN72SUMF
	VQ3fVgP79FYg7Ph4l4X480HmpvUwOW1oec/LwS4e5dLkU72ncotGTJN01Uc45WXfVs/W06zOXnU
	GNYtHaWov1KrnKybWAodqukXagx+gvxw7ueBIugjhnfK8LzLeR3iPMq6wE5vkPMhbHHA+Oo8M3Y
	q5vYoMlpNyufgfj1oRoPHlqT3CEmKuTnv5ytf2Evdprg2lIZrWGwE1Qm4ijeUqt9u/H+YCqm72J
	Q0+fb67vaXMwys5DJPkWeUoLHjIvOPcuBq8J2TYA9E79PJOwxuw28xd59L0tZP9o7a1I1VK8nXs
	1V5u5PbBszn2pBXqTH0/iimZ96fQmOioNuXkFrURDxNp6YI6QVseg41p499dPiXwi+0keqDMpUK
	/VA2rPrPKB6bQ395n4QVZPvij0uBH4QWuVpbYUXtCkQcC4wwkibJvdizj/+dd0dB7NWOahVMZXp
	ZJ5k69aim+y8paa7VLzFkDDLZW00AHvXmKcYMV0AvNwJ34JF5zw2h+0EQwa+Z5ajVtNmU3KUDW4
	kcf7PjmXj0VgtQRmElpx2f+mgZsA0PkPpnPmQxMK4g9jA7Pv
X-Received: by 2002:a05:6a21:599:b0:3eb:aa33:e586 with SMTP id adf61e73a8af0-3ebb29c72f3mr3246747637.32.1793980887506;
        Fri, 06 Nov 2026 08:01:27 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a7fbcbsm727930a12.25.2026.11.06.08.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:01:26 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] power: supply: mt6360_charger: drain chrdet_work before the power supply is freed
Date: Sat,  7 Nov 2026 01:00:57 +0900
Message-ID: <20261106160057.2754689-4-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106160057.2754689-1-hj351016@gmail.com>
References: <20261106160057.2754689-1-hj351016@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

mt6360_charger_probe() registers the chrdet_work cancellation via
devm_work_autocancel() *before* devm_power_supply_register(), so devres
(which unwinds in reverse) frees the power supply device first and only
then cancels the work:

	devm_work_autocancel(..., &mci->chrdet_work, ...);   /* registered 1st */
	...
	mci->psy = devm_power_supply_register(...);          /* registered 2nd */
	...
	schedule_work(&mci->chrdet_work);

The work handler mt6360_chrdet_work() runs mt6360_handle_chrdet_ext_evt(),
which calls power_supply_changed(mci->psy). chrdet_work is scheduled at
the end of probe, so on an unbind that races that work, devres tears down
in reverse order: devm_power_supply_register()'s release frees the power
supply device before the devm_work_autocancel action drains chrdet_work,
and the work then dereferences the freed mci->psy -> use-after-free.

Register the work cancellation after devm_power_supply_register() (and
after the other devm resources), so reverse-order devres cleanup drains
chrdet_work while mci->psy is still valid. chrdet_work is only scheduled
later in probe, so moving the devm_work_autocancel() (which also
initialises the work) down is safe.

Found by code review; not runtime-reproduced (requires MT6360 PMIC
hardware and a charger-detect event racing device unbind).

[USER: add a Fixes: tag. SHA not verifiable in this graft-at-7.3 worktree.
 Blame the devm_work_autocancel() introduction in mt6360_charger.c on a
 full-history tree and confirm the 12-char SHA + subject before send.]
Fixes: 0402e8ebb8b8 ("power: supply: mt6360_charger: add MT6360 charger support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/power/supply/mt6360_charger.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index b4d4623..e382db4 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -790,9 +790,6 @@ static int mt6360_charger_probe(struct platform_device *pdev)
 	mci->vinovp = 6500000;
 	mutex_init(&mci->chgdet_lock);
 	platform_set_drvdata(pdev, mci);
-	ret = devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to set delayed work\n");
 
 	ret = device_property_read_u32(&pdev->dev, "richtek,vinovp-microvolt", &mci->vinovp);
 	if (ret)
@@ -828,6 +825,16 @@ static int mt6360_charger_probe(struct platform_device *pdev)
 	if (IS_ERR(mci->otg_rdev))
 		return PTR_ERR(mci->otg_rdev);
 
+	/*
+	 * Register the work cancellation only after the power supply is
+	 * registered.  devres unwinds in reverse, so this guarantees the
+	 * work (which calls power_supply_changed(mci->psy)) is drained
+	 * before the power supply device is freed on unbind.
+	 */
+	ret = devm_work_autocancel(&pdev->dev, &mci->chrdet_work, mt6360_chrdet_work);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to set delayed work\n");
+
 	schedule_work(&mci->chrdet_work);
 
 	return 0;
-- 
2.43.0

