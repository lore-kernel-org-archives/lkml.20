Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D1A44F548
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725162; cv=none; b=Sto1B+gGlqithb5duIEbXg2IERI91wNFUu3Ad91C2MZya7XgNPWYaNbnFZMBlg+9k6JSBEGj0XBBqlnypDx6voNmc2whGteG8RFc2zqkdUdxIfyIJRTQPaoL8VYmrfPJUinYcaD0QdxGNXQ7Nh5rSW5I+Nh8Fjz+DsUCRDn9PxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725162; c=relaxed/simple;
	bh=6dWlJcRUVWB/btg8a37rt2O6Z0fre4eW+YeyFdlAyHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPlQq7E56Y1VKFphoZ8iaL6tMsYcjR1iDslQ1k31B28pdJBnX1EE3yAlSqrsAzYFwfC+Cw6BnwN1026QM6/JNZvG+5AvLTqY/xjBT2+QkSi62dDdgl4b61aFscW1uscUqZWc/OE1c1nKX59REJ4pRLTb4fKkXHF/KWBPnnGQwW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BdV1us/K; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BdV1us/K"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5338f65913dso13523461cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791725160; x=1792329960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVcr7aWiZ8GvYwkyY6ZnXaDcRM8rUn6uQRQ7DpHdIyE=;
        b=BdV1us/K4yGbQYecpLYWTOhtwex1AEvi0q7ntKiCc30ShQbZK8hgkZnbGHGUT7nukm
         hYaNkSigDgjqfJlb4NOtg4jLvdNeu+Q2lboyEMB0K7e3oD6Oqs+gKDC2+VyrKOygrt5L
         4C85wSvleT2gF2qlYy9BVihFebhssA6HcYlztg06Alj7WNHfsa5PTHJLzYckm/+Fy3Zp
         dbAKei+ZuNK+1vj95tdu4ItfUwOxbdVCpliHsbXmfPR3gdURie6FUls0GBcztdw0M8fC
         TJk70w3ZOwN0kSS2z5A+3Z2LNYiQDoT6aim77KLekZgDvqJOdrjw2xBTYgD8Zhoe37il
         PP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725160; x=1792329960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVcr7aWiZ8GvYwkyY6ZnXaDcRM8rUn6uQRQ7DpHdIyE=;
        b=V3Bw3/ryqBNN6Xtr8rqJ/lTLk6xW6drC9qs7s83JAp+8BJRTF/P2ibxAT9P8rJa98S
         Qm5c8U7aOKFfQFfXEF1KGcF5DBSaT4EGF2ct6GhMqOX4mR49TSlCUQmyEzJtkTwevaBb
         vgHe1DsMqoYKK8z8vGuqhzWOJetXwSTNyJqIPt4/XmK9dJZ8SWk+d/NO0YHMm+nIJkJT
         jPAlUhFhobyvVTCiXvyczYmJIxkgr6HcoWSK3FvZwmdE455nPIdE5+DRc9TMhtuktN3F
         kFjd5jY4ktYBw5An1QrgEFiZpVixB9I1YdrajiCZN5u0//8h6sXK4WDCNxP3HKuZ5F+g
         fjyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+gz49lYdZFa+WbMU/NkNooohYVLbUSb8ZMVWy9EgB94xN71IYvK+ZjAUgVNAZOjYaRPfHs8uCgPAR8xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2yWmsPEpFey6MsCCoA3mHm4XGydYnAPgy8pr8vKlIEYbQ8hyw
	x5NHAKUxKmRq/G1mb2Hzi/SHXpnbUGlp4d8wkOH617+9zABH9Ok7lwWtbtX12bTjryY=
X-Gm-Gg: AYBFou2bcd5Y79nqQYXt6K8J7Q8AD7msH1ReBMKXqlr2PFzk8c4+d9oeklwDLRB6HFJ
	M8/Hvka9STy81TqVrKia29IYjeDcc5YCgVkkod39V+dM3vzTQC69p0d4k2F8yfdqneqmDcp1+QL
	P4Omq3RwlZK79KrkU8lvR5fryn1jV3LS333gtPl5vnoh7mfBYjtndHejtwYJQcvlGxEfTqbmfes
	v1oObL08NBaqBLwe5SSpoF16zwO4MoaHxOFcFcYswOZX9ZY/eEOU7JU3ZgynpqKm8YMtY/ZP+r2
	fQ3Wh7Z19navWHliIhh2yhx13yxOqFVTJH0qsXZ1MSlDWSKN87A7zPrSOIxjsK2k+mkOD566y8i
	ufeJTQotrn4BQeVY6pI5U1olBuYqHjXVGsXZI9y1+VVvSmXpeWREoVHOwovoDQ2Nt6Z+twsueM2
	YwiMRr8Th5M3mFrQlSOEXC+UYssHBeREt3PVuCyT5OZvodsCnjcR8AB+kwJ932Kf5Emyr/KfL2B
	fdnsE1P6LKDFD3S54emc5FwLRQJw5aSxPqpHHOsSaQCji1Qrln6Vi4vpTRP+KJS8X88
X-Received: by 2002:a05:622a:e111:10b0:535:a5f9:752e with SMTP id d75a77b69052e-535a5f9789bmr75892511cf.77.1791725159958;
        Sun, 11 Oct 2026 06:25:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e80353sm71122656d6.1.2026.10.11.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:25:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xFtYs-00000003FEK-1U1k;
	Sun, 11 Oct 2026 10:25:58 -0300
Date: Sun, 11 Oct 2026 10:25:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, bhelgaas@google.com, jjohnson@kernel.org,
	johannes@sipsolutions.net, mani@kernel.org, yishaih@nvidia.com,
	skolothumtho@nvidia.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261011132558.GD14213@ziepe.ca>
References: <20260930140833.576941-1-jtornosm@redhat.com>
 <20261011075425.516927-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011075425.516927-1-jtornosm@redhat.com>

On Sun, Oct 11, 2026 at 09:54:25AM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi,
> 
> Since no further feedback was received after the last discussion,
> I proceeded with v2 addressing review findings (Sashiko):
> https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/
> 
> I remain open to suggestions and happy to iterate further if needed
> to get this acceptable.

IMHO this is not OK, building a new crazy hypervisor interface that
only works with the broken driver design we have today is not OK. This
is not some "quirk", it is a permanent new ABI between VMM and kernel
that has real compatibility implications.

Go tell an AI to convert it to
platform_device_msi_init_and_alloc_irqs() and then solve for that so
at least we are not getting trapped into a completely broken ABI by
all the hacks here.

The whole "MSI Caching" concept is fully wrong to be an ABI to a VM.

Jason
