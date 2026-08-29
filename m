Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAA8370D5C
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982629; cv=none; b=sYNLJk/V6KjTGiOJTtN3/NVu1yoAogLt8vEmYgb/eUjIaFWrUoomFKObEXuGiVp6TScTAzmRL9UBXDYUf7JfzmsgXis4SkWcNGrH67PawUVGsi3MLzZWlMYNVxn/A1AAKNw6n/ggWpdQHcLkBhFO/kC4RhPshXlUA1PVtOryA5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982629; c=relaxed/simple;
	bh=Q4xDvcP9DIiwYXTXpczLlLyq7Kd7CsRktQVDTGiaDVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TINSrnA7EC4jNzXMYsbotRdg9cURL9mkyIHKF0l2Pzn5UbxGHHN1+ZoHBkEhTIV65t/X6KOLYw3CSHN6UfBwFJ+vYu/yM7zAJ7+giGHCL6WuwUNO/66PnAQO3z9M7kFHOz/tv1Ab9KhpDQlyxw6inmzCgmz7Owtv8s4fFPRb0+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD6QDr38; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD6QDr38"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so14889865e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787982625; x=1788587425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmU2GuULI4+ubbU7oraX4k5FiAqeW6B2DekgWiWauec=;
        b=HD6QDr38uOdg2inY+Mqbd8HJB2s4sC1jnKT1/cLmDMfe+q8ZWY3RiNc+Pbl4QMf7/4
         jqFK4DCYCL04nFph+fZzOIQ1m7SV2h2j5SUaGYZkHox2n8Ck+WoEsz2TW3SJGWzKXfXn
         NsLrYQkfqF3vPx95ahD6uaYUpcopTflEVaplfa0mkK0sUst0Ncal7OKkyOMRbX1EDWlj
         zJzbDvFRl45PUPCs8JOSJBLWUOZ4vJsowCJVHIBIuES+8JKu87Seu7PmzSLofHxy8SRk
         23+969t79Fln2i+uB2WoRaet05BiKpr8uScQOfIhnGoidi3PFv1OFp5u1POSkBUu+swk
         6TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787982625; x=1788587425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmU2GuULI4+ubbU7oraX4k5FiAqeW6B2DekgWiWauec=;
        b=ZBLYJWvpAa9roPTIefYCu0LBu6wQIRtA1F7vzrr1pJyBEjvDoaLc2s/zXD5NSxVWH8
         /TY7scQIsedTkhnUqkYRrK+63f9jhoV4kCTfLCjz/678zrknWdCFIv789kmubMZg3j00
         UtQV3y21ULMH/UDqlMX1Z6jRUQ8kdUs7XXQ7Qe1F015oemRTqVwwFJriROJVYrWvbpnr
         U3o/xgmBsi4w//wIE6thF9ngabuMIqchLCIy+vc8X7QEMLwZ2Yf3jmwnUI/YcOZESRp9
         M+FWGSqR6712R6efLS2gZ82K9ZSP46y96K+afdj4VVIiQqQ3Xg2L4fYsFQklJ/dTZgdf
         DRtw==
X-Forwarded-Encrypted: i=1; AHgh+Rp07WhRLwaRQ5cXg7nPz61QFCepxk+Qm/6QlXk9boH8iKJhAheH4GmT8W2sO5c/CwVHKmZv0CV6go1gRPo=@vger.kernel.org
X-Gm-Message-State: AFuF++kXLwa+ptGFHlm52C6SXfYL4o5tmZLTu4vyL3QUKQtV3i5ek1eJ
	eHJj2s1JTP0zd4t5z+z1Jf9KrN9wn7cbc6OSJkBGQAJMFB8LDQ3VLEDW
X-Gm-Gg: AR+sD10vxNcXNT9ioP+b2IZA2rF5dvrCUPhldimLb+kQQMAICqBlpDTiJo8mHR+64G4
	y15reO6IxVP7AVgBPGggTA17GlLY6LZ20BMEJNbAnYPJojVk2Nb77a1dIfYLs8JM/CmB4Uvuu4F
	bJbtvZCqnAvI2Bf0BWdnCQNbR3iWFKcLeq+e8IucZ68nmVRGywneKsi7Aav1cYZaEa6bT2e8KBp
	0MyBMxCw7W8wObp/4zLflP0RuqYGjhE4kjFJKsLDA7Ljr/BNl2x1FczyhOW+ao+AeGGWqfKnIWF
	zXJmFefoINPNfjhj0Nf4ha1a/jAl/F1yzuk0Zgu2T/xAb8spP1bObKxraq44cJIb3qIBnTgpneV
	rYio/bVUwuTaJ5JgLEBBBxqfm8QxgPA8acNJGuuq250NE3Y0SNPE1Ryc33B2L4/2lCrBO/wp1LA
	+OF+f+dQ/zvpvNh533rnunE27ZzCa0/TQS48+harHccp2VlnAziKe4Xl/Nt8eHGB3L3g4oBEgku
	Fv+5gMkn+0W0jQWliqyY9dcDSx3KsNWKM1009N937thA9m/2CSHyTvQ+oBVeU+YlFcOPN1sK9oB
	/TVPViA0fAgn/dHtHFso
X-Received: by 2002:a05:600c:1f8d:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49b91c17c41mr163125035e9.3.1787982624717;
        Fri, 28 Aug 2026 22:50:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm35357485e9.2.2026.08.28.22.50.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 22:50:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] KVM: arm64: selftests: Test empty SMCCC filter range at base 0
Date: Sat, 29 Aug 2026 07:48:56 +0200
Message-Id: <20260829054856.70549-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260829054856.70549-1-kmehltretter@gmail.com>
References: <20260829054856.70549-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_invalid_nr_functions() only checks an empty range at
PSCI_0_2_FN64_CPU_ON, which KVM's end < start check happens to catch.
It never exercised base 0, where the inclusive end wraps to U32_MAX
instead.

Add the base 0 case. Without the preceding fix it fails with EEXIST.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 tools/testing/selftests/kvm/arm64/smccc_filter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/smccc_filter.c b/tools/testing/selftests/kvm/arm64/smccc_filter.c
index 21e41880261b..a41ed3e016ba 100644
--- a/tools/testing/selftests/kvm/arm64/smccc_filter.c
+++ b/tools/testing/selftests/kvm/arm64/smccc_filter.c
@@ -140,6 +140,10 @@ static void test_invalid_nr_functions(void)
 	TEST_ASSERT(r < 0 && errno == EINVAL,
 		    "Attempt to filter 0 functions should return EINVAL");
 
+	r = __set_smccc_filter(vm, 0, 0, KVM_SMCCC_FILTER_DENY);
+	TEST_ASSERT(r < 0 && errno == EINVAL,
+		    "Attempt to filter 0 functions at base 0 should return EINVAL");
+
 	kvm_vm_free(vm);
 }
 
-- 
2.39.5 (Apple Git-154)

