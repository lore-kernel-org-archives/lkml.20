Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D724A0905
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050434; cv=none; b=WRldFhG1IAUGsq5jZqjXm2ITFU9Sr7ZOXC4gKdFtiOZVTcziJmwTVZBotu1S4+CzGJ53XE4Zgy5HAMZK6S4SJHzJZaQPIu2WuE5lYVs7qhgMU3cX8jLiG3TMdlX16l7gS/9n50mjz8eO7D0gmUJ61hXz7GDxgqub0tVxSlGBCLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050434; c=relaxed/simple;
	bh=0zK3NdZdAEIF+fY7bnFJa022HywxKyfReyEg/39UFm0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f9o/csoV9+mVdLibnR+5p5H/lpyB9+5pSdYQmWG2TSR89WoGdjQ9GrNxTceT9LU1doVj4iqeY3KE2bC38qXG0bNkaO7e6kJwPJobcFOdokpWS8hpueY43pJhmVO2s3mkxe0l/yuTusLumbcrQ0kziWI9x7vYdoZC38BUGsMhPpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LTu+r/PZ; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LTu+r/PZ"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc92350888so40414475ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789050430; x=1789655230; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VbiO+0ZZ336AV1ci1nySmnPdcf0jBOH8n5u+L52730=;
        b=LTu+r/PZwX8VG7iB3g9kR8vc4+IugjkneVG+1FxDEQ37E/A5gJM3q5tg5UxNIAhlgd
         IQy31sf48+FfjEAQ+zsSUqHgKFY+PekSpYd+hUnX0PQAJfo+AVJhGUoDl+/XDmfdYQZN
         3RRqyWoI64h4JfpVhU5MeFkCzgTnEcUoQZeJNSzthfhp9EvaqdkfRgnO+8bGjgAll5TE
         s1r3W4gXqitYR8AzPXjRXJ9Vkk9F0Yi6iCuxY7NWCirxwCxEsKhdm+ZbswLwblkquYKb
         pGTbiQf6mFtPi0ZTZFJW4wkX/QOQOh+npZ4KVjFc3x5qT9MLDCKYVQCGUAR0sWZegS2D
         wBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050430; x=1789655230;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VbiO+0ZZ336AV1ci1nySmnPdcf0jBOH8n5u+L52730=;
        b=cEMFKb2VcIT4YY2hwZNpqOFbnvAnrSf/rcnOIQvRquRWIPy9FFxAlUdcnhTYUR7syN
         PINQeMigYUHIK0r6z4D7XYKghQuoIDHYZG/AROOBZJRXNmlM74ue0/wBhoDPYdnEEhIF
         BpGUviHF8na49M91iu58M/9IvgV7B0lQNqN+214mxduY/D874pS+qfazOw0RFXqPpJ5I
         bF7Euhfeik7Upz7D1rUEcE+8v2KorVNuN/I3jY0GXK2rSTvzVR28tTyn1XwqGWW9jp/z
         8gSfTG4SrYQ1y7oRwMJa8/PKlx3hzTBNpCFN/l/GltfhjED/jXgYdnzJ9ThQb2NQsgoV
         RXWg==
X-Forwarded-Encrypted: i=1; AKwUvBxTtpkaNfcM6q6EBEQh+k+EaP6E3lOlSf72a7R8uyr+8kDcbrm6US7PLsZ24GScn6VO3npV/PicOi6jJ54=@vger.kernel.org
X-Gm-Message-State: AFuF++lYV4nI9RqcIGMhUu5Y9fASgd9wFxnEPicihrF5JPQM+sqlTpl0
	8GDDqjGRxmxgFrXIzrc4wxmNc7QrRSARDzDbus2VeOt+KwKrN4u0Wo+RveZXB9/vPVtd9wu5ZV+
	lHA==
X-Received: from plkq16.prod.google.com ([2002:a17:902:edd0:b0:2db:49e4:272])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e548:b0:2d9:2fc9:5706
 with SMTP id d9443c01a7336-2dd077e0c3amr105542405ad.2.1789050430169; Thu, 10
 Sep 2026 07:27:10 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:26:55 +0000
In-Reply-To: <20260910142655.3281464-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910142655.3281464-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910142655.3281464-5-praan@google.com>
Subject: [PATCH v4 4/4] PCI/ATS: Mandate checking pci_ats_supported() before pci_prepare_ats()
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Ankit Soni <ankit.soni@amd.com>, Jason Gunthorpe <jgg@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Pranjal Shrivastava <praan@google.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Nicolin Chen <nicolinc@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Currently, pci_prepare_ats() internally calls pci_ats_supported() and
returns -EINVAL if the device does not support ATS. While this provides
a silent safety check, it conflates support detection with configuration.

Update pci_prepare_ats() to wrap the internal pci_ats_supported check in
a WARN_ON(). This mandates all callers to call pci_prepare_ats() only if
the function supports ATS.

Update the function documentation to mention that callers must verify
ATS support (via pci_ats_supported()) before calling pci_prepare_ats().

Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>
Suggested-by: Baolu Lu <baolu.lu@linux.intel.com>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/pci/ats.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 9cb23780093d..f1434f86ac40 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -56,7 +56,9 @@ EXPORT_SYMBOL_GPL(pci_ats_supported);
  * @ps: the IOMMU page shift
  *
  * This must be done by the IOMMU driver on the PF before any VFs are created to
- * ensure that the VF can have ATS enabled.
+ * ensure that the VF can have ATS enabled. Callers must verify that ATS is
+ * supported by the device (e.g. via pci_ats_supported()) before calling this
+ * function.
  *
  * Returns 0 on success, or negative on failure.
  */
@@ -64,7 +66,7 @@ int pci_prepare_ats(struct pci_dev *dev, int ps)
 {
 	u16 ctrl;
 
-	if (!pci_ats_supported(dev))
+	if (WARN_ON(!pci_ats_supported(dev)))
 		return -EINVAL;
 
 	if (WARN_ON(dev->ats_enabled))
-- 
2.55.0.1003.g10538fe699-goog

