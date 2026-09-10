Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AE13C09F7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028698; cv=none; b=rnDg4ztw6O+gBxb8TEih/aDNVM5CY8XHNtZlR9n4M5pymhgZztJHJDm28WDJQfMrJ9EcuyzeRV7C5j9JDQS3iJSFJpL7ODYhmpKHtFsfNT6eZCK83r8p7Apm34yGejn/g9j64KIWelITwI8hER47fXt9h/V7B84VspRou88KN6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028698; c=relaxed/simple;
	bh=B61a/cUbQjkdEQ7rffvXsppdLpcWQF9DSxMWIH8zJ1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtPvQEbD09gET3WKDpSYrC7NN5E1dFtWm/utM/H1kzxMfaFtneqTHh6ULERmTv/BTL/ufFuehy9/S2z0iLPlGLw4ZJ2GZpA/3USgDX2/fksQig9CHj4eP9U0cgHtyb0WKGEUSCj/Jycb2BDIXRr5GHhCmO5V76fWmMW83Ro/dkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FZdtiQUw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W8wj1OdR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FZdtiQUw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W8wj1OdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789028691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AAjQRLHTm8PsWE9qctbGP9z9U2eKfvK/IKb+q8cgC0g=;
	b=FZdtiQUwovCQLn/EZBfHYwXoUAjDRVX/B8whkFTAHLrHwPyaYaqFx0yJ3+Gz1s/a4dppU4
	2kteA55pAty39MvxP5xCjbWRGeBkZYry3IqXkpxyASMsQtQQ9POLu8C9060zLQBFYfrnGJ
	GYniwxzZ3aHxx/0nr0jWS+ITcT74IY0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-_Zb5u9wdP9WThe404DVF_w-1; Thu, 10 Sep 2026 04:24:50 -0400
X-MC-Unique: _Zb5u9wdP9WThe404DVF_w-1
X-Mimecast-MFC-AGG-ID: _Zb5u9wdP9WThe404DVF_w_1789028689
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49d1a778b9dso29087225e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789028689; x=1789633489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AAjQRLHTm8PsWE9qctbGP9z9U2eKfvK/IKb+q8cgC0g=;
        b=W8wj1OdRmoxonn9SPSZcG0cNZVZEqhEMiOZq+uzKeyNr3S7rRLX7s4HhOIYoNoZ/Q4
         4Edug06kDvuvTSYcwEURNhKo18QtF7j7Erl7ue0LSTeMeLupMiGa75NLNGc1T1iU68Ut
         4/EDmXBCGvTc7WSn9DrAukac2ntroSq9dL3z2T3bddJPa3DRlK9Pv4r6DrpXmdA8xTe4
         ahIsYL8pS9cDdMXGwe1OH2+97cpemnxgL8SExVZsNF46LHSt+NSQwiVye9i2cKGe9UY2
         s0ZBTILeEKM4sFIr+Llql4xbkTYuM+BCsTZ6RFsYBqMXp0grI8puy96XndoMrbENMfyy
         AyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028689; x=1789633489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAjQRLHTm8PsWE9qctbGP9z9U2eKfvK/IKb+q8cgC0g=;
        b=gsjgsWuQuROISZ0aj933k/G7AyCYcLXwWrizwuB+u2BRtOMqJIv/Pb7mhJBonpRU8C
         +WR6X9cOzMCY2j72C9uB/dBVDpbmlp6XM4PluaS4ooV221N+D2C+Ct4oLlqHDsRzDU3I
         3/jbQmkCJhnB2PRQFC/z+9J7Vq1eV7DNzPqQKRLXFmsgYt2dEu9H7lQ30fx0RdiJKaYr
         YQcJuMkVaGUL8MhbhX2FiQBhHH9hrj0F4KvCHG78evJbxfJTdbq+ELZt5wcrZQfolSCz
         2y4O6zrKHTVRAymvLNti54Uh86ODxExYc9OqCgvX96N5S/96rQPmsoSJ8Yd3t37QHdDX
         1YtQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5I8t3nG1iy6/sCYRXTzhP363mCdeX4RBboqgZxCrWQTXoTtmFKu+HBRiMrGNuDT47i+2mcozEsQYLT2E=@vger.kernel.org
X-Gm-Message-State: AFuF++mMlb7DYBhCifPvV0vwlSXsCVPQftsSkOIowyExqqKyG+ERVTca
	qyWb/b3pjWcNALUoKTcXf3PRX9A8tqc7DYkgLRadyHAkS0ykYv1sQ8xMLeIBIXlIiCHYBh9WPG/
	jQAfiSSt0aX1O6ft4DLSvu9vQz+1MSuIJxmY892NCgoM6qwbwq8U45s+bFsasjW1N3LRuVIpzZA
	==
X-Gm-Gg: AYBFou2hAaB5n5Q9MvF+31zaXAyLpxnU2UeqsjnJN0XEfWOiMEwafmnDMvn853r+bPT
	58PpR70NBfEtUs1l92ojY/TAQW4L39eLOXfkf5TIBlQtq1iT12ox/DZXL4g2qnlRHqG13oCCzvG
	a5RGFTsRSOQUmjjC293SuDFZD+LFj0fyre38IxNRu/lJUq3mMl/HNhlYwRf1LjAbI+dBSR3Hjyt
	OFqmrovPBPcjyzijWQDrYgWeJgyPFPEHUcdKEayfvIEPmcmV7D6e9oQuGjXFWngxB65iDVt8oqB
	tPzEdLbiNPBs7Hqg+AzmcjesMxyIdB5geJ9Db7iwYp3SpYGA2HMvgrGm2qKbd4RwFz9suyNQ6Fo
	CvHSLQTL/rGxQpbkuIiGUT2QQC0JXwydY0qykTfo/5/rqPQ==
X-Received: by 2002:a7b:cb8e:0:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49d2591889cmr81888725e9.11.1789028688851;
        Thu, 10 Sep 2026 01:24:48 -0700 (PDT)
X-Received: by 2002:a7b:cb8e:0:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49d2591889cmr81888065e9.11.1789028688366;
        Thu, 10 Sep 2026 01:24:48 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bdbb02sm50710245e9.3.2026.09.10.01.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:24:47 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:24:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Gokul K <gokul02k@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/sev: Do not fail SNP platform init if the vTPM
 cannot be registered
Message-ID: <aqJoJBNEpyKpKKix@sgarzare-redhat>
References: <20260821053411.1215497-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260821053411.1215497-1-gokul02k@gmail.com>

On Fri, Aug 21, 2026 at 11:04:11AM +0530, Gokul K wrote:
>The SVSM vTPM is optional: snp_svsm_vtpm_probe() returns false when no
>SVSM is present or when it does not implement TPM_SEND_COMMAND, and
>snp_init_platform_device() happily returns success in that case.
>
>When the vTPM *is* available but registering its platform device fails,
>the same function instead returns -ENODEV, after sev_guest_device has
>already been registered.  That is worse than the absent-vTPM case in two
>ways: the sev-guest device is left registered while the initcall reports
>failure, and the error tells nobody anything, because the return value of
>a device_initcall is only ever traced, never acted upon.
>
>Log the failure and carry on, so an optional device that could not be
>registered no longer determines the fate of an unrelated one.  The vTPM
>is simply absent, which is a state the guest already has to cope with.
>
>Fixes: e396dd85172c ("x86/sev: Register tpm-svsm platform device")
>Signed-off-by: Gokul K <gokul02k@gmail.com>
>---
>Compile-tested only.  Reaching the failure path needs an SNP guest under an
>SVSM whose vTPM platform device fails to register, which in practice means
>-ENOMEM during initcalls; I have no way to reproduce that.  Built at W=1 with
>CONFIG_AMD_MEM_ENCRYPT=y, and confirmed the file is not built with it =n.
>
> arch/x86/coco/sev/core.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
>index ecd77d3217f3..6501b6f7469a 100644
>--- a/arch/x86/coco/sev/core.c
>+++ b/arch/x86/coco/sev/core.c
>@@ -1401,7 +1401,7 @@ static int __init snp_init_platform_device(void)
>
> 	if (snp_svsm_vtpm_probe() &&
> 	    platform_device_register(&tpm_svsm_device))
>-		return -ENODEV;
>+		pr_err("Failed to register the SVSM vTPM device\n");

IIUC platform_device_register() fails only if something is really bad, 
no memory, device already registered, etc. so IMO this should never 
happen.

I'm opposed convert to an error message, but honestly I don't understand 
which problem we are fixing.

Stefano

>
> 	pr_info("SNP guest platform devices initialized.\n");
> 	return 0;
>-- 
>2.54.0
>
>

