Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D9D45D924
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116553; cv=none; b=FoiV14wTmGS7l0HkaTJ4RL0OrGxj0rDXAPn3JRxC3eo/XVQ68B6oXhw6AxhccM9tXNUzX6x0B7P1VYbqqjULHRcrto68WiBU4fqmSVZBh5HLEnFb/SN6H4/A52/wjXIW4KYJyMmLWXqfleBOy4BZlyESBsk6QyoxLAAeCtEV7Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116553; c=relaxed/simple;
	bh=ftsPX/fDZ63mdRI0VYix5XzvXzGHoQOQqLssy3pY5d8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jjQNLzoe1r5Sfnn69KM9LjpcSA0X5T+maCwhNTAZn3L9hChrS7Ipnk7FkjhgIOYpn1dZqZNOldnta/RwhMaS6r6ezmAjydhJQusvqSh+heia+oUPXKUJBugFyqJFg6weOZFKlVIYZysEJBE39BERLCQPc29FrYHhJHLivYM3los=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=do96jpRk; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="do96jpRk"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df5a65671eso3353325ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790116542; x=1790721342; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GRxp3EYFeG4RHE5TRXwDLoJws/VabvUKmMB/dI5TDY=;
        b=do96jpRkvtAMnkEyu4hJx178R6tNsgIIH6XYZDOuqoupyoyoC3Rc0xchEI8yA23l1g
         K8+rv8OyCwHk+IpwrGQcDbwMRsGC5+36Xxmo0dCWsnCPSRXjyaEOXmWAJ9Apo/T31D2r
         uGA93azynXbec/I5GqbL2u8D+leJRWBDMloP5rNksUNRgkzeLX/8QtCQyVTNZU/r3pzU
         Iu4kHXhq6ZUftr6EiFJOqHqD/Ta9GU6wEaszOP6YJpUF3Jqa46ljsaLpk16vXWhXYWpm
         7rLQOB3Lh19oFmAgJwMZQFIyqYG6ciFs93yqW43iEb+4RchWCs4si4bFh0tksh7k5Bu4
         VO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790116542; x=1790721342;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8GRxp3EYFeG4RHE5TRXwDLoJws/VabvUKmMB/dI5TDY=;
        b=mSepIuY7mHShvorTS1J/mxIdf78QGUU4jeYnysqv/d/ihKkygYnMEPWxy6Eur2C19D
         Le5PyrQSL3MpohnuouGdUr+qsvF3xAIj7SrrRwZQY8xNZwEwX6x7yT3sgCnIcpOrPjIO
         3HAsrXuHx7vC1V2Kx2TkBqPy2HklZub1Ag1SGdmh/gQE5wyP2xuio9CPafHrab90Q7HJ
         mN1+eXAZlJc04qut1on4aRGg8XycyfL3qx8P90YF0ApYTBC0QhdDsBN5pxZLJ4p5z53J
         wl+SwED9OhCk8Er2N/z9y1A8mkNoj/4kCBmfl8edUM0Iajas2Ll6MTS0/3aAQKy45BFl
         7zqg==
X-Forwarded-Encrypted: i=1; AKwUvByUy2et93Yrca5SKG7zyf0991kriwzX8CVA5ogBfp+m/P/IqlTqwNOYD3ouoDUUvNno4U1+flHLrkZXXag=@vger.kernel.org
X-Gm-Message-State: AFuF++k0eJ6Fv6jV0Tx2lVMze2MPYXPNynvJX1UyyXLHRrL5Q1IrC404
	RckeP4AfHpnbzWb0iJjL4n+lN4oJWr26dE1XB135atY2o9EwzaBuJRUYmwtsuQZ5P1Ow2jYy7bF
	P
X-Received: from ploc2.prod.google.com ([2002:a17:902:8482:b0:2dd:53b8:ff02])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ec3:b0:2df:69d4:86bf
 with SMTP id d9443c01a7336-2df69d4884cmr5081645ad.11.1790116541866; Tue, 22
 Sep 2026 15:35:41 -0700 (PDT)
Date: Tue, 22 Sep 2026 22:35:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922223538.2287676-1-morbo@google.com>
Subject: [PATCH] bus: fsl-mc: Annotate fsl_mc_io.portal_virt_addr with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"

The GCC and Clang compilers provide the __counted_by_ptr attribute,
which is used by KASAN and compiler bounds-checking to detect
out-of-bounds accesses to pointer fields.

In "struct fsl_mc_io", the "portal_virt_addr" pointer points to the MC
command portal virtual address. The size of this allocated portal in
bytes is tracked by the "portal_size" field within the same structure.

Annotate the "portal_virt_addr" pointer field with
"__counted_by_ptr(portal_size)" to enable compiler bounds-checking and
harden against potential out-of-bounds accesses.

Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
---
 include/linux/fsl/mc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index c25f0f7e6dd4..0b2c0eb9b605 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -336,7 +336,7 @@ struct fsl_mc_io {
 	u16 flags;
 	u32 portal_size;
 	phys_addr_t portal_phys_addr;
-	void __iomem *portal_virt_addr;
+	void __iomem *portal_virt_addr __counted_by_ptr(portal_size);
 	struct fsl_mc_device *dpmcp_dev;
 	union {
 		/*
-- 
2.55.0.1082.g2b9226bbc0-goog

