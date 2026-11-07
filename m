Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065859;
	b=iBq3xM3R62FRO9fghckbQIMnE2cPQXljjgAg66tooleyz2XbNXbHkgaVpVIT87ri72xM
	 IIzxi7zD0EP6LHLcL6Z3gOcPxEQEPSKADA8cxuw7Dkhy+Dn3nBMoz917DNF/P0eAeo0d/
	 xhrWCe4PO46DInIhEIiOgKknKDgNQI+gIo9GuZ7VDUqv2jP5rURLkV0n8TxpXbhsHX9Nj
	 JKFTnoveA+xMvI0cXz30l92CgkdKrGeqogMuaUUqQ+qLJvewW3TPYJot3+6KL/qDRCNrv
	 a7cGF3zbdgvZglfjmQn76P0rv20IaPHrtxybkmfpiRik0tQuelhYQtrCu0f0vlPJ3lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jOV6lTw8YySq2i4oC3X//ATDtyU8VTfMlCzGQrdwAeA=;
	b=H76bNUA/K66cydHZJxbK2+l+FQnyw70Htekw+ASLi5khCD15tDIeYB8JUFfdB5zG9QIU
	 4VIfc5ji8h6q8p8Xncita0VFz1V9eMV+Zh7dpPycd16w4uNr623Et6tk1UA5Ivw9j6LtL
	 4iKKy6lhYDlDg3U5G/pZQ0BbBHIlUbsp1JbA6lTkh/orXLJTzbte9jVHp47UJJKZTZMs4
	 sHKJhT3UsQ3z97qc8/O5qtK9Bn+GT3S9Z31Z9gNSazgG6dD80f5tS10uiu9xIeIlCT6bs
	 DFexueC8wryvucR9TRg6ywPNovbb/tVoCCjiu1LtSbY8A5oVMqsL71iCHoDICUMynKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ThHBsIZ5;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542260A3803
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B542260A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ThHBsIZ5
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b708b1c25cso348818a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065857; x=1794670657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jOV6lTw8YySq2i4oC3X//ATDtyU8VTfMlCzGQrdwAeA=;
        b=ThHBsIZ5oxOaDS0WvLvVGuU7xFli/Ss86QtPETWjWkGmT+M3RzZFJob4n/m1r1tklp
         ZO1lBS2TpfU60F4nHWTnq9B6OC8YgSbNsCdyfeC0wjk8h2XJ6/fazii6tDJLblNjcLIi
         UKYb8UCLnbsBR9m+kcPQZenQOWLu09LZ2rwg14rjjFLK1QrRSvbZppKI7h56bBpbhDdm
         5S0hjwtGkg6OQYHE2OKpUw7linQLHltrnxkMULYE71kqltKtwkuDRfe8cmHj9hdBUgtJ
         +IksG5HFSWu5T8lQ6PbNy+G1DV7IehsoMdclKuJdMrjhHHm/dPIICf5b3F/C46GvxZbS
         NMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065857; x=1794670657;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOV6lTw8YySq2i4oC3X//ATDtyU8VTfMlCzGQrdwAeA=;
        b=bKkCZHYEOzJeShENSSmepDFZ1n4IG3cfg+LVJ26JXxv7WNkDr281b4nwOCYvuZU/jX
         R0zLVeKky6UQFFhuDsYOFXrFZb3Iq/2mDAzoPXVdX8gtVmhaM69rb+h1qsS3/tnwO34I
         n0hJ41AR1tjdYCFC6QFi1mptME7bgoIrEwH8uM3bo7/83/tQ2VaNM0u21XLnO1JcmCSx
         51r3TCFV2BESWPFEQiaaP+SpcwvHCd1VN2kUtzgJlecpJDmucl0Z1UEpXV8l3rBv/4KF
         xAPbeGYQvGAGXaY9F2X0/603CveJdDTJ+1d/5NYeL5+Gd+4LzHT+4+C6Dh2ldMFWuy30
         b7eA==
X-Forwarded-Encrypted: i=1; AL+hErFCQ8AV8p3fF/HxtOyX2nZOjnTRYhPJp4OyGImvHUb2mC45revL1wlkd9hqzOCoqDEEi+z8W4rfdq9U5Jg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PZ5igi2DnNEnE95b8u7kY+mBzmS18Sw7a0JbRaz3BOcEjZzrV
	8tCHaAaMS8n8nxtmSF4OWcAdBVegvhQXKCBTCMxdymi/wT2FTucrqb9oSjvhVRbgJ/0Uu60Lgf2
	FqQ==
X-Received: from eddq13.prod.google.com ([2002:a05:6402:518d:b0:6b6:fcaf:dc3a])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1ec4:b0:6b4:206d:724b
 with SMTP id 4fb4d7f45d1cf-6b5977d7e53mr4186090a12.7.1794065856781; Sat, 07
 Nov 2026 07:37:36 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:27 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-21-d84ea5f30f94@google.com>
Subject: [PATCH 21/24] arm64: Introduce mte_tag[_and_zero]_range()
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Carve the KASAN-agnostic MTE logic out of the KASAN arch function, so
that it can be reused without needing to depend on a KASAN header.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h | 57 ++++------------------------------=
----
 arch/arm64/include/asm/mte.h       | 47 +++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 66d72d0d3c43..81a8cf3b9a95 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -9,7 +9,6 @@
 #include <linux/const.h>
 #include <linux/kasan-tags.h>
=20
-#include <asm/cputype.h>
 #include <asm/mte-def.h>
=20
 #define __KASAN_TAG_MTE_MASK		GENMASK(MTE_TAG_SIZE - 1, 0)
@@ -32,6 +31,7 @@
 #include <linux/bitfield.h>
 #include <linux/types.h>
=20
+#include <asm/mte.h>
 #include <asm/sysreg.h>
=20
 #define KASAN_TAG_MTE_MASK		GENMASK_U8(MTE_TAG_SIZE - 1, 0)
@@ -81,58 +81,13 @@ static inline void *mte_set_random_tag(const void *addr=
)
 	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
 }
=20
-/*
- * Assign allocation tags for a region of memory based on the pointer tag.
- * Note: The address must be non-NULL and MTE_GRANULE_SIZE aligned and
- * size must be MTE_GRANULE_SIZE aligned.
- */
 static inline void mte_set_mem_tag_range(void *addr, size_t size, u8 tag,
-					 bool init)
-{
-	u64 curr, mask, dczid, dczid_bs, dczid_dzp, end1, end2, end3;
-
-	/* Read DC G(Z)VA block size from the system register. */
-	dczid =3D read_cpuid(DCZID_EL0);
-	dczid_bs =3D 4ul << (dczid & 0xf);
-	dczid_dzp =3D (dczid >> 4) & 1;
-
-	curr =3D (u64)mte_tagged(addr, kasan_tag_to_mte(tag));
-	mask =3D dczid_bs - 1;
-	/* STG/STZG up to the end of the first block. */
-	end1 =3D curr | mask;
-	end3 =3D curr + size;
-	/* DC GVA / GZVA in [end1, end2) */
-	end2 =3D end3 & ~mask;
-
-	/*
-	 * The following code uses STG on the first DC GVA block even if the
-	 * start address is aligned - it appears to be faster than an alignment
-	 * check + conditional branch. Also, if the range size is at least 2 DC
-	 * GVA blocks, the first two loops can use post-condition to save one
-	 * branch each.
-	 */
-#define SET_MEMTAG_RANGE(stg_post, dc_gva)		\
-	do {						\
-		if (!dczid_dzp && size >=3D 2 * dczid_bs) {\
-			do {				\
-				curr =3D stg_post(curr);	\
-			} while (curr < end1);		\
-							\
-			do {				\
-				dc_gva(curr);		\
-				curr +=3D dczid_bs;	\
-			} while (curr < end2);		\
-		}					\
-							\
-		while (curr < end3)			\
-			curr =3D stg_post(curr);		\
-	} while (0)
-
-	if (init)
-		SET_MEMTAG_RANGE(__stzg_post, __dc_gzva);
+					 bool zero)
+{
+	if (zero)
+		mte_tag_and_zero_range(addr, size, kasan_tag_to_mte(tag));
 	else
-		SET_MEMTAG_RANGE(__stg_post, __dc_gva);
-#undef SET_MEMTAG_RANGE
+		mte_tag_range(addr, size, kasan_tag_to_mte(tag));
 }
=20
 void mte_enable_kernel_sync(void);
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 8826d64c8e33..9ba215b2b0fd 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -18,6 +18,7 @@
=20
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
+#include <asm/cputype.h>
 #include <asm/pgtable-types.h>
 #include <asm/sysreg.h>
=20
@@ -101,6 +102,52 @@ static inline bool task_uses_sync_mte_faults(struct ta=
sk_struct *task)
 	return task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT);
 }
=20
+/*
+ * Assign allocation tags for a region of memory (and optionally zero it).
+ * Note: The address must be non-NULL and MTE_GRANULE_SIZE aligned and
+ * size must be MTE_GRANULE_SIZE aligned.
+ */
+#define __mte_tag_range(addr, size, tag, stg_post, dc_gva)		\
+do {									\
+	u64 curr, mask, dczid, dczid_bs, dczid_dzp, end1, end2, end3;	\
+	/* Read DC G(Z)VA block size from the system register. */	\
+	dczid =3D read_cpuid(DCZID_EL0);					\
+	dczid_bs =3D 4ul << (dczid & 0xf);				\
+	dczid_dzp =3D (dczid >> 4) & 1;					\
+	curr =3D (u64)mte_tagged(addr, tag);				\
+	mask =3D dczid_bs - 1;						\
+	/* STG/STZG up to the end of the first block. */		\
+	end1 =3D curr | mask;						\
+	end3 =3D curr + size;						\
+	/* DC GVA / GZVA in [end1, end2) */				\
+	end2 =3D end3 & ~mask;						\
+	/* STG on first block is faster than alignment check + branch.*/\
+	if (!dczid_dzp && size >=3D 2 * dczid_bs) {			\
+		/* Post-condition saves one branch in each loop. */	\
+		do {							\
+			curr =3D stg_post(curr);				\
+		} while (curr < end1);					\
+									\
+		do {							\
+			dc_gva(curr);					\
+			curr +=3D dczid_bs;				\
+		} while (curr < end2);					\
+	}								\
+	while (curr < end3)						\
+		curr =3D stg_post(curr);					\
+} while (0)
+
+static inline void mte_tag_range(void *addr, size_t size, u8 tag)
+{
+	__mte_tag_range(addr, size, tag, __stg_post, __dc_gva);
+}
+
+static inline void mte_tag_and_zero_range(void *addr, size_t size, u8 tag)
+{
+	__mte_tag_range(addr, size, tag, __stzg_post, __dc_gzva);
+}
+#undef __mte_tag_range
+
 #ifdef CONFIG_ARM64_MTE
=20
 /* track which pages have valid allocation tags */

--=20
2.56.0.455.g6c5a503b38-goog

