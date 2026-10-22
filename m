Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686836;
	b=RmKR03/q1t/0ajBxIcvn9tUME4/wD9/+bXqkCnX9/9QMNXNzK+RDTJc5Sdo7iZcir0as
	 Z8cPKt5Lgi7j/ejO8+MPgardBeM1qBziV2zBCiS8+FOA45YzkDP9xG+Fr8EYsLlZlbB/c
	 73RAiX6K57kgLLg/GwzyjkbsEqR6FxpxYjTFCgIiuvjrLaf180KUWcqSPurkrJakGdR33
	 UU4bysvUBwIz6FEGce1Ej+6P++CoQoJGOgXB8QFwc1IbXII5CLk4SIf4z4tjZfiPcOAXU
	 jqKs2p04kV16qHqGBxhAQSxJ86WyKJq35iWe0fDqVeGB0f0hnlbdxE80WjGAFH4P4QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=68+IeagKgDrW1nl1tCiiDqs5Zxn2UgVcp46ojvUcCbA=;
	b=mCcecUkHTqprENmH4vYOWj35ps0b8osyazl/cgdIUUZVdyD+8lrji/GmwsHhC+DH2cd1
	 strIOHiUwxZ+q/1eaguU+xNyAVftKT0OkL+j77FsHeUTxRKdg2Nnu6pyx3BubynVNEa7Y
	 koYVjdtsgjCp9TH0OJ9x0a8+7kjPe3LXGh/iudkSkFe/AY3aucRUQyEzjl2+RkAe9VzsH
	 EK2XDxjVe0bRJYYtbw6LiVaPbHb7iSbjr3uaKAN1MNfPEmj8GHT5qrLWeyjZ7R2NT8utG
	 nYP2dpgJ74IpnUJycEfg8rq0eUmzw5dfJH6nbpPPGzJcJaNaLF0s+iJDhI6zcSA2wFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOBIbPIx;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3E6606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3E6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOBIbPIx
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91befe703c4so531016d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792686835; x=1793291635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=68+IeagKgDrW1nl1tCiiDqs5Zxn2UgVcp46ojvUcCbA=;
        b=IOBIbPIx++wXgJQhVh5zljVaVm6y0IhHKVt3mkz1epnvO/4MJwCZDOTbKtB68AfzGM
         BsZmaDMftEYt/qi50geTfZCh8RCICIqTMlPAb2CtwyZMTpysYIiM6tMCD7aXfPKSj3MX
         kMeCSjPvoI2o/3pmninKBB+b5spymMreCc6QQmUmdLy9NzaUo3qDuLTKnbvLhYQoHf2x
         HPk5pZP+8QF9RrJHpOUm6v6sZaE4jWDLh3CcZSSHNhLUhjUL02nSDuyQwxCYRrYxZk43
         +xuBuoPyfzjnIg95/91C4+XdnH/8P6VMV0kKEs0NXPmWn9V+Azi8BdZR6K6ISzlyzxjN
         DizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686835; x=1793291635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68+IeagKgDrW1nl1tCiiDqs5Zxn2UgVcp46ojvUcCbA=;
        b=SSOql5ZJpNhQ4YHX4T6rGUwWUU36oFetC2EyaFpJ2yAF6nLDMjtmKVQvG0pdGQCpvS
         p3XM/7qU5OeU4TzcThPOfKgN9UY0c31JDNa0oDv7xCJ9HlSKgkcntifHWhGuOFa3bSQE
         XitMACcCxUoleP4BHMR9tjutA4/jpiUopQ1FYzMB0JIFh+BdgBdXg4OYPrNrouI1n6wb
         NcQGnwH7hcifNBxrjH1LLOmzV5ojimK4kHgrnsHCbAj/ZCAALFX1JYFUZXMtT40uF7p2
         ejJOEnh+MdyLcN5c9rnRw3ncL74BGdM6Bi4iKHxCI57pfdhrB3mZMdm4/+mc0clqRY6Q
         b+lg==
X-Forwarded-Encrypted: i=1; AKwUvBxuNV144SO4t+yvR3WYiyd+n4cMnXqxNfiXKyw4rCC6gGbfeXGhK6wqFKF+bqCE/1qWomg3bx0FY5Q7ito=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvpviX0cr4bu0MNaUvSpu3ElqE84zXTvyCXjltgUAhPhsIKEgK
	1NWe0NAWthXzeg666F/6uvjF8zP9jwWE8lS9KuPb9sq7LWzKxetUUarpc+Rb0w==
X-Gm-Gg: AYBFou3NfcQH8Iytq8URpUBZBSVjaFzUxXU5yBswWXBBiASLhby/S0UNCSKMhsNUm9u
	Ep7pi6bi8VFK/MWHbUH9kZIMn+OF0M0Bs2wKmOEp3EKCsIBSj1u7Dn+7AGfzKOghl57y3pbhjfw
	EgBb2z8TdyZgih7EZoAc8rXSzFaZNxaUMhrLPXNUx+Wj625xWyiiGI4tJoXd5s3H3LCwRxYpfOr
	BxaTD+9/ovFPAf4mrZ3MmuL3SYSVvxC4tjXi8UBs47RknXswejEdYaP0UlkdQxmx30pu/BSZ3li
	s5HiUa5OGYuHUgguvA5pXT2huaCKmPKb7/AmgoF/xD/wxIXunbw18zYcUY0IFAyCMeAQPKZVOY6
	xan9ei4gC3DBtcDQXdAmjuN732zXj9zqs86EfwKR9aiUaSkdT2QHHthxnGq9jrs0DU5tiWIwlYi
	XgLJBIL3Kg4stzAXeuKRJlktppn1hNgwOI81nhYr8wApxnW0qqwnnKMAoSbdBBHbpFZsQK/6V4J
	x4WxbOer431CzWgR1Agx16134ywRkNi7oF6kvfTWkwVSeN+WuENoAj0cNGkiFktUg+DohBv/nRX
	cHi1WWOVK6IFoaktj0xN4yQe
X-Received: by 2002:a05:6214:2026:b0:91b:5d3a:4fcc with SMTP id 6a1803df08f44-91c12f57cd8mr99901036d6.57.1792686834990;
        Thu, 22 Oct 2026 09:33:54 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c36f0abedsm1511396d6.3.2026.10.22.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:33:54 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] iommu/apple-dart: Report TLB flush failures from iotlb_sync_map
Date: Thu, 22 Oct 2026 12:33:40 -0400
Message-ID: <20261022163350.23743-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

apple_dart_iotlb_sync_map() flushes the TLBs of every DART the domain
is attached to after a new mapping has been written. The
invalidate_tlb() callbacks return -ETIMEDOUT when the busy bit does not
clear in time, but apple_dart_domain_flush_tlb() drops the result and
the callback always returns 0, so iommu_map() reports success although
the flush did not complete.

Since commit fa4c4507099f ("iommu: Allow .iotlb_sync_map to fail and
handle s390's -ENOMEM return"), iommu_map() unmaps the range and fails
when .iotlb_sync_map() returns an error. Return the error from
apple_dart_domain_flush_tlb(), after still flushing every DART of the
domain.

Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
The unmap path is not changed, as .iotlb_sync() and
.flush_iotlb_all() cannot report a failure.

 drivers/iommu/apple-dart.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index b160fb464c5f..1119769f9f51 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -494,9 +494,9 @@ static int apple_dart_hw_reset(struct apple_dart *dart)
 	return dart->hw->invalidate_tlb(&stream_map);
 }
 
-static void apple_dart_domain_flush_tlb(struct apple_dart_domain *domain)
+static int apple_dart_domain_flush_tlb(struct apple_dart_domain *domain)
 {
-	int i, j;
+	int i, j, ret = 0;
 	struct apple_dart_atomic_stream_map *domain_stream_map;
 	struct apple_dart_stream_map stream_map;
 
@@ -506,8 +506,11 @@ static void apple_dart_domain_flush_tlb(struct apple_dart_domain *domain)
 		for (j = 0; j < BITS_TO_LONGS(stream_map.dart->num_streams); j++)
 			stream_map.sidmap[j] = atomic_long_read(&domain_stream_map->sidmap[j]);
 
-		stream_map.dart->hw->invalidate_tlb(&stream_map);
+		/* Flush every DART even if one of them fails. */
+		ret = stream_map.dart->hw->invalidate_tlb(&stream_map) ?: ret;
 	}
+
+	return ret;
 }
 
 static void apple_dart_flush_iotlb_all(struct iommu_domain *domain)
@@ -524,8 +527,7 @@ static void apple_dart_iotlb_sync(struct iommu_domain *domain,
 static int apple_dart_iotlb_sync_map(struct iommu_domain *domain,
 				     unsigned long iova, size_t size)
 {
-	apple_dart_domain_flush_tlb(to_dart_domain(domain));
-	return 0;
+	return apple_dart_domain_flush_tlb(to_dart_domain(domain));
 }
 
 static phys_addr_t apple_dart_iova_to_phys(struct iommu_domain *domain,

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

