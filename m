Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548B3377AB3
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477947; cv=none; b=B11eWVuR61rLctKHec0a33HHQnbyZ5Pj+giZhghh0OM5a8FIXGvhpjwCa+81wPP+ajXt8PV1jaBDBg6SIMhDnxddE4gbaS/TH1gsEtqexoy7sKgAukSrJB/3yyPthzE57YRQ2+x1MT37pjFmd6IU7ioqyNimulrA5FnpOUFWa90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477947; c=relaxed/simple;
	bh=2Gm3oCZAH5xEPW2gFonKXTzdW+Tu4iKs/jZ3IkMSoYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iQGV6a646ncqPKexcOWgwkv9aTQqWS225Qv1wzybQugKzAkQ8rBIzzD4HXXGFOCxJZlGbxLNwcGXDTGrHIYTyMuYQxvWVo6Q7jzNWT7IK5TNl53aEm8/n7/Rf701BqAirOoEbnIWPSahW7QhdZm5MqYU4XgBy31eq+fZXPPSkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWq+cAzP; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWq+cAzP"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-81c5aac8478so2010764a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477945; x=1792082745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UCfPp+7/JHVdolqbV5gJwvu/HMj/BA+RBUV+QQaMos4=;
        b=aWq+cAzPzQDEKT0AWeYSRGgYpaHhM2pf4VJNP5O5ggrzd5ialMgjxR6LMMu0AnyzP4
         08DHTEz5WqGbMOuObg/jUZ+s9G/BeSCdVakLN8SEZgEP9seX3bIeB7MM/4d/tnmz2NSx
         AgLRRi5t4L/68AW+qQzGm6ARg8zjIqJ3EjmklBUm+SJt27BfvBs6d/cAaJICYLY6JT5M
         X3FqjZJmwrVHU4wX+3hRUVVf5zq8oruTjNWLvZ1fWzQ03LyUP5uVFHc2mGY2lYI6MPn0
         wtfxAMZbME/rFW9Qze6Fc9kLz02ywrT/5thz+C0oXKbXhIoP5PxPIjZP679vDjeewkEG
         5GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477945; x=1792082745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCfPp+7/JHVdolqbV5gJwvu/HMj/BA+RBUV+QQaMos4=;
        b=Myn4t2ZRe7t4qBSyptmTdUgMUHpUG+MEJI71vrb7Qb3T9SEDAA6Wvwterf+WCIM8gz
         MOQlLNdh8DtRo3SKa9/khwRIzGaQTK3Ztqd3dZWkLgCZpFFWkvOgpKqZoOG0lXD9vTOc
         MpLk9lKUGzcIlndL8p6FQlzHKyYl2F7zZvdR/vkUugyEdcIiEHD8ITRTXTdxEffob0NC
         OrGxaIc9PkarRBJFlYYbHD9lI+CW72tRywoyYd7GXkg0ARJLPDZLP6sFgg/k4WKhXS/o
         Nt/DDExFN5W7xaXLdErFNgze4YlQ2tH/Xu2HKGsCerQL1Kt0OlOg/ybY23TeNdDsonrt
         IVHg==
X-Forwarded-Encrypted: i=1; AKwUvByJlAT9U3LBJn1p6YCIZLN5B6oo+9rINAgqmP89nZCxiHOAczJvDPMkZO2rEjAS/tZHCcgRme27zMDC5gE=@vger.kernel.org
X-Gm-Message-State: AFuF++kiICv4i2dzJ0t3YIUGiAVeRoMDWFIG9ec777W26wRn14A/AFVq
	ufm2Jwg4gqwClD90+e6PuY8+YhhFX+h6VkWcv7jiJWuNT79yYziBrsed
X-Gm-Gg: AYBFou3EiYcexUFrGbpx4AljUYfM0W4JvpRC9Ovhq7UFTjW3/w+CdShj2BUhqBgQjF4
	diFBpuMzgHAc3SA3lvhGYRRnz+gu/t7yFIFfI8dRthjlEGjKT5kCtRq+cOlZwggEzq0saL8UXTh
	Zf5xlPTdjldDLzdNmTe3NPT341LGS/uyCkvjFGYny1qBrJQMskuhIHYPxykHqSNjyYNJ/wfQHKd
	nmwD/3HH8+38068qI6ORv6ecU/F3d/CVkn7Dsth1/GQgTrKKwXbTRuHYsocPcWHU/FhDfKHXyDH
	zZsZQ+geTyNTMMubIveCSWj7so4Qmfi4wcmHJCAibwMNiiCMR4vh6fLmowO4SOcXx/fGRnxrGqM
	MTpK0dOUHtLiHpOkS0Mg65nYKs1rjucPNL4SyjaKuvkTjZ1nQkFEPBX6brsewmonJTADx5o7+kY
	bPR6BFFVsEpnY0aXETQFS4dn+GNoQrRA1jkSmLqFN7s0UDku/24NGmicbM59QrJQZLsVI0KnZ1b
	onyF7I0gUbs
X-Received: by 2002:a05:6830:6f41:b0:81f:138e:77a0 with SMTP id 46e09a7af769-82ad02b6843mr5713484a34.24.1791477945061;
        Thu, 08 Oct 2026 09:45:45 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82fc9430991sm64416a34.17.2026.10.08.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:45:42 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kconfig: use the value argument in sym_get_near_range_bound()
Date: Thu,  8 Oct 2026 11:45:40 -0500
Message-Id: <20261008164540.3686383-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sym_get_near_range_bound() is meant to check whether the given value is
outside of the active range of an int/hex symbol, and is called with the
symbol's current value from sym_calc_value() and with the default value
from sym_get_string_default().

Since commit 9b8719973ee2 ("kconfig: use unsigned integers for hex range
checks") it ignores its value argument and uses the current value of the
symbol (via sym_get_range_val()) instead. As a result, an out-of-range
default is no longer clamped in sym_get_string_default(), and
savedefconfig writes out values that are equal to the effective default
again, for example CONFIG_A=4 for:

  config A
  	int "a"
  	range 1 4
  	default 8

The existing savedefconfig_range test did not catch this because it only
covers symbols without a prompt.

Parse the value argument again, and add a test case for a symbol with a
prompt.

Found while fuzzing Kconfig input with ASan/UBSan.

Fixes: 9b8719973ee2 ("kconfig: use unsigned integers for hex range checks")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005202524.3461824-1-lzsx618@gmail.com

 scripts/kconfig/symbol.c                          | 5 ++++-
 scripts/kconfig/tests/savedefconfig_range/Kconfig | 7 +++++++
 scripts/kconfig/tests/savedefconfig_range/config  | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 2e87af0985..11302faa28 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -195,7 +195,10 @@ static struct symbol *sym_get_near_range_bound(struct symbol *sym,
 	prop = sym_get_range_prop(sym);
 	if (!prop)
 		return NULL;
-	val = sym_get_range_val(sym, base);
+	if (base == 10)
+		val.s = strtoll(value, NULL, base);
+	else
+		val.u = strtoull(value, NULL, base);
 	range_sym = prop->expr->left.sym;
 	val2 = sym_get_range_val(range_sym, base);
 
diff --git a/scripts/kconfig/tests/savedefconfig_range/Kconfig b/scripts/kconfig/tests/savedefconfig_range/Kconfig
index fd59d9082e..d879870a52 100644
--- a/scripts/kconfig/tests/savedefconfig_range/Kconfig
+++ b/scripts/kconfig/tests/savedefconfig_range/Kconfig
@@ -58,3 +58,10 @@ config INT_CONDITIONAL_DEFAULT
 	int
 	range 1 2
 	default 3 if USE_DEFAULT
+
+# Default outside of the range of a symbol with a prompt
+
+config INT_PROMPT_DEFAULT_ABOVE_RANGE
+	int "int with prompt"
+	range 1 4
+	default 8
diff --git a/scripts/kconfig/tests/savedefconfig_range/config b/scripts/kconfig/tests/savedefconfig_range/config
index d939cfe5fd..079a3107a0 100644
--- a/scripts/kconfig/tests/savedefconfig_range/config
+++ b/scripts/kconfig/tests/savedefconfig_range/config
@@ -5,3 +5,4 @@ CONFIG_HEX_DEFAULT_ABOVE_RANGE=0x20
 CONFIG_INT_IMPLICIT_DEFAULT_ZERO=1
 CONFIG_INT_CONDITIONAL_RANGE=2
 CONFIG_INT_CONDITIONAL_DEFAULT=2
+CONFIG_INT_PROMPT_DEFAULT_ABOVE_RANGE=4
-- 
2.34.1

