Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408793B9D9D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380874; cv=none; b=Y+scdQZGyQOvMrf1D4ftrJq5zRs25iGyl/lUFBxch8tVXjXQY2oX77hlZiF9zuFZVpiZjioQ3slHTJauDmvs98lAEFKPSMrk7UyDJSF3XQehp5N5TfOsHt/7e7LmnUYrpkcHsgbMdCx0l6RmvmCGjSQPWm9zR3lJ+LxjyhH7lFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380874; c=relaxed/simple;
	bh=GVp9MnNIeDQWHQeEz4+okceVTzDY01eRXacHn8gKIpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V7RKbo/s9/csRt05d1lyndeFRFCUFE7HGr6XwcxABDR1PmZ/nR0SX6na+qrnN1aZKTbQc9eTzWdaTCFoNsJy8mxBOZlgm5v102WtQkLJ4A9rafijCw864Yu5xkKB4t3cbE4OdUMUFIuwuhUSwXatbew6u6kzGB4fOIGFGgNaxp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OH8H1mAM; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OH8H1mAM"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-34bb8b31647so6483165eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380863; x=1791985663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wOjvHngcY2fx0Ft2SbEe6RFchwuSpswn0VG5xUt42t0=;
        b=OH8H1mAMhak2CxXFcnavZmaRcmZ4jn0oG3N2sI9YsonEF6CpvqqSQTbErryKajxQPg
         alc+pWCHzfPQKBFK0d8EYhLlFsRHxgh+1hMGPKCVSV7g/W3H8x31HV1gDQUdufLAwVpo
         hAtsJUkXtxVOVh4aGJT8regiTZ26toKnfUc5e3xufoYG8JEgm4yRuIT7H2jvUX42DQlK
         ruJaIZDFPiVlc7ElfdM9FMkvNvZoGQ7kqx47iePNYJ72m5jEsT+kmS9At/ZNBpQ72c31
         LIA8zy1lNsXEYyDC98/x1TKIk7kT1ywsW+wl33iHzxXpaP2jmdc1czIHvegh1FZIYtsi
         e/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380863; x=1791985663;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOjvHngcY2fx0Ft2SbEe6RFchwuSpswn0VG5xUt42t0=;
        b=oqMek1xT2OXcePEX78AdA5caESVK5N4kvKspL7tn2ejjLtvgANfP+o1gkhDSRle4Gv
         Wp9zi8K7WPEdL35cHEdeD9POpxgZjOiPNL1ECdMg/yMKHGLi1CB18ixgof8ub1WCnKOg
         qhafs51xtXBTZRgd0CpV6UM2DtEIxLe+er7DXs/DGG3w0baPZpQbu7dG3SI+D62fG7b0
         Rrt9aJy0RcxoauAGQw6vgEwpvFdxtYonvAYJ4+1/2HTrjwaJmWPb8rtD84lMsDRBD2j+
         Et5/35/HYRUUbOLF11mJ0ahyvAAMuKJYk6zVfYCei+WkQa+prGAnJRbv+rxN6qw74ZG4
         3l4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwHUFS+wNyesg0GvNDbvMczYWEqi7RCk0tHUiYr1wWYaVgOqhhnZXzL9luvr99xD8Wyoijf0+fxbOTjZf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpnx+1smjbkOgWaWDEPqtCCBqUOi7/ykXtPE70wN7X5IJ6vhyM
	+Ms7A1X2lLg2AmOfOtLVnoP8XdKBA0n1OChImJVHG7bRTaZIUkvc8Ks7
X-Gm-Gg: AYBFou1eixYuDA2Z9Q4Rg4n1R2OkD4O9ElJVRtq/KR/lT+0c50Ezl+NXGiE0tVLpsJ7
	2xCht7vwdT4gUBwYKo5B4m4HgosayIV03jaxZwmPS+rbq2/wSmUXbYsLioduNqV8uDFImZNZa7r
	FEGIRDeQL46AM7XCQeRxsvNDL83faC3livAyDKePmHZcZsE6c2hNRhRQ6Oz72tzOPZM4ieJLlz3
	RiMKDyWe3xgbhxjkJ02/5qMYSmi8AU/QbrqBLX3T19RCYcA+FfnI+Gg9kzM7qiZZaMkVsSKISFy
	m8jDrsPEOZ1wL4d53XfjwEW/Iqh4TP3kVMl9EubkE0NIQeerK6v49BB/hIfDtK4MmCQNAzAf/ft
	PBYZfBoP01+JfQWiXlgqrHiT9ffmNe3UdeqorpGZ40M95tZCtNpyrqGmsQpKMShnSNvSH9iNu4H
	FGr8nYIOYpehKlEOsgQkniVgRm+SmdHpm/ygfO7ChAPROsQUOV7zO5AGUvcefU+oKl+TQe251hF
	5mLgFFnnMrxmnfAHSCawnzvVBX2kTCyaI8xXw==
X-Received: by 2002:a05:7300:bfa4:b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-3515de60281mr2359864eec.10.1791380863140;
        Wed, 07 Oct 2026 06:47:43 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:47:42 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/9] platform/x86: hp-bioscfg: fix non-ASCII truncation in hp_get_string_from_buffer()
Date: Wed,  7 Oct 2026 18:47:04 +0500
Message-ID: <20261007134711.473857-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

utf16s_to_utf8s() writes into dst, but the loop that follows
overwrites dst from the raw UTF-16 code units with truncating casts,
so any character above U+007F is mangled. For example, U+00E9 is
stored as 0xe9 instead of 0xc3 0xa9.

Convert into a scratch buffer first, then escape '\\', '\r', '\n' and
'\t' into dst with string_escape_mem(). Quotes are not escaped, so the
existing strreplace() still handles them.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v3:
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 62 +++++---------------
 1 file changed, 14 insertions(+), 48 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 919735ddba25..754ab03bfd7b 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/printk.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 #include <linux/wmi.h>
 #include "bioscfg.h"
 #include "../../firmware_attributes_class.h"
@@ -57,12 +57,12 @@ int hp_get_integer_from_buffer(u8 **buffer, u32 *buffer_size, u32 *integer)
 
 int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_size)
 {
+	char utf8_buf[MAX_BUFF_SIZE];
 	u16 *src = (u16 *)*buffer;
+	int escaped_len;
 	u16 orig_size;
 	u16 src_size;
-	u16 size;
-	int i;
-	int conv_dst_size;
+	int utf8_len;
 
 	if (*buffer_size < sizeof(u16))
 		return -EINVAL;
@@ -79,56 +79,22 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
 	src++;
 	/* size value in u16 chars */
 	orig_size = src_size / sizeof(u16);
-	size = orig_size;
-
-	for (i = 0; i < orig_size; i++)
-		if (src[i] == '\\' ||
-		    src[i] == '\r' ||
-		    src[i] == '\n' ||
-		    src[i] == '\t')
-			size++;
 
-	/*
-	 * Conversion is limited to destination string max number of
-	 * bytes.
-	 */
-	conv_dst_size = size;
-	if (size >= dst_size)
-		conv_dst_size = dst_size - 1;
+	utf8_len = utf16s_to_utf8s(src, orig_size, UTF16_HOST_ENDIAN,
+				   utf8_buf, sizeof(utf8_buf));
 
-	/*
-	 * convert from UTF-16 unicode to ASCII
-	 */
-	utf16s_to_utf8s(src, orig_size, UTF16_HOST_ENDIAN, dst, conv_dst_size);
-	dst[conv_dst_size] = 0;
-
-	for (i = 0; i < conv_dst_size; i++) {
-		if (*src == '\\' ||
-		    *src == '\r' ||
-		    *src == '\n' ||
-		    *src == '\t') {
-			dst[i++] = '\\';
-			if (i == conv_dst_size)
-				break;
-		}
-
-		if (*src == '\r')
-			dst[i] = 'r';
-		else if (*src == '\n')
-			dst[i] = 'n';
-		else if (*src == '\t')
-			dst[i] = 't';
-		else if (*src == '"')
-			dst[i] = '\'';
-		else
-			dst[i] = *src;
-		src++;
-	}
+	escaped_len = string_escape_mem(utf8_buf, utf8_len, dst, dst_size - 1,
+					ESCAPE_SPACE | ESCAPE_SPECIAL,
+					"\\\r\n\t");
+	if (escaped_len > dst_size - 1)
+		escaped_len = dst_size - 1;
+	dst[escaped_len] = '\0';
+	strreplace(dst, '"', '\'');
 
 	*buffer += sizeof(u16) + src_size;
 	*buffer_size -= sizeof(u16) + src_size;
 
-	return size;
+	return escaped_len;
 }
 
 int hp_get_common_data_from_buffer(u8 **buffer_ptr, u32 *buffer_size,
-- 
2.55.0

