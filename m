Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1861846D570
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346281; cv=none; b=pouaC9SUuS3g/NQOvKqq8SZY893KMVw09yWzzawuOTGRjRitjm99mOHQC/U5jtHgqtFMCVzrev1Sl3olXlb1W748cjbJJFgwaIdZkyXgCfXGNwCTAwbxwTRF3BNzQodagcKIQe0D1b03SNsjjD34CSrOneVVyQeDQpCv1qeapq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346281; c=relaxed/simple;
	bh=Hjs9VwVCBCQIR9TgAq/HTqzG2ZG5eMRL2SHfgwqwO1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=thq0mfFn4MLJiPHSH7ZRx29uZv3JLPy0oi+Fz794/c4xg9ZDZIxw5PGoim2n04TOsLsSvrIRyLGAtyjzoSQN6DTNQhVf8wuUXjHw9GaTK3EtHLM2MA366Egez6eibQRJE5oodfSkXA4Tk85EqUM2sOEYV+z5FVPVPEGa0YRXJOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kiMguIVT; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kiMguIVT"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cd83ca361so10491115e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346272; x=1788951072; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9YJxK+goKseFQhyyU1kBZycBjFaImkJiX1HLmgsMgs=;
        b=kiMguIVT7KzOSC5cABj1WESBPpg0uMN4MhvNtNig7Fb9XE8B3ecCYb3o2QdVVPXKqG
         ROlh2StWi+idCLz9/0WmoQX4ydjGS//oNMlM91JijcdjvK0FkqPTOKiI9JDwf68RxuUU
         UhvVKyNiRnvDcIGAHgmF7rijYg8y0RwzvwUQT07P2383dCGQkyiMcTzXH0AnQubrAOpY
         BBTpVRatJz9umvvihCsfGbtY2BMkZ+jnDxBb+lTPK2Fa1rjvhpHFF3l9+FJNj04a+BS2
         3efI9ttI3cKWZsO3duUXbFIoUejmdck5Z4DUmNqtT+GTzkINisn4QZX90LMeUl3EV1xq
         Ou0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346272; x=1788951072;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9YJxK+goKseFQhyyU1kBZycBjFaImkJiX1HLmgsMgs=;
        b=mUjcsznAKRZtoOHwOvkIFhjbZfviEZ2rRwJPl7dJmSZY20hdUfmmxwVLXh7KQSLW3Q
         3rDC2eSzJdXoEHx/Wcr84tcu4WTBc+rSVmxWiC9VP1GnW3KlkyGDdTMnIajaTXsDuh65
         lbiy5DHRPTrDT+GMhl1e43pTenSkQteZ2pNKYcgAjpilLlDwdaErYPaDmxMZqNhcnYTP
         ABOJDBWdh5wZYsTP/25xnzV6IJjO9t/HTubXxtboUx6TSEvxaz66tMMQlSVate9laCae
         LSlhjOu/xuZGVhq7+FQtu98+Lqt2lMNGYVmAyzR+m0g8Q2CAEEquXTwSdm3VrVPziXlm
         e4+g==
X-Forwarded-Encrypted: i=1; AHgh+Rp79oH9bynMXHyn4a7ihU6KhfTEXmzxENHwXLCmM4A+0shARtqAOopL4lwXZBfRWHSadDg0VqMfWxQ7glU=@vger.kernel.org
X-Gm-Message-State: AFuF++kRsXhV42MnjUGIDMb19GNRlG+q1VWmfW1plWICndz2En8T1Crz
	Z9AIHZnopTG7kbe9dTnL9kGj8I5cUTuV349g0AuravCffNdTFwvCcF1daFOaWZAyFWwEKsOxbFx
	ARz2dDjRJRRTY7ck2fl8vSQ==
X-Received: from wmik9.prod.google.com ([2002:a7b:c409:0:b0:49b:e83:a666])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e44:b0:49c:dcf8:5216 with SMTP id 5b1f17b1804b1-49ce57e7f55mr71897835e9.6.1788346271508;
 Wed, 02 Sep 2026 03:51:11 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:06 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-5-vdonnefort@google.com>
Subject: [PATCH v9 04/10] set_memory.h: Introduce __set_direct_map*()
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

set_direct_map_*() implementations verify wheter the direct map can be
effectively set. This verification can be costly. Add an "advanced" API
__set_direct_map_*() where the direct map is modified without any check.
The caller must have verified it is safe earlier with one of the
can_set_direct_map() or can_set_direct_map_range() functions.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 88175c3fa751..5a1917a3fd52 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -34,6 +34,15 @@ static inline int set_direct_map_default_noflush(struct page *page)
 	return 0;
 }
 
+static inline int __set_direct_map_invalid_noflush(struct page *page)
+{
+	return 0;
+}
+static inline int __set_direct_map_default_noflush(struct page *page)
+{
+	return 0;
+}
+
 static inline int set_direct_map_valid_noflush(struct page *page,
 					       unsigned nr, bool valid)
 {
@@ -70,6 +79,22 @@ static inline bool can_set_direct_map_range(struct page *page, unsigned long nr_
 }
 #define can_set_direct_map_range can_set_direct_map_range
 #endif
+
+#ifndef __set_direct_map_invalid_noflush
+static inline int __set_direct_map_invalid_noflush(struct page *page)
+{
+	return set_direct_map_invalid_noflush(page);
+}
+#define __set_direct_map_invalid_noflush __set_direct_map_invalid_noflush
+#endif
+
+#ifndef __set_direct_map_default_noflush
+static inline int __set_direct_map_default_noflush(struct page *page)
+{
+	return set_direct_map_default_noflush(page);
+}
+#define __set_direct_map_default_noflush __set_direct_map_default_noflush
+#endif
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifdef CONFIG_X86_64
-- 
2.55.0.970.g62bdec98f9-goog

