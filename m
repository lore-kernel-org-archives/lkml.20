Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C39398911
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636591; cv=none; b=m6/zXE7DDZHI4gqTgU1M18nDgBZ14fYQgNdaYOBUBWzLZXp5pLGs385oxGWcqEBguaqmXl9xtJu2MC4JQvPJizPJxfjlMfDw7146FPTRK+fJAQbtIe4IprtV1frNqPiNTLaNY/TuVzNyTKaZVXlIaCaI4xbck+SHDJNBWS5d2cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636591; c=relaxed/simple;
	bh=GKGjYrVosAl5c7N4rjHl4rltayCdrMJHLpxI6DNWuZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XrYwwzUHJ2/OjX8SUjIP4OxYdbIX8scG9IdmRW2cyN+1DofvtXSwCWRKLJII+/9710wpk8iV6q83S5PFCRv60aGXfONQBQiCqLLYWdVxNafRBFQKuqX5V++YXdPZOl0fljG46liONGKhIk9+Tjb6UGZqvcguJ47QyRFOU9FkLLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nErSWUL5; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nErSWUL5"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-86c0e4dd49cso26759117b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636586; x=1789241386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXGXWpOil8xNaQD6Nl3nnrNjZuDIZru4bxQ6/BRDmjk=;
        b=nErSWUL5RzYexI5/qPb3WCueeBXzt7Ojf1646QBj2KerGQ5sSzOQgvEdCoJdqXRptw
         QvYMfeJ75UmCnCCy+UalSBMUibWCFcAQwnUpsEAVO6e1gZjPI3kQ3+Lg35NREhRrMC5j
         LnDXSEVebxND+0qvwiX5NVtUKaHESPjHxZPETxsURVk1e1GhmPk2IJUL7goA3JeAwvmk
         OQLacQhKDSs68N7D6ldgvZY5wFVXE3+rJswXQfmVDboldKf/OwzZIUoWzL/o88ZdpWpP
         Bad5HVs7HQM3p0rRVaP+F88O+9jnnOhq+vwkpPXlJGULwz5KZKu8G8rq39kXsKDqSFAA
         zNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636586; x=1789241386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXGXWpOil8xNaQD6Nl3nnrNjZuDIZru4bxQ6/BRDmjk=;
        b=gBE0xTfGoyOFJ2R0t4Ua30didoRQXT3PUxcU3JGN1NPf53DVRKnh6aHpyNq6mK3zZm
         SZtmpWzxx9puii71ybw44OksQjy6eZ2oz14F5d/MoaF/BT/uUIQqHMpX4cr+DzFfov/C
         NJEi9MeSHgW8H8wVxGy1IG5R3Ct9ILjrI6BBjCc5007KUS3wHb6MxHGoaY09miV9QZeo
         wGHesPiUEIZYqrm1R0tPYqxdidA6homNlL89cS/icFruH/VfSzeBjvpqgFgBdItRL5j+
         w+IUHg45tfm2feVCgpAtqICod5XZxj5TRLAXuZL/MfE5YS+f4cbEIRubQBbGT2kSLY4t
         uDOA==
X-Forwarded-Encrypted: i=1; AKwUvBwaesJdL1KYXoIyy7wJcWfpZC39do5D+/c+hRLq6P9IKQ/NowrFaefWIn+mr5lJPREjw/AHlZ8S9N2D6UY=@vger.kernel.org
X-Gm-Message-State: AFuF++nkZCqJRb/GUi4Edi6Yp735RkjEj+xyfY4FWalBIYZJnazpqbnH
	ZP9eQgY+2laVMUbZvaqSCVdRxYPqxReElTmrqYr7GLozd4dUTlKPB2Nw
X-Gm-Gg: AYBFou00p3bObIOjtMVeJlZ4ZJZa4xnFq44fD6kF/nddzHtT5obAioYjdJmriQyF9jC
	kW86tMFSMjLvGRacpAnncEANTXs+VDpOMgfOJlB8jHrZenWl7ClpVOQ07WiHPyiOXKu1U4iY/Uy
	QLbqJTuku8R5RGmKQ4eLQZm9yR/uOyHqc2khxqTKlu+Lld8NA4hb5Cxvm136tqN5Wt+w9cB0lfa
	hXOGDuV5y9ODqJlhBfS4tuN2AJLl2xgaMBqJTI4FzLhqdNu17HjRTH1wlh2Vpk0wNX546/VtAJK
	dxI1mWHy3W7N0aTX/0BRCaO2EjdePj+AIf3aqf/t1HVzjRMYGfoNjHaCZAZj0kXQZucPhkucei9
	2PVpnjnW7ARuEiFvFwK6oOI1YrioxlrX/VY8pVfJvBgdLkYTGr5NKzRPFj6fU3v7LJXjMSCrX5q
	1cM6lsKZsV+dCYYM04J1Wcp4pVSDaYfRYUIBeP68Z11XmzPW22Yp8N6u32ZTrV
X-Received: by 2002:a53:a44c:0:b0:66f:c1bc:402b with SMTP id 956f58d0204a3-66fc1bc4611mr1775506d50.88.1788636586262;
        Sat, 05 Sep 2026 12:29:46 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48ee9easm4992362d50.8.2026.09.05.12.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:45 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:30 -0400
Subject: [PATCH v2 09/22] alpha: select HAVE_ARCH_COMPILER_H
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-9-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=GKGjYrVosAl5c7N4rjHl4rltayCdrMJHLpxI6DNWuZg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7uFtls6qke2vrIfPmWN8ZVnWcajaytNTbduO/Kz
 Wen/syr4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK65lsTI8JJzi5huLt
 PNazfce4QPrHLtD++cwra/l0fAt+aF0k/Rl4wMXdftRap1mK/W32vX/3rv54VnPK9+aPpnNxxz+
 Bp+6HInGwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha already provides asm/compiler.h (wrapping uapi/asm/compiler.h)
which defines architecture-specific compiler intrinsics like
__kernel_cmpbge, __kernel_cttz, __kernel_ctlz, and __kernel_ctpop.

Selecting HAVE_ARCH_COMPILER_H causes linux/compiler_types.h to include
asm/compiler.h, making these definitions available consistently.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index bed3f1c8d9d2..237ef0c214dd 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -21,6 +21,7 @@ config ALPHA
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
+	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_PAGE_SIZE_8KB

-- 
2.54.0

