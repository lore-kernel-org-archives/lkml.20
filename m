Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA1A4ED187
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661579; cv=none; b=OHNxOfh9CMj6E0hg4FrZgZfxoSdLowa2aXYceVYWNtsbuoXaueNd2Ttrs/V/kujlnrOP9adDRsgr4MUwUlozuua56PhAamCLaD6sO/hil2nynVbhvlBmEzLN2s745o6oqL8bpl8A7DSr0MNuwp1uq04W3NVWFEgtDecMGjC8j9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661579; c=relaxed/simple;
	bh=VWbDqFJaYwnn39FxyvRfm2BxVkAJpX0wS2JxDsmFPro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O1fQ/nK++CXrfqG/HS/tgHMy49Y2YrMiJl1cCDXBbYGRn4/K/xB6UBy5ytY5CGNLmOak0Bfg8o38d6WRRPeKnKFdsglE5wrP691WfHF6VSaLl0EMmmn9cCyP5AtoPw8tHVBhzppXpR40lZ53a9n7fHAYUA4VaM3FqReiNN5WwcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzM+6Zio; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzM+6Zio"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso602307f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789661574; x=1790266374; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aD+hE8sW8gpLmXZS+oKLwmaSPyQHvokBuz4Tpi2ixuk=;
        b=qzM+6ZiokgFxGEBdMvo/E7+9H5BNd+iSV2wSoYSdWOhiBB2r9/YM4cQXjhnTQmv4q0
         waBMRg2dS65QG1L4DMaKxPuZVzEE3w/fZPw0n/q+fr3OaaM4ZHnGB0lutA9K/YgcogeF
         AwoKu3e5L5QzA4j1niGVnDv5UtFh6fG0xM+M/qBpnKf1Nzo89NngH9SHOLyhpy60ThFy
         FkcNOoxHdABeJ/ShRdMbEnsyigmQWB6O9wg/+2GwF0t6jkvkWxJRj9w/kITJVgkWvKPI
         T8nzrDlwDqNSNCSHV2f0xVAQNGGVTu6Lb6rASZCLeUTa7+aExgi/sebCKHvJNriwYBL1
         J9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661574; x=1790266374;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aD+hE8sW8gpLmXZS+oKLwmaSPyQHvokBuz4Tpi2ixuk=;
        b=SyU/Grs5pfc7krkx2gMq223EeH2k5Pbt5VUO8/DGpFbGqPloqBkn+czYCpcYaTdIRV
         HpyoaMk//UP6ibzbCEPItAWqjKhakATHO7Ze/NUXqfIv15Z6MF4SffrBUCmrHlidlM5a
         3rUQEiOaKAMJu2xviFgoJdFpeSXDDvGRD8P2tK2lzXojjVe13QZ4AfCY/PZ7JDXNK6yM
         Wd0gF3Vhkk1ZQ2n7fI9sMZehjO/ImZqvbQ3+xj1yBsWKfVGptTcU1hPpeThHb7Nvea5S
         djtlPwk8Aybv6yHYiEuK+Ql96q6tRNt4KO7OcM1kiZ8uudHb3RWch9t+XzWcP5MTdH/x
         m0mw==
X-Forwarded-Encrypted: i=1; AKwUvBwR9E3jxxbUPH2Z/p9nrLPThIoMUK0eN9GHBCjNhm0qkpkfOUUB4pBGLDsedm8Rel2vYBwNYMqi0jEgA4k=@vger.kernel.org
X-Gm-Message-State: AFuF++lbrO95vxUn9yoRyTD/N+kEtgOGIu0TesfWvwvO1yJg7VU8Bs93
	eQ4mpKY+O1wemMXLrNgD3R4q2KSUD/jTeg2SSh/V09N0U+a3vCdfzmcOkC0O
X-Gm-Gg: AYBFou2H2kNHXIeUyBp/HgePe0O6tcZCryeRBFcTS7uiRzrsXOcdqP+GddKXNOVy1hD
	pS860KrCxhjg0SIUH7D2b8Svd3gypjgTRJ1zay7Zf0OI4q2pkKN9gGt4OTgc4bPxZyLOUcK9RwE
	YBPFFFLOA48CFiet7rGH7LNQHLXPJ9znHyjedD2alOoAhMvN3aAp0I7AVVn7vlFNylGkYuv+sxK
	/jQ+Hp5r+EFrz65ZtbFPmeSA6rdPbsY0C+hA54jT+6WuFvNGbFZAFc8blyHHtXBAXlMjKmQcVlV
	PbisES/+p90iq958tGWF6NE0K8FSkS+jfnIa5jKKrzFyb9itSZF2yBjRwpynYKFW2pyxBtw0Kjv
	vvTc1AYEc8lRWv/tnZejnLaHlYApXhFMyIPagJ4oha7QHB0wcKLPru0BpunxmcUv9pow9Nz0rN2
	GtT9rK65paQ9xd2w0p2SVVOuyfU7qRD+lGvPii2DaoR7LzFQC3TCHUu7su1kEW60YkiZs=
X-Received: by 2002:a05:6000:2893:b0:487:1681:2218 with SMTP id ffacd0b85a97d-48716812448mr3934969f8f.45.1789661574208;
        Thu, 17 Sep 2026 09:12:54 -0700 (PDT)
Received: from p183 ([46.53.134.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf33e01sm18719379f8f.23.2026.09.17.09.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:12:53 -0700 (PDT)
Date: Thu, 17 Sep 2026 19:17:07 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: akpm@linux-foundation.org
Cc: Dmitry Antipov <dmantipov@yandex.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kstrtox: delete saturation in case of overflow
Message-ID: <a396f2ea-8de8-4eca-a216-ff69bc40fe85@p183>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

From 161367fd1e8b41e938274923bbb3d26de69f7a7e Mon Sep 17 00:00:00 2001
From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 17 Sep 2026 18:49:18 +0300
Subject: [PATCH 1/1] kstrtox: delete saturation in case of overflow

Partially revert

	commit 6e30111dbb4075e3c26c230417b32bc4a1c66831
	lib: fix _parse_integer_limit() to handle overflow

Originally, kstrto* was written in a way to keep simple_strto*()
functions as is, so that they continue to return incorrect result
if integer overflow occurs.

Saturation doesn't do anything useful, it just creates second incorrect
value and potentially breaks simple_strto*() users.

Caller can decide to saturate itself anyway.

Move saturation to memparse() from where the idea came from.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 lib/cmdline.c | 19 ++++++++++++++-----
 lib/kstrtox.c |  1 -
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/lib/cmdline.c b/lib/cmdline.c
index 16cce6621cec..7f9859733fb5 100644
--- a/lib/cmdline.c
+++ b/lib/cmdline.c
@@ -14,6 +14,8 @@
 #include <linux/string.h>
 #include <linux/ctype.h>
 
+#include "kstrtox.h"
+
 /*
  *	If a hyphen was found in get_option, this will handle the
  *	range of numbers, M-N.  This will expand the range and insert
@@ -146,14 +148,21 @@ EXPORT_SYMBOL(get_options);
  *	Parses a string into a number.  The number stored at @ptr is
  *	potentially suffixed with K, M, G, T, P, E.
  *
- *	Return: The value as recognized by simple_strtoull() multiplied
- *	by the value as specified by suffix, if any.
+ *	Return: The value multiplied by the value as specified by suffix, if any.
  */
 
 unsigned long long memparse(const char *ptr, char **retptr)
 {
-	char *endptr;	/* local pointer to end of parsed string */
-	unsigned long long ret = simple_strtoull(ptr, &endptr, 0);
+	unsigned int base = 0;
+	ptr = _parse_integer_fixup_radix(ptr, &base);
+	unsigned long long ret;
+	unsigned int rv = _parse_integer(ptr, base, &ret);
+	if (rv & KSTRTOX_OVERFLOW) {
+		rv &= ~KSTRTOX_OVERFLOW;
+		ret = -1;
+	}
+	/* local pointer to end of parsed string */
+	const char *endptr = ptr + rv;
 	unsigned int shl = 0;
 
 	/* Consume valid suffix even in case of overflow. */
@@ -194,7 +203,7 @@ unsigned long long memparse(const char *ptr, char **retptr)
 	}
 
 	if (retptr)
-		*retptr = endptr;
+		*retptr = (char *)endptr;
 
 	return ret;
 }
diff --git a/lib/kstrtox.c b/lib/kstrtox.c
index bac1c057e1b0..dcbc613fcde6 100644
--- a/lib/kstrtox.c
+++ b/lib/kstrtox.c
@@ -85,7 +85,6 @@ unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned lon
 		if (unlikely(res & (~0ull << 60))) {
 			if (check_mul_overflow(res, base, &res) ||
 			    check_add_overflow(res, val, &res)) {
-				res = ULLONG_MAX;
 				overflow = KSTRTOX_OVERFLOW;
 			}
 		} else {
-- 
2.55.0

