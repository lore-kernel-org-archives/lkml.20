Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551062;
	b=DR2L0nhT0j5eYBJ01UZO6HRr5xemiHbV8McXGihgCo7z5fuWMKpc7lm73Zr4R9uHzSjL
	 JoiXSdTATdYB7CR8qrlf5Xdg8xd3pEpU1Sh/tdXaeSqkFhUgBVxrQ/dRj7E4h9dnz72PV
	 Ioo6TApx6U9dm9uV+6nQVVf+NvuJj37oujJi64Q3TX5P7mH/8Cl7wSUiSlm91f+kEitYH
	 F5Cw47WuXa7TowqES4vePWRypiGfzoxrUas/vdcKnbCzwXmhZI+wadm9SOmaYn+rkBn9v
	 uNf2LkSGP5JOgx3isHBIVGBO3wotAAFux4M3m+Z4O/QCX1+SEfmFjgeHdj3aLe2Jksg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=TRrUu+6otZ1MrISxoN37o96DSURfs40tWglYbeE1Glg=;
	b=DYUqIism4Ql+9deFSXluoBCGLtFH4yWi1mFOL76J/ogWloU33g08llxbvbEYsf2z5ngC
	 Ec0jWPQWwl1fAqRT1Ml19BJUl7rpI+bv3rA6mKvi/Ptr+h7eTvinTeAqg1Zd3uK32rp3D
	 fudnyAfMaSHLK+c/8eKyvO1I0sbmdt/JQz8MeTkLL/2l5b2/Tw+5Yecu8Jk8zZBeZxlwu
	 S87iedRk6oT6AjPaw+Z31iBf0ffusk2bdLJG4iQI7RhBF1EXCEy3aofNYlr2XhJn40o04
	 inCKaND/1PX5uSkA62bXDI2CfSJ5ta3g4tRZ/vC5Dmnv/AzmxDviAzLY2gbFyfGFKtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XIQjfX32;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F261A606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F261A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=XIQjfX32
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso508144a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792551061; x=1793155861; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TRrUu+6otZ1MrISxoN37o96DSURfs40tWglYbeE1Glg=;
        b=XIQjfX32oJFj/ebKgzHO6OhbnSMlESzNivhvsQ5Nn+s3FCLO+894uYKuNslrFC1K1X
         KCayLxDollMC32NA0B3G5opyOmkTPMBV+qnwuBUJMNAWrCik+i1x1FoS7yWNReYfr4Kz
         YMJR+rUCn7ZR+mgyfUNFvrNS4nPuEGoeudG2bCeriSU2z6Jqj//RYeDtJceKcqt7QB+p
         0tfxEkR2gxjNCPaD5Lkgow9OeKWGNPVIeuH6mANwIPR0Rwk9auq/Ot2Lj1IOaxNsNrod
         cuJnVzpRPvHHTABc5SA/sjG5j18VMUgGQ7NqfvCrqu1vCd7JnCr0C1XFybXxZJWO5dlW
         Vxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551061; x=1793155861;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TRrUu+6otZ1MrISxoN37o96DSURfs40tWglYbeE1Glg=;
        b=kqeW7cIrPEbJdnrHz6t2saGfktJf5vnsFAgZiWXX74gpBmafYCvoHzL7axg5vHGW9B
         XhU+nkLMACs6Pk4MeAfpOyeRt2ShUfka1WKOnOg/eg1ZAewCM+Yzd6YoRVuiIsqcXM6w
         Zt9dAsPFl0hhDmbHg9FvXBt6DYyOC+1sK4J++dvx7AJoGZxdlWGfY7BvHEw7pQg/jk0X
         4EyTULqgfCMWakVSuESfUwHnleOml8l5m135Se7JiaTXdyDGekgttsOaeDRyk5eIYz3a
         xXsSe6xFokdFbprk7iSyCdEPeP930p6NJfbpuh9ZaeAy+qNSpO4Hqt0+LxnJmPbBIqOA
         aWMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX796yrIOmrTqG/LQRaIXDWRc1EbOmIgSDUxXlQ2mYVd8OS5ABbsQvQv+J23vX4X7ixHGnbRWk1pymnBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJytxvhPW6u1K7LtfC96ac1a1cMPSVhOG61WMkwO/7HdUbPinCD
	53krbUwGmetUdkuLOUzHSD2gdcXrrjFNYyVJDMT0fCXouXxFf4G657+yzzNgsSuD4tbWE2UJQFc
	Xyy1Luw==
X-Received: from pgp5-n2.prod.google.com ([2002:a05:6a02:62c5:20b0:cd3:da0f:775b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ba06:b0:3ad:870d:1bfa
 with SMTP id 98e67ed59e1d1-3ad870d1c45mr410921a91.23.1792551061087; Tue, 20
 Oct 2026 19:51:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 20 Oct 2026 19:50:59 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021025059.1736339-1-seanjc@google.com>
Subject: [PATCH 5.10.y] KVM: x86/mmu: Preserve nested TDP shadow page tables
 if they are used as roots
From: Sean Christopherson <seanjc@google.com>
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hyunwoo Kim <imv4bel@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Hyunwoo Kim <imv4bel@gmail.com>

[ Upstream commit 7a2c70e777a00c32ebafd376a6fe31ebb91c5b20 ]

kvm_mmu_zap_oldest_mmu_pages() excludes a shadow page whose root_count
is non-zero from top-level reclaim, because such a page cannot be
freed. The path in mmu_page_zap_pte() that recursively zaps a parentless
nested TDP child has no such check. As a result, a shadow page can
be zapped even if the page itself can't be freed; as the comment in
kvm_mmu_zap_oldest_mmu_pages() notes, zapping it will just force vCPUs
to rebuild the page.

As in top-level reclaim, do not recursively prepare zapping of a
nested TDP child whose root_count is non-zero.

Fixes: 2de4085cccea ("KVM: x86/MMU: Recursively zap nested TDP SPs when zapping last/only parent")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[sean: resolve minor conflict due to lack of lockless aging in 5.10]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 13cad4becfba..d2428c76d940 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2237,7 +2237,9 @@ static int mmu_page_zap_pte(struct kvm *kvm, struct kvm_mmu_page *sp,
 			 * avoids retaining a large number of stale nested SPs.
 			 */
 			if (tdp_enabled && invalid_list &&
-			    child->role.guest_mode && !child->parent_ptes.val)
+			    child->role.guest_mode &&
+			    !child->root_count &&
+			    !child->parent_ptes.val)
 				return kvm_mmu_prepare_zap_page(kvm, child,
 								invalid_list);
 		}

base-commit: aca95a35f1bcc0626c4fa4d1252bf2d4c990a1a2
-- 
2.56.0.218.g1ec904b173-goog

