Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350BB495ADB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467796; cv=none; b=LC4i5lQJphLD/6ilOs8NUmxuhIIwFGhwvkzwPKXxmp+29YeJ0FpImOsZwzL+gUBqLHSu5QiOdfKmaaYStID1/cL+OP/FaKP/z7gM6F/yKH+OOEgLWqEm3Aljp2sgf3kREk7eM6cgUIm8cFiCWzHhwbS9loWsmh4MzR/uJ+0EOrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467796; c=relaxed/simple;
	bh=LAtogNg3GGTrfds1O+SyiSrcHa26CQG9HkfS/nZnFzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9V9GxFUknXqXR02DSry8Of9gE3yGy8v3u2M82MttivloadV/5h23n1qvbFTUSdgVPuaY1+jpK3zUwf+NLcWeq7+RC89R64bFK74axtihZqLPbeixPXXsoT0G7XKYI+nwPdOcqAopQSsbe5iElpc+o9ASjU/+4xIGfXgCKVCMvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huXeIoRb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huXeIoRb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so26134405e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791467793; x=1792072593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6WX9i8mKVLwKoFhKGD1gOnudX0Yq9IQNCIvcNZ0AP8=;
        b=huXeIoRb5nKQyHR81HunYdy/poQ5jaXb/GFPDgqG477JsOKDugBWVZLQNcYjZMtlb8
         QmwQ7HdX/IYpmjta9Mh9sKa9k9h8WvFbjLgTJk6QLdOVty/8dNZ1fkAEReku7jRAXiok
         zA+YrbMbybD1SZ608C12E9qoykVyezVUROSN9aeV7oExjUrHiD4Ss5TnWkUUG4Mo0UKC
         QZQ66rB2q1lg2QyJLqPLi8ZZvNP5BJA9pQX3B03SHerDOq01PmPW/j2IVA6hFWtSER9e
         SIVdH+ZICVgv4jyTcF4w6TFwT0jHbe8/5LMQyINamCUmg9Ir3lhldF2A7AlLyWwJi87R
         MXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467793; x=1792072593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6WX9i8mKVLwKoFhKGD1gOnudX0Yq9IQNCIvcNZ0AP8=;
        b=DzowukqVED7kdUFfdOeCgTIwz1sjskI8IkTATFjBx1wfSFgZYbCBPU9qRocm8IGqKR
         IHnz1G4r5N9PixQJx05yiZL9iLLO7QGiT+SGZcOPIj4y+KBEd5QyX6CVU5Mu0GAcJT7j
         mZGqFUhps3StO4KbQercDEkYSD4oYVxjB1wrZketX1TWqcisQCdK3xijkCTH/DjvotM3
         pE10AOVevWr+s9zMAA9CrjWZQaJ/cSnKmZZvw+g0ck1DQXEKb2A0GSlfDkEB7XAbixhC
         cYWZ0OFqIXo/+U16c755uRiNmUyV1aHrwlm5BfwjmOBsAOTgcMY4mlGV1humwNrNb4C0
         4AQw==
X-Forwarded-Encrypted: i=1; AKwUvBzpEEyasDb7xqoNdgD/hgG8nH6HsQtsNumoVlp0mSobhNA5n345jR3wxANYh2A1sxCD21Ximb1B6L7hv6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ld4BGmLq39cSuMFBX7QkppeqBereiWr1bPAwPKRLmKjrH3TBDU
	7p4cM9pWzNiToTR/KotScfkbRjXh31Y2vCrQjTFedyMvTQmZ5ZatLE8h
X-Gm-Gg: AYBFou3S4sPnvP0PgKvDXoDOxB3MNwxDohRqvADaWITA677g6DwRtsGg/h30vSrEhlH
	c86XOsQ2CWDrOL9QlpKFQRkL4es5fS+SsiNkbLEVCdDetmwk8A5YAKNf94mVrsqboVKQElBMKWW
	RvCGSIp1a/o7sK71OUO7vWFvr7htklFN/1fV+gxCLpDRbQSm6jnkHIsUtzSkUYZavQfJgjdOt/+
	UtJRFaAEelRKAkFQxagESPMe6+8BLTxKP2eUZaw9YgSM3HCz9yTz2LeRWbQKS5DuGdURBsV9gjd
	Ww8+J+Z7HIHJuIBSpYiYErQb/4ZzpIpQKxLqq4B8HnDrtFI28Sv2cHN6lfQKhgwEUX3bpGa9u91
	aM8HLRcps4Wru7z7Czea6YOhMvrkOlHtRSFZLQgc9cH++4Z7kXSxCOzulyYtfrwBJdx8pv/IUps
	q77u/VFMAPDxFvunP3I1LTdhS71wpy3U3t+rOON7p+oTBId1ee0KQsgzhWTxBlPdVq+nAIBHZ0b
	3sRMYmcv1U=
X-Received: by 2002:a05:600c:3b86:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a18043c2a2mr124984465e9.24.1791467793365;
        Thu, 08 Oct 2026 06:56:33 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a184260f9asm76512765e9.0.2026.10.08.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:56:33 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	Christoffer Sandberg <cs@tuxedo.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH v3 2/2] platform/x86: uniwill-laptop: Map the screen rotation key
Date: Thu,  8 Oct 2026 14:56:24 +0100
Message-ID: <20261008135624.3520849-3-amad3v@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008135624.3520849-1-amad3v@gmail.com>
References: <20261008135624.3520849-1-amad3v@gmail.com>
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
Changes in v3:
- None. TUXEDO know of no device using event 0xD0:
  https://lore.kernel.org/r/66a47248ecfa1704186274f2c245d3f5@tuxedo.de

Changes in v2:
- Added Reviewed-by.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
 drivers/platform/x86/uniwill/uniwill-wmi.h  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index dc9b73afd..6b0dd0e4f 100644
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
2.56.0

