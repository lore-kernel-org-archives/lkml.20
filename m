Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAF247140F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346297; cv=none; b=BFmp47CStCUECvpF9zC5pl+VbKPjPDlNi0zZvBJIpxZauHqvpR8QfP4gAFoy7Eu+VbfwJTErY+rXIBbKlRC0ktgCGd4apg1TujSzbYf4BuK3z7IanmYsOlbrStLnP1MwdSgFvZmGtBSj9qI+WC3GPmGHr3epgM/f1wY7+FxFgag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346297; c=relaxed/simple;
	bh=NRJjfa1oBWJjVwi9irw8swmUSNokXjGSiq7EU4Eu/kY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QOgHX1bSbJ1w9hVMBZEMi+oOmhuru+ZmE4jDeu1u5t9OBnT+oRl0BWIglD9BtyrsLKC7FOPqHqrmtqGyXEwqFqoM5rdeBMXSK7rxee6k024YvEByC5pDQTVqCfKLNASz2g0Y1oR1BuvbnJGc3O7piQpOgXTI6vkFqOlw3LMLN7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cO7KfsSB; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cO7KfsSB"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c217f249fa1so87663866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346271; x=1788951071; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz0QJrsFl6sXg/0SkB/zVAyOBBHBg8ebGgd7F8eNZsM=;
        b=cO7KfsSBhWdHUdklyHVOD8n38JwBqFaDAP4bFvmqCT02FYqDHQbd21SZuC+fR9k4ke
         ESqExeNF5vdjwoxAo/77kdmphTpAlvF6Jx5KnDU21W3ZWNJEtwwY3Z3lCQd4PAGznQbR
         wsVcX3DqMPThOg5XJNaskHeBI5yYOueLDKtoDLVOi8IUgpdfGPYyVuZHVAAKfYC1TkYM
         epye+3GTc9bFSNHkyvZC1qpGZa8IDHWrBTAkWavytV1TQdBGGnNypQlJ/nr3kQale66W
         eoPv7tZc2qDD1NYn/Mn3elZsMffypFBjb44jLK8MPaBtwWNZvJKgrrbgeyy5ppO7H8OQ
         Hu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346271; x=1788951071;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nz0QJrsFl6sXg/0SkB/zVAyOBBHBg8ebGgd7F8eNZsM=;
        b=YiYojw+Jz+uk2fwTQcL0wkMggVYtmaRhald26x2XeLVn/g22TC8cwrw9fKUyS9v0y4
         4mcIjqYt6M/fehtvj/3PQ63JsnujNaENDiiQgOrhO7OeEVpkFTx+T9YbhxaB2rJ6Yu0x
         WZAGoPK/vLQ4Av2LiFcHXEPOLIv6q+ml334T4KB5/SOFOENYOPHyj69hTcV5u/ARFLCv
         8rRMCQ8B/k8jF9Tb9NhVrlc3btlDxnb1ZDudTtxPD78Q2X7EwW/To8cr3AWPsjy/2dtj
         zkuUqXbCAG44vocl1TRa2DaEZp9+3CXov2g7Cdt7vdPp/PSePM+wpQ4qQpPSJvl73Cyq
         PTVA==
X-Forwarded-Encrypted: i=1; AKwUvBxv7x67Bb1JcgZEWY5eRrjK3G90uASDmbR5gQ+pgIiJdCErX3CpgyWwjnsSGxFOnzH8eKXtmINGX71UCqI=@vger.kernel.org
X-Gm-Message-State: AFuF++l9x7zwQ92t3ODjvFUS8Mz4bFK4lY3hQ7eiSTb76cF2biZ4lipZ
	aXFRvK2QKBs/emvQGsFHY57jt+LmcMqwLrMQWb9m6tqT+Hi4gGdvVQs4jOIDpd0GuMeu/mXUq+k
	FjD7tk9j4A7s5NFQgxatdVw==
X-Received: from ejcz24.prod.google.com ([2002:a17:906:2718:b0:c25:3006:b1a0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:807:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c25d544f52fmr257827266b.4.1788346270231;
 Wed, 02 Sep 2026 03:51:10 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:05 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-4-vdonnefort@google.com>
Subject: [PATCH v9 03/10] set_memory.h: Introduce can_set_direct_map_range()
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

While can_set_direct_map() tells whether the direct map can be modified
globally, can_set_direct_map_range() checks if a specific range can be
modified. e.g. if mapped at PTE-level.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..88175c3fa751 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -44,6 +44,12 @@ static inline bool kernel_page_present(struct page *page)
 {
 	return true;
 }
+
+static inline bool can_set_direct_map_range(struct page *page,
+					    unsigned long nr_pages)
+{
+	return false;
+}
 #else /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 /*
  * Some architectures, e.g. ARM64 can disable direct map modifications at
@@ -56,6 +62,14 @@ static inline bool can_set_direct_map(void)
 }
 #define can_set_direct_map can_set_direct_map
 #endif
+
+#ifndef can_set_direct_map_range
+static inline bool can_set_direct_map_range(struct page *page, unsigned long nr_pages)
+{
+	return can_set_direct_map();
+}
+#define can_set_direct_map_range can_set_direct_map_range
+#endif
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifdef CONFIG_X86_64
-- 
2.55.0.970.g62bdec98f9-goog

