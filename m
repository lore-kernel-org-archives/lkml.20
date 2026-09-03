Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DB540DB47
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430244; cv=none; b=Lqe4AmrH7ByqeS2g662qzmYyeSKehxXyMQWzkagFcoofMUv1NFsn23h4K8yYp8c8Pd/2O1m2eIPh7+vbF/tIySQqX0igkD1Vt1hhIJFCPauDpXKl0lNTzS6qZR8xvQzM4NMcPhMFkP9lZpVjE+SlYSB0VbKSkt9Pibnmk7EuirA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430244; c=relaxed/simple;
	bh=9ctY17ROWC1UecrpN6Iri7rIFXCRd3ly8uwOYRSqsgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9s4+R6Lt3Nj1LeQB7wcFsyz9X5yvgYk1lazKH4+W2kMp6iNhOfU68kd5r0dvIGSt4i5/xQqTPQNb80jUi2jC8f9thEJ6cIMN3korLCIp5UPAL3lECkQCCEqSvbrrPCvGl+ZH8XNNoIOBMBcApplhLOUNmanFEcePTDkZjn85U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z9UAe2XM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z9UAe2XM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so21801425e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788430241; x=1789035041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v+pGX1kR1YWXhGrmpKIk1Ega27SLYogpSDSn/oUaopE=;
        b=Z9UAe2XMOt5QmC6myRDdUG7rGhDoTyVcLg4qWDRC9zqDoVOJpNoCLhrdtbX1sfwBKb
         jRFH6sfWFa6/heCP76q4qNsIlttFKpItnCIsET4QcpOXWbgRYB2BaMtlep+084C6p75a
         dSxAfYQlNrZXTBVyYiXl2S4yuIzUKgpQ8clmLAsTnERgFy3Oznj9uAcrz5YSC4C87q8Q
         +KirPLVXhTZOXTNA9MkaGu0foCxRBSV7J3l5kD1LaoDWTtrwmV3bjfrpSVe88LWIFLVd
         fxbnN4Hcb84Cr8P2/06cirjXrN9fF+HXKdGb/EswIztDbOahnnEtGUUvvUV3O5WbSfA1
         R9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430241; x=1789035041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+pGX1kR1YWXhGrmpKIk1Ega27SLYogpSDSn/oUaopE=;
        b=V7fPONHHw6O++qxiPCPVoNcCiD16W/ET3UAj0UGZgS+d+0h826GnPSqGPJOlReWdIe
         VbDjvocZrt8Efz2OT5prSMp1eabafldaMjxizoKhYUNPx2xWRTMWZwiFqfuy0eIGBoTR
         zc+OSDV4ubQJ4q6A4nf5SLeofo6vGG4ZmfzLR+tx5L63emIbScf7dTn6r7wXqQblz0kK
         xyU0w3lNgfKqI/29LLZVPb/GnlffPNQ90ZpR+54yuZFm0jvXET+vW2dZC/RkJkYU8OQh
         JbZBDYVf00T5DoWSHylREikY1gX05jrvWWI50ls0ucrUa0TLhpscwTAQNN+/RRmWK1qM
         KC1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzy2rBIzkgJxYh4JWoZHY3dkOfnvDHt5PWessi29jYTSDq/unjgGz46FqV/4ZiLcHeCks07L3toTohaxYc=@vger.kernel.org
X-Gm-Message-State: AFuF++mDfUWqkya0q4tv8/FrEOcOE04OIzo/F6fTG+u9EEdR0XoreqmU
	bq6aDf7YjiBI6Cpv8C1aYk5ay5Qm280S1td24gFi7wfR4GTBl95lgNPnrlX+bM9u0w==
X-Gm-Gg: AYBFou2oe5YXH12YFIyDYlNfOt9qGXjmi45nMcQQcuiBmZBV/8FXoVIxkxOsGMi6Ehb
	QcnqYpQvKwU4hwDs/1HB4xw0hCGhZolzuMdYjN8eFvyQeU5WvDf06PLWI+2Qu99JhFwH98nd4XR
	dTE+101u3SIhikcBxpb8b0jUVusFosg7fcjPG5EPURYq1Eqt7aQ1JhfqfBFDoVJDAt1Dh0VnK9h
	cQCaGtto41cEmKrGjf7pW9RCMxlvqsL/+gMYglo7k3af7G+AvnqGoIEB38hhA/7hEaeDvo+f8Bf
	BdOmLdG775o/PSpRgiTLGTbdfbCxiZ9dhJZQKP+mvx1nh/tV+4j6Y2Weabxst8asHHwqONuSfh0
	6EYlQdc2DKnOWt0U8yjtMkqX1Atvkp8OOzQ52lAVavsjRU+dtnULAXQPFyYSPWrDJ37Gu+krJE7
	zwzswwdkZy/5AWkImq0i+zZJiLzFOcvqu+yG4j0wErATPdFMYdoby3T2DeIVNxwIgpani6EwN8C
	cMRsyDvpIPPsaOmYezJsNfilDFU6WnFI7Ft3cFM7ec9wQ==
X-Received: by 2002:a05:600c:1906:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49ce57e7a9dmr190171115e9.4.1788430240105;
        Thu, 03 Sep 2026 03:10:40 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf2531232sm33980375e9.7.2026.09.03.03.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:10:39 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:10:36 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Rob Herring <robh@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 09/10] firmware: arm_ffa: Introduce ffa-lend-pool
Message-ID: <aplHnDS2e-Cd5yPC@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-10-vdonnefort@google.com>
 <20260902173826.GC1440252-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902173826.GC1440252-robh@kernel.org>

On Wed, Sep 02, 2026 at 12:38:26PM -0500, Rob Herring wrote:
> On Wed, Sep 02, 2026 at 11:47:11AM +0100, Vincent Donnefort wrote:
> > When memory is lent to the Secure world via FF-A, fatal CPU speculative
> > reads from Non-Secure can still occur as long as it retains a cacheable
> > mapping to that memory. Introduce the "arm,ffa-lend-pool"
> > reserved-memory CMA driver to unmap pages before lending
> > (ffa_prepare_lend()) and restore them upon reclaim
> > (ffa_lend_reclaimed()). Devices bind to the pool via the "memory-region"
> > DT property or via ffa_lend_pool_attach().
> > 
> >   reserved-memory {
> >       #address-cells = <0x2>;
> >       #size-cells = <0x2>;
> >       ranges;
> > 
> >       ffa_lend: ffa-lend-pool {
> >           compatible = "arm,ffa-lend-pool";
> 
> Needs a binding schema...

Ack

> 
> >           reusable;
> >           ll-map;
> >           size = <0x0 0x4000000>;
> >       };
> >   };
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> [...]
> 
> > +static int __init ffa_lend_pool_setup(unsigned long node, struct reserved_mem *rmem)
> > +{
> > +	struct cma *cma;
> > +	int ret;
> > +
> > +	if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
> > +	    of_get_flat_dt_prop(node, "no-map", NULL)) {
> > +		pr_err("FF-A lend pool: node must be 'reusable' and not 'no-map'\n");
> > +		return -EINVAL;
> 
> Your schema should enforce/check this.
> 
> [...]
> 
> > +static const struct reserved_mem_ops ffa_lend_pool_ops = {
> > +	.node_init	= ffa_lend_pool_setup,
> > +	.device_init	= ffa_lend_pool_device_init,
> > +	.device_release = ffa_lend_pool_device_release,
> > +};
> > +RESERVEDMEM_OF_DECLARE(ffa_lend_pool, "arm,ffa-lend-pool", &ffa_lend_pool_ops);
> 
> Do you need this early? If not, you can create a platform driver for 
> "arm,ffa-lend-pool". ramoops is implemented that way for example.
> 
> Rob

Only memblock_mark_llmap() must be called very early.

The rest just need to be in place before the TEE driver probed. So a platform
driver should work.

Thanks!

-- 
Vincent
