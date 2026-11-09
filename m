Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237686;
	b=jnmmwQiNd0bZPdRRi2UNtxCSKtIPUtFO3cfmOeehwbS9SbbPo0q7qXRyUgvsWocUbIdq
	 AZ2TW3/7a7sa1GBfRy3kAKtxnZHbAEmNpongW+W/lokahRm8kDjo++HUrSSfYwsDnBDOY
	 2eEH1OuZjJwh6WY9Emg88ahboP8MfYEllNPvhNQOdEOcCvfUhe0e+j1wyvEZ12Gg3E46n
	 2ZNiLygCYDQ1ucpWS5Ck9ZzcUQ0UuQBiGIThvJ++YA49vdWnIdxqqLRdTWOXqv9eQM2IF
	 qCD/TABMCPyUn08OLywBRBmCkdUnVsfHvZNMw2iV7XLOvMX6dpU374hZKVLiesKtPcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237686;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=8crq/UiYLrsJJ+qMvK6A+VfX9PSoBBb7GODx2Clpbnc=;
	b=I/BQSN6USr+wT5167dOvImP6vUZIsXbjJ0L9EfIy7vmUR+K6QbD1uMVORsZyJMboxYhS
	 iPslHcxfDMkGsOAL1pmmSlcASymCF0tpOR+rSTdszRsCsweTZS1YB3W6PDGuDCq86GvaC
	 t9jtRF6HRE6NwZ9VMT0tZ03KG+ZtEgb7FXPN8Yw1IN7IJEJ8LjhXVXX8ez9/nFw0H8juj
	 Ja+Totr9UKE94OBwzHg7y/KmGid1XEwXFYZlmQlE+VIYz3Pi1xsmgEgkjcRl6NjLBX4BA
	 Aqiag4f28brf20M4QDwsVA6KuLFDY4XcUla573q8Do5BAmfEFJswgQmsrW8qr2OFz7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hL6CnjOM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD74606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hL6CnjOM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247161F0089F;
	Mon,  9 Nov 2026 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794237685;
	bh=8crq/UiYLrsJJ+qMvK6A+VfX9PSoBBb7GODx2Clpbnc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hL6CnjOMBA5hKHdlLQi8Fss0vvSl1DnO7A2ygwRuxMrDEhjUROahNS/h/98JAzSdh
	 lTnwOQpAA2GeOS2brDsxEHFX6/s8z5zOgMbDy93quU/86kCroYdqxAoaiX70aewwbw
	 r8hSJx8G6oUWe/dkNppN/RU6S1OOEAcKL/8ti0CgkWwQx8G5GWyUepY0TK3av1KbFP
	 AEBe+jqcxmqMgOs/ZF4l40378MjxB4jDFQNH/BZ61zzfQvkBZxXH2B7d9Oi3hguUdX
	 XCn7Tf2gEy0crRej11NRkeKeHMDpvJmMsZY1bRO5D14pId1Mv0482NICGBfpOGCUBr
	 2+lyMpxIV9YsQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Radu Rendec <radu@rendec.net>, Anup Patel <apatel@ventanamicro.com>,
 linux-kernel@vger.kernel.org, Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: Re: [PATCH v1] genirq/msi: Fix the mapping race of wire to MSI
 interrupts
In-Reply-To: <20261017025420.792976-1-nickolai@csail.mit.edu>
References: <20261017025420.792976-1-nickolai@csail.mit.edu>
Date: Mon, 09 Nov 2026 16:21:22 +0100
Message-ID: <87jymmuj2l.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 16 2026 at 22:54, Nickolai Zeldovich wrote:
> @@ -942,63 +942,61 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
>  	 * don't do it again, or hell will break loose.
>  	 */
>  	virq = irq_find_mapping(domain, hwirq);
> -	if (virq) {
> -		/*
> -		 * If the trigger type is not specified or matches the
> -		 * current trigger type then we are done so return the
> -		 * interrupt number.
> -		 */
> -		if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq))
> -			goto out;
> -
> -		/*
> -		 * If the trigger type has not been set yet, then set
> -		 * it now and return the interrupt number.
> -		 */
> -		if (irq_get_trigger_type(virq) == IRQ_TYPE_NONE) {
> -			irq_data = irq_get_irq_data(virq);
> -			if (!irq_data) {
> +	if (!virq) {
> +		if (irq_domain_is_hierarchy(domain)) {
> +			if (irq_domain_is_msi_device(domain)) {

Why on earth has all of this to be completely reordered so that the
actual change is hidden in all this churn?

Due to that I almost missed this subtle breakage:

> +	if (type == IRQ_TYPE_NONE || type == irq_get_trigger_type(virq))
>		goto out;
...
> +	/*
> +	 * If the trigger type has not been set yet, then set
> +	 * it now and return the interrupt number.
> +	 */
> +	if (irq_get_trigger_type(virq) == IRQ_TYPE_NONE) {

For the first allocation one of the involved domains can set a default
type other than NONE in the allocation path. So if the domain default
type does not match the requested type then the initial type setting
won't happen.

+	/* Lost the race against a concurrent mapping of the same wire? */
+	virq = irq_find_mapping(domain, hwirq);
+	if (virq)
+		return virq;

That comment is really not sufficient. It's non-obvious that the
descriptor lock is sufficient to prevent concurrent modifications of the
mapping.

Something like the uncompiled below is less intrusive and avoids the
subtle breakage.

Thanks,

        tglx
---
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 4fdcb6df5306..10b0ac97b040 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -938,6 +938,7 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 
 	mutex_lock(&domain->root->mutex);
 
+retry:
 	/*
 	 * If we've already configured this interrupt,
 	 * don't do it again, or hell will break loose.
@@ -978,9 +979,17 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 			mutex_unlock(&domain->root->mutex);
 			virq = msi_device_domain_alloc_wired(domain, hwirq, type);
 			mutex_lock(&domain->root->mutex);
-		} else
+			/*
+			 * Handle the case where a concurrent mapping raced and
+			 * allocated the interrupt after the mutex_unlock()
+			 * above.
+			 */
+			if (virq == -EEXIST)
+				goto retry;
+		} else {
 			virq = irq_domain_alloc_irqs_locked(domain, -1, 1, NUMA_NO_NODE,
 							    fwspec, false, NULL);
+		}
 		if (virq <= 0) {
 			virq = 0;
 			goto out;
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index e1d85035dbc8..3fdad0063be6 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1572,6 +1572,12 @@ struct msi_map msi_domain_alloc_irq_at(struct device *dev, unsigned int domid, u
  * msi_desc::cookie so the underlying interrupt chip and domain code can
  * retrieve it.
  *
+ * The caller looks @hwirq up before invoking this function, but it cannot
+ * hold the domain lock across the call. Allocations are serialized by the
+ * MSI descriptor lock, so the lookup is repeated under it and a mapping
+ * which a concurrent caller created in the meantime is returned instead
+ * of a second one.
+ *
  * Return: The Linux interrupt number (> 0) or an error code
  */
 int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned int hwirq,
@@ -1589,9 +1595,18 @@ int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned int hwirq,
 
 	guard(msi_descs_lock)(dev);
 	if (WARN_ON_ONCE(msi_get_device_domain(dev, domid) != domain))
-		map.index = -EINVAL;
-	else
-		map = __msi_domain_alloc_irq_at(dev, domid, MSI_ANY_INDEX, NULL, &icookie);
+		return -EINVAL;
+
+	/*
+	 * A concurrent mapping might have allocated @hwirq already after the
+	 * caller dropped the domain mutex. Re-evaluate under the MSI descriptor
+	 * lock, which is sufficient as it is the outermost lock for both
+	 * alloc() and free().
+	 */
+	if (irq_find_mapping(domain, hwirq) > 0)
+		return -EEXIST;
+
+	map = __msi_domain_alloc_irq_at(dev, domid, MSI_ANY_INDEX, NULL, &icookie);
 	return map.index >= 0 ? map.virq : map.index;
 }
 






