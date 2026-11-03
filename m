Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744596;
	b=Z8vcwTCCQLw9IISntrOryh9+kpZHtMvmNsnAQ68wZqjGVnS9on0MI5p4k+ATljdtSC5b
	 OE3EpXeO+xVBLlBwvqRVfnggDjtgHZIyfgj50zJBvOKaY+2S/cJ0FkyECUYNkkb/0cfKF
	 1DYWjXz1OQY6XBUCVu2BRTlheYZqpqSiMGs9k+26bHTIhwtYAa2ZZEwraFj/DL+1f7ymi
	 DBN5VYLwFt6xQdIlQdSQot9XJndgI7i8smxycvhmNGMiMUQjNkT6jOLFjhhkpf3vpYdoc
	 glGuGHwY0PHFhvLEfwIBFbaPplnsHZeW7echTPRDVX9qAVxlIpBlL+njW2qCp23DEkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mtVdxBGNK8oHTFOTDJC4ciOsojwKNf2YHH+u+jkXh8g=;
	b=JnCnsvYVgSmVijhnF/HFq6Mc2P4cR3FfbuxV7UH6KYK261MbuGjzm0A7O1rA6MsiUpDQ
	 wfdYa4/Q7Z06dK4WZeIBR+Oy2Xj3m9BF2oWPu0pCZraGEhstzxto4/aF3TT5U+1Ft3PVo
	 EKhALLfBTRFsDxh/T2Dzck1/Vya9Lc8QgiSwBXDo2YYRwCczYGNw0wRoW76jzLtIn43wb
	 SwUpmT9tm7xPkPXTHJaZDlBvhDF9/gdsOz/87wXnkOjqczUrypG38ukx6xcMMmXuj3V/d
	 5cv6Oc1rbLA0UX8ypj086tFw1e+JJM2Lq1IbXcfAGhClxZl8qanHYK81DMxwc5M3weA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WI9KvTyk;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5245B606D810
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5245B606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WI9KvTyk
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15943c9c005so312444c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744595; x=1794349395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mtVdxBGNK8oHTFOTDJC4ciOsojwKNf2YHH+u+jkXh8g=;
        b=WI9KvTykKKOoDsf+ULZVClTlXCFT12vjawevA+tAVPFVxcjA1lb8GA6wFRQW4E1YAr
         nJCH3oRGJdIu6cd4ZfETInJ2MLLkJd0O1DpjV+Ze4JrRG64qzaYEzNVSOJm+Jw6j0piB
         C0T1yd1lHdmh5L3mfpTIiS8wzn1qQTQewEp4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744595; x=1794349395;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtVdxBGNK8oHTFOTDJC4ciOsojwKNf2YHH+u+jkXh8g=;
        b=zE29Z3tf2Jd/b2kf25Af6lk3zxG/6qjlU5eAzXlIjzjGNav49MStuGT7Jlb0c2btcg
         gpUMQPEKVgQveZDUj9CvKscitgstj4NL4DQLQOJqArw415FcJ//+7XC7EWXcnpQBXZvc
         5fsr8DokdZF/K/nI1RbjlO1eBJnjgzPmZhIwleMCGWU3nl1pR1eTd8Jjw2Q/hyAw/uAH
         dBKcLPjZcxgUaUeuRsRzboAEyQ3nYsSNlquKpgVX22ZMHv1leTF2ruq2TzMU2/3t1Nq2
         DynPAhtt6A3mjyp6Dkg/cosVhKq3Y+K++oU9nbYDSJlKZffStQ+4HIOhlG01MTaQOgyZ
         ruBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3noSKfzMwlVCXXrjbi7v73QptLE797+AFeq292JNypphkNheLUUoKtQHVs+0Kx3FBLTT7/qDz0LMgSFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hKrm8sFVpv5M8CdY4+eT3aoQGa9oGSbIL4da2Ke670ZANwyer
	D5/3RF2IBvkJG4XYtXIdEcVzO4I64qCz4q2F9K6erPdnsJk4VfFtKVxjchvSC/uS2Q==
X-Gm-Gg: AYBFou1ULFgYLA0kqj64eUNkEKFmI5s4/LhzRf1Bwab4Qnb9zOYXX2rGFydcN/ZqrId
	SxsPVYqTDj5oOtDyPHclnKwrORzG+P+mNkNzDt+PFb7MPxJqOIu/xbLav9tiY9erF7thV95hX7P
	JZGvJ/+jBv+JeW7oCA6OZhCwEH58AjJn3vX0yXH45NknoVCTVX1SggYoj1WCWXwuWDZ/ID2SOPk
	VGA9NA7Th5AAk27z5X88rwVqpSHLFpExVosFK39X3usGrVQnciumO13TMeKtbdWazJF3nc/PjTW
	1WMS+pFt+lu2f42n3IQHWiHZiQkVxwyrh3/CcZZRFCM+mpucU+efmE11PUYsle6Bqqfxpw26UwA
	sChu1C5TdZcF9mj3RduXg7jk6fvI4/vkXnGnuTT9b53+b5Esv+i5DlfTGuSi5Tu0kvMVsnizAMK
	CMJ0Y6EIS74sTjcCmDtibxX6v/5ND4vU5+9W7cFOhodf8N+2rWAXD8IWzWztDd5RwqvzV46Nw6U
	h5OjWo4IAtUzSHlmY04LojUyxcKFOY0QeAKpf99MqHoVC2MJnB3foJQvieauAfsrcBGtYd7WOmS
	5Okza/UFgtJRLutnS+iGqeHiwjPa79KprSXb36IOzg8wCeasvut6UaacW3A9+Q0BPtPR
X-Received: by 2002:a05:7022:e27:b0:14d:cb67:afc4 with SMTP id a92af1059eb24-1ac5e8e1e4bmr29270005c88.41.1793744595232;
        Tue, 03 Nov 2026 14:23:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b245b8822fsm2254589c88.2.2026.11.03.14.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:23:14 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Brian Norris <briannorris@chromium.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v2 5/5] iio: adc: stm32-adc: Drop runtime_idle()
Date: Tue,  3 Nov 2026 14:14:43 -0800
Message-ID: <20261103141442.v2.5.Ica1e32ae51d7975844386684d2b6a097f3ca9122@changeid>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261103221717.3840215-1-briannorris@chromium.org>
References: <20261103221717.3840215-1-briannorris@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This runtime_idle() implementation was added in commit c537d3457542 ("iio:
adc: stm32-adc: fix runtime autosuspend delay when slow polling"), to work
around a suboptimal behavior in the runtime PM core. It should no longer
be necessary as of "PM: runtime: Propagate last_busy from dependent to
dependency".

Signed-off-by: Brian Norris <briannorris@chromium.org>
Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Acked-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
I do not have these devices to test. I have tested other drivers, and I've
verified this behavior in unit tests as well.

(no changes since v1)

 drivers/iio/adc/stm32-adc-core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index c409edd3a827..0193db7a2a7f 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -873,17 +873,10 @@ static int stm32_adc_core_runtime_resume(struct device *dev)
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
2.56.0.398.g882cbad275-goog

