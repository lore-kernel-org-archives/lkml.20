Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902665;
	b=EC25UVjKhIZUIYBIOVDhkfeiVjxJhzkSZhw2Ot5+IAqVViPaIpDqmRFQUoMWeUgKyNc7
	 u3nKzO5lcNeLlsA9OrXJ0eS2fMBGbkGrfsprer+2Ug1Dm7FEGI52Fj+mfeUfM9xsDIHBh
	 TLASSd9rULElotxYeCIqrpJAgbr0qWsRI0RsZk/FWplsJJWFKZg3E4w89Mj+ds7Q/2b4z
	 gVhXUA3CwleU3c/QLP4g5OUkmZ2XQbGV+MXKxSuZ/PbR93mlOd27y/OON6U43UrkbOr5U
	 obsDtqmURDLJy7+QgsSbJ4Dzznr1sSfKgdk2cKcaEGvOujN5eJ1x/TjaSk+W/Gw0i2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=RSve3Rzibv2SYG1Dy0Z1Qv5oy3nhoFx9D69qTZufN8s=;
	b=fQeNSyvGI5Zw01QKPVI+klKFp7CQGR+y5rL0ShaK4bl0Jl6o+H1Vct7F0ReTh7Fm+AGe
	 cOCS9Pe9af5RpNT0wKkD5+UEZ0VwD9Q6/iwE07AMnu8d18QHU+jDUeGLbkoHTZNXneS8G
	 3+QdbIsLraKbTbVL3x4Iz4kZiLqVElBMI6lhlsFQD9szAraLYoH3vaFZzYNyD8k+G2xAp
	 mVjqCxiO7VcOS5ilQiksW7iA1jFDk+/kVEMz/B60ctLvVlpGA7bzwKq/zivmcf8tI3hP6
	 y1o1EltloBRFfpPvS886nlYht9yitFSjj6DpXXfmH0elfqquGVl/Pu6v9fyDSLOSJ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="RD/NLS8o";
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13D606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B13D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RD/NLS8o
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so2240962a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793902664; x=1794507464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSve3Rzibv2SYG1Dy0Z1Qv5oy3nhoFx9D69qTZufN8s=;
        b=RD/NLS8oA6H9b3VuAC0Rxp4BPg1H4sBR+9VFz5nmENouymgYWxTyywsHhwOWY4jfE+
         8EcfcGn+CkAvY6crujoLhpzp02VbnNjxQAQL/U5u7XSoHgfkjgcQrqi2lCBpg1o6hjwQ
         Ue1oLePJGAmqTA3sOkoZB+jj/myGVxMzg1UpIuV0H17S8QsKuBnaDbw6NICZI5BzllMB
         YEU3YER9TS1jjaXOsC63kclaFjLFhAYsVnANP3YIAQ3dCmuIRm+4mvS1PLf4APGDnBn7
         Hw8cdP/bU32RpCoyNQTFmWDEQvS+ukxljb0jmrkoX4YJNzd+P96RrFpUh5zPGCy+xXxJ
         jpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902664; x=1794507464;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RSve3Rzibv2SYG1Dy0Z1Qv5oy3nhoFx9D69qTZufN8s=;
        b=e8l59BzsfPWs4wzPOQquAXldQVuRjktHNf1CwZovuzBxaPMIrUJikJ7n6KDku9VmUA
         uJN6GRSBD0EiDbfJR2RRBsqQ0rWZc0q5/EuXF0f5kwkXa5mX6d9a8mBTpW7+cwz0kVMB
         28D8v3hvCnkTAZpzp4mvkG9OaoOXVIEpmJNEWTmhisvHYceAmHWFD2I9hAtSkJRLTXFy
         I6yIVMlW2PGfYAJpEHp6KLhYhGm2m2C4MyNTlSTT0O7/DGcTHNgvXvG1KzFdwBn30ybw
         3DEDslC9JWTFu9O4N8ykJJvuzYmz3PMD4SCox5gr03c+UlmeWsm6xjzO858A+14XU5Xn
         JfiA==
X-Forwarded-Encrypted: i=1; AKwUvByYtT5fBM3eY4DSTludo+6C4Gblo02YnitVT5uw8bQCS7bX0ccmZzZ6OAC+0OzmI1d8HSsP0Sr6+eVU40Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kh2DMdZrcCWwvH7WUtepvYzmujQjO5QWeq/iOWyx6Ag6dmVm3
	wzdLOk7QEbHwMixYcleV7uSTHLkeEic6TdPFwaH2op/8lmrWfbAsUuQBovV4TrWBl6w4/02K4dh
	tm2pdSw==
X-Received: from pgni8-n2.prod.google.com ([2002:a05:6a02:6a48:20b0:cc7:b455:d1fe])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a22:b0:3e2:9261:2342
 with SMTP id adf61e73a8af0-3ebb29c313amr354931637.28.1793902664215; Thu, 05
 Nov 2026 10:17:44 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  5 Nov 2026 10:17:42 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261105181742.3718448-1-seanjc@google.com>
Subject: [PATCH] KVM: VMX: Re-pend KVM_REQ_APIC_PAGE_RELOAD if getting backing
 pfn fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, "=?UTF-8?q?Carlos=20L=C3=B3pez?=" <clopez@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Retry loading the APIC-access page if getting the backing pfn fails for
any reason and APICv is enabled, i.e. if the vCPU will consume the value
stored in vmcs.APIC_ACCESS_ADDR.  Dropping the failed reload would result
in KVM running the vCPU with a stale backing pfn and in all likelihood
break APIC emulation/virtualization.  E.g. if KVM's page tables are able
to map the page, then guest accesses would go to the new physical page
instead of being treated as APIC accesses.

Opportunistically WARN if the memslot lookup fails, as KVM fully controls
the memslot, and VMX doesn't support inhibiting the APIC-access page, i.e.
KVM VMX should never delete or invalidate the memslot while the VM is alive
and reachable.

Do *not* WARN if getting the pfn fails, because despite KVM controlling the
memslot and allocating the backing page, there is nothing special about the
underlying VMA.  I.e. userspace can munmap(), mprotect(), etc. the VMA and
thus prevent KVM from faulting in the page.  If that happens, it's firmly
userspace's responsibility to re-install a valid mapping, e.g. to prevent
the vCPU from getting stuck in an endless KVM_REQ_APIC_PAGE_RELOAD loop.

Fixes: e8fd5e9e9984 ("kvm: fix crash in kvm_vcpu_reload_apic_access_page")
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-191120@kernel.org
Cc: Carlos L=C3=B3pez <clopez@suse.de>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---

FWIW, I actually verified this is a real bug, and that the fix works, by
hacking KVM to map the APIC-access page at a hardcoded virtual address, and
then modifying the xapic_ipi_test to unmap() and mmap() that virtual addres=
s
(usually at a different pfn).  I didn't Cc stable@ because unmapping the
APIC-access page is all but guaranteed to be fatal, e.g. the VMM would have
to blindly retry on -EFAULT when trying to fault-in the page into the MMU
inevitably fails.

 arch/x86/kvm/vmx/vmx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b341af4c6057..13dcf9c12c83 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6923,8 +6923,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *=
vcpu)
 	 * APICv is enabled, but paranoia won't hurt in this case.
 	 */
 	slot =3D id_to_memslot(slots, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT);
-	if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
+	if (WARN_ON_ONCE(!slot || slot->flags & KVM_MEMSLOT_INVALID)) {
+		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
 		return;
+	}
=20
 	/*
 	 * Ensure that the mmu_notifier sequence count is read before KVM
@@ -6941,8 +6943,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *=
vcpu)
 	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
 	 */
 	pfn =3D __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &refcounted_p=
age);
-	if (is_error_noslot_pfn(pfn))
+	if (is_error_noslot_pfn(pfn)) {
+		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
 		return;
+	}
=20
 	read_lock(&vcpu->kvm->mmu_lock);
 	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))

base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
--=20
2.56.0.567.gdb80ae8cd5-goog

