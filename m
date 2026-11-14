Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614854;
	b=t3pxGx2WLZCNURvMpcC9DiUlL5fLcXQ1yIXrw14G35rwsYGnhCM1digIhfvh7pAHsEAz
	 jSOjifxlYNXQMjRRiNp3PhMtzcAj03yaaCCnQ5BAI+JodXd3pfVHsmk0Fb1TaIW8NwWAP
	 ZuTH5iemhGSi1/Miq686gGigot2zKZTu5+wGqtBzxJNAnZvBNh2cUzOczueDMBG99lbS5
	 iHh5XmNuErTT+/5Bm/7z67mIuH2omALcr9rLMNrKy5mGub9rEosaomBcg+YrukrAQ8adp
	 ft30W4w4me6rLvNhMTYp1uwRosPNCP+Bljl1/9cvFY3ENYay46qXfnqpwJopbt5snvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=M+PGCO0Pq3qqR1GvRzDH1epKC4GMAn77itO8XNRsAfQ=;
	b=P4te5WqeOYXwC++2aQ4RlQxcEfKH5TdjHcQKerKTzNuKpsRw69+L5P7VpljCW7+4TLuY
	 0cGXRfbP1A38jpHNvA2m1thNKnYAGSsvsyiQ0a8NZNxpJrGhUr2vM5lRxzUqrCKxt+KiX
	 /kEuIado1EACMg2Q3EH5ww6Rtfk4ROOWayBd5gODLj0NbG66oyxzp/JLv9gLZ7JSrbyAz
	 YBa1E0xjhdttoPtuPQ9Vx7eh7iFviUeuZK1wbdxTo9rEB0oJk13a8jP+NqsKaGclX4Oel
	 59NZAlBBpncqehv6nJ4vkVA374vqMQVANP7TbCDAbAFJO8TUdPcgsyHTh1HjK8MPmoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M0DNDEYP;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846E6606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 846E6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M0DNDEYP
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5587351d419so1216188b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794614853; x=1795219653; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+PGCO0Pq3qqR1GvRzDH1epKC4GMAn77itO8XNRsAfQ=;
        b=M0DNDEYPZ5JzN6obfv/I5dMScdA9CRgHDNIOkcwrmlPM32yQJdbv3eqGSkgycgrZo7
         YaJi7xRxuIOXELQ+9zRRU7Mg0G7xGes2SWIQvcCX33Cw4WvYsLnBW0m4DznlsHTZ0bV7
         2tXTrUsMTnResrxAeu6gBWEhZ7/Mt5ui5Onxt0BkPD70S3lPE4rtEiqpC/QZTvtj6dkS
         NYd4Mql3qPC6zBxzJ+x/3e3wU+QRdgUKu3guoZcoAzAk1AYVGoWWYgWA+oAvDWZCcYP0
         Kzf8JDJnLoqtX9OKKOTjo9M9fGWx9aWUxJg3RNXhg7jdOb3gUwJCv7MzfjTd6jwI9bVR
         MrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614853; x=1795219653;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+PGCO0Pq3qqR1GvRzDH1epKC4GMAn77itO8XNRsAfQ=;
        b=oZlBFBQ/0cXbxzpJsFoy4Qm1/nyBHv5d6Ec1ZW3Wmh34z6Iuc+DCdP1GJhNjONOB4e
         1E0GLY0xCBXZkFuJ3Gt3HiQMVVxXkssCykWP9ILLNQsQtHxMsO9p+0WF4/nRy069Ezti
         ebzMd6qlVYFBalEnhLrYE9pyZipkIUp9W+cjrF4HaySy4aVsA+kOq8NxT6q9UWwpA+2B
         680pkLEYTxO49lmNL942hSJKFkAn4UR+8ApTjoqzXbVa0qnZtliZ+2NnMgkQI3+7j+a9
         7EkyL4kP8DlD237jYsWVJzgpCgRuhDe/HFbviex6IXqxH6Fwt9B3n/OvS3iNwEF1HWEw
         jccA==
X-Forwarded-Encrypted: i=1; AL+hErHxjgU6VYicgc+/EriFkyiJf2WZXwBp5Q3D2NcGvwNmgnh4LxZJP+GgLOHUgcQ4foEnyEPK+Hpi2XQQ/FU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bm16DK+p5aNvIZ/6xZOLVAzEWHeFSwySfKl7WsDQD+SRDHPod
	QU5fw3t23ucfHNJu0pKGhdV/sVVoUc6kK3KfI2dVhcEmiLO4pjOHFqN/8VTrbu72/EyOKhepFiH
	l1q16KS2O6lXXGg==
X-Received: from ilki9.prod.google.com ([2002:a05:6e02:ec9:b0:547:a809:712])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3c47:b0:4c3:db9b:3ead with SMTP id 5614622812f47-56e5fd446d1mr3661844b6e.3.1794614853129;
 Fri, 13 Nov 2026 16:07:33 -0800 (PST)
Date: Fri, 13 Nov 2026 16:07:30 -0800
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
Message-ID: <20261114000730.2190544-1-jmattson@google.com>
Subject: [PATCH v2] KVM: nSVM: Gate CET state copy in svm_copy_vmrun_state()
 on guest SHSTK
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

svm_copy_vmrun_state() should gate copying s_cet, isst_addr, and ssp on
guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) (i.e. the feature is advertised
to the guest), without which the shadow stack MSRs cannot be set. Instead,
copying is gated on kvm_cpu_cap_has(X86_FEATURE_SHSTK) (i.e. the host
supports shadow stacks).

Check guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) instead of
kvm_cpu_cap_has(X86_FEATURE_SHSTK) in svm_copy_vmrun_state().

Fixes: c5ba49458513 ("KVM: nSVM: Save/load CET Shadow Stack state to/from vmcb12/vmcb02")
Reviewed-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Jim Mattson <jmattson@google.com>
---
v1 -> v2:
 - Drop confusing nested_vmcb02_prepare_save() and
   nested_svm_vmexit_update_vmcb12() examples and note that the shadow stack
   MSRs cannot be set without guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) [Yosry]

v1: https://lore.kernel.org/all/20261112212628.265262-1-jmattson@google.com/

 arch/x86/kvm/svm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 1299fdadeb73..b73bc9c3ebdb 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1248,7 +1248,7 @@ void svm_copy_vmrun_state(struct kvm_vcpu *vcpu, struct vmcb_save_area *to_save,
 	to_save->rip = from_save->rip;
 	to_save->cpl = 0;
 
-	if (kvm_cpu_cap_has(X86_FEATURE_SHSTK)) {
+	if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK)) {
 		to_save->s_cet  = from_save->s_cet;
 		to_save->isst_addr = from_save->isst_addr;
 		to_save->ssp = from_save->ssp;

base-commit: dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4
-- 
2.56.1.703.gf848ed807c-goog

