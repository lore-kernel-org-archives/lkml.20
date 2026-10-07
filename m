Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F0D388E62
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385421; cv=none; b=fgGkWFvex/XL/o+zFtp80AEqvSVVtQMFxQJQ/bUb0hnckalISuNVQod3D707hkY4KlGJSBsGSQGtl8E20IzF+RXydGIBfyhuaKpe8/p//JmP6QiyUZ3LJ9GxuZllfrpHzdbw8Tx4J4VijKzhj8sSIGbRPeFwCBx3vHgl0KLrk30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385421; c=relaxed/simple;
	bh=mHC/RGheQA/8XTenPfi+sBGljTLRzWaZrO12UZ5yc9c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tG3hiHuu60k/uBI8x9lv1U7JNIUO9G4RB2YBYc2ZXDS5MmuCEYRwqFdEabJPsvs0eAp4oeXnA4KlO7OFwcUDa7GLtNhnzZb009ZnxH3T9jT2hbQu0X6aDM3CnPM0qlVzui2kxmk1MirG4TxXJJ9JTDZ2uJiszJXmI19AxedwHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B29L9Anh; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B29L9Anh"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48af4a0bd0fso2354694f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791385411; x=1791990211; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8FWqswNObLYfcWOqQ6/Pb15Xj4sKDNQtqT1jwVfTss=;
        b=B29L9AnhW9dbOdnEzUI0STLuNLFIha5oSCz1H6XwiKK7bf7suI7W8Zwg4TrLKznzYE
         UXiv13RDiY4HnveBcDwI2BS5vBqHWYJAL9qO4PwOWZUoXi1C0a/7W4hvE0T80B/EdFSQ
         rdACK+u+bMSNxTc74nCXm5eAiRnoj4ADbJORc/CyK/ifwQjiMnM1N+QQOlKzjNx9Q4e9
         08Hck+XYKtsIQSkXjGCi8VVFKKTrDRS2xP5eqJX7ADx4+S4j2sEuhlTq5fZ1Z7ng/SvY
         l5Bvzs4HvuxFRNQSRbJTOPMQSH2Wm1tVXUXfAoWZrY9ISjGwRd4L5cfMGoGgQgKwbC5P
         NzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791385411; x=1791990211;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8FWqswNObLYfcWOqQ6/Pb15Xj4sKDNQtqT1jwVfTss=;
        b=JxXt1VmzaRtb+YJ2po/ldGYnMF5N60pmSrCXhu3TLR/Le68kerbBUNLiclqJNWpClW
         vSDDJBugM4d1KZlCadhwDO2qXagplQC7CIfRYuBjWqUs6mXgyX1Al1JADfuzrvVClfra
         Q00C4WbvfvPePEJ/GBXegHRux/H92RfOl1FfxeuMOgDCkj7/cLfUpWK3bTbC8Rhl9Qhp
         PM5Kan8qQxAt1p73tU7BLg9CDoaIu83hjZcXJq730VvH4IfUACtCq2Lo1nuDI4UvLBzI
         94sv5s5y8ModO208hAk/22EJcMbs+cOuAmTEKNGkGIMiNSUtnysYvxrfys2g83Sn55JC
         1LGw==
X-Forwarded-Encrypted: i=1; AKwUvByj7mZH+o0N7U1oARusT/DBno4RqtxlCK8+7ngmqYjh3eR4IXfrhaj5pZDyxrNdY/mi3V2T7cNdyxTmZBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuUvDS089BVe2qbMwOjwAXcmMrYMY0HMdh8sfb6S3mrAvWpOGd
	jo0LL5iDxE8EIK2OoBOTfTbbfzdsXeA6LATpnaf5i8llvomP3qE9ft+vZLaCajvQ2OJ0hKOwTGA
	3S/hmoygmOOyXqyOntD6r4Q==
X-Received: from wroq15.prod.google.com ([2002:adf:f50f:0:b0:488:8365:8c38])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2284:b0:48c:490a:336b with SMTP id ffacd0b85a97d-48c7270327bmr5179418f8f.5.1791385410421;
 Wed, 07 Oct 2026 08:03:30 -0700 (PDT)
Date: Wed,  7 Oct 2026 16:02:52 +0100
In-Reply-To: <20261007150255.1648849-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261007150255.1648849-3-vdonnefort@google.com>
Subject: [PATCH 2/5] drivers/virt: pkvm: Make pkvm_granule __ro_after_init
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

pkvm_granule is only written once during init in
pkvm_init_hyp_services(). Mark it as __ro_after_init.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index e7d7cedf7f6f..fbcb57c31186 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -17,7 +17,7 @@
 
 #include <asm/hypervisor.h>
 
-static size_t pkvm_granule;
+static size_t __ro_after_init pkvm_granule;
 DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
 
 static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

