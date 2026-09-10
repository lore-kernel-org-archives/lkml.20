Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D13905F0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010493; cv=none; b=Fxz2LwUfeW0W2mGYrgOqrJsp2K4PNR/7sZE9x6gEYx4V63Y/K+m6OUIY3s2p5mrYCR1HQnbgVjgyhWl5LYwAeCyYS2xYONMsWLkkl3tJz+8Aeth4KrfzO8xscKyXLwNgKHWMDWd/bkl94KjXcNHaDSaqDLwfJf/7kKTV2huqJII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010493; c=relaxed/simple;
	bh=jHHrb1gkKCrQofVQkjlJcoMNCA+FXIvxVOvLoWJQF5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2MDTdrQoKbyKawlhZT/+hnGzNOpg0DAdR03vGQQ9DS9Z75Ni9PhCNl2R9jjDAS0j/AQPBMoMJYfc4JpDvMqyvDKy+vSyApjwyJdPpsYKHI65z7wBMnJVFPxKU2verbjPLsVfxluJM2ocu25mT1DAvcwZca5qRgNfkhFlNbD1mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAlfqRO+; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAlfqRO+"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4bdf4f0e7so686405a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010491; x=1789615291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrGYYRXsocnHt4R7I9PwAhwsbtA+DaKDKrj9nTvfp+g=;
        b=tAlfqRO+dj20/CslGq/8CS4REHc87cHhZWBpneqL8yMS2KHPSlExi9EXp5TlN1rrRS
         PX2OyQ1DtohPQQRFc67f0x0miEKxBTChmN2ULNPoLG+UR6mtijVXO/Va6ldkadtre3u7
         oMRlBYfJU943iYcE4k9P3m+E2EFUhvBm7Y23tLy36EPqHRY9bPlOizI+APFjlzqhqbYn
         s6KDyttuSzqf2WTx38JEeNET3x/CNTWy3FSl/5K+UyQ2+GQpJqGlOuNToXSzPLRYhX71
         jCp95ltzfAc1quD8WprcCOWNBZ06nDx/xd0PnTndPeemFPlMUngikvyLvvCtAGfl37lU
         tMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010491; x=1789615291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrGYYRXsocnHt4R7I9PwAhwsbtA+DaKDKrj9nTvfp+g=;
        b=dHPU/WZv7mcNm85+fuue0q/TqAjIW6uZ6PwOrSGyUPVW/LZDZRBT/wfMn4IdxyisEa
         AZksDA/lsjs9PXVR7As+LHNlCbma22P1jYnDSzUNnXz3Fb3lrWIXMquVdS35ePBx36gx
         Lw8hRNFqH4YpWBMHNaZZ3+Ne5q+gCquBAU7AYq65H4fq2uXn+unQPhMmUo3B7mfB5LQz
         sCqN9/6UTdT8Ac1l7pDq0xCvd97hdcTI5hNKrRj2do2TLLN+R1w4ZAhMWNUNV614VQdS
         769WghC301UIF8OU8FYh8gvk2fda9PxIZHwBubkbJ+t/EV/L/uNj79ROwUMo2OQCyKXV
         NqOA==
X-Forwarded-Encrypted: i=1; AKwUvBxgMpLRRN35bTBCXph7TSe/82mCyaKtx2lMJb+RmiB8UKOqvE51VTA6Rcl8JTtuJDj82sJ2jqccEDcfHN4=@vger.kernel.org
X-Gm-Message-State: AFuF++mux9yuV8VADFegUSd/GcPKGA5T8ux28vdbvBehzkNUJEGFDGHJ
	WsW1lB2gYaDsWJ+6EYaomNjkyLebJ5GOCYTCJ/Ee1D+WbJDEXgIbKRB6
X-Gm-Gg: AYBFou15W32JygVR9thOFpvUSMu9iWqQJnlfLQV3/4sPkzCuvu2wJihu9gINcJajKf2
	n2nu+36cbMK0ioXHVCO9APo6E7UmDg7WomLGmibqO2/NL78K1QQYFIMRAFcDmqQYqdwCd9lET8Y
	Ns8/dC6buX05RZ/Zm6835WRPuIlQKMoPe0h0JevOd37HfqpESSvqhPiAVCJiJPzvwgjDFiej2UZ
	+M/jvBj7f6lit/DjPQV8Ofv811nXZkvel0QX5B36GcEipzcd2grdrJOVXCcTJj+js2HcOFGZ1K+
	TUM9Ss6SFqIjMxDX9LTig08LmHLC1kCqhGm0x2uKLptJ51o4h+VSkpp0db5lsuIBeLK/AjgVFlI
	w3y5mTR9z8QHI7rbsNoPFdXgdDmU0lWX/0DWR04vfVvpIGgM0hye/BwLVPy6PG3tkaCqgXQfAlN
	P0orudno+EmyCyHp/sl2vIUdEgNdjqnXaz5q/Pain4mEw583FUbUrrhF4qSiPgzZlAGyRtwN9um
	21FXUq21neNEtfomXesRmkCGxP5ODusZFK/2Uj3USxOUWs+XaRTVoc=
X-Received: by 2002:a05:6830:3495:b0:801:b3e8:25ab with SMTP id 46e09a7af769-801b3e8a6c8mr4013717a34.2.1789010490678;
        Wed, 09 Sep 2026 20:21:30 -0700 (PDT)
Received: from localhost ([76.187.192.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6da9a49sm19758315a34.13.2026.09.09.20.21.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:21:30 -0700 (PDT)
From: Andrei Aldea <andrei1998@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH 03/15] HID: hid-oxp: retain fractional brightness when reading RGB status
Date: Wed,  9 Sep 2026 22:21:03 -0500
Message-ID: <20260910032115.28669-4-andrei1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910032115.28669-1-andrei1998@gmail.com>
References: <20260910032115.28669-1-andrei1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiply the hardware brightness level by the LED brightness range before
dividing by four. Dividing first reported every intermediate hardware
level as zero instead of 25, 50 or 75 percent.

Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
Assisted-by: LLM
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
---
 drivers/hid/hid-oxp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index 0c895bd..86a559c 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -334,8 +334,8 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
 	drvdata.rgb_en = rgb_rep->enabled == 0 ? OXP_FEAT_DISABLED :
 						 OXP_FEAT_ENABLED;
 	drvdata.rgb_brightness = rgb_rep->brightness;
-	led_mc->led_cdev.brightness = rgb_rep->brightness / 4 *
-				      led_mc->led_cdev.max_brightness;
+	led_mc->led_cdev.brightness = rgb_rep->brightness *
+				      led_mc->led_cdev.max_brightness / 4;
 	/* If monocolor had less than 100% brightness on the previous boot,
 	 * there will be no reliable way to determine the real intensity.
 	 * Since intensity scaling is used with a hardware brightness set at max,
@@ -423,8 +423,8 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
 	drvdata.rgb_en = rgb_rep->enabled == 0 ? OXP_FEAT_DISABLED :
 						 OXP_FEAT_ENABLED;
 	drvdata.rgb_brightness = rgb_rep->brightness;
-	led_mc->led_cdev.brightness = rgb_rep->brightness / 4 *
-				      led_mc->led_cdev.max_brightness;
+	led_mc->led_cdev.brightness = rgb_rep->brightness *
+				      led_mc->led_cdev.max_brightness / 4;
 	/* If monocolor had less than 100% brightness on the previous boot,
 	 * there will be no reliable way to determine the real intensity.
 	 * Since intensity scaling is used with a hardware brightness set at max,
