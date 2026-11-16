Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859463;
	b=Y1GD/RtLJpKsHeMNmIB68mZT4bjbzHEBg4YjKOj75M0j/ZwqNXVQ3iYu9TWRgqulkgjs
	 1P+jyjtXrfrptpTsQWAtgD/ICY3ZYqf51uWH7Rj4jOG/Iayuy6TWs0nxBjYPyFqOAO+nc
	 gTVCiiTPVZNOK43h+fujDo1dobcKxjzWD38fS4AY+8hCMGoBFtnkwTd8Pnq7H/EzZmhkB
	 /0thjYcyAYqUdBpPEJmTVKwKaX2xG4V8tZdh34mNiP1nNFknExaeTP1KQVEl5qlXQVaUk
	 6ZZUAuTjWTPUmNaw/y2j8PzGNIjaD6d6sFNmGR5JhJVlHeBNuVdXqp6xSpSmPkxL4dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nMypBwJnR0vpA1cBr9OnEsaSU+Ny4MYTCLPv64i3c3A=;
	b=jF2g3WxaXYMtC5ih2oTd02ebwGzghK56EnrahzMEOtl7XAdn8m4HZ3niAcgl3qpjmHDh
	 VZwjUn4RaZjlXQtl2zHM1yOuiUuV9JGUt4qD/wTC2NBY/z56zAeivg2uIgOgTZjeTUuZj
	 m7e2NLV4Eff0xDQ50bx64oIBsDRam0N+Zx0z70HQURlreUYp369yASVq1GnC3SwTs7gIR
	 87nnFAPHfV+wataCWc8EWkcLxaam0tHTuFwhwcX46/4wByg8POT2X9H9RVL/1hRFQ0EFA
	 N3Z4U/3OIMEyRsK16wDQj+sARLJX0tFZtyIS+aY1SVpTCn3exOAst+7/+mwoLqiprBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kPIYM3ie;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A6D606A89A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A6D606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kPIYM3ie
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5641cd2cc13so4372954b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794859462; x=1795464262; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMypBwJnR0vpA1cBr9OnEsaSU+Ny4MYTCLPv64i3c3A=;
        b=kPIYM3ieVnPcw6Zy3QQxDbKyzlwO/aI32pyV8OzJIWUJRhrHVXATZCnq5Tq2ejeruB
         yCnJqDJPh7dP8t0/aIlXnbSOZYtUZTgSudlZi4DYSuS5+TDlfHPyHvmh6Sj78VnIoy22
         y1Fjs808mkk1cYkQCHqZ8t0IYYQgvMiF/h6MI/5txVIgF9h9jmWaeiWekDlh4LEeWBvC
         nwhEV70jEz1dVR4ikuXtjY45COOXGL1Vo8E6z+mjZio6v6C86hDGZSMHj2IpTI9+Fv1k
         0B+8jO3Bnil0kBzZH6o3RG4JxhC6pDl0ER3T+AzWqcUQs5rnVPCxZ4iCOnAGf2hgaFK+
         rqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859462; x=1795464262;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMypBwJnR0vpA1cBr9OnEsaSU+Ny4MYTCLPv64i3c3A=;
        b=qV8Vex0iVf4iPilPdGsCwLyHqnV3wT9d0vOe70zv0GFlvkYoFKqHp625WXghOaqMya
         MBWNBGZtMLLRAJHXV0h9ByzgZWoY3ejTV7/RgLAVY6lQ9YT+uxRjjvah74nBByvBVWR+
         l54qhMILnXLVgFA2Yt/PS6PuL+2lGmONbi1xQiyGl650SV+WZ3jq582GJtP246lLj7vm
         G2CvHBYttgomOwpLnVFPhaZDDgJy/n68xX+nrHOotZb6ylpSTYYntKWuEOdcj9SNfwXN
         zBEF8UoDycanNV72Wr2DD0GzxbfRERlbgj1hedJhAS9jZVLFhiJyae3Nhfxk/1YiLtSh
         ZV6A==
X-Forwarded-Encrypted: i=1; AL+hErF5G2vOV4U4BgQu8AgeUdLmBRHemqmHuwfLAK6aDzJKhzd/F1oMoOEPZttB2ursiq6jyc5IM6KP4nIGblI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cAuvrVfgtvWPzm5m3ITTdIsPaPkZh/sS0LNLcPBY3lDAEzpqx
	/lZuQY/FubYMogOGgbhpWMrKX3md4vdTnbaGv0frmL08IFN5y1g2z/sp4J5qxt6G+8kdikKBCxV
	ntACdgF5686MCd858+ufGJ6MzKQ==
X-Received: from ioo28-n1.prod.google.com ([2002:a05:6602:865c:10b0:9c7:7732:c3c1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2383:b0:568:e5e:8058 with SMTP id 5614622812f47-56e6378f81fmr10829049b6e.19.1794859461431;
 Mon, 16 Nov 2026 12:04:21 -0800 (PST)
Date: Mon, 16 Nov 2026 20:04:18 +0000
In-Reply-To: <20261116200418.3535619-1-coltonlewis@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116200418.3535619-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261116200418.3535619-3-coltonlewis@google.com>
Subject: [PATCH v1 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when
 E2H0 is NI_NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

In a VHE-only EL2 guest (KVM_ARM_VCPU_HAS_EL2 without
KVM_ARM_VCPU_HAS_EL2_E2H0), KVM advertises ID_AA64MMFR4_EL1.E2H0 as
NI_NV1, making HCR_EL2.E2H RES1 and HCR_EL2.NV1 RES0.

Extend hello_el2 to attempt clearing HCR_EL2.E2H and setting HCR_EL2.NV1
both from guest EL2 (across a trapped ID register exit) and from
userspace via KVM_SET_ONE_REG, verifying that HCR_EL2.E2H remains RES1
and HCR_EL2.NV1 is masked to RES0.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/arm64/hello_el2.c | 34 ++++++++++++++++---
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/hello_el2.c b/tools/testing/selftests/kvm/arm64/hello_el2.c
index bbe6862c6ab16..46b0f63e199f0 100644
--- a/tools/testing/selftests/kvm/arm64/hello_el2.c
+++ b/tools/testing/selftests/kvm/arm64/hello_el2.c
@@ -13,13 +13,29 @@
 
 static void guest_code(void)
 {
-	u64 mmfr0 = read_sysreg_s(SYS_ID_AA64MMFR0_EL1);
-	u64 mmfr1 = read_sysreg_s(SYS_ID_AA64MMFR1_EL1);
-	u64 mmfr4 = read_sysreg_s(SYS_ID_AA64MMFR4_EL1);
-	u8 e2h0 = SYS_FIELD_GET(ID_AA64MMFR4_EL1, E2H0, mmfr4);
+	u64 mmfr0, mmfr1, mmfr4, hcr;
+	u8 e2h0;
 
 	GUEST_ASSERT_EQ(get_current_el(), 2);
-	GUEST_ASSERT(read_sysreg(hcr_el2) & HCR_EL2_E2H);
+
+	hcr = read_sysreg(hcr_el2);
+	GUEST_ASSERT(hcr & HCR_EL2_E2H);
+
+	/*
+	 * Attempt to clear HCR_EL2.E2H (RES1) and set HCR_EL2.NV1 (RES0).
+	 * KVM sanitises VNCR-backed HCR_EL2 across exits such as the
+	 * trapped ID register reads below.
+	 */
+	write_sysreg((hcr & ~HCR_EL2_E2H) | HCR_EL2_NV1, hcr_el2);
+
+	mmfr0 = read_sysreg_s(SYS_ID_AA64MMFR0_EL1);
+	mmfr1 = read_sysreg_s(SYS_ID_AA64MMFR1_EL1);
+	mmfr4 = read_sysreg_s(SYS_ID_AA64MMFR4_EL1);
+	e2h0 = SYS_FIELD_GET(ID_AA64MMFR4_EL1, E2H0, mmfr4);
+
+	hcr = read_sysreg(hcr_el2);
+	GUEST_ASSERT(hcr & HCR_EL2_E2H);
+	GUEST_ASSERT(!(hcr & HCR_EL2_NV1));
 	GUEST_ASSERT_EQ(SYS_FIELD_GET(ID_AA64MMFR1_EL1, VH, mmfr1),
 			ID_AA64MMFR1_EL1_VH_IMP);
 
@@ -45,6 +61,7 @@ int main(void)
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
+	u64 hcr;
 
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
 
@@ -66,6 +83,13 @@ int main(void)
 		TEST_FAIL("Unhandled ucall: %ld\n", uc.cmd);
 	}
 
+	hcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2));
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2),
+		     (hcr & ~HCR_EL2_E2H) | HCR_EL2_NV1);
+	hcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2));
+	TEST_ASSERT(hcr & HCR_EL2_E2H, "HCR_EL2.E2H should be RES1");
+	TEST_ASSERT(!(hcr & HCR_EL2_NV1), "HCR_EL2.NV1 should be RES0");
+
 	kvm_vm_free(vm);
 	return 0;
 }
-- 
2.56.1.750.gf70dc682cf-goog

