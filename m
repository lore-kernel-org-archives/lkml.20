Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665332;
	b=TmGNk223laj2qfwnKshn9XdFMw+3gvJZzVp0M11IywR5YmaUmCjmPbDGZsIs2FaMCxjC
	 3qlAMX3QJTnQp8UFxKraMIiNhSJ2wlOHlMgIjz2yfcFMRUgl5EnIwS5AfeZwGwgZ4gGvp
	 QTr69gZC2sZOMP2Pb/G2Sp41NLnREGRSAOmON5Zki9PD0OftcLYSqAq20gLzHALLRtL+2
	 bxQYEMyePsigg919XBcoIgJ+tMOjR+1AO1ypYICa6uAqRkdpqPLVEpyIRU9dugNEK1aV4
	 SQnFK3YM4HrR5Tp+enPkjiv0FWoI5+K3P0lT7ADwcu5NGmwkTWHernXwAhtMm8V8FPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Go21w0LdVBqY6FPfPI/Y6M16uSx3gBaNjR6JdWqO5xk=;
	b=2B3kv4hUYmvS6FqVn9l/TsU7OXvS3QykWi1IhDBSM5ajxANEvqYqiZHA/h9SAn3eFNlh
	 XpJYnyDrEzbj92A8QvdLImwSHt7PnEqVIxFxeSvaCK2l8lpWRZVt7bzrEm9UZgER52tkP
	 cQF4yrTyoYqsJCOKmJ6PneYBRq4idyjqZ8rGm+ADa5I63MYkEmoycAmR527V1k0jkoRHi
	 Ooc33tyyE4r4Bc32g43XcE4vsIu1Aiqm/CHFSNNccGDaime5tcCJSxX/XfPSSd7DtXKVQ
	 on+eLmAUEID/eIOla/Y8wbN1L/HPQOoUf2KiXYXV72VMsE33EQkplD2ICFCopgDj3jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KKUl0kks;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D299606D82C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D299606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KKUl0kks
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e832c03576so53876275ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793665331; x=1794270131; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Go21w0LdVBqY6FPfPI/Y6M16uSx3gBaNjR6JdWqO5xk=;
        b=KKUl0kkstMJZ1E/F2SJ+bUQH33cyyiowvkjKCrG50UuxaCqRiYQ50owPrHAyzipXV3
         ok6seIUMmaYY6SXi3zpNzMWFT/9UJxOT4Ak++vWAzZ0eNWfcHGTSVU9hF+mgkV2DOUBX
         LyDO4O8xmLuhJ5qTMJMS0w3S/MgnCZYP1IjOQuX86b2+ALpDfMTXRLQowPE0GN0HHdLp
         1xC+NEYtNsLN8KctDzpvqKpWj3e9wa2IIw7o7ctaRlDA5bp1eZz9mhm9DPgtzbtLZXLQ
         chcjX4DdYq8kj5qlV/9BnkEyg0h91tj5odvZpKRvkHuZExWgpgb46mMsLYG+k02zoUkG
         02Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665331; x=1794270131;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Go21w0LdVBqY6FPfPI/Y6M16uSx3gBaNjR6JdWqO5xk=;
        b=sXxpaHiVEfKfRT4ukLL5Xp7RGM9DBFXNvoJFGFHWUmhiThQtCbOJhpWL1dt68K4+lk
         NgVaFFF3uSFFKIHAnNkkljywcleWZVXAXMv+YrDaRB7ZzO2taO2iYdzi+prSd9hRjPZZ
         R+88WAl22Xkq460faSiWntsfN/If1Pk9GfUAiVJRaYvYY9J4kSsmnUnd7DHy0QVnf+bP
         BftMP7rXJ6VyNn6TN/7ysmspkz6HDOep7GM3Zj6Vm0avmG3SFVA7oIM5VuGaUnJXPPLq
         8dvYIUehJ+3jSw1K44yUkiPt+f0UVa2aJ9V7VY9xr8/jP5FRtjRLcDIB74Aw4F+TfTvy
         N2dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjQMflTkJCNEqcsbj0a9HHrrDqpYY7QbkvlNo4CGV83Q4qKGphouCw7qQydjWuuG9YsuvMcllhC7YHywg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gxdbFj7eOpWAG28ukH2ga+tnbXxbcTUXMNlervmeScJ6kMKV0
	0rlHP3VO2cYX5sx2Sc1vy2mk3sv5voLQnVLjN0IX0mbGEae7P6cUh/fHysWe0rKcjXwBoF55a9X
	hJx/8j/nNF9Eebg==
X-Received: from plek1.prod.google.com ([2002:a17:903:4501:b0:2e9:8ef0:cf73])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f549:b0:2e9:5eee:e071 with SMTP id d9443c01a7336-2eb3652ddf9mr104229635ad.57.1793665331267;
 Mon, 02 Nov 2026 16:22:11 -0800 (PST)
Date: Tue,  3 Nov 2026 00:22:04 +0000
In-Reply-To: <20261103002205.3348519-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103002205.3348519-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103002205.3348519-5-dmatlack@google.com>
Subject: [PATCH v2 4/5] KVM: selftests: Use VFIO selftests library to pick
 IOMMU mode in irq_test
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use the VFIO selftests library to pick the IOMMU mode in irq_test and drop
probe_iommu_type(). Pass NULL to iommu_init() when the user does not
specify a mode with -t, and skip the test if the requested mode (or, if
NULL, any mode) is not available.

The VFIO selftests library now automatically picks the IOMMU mode that is
most likely to work on the current system, so there is no need for each
test to probe for a mode itself.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/kvm/aiIG2L_KdPwuxYA1@google.com/
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 791e576c334c..8a345472df5f 100644
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
@@ -266,8 +250,8 @@ int main(int argc, char **argv)
 	}
 
 	if (device_bdf) {
-		if (!iommu_type)
-			iommu_type = probe_iommu_type();
+		__TEST_REQUIRE(iommu_mode_is_available(iommu_type), "%s",
+			       iommu_mode_unavailable_msg(iommu_type));
 		iommu = iommu_init(iommu_type);
 		device = vfio_pci_device_init(device_bdf, iommu);
 		msix = vfio_setup_msi(device);
-- 
2.56.0.385.gac671c819a-goog

