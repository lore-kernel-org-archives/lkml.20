Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F52483BC5
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779136; cv=none; b=pIy9tdepcbjvP3IlnweKrH4nFb79KFqDRdh4LOcE4FiAifaDnlmbUDpvjfBQc7sjdTOOOq0cN4DBm6RKwka5oHbhEKGpazrMaz6e+bXP5I2xvitbMxTXGTHtrVJu2Z2gVUgulUegv5QaJi049nPK4Urt91EUig7gnNQ82+HDub4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779136; c=relaxed/simple;
	bh=tFWrmimjbmFsTO6Cj56QVEBL9NL5uWQhjAmGwuhHZ24=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h0nmWiM9D5AbFe9euRz/EQbDQ1QUOpJF+R2I2VxvIOn3WwKQw0RSp2EiFxbJySHmJfsXWMo8NwewrXy7Q+Mgo0EFPA4h0UOos2sZTPLSdMv88LDae+j+TUMJTTHOwPm79keHyAv7J4F8DPU3XFwnhig7lsRaEPTkBTbrLRvAqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PP/t7p+n; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PP/t7p+n"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b10so1732365a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787779132; x=1788383932; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qnzWXMToAhHNxcx5OICbp797PZiUEkyVlvzbtVLX0aI=;
        b=PP/t7p+nWZbq7iJjpLgPZAtOz/sgR1ceE6jxIjwLyiuYmKFkm3KJuZdZuoBlBo6Cg3
         Y4kET3OZwNGNhKr73Ilo9x4qWXpo6P32G0CCzozFPSjGY/dJdMszwaA24C1o2EEiImBK
         Pk7av/jgizBXywwVTdnerR9K7ynC43SnJBKxiskQLz2VZ03mpeWArhJTA1ZD2Vp4IHhQ
         Fn3jfRp5owX1JMc7lDHGjC4/RK+lcNDTMvVYX838Z1hvvpEdx1Qk2SlKZltDYUUA/sTx
         pxSoPDgh8eG38XXhhPsb9vqAyFmLTLgFfB4/9gC2FW53bCsC0flqhofA/lB+LFIRp9Z8
         poMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787779132; x=1788383932;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qnzWXMToAhHNxcx5OICbp797PZiUEkyVlvzbtVLX0aI=;
        b=Ffdnw1I1bcr9ZTwlukNxUUUAgS3Et6nLZbt7ZaZvMvQ4foWrXmlFoTW4OzryNtOe8n
         gWhmT2mdr/Q0Hhinkxfe2DgbaBdElT1wt4tymNbSLVVPPNiPVJT+QYMhMNJHkCmzC9PV
         mPyuzm1CEXeqCgeJ/F7z/dGjrfIwXav+VeaGyOit85puI1kQjxdTq8u4DCT8Y8NjXljs
         pyKh/Bxw2k9Xrw7YSZj8LkxEuirk57XzmXk1qH/A9j8S9mt+l9epLc3IlPf8CKSf6DuV
         UY22LEJwLFeThrRrXUXJ0FebAEyHkE5W16k4Qiag1aa0WNMLWw7j8A5Or4hqEUepRViJ
         VmtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHd6MStoYbgFlio9uAJ1Zj7JN7L/ixtCF+zEls6HCJDpSz4FC0qVYYS/e4nnonMLz3on+JFcVJX0v0AAE=@vger.kernel.org
X-Gm-Message-State: AFuF++n8ZUhOHim4aZ/7wo32PY+UVDIEONN1GpdZdANMx28ndIw817Tq
	RYgD3MA7pq2J7rdDYi8QRB+5N8Tw1fg947KgmLBXR4Zqo5vpwdCTkptHl4YbQdQ0dmKOrtlYW2F
	vRrKWdg==
X-Received: from pgbfl16.prod.google.com ([2002:a05:6a02:50d0:b0:cc1:c07e:b53c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:998e:b0:3bf:49c8:f7b
 with SMTP id adf61e73a8af0-3cf8465a25bmr15916030637.13.1787779131760; Wed, 26
 Aug 2026 14:18:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:18:44 -0700
In-Reply-To: <20260826211844.884951-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826211844.884951-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826211844.884951-5-seanjc@google.com>
Subject: [PATCH 4/4] KVM: x86/mmu: Convert MMU walker's bounds check from
 BUG_ON() to KVM_BUG_ON()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Bug the VM, not the host, if KVM's sanity check that walking guest PTEs
doesn't underflow the walker's level fires.  Bugging the host while holding
mmu_lock is all but guaranteed to panic the host, KVM hasn't _yet_ consumed
the out-of-bounds level (i.e. hasn't corrupted memory), and KVM is already
committed to bugging the VM and synthesizing a guest page fault if a fatal
MMU error occurs while walking guest PTEs.  I.e. there's no reason to keep
the BUG_ON() at this point.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 46a0f7796e55..2cf5e733aba4 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -392,7 +392,9 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 		offset    = index * sizeof(pt_element_t);
 		pte_gpa   = gfn_to_gpa(table_gfn) + offset;
 
-		BUG_ON(walker->level < 1);
+		if (KVM_BUG_ON(walker->level < 1, vcpu->kvm))
+			goto error;
+
 		walker->table_gfn[walker->level - 1] = table_gfn;
 		walker->pte_gpa[walker->level - 1] = pte_gpa;
 
-- 
2.55.0.887.g758fc8c411-goog

