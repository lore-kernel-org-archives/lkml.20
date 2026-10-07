Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E806F38C427
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385420; cv=none; b=hevN7MQSED/pZ+Bp9C7lhDGGIJTmKLOUFp9XWMQR4WqcM+1w36nvOekMLK7REifwDXKCgFILS7s2RzSxzJsbYmULxV96KH62WEFSgY+a+JWcp4qUwk0Z8GctMt85T/PW/S8uczpRaXPLtpx6UqtollOtXN0cc4v5gl5EV33vNqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385420; c=relaxed/simple;
	bh=YhxET4oGUKiB2syRAk/GCqu1icxXJqGApQmkGBl1bfU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C2o7qL/vXzHO5et7u2UJUfmNHV5qPwn4esIay6k1MGUevzw/DtfV+UcLuqZaK8IwNdn7aFCKrimzVfEPgkDzDnbv4MNOjf5uLGTwV6TwMVdhhdOvriSizuZLEr/sL2sZi/DSyEXcJlTzzTRsQJD6hlOyQsAU8Ffn2uSx/1Vk3vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AHXAqtHL; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AHXAqtHL"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6b5c5f44so64050055e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385412; x=1791990212; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uxc7RC90yOYNMPOiKZa+i5XwHxmLCQG909I04eO4BWE=;
        b=AHXAqtHLXkGjtmeamaWaur/pNHT0SofYl7pLdAbYvZlF3l4362oYJ/CxixTNEeQpFQ
         REuDrIH6eTpcndwnmsNFmlxhnrmBITn2KmrniaOk2vzmmCUxGF4Xrrpk4q0YEfRVPIm/
         sYbDqLXJ6SD9EGIhfjWAUzko/ei4N9xWcQPM+hEv9GCXh65/MPAVjg+mWHrow/ZjBn9P
         03e8SoIAobeMlIS1Tv9lef5TjkJvuFCTs2qY2S5x6w9Y/8uyfP2EAV8Snx3kG5TycO9w
         69k/lD23jkZXsqX9K4s4EEM3etP3UA5sDzxAHU//BiNcTI8a2K2TJXX1EuHr18QMkVJV
         Ng0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385412; x=1791990212;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uxc7RC90yOYNMPOiKZa+i5XwHxmLCQG909I04eO4BWE=;
        b=QqnEtVhpTNUOZHEoBmRWqU5voyE4J2tsNOETHj8nift+2y9v6JYZ5EABmmv+vQXkyX
         daCt5AfMPiRyVkuIPpkHvgPOgqY2JLa00Bsgin+iueZ4GvZ2/M5rdCKfy32U3P+4YbR5
         +cKKZHqgVKdZdUTnDjmXDojdqtCdtR7Wug/Gzn/xipyynvU/O/TCWBleRqxuFCP3yKSi
         EVmi+j/72ftWnlZLls5YOdqjQYSL+AkR+Tx8ZV15w5YXjiL/UHxW4bOsXjFJKAQZV5Fr
         tgiKzF1VctMxvkWZpqAg9/A5tM8dGativQ8afIYYuyVhrrojvGpJL90RxHZBLAk9hqL6
         tj1w==
X-Forwarded-Encrypted: i=1; AKwUvBxLUgSOE10QhrRfLY2Dh3Y1tqkyogZZZpKSGC2xsh8BwwNVMulCNIuuTQeCjWS7n5xlOo8bJ3cswqURjQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++nhU2gHwRF7lzvHNYHtXUt8eWYbWxsPta6CCVRA4fCLecwZ/ovK
	5Je80M5Uw5vvUl+vOTvj331z3hYkwvs+V+VfG8xwUVLLNhSubfDMtXXSyubcBF13xDukl0UNyJS
	3unF0yEosZHE8i5YGAPb4GQ==
X-Received: from wmpx21.prod.google.com ([2002:a05:600c:1895:b0:4a1:83d6:73cc])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190c:b0:4a0:1723:2d90 with SMTP id 5b1f17b1804b1-4a1800d4278mr40750015e9.4.1791385411517;
 Wed, 07 Oct 2026 08:03:31 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:53 +0100
In-Reply-To: <20261007150255.1648849-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-4-vdonnefort@google.com>
Subject: [PATCH 3/5] drivers/virt: pkvm: Handle a granule larger than
 PAGE_SIZE for MEM_SHARE
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Fuad Tabba <fuad.tabba@linux.dev>

In preparation for allowing protected VMs to run on a system where the
granule is bigger than their PAGE_SIZE, allow the encryption/decryption
callbacks to work with the hypervisor granule increment instead of
PAGE_SIZE.

Reject requests which are not aligned with the granule.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Co-developed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 42 +++++++------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index fbcb57c31186..98b1026cf68b 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -20,35 +20,19 @@
 static size_t __ro_after_init pkvm_granule;
 DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
 
-static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
+static int arm_smccc_do_range(u32 func_id, phys_addr_t phys, size_t size)
 {
-	phys_addr_t end = phys + PAGE_SIZE;
+	phys_addr_t end = phys + size;
 
-	while (phys < end) {
+	if (!IS_ALIGNED(phys | size, pkvm_granule))
+		return -EINVAL;
+
+	for (; phys < end; phys += pkvm_granule) {
 		struct arm_smccc_res res;
 
 		arm_smccc_1_1_invoke(func_id, phys, 0, 0, &res);
 		if (res.a0 != SMCCC_RET_SUCCESS)
 			return -EPERM;
-
-		phys += pkvm_granule;
-	}
-
-	return 0;
-}
-
-static int __set_memory_range(u32 func_id, unsigned long start, int numpages)
-{
-	void *addr = (void *)start, *end = addr + numpages * PAGE_SIZE;
-
-	while (addr < end) {
-		int err;
-
-		err = arm_smccc_do_one_page(func_id, virt_to_phys(addr));
-		if (err)
-			return err;
-
-		addr += PAGE_SIZE;
 	}
 
 	return 0;
@@ -56,14 +40,16 @@ static int __set_memory_range(u32 func_id, unsigned long start, int numpages)
 
 static int pkvm_set_memory_encrypted(unsigned long addr, int numpages)
 {
-	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID,
-				  addr, numpages);
+	return arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID,
+				  virt_to_phys((void *)addr),
+				  numpages * PAGE_SIZE);
 }
 
 static int pkvm_set_memory_decrypted(unsigned long addr, int numpages)
 {
-	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
-				  addr, numpages);
+	return arm_smccc_do_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
+				  virt_to_phys((void *)addr),
+				  numpages * PAGE_SIZE);
 }
 
 static const struct arm64_mem_crypt_ops pkvm_crypt_ops = {
@@ -90,7 +76,7 @@ static int mmio_guard_ioremap_hook(phys_addr_t phys, size_t size,
 	while (phys < end) {
 		const int func_id = ARM_SMCCC_VENDOR_HYP_KVM_MMIO_GUARD_FUNC_ID;
 
-		WARN_ON_ONCE(arm_smccc_do_one_page(func_id, phys));
+		WARN_ON_ONCE(arm_smccc_do_range(func_id, phys, PAGE_SIZE));
 		phys += PAGE_SIZE;
 	}
 
@@ -118,6 +104,8 @@ void __init pkvm_init_hyp_services(void)
 		return;
 
 	pkvm_granule = res.a0;
+	if (pkvm_granule > PAGE_SIZE)
+		pr_info("pKVM: sharing memory in %zu-byte granules\n", pkvm_granule);
 	arm64_mem_crypt_ops_register(&pkvm_crypt_ops);
 
 	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

