Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D43368974
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521418; cv=none; b=ZA7xNolun4XSvCviUzidj9xOxuAHjj8TRKhAU65kPSpxdAgcTFkxmPsN8MJRtxMPdxltY5htEUadhL/pLd8GWvfCECf6ob2NgOn8TOJrr+bxe/De786+5oOVA509PJ1TywqubjWl71g8ljBnrrqeWzI8cGGdhJLU5TBRiQK3QZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521418; c=relaxed/simple;
	bh=216/wYizxGLHD+qkqJ2pEnNxRVF4UfK2elr3VXYWuzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RGJPKA/zMXcDwbZIUHA4m6g0geOuNq0v49BBbRx8UoHivnZQzDWGh+65X71sOeZNmETuhkq+/+0vJJTgcje8yj3rKXchEYWX1XCMjTXjq7jlMDaXcnrMpaMAYBIBbXoxXE8qoM6BzdnXpQVhtKXOSm+78NeEjgjnMwpkWg+Wf0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElNuKWBl; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElNuKWBl"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-43bf9548df4so772344fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521415; x=1789126215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bHwdXwsbeX7yXRjUhV4YagL8g4TaRsbjc2G3J2vsLYo=;
        b=ElNuKWBluVAS0Dit2N7+eukK8fW6fk2sUF3ORkbYo0cM/N7J5JC/dldkVljY/hnxx9
         zi3p9c2d3U7jDLs/rwUl0VhY9e/CZiTFgF5osIVatE7H3MYUWCDgIS79ahUTe75++kH6
         BOa90tUrFw8CzlbUzjYtrTo5VBj3YTowF0/yJGF7qMFoUux5KCtooWQ2eM2Njc45AZxm
         LIQZabbM8OgdWoRoTQ23dv8P5b8mngJa0cFJXZI9ZYuhpLixgAun5bWywdv6rqbOn/mR
         8Hp+qck+7Vu/KwMEUcgz0cuwktEAxZj3j6q9VXhH47fWNzyqDUfvjw8i8VWfWVc+ZsVt
         RKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521415; x=1789126215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHwdXwsbeX7yXRjUhV4YagL8g4TaRsbjc2G3J2vsLYo=;
        b=MULYx6uB8oB3lV05dao0PcjGIQ3+lEiaqvYdSnDwlmDlflDhHhIDq2BLcjKPgfWmp+
         K/HUIyQIhbOSz5GwU0P2GbjVyX396XSSwU4LnnA4335TduJ0L7J6ppg9Eyk/KknVio6r
         EPM9zpvdg/kpb5YiO6gbUBst0tBKjZbnsstTUERFXuuxQxT6OHgfRlnCL+iZCSRsl7Cw
         RNGekQ2OX91CnE4alYXSeUlwfNSe16uirAYDUJ2ZOdIYr1hBObDzRSOxXw8fQB1kVi9b
         am+RDIZGeQ32o6roMvn898MVNOjbOMA9hLsykxxv8ULlzb5qR3HMYNFSpLmj4tSjCGau
         0Yjg==
X-Gm-Message-State: AFuF++nOk6cs8lIDxEpWZRzDb+yofYntWiaLVBn0kkk9JwjHzqviiHF5
	/e4V2OEIqEQfHGzKyQJ190lj9NO83ji2zMEsilv7CpLTv6aNXioMQLBg
X-Gm-Gg: AYBFou1TqbQjW4htIib0I4W4fyax+oRuE81rpvX05Fae/PzEtr+RJpytHcAJ4XDfsNy
	BofTrTn4xa1bEvkggSB/fg76iYE5Fz4PlKy7jmUxFau61AGRRl1pscLvcqrvw1xSlUYQo4mcCq0
	yyByzovbRnPg0TN8OlfT7zVuiOJVkD0LIlqdwfUjFseFexm+c+uk2IJFno8pGk0Rky/NvoxKlpf
	YovDMjw7IDOU1azlMoQ+i1eeHoBPJK11p5zcvA5rRE5wjn+rfsyA8uKpHqU1xN7nU521DtQambn
	SX3fhpxJvrQ83BGjkZS9h9tDwpwDlVDTF2/r2mEsXSw+p4ywttoGDeHBi2lVcdoDahm8tmnjZI2
	hSzOgTk/g9OAakygxPMWZWcT3zpNBPW8Dwcgiio4uPL630nZrxE/AcTZSQXy0u4+eMO/ggI2tzR
	RWzM8djlGt1fVXDQ/7qfhi/1wA0D6lvJ7L4s9yeU7mFhQD+NRkAh2O6/KUHmWDc/U3bCOIfUQxU
	1QDZe5+Q4gTvTY=
X-Received: by 2002:a05:6820:c3d7:b0:6b7:46fa:16aa with SMTP id 006d021491bc7-6b746fa1b6bmr1532019eaf.63.1788521415450;
        Fri, 04 Sep 2026 04:30:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243908a9sm5509827c88.9.2026.09.04.04.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:30:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH] x86: fix typos in comments
Date: Fri,  4 Sep 2026 17:00:07 +0530
Message-ID: <20260904113009.9836-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/x86/include/uapi/asm/kvm.h | 2 +-
 arch/x86/kvm/lapic.c            | 2 +-
 include/linux/kvm_host.h        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 1585ec804066..79bfd945e5c4 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -551,7 +551,7 @@ struct kvm_nested_state {
 	} hdr;
 
 	/*
-	 * Define data region as 0 bytes to preserve backwards-compatability
+	 * Define data region as 0 bytes to preserve backwards-compatibility
 	 * to old definition of kvm_nested_state in order to avoid changing
 	 * KVM_{GET,PUT}_NESTED_STATE ioctl values.
 	 */
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index e1f3cea14765..d48615a1a275 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2699,7 +2699,7 @@ void kvm_apic_write_nodecode(struct kvm_vcpu *vcpu, u32 offset)
 	 * virtual APIC state, but KVM needs to conditionally modify the value
 	 * in certain cases, e.g. to clear the ICR busy bit.  The cost of extra
 	 * conditional branches is likely a wash relative to the cost of the
-	 * maybe-unecessary write, and both are in the noise anyways.
+	 * maybe-unnecessary write, and both are in the noise anyways.
 	 */
 	if (apic_x2apic_mode(apic) && offset == APIC_ICR)
 		WARN_ON_ONCE(kvm_x2apic_icr_write(apic, kvm_x2apic_icr_read(apic)));
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 03bfc92864b6..b9d3ce31a9ab 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -101,7 +101,7 @@
 #define KVM_PFN_ERR_NEEDS_IO	(KVM_PFN_ERR_MASK + 4)
 
 /*
- * error pfns indicate that the gfn is in slot but faild to
+ * error pfns indicate that the gfn is in slot but failed to
  * translate it to pfn on host.
  */
 static inline bool is_error_pfn(kvm_pfn_t pfn)
@@ -2461,7 +2461,7 @@ void kvm_arch_update_irqfd_routing(struct kvm_kernel_irqfd *irqfd,
 #endif /* CONFIG_HAVE_KVM_IRQ_BYPASS */
 
 #ifdef CONFIG_HAVE_KVM_INVALID_WAKEUPS
-/* If we wakeup during the poll time, was it a sucessful poll? */
+/* If we wakeup during the poll time, was it a successful poll? */
 static inline bool vcpu_valid_wakeup(struct kvm_vcpu *vcpu)
 {
 	return vcpu->valid_wakeup;
-- 
2.48.1

