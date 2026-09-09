Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BD8485946
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990159; cv=none; b=VrHfVK1XAFyhv+Redtti5uOFJ/OaXJ9UectXu9TYPRoyd1GykKK3g489LA5aVaspHhJ4i07GGgxLzjjh2xSoUkq8MU1Lrqpi+lynaZH8bGy4oJ9efawwu+WBh3ey6aj3/mXWXyRtTrTmWSNJi2+huxSgmroH6lAXoWOpdn72/GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990159; c=relaxed/simple;
	bh=+IKffq9pprORu/KuX01+OiN5RXzgXZE/Rip7wpReN3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvnK/JPLaNifWzcEb3g1zQJM3np1WGO5WFf5a0JQjvrL/m7KrU/SNI/XCXmewIebY5kFodVUtw1nFffUkbXjxWxVKbGe9I7crwk2Qabd5ojKTQpMJkK6pM+ALCYMSfL1fPgig0/h/nl9RHLdctJrF2SAhMjdkndsrsqHvRM8tdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vS/j6iG8; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vS/j6iG8"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so872776a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788990147; x=1789594947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qfRs/dMSlypvbxykgYdrURTYGjZtEsKfNPrWbGMlcPA=;
        b=vS/j6iG8qRxU9peeTkAmySsmp/RWuH0vYV5eFq1bgbrKisXYGbKuie/1/EdTUpOypw
         +E7UgYJFyE9EHFMWEbE9obC68U+g/LdltFLbMBUiTJEtpgJ0gGh6kTlUHl2fbPZd7qfe
         3YjN48sGoWaUbaML8G1jsNzt1GZ5MuRPgh41ChKBlC+mfWx7TVR5/BTArLwhftwArq2q
         z8D5kFoFqQb4dRb+6C7ddDZymeTdWjSSlgtqOji7Hq9kU6xT8ZvKdpsMNdEUkBs9og0l
         4PbTS7zIDiKX7VIBJXHu1IAbFwTlbAU+pCV0PeSiannWerJK+OOtGF5/EwWHluOBHQqT
         R2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788990147; x=1789594947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfRs/dMSlypvbxykgYdrURTYGjZtEsKfNPrWbGMlcPA=;
        b=hiqU0s4padjJSTBe6J8zB6PG8QRytOhY0RHoM13H2/2yCkQfFocq4UaCRmytzTxlOC
         uYXAdL7b1ArhbX6WydrSLJlIQorq+KCAc8yRyJLnUwVbsakOggYZ9G3C6cZ8jhI5Eezi
         YVoU/Bpf0+9W7DXzXg5s2uXJ/G3crpaL+nFgStJ1ufQrEbuQ54ZJmIxkHtZixtHB6jSw
         pHJdpzjTMqi8mVpCWRWiuyYTmR9td4I8vpsxjGd7BuKQjTG5t4nSrRq6L9UIhi5960A+
         vrrStExE/QMg9hnDaTy4jtICIeNhlcM9ZCloqdSHLXXdIcOAu+v81P2XVKc0YpUEqLHy
         8qpw==
X-Forwarded-Encrypted: i=1; AKwUvByuPjW02I9A5X24wH+uXNkUGz9GnUBoMSeqWi+vuDQP87+7/0IxxRQpKBTJR0BWC8wqdY4ALo+vHqPRnOI=@vger.kernel.org
X-Gm-Message-State: AFuF++mMODv8Toj1aVYredgURM7WRgp4A8+8iJWbQ8E0nuSB34uzDjeu
	aANjcDMF0RqDtAdtYhh20JQX+9faimwNzUa1jcyoqgWLax3fuibVnPFAp3t9qEKusA==
X-Gm-Gg: AYBFou3dYB0GRCu7fl0r9T1wKhDpk2AHu7G/kxvJNevuuO9ay6JhOvk1VOLmN2Fpywp
	8R2RXUo8QsxrRKYYxADE4Ey74LhlztahKc8jqRe5zQoQXYo8aT3QW3fMiX1lCRJ27Y0PA6aZXNW
	tDM+XH5na66/MnnoOXnURS01HP7XVrP8N4UfVQyiQ9IpO2VxR8ctIitiSfxdkkCe4s5+2JPakYT
	ZJykd3ouujBzSqiTmE3HPo04+H9BxqlZDmTvTsTemieo0oQU7CgRoKkfm2iAh4dRLAOB65k6TMI
	cJD4Y7vUMOBkGC/DNQmXqnVkagh/HZg+TF2dOWMufoDliEO+iFM+RDpMQBUtTlev2fBtrr3HkAj
	5Js8/3T27WhNWJS7H0uuKfThEen6bUPlFZ3J8NzYGikDK9AsAqMWm2YALgldYENnfNjJqdn8BwI
	cSv7GKhxw/gxp1P2MkWeqzXqocc1DLu6o7KL6+mUjnz0XodLH4nnEnew9dH/DZSu9l+pi+JJnKW
	baB9M6J9QA8YOVefJOSdnrETg7/a4jYnYlIpFrIHZhu+QzyQfA=
X-Received: by 2002:a17:90b:1d0d:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39d709e6ed4mr5411396a91.2.1788990146322;
        Wed, 09 Sep 2026 14:42:26 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7738ce41sm1430549a91.3.2026.09.09.14.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:42:22 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:42:18 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex.williamson@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm <kvm@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH 3/4] selftests/vfio: Extend mix_and_match timeout to 90s
Message-ID: <aqHSuljynlgmVxmN@google.com>
References: <20260901215358.2421359-1-alex.williamson@nvidia.com>
 <20260901215358.2421359-4-alex.williamson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901215358.2421359-4-alex.williamson@nvidia.com>

On 2026-09-01 03:53 PM, Alex Williamson wrote:
> Systems with firmware first error handling can see heavy SMM load
> as a result of the mix_and_match induced IOMMU errors.  For devices
> like igb that get wedged on these errors, the resulting FLR is delayed
> waiting for the transaction pending register to clear, which never
> occurs.  However, due to the background SMM, the backoff delays in
> PCI code wildly exceed their timeouts.  As a result, the whole test
> can report failure.
> 
> Extend the mix_and_match timeout to a value shown to complete reliably
> on such systems, with ~2x margin.
> 
> Assisted-by: Qwen3.8-27B
> Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>

With the caveat that shortlog should be "vfio: selftests: ...",

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
>  tools/testing/selftests/vfio/vfio_pci_driver_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/vfio/vfio_pci_driver_test.c b/tools/testing/selftests/vfio/vfio_pci_driver_test.c
> index 761bf117d624..1d532f944cee 100644
> --- a/tools/testing/selftests/vfio/vfio_pci_driver_test.c
> +++ b/tools/testing/selftests/vfio/vfio_pci_driver_test.c
> @@ -190,7 +190,7 @@ TEST_F(vfio_pci_driver_test, send_msi)
>  	ASSERT_EQ(1, value);
>  }
>  
> -TEST_F(vfio_pci_driver_test, mix_and_match)
> +TEST_F_TIMEOUT(vfio_pci_driver_test, mix_and_match, 90)
>  {
>  	u64 value;
>  	int i;
> -- 
> 2.53.0
> 
