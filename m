Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395283;
	b=ifkO03zqQzePlEAI2cDdUx4S0I1ZmDvWJwmDL1v4vZSckpES4GClvAru1d0BBDAU9QWk
	 Ev10bWpEQeQ2POX6DWzCHeVLf9d2kdos0gn1LRifo3NokcciK+2TJDxJ4S2SFpNBbhD8W
	 JlVJMrEpQDdcHZE4WrG/iWIPSq1V7nOi4v8UNNR7egDrIo3DfG6j3NF8F49gQHJPDGy+v
	 8zA33CJnU2a+lGx2yFEHrjoWz1hHInSAkYzCwwyksyvToYRvcSCyTMgoOqiXvfx2dIWQe
	 FQq+fjMG/+hbJSPAwHDfzaDEEipSfqPt3JUC4hkbDeFUq4C/oLpPtd4Szui6YnSnJtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=ffYJqqyy7PxUyTG9nWCiYNGOf2D1TYjdOFe2IcBzjU8=;
	b=pSVrNcfslmwvEmo8JwWh2MWJqllJiAQLHipAgI3N/JF5NR0myUmW03uxw40Rdd2cV9HA
	 XePIeyl9X7e8Lpf0ypVhJmkdquCAzmBts0Sxq5t8n+aFyK6qgWMtyyPy3qOHxDit/nweN
	 RQ8gdOkrMqpNRIxoFSQqmJQXtGIS926ntfLMjbfn53eeHQxCcG5HR+kClWWvKhEGwzHxN
	 W2ALOcFrFas80/zBbCOsi2C8VhOv4FJ+UNia4G/KDYse5yxe1d2pjps21g3TEzGjYIfa5
	 QVssZUC6mJ/pLmX+/PlMnZZlUnGa3fdbEVnZP8OdWq8D5o5YZkJJ/5Gzcas4EC7910A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i84KDOS3;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A560A6F52
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C54A560A6F52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i84KDOS3
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso943198a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395282; x=1794000082; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ffYJqqyy7PxUyTG9nWCiYNGOf2D1TYjdOFe2IcBzjU8=;
        b=i84KDOS3kqQZ6WObTbiRKt2xyGjsnSR69JGmLrgoZJrTkHU1oQGPe5XRPyg1uZVRiz
         KUP9SwUihq9C+DU0n+B31VkB9yRrZYwGhrYcrXQ0PBv+2/0u0rCQ8qcTRo7/S8NxkADw
         OhkU1+zao5RZcW7YkFP9bABaQMjnvX4EJjgnV+B1s/3vSU9i7Yzj/+m9U7CIsHa10Rga
         GFxsZpK9+Fn8+oL24w/iqPBZjgYtpfa9ot75D5RQqe7EKcg5GbuNEg85xMxXRpwtwbKD
         GUlrx5oPEhXtu+zBl9KyPUbaZTBmMMHowOziomqql7syVmRLTZSGuxB/OJFkZZIJ2clI
         StZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395282; x=1794000082;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ffYJqqyy7PxUyTG9nWCiYNGOf2D1TYjdOFe2IcBzjU8=;
        b=KppR6Ucli/WmydfsiYORyGA/sz2Feo01ArQaJLC3IBuJ+1svQvbcRla4X/myWvMRtM
         cmwJyof5QK/GVvun3bcoOL0CQUalAZ9QVq07jNmm1G7VUXAewXzM1bqtSgk/uwEwdIaA
         4uTRY6X5TMgeSTZsXt2ql1hiKz0mGaaRsaDyczwC3vB/UA63aQC6e/C7FE6sqYfqO3qM
         mfm3bbPStnLmXJlhkIHgFycWjdP52VP+/pvIGWStEM9UN+w3sLeOJVrlL7qyc+qoJMMF
         l4EGPvdq9PgEbAw5JHa/mx1i64a4ySHzy+nvrH8tke5/nH54kzQO1SxZp8YcEoNsx2M1
         01jg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ4QDcr/nsD6GVOVse63Q0rPKV8iFyUs4yJBYpJOmnU9Qm9psoyPpBPA5VbC+zDw0KOpng9ygzbcwv2RY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV1Gxqld9ZeLxpjN4rpfipKOVD56y9oq7dxCIXMwco7iH1eb/C
	Fef4us7A84H0tEt6qZHx/FRQhxT5rptul298fBq/Gd7P2uff38M68mpC5HId8iGa9+TlSXQbQZj
	eVhDrmA==
X-Received: from pjbhl4.prod.google.com ([2002:a17:90b:1344:b0:3aa:dfda:ecdb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35c8:b0:3ac:9a5e:9ce7
 with SMTP id 98e67ed59e1d1-3ae897aa7aemr3117147a91.49.1793395282021; Fri, 30
 Oct 2026 14:21:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:20:55 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-8-seanjc@google.com>
Subject: [PATCH v4 07/23] KVM: x86: Delete non-SMM internal memslot if
 creating SMM memslot fails
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

When installing a KVM-internal memslot, delete the non-SMM memslot if
creating the SMM memslot fails.  Leaving the non-SMM memslot in-place
makes it impossible for userspace to recover (not that any VMM tries), as
subsequent tries to install the internal memslot will fail with -EEXIST.

Fixes: 9da0e4d5ac96 ("KVM: x86: work on all available address spaces")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 489631686ba6..326f8a9a5d18 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10006,6 +10006,19 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	return ret;
 }
 
+static int x86_set_internal_memslot(struct kvm *kvm, int id, int as_id,
+				    gpa_t gpa, unsigned long hva, u32 size)
+{
+	struct kvm_userspace_memory_region2 m;
+
+	m.slot = id | (as_id << 16);
+	m.flags = 0;
+	m.guest_phys_addr = gpa;
+	m.userspace_addr = hva;
+	m.memory_size = size;
+	return kvm_set_internal_memslot(kvm, &m);
+}
+
 /**
  * __x86_set_memory_region: Setup KVM internal memory slot
  *
@@ -10062,16 +10075,17 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 	}
 
 	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
-		struct kvm_userspace_memory_region2 m;
+		r = x86_set_internal_memslot(kvm, id, i, gpa, hva, size);
+		if (!r)
+			continue;
 
-		m.slot = id | (i << 16);
-		m.flags = 0;
-		m.guest_phys_addr = gpa;
-		m.userspace_addr = hva;
-		m.memory_size = size;
-		r = kvm_set_internal_memslot(kvm, &m);
-		if (r < 0)
-			return ERR_PTR_USR(r);
+		if (size) {
+			for (i--; i >= 0; i--)
+				x86_set_internal_memslot(kvm, id, i, gpa, 0, 0);
+
+			vm_munmap(hva, size);
+		}
+		return ERR_PTR_USR(r);
 	}
 
 	return (void __user *)hva;
-- 
2.56.0.385.gac671c819a-goog

