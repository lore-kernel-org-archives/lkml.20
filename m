Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E6A426EB7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925934; cv=none; b=nyhnkN9q8OnEc18GGh3DYkrFyfvyZPH0fMc4izaO6/8Mc9z+lQ9upkCvDwtsYlY8S2TNcKLwq6sa45ykr53fWXxzvRZbI+fvaVogZj67u7ibZd6u/6aHY2InHiPyprZBkc+kctg9p4JgR2Lus7+olpv4yFMqPU9afvwzTEjbZoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925934; c=relaxed/simple;
	bh=FGNpQ0k1f6g6f+/w9U0t9YLOi6n+7uAtJCsAhAa80EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/1o7RkffRodOjS+MUdNjFzyJw4Oe+9Pu+vmh1ZIM282m2qgYtfUyyqnKd2pODi93gLBakTFZxu+VoKqlogIWFT29pF2LBwC/ZA5ikuJUx+FUC7ap+kd+3rV+S27wk/mJr9DPZ8OuQ0qlYSIboCDMtqbRCE4XYk1ndqPqKjdCvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUuyyWI4; arc=none smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUuyyWI4"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a8736cfa68so11916361fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925928; x=1791530728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7/xBuOunV9HtMjo4A4DjKBufd9dH+BXioKMJcmPy2g=;
        b=WUuyyWI4XFqAGwmLdP5pPkxiJF3JJ8Al8A8YxREke2PaSC9gqRxMans0XIcFfEXWSl
         7qntvK3GMUYb+1SqBAH5vj9gBfTn1n6nVis7SyxdK347PfO2NJRkO9kacwodomrmuAK6
         g9pIv+znosPDLxkrNxD9m6Rj4QWagkUl6U8K33YkKdZlbBCW/+K20BVSFKVwFsqwAwus
         Uj/dDwuPPoeuF466avf2OMOLuUY6HZrhOebAgUpXtR09AFe2oA2T3qqKBhE81rC5UkPB
         McuNhwR70s44MMj5yi9SJPLbKc+bLFZlO7TZ9FBOYdE8OF1RPCz6qgOSEAn4ION+kfFN
         5RQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925928; x=1791530728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7/xBuOunV9HtMjo4A4DjKBufd9dH+BXioKMJcmPy2g=;
        b=zyCfV4AGtXNoz7fvG9Zo9Q4yfEFvF7WwpH2xc2ofMjOTglbLegopIKQ7wCbeIkzdUo
         1tIiUE/zpHIigoeqLsEFs/eSJTzet9TkYBvS7Iq2rGWh2tMGzVbT8+VzzFvz507bRuoW
         LrLLF6VKoid578YAqH9NWjqqPV3ET3B+mPDaWzYk5CVMbJ5Hfrtgp7xvBIEwkmRX6HLW
         5Tg+Zmi2qf79ksA7WExOFlKg8QeBOVkMmYAelaLJnzXBq2f3nDseVsrHgP25v3+wOmF7
         d7PXCFLRI7QOf3SyPZJ1npm1G5+T4wansvFgvPxfAlZaiJehPIPFDtxv6DNUIL0Xhk7o
         bPMA==
X-Forwarded-Encrypted: i=1; AKwUvBxv9iu6w2UjaOnNS8HpNWGXMHQ60oegtyaY37f4S4LFioXkcbo0eyMm4uQ7ePAcvj0fpzJrwi81gbc8uhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5JrYzAOa9WaMpywOb/rL5JJAo7GqsqiOA4mPwf6gJFkbLMwoi
	7vg5P1nKKRJPoTljUQdkF2xC7mZa5OILDkwsYc7lCy14tYnNjFOlFHYZ
X-Gm-Gg: AYBFou3+6YmRNEFDyY4OzTGbkHXHlu+xHmg13/aTtAEO84mw7aLCGetvQG+DTmjTvIi
	0wSwCpN/r+qMnZm6L+SQTKjGRvaVWubQ92uLncAZuMUnnjrY5yWTxE2Z6kMnHpKvA6df1rjAcWa
	XQSRT8wcXlWN9g8l8UyeRPGZ4plZuXksE/cz4eDXs4eW/oypb/p9Vp+pU6uvkW5D/Feuby0xZgH
	vl9Nc5ebq6KLzQi/4UzXTcL/YWXbJOdsCTmpksciv66eof7wuzE5Lok9DC+liPQngox+UDmFav5
	sJoWLwgUYAW92fvkzM5SmJQz64BQ5DyAROEUembYIwXzALax5bqwEQWAqRN6v9qlrvXL7FYtweW
	jhTjp7mRrD+kD+wX9W3UADwVW6LihQ3/tbfUjTgW6ajo5j/zFW157VUS428VlOCgsyJdmWpoe1S
	5zgzYqNIvPNyRblgsMRD8GDmqGKWYdi7sE83iuQk/JcGBoEukQZe6Hc41HtF6S1lk8CMyYTQQaj
	bEdNm6GLisW2Y3ap5oeOG2ysz7hZE6nXAvhrzyqkSTpizof3BvFJJrpG7IMFVSRoeOsdzum88+O
	VnDU
X-Received: by 2002:a05:651c:3059:b0:3a9:6f4d:b345 with SMTP id 38308e7fff4ca-3a96f4db5f4mr514611fa.14.1790925928336;
        Fri, 02 Oct 2026 00:25:28 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm6724731fa.36.2026.10.02.00.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:27 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v11 1/5] iio: pressure: dps310: use devm_mutex_init()
Date: Fri,  2 Oct 2026 10:25:22 +0300
Message-ID: <20261002072526.250081-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072526.250081-1-zoone.rupert@gmail.com>
References: <20261002072526.250081-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Destroy the mutex on unbind so CONFIG_DEBUG_MUTEXES can check it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 85df58ac1809..f7265df2fcb5 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -19,6 +19,7 @@
 #include <linux/limits.h>
 #include <linux/math64.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/unaligned.h>
 
@@ -996,7 +997,9 @@ static int dps310_probe(struct i2c_client *client)
 
 	data = iio_priv(iio);
 	data->client = client;
-	mutex_init(&data->lock);
+	rc = devm_mutex_init(dev, &data->lock);
+	if (rc)
+		return rc;
 
 	iio->name = DPS310_DEV_NAME;
 	iio->channels = dps310_channels;
-- 
2.43.0

