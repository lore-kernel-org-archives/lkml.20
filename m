Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D148425E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775438; cv=none; b=kVDqtVr4nheSJsFD5qo+cyyxroC7TPXlMqlRfkkgACKYeMYOKoHwT/jF7PuCuyjHKEi+TFvwjwJxw8sE+9P2hr0MLwr/UaA8qpzyUzahlwkOWMeH++gC613QGBKubF3dvzAzW7/+REdrHtsd9A9dtnwUroeN/ycn7fx0a9bynL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775438; c=relaxed/simple;
	bh=hKpqI0mJBjI5kD/qIVjkPJS+ecEWrrNrfB5JGjhq/dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsOGKantCJJD82ShWm6NXSSLDQNO4CmIrPw6enK6UPA5aj4PxId2mzH40JoNMdkR7AvykJKjamcJH0TobiXjZfTb6eZG5UBVmW37KsQ5tIfkATPRd3oiJzcdyEW6Icq8tLkp+sIWY+v5bWvQEjR8/IuTO9uHuRPDOjpwx+iHFYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=J+utyxIe; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="J+utyxIe"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964e480f76so1887985a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1787775436; x=1788380236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WthiUzOKvGxpWM8//TLZ/XtLsB2b7m0C7+XlHQIInq0=;
        b=J+utyxIen6qNIKL5FW3l10kul7EWlMPt0n5nkxVb3ZSJtSwUFKSyru5T+J+Uz/mDw4
         6UiwYESI/YulhkiQbEyztMqfqF4NsSJmjdTe1EM2YEzAwybtl6/mMOZM+uQYcbevrzK/
         cC5hhOauz0Qk7YKwlyYehbzn8y/6G6bUN/xjvL2sqdU7qZn6dHLN2fbclIt+t/e3NPhZ
         t94OvmXZvceMoi1b2dtV6hN8vtMD9HoAZYJs9RYxz6oajFNTO/1WC7+jmB/WYnFDMhSa
         a1ozDXXqO4jyqZw1D9iLZDs5L2sB3yLBY5h6ewha4DXmPY+iDWmr8XEkTwDoY0iPP+XQ
         WYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775436; x=1788380236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WthiUzOKvGxpWM8//TLZ/XtLsB2b7m0C7+XlHQIInq0=;
        b=E5i1B4KJT0+x4vYM/XJGmJa/Wm21cuI2IXhu11ZHr79d+VrVsVBVMt/L9wtRgYl3jw
         fWGmzX6du5xn7Z3jH1Lf4SnvKjOxjvrr38rzklRcNSUKJINCFow4bpZ+t+3iUD0nyDJd
         mU3UmNOuaKAIh1N3mB20TYkfh1TGpPPLujB0y72V+Oeso0f1qwLGjybv1mKqKRPmCg4M
         NlEMmQBgOPLrsvz8Cl/Rw/OtNoXh89aV/b/qtE8hD2FkZUcUVMxEL7JeA8PHHU+LQPmF
         DoKfujKkfn6adD/asV5YuVy8+ZfwlypE5qdTrl3LdHIXl6FU9RPUrAIMT1UZzE3QSgrK
         cYLw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy9dmXGJ7oMyl68e1zTXjwP0NmAs9wK0M+KE7wHLC1rY7tNiy7JQu0yMA5HVDAXe9MLLhBUsh8b6ceZ/8=@vger.kernel.org
X-Gm-Message-State: AFuF++lmtXvtUVggVUhUaNmROGH1HNNwuyVSCbvH253aRPGdL8994L2f
	mh7ze/zhr2iZKF/TH/KH57sjWFZdV/4/i7llCG0rGFRfSijQZx8RtXhiQ9gw1CepAkc=
X-Gm-Gg: AR+sD13PgojdcPoYCBg6jp0IRHR1C4r/Hb3ErWeAUgZEuDeBYi0nE6i3gYTm9TmKIwy
	M7yj2Sr3o44joQeUHiNKriCO+/VCNngeIpQdneXzNPapVD8oApJ1dY7skkZp26MkoXO0p4oAMsU
	fGwsPSaS/viPRlqQf4Y55p6CDS5bSbqgnR46ZxTwbwuU8IJR9Vh7e64pmvOsEIh4m9XtHcCm7sb
	27ngMMlKwkjdHwFqgH7ExHZbOw6w0NRtlAHO8DdrX3Sz0Y4zTBwTu3hSPDqxAfhNwuAYBdgb/Uy
	PMWCSQEYFgoP/dsAAMB9mP9JFlLeNKms+LEX1Cyg7KI3YcLM3YUSfyi1Y4b71S8j4lzDV+isdSy
	1Zf8ia6oxvogdw2uBSROvhUuBXTgbRa8MlQTZJvLiY6Evw5UKQc1aoQLzwMYEK3DzhjbF4yFgcx
	ec8UurKCFbwnI43PaHRf2mD3CVo+AR36e5MV5D1SfZTJMCw6TfcW94jStg172GWyoq+CyHrGgj+
	Ten5sQQVz3hnnoi8eVU6cZ8Aj5xvu7lly5ABzF4Ng37sXXWZcXnJXYzZOk=
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr20608038a91.9.1787775435729;
        Wed, 26 Aug 2026 13:17:15 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:957:eb3d:7323:2ed])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60b59dsm11179738eec.3.2026.08.26.13.17.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 13:17:15 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	kimjw04271234@gmail.com,
	Artem Dinaburg <artem@trailofbits.com>
Subject: [PATCH 6.1.y 2/2] KVM: x86/mmu: Check write tracking in all address spaces
Date: Wed, 26 Aug 2026 16:16:55 -0400
Message-ID: <20260826201655.9198-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826201655.9198-1-artem@trailofbits.com>
References: <20260826201655.9198-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinu Kim <kimjw04271234@gmail.com>

commit 0f38453cdb2e17566ccb7c0f3dabd5bd21caca26 upstream.

kvm_gfn_is_write_tracked() checks only the supplied memslot, but page
tracking is per-address-space and shadow pages are shared across all
address spaces.  With SMM, a GFN can therefore be write-tracked in one
address space and appear untracked through the other.

Check the supplied slot first, then the slot for the other address space.
This ensures all callers honor write tracking regardless of the active
address space.  In particular, it prevents mmu_try_to_unsync_pages() from
marking an upper-level shadow page unsync and eventually triggering the
BUG in pte_list_remove().

Fixes: 699023e23965 ("KVM: x86: add SMM to the MMU role, support SMRAM address space")
Assisted-by: Codex:GPT-5
Signed-off-by: Jinu Kim <kimjw04271234@gmail.com>
Message-ID: <20260721103512.2136240-2-kimjw04271234@gmail.com>
[invert direction of the conditional. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[ artem: adapt to 6.1's kvm_slot_page_track_is_active() and mode-indexed
  gfn_track[]; KVM_ADDRESS_SPACE_NUM is unconditionally 2 on x86 in 6.1,
  so the peer-slot lookup needs no guard ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Target tree: linux-6.1.y (stable).

Verified: applies to v6.1.184; arch/x86/kvm/ builds clean with x86_64
defconfig plus CONFIG_KVM=m, CONFIG_KVM_INTEL=m and CONFIG_KVM_AMD=m,
gcc 13.3.0.

 arch/x86/kvm/mmu/page_track.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index 2e09d1b6249f..51d5a912c553 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -171,14 +171,25 @@ void kvm_slot_page_track_remove_page(struct kvm *kvm,
 }
 EXPORT_SYMBOL_GPL(kvm_slot_page_track_remove_page);
 
-/*
- * check if the corresponding access on the specified guest page is tracked.
- */
+static bool __kvm_slot_page_track_is_active(const struct kvm_memory_slot *slot,
+					    gfn_t gfn,
+					    enum kvm_page_track_mode mode)
+{
+	int index;
+
+	if (!slot)
+		return false;
+
+	index = gfn_to_index(gfn, slot->base_gfn, PG_LEVEL_4K);
+	return !!READ_ONCE(slot->arch.gfn_track[mode][index]);
+}
+
+/* check if write access is tracked on the specified guest page. */
 bool kvm_slot_page_track_is_active(struct kvm *kvm,
 				   const struct kvm_memory_slot *slot,
 				   gfn_t gfn, enum kvm_page_track_mode mode)
 {
-	int index;
+	const struct kvm_memory_slot *other_slot;
 
 	if (WARN_ON(!page_track_mode_is_valid(mode)))
 		return false;
@@ -190,8 +201,13 @@ bool kvm_slot_page_track_is_active(struct kvm *kvm,
 	    !kvm_page_track_write_tracking_enabled(kvm))
 		return false;
 
-	index = gfn_to_index(gfn, slot->base_gfn, PG_LEVEL_4K);
-	return !!READ_ONCE(slot->arch.gfn_track[mode][index]);
+	BUILD_BUG_ON(KVM_ADDRESS_SPACE_NUM > 2);
+
+	if (__kvm_slot_page_track_is_active(slot, gfn, mode))
+		return true;
+
+	other_slot = __gfn_to_memslot(__kvm_memslots(kvm, slot->as_id ^ 1), gfn);
+	return __kvm_slot_page_track_is_active(other_slot, gfn, mode);
 }
 
 void kvm_page_track_cleanup(struct kvm *kvm)
-- 
2.43.0

