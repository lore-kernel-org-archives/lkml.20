Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF1F397329
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118172; cv=none; b=gXyyl5MCdrUbd4adveL/tHj/uwYjvSLLyqY45sn8pgZImKZCrKQMkoIUwyGLdSrpEdhU/hhVLQaq9TcSESmIsTYGX2rDZgjgjFKuMpCfHeFu/58odOro317S7sIY+Mc4ePZrbn0v5w+8JFRsZaT2X9mdkQYsLhQFHeb1MATgyO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118172; c=relaxed/simple;
	bh=GD75konp9X8hKjfWp4g1B9w5G0DNq/ZqywkiaURwnfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2dypWwtug6Fpzj1VJ+Q57yMy0Lef+pTDRQaSAD3002CHmn4hwf6rvpnGF0QZ0q2ijXOMBhwGbkthEcsLYu86zcZmfzUZDiwtyJS0693PiaeZj9+syUVelHVF4R/lFdmpL5+jQyjAhQ40etyTLvGEmf58EtbFzQuFJJq3O0GzjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4Iaqa6V; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4Iaqa6V"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15943c9c005so2994087c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792118169; x=1792722969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vSsCec48AEXEIxa63eY/u58uAdNJ00/at9BOY534QM=;
        b=G4Iaqa6Vo8HZ68mDM+EkJfLngohVxaVabDPU0rH1fjT6JAvS0t4UwOIcMSuQYrANPS
         koiIeKLvGVKjgV3/t6cK9Z5GS1cJgl19pR+Qm1kkDqOlMyd4p0d2QvJF4A/7i9d/+zvH
         OCJifDQJHT6m/dU03rM/lZig9frQAGZWfI4MRvvTPXFVfwoPrg/Coh8BXkqcN4i6PN3r
         yzJtUgI/UFOC2eTOUZgx5bRPjq+5bPz/Dcjoqw6foSCmm1jv3WN475QMWF0cjR8slxi7
         R4OQRXOdV6CCBz74zr5RkH1HlmUnRcvjf/KXY/gB5ZbWAS0L7FmN/xhJuax2IguiKc/2
         zsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792118169; x=1792722969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vSsCec48AEXEIxa63eY/u58uAdNJ00/at9BOY534QM=;
        b=zrVxmeZ9jXt3q79IX/+B/lQXZYmMVzuO+mdFA75LllsdFZOlR0H/TyFSkPuHoEDb3l
         +dGQQouU4I4FyYN1GgwgoVgm2KW7nmQBO5DyJkC2akK7GAe8xPlnQ5mn3M0J6IILzkK2
         qygfZ6KfmxTGWsV1ow2YtDdgr39H8G5E00ylLCEVyNrxpDqkYKuVAEnR6jQJY3S7wIMx
         yu2cTOTO3CIdPiLkcR63RB71RB82izwQfWtDlgVrhjeIKpU4HUaGAGidjgImHa2UdbBU
         1mzC5HFA46o0D6AmMjNB52KHDgzs5llpkrB6sy3ZWtD+YmD2NORouW4b+RrZSq2kqwh9
         olng==
X-Forwarded-Encrypted: i=1; AKwUvBz6z8hXWGfr3qEz/Ub+4q1M5TzcNHOQbCyEJFPaswfWorkclPTJsq0zown3jCJ2Fz4s5NeXdWQAA9319No=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+p2+sqQI1vZrjm0RZfbtMlPUzwIuqzrHrcFHAKf2iieguKm/O
	gb83EZauq0wCQ9uun1aOX/8eN1j3CfqyPvrsY/SxQqHEJoqckiBxycEj
X-Gm-Gg: AYBFou3FhM35rQmBwqUPo591Z43qrqdc9C3gzW/k8z0oSXgE/xb7M6UCTvEOIAo+dy+
	SXrDWHe6I38Zd8JZ1ajEWkFFMYHc7A/mofbpIlvUJvLHZvXSQdA4RDFtIQspNMBge++NSNFMcca
	BjOUJFiHPuf+85WHgCo/3uw4hlQiJ8WAuY9TUMOWme8JpaqqrONvOu8yJfXcIXCOvSoH3iyUUOZ
	hmrQPBgreWYiWB/4wn6Uwz1TGmb4m+hjMCE51G0lFgkxER05ywUuATlf7hRQCOgpTbIFTHzKfro
	Xm+3qOL5Y+mNBR1UpINIhz4NQ/gNOmc6On6HeIStHk5Jtj47V1njrgOM7aarG3uwNscMbazy13g
	o4xp0b3CddoT0s4gTxPl5hc6c9ZLHjgdOe+mWXfTpWaFpOpqAyzg9ckRuCyhAuoM90bm+7xho4F
	xva/j/IaxyI1c8emawkO3xiB6hXPqX2yh6LnL412tSjP5xvOMCoIwfzO4RS3l1IxAX6h3VhPApJ
	FtgEQiTbYmiilk=
X-Received: by 2002:a05:7022:b0d4:b0:161:3942:c07f with SMTP id a92af1059eb24-16a660d44f5mr31483316c88.47.1792118169433;
        Thu, 15 Oct 2026 19:36:09 -0700 (PDT)
Received: from kernel ([45.251.35.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm1509214c88.22.2026.10.15.19.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:36:08 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: ebiggers@kernel.org,
	ardb@kernel.org,
	herbert@gondor.apana.org.au
Cc: Jason@zx2c4.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH v3] lib/crypto: md5: remove unused header
Date: Fri, 16 Oct 2026 08:05:57 +0530
Message-ID: <20261016023558.8797-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `<linux/unaligned.h>` header is included but never actually used.
The code handles memory accesses using memcpy() instead of the unaligned
helpers.

Remove this unused header to avoid false dependencies.

Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v3:
- Update the commit message to accurately describe memory accesses.

 lib/crypto/md5.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/crypto/md5.c b/lib/crypto/md5.c
index 3d2b017a0525..ded7ccd1a5fc 100644
--- a/lib/crypto/md5.c
+++ b/lib/crypto/md5.c
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
-#include <linux/unaligned.h>
 #include <linux/wordpart.h>
 
 static const struct md5_block_state md5_iv = {
-- 
2.53.0

