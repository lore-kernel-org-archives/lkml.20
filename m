Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065841;
	b=uI0lUoq6LcEhWt9KYBXy3ORNfd0gn802CtY6mVb67fww7qPQkldC8BNZAPzz5QfFX01v
	 KQkk6S+2kQ1DjnCpHUB/7auj7AZs55EemtHuMlHjK9UZU+8AoXQUgEoCP14P4OvIKtGd/
	 J7bfqLZBScdOOGoFgNQ/GG331IKhZ4AezNE2Mmt+9jljFYnf2CmURpLIqqlHH9tSmD+V/
	 zTOylWCPvu3dzz9PeDsb+o7ZEWbc3euQf1wiLe9MI5h6iGYjRbhgcc4LuL1MjhInA7pKS
	 5ltf25UuBJV29I2OD+JxoBrMFk1gNryBUWcDTQ8XNFNDwvadIYn1vAOyu+f9HXYybog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=xZJrP1aJDDxFBFBygqsoNEypPFzVS6oeHoKisvrveOQ=;
	b=GEkKeovfhhzxlymmOToQo9HC7HhxsMaZNPlOKkTRDPphwCkMs8U3e1b3XyOcGWabGedU
	 WjNEY6nPL9kFwn01GzlxaJ7KTfV4ktiwXlv6x8+PPxnmwtpUUR0bJK0+Q/LBPUypP0kd7
	 yOcUT7lcMwhK8xaWI+/6xqF1ghZgOel6JJ5RlSMxo597rs7LQeItc0QQG5jwZ/oSwOJ0O
	 MN7I7QXhkPdkRuREyOyEpQSquMIY/WBhSMzH/BStUPRTa6S+fhVrfVVYTJzA8UndHVT/e
	 VktSQ8+e58bfeeapxGKd6p1SpFlyKhHsTLl8zDQ+IIlHs66JDIKQCPzq5Nzq2zHuuWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPAGIBn5;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56D7606EE94
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56D7606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPAGIBn5
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a5d57a8d51so2085963a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065839; x=1794670639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xZJrP1aJDDxFBFBygqsoNEypPFzVS6oeHoKisvrveOQ=;
        b=CPAGIBn5hnZER/pg+qY/A7hpldqzU31iJ+9hZckkZsM4GUtFF1AWESspQ5s6uCS9Lb
         JcCX09839KnC6JVged0y5ITCpwGBwarmYMbD+HeWgocf/K2Vrg9n/r5+PL2K760YhJDj
         1WBmF9LRBy2EdShTl4vId0n6kPk/AlHsDdM3bgFC5qPs9m4Xco265cM83Ablt2ELvBA0
         t1w6biC/ZWj5IDUJ/NGLK3myx/XcqjpXmVs9+dCaMeQ5sidJvFWOBOVW1RnLUkLJJQoA
         6/HJEgfPhgQz1Jz/6n02kc1pewvIqZaX6gMzIUSVx6EZUG4OguDAAjRCZa16GY3hsFEG
         1OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065839; x=1794670639;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZJrP1aJDDxFBFBygqsoNEypPFzVS6oeHoKisvrveOQ=;
        b=c34LLQLsa6/GXgKJoMFm3PpDkoMvLGpCJnbP0n/b6CYZasuABluBYCdjkQc68jJ9vm
         Z2Pty2oukyneXepOcsbmRPNOuGt9PWBBrhbd12zGSxrzPl8Osa2feZKlIJBmQMKdP+JB
         QgU9rRuO6ip0wZ7jLuTqBlWw4uW+HjmTTO2LQpMufP3qfoawfVoxfey5pEPIYkyfKp5m
         +OU9NmSOrg4TogTOvtk7xpT+s5HVEk4+1ZBvcLMuFwMJ8pYd/jYA/+mqHpLeXUTQIdAF
         MegM+eQMsj9hyWAN/4blfmmyT0nMZF6yEH1czO7PqAvOLBmusJl3m7NXTLACJtpqs2aw
         9kWA==
X-Forwarded-Encrypted: i=1; AL+hErF0qy21JVS8RNFgiNziD354diM9PdAj/7x0xwd0QuJY4KkY46+Km45h1FPJByhw18U7LqWfC2MXBZV1BKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zfTPBGLJlQDzggWgPHP4dZqOvgidLTk0/ppglun22wLlGAOqx
	tKjT5K0k1Rxe7jREolfkj72mby5+02rDQb4JjVl6BMq1HgK/JYaslZvPZGdXFO/woiB6XFqT6+U
	M/Q==
X-Received: from edt6.prod.google.com ([2002:a05:6402:4546:b0:6b5:77e8:bf7d])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:90d:b0:6b4:88e8:6074
 with SMTP id 4fb4d7f45d1cf-6b5977caf87mr3835118a12.22.1794065838990; Sat, 07
 Nov 2026 07:37:18 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:14 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-8-d84ea5f30f94@google.com>
Subject: [PATCH 08/24] arm64: Introduce mte_get_reset_tfsr() helpers
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In an effort to untangle MTE from KASAN, split a reusable MTE helper out
of mte_check_tfsr_el1(), providing two variants, to accommodate the
contexts under which it gets called: one synchronising TFx before
reading it and another delegating that responsibility to the caller.

Name the helpers similarly to __dsu_pmu_get_reset_overflow().

This prepares for a rework of the KASAN API to simplify circular header
dependencies, as KASAN calls into mte_check_tfsr_el1(), which calls back
into a kasan_*() function.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte.h | 31 +++++++++++++++++++++++++++++++
 arch/arm64/kernel/mte.c      | 12 +-----------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 1d6113ae786f..614fff7dc35f 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -17,7 +17,9 @@
 #include <linux/sched.h>
 #include <linux/types.h>
=20
+#include <asm/barrier.h>
 #include <asm/pgtable-types.h>
+#include <asm/sysreg.h>
=20
 void mte_clear_page_tags(void *addr);
 unsigned long mte_copy_tags_from_user(void *to, const void __user *from,
@@ -31,6 +33,35 @@ void mte_invalidate_tags_area(int type);
 void *mte_allocate_tag_storage(void);
 void mte_free_tag_storage(char *storage);
=20
+static __always_inline bool __mte_get_reset_tfsr(void)
+{
+	u64 tfsr_el1 =3D read_sysreg_s(SYS_TFSR_EL1);
+
+	if (likely(!(tfsr_el1 & SYS_TFSR_EL1_TF1)))
+		return false;
+
+	/*
+	 * Note: isb() is not required after this direct write
+	 * because there is no indirect read subsequent to it
+	 * (per ARM DDI 0487F.c table D13-1).
+	 */
+	write_sysreg_s(0, SYS_TFSR_EL1);
+
+	return true;
+}
+
+static __always_inline bool mte_get_reset_tfsr(void)
+{
+	/*
+	 * The barriers are required to guarantee that the indirect writes
+	 * to TFSR_EL1 are synchronized before we report the state.
+	 */
+	dsb(nsh);
+	isb();
+
+	return __mte_get_reset_tfsr();
+}
+
 #ifdef CONFIG_ARM64_MTE
=20
 /* track which pages have valid allocation tags */
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 8025ee1f7fdb..47432c9c4de0 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -182,18 +182,8 @@ int mte_enable_kernel_store_only(void)
 #ifdef CONFIG_KASAN_HW_TAGS
 void mte_check_tfsr_el1(void)
 {
-	u64 tfsr_el1 =3D read_sysreg_s(SYS_TFSR_EL1);
-
-	if (unlikely(tfsr_el1 & SYS_TFSR_EL1_TF1)) {
-		/*
-		 * Note: isb() is not required after this direct write
-		 * because there is no indirect read subsequent to it
-		 * (per ARM DDI 0487F.c table D13-1).
-		 */
-		write_sysreg_s(0, SYS_TFSR_EL1);
-
+	if (__mte_get_reset_tfsr())
 		kasan_report_async();
-	}
 }
 #endif
=20

--=20
2.56.0.455.g6c5a503b38-goog

