Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CC2257435
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789828519; cv=none; b=th3Kjs1zUCbSH39aCvWPHFUCUr/8b6csS9T/CoJ252/mTlr8nhy2KFzHhxhbRFelFMD2KPO7WnrCSGsrshnazfXnvWtw8uGSMFaWBH+QAIqwCQEj0XIWKlTQDDrJ3gbhr9fHPlIvnkfoSzNl4yUlVZjcZu5OJwRVLQgaRoo87jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789828519; c=relaxed/simple;
	bh=lTprQ5pzR9M5XIs/pNaILaDZk2lSUXDIybRyIblq6+0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pl6t8LgyG6TEcwgS7zjd4wLWLrFkdFCF9dI8ES41pue1ouxl+DFtCVmMsvoISUcVtEtPJFXgVq5RH8WLq/pJWJZPIRXyN2yWuY2L0DgxiRiAlP1q9WSYFhGSi042M4OMu7WZxSMOQYuQ2CLDv96qymvt0eFeiwyLdwFArL/8AUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIKKfuqu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIKKfuqu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so11961945e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789828516; x=1790433316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RUlp8CtLqjLZ6uUUxbQEeBN0fgm/yTb3PqHif4KFkE=;
        b=KIKKfuqu0CUw/yyJfX8nfOZ5veAysJWNu0vkHTjOPtp+GWYwND+rHId1qH2iYWqM2W
         5SScn/TDL6+LkuQluqvQTDPz6X/Wg+BM3uvz8mukMTV+E9gjEjinIkYMB3nmiq4xxA6t
         jlaICP92xeZuZ0TSAAn9OY32hjcdeAU2r3+ENa/RW0KUsx8wDODcI0BVddHc/k65hNB1
         mHogcMEvnPxPWbZdrzsFgNmTbDTn/kxJIuDPyTWEDY/A/5DUmdM05hocdsYWi95ZqPNp
         kZx5XzDaBc3PEr3FETGUJY6Z9edJyjPaGdIwYbeuVYh3TmsIZvhWjphbUpgLUK6V+k0F
         jTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789828516; x=1790433316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RUlp8CtLqjLZ6uUUxbQEeBN0fgm/yTb3PqHif4KFkE=;
        b=WHPFdNJEVxiOD8q0eFkpGM7ft1nKvmrtaLkEYo9gHXWUHP1R3wjqc53aj81blSY3zf
         m9AWy/UoQNCV3Lw4ON4yitOX7U9Gf+0QUxGWkGKIMM509sKDpr+HgVMf6cKFDvrLWk16
         pSoyexDj2zDi5X0kvh5C9ZmSirWfdkHaq67CxAtGHIIyx11DDHB4IPJmeTAU4d1VGVF7
         qn8owW/ir+JdXgKNLsZeoPfpKTkY/YvE0wAtm4H4R9QefsW7RkeWbZA9K8rVLXPTQ9B/
         mfAa4ko9j/8eMr7wLH8EJSKPIIxY2DyBH4t7Dp7KuDJDR0cR4+Xyr0nEhpdYl2A6Eqt8
         UhYw==
X-Forwarded-Encrypted: i=1; AKwUvByDtrqbucVDTQlxED7SA7zVf/XFmBEL4WWvxyh/hzOs54zyCgdkFeK5o5mhwzBWZi/u/Vd8PEk6yIHnCG8=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ49Zf5M0wPUZmHfoDX1NcCochIonNT/69A7DlmoTfiW3IaKUg
	LG2IKdBuENWNgwhJo6qs+4Ji00PwlsZNk5mJslNUxT8OEs1FFgOxTIPk
X-Gm-Gg: AYBFou0XvDQA8FMGLQozdx0PqyxA0q+zZ/Fu1cVgmZdaPvocc+C82//u3CT2upeuRB6
	+29r6dt9LPLklHv2n4yA6k3iZqQngkh2o8g71Dzbm4f58MuNGx3WlZMQy9CBClCuRX3ACsRIyA4
	IvQFWS7Brd9Btey/wwvEnCSdtxUTr+BmA3edA0RWSXAUePtyDHcaEztxR4YBezOueGO/ej0E6be
	sM0itaCu1Ds2Rndn1aVc1K18SarHFzJaEMs08f2QiXSCRL/cSGCHuxwlm+qLMQAbaCnJAh1FLnj
	EcrjQo+QxCRkd+2h6ifH2dFYabZq9RqAUM5x4VK+6ML4P8HyQIaPcJhZns/WG99O4s1vi8r8OGK
	o6HXh+qMlnlArRccGfHrCR+n3DQfBkI0pv9Kyva4LbESNc0HZKWExedw9pzGyi8tS7qo0Sw8xm1
	k46RJU+pa7f5ogg2py+5AAB5FHvigIK/4MY/eGmpxcZbVdrb0zFewtrTuDcPwrbnUmpEAxxIfNd
	J1/qa+RWj8glneCnWcvXRRvQfhndv2j05APXSEAjdskR1qc0tyN8ZnHCyUlYQoS6G3iTwvE6nrq
	SeoMZDNV7jlEbHP1poPc322SC51FLLxUOGbh0iWHRB15+46VGjbhdiIqZWi4qH6H4XZQCbVYCen
	+7RZZTV88QO4=
X-Received: by 2002:a05:600c:1f87:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49fc56ae924mr86459395e9.9.1789828515746;
        Sat, 19 Sep 2026 07:35:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc59286b6sm114282115e9.4.2026.09.19.07.35.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 07:35:14 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nick Terrell <terrelln@fb.com>,
	David Sterba <dsterba@suse.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] lib: zstd: Fix dictionary lifetime and parameter documentation
Date: Sat, 19 Sep 2026 16:35:03 +0200
Message-Id: <20260919143504.69254-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The by-reference dictionary constructors say the dictionary buffer should
be freed before the dictionary object is destroyed. Both wrappers use
ZSTD_dlm_byRef, which requires the buffer to outlive the dictionary object.

Their comments also describe load-method and content-type arguments that
the wrappers hard-code, and omit the compression parameters argument.
The context and decompression dictionary destructors have mismatched
parameter names. The new allocator and dictionary typedefs are also
incorrectly documented as structures.

Document the buffer lifetime, typedefs and parameters the wrappers accept.

Fixes: 4fc4187984e5 ("lib: zstd: export API needed for dictionary support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/zstd.h | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/include/linux/zstd.h b/include/linux/zstd.h
index 2f2a3c8b8a33..4f0e2890a5bd 100644
--- a/include/linux/zstd.h
+++ b/include/linux/zstd.h
@@ -85,18 +85,18 @@ int zstd_max_clevel(void);
 int zstd_default_clevel(void);
 
 /**
- * struct zstd_custom_mem - custom memory allocation
+ * typedef zstd_custom_mem - custom memory allocation
  */
 typedef ZSTD_customMem zstd_custom_mem;
 
 /**
- * struct zstd_dict_load_method - Dictionary load method.
+ * typedef zstd_dict_load_method - Dictionary load method.
  * See zstd_lib.h.
  */
 typedef ZSTD_dictLoadMethod_e zstd_dict_load_method;
 
 /**
- * struct zstd_dict_content_type - Dictionary context type.
+ * typedef zstd_dict_content_type - Dictionary content type.
  * See zstd_lib.h.
  */
 typedef ZSTD_dictContentType_e zstd_dict_content_type;
@@ -251,14 +251,14 @@ zstd_cctx *zstd_create_cctx_advanced(zstd_custom_mem custom_mem);
 
 /**
  * zstd_free_cctx() - Free compression context
- * @cdict:        Pointer to compression context.
+ * @cctx:         Pointer to compression context.
  *
  * Return:        Always 0.
  */
 size_t zstd_free_cctx(zstd_cctx* cctx);
 
 /**
- * struct zstd_cdict - Compression dictionary.
+ * typedef zstd_cdict - Compression dictionary.
  * See zstd_lib.h.
  */
 typedef ZSTD_CDict zstd_cdict;
@@ -267,12 +267,11 @@ typedef ZSTD_CDict zstd_cdict;
  * zstd_create_cdict_byreference() - Create compression dictionary
  * @dict:              Pointer to dictionary buffer.
  * @dict_size:         Size of the dictionary buffer.
- * @dict_load_method:  Dictionary load method.
- * @dict_content_type: Dictionary content type.
- * @custom_mem:        Memory allocator.
+ * @cparams:          Compression parameters.
+ * @custom_mem:       Memory allocator.
  *
- * Note, this uses @dict by reference (ZSTD_dlm_byRef), so it should be
- * free before zstd_cdict is destroyed.
+ * This uses @dict by reference. The buffer must remain accessible and
+ * unmodified until the returned zstd_cdict is destroyed.
  *
  * Return:             NULL on error, pointer to compression dictionary
  *                     otherwise.
@@ -347,7 +346,7 @@ size_t zstd_decompress_dctx(zstd_dctx *dctx, void *dst, size_t dst_capacity,
 	const void *src, size_t src_size);
 
 /**
- * struct zstd_ddict - Decompression dictionary.
+ * typedef zstd_ddict - Decompression dictionary.
  * See zstd_lib.h.
  */
 typedef ZSTD_DDict zstd_ddict;
@@ -356,12 +355,10 @@ typedef ZSTD_DDict zstd_ddict;
  * zstd_create_ddict_byreference() - Create decompression dictionary
  * @dict:              Pointer to dictionary buffer.
  * @dict_size:         Size of the dictionary buffer.
- * @dict_load_method:  Dictionary load method.
- * @dict_content_type: Dictionary content type.
- * @custom_mem:        Memory allocator.
+ * @custom_mem:       Memory allocator.
  *
- * Note, this uses @dict by reference (ZSTD_dlm_byRef), so it should be
- * free before zstd_ddict is destroyed.
+ * This uses @dict by reference. The buffer must remain accessible and
+ * unmodified until the returned zstd_ddict is destroyed.
  *
  * Return:             NULL on error, pointer to decompression dictionary
  *                     otherwise.
@@ -370,7 +367,7 @@ zstd_ddict *zstd_create_ddict_byreference(const void *dict, size_t dict_size,
 					  zstd_custom_mem custom_mem);
 /**
  * zstd_free_ddict() - Free decompression dictionary
- * @dict:         Pointer to the dictionary.
+ * @ddict:        Pointer to the dictionary.
  *
  * Return:        Always 0.
  */

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)


