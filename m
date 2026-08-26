Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586142466A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750567; cv=none; b=r6uxNpPu+umSrdEQ+avYSX9y2qyiTBTJCfXGsZYAYUZD2aw6GdAcwSkOcnInacnxCOEnI7mZR36y3pkyuhh7f8ISFFfPtDzg3zcbBQ2jDwJxJR5HbcMqIO+alwfntmNXEbdXm9cFia8KyDR4Z2vkzaivCZz42gakFsa1QaNjhb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750567; c=relaxed/simple;
	bh=WkboM0OdZqhPqQ9UIgFR9YMbWDHiDEJ6qs2otdpsS4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNBOnCH2BJc0phqjI+pwqMRyP+yi3+rOxqZiGZWKF8MVoOjjiJwTy9IfVFgyHDUiPkEIxYJzKuXdgaSMhiwvDTxChpGcP30BvynRq7yLrr76DoQ0L+GGWYWLM5b1QjfzRjwxfYD75t7VfyI5MsI6bneMsmTVh7ppRf//qvS+ZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMir70hB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMir70hB"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso1487301a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750564; x=1788355364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/WQNlcdBHJ1/5iDWRui/aJJ+/iUtUbCd7WBlOaLV4Y=;
        b=MMir70hBGKtnjxlh51BO9cvasLh4CAD0bonFcqNGGVOBPOM6MDIwho6g9FZ6HAizyS
         N5cNNJVh8JG0/Rsg/tyjKWa/HjsggT2O5RYOP59aM3XcOBPboXcNflaWmOrXIPbCVf8C
         /KfptAq5VoQvrMtqm0WZgkAch8u13JU9Mf4GK6uKcD+tz9L9TnGKbDjGMXmFSa/UxH/0
         z+j1/dzkC6ku+yn/kUy7G75Qq5SPovgjmk+F2CjbevEK/t87NNmyO9vKtScc4cy0Zn9L
         +TEdxCwozwBPr8P2S6rHr0whljslIjn+QmjxUG4U+NOexAZN3DUsEX5Ge27+cryBm9Wv
         nhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750564; x=1788355364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/WQNlcdBHJ1/5iDWRui/aJJ+/iUtUbCd7WBlOaLV4Y=;
        b=iBO+nyDyF4+r9BknQZORdddYqPJQjbXkKrgigk3XCFvYOC2AAiQ2G9X8H4aCz+WUvQ
         FR6R951n740V1Wrg905uyHTaRTYABq3ksh5iixTGXG8viCBDcdc0JXOv/Ayc+wFCEJkM
         /GMmcHqb6eiUarMpkF+Z4XiW7a/VI2dsPzJDVzB64ZFzlNg2Uz2y1XWXWdou23+xgNuW
         gykXf2LedKjYuLLZrBrUY9tuQ40E60Qtd1lUnwzZV0xwDK7S4nzBG5q8r9cpO2/EqXhz
         fp8w9VoZ8zxVpV3l/y5iLGL3e5HPNIoDALWV68VNK11LLVh4b/1Wijr2n3At3/QLCsPo
         QTNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbrewCIeL2BPGWTrGrGZFHRXNggPXLElMiZOmSilhrH4wktoSf7XJNoC7zrGLrSK6GenvD1uHyPNglI/M=@vger.kernel.org
X-Gm-Message-State: AFuF++noxcBNaZxB2d6RaNWNrr1JVhLilRRr6zxp5Or2NBudFI1D+YU1
	Jkq3fCsr1HHCZo2aVTSae6todDbfEPpMi5CUl81LMLBdbORfii0/RoagislWQz1R
X-Gm-Gg: AR+sD12Th1pMmblCs/QDJJ8yADG3T++xx7MAYQ6Uiih6qs+K31FKD7peJqDPkOyPZpe
	rnFNWV3ao76TynDud0e9GWABXLsKFTTJ4egoUHsQvQf9V2tg6z+ycaGnqflurqe9ggB+JpC4rn1
	QPKi+WCS1yhc1haQM/yxiWdyyUQcVlG+AaqY+ItZvc46ZtisfZqXSa9wCqJnFwzfdqqpbvRoROS
	sr3AalVQz4ce2i4Yp3GPtsFdfGIbVx7ovX7uA0dcSxAJ8d+N5c6altdAD3AWWhfjNLEMfh41aQ9
	t798n7IHBbZ4doCRljQ8doC5jOAUlt+HYkozrA2JnPvnr9q6JsTDq+OZlnxbxviYQjXyEPqlQUo
	NDuPRu2s6vvlJQJBJrrvw6+sEGg/1YZ4c3+J2J1i8SsM00JzZTZ6G19w7zCT6Kzitr5GB3mDa8O
	HjOXCw7Df3KvtqKyJGkbFxAcztnLs3PklSlwCeI4ng4HG747ApYNzGM5Sv8M3thryuIerXuom/Q
	0D/gbMR0UoqXE+nBTB5o2fM4s3yD8EFW4JlK0ff7C4=
X-Received: by 2002:a05:6402:4025:b0:6a0:9c84:ce0e with SMTP id 4fb4d7f45d1cf-6a5df663cbfmr9972362a12.14.1787750564433;
        Wed, 26 Aug 2026 06:22:44 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5edef3c26sm1689857a12.17.2026.08.26.06.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:22:44 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 3/3] platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs
Date: Wed, 26 Aug 2026 15:22:33 +0200
Message-ID: <20260826132233.3342481-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
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
index 36c9424c0afe..c4401b59fd1d 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -316,6 +316,16 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
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
 
@@ -363,6 +373,8 @@ static void lenovo_yb1_x91_remove_haptics_props(int index)
 
 static int __init lenovo_yb1_x91_init(struct device *dev)
 {
+	gpiod_add_lookup_table(&lenovo_yb1_x91_rt5677_gpios);
+
 	lenovo_yb1_x91_add_haptics_props(dev, 0, YB1_X91_DRV2604_0_DEVICE);
 	lenovo_yb1_x91_add_haptics_props(dev, 1, YB1_X91_DRV2604_1_DEVICE);
 
@@ -373,6 +385,7 @@ static void lenovo_yb1_x91_exit(void)
 {
 	lenovo_yb1_x91_remove_haptics_props(1);
 	lenovo_yb1_x91_remove_haptics_props(0);
+	gpiod_remove_lookup_table(&lenovo_yb1_x91_rt5677_gpios);
 }
 
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
-- 
2.53.0

