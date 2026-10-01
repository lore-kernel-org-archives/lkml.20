Received: from mail-oo2-f28.google.com (mail-oo2-f28.google.com [74.125.231.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF22F7EE7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874909; cv=none; b=J4086lH4ZHM2nCo0g8jaylkP6cwV2tlZi5GNdOzGADP15f5hNZUsLhayBRXEgE6GcT5sx60k9yF88tA2aBt2rliAoUA0vnjoQpXVs6HMQKU2UQM7/XkXWQiJ936OGUjUOiuODybSYKVdAHqpS68ilysU0RFJwVLjPBJFlg5WTkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874909; c=relaxed/simple;
	bh=a7oq1MIgLZQaYmPsWc/dtcP0sMS+eH9o/8iLzIQIc/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1Zd7hBqx6ifehbc+DrKSnT2b2dtdWDfwDId5+nqklJgr4QAT5svYDylPWt+q2AsiE6A47TDueg6VUk7elaE56r06cJzQsCXK7a3q/0V9atJNC1QRfp5M85GVeXkmTqOfk+WCXQc8eZgT4Wu35HdzDFl4sWssTe6rXXcE9lTWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LiMyoth8; arc=none smtp.client-ip=74.125.231.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LiMyoth8"
Received: by mail-oo2-f28.google.com with SMTP id 006d021491bc7-6ca35deb7deso674839eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790874903; x=1791479703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t/6p+zYx/lSA8o0kTLIaLNlPefSKg05wX6rF51KJFNw=;
        b=LiMyoth8etbND3MNQwHkSEaJ+HRDwN2uwRaewq7vz7DMUR87ukAlz/idYFO+9P6q+F
         praczIlNXVUo7jpkHmQrcQSqHqJd30JN6mwusqmR5YmITRuzCwAY1SH2MAA3lHTAxxHo
         faGoT3BQxCP6RyuF8r8RHTRZIN1Ph/QB1SVB05+al/6VVF3S276Y/hxw1gLp+1oFhFCs
         lmZ+9tOAyzFeR6sKKWseaDtFdWeWBhVmsqFNOHFVT+ePvsahskBDp+eAee0YutmzEMYi
         lXWUnFYXBSu+OFBL88bdW+EF4UaSB6nQY5vV3JPLiXRtYb8F4eCw0g5h62Cc3OhIQKcW
         5wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874903; x=1791479703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/6p+zYx/lSA8o0kTLIaLNlPefSKg05wX6rF51KJFNw=;
        b=pvPjXqQbw7wPz9fYsm5OW9JKGh4o/QK2nXy+bIxm/Yu+81ZyJvCpdG4tnKorlFS2Ew
         LszkSuMW8adJ3z2MHWRy1uU11yEUVYBnmpCOysrCw7fLPj3qkXFkSckplg652J/k8rl1
         pGNxGJbR+8fdHCdlqOhXLXn/de8bifDAAaas0w4uc4PqBgCnHSOj0XnPgq0RKBuwqday
         gQXuF/iqYqu0N5QJt1dy/uZtEvfGgoKoELQfjtEf3UkxzZKi+rvev/Ni8e+0a3wX71Gy
         FPq2cBCu66BzCKyvQ2nXESNNXQrLGVNPvpsE6hzpBfCTfb9K+bSMoWqiqudqba/yuNXx
         tb7A==
X-Forwarded-Encrypted: i=1; AKwUvByy/AofuvgnwV8rJOFNNPmST5nHRm9l4nbOjXI3CsE37YbjIp4BXRM0PDn4cHMWtWPYWcaYokuRRLPYDfY=@vger.kernel.org
X-Gm-Message-State: AFuF++kieE32hOKT0KTTtnqRXY/UnydXv8b1nwCKtfiHEtfRuWcECOGd
	bSSGP/vM2FEnUi8fndqOGwi8ZmOq8lKVCw62CFKV701krm8njwlvgUGdnrWLMwHOSyU=
X-Gm-Gg: AYBFou2SXe6p0Cdz55eAawiYti9rKXEU/cRUCXri2eWDkgpe3l1NEfY2sp8sNZ4rLCi
	IAJW1RaFNBpS9HB0J1bQowMeotFaqs7TguoHw2/nRV2HRVu3pZTIpNmBC66yUCVZaFTKy2C1de6
	LK+qK10wJHSoelhSeWf1+Wbk6ie1AtPhxOu9PkZj3HhzwSR2bDlMHD+XE/YwRFN5wdoCwtY11xn
	Hkca0Ewd3oj683eODU0x8zch/v6Siewe8NrWH9YnO1azi5/wQz9nt3txDg4FHtnAuzCl0AwhexO
	zPWbE58O8Aqb9IUo1Jx2pVWTWHjAaMh/QD3aGffo/Qr7LA6znYgNLX9ifYnEYxPKVfiVRK0omHa
	XCj2JV4AncNuDPsTcph9f9Ay3hRwef5hXifP8TOsUAX0NreOSWLjtobVI2eSTH0gP7VS0+mU8N/
	YOWpFNgrpRBN/EmhAW5mambu6rcwsIGp8U+yYihJcq0huE
X-Received: by 2002:a05:6820:f025:b0:6c3:32f0:6307 with SMTP id 006d021491bc7-6df32aa7ec9mr9152eaf.12.1790874902929;
        Thu, 01 Oct 2026 10:15:02 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6dd97aff835sm3239083eaf.6.2026.10.01.10.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:15:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xCKN3-0000000EaHJ-0IkU;
	Thu, 01 Oct 2026 14:15:01 -0300
Date: Thu, 1 Oct 2026 14:15:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Fred Griffoul <fgriffo@amazon.co.uk>,
	Connor Williamson <connordw@amazon.com>, ackerleytng@google.com,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
	vannapurve@google.com, erdemaktas@google.com, jxgao@google.com,
	rientjes@google.com, fvdl@google.com, jthoughton@google.com,
	tarunsahu@google.com, pratyush@kernel.org, fuad.tabba@linux.dev,
	Gregory Price <gourry@gourry.net>, yan.y.zhao@intel.com,
	michael.roth@amd.com, suzuki.poulose@arm.com,
	Christian Brauner <brauner@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, aik@amd.com,
	aneesh.kumar@kernel.org, Vlastimil Babka <vbabka@kernel.org>,
	kernel-team@android.com, kernel-team@meta.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 01/17] mm: shmem: Implement guest_memfd provider
 operations for tmpfs
Message-ID: <20261001171501.GD3019323@ziepe.ca>
References: <20260925-gmem-tmpfs-backend-v1-0-d36159822d18@google.com>
 <20260925-gmem-tmpfs-backend-v1-1-d36159822d18@google.com>
 <9292b27b8f48c515bee3246cf3b3a60762302186.camel@infradead.org>
 <20261001141743.GB3019323@ziepe.ca>
 <ba82487d2fe70e762a06e42a9474299d1a501ed7.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba82487d2fe70e762a06e42a9474299d1a501ed7.camel@infradead.org>

On Thu, Oct 01, 2026 at 04:47:54PM +0100, David Woodhouse wrote:
> On Thu, 2026-10-01 at 11:17 -0300, Jason Gunthorpe wrote:

> > It would be nice if it could handle MMIO and "cachable MMIO" as well.
> 
> As opposed to just MMIO vs. RAM as implemented in the prototype in
> https://git.infradead.org/?p=users/dwmw2/linux.git;a=commitdiff;h=a7ca2d8859036 ?

Sort of, RAM is a little more permanent than "cachable mmio", I prefer
the latter because it conveys it is located on a device, is subject to
things like reset. Eg "CXL ram" would be cachable mmio.

I haven't heard of anything needing a unique PTE for this yet, but who
knows down the road.

> I think Fred has a cleaner version of that about ready to post as the
> next version of my series.

Yeah, cleaned up is needed, I want us to resolve this in the dmabuf
code cleanly not add more of the hack mess I made for vfio/iommufd..

Jason
