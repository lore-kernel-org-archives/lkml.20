Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280913AEF37
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354910; cv=none; b=WAQj219OQ6JtsBBt7/J2CyNtznMYENpSpB5qUwSxnHPBxPYeO/vMLdoOSG3Ct+FlKBNeACcBJGlJaibr87EFnxDjI/kFrJhLzl/Awy6tM9W+G7pFG3dgNm3W98nbzU4kjH7DhRAS7z/ERbYIr37bjX53coSH2xDeuuOman2QukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354910; c=relaxed/simple;
	bh=4JHiLhUMMs9Nn//MxYdYMRku3r3utXI4Q+NigLFyFzo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=isBEVi1SPBRj66S+D7ohx0G5WMzjiJk+h58RApEdyltwlkSnhtf6PuU02w+nGyn7vunFP5tOLVozs5xhgY8eQX67CrgCdyfQLQLkuZkza/H/oE1yVxhPqPthiqzY7Kf+51OE59epIAIIAuvZf70QTgyUWP7exJ3euNq248X0DiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UIThJWQG; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UIThJWQG"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e745d5dabso11884575e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790354894; x=1790959694; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygkUGwxLNNXWt7KIYmdgDq4/laqc8cv/krDUvuBT3Ws=;
        b=UIThJWQGuCXsd0F6vgbdIPsW6ZhWYrSKEB+tA7fhd39UGbbVkQszs4F8G20RcPA4uw
         22g9KtHWZF/fmglFJ6eLKJGFQj2kFyjV5HN9w8lVhpFwJOiAgbjOP+zN2MygB6YgU4Sy
         DyvxmmKbKac4iecqOk6nrP9SQhg0jIO3I51/9pAdtbjm5vRAUz7drsko/nk70GIGbOun
         cYKn/YtQdDXAPZMk9QMA101pSuqTxywPvSaoLTIsDnMWQgcbh2fQdR89/Yf20peC0DLW
         oj2Z+MxmxKNjPt40VtjmrVqLNYMA+ioX9PQf3GbACPkX5f4g+W2/keKThLyD58fzAwks
         uR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354894; x=1790959694;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygkUGwxLNNXWt7KIYmdgDq4/laqc8cv/krDUvuBT3Ws=;
        b=UF5oKq5vTvQMTlB3vlPDyoPqCqOKl6jdK0bqN6rA0TpI0cDEHhrSHj0lg4YY2Qdb+T
         dz0vkaeM6SMc3QyWasfkcD3Wsdqx94n9uj1drLBJrCoF1Iy9N7AjjDsBK0sQQizgpWC4
         SBmK/ZjgpLFvVafQ86RfStBP9xQ2JdXzYC5kYu7x5ytpu3n4H7b/E1c3kmJCTsdPINQI
         AOx6R0bLFusfYTUa8O+qmgP0Z1UuE3vVDwrJsWwZm7fuGiORhwk1Pti9LpTzs0iJuPsb
         83oHXYOEnB2IpBCXBlQMW59cLQM0yAuWABj60i1IK7dfh2zNOvdMOmYZlWgF+qRi791A
         IRww==
X-Gm-Message-State: AFuF++nh0bQxkJwJa+pfnqFx2spTIO5U/tT2OTdFk/sAYe2FkHgMOZHY
	5A/GpZv1zQyVeAzlr17O/xLJsi9YOu7jpSIWgAiJBApdsMW38N/EpPfc++kGNoZw7yQ6aDzfRw=
	=
X-Received: from wmdv9.prod.google.com ([2002:a05:600c:12c9:b0:49e:73b9:57b4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:154c:b0:493:f140:c3fb
 with SMTP id 5b1f17b1804b1-49fe66cab86mr114481025e9.7.1790354894313; Fri, 25
 Sep 2026 09:48:14 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:47:54 +0200
In-Reply-To: <20260925164801.4047844-4-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260925164801.4047844-4-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925164801.4047844-5-ardb+git@google.com>
Subject: [PATCH v2 1/2] PCI: Add __pci_bus_alloc_resource() to allocate with
 explicit flags
From: Ard Biesheuvel <ardb+git@google.com>
To: 0001-PCI-Tolerate-non-prefetchable-64-bit-BARs-in-prefetc.patch@google.com
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

pci_bus_alloc_resource() decides which bus resources a resource may be
allocated from based on the flags of that resource: the type bits
selected by @type_mask must match, a non-prefetchable resource is never
allocated from a prefetchable bus resource, and only a 64-bit resource
may be placed above 4 GB.

In preparation for placing some non-prefetchable BARs in prefetchable
bridge windows, factor out __pci_bus_alloc_resource(), which takes the
flags to match against the bus resources as a separate argument, and
implement pci_bus_alloc_resource() on top of it by passing the flags of
the resource itself.

No functional change intended.

Assisted-by: LLM sparse
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/pci/bus.c | 70 ++++++++++++++++++++++++++++++++---------------
 drivers/pci/pci.h |  6 ++++
 2 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index 655ed53436..65a54d6e04 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -188,9 +188,9 @@ static void pci_clip_resource_to_region(struct pci_bus *bus,
 }
 
 static int pci_bus_alloc_from_region(struct pci_bus *bus, struct resource *res,
-		resource_size_t size, resource_size_t align,
-		resource_size_t min, unsigned long type_mask,
-		resource_alignf alignf,
+		unsigned long flags, resource_size_t size,
+		resource_size_t align, resource_size_t min,
+		unsigned long type_mask, resource_alignf alignf,
 		void *alignf_data,
 		struct pci_bus_region *region)
 {
@@ -210,13 +210,13 @@ static int pci_bus_alloc_from_region(struct pci_bus *bus, struct resource *res,
 			continue;
 
 		/* type_mask must match */
-		if ((res->flags ^ r->flags) & type_mask)
+		if ((flags ^ r->flags) & type_mask)
 			continue;
 
 		/* We cannot allocate a non-prefetching resource
 		   from a pre-fetching area */
 		if ((r->flags & IORESOURCE_PREFETCH) &&
-		    !(res->flags & IORESOURCE_PREFETCH))
+		    !(flags & IORESOURCE_PREFETCH))
 			continue;
 
 		avail = *r;
@@ -247,9 +247,10 @@ static int pci_bus_alloc_from_region(struct pci_bus *bus, struct resource *res,
 }
 
 /**
- * pci_bus_alloc_resource - allocate a resource from a parent bus
+ * __pci_bus_alloc_resource - allocate a resource from a parent bus
  * @bus: PCI bus
  * @res: resource to allocate
+ * @flags: resource flags to match against the bus resources
  * @size: size of resource to allocate
  * @align: alignment of resource to allocate
  * @min: minimum /proc/iomem address to allocate
@@ -257,36 +258,61 @@ static int pci_bus_alloc_from_region(struct pci_bus *bus, struct resource *res,
  * @alignf: resource alignment function
  * @alignf_data: data argument for resource alignment function
  *
- * Given the PCI bus a device resides on, the size, minimum address,
- * alignment and type, try to find an acceptable resource allocation
- * for a specific device resource.
+ * Like pci_bus_alloc_resource(), but match the bus resources against @flags
+ * rather than @res->flags. This permits allocating a non-prefetchable
+ * resource from a prefetchable bus resource by passing @flags with
+ * IORESOURCE_PREFETCH set, which the caller must have established to be safe.
  */
-int pci_bus_alloc_resource(struct pci_bus *bus, struct resource *res,
-		resource_size_t size, resource_size_t align,
-		resource_size_t min, unsigned long type_mask,
-		resource_alignf alignf,
-		void *alignf_data)
+int __pci_bus_alloc_resource(struct pci_bus *bus, struct resource *res,
+			     unsigned long flags, resource_size_t size,
+			     resource_size_t align, resource_size_t min,
+			     unsigned long type_mask, resource_alignf alignf,
+			     void *alignf_data)
 {
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 	int rc;
 
-	if (res->flags & IORESOURCE_MEM_64) {
-		rc = pci_bus_alloc_from_region(bus, res, size, align, min,
-					       type_mask, alignf, alignf_data,
-					       &pci_high);
+	if (flags & IORESOURCE_MEM_64) {
+		rc = pci_bus_alloc_from_region(bus, res, flags, size, align,
+					       min, type_mask, alignf,
+					       alignf_data, &pci_high);
 		if (rc == 0)
 			return 0;
 
-		return pci_bus_alloc_from_region(bus, res, size, align, min,
-						 type_mask, alignf, alignf_data,
-						 &pci_64_bit);
+		return pci_bus_alloc_from_region(bus, res, flags, size, align,
+						 min, type_mask, alignf,
+						 alignf_data, &pci_64_bit);
 	}
 #endif
 
-	return pci_bus_alloc_from_region(bus, res, size, align, min,
+	return pci_bus_alloc_from_region(bus, res, flags, size, align, min,
 					 type_mask, alignf, alignf_data,
 					 &pci_32_bit);
 }
+
+/**
+ * pci_bus_alloc_resource - allocate a resource from a parent bus
+ * @bus: PCI bus
+ * @res: resource to allocate
+ * @size: size of resource to allocate
+ * @align: alignment of resource to allocate
+ * @min: minimum /proc/iomem address to allocate
+ * @type_mask: IORESOURCE_* type flags
+ * @alignf: resource alignment function
+ * @alignf_data: data argument for resource alignment function
+ *
+ * Given the PCI bus a device resides on, the size, minimum address,
+ * alignment and type, try to find an acceptable resource allocation
+ * for a specific device resource.
+ */
+int pci_bus_alloc_resource(struct pci_bus *bus, struct resource *res,
+			   resource_size_t size, resource_size_t align,
+			   resource_size_t min, unsigned long type_mask,
+			   resource_alignf alignf, void *alignf_data)
+{
+	return __pci_bus_alloc_resource(bus, res, res->flags, size, align, min,
+					type_mask, alignf, alignf_data);
+}
 EXPORT_SYMBOL(pci_bus_alloc_resource);
 
 /*
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ba3c3fdddd..8297cfb5dc 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -567,6 +567,12 @@ static inline int pci_resource_num(const struct pci_dev *dev,
 	return resno;
 }
 
+int __pci_bus_alloc_resource(struct pci_bus *bus, struct resource *res,
+			     unsigned long flags, resource_size_t size,
+			     resource_size_t align, resource_size_t min,
+			     unsigned long type_mask, resource_alignf alignf,
+			     void *alignf_data);
+
 void pbus_validate_busn(struct pci_bus *bus);
 struct resource *pbus_select_window(struct pci_bus *bus,
 				    const struct resource *res);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

