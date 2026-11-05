Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836891;
	b=m8phXF1uX0IWJlunz+hmTsFOFRr0lfT8pZuNxqS46i8eJCjhn5QlylSArAUsEUfAWE/T
	 L5/JoeYNri8D8RWMrPHKKhpFT29MZCYexY6+BX7B0mz18AP/tyFnaY1+nuaRkMt7Z4PgU
	 nnWP8h0LXWgmPwnweSCfLzOpBA+the/3WLQOYieLvSbjQ9pl57BALNCIy/LXvcSx9atYg
	 I7Y85QAa8taYJbpEtXEkuUU6B3R0jS1xlbTzn/usuiNi12moRB7Ol6mUajk+YMkR/M0lK
	 IwCzwH4FYcuC7t9zbH2NvzJGKMRlPfTqGNP3LE8rEigrsyuFDDChKrTL6N5iJpDu4OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=siYSMg9kx+wYgnBsO5/Ud5QKamFs+rDMdVn7Z1Rj8ig=;
	b=Zt3sitMO7ysaEVdPCdcYkZb41tcAz+J1ejlQkpewegO7JEsZ9TBoc3Gvc6Z4W/vrSNQ3
	 YvaIvfpt+ItXlSHzFlX/qGHJH1svb8aELQbe5rRKzlBQGjTCJWIt9LbKtU+Gbsd/daxCD
	 N7ItgAB4AQVVE8hQvO3e6zDoxUbGyzGVY83S5sQOg+7qzwDyIqiBu3wfarD+3BRSiUiOm
	 8ZKQ4x293DPzUkgHGBwHW12HYM1wJsFPycOw2Ke6LOGAU5A0gy3c8gw1/8giEKKnEQLbZ
	 SKsAL+H6209Ro4OihoGLuL58Y68l3LZTIoyqbjBDVviXJ14cpaLAyM0vgi9vqUBfW0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TY2TeWWH;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC80606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC80606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TY2TeWWH
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so809759f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793836889; x=1794441689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siYSMg9kx+wYgnBsO5/Ud5QKamFs+rDMdVn7Z1Rj8ig=;
        b=TY2TeWWHaRUoT896nkqrAu7gHl+BU4gfR2a1ClMzstxeWYD4nbtTMlGwcHB1wptvMk
         kICumvo3+861sRxSl27gHorlzKJW0o/CzhIUCE4Aalct3XcW0eDuw4ZUPZFWczh6/Z8i
         vKb+4rC/BybaxSvrheiste2FVJx+Y/JkhUglsAhzEX2iwliqOucttxfMtNyyVfcbsBLp
         3TnMKhPx8Dm0j/jryGm0F8LKJO/fsXRTaRAKaK1eKxGtvHU2enL8Ly2XG23evqoycEqF
         3RJqZRNXfjD8cBpk8XqLsnHDC8LJuqfKJOfvnhwBNNDp2dQR9jQtRPlU8RdOhGGFqzHy
         wL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836889; x=1794441689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=siYSMg9kx+wYgnBsO5/Ud5QKamFs+rDMdVn7Z1Rj8ig=;
        b=gP0Co43eMO+btVQnfi+ErZ3pNgDh049ZO9pZ3Otf1LRYu2Xe2rXTZzTEmJIyHZOx1u
         4NTD14dRVMmmboFzKXpROPwbtdmtzBa4CoY6u06+XlirJlwbV/zn2fyxsmIP7oUv4We6
         sC03Bria1PdLWayGBbqLY/a9ssdfvJHa/HMyJ8WnH/feLv5E47xyAvgFa2TDRC1aoD7j
         4A5uoet4LcQcOV6nG6mI9YYxmrPxgGZfUDz+FJVADAS3KqWJJz0cBEEaXm1owAyRtnZw
         oNPoZftEvEkL04hm3IqIH+044GYZFuuTOXkEDTuxop8Yf/PLeyOkOCY0VIaobIB+JgSI
         Hksw==
X-Forwarded-Encrypted: i=1; AKwUvByXJVlHIesZjk64xuegGDFgUYxheTx9xVeXGnagRBwQ82a5jcGkwdZssc3fMCHmTpcfAqCpqJqYAdYAE+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pln2Gd2exqW2ideK/NlWSn+kSf/aDg7hZQb9YaVGMFbAHbzaZ
	W2x3vY0LyMhiEREblW0WGp4GpUI7Y6ZnjO3Sw2ENoS08n0eXaJ4VzL9d
X-Gm-Gg: AYBFou2BVENiDVxR2P+bIV9pb37HQUsLMPpbtr0zZZ35j+bMfRVf0R4zp3OFl+QSmve
	5UW0k3spffVlIHJpVPjFJqBxIKBTVabpR/0RXYYkxOPbmQ0iEUh9qghCSWKQnDjmYYtcX54lD1T
	nSf7lg+P8m2Yf4+Hmox/SqHZ12/0E3wqqIrt62QvmtOos3KWXPrHwvbN0OIulp5O5Rx00OhahO1
	h+rn+qLhL5wzuMYMY4sfJ5jTtDCC5UGbXhGi/hUNvjXUrw7Oo0eF+NrCTorECN5Vw1+d9RMVVgw
	/8RyyOoXvxq+z1NwvI59YTs0Ntm/Gg6evH2pMWHz6jzKCrKIPlpxoePfT9g1PDw0AN2idcU2ZCx
	RscZJfVjH6LsroUPuMOcmEPGMK58mpkR33/u0mUWc8bWkRfceyToD6Hsd4n7HodU+H73fmXrLqa
	qT19pWK8XmjHEAupv8bI8+AtamchJHODQSwV33xgcuSpU12INxq5g+nxLeZiZZGkHpLa7c0OkXG
	WRsRQ/ZZXTNlt158V8XuCR74Fk4X06u5D6YF7+/jvPj7vDDeL8sjXHBP5oUEk3JsQvjAYdNcZPg
	yPdfcF+xEPZpkx/gZPZUegAJEmHhcW9zeNtNCB5Pv4rFGSmbIFQ9ueKOyr5yPR9EgUSUmfbNEZI
	GNhfqjuwrBqm7WGwQwWLBdze0Cm98nQA3EYhcH1Ajo+F5AwG/HH7tJQYSCTUxmVDLL6cJmKSLBf
	6S4diSxV5bPjo=
X-Received: by 2002:a05:6000:2388:b0:48e:b1a:fa6 with SMTP id ffacd0b85a97d-48e6e3002cfmr38191519f8f.40.1793836889453;
        Wed, 04 Nov 2026 16:01:29 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553116sm6323846f8f.42.2026.11.04.16.01.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:01:28 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Mushahid Hussain <hmushi@amazon.co.uk>,
	nh-open-source@amazon.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: Add helpers to allocate memslot metadata
Date: Thu,  5 Nov 2026 00:01:26 +0000
Message-ID: <20261105000127.63664-2-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105000127.63664-1-griffoul@gmail.com>
References: <20261105000127.63664-1-griffoul@gmail.com>
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

Add and use helpers to allocate and free memslot metadata, i.e. the
dirty bitmap, rmaps, lpage_info and write-tracking arrays, in
anticipation of allocating small arrays with kvzalloc() instead of
vmalloc().

No functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/all/arr1VgGZmgUmY4hc@google.com/
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 arch/x86/kvm/mmu/page_track.c |  6 +++---
 arch/x86/kvm/x86.c            | 10 +++++-----
 include/linux/kvm_host.h      |  2 ++
 virt/kvm/kvm_main.c           | 14 ++++++++++++--
 4 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index f12558dfcd81..f33547964b98 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -43,7 +43,7 @@ bool kvm_page_track_write_tracking_enabled(struct kvm *kvm)
 
 void kvm_page_track_free_memslot(struct kvm_memory_slot *slot)
 {
-	vfree(slot->arch.gfn_write_track);
+	kvm_memslot_metadata_free(slot->arch.gfn_write_track);
 	slot->arch.gfn_write_track = NULL;
 }
 
@@ -53,8 +53,8 @@ static int __kvm_page_track_write_tracking_alloc(struct kvm_memory_slot *slot,
 	const size_t size = sizeof(*slot->arch.gfn_write_track);
 
 	if (!slot->arch.gfn_write_track)
-		slot->arch.gfn_write_track = __vcalloc(npages, size,
-						       GFP_KERNEL_ACCOUNT);
+		slot->arch.gfn_write_track =
+			kvm_memslot_metadata_alloc(npages, size);
 
 	return slot->arch.gfn_write_track ? 0 : -ENOMEM;
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 26e7beaff8a0..dc716ad83c8f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10146,7 +10146,7 @@ static void memslot_rmap_free(struct kvm_memory_slot *slot)
 	int i;
 
 	for (i = 0; i < KVM_NR_PAGE_SIZES; ++i) {
-		vfree(slot->arch.rmap[i]);
+		kvm_memslot_metadata_free(slot->arch.rmap[i]);
 		slot->arch.rmap[i] = NULL;
 	}
 }
@@ -10158,7 +10158,7 @@ void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 	memslot_rmap_free(slot);
 
 	for (i = 1; i < KVM_NR_PAGE_SIZES; ++i) {
-		vfree(slot->arch.lpage_info[i - 1]);
+		kvm_memslot_metadata_free(slot->arch.lpage_info[i - 1]);
 		slot->arch.lpage_info[i - 1] = NULL;
 	}
 
@@ -10177,7 +10177,7 @@ int memslot_rmap_alloc(struct kvm_memory_slot *slot, unsigned long npages)
 		if (slot->arch.rmap[i])
 			continue;
 
-		slot->arch.rmap[i] = __vcalloc(lpages, sz, GFP_KERNEL_ACCOUNT);
+		slot->arch.rmap[i] = kvm_memslot_metadata_alloc(lpages, sz);
 		if (!slot->arch.rmap[i]) {
 			memslot_rmap_free(slot);
 			return -ENOMEM;
@@ -10214,7 +10214,7 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
 
 		lpages = __kvm_mmu_slot_lpages(slot, npages, level);
 
-		linfo = __vcalloc(lpages, sizeof(*linfo), GFP_KERNEL_ACCOUNT);
+		linfo = kvm_memslot_metadata_alloc(lpages, sizeof(*linfo));
 		if (!linfo)
 			goto out_free;
 
@@ -10250,7 +10250,7 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
 	memslot_rmap_free(slot);
 
 	for (i = 1; i < KVM_NR_PAGE_SIZES; ++i) {
-		vfree(slot->arch.lpage_info[i - 1]);
+		kvm_memslot_metadata_free(slot->arch.lpage_info[i - 1]);
 		slot->arch.lpage_info[i - 1] = NULL;
 	}
 	return -ENOMEM;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7fc94e2910a..11a6f501a78b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1253,6 +1253,8 @@ enum kvm_mr_change {
 
 int kvm_set_internal_memslot(struct kvm *kvm,
 			     const struct kvm_userspace_memory_region2 *mem);
+void *kvm_memslot_metadata_alloc(size_t n, size_t size);
+void kvm_memslot_metadata_free(void *p);
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot);
 void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen);
 int kvm_arch_prepare_memory_region(struct kvm *kvm,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f140..ebdf9308d06c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -941,12 +941,22 @@ static void kvm_destroy_pm_notifier(struct kvm *kvm)
 }
 #endif /* CONFIG_HAVE_KVM_PM_NOTIFIER */
 
+void *kvm_memslot_metadata_alloc(size_t n, size_t size)
+{
+	return __vcalloc(n, size, GFP_KERNEL_ACCOUNT);
+}
+
+void kvm_memslot_metadata_free(void *p)
+{
+	vfree(p);
+}
+
 static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
 {
 	if (!memslot->dirty_bitmap)
 		return;
 
-	vfree(memslot->dirty_bitmap);
+	kvm_memslot_metadata_free(memslot->dirty_bitmap);
 	memslot->dirty_bitmap = NULL;
 }
 
@@ -1449,7 +1459,7 @@ static int kvm_alloc_dirty_bitmap(struct kvm_memory_slot *memslot)
 {
 	unsigned long dirty_bytes = kvm_dirty_bitmap_bytes(memslot);
 
-	memslot->dirty_bitmap = __vcalloc(2, dirty_bytes, GFP_KERNEL_ACCOUNT);
+	memslot->dirty_bitmap = kvm_memslot_metadata_alloc(2, dirty_bytes);
 	if (!memslot->dirty_bitmap)
 		return -ENOMEM;
 

base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
-- 
2.47.3

