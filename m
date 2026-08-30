Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7124333DED1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788128763; cv=none; b=MFQkso9E+bxVefVTnzH++L3JZQIi2uxVCagnBrPQ690hkEOOk8MvgQ2EVBcpeHinhHvJaI9RQQyz2ypP/p/uo/77naOubrlAwilT1btOdQTdrgt7Ibe12AQzMUjSifhQ28rDx5dSXsr+3snmIZXl/euh460vgougk+lIKf4om30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788128763; c=relaxed/simple;
	bh=eYkLIyGgWPcIoy3e3xVbeREvlu+Ze/t/CTB0JbVTaYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/VsrOtZS+l6XcrXRIQ4159nSQFhU7RuLTGz+HtV1wQ0odVxkVJRDYnbhY3mofsWtToylXh5GQHDf8H6MjC5nSq1ePvFjyrcXb+V512/XlAYCEXSqjbElj7jKZXQ25NaoPt5LXoa6Z/3GfQ3Ks9cCjTYlxQ0ogZOIkx2u3OhsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=aSbcVg1s; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="aSbcVg1s"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so2127454a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788128761; x=1788733561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N4VOB7vN3OvwV+J8iiBrOpYZoSx95jWtG3qG4ojcuCY=;
        b=aSbcVg1s3py2f0UjisYC5zBHYFSEJlBYd2C7Nh6MkHrha1rnrdcJhNFtGqzErQT96/
         6WHfRxjJw1INBrpJkfN32A6GTwaIW6JFV7mD5R8YDaDTbPL+zzoL5dStIh2kbvAtQwt8
         kloDhYKyDZRnSWTvlnAXjFQK7rWIVTEXUO2cJZUqIFyYEEDDS20KR10SztaXZDlbX8f2
         dLb2+y9qqW7RC7nvgxNyJ8b8DZlScXS9ajp99ojsNIQ98pYjpU9DaKDZSea32Xq4p5tc
         o1LbfXSVFQ3wv0JF4guj+bS9wdiRozDWMZE5jlNJYvgsJTaLnlL7QSKQ2t6s6eFiz/tl
         qq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788128761; x=1788733561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4VOB7vN3OvwV+J8iiBrOpYZoSx95jWtG3qG4ojcuCY=;
        b=Havpq8jt4tSssQWP/dGOYt5Gr5WBnlPNDhEIOKgZJk7roS4UCJSRJYmCtNaRaIipUk
         X/SLk29zqILanD0nw9B/RNiEk8DIoQbJ/Jvbs5vBd8TYVLeO+jNm/4MtdjfNWTTKkph2
         gSLvy0Gs2U39oJgt8sM3hRztSqM5itW2AHbg0Jx03aTyKbmqYHu3aNxx4u8ukjOFtKPV
         PTZGuqu8/kFQ1GTPLdTfE4xCcmJqKJ8MRq3kfwOBInCuXYSl/5o86GWzLDHAs3Gk+S5H
         RpG6h5g6zB3P7A3e/vi9cKyyByPxWON1MyLO0f7DbznzB3yvKRZrimyD84a4WzmWSBs7
         zfYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVG+0zAlR+GosqOD+txNBlhr2Ad7FQZE8kBrnXoLxEuXE3VFguHh0eAPwMlsj169PJ1ClAaQdUi4qczWI=@vger.kernel.org
X-Gm-Message-State: AFuF++mSSgHqfQYi6hp+lxTUm17yl0sX7rG8rLWyQyTe50XseKDxNhSk
	TPmPR7ZluVQaKE5qFDxEU13UssZNBGUXRwrLvFPQZzf3tUoY9s6NqILup4RgqfRfd2g=
X-Gm-Gg: AYBFou3tmdiL7RLmKtEb5X++ncr8o7zbTYF+nWh8CHbtKcS5DU1YDSLdEV2lXjyR8t/
	8r+VSah1i+dqf+Tm6YVPNtAfb7lPU4Kg9moFKJNmGAz9jxiWcQxOj7iv0W1RLVdOlwo29YBoQO0
	I3O8tBzQe/WjwbJtOxS1xInrjgrfdPRyV+mRekld4cSVaNG1E/NIJrRVPUxXdkOz+UidBofC2Tw
	+bnyFD6Rh2H0k8heMbxka5bdkLyzn6R0iWhmVPBDy1zFzWImVAtLhS+EZjj7KCxK+UmpTG1nTjX
	9nXEo4IDN9pi5SqPIPXkaqX1XOiB/XoJlgrI/pnVXqMFvpspIJb0dygFzlLSOTxk5h2zDnsz4P/
	/6lnWAz2pB98LOe0ND6RveKcwWvz/VX4o1M3IOgYlDx/WlgLwl51TekVkAR3tWvu0I9PfPgKk3p
	cdW1If9eWuKuQsdGQEPidEH54g+gwiSQLkfIatoTY/mEH6MqpW5dy1HllfnfRE4tzZTlY=
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr38854825a91.4.1788128760664;
        Sun, 30 Aug 2026 15:26:00 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:7a99::791d])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-142e0d40ac7sm22831103c88.7.2026.08.30.15.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 15:26:00 -0700 (PDT)
Date: Sun, 30 Aug 2026 15:25:58 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	randyj@purestorage.com, adailey@purestorage.com
Subject: Re: [PATCH v2 2/2] nvme-tcp: parallelize I/O queue allocation and
 startup
Message-ID: <20260830222558.GB1842415-mkhalfella@purestorage.com>
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-3-sgogte@purestorage.com>
 <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>

On Mon 2026-08-31 01:00:52 +0300, Sagi Grimberg wrote:
> 
> 
> On 25/08/2026 1:56, Surabhi Gogte wrote:
> > -	ret = sock_create_kern(current->nsproxy->net_ns,
> > +	ret = sock_create_kern(&init_net,
> 
> I don't think we can just change this...

Why we can not change it? Today the error recovery code running in
worker thread will be using init_net anyway, no?
