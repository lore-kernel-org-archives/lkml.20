Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D047B436
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982459; cv=none; b=UrWgmmJjwHaUVcQBFVXH3woLgUJauNubEh/iG/eO/HCiOGRncAqA8gWCWFG5zZYcs+axRLfIMZWRtUhi3cA/lPhZOuIUuW4VFC1dQ3RbIFaBZfLolwtxpb88eHFZnm86vOLUOlaGl5ov0fJR4XWg+E2F8XRQ1muwsSFQqxXu3as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982459; c=relaxed/simple;
	bh=jwsl/lf1nnwp9LWA9WLqxv3hu3uFGbpXprANMeMEEbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N+pSPTLEUjXx79GHW+L4nFOBVNq9lxoFVBcdnk0PIGLYD/fUTKqbWHzFqOYjNDI+ccJJ1FNzK/osmd19COBmcHuvsqTzMILxLKFw6mY+C8JHP1lAVExG9yhsAqBluKrgwloYeBw5/wwCba8f6escM7Zob3EuDXCWMeWSTeKRNLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jrInpME4; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jrInpME4"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b1743e9c7so89106eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790982451; x=1791587251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g8C4oNz0B3j10C4TExUEIycHLskvC0S9bsmP8HfkEVE=;
        b=jrInpME42maUckDg0GrWYnweSdpxAF9FztUmAFwQ4+et2piQl3rf9LQnmqxG1123qe
         5oJerTHWp6w4xa7SrEKZDTo85T0jb9+qXkP+69jdtadcQl+ZxcpjIghAXpe0WYmT3FwI
         YVs8x+Vyw0+img6C8h8NafIj5zwoaTef0Gkvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982451; x=1791587251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8C4oNz0B3j10C4TExUEIycHLskvC0S9bsmP8HfkEVE=;
        b=U8tRs0Y0z4SS80D6nYstzIXx31w/i+vWsTuL6ZS4gJ7RYSi1jZkUkOUyd6Zwp+IQf6
         JY4p16ZEaQQD9zj30zDHCoxky8D97/tVO2V6flU+VkS5jKikpFI2Ykz3HRc2tN1jxLdc
         YCdeAXplE6zkRBN3ny/dCMmAVCloHfO2+zHpX3qg43SRIdyp0nub5dcbg3qCvO9jyt0t
         xKs7dkZ2vnnL9Uv6oNYZejrqK0VRPYAz3GI8Lf1teIrjNcjCiG1dsqCqW0rI5Fc3If6F
         4274J7bGAW//Z0oF73ABqA3VELXax/SfWZOqXFsvbLs9sWKjT3SThjD3k4r7UqIa19J9
         Faqg==
X-Forwarded-Encrypted: i=1; AKwUvBxu9yrfd13xyOFZJee40MWJe35f/M/9Nah7iJAMChCp47beXLeg9AtjkY9u2vXGmHkAF2GBLQL5w/EwpkI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWJlnhYTz8zWVED4KPRTP51qz4eYE3BmEJr2+AnQjz+7BKLEce
	D+7huB/CSWHybL+mAZ5pCnv+W+FtHnVX0tQKI+rLuMx8+X2nU9BV6OsZ/XpLWAVhvg==
X-Gm-Gg: AYBFou1t3BLeR6IV25/2VlWMFdA8mKnj8Swik0Jb8nk1KJSFkR8N9PkEk3Xz+avn2UD
	aZmS8McArXPcdi6mzNF87x0J4bmFYnFwejHJe+oa8GYqecjAOdfsZdZSLEdvxxxuzSl4Ff7BEuP
	QWsNVpFj9A2GuW0JVIAlo4OhBpEOk2H8jpJHatGGeAoeAOP30CjjxYm/eKTCqjfQUnTZMQLNZ/P
	Jb7xvE0t0Bqg11Xbl8TREoE8aImztOxeP2S0oo+AwxQsJGDjmHkVKZI0GxWCMsTAyJ4tLQbVbTF
	812gVUtGBYw/fLX/6rMCXjLXDo5YvWCXZS2msG3lGZDmGyxyVajf3jegvtqr4Zlx98kugYqjmWy
	A3bMEjrBUB9kK81zfQk2rN7mbEHqWbrHLGpIwj+l5uJ11twL9TT8Y1cl+a0KVKaVFkmR+mI37c+
	TathKraXnNSKr+ut6i2PE5551Iz6YjInjU/zqa+0hNTviMM9CP+/4qTg94lUGeN/paIc9wD4i7T
	Nwdz1bIn1VwOPidIS8b3SfLmaFuufivLScppA==
X-Received: by 2002:a05:693c:6391:10b0:34e:7f9a:c722 with SMTP id 5a478bee46e88-34f218665camr4494122eec.34.1790982450979;
        Fri, 02 Oct 2026 16:07:30 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b0dc:e72e:e96b:3323])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34f14f303e3sm11053210eec.5.2026.10.02.16.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 16:07:30 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 5/5] iio: adc: stm32-adc: Drop runtime_idle()
Date: Fri,  2 Oct 2026 16:03:09 -0700
Message-ID: <20261002160309.5.Ica1e32ae51d7975844386684d2b6a097f3ca9122@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261002230714.507921-1-briannorris@chromium.org>
References: <20261002230714.507921-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This runtime_idle() implementation was added in commit c537d3457542 ("iio:
adc: stm32-adc: fix runtime autosuspend delay when slow polling"), to work
around a suboptimal behavior in the runtime PM core. It should no longer
be necessary as of "PM: runtime: Propagate last_busy from dependent to
dependency".

Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Ulf Hansson <ulfh@kernel.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
I do not have these devices to test. I have tested other drivers, and I've
verified this behavior in unit tests as well.

 drivers/iio/adc/stm32-adc-core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index a42d82d61cb8..e9e113a46ccf 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -836,17 +836,10 @@ static int stm32_adc_core_runtime_resume(struct device *dev)
 	return stm32_adc_core_hw_start(dev);
 }
 
-static int stm32_adc_core_runtime_idle(struct device *dev)
-{
-	pm_runtime_mark_last_busy(dev);
-
-	return 0;
-}
-
 static DEFINE_RUNTIME_DEV_PM_OPS(stm32_adc_core_pm_ops,
 				stm32_adc_core_runtime_suspend,
 				stm32_adc_core_runtime_resume,
-				stm32_adc_core_runtime_idle);
+				NULL);
 
 static const struct stm32_adc_priv_cfg stm32f4_adc_priv_cfg = {
 	.regs = &stm32f4_adc_common_regs,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

