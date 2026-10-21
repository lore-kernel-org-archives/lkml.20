Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550711;
	b=b5Pp3s4AfhkSgI4MtPJ0OQpvzMUMTPTMditXTcYCsvqOu6c68XINRcIw3hFPssfYZf96
	 krtVZCPODlfp254yG2IjxdOZNOhEnmo6ptAaisZ/ahOEnrsCtMj3ssZGu7aQaPwRq1/Gy
	 jPdChTMXrtXF+zEA6uAdcAiRZesyWWfcbzh64q43G72IZd8O0QL3NrWbCrQ9/BT7QQgBD
	 +Uuk+Z7X2icgYEk7nUOliMOipxlXlx15oyqLGoemqa8TqK9WQ230EQobELnYQ0fvJy891
	 HnnB02725V3AlCr0JvXXpDRv42aiLQQasPrVcWawpdVf9GlprjceB/6hPMcecYkz3IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+tauiOqnCXDgcbvvq5Bl94S/eGCeAxzqV2Ktb1RLFsI=;
	b=xOtCKLR0Fyk9wKfgqPQt0xBjF0FA/lM7PdgiSVDAyzkrTLWSPMxXWyQH6B5CFD1qNVyM
	 nVW9okqn261fb1di0C6fpAOJx2CBszz8aNOWXN57IepDbrJRaWnPRdOBY+REQZ/9vW3Jc
	 MkcscJ1YUCquLzGNpm1iqCu6cvYvYE8UH8PLe9KjRm5oJBUCaJmnKDJepkDhdGOy2Svak
	 EdR8Yg0EbK1StLeG1HGzKNBleahlO2bZ9WYdY+k39rEFT/8JlMwtSXzfX3XPiDA2ApBPA
	 mkTB28f1pjQWlqG2pzBo7PT+vMDsE0o7gKEJETN+l9hgTUCCEEIK/BLuBSaBoByv/dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="Y3J7ML/q";
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635E606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4635E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Y3J7ML/q
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd6788d8de3so113253a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792550711; x=1793155511; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+tauiOqnCXDgcbvvq5Bl94S/eGCeAxzqV2Ktb1RLFsI=;
        b=Y3J7ML/qSiRa8yGKn6sDXsTL2y3LJj5OOvbWixnOKoHZglzpbOZDP1Qq3dmMnDp6Cl
         eZ3Z5Sq1ilz1hmcrk8qLQaSv5eEoU3wf7i4xVvh7i5tIREONjtu2qCyG+lDuD6wr5iug
         tpkJQVNjwmdFz+6EjDJ3W6NVM42ZVaAjqp6hiQrF9RGDDrjOcPgUmT0q7W13e3b61FKl
         EKiWhycpK2ogEsZWgzRj5c5kdPZsX0Lq3mw5hjTssyDRGIGNBULM/ZM2PP0znKDj6eQ7
         Wd0WmXfqmIFkF/Er0/eIkg5g0hWW6IwcfnGQa3I3Kz/m2HVVNa3otD9IJlD3S8CqJJRA
         GLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550711; x=1793155511;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+tauiOqnCXDgcbvvq5Bl94S/eGCeAxzqV2Ktb1RLFsI=;
        b=JjgH73X2/JbcMUX3ocTwhjUTLRppkWM01/AJzc5td49vdqtNy9j0R1rLL0pJPsthJU
         or1F08mzxKCnHn2lauyUILkRqZKqvS3GB2c4a7FS1WDldY+9daowyP7fz8HYc/AM/TDg
         jEQEobrBSM1OlPW2zKfKi4vUGd9ggeL4+7fX5bxSUV47bHXnhVnTNes+c0rpG3sh9zxh
         npM9LcBq5/AvFcczh1HP1bR2MfA09j2VTQ6bUIpsQ585i1wLGRLkQOYTymkukI0Vmoag
         BHnwO1FTjHjVpcOYIBgptDo3q8Xfl955VUBkN40QYxjDecjmxHBtTKJfwm/yOj3BAROf
         l6eA==
X-Forwarded-Encrypted: i=1; AKwUvBx0A5w6PRVsRBLIFDOIhoq4PQBLd8BCp/J3vDYpOo3AluikDmRz/eQgpERLVi3NnOg6hO5gt1p5LTVnPFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU7yMoc9SWSzVfgPOkA+/UqRBN9c/rWg0Vwsa63CUoMOCFFmnC
	2Mmr34R6J9skYv6es6dSXguJw/rN3itF1jRkll/4a1gBgTYHv+YIjWV6ONwVfPZJ3bYeQd3x5UM
	zu7SrMQ==
X-Received: from pjwx12.prod.google.com ([2002:a17:90a:c2cc:b0:3a8:cbf9:5e52])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1847:b0:3aa:fdad:7d6c
 with SMTP id 98e67ed59e1d1-3ad86d675a6mr596941a91.58.1792550709934; Tue, 20
 Oct 2026 19:45:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 20 Oct 2026 19:45:03 -0700
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
Message-ID: <20261021024503.1732165-1-seanjc@google.com>
Subject: [PATCH 6.12.y] KVM: x86/mmu: Preserve nested TDP shadow page tables
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
[sean: resolve minor conflict due to lack of lockless aging in 6.12]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 1a4d5fa11922..9acd7225c0ac 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2500,7 +2500,9 @@ static int mmu_page_zap_pte(struct kvm *kvm, struct kvm_mmu_page *sp,
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

base-commit: 7fdb7c1824a1f9979d648d7ae28ac446bcee9c6e
-- 
2.56.0.218.g1ec904b173-goog

