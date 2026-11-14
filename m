Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657476;
	b=BCF00QJTmA/pKITIrdE2jmUqIBDyMQd8nGnbCgX0vcQ2YQ/2uC1sHkVPiexSCa8s8gtt
	 aBYkYSAFD2vP8voUsu/tuULAPvOfAzzX4t5vR8cUYK8CLPhhvhPXzgQvf+HF3N13FcKMT
	 5J4d94AiUqK86hO+tzynNibeR9XZia2tepFrS9vpFy2UvHtW1pv+8nkm94agGtT7M41oV
	 QrlNKLZETT6WBe9a7iuvqeVDvGZOqT8/l92dcprvI3CAos1Z3KNf3HnFBGTdflh/pN10a
	 VGxbbZFQ/56MLSHYXqfq1pIKKGIeLoBr1B7PHuZKGGC7dFsyWDaNHBBoIL6IwzWYREQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TBc3FAJWiEoUIU9L+YPFWNtaRtKrauEafmCqOuSZDio=;
	b=Wh/iPG3gxi3KA02iAhc8wTTgXFhEiQG0noZt0YmJvuUcNJlca1L5n/XGMLejxa279TJR
	 J2ptCqQkkG5ixY69R/leeoBRxbt7dEweG+G9gP74xMVR97+qHQ5rhjsgdHMeCE4i8qb5l
	 IQpjHok8ExjG47SuSTP/J9rQ3tGXZqAgnMU2HYPH8nUyAyvzgWbk92tWy7nbDaWosgvHE
	 vBOnjv3h7O21Fn/bD5Iwup3rj3ZGgfkC/8zB2Xw6dXGvkt4THOCCI1ewIz5L47iDtknba
	 J6B/BQKXaswBsreSJrarCDOaespbSjaqrPQ+leh0r3H8NrN/JUYJ4PDJNKLygobEvWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sZTh8j8t;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D276606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D276606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sZTh8j8t
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37000e7234bso3255966eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657475; x=1795262275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBc3FAJWiEoUIU9L+YPFWNtaRtKrauEafmCqOuSZDio=;
        b=sZTh8j8t2qsr0POjskK9rv4f36J6KGFonk3SGZ9eG3HpY6QHjz1XfueYesojQtYQLl
         LJjbAtZ9wmPGsOqcwmNFdolbsWxSSk19cWnKgfU1px5PGp+uX1Yj13Oxb3Y/hix8+8vG
         hVLErqgLFROIX7X3biqa6z5+4xiqGMaTbC+tk5B69VSRuIVqmU8QCbKo3rShTr20EoUr
         yv1JW7N1asiL40WgtNiKfozH5xojJ83TO2OXXfCx3LGIdZ1zHLmOwMITScmlasGUmmXd
         3MuzmfkDjK3X8MlHMpW/puxbe5oGsbd1X9hik6AvzNHlcHk5RkhzKhZneqpFA0frdCpx
         WZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657475; x=1795262275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBc3FAJWiEoUIU9L+YPFWNtaRtKrauEafmCqOuSZDio=;
        b=oKcOSU424NKNaciMjEKzeYsfdHTUmdQQqW5hVHSuXZl5ATZmASuCSpiEolLLTIj/Uy
         z8xu2c6QiJGhTZa4LYqVkgrP3P3MSGBM+lF3qR0KBgTDp5dKOrH5930LfyKG9QyWsy+f
         Ij6ZtCpAgtZ/oKLoepjAoEaIHXYCm/3+S2X52kKaTbf4f1TGUByJVVDGNmfX+gpCnBn/
         IFms1Epfqf1yzKn3O6eI6ROLHtAAd4RdX6VN2gxDJscYWEhb2WNBEfGMqshna9cmg2cz
         we1jg7hV/CkMnuHKfZXUZ54cUxKf5qxhNjgN9Xz00MioQmOExvrSAOBgIbWb2uR0ApdF
         cryg==
X-Forwarded-Encrypted: i=1; AL+hErHcKni6u/p+C9LEJlrnBsJahod8r9kfH5D01kuI13RGVqNqJeMztbJ9PVEnVTisTkgPfOOxMj+1iLtfOHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1zHdINt/X1uLNGx4bD24+dECyOzwqeFZllQtMNNa5uO62OXHD
	aMWxEAF0ElbcS+5IS5aSwfh0goLx+5e2JXjRxsasTMtRsQD5lpYAJ9eI
X-Gm-Gg: AYBFou0/fWmiDebumpI3bqCes8br5WIZlxLK8yJY70vLLGUaNkXoXKhIrjO1VDsoAXf
	7Vj4r/h6xHDvcfSaONS7+PnEsxbCV5txaRT4AgXBoNRwWfgm4rfUsUA+Z4fJR3djRXuiSi3gPd5
	m6FgGj2Q3HRne52EYI+y26x3/tVCtcd9hrujO6klsVriH5hgMfhomTWdOid+w2TQ4vkfo+R+gOJ
	DKieNNg24LgOVCxWYbIdkYiqH1oiwj8KGJyNVzUSxsk7oK/DSok0R2YPnBWPnLZ0hPa71tYb+l8
	HeAbKq42+Qvqzb4dTf/XX7ynXb8+VrbQq/Y9W/mLD83iljnQKbVHiBKGOCX16yWD5goXFHCVspG
	F/FR/vCr9iCB1HHfoB6r/3rfjiLBKxA9PhmmxvyKANONu4m2QehIcJqkcqdq2DVD5VEcb9Zd547
	InFQdHyNH8sTTiKI2oYuBVxMkvVRM/iiTCBv2ICp5MBpwVIKc+Rk+H9At2G7WQeZ8H0eczic1y5
	X/6PQWb9pr7FSEliD/hrgleCDmCOxX64IHVHum6JUemWd5oFGlnrbT4UMjAm3nNBzbQL5XJFNop
	urU9XxhDW7+r04JcIAm53/bvaMkOYw==
X-Received: by 2002:a05:693c:3e0a:b0:36b:d3dd:2e9d with SMTP id 5a478bee46e88-37966192e10mr4859293eec.19.1794657475379;
        Sat, 14 Nov 2026 03:57:55 -0800 (PST)
Received: from gentoo ([49.204.145.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378c2fesm16275945eec.1.2026.11.14.03.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:57:54 -0800 (PST)
From: Shreesh Adiga <16567adigashreesh@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Demian Shulhan <demyansh@gmail.com>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lib/crc: arm64: Add NEON PMULL+EOR3 crc64_nvme implementation
Date: Sat, 14 Nov 2026 17:27:45 +0530
Message-ID: <20261114115749.1061233-1-16567adigashreesh@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Add a 4x-folding implementation for CPUs with FEAT_SHA3 which benefits
newer ARMv9 CPUs like Cortex-X925.
Usage of EOR3 from SHA3 extension improves performance by 20% compared
to the regular PMULL without EOR3 on Cortex-X925 measure in userspace
application via libbenchmark for 512 byte input size.
Measured about 3x speedup for 512 byte input compared with the existing
NEON single fold implementation on Cortex-X925 in userspace.

Signed-off-by: Shreesh Adiga <16567adigashreesh@gmail.com>
---
 lib/crc/arm64/crc64.h |  6 +++-
 lib/crc/crc64-neon.c  | 79 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/lib/crc/arm64/crc64.h b/lib/crc/arm64/crc64.h
index c7a69e1f3d8f..003fd452aca3 100644
--- a/lib/crc/arm64/crc64.h
+++ b/lib/crc/arm64/crc64.h
@@ -9,6 +9,7 @@
 #include <linux/sizes.h>
 
 u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
+u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len);
 
 #define crc64_be_arch crc64_be_generic
 
@@ -19,7 +20,10 @@ static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
 		size_t chunk = len & ~15;
 
 		scoped_ksimd()
-			crc = crc64_nvme_neon(crc, p, chunk);
+			if (cpu_have_named_feature(SHA3))
+				crc = crc64_nvme_neon_pmull_eor3(crc, p, chunk);
+			else
+				crc = crc64_nvme_neon(crc, p, chunk);
 
 		p += chunk;
 		len &= 15;
diff --git a/lib/crc/crc64-neon.c b/lib/crc/crc64-neon.c
index 4753fb94a4be..6c589b23ed06 100644
--- a/lib/crc/crc64-neon.c
+++ b/lib/crc/crc64-neon.c
@@ -10,6 +10,14 @@
 
 u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
 
+#ifdef CONFIG_ARM64
+u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len);
+
+/* x^575 mod G, x^511 mod G */
+static const u64 fold_consts_4x_val[2] = { 0x0c32cdb31e18a84aULL,
+					   0x62242240ace5045aULL };
+#endif
+
 /* x^191 mod G, x^127 mod G */
 static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
 					0x21e9761e252621acULL };
@@ -45,3 +53,74 @@ u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
 
 	return vgetq_lane_u64(v0, 1);
 }
+
+#ifdef CONFIG_ARM64
+#define SHA3_TARGET __attribute__((target("arch=armv8.2-a+crypto+sha3")))
+
+SHA3_TARGET
+static inline uint64x2_t fold_single_round(uint64x2_t fold,
+					   uint64x2_t temp,
+					   uint64x2_t consts)
+{
+	uint64x2_t temp1 = pmull64(consts, fold);
+	uint64x2_t temp2 = pmull64_high(consts, fold);
+
+	return veor3q_u64(temp, temp1, temp2);
+}
+
+SHA3_TARGET
+u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len)
+{
+	/* Assumes len >= 64. */
+	uint64x2_t fold_consts = vld1q_u64(fold_consts_val);
+	uint64x2_t fold_consts_4x = vld1q_u64(fold_consts_4x_val);
+	uint64x2_t v0 = { crc, 0 };
+	uint64x2_t zero = { };
+	uint64x2_t v1, v2, v3;
+
+	v0 ^= vreinterpretq_u64_u8(vld1q_u8(p));
+	v1  = vreinterpretq_u64_u8(vld1q_u8(p + 16));
+	v2  = vreinterpretq_u64_u8(vld1q_u8(p + 32));
+	v3  = vreinterpretq_u64_u8(vld1q_u8(p + 48));
+
+	p += 64;
+	len -= 64;
+	while (len >= 64) {
+		uint64x2_t t0 = vreinterpretq_u64_u8(vld1q_u8(p +  0));
+		uint64x2_t t1 = vreinterpretq_u64_u8(vld1q_u8(p + 16));
+		uint64x2_t t2 = vreinterpretq_u64_u8(vld1q_u8(p + 32));
+		uint64x2_t t3 = vreinterpretq_u64_u8(vld1q_u8(p + 48));
+
+		v0 = fold_single_round(v0, t0, fold_consts_4x);
+		v1 = fold_single_round(v1, t1, fold_consts_4x);
+		v2 = fold_single_round(v2, t2, fold_consts_4x);
+		v3 = fold_single_round(v3, t3, fold_consts_4x);
+		p += 64;
+		len -= 64;
+	}
+
+	v0 = fold_single_round(v0, v1, fold_consts);
+	v0 = fold_single_round(v0, v2, fold_consts);
+	v0 = fold_single_round(v0, v3, fold_consts);
+
+	while (len >= 16) {
+		uint64x2_t t0 = vreinterpretq_u64_u8(vld1q_u8(p));
+
+		v0 = fold_single_round(v0, t0, fold_consts);
+		p += 16;
+		len -= 16;
+	}
+
+	/* Multiply the 128-bit value by x^64 and reduce it back to 128 bits. */
+	v0 = vextq_u64(v0, zero, 1) ^ pmull64_hi_lo(fold_consts, v0);
+
+	/* Final Barrett reduction */
+	uint64x2_t bconsts = vld1q_u64(bconsts_val);
+	uint64x2_t final = pmull64(bconsts, v0);
+
+	v0 = veor3q_u64(v0, vextq_u64(zero, final, 1),
+			pmull64_hi_lo(bconsts, final));
+
+	return vgetq_lane_u64(v0, 1);
+}
+#endif
-- 
2.56.1

