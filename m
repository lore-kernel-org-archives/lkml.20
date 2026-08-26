Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391973C872C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785537; cv=none; b=VbKSJAFdm+hW8pg+iUAsdgmqatNEB9puRon9gFMtdVEIxtJKhls2VokrkQfiFUSWgFlSBrtrshYB8o5hMnW9xAVhjRSsD2AqFb29BmvIru1R7pQZAcEd73v9e3p5k2K/PRQNGgFmxtjyCcOL21U02ivGE50pVZAHmOM+PNVLpYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785537; c=relaxed/simple;
	bh=3EDupCSd227h2crKQg33vyihGNO4uU9jZfUf3CJAc4M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qJqlVvCY59iy6fi9Egq/kGf+QUwPgPGJNZE0C0loSl0aMWKkMOrN1QiTnN7yMcT6NMAheHx8tIc8itSrD6y/lRV09Oi2WieHFfCVM6MTyIPkpeWbkDfr18lWnjcsinQGfdDhHMW0fmSBe2mnf040iSKcFbDZ7G5xH39Rokqa9Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BIkOXX2j; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BIkOXX2j"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so185098a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785534; x=1788390334; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6dP/JlGXbpMmzJiAs51wjG9zHvCLsaGeW9+h1tHon4=;
        b=BIkOXX2jAASkcjYVX8QhW1wuyS+btVimqn4kQtyTSc+5ku4fVoiyz12ad87RgiGsG0
         wJb4hj1SOq8iMAH3QAnUPFjpLFgpQFxylBwBbq1ha58TRHasn+YSB5Dnxrq5Q7UDZh7U
         4mmofcm72L3XjPD1LQukT48MwDIg9xFfDcm1bdZ9tSjg0sq6JlCI5dQ9TBZnj0tQoyGn
         NT7Fc5v7RD7NxSjz6awoF7o9ZYBfoAHc6+yFaw5s+luM6HszkqCvqelpnd+5v7VtK6wI
         /27gdobpSMAr3+94AHG/GFTpCX7v2TMrwnoUP1Qt8ujJQihXG8WAFO81Mw9di8FIIGMh
         ObIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785534; x=1788390334;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6dP/JlGXbpMmzJiAs51wjG9zHvCLsaGeW9+h1tHon4=;
        b=H/gJTw5Jz4RX4qwVLmRpt21kcO/OqVONXSDYfnB1JKuYLOkZu9PhZfgwEAz/Wl5Px5
         dkpOWe81afkP4/6MJIHdAscQzsUuWr8eyPiQi+Fj8MIO5vO4zqvuPoxK9N858vJ5ntXQ
         wx60xOsgzljq84xvpkNPwfcv6qO1jGfESgzYFMHy4InIqlU9Zh59rBeHoEQZIFkqnZmF
         HruKHdq28nHxM+dfzAwajn/9Z6ZXX/6g1BbUy0brVx3xqd9rLdd2/zT8h0vT81SqY7zu
         kjJZHYl68fv1o+zdZZg234OOdJxztU2aqcqP8cm3AnYdxFRoCVDR4yfX1Fkwg008C+aW
         84xg==
X-Forwarded-Encrypted: i=1; AHgh+RpZBjCT0KwIiTQ1oTzsUkW1lJ/P5NouLxHrJqRsSo19mDydTZpkGsiMDxhSpY3Zvr5+2CEcYOuQpvLgTT8=@vger.kernel.org
X-Gm-Message-State: AFuF++ndmGZGyETxoDwkEuT5U4NSWKQ1R014g42Tl8KXccrstBpeTEI9
	BMkHdYcRaTXIL8KuRHJIN1xnRV1jl5Fa8ByGW2Al84Z2esUX9j0xeQDKC40bReffFL2B9myFKzk
	vug2rAw==
X-Received: from pgcv20.prod.google.com ([2002:a05:6a02:5314:b0:cc1:c423:3804])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cfa8:b0:3cc:8f53:26c0
 with SMTP id adf61e73a8af0-3cf86dd6053mr21955403637.17.1787785533546; Wed, 26
 Aug 2026 16:05:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:05:05 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-15-seanjc@google.com>
Subject: [PATCH 14/20] KVM: selftests: Use TEST_EXTRA region in arm64's vGIC
 LPI stress test
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

Use the TEST_EXTRA region/memslot for arm64's vGIC LPI stress test instead
of a custom memslot, so that the primary vm_phy_pages_alloc() APIs can be
reworked to take a region type instead of a raw memslot.

For all intents and purposes, no functional change intended, as
vm_override_mem_region() is barely more than a wrapper for
vm_userspace_mem_region_add().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 9a69c439a0f8..9865b204fdeb 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -164,8 +164,8 @@ static void setup_memslot(void)
 
 	pages = sz / vm->page_size;
 	gpa_base = ((vm_compute_max_gfn(vm) + 1) * vm->page_size) - sz;
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa_base,
-				    TEST_MEMSLOT_INDEX, pages, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       gpa_base, TEST_MEMSLOT_INDEX, pages);
 }
 
 #define LPI_PROP_DEFAULT_PRIO	0xa0
-- 
2.55.0.887.g758fc8c411-goog

