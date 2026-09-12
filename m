Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D933C1D79
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789198048; cv=none; b=DtKe4rOW8yx3gbN89vYcNf/zcTFai3BzyM4MZmquoZW3+uVa7VJ2iixqBhpP+UkMJV2vvxvNsbU65WXO7XyjXfBcx2eroOVyBZbka3McZKj1kYic426VBSBNp9leLMChxAEErQTCtUvpXikpCf0BwvC5ND7J/I6Pk4qdZcEWMM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789198048; c=relaxed/simple;
	bh=xWwLKaPrCyo0dT0sNxMgIyzP50ZuIJtRJfZmjZRt53Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mCnQMIZbzVvvviapOU521Mm2Sc3/gGe+i+W/oXSfOIDtpsi0kiFPpbNDMRkeltSIDJjef1g6aq3MD2Hfcx0gm+p8PwNjqkpXns1sQHXpoACCXnf3bv45xoiO+3hQdJAL/zCo1XTCOGBXosZCpJZz5dDNJlHzea18aKwTiAhv8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSHEUNjf; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSHEUNjf"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so140901f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789198045; x=1789802845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Io592Y89AofpdUrmSgsTJ42xjhFrTGkqh8KCwi7QkhU=;
        b=lSHEUNjfHadbOhqLER7lnQlLQJlhNhT0QdyKUkOWllool1nz2myr4+VR93bVZdZdJa
         qO3a/QNIEFloLkG9bwqfBvlNOHI6IIJhNyUOaAXm4q3RnOb17bf25jyjkNmF2qakDBBU
         4MTK03egDrE/umE3gVOUzDfr4jRKPyMr2D/UsST3A8YeH2Vjn0H1srrBV7EEArXmA7v6
         7hzkLTFAF7EqUwxXDnM0XsNVVxVf6/hxYjoDkjzpPqtu24ROYp5tVdT6ocf5KeqPlwPg
         5MsK8cjS5f844UAdYHGsUC0WzjgVbQPy8R60eg8j8X4W2sk2qFfqbX+wJFb9kmlM8aQY
         Uaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789198045; x=1789802845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Io592Y89AofpdUrmSgsTJ42xjhFrTGkqh8KCwi7QkhU=;
        b=Lc6nlevbhZZpFmzUXsJGusw05TR88Z5NBgDvVPoDPxd/odshcAilWrAqfKXWadYl3P
         XOZW8Kdc5d5YapP6JZ3Do0sGkx11W38A2fRmc4XSUEsNm8eD2HTOTVjq1a57aC/1lJqY
         uUWSsUQYAgCVJ60r21PJ1FP6//sJdTi4sjdi+U/QkGtJUdVOqMmK/s6enEAP1vIHm5jB
         Du6Xp8H86pSfKBqQrtDW0rNzUlIdjmAHvHINclnq7StOoFGalbWAQRUgjW10+ADO5k9q
         6neVV3NqLXETicvxD7sSXH4BgdqFkKaW5Ud4p6L2ivh4D6jSIu+hluOfxAzl96C7d6pd
         SjWA==
X-Forwarded-Encrypted: i=1; AKwUvBxCQkaV0sLq8zW0SHeSSwERvA37nKxvzJt8cxmuAMJkqlT61ARCdYu1xqkiP2fWvPzokwGJrOm+LRXNsdA=@vger.kernel.org
X-Gm-Message-State: AFuF++mnVOCju8E9g1HCC0+cWuKWp17ip/a5DffebrZrIxzCKZnoUAnT
	u3fLbSNRE3JEM/8tSiQR4gk5X4o0NsXDxmkFasEjgYYqPuqyJ6iqUs0uHZyjLmn5
X-Gm-Gg: AYBFou3lip/ug4VF90Z9OcMp/VVFo4F1hSonX5kv45St1cEZT5d5X6DMidFzXBODHrg
	qeQQ2ASXh/Z3cdlYUu4yq14UI6IFFKdA16CE+0CW+PdW0wQCVTeDF0+hGh+JRl0tJoDxGqf0Ld5
	2CJE5B8PZqu9M38VyOsiqcNq8OxbIVcu8Gm2+6U02fQ2wOW1AdwXSm0aDQV1Bl3sylXXlCP8X9W
	T1E1Gs+IU2yfpVHWiWpSYuI4ISAKEsbD/FFjBCbcVPXUL3C/aev8Z5z1vfnC9ghybd9GAek5gzo
	j/wNJkSroyEm9bwIFwZrScgmarsWaBIN91/opI/xg6mcbvqPsKWTaFdVrR6LeKQzBLjoI2d3r6p
	jZUbe5QPoZe2svgZpG72dM7rfAKyJbLVDp2Zo6fjurPyb5t/JpumWTRnnpID9r01VTGZPuBb4yC
	kIMvr1nxvwtvdqR4X3JkUcucbtyTdZk48nDr7bmF9LHP26sUE0nOGHr322qQbnCkq/4ADaHJv13
	Xs1HkGcYdWQNiNwErgKJwVgMe63pIuvc6k6mZVUqjdbp06ohCniAErbRsnctGkMlJAiGHzunolb
	fmU3NTk6KwkQhIC1CvD+3sGD1uuSXKKQwIkSuW/rRUPnHXT+CrIb/Lszs7VQ3yyWMN9RMTJBW/f
	dNL3ZyUs=
X-Received: by 2002:a05:600c:a47:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49e6cbf762cmr14438255e9.26.1789198045202;
        Sat, 12 Sep 2026 00:27:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm129447425e9.8.2026.09.12.00.27.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 00:27:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l: cci: Fix devm_cci_regmap_init_i2c() kernel-doc return value
Date: Sat, 12 Sep 2026 09:27:18 +0200
Message-Id: <20260912072718.50636-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_cci_regmap_init_i2c() returns a struct regmap pointer (or an
ERR_PTR() from devm_regmap_init_i2c()), but its kernel-doc says "%0 on
success", which was never true. Describe the pointer.

Fixes: 613cbb91e9ce ("media: Add MIPI CCI register access helper functions")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/media/v4l2-cci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
index 4e96e90ee6369f14b43e012cd7044d14bcc5a7f0..a603d419ecaa2cc3771da41ddf5f27270318dbf5 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -132,7 +132,7 @@ int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
  *
  * Note the memory for the created regmap is devm() managed, tied to the client.
  *
- * Return: %0 on success or a negative error code on failure.
+ * Return: the regmap on success or an ERR_PTR() on failure.
  */
 struct regmap *devm_cci_regmap_init_i2c(struct i2c_client *client,
 					int reg_addr_bits);
-- 
2.39.5 (Apple Git-154)

