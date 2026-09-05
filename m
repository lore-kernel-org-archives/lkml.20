Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3266D38AC90
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636592; cv=none; b=PPgtETPffLmJfyLeFYr7+81LQKK3Mu4kQR5uCGtclXgVecGuOcwVm/HWrbJZX8QKdrkeX2m2dQYJRDSuiDLVsEoKXX1An9mgLU0Az7lKUWURexHDR5jE3Zx0SUobQV3F75wUpywulaZTHk3wd566hkjKEvfkuTELPPC3RlSoxoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636592; c=relaxed/simple;
	bh=lVWPvO4U0PzjUNH5kaTEpUlpvE87Z4wloLcJMNvypDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nNvpyj8KhhoC4zHhU9Z0k2zX0Vne6mK2D3fL8NPfpxybsodq7dHjY+xTox0fseEnUeKZEtTuicHlYMfk2oD8X8kM6GmUSZCnilH0fWYLfpEj8Kd4tpipvvVMEaTJ0i/0xjVf6RY66iREkGA1r4VvFn10DDTcbWTv7bDbl69EGcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqmU8tQ4; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqmU8tQ4"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-85a50f6a7f7so29606057b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636588; x=1789241388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DA+s/QyodZ5LzLfcrOq12dlBnw99myrSQbNtH+UZd9Y=;
        b=NqmU8tQ4PofGq4r5bXhBGRDJU4rBvD4X11KTb9znxIO5OyK6RHTWnkRbScmghawQeg
         pQh3ldPoshfa548E77BhrjCi03B97EdvdRsvzpbTRVx1iFCGHkQcgbQZWzg9Zu5Iw/dt
         DFo9u9xrR5RmtXqtMNYfCF8Z0FoQ0MA4sQw5lOq0+zTzOmi43tGt9zir2TeLqwXnDYsl
         C7Afs/k+TOXQm3qYOjNlbDc4uKtd2yfQrbuvl/8CURRUNE/uwR28MX0O6uhA6noD8sYQ
         I5qvaD+9rJix2E+ih+TL5tguBsNtta6cCwSFMpZIdn9Nh2pPTShAL4BI3Xe4AxMs3H1W
         yxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636588; x=1789241388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DA+s/QyodZ5LzLfcrOq12dlBnw99myrSQbNtH+UZd9Y=;
        b=K6qrfYk1BznNBrXiwR8qNQlTMsw+w9EhpE6WtxhpA0LdKgK6ydN2fFIxWh85aTZ0ET
         7UHLdd4LYPOhtrri5oSd7UigyeKPYo3lZ8yfzEYE3TaN6VoPwwjMuvHGuGopVS7qWwxF
         3NoZOjIidcKLILSQ/+WXfhQmpONncJgazihCBCcnPYsC8KLDz+OMHoaEbEjwXa0I5pFO
         5MykdVOm9oYosjRTA6f7uKmyFH3/qWkBso9uD4Ac6qVSlsf/WGiHt+r5j5t8g2sL7kbq
         4QK6gsRvAayvWegnMFfQ8LCou6WSbOVq06v2ZL4vyzCSpKBGvjulCWQQOxL/uz6qBnpU
         ocIw==
X-Forwarded-Encrypted: i=1; AKwUvByyQW/GvuXXVzrcjjWDn1HmaMlNSL8itZbCHJP4bod5ckyWKX6xnppszJN4hmcW6PVOI76zKqB/5DxvKgM=@vger.kernel.org
X-Gm-Message-State: AFuF++nh1MV5LYDFVVheIVA1WkJCwUfeLFb/QxZoXT65FuHvLFqBgXB1
	PWAAqAFst8j8OsJRMdKf1iud6RsHIXbvZrmhYKVLXbdzXGAr6O+uOK9g
X-Gm-Gg: AYBFou0JFxjdeA6uQJ21T4wzFCq/h2kkGOVJYHjBxYopT93eGd1ZShrVOy5OLNiDXIr
	U8y2G0U7aWE1o7TLOIhnyJJldggFblep9QmWb5RCIbj9L4XO5MRpM5YoeiidpwaoqnAsOu2GAhD
	HPynLcWWJSev1NEnjem9QPQzX+u0YCluNsFgV+/T6d0EnjTIQgSBrW0D8zF1cm1q0CfIok/q8Op
	r0aHvn6OLXk1myPvebiXCLfm6PdlnoFlaS5zZUuKdDPLUku7WBd+D18HgLjYnwS1BMIAL/Ogy/6
	khQ305pv1czrGHiFrugGzSgI6ZGdcZUs/adJ5oIgovAs6KtEUIgdA1HKLNG1vx6F5tDigNoX8mq
	dorrA7mIOCqT27LAZrC0PIhIgo+4KuSqZ1HZL5GE24QqfTFxl4qslg80OzFlTKP3zhKNhM4iEw0
	sCOx4RVr1mdQV6/pJkp21X7l1ciC7Tx5YXvJZPFYkjCUjUrSCP9rOxoHByKnxP
X-Received: by 2002:a05:690e:b4c:b0:66f:9cdc:2b09 with SMTP id 956f58d0204a3-66fb5ab575emr4278563d50.47.1788636588384;
        Sat, 05 Sep 2026 12:29:48 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48ee9easm4992431d50.8.2026.09.05.12.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:46 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:31 -0400
Subject: [PATCH v2 10/22] alpha: select
 ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-10-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=lVWPvO4U0PzjUNH5kaTEpUlpvE87Z4wloLcJMNvypDE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E72ChM4a7tjV7n9C2Wll7PuLNjEbPTkS+LHy+In3
 4eFbN20t+MjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCuKfdjZNg++Uq7IJ
 +0QtGSyhc3Jn8IOXPqKfsLiYT+L6pr31xpTM1nZJi+2JDPrXXGUavglK1Ja5e3bSgOvlj51OJwW
 NrHa/N5WXkA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha has a clean split between user and kernel address spaces: user
space occupies 0x0000000000000000-0x000003ffffffffff (TASK_SIZE), while
kernel space uses KSEG and vmalloc regions near the top of the 64-bit
address space. These are strictly non-overlapping.

This enables optimizations in BPF and tracing that can skip address
range checks when user and kernel pointers are distinguishable by
address alone.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 237ef0c214dd..8f97d6e22b28 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -9,6 +9,7 @@ config ALPHA
 	select ARCH_HAS_DMA_OPS if PCI
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL
+	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO

-- 
2.54.0

