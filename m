Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610319;
	b=jZnbRVwBHW+Xod2AugrtCuKvUKutLyai5UCiPnyNTPuD0thUSQ62sODIGQZajiB/EN4r
	 KbZAGHY/xAGVEpZPJXyqKuocauI3Rg5tP5X1dnkWb+VUWXmhNvM02AF0Y54U68w1JOxWM
	 qoYnGAuSQNY/QZ7YcnuRlriIijDc09TjUzhp4awO9vmZpxRm6zwyoLGA0zTEtVZfSRiYN
	 wffwdN5Gs1B86ySTh+l0ECj7XbRdb6qojvRS+W7paT7tB73DEcCI1pH7LEMxMl8YxaFm/
	 pDQiHQy+cZmyf5aMJaQeQHX27tfu+kw7g/zdRwzS7iI2+IS9xFrwE3EbyQNJ/1kX75Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WP1usr8BMOzRwVfaR8RvJCJhQa+qcbSNnudAIzg05fA=;
	b=oUdNO988GU1Bb03o2UaO6dcz05Q+72ZDJIHGymhku4VJTfvTH92R23FYG//KvvaVEA0e
	 QwU94lPmeQ58MoBqRU0epUE0MpikdTjCsi1Mk8YcQf2VZlHpFmoww38aZPHTrJOGZ49dW
	 5tr5zMjtcXACM1CvSaxMYDXfctBqAB9nqHD5wtT3y1sMwYZw40v7Gz6yRYUBhHtCvbOt4
	 H3vgyuWDepGprXHOkRZQyOBI8BWWLr3EgYVtn5bzBJ0icw9Z7uS9pa/MueZv4ay6zA6no
	 R4/6/Rl5NZQl3SXGqwcFx3KY7YvWHfLtwC+XripzhRLfJU2FyozHtEH37bboaiJ2FyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urMHVQfh;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D22A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D22A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urMHVQfh
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b4e814214aso373980a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610318; x=1794215118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WP1usr8BMOzRwVfaR8RvJCJhQa+qcbSNnudAIzg05fA=;
        b=urMHVQfhj7AM5rUuICeYfQmGtxdx8xLhyGmGc+THepgzOjGPDtbI0XWfSDyrDxdm9k
         KyAZfXtM42BpKE1gPtld/UqCvN/Hi9YhMY4ObtGfEcJlQBRdMBiZdUJXRmzlra4YxCWo
         KkWZMAp0LCyRzlgV6UGQvWL7knDdAPRq2lJ2JeI8zbGQYUVPfBFe7tmGUEjy+rA5AgL1
         3fVgrBM1sjRFX/iW9nZL3STiA/oJveTVHIFGFZEi69DlGEW9IL1eLukU/KCxCuobLlt7
         kr3N4D342ioMo1KebR2fPOMkMSRPJp/Vtgc/mbOiIaFH4ijlUuoFbvltn1YP74WH4spW
         BfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610318; x=1794215118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WP1usr8BMOzRwVfaR8RvJCJhQa+qcbSNnudAIzg05fA=;
        b=fQ/TXiBdYTHGIDiJmie6daFcd5bvkkW7dg54UyDgs1oUFTuItvmIQyJPeJG6/bjVkE
         NsUmzalWJ6ndptSLZ2ZCD1tdroqEWeJbXuab169WN8DSstGIpVtJlnWwfGxxBxAe0U46
         PfDCusZ8r7uN8NJkh1WhJ1hDHuWIE1dpjv8drw7cukeQ0xXFfRnX8CeX1AlSvPHf3Gt1
         pv/iWyE37WEONOnvwyN45ivl7xU7Ax9b2IWHHS6gmjd/UZo1/oltibFsxFwvMR03lMoQ
         pQpb0Ls2f7IS2fuBKsmoH4p+4n5Z0BLSoNUmk6GBYRO/ruZA895kvf795UvAGmTU0cWx
         obbQ==
X-Forwarded-Encrypted: i=1; AKwUvByEALvLKXUG2QEvZHfehKcvuZuOmad8OyzoIsBGiJyl/iKjeTgZ+YJo/KRbDYxaYCrvc/H43IdRTkCukBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fbisPdUbY9Gdh5Oy+FGeHIq3mtyIHrqLFes2Ay28I6TnCU3PY
	n2S7N2YttbuYsiwzYmEmghfz1EYcYgE5CqCOyHVBDj6+h+JKu5MzV6rE
X-Gm-Gg: AYBFou27iegHpiwhm/rvhUXQF5Q9/lAuswYaOB3Gq5Dm8IcUTw3s1yHZr4UbfOtiaU4
	cGhx/FzRo3oXOpX86mCz3VcafZtN4/idW47wpzsvW3i+XLOBdBbsF8Mv5LyzF5Gg1sDNjB6oCCI
	uiOb2HJWKGARp64uLDDTGiAHPqvwjG7sQAkWQebrPig7gg82nvGtYINpXNunY6ks+6yPmReeCVu
	gQtyl5oDLj0670XisqwkGz+U+32EG6dMo9LtbkR0bamK9PzwWxYYlvIikUpygiT6N2Liss0zJsA
	RzdqlUqhygdvjJesNYY4jBGZPJRmg/KswIsxoV/x2Z/0nhDgTPd1ImXDDcNDvxz5lHg0/9t8n7J
	5mKm/S7rbRP/3WYJUt3b3s0k3p3q+cCCk6A0ykx52Bx+SeEd+qebJb+deULRaVu4dmRKt+rYauw
	1UhxXicHErwri47QiOBh1ZJ8o3K+otvUrGf7ICArUAQPIp/jLHOpAkaxzf7oIyVSZHLUimFQy4T
	tA8QSbc5SAWJ35whh18dE3cTpGq1Vrbz3/TBETZsdwQhp/+pw6pWPy+k/kjBvfGdxXGOeKwksX8
	G6Peb3uFgp3Wvic+pi07UXo7Uyy3Pzo9BGrG3TyrozGQnuUBXx15jsDT6jVNs6uOzEkRUvlYGux
	zZ10RFlrnwF0H/sWqT3nCaA==
X-Received: by 2002:a05:6402:a50b:10b0:6b4:27a:38f7 with SMTP id 4fb4d7f45d1cf-6b4d46841c0mr4376828a12.22.1793610317411;
        Mon, 02 Nov 2026 01:05:17 -0800 (PST)
Received: from localhost.localdomain ([91.242.55.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm19372105f8f.40.2026.11.02.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:05:17 -0800 (PST)
From: Ruslan Semchenko <uncleruc2075@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: nathan@kernel.org,
	nsc@kernel.org,
	julianbraha@gmail.com,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Semchenko <uncleruc2075@gmail.com>
Subject: [PATCH] kconfig: preprocess: fix UAF and SEGV on self-referencing variables
Date: Mon,  2 Nov 2026 12:05:00 +0300
Message-ID: <20261102090500.54575-1-uncleruc2075@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In variable_add(), when updating an existing simply expanded variable (:=),
v->value was freed before calling expand_string(value). If the value
referred to the variable itself (e.g. A := $(A)b), variable_expand()
accessed the already freed memory, causing a heap-use-after-free.

Furthermore, for a new variable definition, an uninitialized variable
struct was inserted into variable_list before expanding value. If value
referred to the variable itself (e.g. B := $(B)x), variable_lookup()
found the incomplete variable and dereferenced uninitialized v->value,
causing a segmentation fault.

Fix both issues by computing the new value before modifying the existing
variable or inserting a new one into variable_list.

Signed-off-by: Ruslan Semchenko <uncleruc2075@gmail.com>
---
 scripts/kconfig/preprocess.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 783abcaa5..d48791921 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -293,27 +293,35 @@ void variable_add(const char *name, const char *value,
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
+
+	/*
+	 * Compute the new value before touching the variable. Expanding it may
+	 * refer to the variable itself, which must still see the old value.
+	 */
+	if (flavor == VAR_SIMPLE)
+		new_value = expand_string(value);
+	else
+		new_value = xstrdup(value);
 
+	if (!v) {
+		/* A new variable is not visible until it is fully defined. */
 		v = xmalloc(sizeof(*v));
 		v->name = xstrdup(name);
+		v->value = new_value;
+		v->flavor = flavor;
 		v->exp_count = 0;
 		list_add_tail(&v->node, &variable_list);
+		return;
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
@@ -321,6 +329,7 @@ void variable_add(const char *name, const char *value,
 		strcat(v->value, new_value);
 		free(new_value);
 	} else {
+		free(v->value);
 		v->value = new_value;
 	}
 }
-- 
2.47.3

