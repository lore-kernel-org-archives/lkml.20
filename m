Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478310;
	b=NrWDt6b8MSeCez3X0IaLc3/mDaLjqy2VjyeyvbKLu0YVKRN9w/xE5l+bN+aPgJWDuMVj
	 MgQloiwCI3hN2cjQOEN2GkRf/LUsXnbUDw4zYsHFOGhQhfmg0NDI8mK7HyO+CXBVtYVDF
	 hN73WR4rhQXbdmTp/wdlYWmtf7bk/dPMLjjudx+N/ZiAvTpyw3JLn7ulLKaPIkp5i+uHi
	 CYyqJXgiLNlYWy+8I4nW4flrr85sLxLjwjlz3FH5s69dpmoNMYw1DSI5ImI5SQLf3HXyX
	 SGza+FsmUpOOKCyK8GK8HuqLAwmuMQU/yuhnvHxD11L/GFd3kN1JcSQJnmEfuf8tVVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u9+toBtEEPVpz6hTN7Pcfhr9T4/drBZovt9bfqsgE5Q=;
	b=M36heC4lr1ibcSZ6XKmxqQv9P7X5tXXQANch13ogDmZ6YJhZNBkkhDUAmIyXF9OSao8Z
	 aFe2VCNOSOsvyX+wxv/S9tJP8xVVNN6vxFlyjIAN8WURgB/vr2Pw21IKqnUZBHMLvUj5A
	 2ssGSuaYOr49Trc3unzoTIaZAYLwqNk4r8yvEZftnj8CpY4uJAzB77ZUvRb4cGDlc+QKH
	 baAwhCO5xxvhROskmYnhLbvt9JjRd2DxSFd3S+/3OiTAfllNHgFn1HfEg1oyhqu8V4SPl
	 VOxc82zDvhk/0E2RnAzYPY6trUmH9++XR75JLwV2T9PpzQ7U2wI2K0JouBueXNLvX/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JT4YDfD0;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891DF60A2618
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 891DF60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JT4YDfD0
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2167406f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478309; x=1793083109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9+toBtEEPVpz6hTN7Pcfhr9T4/drBZovt9bfqsgE5Q=;
        b=JT4YDfD0Aw5+5dvdOGL1aJEX9vUX55vIr0W7wrSg0hkHHU+y7g+VR1R5WGzVJVmerg
         84Os19N7kJt4mYuIyB1OsurnEfrJwgh0cRpXti8bgCAfWE6CRrQRTSTwd63oTfx56HYf
         kIue6b47gLPi4YGFC2XTmQKoP2YG7eiDJUf11dPqm6XtEuyC51+Xg4Wz9FNZs1ceil5g
         t3aXkRTU8hWZQ0A0pWwEmD8pbM+JgNbIFJkQBdPCzW+Ni3yZ6b9/IwVIKBnmSaX0nptD
         v4/wqpQvM6kskNnN/qS/Xz23Nv89QoBOXfR74JxF9LKxgIC+xo4chsPOm2Xab+kt6ftA
         5y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478309; x=1793083109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9+toBtEEPVpz6hTN7Pcfhr9T4/drBZovt9bfqsgE5Q=;
        b=YuTVDitRQ6NdxbXKjxXMouPz7dGIzsiGGgpNRb1J+goU0PuMQFrzy86dVMSOQAft08
         1pI2V2RXEKhz2RuMsFy9BJAD8AL4sjdWZYp/jnmojLhzEt61q/HSrpEfbof/jPY1lyGu
         RIjkTXCwBj5L/+H19drwkxdCPPZm+U51IHz70pB/h3i1sCEhZ84gHzmzae4SxpRhHUbm
         hsoBiPX0pLYtPA4KVZ1/mPYx0BALwQU/aQqh7u6A872O77oflf37sZjv/cb4Z4LATFT5
         8VsgzucmPDv1LVBT2UnlJfPj0bF257oWRJMbjMdEhxrfTlIAdeJ7qW7QPW51bi65fxEo
         8Utg==
X-Forwarded-Encrypted: i=1; AKwUvBy4+dL/k7jEDIlPIxID7mewAzPYNc7quXW3PBNnQacCTq0RBsDAxIZohtqe6e6aghyfHxdodYfl5uDSels=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+d/4vwL3ODJ/1QMdOudZ+IIqHOLJw9d9pvS9dNeWwvkZFqh+x
	WnVO7/EOzdT+D129H0C6iDmACBOvxT1XFinIw9derbkibzQJ+mpvGTzQ
X-Gm-Gg: AYBFou1kJDICbbiQX0EpBzBHkZjvHPRRrzkBl02oNpJWOC2vQdg0gFlgOHsTZH1Qxfu
	lE0TbfROgEWjujJ5AXSlDeqHT9x6gbrOImolgVu0PHQ35XK88RetmaJbUb3NlfSTOk0n1ZzHCKs
	zd7soiz9BLIMbgRJZPyNzZsjK2SFodjdXTryPcFIBNUn3AIPx4cavgqOlwGkplNSNtXchx5SdKf
	Af+4yvcKxiCRPgpS0EBxHwaq4QZOh9sNK5gxpRIGT+FkttcIVt7GOdVM1x+LAh+LNneTyopPamD
	faPYR7uq3jCpi2utF8LYdBw7KfUfnYd09yxjZFcaAs/GwkjpZTlrpkAMgSYiN/ahCowOc9x1FMI
	onNUoDtHih3YOvoESQpSBw0IkGNIRHh3DE1EThQccGZBsd4U+t3kYMuQtBPikCl/ggXb2h07qn1
	46eV+ONDdXEQ19d1ASlpKMgkbp/ml2mjZsOvHkA8mfTNO/O47nn+l0aQDiH4kZw0eScMYKCMhqs
	59SeZ4RUSOd2eXvLJag6ukz1L222iMxtFGx6FLZJAWghWTQ3CLbd+4MnFiuFcZLjGtizSqwCF2/
	6OpuvlNk4g9/Odifpiu2ZnL6dvQ+t/1zqKGoVesnk7DBvwpPi72TIxlLBwRv4MQSQHFOhkebTNI
	nww==
X-Received: by 2002:a05:6000:400f:b0:48e:d88:55e5 with SMTP id ffacd0b85a97d-48e0d885ae8mr18682745f8f.6.1792478308630;
        Mon, 19 Oct 2026 23:38:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 3/6] iommufd: Clear the PAL list before dropping resv
Date: Tue, 20 Oct 2026 08:37:42 +0200
Message-Id: <65a7be483aa5e374e0afd4d72cbafab0fd07a4a3.1792477872.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792477872.git.kmehltretter@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
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

iopt_release_pages() frees the PAL physical list while holding resv but
leaves exp_phys pointing to it. Between the reservation unlock and
dma_buf_detach(), an invalidation can see that pointer and unmap the same
list again.

Clear exp_phys before dropping resv so a later invalidation sees that
there is no live PAL mapping.

Link: https://lore.kernel.org/r/20261016194022.62065-1-kmehltretter@gmail.com/
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 9e9bc6a1c..76d8803d6 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1674,9 +1674,11 @@ void iopt_release_pages(struct kref *kref)
 		struct dma_buf *dmabuf = pages->dmabuf.attach->dmabuf;
 
 		dma_resv_lock(dmabuf->resv, NULL);
-		if (pages->dmabuf.exp_phys)
+		if (pages->dmabuf.exp_phys) {
 			dma_buf_pal_unmap_phys(pages->dmabuf.attach,
 					       pages->dmabuf.exp_phys);
+			pages->dmabuf.exp_phys = NULL;
+		}
 		dma_resv_unlock(dmabuf->resv);
 
 		dma_buf_unpin(pages->dmabuf.attach);
-- 
2.39.5 (Apple Git-154)

