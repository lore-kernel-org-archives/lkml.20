Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB54FC8E5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057442; cv=none; b=sX6jUKYWZMwQqfLb1K3BKk3KQ4gsmNZ/4LZVruUUz5MBB5bxKPhrAmjKmAp/YP5SAW/cYn+Y+nKg0OLUspRh/TR9hShGy5ryrNjMY7S0J2PBANXGxlzqGEIcIjYRbZY8skR8BtxSgmVjiQkfiSs4s0lJYp+6Y3KLCJSqP5JrF+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057442; c=relaxed/simple;
	bh=FXlmfD+i35+iX4uCD+rWudM4SzaRO4YkxNrcJ/VTr5Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VXijH3vCTzyoe6WmlDH+8PdZTg+Gh625MeI1SHnhcXA4YdWGTJebVue0X372efl8TFSnSR+GzMl7yz7s4ZXrh0YDTUPFLTHO2zoT6ntURYjIw8tdk0NTa1Df74ErfjTv4ZLw2maYe0wbeLc6PDnYnP3bj57BugJ+tAj/SNDlWYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kMqlNF4H; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kMqlNF4H"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495474a5fbcso161755e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057437; x=1789662237; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2noM4J4G4Z/91+d3z307VtID9oIWCOO73XBAg9AhrEM=;
        b=kMqlNF4Hn1J9tFyjo5gvrCqIBqsyI5THMEtF5+toeGriWCHILvYPeFgt/Z5+/7M704
         DMjoYZfP4PwlndhEG4erxP75XeZUxbhu7qkXa2hv5u/Nf6uKS7OEZMmt2t2NZdnZTlz5
         TuD6VudMzHOMGcX3zr+IDD0D0kI04z0PYLCWUcBa5cMjw9uATNasHG+FhR8ysSWhPjSx
         kTNnXwEMtRQi2Bs7TQ/J2mRrJH7nGTyXUKaVV5ocb/dK3sV3c000JB6lZT25Y8B3VSdk
         jInuhpYLHNkOWYVmwceAswTCwTC9LtmcS4N3pTLzTDeTzvsIJneX9p31r7YUJl5ZkXmz
         3f8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057437; x=1789662237;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2noM4J4G4Z/91+d3z307VtID9oIWCOO73XBAg9AhrEM=;
        b=dQ2nuEhX9EB/hbULO/cK6opcORt2466yKMkeb4JT6skC8r/OhaCE0Xbpll2tsYx5oF
         dgec85ca6LloWRn/lH6S+5EFSBDHQj2Nh2fCvQXw66Y6G2w47IhKGMqfUCtR/EE4d6D3
         LoM1tZgXei6gH9rbPf4mHt56ZCiaVQjKJBDYTOLUEvmplqzB2CfkgfqV5e/QZm6E0GJ/
         JY5nC4scMuYfKmyCgjcF5FakKqSA6VIAINYCgOBgWPM1VZhUjuMXUnJOLLbIqekH3nGp
         h3kDLcUXWoHZDKVdlmrAWzdLnYcXqYVnxe2nylK03Y2/jHKMSCLY+4ERON+AJWs5KmnE
         sctg==
X-Forwarded-Encrypted: i=1; AKwUvByBy55J/Q5ZnTRkYNwvhpxYK5g2xic3R5c16nplN7tIQQZniezeaK/BoEe+d7wJF8QYVk4DE+F5ByPEUkU=@vger.kernel.org
X-Gm-Message-State: AFuF++lkXOZaPoBo7H79M3TEeLquE9b5GFxHnZdJPyPyqOmrmlIbd8iw
	WBA+7y8ph348w9q4XkZtJz5uffT7LMLWml8dnja3u5vg99z4kAi3PMAnUCAwngXNfPAhleETsHg
	O3A==
X-Received: from wrzf4.prod.google.com ([2002:a05:6000:1b04:b0:484:36e2:923e])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:848e:20b0:495:4d88:e630
 with SMTP id 5b1f17b1804b1-49cf824f697mr311679985e9.10.1789057437113; Thu, 10
 Sep 2026 09:23:57 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:21:35 +0000
In-Reply-To: <20260910162343.4092060-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910162343.4092060-3-elver@google.com>
Subject: [PATCH RFC 02/10] KVM: Allow reading memslots while holding slots_arch_lock
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

kvm_swap_active_memslots() updates kvm->memslots[as_id] while holding both
kvm->slots_lock and kvm->slots_arch_lock. Holding either lock guarantees
that memslots cannot be concurrently modified.

Allow reading memslots in __kvm_memslots() when kvm->slots_arch_lock is
held.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/kvm_host.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 03bfc92864b6..5ed8260ef01f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1089,6 +1089,7 @@ static inline struct kvm_memslots *__kvm_memslots(struct kvm *kvm, int as_id)
 	as_id = array_index_nospec(as_id, KVM_MAX_NR_ADDRESS_SPACES);
 	return srcu_dereference_check(kvm->memslots[as_id], &kvm->srcu,
 			lockdep_is_held(&kvm->slots_lock) ||
+			lockdep_is_held(&kvm->slots_arch_lock) ||
 			!refcount_read(&kvm->users_count));
 }
 
-- 
2.55.0.1003.g10538fe699-goog

