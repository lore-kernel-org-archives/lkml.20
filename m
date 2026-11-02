Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586855;
	b=PW/HRh1KYU4bukyhNtXlzYHbdAQfYT19bhSf46Zipwn0Jj+l5w3m5M9JMmL7ndgQ/Nga
	 Rqc6GSYF3PUwjyMspbt7vrjw2GOBag2lgSjtZOMJCvVxJrhNOoNYJIoNzLxIefJ3sFVmL
	 chqFAG8xTR+c9S3b/kmDOQm1+KrRbEyTlyk+PCrtbSkPiEODpl1J02Un2OFILHxrU/7dx
	 vDT2uICLsu+en9gLxlkKkiA5v/w0Yd/qOHNagWL+HUpQSrayIxY/TupwImG/m+iX4kxNq
	 71ho/I8Oe5nmWfnQQOIMrerr19zlOtPgU9OV7T3c/gIot8Uxv1F/5K4DVAzHVX//3Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/FXLf+M9BaHu2TxcFoVVCnBDYHhNMW6Wb+4ihYKMxog=;
	b=cG/sidSwlFBeFdzb+8r4vES84ly74QTxzqVnJ+9PkN4O74uEHWuWjbAjCSYXpCceRFL1
	 6h1XSp2W1Owc2i8K6vUr1MT53a84qUYsaPhLX6tBHubOX8uvb6LEfuwClLR/jD0ypN4jA
	 D3XcIl7DiTV14kEtsMBM22mCI9GmvWrGVslTdXC64s178lfWT+8NmtLQ/fNHEwMO1x1cE
	 gPV/ZingGl2kLKipyYJcW5FUpSf16/xePHAawfb7qf4cIUsddCSFmuhISwVoXatk2A0cQ
	 ES2z7SQwb5PLc4JryyomqLrYljYzkySNz4EL3Qi/Yxn3BFYuom30bIvjDOQgvYdIPfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fb5Vsf28;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D6B606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D6B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fb5Vsf28
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a03834d8ffso3338091b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793586855; x=1794191655; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/FXLf+M9BaHu2TxcFoVVCnBDYHhNMW6Wb+4ihYKMxog=;
        b=fb5Vsf28iEf53nz0Hsm5LellK12as1AC6OkkxoWYtFq0TXZv0M+0aCqe5l/9YH6Big
         cSZEWXcnqtZQG5ODGYcbJTGhJISDto5wU0IQQ+8cJHqmHd6kk914a/jfEUmSNF5Xb2hY
         IGnSgbXR7aJtqX0LHzI1qodN5YxA3MoYrdaTYDisWc2a/qmmBMZgtAdM+56Tg3SUHA0K
         BLX+rRt51INYUJMQbqfhXBPMIlxKjBea/W488RIRMhAf6C092HB+ac4MVeqG08wsVPRH
         tC3WWuJm2CGfRYEnoVNSPrdMpsAYIxv0oFkk7kEDMVO67b1Cv1jmxxOrtt0XOhisMHi5
         6Y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586855; x=1794191655;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/FXLf+M9BaHu2TxcFoVVCnBDYHhNMW6Wb+4ihYKMxog=;
        b=O+rrihH+jYcTokl27qlt2MeTfF0Nqhg7doCl3N+kGsGbnOqWTdimCyYSkW3vDUwMgl
         HUjN8+Ddx/xv9xBBf09g2sHz4ioNoM06dWKfjqHjb77z3gH/l+SaAizIsmXSf2XbbgQa
         vxKGi121H8Lt/oMlDQD6UtVDv0j6RjJg/V+LkEo3LjXZR3Qr0tf52K7JloQFfzIm2zDK
         51O7fSQFZjC26yF+YXlaE2lG3UnYHKV1mDVe3bCmBUBTu8uKRXGrRXX8gQrhZDnCSlFe
         d8gk8mUg6YSPdoIZ43GrKy96bvZLvQLhI6lcK08XMvRyjqTHw6FdKNnb5RnR8o4vsrnh
         F+yg==
X-Gm-Message-State: AFq9FYI+uogmID2BUoTHQ/NZ0kDEDH08rFwWo7O5sZwtXRCbE61abi1y
	G3Xo+R5NDBuH1t8VOVe//uwcuOS6rFT+JeyKfmZaYEKImLfa8EhKO8PxgDWmOnsqgzljkiAwhOl
	SJ1orW99FJiozNlkvdKVO8Q==
X-Received: from pfbbu14.prod.google.com ([2002:a05:6a00:410e:b0:89e:861c:6b39])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:a103:b0:3e2:9126:6128 with SMTP id adf61e73a8af0-3e928784767mr5412874637.9.1793586854500;
 Sun, 01 Nov 2026 18:34:14 -0800 (PST)
Date: Mon,  2 Nov 2026 02:34:12 +0000
In-Reply-To: <20261030121633.258612-1-jenhaochen@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030121633.258612-1-jenhaochen@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102023412.701888-1-jenhaochen@google.com>
Subject: [PATCH v2] zstd: Use shift mask in BIT_getMiddleBits() on arm64
From: Jenhao Chen <jenhaochen@google.com>
To: Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, 
	Martin Liu <liumartin@google.com>, Ben Wei <benwei@google.com>, 
	Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

In ZSTD_decodeSequence(), ZSTD_updateFseStateWithDInfo() calls
BIT_readBits() -> BIT_lookBits() -> BIT_getMiddleBits() three times per
decoded sequence (for literal length, match length, and offset FSE
states). However, BIT_getMiddleBits() only enables the branchless
register shift-and-mask path on x86_64, falling back to a BIT_mask[]
lookup table load on arm64.

Enable the shift-and-mask path in BIT_getMiddleBits() on __aarch64__ so
the mask is computed directly in registers instead of loading from
BIT_mask[]. On arm64 at -O2, this eliminates three table loads per
decoded sequence, shrinks zstd decompression .text by 212 bytes, and
improves decompression throughput by 1-3%.

Signed-off-by: Jenhao Chen <jenhaochen@google.com>
---
Changes in v2:
- Drop the Makefile -O3 change, which triggered an undefined
  __divsi3_table reference in zstd_compress.ko on nios2-linux-gcc
  (reported by kernel test robot <lkp@intel.com>) and previously caused
  stack frame size warnings on parisc (commit 7416cdc9b9c1).
- Update the commit message with isolated -O2 numbers for the
  BIT_getMiddleBits() shift-mask change alone.
- Link to v1: https://lore.kernel.org/r/20261030121633.258612-1-jenhaochen@google.com/

 lib/zstd/common/bitstream.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/zstd/common/bitstream.h b/lib/zstd/common/bitstream.h
index 86439da0eea76..01e69ab7053b4 100644
--- a/lib/zstd/common/bitstream.h
+++ b/lib/zstd/common/bitstream.h
@@ -299,7 +299,7 @@ FORCE_INLINE_TEMPLATE BitContainerType BIT_getMiddleBits(BitContainerType bitCon
      * such cpus old (pre-Haswell, 2013) and their performance is not of that
      * importance.
      */
-#if defined(__x86_64__) || defined(_M_X64)
+#if defined(__x86_64__) || defined(_M_X64) || defined(__aarch64__)
     return (bitContainer >> (start & regMask)) & ((((U64)1) << nbBits) - 1);
 #else
     return (bitContainer >> (start & regMask)) & BIT_mask[nbBits];
-- 
2.56.0.317.g454f8302e1-goog
