Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EDB4A8FF7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531054; cv=none; b=QIBkokV/X0GnSCNtjxWFPjlEc66RPGrfi+B0wR1AKUVaiZ42hlc4ph0Hk5cEPngDKubLTLBDujn2wijeLUeWdsGfiX5pOkFCVTf/EAlspcSWFu/KmvF0RGEBbQrTnj1thUYiGf12PbbCl6LC/MWOv1006KASWI0fYAjRGaQZuLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531054; c=relaxed/simple;
	bh=6+l3T16YqBoRlbABnst1+TqgdnjDEqIeHNaVG4pj+9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOhxZugNDjqMKpKhnCyc4HRu/Qj1YdR1A1Eo0gKbJtBzQHZv/IKYZsEryYxR9PsdHaWlCfm9Zvh6bIcG01ABi0nJ8DO6b5MsSIFX6lDV2oiUg9L+1gVQ88G1In19dM9pBHSCvvRgsV3koRmeEiOjTkSNBLAldgUg7v2eqEa2nQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=rFDVVypq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="rFDVVypq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so8375755e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531051; x=1789135851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOMrL5pgvFhwSvByI+4qlT7MXoUJL5NjWpFqsiJ9Hnw=;
        b=rFDVVypqhaTwhAOZ/TGVCReyQJtT33FK+70F87HhPFPv40fynhVPNa6q/5cnHDYZJM
         gDOt0l/GihgPxw6CBLWfq/p7DzeAVnDS6gRf5qTl+EgJVve/gqGFbl1DsUk4ztz+ms6T
         6oLKlcbQbExhSHwRTsGqBQ+AOFw9enpz51jcge/znA1QZiyQMdekykwYVgp6Fm3XXBz+
         +czxSLQwwBX03Rthh0FR71yE4dh7nHBP9Pk+SWCTc/ntbxUs4o2OoUKj3aFnk6RoGkR5
         CTTQQt+AD8bYg3dPuPYGuulaMJXugLC1TlhjE8ZWdUX1v3ewdSh77Fla8DdIx4ORhRz5
         qOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531051; x=1789135851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOMrL5pgvFhwSvByI+4qlT7MXoUJL5NjWpFqsiJ9Hnw=;
        b=KBp9DgmrVvYf/UNkFMSKExI77EzX2AmiOlt1XywS3a5WGNJg9mCQtfIoyvTI06jtTU
         MI+KHSe5wZrVTQbctmJWZbJi5aObZ2axvW6Rk5veuXPjq6F9l8lw5GPSA3XncmePDscm
         vvKzndWqkGbuzDJjjqpP8B/Mf66Mdqwg/VZr+ud5W6t9dZ3ft+BXB9H+fvoCHtiYOcWL
         s1UL+PF6i2sKlO4m/XCHapIgvSXX7fzsAlGnVP6UTkGekCXkB34inVgT7c3QhcRieZNI
         zfqHqth3KlTLPBMK+wFP57/9Bp0dLXGZfEqMhy/nSXRKVFgNn7Qq6nR+N2josm+Vc8+P
         90iA==
X-Forwarded-Encrypted: i=1; AKwUvBw1P3emr7W7kCpEORtPQj3Pn5dNuZxPKVyQyIeEwVyf5JyEu2PNWcXoYv5BTruFyUEUDu44CFh0/jbZaQg=@vger.kernel.org
X-Gm-Message-State: AFuF++n1vMB2wqJCyN5L2s6yW5jjla/rXgsuS5k+++YXQNVrvbX2Jsz9
	y08JSQMjiQuHDo+5D/bJAHNh3LdmgzzmxE36Td1xc/VB3Sa8/cUE3UOrZKIChBT2CBkQzdAoWWc
	j630M
X-Gm-Gg: AYBFou2BvTPyWh2ssa2tLVWmgAOcbCjR5ReEPkeO6PaETiaHa+CThugGccA/q3ECGVw
	7wH1O73ENwlKnU5IuWgh7O8A+WgwiJGx8d6WE+Y0qq7VnMW8JV/kW5+7zkaP6gg51ducKBWaMZI
	/b0RD0sW7OrDtl5R8sE+TBK0tnWDPWsFSGPVJJsxDt0qWifRUQbAU3uL6ynb4BdKrOGanIIJ4b2
	eNusVm/6gf+54rp6cevvBg+j4KGOlXrVNW2dPs3CoLWact5+Bsl4OA8HJKzPsQ7dghFk15eUvs+
	gPEJc2Z1LKsA5MGfv0lHWeX0fBObmUKwHQybLrtnKGifdYz9GSD16LWqRbXliDf+lr6VITJkZft
	4xYSjvsmWlnEpxSycbORwtg5OQDCX+zaA++KGwR/85NiH7j4cnshYUonPsgZjABVLMXFcRHjNe2
	lh4fiYKm2I6fqLhOsszE0ubegwSH1VIliUelJ99N5mP50hxIBQH8Ybv4Jx6z4qv7xrgADgtuukp
	L1lXg==
X-Received: by 2002:a05:600c:3511:b0:49c:fa20:cc01 with SMTP id 5b1f17b1804b1-49cfa20ccddmr48051785e9.24.1788531051262;
        Fri, 04 Sep 2026 07:10:51 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:50 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:43 +0100
Subject: [PATCH 4/4] dma: xgene-dmac: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-4-0fcc63d65d4b@thegoodpenguin.co.uk>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
In-Reply-To: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1006;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=6+l3T16YqBoRlbABnst1+TqgdnjDEqIeHNaVG4pj+9I=;
 b=1/UGTl9qld09cFRhCKZNZevEkztnHBWqKduXD1tX9YhzELe4Wk3gFziz0npmX7vUgzAuy4qFd
 fw3G4nKijjXCWmhBWW9yq9WNMTDI/f+Md4KBbsec71lteOOf2SQDUnU
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields
which makes the code more readable and consistent with how
lists are initialized in the rest of the kernel code base.
Also drop explicitly setting fields to 0 where it is redundant.

While we are at it - unify the list terminator to have
a single space between the brackets and no trailing
comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/dma/xgene-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..8d1c58ca0d48 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1800,8 +1800,8 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
-	{"APMC0D43", 0},
-	{},
+	{ .id = "APMC0D43" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
 #endif

-- 
2.43.0

