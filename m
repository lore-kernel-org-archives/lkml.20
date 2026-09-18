Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF15937AA9E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737546; cv=none; b=d59oRuwcO2TWUqStF7Yh4WYAcOGUWhUpgN6IPLVYxz5YS3HNAA7kD/CgFpHn8hoN9bj5zk2j5Jx985appo815cXDCTpmPgc6sBOqypxPJE0HfHIuA3bEDG6pl+LWlZI0LPsVfRKx7oHgf7ExJppTSAX/baLHKtmnZqgTCh6u/8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737546; c=relaxed/simple;
	bh=ncZg2VuW+AySF8gMan+UeGIC3Uxuyips31vZXC/8WFE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hcKcspDl9/HOw//AVjwKZ5+VpwhU0aX8Ssmu9lfKNuS535oAy6Z7ir7TFUI1Ryd2v2yZnovkhcgJn2aSiWQqFAHCbJQ5pEzw2+8y6YV75gAmlGeVk/fCeGk5ak42PTGjpU98C2go4bEuOg9QdwzTIJ2S8xeowBirBiG1WfpInbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B/gWKm33; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B/gWKm33"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-472c330e555so349300f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789737543; x=1790342343; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R10EWAoqeqiwKYs38V4/eu87hmfK6YBmKaV1HjMgWDg=;
        b=B/gWKm33uRLY8ViiqpqQuf3gOS2bqWPrpt4nqhleSfJMIhc9LdiVIL2w0IDp/6k/Lc
         JNCb0mU7s4bdXBF1ZsECVKDFwtPUmHcrdNkcToZDR0XqPKwB+WdwdCVva541OcOlFKgp
         wgciMsVAidAgQb4nJEtz17JpYV3RjCE/5jR0IZNDM8kb1NoXGX8YK6LxuRaQy/yrJOBl
         khrcf4Q4rG1cdTMS5RugwSu1SKR3SnvhcFky8wxPleTqaKn1QoZc5tTbeVkNfrGxV6Li
         Z6KQU3HjbL5ipHnlNUz3wHEwh1YeMSvBKM+O/k+v1c0Y6kX5vtTsPOnztwf6+Xxb9sxx
         Wavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737543; x=1790342343;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R10EWAoqeqiwKYs38V4/eu87hmfK6YBmKaV1HjMgWDg=;
        b=XqhHd6EivgdwGehqgmw789M33C/Qen9Uq5iMOvwDKUXk75mVxVEnM+8EPHc2kacuNp
         Go5aYJ0lpFNoCxlRkzBr08UV/1jcWDs6+y91+9N3p6BinEh6rz+mULTnpXROyRspRfJL
         SdmanPo0uhxgZ/Z3NrUESqv9A5hLDzBa5EaYa9y6N6yW7reXLObIfMbf2iYCUmPN6NMg
         h7cblQnvm0JyDR8KTAmHvJNfRcrHwf5Zl/yOuzWPaUH8rTXuLhZTe0XAK0xBYElDUzOF
         /oflt35LIfawpJZXqWtsX02m86IZe4jamE20GtN5pYe3GYVT716BNTUSURTAM8JFYxxI
         jbVg==
X-Forwarded-Encrypted: i=1; AKwUvByTqEdRlV340ydEJsVCbMQ24cjaxNkIxV8CpHmdKMWTeeFrjq816u6PWq7obHYs8Dvar1StH9ODMmbHkrg=@vger.kernel.org
X-Gm-Message-State: AFuF++nWEAfRIPnETyN2tK40IUuVMMFdIzrlkQzDtcb/y+1H88rcORtC
	gbENpmY1pTZ86j0C4J1eQyX/be6sfAE+/rEzPYt6zUWGjxRgy0A+xWAFM2A6AHZtGmmzrtc56qH
	mc3DmCNIRbmjDF5AkVp3tzA==
X-Received: from wmsl26.prod.google.com ([2002:a05:600c:1d1a:b0:49e:6680:860c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1993:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49fc56dbc54mr34667275e9.3.1789737542981;
 Fri, 18 Sep 2026 06:19:02 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:16:54 +0100
In-Reply-To: <20260918131656.3710047-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918131656.3710047-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918131656.3710047-3-vdonnefort@google.com>
Subject: [PATCH v1 2/4] arm64: hibernate: Use fixmap for hibernate_map/unmap_page
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org
Cc: mark.rutland@arm.com, lenb@kernel.org, pavel@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thierry.reding@kernel.org, rppt@kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

The default implementation for hibernate_map_page uses the direct map.
This creates an unnecessary limitation for BBML3 enabled systems which
can split linear map blocks and can enable memfd_secret users regardless
of the linear map mapping level.

Block splitting acquires a mutex (pgtable_split_lock) and as a
consequence is incompatible with hibernation. We know hibernation would
only call set_direct_map*() on a PTE-level region since it was
previously split by memfd_secret. But let's avoid special casing
hibernation in split_kernel_leaf_mapping().

On hibernation, do not modify the direct map and instead use a fixmap,
better suited for a transient mapping hibernation needs to copy the page
content. It removes the need for handling atomic context in
split_kernel_leaf_mapping() altogether.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/fixmap.h |  3 +++
 arch/arm64/kernel/hibernate.c   | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 170c3502d723..c8a65fd8584d 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -73,6 +73,9 @@ enum fixed_addresses {
 	FIX_ENTRY_TRAMP_TEXT1,
 #define TRAMP_VALIAS		(__fix_to_virt(FIX_ENTRY_TRAMP_TEXT1))
 #endif /* CONFIG_UNMAP_KERNEL_AT_EL0 */
+#ifdef CONFIG_HIBERNATION
+	FIX_HIBERNATE,
+#endif
 	__end_of_permanent_fixed_addresses,
 
 	/*
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 7bf117427777..bbd0779081fa 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -21,6 +21,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cputype.h>
 #include <asm/daifflags.h>
+#include <asm/fixmap.h>
 #include <asm/irqflags.h>
 #include <asm/kexec.h>
 #include <asm/memory.h>
@@ -213,6 +214,17 @@ static int create_safe_exec_page(void *src_start, size_t length,
 	return 0;
 }
 
+void *hibernate_map_page(struct page *page)
+{
+	set_fixmap(FIX_HIBERNATE, page_to_phys(page));
+	return (void *)__fix_to_virt(FIX_HIBERNATE);
+}
+
+void hibernate_unmap_page(struct page *page)
+{
+	clear_fixmap(FIX_HIBERNATE);
+}
+
 #ifdef CONFIG_ARM64_MTE
 
 static DEFINE_XARRAY(mte_pages);
-- 
2.55.0.1082.g2b9226bbc0-goog

