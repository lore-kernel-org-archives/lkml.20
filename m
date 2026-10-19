Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440792;
	b=AhYeugktDSWoho4n4jex4uwlhIRuzHael6Kid15NfRxlX1Hm4fma6ewUwkG1MmEqS/aw
	 sfNF/xeDq8uZ6SUIADZ1/Dk649Ec68ezQEbTGL6P9+2j2ys7SMXxxNcZzinvzhhgmTgAR
	 OsinUUuI+Lqx+rl/JgJmpbnRpW4ebHTBgILk8OM9B15CWOKnkPT1yLDtVaSD9jKHuZ711
	 gNFdJITY8sliyyzyrzC1zA+6XIwOh9MEwKQCDw4y9ZUZ4jcFIoIRHvCUhZTGQInSNVfms
	 hSR0Fe1PvhTaWakxGKR+u+gog762z8M2Sec6QroCcibvYa/Lb+E9l97K66eZyLiAMmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=XlJfSKdFCH7ItGXZeKGbQccPhCIHUR7nxzGpcJ+bVqQ=;
	b=TEmgQDD18ad5rHeJf4RDD7CtoyA61escWQwxUksXCPDxcwUuVhlQviX25bGc3vYyNxr6
	 jz0LAffXKXPMiYyrCwQ2q72kHVLh6uoxfDEN21dGoj/Ka72auB+dRy/m/kOnb4i7aURks
	 Y4CuBs51MG76eYa9lS4/hVC+v+ttWIhxbKtm/+CL3iG/bEUCp79buPmliL0fbiAbCkzcd
	 MxRJfnUL7dYSQ8cFaT+V+lXoSZ/FO55abltHQ1pMpsIVJIHnbKLd5xLOknLVUV1rLFRK/
	 BDD9SM14XZH37YGlhDapbx1RkudMHlvv+6Z9UFmhJ3dJzUY8WNsNMajEWwm73WLV/Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="p/ObLeZK";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969FF606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969FF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=p/ObLeZK
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so6328755eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792440791; x=1793045591; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XlJfSKdFCH7ItGXZeKGbQccPhCIHUR7nxzGpcJ+bVqQ=;
        b=p/ObLeZKrxYpbcjCuw6oY4lpLyO1VfsS82Amrk8RUGRcDcsrGb9JwCPT2ZpercWwGq
         otcYgZ99vPuy08pictjjQ/W934IA7Qj2e7FV7JE10z0w+o13PJLp8i+pnUEKX/aV2ABQ
         7q0Pfqn12Gs/ePndUpjCqNPdshzPbxxpk/+UBViV0pmLjA8uFsXHkAU1kqrhlSqeZAop
         Aan04UXzYS8P5xkg/Dw/wM/kj5GWcVR7WfY3MiLk3v+Zbue/VrdMGwnqLWyIp/HCbNsC
         cT3n4Tq6hInSjy7tq+2qLhdTx3vQab27MPMPSvduSGlWWrWRVag+34d+hgZVwuvnZpOu
         PNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440791; x=1793045591;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlJfSKdFCH7ItGXZeKGbQccPhCIHUR7nxzGpcJ+bVqQ=;
        b=aUxQCbMzapM7qmMK+gVom+ca1DfJWx3AFBV9CaDHXLV7kAJzCxGOIoWlNbM3+KO/Iz
         COZ4cijVuBnhqzfeM+OxQqLZwkej82iUTxLfadfsa/tK8MnZDydkKP0+2cN/2rFsRXcg
         hXam94QanMqbzhRYVvl3EQgvMEV6ZFqemAFBfqcExaeOeC4zdzLRE/q2NOQMQr/dhQHU
         EWWaHRDWIfWJGAm2NdrKRqfvS9vQXxi1wpV2vAB2Tn7keXqXnrDSQ2S34Ay9wTnZ0ozW
         QmSvvVQiHBeWYuiNWPiLUqf1vpPzs4QC50caMC9BuyMLbJeNF7+PpTztNWVmSyIRVReW
         Rahg==
X-Forwarded-Encrypted: i=1; AKwUvBxl6MtwCVD8gyGSw3YaE8DiiQrSgElrvLSbnz+8p3UGCjUui1iQZvCRWsxpfOghdRetSRALZtX0kTHyQIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG4xQpJWC1TVph8RwoXeGv6z1/qcWQVLiIXchRTiqjQqxnFner
	E+UhSKLEbdftdEGEn6Che/2izN8YgpxyEfq562QXvM8pcBLed945s87Cq3hCfGZ2a+mkH3Rmxkd
	YtFl6/xs/7g==
X-Received: from dyrp21.prod.google.com ([2002:a05:693c:69d5:b0:35f:390d:248a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:87c2:10b0:34b:4b99:24ab
 with SMTP id 5a478bee46e88-361a1e501fbmr13784320eec.22.1792440790306; Mon, 19
 Oct 2026 13:13:10 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:12:56 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019201257.3805356-1-irogers@google.com>
Subject: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for ARMv5
From: Ian Rogers <irogers@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Christophe Leroy <chleroy@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Eric Biggers <ebiggers@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Ian Rogers <irogers@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit a339671db64b ("vdso: Switch get/put_unaligned() from packed struct
to memcpy()") switched __get_unaligned_t() and __put_unaligned_t() from
using a __packed struct to __builtin_memcpy() to avoid strict aliasing
undefined behavior.

On ARMv5 with GCC, __builtin_memcpy() may not be inlined and instead emit
a much slower out-of-line memcpy() call. Add CONFIG_VDSO_UNALIGNED_PACKED,
enabled on ARMv5 (CPU_32v5), to use the __packed struct implementation on
ARMv5 while keeping __builtin_memcpy() elsewhere.

Fixes: a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to memcpy()")
Reported-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Closes: https://lore.kernel.org/lkml/47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de/
Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/vdso/unaligned.h | 16 ++++++++++++++++
 lib/vdso/Kconfig         |  8 ++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/vdso/unaligned.h b/include/vdso/unaligned.h
index 9076483c9fbb..726fd15efc82 100644
--- a/include/vdso/unaligned.h
+++ b/include/vdso/unaligned.h
@@ -4,6 +4,20 @@
 
 #include <linux/compiler_types.h>
 
+#ifdef CONFIG_VDSO_UNALIGNED_PACKED
+
+#define __get_unaligned_t(type, ptr) ({							\
+	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
+	__get_pptr->x;									\
+})
+
+#define __put_unaligned_t(type, val, ptr) do {						\
+	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
+	__put_pptr->x = (val);								\
+} while (0)
+
+#else /* !CONFIG_VDSO_UNALIGNED_PACKED */
+
 /**
  * __get_unaligned_t - read an unaligned value from memory.
  * @type:	the type to load from the pointer.
@@ -41,4 +55,6 @@
 			 sizeof(__put_unaligned_val));			\
 } while (0)
 
+#endif /* CONFIG_VDSO_UNALIGNED_PACKED */
+
 #endif /* __VDSO_UNALIGNED_H */
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 597f5f0f9681..709eb193999f 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -23,3 +23,11 @@ config VDSO_GETRANDOM
 	select VDSO_DATASTORE
 	help
 	  Selected by architectures that support vDSO getrandom().
+
+config VDSO_UNALIGNED_PACKED
+	bool
+	default CPU_32v5
+	help
+	  Use packed structs rather than memcpy() in include/vdso/unaligned.h
+	  for unaligned memory accesses. Enabled on ARMv5 where GCC may emit
+	  out-of-line memcpy() calls instead of inlining byte accesses.
-- 
2.56.0.212.g129ede20d9-goog

