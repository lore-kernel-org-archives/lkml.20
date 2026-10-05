Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85164DD3D2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231938; cv=none; b=iNT2iXfbhVqdFQlP/kaAk5V+GlXj8dBrq2V+uGHZjWu0C2j+1ns0RMglmoB+23PqfZYwsr7q2tNDN4wScOMIovUAJF+kssB9q/qRhrGd2NGb02g3udknapuUkGka13U2Deadmf7RePRI7SBNDc/RLOlMxLRSV45bOGtY7KH1wQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231938; c=relaxed/simple;
	bh=nKw9TxNqgCT6Z30GFW1Utlxfo8n+sO0GMFI7Uw7BdtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XH5mb0W6Qy6vzomc838KkY8WsfwhNw9kVR3oVlXquEYt/cHrDQxN2Q+hhevFo3T8HtnxWunjtY68blY4aly+aU/+fMxWPxYmUPmZ+b1uy8/nkwuwqX+cGd+xthQW1pP9XRXKTR7FKDfRQ23C+VmcLFXuY32l6K37SDpAsa7Sejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oobAXQBh; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oobAXQBh"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc88a0d7so1294264fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231934; x=1791836734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NYLPpTVmdSpOa7axmkyk3ua+zg6Ulm7lPa93vfq3Oho=;
        b=oobAXQBh0xlz/y25c0sylMivsHtvg+QbEcveYlUkoObS+tIspTfT62Qs/0GDajWspe
         whk9F9fQiQ24HnggNpOgsuarWDULxuvBDsphsls1WRFoD6ZukQsOTU0gaB9CufVEpbC6
         dpwCYu4bgeHSDvBkbnfrSoe6bjs0qvEsgGnyaM1tUB8uL3M0xJUO0f2vp9oGaZm7Mbsy
         zaL1OTv/HN/Yp4pXXxUPgF/LMTVJbZ8OOHQt+P0Osg7IXX64SVVKnJf1CrJifjc0fN1V
         1gbydD2XVB/qK8fnVFtvBjqIEXMv7PlgikvCgD0puHcELTiHqONs/NuMRpibd9ofRvIH
         UuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231934; x=1791836734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYLPpTVmdSpOa7axmkyk3ua+zg6Ulm7lPa93vfq3Oho=;
        b=SgySYLlihijxWH/MuuhGpJwDxa/hila9YeKPPTeFCj62WbdlHyD3Gv8mZ5EY2AGDlN
         WZjTBE6lteIPfpp54MNNvKHtwhecelCQQfrX1y0wgC2EALtyCoqT0yJyOuSfFMp4OjYk
         blgc7koV0afeJvwlumS1V9nrFZpD2uEwNwmcQ+ljVW0VyM8DBC6UB1/tCgtx4A3W0xKN
         CUs2Y+yn9aEnZuKOFdUNHE8ZxiSNkrTK2oaHdl4GZUP6BPWumlNlRoCSxwtlV4aAhpmY
         /Vv9xMtVp1a3tfbBS9f/s0BkYVZVqGVMAr6PiWhW2FlKPZPiv2i8QYyQTqeSzBjle+KA
         GKQg==
X-Forwarded-Encrypted: i=1; AKwUvBx7N0uMCZujMrl86Rw7IN159DaBkC33d1fW7MNKzFkkOL6IBIJcgZt2WTz9JwI9wMs7YDadrG40SQtISfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kBCWSFXuprRgS/LDy5Y9MgzAW0P2Hte9hp9ShCAOXV6WuixQ18
	wvGhnPIq2yB//1ZMdI7t7TnjuZ9qwhBun82VfkIWpuEbTT9Kca2jzXKf
X-Gm-Gg: AYBFou2ImhPprvA6tlGhD3J+jg7oU8yz36snsUxXmPqA/aRIZe3kLSDmvTbhDdiWNBs
	0yGwm4AdqTLcRAapOO2jaVFJvKwavSq2zNoZaxCGXt74jlHRx3o/qmSliysyNcD80jtQFT55Z+i
	+KaZQ2mV786iDmarFyqTQOKEjsvaigzoQ68/j2AEuX2Cf7KAqxMifFsK+TRxhXDP54NeYRnxE7X
	rq6oQJxGY3uze9+qUUxOuPxtxjOVwtGhkYnvsdrUwkYaT8Emsf29jbu+JCN2JsSNJ2JN5myeVRT
	rz4THhwFXPjeaSs2W0BSmTdoSoOjxwqtUhAkE9oeL7nhkPLPG6iDdwDzJj6HexnuZb5l95hYcn8
	OZi0OK+IqKVtBlnQIHC7AX0lsS7g7XqrZn+D52xJLd+xRAaHMjIWjy7WykadZk3E5F8ztjMpmks
	A/Gb7RPe8OKO2Q5KlxJevUhgLX+nk5H9eapEh/jqZs2WUd1DnM480qCHasuEQEF+s3a5mVO+8oV
	+NbfyYUo/XB
X-Received: by 2002:a05:6808:1924:b0:4f7:ddf4:a202 with SMTP id 5614622812f47-4f7ddf4f169mr7133282b6e.28.1791231933823;
        Mon, 05 Oct 2026 13:25:33 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fac55bbf9asm631600b6e.0.2026.10.05.13.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:25:33 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: use the value argument in sym_get_near_range_bound()
Date: Mon,  5 Oct 2026 15:25:24 -0500
Message-Id: <20261005202524.3461824-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

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
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/kconfig/symbol.c                          | 5 ++++-
 scripts/kconfig/tests/savedefconfig_range/Kconfig | 7 +++++++
 scripts/kconfig/tests/savedefconfig_range/config  | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 2e87af098..11302faa2 100644
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
index fd59d9082..d879870a5 100644
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
index d939cfe5f..079a3107a 100644
--- a/scripts/kconfig/tests/savedefconfig_range/config
+++ b/scripts/kconfig/tests/savedefconfig_range/config
@@ -5,3 +5,4 @@ CONFIG_HEX_DEFAULT_ABOVE_RANGE=0x20
 CONFIG_INT_IMPLICIT_DEFAULT_ZERO=1
 CONFIG_INT_CONDITIONAL_RANGE=2
 CONFIG_INT_CONDITIONAL_DEFAULT=2
+CONFIG_INT_PROMPT_DEFAULT_ABOVE_RANGE=4
-- 
2.34.1

