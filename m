Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4311F4F3EA0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737898; cv=none; b=F5e+r5SOaT5lQYpkdGCio94QpchueeqMn7rcNj8w5VdnRHr7N90ye/rBmo8yMGs0iUqbENK9WJY2MHUXJGSGOS+ixlKEcPZladaiA3mkev9yiW7Ym0H3K5giWeYkkZaz2FHRE8zSccw65pMo9HiPp1GIq0qzgMsZWNEgXQngA+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737898; c=relaxed/simple;
	bh=v9UdPVY3a3m1N1cQS4DrnsIxV/L+mPyRwqE2xihCRdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgioYya785YNB+5FMkYnzsjenQWxWAftmG7QIVJ4GoVP+ripIxZI1fiB2DKjdllupxr4LOjOi79s7AnkV8/8OLmWYgZdQlaFcGw+XxoH4hfJRXLoczBjfcs+wmo++VZClAZiuwl9DeCOoYe2bisQzjJzGc677hzzRwzqPTFL9Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=R3ySaGL5; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="R3ySaGL5"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb0so60952185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789737895; x=1790342695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mn3aKmmmFmyEWeqRjbvgjKGN1x4p/IU34Fpl/53vDbE=;
        b=R3ySaGL5frHpRepuatv5HJ4AikBrYUEgGtgAm/GHfcG/yrpUGPyM6+4Oaua4XAjm7F
         F0pbJG4Zi7+U3QXshaalrCu0SR0bugJWKv2G68cwyiTisVKfL9JLm2U6cmsqsNrHADQ1
         HvRAZBWkIuh/TWITsZhFpRAI2qIrwwvdQBQpN3sSlmk1NT5C/4/hJ6Um+tfzJmADOAge
         JdCPPGebVyeEVZzOgf5VEYLM9gTETJvlw5dWhYih0ksyowVOh4jlFF0mVYwg+ZiBbMiy
         wJ7XSU1zQtllFsmGhRHNi4HLC7Aj0UA66sJkQsCXZFWX6EJvei/OK2+s5mfOs9+RciId
         0svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737895; x=1790342695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mn3aKmmmFmyEWeqRjbvgjKGN1x4p/IU34Fpl/53vDbE=;
        b=e6zJ9gI3RAqDMLsKu5eD66hvMJCGnr7i6auhC+7d+3AMCjZwvtNPnlqQNAc/Eh1ulD
         ze1eeI+RQWSHRovEcAr44MtpCKcF173bFBx2a7jj6YTC24x3i5eegV/eIxUrvFwhwOOw
         JyX59fmz6UUeAnpVYzRHP4aAHGk/UsU5AXHCKNs5j4zpgSx36H1FMkyPeaBgIyB3qhtH
         CAMOp8uHJSd1CBA953NlWWVbjfnoomoEG94nuAVjGLHS5Th57XZV2AYIVYljRa84vsjN
         5hLsWoUiUb8xLMTwzgwryixqIWGNbC732Pn/vvkdVuDxDa/3xMrXja1d/EI+E/ko4Y4Y
         g/Dg==
X-Forwarded-Encrypted: i=1; AKwUvBwsgQgsQD3LJlECf7qd7PeQZQJQlb2k5AmuVYLa/suHxrRjNFwmj849hx9nCkMEOI68cJ+G+z5uXoZui4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mKqbgYOrylO/8A5wUVOxn9WSd2VmzJ1gvHd/z2X7yaZ+uXRsPa
	I1Y+qRWoR0YEDgaqNxLB/oxtnMVgZbEPOiiVKFmWlFFBV93XpV3+Fi5byL5GoNvJ86I=
X-Gm-Gg: AYBFou1nkFNlEyk1w/ZRuQjgwn1IwAS6GOqKBqTT3gJjQXpUMaD8AoG1XG30ndlcwPv
	AEUxrWUQAJgskY+3b/f8lEATxuNtIGKKRAo2uCd+pgl1uRJ3gcqcog3TSqLeXT5WV2UwuS14MJa
	S2F++YLWGCTjqmGr9XLVoxYmImU79YM4iBZXbco09wLh/MofrIhLdhH+7XOSSoXnUeTWHci8HKV
	sPYjK5oU11o65nkhwKy8nD+8hc92Rw7uZr8G+l/yGDqr2ZuQ/F0PHTTVq7ckPfyV9vz2AQTyauI
	+DlH+r4jcePNGlyBojti5II1rinsSHMi8PNNV9ij8NuN2IAniQti03ctbADUI1bDX1X9mUk6flf
	pZk0Cdh7KevypwUI5XS3jxKBHcGMQ73ZSRWdFo2cDm8yMinnkL3LGE7rZOPo1u+l3ghVrJweJzL
	UGl13tzQJjQlF86PP4rFzT2Nf41wSnD/roUnYyzuBcbJkVdjULoaaIrFWX0GFwtzs97fJPd2PBH
	lCWK5xBOsM4I9CXQjk0bDG55Q5V0bk1/Lh2omJPkzjR0fRtm8OACZmM
X-Received: by 2002:a05:620a:6186:b0:930:9091:f0ce with SMTP id af79cd13be357-93bdc70b7c5mr343538785a.22.1789737895140;
        Fri, 18 Sep 2026 06:24:55 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0ed258esm134537385a.30.2026.09.18.06.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:24:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7YaD-00000001Cw0-3NeV;
	Fri, 18 Sep 2026 10:24:53 -0300
Date: Fri, 18 Sep 2026 10:24:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Matlack <dmatlack@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pranjal Shrivastava <praan@google.com>,
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v4 12/18] iommu/vt-d: Handle reattach of the restored
 domain
Message-ID: <20260918132453.GC11599@ziepe.ca>
References: <20260808022723.3893618-1-skhawaja@google.com>
 <20260808022723.3893618-13-skhawaja@google.com>
 <5b920299-260b-4025-ac4f-e8f83beebf95@linux.intel.com>
 <apBso6So7UqwR3AX@google.com>
 <bb7052d7-51fa-42e0-9eb5-ba4743956688@linux.intel.com>
 <20260828143546.GC3769797@ziepe.ca>
 <apGpHv8vy4SWIEaV@google.com>
 <aqyW3RzBGQyZebsG@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqyW3RzBGQyZebsG@google.com>

On Fri, Sep 18, 2026 at 02:59:43AM +0000, Samiullah Khawaja wrote:
> On Fri, Aug 28, 2026 at 04:15:56PM +0000, Samiullah Khawaja wrote:
> > On Fri, Aug 28, 2026 at 11:35:46AM -0300, Jason Gunthorpe wrote:
> > > On Fri, Aug 28, 2026 at 09:55:18AM +0800, Baolu Lu wrote:
> > > > That looks reasonable to me. I have no concerns about keeping ATS
> > > > enabled on preserved devices across kexec reboot, as long as the
> > > > software state is synchronized in the new kernel.
> > > 
> > > The new kernel should issue an ATC flush when it changes away from the
> > > inherented domain.
> > 
> > Yes, I will make sure this happens when we do the retrieval side. It
> > should mostly work well with the existing replace machinery.
> > > 
> > > > By the way, is disabling ATS an option?
> > > 
> > > No, many devices require ATS.
> > 
> > Agreed on the ATS requirement. I had Nicolin's patch series for CXL
> > devices in mind here.
> 
> Having implemented this now, I am thinking about this again with respect
> to the scope of this series. To limit the scope of this series I am
> going to refuse preservation of devices that have ATS enabled. Once the
> base preservation logic goes in, I can add a separate series on top of
> it to add that support.

That seems reasonable

Jason
