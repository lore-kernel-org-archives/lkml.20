Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBF926AA91
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790473239; cv=none; b=L+J0nrc0Rf62yMFSOF6NKtRKDs6QB6Hc0i50Q7dnbImUzJS9f4KVx2mk//gZXz5jK3tczJWv49H6FFyIZPxgdnPoAvLPWSywT9qAYvyaPj7JOaVGX+jSKXdA1dXhgqN0M4CceoPVTJlz+w/9N+Y19oZA7A3dQR0l4rAMlb4XmF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790473239; c=relaxed/simple;
	bh=np1+UTDQL2ZRl08AEqQ1unEzN5csDoYIz3INoUK+B2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZmTGFmpeafjTXqsWbCbFqTjeaIe4mP3+JDzjQyaKVVm4h76mL8IFuUcVCDmtDR4DdUYqYA3X+xTOYb5/mDtIAideRKOG9tIs3mAr+CxSX25ICYDURppK99EyoW/qz4P6sAowc1ot66Kt+tJhGHUG7/9dmafFaroRhUdKS56XnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwOSN0gi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwOSN0gi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso3942995e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790473236; x=1791078036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDYuY7ezdVWq8b8O/Y4mNf/nduIcrzSrBVm3+9ayIgA=;
        b=JwOSN0gixqlGCa0Tk9vcfdx/3W48CtzjcNriL+lCWshMOf3HJ7Mn/Y2ruRxS4/vkM/
         h3oXJNgnazmVk5e7wMvz5Gn9ZHUbIvVxJ7lasIRW12iNR6GJncQDvtN7JKjrb8ojDwAe
         cAo2L9U9bH4Mgz0y/u5olrPnsDiH06vUN9Nf6hNzBeX6BD5nXlVpp9Ruapw07+Qsw4Hi
         sEYgldL24rFcGrTFvdhJkW6aJTdQ90ZE6K/AV80LBIigMr4eB2BY0MJqcY0syrUshgfV
         HZfpJIeQK/602wRjJ9kGfg+USQXclGbn4cyOKkIVO0OuX+X5pQuo+C40J8ssEZpLC+cg
         oi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790473236; x=1791078036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDYuY7ezdVWq8b8O/Y4mNf/nduIcrzSrBVm3+9ayIgA=;
        b=JHG1ZKMeSu51qNbYCP4jjLst2H8cd45cpn/g77FzHfuRIXcgCeYI+yYiZHZD/MTVOj
         kjhhyv5hy69gCDlrX71TkfoXA86JbQgY2LoPwGVI/qNyNd0+uQyUBSxBIZ8q3bSqXkMP
         Jg51KMT1LwhlnEKJkvO/xQNaabyOviARMFMKsYhDslSMtvjAwCSS9/Ik8+nYr1PZFOs9
         mH2SThQU574tRuttZpHtx0NbqgX+/Z7tcQJJK2DTqBFL8XC9jhOqmwXdAoUI5Igy686C
         C5yWjxnWKisjY3Y8Qt7Z6c+0ZWRiE8Py1Cuymrt+6WEVnrhuShc4Ptt2GvCi1gcz9GTi
         kzFw==
X-Forwarded-Encrypted: i=1; AKwUvBxXtn9Dx4D1wgwe4HP41rZynl74AFZAssn3XGmtVVBl/DpxhcdP4Wb/OVzUI24IaqgxhreqSMM+mSlFkV0=@vger.kernel.org
X-Gm-Message-State: AFuF++kc6+TRgE12SCqBnPbv6kAonvcy90pzZfWqUuWs0Z4EF9xDbfk0
	eIls/Z1GVwLr2ybyLpo3U8qRDVsokjHFBr2TG5fFfYsGYn7g2WUFFn+6
X-Gm-Gg: AYBFou367vIDB3zAMgywA9+rHt63Ne2AnqtglUYKQiArHCDldKQxmZlzKJCewstE418
	Kef+UzGFbKLKkqh6Lz2MufKylWZkdtQL8RB1CCe93BvwsGedoeleXwNb93kuiZhiBB22lMeEcH+
	Hh0znfcw6hb7YeWj8ywPeqU6bfapJ9wnm6TajbCaQyH9nwkNI/zyK1ELCGkvd7jEQArP+OznMly
	hxDnwRUaLt7jtPLlDcs0PhnOyFFplv1JqxuRW+stkaxX3zoHg20hAQYYa2mjbzRxY69uWCZPPVj
	9uWzpIyRaABv/BIXPx+fDbpD/ujZe3gJrxCtQUWeV4CWYdNrnR/xibpQOOJ06LBvS55jxpMa8g6
	4gBSYiM1t3CZShBxHqOajbx311dpGCj3nc1dzv1TsyQX/53xvWT6ZwZi1ocN/5XFXCCi6xCT4IO
	R1xeB/aIn4oOxbmePojhIY6cgocLEXU2tjfjfsw/IGGB+om+KHHcEAT+l06iukh4+EJ8R3C3NLS
	hLnDSty6Q==
X-Received: by 2002:a05:600c:4689:b0:49f:fe48:d171 with SMTP id 5b1f17b1804b1-49ffe48d27amr38924965e9.35.1790473236417;
        Sat, 26 Sep 2026 18:40:36 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee9203f0sm114736595e9.1.2026.09.26.18.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:40:36 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v2 2/2] platform/x86: uniwill-laptop: Map the screen rotation key
Date: Sun, 27 Sep 2026 02:40:31 +0100
Message-ID: <20260927014031.3465252-3-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927014031.3465252-1-amad3v@gmail.com>
References: <20260927014031.3465252-1-amad3v@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCSpecialist Recoil 16 AMD / TUXEDO Stellaris 16 Gen7 chassis has an
"Sc" key next to F12, meant to rotate the lay-flat screen by 180 degrees.
It reports WMI event 0xD0, which is currently reported as KEY_UNKNOWN.
Map it to KEY_ROTATE_DISPLAY.

Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
Changes in v2:
- Added Reviewed-by. tuxedo-drivers (4.24.0) has no entry for event 0xD0
  in its Uniwill keymap; there it only reaches the "Unknown code" debug
  message.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
 drivers/platform/x86/uniwill/uniwill-wmi.h  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7d39e97fa..2f440925d 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -506,6 +506,9 @@ static const struct key_entry uniwill_keymap[] = {
 	/* Reported when the user wants to toggle the webcam */
 	{ KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN }},
 
+	/* Reported when the user wants to rotate the (lay-flat) screen by 180 degrees */
+	{ KE_KEY,       UNIWILL_OSD_ROTATE_SCREEN,              { KEY_ROTATE_DISPLAY }},
+
 	{ KE_END }
 };
 
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform/x86/uniwill/uniwill-wmi.h
index b25b2f312..1b6f650c4 100644
--- a/drivers/platform/x86/uniwill/uniwill-wmi.h
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -117,6 +117,9 @@
 
 #define UNIWILL_OSD_WEBCAM_TOGGLE		0xCF
 
+/* "Sc" key next to F12 on the PCSpecialist Recoil 16 / Stellaris 16 Gen7 */
+#define UNIWILL_OSD_ROTATE_SCREEN		0xD0
+
 #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
 
 struct device;
-- 
2.55.0

