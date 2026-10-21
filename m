Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548751;
	b=KOPRex9c02cXuNxxEijSJQc1URRWlNMoJ39nOuZIYakE/9g/scsraxwahMHN7+ePzRT8
	 5TS0OIY8kpahHxhLUzyc7CGa3qYK/WO7e9ympnjxtjxcH3GxbNSyye8bYiqywV5VS0b4c
	 GhWl/mz/22xjtQ2tXP2cVfrXvSgmr5NCqe7IcAQ7nyykiFZz/YGmpuCK6BRrpoaFSFu5U
	 XlJZVIvtBgDdAp9IsToBjL7o/KvhQ6MvhmDHqA8hGsLqx34H+lYXjo0DfJ1MoMZMrpCdA
	 1tX7cN2F1fG3q+TDsIXQIDDdL9YyF5ajRptc5DrKqTzdo4XVEvAltwBao96irPew2vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LM3zXXEyrs1k6iikZyGFv5HI2GOa7cTFeTDBek3U1qE=;
	b=cizSFUqRcDtDAHmGTnRmtV+hPu4EdyQys2F9uoXWxozde2a3Mf8mqdG19XtzrgAQ/BEc
	 LGD4mahwZuKIowiZj79k3SJ35yxPTDO8XKipj4CayOvGvMDzQuguHx53M0Izbnly5273j
	 4T6F5brbJZskpejIQxmaLrbb/CDm7fprosdC5xNblS+8zeKymm8yJlE80oS6gYJmGGKBv
	 AUFauVpsPWbQLG7f+xgAN5pL0Pp9m/DoTLo7Sfw50mw959jUhxO6Lke7yK+ZFJ8+h4OlS
	 yQ09Q+xRV5S47OcSOLTWh7/+FOQEw+4DBwRETduM7jsnA8t3p6pM7vGBx5GgCFLPRKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fMu1ySdm;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BF9606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BF9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fMu1ySdm
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so393874a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792548750; x=1793153550; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LM3zXXEyrs1k6iikZyGFv5HI2GOa7cTFeTDBek3U1qE=;
        b=fMu1ySdmKczYVurWwRxucpMNpuFCzKTBtLPq1eOEyqTkETBtmQwuLv0iM0GA+FQbfD
         tiDfoFf8jXxeEl1PBK7MWgBoKp3C68m3EyMvWhzkfVLH8W941S8H8IOZv54egwQhxV2a
         zNgOnb9IoS3+PR7ankyuxnZZUknQdR6kX+cRptdznh88kvpg4AhAfOucETHRan9RV3DN
         acY+ogOaCktWPGKQGEmGYpW3xhSrNlVWwWkhU8c1VlaACVeKmkb4L2FN5reRGRnV1s/j
         +H9jOTK36MO+3buvLjxTi0pzlgsfIO9TmgPajhbAYDIOj58VjxZnpicWAIfuFhdnDXJ0
         d2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548750; x=1793153550;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LM3zXXEyrs1k6iikZyGFv5HI2GOa7cTFeTDBek3U1qE=;
        b=IemfaBJ2WTmLFjn8nCW5rW3gbXavkwxnnomGZsDHnkbs2xtJSLxR1+mf87RcRcunbJ
         gMHNsmvDSqVHLeshYIsaS9r7oO/HKt11TsO/KSxIPQSnvfFloNGFSnNEuLbSQAlVz+Qt
         AnHbRNIvtmXCpdC3LQQ5CDabgE0Dr95gt/5xAWymEOFP6FSw72JHmliVwEmLdJ+KNZXB
         zoJkf9HYigqnFFyOZeAyHRqT/2hLJRBAp3q4FvGXYsLRktR84RovMW3MGBDThdhsTbi3
         A1f/HrvZ6ZpplZoTdqNSaEuc3tKQhgbLQntldYh1CeBy9UkoNxRBZghHewi6/gkXO8gi
         Ul8w==
X-Forwarded-Encrypted: i=1; AKwUvBwWHavHVxY2PYxrXn8vhj+nlW6LaN2Yw1l3n7ji83dbL9dvSEodSb2MjpuQzKbOhJe+Po2BiMh93ZmRdaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBiiUwOxEy90kCQRl2zWYHzIpiayIvXYmrQmzVWqKiMC70iVeu
	U826UnnVfvN+6bM78J1KS3cc3BJGP0u1MnmZKvnxA0ZxbffMrgpMCHUEcn3Dc0tOF5VuuDYeevk
	zAhpUCw==
X-Received: from pjbhg5.prod.google.com ([2002:a17:90b:3005:b0:3aa:ab59:7e2e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2786:b0:3ac:acf5:6daf
 with SMTP id 98e67ed59e1d1-3ad8707bffemr601484a91.66.1792548749874; Tue, 20
 Oct 2026 19:12:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 20 Oct 2026 19:12:21 -0700
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
Message-ID: <20261021021221.1703700-1-seanjc@google.com>
Subject: [PATCH 6.18.y] KVM: x86/mmu: Preserve nested TDP shadow page tables
 if they are used as roots
From: Sean Christopherson <seanjc@google.com>
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hyunwoo Kim <imv4bel@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Hyunwoo Kim <imv4bel@gmail.com>

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
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 205d314a7583..1fa251ca4dcc 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2630,6 +2630,7 @@ static int mmu_page_zap_pte(struct kvm *kvm, struct kvm_mmu_page *sp,
 			 */
 			if (tdp_enabled && invalid_list &&
 			    child->role.guest_mode &&
+			    !child->root_count &&
 			    !atomic_long_read(&child->parent_ptes.val))
 				return kvm_mmu_prepare_zap_page(kvm, child,
 								invalid_list);

base-commit: 2ff600d29ee478d0a8d46ef8a58afb5e038fe692
-- 
2.56.0.218.g1ec904b173-goog

