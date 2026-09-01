Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665453DAAAE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278811; cv=none; b=mvXaUij6Y9fEIVCIMj2eHJKNkjRmqYWG7oXQfctyEKCwnKQRRQQQbJxPKBsh0bkbsaXppXFeM2E0cMi6Bquulxj0ZNLtdl5Uu8LELnDc5OnsXdBkel+mcfogDsaVkGP2aaVyb9w060TddPR9LzcirSQejSZxvtAUU1RJM5LUim8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278811; c=relaxed/simple;
	bh=q44ZV+VsKxN6JVRQY5u21IK1dlCmX3i+WcEkxuAqjPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7d0oEpirPEbyuuQLU/VSdv1Ao6yDtTI8239YmY4lN7B1eol8N3mhhDx3NeuOw2Uo4iFlY92lKxDUfibzswind13iaCOmbXuGA7LcOWt8QH+IEjx/3tVjuiJ+f1E6kgPZXC/gG6f5Q3KVVhk9x9stmbx73BBQ7v5wwo1Mt/MZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RMeAPZbT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ozPbe9/5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RMeAPZbT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ozPbe9/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788278809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ePc7Ut/AZztzEtumFTcDNqc3j4BQeQVeG9iOBqVe9vA=;
	b=RMeAPZbToWOCNn7yNWQbPWOc/0RE5mqkbiFt9Gqyejbrev5dCyB18Nu3aYLkzoN7J75M21
	OFFFg8T6LfTE9UNuyabUWpfDMprFnQxSb8gE4KDSnKFDVK/535mJ1lYXslG/bFD08V0C9V
	U/RgcwnoDfW54cO41a0u4ngTtrcgWdw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-wLbBrvj-MJyvoGDwLF61kQ-1; Tue, 01 Sept 2026 12:06:48 -0400
X-MC-Unique: wLbBrvj-MJyvoGDwLF61kQ-1
X-Mimecast-MFC-AGG-ID: wLbBrvj-MJyvoGDwLF61kQ_1788278807
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f6e8b5996so35538f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788278807; x=1788883607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ePc7Ut/AZztzEtumFTcDNqc3j4BQeQVeG9iOBqVe9vA=;
        b=ozPbe9/5WDwGH1fWjT0773KwUQi8GCMJLM7ImUQPkyfOB79ylGpaYfaWDF1+01OeWV
         UUD2UpX/xC4K5jq8hPUC+MySGszejvApt+jNJJeb491AV1Pn+eTmJVn1hjiQC7z2YUFL
         WP4c0g1gtuKYLtWxoR3d+u1F01A18dQ4PHNCpfd/+dmQngwZuENEdRFCMq1SzRDkoYic
         NNNZePL/NFzY3ueWXjegn5hEwnWDwAIpRfoEAJViQZ6tdRqVxpFrf6O3q0jFaZFZj2Ii
         cxW3pewgwpPwEc4+Efyc5dq4q0lvqHaB3rEJ/ge4GZtra+lRAsMYJaxWfQi5Goktkc8b
         tvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278807; x=1788883607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePc7Ut/AZztzEtumFTcDNqc3j4BQeQVeG9iOBqVe9vA=;
        b=MEa/Pth3LUlBGE3Nmfn6r2l8MJPNyh2ObXWL4aTVYx55WFR13x4ldYI2rBzn167aTa
         1R5iRqpSoIoSQACH/RKyxmi8x2y5xQD+L4Ch9nowtBaUL2lIHQzVruPCowRVfXisHeZc
         qhwJ5KgVcXF4WH/ekUg5ZijXLTg3hLAoVpje/+qJkGlGLuQo9ST2ij3aEWLW2W3wN19w
         OmymMEjbnRlumvkq1vVpSJYTTiH48pbcu1DC8RI2bEjepgzLe/rHXMOy8NVbh3KuvUfO
         tB994uJ+eUJfDJFmJeqj3xY5KZbNRG26KACcGlxnYwerc0h4ysrckBidD94rfHJFTJsv
         e19g==
X-Forwarded-Encrypted: i=1; AKwUvBxTXgxRc1RKz7uufbK2LYXDbIZt04T0p/sdMtpZYw4jLplXLcWQ8zoEFIgBtNYJSkNQM0taI3qlyUK9SSc=@vger.kernel.org
X-Gm-Message-State: AFuF++lwR1IUFMT01cFv/eugg8IeyUdR2bXO/reA6wQfPMtTsHqh9DWe
	2HDQN9edXeWCVj5LCGWWvS7uccjVbuL+4p+jGeRLS3MLdvYIuiVMBwuL0JihfPDGNGz941XCck7
	zBub0UzOX9P9nXO0x7tx1lSZ26bwUZ9Dg8Hzy6ZmHpZmgElLoGL/eudMQwY1LSXgl7w==
X-Gm-Gg: AYBFou2VHI3vMZRCaP13+BT66A0VABkEFYVM8jWpRhJo052XCGVV9ynqsit6fZDrl2F
	acC4WkD+n2dGHd67CcMerYfBXL4qAIKLYaVJug8zAkJ9tScpxCWv4N4xwivOxOeBf0RN6MlLSbu
	zGWwdGzP/xi+ZtShHHYuIf4PSDantBvX0sazmqVu1U46Jy5ckqAAD5Qw2Tp554Gp84wtI3ywTnZ
	41JO/iCMd7M8jDU1VSsZz8xkgf9HuaocyPgb4xiY0EqZydg2hjH0smDACJVjCln46vEPrm5ziQr
	tRahdxgCKdsYCnE16WAKperisn9h/D1BlvCnY2ObuQ90VqvWh8pvx4dq8qi9zkKnrdJObwdSc2N
	5MZ24yh3KK6T+WCUDajxaIocPSFAzIYxpfGCMQnWAZH5PVw==
X-Received: by 2002:a05:6000:470d:b0:482:e8f9:c6b0 with SMTP id ffacd0b85a97d-482f79b1e7amr57844689f8f.13.1788278806691;
        Tue, 01 Sep 2026 09:06:46 -0700 (PDT)
X-Received: by 2002:a05:6000:470d:b0:482:e8f9:c6b0 with SMTP id ffacd0b85a97d-482f79b1e7amr57844520f8f.13.1788278806034;
        Tue, 01 Sep 2026 09:06:46 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d787b8sm5977548f8f.29.2026.09.01.09.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:06:45 -0700 (PDT)
Date: Tue, 1 Sep 2026 18:06:40 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Stuart Yoder <stuart.yoder@arm.com>, Chu Guangqing <chuguangqing@inspur.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tpm_crb: Remove dead code from crb_map_res()
Message-ID: <apb2LdIAqUHROYBt@sgarzare-redhat>
References: <20260901142955.187856-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260901142955.187856-1-jarkko@kernel.org>

On Tue, Sep 01, 2026 at 05:29:46PM +0300, Jarkko Sakkinen wrote:
>In all the pre-existing call sites both @iomem and @iobase_ptr are
>either NULL or non-NULL.

I don't know this code, but I'm a bit worried about iobase_ptr and 
*iobase_ptr. IIUC it is true that iobase_ptr and iores are either NULL 
or non-NULL, but here we are removing the case where *iobase_ptr is 
NULL.

Now looking at crb_map_io(), IIUC iobase_array is initialized with NULL 
pointers and the code we are removing was the only one initializing 
those pointers IIUC, or am I missing something?

Thanks,
Stefano

>
>Thus, add invariant for this and remove a dead basic block.
>
>Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>---
> drivers/char/tpm/tpm_crb.c | 9 +++------
> 1 file changed, 3 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
>index ceb4100ba400..e7a61f36c58b 100644
>--- a/drivers/char/tpm/tpm_crb.c
>+++ b/drivers/char/tpm/tpm_crb.c
>@@ -570,15 +570,12 @@ static void __iomem *crb_map_res(struct device *dev, struct resource *iores,
> 	if (start != new_res.start)
> 		return IOMEM_ERR_PTR(-EINVAL);
>
>+	if ((iores == NULL) != (iobase_ptr == NULL))
>+		return IOMEM_ERR_PTR(-EINVAL);
>+
> 	if (!iores)
> 		return devm_ioremap_resource(dev, &new_res);
>
>-	if (!*iobase_ptr) {
>-		*iobase_ptr = devm_ioremap_resource(dev, iores);
>-		if (IS_ERR(*iobase_ptr))
>-			return *iobase_ptr;
>-	}
>-
> 	return *iobase_ptr + (new_res.start - iores->start);
> }
>
>-- 
>2.47.3
>
>

