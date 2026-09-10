Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C173806DD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022945; cv=none; b=c3OEQsMHrtBP+WilZlUz9IbOGwZYeJzD4DWtOzKlnK5KlWPvc0b30cRnDwO00rgZqxg3ABcbaYbdo4FxSGaPO5vU9J16J0zigLjqDsAe/02k7EdIMrN2kyXNn1o6l4mB9O1v/MtbfhRfWQiDcQuuHdjYzdZEuJ1/+KdRe0JeAu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022945; c=relaxed/simple;
	bh=IMvB7Rw6zaKxg84+XQ+z79t9XRpVQGJdSj12MS8Pz2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mo6T9c9A2eh+ijmAm0z8Hwfjnz7VHe8PH8DVdqCE6WnkFZ1hl0nmc6AEhTGVvQYoS380myJiUx4cpoj9yokNbGRc6mtaLr6i/rQu3eUolHh0Qq9W917UGPjWs5d5lVkqC84tllKNYr9nxbEAwMmlv2xeV11Fv+Kiwr17QpSFqIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuIiMTh/; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuIiMTh/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so830706f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022942; x=1789627742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hvvqi1F7OSg7axX83WRLceC1+q3SHWfcWgXiSTOssgU=;
        b=WuIiMTh/rKEYFjH+CGV/dBKQRWvKiaRSXELFhj6qdDFBSURbRzbQeXbHPwLevNg7V2
         SYofzldBd9p8Dc1DMei4fJUBwu7IImwVhg0h3VpqnHro70oGA/ZZ1H6OkbVbF1yqaXER
         KcFPTi7dt4jbAxSG6rSawfWOrQ/Rem1sQ+Y0tLSHUKqgFBq0FcCui2fhptuEJrJXL72M
         hu1vKW+FTVewNQWO9H5f4OdXxDmRoYyHcMYP7GA308k7ySr5z2RKThRxsJkse9K7mKFP
         NNy2K1U3xduMu5Yoi4CPUtasn3vAtLabo8urPvDfb3kX/3/snwvCBqAAEsqt4OvttirC
         ipSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022942; x=1789627742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hvvqi1F7OSg7axX83WRLceC1+q3SHWfcWgXiSTOssgU=;
        b=ChPiXGlYOujEG3QGeZBR4iOrPsgB1EKqGvnDo5dZKmL2Ax8UBQdNpJIUWVpiQmHuz5
         /DsRkfRPqzqyITxDp+KScykpFSfKGKF4sYCro0awq7J6ivuSM2V/UO2s7QOR0NEohR/y
         TU8cvZNLliHrpnu3x5vXHRqL6BnJFlH2156NaOQ40OEvoIwf/D57H5VlkQ1Pn6/INe0l
         i/H9ivOIAFohvxgq7cuR9MwfCdG3zkegbIGtpUQ46Yr2OE2iDy1roktbUPgWwUt1XVFo
         mGJxCzRzPOO/A1JCVJzD0WBxhqRavgeRsn/JT4QLUW1fHOPv/Mo2iQd0h3Kh7xeMxxRc
         rXwQ==
X-Forwarded-Encrypted: i=1; AKwUvByIOzhtMNEUE80krn73KlWfoRsMT+eVaTIoTxJB3tuUQILEVE2pPBNmU/mI+/FecuiFNn8xVzVr6wXszXk=@vger.kernel.org
X-Gm-Message-State: AFuF++mFytDKb7CFZVpULz0zQDCqvuB7Xkve9OFMLNxdRiWYGzHvSA0F
	9iQCFbx78cqPbmTMizYCdMZOPyaZmRNBrsdVFYMeiSdW28ODigu7x6NO
X-Gm-Gg: AYBFou0uXX2+uwzpzncU5aeGjToUNybmU/ImRZX/Q/WsS21LnuTXbGLKc0tW/uCOjgf
	VdMkA9H5/gmcV/LnVOMbC8WQgX0pwcwN90yaArta6GkEPKOr7TWp+Oa3ydlJOFiV/TUJPUpgIp5
	FSeGa6MQy9Kfg0xvjrdxhdhiNePABZqGJdlqOqA6PaJ7a/OtPmRHDnfbZA0tTADfALgXA0UpEg9
	Qe7+RVpSEMmEycM/XX0SdgzSC600oYP8n3UUOQ6ooR1lq0WGZfwCoXEHeF+J80CeobK+qY8mwny
	BiJjQZ1gnwLGabE3b63ESFcz5aUl0qy8gYLilFtVX9JTLTgnVL1zSu+p4MMZnAa6qRMzXiKCUgq
	KqBFX2Fxi699C0LlrcrFcSH9hJEbKrflswn2CEuE9VxQ7q2s9FZsIbq0kqfRJ6Vf+QtEda8H4kk
	Ruz6THBjFxnhXXEi1Ap6o400wBYdBO8hA9fUNI4D9zn0Tii/GZgQFJRRZ2YsTzf1mOdtvZNRGe3
	WaLVPcUERTJCCnrGw/aoZ7QDqJa9PDp+XQkuuCbOCqhCCZrh2Y0oLgM+1TkwaoKzwNHSH0my+94
	omwzU2U0FfhlWmHJ6QLPSSEwIptPJhTBi4bDdISXHxTqrQfr58KAdMncZEHs9lBBKgCf+UcRke+
	vxw==
X-Received: by 2002:a05:6000:4555:b0:486:e5f7:89c5 with SMTP id ffacd0b85a97d-486e5f78d16mr666488f8f.1.1789022941516;
        Wed, 09 Sep 2026 23:49:01 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm37240838f8f.37.2026.09.09.23.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:49:01 -0700 (PDT)
Date: Thu, 10 Sep 2026 08:48:58 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: preserve DMA_FROM_DEVICE buffer contents
Message-ID: <aqJR7M11iFmK4_pi@gmail.com>
References: <20260910063620.17768-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910063620.17768-1-kmehltretter@gmail.com>

On Thu, Sep 10, 2026 at 08:36:18AM +0100, Karl Mehltretter wrote:
> This series prevents a DMA_FROM_DEVICE map from discarding CPU-written
> buffer contents on non-coherent 32-bit ARM. It is based on
> v7.3-rc1-324-g986c24e0fe44.

> Karl Mehltretter (2):
>   ARM: dma-mapping: preserve DMA_FROM_DEVICE buffer contents
>   ARM: dma-mapping: flush FROM_DEVICE buffers on legacy backends
> 

Adding Linus at his current email address.

Sorry for the noise.

Karl
