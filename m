Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899EF3BBA04
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377570; cv=none; b=W1RlXtzBVVzMh9bd/JqDRmYi/waqXJo5uJ9eO8igDelHBI+0O3ZaKkb0JjWmLGK1sIJhijFyk/TL4dfkDKfn0/204Y1ZlG1M3ZlE9Dr5PuVS2r9o0aYD7y0oCKYAlJCymURFJROvQLfRjWXWbt/N4lPHUFCLqIp8xK0YntQ4JiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377570; c=relaxed/simple;
	bh=A2t1kYCaqwOs1VtKcCPI2iJFoH08N6NPdPizyRT98Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TGJqCTvu5t9qgLVtEIO708rGYgJgHfrUEQY3p9J382CIN17BYiV3uxqUU4GX0kbSk3u0XjMfrPOkgazXqLZGvfS77XBhxFp6Ou9POPllQiO5K7PVQRCQAI32Vw0ddSLrkgDktrCEg4mNMiufD+/y2ndsxZ1g4rzE/k6RRYgAuwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1s5JUC0; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1s5JUC0"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9390dd46b45so107981385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377551; x=1788982351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vguoEC+MJZq9zYntrbQ6UkhdOenYXbbtJ/8LtnXQRQU=;
        b=F1s5JUC0e4gLx7QGzNMsFHTRpgCS2bUfHPVAbJ4qKzGJcU/pVaO7ibCX4skdLoJoSW
         HfBDV+14MyvY1JVugKtwueJU19UXgyF01ZI9J3W+1na0dqgXVN+kM9bDxCj1bk6fILx2
         0nw/+AA4nF7ih1fQfJqzzCnsVy53LZxvRNtfmilI30kjKoiFpikNh9ZP32eedzaN154L
         lQrAXIck9khPxexRxxpxDwwKlbGf3PHmpzfukPkU6CLty5rxofHPupf/w5azz8u1pyJu
         Fp0+8cvecmo2tmkSCko8+BqwE3ME9qGoEmBtwo2kLvFi+kSVP5XCXiM5xsUxMy5GWP/f
         npBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377551; x=1788982351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vguoEC+MJZq9zYntrbQ6UkhdOenYXbbtJ/8LtnXQRQU=;
        b=kayIlsFYwOdcXPLfZTQwWPEfbxKdjBRn/a5kt0Nu4T0ttlGOKnMKlXY8GajIKHuteo
         /C0Ac4+TrIxqRRGkUxONunnx2EDP6Y0x8wZuSNJTan9R3nP9vua0d+M5EMV98dCBMcmI
         ufM0ZaheSix542b0Mpp35QPRDtbgw+ebUAKqNyZLfbLnzQGsE+++EtxqbypnGR/y+2aA
         bDi42bFcGNNNVWZ8pw3qabwmlhB6TL/5o8rThMWmOwYMJ06s05DNNSAT1Xt4AScOsYom
         +QCejq6dP/pym5jgMZPTOrv/UToXRFhfkPRMkA64IL37Au6XmjRJCRGssZBJ1vsiI88H
         vgpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZy3/TkQUQLh6KDVT3j/P109C5fBgdw3cicNdMdEnktVD4UWVS6xZpgEZSLnLyYDUwVc49z6Cvu5+BI1U=@vger.kernel.org
X-Gm-Message-State: AFuF++nmiOOlBycbuGNN/plM+VAnTnzsdnXcJ38IilxpysyDp5+w29bH
	+KMlm6sTlOdehu8pVfODjbBs/l5vIZy4h47itTdJqIbP7ozny+YWxow=
X-Gm-Gg: AYBFou2oF2+IJFk84HLLW/wNbJ0cuzeZt2cWtcECUeNBoTLxmRCQ1ibWMEO2TFIfCKd
	Ntz1bq+7bHvfVzPxenAo/LD37RHfTIaZtvDHrBe+1ZYAFkm0rcc2hYo7UWU9vV9tgRcs6Dh7VTE
	kko9nVEBTNca1W6wAp4H3+pnk7n+4Gh61ZE7YVX/KMlCNph7xSR7lfT8juoEUKw1s/O2/FicZyD
	tQec9Avw23a6p/bd9Kd0woOdUeGfyaiqVoicY9kKhN0X4Pei/Os4fMFLIZM267Q4gekchazc45g
	GiVWdjTMzCHfpnoZY7Jl6SHnQif/GhOLx1+y+u6lLtP1PdboHOepdznJ5JlcHsKj9FA20cDHIG+
	SCyl8vUlwER81ens6/npmtugTtJy/uY6oemMYDfnAxA0HIytKaGYQpWaYPPGQmHFbXNZpVaKThg
	L4/QzUnTSo5ytVxwegn6VcSWH8ksK5Zw4hcdf4Qyk9JOP+jIb/gmO3JILQXlXW0u3APfV+XjF3R
	u7lYBgjVM5DZpif+9VSC22mO59pnxTxmBCbYpqxaRRjgRAOsQDRp3anLeWKq8NqB16XRcScLC7H
	2dEHaZVc5ld+44fVU8gnt7W+1wjL
X-Received: by 2002:a05:620a:3c97:b0:939:6dfa:db9d with SMTP id af79cd13be357-9396dfadf02mr130537285a.50.1788377551081;
        Wed, 02 Sep 2026 12:32:31 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f17eefdsm284698085a.11.2026.09.02.12.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:32:30 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: jlee@suse.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH] platform/x86: acer-wmi: Remove unused platform_profile_support variable
Date: Wed,  2 Sep 2026 15:30:39 -0400
Message-ID: <20260902193039.21725-1-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform_profile_support variable is assigned during platform
profile setup but is never read anywhere in the driver. Remove it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Justin Vargas <justinyvar@gmail.com>
---
Found while reading through the driver. Compile tested only, as this
is a pure dead-code removal.

hp-wmi.c and asus-wmi.c appear to carry the same unused variable -
declared and assigned once, never read. All three were converted to
devm_platform_profile_register() in the same series, which may be where
the last reader went, though my clone is too shallow to confirm that.
Happy to send patches for the other two as well if that is useful; I
left them out here to keep this patch focused on the driver I use.

If the intent was for this variable to be checked somewhere rather than
removed, let me know and I will send that instead.

Disclosure: this patch was produced with the assistance of an AI model
(see the Assisted-by trailer). I have reviewed it and take
responsibility for it as signed off above.

 drivers/platform/x86/acer-wmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 61ae622c93d..528a89c3eed 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -839,7 +839,6 @@ static const struct dmi_system_id non_acer_quirks[] __initconst = {
 };
 
 static struct device *platform_profile_device;
-static bool platform_profile_support;
 
 /*
  * The profile used before turbo mode. This variable is needed for
@@ -2199,8 +2198,6 @@ static int acer_platform_profile_setup(struct platform_device *device)
 			&device->dev, "acer-wmi", NULL, &acer_predator_v4_platform_profile_ops);
 		if (IS_ERR(platform_profile_device))
 			return PTR_ERR(platform_profile_device);
-
-		platform_profile_support = true;
 	}
 	return 0;
 }
-- 
2.47.3

