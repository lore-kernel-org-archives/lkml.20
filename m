Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19804BCAD6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854606; cv=none; b=oZ0WI2OiZibISOKY5YIoGgjzhAPZoBOvLDCS+tmdvG4V3+b6NAKIME/7QqLfWhwp8akOlCJ9ONr7m02GY4ZfudDuzcyDkK79h0cQRDd7yCPtPyQ5BKimxqxMrLkri0KPJtSBYE8ofSsK/3eHvJo8uM/7GEPI/YctJNMQUGgMpEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854606; c=relaxed/simple;
	bh=NzuVq/w7C8F8yq8Sk9Lb0kpmuAUTsBd2XPTp9Yy9qLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOwUIr6RPB7NRP+9Yzd/paRFyEtNw+ySGn5CsigOeuzIxesqJqLL278g0nb1It7c1LZSTIK9vv1BQn8CqpcVB9ZfX0ZYTxVjVRBBXnzfrJEXt2neZVCDaKZhQ+49tNwu/pl020mOs1f5TLk2pFGMMkO5eIn0dbeSryz/JOzco9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlFQjG0I; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlFQjG0I"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47db714766aso985288f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854600; x=1788459400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxaRY2y7dV8T3x7pQ4bDaHXO+vK0Rukz1PaECXgpyiI=;
        b=GlFQjG0IjQTIwK93gnMGdQqdstULK8Whoa0BCiwqvDFNIB5g8XioKdUp3xpiNhruv1
         ucQbkRAak+5IIdkQLLR2FerQzITIHlxAggGgqstMSxCV8wEzstREbvmlOWGTpZv1ek3o
         kF++0KAKx6OUseBntLRctLJY0uyvRpFzFIjz5b5sEGAGElp3rVfbvht67OJ1SOAqA6G8
         iDU4L5mx0Ttgg6PMoB44FlmmPqLl+B20nHLUrwoCngQvy0WU8vLqxYoj8c1KBYpzzann
         ckum+9qgTuHIQUtm5BGrciT+T2lCPFNi5feski/dQdalChHZ9oNdrA5zstmX3KguQCwN
         pkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854600; x=1788459400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxaRY2y7dV8T3x7pQ4bDaHXO+vK0Rukz1PaECXgpyiI=;
        b=kZWhDfBuHw/uBTv7ha2IUAU1MpMeWreO1Fad3iVyhKl0+SUXJxUQu1kqzW1Gyvph6r
         58pziyYcukCIt52BgejJoCuRpX2FNkmCBgx4yBt7J09j1WWCwLXfAGRR0/U9MUeQLR+2
         4ILUnxrxquWZhbinCtLtqDCZ3aZ/pkD2YMBgHOkNB/xSF7mn580V7yOPn7lHKOI++U5Z
         g3t2eh4Fikq4ceJWozg0ij4LwJ/fxLcd6ae2eHSrFEPznjccWG8jx/V7tpxLkOh1YTk/
         N7e0nM8Rugco9m0x0LEtjCGXLRfOOQB7dqCtjassF/4TJpFF9jLuxYgSXmMd2mGEBgNs
         qR4A==
X-Gm-Message-State: AFuF++mpQr9mu64jj1Fq9MsxMXi53VsaTZK96o+7aeOpB/DCpxaCkmhx
	lJ2rrcjFZqyGjQq4TXSIrtvdUUFzTMIG9v2/0IBRVGSlcrMBH1JpOrCgNJgw3cFo
X-Gm-Gg: AR+sD12HllnTEp+2D/d7JwrrkXeLqHV0IDC8Tj+D7sEXAhwY96bcBmhRVBRVhZaRwYa
	dzV/ksxgsc64kmZhvDzZ9mxuIv2onvKNCRHN5+iUOYAkWUpgVG1GWWV5jiDAKu1zc3F6z4dHtUn
	0o8FPqD3CCk/Qgm3gsi/OpRqMt6jU1o4kqHHL8FGIxQc9ahYMVQ9KDgBImWVbDUT58ixltO1Hai
	FG4iMjsqABmuqwMv70YXsAMFzMRqBmb53lRS+qBulXW2Xz5nefggvQ0TCMqk+ulevvRRp1MWF3u
	DcTgIV0jbG8bqrI69/Mg4JR1MzmwKAIOrqQUyfyLV7mU7k/MKRYP23lxXQA/ZQOkebHe9MujnZ/
	toBdncYe0RyhTahvf1nuAjkcKrfPYwEMjIy43bc1PL2XdoHiraNaa58xVe0cjAnhd1xR24LHMQ2
	i1RDd6Cn7sWL/TN8nAedGY71J0I8z/OhgX2O+/J9J3tmXOAed3yWG/731p2Kt8NoakjD89o/dfC
	gY++nErjsGcVDBNOJDnk99voed6C/8nIXIHIFKtQRNH
X-Received: by 2002:a05:600c:498a:b0:499:b81d:f580 with SMTP id 5b1f17b1804b1-49b0dea670dmr77990135e9.2.1787854600144;
        Thu, 27 Aug 2026 11:16:40 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbf33sm11328702f8f.23.2026.08.27.11.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:16:38 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 4/4] platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs
Date: Thu, 27 Aug 2026 20:16:27 +0200
Message-ID: <20260827181627.2427880-5-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
 <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
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

