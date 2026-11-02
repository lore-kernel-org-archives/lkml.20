Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661277;
	b=fG76Sng6if9psgsuQEKsUaofeFUcm2itHLUzPGklVECuH8vS4u/Nh+p/aTend5ieyjYL
	 xIH/+mG6xwtWrAMy1YjaZHtcUodhg4Ig6DW09ntPso4iOaXOZDDAPmoGdlvfcp54pn6ix
	 TdgCtHSSCJq3fhDNsw69wP/qSY6GEp6y57zp08MrXmBM1+cKbUrdmMNXVhf5h7GHib2L/
	 C/c15G73RNIGp52OaUNsaTSa6CVQHA4y/+2EU9GNHjO1hSZOMZj8FlwTEwbPMlnvnrFUH
	 Rbi6kHPaf0A5QSglxWkSMLSM/D3/LXuXvpNXwfnTFGBptd05/lKe4WL7qUBcmzz7+7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661277;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=RT0rxzu0ZLTbxCcnSa0F1Q77J/Xykcv2UrdOOz1E3eU=;
	b=izUUSL0hL16g+/MRAbHt3qoQTb7o8Vgj9SXtJPaOYFYMmwxL3DyW+3Nq3zTEbJNvv6q2
	 X1jyBDkgwx6rxUKmFm8ucizVOqCN3tqL+PmLuX88YuLj/ExrAeVbrhXY5J04YS+SdEd4c
	 wOql7PbyW3SuoI13QtPSeW3oRxHlxURDRE/SXcyz3QL4IcYUvFVYYelEGRjYiWSbCuoew
	 qwXf4qfnikbP5TCXJVQpAmCgNhY48ytlSjX+7y5zVWfKD1vIDYsRnZ/LK1aRe6WCFP22V
	 IimbzCXBIzo9wmhuMyaWGdPlkrvJYS637DRsY2aU/rpnHf3rEqw++/sfG+UFNPgD1zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bBJ6npKa;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89813606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89813606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bBJ6npKa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793661275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RT0rxzu0ZLTbxCcnSa0F1Q77J/Xykcv2UrdOOz1E3eU=;
	b=bBJ6npKaF0C2TB4JLu5inPlcLo8A94jJ/uhe7mBT5EyszMBqq+TqwTYjwViytDgdyydMVT
	5Ulig2ET2MS1iv2K9hu65kwoCzYrCq+8uH3RlWaB0xBxKamrz7EmriMvT6C18DcoEns7sQ
	5Oc1RVq2HKzdPkphZiNXeDk7E8xVDU8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-CTjQU6D_P4-KZqMTPR_7cw-1; Mon,
 02 Nov 2026 18:14:34 -0500
X-MC-Unique: CTjQU6D_P4-KZqMTPR_7cw-1
X-Mimecast-MFC-AGG-ID: CTjQU6D_P4-KZqMTPR_7cw_1793661273
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F98F1956065;
	Mon,  2 Nov 2026 23:14:32 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A751426C;
	Mon,  2 Nov 2026 23:14:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	stable@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Teodorescu <fane@google.com>
Subject: [PATCH 3/7] KVM: x86: Conditionally resched when restarting REP string emulation
Date: Mon,  2 Nov 2026 18:14:24 -0500
Message-ID: <20261102231428.13523-4-pbonzini@redhat.com>
In-Reply-To: <20261102231428.13523-1-pbonzini@redhat.com>
References: <20261102231428.13523-1-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

From: Sean Christopherson <seanjc@google.com>

When restarting emulation, e.g. of a REP-prefixed string instruction,
conditionally reschedule as emulating guest writes can be deceptively slow
and expensive, e.g. when shadow paging is in use and each write can trigger
write tracking.

In a perfect world, restarting emulation (or not) would be less arbitrary,
e.g. would honor not only host events (NEED_RESCHED, signals, etc.) but
also guest events (e.g. by checking kvm_vcpu_has_events()).  Unfortunately,
as pointed out by Sashiko, pio_in_emulated()'s read-ahead logic is baked
into the restart logic, as KVM relies on restarting emulation to drain the
cache and avoid duplicate reads from the I/O port.  I.e. re-entering the
guest on kvm_vcpu_has_events() or __xfer_to_guest_mode_work_pending() would
introduce architecturally-incorrect, guest-visible changes.

Fixes: 5cd21917da24 ("KVM: x86 emulator: restart string instruction without going back to a guest.")
Cc: stable@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>
Reported-by: Stefan Teodorescu <fane@google.com>
Suggested-by: Stefan Teodorescu <fane@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Message-ID: <20261028173638.1765329-1-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/x86.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 32563a91fba9..c4a06214cde6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6558,10 +6558,12 @@ int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	} else if (vcpu->arch.complete_userspace_io) {
 		writeback = false;
 		r = 0;
-	} else if (r == EMULATION_RESTART)
+	} else if (r == EMULATION_RESTART) {
+		cond_resched();
 		goto restart;
-	else
+	} else {
 		r = 1;
+	}
 
 writeback:
 	if (writeback) {
-- 
2.52.0


