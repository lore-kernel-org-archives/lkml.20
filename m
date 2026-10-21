Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550966;
	b=StKlr9ZFelJVE3bVRiGYsnf+bzCD1wlP7R3t1xNRjtM9GZOsgvbXxn6pHyMfS2ndTM9r
	 bFUWFlMH0Qt6rgOxv9e4TnRQTqS6Vs1aXEJZbq3cTcWPrHu9mNzM1W6jj3h3/MdVEre/H
	 /Xkx59te11cFQIPRs+vna0H6fS75it3MPSvfvUyrmSTDcm2ND3dxtIqarDjlu8mrVcbw0
	 +5mpq5jzNeLoStjxYLdyEQlyhZiXNbejkfzeqXTTAi0NKurPHbVa3Rzz/4gklKjklAxUI
	 XtwNr2/teAB02nI2I9kaAT+MzJXpP+svSsT+3u8cYlf60UJT+FmojnprXrA83Id9yPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gSnH3fXxTz7HmVcM/xtbhh/4LxD2ZgAsSDglyoF9vfI=;
	b=Cm3DuCNlGOI8k6tH6WCMy6eUnueV6J1TGhd/bHpIAbS5bwzEmaW/tGv70IuuuwABv/BU
	 urKdevEWfS55LagBkNmrBHhiRa85WXdZX7v0SjgdTRMt4Tkysmsm8HSu1qR4OTnQNOoyT
	 AFaq2HXZJ28JRJCXGDrIP329EWmVKDP9lBl7QOmXVAimZQSzi6fnpF0i0/KoYvL4baw4v
	 NLXbHUQn4TGgBD7immMQxj9VzHq5VO8WFyYE6vqkWfHNTY7+lO1pihRgqdG1Q8q1TYt86
	 yDw6Raozy/w40TxFZiCV2tzylbJCbQSd3Vph7D44K+Cn513NfCDqzoNro7TGjNYSnJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AVzps8aZ;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B250606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B250606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AVzps8aZ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso289302a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792550965; x=1793155765; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSnH3fXxTz7HmVcM/xtbhh/4LxD2ZgAsSDglyoF9vfI=;
        b=AVzps8aZMOfSNEwYwjdNhFacax5Vdj/VHOahl4IygNsW61gBT8xQTISXu+5F6j8Dv9
         yFcHnokOKCNvA9JHNaSnT21oUxJUbcoPfgaMNAK/pRbqf9NU3Z+AmXJ3HPaNAr6DxPiZ
         Fy0Cl643FDTLOINdXaRELtwJKqeoRyXvdxi/ORDZlZrNQo4/Fhj5aJqkpdp9kL3WSCSA
         ofVeoYM8THlD3O+GFtOfHP/kZe7Z9cYlKzzUJe0LjFJfsoHaFiqcDX3x968OT40fjWzZ
         WsdP1SqRj7RQhtmTKlqmu7xl1Sa5Gb0r8wt2R8ejQE8LXCEl98DtkewNk7VP+JHEhxqo
         0SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550965; x=1793155765;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gSnH3fXxTz7HmVcM/xtbhh/4LxD2ZgAsSDglyoF9vfI=;
        b=ZyF7sKTSJG7znml74KKzt6cLjUuAZA96wD+wgEdAp+NrwY9yVgxZeS3tp7n8Qs4bfO
         nymhQ9jqWPtpeIWqDyrTuZu2NeHoxul/0dKci1v+Cr/aC7oeHhekGWQjIyxF0iprIek/
         MW6+fxWXGu8Gbm8j7gbP83C5S5OGX3p9lUAO9E04qXsUcqMSTY/20Crg7mV7Z3dmqY6j
         WztGQupciwThcWfkBHQzLXWLSOkztjzD5ib4hAsIE1ACviYPnUE44Ky76e+NDR8h7N3A
         rQiLCqXH00cvr0RKVuDSkf9h2jaLgN19oOgOnvizWYQH5nrvDluLRjy2M/9Up3pO5lJS
         bIGA==
X-Forwarded-Encrypted: i=1; AKwUvBwi3sgmQriER0jian1Zqpu79MfZrrXMEBb2XPwGZGRQ6lKdrH0PAl1dFxDbfspI5ViYMaYOWSh3j1aB1+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFYxQ2gUlyhudn7NPPnR25j52pWc3CYhVrYHw3u8sZQKuYR8Xg
	Lb55Zmnvq+ERYbsV6x5WjtN1WtNMvu5AsUv+eZi/Z3X4NuU8APJzXs22qIcO+v/puazCKIv23h0
	NhGfMiQ==
X-Received: from pjsa19.prod.google.com ([2002:a17:90a:be13:b0:3ab:9517:f413])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b90:b0:3ac:8527:3fc5
 with SMTP id 98e67ed59e1d1-3ad86afbde1mr745223a91.3.1792550964733; Tue, 20
 Oct 2026 19:49:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 20 Oct 2026 19:49:21 -0700
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
Message-ID: <20261021024921.1735149-1-seanjc@google.com>
Subject: [PATCH 5.15.y] KVM: x86/mmu: Preserve nested TDP shadow page tables
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
[sean: resolve minor conflict due to lack of lockless aging in 5.15]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 081547246801..a768cbe23808 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2336,7 +2336,9 @@ static int mmu_page_zap_pte(struct kvm *kvm, struct kvm_mmu_page *sp,
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

base-commit: 792fbe1537d8daeca9bd1917e84078b5432aadc2
-- 
2.56.0.218.g1ec904b173-goog

