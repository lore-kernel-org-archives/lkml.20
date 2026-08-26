Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E6C3BB9FD
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785521; cv=none; b=pbupCyQ4vL4XLRYr29lKwLKC9B+NZTOAyVB1VpvgdxNfoDQd9fklVJmD/HbjGlhzwAgycvraNgyRkfU5zbX0ixlI7XLpu58WPaNZr0ocePOdl+OggVae33di430A90H/1EwIJlAGfWwsKTWq9WFVAPBsmLF9iq1bJ28cNmKLPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785521; c=relaxed/simple;
	bh=RtpwpC4+8FlGBnxPYsA9ZpkBEAbkRAXGvd07qy2rIzg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qDT2bKWkocGDHdM4NsVvzGt2B9LWIwGX4jZwB6+V7LbKB2Laghd4OMXsLngw+l11wCSSjhB7APwb5OB1cvMyh0v+DAK5lPTpFSYD8APbHQtEq7vdSJA7Orx5eNS5Xjrt3WhdbhvAqoH/lvo2243i3MmAwvhlv31Yrl7C+PPJwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O480vD8C; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O480vD8C"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1c1cc5206so1580321a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785517; x=1788390317; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=94pyTmilRwp00Qy5PlO0fIgUZFKJ9TnrjxcqGpSFO84=;
        b=O480vD8CMgbDR3U5E0BbN0bxf/zWZpCiQaawUs7iZTSW4ULb+TGxwdrwfGX9K0PcBB
         fu/FXWphF1jcWL9NraSFvA8kCNuCjfIZ0GVAcc/7pzAxE7EPh/eq5JfxGFQ0tkokqTQe
         PnvPAoWyPL9fSJwCLarTZjcJXNL7o5dd/DbLF0ujGd+0pngB264MjEBvb4IDL8hiC369
         Va1Avs4vQSa0wIF3O6t85JbcTfNlFUZRjfOO1sBtn3Ker1UUTO3DmjRtWCcI8orM5FLA
         N5QxrCZ9YtWw1cU6842dWZZgyvQYyRrIR6jBdVnoejpUuZ+q5SuJK32w6sBgcO9FZPfy
         faew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785517; x=1788390317;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=94pyTmilRwp00Qy5PlO0fIgUZFKJ9TnrjxcqGpSFO84=;
        b=CCHzkmqWKEPRJDKbIrYIOjy3QOCJwotx1JRFcju/HEDf9FNRdVlks8uZGGT7RgBVKj
         pRfjpr1/Mqg4tlZKFwjazfumfThwPlg3NwvKJZbdGj0N0Y+IolALp2oP1dEKFqpmq3Ft
         BuELlrfUsonUNHV5FVmNUnh2HvYZPuJ09EecynI93yjrEmbT2QWQcJ7e3cIrnW+n0jH7
         qWBdLw3FMPDSnHmta53gJc+CtYHTVBCZJ3arLeAQgbW8KzAV+lxIfVU6uK3dCuteh8Kz
         LyjKs7y1cdTg6M4+zbPeIwpdt8jvLQz3lVQCFz6B2DWOEz6s3yepAXOXgHnaayJOBk66
         o/0A==
X-Forwarded-Encrypted: i=1; AHgh+Rr2ByMsdGJaVRYikCdWCPNC+7JXNU/QPkSflXvsJf/W27K8rtIqtaRXJPbMDBo6vqAZZ0PsvcsBTt0LJyw=@vger.kernel.org
X-Gm-Message-State: AFuF++kpJHDhN4OwYvuvAa+rI++NM0231+4EaSLS3pgb87uyT2T+6rZc
	JcszLyE6JZf6Bxhg1wNxt+8smnGILA9XCUJ9j+T5l9xQRGAvHh925W3GY9c3/C+R7wrB5rLS4KI
	fyKoKog==
X-Received: from pgct13.prod.google.com ([2002:a05:6a02:528d:b0:c99:5634:7551])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7008:b0:3bf:7bf7:7913
 with SMTP id adf61e73a8af0-3cf8445170emr21857267637.14.1787785516420; Wed, 26
 Aug 2026 16:05:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:04:53 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-3-seanjc@google.com>
Subject: [PATCH 02/20] KVM: selftests: Bump the minimum GPA for page tables to 0x200000
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Bump selftests completely arbitrary minimum GPA for page tables from
0x180000 to 0x200000 (LoongArch's minimum), so that LoongArch can use
vm_alloc_page_table() instead of open coding a rough equivalent.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 5a7a455b5387..70906a0d1003 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -175,7 +175,7 @@ static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
 
 /* Minimum allocated guest virtual and physical addresses */
 #define KVM_UTIL_MIN_VADDR		0x2000
-#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x180000
+#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x200000
 
 #define DEFAULT_GUEST_STACK_VADDR_MIN	0xab6000
 #define DEFAULT_STACK_PGS		5
-- 
2.55.0.887.g758fc8c411-goog

