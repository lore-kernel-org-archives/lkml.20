Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987879;
	b=znGF5psj/VnQFHch9p6xGCwp2OGnd93u/zVCc3MH3lEWNJIcnAKGb2z934SnQlGcuRCj
	 AnUk53WimgySAXnsCOBfs45U2i+OYAHjJkMwspq5py9FXn6wjv4VSd/47fKdLVQxG2oao
	 tNmWQ56UiwS8i15VVCI1XqikAreUBejQd4+rU0DrTWojVcCJgVCdsodTyiKiDYqR8LH/I
	 W5r1BJZJ4pjGNsWaMBVvFgvDUcQ8JxJDU8l/Ar21LbdtGKT00stm5RuCzwyS9JZ41JT9T
	 OEFCVuPT5eAoWJST3XATuKoxTzHZmNTq++9eDjVSWzexz35ev0ktNO5wfN+X3rDcC+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=voDoMNlhMmskvRoNZqg2fTx8P1tixWjDbm8HuJ9K4dA=;
	b=t+ynNV2Kt5CpQr262NHXQi5Iw3btmvbB8/2vCPckmcE2VX/KrtCHbkGcMItzFKvS912I
	 XvbZk9IRm9GMTl427YLJEtTY1g9AO9o8y9WSXstlax9+L7vsfk53Z+LbTpl49xgcVUz6G
	 LXjOH5uKmcEeD2Ltt98DsWEUGB9jhsnxXabb7KSco1VeRhpcj0OsK2y5W4guRNwmX7TtH
	 jh/sksgyopETSNjncIgcbVmA1OVmeYx4BmcbJeMJgDEhWcP6btyYTv0WJTCJdVHMQeKXR
	 /X/XVOWMNWfyiQg7+2YHlItlZzm7Dq8TpQ5N9BCdYEXaFVpOoAFPdCJ0lowlDhgynfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G3HViOdO;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5275C606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5275C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G3HViOdO
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso676749b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793987877; x=1794592677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=voDoMNlhMmskvRoNZqg2fTx8P1tixWjDbm8HuJ9K4dA=;
        b=G3HViOdOmLqaB2Kcvg6dE7Aksy4a4FYV9KQmpeInft48jpobbG0B2bc4In9hFcRkzb
         vXlJtIZmLUHp9rECiQmVNeHqt00YWzSv1aPj/wn+twwaHNDPzbMJLwFb+vsWNSz/4owT
         Bg15qB0sCpdqIRxCJm3mRLZiyBa5c3TMTPDMSzBoNh/yX0kBfBmeSm2RnmZq30eXSjW0
         BuLcBYZvbSTqvlBI6deXu388O1qm1XB+z+dqUzhJssyO8SdDcxA0TVmCcnLhM5FS8TPs
         h7liaopIUy5WMMMWDOGcr5qLcypEGcXt0jlHruC2rkoRzi+dIT0/d0AD+/ynwX8sCJ47
         tHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987877; x=1794592677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voDoMNlhMmskvRoNZqg2fTx8P1tixWjDbm8HuJ9K4dA=;
        b=fyTIGfbuUCUAlhIN7zAFi4k6ncklsvkaPWk9J2xechTDjwLZfya9BWBreYvhe+zZU6
         5kC/iMb/sUpCKNbpxhBE+GUvpIs72P8Yg7/jGsrvYxM1Rx8DGGMarOX9mT/e9fjjN6U1
         0TyuONlGIJ3qdtJ6N4iBRsIwg0VmHdA37PyB50NS8+x+xsV8v0LU6SYZKxZtDq0fQe09
         EJC2qf+b4jsCpy26gSOqYGyY1+MK9AviIqBifqK+RZ61qjGp0ZLGAbhcbdRyG9zatmeh
         HR7evEfTH3XUQkKm8KiTD8Ua0q+7IyxmohFn0dFx14MHIV/YWJtRK+Gc4cUUfQdEIzFQ
         Ib+A==
X-Forwarded-Encrypted: i=1; AKwUvBw+6aIALcuMXnfjDgxWrQULJHJqW/kizBG/B9k1VzOkvY54fNsA/xCXwuWSSd2/z4Dx1l+IbiBNZYm1be4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3CD6ObdvJkz7u9gg1Cc3hE3gTxWVPpQ40xKO0Y3jEKk4ZL7pe
	32QZ7fta6wXZq/QHgfp639J+T/b/jFFRVcH1+AxnrlNFOZluHn+z3FfDdmA8u8Ef0cY=
X-Gm-Gg: AYBFou3MrNKHCJYOjCGfVtCfyHIh3xQ640zqlsu8Gz6S1p331QpguCkYd40Hq1yuuhN
	0XVAcStpqtKivQ4/RslRfCFhAGPldtyenRhsxeS9J1S7g/wULjhBT7kbwE1DaxyIC1cyvxI7u1R
	0+lxbfrr0uKIDuph9unQrezyrGmgE9YahZKg0dXhVutAhtQKYKMqKWjfkw5VnhDoJoJsGiab3cj
	ye0R+SLadrA+7uwEwa8ig2FN/uihmsjNdgqJJG9Q76rK/7lzsiqmdK527XP+LybupwDDwUMf6GP
	+cDhNhiFocYxH54pr6+XUN/IXcUlT5B06aFSa7I1tMHnQRVOPZz7UXYYj60HQ4xAcWYoJ78mkJL
	16PNRqByaOOG01QhEy+9E4rRz6vPtSM3BEDC/Qn00M9/sEGQpRBvs+AGMGO5Oyv6yOVKqEgwZ+Y
	lZLqPNJ1DeK2ffT088Q8HWyrd7Xn8lbbg0wU3J6lWB9vapvH76d+dThDn3sf0frZ3jY7eXBANkl
	q7hPT9IPrFAaPF3GLQ2hPK/ic7eir+EpFPeUIm+LlPoB9hqOswBIk5WIDAABPqiMeWJhIUkIDd4
	NLC13h9xnTDsxNnF/n5U7jxjbKJAMYsRZcDpZUhoieo=
X-Received: by 2002:a05:6a00:8c0f:b0:89d:faf6:c69d with SMTP id d2e1a72fcca58-8b37c9250b9mr3510452b3a.58.1793987877466;
        Fri, 06 Nov 2026 09:57:57 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:50::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597f0539sm881137b3a.31.2026.11.06.09.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:57:55 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: 
Cc: Joe Damato <joe@dama.to>,
	iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 0/2] iommu/dma: Skip iova_to_phys() on unmap for coherent devices
Date: Fri,  6 Nov 2026 09:57:41 -0800
Message-ID: <20261106175745.3362057-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
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

Greetings:

iommu_dma_unmap_phys() calls iommu_iova_to_phys() on every unmap, which
walks the IOMMU page table. The physical address it returns is only used
for devices that are non-coherent or use a swiotlb.

For a coherent device that does not use swiotlb, the lookup is not
needed. iommu_dma_sync_single_for_cpu() and
iommu_dma_sync_single_for_device() already skip it for these devices, as
does __iommu_dma_iova_unlink() for the dma_iova_link() API.

Patch 1 factors the check out into a helper. Patch 2 uses the helper to
skip the lookup in iommu_dma_unmap_phys().

I split this into two patches because I thought it would make review and
bisect easier, but I can make them a single patch if needed.

One behavior change: for these devices the WARN_ON(!phys) in
iommu_dma_unmap_phys() is no longer reached, so unmapping an IOVA that
is not mapped no longer warns there. CONFIG_DMA_API_DEBUG still catches
this class of driver bug.

I tested on prod hosts serving TX heavy network traffic, which unmaps TX
buffers on completion.

Intel Xeon Gold 6138 (Skylake), VT-d:

  - iova_to_phys() on unmap: 119-143 ns per TX packet (~0.5% of busy
    CPU) before, 0 after

AMD EPYC 9334 (Genoa), AMD IOMMU:

  - iova_to_phys() on unmap: ~10 ns per TX packet (~0.1% of busy CPU)
    before, 0 after

So, the performance improvement is small, but measureable. The proposed
change removes redundant work in the unmap, though, making it match the map
path.

Thanks,
Joe

Joe Damato (2):
  iommu/dma: Add helper for coherent devs without swiotlb
  iommu/dma: Skip iova_to_phys() on unmap when unneeded

 drivers/iommu/dma-iommu.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)


base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
-- 
2.53.0-Meta

