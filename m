Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76EF25B0B8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350582; cv=none; b=UQZpM7mPtw6nj9lBRqpwKAdxJR31JuAzXcD1Ah/ysmzn3oA7pt8JK7X0au0tGYT9aMcldu4dS0uIQGuh9WCI2oUy3vRH46FR9T6IxudyoULbGzExcffWROJAlbqfkgfnSo4p69Pr4kjeYqGXesDPwF+/3MCAQ4rti2ZWPMJkwGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350582; c=relaxed/simple;
	bh=Yv1k6QGBpWRqhQ1/g8/MLMzjdXKArQtCprJXyb6GIXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LC6s51blFIwQwgVgmbXDidh+C1w5j3xUu1TN4njvAHX/l1vSROUIBd37146Wbx4o93QEGyLIU96cLzLC6MhwgmTPu/5BsYJXhwTtUZkihN4bPhCq8yL9hDRakUgmBDC07TASxsESNsRfjWyUSGvQtub4AgCbLE470O1WXq7b8MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O12/WPN0; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O12/WPN0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1055248a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788350567; x=1788955367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogfkV1olj5BWBHozC4h7H6b+n23WKTMMRGzZ7ZTaUxU=;
        b=O12/WPN02/v9zNTGHZtm0ArxWL3NQErnElwC1RpgwR3y+7gY9nznwNMKkSndG+2JEg
         xsIqLDJWDsyqdVEW8ACj2sEs4SYSnByEcwkSCvNTrXJ1iJbIk5Jr+MN73ETrs7T29hty
         AqzC1NYKinI3+NTW1LoOaMG3M36ju2+V29jCrrOARcJfiRWfysKcz3+0y/T1168QkPOL
         oD8MgThaPtlcUe5yBxqkjeOMI/YFfHzHxYf5UJ9UFWXWPOJUp/63y8tCYXHZvU6rxhMv
         oRQpluc44scW+EVu+CjWl3VSqhw3F6NIIucf0wfGDECjr4lAfM3xg9YvuCTmXuP5WXPT
         FHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350567; x=1788955367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogfkV1olj5BWBHozC4h7H6b+n23WKTMMRGzZ7ZTaUxU=;
        b=DK07tGOjXVi9h6BCmMEkHSIl/3ni7+w0ckcmBGlzOZRsa7/GUeALWBKOotoTkbzIe4
         I8aV27OfhQBWpYunYNifZ0yM+zFCX7O4hbulRtFykZ58eFjhjDOxfB9Z6b1ksUZT/bOG
         L18m7GzX+806qjCXti6Yrl5tA4eyjqyVZym7UjOzRY4X23YPpUrHr38gy8PT5HPk1bex
         Q9r829WSAWsJ5DekCzIUZTIUgUJrJRSW9tVMy27Cz0dKHThrNw9Lesazpfj+WbIdozJH
         FVT5gGug9NpKaHUBWrcTD1LKoAjIY5PzEoTWJFMSqpN440Y/GCZNyViXzacdDYLnqZm4
         NadQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvv5VM3ex0XWY6WZ3cH9unk/MGJy+lpAKX6MbiW49PJ+YGq7YLzNVReQo5iu5uNk3eMp+EKII7nLBxTTc=@vger.kernel.org
X-Gm-Message-State: AFuF++n+9xFXlyyF2R5JjtnWEbeqkfZaqcoY66XM/6lyktUgjjSNwQFE
	LOJhLDPl6fEpmGZkriblMYLbfp0Z6a2OOFMmwoZQv6qeiK6ZEAZhmV0k
X-Gm-Gg: AYBFou1u3E4tcn5xxfx2GdtqC8bD77GK418VO4b0cn60l08KdGC+PsTjFQEkuxglW4B
	3PxbFGPvUCg+c+80d7vvnjx8WvLGQ8Vhlo+41Y6VRzZLBBUQtnXf8SQNqbOQLevkDCgr2VadgLH
	FYftf/3oxYkoF6+67zdERYkCORLDYq4OG9fGgytiSVziZn1fBJYtBgKgVx8LJIVgZK8t4sE0J0L
	rDub8bakjwcAJUwk6fRxVaJU8XiGMqw+Y+eM92tNjpST1Fn5BueLxIR/PFd5IQLuP6jz0Z7lERh
	wABE+p0/j9GLLvb2ilXl3nN7QT1vQrASJ+QbqeYV2BO6uicYbRg51IlW9L4oiDxXcus5n3I/7Kp
	sV8OZ0RZmz7suriZaV5Bs7fD95rkbmwRp/RACIPqa2U4nnWWwaQoRiT0aM76ixDwzJm7zZNqrp4
	sjk9wU0l7DKQrs0ni+1eE9dEfvJvtRKXgpX418kkz6bKO4MZZXM2OX+Bn6Yyg/Uq6qPh34yKvmZ
	6NQ4kGSvsPv/Ta5iMSdYw==
X-Received: by 2002:a17:90b:6cc:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39aee0eafb9mr6572751a91.20.1788350566769;
        Wed, 02 Sep 2026 05:02:46 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c33e9sm6897044eec.4.2026.09.02.05.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:02:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/2] KVM: selftests: Actually compare sregs and events in sync_regs_test
Date: Wed,  2 Sep 2026 17:32:34 +0530
Message-ID: <20260902120235.18486-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260902120235.18486-1-hemanth.selam@gmail.com>
References: <20260902120235.18486-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

compare_sregs() and compare_vcpu_events() have been empty since the test
was written, so the checks that req_and_verify_all_valid() and
set_and_verify_various() run after every KVM_RUN only ever compared the
general purpose registers.  KVM could return anything at all in the sregs
and events halves of the kvm_run sync region and the test would still
pass.

Fill both in, in the style of compare_regs(): every field of struct
kvm_sregs, including the segment and descriptor table members and the
interrupt bitmap, and every field of struct kvm_vcpu_events.  Both sides
of each comparison come from the same vCPU without it having run in
between, so they are expected to match exactly.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 .../selftests/kvm/x86/sync_regs_test.c        | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/sync_regs_test.c b/tools/testing/selftests/kvm/x86/sync_regs_test.c
index ed0c21b427c9..c7d1f3cca16e 100644
--- a/tools/testing/selftests/kvm/x86/sync_regs_test.c
+++ b/tools/testing/selftests/kvm/x86/sync_regs_test.c
@@ -70,13 +70,102 @@ static void compare_regs(struct kvm_regs *left, struct kvm_regs *right)
 #undef REG_COMPARE
 }
 
+static void compare_segment(struct kvm_segment *left, struct kvm_segment *right,
+			    const char *name)
+{
+#define SEG_COMPARE(field) \
+	TEST_ASSERT(left->field == right->field, \
+		    "Segment %s." #field \
+		    " values did not match: 0x%llx, 0x%llx", \
+		    name, (unsigned long long)left->field, \
+		    (unsigned long long)right->field)
+	SEG_COMPARE(base);
+	SEG_COMPARE(limit);
+	SEG_COMPARE(selector);
+	SEG_COMPARE(type);
+	SEG_COMPARE(present);
+	SEG_COMPARE(dpl);
+	SEG_COMPARE(db);
+	SEG_COMPARE(s);
+	SEG_COMPARE(l);
+	SEG_COMPARE(g);
+	SEG_COMPARE(avl);
+	SEG_COMPARE(unusable);
+#undef SEG_COMPARE
+}
+
+static void compare_dtable(struct kvm_dtable *left, struct kvm_dtable *right,
+			   const char *name)
+{
+	TEST_ASSERT(left->base == right->base,
+		    "Descriptor table %s.base values did not match: 0x%llx, 0x%llx",
+		    name, left->base, right->base);
+	TEST_ASSERT(left->limit == right->limit,
+		    "Descriptor table %s.limit values did not match: 0x%x, 0x%x",
+		    name, left->limit, right->limit);
+}
+
 static void compare_sregs(struct kvm_sregs *left, struct kvm_sregs *right)
 {
+#define SREG_COMPARE(reg) \
+	TEST_ASSERT(left->reg == right->reg, \
+		    "Register " #reg \
+		    " values did not match: 0x%llx, 0x%llx", \
+		    left->reg, right->reg)
+	compare_segment(&left->cs, &right->cs, "cs");
+	compare_segment(&left->ds, &right->ds, "ds");
+	compare_segment(&left->es, &right->es, "es");
+	compare_segment(&left->fs, &right->fs, "fs");
+	compare_segment(&left->gs, &right->gs, "gs");
+	compare_segment(&left->ss, &right->ss, "ss");
+	compare_segment(&left->tr, &right->tr, "tr");
+	compare_segment(&left->ldt, &right->ldt, "ldt");
+	compare_dtable(&left->gdt, &right->gdt, "gdt");
+	compare_dtable(&left->idt, &right->idt, "idt");
+	SREG_COMPARE(cr0);
+	SREG_COMPARE(cr2);
+	SREG_COMPARE(cr3);
+	SREG_COMPARE(cr4);
+	SREG_COMPARE(cr8);
+	SREG_COMPARE(efer);
+	SREG_COMPARE(apic_base);
+#undef SREG_COMPARE
+	TEST_ASSERT(!memcmp(left->interrupt_bitmap, right->interrupt_bitmap,
+			    sizeof(left->interrupt_bitmap)),
+		    "interrupt_bitmap values did not match");
 }
 
 static void compare_vcpu_events(struct kvm_vcpu_events *left,
 				struct kvm_vcpu_events *right)
 {
+#define EVENT_COMPARE(field) \
+	TEST_ASSERT(left->field == right->field, \
+		    "Event " #field \
+		    " values did not match: 0x%llx, 0x%llx", \
+		    (unsigned long long)left->field, \
+		    (unsigned long long)right->field)
+	EVENT_COMPARE(exception.injected);
+	EVENT_COMPARE(exception.nr);
+	EVENT_COMPARE(exception.has_error_code);
+	EVENT_COMPARE(exception.pending);
+	EVENT_COMPARE(exception.error_code);
+	EVENT_COMPARE(interrupt.injected);
+	EVENT_COMPARE(interrupt.nr);
+	EVENT_COMPARE(interrupt.soft);
+	EVENT_COMPARE(interrupt.shadow);
+	EVENT_COMPARE(nmi.injected);
+	EVENT_COMPARE(nmi.pending);
+	EVENT_COMPARE(nmi.masked);
+	EVENT_COMPARE(sipi_vector);
+	EVENT_COMPARE(flags);
+	EVENT_COMPARE(smi.smm);
+	EVENT_COMPARE(smi.pending);
+	EVENT_COMPARE(smi.smm_inside_nmi);
+	EVENT_COMPARE(smi.latched_init);
+	EVENT_COMPARE(triple_fault.pending);
+	EVENT_COMPARE(exception_has_payload);
+	EVENT_COMPARE(exception_payload);
+#undef EVENT_COMPARE
 }
 
 #define TEST_SYNC_FIELDS   (KVM_SYNC_X86_REGS|KVM_SYNC_X86_SREGS|KVM_SYNC_X86_EVENTS)
-- 
2.43.7

