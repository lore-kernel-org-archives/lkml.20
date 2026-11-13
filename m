Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587161;
	b=ZwKnW/n2q8kRs0EBc+EUFHNi66ePzlOXfBDaf+KnDhb1lgYvvHRF8DTrw9+R8TOtE5UE
	 ay01dzkVc5OdhPUlI0SxKzxBzED+f59Lc55po80rVMAaXKkneLq/xvbzNLJXaHa4PNO7q
	 pdSpzFydFuKBugi9nB+FnCdGO7dsECfv8cKlG1QSlVzf26ToCgkcqaBoKirGIghGqkH4j
	 /9NBmCu8c7q8wmZ8RxrBogPWPwK0bviclR2JAR1jJdgU+/D1zSYq3Mu/obxgwaV6p8B6G
	 UFKkKr1rYJflz3Bjr1zzrOERKz46343A4557Mhaelb9utqzZyCjdx5zV7E84UGUlYYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=GZ6f5D4ZsupQmpduex2pVghjzPIcHrDqNZlVzGqwV40=;
	b=FsfMjXuW6ULgPE3V2l+J1dPitgKo+OSXLRw8nGbuMIRTGbsmXz2W4T/S7fpbBqAqglsN
	 ZRn8Cj/oowi09eMIoKVKAFoGGJb5EddwhlWhJSiLwr49IgbNl/71RqXJTeCmMmxASB09f
	 JlCx/uA5wr3j3ZpILjxq7W7gaQ1OUHYP73h/yTclUcaMKJQwUs5eJjXXul/j3nqUCp4eY
	 Hqa9qYz8uC2t+RWncWH76LAZPOZxss8Co3qMn+ymS9e1dQJJge0VPq/Gz9dkFIm2N1OYx
	 AkmEZ1MK386hBjVchwdSYJz6yev7ENWtNtMtlo/ZUhYf+sVpcByAugzpHk6zb2hAlbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nEjKJlZ1;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6119606A8A6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6119606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nEjKJlZ1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1450721a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587160; x=1795191960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZ6f5D4ZsupQmpduex2pVghjzPIcHrDqNZlVzGqwV40=;
        b=nEjKJlZ1JgWD64WbJdFiIqM49Qj0M+pBGto6I0UCMRBRMoK0E8DXLO2UjyTnx3Cy8A
         U+wcCi6qryr4ftL2193yBXjYwXEr+7hSWZcgyVGEVhRdfNGO/wRIijeAWQp3PoTD29/I
         iVA8975nLHbJgUOHKI9qGgs29bi0Fjpk6Yh2I5raEhiix7eYWtMiiehQa90k2yOr8scf
         7g/Hc5nNDxU9RKYq1Mbn+jNc2lo7fOOFN1neE4d9j5vls8ROSRPI84/wv/UGucsbqskn
         4zJuYxtcXou8ofRiCbfBIPMtQu2YcZ44NdVP60m/28WDXrrROC5bJUZwGX52bKdDL+sr
         G/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587160; x=1795191960;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GZ6f5D4ZsupQmpduex2pVghjzPIcHrDqNZlVzGqwV40=;
        b=vKf7d/gyN/xS063lKj1ltY4nXYunH0D1GDKM/bl2YGdlajQ1ETuEWX2h0WBLebfnkA
         iZ2e60HZZU8EUbx3i9CptnRilYIQfDKeiA5Va6kKNviTIfG1HdBJubCnrpUSoBUJdHUK
         yRcKhdAazNrWFHntTk75KrJUXpw/C4V5gG9njB0Ux3uoogQx6Om8v8TmTQSY9FN+WqK7
         VTnaeXp+Trz5IGIXlWPGbnYG8IHPPnGwlFX0irCQLpAQggvv/I+Dupmx4ZC+SMI7KVIQ
         UeikdplmQXMXoMi6141rSX4A6PNZ8hM2A84a9bChTiHk7HdXfxAQIU0pMPJtIUHZp0VS
         eB8g==
X-Forwarded-Encrypted: i=1; AL+hErFB1Ji5AyBXsdlD96PnrUj+FNiVqUGolM3SuFbjPBHPuyG50cuVsUt0qlXwvAv9WIxTYcrWFsSmfWFIC+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EQjK6wp6JgVU8Db9zyCwwnVO2OjgJRcjD6hUSMG5P+hxlFmTC
	yJ/poOqp7N9qxladNAaEdieYuDSnFUQ++ly6IQFtn/B25gz+qMEcFEcf/lq+xcwaI6S7TKpny3z
	SxwctSQ==
X-Received: from pght24.prod.google.com ([2002:a63:eb18:0:b0:cdb:8e32:f9c1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:67c7:b0:3ed:b2b6:9bdc
 with SMTP id adf61e73a8af0-3f7a81b6293mr3098328637.54.1794587159785; Fri, 13
 Nov 2026 08:25:59 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Nov 2026 08:25:56 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113162556.461390-1-seanjc@google.com>
Subject: [PATCH] KVM: SVM: Sync CR8 to the local APIC after marking the VMCB clean
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Carlos=20L=C3=B3pez?=" <clopez@suse.de>, Stefano Garzarella <sgarzare@redhat.com>, Chris Oo <cho@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Chris Oo <cho@microsoft.com>

Sync CR8 from the VMCB to the TPR *after* marking all VMCB fields as clean,
as syncing CR8 can toggle the CR8 write intercept and thus mark INTERCEPTS
as dirty.  Clobbering the dirty bit can result in KVM failing to detect CR8
writes if the underlying "hardware" uses the clean bits to optimize VMRUN,
e.g. when KVM is running on Hyper-V.

Failure to intercept CR8 usually manifests as hangs when running Windows as
L2, as KVM's view of vTPR stays high and so KVM never injects pending IRQs.

Fixes: bb365a506b1e ("KVM: x86: Unconditionally recompute CR8 intercept on =
PPR update")
Cc: stable@vger.kernel.org
Cc: Carlos L=C3=B3pez <clopez@suse.de>
Cc: Stefano Garzarella <sgarzare@redhat.com>
Not-signed-off-by: Chris Oo <cho@microsoft.com>
[sean: rewrite changelog, massage comment]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---

Chris, as mentioned, I need your SoB.

 arch/x86/kvm/svm/svm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 581bc3a23c95..3152846a6ccd 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4726,8 +4726,6 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm_=
vcpu *vcpu, u64 run_flags)
 	if (unlikely(svm->vmcb->control.exit_code =3D=3D SVM_EXIT_NMI))
 		kvm_after_interrupt(vcpu);
=20
-	sync_cr8_to_lapic(vcpu);
-
 	svm->next_rip =3D 0;
 	if (is_guest_mode(vcpu)) {
 		nested_sync_control_from_vmcb02(svm);
@@ -4758,6 +4756,13 @@ static __no_kcsan fastpath_t svm_vcpu_run(struct kvm=
_vcpu *vcpu, u64 run_flags)
 			       vcpu_to_pmu(vcpu)->global_ctrl);
 	}
=20
+	/*
+	 * Note!  Any action that might dirty the VMCB must be done *after*
+	 * marking all VMCB fields as clean, e.g. syncing CR8 can toggle the
+	 * CR8 write intercept and thus mark the intercepts field dirty.
+	 */
+	sync_cr8_to_lapic(vcpu);
+
 	/* if exit due to PF check for async PF */
 	if (svm->vmcb->control.exit_code =3D=3D SVM_EXIT_EXCP_BASE + PF_VECTOR)
 		vcpu->arch.apf.host_apf_flags =3D

base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
--=20
2.56.1.703.gf848ed807c-goog

