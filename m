Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D6938839F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573963; cv=none; b=LdSAA/YYTwszvvobGP3d7wlF5lwrcWJROScCj1IWU2vfCZQbMznjC/0+279VvuwDzTb2aJu9CsPUGD406d2xvq63gcnmBXhdsyyba1fRy4ZtqVCve/MRwu8Ca4Ca8Y/DEvuTF0FjsAC31vNy8SW8JTQpi6WoyyG49DPfIfFgJeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573963; c=relaxed/simple;
	bh=qDHuxNQTwiK4vLrjxltnQ7pSPnmhxpgaO7APWc3qf9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQ3dL0K/r2Wfn4AeM9GaSQcgxX+EAj2hOWftO2p9xPVW9HGQkOLQDbhW+zv12EiCD8F2Mbc0G6y31X1gNoiCTl8y4/DIBRWgFjflBi3UlZG3QYI4YgzZzWqYLbcsKOMnXR4z7EEbLRcSUNpJrfnmqctUuZAb4z9phh0EECuOUe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JS5Xtrc/; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JS5Xtrc/"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0acc26e33so326427a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790573954; x=1791178754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oYoN39qS2O9tTjo4AMAAx7esJiOig4Qk9Kzt2+/v1lw=;
        b=JS5Xtrc/fcTbE1IGkEwrugUcgBX5LGRv/ArjsCtzu7PLZEfGPh7hklWpYVfxTQm0C4
         +psv5gvNUVP7Fr206QLvIhuwpsCw40+ZrgBansxXc6j/k5GJ8IqVZUmI0liZpASU+Hzp
         GAHHf9QdHUgaAA+PrzOHIl+l0yS8EAOLRK3ltLGf7SU+CmWcFQKPJB5mbzkrcs5MURIz
         4ysu4axdfSSo808d3X42Fzeq3Q+rzvsmG/DQwLQEBCNQ3gkyhuQTohQvKrz/+iDoM9EV
         SoHT+VUDUqCOCsKiwRq5GcABx6DwWsSESVFpNB3lrVWDhh+ARDF+u7RwsZ3VaSHOPSWy
         O7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790573954; x=1791178754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYoN39qS2O9tTjo4AMAAx7esJiOig4Qk9Kzt2+/v1lw=;
        b=k573/q9ZSb7VRbX8U0H/9YNum9Jg1WDw7vW0PAM3y/4h51ozoLqXl8BVCl9hIfkG8k
         Y4ogVA+enJ+3cOrofbNul6dDupLYlY5pT9w1EueH/+b5hBM1BCVLtXM72xEd+UTEAN6z
         JPbmwNjsAZWmMymynIg6cGFm5ZH29nDRK4liuAnqHcCtx6HtlWWolh8taVidgaZw1nRW
         CF0twnWk6ECs4Ppcm4y7GNs4/ZgK1+HjhmBLCd4nIBCfLDl29fg7ic3JwIOhuUR49hGD
         MpFKm1flvx7QSQnOLK7xFEHaa+sYHgpBbo/grEwO1Nh49pZ1tYldGNfn81bYKgVbETVg
         ST7A==
X-Forwarded-Encrypted: i=1; AKwUvBwsBTiwmZ4eLtOmM6LMdYSZ5i0kvnQWuUtHlkavRHIAlx20Vz6w/l9u7jjs9CELT6vk+0T0hGUmh4AfjVI=@vger.kernel.org
X-Gm-Message-State: AFuF++kF0UBk0SirkGhRF6ZRoEWS75eruO5vpOFPc2r3KerH/I6Ya0/T
	KNh8mctYlrZ71Oapd2tFAQsfw49KW+23hx0g/doPBZ1mmBP9AV7N3aSc
X-Gm-Gg: AYBFou1IRLmqRL+WtmhxjNiEHaBSEkiB7VgbgoSGdh83Hnm53xYeGrwoGylqNMVi21C
	SZOkivoYOw2P1R2FI2ZRQH7ZWcHnhhm/fS0sWNCDIhqSj1+NcIzalwVt1t7DWomhFYwbsPl2ary
	nd8Ko2WY8yFecGjF88SJ/C8Ch4Oy/SK+6KAwqCacl5IVoY5x+SoZ8pcI1mElq6s4cl64cvR2KoL
	QlTGr1Mfi1U0JeRqfQhToW7bwzhrCsQ1Kpm6adXjbfADrmAfsBLbCQY2i/7e4+e1eJD8TG3ZEDL
	OGa2tdtcegTPDkp5IiBlgNc29fQTO2Hzok4Vx7JIpjh3dEsox7gLQbYxczhbtD7C2spFhrnsh81
	epXH3ogWSgrW4JZ93vBnj9S9YWyqiUebjCyBdJwP2mSrZizGUM39RM/OnEmJNZPpQxHwlK20TlQ
	TiQm7RfqWwFaPqoBT/pGDRjyy3iEa74MkaId6Bw0vnAS+WhP8wNYDHPOy7nHbtLM9+mKxBbdjsO
	UGN4bfbd3QkVA==
X-Received: by 2002:a05:6a21:1645:b0:3c3:2dc0:7cbd with SMTP id adf61e73a8af0-3de22b356bbmr12488753637.1.1790573954396;
        Sun, 27 Sep 2026 22:39:14 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87febb82357sm3591121b3a.61.2026.09.27.22.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:39:13 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	freedreno@lists.freedesktop.org,
	iommu@lists.linux.dev,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bod.linux@nxsw.ie>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v1 1/2] iommu: export iommu_get_dma_domain()
Date: Mon, 28 Sep 2026 13:38:50 +0800
Message-ID: <20260928053901.7270-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928053901.7270-1-liujianfeng1994@gmail.com>
References: <20260928053901.7270-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm/msm needs to recover the physical address behind a DMA address of
imported dma-bufs: with CONFIG_DMABUF_DEBUG=y the attachment sg_table
it hands to importers carries no struct page, and msm has to translate
sg_dma_address() back to a physical address through the attaching
device's DMA-API domain to map such buffers into its own pagetables
(see the follow-up drm/msm patch).

Export the helper so modularized drivers can use it.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 drivers/iommu/iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cd1bca7ede9af..330f9a79248bd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2327,6 +2327,7 @@ struct iommu_domain *iommu_get_dma_domain(struct device *dev)
 {
 	return dev->iommu_group->default_domain;
 }
+EXPORT_SYMBOL_GPL(iommu_get_dma_domain);
 
 static void *iommu_make_pasid_array_entry(struct iommu_domain *domain,
 					  struct iommu_attach_handle *handle)
-- 
2.47.3

