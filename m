Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065863;
	b=WhqdORhpee7YeFBauaKymODiZyF1OYnt4YkUUKOErYZExZae/eJ8pz7H6LC44AfiOf4R
	 ec7ytQEOFDZCnw8PXNkQel3pACgASt2Pla14Yn8YmremNVtn+azAPmgzSMaVxOxilWQvd
	 ZVYwHyb199SUtdoamB1Ylmunf5NoM4iV+0yflDhTd/rfV6r6e4PFpVIqlb5SNeQoeAMNw
	 MtxDGD9CF2sYS4RCba1L7fdHi3z9SE8ckvb+LBiXIivLJTejAOZIWU/BfghjVip5cRMLv
	 DY17Yu1+zuM9qha2rK3RBBX4CquB8vQJ9I7kpBY8fSjp5vQ8lE/uGtU9Akptv45BRbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uQCqr85B7TpVTwUE8AIWjkQSCKDYHOd0Anwd+zR/j2g=;
	b=hs7FTx/yEPU462phHHrC9Z3rk23gWxAfyJEHMEQJVp09tzIpxuEw+8MBuMTngIySSDoU
	 7ix3eRlwR3bvMgE8AD2dVdhdBFrJq6WJulnQ+E5J51rBrOoQyLVKx3/kv9SOwLm99MOHz
	 9kaVRi6M1hdx+8wHv+jJ6uJqU6YzLzX1F5mYdGADpPfB4lQ4/vAaWLqOkqKPULI4ZekTG
	 edBpS3FbgzIkh5E8tX3TEBnW4ZpTy5C1oLuGb6qDbNV0OpUBzwjTGhNrQxqvwhU2I2nRc
	 WVvP5LnrcIz1/66fw/AzQxq1HvB4bUn4Xz+Iw9nhzyFAfEzOUsy8TI4tSEnfxRd4C1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pfMeum76;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE689606D833
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE689606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pfMeum76
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b70b9f6e0aso206075a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065861; x=1794670661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uQCqr85B7TpVTwUE8AIWjkQSCKDYHOd0Anwd+zR/j2g=;
        b=pfMeum76pgWjU5R5dNfhTYQtCdhuS5e37PuiazJDNYl2EnR692oCNWYikiirON8hFm
         s0EIoaSRiJy6eURGTFeIPu3fPlnVPhmGaDLaeMsI0OftzA2L5enep/4nYlMq8br8fNaP
         Ek7/9iV8gTkOZUmfWB3RkFO0Y4sQ5QargdwkOzZZbh5uspQada1RPZ8T72hEZYGljKC6
         Q2cmKdVxAWneaaXzgIf8mq03OcQUpyeo2YWc9oSoECbouPbG9ZR6cOamAnji0TRL1jcX
         KoDN9JpdKSHp0MEU2mLEKlmo/TII+SJDPmxwbhafj6Bd/OqpQrRW9/et3PMR/ptUYxeF
         BUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065861; x=1794670661;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQCqr85B7TpVTwUE8AIWjkQSCKDYHOd0Anwd+zR/j2g=;
        b=yhpeyxI2aq42KNvNOCJfsaCoRs2/pTfNB/JhNnaFMSEOa2PkIxU4byzptYnIbjdfYA
         8rmAxEbJiyPh8qZVCCpTx/QbPkUUgr7TVyeH7rLkE0w6l6u8Zr+eRhUCPIMOlWZmJwil
         xN5Itlup7erQ2amLiKgctJWyoBvw+DVExpJfniVkIzKzcGlm3alwYB5ww5sZghDU3HG/
         LAz0q4LiSmpYm4shpLiPLJZviSKZBSZ2AKW40lDn9F7ZIPwzFwRpdoNybVLODW3NI6RC
         WRKvuqUJB5Ugj20Jm5p/lMV9Xafjr/V5DAb/HP/Djxw5IuAvsD91pTkveHM/hjo9JQon
         bOlg==
X-Forwarded-Encrypted: i=1; AL+hErEEZ+e42lxTKq7AUtMm3x80R7Ouk65m+uxYDNio1I4qM4mOP5B2bxgprOF3w3RmvJj/n7ttIL+VZki1bTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9djGjpUpRzl5AYo3iUVdsxOPlZufPGXLsXb81aRmbujGBpx8oJ
	u6+ygDuqiKdd0eYagcWbBeJhMsVCtJQxEm9s2QVHGTwWb99JzttJxkw1PDlDbvh9cwoKvYNZqja
	B3Q==
X-Received: from edl18-n1.prod.google.com ([2002:a05:6402:4252:10b0:6b1:b9fe:f2a2])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:90d:b0:6b6:f3dd:bb86
 with SMTP id 4fb4d7f45d1cf-6b6f3ddbe74mr2222078a12.35.1794065860804; Sat, 07
 Nov 2026 07:37:40 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:30 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-24-d84ea5f30f94@google.com>
Subject: [PATCH 24/24] arm64: Introduce CONFIG_ARM64_MTE_KERNEL
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Add a dedicated Kconfig symbol to top off the first round of patches
decoupling MTE code from KASAN. Although the config isn't intended to be
used by anything other than KASAN_HW_TAGS today, it already provides a
clearer distinction between code that is architecturally required for
supporting MTE at EL1 (e.g. TCO management) and code that is specific to
KASAN (e.g. allocation alignment).

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/Kconfig           | 8 ++++++++
 arch/arm64/include/asm/mte.h | 2 +-
 arch/arm64/kernel/mte.c      | 4 ++--
 arch/arm64/lib/strlen.S      | 4 ++--
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..af5a7f5a0d94 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2255,6 +2255,7 @@ config ARM64_MTE
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_USES_PG_ARCH_2
 	select ARCH_USES_PG_ARCH_3
+	select ARM64_MTE_KERNEL if KASAN_HW_TAGS
 	help
 	  Memory Tagging (part of the ARMv8.5 Extensions) provides
 	  architectural support for run-time, always-on detection of
@@ -2275,6 +2276,13 @@ config ARM64_MTE
=20
 	  Documentation/arch/arm64/memory-tagging-extension.rst.
=20
+config ARM64_MTE_KERNEL
+	bool
+	depends on ARM64_MTE
+	help
+	  This option enables the support for the Memory Tagging
+	  Extension at EL1 (i.e. for kernelspace).
+
 endmenu # "ARMv8.5 architectural features"
=20
 menu "ARMv8.7 architectural features"
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 34d1438019ed..7a49729f6a48 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -34,7 +34,7 @@ void mte_invalidate_tags_area(int type);
 void *mte_allocate_tag_storage(void);
 void mte_free_tag_storage(char *storage);
=20
-#ifdef CONFIG_KASAN_HW_TAGS
+#ifdef CONFIG_ARM64_MTE_KERNEL
 DECLARE_STATIC_KEY_FALSE(mte_sync_or_asymm_mode);
 DECLARE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
=20
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index d072cb76ad05..888519e14a76 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -31,7 +31,7 @@
=20
 static DEFINE_PER_CPU_READ_MOSTLY(u64, mte_tcf_preferred);
=20
-#ifdef CONFIG_KASAN_HW_TAGS
+#ifdef CONFIG_ARM64_MTE_KERNEL
 /*
  * The asynchronous and asymmetric MTE modes have the same behavior for
  * store operations. This flag is set when either of these modes is enable=
d.
@@ -100,6 +100,7 @@ int memcmp_pages(struct page *page1, struct page *page2=
)
 	return ret;
 }
=20
+#ifdef CONFIG_ARM64_MTE_KERNEL
 static inline void __mte_enable_kernel(const char *mode, unsigned long tcf=
)
 {
 	/* Enable MTE Sync Mode for EL1. */
@@ -110,7 +111,6 @@ static inline void __mte_enable_kernel(const char *mode=
, unsigned long tcf)
 	pr_info_once("MTE: enabled in %s mode at EL1\n", mode);
 }
=20
-#ifdef CONFIG_KASAN_HW_TAGS
 void mte_enable_kernel_sync(void)
 {
 	/*
diff --git a/arch/arm64/lib/strlen.S b/arch/arm64/lib/strlen.S
index a8c49a3886f6..80557af775de 100644
--- a/arch/arm64/lib/strlen.S
+++ b/arch/arm64/lib/strlen.S
@@ -44,11 +44,11 @@
 #define REP8_80 0x8080808080808080
=20
 /*
- * When KASAN_HW_TAGS is in use, memory is checked at MTE_GRANULE_SIZE
+ * When ARM64_MTE_KERNEL is in use, memory is checked at MTE_GRANULE_SIZE
  * (16-byte) granularity, and we must ensure that no access straddles this
  * alignment boundary.
  */
-#ifdef CONFIG_KASAN_HW_TAGS
+#ifdef CONFIG_ARM64_MTE_KERNEL
 #define MIN_PAGE_SIZE MTE_GRANULE_SIZE
 #else
 #define MIN_PAGE_SIZE 4096

--=20
2.56.0.455.g6c5a503b38-goog

