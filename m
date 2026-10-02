Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26D33EC2E3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968504; cv=none; b=gN/w4fnGuXMk0IbfFWEJuwpGjosH2K8CHmrJ0ZC3vGKvEA6LrfdkBte9l2VCuuy+q4rafxWC2BC8zKUC85O9meIXtIi+K6p7J06ptLpGCUG3hh5DVINlbymQXQYoNaawQLJ7t0p6Um7XS9/MYvTbI+0aWoLEN1Kw3eCOtAz90pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968504; c=relaxed/simple;
	bh=xxut/fG23M7rb8/SZfuWxXWfjDk/1qLqNWSM7gQtMOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNGDfOxlU+SYvp92wxp8wsgBw0oPzgp5Ei8oIiECr0AjKutSOO4JWNh0nnURXivMpyEheicdD2Ce/+hNz41sHnO55MF6/fJ8Hr3Zy+zq38tJjMUlmtnREDcLe5/re5NnjfQtaLCGrTtVVmBRaInU/ZkTWoNEDUxQZ/3AMtsVHm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icgrJVwN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icgrJVwN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so1787695e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968500; x=1791573300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08yw3nPYnGsVkpVz/DuN7iH0uiVaiRVax9PbXifWg/M=;
        b=icgrJVwNqyv3f5eTYn3wIisXscrCXuZ+nGURAcIobnxwbwgM7Isn3tv9wAby+0LMlz
         8yQqswmp0AuyG39d2x1iyfDtXNAUs17rTJqrufQ19BJphGjg6hkTJjBJ7D5jiipdbuqf
         FbMDZK8xwBKIVT4gHqQgKeIMuFOsUwm8n4kQcYHoDfnRyyAkWxNT1ttuw3CFDycYr/VJ
         hNf7oUhUO67xLr094XSUrmVoiKVslnfseG+oR67eMNq275JbHbH7OVF3xVVCo21esRts
         Jx3r03tVjl0QBoMbSWIaQu7/Ka/TMBBXLFw1M6GnbEfYqgg6KPdXSp4p+5GwokU4oB0f
         dNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968500; x=1791573300;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08yw3nPYnGsVkpVz/DuN7iH0uiVaiRVax9PbXifWg/M=;
        b=cEnj4rniCozuHUMbEODhVcoJgvVGve8dVhKh6oOJw7hgvyLh1b7N7iQWG3U9dJIfPw
         vkm+mx9AoZ6y0CAVwpBd5ZEWGZgmVurThM9ssIUVHrIxvrUJsUnjG6HM2WHTK4L09QrN
         wWaVPy/djvqO1AUfRvG461tki5UrQoM7Kfz7ElgWs5uerK803SuOZkYqrWzHV4tn7QtR
         dlNI2Bvi7fqA7Jra5S8/OWxdKu8FHGwnvGVs6I4yKQS2Y+fAeR+1//gTlDyQrRVmQcLV
         SqlQlhidP+pCodUUYZyxGblb6lImGMjhQIGlEsPZxqyUt25TxWzCklh2hkwzO2V3CQ+/
         BYOQ==
X-Forwarded-Encrypted: i=1; AKwUvByzfi3d55ebLJv6oCSx2VvnwNVtWqZGPpnwQ+IrQE+Q9cai7JcJU0ks1VTpMNOA8zjGdakDkJBlUpz/zj4=@vger.kernel.org
X-Gm-Message-State: AFuF++mrxpCHCS9ECijEJHKO0ioxyjn3DV2Kd2+v9y+NuWRl7jZ+PQER
	rqBvet3PScX4JFSZ2brpvL3TvfUuimy6kXNGnuZ/9hrNL2yLcA6R7PaV
X-Gm-Gg: AYBFou3kdAAfhYbrNsvrqLkYnNWeeKrpJvlxIse4Vo9LPtUOVg9b5xYiWAcppwAehD8
	gNYTeZCaE1+r/AQ16TinzPcB4dC6tcmIprSV0+vx4RyMbsF1v6aMLb35z4hbJ/Z9jt/JJyOZL8a
	m7y4YpvtJWu/v9LOKLoLMFYYIpS8HLoSuYl701hdjKD6L5vSORng+xkIZgLBzcoLfGkp+k91htb
	ESbkIUAQDfXlBjgdSfICtxp+ZnIj8FhsBrhIWV4IFTPvDorDP2ACkKXUa/k680CE/5Khz3e0XEY
	M2nEveuacOcMe8Q3eh0gWDUJT2Uama7JeVBNLMtbS/5aixE31ua0ff2822GBFwNBTg50jROZGrF
	ALiOuVT8rhs+vWRkrysFEks7Y5LX8uOpuLJJ41oy2Zicb3cm1zDdg0sZuFDuS2K3cWmjA2GtJXa
	Tdlnotscr9HImTWOHTzp9FWpbZV8R5U0nrlOcu8903iI13amUkkBpSTHoYZOQEVY6Vw4MfpYglb
	WCwS5UkWUaoIHihPGr8H8L9NveP72mmEkLwMYKtXDUo9fpQXJnt
X-Received: by 2002:a05:600c:1551:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a0275a229bmr71406085e9.26.1790968499991;
        Fri, 02 Oct 2026 12:14:59 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:14:59 -0700 (PDT)
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
Subject: [PATCH v4 2/9] platform/x86: hp-bioscfg: fix non-ASCII truncation in hp_get_string_from_buffer()
Date: Sat,  3 Oct 2026 00:14:27 +0500
Message-ID: <20261002191434.58529-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
References: <20261002191434.58529-1-meatuni001@gmail.com>
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
 - Drop Suggested-by: Andy Shevchenko
 - Use string_helpers.h instead of string.h, keep reverse xmas tree
   order of declarations (Andy)

Changes in v2:
 - Split out of the combined fix (Ilpo)
 - Use @only of string_escape_mem() instead of a new flag (Andy)

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 62 +++++---------------
 1 file changed, 14 insertions(+), 48 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 74a90867e..e468995f2 100644
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
@@ -53,12 +53,12 @@ int hp_get_integer_from_buffer(u8 **buffer, u32 *buffer_size, u32 *integer)
 
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
@@ -74,56 +74,22 @@ int hp_get_string_from_buffer(u8 **buffer, u32 *buffer_size, char *dst, u32 dst_
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
2.43.0

