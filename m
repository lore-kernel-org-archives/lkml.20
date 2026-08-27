Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064DE36B92B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872635; cv=none; b=k+7IlLjMQQQfR0TLV1CCT9WXA3bI/HZQpqyUYNCzizFBiK5kFxTT8Zsb6G52qczbcpzgJ0u6Czgglnl38K1pjlOqGIoOzYExMoQl3nfvGEb7oEMXZFmwv3Av6i7BCY8PBW50y4sk9TTmEUz0CaExVsJaAlG0TOdQw5K4Z3soVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872635; c=relaxed/simple;
	bh=NzuVq/w7C8F8yq8Sk9Lb0kpmuAUTsBd2XPTp9Yy9qLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRZ6WtHVRyeMS54EHsYqUsqWoztjiVhXtslCGHpQ5oIYSjkllR2rgXhr2bOhItxUYs6bFb/wC0U8F2ZxItJl64g0dCvcUxO06NX4+gn1QtL+tA1UbBKeGBTZehyPX8CK8E4+KSiWyEuXOHMcA722V1NUC7kiiAqQE0ghs6WLCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzWQWYFy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzWQWYFy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47db714766aso1141228f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872632; x=1788477432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxaRY2y7dV8T3x7pQ4bDaHXO+vK0Rukz1PaECXgpyiI=;
        b=lzWQWYFyafSOGUJDdudwCrmKw7uRulfi8vWiJWIBKI5x9Rn7XCEJUGGbQjXi7Cce4G
         I8EaSf0OHB0ArAk6nb2O8lfxdLMk9+A7gRUc2YCzzXAwQNMk5SOgW94vDqNlbZNXRE/L
         D5niHAJnD29K3UwUe6qpiRC/owgzjWNpZwC+te5IQsLHOkzIfZxd7+yD9v8n3KkdL7bm
         EYIPXBY5Kwfc7hd0rcrxEdmkfbGhoKOllFJ+tglgPnnVDrv+BU2d0oidBpwPuDHMJhcW
         ddyorgKT4HyXKy/VKmUWB+zdp5a8nYzn6d/VBHG3YEJZRi4uors8WCxMipkhtq8n13EB
         Fbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872632; x=1788477432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxaRY2y7dV8T3x7pQ4bDaHXO+vK0Rukz1PaECXgpyiI=;
        b=qV5sZJGE5cUQPtPv4eXzWny5Gj6Hf5wDlmH9Sw3QYKMFbi3tAyYGEExKX0I8DjpuLJ
         jrlk7LDCnLbzZy3Rtpnfzpj28nojbHxKBLYvyiqnIlkO47Q3n9krZ7FZ2NHbkZ1E38hv
         gnFE86sCdELN0W7vDYzLkyv9aeK0kI/np25T8A3bQJH90uvX86cPflTO4Zr1hythry3/
         99NDtnVZWOTxzqni4EGXlYT8ZlftcndlV4mLJyzeh5NojzurXQ6QwN0yll8/8lbCQcGF
         ngitZh3fDl1/eHK+72lP/DrOQcQu/jWDM/3G1l06+PA38/iqMdYY4Q/ai9IEajwfoGrr
         ZLgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdjtD8iJzwJ07dN63CrnLPcDyTT925WpPNSirbzn71600YtJAmTVZHG1jmWfcRMnVD1qe9ck2wStxhW6M=@vger.kernel.org
X-Gm-Message-State: AFuF++l077ZqaYZ6Wcg9bNz7O71Nupfcaqy+hfl85BLLsuQPAQYAYh0u
	zcs0t2VI2xroN+o5LAhUClr777tyzAjfoP4Fm9L7NdMhbCVX7nWXFRkg
X-Gm-Gg: AR+sD11rQmGzyElvCeorRfaMK5P2jX7ZSufJsLC8CPh8rVEWKoPHtjly2CB4LQi1FJB
	zYEPrlo7sFdG/KaYp1tjrCeXGji7JlYVCsSjc1vDy2cw7+NDKOwWwmAQPDKU9Uv9dzloR9JgKbo
	ueGatuBuNIIsWHbjZ/rvYHGj0nfRj23fTf+Ac7CjlMH1Pf5R4RM+bmodZmTL0XhGE0ESAfvFnwz
	pmzKCfucm7ehjhU3Shf2xOpBv7hLL7r7rF2VfB3Dekls14jim4Pol511e3g6+NHT3fsOfwoGn7H
	VwFdpemT6QpJyzBzbXLPZ/JVEAf7hd6JJQno85u5VvjBpbxIXL5b/Z8ZQ4feG0aGcqvMG5Sl/Tu
	9egQiT0HVlg0T0Hx2W+PKiAXmX7IAv/bRo0NjzvA5mBTnLZvA39Ut6A7FQjQKK7rqQpO1vvCndD
	Pjtsx5cuK2H/hk2lQLvzQqKZgMHl+d8NuXewcj2JstMvD+9CdOBELEsX5ET6ecoeD7KQyMjTaKI
	sRwNV9eKs7rMc3uFJiHwjYCza3rZ+Jev5vF4vh6oNkN
X-Received: by 2002:a05:600c:498a:b0:499:b81d:f580 with SMTP id 5b1f17b1804b1-49b0dea670dmr88417215e9.2.1787872632069;
        Thu, 27 Aug 2026 16:17:12 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f5e2fsm10900940f8f.33.2026.08.27.16.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:11 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 3/3] platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs
Date: Fri, 28 Aug 2026 01:17:00 +0200
Message-ID: <ed99294bd4ac7cd40fa0b2053795aa24b27a632b.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.platform-v2.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.platform-v2.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L uses two GPIOs provided by the RT5677 codec
itself. GPIO2 enables the second speaker amplifier and GPIO4 enables the
headphone path, but ACPI does not map either signal.

Add lookup entries for the codec device so the Yoga Book ASoC machine
driver can request both controls by function name. Register and remove
the table with the tablet description lifetime.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 88693b9a1b01..8a69194a724e 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -345,6 +345,16 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 	},
 };
 
+static struct gpiod_lookup_table lenovo_yb1_x91_rt5677_gpios = {
+	.dev_id = "i2c-10EC5677:00",
+	.table = {
+		/* GPIO2 drives the second speaker amp; GPIO4 drives headphones. */
+		GPIO_LOOKUP("rt5677", 2, "speaker-enable2", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("rt5677", 4, "headphone-enable", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 #define YB1_X91_DRV2604_0_DEVICE "i2c-DRV2604:00"
 #define YB1_X91_DRV2604_1_DEVICE "i2c-DRV2604:01"
 
@@ -392,6 +402,8 @@ static void lenovo_yb1_x91_remove_haptics_props(int index)
 
 static int __init lenovo_yb1_x91_init(struct device *dev)
 {
+	gpiod_add_lookup_table(&lenovo_yb1_x91_rt5677_gpios);
+
 	lenovo_yb1_x91_add_haptics_props(dev, 0, YB1_X91_DRV2604_0_DEVICE);
 	lenovo_yb1_x91_add_haptics_props(dev, 1, YB1_X91_DRV2604_1_DEVICE);
 
@@ -402,6 +414,7 @@ static void lenovo_yb1_x91_exit(void)
 {
 	lenovo_yb1_x91_remove_haptics_props(1);
 	lenovo_yb1_x91_remove_haptics_props(0);
+	gpiod_remove_lookup_table(&lenovo_yb1_x91_rt5677_gpios);
 }
 
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
-- 
2.53.0

