Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90DE58FD35
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886519; cv=none; b=CY+twduD+PpeWJA6+UaN8h3xExwRrENxbxvPA0kFoRpsGeQBQYRngvhrNLrYERsANJs/9henLx2uu+tKxrbBYnLpxCEZAbCPBsnLnvkW30lrsIGZqb7O68fnVc4qzmFEnBhTQTP0DtwG5w3c9ymEhAuT9QAuIdmFRtmMQhoO7M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886519; c=relaxed/simple;
	bh=ns2JDtylu0ZVx4C7znMm+Qun0k8Uo9dIcle/pG/Boc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AyCs+BGk8GypXOrFWitrg1NFwPBHuuMoyZCUhCEromZdStuLZIW/s2WWGLejJJEkx1hWx6BcggVGA0m7FWYtpGJHFh+q4HyBUzJwMHykmpoq3KObFo8BMlHmNFJa2r4DcxnWz1JUdrOJATMvmlspZRJY5A9tVd4mcSJD+LUJdks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bjR8M65r; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bjR8M65r"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cff3b3b92so96945e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886515; x=1789491315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QT2LgRp+eFl8LbhRKic90r+4pTm4Z+44dh2+IjeCBi0=;
        b=bjR8M65ru5tLPo2MxxbXzwAM14fvxusFcKtnjFfyr3w4lDHT2b44EJCF+H7H9OnTBA
         YL3HbBv0v70ald/VRTgHSMqh53VlXSPrRAOJrbVc3TdBJr7nwvQ1WWSYG1kJsL680Awo
         xbDCsVK/35gKGa49vZv4D1EeQ/vrvKt9Y9CJHnvq0du89UFOLNgaEXlSHz7fY7om41tw
         //RUjCB7v3Nkhv6RBgGFgx8A4L8VyL0pDjVphEam5/sy4MMUL2nZwy5v4ZMFPwsVK1O1
         wSji7i/t8/laLhGl+2ESsADYgygPaZrfbEHOrqPPYGiGgbqAjNAbZ2ZenP47L8mVY8xJ
         eZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886515; x=1789491315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QT2LgRp+eFl8LbhRKic90r+4pTm4Z+44dh2+IjeCBi0=;
        b=Nd1FK5isqvCK35TRq3C+GodXssfuRFczn0aMpOGcOB9mjuuuUAcwAG4sAw5RlLOe/p
         c9nD1xbyVy9K4l/m6I29IH5q+oxBOX7U7gcu+TXvsXRM91UM7o/p63LyTsmY0SLaz0tc
         DZVkp+7hLYJ4S05d9A7DUSK7Gl/OhyKbHILK2dGvYkCuRziVNANJsK5hgLDv6HHARCyd
         moRhChZt6B4XVHxU0lTckwgCeJ5yQVaQExvk9dzHB7XSi+u0Qa/S9C53VDnztS90kvB5
         cjOXLdOn+9norBMjcbngK7cJV7m0/b41q7yv4pBC+F166Nb3K6+ZMOhJAO1UdsF6AjTT
         O5yg==
X-Forwarded-Encrypted: i=1; AKwUvBzzBa3RG+f6HH0uHcma0zu5LhIx9aKiIiL4emsDdhZ7cGPTUciH65eaBqFA1BBLJUGTjMADHErSAvsBroM=@vger.kernel.org
X-Gm-Message-State: AFuF++m4r7zmUFwOlMbAoe8yXY3hirAyeeDYuFG7QdjkQWSsw2rjLu8y
	LbKVk3Ua2Wd4VyRSGdNOemzCv+nANLOTKAInwOMyopLDu7IzIp7U+86W1T5C6ngQ5A==
X-Gm-Gg: AYBFou3b/yhKYlElJmKMpGkRRY5v3FVDv2ACQdBBh+f1ppGDxthcZH+vIFYVwh4wzvF
	U9w7sXqUEISXjrxpo5NFauf97jbwEaIMuEjl3Rh4g2DeHlbUpi4zV5r3MzxVpg+dOBWAcbAePRN
	yYWqzDSUSB64pTx7pAttJkjDU9KLNKvfy5w/mGhGdPmjcDRSmS87KJEzK2M12+zevK8ZPEbM00l
	hZs4PAScRcFxo7SYJWUhlAVdRIv+RM42t9uqDaSYEgLjnQsRuCNx+ffRxFyauadCaXp2EsMF/fJ
	PI/biNCxoLSDGs3AQgcbJ8JtRvb+yNAvd/uIo5zlwXfsW3eiGVhZgpgVMQYQMKwWFwrnd5jC12I
	cns3vnDj2DvHotq0fxdoa8oY8OJVzi1vbQjdUKT3MRWGwJbX0fwAmxXohD1htT2COFi/UYMM9jY
	+OgLAzYZsmOx1H/DsUiDeeXoIegDDQh0BYIWSloOK8IBA9xuunbzRhK35CPEYNtJXvn9VFmoxsn
	7ILiTOEGHIf3OiYQK75/LwzTyxmKv7Zx8XLaUM3l9vXeJcU
X-Received: by 2002:a05:600d:650d:10b0:49b:dec:ae63 with SMTP id 5b1f17b1804b1-49d05898d9emr2153525e9.12.1788886514775;
        Tue, 08 Sep 2026 09:55:14 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fd845absm148015e9.3.2026.09.08.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:13 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:48 +0200
Subject: [PATCH RFC v3 08/12] kcov: log freeing of SLUB objects and pages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-8-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=2117;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=ns2JDtylu0ZVx4C7znMm+Qun0k8Uo9dIcle/pG/Boc0=;
 b=K3J6yFPU21oXDkqAqu5zOxsYibb4xdpPLHoKvLH5qNom7vL+ErrS4AoAGUJwJmK4uGxq1QNWd
 vkAM0pi7NY4DuxZuPSpmrXCMiJD//apE3zJ+yZqkc1NisNYpRgSRl/C
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

To help with using CONFIG_KCOV_MEMORY for detecting use-after-free issues,
log when memory (SLUB objects or page allocations) is being freed.

This should happen after KASAN has already marked the memory as freed;
this will become important if we allow driving delay injection off this
in the future.

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/uapi/linux/kcov.h | 1 +
 mm/kasan/common.c         | 2 ++
 mm/page_alloc.c           | 3 +++
 3 files changed, 6 insertions(+)

diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index 7d7147e7b427..76822d1c119a 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -90,6 +90,7 @@ static inline __u64 kcov_remote_handle(__u64 subsys, __u64 inst)
 #define MEMORY_ACCESS_RECORD_WRITE 0x10
 #define MEMORY_ACCESS_RECORD_RMW 0x20
 #define MEMORY_ACCESS_RECORD_ATOMIC 0x40
+#define MEMORY_ACCESS_RECORD_FREE 0x80
 struct memory_access_record {
 	__aligned_u64 ip_address_and_kcov_flags;
 	__aligned_u64 data_address;
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 1ab77ac9719c..3a648eaad024 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -283,6 +283,8 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 		return false;
 
 	poison_slab_object(cache, object, init);
+	_kcov_handle_memaccess(object, cache->object_size,
+				    MEMORY_ACCESS_RECORD_WRITE|MEMORY_ACCESS_RECORD_FREE);
 
 	if (no_quarantine)
 		return false;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 083cbcb5bdde..910d14925b84 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1446,6 +1446,9 @@ static __always_inline bool __free_pages_prepare(struct page *page,
 	if (init)
 		clear_highpages_kasan_tagged(page, 1 << order);
 
+	_kcov_handle_memaccess(page_address(page), (1 << order)*PAGE_SIZE,
+				    MEMORY_ACCESS_RECORD_WRITE|MEMORY_ACCESS_RECORD_FREE);
+
 	/*
 	 * arch_free_page() can make the page's contents inaccessible.  s390
 	 * does this.  So nothing which can access the page's contents should

-- 
2.55.0.979.g7e5102b832-goog

