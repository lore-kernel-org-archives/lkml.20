Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99E3859DE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252702; cv=none; b=ImXKb8IYsnwLlwSVSA541JsKyjjGUgs5cuGi9rASXXy6CdZKpfDzm5+YcAPW2uRJ+Mdapxygrb3bW43QB2l6yKtm7h9OQMmbfO9FNi4qWH1v0QaIXBBRQTRGUB4cw8rJLdjBcE8rfJ5YCxd2+VE5eEBI2efoIvDJAm0sjC/A8wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252702; c=relaxed/simple;
	bh=1dljEFWF149FOJ57AsRvt4hi6edE+9V4/CmIdnlyfUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgkHrKPjv2vN/O5/ouR/kYLVZC6DdE9oCSo1+gR+yMJSKs+oL6DyapPk30ft8Y0LBChNDXwrjEXALl2jjznj444fNTR393KpI2c45SC2qRpBWfv8ur1XbXLSsoK02/vDnSL8Uvevbz2QsvsqhFK4ISGTBRhLyjtObjMg7GB+UX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iug3fpOd; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iug3fpOd"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a5f91ae397so6622a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788252699; x=1788857499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=538Bban5iOQuAF/2OvLsm8VbhbA6yCMNVAJAEEAo3ew=;
        b=iug3fpOdINmGu2RfRb4YgvwsYdqssuPR3VA+InV1MKWF+zdydDHdixSchCilpj6Yd2
         GDQmysmRINVJIU7Imbq0i5J0/DrI5rXXbtNquKlfWNLXgzUybMKV1xani1vEC8kWOAVH
         rocjNrWnAy1KkBQREXXhEuqiWaKSnqxlJKjHo8d4t2sPL2CIDuLsD9oJdb7jSDpKs8pO
         tEL8torlMtT/RYRLI6gClNHV/RaUVwrNArcfOrrZQafOcRqpkun8RZUSidzzr8Pd48ok
         Oyvbk9JhBwjJY0ov4h6BIxFNuY/4v3NyJpdObh87kbT6L5ufi0W0pnt1HExLdeskCr88
         5v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252699; x=1788857499;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=538Bban5iOQuAF/2OvLsm8VbhbA6yCMNVAJAEEAo3ew=;
        b=Kz1vLWf4NDSIMWM+RmF0aczTkXJhAKC4J9SspT0ZJkfbsnhO3T+s4g0Nl04y93X+/D
         yMrMA8AiTnZznoqgQVp74iL7kXmSSZgzu+gom/UP36PyNca5i++23zw9KlEOaVtmoA3i
         r/Je92cpQc2LBejMytTIzPqOGSbmr34H+AG9LnoU0a+HAR+AlQn1Pkjk3nljQ/V85QWm
         w6vHt+L7TNOD/KoMrVljUimbB3Z7G3gSa2ndDOc9XQxVkW94rXjjwdSk3u+hsAWKCom3
         yZct91zBGSlW51lNMgGA0y03pb+J3APQbdZfcRy4i7mgExD/Jgdyl8LH1DfuoVBntxOW
         NRSA==
X-Gm-Message-State: AFuF++mZ09aN9/ZDXssE3MfiEtGyHwdvzU/5AUWSuAsl4q3OPtyCdnAc
	51zH/79dLofaKOUvZtJayHZZFxDwADpRG2bu6ojRaEvscUcpQww9EcfyT+7yUrIZpw==
X-Gm-Gg: AYBFou0lx73QFVGs38ASNX8U6jjOHyHCbYBTbfLnS5dXgR8U/PMh0MQgoBqXCTN1gnM
	72GwwKIUigO4F8NDqKEuurIe9wemFs9QZGyKo7wVS+wjMu/qJGwp97aswoz0ciZyBKKI30diiUr
	b+ZKptAf1J4a52JnlVcz3Wv2RPy3F9/Xi7nHhaycQXwcNF7jf/TG/66vD4F5ubPQsK0eYywRQAu
	biet2KkONSTzV41t6xbd2yMkJZOuYdh2Tnt41PgDP8a+WPU6Y6rEGLCo76tOfD3aii8JuJa2Qvq
	HewthuljZVLnp+3QgFUWwzsG4WIZWyZXovCb0vWYcOkW5GcnUoF/P/qwvj/jFmAWSoF9vmGkUQQ
	wFdtm+Kx3SAb41HIoZbqfUDz4XEcMOGGMLkZlZPqYa8lrmlcoYP0TxBbylwhjxv11EoyEXOww1b
	B1cKfzNDXIkxfhe0XIQURK/20BOCIfhucWYE3MgEDB6TSuh8fgip2R9y6eeRHmfyken+yYWDBD/
	qW/fOTOS+S0LTCM2yHeqY7LoEuuX4vw/57E+bsx
X-Received: by 2002:aa7:dcca:0:b0:6a0:6677:37f9 with SMTP id 4fb4d7f45d1cf-6a66d5c18e0mr19763a12.1.1788252698938;
        Tue, 01 Sep 2026 01:51:38 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66ccdc50bsm466634a12.11.2026.09.01.01.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:51:38 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:51:34 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, praan@google.com
Subject: Re: [PATCH 5/7] iommu/arm-smmu-v3-test: Add missing error checks for
 inv array
Message-ID: <apaSFtf2xe-qbKbg@google.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260828125409.1921538-6-smostafa@google.com>
 <178792724271.3808739.15472225478426952013.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178792724271.3808739.15472225478426952013.b4-review@b4>

On Fri, Aug 28, 2026 at 11:27:22AM -0300, Jason Gunthorpe wrote:
> > arm_smmu_invs_merge() and arm_smmu_invs_alloc() can return NULL or
> > errors which are checked by the driver but not the test.
> > 
> > Add KUNIT_ASSERT_NOT_ERR_OR_NULL() after calling them to fail the
> > test instead of accessing NULL or ERR pointers.
> 
> I've generally had the opinion that if kunit tests hit bugs I don't
> actually care what happens next so long as the bug is evident.. Many
> tests can't clean up when they get longjump'd out like this too.

I tend to agree as that's how I use kunit also, but I'd be extra
careful around crashing the kernel from kunit as it can be triggered
from userspace.

Thanks,
Mostafa

> 
> So, IDK, it is fine but I also think this is in a category that maybe
> sashiko prompts should address instead somehow.
> 
> -- 
> Jason
