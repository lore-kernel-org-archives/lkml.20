Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC5F4FECF0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371005; cv=none; b=VOGfT8U7y8A40vZXT5IqHG3W6h/cmLuA7EbyW+omiv9Ed7qtT7CQIcaDw0D65pvEAtb9CfxpkmLa3oXGxvwx5pal2OsCxiC0B10MFRKRjd+7taR7oODu5c7twIqJFQ56WsNjGqxJLoep4UQwkMWJ+F8ncijWNPE4pEYmJZaLSKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371005; c=relaxed/simple;
	bh=VcJEB/8zZf8xb25bTZV+ZLD4X01lT7TB13axe+Sd/J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOqGq8leZzxgNojNB3rZQYhL+D+El6ALjmO8P7w650JpEiBv5VDUK2YaBILqB89vtpNyWxh3Cv/D6ldtgxFPUaw1sRSsjMet3Mj8WQXm7awvfDrqLGWzcLa7BhbZAvmZqxnxpp9GlzBmhmjPMU4HCr5fsClECTUIep5QXDjKYu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnAkwPG2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnAkwPG2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4887d3c59ecso585240f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371001; x=1790975801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+p5rx6TkxGynRT5wM8/9aAou6XuDMc/agUIyGKPsW5A=;
        b=dnAkwPG209KNo5DC7sn8Y/qAKEi7gubM7VATqtxBgsts4jU1cxjx2jvOhKdDPX20nN
         3BXEIbAz++n7AUjjAX+cPjfzTxT7pwBQOT4ZcgZdCBBbvAlahvB8WeXR0llp/+e/tv6X
         2OubAu70KLrBC9UorXqJfdZvKjGZfI2D0lMte9CsTHzG1seWZv0C357CURPWKeAqqNPR
         /pDgmfKb5CAa9rMsFJA5t/4hC5zKme3YXFLFjlJW5fQh9b3PtNzqBJWPgXLeLV1/ChWe
         DdjidG17pfA4QLkkLw8ZFmnydPGLQ5bx9ek9g4Xx92QEE5i5+a2ioW9hIjKGwmKwMESw
         qmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371001; x=1790975801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+p5rx6TkxGynRT5wM8/9aAou6XuDMc/agUIyGKPsW5A=;
        b=v6tvRhP4In15BuKHmOYCT5Ox/tAJ6g6gf+F2OBaxr31ZvVGD6kZNWcHCkyTmKUuqE9
         KoAzpjq+Sd88EK7j/gf7Wyo4nP4lRlW9Zx+tR9V3ckqkIT0ezavUu5AipRp8hFXeJ5ap
         hmu6A6PIxh1nWx2KGzV3RMSUHCkvRUoAWni1yWH6WBsREbt6Qz21qqZj9NSpQdYGute4
         jtZ4bLGWjxw1iHuyUgQB9JtwqXovOkBGeKVy7q4C65Gq9I8zZjRTCE29JlsbdcYPdB/6
         K3N+rJqZSqkKfGGFH2ZexEbsqoWlZfoVgljY7jDVhIsMZNPPwqlGp9WXdypJV/IgS0H8
         3O7w==
X-Forwarded-Encrypted: i=1; AKwUvBxMndX2frCSTTK0ilNO6o44dCL1CKuCSjhnh7uDmGCdeMhOrHyTjrkT5E5CjefsuyGHi8pWu93WyN1L8z4=@vger.kernel.org
X-Gm-Message-State: AFuF++lN5MC4Oh0n+UqpQgiSsbquhaZ9StFE76RIxpp1SveitNMGW23Q
	Es2JjkHfWGwbRphzpoQGkPKyRvckE5rBUkEimy+TbV8jx5fcZ33QyoOriO993g==
X-Gm-Gg: AYBFou3gwRYn+QEeHii7UvZRbY2PGPUY8wJBRhXD5n8XcCM5ALCkLlDqQ0O92dYEtyL
	KTeffn9vplNA4kfpIhZ6SmK2A7AfL0YcgV9lYwFSY0gvRehjiCS/HWTdYSEoUuxC8yuQpIxHcpV
	R2Wb05alFPgNgm0cg4nbIaXGSdb6RbZ6/svefQpvJEXAYu+ivoxYNFrS61vbPnxZPuNOY9a+5Nl
	y2StSoF11FZYf5VMYpt6P+VqBiCpUhEf5ke4v+YdcuzfD4dY8C3n1NMYNhpgJQaXdPHNqM+I9HL
	1TQOGnK7euIhe+P1wwzxmDsS29uvxwwYJIndmOXmq2jz9kP7VaZsIRmjqcnQqkjq1uML/clnd6o
	+6265OdD/x0qCqQSSt1z0A7lKvUx81RVxxGfIZJjagz6Oc7ghCW6aYLETwXywL+su/sRb8doNXq
	RXrFTeCJAHmxt3YtyQzl9x8oaffOoCDjuq7/I0LPtSDkFYr9Q64yxiVRq7iddCgXT7X7t1ylWGH
	e+1gMZ5Yg==
X-Received: by 2002:a05:6000:25fb:b0:487:25:71c7 with SMTP id ffacd0b85a97d-488716b96cemr14060679f8f.12.1790371000904;
        Fri, 25 Sep 2026 14:16:40 -0700 (PDT)
Received: from localhost.localdomain ([2a0a:ef40:1479:f801:b8e7:18fe:7039:e475])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm9271781f8f.13.2026.09.25.14.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:16:40 -0700 (PDT)
From: Mohamed Jouini <amad3v@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Jouini <amad3v@gmail.com>
Subject: [PATCH 3/3] platform/x86: uniwill-laptop: Map the screen rotation key
Date: Fri, 25 Sep 2026 22:16:35 +0100
Message-ID: <20260925211635.1422516-4-amad3v@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925211635.1422516-1-amad3v@gmail.com>
References: <20260925211635.1422516-1-amad3v@gmail.com>
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
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
 drivers/platform/x86/uniwill/uniwill-wmi.h  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 0932e5937..f99c5e9ac 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -519,6 +519,9 @@ static const struct key_entry uniwill_keymap[] = {
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

