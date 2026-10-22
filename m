Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697892;
	b=aLLvZPXIVw9jMVJ6Yb1O4AN/Y/yaNm04vlIYXOl3ksw6GrdBHBdp8JQsksajWc8qadUN
	 vqaRCRyAT6SNyVsMdxh8Q4sdiG8h+8YxXo8GLQxULNPimDrWt27S/BKHY56M6/M7BlN/d
	 RnsG7ceK2+1ArAIhZyTo5rZ6acD6L4wntgnsMzb+K/qGo2A6fkOkvG1cIwECoi17SZ1Cw
	 /qzyzeO81mcZ6PxcvLmTG+IrbKwU+9IxsuRAqSbnXs/atTI1aiDR5ta9MqO2bQJI3r10s
	 3I+O1wuDZo4WcwPf8abAQs0AfPgs/gYYUShhkHCUwOgGQm8syWn4sy4liACiVVozXgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=s+ssO7Yar1aCyDvBOVmuASAPwfzLrxD3Zbwb3zv4toA=;
	b=Smtq04ljtYDGXx+0A6redubtFjb9HMI3lhpm8a4DfpYfClbcF4pXaNDuvq8DiLD3mSFf
	 tQtkupBWAOBK4aghOsKWInkkQ5vmcrr5P4zV6KkM3rLU2b5GISpKNYXXpKQf4f1sILZlt
	 dXtDmdEclPFw8rmkm8y15J3XFg36d5PYuP5R+SV31bIQzxtCIZdCsFeXN2wcdd1jwJwSY
	 NZ0FZ8bv2qORxCgsxgKpLu5LcSPKtiNbOvOTsm+pYT2Z1ZZ0obMmfud8a5ZtX8I7BATQm
	 BvS4AmOXyXucy3pzyrfktFSzwXN61J8jevETgcCfEOvxabdU1KOSw33XnRLgt5fOAyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Hvl9dGkG;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A92606A337
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A92606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Hvl9dGkG
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so105934a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792697891; x=1793302691; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+ssO7Yar1aCyDvBOVmuASAPwfzLrxD3Zbwb3zv4toA=;
        b=Hvl9dGkG/2/MbNqQqxsjecqdesrlzRt2BqCgag5GrcJrJdup45TesvJtpCfvZyr+Hv
         Pgtrs2PQeEu1MlGa54tLudDHH2sTvleozIY7hpwxkaVkGIJhCHAPDOE4xbmdD6NM/5FO
         fXiAutLAvrRnJ2B6eykGjdFni86N95p3aYBpbF9sYlKIjxB5Dom66JP4ANf67ryIZp7B
         iDv4EA47D4syfBiYggz3HWsh1Q7ZXe7PyJwLs6UrJweJMUXdv40aeU43hVMI5KbnnitV
         QSCslMMASLXgNPqdHcVDPW+VcWUxWWCUtQxmF45x2qpF1zSGip0hYoby2rhYOAzGO8l+
         QYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697891; x=1793302691;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s+ssO7Yar1aCyDvBOVmuASAPwfzLrxD3Zbwb3zv4toA=;
        b=CuNC+TgKIwgY0NeYy7ZZELzzqF408ihQROkVtaFIK48g7eu1qVdxm4srk1ug97lq2R
         iLv0zxlDU9BthpnZtQT//jDjwGEKgU+Jv/vkXZG5ywAmz4mpcC0r02pN0ksIoYpupxz6
         833tIpdGQh1uhgpQh4WdAZLO8LcJxhkvRuQTy0neSZgo32YYWtOP+yTU+xsyML9pkw/E
         IXB9jhnWBRbburMdPsPTXGqDwmgeyVd4vsC3qNXAWP44DLcL2cGtFXObL9/wnoY8Bvv6
         h4Oa0ZgVp5xmkkQE39O2sKjM7MbPEs3zjKTKj3ggkhXGQpqlrDw93mvwVcJtcJghtzL9
         7uNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ3ALRVdFJLD8Ch0SO6WNwqiei8SPRvpirmZBbxNftoadagLe6CLsLT2NasVTV01GXi3R/6Bq16gen+n8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfTM+0ryVCS2zypkO46YSXqzJx5MZTr1HxNuaQb8wPyHPEhp90
	sXGEYpD9qfAzI5i/XocnyMohgpmri7DwoUJazu6p4PAyR2av9qmZUTHuWl8d65ZeEM+5eQw/nNy
	FnE3XaA==
X-Received: from pjbst3.prod.google.com ([2002:a17:90b:1fc3:b0:3ac:63e0:9609])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e4b:b0:3ab:2ad1:f10a
 with SMTP id 98e67ed59e1d1-3adcd7f6cacmr2249a91.0.1792697890904; Thu, 22 Oct
 2026 12:38:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 12:38:08 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022193808.557206-1-seanjc@google.com>
Subject: [PATCH] KVM: x86: Ratelimit all I/O APIC and local APIC kernel log messages
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chris Mason <mason@kernel.org>, Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, 
	Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="UTF-8"

From: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>

Ratelimit all of the kernel messages in the APIC code, as every single one
can be triggered at will by the guest.

Opportunistically use the more modern APIs so that the messages are run
through pr_fmt(), i.e. get prefixed with KVM's name and info.

Fixes: 1fd4f2a5ed8f ("KVM: In-kernel I/O APIC model")
Fixes: 8f423a80d299 ("KVM: SVM: Support MMIO for an SEV-ES guest")
Cc: Chris Mason <mason@kernel.org>
Signed-off-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Co-developed-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
[sean: smush everything into one patch]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/ioapic.c | 4 ++--
 arch/x86/kvm/lapic.c  | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/ioapic.c b/arch/x86/kvm/ioapic.c
index 0d59b9c758c2..df15d940181c 100644
--- a/arch/x86/kvm/ioapic.c
+++ b/arch/x86/kvm/ioapic.c
@@ -647,7 +647,7 @@ static int ioapic_mmio_read(struct kvm_vcpu *vcpu, struct kvm_io_device *this,
 		memcpy(val, (char *)&result, len);
 		break;
 	default:
-		printk(KERN_WARNING "ioapic: wrong length %d\n", len);
+		pr_warn_ratelimited("ioapic: wrong length %d\n", len);
 	}
 	return 0;
 }
@@ -672,7 +672,7 @@ static int ioapic_mmio_write(struct kvm_vcpu *vcpu, struct kvm_io_device *this,
 		data = *(u8  *) val;
 		break;
 	default:
-		printk(KERN_WARNING "ioapic: Unsupported size %d\n", len);
+		pr_warn_ratelimited("ioapic: Unsupported size %d\n", len);
 		return 0;
 	}
 
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index ecf611845fb1..a49bb38b4f70 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -1123,7 +1123,7 @@ static void kvm_apic_disabled_lapic_found(struct kvm *kvm)
 {
 	if (!kvm->arch.disabled_lapic_found) {
 		kvm->arch.disabled_lapic_found = true;
-		pr_info("Disabled LAPIC found during irq injection\n");
+		pr_info_ratelimited("Disabled LAPIC found during irq injection\n");
 	}
 }
 
@@ -1359,7 +1359,7 @@ int __kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
 
 	if (irq->dest_mode == APIC_DEST_PHYSICAL &&
 	    irq->dest_id == 0xff && kvm_lowest_prio_delivery(irq)) {
-		pr_info("apic: phys broadcast and lowest prio\n");
+		pr_info_ratelimited("apic: phys broadcast and lowest prio\n");
 		irq->delivery_mode = APIC_DM_FIXED;
 	}
 
@@ -1826,8 +1826,8 @@ static int kvm_lapic_reg_read(struct kvm_lapic *apic, u32 offset, int len,
 		memcpy(data, (char *)&result + alignment, len);
 		break;
 	default:
-		printk(KERN_ERR "Local APIC read with len = %x, "
-		       "should be 1,2, or 4 instead\n", len);
+		pr_err_ratelimited("Local APIC read with len = %x, should be 1,2, or 4 instead\n",
+				   len);
 		break;
 	}
 	return 0;

base-commit: 164405e8e9a0378c7e1aff2254625a6553a291f1
-- 
2.56.0.257.gf7497c7d27-goog

