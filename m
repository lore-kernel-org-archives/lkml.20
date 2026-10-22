Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635506;
	b=sko9u4g7IVZ3Z+V0uaNQv3Oz/vqq1l2t1ZqFsvTYI1ImVhxy636hgJEBqNiHssf0GLIL
	 i+6Uuwmd9Bc5bcppRPxOpjzKvfvjy/Z+KGGrl2Guki4sQVR1frv2bFOeoWhL/pX0tfo2w
	 2fWxso/tf/PNEo5httaigNF3/QUnAvJy7ZvVYocAH+lG8xlQj+RLSTXLXC4neekSAhwez
	 DelF3IS6BlJpQrweA75R7wfzKzIIBWfCCi6petOCrPZddC+UkvCpFYwp/DUheeMJwUGbV
	 ktQKOJYpyocuhTaI+wkHXmaIrBIRLajL5V1MAr7vwJe/g/9klUJaGnlKsYtvtPwlTjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=J9kW36jpIXb4stgoGGP0Gp0ZwbkfanWyIdpTcVbnUYY=;
	b=o2TOlnOcIseravmE/ygztTg1bFPKYUTQiDuC7UeNRb3bklNVcMpSlwP9Uph08ugzpin3
	 H6w/xhjrU4NfTyd+SJxVQm1IEG+KELbG5cYPCoQ2oYZUpPhrvoz2BhrWcfZXANtRbjG6g
	 fFhMNn9sO0thcAkB7PjqJnWIQtuE0N9CSZy8jGnTw9vLFzieXSf8b+2TsTHO6YYQEMAxC
	 4S8/WdlCmmozYxebjfoAUpsvp+vk/ggf8VI8CKRluncdIHxxpt++4YWCmzFNjqHZCA/+X
	 p39rjnxnQEZxKPk0j/LNbfZZS21sm/s1+jxC7W6+t5GljDptNLfvbpSap2LmzlW5m2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JOxpAJ+B;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3375D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3375D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JOxpAJ+B
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e601800e58so18485985ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792635505; x=1793240305; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J9kW36jpIXb4stgoGGP0Gp0ZwbkfanWyIdpTcVbnUYY=;
        b=JOxpAJ+Bnbk3RfojXwgh8lQCVeLPRcFgsikssuNvG+jeud9ljCrtNTOqgZsc+W+ooI
         Rh11Y7GtvTj2O1L6MU+qhkjoPlNbm5vNejW4K5yGAD41m82kap/qX8/fLhgI3Mg72eu4
         hTKxCMWIUXiBHHW3mIxPkpG4WijVcMHv1HcpryhX/Ojy+MBGmv+gWRT8HOF9/Jg468I9
         YFAjkX5NK/5pdUZD4ptiC0s4hhjlZ5sQZentWb7V0bs0t/n6HHerBRqKWOWMMPgW1t0J
         Gt2gXxv5dhbLSZ8YKIXnF6pa1FguqN7fM/WuyX0a7PqfdCW6qJSXJz1ef7pASUOKXLTu
         WN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635505; x=1793240305;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9kW36jpIXb4stgoGGP0Gp0ZwbkfanWyIdpTcVbnUYY=;
        b=EVyfUuOWHFmjrOJ4Uhj5q6lINSFIGUGA4F4JYi87lKRYMPtSV2DFWsOhZ/MJxyzTjA
         U7Yci34Ysn7GjaAbFYj9Ekieqa63kIgxSzdNLbiTvwf6S43Hn/NwLEcfQjRKzVOGgSvR
         iVETYOUpt9N5HsZjzaZYH5HucN8kSQcHLvc/GE4vkegpSp9s+JjqCClUkjvaIq8DBdYv
         tAjLOI2vsMsgpho3BvuKFUvoyG52ERqEoCZNi82NrQplc/ayP53oS3ifVViMRwAqRp2g
         Agx8mWLMbnYghiiyAXVwLGV4C1VDptqQww9TT8Hx7ItluwBuf6l9z+IBPxdlHk0tGmhF
         z1cA==
X-Forwarded-Encrypted: i=1; AKwUvBz9XnOYm+NAAI1O7tU2Z+lPvgKVbeeHw3/cN7Tl7Oo9aVPtyaobAoSAlT9qkLzH/RfKWmcPztVUYbz3XiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3OWidBp5W4Iji50Pa5fC4oiBqCLUhha6YywcD7vP17hKVplyU
	XQY9g1gPPbaDB5utHdAUYTtnw8L3DdAPM76NNb4wJ9xsS+FXEH8DafIXVtXz3GZqY/NOFFlKNfO
	btRQtmw==
X-Received: from plmm4.prod.google.com ([2002:a17:902:c444:b0:2e8:31af:11b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c405:b0:2e8:1f8a:9113
 with SMTP id d9443c01a7336-2ea43cecf95mr35738395ad.40.1792635505357; Wed, 21
 Oct 2026 19:18:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Oct 2026 19:18:20 -0700
In-Reply-To: <20261022021820.298886-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022021820.298886-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022021820.298886-3-seanjc@google.com>
Subject: [PATCH 2/2] KVM: selftests: Add regression test for KVM writing but
 not reporting vmcs12
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

When saving nested vCPU state, verify that KVM didn't write any more bytes
than it reported, and add a sync+save point in the state test to trigger a
save when L1 is active with a valid shadow VMCS.  Before commit <TBD>, KVM
would incorrectly save the shadow VMCS into the userspace buffer without
accounting for the size of the shadow VMCS.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/lib/x86/processor.c |  6 +++++
 tools/testing/selftests/kvm/x86/state_test.c  | 24 ++++++++++---------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 8374afd08baf..976d53af6de7 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1282,10 +1282,16 @@ struct kvm_x86_state *vcpu_save_state(struct kvm_vcpu *vcpu)
 	if (nested_size) {
 		state->nested.size = sizeof(state->nested_);
 
+		memset(state->nested_, 0xaa, sizeof(state->nested_));
+
 		vcpu_nested_state_get(vcpu, &state->nested);
 		TEST_ASSERT(state->nested.size <= nested_size,
 			    "Nested state size too big, %i (KVM_CHECK_CAP gave %i)",
 			    state->nested.size, nested_size);
+
+		for (i = state->nested.size; i < nested_size; i++)
+			TEST_ASSERT((unsigned char)state->nested_[i] == 0xaa,
+				    "KVM killed the canary at offset %u", i);
 	} else {
 		state->nested.size = 0;
 	}
diff --git a/tools/testing/selftests/kvm/x86/state_test.c b/tools/testing/selftests/kvm/x86/state_test.c
index 500b09762555..5bd9a04a3911 100644
--- a/tools/testing/selftests/kvm/x86/state_test.c
+++ b/tools/testing/selftests/kvm/x86/state_test.c
@@ -60,13 +60,13 @@ void vmx_l2_guest_code(void)
 
 	/* L1 has now set up a shadow VMCS for us.  */
 	GUEST_ASSERT(vmread(GUEST_RIP) == 0xc0ffee);
-	GUEST_SYNC(10);
-	GUEST_ASSERT(vmread(GUEST_RIP) == 0xc0ffee);
-	vmwrite(GUEST_RIP, 0xc0fffee);
 	GUEST_SYNC(11);
+	GUEST_ASSERT(vmread(GUEST_RIP) == 0xc0ffee);
+	vmwrite(GUEST_RIP, 0xc0fffee);
+	GUEST_SYNC(12);
 	GUEST_ASSERT(vmread(GUEST_RIP) == 0xc0fffee);
 	vmwrite(GUEST_RIP, 0xc0ffffee);
-	GUEST_SYNC(12);
+	GUEST_SYNC(13);
 
 	/* Done, exit to L1 and never come back.  */
 	vmcall();
@@ -107,15 +107,17 @@ static void vmx_l1_guest_code(struct vmx_pages *vmx_pages)
 
 	vmwrite(SECONDARY_VM_EXEC_CONTROL, SECONDARY_EXEC_SHADOW_VMCS);
 	vmwrite(VMCS_LINK_POINTER, vmx_pages->shadow_vmcs_gpa);
-
-	vmptrld(vmx_pages->shadow_vmcs_gpa);
-	GUEST_ASSERT(__vmlaunch());
 	GUEST_SYNC(8);
-	GUEST_ASSERT(__vmlaunch());
-	GUEST_ASSERT(__vmresume());
 
-	vmwrite(GUEST_RIP, 0xc0ffee);
+	vmptrld(vmx_pages->shadow_vmcs_gpa);
+	GUEST_ASSERT(__vmlaunch());
 	GUEST_SYNC(9);
+
+	GUEST_ASSERT(__vmlaunch());
+	GUEST_ASSERT(__vmresume());
+
+	vmwrite(GUEST_RIP, 0xc0ffee);
+	GUEST_SYNC(10);
 	GUEST_ASSERT(vmread(GUEST_RIP) == 0xc0ffee);
 
 	vmptrld(vmx_pages->vmcs_gpa);
@@ -126,7 +128,7 @@ static void vmx_l1_guest_code(struct vmx_pages *vmx_pages)
 	GUEST_ASSERT(vmread(GUEST_RIP) == 0xc0ffffee);
 	GUEST_ASSERT(__vmlaunch());
 	GUEST_ASSERT(__vmresume());
-	GUEST_SYNC(13);
+	GUEST_SYNC(14);
 	GUEST_ASSERT(vmread(GUEST_RIP) == 0xc0ffffee);
 	GUEST_ASSERT(__vmlaunch());
 	GUEST_ASSERT(__vmresume());
-- 
2.56.0.218.g1ec904b173-goog

