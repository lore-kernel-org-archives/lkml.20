Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140246;
	b=QcLU84eWtwCsPQRXE7PSMshiIIQnrMJnwhlRDPey0NtoZR3G2t8SkKY2c0cIJq/nuMXX
	 unYi9VLMdnhp5cao9v3TbCHOuDcflBNnYUBPRzvbpfh2lVgHkdmcUnsZzAqUADZ7lRldH
	 QhHgYxGiK0JXj8BdH9UHQyXqXEiNXD7Dn2QdEU/DWy0gC/9QiYxcvCIEFybe5IKiaoJVe
	 kjptG4EtPo+14QDI2WyLRg+HfMTadYz8xQFmaGhR1xqI5hIiMiuZQ32rp4qvn6EqSR9SO
	 ABcwOHIL0TnkphN/qXceCbvh6IEu6AbUbM0B/VOK+P7b1ZWCHTQwWYZ0O2U2D0lQ/iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=lXjWY4taTu4hJv4bATl5d396acZLb9e/6END/2fvrmk=;
	b=H/m94T0sYWN3KpV1JqGarJQ0K3CPQwMz/UQV/3OsBGpkzHHYrcdI+SFEU76uDPhrszHC
	 mHIvZ8giQGrrQp2cUWhhAKyElyBkrHp+Z257RK1uex1jXtJXIUhUaJU6+JoY+avzJVm7x
	 KrQcK4ffHWKURRc+P+xV46RtKb/BUZusRfRz+WV/9F5LUkm0AOZOiwvOYq8pHQ6dOh8KU
	 9hC1OKYTSfdWpEv3rZddY00tuVMOpmX0zWy/8aMACwXxgTJi6lvXXC3B2GRfM0qYRzVdo
	 AGdg8KEcwoQnwd4tVLxmY3Oq7Re1Sz0Fnq2WypODGEFcm45Yv6DWYUVybNSEYBkrxRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Im/yoa3O";
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75942606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75942606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Im/yoa3O
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad840053c7so299331a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140246; x=1793745046; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lXjWY4taTu4hJv4bATl5d396acZLb9e/6END/2fvrmk=;
        b=Im/yoa3OlRfL/DkC21L/U7lpLIbVNakCyVQ1NEUJ6dNMP9Dd73MRwFb7JpRqUrMWXR
         okemdh72fE0WSiT47MG60utj6t3wyGsLxPlGXgaawTLsx7eO+uBb0Mif6MKOmVtlhzjk
         OdOgnKK6wZGcyKxHAAhEZmFmq8F7iqNTzBq6s7JEtRYgACU50ZR/vgOfV1ru1La/WWBv
         1aB4Q2b7noa/VJ4J+cyD6l84xs8JE8su/5Ao2rEUK75cKDyeJuveG1K/I7/Zp96uo0sS
         YXbEUfXwERMKJ09aPS2vnmj/tucv+T/JcEzodw6ZH5gSHotr5W9g6AkpFR+8/RhFIC0w
         wasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140246; x=1793745046;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXjWY4taTu4hJv4bATl5d396acZLb9e/6END/2fvrmk=;
        b=Yq9GJCrk76JMRlDVSG6VIjhpO4bXr6NjN1ka+Sq8nd/oNisjZ2WhAoZpaTSYas7qgY
         2+krMFBErFPrSzAqLLYLtR4flPaB5x3yh7dw+Ye3BPIEwzfkvhcbolt43suZEkGN716J
         MYVpIcsJuXLaevXA3jquwD0iCs4xVeALDr9LyVWk7wx+eR+zupiuZbqaT+dNturhfm8a
         INh94bNb3Qpe+V9VM95m8l8hFO/dOYhL8TksiBQjw8FotWd+9ZTS3Q1KZr3M3KXPmLfY
         AV+7qkBsrYn6zbxrOEdBuaQvKJh/7rQ+42B3fBLPEXNWzKbZb/P2C0hKgTb47TgUaz0l
         V1AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhRJGkEdPyYm3mrSIXTYxHQVzSGrPKQSVBGOJyU/ObY4eM3icpn1kC8C9oySs5jVNHABnghOUQ//4o9M0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK35jwxQtsdjwHKyxRRuXJsjCa6jnI6SYsXYE7aLbYGq2SnDGO+
	QjToQk9CBFpOdddt1UMOZAgxD8So62b8QY6SLtxEuO47qcATxWocYWtevTufN0bN1Tif7JlgzTA
	7kTL7Xg==
X-Received: from pjbkb13.prod.google.com ([2002:a17:90a:e7cd:b0:3ab:d5d:f278])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:a09:b0:3ad:a270:a623
 with SMTP id 98e67ed59e1d1-3ae57e35220mr239679a91.4.1793140245550; Tue, 27
 Oct 2026 15:30:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:30:38 -0700
In-Reply-To: <20261027223038.1566931-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027223038.1566931-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027223038.1566931-4-seanjc@google.com>
Subject: [PATCH v3 3/3] KVM: x86: Consolidate invocations of kvm_x86_ops.load_eoi_exitmap()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="UTF-8"

Rework KVM's handling of EOI exit bitmap updates to consolidate the calls
to vendor code so that it's easier to see that the Hyper-V path is doing
the exact same thing, just with extra input to account for the SynIC
vectors.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0028d57e964a..483dac323c8e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8047,6 +8047,9 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_inc_or_dec_irq_window_inhibit);
 
 static void vcpu_scan_ioapic(struct kvm_vcpu *vcpu)
 {
+	unsigned long *eoi_exit_bitmap = vcpu->arch.ioapic_handled_vectors;
+	DECLARE_BITMAP(__eoi_exit_bitmap, 256) __maybe_unused;
+
 	if (!kvm_apic_present(vcpu))
 		return;
 
@@ -8064,17 +8067,14 @@ static void vcpu_scan_ioapic(struct kvm_vcpu *vcpu)
 
 #ifdef CONFIG_KVM_HYPERV
 	if (to_hv_vcpu(vcpu)) {
-		u64 eoi_exit_bitmap[4];
-
-		bitmap_or((ulong *)eoi_exit_bitmap,
+		bitmap_or(__eoi_exit_bitmap,
 			  vcpu->arch.ioapic_handled_vectors,
 			  to_hv_synic(vcpu)->vec_bitmap, 256);
-		kvm_x86_call(load_eoi_exitmap)(vcpu, eoi_exit_bitmap);
-		return;
+
+		eoi_exit_bitmap = __eoi_exit_bitmap;
 	}
 #endif
-	kvm_x86_call(load_eoi_exitmap)(
-		vcpu, (u64 *)vcpu->arch.ioapic_handled_vectors);
+	kvm_x86_call(load_eoi_exitmap)(vcpu, (u64 *)eoi_exit_bitmap);
 }
 
 void kvm_arch_guest_memory_reclaimed(struct kvm *kvm)
-- 
2.56.0.307.g5fe7bd680c-goog

