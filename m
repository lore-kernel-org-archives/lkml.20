Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9F34AA1FB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367311; cv=none; b=J/+0ejcQreSOXtMwXd4Ar/uetR2xa21FPPD8kVD60jYWIZi7gkQ89i8Ld3hYhUWnTLoFd3oBgK92yN1z2yOLXq9lJgfekUhG9QSjjvwth16Agh6NpTbVlfDVa+/PAeQE0J59VEVtMAGfZdoRdErJRiFCzBLmOWkaN0FA7g8ZSno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367311; c=relaxed/simple;
	bh=a+smfS4HY4kg5A4IC4+lGdAxAV+Nzj8xt7z5c+G89xo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tztX+1pmFlJctFhWd4Rh86EazRFD1ag55TluqfrMzaoWO5Lf7Hrt0jlSLF8+HTNBGmwNzAweN3NGwp1UomMVye44Rr9v3Txd28i54x/nSlZAmL+RbtrYo4MaTgB0ZnytvdzDbMEXgmJFN2I3M8GrIMRsHXDmjYmpSVCPBZ16/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OiwmPS21; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OiwmPS21"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8535db07af9so675242b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367303; x=1788972103; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F6KFth+wmNcPY6G4yAkPxQ/KQlcOGwTTAk9RODAHfTs=;
        b=OiwmPS21i5FPtKIuozuGY+sdrPc+D+esfQOyzux/OVQ339/UvKRXfxV+x52jGiXJtQ
         +tsuRXSwrC1Rb9jYWJslL0+40NXH+/BYde19yTs1FHaLDjD64wT32D6j1m/oxM/kwMXn
         7/OGgExebZqCo7+z3yh7HNe9oGbFZuGnzVROu5jAnRr/rivkxVA/sItL2x0Bcuc5TtqA
         qkGo10mrEBWhamY41U+7PEmX/nrwrUTIttYf8mKlK0oNfaO9HClGX+XFaTW+3oft/E+x
         VqTW+D1asf8iXUADFXc9K1VNqM2mvudUPl6434KGOs2uD+PXPUajFs1dNcdr0UAUXnSa
         k5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367303; x=1788972103;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6KFth+wmNcPY6G4yAkPxQ/KQlcOGwTTAk9RODAHfTs=;
        b=RfT/SuoxwvGxA5V5GPef3VMRd3FBF7SRAzj69ldkjzrAnvfAzETFc5lbhpAZIEnnk8
         xdzlS6v9rN9NiWc/OzfP5Em87MB2hxLrF7cBpd+hLtDXx49F6DNFM6T3DNn/kplUBwny
         uUxZkskn2rF+bmlovps6lmKDmrYZyGhcJob44mI/xfzAgrblZ5Ob5k3B5JrIF8iFUIhB
         uXtKoF+Q3X1vW7EQ/byDD7hUcoJP/mjOEQWkBZ6ceIVEYUQY3NnYFG3n4UMGX359Ajaq
         w6DSwJSmUCaWMOxrHdHN5fFcwtyFM4yQC8y2mSr2LCZLhPgwB58aQnMljMBxiL/M9pqn
         9z/A==
X-Forwarded-Encrypted: i=1; AKwUvBymMvfrnUHUYJE8zQxpGZYDUBhPMsq6ezsp5CAbMoj9ak0TDhw3XIXV3+Liqs28jLAvz4d0DDSPgN6hQFg=@vger.kernel.org
X-Gm-Message-State: AFuF++nsM9H+XKVcwCY3fr2TMesV+Bci1qgGkw15PoyM5NfKfYJ9uhM+
	sT6O18SKoVkqZTRBRRfBsx3hnfgGMWnDBT83Kz46yB9OKqFhs9FPtts0iw8Hn1HB9qQ03xLL77V
	vBHR13Q==
X-Received: from pfux9.prod.google.com ([2002:a05:6a00:bc9:b0:847:82b3:aca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9295:b0:837:e9cc:d474
 with SMTP id d2e1a72fcca58-85ed1d07a02mr8719333b3a.2.1788367302673; Wed, 02
 Sep 2026 09:41:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:18 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-16-seanjc@google.com>
Subject: [PATCH v2 15/20] KVM: selftests: Use TEST_EXTRA region in x86's
 smaller MAXPHYADDR test
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Use the TEST_EXTRA region/memslot for x86's smaller MAXPHYADDR test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_add_extra_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index 3dca85e95478..b21798a385ca 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -62,9 +62,10 @@ int main(int argc, char *argv[])
 	TEST_ASSERT(rc, "KVM_CAP_EXIT_ON_EMULATION_FAILURE is unavailable");
 	vm_enable_cap(vm, KVM_CAP_EXIT_ON_EMULATION_FAILURE, 1);
 
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    MEM_REGION_GPA, MEM_REGION_SLOT,
-				    MEM_REGION_SIZE / PAGE_SIZE, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       MEM_REGION_GPA, MEM_REGION_SLOT,
+			       MEM_REGION_SIZE / PAGE_SIZE);
+
 	gpa = vm_phy_pages_alloc(vm, MEM_REGION_SIZE / PAGE_SIZE,
 				 MEM_REGION_GPA, MEM_REGION_SLOT);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc");
-- 
2.55.0.966.g6673acef38-goog

