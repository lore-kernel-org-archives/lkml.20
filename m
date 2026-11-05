Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836892;
	b=iJUpSE//PgkkM8Z9K532FXcG4+cBBNsXbuwG4Xn/HQcfAwGm6pi1dvm3Ump00stQFCc3
	 9pR572L2arkxHKYYarRfKb2YL8jnukAiWvaIi1UDxYgPS42UV039hKS5rteqcEn4/JwSD
	 FaMElTcbqabthI0e0xwpDYAZBH+nudRfOV5odSHINWwBTTmKiO3wJteG72O01wab4v07F
	 1rg6SkTf9hCoTSL51LMAhh7EkvBqa6qTB5FxvisF38WkQgUsDuaiTenz5vvGmC0OsqUL2
	 VgxcH/xr0LYde7vgfm2gvvEKVj13NlEzk+B50nEScJniSVR4ughIuf6V7IwcWUz3ZSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hGlni/PkXFRgUv3FYAkQMj09xDV4V+0dB2F/7CgF5lM=;
	b=0Azi+XLG7pbnlpRerF6O/p+Y4kwzC4B9YXOrlSWff+84qKxVMITdNEhJzSHXrbmFTktq
	 Y4FY23b6OTDdxVGSWOYrws1qp3QRO6lr8WKyfNZZEspEXcfVmf5hTuVuo8oCaq1iQsnz2
	 4319jdYy/tIaVezV7aRWz/yt8tLeuDXLyWthD+VXaYoNhVoEoRVcgTcA5lWIzvo46rxZX
	 UdQCIc1iDGjQL2WjBNnwLzNMcXOtRGNekwSAFrg0jHa9jMG4KQM31nstRDd2upkczD+dE
	 jT3SotieYU2JrNqPPRrtmy246zq82bE4UdFU/SMnHhrUAUx6BXBMsY8FSEG9/8BWViA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Njc7EdeH;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A841606A33E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A841606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Njc7EdeH
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490c1d337d8so476403f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793836890; x=1794441690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGlni/PkXFRgUv3FYAkQMj09xDV4V+0dB2F/7CgF5lM=;
        b=Njc7EdeH/z+Mjpke9wFGWjJH1YKrLeY8skbB16tvhHC2QtapMFEiojjEH0peZy/X9J
         jVxSY74GjdloYqAfsD6YHKfUOvZuz0qYSBI0Y/wcYLB2lUl5kNjAy3vpzkThobUG8dC3
         FKw5yPhQrwu/nt08JTPtHEWNVqA5W/cyhWzCFVJlJzawwHc3KpnfJFE/HjvUfC5VJn+6
         OZk+gca7Yk/jUqFzYTDpjyeVakUox1X1IDo5GJ669Xs5jFFW3EBPkAPo295Y5rLAOx4J
         LU1KeJ67jvt0d5/D12Whh4fIKtaIi6AwZnOOeJTQiJHLbZPjTYGjCCCCpV901MdYIpW2
         quDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836890; x=1794441690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGlni/PkXFRgUv3FYAkQMj09xDV4V+0dB2F/7CgF5lM=;
        b=jkE6HjHxLWoXPwXa1LkHQtNDcSqU4hVgLOKchhCY3txtt1rFftQWbF9NTw0GujMCrr
         tPQrlSN2tbqHAn8ZKd3SoAKc6MmH6ySHxvH1z21VRwCmbwNGX73+6z/8Us6wWoAVSPls
         D9WzvzRHJkZIWy4CNj40G4BGbq+Ji1nw5Uo3FWDWb3luO1p4PXOd+mhMEKAZ4Fyh+VXG
         0WZhaQK2HSMagZTSHSrcXc/Y9QlFAJvfu6755+mqs0IJ7JwMopdzX3QX/NmkKaOJVrei
         N+jZIhrNUgKJ0aHcCV7uXxUS2rhryNmfGPx+k57Jfoqe2loNMg9haTDUG4Z9dJey2e8P
         1rAQ==
X-Forwarded-Encrypted: i=1; AKwUvByG5SxFtf+Ny6dfB+tMG63zGzsq700s73oBWvSJyOG9oxpV7mM5u6s7VQTQVk7R5As5Un/ppdJP2aDZV7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DrgbbAHDDJkDOGNQDWktM4iHX7JSVmVaWppcycaeQwcyUzq8m
	SZZAW6vUYW7IrCjcYMx/vxUEz59XJ2I+FZK5oWvsnzlpvwSU5ORwZnrl
X-Gm-Gg: AYBFou38q6bDY3AFYRPASheXT8IBB2+Gn8p2xtQjcuLWT3dEITe7/Dut6j5OmxTpjrj
	pxUhJ+WHSFaWvSDq2fx4las/bSsFS1xtl9Vx4SyTOeD03jjLR+RJ9QDObWaDua3Rz+jj4+QrKOW
	bzYwRk/du3tnu04ykWFkyrAWPb1Ip1XkgskFviA6lOPLOpRR8rOnZRGkFwBrFinlsBIV1Saw808
	4dp9LJlvF7gk8j8NveoIGhYbKnPczpzEAKD0zQ5iLmXWkd27z8cGYIH4C9eYNeuM8pgXLHPNMtj
	CzGRLCdOSIWL1AyEwm4e6UHuucTND7lLILHRM7ufM6R+m7lPbTy24IeOYdv2L1sXGpyrAqhkGN4
	uiV4wNvpD4Rp20MyV0ynZLIkwZ8uiWRx4RYMsxIGVuNg3cFgvF4wDeasbRWQfF7gvgUnxFkFEgW
	7C8mzv8Uv/iuA9JvqM82qTGG8IvGVv9h+pt8cyh/H20tl+mvsIfoFz06+WDc7bjCK7KnzGfRfkg
	QxXPq7N+uhCj57tHbcl+dDGFh7drlg10YhsWJRAGLlUNk/EMp3exqyskIvDiyTrc9IXfxyVyXmv
	HvZ3hklZZDV8acW+12xsnU3aaWH56T/B+PJ8tJ0bdoXLikuBzZ1hO+BhIUcnGwEApsybnvXoa89
	0xtepKur/S5ubnRiHmlxM29yXKC1SNdGTjpncpYF/ggofmEshBpy5wk47CqgzfyOBjA==
X-Received: by 2002:a5d:59c3:0:b0:48e:3b48:6f1 with SMTP id ffacd0b85a97d-48e6e50b5e9mr38046334f8f.54.1793836890526;
        Wed, 04 Nov 2026 16:01:30 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553116sm6323846f8f.42.2026.11.04.16.01.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:01:29 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Mushahid Hussain <hmushi@amazon.co.uk>,
	nh-open-source@amazon.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] KVM: Use kvzalloc() for memslot metadata that fits in a slab bucket
Date: Thu,  5 Nov 2026 00:01:27 +0000
Message-ID: <20261105000127.63664-3-griffoul@gmail.com>
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

Use kvzalloc() instead of __vcalloc() for memslot metadata up to
KMALLOC_MAX_CACHE_SIZE, as vmalloc() rounds every allocation up to a
page, e.g. a memslot that spans a single page uses 8 KiB for 8 bytes of
lpage_info. The waste grows with the number of memslots and VMs.

Up to KMALLOC_MAX_CACHE_SIZE, kmalloc() serves the request from a slab
bucket that is never larger than the pages vmalloc() would use, and
above a page kvzalloc() falls back to vmalloc() if the slab allocation
fails. Above KMALLOC_MAX_CACHE_SIZE, kmalloc() rounds to a power-of-two
number of pages, so keep __vcalloc() there.

Free the metadata with kvfree(), which handles both kmalloc() and
vmalloc() memory.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/all/arr1VgGZmgUmY4hc@google.com/
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 virt/kvm/kvm_main.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ebdf9308d06c..1854e1b075c5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -943,12 +943,20 @@ static void kvm_destroy_pm_notifier(struct kvm *kvm)
 
 void *kvm_memslot_metadata_alloc(size_t n, size_t size)
 {
+	size_t bytes;
+
+	if (unlikely(check_mul_overflow(n, size, &bytes)))
+		return NULL;
+
+	if (bytes <= KMALLOC_MAX_CACHE_SIZE)
+		return kvzalloc(bytes, GFP_KERNEL_ACCOUNT);
+
 	return __vcalloc(n, size, GFP_KERNEL_ACCOUNT);
 }
 
 void kvm_memslot_metadata_free(void *p)
 {
-	vfree(p);
+	kvfree(p);
 }
 
 static void kvm_destroy_dirty_bitmap(struct kvm_memory_slot *memslot)
-- 
2.47.3

