Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD4385D73
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636580; cv=none; b=ZeafQvh9wVC1Pfl9U/wJ2Z9TpWai4nLyyfrQ821jZlIzZ9qR48kZ++Rpy/K+o24Ysu2MLwtvuz90pdtj8GbaEqcNa1vLKLqDZQgkQSnhxcvEZx3NSs9WUHPNrjo08dVq3AcGQzrzH3DJh4N8D396sa/1jzYK93AhwC9HkZ/FI7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636580; c=relaxed/simple;
	bh=8esYEZkIe+Tjv36ZQUEPVrhruri5XusPSN98UIo4ElE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c970tw/qblrygcGDLiBkVutV3MP8RSBkGhYgL++9tlG1LPSH9h74OGW2BVvVua2NhaqZEn0ai1NSaX3zdEgHQtfevoCFUkTWwUyCazG5U9S96oZ/KEW3+pErlUvq3tYICRMP7U1FQnpW/PkAOflmIWvguhT9kZ3CRZs3RrTCvSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7PK5jLI; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7PK5jLI"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-866e57f63a3so24679717b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636577; x=1789241377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJEd3o+MfF+3c6Iaxbld+SzKi1izIALp+L59edshcBc=;
        b=O7PK5jLIhdgSKF9lDI1PjJbgfnu6fi4npBoEqUowPmLvpTi7cpAVJfXCOI2SeEzUyk
         g7b1HhMhVJD67figH6LCE2NXD94QuLg7uBsRPryzGrJwvORxZz0q52fduWaZULNl8Zh9
         +MHrvDsp5oJV5oXo9nwMmcPYK9w6wENnIRUfiIxuOAttPb1LFDDiPdm1d523+8SSZbxP
         l3ckWVQ5vOLa1q7Yb7usb7nWbhBybMragaCWYXAtpwwAOELmvkFWSHm2fuHNMVPpxqJN
         fwff8FQa49t0pxNF/7qJcKuvvUoX3Px8IrKbqqBDu1tszYDL8oNg81CWBz2X3ZMpg36b
         E7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636577; x=1789241377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJEd3o+MfF+3c6Iaxbld+SzKi1izIALp+L59edshcBc=;
        b=exDLQDVUJtL4dWuDXAl1ZdBLLSGWxUAjmHOXueoiR2OsTQMuyFsALsD9R94TLV+Yj5
         9IfSiX7xg3lBjtPx/Oppu8gburorg4SifSRjBn6qNiYPZO9+bLw1R7NiC5+om969rJcn
         nhZsI+Rv6mOPaUiabzyg0WK9bDQ2+pkrGAleB2H2fFoBAfVyKA4ILZptXRAMwFU+CJx7
         74z26TT1td5dDp9MgJpcDLf7C18vSn20Zu6HeznbM+0s5BRJ9JP0QpZcTXDNBqntNtIg
         ziNVtMu1PmXuuC5cG+pBtNeeoKSMx5Tzjht7Ck9XpbDJlPDxcIkOPuptt14hlK7FHVZN
         hQwQ==
X-Forwarded-Encrypted: i=1; AKwUvByyFdtnjuv0aZh0CgNfGaz7FmCnkHRh5GxAks2E2w6K2zB93i5dZe/Ar4ayrK6lYD8a8SVHVdcP78N05qo=@vger.kernel.org
X-Gm-Message-State: AFuF++kjQniY7Xb47ZVnCQoyV5mA1ksFNVYNRcOiVg5p4DykaNnQTyuf
	aGUxA3I5bA5UEi1v85Bpze9dN2txX40dHJhPihR3gq9zEp6FNsh/tUGo
X-Gm-Gg: AYBFou3TdtJ0VUU56WOKOWjPbCh+09Q/J/6qPW1bKvmigXfzETArtYpLt64DsKSjmHY
	i7WHZeluKElXGIyQ+CkY0qm093tYHTydRK+rxf78L2/YZnedOxIshjgZ74+Lc63s8SZOLoi1IA5
	Y6oWSyLuiYVzIShX6kLPxIXq9zeOftN2e02+aJB6QvaSYtbi7BoCWqJZQBF2QQnAdoeaufc6ceC
	JFLEqAq/yBVxO2kEh9BeDkZN31fQGxyatQdbhqY0+a/FuiTYSvioHQ1at+a0jtIiUxU8OoSMNoS
	HSZTJjRh0TBLjXB0YwZMFnou3PdlVmjq3nKnBvqevHTGZUx29Sxfu8O0cnOdtLE3FzjHtgnGdZG
	rcavLZMbtcDRgdkdQH2FT8Q8MNsW92qv6HcJltkX9i75aQwtaep0UCSs9B2tVa4Lxu022t1x6h2
	pQedC1GlXYGoENdhZT2MzCal9/1CKLGGvcnbBpZfunIyJ6nYpL4qyJUpTwIBpDfG4ceV48QUg=
X-Received: by 2002:a05:690c:67c4:b0:861:d407:2a9b with SMTP id 00721157ae682-87126aa7740mr61255647b3.22.1788636576921;
        Sat, 05 Sep 2026 12:29:36 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493155d3sm43365667b3.16.2026.09.05.12.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:35 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:26 -0400
Subject: [PATCH v2 05/22] alpha: select EDAC_SUPPORT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-5-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=935; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=8esYEZkIe+Tjv36ZQUEPVrhruri5XusPSN98UIo4ElE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7+eK1+opjzK4fI89cM/8yT+TRl65fHx35cPjfNk
 FP8Jkd/e8dHFgYxLoaZYooscesVWWa17Vjqc1r6F8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Zwhk6BjFQ+T0GDQyi4tLU4t00wqKHPLySxJLMvPzivXyC1LzCtIL9NIy00oyMvKLilOBRujlpZa
 Yujq6GRkamFg6Wpg5WTiamjg7Oxk6uTk6Ors6GVmamxg4WzqauFqaM3BxCsBc42PK8N8zL0tlYk
 y/lapHtVFdzpLrl7s2CeUvuMnEIG6Qcv0UzyVGhg2ye3MfHnmkWbpuCu+jFS6nZgn1zhDPNCnkq
 uzu4xcwZQAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The EDAC core builds and works on Alpha; it only needs the architecture
to declare support.  There is no Alpha memory controller driver yet, but
the core is what a future driver, or the existing machine check error
decoding in err_ev6.c and err_ev7.c, would report through.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index f6d1d2469677..032c23f979c4 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -32,6 +32,7 @@ config ALPHA
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select AUDIT_ARCH
+	select EDAC_SUPPORT
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_SMP_IDLE_THREAD
 	select HAS_IOPORT

-- 
2.54.0

