Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBAA4A0157
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356904; cv=pass; b=feZ/D6Wsxt3rec95W4qt1HRtLfeEfculT9FBJK8wBxvh/JGPAYcA4Dnc/FkwDfk/+8CBxlrpUqTg0fzbYYztGsK5BQ8YP8rttwK6wfRyeRXG6h0jqv0PkWeqGmBsPEy6a3k/LYN6GwZCbn8UbU9z+Du0WdmfWdhvtaO0GHf5vtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356904; c=relaxed/simple;
	bh=+42ZwAZfWz6EQJuENr4K5+WECumrM9FQdFwIi3wiFxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwiYWWJyiP8YHku4Q5xxSV/ixwe2qJR8ru4kEjyZIV9xsxqr6psr0dFnRV7d+cNWFqHG2gw8hLZ9pQMa/rz0BOqyUb2PQSrR6FySQ6efGPPAxG06ESW8m8g8pnneDpq1iLZ0YzXhAt3+00i9f3gtDvSJaYZyqJV/kIlDQvGFSxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6aASId8; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6aASId8"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6d28aa26cso6673265ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788356902; cv=none;
        d=google.com; s=arc-20260327;
        b=caasPDncA1xD76UA2Ww+kIIO7rUM7etKRIhBkiQCpVPLlgy4/T6kr8oWUXimTO17Oh
         JW++6kJZbMjE4hhgdUZ2+ctCfaD8UNBOjBdQkbYve3BHpLGObXZnAVX/8TPq7cuSz3cW
         DbZj5yGEJFulI88yDN+6XdmR3HkCgZJ+Op+DmWAePB0C9jUQpb670KFIP3I0msLiYvef
         2PMpkw8aau4YTomy1RILLNYuwE/uWqEjRZAkK5pZ7US3bGkoPpztq9ymcp97K+ffepWX
         l+LjGwPxnpJDvg2ZCrL+vpPxxmYnKWSMxkllgfvBHb9TSsA8KIlqNIL5OrHNJVhHHwKZ
         EbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QypsYKIskc6MAKJkcpIiHDdNJyIbCg7f80xVvnLCTGA=;
        fh=pi1IOfma1rZy8RsIkdZCDcsF6dSJVaYclG641wG++a8=;
        b=jXxXdaGi55ZDqdnNofCHhWWjf/CoQJAa7VYmy8nOg8pwZjke8p3ZTHyftSXCGQP5Fa
         TgdjDYv86KSf0rutgw2LBAE1jAaF4R16u7SUFLBVzXIrXN1wvFnATy75TrIgRzpjq7iI
         UEO4L6MzDghy6LlxOI3GTum3pPaHCfV/r0FSLLKK7MmxM/BIOFWrPIz/YBop3B1u3jI/
         eXdMSVClNCBwbTqo+AGtAsq8Sy4BxMKbh7Wi6UfMdAYAOJSFgHvRxPNQLjaZEMvp8toi
         Px29pqEKsCvGdHeUU/Tw/FFZTfiIOcs/TTzpO2uoEBBaaaoiWebnuF1yXKlZFQX/H1vO
         JxTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788356902; x=1788961702; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QypsYKIskc6MAKJkcpIiHDdNJyIbCg7f80xVvnLCTGA=;
        b=a6aASId8aqvB2+KRMe9pJjrQ1agwbAQBrhmdHSntWyd5JTqxTTNYDzlgUjY5siunFd
         7n9XoZn8JNFq0VSqRTH777mdylreXiH0yTrdkqpMVT0zOWTd9BcW3xIgNd80pPy2/2qK
         F7ME1aWdKHEPpEtpmeYStoS5yBW+1+WDfZivwgbSbUJNayEpEVe7xSCGCY4+XKuQFPag
         SPns7fG0W9egC32WQVMhMN4/VSjgtXV2gPHeV7Uzigi1U4/1y435FWagnoJEjuM3bevo
         e2OSOzggTEPLiCWKVBUJLRNTCWeeZYeOg3gOJqhNPIZKNQ+D/4omfyVU1MK1IK+clcc3
         j97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356902; x=1788961702;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QypsYKIskc6MAKJkcpIiHDdNJyIbCg7f80xVvnLCTGA=;
        b=IZtHUvHJoAy+LooPYmSYp5qv6zPjudLOIZ88UsQFesnUUCmgQ6+B/5yfflPB4u6Za7
         MU+qXKbu+38Z9c77np6dKK8t4gZliUYI8mxqpLgYJZG1Yunx7W8BEHVpH3Si7nD21TP/
         EkUvJn9tRhNCfyQ5ABUuY+JpL75xyLdIgtW/dfQv9jgzdWWHTzA6bb1De+C8TNIsIWvt
         COY4c3FpYs0zguraNuaxcndotRJXjXPUr/t+GhJRJzDz5UgYQU+fY0PdUS+AW87+vr2y
         B5mFUaK6VlyxKgr7SP3LsjY6si9N/wNJodJui0Ecyx4Ev28y+sTCEEihduSj+ReU7WsK
         fhoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaP5eUyRbKwAIEQVEzdOvlZyfypykMtZTyCFAn+RIsnMaYkAsNGFBqONwSqNOCDpdQGVabjkW3iQlFIwk=@vger.kernel.org
X-Gm-Message-State: AFuF++n09/tGbKwNi/dlBR60eSeS+WrBd+kyIRT1c/xZpbVx2mdEOcd7
	k0T/8cB06jVpczmmuETnkiRJ/RVmkE5jC9Ffqm1NO2J+AEK+Tip53BZ9eXPvreWMAQTxDcrOnrm
	pfeoRNa+yFZvvmcvDvUbsq8kEUNhIcOU=
X-Gm-Gg: AYBFou3A5tG8+TyK0EsAPrG7ECy6RhbBa/cJr+bObBIPbYh7Vl4dHPGz4+fMkOQroUk
	/JmEBxPsISdABYBb+JG2R/hd8Q6Wxxgg/FzmaCGy1F0wwLC3kqMFN4uUkberaqUJb9+DxGSsGpj
	1fn7DTAHNZl97COYKdNPNGY1kCPZM+JtnjKWYAmh4VQRT/+cnQtdh+rfz+QhAqdu81mQa7walen
	PK2IEYH9id4saRukXWBmtJcFVNOhqXG2UZaXF/meQaIDdFsMgfLMfnyZ2ne4V46+mIrlSb1J70D
	8bro73pwHSktK7g9SimZ4CXkL62L2zBozC9KUfePasjFLEFnXbjdihRKkj9G
X-Received: by 2002:a17:903:19ec:b0:2d6:e4ff:9cad with SMTP id
 d9443c01a7336-2daec5ab9c5mr78487095ad.3.1788356902265; Wed, 02 Sep 2026
 06:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902085414.549830-1-qinyuntan@linux.alibaba.com>
In-Reply-To: <20260902085414.549830-1-qinyuntan@linux.alibaba.com>
From: Yee Li <seven.yi.lee@gmail.com>
Date: Wed, 2 Sep 2026 21:47:44 +0800
X-Gm-Features: AcwNN1UhpA6oUFXyIwwyE7i3ckphOc8Hf2zTXfKohJhd0MCGqD6y-NygI40bV2I
Message-ID: <CALX8JfSMTECqP4FY5T3WPBwF-+RPfdAnN9pZWO0s2E8OVOQMGw@mail.gmail.com>
Subject: Re: [PATCH] iommufd/selftest: Return dmabuf fd from
 IOMMU_TEST_OP_DMABUF_GET again
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Xunlei Pang <xlpang@linux.alibaba.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> failure, but the applied version also changed the success path to
> return 0, so userspace no longer receives the fd.  Note the patch as
> posted on the list returned rc here; the change to return 0 appeared
> when it was applied:

Thanks for catching it.
