Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B63A05F2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790456254; cv=none; b=AylirCBGgwswwyKL5o9uqAX/P2oSv8ORDKMA7QklwJpamiYAt73sQzW5hXCS+G151+LKSkVph3lAUlUbcGL7BAzOBMkwWJWLYgKxett5skE/Hhr0wbmcDx2sQ+DnPJBF0ee4uUN/rOi5PUirD6k6ckq9Sc4OwdTW4iUXySBvDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790456254; c=relaxed/simple;
	bh=bfRXeeWZCnYxMWiaETcHuPeeQ99w6tkf/jqYYZ9kEUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ro4Vln+mW6q7ZzRvnVrVVUeQi9pfjjLlM0CaJVkB6iYo7TScm/6xrsf8NndXgKvS3UBQTFb0E+TzxJ3qXKJAeQDrx6FEkq9OCmCqtOaG5xQV+G/THl9Rqwf+M8s4c+OGLh2qyCoNlI6z1a5pYEH4TrpbUbYv1hKK+/zAPHs0N2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oylus4sd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oylus4sd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so2862075e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790456250; x=1791061050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csF2i/18qFumLJd4aqdPk0G5uoJk8kwCVpfjDMQwFsM=;
        b=oylus4sdo/ESnPyc2rmZ622v6zmkJhM2wQQzIMRIGQSKzZy4zQc75Qx/i6j8mnpAfx
         GbKCwE05VWUhtPBD7psp+YTmzgX72017k0BWTK2/YxZST3djtB0qneUYkL2q7AgDOH+J
         05pgx+m4am40scIvTvBsqOfXwKrWECzRWmOKb54VjlIhwh1Q/O+QtJqGYL0mUsI4F98i
         v1bbwX0bYpTb2aE1dNDhw1ceLIdWLgQQKFDezPVfiYgyFr9bItE/hMmC6Y8lhtgcOjLD
         4y+Q5rXVjO0Awm2ml2XwOqEnCOUj4f+djyEMHOcMh5pdwal8PLIXnF14mUlR883hTpgO
         +7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790456250; x=1791061050;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=csF2i/18qFumLJd4aqdPk0G5uoJk8kwCVpfjDMQwFsM=;
        b=nSS55tNsK6wQyziQkS6vUKFRwac4f92QGOGGRXl9n5weLeuNf2WjkNb/yjOLiPH6cE
         EZBt9m73Z1FoZNEEPTl39EIi4GCOzxjXAChCVMbhl5M7VfJISF2uLkLCBD3llioFoAEL
         8ai4GJIB8xp0HeSM4Hk0U9xRwcZZfSwnIkKhy+oggBJY2wOxtcHhIrdmTJHVfFJWC1q3
         fEHnRDjHsz0ur1xwwnXhAX/Uxp6jTpTGE7D2zQP2e1sADVA0GnEms0z5FflukxXlsuvf
         UWrdCG04s96zVaNV1yIlyqiUw887WtHSG37CI4txg9b2IwmBgdGQjXQ6b8vofxT263D5
         1hXg==
X-Forwarded-Encrypted: i=1; AKwUvBwfPEEU8+O9ypUOYEIY3SfRSYqkJlov7dMEDX9uMVh/LVbMriIcWNWb+PUnV3RQoUqinEP+zCtA5wT8WJE=@vger.kernel.org
X-Gm-Message-State: AFuF++nrjrcqOi4+9VKnZt/7mxYiU411nB0LIWWUgrBGhSXc3AcLxYr0
	gvADNJtSK8SSC7wc+8UaVWQCjEXR1bCU6NYxZE5qdR51QL3v4zNx8MCh
X-Gm-Gg: AYBFou2xdVzqc9F/NDXQkcEtuO/RwXwjzbn/8tvGvCIqC8rjd/Vdbzi4PzHvFsVrhQf
	HrObtzde2RrTYqcqX7XNUl4wTO7c8q/RB0ufRYCRy65cr3Ha6HPMocpBs8H1qkisxWcke0jVKrb
	tWoMvBhaAvNJj0iJx035Y/YXvfsglPIpa+iP9rqlPgo/0qD4BlR8nHd72NXdHoSicnY4rjw9KBS
	d2RoQcPcFEdd7wjeX2tVrrZpomgx1+FxGuNYBVkau5Rjz0205Q1+FbO21VXIQoEW2FaEi3IOcIC
	ZxdOH9mIDNkndkJnsPp4UaWKsUkbz0vdXXL9FrSs5d4FfByS8M6sxGRpWkIpKaPvUXFqtA8umIV
	U67AIUKtTaCB3G3imXJLId2/R85FNuwSFf8QmQ472gfrizO1cYWsVv9c1XyvMCT3b/W6tcFjSJN
	3UzWx2Hif65Vy5EiicHddRsYR3G7E/CSAuYYj/vevYQmFURtwxkvh+spwwsohRUTAhVmlPsjGk5
	2HLwcbS8ImL+F8XAVcL3fsjiVpYIofea7L4/OBlAEYrZtJT2d2Y
X-Received: by 2002:a05:600c:348e:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-49ff06b2ef6mr105847065e9.5.1790456250016;
        Sat, 26 Sep 2026 13:57:30 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018e6dcbsm1734845e9.6.2026.09.26.13.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 13:57:29 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Muhammad Bilal <meatuni001@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] lib/string_helpers: add ESCAPE_BACKSLASH flag to string_escape_mem()
Date: Sun, 27 Sep 2026 01:56:54 +0500
Message-ID: <20260926205708.384308-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ESCAPE_SPECIAL escapes '\\', '\a', '\e' and '"' as one group. A caller
that wants '\\' escaped but needs '"' left untouched, because it has
its own handling for quotes or because quoting is not meaningful in
its output, currently has no way to pull just the backslash case out
of that set.

Add ESCAPE_BACKSLASH, which escapes only '\\'. It can be combined with
ESCAPE_SPACE, or used on its own, without pulling in ESCAPE_SPECIAL's
quote and control-character handling.

This only adds a new opt-in flag; no existing caller changes
behavior.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 include/linux/string_helpers.h |  3 ++-
 lib/string_helpers.c           | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1..111114d 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -72,8 +72,9 @@ static inline int string_unescape_any_inplace(char *buf)
 #define ESCAPE_NA		BIT(6)
 #define ESCAPE_NAP		BIT(7)
 #define ESCAPE_APPEND		BIT(8)
+#define ESCAPE_BACKSLASH	BIT(9)
 
-#define ESCAPE_ALL_MASK		GENMASK(8, 0)
+#define ESCAPE_ALL_MASK		GENMASK(9, 0)
 
 int string_escape_mem(const char *src, size_t isz, char *dst, size_t osz,
 		unsigned int flags, const char *only);
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 98d6ed0..f35234a 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -438,6 +438,24 @@ static bool escape_special(unsigned char c, char **dst, char *end)
 	return true;
 }
 
+static bool escape_backslash(unsigned char c, char **dst, char *end)
+{
+	char *out = *dst;
+
+	if (c != '\\')
+		return false;
+
+	if (out < end)
+		*out = '\\';
+	++out;
+	if (out < end)
+		*out = '\\';
+	++out;
+
+	*dst = out;
+	return true;
+}
+
 static bool escape_null(unsigned char c, char **dst, char *end)
 {
 	char *out = *dst;
@@ -558,6 +576,8 @@ static bool escape_hex(unsigned char c, char **dst, char *end)
  *		escape only non-printable or non-ascii characters
  *	%ESCAPE_APPEND:
  *		append characters from @only to be escaped by the given classes
+ *	%ESCAPE_BACKSLASH:
+ *		'\\' - backslash, without the rest of %ESCAPE_SPECIAL
  *
  * %ESCAPE_APPEND would help to pass additional characters to the escaped, when
  * one of %ESCAPE_NP, %ESCAPE_NA, or %ESCAPE_NAP is provided.
@@ -628,6 +648,9 @@ int string_escape_mem(const char *src, size_t isz, char *dst, size_t osz,
 		if (flags & ESCAPE_SPECIAL && escape_special(c, &p, end))
 			continue;
 
+		if (flags & ESCAPE_BACKSLASH && escape_backslash(c, &p, end))
+			continue;
+
 		if (flags & ESCAPE_NULL && escape_null(c, &p, end))
 			continue;
 
-- 
2.43.0

