Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C394DE727
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981351; cv=none; b=CNo8MpL7sorl2EBwzDGbdDn5ElkZd5L2nA8rFVcAfMPUxCU54xTyrbuiXk8Uw8rRCpIamxyQmFcr96qIIRLIOtCXqhQ33QnmpaiZWU6p6LOA6FRaLVsfSDnrZvz2mt1ZAG3CMwmkdTSIrfJi2Yzqxk4diZERF8xB5CMKrZge2Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981351; c=relaxed/simple;
	bh=8yqPK/hBeI+MydFnPwtDEDydcwIdIgN6roHBhwTkxDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJJthZx1NjOVB/hDa7BDu4fvdDQcsAjAwmiDLmCe3A5j+Lt0qBQKJyP2DdA0ckXQndjwBclR+xBeAL4Bcr+mOvMdyDVkLvs6O4zZl5N5g8briPjEO1h0t+oUZTl29I/TF/ujCqvlDfgaOmR8UMgJjGXmdURHFVVm/U/803KwKcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmG0+GP9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmG0+GP9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so2597178f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791981348; x=1792586148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=om1ONkc929u95vn1fQ/Nbz6FD0lMp1Ust+GYISd+Hxs=;
        b=gmG0+GP9TF4Gbrs97mPC86qVXaQW8+AOjzhEmaAswG783yKt2LI5QRexk0v7ewm4B1
         2nKIwRUvanQgp+SCJJ1jIVinmbCYwx1LTdVGQ6MTd6CqUQzLKSYNDvOIJPobjJYXU2Tf
         81O0n1BsKTgxPzUdw36vkj8r0bchjY5ZEQ7k/qTRv2Z72/iVoWsx9VlvcSDcLIYVTvjC
         iVBpxo+CMoogHkxPt2tKdBot4NTdGW+tloLqB+zzY72H2ds9BUDMjxPL7yoiH76XCzDe
         yGlReax6ae7eF0s6l4VsMtFBYsYlgFXzo/1Bv62+lChaEa9m2UNSiw1bCHyQCv2GKZF6
         tQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981348; x=1792586148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=om1ONkc929u95vn1fQ/Nbz6FD0lMp1Ust+GYISd+Hxs=;
        b=yxMtFjbbH0ext0fRmmGpLtPMKBrbyaEJ5tyb5tlVGzXjv0k6sT6YEasEWqdESVZCrl
         DYWaavYgRmjZO3ZFwZVjJoTAS95z3QmbUNUZVN7S8ha/+rWy092NNhaxFD6+kpQDBO40
         hTuobJonEmya1IZOUiQVHWcqRqOB0F1m6H/+EyeCp9ztcK7+KGQZJ+NLZY5/UYAeNQ1e
         8ExAcQlZ9ZpLBLS3P5tTPPmBS4E3FOxX4jSOCZNC6P1EL6GsiBNC03GIjlUluI1qnAKS
         TauwZ4GCS0qdYqZ8XlypMepIawVH4gYCC/zJ+XhkO9mDeBeah8p9K0mXEaqM+NX5IOcd
         szMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnTZX0wEqalI63y8/7LUDZ15xgP9OhDjXcg/90fwrYsg9xrLSpUyKE8G4LSl3oTL4S3P2i8ARV8fXkbfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnQ6MiXypMEK3s5TizbT5xKFHOCkofjrnRREoYcaPw/nGckmWt
	gNYWVOHm0V0WS+Et5Kf+sIIzcxZKkY+LGnzMSK8+zNkicq0hSg7SlOy+
X-Gm-Gg: AYBFou2MBNhSSFXuACy5GYX35WNCjTqZ97BbXFkFJoz5yvbhg+9GNtBuUc0jbLVNsCs
	+jwnT5rxKHgv3WYgjBGOEH6+tR/bKrccEfiynHhHRIhfXeAX7OVAal8NLTzQrydF4g7k4LQCFS6
	9MDwbmpoVMY86bAAYPQJg58MdaYCUUJmnSlgtU2c9w2aqVtTz4CzLryXtuFCQldu3PxCZlNqrHT
	5A0SSVGFWK+0/KAgKyiKDZg2CZAa9qkc2iO68smyvLVeuy39HANZdJh2LibwCqyi92pUCbxz3nQ
	+VhAU7x270gl7xoH7pvsH6U4ircIMuGqmBXqa1l2dcYAi59fT7qDlLZs90BNZKdXcynbmNgMgBS
	NjVvMhSWJe90U3ERr0FcHSVkq4QnV+SZqnWvqteUoY3ynrUy3/ITNOODnTh8BsfCIhiTOhIsEgf
	J3xzXaTo+IKQorkSik3Mpm0JX9N/wpXoBjt0nz1MS6chO7FOJU7B2QqGi6JSBZP45R3RSeB/FTD
	HShncpVCvnMlDEJvSjMGai5GlxahccxxfuVUf8uo/GTWzQryK9E07cMEVUF+7Q=
X-Received: by 2002:adf:e007:0:20b0:487:8ba:8aa4 with SMTP id ffacd0b85a97d-48dbace50e3mr22564611f8f.38.1791981347653;
        Wed, 14 Oct 2026 05:35:47 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded3874c6sm3003353f8f.18.2026.10.14.05.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:35:47 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v3 1/2] irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
Date: Wed, 14 Oct 2026 13:35:38 +0100
Message-ID: <20261014123539.2259230-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014123539.2259230-1-julianbraha@gmail.com>
References: <20261014123539.2259230-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ARM_PSCI_FW is always enabled for arm64, and the GICv3 driver only
uses HAVE_ARM_SMCCC_DISCOVERY to identify the NVIDIA T241, which is
arm64 anyway.

For ARM_GIC_V3, let's only select HAVE_ARM_SMCCC_DISCOVERY on arm64.

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v2:
- split out changes into two patches

Link to v2:
https://lore.kernel.org/all/20260823180832.1246363-1-julianbraha@gmail.com/

Changes since v1:
- remove select and dependency on ARM_PSCI_FW,
- make the HAVE_ARM_SMCCC_DISCOVERY 'select' conditional on arm64

Link to v1: https://lore.kernel.org/all/20260801212235.2692694-1-julianbraha@gmail.com/
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a8f8c423b795..31b7e4c90007 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -37,7 +37,7 @@ config ARM_GIC_V3
 	bool
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
-	select HAVE_ARM_SMCCC_DISCOVERY
+	select HAVE_ARM_SMCCC_DISCOVERY if ARM64
 	select IRQ_MSI_IOMMU
 
 config ARM_GIC_ITS_PARENT
-- 
2.55.0

