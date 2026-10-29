Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312235;
	b=VwyOIvi4BcjAvLEIyCbDJjwF8uvFBgbqiTdzl/xPxK4WXIPUUV7T5rB35RdZFE81E9R5
	 FA+6p8WUtoqkzhhX760ZDwyl53wuC2NtYAKoi7GgKpKSddg06uGL2q0aDwpkltKzBT18W
	 9i7vS8qJcu7Ubiigse2i7qGjVynIwSlIUr+qOXD9v+IUsAB5zTeR1Vpqv8FwFaT7LTMZu
	 CUvYR+pHDEa/frY4VwBAnH54FCfM8CjNssiyxtJmSIHq5PkNIzLCU2laIAgfI7z1K2Sa5
	 W6EI7ukagLVCu3O/zrzqUTUAL/bQ9Y6bVYii8HasuGCB/Wa2HsEeucQu88R6N5DCKFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oCfALTpVNsGOvCIhEmt/b+UiZmu6ux3vhKLUcsB5deQ=;
	b=z6Q1Aa45BFkcMpujIsDjIcV4ruiif7Cc6IPSCDoSQHsGX+WjpjLDzMjxV609bCIghZ8D
	 T6slpTZsMA0IGcJB2ZLlEqc77t5FAkWFuts4uPb8IT0MRAAh2wpe8fOAeePN7taqG9/wK
	 Zg9OaWmepz+PYsH53K+X7EC4u+qinALii5JBMvWDbQFXmqKo1eWz4uxnkv8FxiZq4XZC9
	 H4GCIWc7ZRdsZpreKALEIT5J0rnIjxuUbTjDrR53Uf634R5/4dCYLv+tAY3/fZZyvwQX+
	 ilAt0ZwDvUFl45Z7c8ij9oqTy//mHxko/IcppE7lsoBRB/pUzaJm/JXk6XmE/qASk/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=goEw6cA9;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84460A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C84460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=goEw6cA9
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd8b299b05fso47307a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793312234; x=1793917034; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCfALTpVNsGOvCIhEmt/b+UiZmu6ux3vhKLUcsB5deQ=;
        b=goEw6cA9whthLzAwKBgUvvPwCWEtin8u18elZnDo0yK7TRMAf5M1BbFspPoTwrayMi
         JqRalZ6hLGbgcgReaviJ6bKzUTxFHaopblCkxKB3iQ8XV6Kyqi44QtzeWW+A9PPUQbfC
         z9jhaFEFyXQ2vC+LiLO3iVp0qksAeqNhRwLw6o6ElXrXAYYBfZudumMLei7+i/JQpjNJ
         2zwcP1Zxpe3LE7SkZQxqgpRj2FRLG0dCA4t6wDWkJGVTvZyxrmGSuAQe+w8/UFuN6IGg
         gmVcfJfo9wz83Lt0X4xNZlLQXJKKUOiTwo7af6pvcKrN6EH7yVkIJ52Hzq20bL10gxLj
         8Uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312234; x=1793917034;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCfALTpVNsGOvCIhEmt/b+UiZmu6ux3vhKLUcsB5deQ=;
        b=qaHf/laqvCsqXD3NEmJEWixuvrP+Pa7d4FqbWBOxd9Yo4FKSlwqw0WhEp4o5E/NRDE
         bPTQHzcswhHkyk5UGZ1whjA0B8ExxgPP0vt5zmr22ZlOsxUij5mMKmaD4UWFeSSUpIRp
         jDSl88eaaRkpaP8w9VONruxVDD3O8wHBFzJkUlWRvCNjY/H6XCRSwxvRCTCd22jyTyxU
         KQO/S3bDISkpp85pp7BbovGhvMEaGREOdZxZa+0wzPIS2zCsLELkTv6rKSIUPNv0/wAq
         zyyT9lZcy9h5kEEM+XSgDb+s3dDPLmtJRbjK4Wcq5/+uHa6nmogIFd1xGW3Qz62SCAOK
         skGg==
X-Forwarded-Encrypted: i=1; AKwUvBzKQVwXvxCyrdEMPvuQd/P+z2+NAm/IZiFSGWwbS5wRA4oMVw6aD3SqR4h4bV3FdsAR8010QT4SIR6j4Bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQiRCSYjSGiUro/LO6h3TmeaoBz96zf8DTyVmEx1YzuYJ6LRT7
	x79qSKqZhbw3USAX1TDiXWHSWm2ZQi/TLnB2YoAtqIErWkXIyWV45bh3g1tbmhPzqcR8/oEVKDk
	Yn3gmwr5FePM92A==
X-Received: from pgbd5-n2.prod.google.com ([2002:a05:6a02:64c5:20b0:cd8:c4be:4fc3])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6116:b0:3e2:8b64:2ca0 with SMTP id adf61e73a8af0-3e928a03d22mr585413637.49.1793312233691;
 Thu, 29 Oct 2026 15:17:13 -0700 (PDT)
Date: Thu, 29 Oct 2026 22:17:10 +0000
In-Reply-To: <20261029221710.1871112-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029221710.1871112-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029221710.1871112-4-dmatlack@google.com>
Subject: [PATCH 3/3] KVM: selftests: Use VFIO selftests library to pick IOMMU
 mode in IRQ test
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use the VFIO selftests library to pick the IOMMU mode in the IRQ test and
drop probe_iommu_type(). Pass NULL to iommu_init() when the user does not
specify a mode with -t, and skip the test if the requested mode (or, if
NULL, any mode) is not available.

The VFIO selftests library now automatically picks the IOMMU mode that is
most likely to work on the current system, so there is no need for each
test to probe for a mode itself.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/kvm/aiIG2L_KdPwuxYA1@google.com/
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 791e576c334c..f9c11d80a306 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -148,22 +148,6 @@ static void kvm_set_empty_gsi_routing(struct kvm_vm *vm)
 	vm_ioctl(vm, KVM_SET_GSI_ROUTING, &routing);
 }
 
-static const char *probe_iommu_type(void)
-{
-	int io_fd;
-
-	io_fd = open("/dev/iommu", O_RDONLY);
-	if (io_fd >= 0) {
-		close(io_fd);
-		return MODE_IOMMUFD;
-	}
-
-	io_fd = __open_path_or_exit("/dev/vfio/vfio", O_RDONLY,
-				    "Is VFIO (or IOMMUFD) loaded and enabled?");
-	close(io_fd);
-	return MODE_VFIO_TYPE1_IOMMU;
-}
-
 static void help(const char *name)
 {
 	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
@@ -266,8 +250,7 @@ int main(int argc, char **argv)
 	}
 
 	if (device_bdf) {
-		if (!iommu_type)
-			iommu_type = probe_iommu_type();
+		TEST_REQUIRE(iommu_mode_is_available(iommu_type));
 		iommu = iommu_init(iommu_type);
 		device = vfio_pci_device_init(device_bdf, iommu);
 		msix = vfio_setup_msi(device);
-- 
2.56.0.317.g454f8302e1-goog

