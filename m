Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478319;
	b=Om/bvVNNUljq5O+eujM3WHiURpw/uALDuLz3X7lZ07q+7aDfxIlTXkRYh83u2yQSy8/F
	 E3wkobsXC1xKlstn2RsLJj2C+mvzg5m/vvyc6bvk9qvs0XTukogXC2NNTjDH0hz71LHO0
	 WA6b7TJLq0iQ0njOKyvxs4klKOSfNpbNRrYuiswMAMjNVn9Jt9bUQDScaJ5xcoaRb5D1R
	 TeVjNPwX2ar7UQK/zg+vw1OOfLhvnJye+oBf2+TxHO41ZDTcZeG3MPD+ts+wG4SfnwSs+
	 JUWCo1bUds01ZbjkfF0fKCQiwHCWRgwXXVkkPPtaT3lm8Coq+Mnzsuk73VhLS5iJ/PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SzeDh/DG7K/TRHa14eJVZ0wsnX3im6yxpMJ76+c0/dY=;
	b=oEI3HI3tpuWvc609TvgQIBP3dAat+vpOKRRQrKpbfih5WWFVPfIuY8ESHElpYoehVL1N
	 Q/17XB2AJoHwzz8p8fDM3h8VedNNLW14EVUUWEeNl7T4QEAf2fJ6Oa4/84HF2xlijKb0C
	 jZXRuAGL4jVY75R0m7u4osBL8oXYyLrlDy+znrg4U4O2nBiknkEqRddtnJgnrhHQR3GkE
	 ae5uCnsA1OEiv0G+HrV3TB1/aTs1wuWqszro83oCdGHeXxDFTDzrFeATkB1l+WEPc7Ks2
	 zV8HIm+pn6Bxwxd6cj1bGLO8ZLVrMhTYnu0vKISYu7yxqnUx6Bm2IlfZsXOBPwzsbBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pS8kdSPy;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942CB606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pS8kdSPy
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e20edd106so149744f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478317; x=1793083117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzeDh/DG7K/TRHa14eJVZ0wsnX3im6yxpMJ76+c0/dY=;
        b=pS8kdSPy43DQfSfmrUcM5VFUf9OlClZrNUXcN/e0h1+S0RUX2sJz9PZGM8U2PqYoxN
         9QJz98WzW2TzxAZWvsrUMvE9tepekQQ7ZAxQ1+qc/cOBlAYOoY2ZQ+4CoMikujb4+HRD
         eyaRErWZkTvXVCC4HPqasa2prlH18HUfnW+HkDsiOOsp27uSuvYXvNwseErMTWfctodc
         9ylpmG+wzgYJkeJGgJ84SKnQTIddTyG37odV9XIG4ay3yatBFwB6T+OKjTbKYyeK4fkF
         agtB6573z9ImSvuxQSEmwlalfrhwTVlSvgP6hd/4MEfj9aiKEkw1+DoHkyCph9ZQ37gb
         Gvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478317; x=1793083117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzeDh/DG7K/TRHa14eJVZ0wsnX3im6yxpMJ76+c0/dY=;
        b=f4lcMVQOpbjj/labPkvu7i1t3kXA/NBMdUl3Q3x8i4EXWTNMCrJo8UWPRdtK4yjgiX
         7T3kTT8GqdHjK9iPQWVqoZs7QqrxdjBNIojbv35Jrph5UVd2otTp54xtq1bf9JVduGgJ
         IsvZkH3AOB7iuB4HMAKt9mEqXUgmNXwPEv+xT4L+h926y5ojYqBHd5dZO6QBcA896y3f
         C32bMkUc2Fo287liW9PGO7UDzmk1t/BbvlKytzwXVvF5zHOq8zaAr/YphrXvTNO4uka/
         L2XW7kvlQf+7fFTc2gt09dvHiT184E8NmHXsZWZZx+sywsVFon7tu/k3T/b9C5mfU5+1
         jRPA==
X-Forwarded-Encrypted: i=1; AKwUvBwnx21uxItVpAdcmIxo0KTANwq5hgHmWftL/kAXL1VUloPMmR290b5SLDFOCWocSvk+EkEjioTic5Qs2yE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL7N2y/Ba3hlRdSPGGG4ppL13y+EeZi7NumG4zoVSR7VkX2aOz
	SpufpA0T7a4SMD8MkZZC5P9koJs9MbZuk4lp7gCq0a9FTKUugmIjRpBy
X-Gm-Gg: AYBFou1lffupCsYuenEfaQYPXeLXxTwWTfBzsRNKRcP5N6hZaC/WFoxHvDvfjAUQwbx
	A8ISrQQvBSf8u3x+Peor3ZWazBTuU6XyyGGUGczbrcg3JLUxUo8Rcc267KBJBP+vh7n7mlojYag
	ViBct7L4rGOy3P5C6xLskoIMM+KPIvIJwXI8V+pIslALa0aRnm4R3kiHwN4xY8uK7mAMtKOwzIF
	okuqjgSu1LaG+Tcfv80rCCSChjXSoDGjTDaOM3OuJGNF/so2LvMGS7DxSC0gN+FxARl1gcjKicg
	kiHCZXZ2TJS2LKIKbyTiWVTiHZPAfi9Nhzaa4WceUH69Ebk15xoDvl2LQG223/GNP6Va54UCsUb
	TN5rm/XPipEnEU9E6qvU+JiFDQR6koqM0HGR9oVxyKNhbfehmHSNHb7rksaqB/yHWu/tQz8kB3+
	Z2I65EjzmacvptvInPEjW9RwZ+96s9Pug590+r6AnhdxEmWdlpsdfN9ACL1YxCOQx5AR0nS0BDS
	6bPgWZGqVSA5uE9kTPtyyYQIvFWYY6GhMDoQJCevdUDGSNEhG9FHOfLpdwMYpRvVfeGWJA/koWO
	JMf2/2/sRmdOPj3YZ8xE012KWiEGj9WuKwGs+5AtQS86Dx9F77r/yxzmbAwnGGqoz5gPm5xOt23
	16A==
X-Received: by 2002:a05:6000:2313:b0:48e:d27:bee4 with SMTP id ffacd0b85a97d-48e0d27c1f4mr17275309f8f.2.1792478316869;
        Mon, 19 Oct 2026 23:38:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:36 -0700 (PDT)
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
Subject: [RFC PATCH 5/6] iommufd: Unpin the DMA-buf while holding resv
Date: Tue, 20 Oct 2026 08:37:44 +0200
Message-Id: <3ca8c42d7a597658329e77a8af92aa294f0dc4e1.1792477872.git.kmehltretter@gmail.com>
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

iopt_release_pages() calls dma_buf_unpin() after releasing the DMA-buf
reservation lock. The unpin interface requires the reservation to be
held while it invokes the exporter callback.

Move the unpin into the reservation critical section used to release
the PAL physical list.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 59ee68a1a..85004a936 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1678,9 +1678,8 @@ void iopt_release_pages(struct kref *kref)
 					       pages->dmabuf.exp_phys);
 			pages->dmabuf.exp_phys = NULL;
 		}
-		dma_resv_unlock(dmabuf->resv);
-
 		dma_buf_unpin(pages->dmabuf.attach);
+		dma_resv_unlock(dmabuf->resv);
 
 		dma_buf_detach(dmabuf, pages->dmabuf.attach);
 		dma_buf_put(dmabuf);
-- 
2.39.5 (Apple Git-154)

