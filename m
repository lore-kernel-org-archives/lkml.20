Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793304136;
	b=SWD1yfwXTLrM7VAlaCG6qXUqBQ8C7NVL5cSqY46fEQSpYwVGyDhuKVqIJm9oKoaB6B8Z
	 b9XngUkA40xDMnlX8/QBIrCS26tQhWzCy4a48oJUROBI/ByxoPDOLJpXJChLPJ/XWkuZ6
	 XwOz0CFktdEunJfaZopcgAPkYoE0lrGOSzejoopF4H7tqiud/x3y4M2+HmVBS3URYK758
	 jV1IeX3qpUlc2PTHxSCtjFw7jGVfsZy5QxjMp1hFPA7GR1eVvxmJrAi9aGHUZta/zuQxs
	 9Dufz4H9QpyzaFz2PxVljDHDCS1OJ0lSvWUtS6FleNHAkNllaeSan2eI4UzF86AnfmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793304136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ToZEVjNJ0PTS0mMKreAcFedmCPAxwnkNokZhg87lyPA=;
	b=dmNTKFYlD/6NUyz8EZNCKylYLsAqziz0PCMDcRQdl2XXrwaM+KwLqU2pZTVPLgaGtCpf
	 VaxR0kxkQj+NoteZTvq95WNTdz0c8vZ+gRwOgeV/TkHVXuiDd2BgLMB9JUW1/1uvvFDc8
	 EVXzFYUzHYuFRoXSs5LQ15wuj/NxoY+azOy2WYJjhnoZCWS97UoeaVEN6J9ot3ZKteInN
	 mIbsmJgNe2Z+hLdoCvT62t2GOyML0aVcS0sDCqMbzJAlsnNxAAe0UnT24epe1iHxViaTe
	 v2Zko1ET+viHbg1wmlvCRD8KUn9RlZisZ5rK7vJh4LBzRZC07wyb79uceG9k8bVLpew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvz.org;
	spf=pass smtp.mailfrom=openvz.org;
	dkim=pass header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=i69iXx1r;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3378B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3378B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=i69iXx1r
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so17434575e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvz.org; s=google; t=1793304134; x=1793908934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ToZEVjNJ0PTS0mMKreAcFedmCPAxwnkNokZhg87lyPA=;
        b=i69iXx1ra30cdw3Wzg0EB2AItA+4a4gdg+DYEuUs7L1ectKkJUogAWvyDaVN86G3Eu
         v+JpLjSZskJASW1DEHuMKsrWpSHY+4WCqOhx3j5UlfbyKAkRBBFSq8F4X3zz9zoV+GBa
         WbB+NqS+zjFUYPh3rGWHd5X8cVrMPn3LoY9+yXT1fmhGLlu93emY3G6S0ty5wDwK+TNV
         nCmu+w5EGIj7iyGcGMHSkoeQ0po5w/q67XOYvps7rtSr5P44Hp8ybB00x6MwvaI5WOtt
         dcbv99KJ6+fdKRD2IVd+mhhAPcA8ojpEBY/aauf6n8SislG4mGKHL45dxcEzhb0ZUz3K
         9o2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793304134; x=1793908934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToZEVjNJ0PTS0mMKreAcFedmCPAxwnkNokZhg87lyPA=;
        b=nzG4lMERDH8kzlQuPpNmCg50XFgbPFMv5Zwxx7WYiuB0+EK3/7QmGRAI48dNtXD6EO
         ePZgI90o/fyu83k11wSImtwRTnRmLrthkJqLfrylhY/LsxJczGXv+BYU/g0ICCOh2Q05
         y6+q7d/lVM1fvUgP6USHNcSoZoYsOxDyR+X7SRU3bY7dRXKFrgAUvLiz1qS7VS06Apge
         CuzpvmTIDBQAVpmURa+s18wOCMarhDfTbKb/iJ103ZwZhASDQDw5bico8nu39FCJokxF
         hms+wHqOau8W6p7RlOTcjJoY7io2a6OPmItk0Z4d5Nxdk0BT773Kixij0RhQQwc9rmlu
         VB+Q==
X-Forwarded-Encrypted: i=1; AKwUvByuEWKNPoxH6+m3WYBt9m4GVraPjMt8k2QCr9N8vNRJDnOaS7gUkyQAVh0cCmAxyP4zJvZcF49Oy+Dr9J0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8HBpT6e5BMQttMWTU0nnhfJzRlOVPYfdVGb15HuNZX4miH04V
	2ChK1PaB/1xiL/VC/JkFMSvgIY5Hb1r3BhkLILKh0nnjUti0jxb3j60f4KbI8Sz7jIQ=
X-Gm-Gg: AYBFou0INCk37kPXx50X562nD3j6GHwEyji63pLc0upwpMmseH487s4pGRpbC/+Q6JI
	0UmtVmO8/5H32chH0NwWP8aBRsoov+wWQ4CXHOnqBzHaTxtTlFGLx9YY/LeLq4w1aVvX54b/9W7
	iDx1U2QpRq0u8dRm4bEiSwSE1VpTQJ6ImzmBDIR8XIiU+8RxwW8jnbBcGj2lU5dvuCmNn6uXcwe
	Qyz8tK7xjjvnObxCW+IE06KkHm7/AvEQ3r2KEyrtRjihxO4oRF218fC+WYD8yLMdEvzb341g94y
	CkSgaElLE/RJGGFWgwJ0hFYn4r4eWfo6HdD96GthYW6SdXejH4KQHZjkHct768Smmab+en6Gih3
	o+K5MI+Ao0uA+PvRPD/BgY1Y8nBGm4JkvqWRBO5Hbt/y6dl7nwD404S9KtE5r/YF8NX54tXmO9Y
	VaMVMrp0TCEbSWFGSe+Z2iZnIuTcWgKkWTcD4OZdu/c9eYtxFa5qCYWihq1J7kVLO8hx21aS2Nf
	ywvkpTh4txpj5jKlOv0h3giQ/w4+Rqh5vQ78KMFQEKydD9EZnAH0ISrV6I4H0JgrcWxF8Yj7enn
	4gJJ1OS9YmLRfsHb4VIM+SpdsQ==
X-Received: by 2002:a05:600c:a4e:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4ac187a766bmr583785e9.21.1793304134476;
        Thu, 29 Oct 2026 13:02:14 -0700 (PDT)
Received: from athena.sw.ru ([2a06:5b06:b600:300:f4be:f111:4ee0:40d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm84628175e9.1.2026.10.29.13.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:02:14 -0700 (PDT)
From: "Denis V. Lunev" <den@openvz.org>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	den@openvz.org
Subject: [PATCH] KVM: x86: Fix lost EOI when unmasking a pending level IOAPIC pin
Date: Thu, 29 Oct 2026 21:02:11 +0100
Message-ID: <20261029-kvm-ioapic-eoi-v1-den@openvz.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the guest unmasks a level-triggered redirection entry whose line is
already asserted, ioapic_write_indirect() injects the pending interrupt
first and only then asks the destination vCPUs to rescan their
ioapic_handled_vectors and EOI exit bitmaps. If the same write also set
the vector or the trigger mode, a destination vCPU can take the interrupt
and EOI it before the rescan. A posted interrupt reaches a running vCPU
without a VM exit, and the EOI is then either virtualized without an exit
or dropped by kvm_ioapic_send_eoi() because the vector is not in
ioapic_handled_vectors yet. Remote IRR stays set and the pin delivers no
more interrupts until the guest reprograms it.

Linux programs the entry masked and unmasks it with a separate write, so
the vector is scanned before anything can be injected. Windows writes
the vector, the trigger mode and the mask bit in one go. A virtio balloon
on INTx whose line is already up when the driver connects its interrupt
then stops receiving interrupts for the rest of the boot, and the guest
ignores every later balloon target.

Make the scan request before servicing the pending IRR. The request
waits for the destination vCPUs to leave guest mode, and each of them
rescans the routes and reloads its EOI exit bitmap before it can enter
the guest and take the interrupt.

Fixes: c7c9c56ca26f ("x86, apicv: add virtual interrupt delivery support")
Fixes: 3bb345f387dd ("KVM: x86: store IOAPIC-handled vectors in each VCPU")
Signed-off-by: Denis V. Lunev <den@openvz.org>
---
Reproducer: "[kvm-unit-tests PATCH] x86: add ioapic_eoi_race test for
unmasking a pending level pin", posted separately. On a nested Intel
host with APICv and a 7.2.13 kernel it loses about 95% of the EOIs in
the single-write case. With this patch it loses none, the masked-write
case never loses any, kernel_irqchip=split is unaffected, and
x86/ioapic.flat passes.

The symptom in the field is a Windows guest whose virtio balloon is on
INTx: the balloon raises its line before the driver connects the
interrupt, Windows programs the pin and unmasks it in one write, and the
balloon gets no further interrupt until the next boot.

 arch/x86/kvm/ioapic.c | 66 +++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/x86/kvm/ioapic.c b/arch/x86/kvm/ioapic.c
index 0d59b9c758c2..8cca333cdc9d 100644
--- a/arch/x86/kvm/ioapic.c
+++ b/arch/x86/kvm/ioapic.c
@@ -384,39 +384,6 @@ static void ioapic_write_indirect(struct kvm_ioapic *ioapic, u32 val)
 		mask_after = e->fields.mask;
 		if (mask_before != mask_after)
 			kvm_fire_mask_notifiers(ioapic->kvm, KVM_IRQCHIP_IOAPIC, index, mask_after);
-		if (e->fields.trig_mode == IOAPIC_LEVEL_TRIG &&
-		    ioapic->irr & (1 << index) && !e->fields.mask && !e->fields.remote_irr) {
-			/*
-			 * Pending status in irr may be outdated: the IRQ line may have
-			 * already been deasserted by a device while the IRQ was masked.
-			 * This occurs, for instance, if the interrupt is handled in a
-			 * Linux guest as a oneshot interrupt (IRQF_ONESHOT). In this
-			 * case the guest acknowledges the interrupt to the device in
-			 * its threaded irq handler, i.e. after the EOI but before
-			 * unmasking, so at the time of unmasking the IRQ line is
-			 * already down but our pending irr bit is still set. In such
-			 * cases, injecting this pending interrupt to the guest is
-			 * buggy: the guest will receive an extra unwanted interrupt.
-			 *
-			 * So we need to check here if the IRQ is actually still pending.
-			 * As we are generally not able to probe the IRQ line status
-			 * directly, we do it through irqfd resampler. Namely, we clear
-			 * the pending status and notify the resampler that this interrupt
-			 * is done, without actually injecting it into the guest. If the
-			 * IRQ line is actually already deasserted, we are done. If it is
-			 * still asserted, a new interrupt will be shortly triggered
-			 * through irqfd and injected into the guest.
-			 *
-			 * If, however, it's not possible to resample (no irqfd resampler
-			 * registered for this irq), then unconditionally inject this
-			 * pending interrupt into the guest, so the guest will not miss
-			 * an interrupt, although may get an extra unwanted interrupt.
-			 */
-			if (kvm_notify_irqfd_resampler(ioapic->kvm, KVM_IRQCHIP_IOAPIC, index))
-				ioapic->irr &= ~(1 << index);
-			else
-				ioapic_service(ioapic, index, false);
-		}
 		if (e->fields.delivery_mode == APIC_DM_FIXED) {
 			struct kvm_lapic_irq irq;
 
@@ -451,6 +418,39 @@ static void ioapic_write_indirect(struct kvm_ioapic *ioapic, u32 val)
 		} else {
 			kvm_make_scan_ioapic_request(ioapic->kvm);
 		}
+		if (e->fields.trig_mode == IOAPIC_LEVEL_TRIG &&
+		    ioapic->irr & (1 << index) && !e->fields.mask && !e->fields.remote_irr) {
+			/*
+			 * Pending status in irr may be outdated: the IRQ line may have
+			 * already been deasserted by a device while the IRQ was masked.
+			 * This occurs, for instance, if the interrupt is handled in a
+			 * Linux guest as a oneshot interrupt (IRQF_ONESHOT). In this
+			 * case the guest acknowledges the interrupt to the device in
+			 * its threaded irq handler, i.e. after the EOI but before
+			 * unmasking, so at the time of unmasking the IRQ line is
+			 * already down but our pending irr bit is still set. In such
+			 * cases, injecting this pending interrupt to the guest is
+			 * buggy: the guest will receive an extra unwanted interrupt.
+			 *
+			 * So we need to check here if the IRQ is actually still pending.
+			 * As we are generally not able to probe the IRQ line status
+			 * directly, we do it through irqfd resampler. Namely, we clear
+			 * the pending status and notify the resampler that this interrupt
+			 * is done, without actually injecting it into the guest. If the
+			 * IRQ line is actually already deasserted, we are done. If it is
+			 * still asserted, a new interrupt will be shortly triggered
+			 * through irqfd and injected into the guest.
+			 *
+			 * If, however, it's not possible to resample (no irqfd resampler
+			 * registered for this irq), then unconditionally inject this
+			 * pending interrupt into the guest, so the guest will not miss
+			 * an interrupt, although may get an extra unwanted interrupt.
+			 */
+			if (kvm_notify_irqfd_resampler(ioapic->kvm, KVM_IRQCHIP_IOAPIC, index))
+				ioapic->irr &= ~(1 << index);
+			else
+				ioapic_service(ioapic, index, false);
+		}
 		break;
 	}
 }

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.53.0

