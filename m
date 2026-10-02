Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DCE330328
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921017; cv=pass; b=qLI12D2cS9sABGWqPdiJcLMy5pNL0gTNFjcXAzkAOa1zCOSq8NEC8kOTqXCFyyHRUba9NOnREg/Rkg6fkRNGftnCRQAykdlcA2eWkUjmO2K/UkHspPSWswD8XFZTy7oZ+W8Gdps7unXyI8crK3LG4oDwQA6GJZ0F/PwB8M8lK5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921017; c=relaxed/simple;
	bh=c53hbdMVU2M7nFkWFf/TeQnEo56FeWIc3BaXR7jGvUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Punpeydg13odhVFdovn0bZvAThhGnnzcNXT7BOAp2cg5XiczR4ftj5PjeHHLJkzFMAT1nv6XtDGlGfqKKQSx0gFu4AYR3jSNLgoNhzhG4r0Vf7yIXi6gPSypd+KxIMcrA3rpNwFlzqXiv3OPiLRg1nW4oGi3zEzEOepiLXnp//g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=JV4yeg8N; arc=pass smtp.client-ip=165.173.180.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="JV4yeg8N"
ARC-Seal: i=1; a=rsa-sha256; t=1790921001; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JkVhuMjCm65znCST4pEBBkey1WFOrGgWzgN44F+zsaKOpiL5CFPOsMBvugoG5Ew/Fx8yNDbyUd10ISYnUJm3KHFgGNqemA5izEyAFnmr7xu5IYbpTBetuGCacF6RWyoLgxPGA1BFHfUMMywo6PMP/JhhzvviPgAwNWTsxpL0jVs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790921001; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H/b3ZecCY5G/AllBicLLSsJld6QmAdfE8Z3S96RwbBU=; 
	b=jVPg89pjGMR3FvK2hSGSJ6LYbU6gBGAjyEKxjgHcNKV+o4ko9nPuJwttwC1rcSNq1X+0FcfxY2f/vfkK3AhE2pDOTnrMrSAXceSrNGETAZJC46srwKwBnY3bjCFdaUx8g4QmY93Dacxhky30+2QdXHKFxy4f08+F/LyL6sgr+q4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790921001;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=H/b3ZecCY5G/AllBicLLSsJld6QmAdfE8Z3S96RwbBU=;
	b=JV4yeg8NWBUjdslJo73npaXXZia/d4yjS7rlR3qEuf+pMiJvuXEfXMouyVIIkf2E
	sKkOFe85RnWmfCMOh2A4YqmuBwO3BEVpuMIinV1zLnSoEuywH78YrhmEpxthtzRm9au
	u4O6FzPGNe8MUE8qPofzqmLHKF8i1pY3gOZobJBU=
Received: by smtp.zohomail.com with SMTPS id 1790920999443943.8416525323604;
	Thu, 1 Oct 2026 23:03:19 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 02 Oct 2026 14:02:57 +0800
Subject: [PATCH] reset: anlogic: dr1v90: add __iomem cast for base from
 platform_data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-dr1v90-cru-sparse-fix-v1-1-9cb87d3bdfb4@pigmoral.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw6DMAxF0a0gj7Hk0A8tW0EMkuAUd0CRDagSY
 u8NdHie9O4Gxips0BQbKK9i8hkzXFlAHPz4YpQ+Gyqq7o7IYa9ufRJGXdAmr8aY5IvpUodreNx
 S8gT5Oynn+ey23d+2hDfH+YjBvv8AjwqUBXkAAAA=
X-Change-ID: 20261001-dr1v90-cru-sparse-fix-f37b4b85ffa0
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=c53hbdMVU2M7nFkWFf/TeQnEo56FeWIc3BaXR7jGvUo=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL2e8rxr3o88+t2PZ0ef58byun3zgTYSGXkGTxynrDii
 O/fZonKjlIWBjEuBlkxRRYuf/F/1jo8344ItN6HmcPKBDKEgYtTACZyYhMjw+2wyFny8TO3XeKI
 CTK6FXzly99O3pcLM/zXBbo8sW6JsGD4p7n4R8RD9fDrD/IF7rUcVduiEWGSpJj0fBJrWkCeP5s
 wLwA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Kernel test robot reports:

drivers/reset/reset-dr1v90.c:114:20: sparse: sparse: incorrect type in assignment (different address spaces)
drivers/reset/reset-dr1v90.c:114:20: sparse:     expected void [noderef] __iomem *base
drivers/reset/reset-dr1v90.c:114:20: sparse:     got void *platform_data

The register base is passed from the CRU driver to the reset auxiliary
device via platform_data, which is a plain void *, while rstc->base is
void __iomem *. Add an explicit cast to restore the address space
annotation.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609302313.Ux3U0CdC-lkp@intel.com/
Fixes: 9fd565971072 ("reset: anlogic: add support for Anlogic DR1V90 resets")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
This based on linux-next (next-20261001).
---
 drivers/reset/reset-dr1v90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-dr1v90.c b/drivers/reset/reset-dr1v90.c
index daa99c797b1a..317aa4ebe3d8 100644
--- a/drivers/reset/reset-dr1v90.c
+++ b/drivers/reset/reset-dr1v90.c
@@ -111,7 +111,7 @@ static int dr1v90_reset_probe(struct auxiliary_device *adev,
 
 	spin_lock_init(&rstc->lock);
 
-	rstc->base = dev->platform_data;
+	rstc->base = (void __iomem *)dev->platform_data;
 	rstc->rcdev.dev = dev;
 	rstc->rcdev.nr_resets = ARRAY_SIZE(dr1v90_resets);
 	rstc->rcdev.of_node = dev->parent->of_node;

---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20261001-dr1v90-cru-sparse-fix-f37b4b85ffa0

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

