Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637777;
	b=tgVnYVk9mayE1cDvW94x7DcBEfdx5Ftu/q5128mvrPqylDxen+Y9k9VEDW/tBAec2p2A
	 Sh61Wj8CcajmsMdqcag+CRI+Ex5jasiYsZeZ61+ypWdyKs58QlMHWN5OeWsmyLVnYdrpk
	 Ueh5tzyqtW/IRZiFradVckMlv7SMs3opPacKXQYg3KF44O5EFW+3t57+9IsjzLDtyGkhf
	 zJgL3JhRPIWg90+0bn6doQsn8jsxNfUVNxtwpnWnHST0pI7zDJMmuuFkqkso63XXznorv
	 MoEGg+IgWF62tPevmn9EpNarzimGFoLUkH4gJTZ+NeblCqbeYxCrXM1MnpMbJ5oKPRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TAAl5CNNTXUKmSgFHLqbBt/nHXYu22WHSPe7j/27ncs=;
	b=3NiANP1jZfH2FgzfVs6rK8FpEe8zmk529okdUZy6j+nMTS8Xe91dE24/3aSymFmmPq9/
	 T1GuEodDRbXqzz321lAYb8AjbKAh9/vfh12z2DEFykNd6F7nOxwmXrySLnDM54aA9YXrl
	 sbZz1LFjkDncbBThnvwVOgY6QinhBt9A8eKFI3cIlWcHx9HtN5EluXdNxKYcQFqt5uwJN
	 2r5Xu36MLNa4P8JLTNlmMjG1/8obAfvFpqXHwPFm3d3cFRBT39hw4Xz2bqjJ5xQIM+zuK
	 pz11xL8CIlLqqzD9JpzW51ssaM9HeRV2bvXHkh+sryQc/YuP8Mzfsp+wXfrWO+R3EBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uq/3bbw/";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8132606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8132606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uq/3bbw/
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso9790705ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637776; x=1795242576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAAl5CNNTXUKmSgFHLqbBt/nHXYu22WHSPe7j/27ncs=;
        b=Uq/3bbw/qzoz6hbxTMnleDcxSW0G5sSSD8mUXr50KS93ihDh0ecdKjjenQeSYt79x6
         v+jfmE2mVqN5xgUX+B70L5+rdzRv91WnRnJ4lODc/fxWi7vBsFaFbDPuMQF4+5c1IzJo
         /IX6nXCaARq2Sgf0Z9n4Eks2XDwpLocqYQaC1hm5e6AcqeRXzBtt3GPJ6VVaYl72SjdM
         92VBag9LvPdU4xF9yza6EOAAc6upi/UTFAHqatHjfeVCrZZqSMfw8xwpGj9rtNL6CpsL
         5xRfIvT5c0jfhfDovVdD9+4XDU2o1Eyr7qmx69T4i7ZMuas5Qy6t9arlGSNBFBJBmkWh
         +dDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637776; x=1795242576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAAl5CNNTXUKmSgFHLqbBt/nHXYu22WHSPe7j/27ncs=;
        b=IXbJAl1cZeznueNHt8e4gELqpRmAE8GK/QXu1Xblu0yXrVVSKYgCqrHwV0/w3BiwSS
         NGbPjYDiGgZrOgJouFX7kpWkw0hXrCcZwaov392YYNJfz8UpguLpGPo14WNAEEzTiGyb
         EX6i2g5tsbl+NX51d42Xk6BJF4VmPz9cHW+sLPYKgC08w6Wzxo/4H6Xs9YMQj17odbf4
         7VgL4ctkBl3Bdguv7daVTP3cxQL9axqQlKP5SQm4dabfZphZ1vyw9r2TGs/4nFG/5BHT
         /WqUi/hMoXoHHZI2zOYGxfOPOU7Jgzx90iEgLQj6p94YtutNhjJATQgzn5v3iOaktR1J
         sWSA==
X-Forwarded-Encrypted: i=1; AL+hErEbrEujAdRX7+rSEhOuAPCQqNAMjwFF1edYTAC0qhx7z1EtyNBhEkftes1dG4W3zRppwDMHVY8mu+XXwwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v33JqbYDrqdZT/23quanRZEW3muPLn2amufCnSgC3//4DXzSO
	KgQ/jJlZpyvApFVB76gS7Npq1W/LVBRFpZ8TpY1bbK5L0VNGpaTKvcd1yk5dLGZp
X-Gm-Gg: AYBFou36PHDgvWfoydKF1SlbYblW+U6E4aQXWPveOTWJ00FcS3k5VgbOx4ac5PqGAjE
	Z20L3U1B5Pr/RoTvCm51J5DfIRD8tk/dKuPFwOWxXJF6zHt26CJ9WYxP08FUm/DhzuODHhE9Ogf
	48zepmFnQxHRMx0kdj5BPlqWRlmSrlBJkIuk3t6cOrOkbJfllhuYfB02GXPtmCfRXdgUevwZwoQ
	920HOu4n/Y0PTSc/P5YXklRLJLfAG41yyl4kAzgfejUKiQRZ4bkFPSaWtwJAWUwDRe/QzFvXt31
	2naMlQ3LX23GghjOlWLbA4XrZ/CZNVSVpmWD+DsQW2O3D8TdEQkSmtEE3ApV1ZWcNHKGbQO8GPu
	SyEkW2ftQEzKTAuXkZ1+jHWbC+BQeaXrid6+0Y4vE089Q+uR6n9723dpotGXJ9KzA6JK1GxNE+E
	1/FLtpBmt4uM65FYwoB0ZNopiH34Qy1waPp7piuRTRMWOCVPhuQXWcT5rJh7CuD+kvD09piA2rv
	/5DE43ozueab5U9FL/EAwv424R4lvvgsSQYXwK8j7wN7I1zz/emgV+mWhcIxsF51+kRCGuQdUvt
	3db+maid6oiFssBYaeEGTWmhs0u3MCpgRo1NyG/H9Ve1EzKtg+M2BtBUqWq5rIVMyLmiqRkyal8
	dWwipZuf6ljo27dUf4Jvm9LsjvTsYywJs5D8d3Gb2yc32talaXDCdCzYDYHgD+RbbeSkmhEEwsl
	ORPA==
X-Received: by 2002:a17:903:228e:b0:2e8:18ca:5f46 with SMTP id d9443c01a7336-2ee0da7bf97mr45567495ad.14.1794637776350;
        Fri, 13 Nov 2026 22:29:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f224370sm18382465ad.0.2026.11.13.22.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:29:35 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: dell-laptop: Reject keyboard backlight timeouts that overflow
Date: Fri, 13 Nov 2026 22:29:25 -0800
Message-ID: <1e1cc5a497ca95a0b34e45738f81a4be681675fd.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
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

kbd_led_timeout_store() converts a timeout that is too large for its
unit to seconds with plain int multiplication. A large enough value
wraps, and if the wrapped number happens to be a valid timeout it is
accepted. On a Precision M4800, writing "4424214d" (over 12000 years)
to stop_timeout sets the timeout to 4 minutes, and "18989323d" sets it
to 2 minutes.

Convert with check_mul_overflow() and return -EINVAL on overflow.

Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 89e85c7f7132..bee347e1d60c 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -25,6 +25,7 @@
 #include <linux/sysfs.h>
 #include <linux/acpi.h>
 #include <linux/mm.h>
+#include <linux/overflow.h>
 #include <linux/i8042.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
@@ -1554,6 +1555,7 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 	struct kbd_state state;
 	bool convert;
 	int value;
+	int mult;
 	int ret;
 	char ch;
 	u8 unit;
@@ -1602,16 +1604,23 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
 		/* Convert value from current units to seconds */
 		switch (unit) {
 		case KBD_TIMEOUT_DAYS:
-			value *= 24;
-			fallthrough;
+			mult = 24 * 60 * 60;
+			break;
 		case KBD_TIMEOUT_HOURS:
-			value *= 60;
-			fallthrough;
+			mult = 60 * 60;
+			break;
 		case KBD_TIMEOUT_MINUTES:
-			value *= 60;
-			unit = KBD_TIMEOUT_SECONDS;
+			mult = 60;
+			break;
+		default:
+			mult = 1;
+			break;
 		}
 
+		if (check_mul_overflow(value, mult, &value))
+			return -EINVAL;
+		unit = KBD_TIMEOUT_SECONDS;
+
 		if (quirks && quirks->needs_kbd_timeouts) {
 			for (i = 0; quirks->kbd_timeouts[i] != -1; i++) {
 				if (value <= quirks->kbd_timeouts[i]) {
-- 
2.56.0

