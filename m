Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0283AE707
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477919; cv=none; b=jUjACIodyqTALy2W1SDlPfP6YVLMkUhuosd1k4mvLcoQ68YwdJpgymPliR8VGwJWgAueQ7xac4k7qCGgqHPtE2dFHCR3P168DBVVG3imcZqrpq7uo4UCkr0uLEP24FuX3lvjqCVYJddQZvRoCGoKeZD3ZRrHHSls+tiCMVWaTTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477919; c=relaxed/simple;
	bh=5PYnFE/zsBkyDW+vipipK1OVktzKt+eBP7yMTnpTo9U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YlThxM3SGArLP0a4POn6MKxtxYwqPswbczYCrG06xB/+JsJfmT56pWjckkZ6Z0MeMYzyYo50BM/vsDKmDvKIssc7oGlCkkYVX+dAMg1P9zCKZiVBPZ7dLr9+IfjN5fl2ur2b/PmaHqOCn+SmOchzvvJ3P3I3MMKcS/l7WOHcRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWz5f1N9; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWz5f1N9"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4f6dcc0e8ccso830864b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477917; x=1792082717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuXXcDyEq3+vqBhIoHH0IdXSZPJA/Xb1zKM6JTo4TRo=;
        b=mWz5f1N9cPEpspsjHYXjA/KvlaB3F8TWnI65Sh8QYVoEDUP4YTRtfncfknZHUvWxuq
         DA8Uv2tQQ/gNsvy8qe9PUc0Zn7Xq8+6B5jZXKsPnV0XhWfBRbJJ0LOxhMluAkx9TNLB8
         Y1ciWIE61FZh4+TUFdEuMJU4wgCcZ4eDkPepJe/UzyfxRYakatMndbN42kTPW6FSdUxE
         PATnwCxXN9cdnP46Fhcs5/2aztBWHfKZAwZVQI8TWSOcKrcBk/Y7vmLCHocCKnUzGwV1
         NfkfRSESRCRSNIzBoBTXSawK95Y7i9++TiUCtivKZ6pgCQH09+Nsgp4V+n+ht6UZMs2u
         AjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477917; x=1792082717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuXXcDyEq3+vqBhIoHH0IdXSZPJA/Xb1zKM6JTo4TRo=;
        b=ra3DcKy6FlbknJp4JAX51Li+sIQmfYdUzebIQ5bHQD8/H4iJmyeZE66y9RqdJjmh1A
         gOqi9JYmhi+JK8RrbLQDaD5YhTy2p+CH3c4mPeOvBkHN1YloYz/m5ZbHhVBaedpTkkL5
         Yf/ZOqmRq6GWCy0xrSoRje2pOOfvjCGFmz8ohIlLfARZeSR/+CMEXegNbW459tqKAa0b
         Ln5rXxYD3goAWsKLQPf6YloG+obsk0QD7s7N9wBuPjqALuT+WeR5/mbC2s7LBsY9i+N0
         n5Ca27qFXVZWew5CM0GDwHTCpWXjhFFxiGU07WwUqIXOJ96MyCsZ6qixcB6nYUKA87sY
         0YWA==
X-Forwarded-Encrypted: i=1; AKwUvByu4hmIoXplUQ4yhX4nAn/BZ0r+FUT497z/ZJPUi57wivnkSYGPtPEQGmxr8Y4dbmXTPf2wp/ix3yXY9RY=@vger.kernel.org
X-Gm-Message-State: AFuF++mUBYhtLhC1M4ziS7erEgBJLdQMMinRFJ5uVteqedRYaz0A7e8U
	S+OLq3VaBEWKabuba4jDIIHZul83D5ndz3/+JIQ7VNP9u97wSwycPJ+UOFVcFw==
X-Gm-Gg: AYBFou39pmnL5qUmiU86qeWAck2LIEFNzevgzkiKredZOlXkc8OEhHqhn4ftw+Iv/S6
	KDNPBk/JZ+QSYr/4d0o9hyo1uRdjVmyFAZAVjtPVn2GmqCXaHCgOXbg3xSQePqegcffHgtSYPXU
	4TRGF4hvfphHGALZMmz0FfXHW7QjkI16kkmyyp5IglI40awkCtwCl05BqFn5wq0Dzbge7U+4tZm
	gHUrvkB80kMs25DQxgMi8cl1m1RSafp5ZQ1hdQfleGH5bu87KK/h+nzli0AMoi43E0Twn4d3/zv
	QV7GoSxYsT2wxpk3gOm4y298SL7DDXiiL1DrfZ/CEUULxbgl2wXin+gLEO6On7cEmRop8X7fXO7
	mQ32lZ9teQ0DSixvwDzF9rCcb4fzFcxANc9tH4zvMzCkp8zUBMlqKFoWAdQJfbSl6UZK0SoVRcL
	AiVXgShGQ2aL4QM0KO11ju7sAAUNR4mlAddgYSmKEo0j+KjQuLRbtcIKckXpKx7LOWuAAwsbcgu
	o/0Evgs2EOV1w==
X-Received: by 2002:a05:6808:1581:b0:4ec:1bf1:fa82 with SMTP id 5614622812f47-504bf863556mr1925851b6e.46.1791477916974;
        Thu, 08 Oct 2026 09:45:16 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc484f73c7sm6151566b6e.6.2026.10.08.09.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:45:12 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kconfig: fix use-after-free when a variable refers to itself
Date: Thu,  8 Oct 2026 11:45:04 -0500
Message-Id: <20261008164504.3683811-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a simply expanded variable, variable_add() frees the old value of an
existing variable (or allocates a new variable with an uninitialized
value) before expanding the right-hand side. If the right-hand side
refers to the variable itself, which is a common idiom in Makefiles,
e.g.

  X := 1
  X := $(X) 2

the expansion reads the freed (or uninitialized) value. With ASan this
is reported as a heap-use-after-free, or a SEGV if X was undefined.
Without ASan, X silently ends up as " 2" instead of "1 2".

Expand the right-hand side before updating the variable, initialize the
value of a newly created variable, and only free the old value when it
is actually replaced. Add a test case for this.

Found by fuzzing Kconfig input with ASan/UBSan.

Fixes: 1175c02506ff ("kconfig: support simply expanded variable")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005202433.3460844-1-lzsx618@gmail.com

 scripts/kconfig/preprocess.c                  | 21 ++++++++++++-------
 .../kconfig/tests/preprocess/variable/Kconfig |  5 +++++
 .../tests/preprocess/variable/expected_stderr |  1 +
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 783abcaa5c..db226898c9 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -293,27 +293,33 @@ void variable_add(const char *name, const char *value,
 		if (flavor == VAR_APPEND) {
 			flavor = v->flavor;
 			append = true;
-		} else {
-			free(v->value);
 		}
 	} else {
 		/* For undefined variables, += assumes the recursive flavor */
 		if (flavor == VAR_APPEND)
 			flavor = VAR_RECURSIVE;
+	}
 
+	/*
+	 * Expand the value before touching the variable because the
+	 * right-hand side may refer to the variable itself, like
+	 * "X := $(X) foo".
+	 */
+	if (flavor == VAR_SIMPLE)
+		new_value = expand_string(value);
+	else
+		new_value = xstrdup(value);
+
+	if (!v) {
 		v = xmalloc(sizeof(*v));
 		v->name = xstrdup(name);
+		v->value = NULL;
 		v->exp_count = 0;
 		list_add_tail(&v->node, &variable_list);
 	}
 
 	v->flavor = flavor;
 
-	if (flavor == VAR_SIMPLE)
-		new_value = expand_string(value);
-	else
-		new_value = xstrdup(value);
-
 	if (append) {
 		v->value = xrealloc(v->value,
 				    strlen(v->value) + strlen(new_value) + 2);
@@ -321,6 +327,7 @@ void variable_add(const char *name, const char *value,
 		strcat(v->value, new_value);
 		free(new_value);
 	} else {
+		free(v->value);
 		v->value = new_value;
 	}
 }
diff --git a/scripts/kconfig/tests/preprocess/variable/Kconfig b/scripts/kconfig/tests/preprocess/variable/Kconfig
index 9ce2f95cbd..226114e86a 100644
--- a/scripts/kconfig/tests/preprocess/variable/Kconfig
+++ b/scripts/kconfig/tests/preprocess/variable/Kconfig
@@ -51,3 +51,8 @@ $(warning,$(greeting,Hello))
 
 # Unreferenced parameters are just ignored.
 $(warning,$(greeting,Hello,John,ignored,ignored))
+
+# Simply expanded variable referring to itself.
+X := 1
+X := $(X) 2
+$(warning,X = $(X))
diff --git a/scripts/kconfig/tests/preprocess/variable/expected_stderr b/scripts/kconfig/tests/preprocess/variable/expected_stderr
index a4841c3fdf..7008e3b177 100644
--- a/scripts/kconfig/tests/preprocess/variable/expected_stderr
+++ b/scripts/kconfig/tests/preprocess/variable/expected_stderr
@@ -7,3 +7,4 @@ Kconfig:41: AB = 5
 Kconfig:45: Hello, my name is John.
 Kconfig:50: Hello, my name is .
 Kconfig:53: Hello, my name is John.
+Kconfig:58: X = 1 2
-- 
2.34.1

