Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677402;
	b=cFAEBuuCFPvK69Mw+UXjL/tUEBAuYWnvEwsrQHwAGTyn6rqDTRPcMwcDW8tqES/xVMzj
	 zBZojL4OxbD1HQ0HFD0T5AWmvl2LWTWk1eLJXaZGuD7tt1TFaxo83NAfTz/m4/3nIzcoq
	 v5pCyf0CR+2KIvS2DOTXVrT6CRVKvbKLGPCnHuhKta64XiUiAbOsViyDmT5P2j4i0mtuz
	 WzzK+j+h0qbkVBkkzO5GbHZwVn0Jxgx2fXRpd4RxPS/LvG7SaY5u5CrBp1QPAT/VN+ykK
	 ihkB9mT59LXEhGOE9SjBxCoAMCAikB/51A7xAImGqfxRu/Jhu0XTkuhZTNrtUMrfi6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Te+t7OtGxT0dPdL9u2tghkY5k5mawz+59vJIbdstxc=;
	b=4Qhek8163bguq6KmY8QFxKa2bM5T9EZJDxWPoeq/h93BH4l3MvaWnDNzH4CZe54uLSjH
	 4hJiPyAW+mStP+uc1OpHynPA3Z60fj0kD99BzOQOJep5JT0P22zl+3p/y/8SkDp9fdJjy
	 VD9SrS6J5lwwx3UprLc/xrEO/VJcw724yICbaeW7sEwiVZhTH2ewqrJDJkuoF55CQz/Rs
	 1DvfZbLkBeNJRc0L1jPAcfR/DrGoKer3HLlJMCgh3NakLg9f52iv/RtgMJEAOzps522CA
	 r+Rbh/2B6P68GYrHngzJKrbyiv3wil5roxADK/y6dxtrld2Vr3VXIR6dPT4J3RrdFMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKidUnyD;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2795606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2795606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mKidUnyD
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so2805440c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677401; x=1795282201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Te+t7OtGxT0dPdL9u2tghkY5k5mawz+59vJIbdstxc=;
        b=mKidUnyDCwgB/q6+u/Hv+BjH6rf9bG5oW08mT1BNrbqA/7zvkvy+GztAJnHKnrLfXT
         pxi8SlCj15xaSSGwkNiPoJ4jGU0LAi81S0o9nZs6DGh2Nnc/H0A9s1j3q1jOiV9nXyP/
         jukIPufne7Bq4y2Gnw4Opk+sxL+Bn85iuuxvrKLBZRg0yER4xPHNoe7xoNRQe/Ent/bn
         NcgBXcCedRGxvN74l91qih2+REOAj7QMPk44/BT6/rpDmHIv6Sr63p+jGsztJ+31Xwfr
         MGQCfb2jJAzVAQfJqS+V8npBjWO/P5ZGZu+gts4av8cOwI7sahey0Gwl/HkdYAh4Sd7/
         AfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677401; x=1795282201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Te+t7OtGxT0dPdL9u2tghkY5k5mawz+59vJIbdstxc=;
        b=LiXIE3X70Gyg9AJWuWtCBFLDb9efoKw77gTufnEXXd66WgP8UcxFAaNjAcSorSa9UJ
         aAS3BibtIu0IHZmiOq+WPGB9r5ESi9xqY/ukoLMFydi9ngh4wA+UeTAnhHk6oaBqo3zM
         97o4lLKxEQDPGgLHPBhknQkusLe7i3kb4lkO2gL48gKIyTIJwKjXyQjGu91CpIgdZxCO
         0N6vLQqCNx+cTUcPWfEa2VIh1g7XXOV9H3qxcOfj3T5SvzyIwS2etQPufBca3v+5zOth
         rvd8I7qA8Eb5Km4P+Aznth77Gb57idB1kmC+9jSGikZbSyPGaN5EWs67DuXZE9jdOGvO
         ABMw==
X-Forwarded-Encrypted: i=1; AL+hErGuVqvw3AZJB0EoPfngB1ucl70owFW9L+7oZT3QVlq2E7HdZH6dZXlRQewxRrvRmAz45C38ytLyaIuC8ho=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iKbp8MPUL5coU269oGrR0bQCj9lz8Q6xiMjaqra2dMqLzWdzd
	pt1j6RmHhs5kvEjjKCz1mGGwdVH6XSbs+mXEWyGjGW/K8MPof2MCfmYN
X-Gm-Gg: AYBFou06sKchjT+nRO3w1ROTWzntQSFccfVVaa/iuteulpBaC1+H+aQlgtWSfHyCmc3
	9I+mTbDKrBb1qXbKPpuBqh5UGoiHJ8ukly9pvnMdnzBXw605kCGl80vr+AY0iot1z3LpnZ8mVZQ
	zjZlp3AlMukqGxueX72N5MuqACJCsjcSuFG0bNYSorV8F95QMV6D8e2pEGdQptsvF8oPPJ+e+Bg
	nVjhhUsjJbLDMRUEzVNEnekwPU2oxdyPpEEf3KijTgGy71MjvKSo45j2uRTHV4u0ElTctd9D2Ez
	OGSCxg4HJyMsQwKsUD56DPwyR3Ev5Fmh4PKz3gRYruVx891qLnig3rXChsRvlp/VsRnuuN3yABM
	HXFQsbhilDUMQVwV7ckA6lFqpmB/OzH+vgATbK1+/dh1PRNePlE1OBpU1Tm1feSYPgiF8KgjaTZ
	pTOQ+OhTvy2pbRn1uON/SqO5wBC+fFMJvkTSQNpXfFCjYkqbuxaLk6POpAB1Fy8gPMeFiCKydQf
	ekXGiQWbgR8WEVPoNJvm9d50+FO+r7lqKlg4aL7kB7joweOLWs/GgpOrRzgQUQ7B7ig+4Q//uZI
	fFabzvFUOmwfPwT224FkD4pOsVeiTA==
X-Received: by 2002:a05:7022:28a:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1b5030e3824mr5168117c88.30.1794677400642;
        Sat, 14 Nov 2026 09:30:00 -0800 (PST)
Received: from gentoo ([49.204.145.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm27319086c88.3.2026.11.14.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:30:00 -0800 (PST)
From: Shreesh Adiga <16567adigashreesh@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Demian Shulhan <demyansh@gmail.com>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] lib/crc: arm64: Add NEON PMULL+EOR3 crc64_nvme implementation
Date: Sat, 14 Nov 2026 22:59:51 +0530
Message-ID: <20261114172955.1598929-1-16567adigashreesh@gmail.com>
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
Changes in v2:
  Improved the 4x to 1x reduction by using x^255 and x^319 x2 reduction.
  Added static keys for the CPU feature checks instead of regular
  branches.

 lib/crc/arm64/crc64.h | 24 +++++++++++--
 lib/crc/crc64-neon.c  | 83 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+), 3 deletions(-)

diff --git a/lib/crc/arm64/crc64.h b/lib/crc/arm64/crc64.h
index c7a69e1f3d8f..e5be0ef21140 100644
--- a/lib/crc/arm64/crc64.h
+++ b/lib/crc/arm64/crc64.h
@@ -9,20 +9,38 @@
 #include <linux/sizes.h>
 
 u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
+u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len);
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_eor3);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
 
 #define crc64_be_arch crc64_be_generic
 
 static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
 {
-	if (len >= 128 && cpu_have_named_feature(PMULL) &&
+	if (len >= 128 && static_branch_likely(&have_pmull) &&
 	    likely(may_use_simd())) {
 		size_t chunk = len & ~15;
 
-		scoped_ksimd()
-			crc = crc64_nvme_neon(crc, p, chunk);
+		scoped_ksimd() {
+			if (static_branch_likely(&have_eor3))
+				crc = crc64_nvme_neon_pmull_eor3(crc, p, chunk);
+			else
+				crc = crc64_nvme_neon(crc, p, chunk);
+		}
 
 		p += chunk;
 		len &= 15;
 	}
 	return crc64_nvme_generic(crc, p, len);
 }
+
+#define crc64_mod_init_arch crc64_mod_init_arch
+static void crc64_mod_init_arch(void)
+{
+	if (cpu_have_named_feature(PMULL)) {
+		static_branch_enable(&have_pmull);
+		if (cpu_have_named_feature(SHA3))
+			static_branch_enable(&have_eor3);
+	}
+}
diff --git a/lib/crc/crc64-neon.c b/lib/crc/crc64-neon.c
index 4753fb94a4be..767e55edc0e0 100644
--- a/lib/crc/crc64-neon.c
+++ b/lib/crc/crc64-neon.c
@@ -10,6 +10,17 @@
 
 u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
 
+#ifdef CONFIG_ARM64
+u64 crc64_nvme_neon_pmull_eor3(u64 crc, const u8 *p, size_t len);
+
+/* x^575 mod G, x^511 mod G */
+static const u64 fold_consts_4x_val[2] = { 0x0c32cdb31e18a84aULL,
+					   0x62242240ace5045aULL };
+/* x^319 mod G, x^255 mod G */
+static const u64 fold_consts_2x_val[2] = { 0xb0bc2e589204f500ULL,
+					   0xe1e0bb9d45d7a44cULL };
+#endif
+
 /* x^191 mod G, x^127 mod G */
 static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
 					0x21e9761e252621acULL };
@@ -45,3 +56,75 @@ u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
 
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
+	uint64x2_t fold_consts_2x = vld1q_u64(fold_consts_2x_val);
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
+	v0 = fold_single_round(v0, v2, fold_consts_2x);
+	v1 = fold_single_round(v1, v3, fold_consts_2x);
+	v0 = fold_single_round(v0, v1, fold_consts);
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

