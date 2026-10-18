Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20FA3D1CC5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324352; cv=none; b=C4konaPzOgIHKuAyId8HYz7pLButg62JXHmZnmJ41GpuzfbtfKdIMNili9VwPEgNUqypA82tcq3xMUIgxMQYusgZk1zjgcko1gXkQj9pe6+CrKXGnxFAH9ME4GW7S7ha/a1RXoovVKNlOxZ0Z2xJCJTVJ7i4ojlOiCR5aaF1jQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324352; c=relaxed/simple;
	bh=UTOFL3UMMmeEDwyhHDJphSf/jxDDcayvXDj6GTrHqFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UcAmMcyxZIF+4NwqjRmCyEjABsfK568wIqYakkbDCh+pWV3gTX+DRA7vbgss/ltuNRwfVeKagWacP3iZO5d8dE5dj4ZuR5zMW11lhFvi5wAmXm0UykXNHK2sXAVj7Zp3BRDT7eTj/D+0egVtg8AinGsJEeoRGazkYQwdVt9hKhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9SLCtaF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9SLCtaF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso13158545e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792324349; x=1792929149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fz0hjS0Cuz5EKajD02nVOvhLNMRne7PopgwKvfBOKM=;
        b=R9SLCtaFY6aax634Etv6BrvN8ovMlfaJuVtdGmN1gVsi/ADGWRFrdnVrfDXvGPA3A2
         f1wxz9vq0uCCSGzU2QBpCX7npgl+/vqSKCLYbhQdxlk0QjqpT6he9LSMy4M25rZvniIM
         wAoOrPhL9CF8W+k3VBbtxY/JAKHzAEKnWQTkvcAlQyNYd5lGPTA9T/kTjw7ihtd0L4XH
         EXLYKlt/9iA3GbkbF7JLrTpu26B2+enJMgQRtU95Yp2wCVAnOis3s0SQ6JtZk1GliI+N
         orNwBMILhkVH4YNNkda9leMM9UUS43ctcZxU5w+aAtp1vYZ/Y0syHcMRbkn7k6gTONqG
         WxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792324349; x=1792929149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fz0hjS0Cuz5EKajD02nVOvhLNMRne7PopgwKvfBOKM=;
        b=ZoO74H4qZuEIOUT8PWSuTFwtUHWYke187b32KB/BMbb7h37i62F/nPWhdwH37vjC/R
         XSZLtRvIg2PSEnGJedTLWNmzRM2hNvdfug2b0kOcIY5sdxzSgu2XTXyJ6jUXxP9TuD2A
         z1ZmDxkhHRvwGR/yeMEKg+7mWCcyHWvYwD0Bku3TWQnAIZF9xtLRfBROgBa/aatiuHEa
         Jrb8237OWQbQPH/4vt3rmnRzYOBOsZEfoW1r2ZQMRdgge8P1UNCRfevSqwpZvKYxXXD0
         MQqXVl1i7Fu0Kme/FcqXPP1YrEgIS6fSPn2SrNnbhN3sYhe8adObShOm6W2ZlhXZIhh5
         h5Eg==
X-Forwarded-Encrypted: i=1; AKwUvBwYiXbHANLUeMsTPxc+i9sbcEa17Dvy9bckVw0qMhMdHBx/i2flip+EPcdb9XwT4hBbpn+/yiMY6JYlyP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL42Uq4nZ0ldIU6rcBRzAHEJU2gk9EZEdveL0rpwujxelIs2ctV
	yeqv1+h/a7Fu3hGlmnJ6I3a490WC2tw6IN1kH+QGpQz5Oe60hOjGKxrf
X-Gm-Gg: AYBFou1jDDZ3venPIa6aZE/qHG0dFspgEjJr+KxGmyC0Dm8xbb3xMd+TD/rU3VyMgyo
	6brDqTyS+tcy8Ad+ZVgQSldYKNSEFZNxbtaM9gJOE3ZhkT2cq9jBqiURLGd+3wtj2cTVax3HnNJ
	NzDdFXaXuIIBiIiblX4toCIGgrjjCAMOrX5MKAWvoNlF7Rs/N2aPR+riKSNBX7CGnM/lnAOOy/n
	89siJpA3KzmtunW+ovXei5fHfCKn1hXg2rvpb2V/S7XBaBGN10LJ1BNi6pNuZ2TB3EwUlKgNqO6
	rkLQ7TNfz+seYLb55IntsXMayTt3G81m5tXpZylXcCQ+UGbKyQ6yFWdp6MR1QHUOWdskNmFlumP
	XWwjniJG70lvxh2cefQmvhyZfywgcByicSzCAx4wUgpG8aKvYe5XFA5VgN94k4vxFdaAmY7wiow
	j/AGShvuRBr3AkyTMbDxxpR9j96vf1+53Mxbeh20e1IRpC7xtM4BL02xmiyiGVzmFUqRh81fSCH
	qSuo8IaWcUD4zSz0Jkxfi2xKJDkzpLkik0HlzmXl8KhJI4lEpjIf9OV3m49klyBebfqTGLyfi0w
	LTUtbQGCfSFpzJqZra78cPxhVc7K5cgC/yhUnhNM9P43YuzMmGDpwuZxnMiUCTFwPhiIeQbPXC9
	RGnVj6E/QfebzQegYb4APeM9iXOJSlOBFf9Bnxk8n2jWtbsuYqKIbwk7owg4=
X-Received: by 2002:a05:600c:5250:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a1d7616bfdmr98387255e9.29.1792324348909;
        Sun, 18 Oct 2026 04:52:28 -0700 (PDT)
Received: from DESKTOP-42GVE6E.localdomain (206.red-88-16-64.dynamicip.rima-tde.net. [88.16.64.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm193311215e9.5.2026.10.18.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:52:28 -0700 (PDT)
From: Pablo Azuaje <pablo45154@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eugene Korenevsky <ekorenevsky@gmail.com>
Subject: [PATCH] KVM: x86: Clamp guest MAXPHYADDR to the architectural maximum
Date: Sun, 18 Oct 2026 13:52:22 +0200
Message-ID: <20261018115222.315090-1-pablo45154@gmail.com>
X-Mailer: git-send-email @GIT_VERSION@
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpuid_query_maxphyaddr() returns CPUID.0x80000008.EAX[7:0] as the
guest's physical-address width without any sanity check.  KVM computes
the reserved GPA bits from that value, e.g.
kvm_vcpu_reserved_gpa_bits_raw() is rsvd_bits(maxphyaddr, 63), and
rsvd_bits() returns 0 when the bit range is empty.  A VMM that
populates CPUID.0x80000008.EAX above 52 therefore makes KVM stop
treating the upper bits of guest PTEs as reserved: reserved-bit fault
checking on guest page table walks silently degenerates, and garbage
nCR3s/PDPTRs are accepted instead of faulting.

A MAXPHYADDR above 52 is architecturally impossible on x86-64; clamp
the queried value to 52 so that a buggy VMM configuration degrades to a
(very wide) but still meaningful physical-address width instead of
disabling KVM's reserved-bit accounting.

This is hardening rather than a security fix: the actor is the VMM,
which already owns the guest, so an over-wide MAXPHYADDR is not a
privilege boundary crossing.  The motivation is correctness, not
containment: a configuration value outside architectural limits should
not silently change how KVM validates guest page tables, and clamping
keeps the degenerate case well-defined instead of subtly disabling a
whole class of fault checks.  The unclamped read predates the
introduction of the cached value; no Fixes: tag is attached for that
reason.

Signed-off-by: Pablo Azuaje <pablo45154@gmail.com>
---
 arch/x86/kvm/cpuid.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 851f151efb35..f0166072968f 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -477,8 +477,18 @@ int cpuid_query_maxphyaddr(struct kvm_vcpu *vcpu)
 	if (!best || best->eax < 0x80000008)
 		goto not_found;
 	best = kvm_find_cpuid_entry(vcpu, 0x80000008);
-	if (best)
-		return best->eax & 0xff;
+	if (best) {
+		/*
+		 * Clamp MAXPHYADDR to the architectural maximum of 52 bits.
+		 * A larger value is a VMM bug: KVM derives the reserved GPA
+		 * bits from MAXPHYADDR, e.g. kvm_vcpu_reserved_gpa_bits_raw()
+		 * is rsvd_bits(maxphyaddr, 63), and rsvd_bits() returns 0
+		 * when the range is empty, i.e. an over-wide MAXPHYADDR
+		 * silently disables reserved-bit checks on guest page table
+		 * walks.
+		 */
+		return min_t(u32, best->eax & 0xff, 52);
+	}
 not_found:
 	return 36;
 }
-- 
2.53.0

