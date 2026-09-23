Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CE735B12B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139158; cv=none; b=noCCzH7wFKW3oDEiA8Lrr6F1ufkSu7lGtaCjuwqwLPYGrtNYdn6BJFioz5Bctsmyv9U1KARHTLPuiMAcxV+TyvXrd2I7G6QQuIDVpC4pegksCYY3kRBuctj3IMPTqJaFBrwx0x4QHGI6wLJL4uQDjwf1izjo/4w2KiyXX1MnDV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139158; c=relaxed/simple;
	bh=7y7GXnhSDovHIpVLBgt1Fd+3FmTisgFDfMLhG7uux9Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=vGPq5AEu6NzkzTW2Wqj/9+OPmYmYzMSuJeSH/kBAjjuSpSY6WuSzYnqQDKazGW1sAPnXV4+VwuweyZL1d8eBQ+2B5YckO+tuKyIcLMN4/sE0mONxU5XTEw/JakGqJezxXRIW+L/+rRR8sSpYoMOeBpn7/a5vudNG4qZQcYXHP6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CsrdKgUT; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CsrdKgUT"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd1631d291so4796015ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790139156; x=1790743956; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0WespfEuphhz3CCLrHdjFoExifMJMtXw8rgeMcCZTM=;
        b=CsrdKgUTRAU+W05TNihFqv5IgF5KxJG5mOMQdgjmMuMXC0USpMYzPYPdWUi0D81Qyg
         D4KUSe3/mQlysxYd1c97E2oB5ur1kUrqYYCr4eN51goAcgZBEY2kWO6/59XSinxSm/hO
         iRjbMr0j1VnqoXknH5M7GlPEaQ96IKVLWG8h5Q3xGX+y4QqBzEOPrYghIKlfzI9ycJAe
         L6gUJ44XEZjYLY8wyEo9vEzKCExPwg5Ml4HN8Ke6oRIKjVAiI1VZv5Ge1WJ+pMdWOU2H
         t9Icv2oyj/PkGAXoXYdYg5D1iyW7A/rfqW8AGyGfawi6CR5L3Ya4z8hFabyYNS00iP/g
         J36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139156; x=1790743956;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0WespfEuphhz3CCLrHdjFoExifMJMtXw8rgeMcCZTM=;
        b=VY93xvPW1ARpDXK8Xv48/fqFORZLB971uZF2dvIr7nQ/g9Adf51bE+LWv5C+cqwf6X
         Z+XaLmnCzmtXW6Wk3TROcRLqEDJ/j307SfpDYb98zIpRqVRTnSmw0oZj7u+/IPLRJR7v
         a0TvCcoqzWcq9bEpcCvPdIBYSbYAaEEvK8m8ukJVKBeXHMj29G7jSIqTZWpOqYYgS2t7
         1ugDTIuKs4KjZo0aqI4liiySCTIMQ9ScDPE7vwQdtXJyMwSjbOHYemLI8QksobWMEyXp
         tBYLM5ZBfDHsaLzR6QlqA8nux+upeN4nyxQycMeOiYINC28Yf0Tjc6zHrVU2so68o1Mp
         cy3A==
X-Forwarded-Encrypted: i=1; AKwUvBwZ8j5Jw1yhQF0m+QEW/68RYm6jJpMAcskU1xcE7VgEHPA3iC5UCVAoy+2Ec8GST4Qdkwp+ktFY0+J8nTI=@vger.kernel.org
X-Gm-Message-State: AFuF++n2uwBSii7i7j48yvrdhslKQWIWhLoukL+du4A7ubRoe6jalRov
	3kOcCWRrcHtrrzb0vx76OimH8ZWJtRmuhHsnGKTDhDcOTKtv9vBiW8Nrds7PK9XRbF/2KE5Ow4F
	P
X-Received: from pldv21.prod.google.com ([2002:a17:902:ca95:b0:2df:6d4f:f536])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:144f:b0:2dd:c100:80c0
 with SMTP id d9443c01a7336-2df69e1f9bfmr13350505ad.59.1790139156378; Tue, 22
 Sep 2026 21:52:36 -0700 (PDT)
Date: Wed, 23 Sep 2026 04:52:33 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923045233.2579591-1-morbo@google.com>
Subject: [PATCH] wifi: ieee80211: annotate struct s1g_tim_enc_block with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Bryam Vargas <hexlabsecurity@proton.me>, Lachlan Hodges <lachlan.hodges@morsemicro.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

The GCC and Clang compilers support the "__counted_by_ptr" attribute on
pointer fields to associate them with an element count in the same
struct. This enables KASAN and UBSan bounds checking to detect
out-of-bounds accesses to the pointer.

In "include/linux/ieee80211-s1g.h", "struct s1g_tim_enc_block" has a
pointer member "ptr" of type "const u8 *" whose size is described by the
"len" member, which is correctly populated with the size of the buffer
before any pointer dereferences.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/ieee80211-s1g.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/ieee80211-s1g.h b/include/linux/ieee80211-s1g.h
index 3f9626ad3d97..8f6107782c38 100644
--- a/include/linux/ieee80211-s1g.h
+++ b/include/linux/ieee80211-s1g.h
@@ -349,7 +349,7 @@ struct s1g_tim_aid {
 struct s1g_tim_enc_block {
 	u8 enc_mode;
 	bool inverse;
-	const u8 *ptr;
+	const u8 *ptr __counted_by_ptr(len);
 	u8 len;
 
 	/*
-- 
2.55.0.1082.g2b9226bbc0-goog

