Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615373;
	b=LY3P8xneHw6lAkpcYXdDLj1Pl1O8nJnbKecR4DTv58TzhvhVS+g/InXiiSCa/qnoyveq
	 dKYfaXKmh5F8/b/dhcA49+4har76CJWGMNIwsfOtiaVi+Z7rjLVeHARU9KUk/U/x0BqZC
	 gj2Po43UNJzy4X2rKMSoHSQj2jRWGAEHBvI0Wh4RvcxMxEYrVSdPPpcmVzgX/wC0gHBWL
	 f9p1DqSMUQvHhadIWXDJVyIaMuxPLZf4/7C4tKOd9T5QhbKMI76Ja+oiI/Xc7cvjcR3GH
	 LHIkBLv9nS1up7GQAMUAo+k4Amb3Bf/s5KbthSIH0oBEE7IaN3ydtR4laQMpXEDKV1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VX00a4WITQ7SjPTcoj/XyyEaDdzABvDPwdB7surXrUg=;
	b=TUUgV00FenAfHwhD0TEsvsF6J/gC4FDheE/f8YlGC+0kNd6oZSPDoUqbtLLOWq3jepqO
	 VGNAKIj1bdk2O554rNvzA1UNeiUfTCtmmPvwXOoK64QQjVYFVwuWNO9J8CoSQj95psnTs
	 P3zer0N81SID369nX+BRVC854d4gPmL5eKdvGnkVFHu4hAe6L/5TX2/AYNTgUjZ1Uw48h
	 9vGANqItnsDAPB78A8eTCCbMV5nS+UOSl8skn+rW58VnDTHwr031scUx4xjMTkYU5L9pS
	 G4G28g60S8jHO2ltdJp4XlR4Y/c+zQggNvOLlm1S9wvZKThiLZjkT3Qz9IjZlcmgPuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=hlwHyfGE;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B05606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B05606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=hlwHyfGE
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2826386f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793615372; x=1794220172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VX00a4WITQ7SjPTcoj/XyyEaDdzABvDPwdB7surXrUg=;
        b=hlwHyfGEjmMUFYgO6ojgD28eXpXvsZ9g3GVX1uWMwCK8fRhVNCuaW8GjeHeUnHBqlc
         VEEN/kZ2bZyaqSQGrFZne6+VL16q1YviF+19lViZlQhI8OzDgGFuEcJGKbo8IwipvLVK
         07gJv5t6/a1M4bKI8ZN0JSEivqOhanRKinv1Y2BrKAJ3/5cAQdylOsXO7JvQUqAhURPk
         kO/gCA0kFeiTS6N4NKQTUxayqT1qCniaZY1yBPsIQt3uxVucZGdmytBne/ibcdV9W8TL
         tfEdBiyVBjcIjxfabsvOUN9HLBWFsTiz+NtpqbrNn7Vk9DgNiS+ZAjdNUYvK3mhUEBi2
         ne7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615372; x=1794220172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VX00a4WITQ7SjPTcoj/XyyEaDdzABvDPwdB7surXrUg=;
        b=OqWNTCwc2bouzO3dreIZ6l+uw3S4HtSQTSIKBlfabcAzHDaF7hMrTFl7HHDOuH8X/o
         OTYaAXaUvVZbU70bU6+fm3VwsHFcT66/sVPV5+iJPws2b5w6SlQoDxV7cAI/zHYj+ZYk
         HJQNNcEDIEKaGNiu9XZkddDhDaPVsbYDc7IMSgD9VRzbVW1wUfBXmIL6S3KPkzVjgLuU
         3F6liwqPFFRYOLW2ZQ7Cdc0cUuV/8Kri/lOylW3YBGQUZH15ar771bvWFKPOXfF6LfMW
         9yQg5faT372lq8BSOq41PO4JFR3pQBOuks2cbtBwL6xqLJk+99FHEFGsjM3nRF0KyS9b
         Ot9A==
X-Gm-Message-State: APuU4Z+45jaqgJtLtcl+SpxdtoFx5RHMHliGEGnnBEKmPZ0QDkWK75WX
	UbhLvlnc5YCQni2wvw3+nvpiNdKhnjvoO6CbdZRC4TdogDF9uCgM/01CrnqjiNx/tyk=
X-Gm-Gg: AYBFou0RNyTlVIeM+xgTkdlHu15BomYNfrg6paB44CZYC7gIf3G+eaUakmOr+AvYulm
	hMEr5g/dNtTUnlbG3kd6YxxK63OA15Lfx0AtzFfVmM6nnFhVkWHdIry1Q6NkZR6vwiY40H6J5h9
	UhGYS1NjZd6SFuakDYVfyjYGCZz0JDi8JyhraDCblHhA7cunRMHlxxXmfgvdjENXfnnQLi6lHG5
	Tbde2p9Z9U0PkoSoN5ekskmKf5X4ipQldL+WoSSLJRGzvT6gO22xNpVWtXUYS289EFArpsz2cC4
	ouNR00ehCeh2Twh7rt9yBEt7Y+VgNbHod9bDa8JlOULRbzZToCPeQPmKJ4JygVtd7g818QLLpVC
	sHSEyqI/mSsA2MVnCfxco0fUHATmUbmI+x7dYiy0++3AZR9BuBNkHmnh7496HkfYqsIBhGBLEHN
	LZ8Ix6cebJT0rWClHcKdnWQlaZFIPa70zDKdntC8f8rtjW+1XnQxpCm76sKLdMeIHOjw8PhlYfJ
	fFsTwf2nPZdKhmTfoRHOrTJU4kTMOYaXZkAOFA/LnWDcNUZA1tjXRWSeGS5laROAk0CvG8tN9/i
	72V/9wxqSiRyf5ASn1V3AlaaOIyeIImZGwYHxHWZ4DgejngQpPB4LWw8eoS6S6e/X/QTafEZ7zH
	YhgnD9RRYCQ==
X-Received: by 2002:a5d:5f56:0:b0:48e:60ed:b017 with SMTP id ffacd0b85a97d-48e6e302ab0mr20202353f8f.20.1793615371673;
        Mon, 02 Nov 2026 02:29:31 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm19341891f8f.42.2026.11.02.02.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:29:31 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Nov 2026 14:29:04 +0400
Subject: [PATCH v9 1/3] regulator: bq257xx: Clamp the BQ25703 OTG current
 limit to the hardware maximum
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
Message-Id: <20261102-bq25792-v9-1-65f223e95fbc@flipper.net>
References: <20261102-bq25792-v9-0-65f223e95fbc@flipper.net>
In-Reply-To: <20261102-bq25792-v9-0-65f223e95fbc@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=alchark@flipper.net;
 h=from:subject:message-id; bh=3k8v/bs5D9/6FvGQbQfmgynT4gW7y3subiMId3LT/fs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9SGOOlTuttiR1xaf/Hd9YHeb1fgkKO2VxMuiq941lv
 Y+PiRq/6ZjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqd9kyMrwOLX316M3cpWEX2/IDJyWt0dY9G9F4KjaGjTU98R9bzm1Ghs2MrFx
 My+QWVf0xY1sSJv/C7rff/W3zpuvpcb+8vWriQS4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The regulator core only clamps max_uA when the regulator node sets
regulator-max-microamp, so a consumer can request an arbitrarily large
limit. FIELD_PREP() then silently drops the bits above the 7-bit field, and
a large request programs a tiny limit while the rounding check still
passes on the unmasked value.

Clamp max_uA to the hardware maximum before converting it to a register
value, so that oversized requests program the highest available limit.

Fixes: 981dd162b635 ("regulator: bq257xx: Add bq257xx boost regulator driver")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/regulator/bq257xx-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/bq257xx-regulator.c b/drivers/regulator/bq257xx-regulator.c
index 577b277efd7f..cf827faf48b7 100644
--- a/drivers/regulator/bq257xx-regulator.c
+++ b/drivers/regulator/bq257xx-regulator.c
@@ -45,7 +45,7 @@ static int bq25703_vbus_set_cur_limit(struct regulator_dev *rdev,
 	if ((min_uA > BQ25703_OTG_CUR_MAX_UA) || (max_uA < 0))
 		return -EINVAL;
 
-	reg = (max_uA / BQ25703_OTG_CUR_STEP_UA);
+	reg = min(max_uA, BQ25703_OTG_CUR_MAX_UA) / BQ25703_OTG_CUR_STEP_UA;
 
 	/* Catch rounding errors since our step is 50000uA. */
 	if ((reg * BQ25703_OTG_CUR_STEP_UA) < min_uA)

-- 
2.56.0

