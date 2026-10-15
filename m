Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4C8456E12
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792044500; cv=none; b=dM7EAvZAmMlLp///twgokQF6HmmFxQ2ti0sy+ER0wIBc/Pl0ANaOL2u5fkPcVbKsJ3tP93LSOvfKvPr04BbbzywuYhhSu9+BZJ+k9amSPkr7Qd2fzpiLLpSl3JZBBtYDo6O3ptLkJgbtw4xxQJQ0IsldG/XnAD9GawYOglZxIbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792044500; c=relaxed/simple;
	bh=RDED+xrQBca1/3MmXcs2TcIEH8iJuK4NfEdEoWTNNlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GguF2+gCq5+pxRmUsF6yyRmOQPEPjvkP8y85UOmFsY3kRMuE2IFmMAW9R2iPkCM21I0scrlphCZccefRSbuhwBY7Xh+9cUBRj/badHuTtnajUT2GpfiK+pZCsl/KjJJnRF/B+Qc3k9IwlTAtO3bhU35jvTAnvylQe70/TszgRt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eX33QCkX; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eX33QCkX"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so2382059eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792044495; x=1792649295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1AS+wTxF11oi0v83b28ju7JnKilpZEhA4IWHhJUMOY=;
        b=eX33QCkXenNIg58mC6O8RWJ4wMVmwSbNsh4Qd3WcnOVEDMF7D31hsay9K1Q01ulAv4
         rf3zt3wSVHv2dMh0CunbuZDO1XtI0sTciR9n8sey/JS4fwG5iFmMWvkL7FO4oHi4TXeg
         MFa+b6zrk9u17yJ4MgR70ScoPko6BGLuinB9KaH5OGwC+et2RnAVkYPPyaORgifqwAci
         TQdFWYsqS1vnX2EpWsQ/7YWT2NbSyFiggtlvxc8h1me0oEdZ0aOA0nxsIcJ1C3RYZv4f
         p6VkAIjpx2Nktm3spzyLoeGtjd3TrD6rwRdQra5v//x1UIeAIjq7ZPxG2JugZx/iGinh
         yivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792044495; x=1792649295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1AS+wTxF11oi0v83b28ju7JnKilpZEhA4IWHhJUMOY=;
        b=ZVWm7sgwy/1RqaE7EfZ15LTmd1ZMSfqYL6y482bDfmb7VwMnluUpuWoWM59D2a3kux
         7QQDTj7J6zqBNOFUSiyq0N38MetBH1ExBrShBGvM8cozRN6mgDRQTREfBXMKmZP/FcyR
         OI6GOWmlSgCGCdJDN0YWuVLJ0etvOKPbuGCEiggRd4gUEmlJ7IMMOElaKRz7AXR606Hd
         pSfCCFLHnByBJs0F7h3aRqKi9JkMWxPPYbRj03D4V/J/hlWQPcZJ9mJTuUJMnfKYH08F
         PwJnTuh8wZThQnrbsUfk7d1AIbmi1hsFF8hr4lyX4CmdZw2kbtx8aLBBhGKF/Pub1iUv
         Xh1g==
X-Forwarded-Encrypted: i=1; AKwUvBz7v4o+c8fqhRaHHCom4jjA1cjdtSfoWeOs4T+SQE3tKdx1ocQ6fjxfQ2ouetRKrNyquADSo10lfGHbgsU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXzgiofjvZVYi3pJTiDKSEVhfWxlejf85uLE+kVxIhL9BlfeY5
	XHt4vmxBraFyHEX3VqasyRPr/LHm3OzWRHejmamZ7YB0M7K30VCAPboD
X-Gm-Gg: AYBFou238nYQpdvB2BUeLEAa2bPgAJ1Ndte8xKdcSHp0saxMGI8atFL/2FxY5OKSfts
	/ueRpJADfxCA+Xji+k8b/A6WvJ4oeosI6G602E740aRj9OcvkwJAfpQbPPaLCfJkaYaSENCIKKh
	ZyJGqyVJxOsTSHlCBRgeccZWcF5IWWVsUIVkyvty8T6dU0Z+LtjNfrE45wOYRVxnAWRprIQU2vJ
	ZFLGbrJ0ZrQ0qy6onOzPquDWqpWYQDrTXQgxXxMMXgsN49x7QtYgp1yhjRNvDbUHZffTLEU6btD
	sjBiFUFNnoqO4BeTg7OrvHBjUERW28laRYJhia+oWTs9Ma/KMO7nKGmnnt/lG9eXNiTLyUR9O4T
	LSDMvQXEXuPGj8cEe1YkzzRoqDFdXgcFYJgZOKxpKJdIfxAllY9KcWnljzHlF/L4m9l7SX1eZ39
	vJV1OvWTkr0fdJHaYDma3nvNHNtvhOc/t0mpyz3Kempxw5NIizgHF3FHMlhNCB3w1+OVxH5hAW4
	mwbidOAp1UL8xE=
X-Received: by 2002:a05:7301:4546:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-3537e033fd4mr22242143eec.9.1792044495111;
        Wed, 14 Oct 2026 23:08:15 -0700 (PDT)
Received: from kernel ([45.251.35.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm63101219eec.21.2026.10.14.23.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:08:14 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: herbert@gondor.apana.org.au,
	ebiggers@kernel.org,
	ardb@kernel.org
Cc: Jason@zx2c4.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH v2] lib/crypto: md5: remove unused header
Date: Thu, 15 Oct 2026 11:38:06 +0530
Message-ID: <20261015060806.5377-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `<linux/unaligned.h>` header is included but never actually used.
The code handles memory accesses using direct pointer casts and
functions like 'cpu_to_le64()' instead of the unaligned helpers.

Remove this unused header to avoid false dependencies.

Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v2:
- Drop the addition of bitops.h as it is already included by kernel.h.

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

