Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45D448CE6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110298; cv=none; b=frwhxZICoU4vhRP5DLvEmeeyTbMeWq5XeXo0BehLxNO6x3RNJ0jeuf4yRB4s9oQe/xtSMykD+3k0IxImutSIGfLUEVFlUPgT0q+MzSFcZbSmtVDEshcW9n3pvyDKMouCV7/7TI7onp1rNZdH+kbKiiCaEyVSSxc6famzyPly2iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110298; c=relaxed/simple;
	bh=NWJPLpCZognzsVXmj/PrtbyOlS3EXHPUrnjM2brVRys=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FN1r5ot8h6nYyZfTglzjMKF8K/NjZbRKg/tRFw/Zc3pK0vlEBM6CFntPuzvMv1D7nQHQuyz75JKVPImtvrFmAEEtTABW8TFm54uXeWTSnH9diDaClYb+zFbC94KhoMBpe/0bpfDcRbuPP/gOVvPR8F1AMq/T3zh0SSXpeEUltEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iCImII61; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iCImII61"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1383284a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110288; x=1789715088; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2c83p3gxBI5qDHT/7+/z6hzYG3hJ3PLILSJpMJ3biiw=;
        b=iCImII6153OkEOiBwQVFOsA/mTdshmfLFDANy1kOsGdRGBUdyOCd3/WOhTgJ+wiwRM
         x+7Dm6V6jCpeV480GI3xqiAY2QMzNZ9C9lMO2thLWlw5pxNgbykW/b9zomoH1kSKHYGX
         aoUbuZU0qJ6CTupRpoLBWxTq3yFMSwPrMm4oaLmwu9yS6lwQntH3FwNEfmBLi9uTFgxl
         MBuHZ8o8C6IgqfLXEKacbrpGJvOv2oR8u7mCKO1Wv8KHg8yjJ+jtSgmCqkiRtmCJ9DnO
         hrgbsyIpbbkktB83mRZPbXC5Dly39rpg31gsTSqGaL9kgyar9VgXe1iv0MOz1DiWvUhw
         RAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110288; x=1789715088;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2c83p3gxBI5qDHT/7+/z6hzYG3hJ3PLILSJpMJ3biiw=;
        b=p7p0TvV0CqUoKfET8hh/cPfy3qL3DWdXL/3gGlsHcZW3RI5mKr5Sy0lvTKrlMEjBOy
         /G6iDJVNCkgsAdnAaotfCKxq8FxAfKyGnor7eF5uDtdxDxDVIY6dBdSahz32gQ1tGgJB
         byn5QZPeGAFe03o9LGgNIsAzfjPVDR/4fFjSfAUdCALwFOoT+eE6+qvH0TM4duV6GMLX
         OQ3k3lE4Wz738xMNeCn1GowICgrXYgVNEtenmypW1kGCbw7U9/J1moyPWvYb00yH/LQL
         ORUf/ym3lhw6bTBu4zBcFwlV8cuTwahMXnobliEgHsBbh/mY7Lo7TddXlaxMOLDQDMQ1
         sx0w==
X-Gm-Message-State: AFuF++nbSumOtsT5cknxPSVKjEbK/3GCBTln2jl1EruKWVUJdpeNKfgY
	8UguYmOWTnSzdhoX7xF0wOB7C/Qbc4zYTf9xt6TJc72f8MBxECdu318s3cRCdC7DpTlX9+F3vXz
	F8EXVUmX/9XGgXdMGVOHCohNiqu7fW+0DJIcwnISRsBnb09y9YVFDOCCVlaxlbDjLnmedKlPwDM
	o977+Mf1JhTJnGTxHoa0eLJG+MhqeUDs8OmF50YQ==
X-Received: from pljg1.prod.google.com ([2002:a17:902:fe01:b0:2dd:c00:e4ee])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35d2:b0:39d:8d38:8b04
 with SMTP id 98e67ed59e1d1-39d9bbea1d3mr4942848a91.1.1789110288072; Fri, 11
 Sep 2026 00:04:48 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:43 +0000
In-Reply-To: <20260911070346.801948-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911070346.801948-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-6-morbo@google.com>
Subject: [PATCH 5/7] riscv/word-at-a-time: Instrument load_unaligned_zeropad()
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Convert riscv to the arch_load_unaligned_zeropad() /
load_unaligned_zeropad() split introduced for x86 earlier in this
series, so KASAN/KCSAN also see reads through load_unaligned_zeropad()
on this architecture.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/riscv/include/asm/word-at-a-time.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 3802cda71ab7..a4294b50c918 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -56,7 +56,7 @@ static inline unsigned long find_zero(unsigned long mask)
  * and the next page not being mapped, take the exception and
  * return zeroes in the non-existing part.
  */
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static inline unsigned long arch_load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
@@ -71,6 +71,8 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 	return ret;
 }
 
+#include <asm-generic/word-at-a-time-instrumented.h>
+
 #endif	/* CONFIG_DCACHE_WORD_ACCESS */
 
 #endif /* _ASM_RISCV_WORD_AT_A_TIME_H */
-- 
2.47.3

