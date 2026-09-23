Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CCE45D5FF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206923; cv=none; b=bLzBg0cu+oKLt9jkU1sD8Kcn+6oSKf1W5ZsCFygXkqj3lI2O5f6PRAsxzsudkJi4alHJAJ9esINuC+rcQRRXVsKZ2DYF3bp4Ir40ALzOQ5QCfsjFi3GzjyyjKIHlJVKJpw9TBd4jUPL9CFqvwcaQxRIuI8jiJ4FFkzIofNj5HD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206923; c=relaxed/simple;
	bh=jTYEu6ZtAgdC7ZQ9hXWoQvkVklAqgHKUxm3ZPmigkbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkpNMnTOcUhlKtFqXaGBRPTyTxKl1eYMzBSU4H2MuP5WA791y76DpHrQ1czEWdQu70+QfhSzUqD9KZU94JIduKtYKTpxIo+5s/xSamiO4qey7sZ16s7iWarxVE/gnID5chr5idIwKqS4+PI8zFqVLk6vwxVfuSF7nIo2MiO76lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TupQMrUY; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TupQMrUY"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f089b1e3so1317897c88.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206919; x=1790811719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlIw0ZbHp60RrT00NlXN0W+bJLKDe7Nj/Yt5yJjNy0Y=;
        b=TupQMrUY1lVUKn6+fxYvS4oQJ4Eyiaz5vK0BL2GIxbdPaKieZb5EY5E174v7HDevVE
         TpRVPsY2aoOWtn4V4HFIQyclkSjz9Oy0r/ssAWUu7sknmQ6VxafK9InK/pgCoTmnAYGu
         7pnnoq0trl+xCqRzI7dcQ8l/EwrRO4vLEAm3YnrrI7xXdBeJaywVP43d/dtAToh8frhV
         loVhgk+MzpoKiE3jv4ZNn6aPpSh+nIbVRk4pCUTPVM7/7K69boqo3XJfsnKGjJGu2ueG
         aMPjQt0TZJJCOWIxNaUYtte3WQzGhsbASFL3bKEeqxyHOQ2LtnpsI/pJHs2ENXXTzW6M
         hIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206919; x=1790811719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlIw0ZbHp60RrT00NlXN0W+bJLKDe7Nj/Yt5yJjNy0Y=;
        b=j0S/ye1NsSfzHXdG2Uo7Rax4QT3Oj1u37pSeOB6Lb7HkI4YXVa1X2kC8HId47DWiyr
         28WwJ5ZnJTfCgIMWhtlp/9EQ2mkn9iAQSIosOBJvO+22JTuBXP9Kyn5Jctjdits7TanT
         jd70W4rl6F0OjXFYFj40XFgRCWzUU1QK+7Ctie//i0XQi/YEfbqE4KDaPEOHAVfT/KMX
         Wev8QHaW9QfUudOW/UIpF1M5TD8RHT76SiVvz40i532EEwNJkqlbI6U6BWwGcq3z1sYn
         TKoyxg9UwtILZ/ZupRyX4op0OheVe8fuFbKfMvOpFRdEXixM5f2wd3eKNiWZwrcRk+ya
         E9fg==
X-Forwarded-Encrypted: i=1; AKwUvBzb6CGcIdTgCax1m8KsQJ3PcLwkg9ECG7dF4MNRNrZXcpdFDQ6/jc68vK/V5/abwWewB+ppv1pZsuxEKSI=@vger.kernel.org
X-Gm-Message-State: AFuF++n3QawK6aXJaTxLdFzQDdDCMscPAETAlQJJUdau9xpfzFAYzQ4F
	w5Ce619FWM/uTacDTHuP4OBe6mhUo+C1gtikWA1e5mYsYj2djgCZ6v1T
X-Gm-Gg: AYBFou1XEP7w4Ql7PvwL+enIWDOilGMwDteRoVyW+tDrgri+8ouxwFgp0JPpqXc7uXP
	XS3L4w6NPtgqrBZeguHTFpcGJ5dLZyMhI3ELwBQMY18yW20zSDRR3Ix+X446PJB+roOrslblXZL
	WRjrXFWtgt1qHBEe6ypazte8pi78KyHKJ7/7cbtOcOmfUqR7pa3oToOpB6U64Yl9+5qiCXKK+jp
	YuOnceA0Y2b4cucMggAJ0kkpaD5D300byztu38udmPQSMt48PdKlvZ/s78niRXzUb6hwwJvOvlY
	Arxhs980oP3qLikmAd661nNLZcUbLQBzd7PKBCoshSVYmcO9mMdYbGa7/EF6XrGQvC+iwhN+fsL
	MPX6Z8DPvGqtHcZfpKz39XIh1M39ZrPDrjSvLHJw3KEyEFnkuvwGyhUIguADFA0SIUfeNkDaBgR
	z2TUQ/VCLvBhJcodWaJkIZWQKt7U7NLeuirO+nmXGcRdlPkCUy1ohgjiLMSkw/6KU3D6vkWpHwC
	nvuDGEXv+wzHfFBS7A8GrC18qVdQt5Pe11b
X-Received: by 2002:a05:701b:418c:20b0:143:2982:1045 with SMTP id a92af1059eb24-14504adaed5mr276046c88.38.1790206919445;
        Wed, 23 Sep 2026 16:41:59 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm8100182c88.4.2026.09.23.16.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:41:59 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 1/5] media: ov02c10: Drop duplicate register write
Date: Wed, 23 Sep 2026 20:40:56 -0300
Message-ID: <20260923234100.318151-2-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234100.318151-1-calliarifelipe@gmail.com>
References: <20260923144257.119076-1-calliarifelipe@gmail.com>
 <20260923234100.318151-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sensor_1928x1092_30fps_setting[] writes {0x395f, 0x00} twice in a row.
The second write is redundant; drop it. No functional change.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
---
 drivers/media/i2c/ov02c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index d622f5dca..730a40e94 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -209,7 +209,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x395d, 0x05},
 	{0x395e, 0x02},
 	{0x395f, 0x00},
-	{0x395f, 0x00},
 	{0x3960, 0x00},
 	{0x3961, 0x00},
 	{0x3962, 0x00},
-- 
2.55.0

