Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2A74ACC93
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367304; cv=none; b=n+zY6oC1exmDZDId5YiG6xOXy6i6fkFI0Nsc5H7JzPogKFEL6k9YVRvGapy8Okr03HdyAtO/l0CAQYeM3VE3Gi7zgOPf1Pz4bYTDUN6g4QZ8PhAXGOvTCzvKXRwWi0JQeYZz7DQjV4xZGd5+W1hTXXKr91bvfBCjA5hKA4dpcWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367304; c=relaxed/simple;
	bh=UVGy0HhxZ+yDIeNG6eDI6eU+6NSVSRJ/g4F95JRGveA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iDgv8OlPjFBqurgdgGcSTfMnP0gWTJ5v/xV2PMA9UvcNCxSiNSUUgC1KrprrkfoYy5Y4QQbo+KErtvu1p8bAOGHSs0GpVCo7H2KcjBKdBONwLWdTVb0mnt6Rvi3k0hXVRnD0DaP1EfgzL6iPSI7YpNsIZX5A2uNDeFvaRXjNgLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pFopY9dw; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pFopY9dw"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1379912a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367296; x=1788972096; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wcKMUlmJ0lq2oBOCUrCto8mVZjPEk4eBpEgiK6nEFRg=;
        b=pFopY9dwt3xSCt9Y5ua9ISiGOTBWCuZGAAOtCNEaNpOB6hJ9uOkqiJjQupd5LT9OEK
         PpTm595a//ta9ZSpWaKORr9bTKStFzH2ky4pWMYKEBI3cGt6SJDLZGc9WqABiIQdQUI6
         2AdSeR7sQeX9s30zeZ+mhNLrKLujdQoWag9kxsZd1c5Xf47JmNf7wuiqP52r0J1+J+3s
         KZ9afw+lM+ehSAflSJFjArwxiNbKPIzjTXQM7Wx6aJKoF3uwv7xFqfAW52G9GnMra7tC
         vIMiTzhuuXptfjJHVlmJfaMwKZs44OtSmrOvE8S5baQgNrs9fMR1XGEz2LGklymYsE4k
         DOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367296; x=1788972096;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wcKMUlmJ0lq2oBOCUrCto8mVZjPEk4eBpEgiK6nEFRg=;
        b=I8eGOVuaHo3ajMCEK6fmYb9Weh01HaRdCBHAUiVx1n+Wd57bj5DFXy1Qa/ImiZORLg
         fwukMG6sLUGFC+UUXCtw/ZkbZ7SJ8oDofiIQ1MPvlkjBPWGP+b56k6ruA2y9FGy3RuBZ
         2FHtcgp4DklKZVHfxJaj0xD10tYFQsMkoqu6p5Nfhoh63Es+J1vbSn6VelrBonsNwJTa
         ntiZ2uUD9LilYCXiyrLnFYafvp6GIz9qhyIv5uyw7ZZEH/BPRQcXRBeaito7nMra4PwF
         VSNv7eVKfaqGNysVlODP5lo7zjJJxspHL7+rJYChzQYZ2CzyePp13uiOksx1M07wdjfq
         t/7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmi4a1f4JNcAcDEU6JUsY3AgyKzBpnIQyViwLHNy5V8twLEGT7GO65Ufenqv0Z/NGlLho8R7bo/k1qXt4=@vger.kernel.org
X-Gm-Message-State: AFuF++mQV3V5ywDVVISKE5XdZSvz99XeJdljQmudHZGccnD2VY1pt2Ih
	BfUdKKLZfoMjXrMXL6jk85qUKapc80L+A8dUq/kRSWy960r3wO+xFwxPbkjcXMZHxVQkz5SylIg
	YupL+Kw==
X-Received: from pfbeb17.prod.google.com ([2002:a05:6a00:4c91:b0:847:87ec:2a9f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:997:b0:84e:f90e:492f
 with SMTP id d2e1a72fcca58-85ed25e06efmr8429625b3a.7.1788367295680; Wed, 02
 Sep 2026 09:41:35 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 09:41:12 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-10-seanjc@google.com>
Subject: [PATCH v2 09/20] KVM: selftests: Use the innermost page allocator API
 in s390's IRQ routing test
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

Use the quad-underscores page allocator in s390's IRQ routing test in
anticipation of dropping the @min_gpa param from the primary APIs.

Note, it's not entirely clear that the test *needs* to use a very magical
@min_gpa, i.e. it's possible a more elegant solution exists.  But that's a
problem for a different day.

No functional change intended.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/s390/irq_routing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/s390/irq_routing.c b/tools/testing/selftests/kvm/s390/irq_routing.c
index f3839284ac08..cd26cc1aed80 100644
--- a/tools/testing/selftests/kvm/s390/irq_routing.c
+++ b/tools/testing/selftests/kvm/s390/irq_routing.c
@@ -36,7 +36,7 @@ static void test(void)
 	};
 
 	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
-	mem = vm_phy_pages_alloc(vm, 2, 4096 * 42, 0);
+	mem = ____vm_phy_pages_alloc(vm, 2, 4096 * 42, 0, false, false);
 
 	routing = kvm_gsi_routing_create();
 	routing->nr = 1;
-- 
2.55.0.966.g6673acef38-goog

