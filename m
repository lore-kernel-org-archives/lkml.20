Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F050B3839A0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267419; cv=none; b=j+pq5F+TqxOWtFU3NhFZJvcpP0RJot5qBztLAIobGrCKAcBX6nlielgWgMM3LrtGBJKdogup5dwkzfelXwbehXXBfAk/wSR8AAwChgrfVPxkHzw+KLGvD473GHOPUnYtl1Ob/M7DYXN5tm4YXlsSAidMIIZGBoIaKS9+S2HQuKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267419; c=relaxed/simple;
	bh=JBDGzc60077SgcewoR3vKPZnAOMKOUz6ytxF3+0PB5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DInLN2zOLkLBBvMylxXJELywN2CarmD/gr677MD9FwuugT6+f7k/wSBjwBBrcBT7mIsasGK9HIb1ihO5IxkEYRACLVYSC5akzRJNvWpCVFQ2Ebx8JFwY+vTkIYLz6yMkSIplIIwZd7bMbddJXfbIK268ungP8djmU689KVJf+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnhMYw4L; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnhMYw4L"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-673335b89a0so147680d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267417; x=1790872217; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Rnw2ZxPq8QQGfsa2N17k5WV6br+EhptPqyuYf7fWpE=;
        b=cnhMYw4LuxuOBbWH3PfSlx1kWrZeqhtB48vtrBha8irDkCv5oAswgyKQdAzK9mJcx+
         qKNzfpMP95ZBttd0RPmwka6/ibThNCNNa9MWKtiLPimiU19k7Ef0lLKTf0+uOxgYZHdr
         R2YwoBCO8MXEQ8XZVsAUs9rdN2HgL2KIYOoTcLkvAKrQJzIukBJ8mCVP5/VHr6dgOReZ
         nAR8gFT0LCYt+VrwVgO2BZh5Kq03My1l50UxawyBjAM30tbWqVq8SfVjBXgjdKcVD/Dk
         s6WJWb3aFi58vEusg2tG9GJmsUKvw1mD7rP4qrv5bDJVHnnY4cwFEpoIb2sACub7qpXF
         Ezmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267417; x=1790872217;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Rnw2ZxPq8QQGfsa2N17k5WV6br+EhptPqyuYf7fWpE=;
        b=UpQPmdDJQ2P3kxrC3xev3Z9iKanusGpJ4JfHjKcDZ/1jGNh3mKgzvKH3IeigJWcYCW
         0QCGQHhg6lo8uUGQiUTPhdhMw8KBq0lxl++rgla40TLm2oyFh4uyyLqScenBmVrwYnrx
         6N+ejhahK/Fvq1NMc3xMOnlEH5Ns3PADV3xVDYwunh30GdEBZb9odeFiKufG1XxT5U6H
         DyzkYV/DkPxSxD+QfWQF+d3nRmp2iwrooY+6pBaBCe+teaiYjsj2/0wf7L/9RDmzM+Oj
         nhCa1E6Txey2yZnEyiK2YASt9wb5wd8lb0djZX5SWqCK/LgI2cN782CmenAQklrfZo5g
         ofSw==
X-Forwarded-Encrypted: i=1; AKwUvByieA/0/MvPACai6QBou5LQ1WoZAh2dRm1CjdShycJkZ26GMgadvA0gh7dM3IBrphgEmSls0+/Ntvyz1CI=@vger.kernel.org
X-Gm-Message-State: AFuF++n2ub6V85LHNUW+PtYtikJe7RCe5Fs0Cw/hfPj/jV3NRHTmzim1
	HFxt9e2t5mTBvN6pbMeClgFXipz6a/8hwYqZAsGpd1MbjI4eT6yIs3qF
X-Gm-Gg: AYBFou2++SrqL6UieR1VxyHu+Y2B5TRUBjVwkfycdUOpCK5TTdmZarJMPf+5Z2Z4Kiq
	9DNEwzkbvRs8tGakj0xTijtO8BV2BgpqKlwSa7jm96ayQvFPuE83ZBES0uVOjv2DESZsybn9AeH
	QzGzM5njxhfnMjvIGGwrUJqJjsjcdr3N6yzzcjFdKpz+hYG7/o8JO6lupth5vOexSlVdQRXHFl0
	10lVnIzoLgWFbEYxZFJD4EoAs0Vi4eMpOqrc3UDdDrsK8cRZ3UjQvFtlnmhmCWY1K8wQfWmZQoZ
	+mD0ZdDIFx/qSnSylgrPrelOLZGw6FWvMh6EH1wr291tdwNzBbDX83lcC0WX9wZgHKlQBQWhSwk
	7dzhzrsVH+xZlBTD3rpTI8KxZzdsjZvxw0WimcIjWZoYpPpUSQl2SsEZ4CcpmB0AkX4sqk5goJs
	pphV4HATpoJ6M5Ax8Abc9bK02Jgqqv7ySJ6hqKVDGQ8z34dMabW6hGUI6FJrNm64Eu1KkOlze5N
	3Xu
X-Received: by 2002:a05:690e:12ca:b0:672:a450:6932 with SMTP id 956f58d0204a3-672ed36dbecmr2089408d50.70.1790267416650;
        Thu, 24 Sep 2026 09:30:16 -0700 (PDT)
Received: from deathstar ([2600:1700:22f5:9081:10c5:856:4833:d269])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d81ce7dcsm2254959d50.18.2026.09.24.09.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:30:16 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:30:13 -0700
From: Matthew Wood <thepacketgeek@gmail.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Saket Dumbre <saket.dumbre@intel.com>, Len Brown <lenb@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Bob Moore <robert.moore@intel.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com, kernel-team@meta.com
Subject: Re: [PATCH] ACPICA: Fix memory leak at acpi_ds_create_field()
Message-ID: <arVPNWY3HziZkU1p@mail.gmail.com>
References: <20260813-acpica-pcc-field-leak-v1-1-3d6c5f0eb557@debian.org>
 <CAJZ5v0isQYRN9aZCmWty-kZpjHvZWyJT2AnRXs9RDszy7b5TkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0isQYRN9aZCmWty-kZpjHvZWyJT2AnRXs9RDszy7b5TkA@mail.gmail.com>

On Thu, Aug 13, 2026 at 03:39:37PM +0200, Rafael J. Wysocki (Intel) wrote:
> On Thu, Aug 13, 2026 at 3:35 PM Breno Leitao <leitao@debian.org> wrote:
> >
> > acpi_ds_create_field() allocates internal_pcc_buffer for operation
> > regions in the PCC address space.
> >
> > The function runs once per field, so a second field on the
> > same region overwrites the pointer and orphans the previous buffer.
> >
> > The matching ACPI_FREE() in acpi_ut_delete_internal_obj() only ever sees
> > the last one.
> >
> > An arm64 platform whose SSDT declares regions with multiple fields each
> > leaks two buffers at boot, as detected by kmemleak:
> >
> >   unreferenced object 0xffff000051e65400 (size 192):
> >     comm "swapper/0", pid 1, jiffies 4294668436
> >     backtrace (crc 0):
> >       __kmalloc_noprof
> >       acpi_ds_create_field
> >       acpi_ds_load2_end_op
> >       acpi_ds_exec_end_op
> >       acpi_ps_parse_loop
> >       acpi_ps_parse_aml
> >       acpi_ns_load_table
> >       acpi_load_tables
> >       acpi_init
> >
> > Do not allocate a region if it was previously allocated before,
> > preserving the current design, but, not leaking memory.
> >
> > Fixes: 0acf24ad7e10 ("ACPICA: Add support for PCC Opregion special context data")
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> As per Documentation/driver-api/acpi/linuxized-acpica.rst, please
> submit a pull request with this change to the upstream ACPICA project
> on GitHub.  The Linux patch will become applicable when there is a
> corresponding commit upstream.
> 

Hi Rafael,

This change has been submitted, approved, and merged in GitHub:
https://github.com/open-acpica/acpica/commit/c71849d476bb5f97ca1867849e893368e12a69e6

Can you please review here as well? Thank you.

Regards,
Matthew

> > ---
> >  drivers/acpi/acpica/dsfield.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/acpi/acpica/dsfield.c b/drivers/acpi/acpica/dsfield.c
> > index d7d56cc600d31..f7e503bf57c87 100644
> > --- a/drivers/acpi/acpica/dsfield.c
> > +++ b/drivers/acpi/acpica/dsfield.c
> > @@ -522,7 +522,8 @@ acpi_ds_create_field(union acpi_parse_object *op,
> >         }
> >
> >         if (info.region_node->object->region.space_id ==
> > -           ACPI_ADR_SPACE_PLATFORM_COMM) {
> > +           ACPI_ADR_SPACE_PLATFORM_COMM &&
> > +           !region_node->object->field.internal_pcc_buffer) {
> >                 region_node->object->field.internal_pcc_buffer =
> >                     ACPI_ALLOCATE_ZEROED(info.region_node->object->region.
> >                                          length);
> >
> > ---
> > base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
> > change-id: 20260813-acpica-pcc-field-leak-8f676f55179b
> >
> > Best regards,
> > --
> > Breno Leitao <leitao@debian.org>
> >
