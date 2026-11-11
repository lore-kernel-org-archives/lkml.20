Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387314;
	b=sYKSu4a14s9FExdAIHF7GLC3mWzSYxi7NWVtkniAJgLZyxHMEw+8/Dyao6TfDxy/RptZ
	 IRyys8Y/Z7njUg58z/HTjXq5E7PXSJJSP1HyYK+QKRG9+5aPTrjVZmYDrtyVzp/9hEV3n
	 Z0AMT2ucEVW7AjrBVAH7i9K4vvhu/bv/DdHcvjW6W+Cui76SzSWqnHujK9b7uLyjiKWoT
	 Xe9Q4aljO+J91jFiNkd/x08qENuG0DdMqYG2hrZ6eJDpdjX6dqJDV5c8v+eOh0ajFvA6Y
	 0irEP10OT1i7oxJiPSwciOEPK5gUceHMF2vwatwoRakt8pPja4xkUQGjjgFpQFu0iJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387314;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sU/uCzkrcw4yzr4Jgej5zFnIX6J1nsjRWMYoNMeMIes=;
	b=0BwG6VS2cZIDG/RjW+NPH/HLtifPPd7Q/AKE2h0jrfzR3MrtFF1lg8Z3AIWPOshyqh8d
	 rVkGDpsSvTVlvbb4cFVYHTDNQ+UnVs/6kHGNuuF0gn2DU+uhQ9auROSZ4tcrvrmkFX0Pq
	 Ko3D811wG4OWQW3tKcswXbocgBQnozAGNN3/ECPsS/NrHMtLajtrxQ//RFl9U4uQm7h43
	 5Yi37WCNgTMjP2TheuwlXJHw70a+TRGQMW1ZaWiD1RZ8j9TVwgcjMQFUqgx+a1g3bMAHG
	 MDX7L0YyKe0/Vr4h9vpCaJlWXOzJD8cZRFAFcS9ub3tqWsiqnt1/hmSZkZR3Vun0Y+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TBMn4ro+;
	arc=none smtp.remote-ip=95.215.58.23
Received: from mta1.migadu.com (out-23.mta1.migadu.com [95.215.58.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E460A5BC8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5E460A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TBMn4ro+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qMpJUnOcEqt7DYSuh3G5DlyHK2LhQjmbYg9/ai4nvKw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794387312; v=1; x=1794992112;
 b=TBMn4ro+oyrnj1x8AuMyvcHaazb2xV4AXJWy6Nw6oHS84BcgHPFhuOE0d6LvKOM0FqIGpVkO
 bgD7HAIOpvUzx+LBWvH7oFevDTtHBt9iFcmPEti5WMniWymjCw15TeOdlO8peiGTQJUzW6MBbxC
 RgO4a43oGiH/apIXhuQOuz/Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 797d428f08b91c42;
	Wed, 11 Nov 2026 08:55:11 +0000
X-Mizu-Trace-ID: 797d428f08b91c42
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-mips@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 6/7] KVM: Fix the range of reserved arch-independent request bits
Date: Wed, 11 Nov 2026 08:54:47 +0000
Message-ID: <20261111085448.1130701-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111085448.1130701-1-fuad.tabba@linux.dev>
References: <20261111085448.1130701-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KVM_REQ_DIRTY_RING_SOFT_FULL is bit 3, so the bits reserved for more
architecture-independent requests are 4-7. Fix the comment.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 include/linux/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4b91ef9667703..21207d234618a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -165,7 +165,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 #define KVM_REQUEST_NO_ACTION      BIT(10)
 /*
  * Architecture-independent vcpu->requests bit members
- * Bits 3-7 are reserved for more arch-independent bits.
+ * Bits 4-7 are reserved for more arch-independent bits.
  */
 #define KVM_REQ_TLB_FLUSH		(0 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_VM_DEAD			(1 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
-- 
2.47.3

