Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A454442B21
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279379; cv=none; b=JopBy/s2bpE6Qw5SYggJJfRLY8UVw132/DAiNkD2JN9/n/AbVUNhzkGbJ91BSlP7SIwzUQebRe6YOkeDKecTtHfwjTos4tYZFov/BwwJ4Kv7brhXlEM5SUUi0BRPlGqnOWZvRrE3LZA5zNnkEmyCMF9GdFWbZUXwkJyHX1bWPDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279379; c=relaxed/simple;
	bh=eDOuu6SSu52TKbjWx6ehFX9DzfSBGnFG4ldHBQmydqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EX3eF5bePE8EnkX2inp5xU+Ucj8caluQZz8dZmvNcQ6knXWsXXnAEaP7/kOMFHIewnuRzsGxH0EeqtZjvBQ6/R6OKvmtvXKYQDLDNJkvP22RyPFUfaIu1fXLD93AenceMv1Ouv1EL9mCOmPkswtswl1wBv26NLuvTFWKTYgrz2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6Ll7cs7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6Ll7cs7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso35841175e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788279376; x=1788884176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sg3qBeJDPejirqtBPfSpWtNEMRQUM5xEwb+IRE4corw=;
        b=p6Ll7cs7LZhhhfYhmC5Uq2eKvjhG6DnFGcHMlrg38mvfkSZOxwu/Illqe92gXn7oDK
         ujRNKiY78StWqYXY40H7+isDnySn53TgaiCbMJXL9NM/A+Fuii3u2ybmwht+oFvWPG7W
         YO2v/BJfs5fe0U0z6IEZ4OJxTejoq4/TwvLonu4H6DRNXLne6UncaZ8d83PDGupQuQEK
         9gsXQSQlUfmgWQDHHoPVwbNwKbvpIJvy0rM/8oc2kShiVTzjyQ2bk+LKTczxpF0CHCad
         1JXRky/rGUXYn3UFAPLjqagDYQwIS73DsIa4pwDS57VTGwjuUuvm50OUF4ugVpnAVQAH
         Dt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279376; x=1788884176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sg3qBeJDPejirqtBPfSpWtNEMRQUM5xEwb+IRE4corw=;
        b=ZEF8cojuTzUrm8UOQiQoRyO5GNACdX2mAg+5icQMQUeXHWDb67xT+Tes6CmaKi6Vl3
         bEbqKfI3zDfjD7mIH6QGapzaEIZfplywzKFnx+1UCFhW/tqEwJXEhtT/jVOMkZFfzwoq
         iQy0IEEDYW7vs2m9VHhqe2LraiFIhr7yXAkh40KyU+HKLH+QEvCgDL0tSnnop18SvHYi
         X68+f5YWOM2RN9jQB8j2Pzjgs7ETOggcOrV6tzrtJXY9SBslyzPuG5lEnNEJyW0gVRg/
         XDhqk4P15pDDTX2FWLAaIZ77DkiFIM2pHj/L7YAIT+CvVFVlmNc34EwlGlNKYH9Vfq7S
         mi2A==
X-Forwarded-Encrypted: i=1; AHgh+RqTRMyrM/nNVYHO3FORagN52+T0BbjaT7gm+txyoQn0HrueAZKSQ6CLLz6sAuRJT5TUrB09PtCNUte7EXs=@vger.kernel.org
X-Gm-Message-State: AFuF++mhXOQmPiw1y0YE4GwAkDbCGSRfY0JBkZgnbqDYjGNsjVjBr5sg
	HTeA53CQ8VhbyvKuCztqgfS+12k/EkWrQB6mqEZ8x6vqfSehWzNFgHXb
X-Gm-Gg: AR+sD12PeqQTaOcbv9yIeUnRtec+aNEhwdh50Tq8Z/83TAfnAOA60liy0qTlpm2KFZ8
	FSUfqjkWS1qcp12CQv/tCARnYCq5ZaDL19g1ntuztuGZtU0cvtr1waxVLO+RgsMBsHWPeo8Q4UF
	F4rHIAZstD1WZnB9G4MqqTwnHq6zJRXhN88H9IuNPXZSlUau/fUGZiu1dNh9B5jr96wah24Nyrv
	nfHezF226ZwUdL8MXRpYzbS2WTdF03+xZpTDRgrDuv6479MqFDW3A8aD/Uwm6UKcjP3gIn9MHCN
	N9glcsHoztW2IcKtqi5w39gWKMjIoTKhEODCDJYTHTvWpf1C3eX41qttlBSl+DeZwpgQquvGbeQ
	2thwJM6HuS+ODduEJWNGz//wBuwujZTf3+xhQymtO/8MBHgRkP5sn+DaBkiWuapX6JogYTuhLvD
	JkeNISoy2mvESRaPuAQ0Hjx/NhgiqPwoQZ8tY5rCo0e0NBQWZgIExCaXbtq0NyHSBpbtmXgcIr8
	vw3Q6WWXOEUTlz5F9U6O2e+zwewxpSTNaEDJTNWsebWcVFL0J7UO2eUk/uEBQWZ1Alfej9txTkL
	h1QsjcNQrpDr/+bNv/HQHhDmbTqJQdwxK8zdvCi0usxIgHRawOgKeHuK5rD/30UKfjZ6tC52SZv
	XvhbcGQ==
X-Received: by 2002:a05:600c:c11c:b0:499:b65d:1250 with SMTP id 5b1f17b1804b1-49cdc422c5bmr176732735e9.2.1788279375445;
        Tue, 01 Sep 2026 09:16:15 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce365048asm17915365e9.5.2026.09.01.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:16:15 -0700 (PDT)
Date: Tue, 1 Sep 2026 18:16:12 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: set persistent keyring timeout before destination
 linking
Message-ID: <apb5_kMgDxSIviWb@gmail.com>
References: <bb0370340c671.1788111790.git.kmehltretter@gmail.com>
 <apbTc9BisLTqBaE_@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apbTc9BisLTqBaE_@kernel.org>

On Tue, Sep 01, 2026 at 04:30:27PM +0100, Jarkko Sakkinen wrote:
> > Tested with QEMU 10.2.1 TCG. The reproducer set
> > /proc/sys/kernel/keys/persistent_keyring_expiry to 60 seconds, restricted
> > the destination with KEYCTL_RESTRICT_KEYRING, and then called
> > KEYCTL_GET_PERSISTENT. No LSM policy was loaded.
> > 
> >                       syscall result  /proc/keys expiry
> >   i386 baseline       -EPERM          perm
> >   i386 patched        -EPERM          1m
> >   x86_64 patched      -EPERM          1m
> > 
> > Full kernel builds completed for i386 and ARM926, and for x86_64 with
> > CONFIG_PROVE_LOCKING=y. The x86_64 reproducer completed without lockdep
> > reports, warnings, or bugs.
> 
> Please describe this in the commit message and delete most of
> the text it has. This is the motivation part.

Got it, thanks. I'll shorten commit message.

I also found a narrow race if linking is delayed past expiry and GC runs.
It is unlikely in practice, but reproducible with an injected delay, so
I'll address it in v2.

Thanks,
Karl
